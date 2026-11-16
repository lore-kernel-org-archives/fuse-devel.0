Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794824743;
	b=gAPPSg31OSnggQzNHwKQFwTx1+tcmtXuD9xhlP2w/h5lCPnHko6DndZdpxS4AnAkDKZ/
	 jo+D7CUZ0Okc9p8qRZjCuXHvdfL2OkeNKqcYOZ+s3OI9QU/WyON27uXVv3anumICpXM1f
	 GrYdSjUH6FoZ4zownFFd3xBqpcMeMnG2mo0dhXe5a7e2upmaYQEBRDQ+0mh10EkJ2chSf
	 /T5aGA4eayINw1iJHh2nfPiY2akmYPVgZwTr+g4QdVjDX1VPb7jp7dr2+SeIyWuhkvUZF
	 gzVmypX4ZXCbgdbsNHAqAAgPqTKxpEd37qrHSGlqvnZJofy/fK8yAv5WDT0nHYg6f2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3GcZLw9WZbtrok71apo+O/eYnzOL1rHeQ56wrw50NMY=;
	b=dkqNJ+CYf5iDrMVJM9oDbLvzjn62E5xGWqVCYs65PhZSqb65osaHPvO+fytFk2ar6J5y
	 3WVsTaXx77mNJGGBCIq7qsPmObFA/ht7/bRtgYSqT6j/+SS/I8/zj69IuwexY8PKAbP2w
	 IKYKnPHBbkPpUw+uISiwFJ05Dwr6ZcsLYjgNT/TR/Vio7PVVYg4MUQ8OBNS4yB7wvQCvx
	 qFHTSIXNjNye9fSF/ink83jTc9v73FM/XFjQe0b7ND417RWOX3e8kpd/UYUbx8vQmRJAp
	 eCv6GtNknOdHgBsqm2H6zowj5FzpA391fFw8AmNThwPDbmqsdL/yOhCV4f/aFG4GTow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gnO1k/2t";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C8A606A331
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 10:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C8A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gnO1k/2t
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b704171bc9so4283639a12.0
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 02:25:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794824741; cv=none;
        d=google.com; s=arc-20260327;
        b=NiI9UxYN0r0s6pS29s585COK3mieKooohJhP5ql4TxZLh7eVmOYXkXcRndFUn5pwMK
         OPHrxDEH2Dppliwt8UjneFlsUNSXg+FWL/zU518vMZLGjWHELrmOgjIdSjfzgYLZ2exa
         tE0wKmIPKuizvjvSxH2vYlc+g2wq/uHss1OrjKskh+IR4uBJb2rwtMFJ3I8sVyWv4jA1
         LLAiQ/IIx5noqAAvzb8paSBeIFjkJ8/rIV4pvXeFLokqAVj6CYg9dsH1z9J/2QozugvH
         f825etgG123Jx3sP+rFgW/0xZhcbYgxEIlwLbjFkyaPrjtSSXUhzDvJSuxfQfX8HTs/P
         aQnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3GcZLw9WZbtrok71apo+O/eYnzOL1rHeQ56wrw50NMY=;
        fh=XwcGvneCzUeUwke9sZ6hB60CAxvZ6jbhPPbVwqkHr68=;
        b=F2pOhJyo35Emh2U4SZwYWNpcDxdKTVfz2qr8cJYzEVflXQsVvz34v2Vy2W91ZgVamb
         /cqpIQOETe8LvEBbblht2WMr+Vx4gPNTqfP63GXg8EEQ+n7Rnzm5kYP7T/l65qE49nsO
         9LJ6BgxkCmYzrAzxhkaLnkVP+yqnVesW6QaG6AX+SW7dXlYMc5KgVZBt0tfZzfEKSC+w
         uYonqjOyDSRfm7yA2vv3WUNhNxUrbcbxBAdJmorMBD832oK9mVUZUudipwbbj5o4Ofs2
         2cfnEacgfrWyfXXZUBROj5uExQ2H6os800W7W3s7kkWlbfRvVbLQ6s5toYvkuxG84kOF
         wDGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824741; x=1795429541; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3GcZLw9WZbtrok71apo+O/eYnzOL1rHeQ56wrw50NMY=;
        b=gnO1k/2tVm4vmEwgUfuabHvOsp2SMn+Fvx6qc8BqPpWJaDMWWXi6CxsxPCiQDptrDE
         v885iUPGApkD1VXzHr/gbqFtYJOe/6IJsjOr/zNpdWhsyK3F9LqSo66x0l6VtQBo6hF7
         kGUl1KY3XsbOHbcZ1tPIgVjOmIgKJuHikqYtzqMk5rqt8BK0oKT8Y7j+5BcSqCBgT2BH
         xNwOlZp077Ul6XdSh9f/A6hICXMM8kaCWW0VoWFvl1mDDXc9BB2FC7WDFGi/Ei2Xv9MH
         6EgPRKARYVYs2z/lsdlrEZeIXMMRaXnT16PPkv7D0uGpbzheh8tz8gWGbBVFLXsLIt9k
         op0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824741; x=1795429541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GcZLw9WZbtrok71apo+O/eYnzOL1rHeQ56wrw50NMY=;
        b=mf/zAptYqwCgHIqD1IPgeLEY0IBmcnfeNjo+LMH0vxz4xwDzDPhuXNMa82qP9UULtu
         MAx9ihj3pM50K78EVbGrLOpNH+YDvPloHJvy6vPpF4TQWGqrxm/E7y101zecpSJztjUP
         +5g2YKrPbz6wH5RBMGMOpCaSW4/qZBCNC6JoG5ia00Zzzt2ve2mZ7zdon1blYP9G1ApM
         c+N/Gdkt0hdB+tcqFrJylTvHmZw+lzpFlJvg0i9A0nlUcDCv+AUVTLmW8BzdEtdwLL5T
         N3ClRcZIPPBqJV25V5Uznc/K6LUyhMePkjt4kzTdIQ+XgQBub80N58HfNxTaDKEODpvg
         gP5g==
