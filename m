Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055CD49251C
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 08:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780646831; cv=pass; b=lF6QzNEUbwK2Cdoy03igyJFhu0fuRa115GuXnlNxOo36Ky9a4JvXg1GkiSxNlIp47NlwmKhFvlc4P3U12vNV08chqdI6JQTqLUy5/xRq2Jm75cGFtTgBbB74Hf4LAPutGPPeZduXPi6FBmyzlZcY6+DZhcW9W4QWRyayI1oPGIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780646831; c=relaxed/simple;
	bh=Ytv9W1SrsMISfYHcoOT/NwAS17Z+XmKb9jIRrr9Xsz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSvn0ITwf1MlAtcs4rUazoVwETGq0TvlLxuGq27xDeKf8y+CP64rLI7nUoq+DOcKMrZVEJTqCoXE5aREjxb1BPj/KRyrjUi2uunppoqW8vy6oKO3PYUjYc1d4hqGUCAvy8RX077ZkrZaEfkf6OLd8NXGMPKiLFGJxj0M4yXjUKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHHDCf64; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHHDCf64"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso2805841a12.0
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 01:07:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780646827; cv=none;
        d=google.com; s=arc-20240605;
        b=N+J/MxMnx+WwxJVnXF/4eeGxl196ThYmwPeNdTK5mB2mgF5fP9JG7ZGtxqiar4epdI
         GFbFJGlEmcqL0oz0iLmnFkYAoS5iZIhEmESqV+4ewXPp6g5IgfSH418gapXqmEJ6ubBt
         NEN/Bq0RjiCHHZJQfipGeQRFR0NfSlvqssbXA4XzlJ+wMW5Uj3n9JpGPPg8cR/wLJYaq
         tuUL1tmOrEpwvhq/CpHTb/q7yQKSKdyZN8/bWVisSQ1h5V3EJtRqFU0eBwGtiH/VV3EY
         ISVIIDi35ncjLiZGFPgUqxwSRKYF4WJZPPUk+F28HlgEPiQenBkpyM72SXSB69qfSH71
         G+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HnnsHS0Wcp2mEOzPJJwlniAFCTPKXloFmRN3SXUtabI=;
        fh=Um8xSTHe4lfTg6hgJRC5NKGqbZPPLfvHFDy/hxkTxDw=;
        b=AzChkz3tpYg9164nDqGxrv4h29sMAXbrDmlM7DM+BkUVmFezucnoVDeA0ID/zeZP+O
         q4kT/HwnveUqchnV4a+70dgfF6NaH50tnDygUxACAnTXJYeCUlN6hwlJKDVnQJpVQAbB
         cz7IsHjlhjeyJH0n4f0ChLTtvue3oxgrMx3TfInyb1x3DNd3Bzksb4y4xTZb8ZxAF7Fu
         fkotldnXHSmR0DBbghAecpmhyYZq9gLXESBG4lRa6Uh06T6fi0IJ+0mid3ZhKVK9OTzl
         GKD4BjU8DovcTM5aCMcjM9xwo1nlDgcJLjCLix1ArU6psDOGdG1Myt9szYehfsijPA9t
         tCyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780646827; x=1781251627; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnnsHS0Wcp2mEOzPJJwlniAFCTPKXloFmRN3SXUtabI=;
        b=QHHDCf64RrDYKzfoKsdiK+TQk8eJTmL9xuFe1nha6I7WQiyRfYpgKGeEiIGDbuJl9M
         oLhIXie3NXsbRSl3R2xfd0sG5tFcycy4u9h/8NxB/wZYvb/ueIiN0Ez50TZGVUqKKXV6
         szQNCGTkI3bdJ0D0hhEvDdlw44eDowdck8nIsH/EKVNyRvBBiWgLLz2NUVu560TTEDcn
         6Jk3v9bIoJ9tG88QqfoO78Z7a8rPBU8fP/aeeFy6Gy+puqjWSVFccv0hX0OJQ3DgXN6y
         2AzWrWL5nk1az2yhlD02En4cCKGWjfHZ6A4ek6UrNOVAqgRro2GqY5yo0EmMWgnrq1OB
         +3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780646827; x=1781251627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HnnsHS0Wcp2mEOzPJJwlniAFCTPKXloFmRN3SXUtabI=;
        b=Yak9W59qcZXv7ObPxgkeX5mOe7soyfC0qPzqCoJL0BWukyDMgNqcm0cGZfOORXT7bA
         XRCmcgD9a/pGx39GhxKVRvU7DoKsrFubUKyOxwZpyBmA3YinvrY4PGlRpVWywaOgWJY2
         QQKpxNrldhLcdDdVMBGqr2fb4ybCILbH9BLdcfAeZsC7XfQ3GvUqo6qmP1xokeDIxzP/
         79xgJuE1sb8FbQKBtvSWSUUqCxX5DX696+Qxv8tfHRNZNI3ggdyzNWDEfweHmxWTy1dR
         kt4B92XumTwLnr9S17Q9Xo2WVPe9y5RD4dOyez679g9S2xS1ACruEOCn50WPsS8MPLZk
         /wCw==
