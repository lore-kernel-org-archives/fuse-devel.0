Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF272FFF8D
	for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 12:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525650; cv=pass; b=E1H5EhlvYpgr2gB5JpWTr5N4+CqsOZRtgXXqi4DsS8PjsJ80YN5lbfL8iK9746eTuzL2IHDFsHkomT87pu99Zu8u9yfJwFrUNn1hKnwII3YQ0XIVVQdBDmNc3BxLNLUp7Sc6n6hly6Vg6QU1fh0rZrUJ5GDKKe/nDpbP5jevk+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525650; c=relaxed/simple;
	bh=XfZAoXj+wA20rxhk3LNrfJZOmi8LUGW6Zpeh4GKF0HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HwSoOKpnmVxCf7W3jGIjnCyzefwNr8DcrHDjuTvPzyW6lb6pwwsMrDEXePCkooUcfLhvh8ZBDhQu93x9/GDXXtrQ8WY/npy3M7ESAA167x0L9ruzSLGDIh/i5uEoTReDVyrWG1vsFpqvWJcII3GAUMS4/JeWqBaHdBVr3iFbZQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=nwxQYMfZ; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="nwxQYMfZ"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5177b1a7441so46352581cf.3
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 05:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781525648; cv=none;
        d=google.com; s=arc-20240605;
        b=AgR11C4OdQhWQWtuaRX1LNZayE/lz8vjLzN4C7F3i/p24nWKWls41287h6ip24OiN+
         O7x61WslgEAuVb8UlEATu7mIgK4vrfUKLMj47P7hUY9+4A347iRmvoJK0kS5Zwi9CRU5
         j8NbFWZ/t/3yvS6M1ZD8dqCK4E+j09LDgm7bII/grr+5Hsaii3JvX/zGwlFbJqreZmeC
         DvKjFevhu51Owgc2t/SyOp+5ZME2CGYZbTFv/W5BjrIY5Ux5P4pwsgYocpX2fS14/8dl
         GFIalpLvaMTwcNeu4etSrESAU9vtZkZ2gQ+wF8V6la4vh8m6VK1p8ZZAcNU/Sk5fvMrP
         fb8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XfZAoXj+wA20rxhk3LNrfJZOmi8LUGW6Zpeh4GKF0HA=;
        fh=ECa10rpjAzA5VZpAGsa6ioCFH1L2PUl7G3hHYEYXyWs=;
        b=OLWQWlmskmCpkuj+HnGSr1CnR9fXSG4X1yjJKRjm8N24MjaZ2KgK/XAyM7arCjmOya
         1XLI6WB17RA8iksGGFhWsppjOZmhPcCyU00fDPUbf+kZKuwXeiDatNDleLa2iFtwtyRO
         V9+GK4JzM1McIOLkXg/LM9DYSW4y7vu05AwbWgE7Phw8ThjkuS/6udL3henPlNbsbo/E
         jFUvONWq6PvdhTvOi7evJHeQFSa8x8xZ4djKa4/dArYoTK9KXsGKbIFcf8rEnqJJ02kc
         u4rNBm/J5Wh0jWR97j3ODfrbh9ZfPvwUz8iqQspzNjgX68vLv62qRvme/xyudc3eIaK5
         gIeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781525648; x=1782130448; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XfZAoXj+wA20rxhk3LNrfJZOmi8LUGW6Zpeh4GKF0HA=;
        b=nwxQYMfZW16LDTArWpt1Oq4MdA5Ye1J+D+nv9Hh3vmpazKPEHkxIwxxhWUbg40aGUz
         6zJR3EfD1ttoFm5zOo/jb2+ogJ9u8AmLAyl7G9+7RXtOJ5HQUsV6+TOdfeSwGvp8cU2o
         VcH5r+O0kcATzt/oy1IxakI2HWkcUU6KHccTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525648; x=1782130448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfZAoXj+wA20rxhk3LNrfJZOmi8LUGW6Zpeh4GKF0HA=;
        b=RQDYLKUUfftiT1W2JASxxdUMeQMjpGFwFz1q9oM+/GzLw3LtZR9ISRtl+u1DrYMBHT
         hyyOdAd9JkL2TWd+e7zVwhazSfBDNvIeOH0u7/xpfp2RZ/qGRWwD9C0sJIU6D7f2uIxg
         ys/bCrMFL93W5I9CWrdFO92AobDcBLjMER5rI6YW/cVtDE4Qfyw/CWv0ifilMYGzpmXP
         xCQ8KqBP84ETENCzYb3TKaK2H5tmHZog82d9BMIpmAZJVjdwos4fgMictcSdwT1x7XDd
         2AKDThPp+ljL/DDHmgoDScFPxxg15Unhol9qzovb23UXoRkgpir2VvTZfJODAQDe6DD5
         4pVA==
