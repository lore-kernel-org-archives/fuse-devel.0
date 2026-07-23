Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7FD39A045
	for <fuse-devel@lists.linux.dev>; Thu, 23 Jul 2026 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803425; cv=pass; b=FoVNtUSaxxv4E6PnGnD4W/SxOuJSN+P8F80KYRMQ5OQNrM1Txrxxvb9zhV8vWa43Cy/mw43Y0RoilJKago+gEKUOp/R/P4TERRd68JqZpDuk6hrJuCuAxye7KKOIhHDijpHODqJuYgjsBqK9/1ZXlp3pTeS9nxynYzSvJWHLNjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803425; c=relaxed/simple;
	bh=rlJv+mw8BD3iFcTcqOGzYCU+NZGCTFxq34Kx1L5VNz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z7NEtKEvxipx91ompdYodJlQqD8FT/5l54zGamWc2BRZXtELLvCZJZqsRDhmb6bsm+7bc09PsP2+R/B6CCJ/I/dxVcdAnw17kRSE2PJ2ygdL/61M8bbs/bad+Vs6JMGUCq5O0qfzOUP4GmDcx7/rBPKLGbswdPbrVqv6LQLxZ4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rc7Vr8Gg; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rc7Vr8Gg"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so823279a12.1
        for <fuse-devel@lists.linux.dev>; Thu, 23 Jul 2026 03:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784803421; cv=none;
        d=google.com; s=arc-20260327;
        b=GwBKjrOUT+o/9HkUd5i2h/cF7v9FHD6dGWYuaheddPYPdhaPmQemvFiKYXXhUKFeuY
         uaySzJi3rUXUU8RgJWuk7COohVfiE3VhqiDE9OF+4vbOrOEnbXI69jEeVIHxQaLm7Ua+
         y1JTNDvvXaGbnCWQpcQQ+yRjXt4fKm3NrpjT1tDP7nlFmjfLdtslEdrdI3p9dbd9/uCi
         qyvFPPXl55nwtYJmmrzFQr2ce/WDbPq4Q7VHZyFxBe7XSHa7exbf51bah9Er192sGU/w
         /VPKCwGMRAmvIRq1qGI4CGkGfolccm0UCDkURuWQ8RnB+PJXeI2CXbUWS6hu1F5vrJCB
         MOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yj/KZFc5ifCFuJo4yf9/lFHJ6OnUkHsoFdTLxJvdxYk=;
        fh=3GMN4kWt3U6KlaJMN9TL+QegqI0aYdgtTkXpTHxXyAQ=;
        b=g1IhG/m91XQ1AJodJIr85bqjordk15RRxspVc6X2rRUHx7QZOQmUiZD6/RJ8pjFA59
         4Y0hqryjotWaYULoht1q+1yJu7BZqIiJdSb8/7ybdYC2dz16eV4vJwB1URkFWB45Zjj7
         g1JfCkDkBanI8GguYAcOkDYLD1DcoEOFWOLcTFtlRqwLIDWTcVSX1Y4qyagc6pqajyBj
         GwEKq+zMAN5g2gyhpJZdk7ai0FCSB4cmGECzZLbWaRsDWqHrC57Q007Q97ucQughzEhj
         mHk243pmH2GtWM7IA62ZzIi9rCqcPRTDDipX2BAW6Z+acWbB2guApeYKWx9ZWlI0d1Q2
         zyPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784803421; x=1785408221; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yj/KZFc5ifCFuJo4yf9/lFHJ6OnUkHsoFdTLxJvdxYk=;
        b=rc7Vr8GghC1LKdtkphjvMZnhPlp3k5JSh3/GvsPmFad7etgHajn7f4/He0BXj4hW8S
         1/UrFBfruMGw1IFjFLc066DuMMi/b86qARdxqhdoLNgerf1deShE+Z3MZ+qiHUYZoxSf
         Aa+ZmS96F9b6j3r6QryXiG4rz2OMt1KY/U3/XD7WpUyMcVOG+52QoX3bPpqde80yrQhy
         bsZv1lYUCzO5IEYXOjLZ2+ekP+Ktu2GI3QB4prlerSUsoqi2fE4qJgX1lOHabhJnLtYW
         y2Up7La/TZvF5988R8TXQu7aG/OgAvsoIn62cADUnjSzZhrAlcgamB3a9BKhcALwXgfd
         HOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803421; x=1785408221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yj/KZFc5ifCFuJo4yf9/lFHJ6OnUkHsoFdTLxJvdxYk=;
        b=c2cic6AsWuRRKfZ62rKyr/U9er+NEE5+rHoCkaV/nkKbuCNSU3lmVgQ2/P2N5Ooyj2
         WTOukez2jx3xGbDqeVaENTGZNcZ4Tz9DoHjUgxsomX9MFBR/Y1rnM+kAXK35bYSNaIDr
         F4Ea3DdaIb/fRurSFsPIr/hd0k0NKmoHkSCHgJAs1rlHedwC8UKRNUaA8vhLfUj+7bw1
         LJiiVhz/CtBn2bVaMOl3UK23+9PigQOUosRRjYgaolZGXLbLz4T+WD/JiO7TLaFGjFyl
         2SKDgoLmuAmvnbvLhsaZJFcugD+8QLDNuxyefN866O2bH7RRkmwdCtRBpdIa3utnPuPW
         pDDg==