X-Forwarded-Encrypted: i=1; AL+hErGWuHQa8BsGGmrh2o7JLgOKR6WPLd52Pdz+eg+oDB8Ih9uPPqHHLkqX0cqfGZwLaIDM7I0E5kbpoQYf@lists.linux.dev
X-Gm-Message-State: APuU4Z9UKyQSaGkryOQclae6nkWOEzmMUVvnLY4SvSLA4VaLNtnejDYe
	9FuRjSOfW8TWNt3UcA1kn7DDDrIUJ9xIhGkPgbQ0FLaajInCOMe8/7kCnb6iHrh3scJGMXRl+T6
	nN79hzpRQd10VSvMpuhniCOcDhY73/tUGccQTHxU=
X-Gm-Gg: AYBFou3I3WHGp8vbY13Xwo3l+dS+iTlKMXZV1MCUlm2XNX+3lobSt+JutL4zAfGlZQQ
	lf3hxG8cvWEJjxVv6e5YRjctVDp4xXRAWEM2IcIPs42LIUPO6VZxJlspbT2FQNbowoWCQsS6Uqd
	SMSa7wpsrDDbmMhT2oOenu8bJEazDw45GAS3o/RPmSijZBVwYeibvgcGJdAqDqIgUN2zZC8bYBR
	p6mmwkrw7XVrOI++2n44t+O62Yq3GWZsSn8C8gK7KVu6u19ZXgyU4nhJD45w9vxlUUXq6YdCNmR
	d3y8CoQEgLqSpBlYwHqK8PjyGSY26agOWl+1iP8WRNqB+EuG7cIC1r4bBa3+Z0DMXnNhWjH2xDf
	SyQEq0iWZXwvYE7qjsIBZFdxrJ4pL4pdm7uEl2A41hiHNQJgb1ZJonXOwC3jEbYoXFloMnE0=
X-Received: by 2002:a05:6402:44d4:b0:6b5:79f4:8d52 with SMTP id
 4fb4d7f45d1cf-6b7c0bdfec5mr5191329a12.20.1794824740409; Mon, 16 Nov 2026
 02:25:40 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115210952.2140036-1-graypanda.inzag@gmail.com> <20261115210952.2140036-2-graypanda.inzag@gmail.com>
