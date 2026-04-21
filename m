Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086833C3425
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 12:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776774324; cv=pass; b=RPZKX+w3qCuDoOanvKZ5XmpaCz6IZDy9y+pgorRQflDjZSufRIAcTJ0qclwGdnMV9GSEAliCHmU+QP7ZbqgM/oHKY2aam5ZTo4vj2bqLiS3TjXgRr9mIwgpxitaEWEc7QyCalEz8uSCGkyM5o3MoqktZb7VsLmlf12nzTQdGhVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776774324; c=relaxed/simple;
	bh=8xipP0Rni14/Gae6ZJbI907kzNqe+eKvBPZyxEN6ZGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l55+WCtPcarE90v+bozUz5gqnEoZAcVeeSQKMNgA5hQnI4kk/95q5cGP+aW4tPKAGrwKZaDgjOM9ASWpWmHbxjXNRYUA6//W3P2w5yVGIRunqktudtUdPBAkDpGlKRsoeGZQnmGnsfwwXtmSKVjQYVewqPmCvX5FudX4qN9njA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXXcxYLW; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXXcxYLW"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-674a44b84fcso4365545a12.1
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 05:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776774319; cv=none;
        d=google.com; s=arc-20240605;
        b=Mp+OVwvROR+J5MWWn7yYDfZCzAS/vkwrFg76LNMdZZMQnkzuMnJEyGQtdpHqkgSzJO
         iK2wclysGLrlcIhfNOtX4GapnBjoVMP46DXUvndV7QduSFWqjXEPWf02wZjndAJvXMbk
         PM7GDxTQczgQFAkXXYXAMga5wflcyODgJNZv8HqdV3V5/5/AFZ71Ls9U9G95PU7BtCG/
         Zxzrnw1dA2qS+BWTbCVmLoMlCYQlBejD3SjLTa3nw/00k0I5cDDJwdr1BidXMCJz9uBZ
         jGm5jYv/96x8gL/5Rql0ub0s1gARQ99aEUiq3x8HCP+cFDrZWdYiAmhNi5Oi0YiL2UaJ
         eO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eprG10cKCtorrNmM7nJ0NNAe0PAFkloY+bBnfD9rWyo=;
        fh=gMLGS9vvsOkOHRNFqRsV9/TNOrLg5Y4xv60lZGPjsbk=;
        b=LICSPRYsHtUnXMJLzXzkrYVp0x7r3JzseibfoM19s6BQf6APGzNrT6fLlhlT4R10Bh
         xCfWr86HpaK7BSqxmC7RDA0vwZnrsh/KAlq5bw1HEmAZgDqDvdT63KtqOvhEofwtFDmS
         6WcGPlbyOvx29oWPmz8aHE/ySSZyvqh+1y/x7qnV+dKkoKKGduoUR+E7Xrb7DizJFKsb
         FQjJduFY4NpEwVUIICJ+m2/hf9SMUrnAEGENUUPH9kFSolgKumiZKk3wOoOdn1m/jIJj
         ILDQylWOJOzASQOm5TVWiSnYD5VrEGEfD1uo+LkCgp3NFEbSDGlIUYm0nbkWapOnXuuX
         zdUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776774319; x=1777379119; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eprG10cKCtorrNmM7nJ0NNAe0PAFkloY+bBnfD9rWyo=;
        b=nXXcxYLWsOcfLfTkiT5YDUprZDP6NlM30TcGh4u37yJTd+GDUmuhp9YL23KsphYyxN
         988qkh2FQEjS0Zh8k5It7coiXTQPUnIE8RJPgWjHvPQZPiHKqNuj+6uHrZPKJMPCFs84
         QsPumNw3RapI/v2aqfHj+AikqS7BEtTMea2rzNHX1NcVuPE+uip38z8TXXEpxcwG27GK
         eT612rndK1mXJURlPLCYPq1xvvYJth5XHL3toNGgg3RlVH9lRzNevy/ZWQOsjfWLNhIL
         aNo0et8a6dvTbsseDXFRg2KT+VoCkDEe5F9lFgPVsug1FhidFsohGp0ZN71TcAks/Car
         3Ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776774319; x=1777379119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eprG10cKCtorrNmM7nJ0NNAe0PAFkloY+bBnfD9rWyo=;
        b=Pf3lZDDGKSBsbrpgTkhDYsYnMDg7CcWJ07a0DI/d5Vkjlg0Y8yJCXHuKsCms1drVpf
         lYUN6rKkdAsSfjQPMoeuqhjjf0WSWh+8reVNNQep6At9hEgdu1cy949p11PXe1dUPXTk
         7t//5ncSeElCU9IcsNU6rlqxWU5qQH+LExVIKz7g87mDQwadCsmPC59d3qrLLosLA96G
         eEdz1KTrU/TYw2kRZ0w2h2rK3glDIaZYbKaeXdpMh2jTmtfvkugFsK49ThZcXZxrPU3o
         fgNPXarxRLG7s6Gc+6ko3do9L5ViveoyIYXRZj08FefW9/xIHdgi9vWK/q2u9J92Vjnt
         sNCg==
