Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001BA3BB137
	for <fuse-devel@lists.linux.dev>; Thu,  4 Jun 2026 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780594413; cv=pass; b=lHg3nfsfdooyBbXnlskfwE0ssZDlchM2EJtqBHrpNkvK4tlx697479Nq0ZPN/ag9qsav7My+8wwa60o1F85HIKbPe/6OSttVeciomUvpFbYrxp0q1EKWO31F/ixShtd36R8nHteDLDmMcOe4KS69c58YnmGD40n16fzv97iRU6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780594413; c=relaxed/simple;
	bh=owJXnybiws30tAExuI+1dVSdBUDHcYFlEd//SjpvxI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRLR2NmiePH+J0Q+09jPPxGfDiRk7xpJrzGmV3Pm1C+IjQB4GsAcmqP6Ji5/nLMBge/yNbCx5Thq6hai+Jx5nnKu0MbSdRLQpQVPmkxy/Jp8lyjFQtGqlNkMJTpi3KJzqBh6y6KUdcmks2z6T4v13lXXyE6VWy2bwdoFUAgBssg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjlDPWSd; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjlDPWSd"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef82204c6so577573f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 04 Jun 2026 10:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780594410; cv=none;
        d=google.com; s=arc-20240605;
        b=jxfym0qp1VsgLbvHjaR0KOKn4qenIoO/lYoUWU8KLWP9zSY4WESKl1xKJezOyCQSOS
         OEK6xZpILshyoTWXyO5ZCeTD1qvrckcserRkL7cyuPTmbFfax2ysDl0MfqGCYNtgo5p1
         SocpIBYAzKWQtCkhA+ZkIGlRaCwpQBnLR7TklP0sv6oSEAa9EF6ofVe7j0wqEFKgLHq4
         EpH2DToIZdqAf8UJ3r0df/V9h/FaXTKZfjctOG9cYrCBrtS10x3b6HxzUREan9h9FXmw
         Fgf8mm9t9mpGHLceuGyc0ItksWSsuJkv7zxZ+VPbRHP8/YeC7b226MLk9xetp33nIFRX
         74RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YRQRq+2vK2cF7uofLapd5v2EYNDuBv9qQx7bQUApxHI=;
        fh=ZzoWjbPEl8kofH09nkeCdFSejIXZ+gnNrkxntZ2879c=;
        b=GRxD6D5R5O6U4TdQMhJ4WIo8FOcxx9KCDmyN8nFHhoClLsWTVZ+ftDDCsOVBq0qjPJ
         4rJY1LRE/lhAlQrc3ROgbUBpziyIBuZat/fisNA2jmAVeJI4nD5FKkVrMzJnPSwVC1cv
         SFG7Yy1A9S5VCxz85s+0WiyEpQmiJtEh87FMHqbl2RixM3HDrHPTYwo4nUIJKpijMtLm
         W1m5v5wCWlA2DA8FM0RVyyg4BxBDtutIheHsq0LIprxC8JSAMM1Hp/C0zbLohlITYCAo
         rx3uZIegQvvpQ34BJHHb74R3WItFOHqSe9WYqtwAd7gctje3yJr5v6bNrVL12Gan2ncv
         j7eA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780594410; x=1781199210; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRQRq+2vK2cF7uofLapd5v2EYNDuBv9qQx7bQUApxHI=;
        b=LjlDPWSd5cQGcZjhriwzaFreNNY1LLmA/6Xf6ZYw6wqO91VdxF+ejNlGg04iy2BeLk
         YhfN1kWw/ONbKSb1DYku0IN/Oxx4rluZqTIhwg17MxjzLNk0Cdg+syCn7x6eEEdty2Hl
         SaClNHXXc3KCXl6/MhcfstGaM2ejSK1Vp9hd6NYJupEDLc9jzjZ7oyo0lI7ikC6h044L
         Ye4aX11c2rDkADdF7dvcZMozmezbQk4Y2m/1scyV8uup49GpOJescH99pONcgMtzD1cd
         l4EV2AZKfMkJAlUonbMqvVR0ZoOnwB9D43Ox9rC7dddpVICgvsC6dFmkBopqakYYvv2s
         sBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780594410; x=1781199210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YRQRq+2vK2cF7uofLapd5v2EYNDuBv9qQx7bQUApxHI=;
        b=Uy9Mqhu8mKDQA7wjmDXJBcoWA0bkvYgRkJ88EBfSJYwA/dd1aimH9LjA84dDb6gcHO
         Ujf9QRghjEuSCOWpm8xxe9sg+LnvZ8rWa/mFaK9fWBwinRgN+3BTEmhvfDRfBfR/2eb9
         5naHJ4x0rCDvlOfrkCBfQ0/1oJwHL/kQtio6uAuqxcO0Vfa7hf3wh39j5qtboHPiDfYh
         ArBBpBEwoFuCtEXNsUbsYDEgn/YWenTIq+Rklx5Cf1kVhJkrL/L+PMHwe8SEZ364y07t
         OqS08ydqbmE+bF51JPeH/gBapya8qelOXvWEiZZ8sICwUjdAjqfNqYjUJqucGMkOmD9D
         mYEg==