X-Forwarded-Encrypted: i=1; AFNElJ/5d6qJI+CGx3tWzAh7QBNPZ55LALPG5+hNMeZXeBqkTMP8pXdsHtQvpm6R+KcTqJXagntnAmxRh0dX@lists.linux.dev
X-Gm-Message-State: AOJu0YxFlEXBp2Lc1tG4MesI+Mk04Bm3wUjXrRhDDtgzv2D7y5p1+s9W
	gHb1G+MWpr2iCqLy/LSNp8K+1cVsMCFh5q+whnNvJ2YN3AUHnPsKMAW5iJXoGJG620nfckzCgSh
	9lXm9GBGjOhhOr9B4+1Pn+cIb66KrIuoGx1rFGBIMYQ==
X-Gm-Gg: Acq92OHoWw3FtwTxeJ6JKgZ4sHJzMsUxR2GDlzre6GMf8UTLw+JjeSDINyGB/H66sCG
	h95YnsZJJpFkjjmMHv6HJ+3NUFdIr+F5sX9Ukq6sAcBZ48hw1PX0KnRpGFQ4WLN/kMPPuu4MjlW
	iehEpPLDUB7Zfxjy7DvodkLKj6bjPrDgY3kRqIZTH369t+FdHHcC8WoW6+HBMmiVYlAzhGNcgxr
	/aBMRKWGUuHEKOt7Ei8nnH/p/auWn9T5zh4cpdnQHz2sgjvLb5ESWUq8HqHA+Wj1Xxx51VmpAY0
	kAfi/jiAklZHYvBVxlhPLjeFg6aVxY9qvk+RzGuH
X-Received: by 2002:a05:622a:946:20b0:517:6b57:8164 with SMTP id
 d75a77b69052e-519535ad885mr91822401cf.55.1781525648239; Mon, 15 Jun 2026
 05:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615-fuse-io-uring-race-fixes-v5-1-8a360f055f0b@bsbernd.com>
In-Reply-To: <20260615-fuse-io-uring-race-fixes-v5-1-8a360f055f0b@bsbernd.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 15 Jun 2026 14:13:56 +0200
X-Gm-Features: AVVi8CcaEQQac4Iv2yU-d_3-LTpg8SiHEHlzt9Z-AUnerWDWizbsNacJvYQqCVc
Message-ID: <CAJfpegugOgp19fgT2HYggeOk2wdxiqYSADvpBGPiSJOm5eJxCA@mail.gmail.com>
Subject: Re: [PATCH v5] fuse: clear ent->fuse_req in commit_fetch error path
To: bernd@bsbernd.com
Cc: Joanne Koong <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Zhenghang Xiao <kipreyyy@gmail.com>, 
	Shuvam Pandey <shuvampandey1@gmail.com>, Berkant Koc <me@berkoc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 12:26, Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> From: Zhenghang Xiao <kipreyyy@gmail.com>
>
> fuse_uring_commit_fetch() error path called fuse_request_end(req) without
> clearing ent->fuse_req when fuse_ring_ent_set_commit() fails. The
> still-pending fuse_uring_send_in_task() task-work later dereferences the
> dangling pointer through fuse_uring_prepare_send(), causing a
> use-after-free.
>
> End the request with fuse_uring_req_end(), which handles all conditions
> already.
>
> Annotation/edition by Bernd: The UAF should be fixed by other means already
> and actually has to be avoided that way.
> Just checking for ent->fuse_req == NULL in fuse_uring_send_in_task()
> would be prone to race conditions, because if malicious userspace
> would commit requests that have passed the NULL check, but are
> in doing args copy, it would still trigger a use-after-free.
> Setting ent->fuse_req = NULL in fuse_uring_commit_fetch() still
> makes sense, though.
>
> Reported-by: Shuvam Pandey <shuvampandey1@gmail.com>
> Reported-by: Berkant Koc <me@berkoc.com>
> Signed-off-by: Zhenghang Xiao <kipreyyy@gmail.com>
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

Applied, thanks.

Miklos
