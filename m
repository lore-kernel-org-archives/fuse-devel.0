Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B29E22A817
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 14:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776780535; cv=pass; b=IX1eCkSqdZk6J2JL1sA7/QrcVWr0h7drbqfB2drROcHJmripe02mmTk2n/kBoi+EywU647dIkg63MCu/O5iCsRlk10/biC5kXiZ1GxI1kApWUlbeVVxDj24uur7I+jjl9PQeeNJQ3z2AGTpA3uy3i9l9Pn0V2w60Ke1tWxJnrNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776780535; c=relaxed/simple;
	bh=FHitRpV8OUYJ6OXvFBf8Tq++MtGmBC8tUzFf8z+yJos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kV7GZ2KF8Fh+Ua4PwPL61aFz8VuGBTqSWGwcBfUkZIxq0dRqbLsCLddRBmVQrZpZv+fmNBV617wBywKqQwFpVcoiBaStkl1On9FBz0SFVbXRtH+qZTk3J5yNyBodtHWzBUl+uxpLRH82PoROoiqCdQLZZllEZHsvi7zKBjfLIhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bV1N3y+I; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bV1N3y+I"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ba3b9601b97so615112966b.2
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 07:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776780529; cv=none;
        d=google.com; s=arc-20240605;
        b=RoeCoUtNf7Jwq4TZ//znaNUIFEBXoqoo773n5CwxiBRfXFye4vQNNcYRo3ZoaqYFZR
         FtPEdydaWyXK9Xn6Y1JprXYRScwz7dbu8fH+W0+peO/gsmRFfrxIYgIokklGGI+uwcGp
         WjOghZf4KrQbUbTqFjBSdYxCF5AXu/4k+p47SDn76lAQ4+wR8+wz1heMcRw9FJiqznYh
         9KVvEQXdO0ydYIIZySsN07H+oyk9mhc4/tgEn/psI2CW8zCBMbTnEDFf6FzGMtQcUYzr
         pQ07fPw6Hw1Q2Wm11AS+9yDx8ej/yk9+pGhGvipyo2vG7Cdvm2X6UvQljamLxrUlzln2
         uekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GSft2TzzVzmZDs4g0bgHf3PO/8m0iUACQT57OQJ25Qg=;
        fh=RAYtckPzLHIZbvzGydZ44ZgPl4OS6ydA6+g4OCiMBko=;
        b=FBTPhP9u/6OftP8o+PCcxeo5lI6OYCMDNHqpxr23vobTS2vQMybvF3PHwF0CIpZXtC
         41Hcolwlf94YN+zEIImrr3Ol0XDarCAiRsK4dojWa8trdXs13oIsl6AcHkqy1rqvgTBO
         VEttYJw1eqUMcq6JQ7dOnznf0rf+x6pXCD7ZZJn7Ms3PWQsm0JFxSHiJ0ixcO3jKne9i
         vi+Lz3ICh1d/wOw72WTnLWR0aSQwu6vXVpH1yL68PdOpsvQbaWXSdzJ2gFewKcj4CAxX
         dkXGNByZEWLdF/SLtrqCg7PUlYXR3JJ+UlnjAMhopY3Hn/+1kDejsBp326sRj1Wsfe9U
         dAYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776780529; x=1777385329; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSft2TzzVzmZDs4g0bgHf3PO/8m0iUACQT57OQJ25Qg=;
        b=bV1N3y+Il9CLx42bGQLze88eLkKYIrhOqW9U6XgXl/FO7Ydjw2JkoXs29DrmsZ/mGE
         02kQ7TLrDxVKJUCYN3jRPWQtooFI/LCNZInij66uKV3jq+h71kv16MhWgzsMuqNwTK81
         aKDn0NhrTJm+IpTOeLceyKHXPBsrY4N6EEMMm8NxjQHNULyCxd4EcP6iSHPrZ4QrMHwL
         5zhBSufQRT8awbdX9Sh/l6mzTKBQ1x1ZhivpVk6kzOS9DL4+ivDCrHJKI7Jm56nYbgaD
         YatR7LwDJWcXf8vkbAcFW0S0tEGLomyElKHusZ8IQXmQnAULDROHZHENPNh/WmosZI6M
         craA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776780529; x=1777385329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GSft2TzzVzmZDs4g0bgHf3PO/8m0iUACQT57OQJ25Qg=;
        b=Eh+9UtjXCcgYaOQFi1zCMNeb5kqkGDsl/DTzL9IdiPSJooSNp3YGkEgDGuQGiiEsqY
         k8qb0KpJUvgad7X0OEb/g/JE3F34qF8LKmcsTnCZt66H/izzfvhkCAB1+UASd1iho2w7
         OGzYlIQ8i9P/iF1uw3zkmztP0UarZxqKwxWpVd4ZXIVftPBJFSWVV3DVO9SD5jp+k4jQ
         QOUd2x7XZ4ZXjQTcuQjer/Fh8F3w64E31lKx/sGo/plPVJygi7LaGL5ytzJGviImEjIq
         md0GA094z/vHc02OKjb94wV6XxMQubVGvrXOZzyxhjB5Ai33Sx+twcPBdCARcu9uANHl
         tI6w==
X-Forwarded-Encrypted: i=1; AFNElJ8jJzgv2juMr34rfZZyY5USMTHQCxsOQSWPcpR79XZRBGvCuvf6zq3bsMa7zbIFuqe1qt1BAHV/BAMs@lists.linux.dev
X-Gm-Message-State: AOJu0YyP0BCybWmmCiUJRaSjRoC4W4ZL/4gMPp3nJoNK3lm+cOi3+VF7
	YmkypSUl17gDeKSNpXBiaWXR4j3VxCoVjZZ+wBI3FweQgO2OIlVwCu8hLWYBC4oY3jWvF3UgArl
	n9iXM0rkdJPqjFv2Li8ySIzpf8rGnvag=
