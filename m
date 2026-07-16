Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFF333262A
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 18:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784225486; cv=pass; b=M75J07nwUT82reT7GSkTOWgIKksHeP64DvFmopcCK3Cd6W01tOW+i1WoB3oCsCK3Xe1Qr5c9o2rEu2Mud+4D8llrxwR752H2qqTJJajfkDZ75+4hCgY9c43DGLuvzKHOG0rtOthwhlNT+2YyS72l1hCiz+jt6F3C3viJi6J47ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784225486; c=relaxed/simple;
	bh=o3EAR0lQ+XdvSJCCePZjyu6+1qT6MRiz/1k49Wdlbjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=avxvGvMu5TpxPTU/NOMFcmO47dphLm9z67JZo8q6H455qUG8rEWIiG2p/KbrfVO4rKJvZlsctz0AH0DwuHZzgO5Qnju+44PaV3QvPcKHiQ/TM018THbZtUc1D1UJBZsUXTH74P+nZgMjag5y5e4C7F34I3k886UDo4IJgyHMuIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsMgcVUg; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsMgcVUg"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de0093c42so2977241f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 11:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784225484; cv=none;
        d=google.com; s=arc-20260327;
        b=pzgezeNGohWfld0oq4CWLmhfsEIf9tW7OS1I7DV3uss01UtE64+74AL1K/Y/7LDNgr
         G7O9fIsvi2MzY6C2S++dmvTt9AS+vKh6CpHMF3b3Mum5z9j4d8oJCPg1KAjLiqe41RJt
         ++z91CYCmWER6Lw3tH/7muP2kvyb1rG1IrWoUB/2CMEHwMhvlCjWeSTGdiCSt0iRY08U
         oADmjcHtlufQlKqijHi6RRpNoDLInwCR9QND1OJs9i9p4FhxRNUT3OY2iBNS6F/OZCys
         TqZBPJD0WAfg171l3MPRsolQDoSenbBFF358OY7mGSRrT/9VM8lxinhsgt0wh55CVDel
         514g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LneTIPgaoeZx8QpMkeb7kJXaQNXMWl/jjWj62IztZOc=;
        fh=GHDcu7DDnQN/5+9dUc6EGwA69+fnjHvtGbI+wrk0sNc=;
        b=mMikjYqMnVNwifO3iWhENPanmAYqhT8ciwa4BxhNTFZH8BgYQOoh6P6u1I4OAZ4XxL
         U5oYfyMLAQi+BjciQS5QncB1IDKtJPWuxTCaecHZ83yFbkb8EtRAR1jo+gbLvRYMIZvY
         uFK2KYGv2oWdKexgvnNfuM+e7NIwAB6w3cmxL052zZCTQZAQew4LWFOQkVl6txvr1tjl
         q4D5s+9iGaYOyaf1bbYI1LeqGfgHVy2cH+gOrv+yI8DWEdGc+bvC9O8rWiv8bhFY7xhv
         6F9sElWVbYdii70cg4h6FEdCzMzx9oMe1A/T8FPJ3DVoJ2jUyo9PRSc+5YcQ+e3CBV90
         EODA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784225484; x=1784830284; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LneTIPgaoeZx8QpMkeb7kJXaQNXMWl/jjWj62IztZOc=;
        b=DsMgcVUgWgcHW0lzQD2iNnL4w8MFrbE7qagRbjU4U/YIZYBbKJoRXHBWVl85WGOhgE
         as0AXxaM509wqVyCW6blcqhJnRIG8cHyE18LnqMHmTqHuRKiKkYka4C8w/dyV8zn6RZr
         wqVov4aWg20hRraIPbB6YiIknFC3Oavq+SsYOLBri5ufgQXtRqobM/k5xP4OhI9FlQJg
         ZrI/P6tu1aEW3vpiYePvsSMhGGHJRJGnM7cdXUNi5FIUlpBh7AsNv95BSaHL8G+2Bcwt
         loPv5RsXapAs8NZpEyvSVa6pDrvtmxiongN09ZjilXbXOFc6YoD9j7i6AHNdlbUeUddX
         qEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784225484; x=1784830284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LneTIPgaoeZx8QpMkeb7kJXaQNXMWl/jjWj62IztZOc=;
        b=JyBRTEIV5kAwbB85ZutelNWkHQAMrcky4eWsxQzo4q4lEdnQ+AFdCaeMQSCArhacbQ
         VDrdyeBRWWyg4BR3FzOXDvAUnl7mO+EJnQB/I67nNtWxMdWCO8IgilRdkHJ+aS4ZaciX
         r5QMZJ73PZE+AYQMeXs0mS4l6FTVXiJzVU/664uOzKEd6HUcqid/28WWEH3utFw/Xg2N
         YPAkcIWIvB6RBzmcWPrQZUPjjpBpw/tOULrdUYoQuka3I16Ki+BZZa0awQYY+7ZHaSim
         fBGxNDJgb6b6jvDfP0SJ4SV8zcKOlB4Q2lLgrclOxucppcPhH/P6lMLs4fOXhN2DJ26U
         /zow==