In-Reply-To: <20261115210952.2140036-2-graypanda.inzag@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 11:25:28 +0100
X-Gm-Features: AclHuK_tvQFpSUcAQinoG9gfJrRW-rTLlA06tTqM7lEBJqVuldEYzXKf_TrLdL0
Message-ID: <CAOQ4uxhZS1w24GXWphu-PNPbGxVJUDwOfqHdRZcb05+_HVv=aA@mail.gmail.com>
Subject: Re: [PATCH 1/3] fuse: reject embedded NULs in readdir entry names
To: Junyoung Jang <graypanda.inzag@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, Matt Bobrowski <matt@bobrowski.net>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:10=E2=80=AFPM Junyoung Jang
<graypanda.inzag@gmail.com> wrote:
>
> parse_dirfile() and parse_dirplusfile() reject '/' in dirent->name, but
> do not check for embedded NUL bytes.
>
> Unlike plain getdents() buffers covered by verify_dirent_name() in
> fs/readdir.c, FUSE READDIRPLUS passes dirent->namelen directly to
> QSTR_INIT() in fuse_direntplus_link() and instantiates or aliases live
> dentries via d_splice_alias(). A dirent name containing an embedded NUL
> produces a dentry whose d_name.len extends past the NUL terminator,
> which allows callers such as inotify to copy uninitialized kernel slab
> memory past the NUL byte to userspace.
>
> Reject dirent names containing NUL alongside '/' in the FUSE readdir
> parsers.

My concern is that there are innocent buggy servers that pass NUL
maybe even because of length including the terminating NUL.

It would be more considerate to make this check in fuse_direntplus_link()
rather than to fail the readdir.

See precedent in:
78d04af4995a1 NFS: nfs_prime_dcache must validate the filename

Also, verify_dirent_name() never checks for embedded NUL, so all the
other filesystems can get away with this without failing readdir.

Thanks,
Amir.

>
> Fixes: 0b05b18381ee ("fuse: implement NFS-like readdirplus support")
> Cc: stable@vger.kernel.org
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
> ---
>  fs/fuse/readdir.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
> index 1f6cf565477f..e8b47c2a9103 100644
> --- a/fs/fuse/readdir.c
> +++ b/fs/fuse/readdir.c
> @@ -126,6 +126,12 @@ static bool fuse_emit(struct file *file, struct dir_=
context *ctx,
>                         dirent->type | FILLDIR_FLAG_NOINTR);
>  }
>
> +static bool fuse_invalid_dirent_name(const struct fuse_dirent *dirent)
> +{
> +       return memchr(dirent->name, '/', dirent->namelen) ||
> +              memchr(dirent->name, '\0', dirent->namelen);
> +}
> +
>  static int parse_dirfile(char *buf, size_t nbytes, struct file *file,
>                          struct dir_context *ctx)
>  {
> @@ -136,7 +142,7 @@ static int parse_dirfile(char *buf, size_t nbytes, st=
ruct file *file,
>                         return -EIO;
>                 if (reclen > nbytes)
>                         break;
> -               if (memchr(dirent->name, '/', dirent->namelen) !=3D NULL)
> +               if (fuse_invalid_dirent_name(dirent))
>                         return -EIO;
>
>                 if (!fuse_emit(file, ctx, dirent))
> @@ -307,7 +313,7 @@ static int parse_dirplusfile(char *buf, size_t nbytes=
, struct file *file,
>                         return -EIO;
>                 if (reclen > nbytes)
>                         break;
> -               if (memchr(dirent->name, '/', dirent->namelen) !=3D NULL)
> +               if (fuse_invalid_dirent_name(dirent))
>                         return -EIO;
>
>                 if (!over) {
> @@ -461,7 +467,7 @@ static enum fuse_parse_result fuse_parse_cache(struct=
 fuse_file *ff,
>                         return FOUND_ERR;
>                 if (WARN_ON(reclen > nbytes))
>                         return FOUND_ERR;
> -               if (WARN_ON(memchr(dirent->name, '/', dirent->namelen) !=
=3D NULL))
> +               if (WARN_ON(fuse_invalid_dirent_name(dirent)))
>                         return FOUND_ERR;
>
>                 if (ff->readdir.pos =3D=3D ctx->pos) {
> --
> 2.43.0