X-Forwarded-Encrypted: i=1; AFNElJ8I47OwxRulZgHSQzrgAal9L5++K1xFE5DIIa0+sSHB4fpxm242Jzl2V8UeAr3i+wwsegl4wYyX1tZ6@lists.linux.dev
X-Gm-Message-State: AOJu0YyQtcvV9OCxtm1SOHFAkmUJU6CP2ZqR/trnhrEWrBI7EOVW13JQ
	yiOkEgKSFlN8H2Fxh3lEZppbdUM33YtA05Vh7oiyjyX/ijFsEAdX7g4Vn72E2QUInKlbI1ZZVoK
	yPFxFTncPjzF/uq9qmesClbBw3jjeMiYWoJ6zF1E=
X-Gm-Gg: AeBDieu8wozH4oqnc6oa9kQQWHHjNyLAGXy7dXeEEjpUDw8yj4K6NsbD/q6Kj22rMa/
	cqnmLQb2BCg6TOkN8eFr9cGPhmrQnh+pT2S9XWBN4yYL8FpwTerKRiOLbNRGduaNtlsXP4zRjYf
	dVJ+vIUapo00g20sayWXzsCrdqbyInoNZiYyKdTqIHtDJieUCd/9esQ8m+DU1q/732xstCD+cWK
	Lnbl2bR93awHJQrzCbQYnLbwJFAm1kW1wvcS3FH8uwSLaLR4/Y8RvUFh1sOnuhJO1BnjFdjblpT
	pbSPn5cJE4RnFeIYoBqnBCgtMvGHs2+7mdYvRPy+Ozl3rhOSyvePwcXjwjuQ7V8=
X-Received: by 2002:a05:6402:11d2:b0:676:b83a:f261 with SMTP id
 4fb4d7f45d1cf-676b83af50emr1126635a12.22.1776774318600; Tue, 21 Apr 2026
 05:25:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com> <20260420221637.2631478-11-joannelkoong@gmail.com>
In-Reply-To: <20260420221637.2631478-11-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Apr 2026 14:25:06 +0200
X-Gm-Features: AQROBzBu0TWGA_FsxEdoKDzwDP1bpMuK0hRQCp0xN8Q6UmfZ9__4R_gXuL-d0hc
Message-ID: <CAOQ4uxiAW99ZftcLkOLjmNc24n8DGHnk+rpgAe1PX4aRoCXGsA@mail.gmail.com>
Subject: Re: [PATCH v1 10/17] fuse: add struct fuse_entry2_out and helpers for
 extended entry replies
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> Add struct fuse_entry2_out, which is a new extended entry reply struct
> that carries a backing_id and statx attributes. This will be necessary
> for setting fuse passthrough on inodes.
>
> Add helpers that subsequent commits will use to process fuse_entry2_out
> for passthrough support for lookup, revalidate, and create.
> fuse_statx_to_attr() is also moved to earlier in the file to avoid
> forward declaring.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dir.c             | 119 ++++++++++++++++++++++++++++++--------
>  fs/fuse/fuse_i.h          |   5 ++
>  include/uapi/linux/fuse.h |  14 +++++
>  3 files changed, 113 insertions(+), 25 deletions(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 94ab05cb89ce..0eacfef52164 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -354,9 +354,9 @@ static void fuse_invalidate_entry(struct dentry *entr=
y)
>         fuse_invalidate_entry_cache(entry);
>  }
>
> -static void fuse_lookup_init(struct fuse_args *args, u64 nodeid,
> -                            const struct qstr *name,
> -                            struct fuse_entry_out *outarg)
> +static void fuse_lookup_init_simple(struct fuse_args *args, u64 nodeid,
> +                                   const struct qstr *name,
> +                                   struct fuse_entry_out *outarg)

Nit: patch 11 would be nicer if you add the arg now and pass NULL from call=
ers
skipping this temporary fuse_lookup_init_simple() step.

