Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D7379EDA
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 21:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778965647; cv=pass; b=I7/TrG7lk5R7sDmc6N0KdVSyyf39IhPC9ZSDjENRaQOeK5AKzuHYuu6zhN3MREwTE9U2tIRF7GX5vG9OFto9DXdN5fSEGdNfUxUPSABqXnmJwkQAcbM2qBkKKeN5AYDpsBsWcLA2RhwKRaF7HeSocbxq8kDynELtme5tfoW5qOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778965647; c=relaxed/simple;
	bh=Ub+P3WD2AiL8Wsq+6+qWAW9txbbRR19h/6iUeOy/S8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FnwcB6ZFxV5rxmRa2A5BwbZo9I/epHBYm7O7XOi/RllYmSz6NxIY1hpMCv0K2Gxevo483pZZGOBOBuOyWNY4Zd3W6TiTTNCcL7SXVTLt75a8a4TIhOzz57u1jfV/mUM5MkdT5J/Ghn1v5Ij7rCgwOavlkP5hdEju7gnCvzW2yvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxdRFBfS; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxdRFBfS"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67fd8befac7so2938460a12.2
        for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 14:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778965644; cv=none;
        d=google.com; s=arc-20240605;
        b=BinZo0JpEIrEOUFOWc3WT3n8kM+SHLUtjXSzPbZsY1Tku/ovU4FXFtSdeJwiP5lqE6
         EYyoJnQS4wRHFji1nO2gShJ+HbTjZs+sgut0nQk/cTsqaKkBmTrvr7Dy6XsJKUD/7wCx
         6c/gFe2rEHCZOqERYrCqwCcgdld0117Epl7veFEUKAlxjn+JaAVLMvuVb+I9WpmMpL/c
         U3chUhGlmNHd6FTaokwc2ejxVJ5tGWgSo4WIoseg+YMFU6kprv7QAo0zBNjWL/hnPJyY
         3/Q3p5prKHZePAGCf7iF0DCpqMA2rUM3wWuX8LLutuOTwgRJX86jD1NgGNMBGzAL7Y1Y
         lq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vA5fGUzo6qOHwX+dosOCYZirrPaFcfzKm62zYljgqO4=;
        fh=XrYbOIDfYzt0eVR6PuXwXMikCCew1qIgd8JGAnyMPFs=;
        b=TSETiLWMOrY7NNFwHhtfve7UXzrNkg73+eb4JNBh6uODzz7epZ4/W1vNGBwvW5B512
         GgTUJ9JKg4TiTWEXb1EsoHNL/Fawq8FBoKcOasviIBuWeI//vJJFXa4V3ZppvsQk9kzX
         xgi9N79Qn0R4xPEO9TBXJG0YfVCowYlUJ9GFJ4CxdsfGdoAvlzbtiUpkPLqp+HMXDWVm
         0hI9AOvx98dEwD81F6h3U1+bsLvrOjCr0xOOSj3tH7vH9qe0pDXRRwKq1jCYgDVHZFlG
         eJJ2MiwYIkudIYUZ6Rp6wUkaHuLWhWgqlA55dvchwu2gIG2MGyRYmDI3+dgO0VKS/Anb
         XC6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778965644; x=1779570444; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vA5fGUzo6qOHwX+dosOCYZirrPaFcfzKm62zYljgqO4=;
        b=hxdRFBfSwxGGX7yZr0uKEqwsTLsTmYbXDKFvQqW+LwAtvK6jNGruMrR5vvRHnGpyx9
         kEMtnXVLTSb5txW9hmn0BwBl4fXMO0TSS2g1gH1efFzjvrBK+RKIBJKuWtVEa+9RPbTo
         9r+kGJGbmVanAhY88D8pWvNkp72TAqXNFM3clcBc0IgtX+Ww8izoNFnR0TniTlEgwnL9
         fG/Y9MxhQMcdTOCeH8NYGUby+bEIbsVA/WjTLASreMDliiwWxxR1NuR/LtiSLkNsUi1H
         RR2pj5zW81pBOChOV5CPzcRtNOmkm+khQ1rqclkzJyV9iw4EzI73/EAkTh//NFom65t7
         ryYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778965644; x=1779570444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vA5fGUzo6qOHwX+dosOCYZirrPaFcfzKm62zYljgqO4=;
        b=NTX937iiFyqlOyJCF5Es5ikql7+v2HAYVC5RBrMmHdISiX7nEkJwluOlKhbXRQ6jLa
         t2v9bbInyK1ntEp3J+k7IGPEaWrNc3eqEruE9YNwq2Wbexxl0BeQOwK5B1+tztW8r0K/
         xL/l6RbzPDrqF1CCAzPtZh1g8V1HuxG/BOZCGf4K2CXGCXTCDaTdVW6hNTee+OypGzC0
         IAnXQx8TpjaH9k/iAexTTv/d1rpBerK8To9t+pMueWTXRtyqDMc9Gjo+AuDJsP8L9qvw
         iBGwlE5D3YtCBa58HDCuqAMloAxbihKHp8HoaCVIFV9PSIimImhRExbmePHZ6e7jmujA
         3TRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Z0q6XtY2jP5AKEKa6N/gi2flulfEZtx0R76FJ7wwEY+XipPxFCUq6xO0YDkmDtSJGPxbFLZcC/BtB@lists.linux.dev
