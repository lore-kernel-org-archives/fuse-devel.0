Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2622031E842
	for <fuse-devel@lists.linux.dev>; Fri, 19 Jun 2026 08:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856791; cv=pass; b=IwNZjs9xt2acAvrl1mGzpyk7IwoNzrQuVwEeqBTAg8GZW9v1spFXdR/L4MeBIfKowmeoC5EqJwblKT1Q0UoBF4zKHDnvOqBWv7i9Ngr2Q6DNIE1vFPIDJ1FjNpPJOtX+W/wrUqSEyLLjkSRHuu9GSCYPADUHhlgfbraMyjiNITY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856791; c=relaxed/simple;
	bh=bbwtfad5cn0MEp6KC4yj9vpW5t+MNRiToYYy2/vLbqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G9OzAqmtriy95Gy35NHCnEBVb97rI+fSIhlmBqhAGMqdQYo1gFpu+FT3jsnXarFxKJJHKRIVjvFNRJuqapMniyaByJx2DuVcjow6lNeY45FZlv+PO1uXNtNmBbWbnM1e3d7RGiAOIRT9auEYC+4xdpnSVB8BqZ0kxhNprW27fu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZPICXmQ; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZPICXmQ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-693c69b97e7so2946759a12.2
        for <fuse-devel@lists.linux.dev>; Fri, 19 Jun 2026 01:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781856788; cv=none;
        d=google.com; s=arc-20240605;
        b=LOMjEsml4kJP6NHU4MMkwpTZFX+GogSESmQ5rWP1/DUCzbrmZmywaUdSSfKJWcRU58
         /BiKcp6YpjLF/d5G2xv4pit77lIXEKk26iHuqPiy/mppf33saMvReGXEdZf+OysSFqcM
         crREo/dQ6bg2XVjCl480VNvO4SwuqiF6teMz0IJtCGYZn+1haYXfDTdZQcqmYe52sTXD
         lGt6nlD+cMFTWdH4CWev4YObiLsa0arsrlRGh8Q4Z0Hj5o/MZf/rM+2S7qo4BDHCkd/E
         /ApOW+7IGM3y5XuaAE8wu8EhpeufCZYETefhGnSNexo/d9i8BbDs/bWmieESjaIGN8Eh
         7hKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=28hW1tkOzDweveawPLlld9OpZbweiBBXAKPJ+M7e1+w=;
        fh=QNx7OSQrOIKTUORwnBLBXhHVz33gZ18ovDIFG+IGEZM=;
        b=PzsgHWoRT0QJwBEnhDrJHHbV5L36MsFBXnvuMj1BG9Qh+hwa9EY2n3vPYAOllVMM0U
         F1s4EsKqOXqCCz85TsKGkieMn/1ksXweXRv7mkEADVNBNJw/gE9ic39J+Kbqfs5DOv+M
         mWRYnVexN7VN1bxDfNwqtmwbAkTmFvNyR+DzAwiPUMrEIn86OpyCEVPGSqhVl3ajhEgb
         rpfV9v8aC7YOs/m96lPYr4OXmBFrrYZWTmzt0ys8UbF60/PwOzukFmsYkZi8D9SX0kJH
         8kGwpTwuNR8nqYEVs37P7G2ATM7+fVvogIdb1yhPpRtaVsL/U5MM5d4T+8rZck8xRhXA
         QC7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781856788; x=1782461588; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28hW1tkOzDweveawPLlld9OpZbweiBBXAKPJ+M7e1+w=;
        b=dZPICXmQDqX2l90NWCrmu1ZZ6ZwOin1wWN6KNQix6m55h3RWCMT/l4RBMRvDbOM4dl
         r6KiPy1FG3N1XyJMFD5qvr+OUKJll+f0hHpzJokXgor8KEcuxZr3iSNZGgP4NwLW64L5
         TuOAJJ0bnuXNT8UFXeUqkszeacqLFtWcXKd/9oWBGS9T/i+bwdARN7A0mDlUKnUfqo0W
         uqec6UY7e8SVec12P3XlfHvwxRGH26fh7UWzG++xS1X4o8hxnbgm1WJpfClPmTVirJPv
         fFkjuw72NU8x4zyFng3kgX0h979l2sjzw7rjdj3XmHYZUOIazJzqnuojiwZS1nug88KZ
         /G1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856788; x=1782461588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28hW1tkOzDweveawPLlld9OpZbweiBBXAKPJ+M7e1+w=;
        b=S4g5ViJk6wpw2gy8+y1Kb/T9TkKM1d99bVK5Rk+Cd6E3jbIQxN3J/mfvWb0UGvyCiA
         ul4vWCEpIpr+udI9gGj55SH1Phko5CBTOM0GpvC3dIjhwXhPxw+wm6JxfZr4rvsKN68o
         W0myLQc7HOX5+3m7FjzSBa1zaAFnNr3gtyJsZ07dt3ZH5SLZv81aHLHDSMzluXmMSPxu
         8UOvRJpp97sBWjq0Cyx0Ym9HlV4T1/k99vjTDyZ+GLkw/ig5/n/It4CwqREosPSx0l7L
         LzboN3aXvvjXJJi1wxTP4K0ZN8DV7NXr05e3AkcrLHYPgdhPbHNbLZkokpQM1KgHx1QI
         2AAg==