X-Forwarded-Encrypted: i=1; AHgh+RpvME1j/zV5WChVLey2/FnFwTKqSxadvJfBmMETC7LE8HNaERjLY9NWRWVKoyWXAG5WTub/PN5nTdX6@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ6ZpQ4Y5Uh+zz2bp7pRtAy3H9kyfa9INtJVdkJRQgQUajNLck
	BvS9PQRbALE6P6/cQ7fhvSOMbIQEiQWR7oLYa7ebF8fF+ilYBBHqTFNJFkX8uoe3eSpn0NPSQmy
	zKgn854aTY8wiwwva+78H6msFSiv0J+g=
X-Gm-Gg: AR+sD10Fl0RdfWCgUVPiKfF84ZLLFgS0/B7ZmSnHbCk5j7oL1Bk0Nkxtr91xaeCwMyt
	rg5T/4qutxCUkO946vlftFLZaA1RNDtEqEDn8hxpmodfRiCjY1Qn3kBbtKuFvyDhlMvxDaPmQNW
	o0S3gYumEEllDoZqP1aimjIcpvthVGgkkJIfWrPNVorl37WR9NnGB2lZkcs3l4vEqI+gm/t8dW0
	Q0KbutbCcBM07rNEeS9MwrEHIAteKt/NbjJou2NK3nG7eEHVUD5x/bcpKcOTD+JWOD1Wb3AtA==
X-Received: by 2002:a05:6402:3584:b0:69c:6672:a243 with SMTP id
 4fb4d7f45d1cf-69f6cd020bemr1052386a12.38.1784803421137; Thu, 23 Jul 2026
 03:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723100743.93881-1-chenyichong@uniontech.com>
In-Reply-To: <20260723100743.93881-1-chenyichong@uniontech.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 23 Jul 2026 12:43:29 +0200
X-Gm-Features: AUfX_mw8s-pYApsl79W0OK9sthH4Z2w10i9Nh9DOJmU5EYGlCtVVstS7MdDPxM0
Message-ID: <CAOQ4uxjys+yENYgjROu3Ui-athFjdY0E4fGhR4qsb2ed04wqkw@mail.gmail.com>
Subject: Re: [PATCH] fuse: skip destination updates for zero-byte copy
To: Yichong Chen <chenyichong@uniontech.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Niels de Vos <ndevos@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 12:15=E2=80=AFPM Yichong Chen <chenyichong@uniontec=
h.com> wrote:
>
> __fuse_copy_file_range() may receive a successful copy reply with zero
> bytes copied.  This can happen even though the VFS only calls the file
> operation with a non-zero length, for example if the FUSE daemon reaches
> EOF while the kernel has stale source size information.
>
> In that case no data was written to the destination.  Do not invalidate
> the destination page cache or update the destination timestamps and cache=
d
> size state for a zero-byte copy result.

Why not?
If the FUSE daemon reaches EOF and VFS thinks that there is still something
to read then obviously the cached size is incorrect.
Also invalidating the last page cache in this case does not seem like a ter=
rible
idea in any case.

Are you proposing this "fix" because an application encountered a problem
or unexpected behavior or why?

Thanks,
Amir.


>
> Fixes: 88bc7d5097a1 ("fuse: add support for copy_file_range()")
> Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
> ---
>  fs/fuse/file.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index ceada75310b8..75eb97b26912 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -3040,6 +3040,10 @@ static ssize_t __fuse_copy_file_range(struct file =
*file_in, loff_t pos_in,
>                 err =3D -EIO;
>                 goto out;
>         }
> +       if (!bytes_copied) {
> +               err =3D 0;
> +               goto out;
> +       }
>
>         truncate_inode_pages_range(inode_out->i_mapping,
>                                    ALIGN_DOWN(pos_out, PAGE_SIZE),
> --
> 2.51.0
>
>