>  {
>         memset(outarg, 0, sizeof(struct fuse_entry_out));
>         args->opcode =3D FUSE_LOOKUP;
> @@ -372,6 +372,95 @@ static void fuse_lookup_init(struct fuse_args *args,=
 u64 nodeid,
>         args->out_args[0].value =3D outarg;
>  }
>
> +static __maybe_unused void fuse_lookup_init(struct fuse_conn *fc,
> +                                           struct fuse_args *args,
> +                                           u64 nodeid, const struct qstr=
 *name,
> +                                           struct fuse_entry_out *outarg=
,
> +                                           struct fuse_entry2_out *outar=
g2)
> +{
> +       bool use_entry2 =3D fuse_use_entry2(fc);
> +
> +       if (use_entry2)
> +               memset(outarg2, 0, sizeof(struct fuse_entry2_out));
> +       else
> +               memset(outarg, 0, sizeof(struct fuse_entry_out));
> +
> +       args->opcode =3D FUSE_LOOKUP;
> +       args->nodeid =3D nodeid;
> +       args->in_numargs =3D 3;
> +       fuse_set_zero_arg0(args);
> +       args->in_args[1].size =3D name->len;
> +       args->in_args[1].value =3D name->name;
> +       args->in_args[2].size =3D 1;
> +       args->in_args[2].value =3D "";

I know you just carried this, but do you know what this is?
some sort of backward compat inarg?

> +       args->out_numargs =3D 1;
> +
> +       if (use_entry2) {
> +               args->out_args[0].size =3D sizeof(struct fuse_entry2_out)=
;
> +               args->out_args[0].value =3D outarg2;
> +       } else {
> +               args->out_args[0].size =3D sizeof(struct fuse_entry_out);
> +               args->out_args[0].value =3D outarg;
> +       }
> +}
> +
> +static void fuse_statx_to_attr(struct fuse_statx *sx, struct fuse_attr *=
attr)
> +{
> +       memset(attr, 0, sizeof(*attr));
> +       attr->ino =3D sx->ino;
> +       attr->size =3D sx->size;
> +       attr->blocks =3D sx->blocks;
> +       attr->atime =3D sx->atime.tv_sec;
> +       attr->mtime =3D sx->mtime.tv_sec;
> +       attr->ctime =3D sx->ctime.tv_sec;
> +       attr->atimensec =3D sx->atime.tv_nsec;
> +       attr->mtimensec =3D sx->mtime.tv_nsec;
> +       attr->ctimensec =3D sx->ctime.tv_nsec;
> +       attr->mode =3D sx->mode;
> +       attr->nlink =3D sx->nlink;
> +       attr->uid =3D sx->uid;
> +       attr->gid =3D sx->gid;
> +       attr->rdev =3D new_encode_dev(MKDEV(sx->rdev_major, sx->rdev_mino=
r));
> +       attr->blksize =3D sx->blksize;
> +}
> +
> +static void fuse_entry2_to_entry(struct fuse_entry2_out *outarg2,
> +                                struct fuse_entry_out *outarg)
> +{
> +       memset(outarg, 0, sizeof(struct fuse_entry_out));
> +       outarg->nodeid =3D outarg2->nodeid;
> +       outarg->generation =3D outarg2->generation;
> +       outarg->entry_valid =3D outarg2->entry_valid;
> +       outarg->attr_valid =3D outarg2->attr_valid;
> +       outarg->entry_valid_nsec =3D outarg2->entry_valid_nsec;
> +       outarg->attr_valid_nsec =3D outarg2->attr_valid_nsec;
> +       fuse_statx_to_attr(&outarg2->statx, &outarg->attr);
> +}
> +
> +static __maybe_unused int fuse_process_entry2(struct fuse_conn *fc,
> +                                             struct fuse_entry2_out *out=
arg2,
> +                                             struct fuse_entry_out *outa=
rg,
> +                                             struct fuse_statx **sxp)
> +{
> +       if (!fuse_use_entry2(fc))
> +               return 0;
> +
> +       fuse_entry2_to_entry(outarg2, outarg);
> +
> +       /* error */
> +       if (outarg2->backing_id < 0)
> +               return outarg2->backing_id;
> +
> +       /*
> +        * If passthrough is enabled (backing_id > 0), statx attributes a=
re not
> +        * cached because passthrough getattr fetches them directly from =
the
> +        * backing inode
> +        */
> +       if (!outarg2->backing_id)
> +               *sxp =3D &outarg2->statx;
> +       return outarg2->backing_id;
> +}
> +

Need to check that outargs2->flags and ->reserved are 0.

Thanks,
Amir.
