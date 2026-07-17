Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5A1331EC5
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288255; cv=pass; b=CCv5/tBnX9wy+tvB4PBwZY4jJDTtDqfwtHp55My4/tm7yLvi+TiUCOB7qyPdnFJAikSvlSAALOo8BHxfmnP/yvJt721zPnwBuIU/12y6uLRdWN1aMKI7h/FWPqhgdX1jV7AN7qlDvRpsSmVlV3hL68A7EE1gwsfOScJY3P9xOr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288255; c=relaxed/simple;
	bh=UL6TZf+3heM5DCOnpB5ptNmAhsG3QCnXWAbyEUz5w30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CxTRWfd9vgSuG3jRJNyBzUCiUAyvjcHNb7zJOIYZiDn/yMYCSdg/pPIwRfCxSE50uflTBeeTs0h2ifpAvcWxqd1uGb0zq+NqtAcJ7alem5UzUKZdWcUuHx8+MSCRHfvLbNHo8LLqntfkbNJp2nAsToTEO0rGg21ZHC/u86Q/Ozk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=G0C8ILRd; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="G0C8ILRd"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51bfbe05683so66323161cf.2
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 04:37:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784288252; cv=none;
        d=google.com; s=arc-20260327;
        b=RJ3SJnp7NEfBTUKutlvH7kU+HoUbZvNTGLwyM8eEZLm0/J44QjMiuvCjWLc5Pcz+03
         VenyVJVoZx+AdxaXDp8LgF+dV6dYpSXclRKqAbAEXk2WMDxJz/IZs8tnCBI+onwWOt0Z
         p5nb/BqpIHzjUdMr07K9JOMYel45Qai2chV7ud6FD+Lt3qFqcOtdA9TsnysdLCeoCq09
         OrbME9wGYQapAUYMCBct46cHFapymY28wmEoUKYrZAtTn5+1PZFqIsTo/pDEcy3T0zP4
         xAXgy7Ye1olop5kHaNRrN7sYGk85zIxhiB1z3aoKbE0i2tNOy/+2Mh0GPOHyD5lBkiey
         X12A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M/WKle9INspGcKeZEAUvoWlk64PP7npmg8L5RRcuESM=;
        fh=GwyPvIH+TD5SjR3SVJ1dXKAm/YljfmjDERcFjrmFeJ8=;
        b=FnU0KT1Vk3Si8gWdNzbqNpxFQFgD8nqKqgx/eIx508BXOLAIIbPHC+qZX/P9X5Emo0
         RPWvNIbenmaAcxPvwUs6wDCn72ZVYqZIRSi/rv4qaaaNDG3M81jg6N+2glYwJmTIY8DY
         D7BMrABt6it4JjVs3qexyRuH2Yqxn/qBIb2MBUKCrKWo7kEbjSftl6Z1ddB42Asfou5O
         nomZ6UQOV00ZkVRdADbdoSIvSWjJ4a9PBl5PBjnWZq7pb3K7q7Clzo8ReW7qcoJHgw84
         fD2DiDxOLCkukoLoKmxt1v9hvOgpTkTmoxlLBZA0zNbnVXcQbGohEckWa22Sue5AUIys
         r7CQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784288252; x=1784893052; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/WKle9INspGcKeZEAUvoWlk64PP7npmg8L5RRcuESM=;
        b=G0C8ILRd3de+gWXI4xqkycUCABvmxXd77ZhODTTOKBnWXzwRkdaIHW2PknK+dLYvIg
         ZI3Pjs6eCJdt300vMbNMtldttR1yi5VbF2hEiuvoiJpFECFuNY3hDSMyCoPKyU+hgRGj
         /A6ImODBFAcFibfomaAEIm/8TaydFoNtDxGkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784288252; x=1784893052;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M/WKle9INspGcKeZEAUvoWlk64PP7npmg8L5RRcuESM=;
        b=pJEKCTR82HjkIM/2PAUzOc1Ib3kbt8i9QbFaqgIpnyA3VGltBVcCKULfTlDm6VdW4e
         QwhIWQQzUf7BRyJW2dF0kfzpN8QQaWOxguCxtb1wYMK/S9NvGohbE0rT+aFMwvMAq+6u
         nb9CSdLnofKrMfz7tq+wJ8WMzdK5wfS3SksvlpUbIiUHHXwXGeNoJCpcE0pTGMPyXTg3
         957VI9kFKVs2dy82JZW3SzkDqbhpPTCn5zpFcurfE1/Gaw2E9dX1mkbsgsyO4JV4oW3+
         0RxJ2oeFAzIVbCBuS10yNDYKRenUQbIGgWp1xiE/fmv94+ymYM9vouEtvTnxepOESXdV
         JjJw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3shU8gMR4V5wBw4Ng9MFBGQp/lHmSuisitUcJ7orQKgtq8z4NGknC/5CH3GvQomGP4xF5q/GeXqtC@lists.linux.dev