X-Forwarded-Encrypted: i=1; AFNElJ91VLR8zM4vh/9A+i7K0IF0EQAZFitUO0xPS2SyUqg+/Yt5LVlWU3Y38O5H+lx9ebAmmvJKfIg7ZXFn@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7i3C3CmYdF4UTbIM0Qj/SvVOSxZYdwgqwOo1XjPTJ0qoXM5/h
	pxL4s4luenzRWzsZPVNPYBB6KUs6XS+TTlIPwlRwMuxYhV7ZdqljTdB89YB+o6D8fk0jfnOkcVc
	pcpWrQjdYQtlagkiIAQo92xWRHWDY9s4=
X-Gm-Gg: Acq92OHIGuLNlhFb0T7FQst1nNnzmLOcJ/DRf8YQsORrfK1bRK3gqfCCIvRLtINFzxC
	KAYCVla9SH2J3TMK5VpAGdXoPTVciqQ2Co/Q9UcNSLPrcxZjgkjEetD47pUpcN9ah9dFz+tEL4W
	X1o7J38mOjNIiSXtYnOh20lKRt779uTANIzvEvoHLZXYcSmq5HSQQI3NQnVMvFf/EjN8rsEUVyu
	aj9CbiO33eQqr+me5KVig786YM+EBrokdHqml+0s4JLPp7bNK/kZKXLfro3g6vBvpVEApwNMsGI
	b3kAAj5iJlo1LHjWDcsHalKnUd7AsMm1TvSBBJRUpkNvSMmqc6yJ
X-Received: by 2002:a05:6402:535a:10b0:687:fc0:8298 with SMTP id
 4fb4d7f45d1cf-68ff228d6e3mr503733a12.15.1780646827057; Fri, 05 Jun 2026
 01:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com> <20260604-fuse-compounds-upstream-v7-4-27331d085c2a@ddn.com>