X-Forwarded-Encrypted: i=1; AFNElJ+wSki/H4Jd8C0qstkEKRxopX/p5NZcDTYzcNyFd52WGdcTXXX7HCvguK16BdRun/+YazYNffoIUjzQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwrVH/LS+XS/qygoE1rs7zPHX9byvESmJZKkr7LfxunLnI/u6Ra
	9Dx/FRzCej+bU84omo0K8SK5j8q6SXFaO8EEsMv1zMtPMaX1Nn3/st0AaG5ETejf/1JmRInGqfG
	QkY/UvsBk2K3NfrN7UyKmjr650QfG7ag=
X-Gm-Gg: AfdE7cl6mWz7xdNyqMaQXFH3XPPaAvSC/e8apW4MAgU2hTJkmybEQ6Qx1s6LDhok+9J
	Rjvre9GS1Gy7bAndNb+NhgJ1ZL6RsSwgU4x/e+pvHBx1SlWZ1VWlEjcf7l+s7WQzfjtgi12LLpP
	3I3/D1TLnEi3J6PCsJbSL5013P8p8et0dw5plpITEerZvBU5iL0fS/JVZ4zNA5wOosKd0uA7vU7
	XsskHI+ZepAwurHbV4JhpdRMf1YLb2kO7ns78pMqlDYz615kphMSSwIFybGYsQRiip5tzBClHLS
	IjTHLG3idww0GsNtJeylJ5xTv7EyZ28=
X-Received: by 2002:a05:6402:3510:b0:697:6463:8329 with SMTP id
 4fb4d7f45d1cf-697646386b5mr325196a12.17.1781856788275; Fri, 19 Jun 2026
 01:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616231325.16788-1-russ.fellows@gmail.com> <20260616231325.16788-2-russ.fellows@gmail.com>
In-Reply-To: <20260616231325.16788-2-russ.fellows@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 19 Jun 2026 10:12:57 +0200
X-Gm-Features: AVVi8CeiFULsJHypLlaGSIHwy24ESWJ1NNu6qzJkLpvWJUeN6zLmsAgdkxZLb58
Message-ID: <CAOQ4uxgmMqtg5YrL=gXR=XB=y-yrG64rxm1c_3Gn3Gwj9bv8zw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] fuse: preserve FOPEN_PARALLEL_DIRECT_WRITES for
 passthrough opens
