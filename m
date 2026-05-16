Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB153D47A3
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 16:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778950659; cv=pass; b=fgglFRFJVtHVVfayGoVoLS5LRXHjt6Q0dKs7fQjUNmLIYgdp1eQP3gSqZw9IWLntqnAA+hRaFOMVizzUjZCR8dvBIVnZvZECC7gncrRtuZs5crCoX8sGkS959q++0AUBWLTl+33zl3FBzDrMUT0gbPG8h2uNXlbPeDHhc6+k7N4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778950659; c=relaxed/simple;
	bh=+7ZscICOnsMg+Y/x07Y7dz+QrxTCTQGbuuqMet8Uk5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dsGaLdD1vx2nzZBfbxlVys6yfmCCaVvOi4qNXL3Pv3yyALgKi+y+8EU4akYfgwPNk09n67ahREU88vGyYJ6EXWjBXvfaLwYzruWTU4ybBe5MTKpltt6FGF2JbgQ9dX8hA0FV8z8loOg/+klP7rHWgooMx+tkbZlw9RvHY/mTWi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4bJ/WkG; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4bJ/WkG"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso1558582a12.1
        for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 09:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778950655; cv=none;
        d=google.com; s=arc-20240605;
        b=fyeHxR2F5/JMn+PZC/x1xJZeHsvrPxrv/nWDfyQFUQbbFXmSaJjri3V4708AramUeq
         npxVlI4Edq7auhUKwGuHn4MoKV+GqR15qxSkS3Y4+SVkIKyU8tCxVzGEOKZ6y+8Na8o9
         dtUcuCxtwjHXBppg43UMmAojHzwizL4B46qAD8WuD8GE5E08QDGjNVf0q2Q9wRGfJsFt
         DOzkU9fLAulEaV3WnOJSx+sTwGAoZAJQlrw694z/jQKJWYahLt+ErJ8m3XpfpK/igai9
         gsx1UA7ptnjIErgIebjBoGmb5pXNfOwv3KIA9jCrOZ60UPWqnsbTMie9OiB6914QEwuf
         BLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PfYU55dN3cL0mcrAM/l2zUvNj113szEXNq9Oi0BW8EQ=;
        fh=wFtwfFf6KfZHpbijslRJrI48iXfREFRlrjEKWSlNhF0=;
        b=eI5PCSt1AsN43WTkWy+FSpxz13IgCUtIvjbGRTXDVT/RtkKmKZUF6nfQ9nSXD1f4/R
         B5H3GF1T6qCHpc/yis56aDLN5yj6/XVv2HB0e3n/E13lh+4xIW2p1Hb6Pq2/VzuW607G
         640SgoXnrJoLnKLaYSkV3jyZ70ZRzJNxiq3Gne7wRoIVIft8azfj/xPNqlGsgySizhEv
         SIxi27eM2t3zOsdjhaeyEQ9vmFTMDGY7e6rrqA/YGwaE8DgXln4nN1WUQB7DRr7Y/jSZ
         CVPTr6OuXndbwOda0YmJiPShkUHCaDFM90DoX39wp2CyoOCMlG28ZciN4ZgQgsi99LtE
         OHrA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778950655; x=1779555455; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfYU55dN3cL0mcrAM/l2zUvNj113szEXNq9Oi0BW8EQ=;
        b=J4bJ/WkGUIpsHX868v8WYAApt+wo1tUjg+9+9WShmCv/eYaqRalvoXiaDVz+oa7DMS
         TcUPUheE7atXrKyyXMfzFCOIWZ3eZcsgmMkGn52W515hGvLudB8QMPeyZIeZuguCk1R5
         7QupVqpzfBBzmN2xGJtqpPvvws3I/Ysr6rRe4lXOJUEXzLLxAMWguAWVFlvAGU55q+9l
         nKJOZOGe+3ca/tEfZCIpu1zOzZdFm4WZn9M0+CfTFt2+IEDGD5CAbD1DVfKMssxUfq9u
         Kbz18hL7hHXQBbY7OzmUp9KbvVJit1YthPwFkZ5cLyPU3p+n+grJqS4PqtiPg3adbQ9L
         Ja7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778950655; x=1779555455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfYU55dN3cL0mcrAM/l2zUvNj113szEXNq9Oi0BW8EQ=;
        b=LTnkFI29nIzIb9wt9BMPjuMZSfyQbnyIJVXWy3ByfMJgQaWTyaKqtEfUXA9XLe7zHk
         GnlB8439m0pcoo72/G8njuubBXbIYUuG4AQx5H6GC8XYK8/20rWpItCB0/m/b7vej4gd
         erObJRCeOXE3yxvXJ74nMq/NCjL2ieo5yMgJc0zKByBiA5431hR0l7X+0qdqo8rn72Nb
         xGaSXYQgf1UrGSPnQvldwzy7+4HdrqhPCwrceTsfh6+BRfitfFf6N9eLASKoXix3dT1y
         viaYrVmYORlQZ6JWyd8VLnoK5ebjaWRz2VKnxrYcEJnA2SJ37WEiZzAtNKv5fTk7TAJA
         JsKA==