In-Reply-To: <20260604-fuse-compounds-upstream-v7-4-27331d085c2a@ddn.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 5 Jun 2026 10:06:55 +0200
X-Gm-Features: AVVi8CcA_JCeOSvuo5xa6cgx46zmBE9_uOHCjmG8M7BeckMhGZo3GoIFNltGjQY
Message-ID: <CAOQ4uxh5OzWVVPqJMe2g_jGhXBKLGUgKcEXW-_ShKtfXuTt7bQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] fuse: add compound command for dentry revalidation
To: Horst Birthelmer <horst@birthelmer.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>, linux-kernel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, Horst Birthelmer <hbirthelmer@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 11:51=E2=80=AFAM Horst Birthelmer <horst@birthelmer.=
com> wrote:
>
> From: Horst Birthelmer <hbirthelmer@ddn.com>
>
> During dentry revalidation the compound LOOKUP+GETATTR
> will save a round trip to user space.
>
> Signed-off-by: Horst Birthelmer <hbirthelmer@ddn.com>
> ---
>  fs/fuse/dir.c | 113 ++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 111 insertions(+), 2 deletions(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index b3406c33abd2..99800e8ca895 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -372,6 +372,101 @@ static void fuse_lookup_init(struct fuse_args *args=
, u64 nodeid,
>         args->out_args[0].value =3D outarg;
>  }
>
> +/*
> + * Revalidate a dentry using a compound LOOKUP+GETATTR.  Saves a round
> + * trip when both the entry and the attributes need refreshing.
> + *
> + * Returns 1 if valid, 0 if the dentry should be invalidated, or a
> + * negative errno that the caller should propagate (only -ENOMEM /
> + * -EINTR; other errors are mapped to invalidate).
> + */
> +static int fuse_dentry_revalidate_compound(struct inode *dir,
> +                                          const struct qstr *name,
> +                                          struct dentry *entry,
> +                                          struct inode *inode,
> +                                          struct fuse_mount *fm,
> +                                          u64 attr_version)
> +{
> +       struct fuse_entry_out lookup_out =3D {};
> +       struct fuse_attr_out getattr_out =3D {};
> +       struct fuse_getattr_in getattr_in =3D {};
> +       struct fuse_args lookup_args =3D {};
> +       struct fuse_args getattr_args =3D {};
> +       struct fuse_forget_link *forget;
> +       int lookup_err =3D 0, getattr_err =3D 0;
> +       struct fuse_compound_op ops[2] =3D {
> +               { .arg =3D &lookup_args,  .error =3D &lookup_err,
> +                 .dep_index =3D FUSE_COMPOUND_NO_DEP },
> +               { .arg =3D &getattr_args, .error =3D &getattr_err,
> +                 .dep_index =3D 0 /* nodeid comes from lookup */ },
> +       };
> +       struct fuse_inode *fi;
> +       int ret;
> +
> +       forget =3D fuse_alloc_forget();
> +       if (!forget)
> +               return -ENOMEM;
> +
> +       fuse_lookup_init(&lookup_args, get_node_id(dir), name, &lookup_ou=
t);
> +       /* nodeid is filled from the lookup result before getattr is sent=
 */
> +       fuse_getattr_args_fill(&getattr_args, 0, &getattr_in, &getattr_ou=
t);
> +
> +       ret =3D fuse_compound_send(fm, ops, 2);
> +       if (ret =3D=3D -ENOMEM || ret =3D=3D -EINTR)
> +               goto out;
> +       /*
> +        * The non-compound revalidate path propagates -ENOMEM / -EINTR
> +        * from the lookup to VFS instead of treating them as "invalidate
> +        * this dentry".  Keep that behaviour when the lookup ran inside
> +        * a compound: surface the per-subop error to the caller.
> +        */
> +       if (lookup_err =3D=3D -ENOMEM || lookup_err =3D=3D -EINTR) {
> +               ret =3D lookup_err;
> +               goto out;
> +       }
> +       if (ret < 0 || lookup_err || !lookup_out.nodeid) {
> +               ret =3D 0;
> +               goto out;
> +       }
> +
> +       fi =3D get_fuse_inode(inode);
> +       if (lookup_out.nodeid !=3D get_node_id(inode) ||
> +           (bool)IS_AUTOMOUNT(inode) !=3D (bool)(lookup_out.attr.flags &=
 FUSE_ATTR_SUBMOUNT)) {
> +               fuse_queue_forget(fm->fc, forget, lookup_out.nodeid, 1);
> +               forget =3D NULL;
> +               ret =3D 0;
> +               goto out;
> +       }
> +
> +       spin_lock(&fi->lock);
> +       fi->nlookup++;
> +       spin_unlock(&fi->lock);
> +
> +       if (fuse_invalid_attr(&lookup_out.attr) ||
> +           fuse_stale_inode(inode, lookup_out.generation, &lookup_out.at=
tr)) {
> +               ret =3D 0;
> +               goto out;
> +       }
> +
> +       forget_all_cached_acls(inode);
> +
> +       if (!getattr_err && !fuse_invalid_attr(&getattr_out.attr))
> +               fuse_change_attributes(inode, &getattr_out.attr, NULL,
> +                                      ATTR_TIMEOUT(&getattr_out),
> +                                      attr_version);
> +       else
> +               fuse_change_attributes(inode, &lookup_out.attr, NULL,
> +                                      ATTR_TIMEOUT(&lookup_out),
> +                                      attr_version);
> +
> +       fuse_change_entry_timeout(entry, &lookup_out);
> +       ret =3D 1;
> +
> +out:
> +       kfree(forget);
> +       return ret;
> +}
> +

That's duplicating a lot of subtle code.
I think this calls for some helpers.

Thanks,
Amir.
