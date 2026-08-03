Received: from smtp01-ext2.udag.de (smtp01-ext2.udag.de [62.146.106.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7594E3D9521
	for <fuse-devel@lists.linux.dev>; Mon,  3 Aug 2026 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749534; cv=none; b=s57y7zRL5ToAVAtggJxbsugnBV4+mDq+kYvlHlJcXGBRZ1JoSOgnLG07z8WXmYz4DYIT9wVCmo8jnf+dM+JUGN0KKXjEHEm53x76qkfWyBByt+0ji57yyfwdLjJkXdwHVjRtS76Gp1f+wFMtIz5OsVeTun3JQLfZUo/9t0wqjPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749534; c=relaxed/simple;
	bh=GxO3jm4z+U4LQ8eAlxGFZHZB3DxblvlGe8bNYMXZNZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCvphqFUTGaCg4c8PJyzZ9D24X43HbxrnBRNnQAEoqCCPxX0PnqxFAhh5Zk+g9DLeZaZkp4YkH1Fpg6FHr0hhmbplmAvoSBUxiitYtoWn8C+2vaBlNM+mVC0FBIwX9vSUiezQ459d3wNgwIO/JcveHQh+nprWSRXWh84L8PAi2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (084-133-067-156.ip-addr.inexio.net [156.67.133.84])
	by smtp01-ext2.udag.de (Postfix) with ESMTPA id 464A1E0290;
	Mon,  3 Aug 2026 11:25:54 +0200 (CEST)
Authentication-Results: smtp01-ext2.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Mon, 3 Aug 2026 11:25:53 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: fuse-devel@lists.linux.dev, miklos@szeredi.hu, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, jefflexu@linux.alibaba.com
Subject: Re: [PATCH] fuse: wake one waiter per freed slot when raising
 max_background
Message-ID: <anBedPp_piRrvfXL@fedora.fritz.box>
References: <20260801082451.2770813-1-libaokun@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260801082451.2770813-1-libaokun@linux.alibaba.com>

On Sat, Aug 01, 2026 at 04:24:51PM +0800, Baokun Li wrote:
> fuse_get_req() parks background allocations on fch->blocked_waitq via
> wait_event_state_exclusive(), so each wakeup releases exactly one
> waiter.  fuse_chan_max_background_set() clears fch->blocked when the
> new limit exceeds num_background, but the accompanying wake_up()
> releases a single waiter regardless of how many slots just became
> available.  Raising max_background from 10 to 100 therefore admits one
> request instead of ninety.
> 
> The remaining waiters are not permanently stranded — the "else if
> (!fch->blocked)" branch in fuse_request_end() wakes one more per
> completion — but that only helps while requests keep completing.
> Consider a fixed pool of threads doing readahead or async direct I/O
> with the quota exhausted: every thread is either in flight or parked,
> and each completion wakes one waiter while freeing one slot, a net
> change of zero.  num_background oscillates around the old limit and
> the added quota is never taken up.
> 
> Waking one waiter per freed slot also preserves submission order:
> once fch->blocked is clear, new callers of fuse_get_req() skip the
> waitqueue entirely, overtaking waiters that parked before the limit
> was raised.
> 
> Use wake_up_nr() with the number of slots that just became available.
> Since the wakeup is guarded by !fch->blocked, num_background is
> strictly below max_background, so the count is at least 1 and never
> degenerates into wake_up_all().
> 
> Signed-off-by: Baokun Li <libaokun@linux.alibaba.com>
> ---
>  fs/fuse/dev.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 5763a7cd3b37..2f1ce77357c5 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -397,7 +397,8 @@ void fuse_chan_max_background_set(struct fuse_chan *fch, unsigned int val)
>  	fch->max_background = val;
>  	fch->blocked = fch->num_background >= fch->max_background;
>  	if (!fch->blocked)
> -		wake_up(&fch->blocked_waitq);
> +		wake_up_nr(&fch->blocked_waitq,
> +			   fch->max_background - fch->num_background);
>  	spin_unlock(&fch->bg_lock);
>  }
>  
> -- 
> 2.43.7
> 
> 
LGTM
Reviewed-By: Horst Birthelmer <hbirthelmer@ddn.com>