X-Forwarded-Encrypted: i=1; AHgh+RpUi09jCSRCMMtNZpvCwOsySK3gx2baVQHkMpXLWVqVthR9xO2ZOmOaBJ2yrPFAsVljkKIMivefFIdL@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7lLBGwcJxSo8EJsKHyHXxECNrRJpCAP6E6fhHQsrriYdN4dkv
	U6FMYDSUld342MyQ8IJvffpta2PTqcPtk7T9uZdgXW7tLMIuMZ6LYvolu1X5mXI4mPsREZe5EvT
	pujOWZv+tAlwE20B5teBeOidFYCLkg6Gornyo
X-Gm-Gg: AfdE7cm7AxqUlYO3PjF+Ox66vYlVNaHYganzvLZd7PinVDKxYTPjHOT+M/3VSUzgEGx
	4YU3tirj7B9zjD+B/Ah5EOhXrnESBFzIrAC/pG+BUBuYsXdKk4NBZtblFjkaoIvq98lgCopLOVR
	EFppGhCvN+oCmM7RfGbbIl29bDxjbpjfYIJnE8By0uVH02nysAK8L4y6iZIAqhzjw+wq7+oGslk
	iaJXCLDJclvhWZgZOPJNZCjs4VToF4/pzQYEfWzOG6HCUou92iEy4FbRxHcaEZQaS86TOjTRQpN
	BaHpjWR8PKBIYHeayYyOjZ8I8ZiKcg6miSVZkqHEqg==
X-Received: by 2002:a05:600c:1f94:b0:493:e79e:da6b with SMTP id
 5b1f17b1804b1-495483ba94amr4672675e9.21.1784225483452; Thu, 16 Jul 2026
 11:11:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716094051.412616-1-lihaofeng@kylinos.cn>
In-Reply-To: <20260716094051.412616-1-lihaofeng@kylinos.cn>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 16 Jul 2026 11:11:10 -0700
X-Gm-Features: AUfX_mzsSTsRSos6Ezbsvk8-A7oinK1h1g7VpT4n3K91jnaDJ7oie7RnwLccxG4
Message-ID: <CAJnrk1ZDc=f1XvRU6j6WsqiSAy75wd1-X2fNRhcK3j-OGDkqcw@mail.gmail.com>
Subject: Re: [PATCH] fuse: honor desc offset in readahead reads
To: Haofeng Li <lihaofeng@kylinos.cn>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, djwong@kernel.org, brauner@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 2:41=E2=80=AFAM Haofeng Li <lihaofeng@kylinos.cn> w=
rote:
>
> fuse_handle_readahead records non-zero descs[].offset when
> iomap skips leading uptodate blocks in a folio, but
> fuse_send_readpages built FUSE_READ from folio_pos() alone.
> The reply was still copied at descs[0].offset, so wrong
> file data was placed into the page cache.
>
> Add descs[0].offset to the request position. Apply the
> same correction in fuse_short_read for EOF size updates.
>
> Fixes: 4ea907108a5c ("fuse: use iomap for readahead")
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> ---
>  fs/fuse/file.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index ceada75310b8..11272983c991 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -836,7 +836,8 @@ static void fuse_short_read(struct inode *inode, u64 =
attr_ver, size_t num_read,
>          * reached the client fs yet.  So the hole is not present there.
>          */
>         if (!fc->writeback_cache) {
> -               loff_t pos =3D folio_pos(ap->folios[0]) + num_read;
> +               loff_t pos =3D folio_pos(ap->folios[0]) +
> +                            ap->descs[0].offset + num_read;
>                 fuse_read_update_size(inode, pos, attr_ver);
>         }
>  }
> @@ -1057,7 +1058,8 @@ static void fuse_send_readpages(struct fuse_io_args=
 *ia, struct file *file,
>         struct fuse_file *ff =3D file->private_data;
>         struct fuse_mount *fm =3D ff->fm;
>         struct fuse_args_pages *ap =3D &ia->ap;
> -       loff_t pos =3D folio_pos(ap->folios[0]);
> +       loff_t pos =3D folio_pos(ap->folios[0]) +
> +                    ap->descs[0].offset;

nit: is this newline needed?

>         ssize_t res;
>         int err>

LGTM. Thanks for catching this.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
