Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F5B4477FF
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 09:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043637; cv=pass; b=p9MryyA6wyTdUaA6dkmlbS0lk1ViAzqCLoIqNIuT5mbixCobZKgny4L3l/87SUTziqamtkwabOXRr9Gbwd/77agYyqGXAabdRkG5/V2ETo/xaidw89xLXRsslwaUhTSYav58h0LddblumZosOnbUw1xVs+ZfbB+Oz1ndwBswxOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043637; c=relaxed/simple;
	bh=PuUsHnkwV+GwukLo/OUOgoL1rvv8d48vU5mVF1rYvcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TC0HSV+BUUaL5VYePQD9TaSm0TkMs0p++19z6OZVV2ZeZFGsyUvUyyvgSiCW3hBc8QgMq8ViGGji++7gxEAhbSCJTPWqFz+iimOvuPFj+No98aiw8YrDGHEOVDqdNX1E0+mfGmjuuHM38NyRPkNnUV4sOAsagK+Rpr2JH+cVs6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=AOekNWn0; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="AOekNWn0"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-529a1ee0e62so30744091cf.2
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 02:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787043635; cv=none;
        d=google.com; s=arc-20260327;
        b=fBfpn6rOQuFAQWne4Tc4+gKep/4Fw+2Sk/GIhB4VEfAqgaPQad1nkM7n9+bPs4uR6d
         G/cjaGpPtT5pnFahQhqz7QbMOlptS2c4XcY+lZNqKp4hXcD4Gp2idv3A9FO/9BJwWgz/
         LrfKhyz0UmtjtJoUWuYc+d7hA0BwdcgbEdaBkcmcbU6wHtkpC0sP/opGnhU8MTOFRW2g
         MBlCxjRoM5OFyNdba2LS1wR4cHOc7o0v85dVb5SHgEivtKL0bfMuFKv9DAkRKoHNa3AK
         l4/khD/x4pAe2vohdTx7NUXOkKTU146HjWr3cMCbZXyNW3sd1NFVmJjo/I6qKb0k+JP0
         vpjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R5CidgEMiRl1k9cS1Q9dWntzhCa54VWy2ZOXfNAzMyg=;
        fh=Daxy3zhO+W+L8cuaHBXEAyIG7ftX6C09jlhPgXWz+OA=;
        b=RXpUtiVN7rKJMU9ZtUy0oXP5rKVIcMly2D7xbwv9tdttQguBE2P4jGPSbQQMgY2Ysl
         v8zQVe9FJzRawTqdr3i0rfxIi3fTI342Y4UHWc02rdtBzIH5lEYaPSMSRGwH5+TvGz7L
         m8TIMwJtoE3rB5sy4G6ohTvK8VAKkL0CeWYBs6a/xb8OzgVdbDpS6dQLDuIIr0qEmFiF
         RE82F+67oTDsdHh1ofe1i0f0tKBhAbrheX2NhmN2EXyh6pz+GKSTN80IwmQkkHUx4Q3b
         1IEKMOfIkYPsH6Q5FbRctK/JPoSxSOCNqyGa9w3tu+mlrtAB08/CB56xN4oqDyPQHrjg
         LImA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787043635; x=1787648435; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5CidgEMiRl1k9cS1Q9dWntzhCa54VWy2ZOXfNAzMyg=;
        b=AOekNWn0Cy1KI4ee01d1eXbhseW+fVfydpO3IvVmpSBRcCPKXGm3aT0OLk6jdoTIKB
         4pkC489r1BEut8mPIQhsjTmzY5uiaR2Oqut7tnMa2mFge77xVhcz0Gg+WR/Q42ZYTmNb
         dOsrzw4Z6pJtdTPc/Z6p/mPbJdgUljBnoDilU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043635; x=1787648435;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R5CidgEMiRl1k9cS1Q9dWntzhCa54VWy2ZOXfNAzMyg=;
        b=Xokm4MSMeUaBfzfaBY+30Q5fR/F0cvmrdx83fC+fnVZCh4Su4TVF/hKmL6tzhb5S8f
         7qNEo+EzyQKCyPZD1mheVKGkolkCwNf2DPVHcqKzK9Ctd57gj2eIMtdCcUaesvVBU5fl
         j5c+BJuhxT3ygUD5x/nHHtXVBsR377xk7pEiwrGKah2HBp7sjZkPbtbyER8ScvxvTXNu
         dyUOmDlpEj+tDKL4EElmLs4a1guWx5K9E2fRqlquPNZiy8fNG4cxJdNrlQS14HNceat+
         /kmLbB7brqn/ZwXA6FcrzTVxD50rVJuhkaAzTZWb5x89YzsoF0vuGCM93K7P/d/KDXuo
         bNPQ==
