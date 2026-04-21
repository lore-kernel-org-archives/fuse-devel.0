Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6A83D6CAF
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 13:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776777814; cv=pass; b=GZbuFZQuYtRHegTfPw2d7lpXgxNl2jW2mfkCbzT1Wk5YziNkDlVL5YMSmUhrvLCnJkIOn9X2zfRHdxxz8svD3UxI5wxxBQ0pT41wp5nu//OqbQ2EFL7cM2Wvt2H+fmuwmxhV7HzcKh7SqpvQMt0S1Q5NWirdTT86JOmoI52d5D0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776777814; c=relaxed/simple;
	bh=pe1KCX16b1hyRmdLJRmH/1t9hegyXk+wpKgGTY8z1QA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPPZURxnkjSWkV9gAncqFE6mNmunidbBxYcT4Y2IC4+qlUBZt8k+97H/Lkkz5OhFJviaXIdP0giuLW1Q/VS5yNO7x0Z9pLuerCuRH+X5ALlbcdOQeSgzQrM+HTVHTeTiHMLPGl2WZZE/kLUKEjXA2q9uPn6rC9hJSEVbLkDTTzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBMeijYk; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBMeijYk"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-676d8587b8eso390588a12.3
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 06:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776777811; cv=none;
        d=google.com; s=arc-20240605;
        b=HtjhE9Mm822gjlaN3n4gRYUW/sOhJLGxn5sQRg+5mQ2WmaHnufqX7D/IZRBNZn836w
         Pc3Wd//6V4bu2ssHULJL3oelJp9kR5SRSoQVKTQCPmMwvFZVepPwt+TucPSttR8h87Db
         u1jmMLYAcCB0aVn+7lAr6kHsb+W5v0dI0BmindJvR18U31PeoYcAN5XM0ZMcMgvu9cvb
         x3UXVCQjk3yul1f8fnX/tEnFgqJ+pdhjbfmTnTD25c34F5Gl00YnxtJdxvkZ5y8ssUZ1
         yaoGTxSZ5MPhCKYfs46Pksoxcb1PXF+nFG5emf3ibGp2NrrOdYApVsNax7MgJXs2Ln2j
         dTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6YuCMCkYssyTGT7eA6Il+FhhTPOhhh/2C5RayufXpZs=;
        fh=c+l9z1NxuEx0aPZrU6P9SarzWG/7fLbPVlKCQV5ie/Q=;
        b=ZfLJ5XqcKLD+jETGGCbzM/ErD7QxB0M7+pzAJaw53JmOzjBCciMi+7VzTcM9V48EtJ
         kBm43wG4tRGVU/8grkDAdBJTkloA3dtueWlacuG8jPUxir0IUSsmLx/PPs2dxK7wbFJy
         QrGsxsJoNwVQsNKvMZFijeOj0F8sdM7m9e1NQtobNy9SitVt3jLddt48ZqsZFemj4ipk
         J1USf+x5amYYaps66NTfUcceiRiKlbQoyo1utTrLPpZKxIUKL1boyoEwQDrKPnIYo7sr
         xl+ZTHhyW21mwgGgogqPF321656Y/ORVh9xnzeKnmxs4YKNxpXTdHIf3AUv1CU5Rq+zc
         hZfw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776777811; x=1777382611; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YuCMCkYssyTGT7eA6Il+FhhTPOhhh/2C5RayufXpZs=;
        b=YBMeijYkD5rCxYok+bMyC2klYTEVLJ4OuPZzmHY+qewjq1C8N8Q+wag8msXNVKq1Dm
         IjDEN8cJ8fjteMIXnHbTJUBD/v2KOgmVOvoui/rim83DdtSb8EC5q6rWryOTAkWri/RA
         Vf8wHtVtvi8LEr5DiV4qPk0k/DalKFWJdV9aRqxxpI6kmZdrvTCwY8R6XYScpu5khJJp
         SJSTWrVAajhu+I3EE+R2vOMutXiiyywltD7FSbgM1tXgTYApTi3ktFWCv7XcotvX3UVq
         c00gTwJ4JY5m1jDYuSR+kofUW8J4YydIicRxDMDhEE1CMVJH+0LvCGYwjd1wQsYqPdm0
         xJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776777811; x=1777382611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6YuCMCkYssyTGT7eA6Il+FhhTPOhhh/2C5RayufXpZs=;
        b=e9rQ7BiZOfFUWjm+2LeclrkHFm6+cKBsfTXI577YS53UajY1fickjBB897PC+UHd7N
         zovVeia2ilhLSz6iQFD+2OLrOMSIXMiCqqzecnubYVKry07rV1k2zMVBPzuCAtITkQgQ
         HldlbjOwdMB3M1gUOK6TnwjEt5YCdv11wjDpLLIn8AsBvcDHMG0n/TqHjdZVrb++/PgW
         EbCTXsw3GHrtQ7uI05H4Up9ksc95jax0fOB2pChDqjnqkN+yrprDAz4HRPEAaYH1Y19c
         nL6W8QWNr+BFwmesuU8oDKoKK7Anl5nKj9W7CJ85wI0ChGneB/E/3ZHfodTO+hZxm3W7
         YsYg==