X-Forwarded-Encrypted: i=1; AFNElJ8LlS28GVN9pcJOSSObOnKDQ6DlNSbRqqTcldz996h82QcN25pMcKOBzIpZpcMXCNS466ZrXJ8F6IqV@lists.linux.dev
X-Gm-Message-State: AOJu0Yzrk3eBjlzmHzaPRMB2DmMJwko2tOj+wIHDLqnK/DlYVAv5//jn
	EEoeAyUt9izlDthmYzWDsF7JZ1OYpAkGav/q/BJgS0Vn8C5916a8eEmnnm2DKO6EiPZJRTQEkov
	bDRQFHDOQaOr5KJtHT9Bgh582lr2U8dQ=
X-Gm-Gg: Acq92OG/RLMrNmzK3C9f4QAsVSY4XYnY5N5nTV2MWu33NFb05JDJIQUrWuWAW67xuQq
	qLUl+ozHUk4J5sIqhfkkaMi2ccue+yOdw2+i+LtVy5DusbjlAL0MtDLg4Mo6uWgtD9gk7P11cO/
	eN3pz/IviorFiQRqG2T4CC7g+7hUUwr6gbgMYOURM74tiy8Qf+k9oGwAFZV2Gr4RE19EZVtjIqE
	v7D7ogVA/FJFsjT5aDexjO1qSRz7Yw82Lxk39FINeispZxes/oFQFUne+Ib70sb3gvcr5LUbhc5
	SfQw2X9D1xco4MjjFnvIGYb3JWg=
X-Received: by 2002:adf:f282:0:b0:45e:da57:be33 with SMTP id
 ffacd0b85a97d-46030502271mr107732f8f.23.1780594410151; Thu, 04 Jun 2026
 10:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <178059213410.15421.10567268398539539875@gmail.com>
In-Reply-To: <178059213410.15421.10567268398539539875@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 4 Jun 2026 10:33:17 -0700
X-Gm-Features: AVVi8Cdg067zhUefXO0s2A4H2Goc_l5Z6srpulw_ymDh1bJhi1yDH3xED4qHMCE
Message-ID: <CAJnrk1YH_SC9doHp60Vuajc-mzQiopPExMPQVVDtFHzB8vTM6Q@mail.gmail.com>
Subject: Re: [PATCH] fuse: {io-uring} use request cleanup helper on commit
 setup failure
To: Shuvam Pandey <shuvampandey1@gmail.com>
Cc: miklos@szeredi.hu, bschubert@ddn.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, fuse-devel <fuse-devel@lists.linux.dev>, 
	Zhenghang Xiao <kipreyyy@gmail.com>, Berkant Koc <me@berkoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 10:09=E2=80=AFAM Shuvam Pandey <shuvampandey1@gmail.=
com> wrote:
>
> fuse_uring_commit_fetch() removes the request from the processing
> list and clears req->ring_entry before moving the ring entry to the
> commit state. If fuse_ring_ent_set_commit() fails, the request is
> currently ended directly with fuse_request_end().
>
> That bypasses fuse_uring_req_end(), leaving ent->fuse_req pointing at
> the ended request. A later ring entry teardown can observe the stale
> pointer and try to end the same request again.
>
> Use fuse_uring_req_end() for this error path as well. The helper clears
> ent->fuse_req under the queue lock before ending the request, matching
> the other io_uring request cleanup paths.
>
> Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> Cc: stable@vger.kernel.org # v6.14
> Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
> ---
>  fs/fuse/dev_uring.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index 7b9822e88..7523569ff 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -924,9 +924,7 @@ static int fuse_uring_commit_fetch(struct io_uring_cm=
d *cmd, int issue_flags,
>                 pr_info_ratelimited("qid=3D%d commit_id %llu state %d",
>                                     queue->qid, commit_id, ent->state);
>                 spin_unlock(&queue->lock);
> -               req->out.h.error =3D err;
> -               clear_bit(FR_SENT, &req->flags);
> -               fuse_request_end(req);
> +               fuse_uring_req_end(ent, req, err);
>                 return err;
>         }
>

Hi Shuvam,

There was a similar fix for this submitted a few weeks ago by
Zhenghang that was sent offlist to security@kernel.org (which I think
was before the announcement came out to cc the public mailing lists
when sending fixes to security@). Berkant submitted this fix offlist a
few days after that as well. Sorry for the duplicate work.

Thanks,
Joanne

>
>