X-Forwarded-Encrypted: i=1; AFNElJ8NkaCXYOZAIisZUIwxv3IWQHM8Qx2L/bkNsseme+G/X0YrbGT4WKq91IkII1i69Z+MpxQDY4UWS9MD@lists.linux.dev
X-Gm-Message-State: AOJu0YyvOGmY6iHfnboj87qG1Cfn9dkovhMzYKdrUIEJJdmoo7J90Or9
	7nzQHNiWvzqw240KtFumH7R92qW6wlEIH5CnLAK7LgH9iwusANLlJ9Pd8uH2gIAoEJPTyzihPDH
	lu/GcokzpQgvF5gigpu5rqsGClCj+/hw=
X-Gm-Gg: Acq92OEMgAEhDwbk48qoFGSbhrHWvWsSX1aTJnEOh/j3sGh8/gfQi0JqqjzS/cBT+nW
	Epph+4w2qjFPtxK0DvZQ8WtYSRtBBCiJb9Deg+f0F8Zwv9Wg9QFBQcZcQsMA2Ww5n3PN0Q3TGpH
	FGYdKCg5hCS3m5gz8+a14znawG6mhnNRwN+dujr3+gbbmJKeh2ks9Pm5T89hfYedjGvJe6gx/rr
	3dvWLokV4tWMh5tvj4GAQmzUCuTkLXkLUk/GlwPE8CdsoAM5ThLrsuUmR7dOLjViGmR2WGlqFgS
	Elk/VM+aZPa0jV/wx34k9+I3Xvz2IvSxQ6KTqmjagcF+2BD6WK0Y
X-Received: by 2002:a17:907:d30e:b0:bd5:5834:1d36 with SMTP id
 a640c23a62f3a-bd558341eb3mr240215066b.21.1778950655055; Sat, 16 May 2026
 09:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com> <20260516004004.1455526-10-joannelkoong@gmail.com>