To: Russ Fellows <russ.fellows@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 1:13=E2=80=AFAM Russ Fellows <russ.fellows@gmail.co=
m> wrote:
>
> fuse_file_io_open() clears FOPEN_PARALLEL_DIRECT_WRITES for any open
> that lacks FOPEN_DIRECT_IO.  That rule is too strict for passthrough
> opens, which already bypass the page cache through the backing file
> and do not need FOPEN_DIRECT_IO to guarantee direct-I/O semantics.
> Clearing the flag before the passthrough write path sees it prevents
> the kernel from ever taking the shared-lock path for passthrough writes.
>
> Introduce FOPEN_IOMODE helper macros to classify the effective I/O mode
> of an open file:
>
>   FOPEN_IOMODE_IS_CACHED(oflags)      - page-cache I/O (neither flag)
>   FOPEN_IOMODE_IS_DIRECT(oflags)      - DIRECT_IO is set
>   FOPEN_IOMODE_IS_PASSTHROUGH(oflags) - PASSTHROUGH only (no DIRECT_IO)
>
> Use FOPEN_IOMODE_IS_CACHED to express the PARALLEL_DIRECT_WRITES guard
> cleanly: the flag is only suppressed for cached iomode, not for passthrou=
gh
> or direct-IO mode.
>
> This is a prerequisite for passthrough write parallelism; without it the
> shared-lock path in the subsequent patch never activates.
>
> Signed-off-by: Russ Fellows <russ.fellows@gmail.com>
> ---
>  fs/fuse/iomode.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
> index c99e285f3..46e60b04c 100644
> --- a/fs/fuse/iomode.c
> +++ b/fs/fuse/iomode.c
> @@ -165,6 +165,23 @@ static void fuse_file_uncached_io_release(struct fus=
e_file *ff,
>         (FOPEN_PASSTHROUGH | FOPEN_DIRECT_IO | FOPEN_PARALLEL_DIRECT_WRIT=
ES | \
>          FOPEN_NOFLUSH)
>
> +/*
> + * Helpers to classify the effective I/O mode of an open file.
> + *
> + * FOPEN_IOMODE()         - extract the mode-relevant bits
> + * FOPEN_IOMODE_IS_CACHED - neither DIRECT_IO nor PASSTHROUGH: page-cach=
e I/O
> + * FOPEN_IOMODE_IS_DIRECT - DIRECT_IO is set (may also have PASSTHROUGH)
> + * FOPEN_IOMODE_IS_PASSTHROUGH - PASSTHROUGH only, without DIRECT_IO
> + */
> +#define FOPEN_IOMODE(oflags) \
> +       ((oflags) & (FOPEN_DIRECT_IO | FOPEN_PASSTHROUGH))
> +#define FOPEN_IOMODE_IS_CACHED(oflags) \
> +       (FOPEN_IOMODE(oflags) =3D=3D 0)
> +#define FOPEN_IOMODE_IS_DIRECT(oflags) \
> +       (FOPEN_IOMODE(oflags) & FOPEN_DIRECT_IO)
> +#define FOPEN_IOMODE_IS_PASSTHROUGH(oflags) \
> +       (FOPEN_IOMODE(oflags) =3D=3D FOPEN_PASSTHROUGH)
> +


Sorry, mad bad I gave you wrong code samples.
The open iomode is not about how the io is performed direct/passthrough
but it is about the state ff->iomode, so the FOPEN_IOMODE_IS_DIRECT()
is misleading and it does not make the patch simpler which was the intentio=
n.
Better loose all except FOPEN_IOMODE_CACHED() to avoid ambiguity.

>  static int fuse_file_passthrough_open(struct inode *inode, struct file *=
file)
>  {
>         struct fuse_file *ff =3D file->private_data;
> @@ -216,9 +233,11 @@ int fuse_file_io_open(struct file *file, struct inod=
e *inode)
>                 goto fail;
>
>         /*
> -        * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO.
> +        * FOPEN_PARALLEL_DIRECT_WRITES is not supported with cached iomo=
de.
> +        * Passthrough and direct-IO both bypass the page cache, so both =
are
> +        * eligible to enable parallel direct writes.
>          */
> -       if (!(ff->open_flags & FOPEN_DIRECT_IO))
> +       if (FOPEN_IOMODE_IS_CACHED(ff->open_flags))
>                 ff->open_flags &=3D ~FOPEN_PARALLEL_DIRECT_WRITES;
>
>         /*
> @@ -228,8 +247,13 @@ int fuse_file_io_open(struct file *file, struct inod=
e *inode)
>          * Note that if user opens a file open with O_DIRECT, but server =
did
>          * not specify FOPEN_DIRECT_IO, a later fcntl() could remove O_DI=
RECT,
>          * so we put the inode in caching mode to prevent parallel dio.

Merge this "Note" into the comment above about FOPEN_PARALLEL_DIRECT_WRITES=
.
It is out of context here.

> +        *
> +        * Pure direct-IO (DIRECT_IO without PASSTHROUGH) needs no page-c=
ache
> +        * iomode machinery =E2=80=94 return early.  When DIRECT_IO and P=
ASSTHROUGH are
> +        * both set, write_iter uses the direct-IO path but the backing f=
ile
> +        * still needs to be opened below.

Loose this text, code is self explanatory

>          */
> -       if ((ff->open_flags & FOPEN_DIRECT_IO) &&
> +       if (FOPEN_IOMODE_IS_DIRECT(ff->open_flags) &&
>             !(ff->open_flags & FOPEN_PASSTHROUGH))
>                 return 0;

Sigh, this function is a mess, see my untested patch below to make it simpl=
er

Thanks,
Amir.


--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -192,12 +192,18 @@ static int fuse_file_passthrough_open(struct
inode *inode, struct file *file)
        return err;
 }

+/* Fuse uses page cache if no passthrough nor direct_io open specified */
+#define FOPEN_IOMODE(oflags) \
+       ((oflags) & (FOPEN_DIRECT_IO | FOPEN_PASSTHROUGH))
+#define FOPEN_IOMODE_CACHED(oflags) \
+       (FOPEN_IOMODE(oflags) =3D=3D 0)
+
 /* Request access to submit new io to inode via open file */
 int fuse_file_io_open(struct file *file, struct inode *inode)
 {
        struct fuse_file *ff =3D file->private_data;
        struct fuse_inode *fi =3D get_fuse_inode(inode);
-       int err;
+       int err =3D 0;

        /*
         * io modes are not relevant with DAX and with server that does not
@@ -216,25 +222,20 @@ int fuse_file_io_open(struct file *file, struct
inode *inode)

        /*
         * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO.
+        * Note that if user opens a file open with O_DIRECT, but server di=
d
+        * not specify FOPEN_DIRECT_IO, a later fcntl() could remove O_DIRE=
CT,
+        * so we put the inode in caching mode to prevent parallel dio.
         */
-       if (!(ff->open_flags & FOPEN_DIRECT_IO))
+       if (FOPEN_IOMODE_CACHED(ff->open_flags))
                ff->open_flags &=3D ~FOPEN_PARALLEL_DIRECT_WRITES;

        /*
         * First passthrough file open denies caching inode io mode.
         * First caching file open enters caching inode io mode.
-        *
-        * Note that if user opens a file open with O_DIRECT, but server di=
d
-        * not specify FOPEN_DIRECT_IO, a later fcntl() could remove O_DIRE=
CT,
-        * so we put the inode in caching mode to prevent parallel dio.
         */
-       if ((ff->open_flags & FOPEN_DIRECT_IO) &&
-           !(ff->open_flags & FOPEN_PASSTHROUGH))
-               return 0;
-
        if (ff->open_flags & FOPEN_PASSTHROUGH)
                err =3D fuse_file_passthrough_open(inode, file);
-       else
+       else if (FOPEN_IOMODE_CACHED(ff->open_flags))
                err =3D fuse_file_cached_io_open(inode, ff);
        if (err)
                goto fail;