X-Gm-Message-State: AOJu0Yy38VsFlqa0PHx3XgdukYdI2ovZRyjyKSFL1yAUluq6iVU+2HW+
	v80Jx2ggD7HIxRav19zxwYxBTqKOvSJEAXnR0urfO0FDkVWf3NZAxMlVMHfTgGcnZ0cA3Ng/xnz
	rZusAXmu2iZQpZppBjRFPEns+of05jmLQu8IMdxwntg==
X-Gm-Gg: AfdE7cmDyUm9nJea4sHF1n4sHgTIdu6cflSJGYO8kSAoeFnMUNTDrE3lhgRi/blyAvd
	1S3x/y0I86tOgIH76GtJQS1ppI5FYuPSBMVFVuZ44El9qZHLyr5iG3LFMGKSGQ8vlD33IlOp/X5
	TMKyHeM8c69u3bAiTKaCBNwfCjXB5p8kG4KTwXc5b4KvTCSoLn/O43MOQH/TNCAXTPbySrKc3ji
	nRs3N6II+coZrOA/BBIBPpT5Ly96jO3A63rf/t1PMZOPJGLnz2EXk+1pdO+ROkr/O+5cvUm/J6J
	8oHQadLmsBTRI6CFGKO8kcEyfQ==
X-Received: by 2002:ac8:58d5:0:b0:516:e974:6f72 with SMTP id
 d75a77b69052e-5213e082509mr18061701cf.50.1784288252106; Fri, 17 Jul 2026
 04:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708021705.3436-1-liwang@kylinos.cn>
In-Reply-To: <20260708021705.3436-1-liwang@kylinos.cn>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 17 Jul 2026 13:37:19 +0200
X-Gm-Features: AUfX_mzUI1XT_r283KHrMDpMUvHWG_cxv7M6WMx-QeDcYaAP0TajkE8zN4SvBJg
Message-ID: <CAJfpegs-JKBU5OD9jj0z4fvvzdvA0j=CCCwCpYL+iFQ3SS6u7w@mail.gmail.com>
Subject: Re: [PATCH] fuse: drop redundant err assignments in fuse_dev_do_write()
To: Li Wang <liwang@kylinos.cn>
Cc: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	Amir Goldstein <amir73il@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 04:17, Li Wang <liwang@kylinos.cn> wrote:
>
> After fuse_copy_one() succeeds, err is set to -EINVAL before validating
> oh.len. When oh.len equals nbytes, err is already -EINVAL, so the extra
> assignments before the notification and oh.error checks are redundant.
>
> Signed-off-by: Li Wang <liwang@kylinos.cn>
> ---
>  fs/fuse/dev.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 5763a7cd3b37..7813f6214d0e 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1887,7 +1887,6 @@ static ssize_t fuse_dev_do_write(struct fuse_dev *fud,
>                  * Only allow notifications during while the connection is in an
>                  * initialized and connected state
>                  */
> -               err = -EINVAL;
>                 if (!fch->initialized || !fch->connected)
>                         goto copy_finish;

Sorry, I won't apply this.  It's neither an optimization  (the
compiler will remove the assignment) nor makes the code more readable
(moves the error value further from where the error happens).

If we have a series of error conditions with the same error values,
then omitting the "err = ..." each time is valid, but this time
there's definite documentation value in redoing the assignment.

Thanks,
Miklos