In-Reply-To: <20260516004004.1455526-10-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 16 May 2026 18:57:24 +0200
X-Gm-Features: AVHnY4K3xOPnY5KV7Cu7pzd-w0DD74SL0JwhfZbdHZi86GE-hR3VwAaWcwTfaws
Message-ID: <CAOQ4uxiWhWcNbKDo49vWR7HrN4p84JdvjgYyhptDqKxJ7dwoFQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] fuse: handle partial io passthrough for
 read/write, splice, and mmap
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 2:52=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> Servers can now pass through only reads or writes instead of being
> required to pass through both. When the read or write operation is not
> passed through, fall back to direct io for handling it. This avoids
> cache coherency issues from mixing the backing file's page cache with
> the fuse inode's page cache.
>
> Reject mmap when passthrough is partial or not set for read/writes since
> mmap requires both read and write access to the backing page cache.
>
> The FOPEN_DIRECT_IO check in the read/write fallback is not strictly
> needed as the caller already handles it, but including it here makes
> the fallback logic self-contained.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/file.c        |  7 ++++---
>  fs/fuse/fuse_i.h      |  3 +++
>  fs/fuse/passthrough.c | 18 ++++++++++++++++++
>  3 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 1173811b2ea7..5b70d8272700 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -1781,7 +1781,7 @@ static ssize_t __fuse_direct_read(struct fuse_io_pr=
iv *io,
>
>  static ssize_t fuse_direct_IO(struct kiocb *iocb, struct iov_iter *iter)=
;
>
> -static ssize_t fuse_direct_read_iter(struct kiocb *iocb, struct iov_iter=
 *to)
> +ssize_t fuse_direct_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  {
>         ssize_t res;
>
> @@ -1796,7 +1796,7 @@ static ssize_t fuse_direct_read_iter(struct kiocb *=
iocb, struct iov_iter *to)
>         return res;
>  }
>
> -static ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_ite=
r *from)
> +ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *from=
)
>  {
>         struct inode *inode =3D file_inode(iocb->ki_filp);
>         ssize_t res;
> @@ -1884,7 +1884,8 @@ static ssize_t fuse_splice_write(struct pipe_inode_=
info *pipe, struct file *out,
>         struct fuse_file *ff =3D out->private_data;
>
>         /* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
> -       if (fuse_file_passthrough(ff) && !(ff->open_flags & FOPEN_DIRECT_=
IO))
> +       if (fuse_passthrough_op(file_inode(out), FUSE_WRITE) &&

Removing fuse_file_passthrough(ff) makes me uncomfortable.
It's true that if server sets PASSTHROUGH_OP_WRITE on lookup
the file has to be opened with FOPEN_PASSTHROUGH, but this
not easily understood by passing by reviewers.

It's be nicer if we keep this logic contained in a helper where it can be
properly documented, something like this (following the changes to
FUSE_PASSTHROUGH_OP() discussed earlier):

static inline u64 fuse_passthrough_op(struct inode *inode, u64 op_mask)
{
        struct fuse_inode *fi =3D get_fuse_inode(inode);
        struct fuse_backing *fb =3D fuse_inode_passthrough(fi);

        return !fb ? 0 : fb->ops_mask & op_mask;
}

static inline struct file *fuse_file_passthrough_op(struct file *file,
                                                    u64 op_mask)
{
        struct fuse_file *ff =3D file->private_data;

        /*
         * FOPEN_DIRECT_IO can be used to opt-out of passthrough per file a=
nd
         * ops_mask can be used to opt-out of passthrough per operation typ=
e.
         */
        return fuse_file_passthrough(ff) &&
                !(ff->open_flags & FOPEN_DIRECT_IO) &&
                fuse_passthrough_op(file_inode(file), op_mask) =3D=3D op_ma=
sk;
}

...

static ssize_t fuse_splice_write(struct pipe_inode_info *pipe, struct file =
*out,
                                 loff_t *ppos, size_t len, unsigned int fla=
gs)
{
        if (fuse_file_passthrough_op(out, FUSE_PASSTHROUGH_OP_WRITE))
                return fuse_passthrough_splice_write(pipe, out, ppos,
len, flags);
        else
                return iter_file_splice_write(pipe, out, ppos, len, flags);
}


> +           !(ff->open_flags & FOPEN_DIRECT_IO))
>                 return fuse_passthrough_splice_write(pipe, out, ppos, len=
, flags);
>         else
>                 return iter_file_splice_write(pipe, out, ppos, len, flags=
);
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 9e5142a94a09..a1034533ce60 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1261,6 +1261,9 @@ struct fuse_file *fuse_file_open(struct fuse_mount =
*fm, u64 nodeid,
>  void fuse_file_release(struct inode *inode, struct fuse_file *ff,
>                        unsigned int open_flags, fl_owner_t id, bool isdir=
);
>
> +ssize_t fuse_direct_read_iter(struct kiocb *iocb, struct iov_iter *to);
> +ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *from=
);
> +
>  /* passthrough.c */
>
>  /* READ/WRITE are implied by FOPEN_PASSTHROUGH, but defined for complete=
ness */
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index f2025772c9c1..d62a1c751157 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -44,6 +44,10 @@ ssize_t fuse_passthrough_read_iter(struct kiocb *iocb,=
 struct iov_iter *iter)