X-Forwarded-Encrypted: i=1; AFNElJ8axQGebaLVsTL0IVDOivIS8jHT/OdmXqScWB8+mawW/wBNR+mc/9Qx6np9TkwmRiiTJdRSHyseBu4+@lists.linux.dev
X-Gm-Message-State: AOJu0Yzupdrcf3ca2z16NLo9f6l/0FKQnbJItTYej+tCE5Sfk4YNnRmA
	6NAfigvqc3wfxJ7mu6P9NGum26oYoepd5kVrjYgFBCTikSU2h9IA1inwfNFoJg6OKqxj1lHkySg
	/zr+4FStPV6zcqo859puNtfILz6W/uPYsS+C5k6M=
X-Gm-Gg: AeBDietb/u79+DlzMzuSEvyUCGTmQt69hnd98kfwB/1Y2Xe72/7tsu2L6Y3+p75TeqM
	f3L+GfS87jLP9q/PTQefzI8Fn8xMnlLokzLDFBZZcLxCvWzhAmSQKFXr2ABpK18vgEsrCr9ivxO
	2AYX7cC0mGGfka0utqygvMqPZszZNohRqyOXVRzpHdvqCg8z0PqherEQ2akcZAjiaHKi48CANLD
	NlYDiOmBQEn+L8mWKabulGDUMXVII3NfrKDcaMYH6s8mLLVX6fpMqCqH3ynrLkhV1otns2FQyHJ
	rv1YEoN1IdeWXauCE6sDJzJGT6xHUtZa9UPR0nGSH5TqNgfDOvmB
X-Received: by 2002:a17:906:99c2:b0:b98:2d0d:fc00 with SMTP id
 a640c23a62f3a-ba41a250074mr819958266b.24.1776777810794; Tue, 21 Apr 2026
 06:23:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com> <20260420221637.2631478-12-joannelkoong@gmail.com>
In-Reply-To: <20260420221637.2631478-12-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Apr 2026 15:23:19 +0200
X-Gm-Features: AQROBzCyUjEKTldRaaiuX1dI3cGWwQ-UNbiabrUBEptwjijXniqhkcitzkRQC7A
Message-ID: <CAOQ4uxgCezMh3jdp519Lp9OZeqAyZHmc4Mp3FthJpfXhVoHEfw@mail.gmail.com>
Subject: Re: [PATCH v1 11/17] fuse: add passthrough lookup
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> Use the new/extended struct fuse_entry2_out for lookups. If a backing id
> is set, associate the fuse inode with the backing inode that should be
> used for passthrough operations.
>
> If no backing id was set, cache the statx attributes from the reply.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dir.c | 92 +++++++++++++++++++++++++++++++--------------------
>  1 file changed, 57 insertions(+), 35 deletions(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 0eacfef52164..9e9b77942dcd 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -354,29 +354,10 @@ static void fuse_invalidate_entry(struct dentry *en=
try)
>         fuse_invalidate_entry_cache(entry);
>  }
>
> -static void fuse_lookup_init_simple(struct fuse_args *args, u64 nodeid,
> -                                   const struct qstr *name,
> -                                   struct fuse_entry_out *outarg)
> -{
> -       memset(outarg, 0, sizeof(struct fuse_entry_out));
> -       args->opcode =3D FUSE_LOOKUP;
> -       args->nodeid =3D nodeid;
> -       args->in_numargs =3D 3;
> -       fuse_set_zero_arg0(args);
> -       args->in_args[1].size =3D name->len;
> -       args->in_args[1].value =3D name->name;
> -       args->in_args[2].size =3D 1;
> -       args->in_args[2].value =3D "";
> -       args->out_numargs =3D 1;
> -       args->out_args[0].size =3D sizeof(struct fuse_entry_out);
> -       args->out_args[0].value =3D outarg;
> -}
> -
> -static __maybe_unused void fuse_lookup_init(struct fuse_conn *fc,
> -                                           struct fuse_args *args,
> -                                           u64 nodeid, const struct qstr=
 *name,
> -                                           struct fuse_entry_out *outarg=
,
> -                                           struct fuse_entry2_out *outar=
g2)

As I wrote on patch 10, this back and forth with
fuse_lookup_init_simple is not needed.