X-Gm-Message-State: AOJu0YxmnxpHcDDzkNGGOpq4MW9sSjk3jH0d3BEWzdrumzhQ7ltuOiIc
	m13oe5WltVyZsoz6kPEzwpwTxf7lrD/8t39Nl6lLHkppGco8fjulUPOKOBdiCJ7i5iltC2dzNkc
	d/AkwQNho2BYX4/ZcSPt30MvcMx6pywKFUPCjVZM=
X-Gm-Gg: Acq92OHQc/rFf80hu7rxV6B1sX0jf/wYQZ5h84VuMJPbjXj+3rrYNv23xB5GIh52lGK
	wDvvqMJJEcJYYgwCa4Romf9+gYD66HIEezoJMM0fWUcO+57bt9pMjh9EP9O5SZmsEKlDPW/zHOl
	C9trqCTxoRYhxZwbRp8qmf7iBELbRyqOgjxZF1pXMWn5ZT9oVTYa02oDVduyJL/gh5/GIHma6TS
	3/Ruz4qD5i7hIxxaqQVqMfxZGGatKE4UJ8QaVAqwJkhowgv7tvZ5KC481ufI+MdpTumYCNvgINL
	jWc9QWM7uaU7fXDZkU0ZHYZmxUq5PHJn0tuuoY1eXA==
X-Received: by 2002:a05:6402:22fa:b0:67c:4e1b:9134 with SMTP id
 4fb4d7f45d1cf-683bd58b77emr3297996a12.14.1778965644110; Sat, 16 May 2026
 14:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com> <20260516004004.1455526-17-joannelkoong@gmail.com>
In-Reply-To: <20260516004004.1455526-17-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 16 May 2026 23:07:12 +0200
X-Gm-Features: AVHnY4JLTteQ2t3JgElyBKG4KRzM1bELuuali_hsonXXpRYApxypRQE09arSvoE
Message-ID: <CAOQ4uxjZNfhY_NfS4B3EorqLdKRhzmTXEgKyPZJYwY_FaQdM5Q@mail.gmail.com>
Subject: Re: [PATCH v2 16/21] fuse: allow backing_id=0 in open to inherit
 inode's backing file
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 2:52=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> With FUSE_PASSTHROUGH_INO, the backing file is associated with the inode
> at lookup time. Allow the server to pass in backing_id=3D0 in the open
> response. On the kernel side, this uses the backing file already set up
> on the inode.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/fuse/passthrough.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index d62a1c751157..ae0137caa06d 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -193,13 +193,17 @@ int fuse_passthrough_readdir(struct file *file, str=
uct dir_context *ctx)
>   */
>  struct fuse_backing *fuse_passthrough_open(struct file *file, int backin=
g_id)
>  {
> +       struct fuse_inode *fi =3D get_fuse_inode(file_inode(file));
>         struct fuse_file *ff =3D file->private_data;
>         struct fuse_conn *fc =3D ff->fm->fc;
>         struct fuse_backing *fb =3D NULL;
>         struct file *backing_file;
>         int err;
>
> -       fb =3D fuse_backing_id_get(fc, backing_id);
> +       if (!backing_id && fc->passthrough_ino)
> +               fb =3D fuse_backing_get(fuse_inode_backing(fi));
> +       else
> +               fb =3D fuse_backing_id_get(fc, backing_id);
>         if (IS_ERR_OR_NULL(fb)) {
>                 err =3D fb ? PTR_ERR(fb) : -ENOENT;
>                 fb =3D NULL;
> --
> 2.52.0
>