>         if (!count)
>                 return 0;
>
> +       if ((ff->open_flags & FOPEN_DIRECT_IO) ||
> +           !fuse_passthrough_op(file_inode(file), FUSE_READ))
> +               return fuse_direct_read_iter(iocb, iter);
> +
>         ret =3D backing_file_read_iter(backing_file, iter, iocb, iocb->ki=
_flags,
>                                      &ctx);
>
> @@ -70,6 +74,10 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *iocb=
,
>         if (!count)
>                 return 0;
>
> +       if ((ff->open_flags & FOPEN_DIRECT_IO) ||
> +           !fuse_passthrough_op(inode, FUSE_WRITE))
> +               return fuse_direct_write_iter(iocb, iter);
> +
>         inode_lock(inode);
>         ret =3D backing_file_write_iter(backing_file, iter, iocb, iocb->k=
i_flags,
>                                       &ctx);
> @@ -91,6 +99,9 @@ ssize_t fuse_passthrough_splice_read(struct file *in, l=
off_t *ppos,
>         struct kiocb iocb;
>         ssize_t ret;
>
> +       if (!fuse_passthrough_op(file_inode(in), FUSE_READ))
> +               return copy_splice_read(in, ppos, pipe, len, flags);
> +
>         pr_debug("%s: backing_file=3D0x%p, pos=3D%lld, len=3D%zu, flags=
=3D0x%x\n", __func__,
>                  backing_file, *ppos, len, flags);
>

I understand why you brought this "jump back to direct" into the passthroug=
h
helpers to reduce complexity in the call sites, but I think that if you use
the fuse_file_passthrough_op() helper in the call sites code will look
better and will not need to "jump back to direct io" in passthrough.c.

> @@ -133,6 +144,9 @@ ssize_t fuse_passthrough_mmap(struct file *file, stru=
ct vm_area_struct *vma)
>  {
>         struct fuse_file *ff =3D file->private_data;
>         struct file *backing_file =3D fuse_file_passthrough(ff);
> +       struct inode *inode =3D file_inode(file);
> +       struct fuse_inode *fi =3D get_fuse_inode(inode);
> +       struct fuse_backing *fb =3D fuse_inode_backing(fi);
>         struct backing_file_ctx ctx =3D {
>                 .cred =3D ff->cred,
>                 .accessed =3D fuse_file_accessed,
> @@ -141,6 +155,10 @@ ssize_t fuse_passthrough_mmap(struct file *file, str=
uct vm_area_struct *vma)
>         pr_debug("%s: backing_file=3D0x%p, start=3D%lu, end=3D%lu\n", __f=
unc__,
>                  backing_file, vma->vm_start, vma->vm_end);
>
> +       /* mmap requires both read and write passthrough */
> +       if ((fb->ops_mask & FUSE_PASSTHROUGH_RW_OPS) !=3D FUSE_PASSTHROUG=
H_RW_OPS)
> +               return -ENODEV;
> +

Changing the helper in call site in nicer and already hits the
existing ENODEV case:

        if (fuse_file_passthrough_op(file, FUSE_PASSTHROUGH_RW_OPS))
                return fuse_passthrough_mmap(file, vma);
        else if (fuse_inode_backing(get_fuse_inode(inode)))
                return -ENODEV;

Thanks,
Amir.