> +static void fuse_lookup_init(struct fuse_conn *fc, struct fuse_args *arg=
s,
> +                            u64 nodeid, const struct qstr *name,
> +                            struct fuse_entry_out *outarg,
> +                            struct fuse_entry2_out *outarg2)
>  {
>         bool use_entry2 =3D fuse_use_entry2(fc);
>
> @@ -437,10 +418,10 @@ static void fuse_entry2_to_entry(struct fuse_entry2=
_out *outarg2,
>         fuse_statx_to_attr(&outarg2->statx, &outarg->attr);
>  }
>
> -static __maybe_unused int fuse_process_entry2(struct fuse_conn *fc,
> -                                             struct fuse_entry2_out *out=
arg2,
> -                                             struct fuse_entry_out *outa=
rg,
> -                                             struct fuse_statx **sxp)
> +static int fuse_process_entry2(struct fuse_conn *fc,
> +                              struct fuse_entry2_out *outarg2,
> +                              struct fuse_entry_out *outarg,
> +                              struct fuse_statx **sxp)
>  {
>         if (!fuse_use_entry2(fc))
>                 return 0;
> @@ -489,9 +470,12 @@ static int fuse_dentry_revalidate(struct inode *dir,=
 const struct qstr *name,
>         else if (time_before64(fuse_dentry_time(entry), get_jiffies_64())=
 ||
>                  (flags & (LOOKUP_EXCL | LOOKUP_REVAL | LOOKUP_RENAME_TAR=
GET))) {


Not changed by your patch but relevant to my other comments.
The flow of this function is terrible.
My eyes cannot stand non-matching {} they are review traps
and there is no need for the else after goto anyway:

        if (inode && fuse_is_bad(inode))
                goto invalid;
        else if (time_before64(fuse_dentry_time(entry), get_jiffies_64()) |=
|
                 (flags & (LOOKUP_EXCL | LOOKUP_REVAL |
LOOKUP_RENAME_TARGET))) {
                /* For negative dentries, always do a fresh lookup */
                if (!inode)
                        goto invalid;

                /* This code is deeply nested - and even more so after
this patch */

        } else if (inode) {
                ...
        }
        ret =3D 1;
out:
        return ret;
invalid:
        ret =3D 0;
        goto out;

These goto labels are useless.

Perhaps:

        bool need_reval =3D time_before64(fuse_dentry_time(entry),
get_jiffies_64()) ||
                 (flags & (LOOKUP_EXCL | LOOKUP_REVAL | LOOKUP_RENAME_TARGE=
T));

        if (inode && fuse_is_bad(inode))
                return 0;

        if (!inode && need_reval)
                return 0;

        if (inode && !need_reval) {
                ...
                return 1;
        }

The rest here inline or call helper fuse_do_dentry_revalidate()
because its a pretty
big and proper coding style is that functions fit in a single terminal scre=
en.

>                 struct fuse_entry_out outarg;
> +               struct fuse_entry2_out outarg2;
> +               struct fuse_statx *sx =3D NULL;
>                 FUSE_ARGS(args);
>                 struct fuse_forget_link *forget;
>                 u64 attr_version;
> +               int backing_id =3D 0;
>
>                 /* For negative dentries, always do a fresh lookup */
>                 if (!inode)
> @@ -510,11 +494,21 @@ static int fuse_dentry_revalidate(struct inode *dir=
, const struct qstr *name,
>
>                 attr_version =3D fuse_get_attr_version(fm->fc);
>
> -               fuse_lookup_init_simple(&args, get_node_id(dir), name, &o=
utarg);
> +               fuse_lookup_init(fc, &args, get_node_id(dir), name, &outa=
rg,
> +                                &outarg2);
>                 ret =3D fuse_simple_request(fm, &args);
> -               /* Zero nodeid is same as -ENOENT */
> -               if (!ret && !outarg.nodeid)
> -                       ret =3D -ENOENT;
> +               if (!ret) {
> +                       backing_id =3D fuse_process_entry2(fm->fc, &outar=
g2, &outarg, &sx);
> +
> +                       /* Zero nodeid is same as -ENOENT */
> +                       if (!outarg.nodeid)
> +                               ret =3D -ENOENT;
> +                       else if (backing_id < 0) {

Again, the unforgivable sin of {} mismatch

> +                               fuse_queue_forget(fm->fc, forget,
> +                                                 outarg.nodeid, 1);

This line just goes to show that the nesting is too deep.

> +                               return backing_id;
> +                       }
> +               }
>                 if (!ret) {
>                         fi =3D get_fuse_inode(inode);
>                         if (outarg.nodeid !=3D get_node_id(inode) ||
> @@ -523,6 +517,14 @@ static int fuse_dentry_revalidate(struct inode *dir,=
 const struct qstr *name,
>                                                   outarg.nodeid, 1);
>                                 goto invalid;
>                         }
> +                       if (backing_id) {
> +                               ret =3D fuse_inode_set_passthrough(inode,=
 backing_id);
> +                               if (ret) {
> +                                       fuse_queue_forget(fm->fc, forget,
> +                                                         outarg.nodeid, =
1);
> +                                       return ret;
> +                               }
> +                       }

This is revalidate so the inode already exists and likely already has a bac=
king
inode so this is almost certainly bound to fail.

And the same thing can happen in fuse_lookup_name() when fuse_iget()
finds an existing inode - for example on lookup of a hardlink alias.

I see a few options:
1. Move fuse_inode_set_passthrough into fuse_iget() and otherwise
    ignore the backing_id for non inode instantiating lookups
2. Teach fuse_inode_set_passthrough() to be happy if existing backing inode
    exist and the new backing_id refers to the same fuse_backing object

I am leaning towards #2 as this is exactly what fuse_inode_uncached_io_star=
t()
does when many FOPEN_PASSTHROUGH are called for the same inode.

Thanks,
Amir.