X-Gm-Message-State: AOJu0YyAJDaYk1d56V8sbR/0EE8y+rogcsFOjGxu4jsEbyu9YZXGACSC
	mp2oESarZI5LVCY8kjzGw/X6JDAPUGj3MAKYWx7BmzwIAmTgXVqE/SksD4bpLAyyZCu/dnSJO+y
	FU55m9OJmav7uwb6kCLpXdWHDVL9EKbnb4bQ1sQXfCA==
X-Gm-Gg: AR+sD10LjDAjz4BK5tC7XdfnDMNEBJjvUswvB6OUkPeNFZhrydaAqQqL+oJuvhVM0ZQ
	8ww7qS9CxLUUBIefMJHFwpo52tZDM2GLZbJd3zpjItNQ2TLTDk0HwJzpqFYb2e++R6KozZZLpHP
	7I48GZIKUn9Nrx5LqmuZaqZGl5RfDM4sxgdW214JCANNIBS9LIlD/5BUGNtRoPT029gVvmowdPQ
	s9eNpgSvJoUAqnyudxkf7y4EYbatXDQRvnqchqQ7PEIzazJZxuDwZ4b6uk9BThkDFtVSyWZ1Udf
	hg9cSEWPdsSEBXHBqC/ACZ5bTUp9vgcW0s4xZY3lWcZRA6NftY7SLGN187IJ0H/zAsN3t5vkF0W
	L
X-Received: by 2002:ac8:5d14:0:b0:52d:a4e5:6b3c with SMTP id
 d75a77b69052e-52dbd638fedmr69294871cf.15.1787043634544; Tue, 18 Aug 2026
 02:00:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811045350.164272-1-libaokun@linux.alibaba.com>
In-Reply-To: <20260811045350.164272-1-libaokun@linux.alibaba.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Aug 2026 11:00:22 +0200
X-Gm-Features: AcwNN1UI4gK_pCbrtgIMokQHxsecaJh6Di9rXH5OahnTepvGPsPL6ngyGsHIPnc
Message-ID: <CAJfpegvVDjK64Yd0A-NHEcX-jCj+eVhKrt6aC7hLu6hHEN2HHA@mail.gmail.com>
Subject: Re: [PATCH] fuse: reject a duplicate fd= mount option
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jefflexu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Aug 2026 at 06:54, Baokun Li <libaokun@linux.alibaba.com> wrote:
>
> fuse_opt_fd() stored the fuse device in ctx->fud and bumped its refcount
> unconditionally:
>
>         ctx->fud = fuse_dev_grab(file);
>
> If fd= is given twice (two fsconfig FSCONFIG_SET_FD calls), the second
> call overwrites ctx->fud and grabs the new device, while the reference
> taken on the first device is never released - a permanent refcount leak
> that pins the first fuse_dev until reboot.
>
> Reject a second fd= outright.  ctx is zeroed on allocation, so a non-NULL
> ctx->fud reliably means the option was already processed.
>
> Fixes: d42eb23b2ef9 ("fuse: don't require /dev/fuse fd to be kept open during mount")
> Signed-off-by: Baokun Li <libaokun@linux.alibaba.com>

Applied, thanks.

Miklos