X-Gm-Gg: AeBDiesR7H02c7ELwGn6DRom/mCJfROLYT8I1FO1bjpeR9/ZyXNMH1JzfAWzRNW6jR4
	7HXmsHwYZ6XhLFV2nkawqKUe6j87ORxlZ8bM8w3n9DdJfLHX4Bg9BVwLH1QQlK4eUdNoxyDvAdM
	BolSqDmo6fBw7/hr2eaS9iL64HF6PGu+fed1hwujzixRBeO+UzLqMKPDNbYP2GJFon/YfGLIsEj
	9etFzf7S635bnIwN4MefsTU+41ylgI23GiiH44McmBn4E7rquZH+YnTOB2jrQ/FyPPMWRN6I6BZ
	RTKNLscf8v+ns5ufXfWAR4OGYxPCzNJxF39y4rUMVo6yFfC+Qck2
X-Received: by 2002:a17:906:7946:b0:ba2:7010:c535 with SMTP id
 a640c23a62f3a-ba41c0bb9c2mr827037366b.47.1776780528668; Tue, 21 Apr 2026
 07:08:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com> <20260420221637.2631478-13-joannelkoong@gmail.com>
In-Reply-To: <20260420221637.2631478-13-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Apr 2026 16:08:37 +0200
X-Gm-Features: AQROBzCOvtkEQXk1bM0uaTErUXc_zktBjMO-2b6ZtCPyfYaIA-q5sxhlTMCkFzg
Message-ID: <CAOQ4uxjaY4-POtWCmgCiMF1rupuKxV5JU4PKAipXFw7-CN=Pgg@mail.gmail.com>
Subject: Re: [PATCH v1 12/17] fuse: add passthrough support for entry creation
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> Use the new extended fuse_entry2_out reply for entry creation operations
> (mknod, mkdir, symlink, link) when FUSE_PASSTHROUGH_INO is enabled.
>
> If the server returns a backing id, the newly created inode will be
> automatically associated with the backing file for passthrough
> operations. If no backing id is returned (no passthrough), the statx
> attributes are cached.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dir.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 9e9b77942dcd..e5a7640fcd30 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -1088,10 +1088,14 @@ static struct dentry *create_new_entry(struct mnt=
_idmap *idmap, struct fuse_moun
>                                        struct fuse_args *args, struct ino=
de *dir,
>                                        struct dentry *entry, umode_t mode=
)
>  {
> +       bool use_entry2 =3D fuse_use_entry2(fm->fc);
>         struct fuse_entry_out outarg;
> +       struct fuse_entry2_out outarg2;
>         struct inode *inode;
>         struct dentry *d;
>         struct fuse_forget_link *forget;
> +       struct fuse_statx *sx =3D NULL;
> +       int backing_id;
>         int epoch, err;
>
>         if (fuse_is_bad(dir))
> @@ -1103,11 +1107,18 @@ static struct dentry *create_new_entry(struct mnt=
_idmap *idmap, struct fuse_moun
>         if (!forget)
>                 return ERR_PTR(-ENOMEM);
>
> -       memset(&outarg, 0, sizeof(outarg));
>         args->nodeid =3D get_node_id(dir);
>         args->out_numargs =3D 1;
> -       args->out_args[0].size =3D sizeof(outarg);
> -       args->out_args[0].value =3D &outarg;
> +
> +       if (use_entry2) {
> +               memset(&outarg2, 0, sizeof(outarg2));
> +               args->out_args[0].size =3D sizeof(outarg2);
> +               args->out_args[0].value =3D &outarg2;
> +       } else {
> +               memset(&outarg, 0, sizeof(outarg));
> +               args->out_args[0].size =3D sizeof(outarg);
> +               args->out_args[0].value =3D &outarg;
> +       }
>
>         if (args->opcode !=3D FUSE_LINK) {
>                 err =3D get_create_ext(idmap, args, dir, entry, mode);
> @@ -1120,21 +1131,35 @@ static struct dentry *create_new_entry(struct mnt=
_idmap *idmap, struct fuse_moun
>         if (err)
>                 goto out_put_forget_req;
>
> +       backing_id =3D fuse_process_entry2(fm->fc, &outarg2, &outarg, &sx=
);
> +
>         err =3D -EIO;
>         if (invalid_nodeid(outarg.nodeid) || fuse_invalid_attr(&outarg.at=
tr))
>                 goto out_put_forget_req;
> +       if (backing_id < 0) {
> +               fuse_queue_forget(fm->fc, forget, outarg.nodeid, 1);
> +               return ERR_PTR(backing_id);
> +       }
>
>         if ((outarg.attr.mode ^ mode) & S_IFMT)
>                 goto out_put_forget_req;
>
>         inode =3D fuse_iget(dir->i_sb, outarg.nodeid, outarg.generation,
> -                         &outarg.attr, NULL, ATTR_TIMEOUT(&outarg), 0, 0=
);
> +                         &outarg.attr, sx, ATTR_TIMEOUT(&outarg), 0, 0);
>         if (!inode) {
>                 fuse_queue_forget(fm->fc, forget, outarg.nodeid, 1);
>                 return ERR_PTR(-ENOMEM);
>         }
>         kfree(forget);
>
> +       if (backing_id) {
> +               err =3D fuse_inode_set_passthrough(inode, backing_id);
> +               if (err) {
> +                       iput(inode);
> +                       return ERR_PTR(err);
> +               }
> +       }
> +


I think we need to verify that the backing file is of the same type as
requested entry.

This was also true for lookup which instantiates the inode according to the
mode in fuse_attr.

Thanks,
Amir.
