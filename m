Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0F33D7D9A
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 14:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781250; cv=pass; b=sp3doTda0lgwW9SmAiyZfv/QAPcp9o/uMkY+NeGNIU1QapqgEgRAsPdvFnzJox9T8dne4Ii7vIZma9NILlYrghAMjGConAlOhsrqenXC0Zd5H6amaL4yZF2YYndoaMF8isYMGi99+pneips2ya21cPnu5ojdGtpEJP/adnqZIDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781250; c=relaxed/simple;
	bh=d8nxjUsIrMUcCFj0w4AA4n7157/Wyl7hu5v/cCJeV4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWbQt5qK4mPr2DmBflYp5MxxYN0sWxmsCXxkhUtHMl8YcUs0xiqUJ24hKvQ6gPEVlM276xMCOf8W2LHM/6JIxKvS0ajZQ4r+x3MYIC1JB9aB1aEp5g6t6rqEzofMwz2PtOAXo1CEgIkCo6UG71KuVr56SrvZriSDdt92IHp40G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4Y6Qd7/; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4Y6Qd7/"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ba51e69988aso525378566b.0
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 07:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776781247; cv=none;
        d=google.com; s=arc-20240605;
        b=J8thLk+DyBvfUigg0rQ0httNyfXkWKZQK5srRByewy3BCpR8JQRvbmVfVgMlVUXfRK
         Eh9RUlBR1ka96lq/psl939V9zP3GqDx5YCMSfp/rUKmkLO7pFPzxJdI25AralcPAXn5p
         dWXMQ4TzTlEpt5RNNbmtIaPwkDSYDXdYn7rHTqrgbtd5iiHz0Acu3vbIv5Kyyq5NIzk+
         aA74PJMFOyE78rpXT3N32xaVlGmGRKBU4Ewpf9hOjh/uU1cGHq6S7ZhOY/Yx2bojwMOM
         vnJBx3tGxHHg+Soj+370H7dVtbHdB88qKdfjimodI59D4nCytWoyPOwaZKeWyakVSK0R
         S3dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CdRrXibCNYF/KbyHk+JJzZQDgp2mzK3weTBbJepeiEM=;
        fh=u9jEeitdyakBruI7AtmpKBz0Fa4In3HgR01sUsMBNeY=;
        b=kXpEkLCVmIwySZBr2Wh2Gg6kaZVUg15aQFLTjcnXSMJhqvoilsdePho7x+dQMWbVNU
         0n2o3xfGqnVsquWa66lDAPjMChn/A7+6ywZTG42mgb2dY56kCydMDwKFEidxwBGX9cyj
         6w/EFEfCEQAF6+cR8lvOf36B9EJFbu04GwgB/4mGB3xmf9jkcoYOFQsGjtGahkOZV+//
         xww7bl8SG+Acj4RyUl3ojISOX/+9RTNC7plDGBoGNIkSD5j/sbf85sdn4p+YFA/ma6sg
         IXVenKhW8+j0UTwOuf06z8IBcUKg1+2G4kThicQfQcqR8xpIsGhIEBeT72YP43tISEZV
         xYkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776781247; x=1777386047; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdRrXibCNYF/KbyHk+JJzZQDgp2mzK3weTBbJepeiEM=;
        b=J4Y6Qd7/tkaXL1CWgwxxUjkCn58rpq4F0DAod20yyB9YkNY8pIVVTPeYshvCq1nobW
         ZIJtQH8Tvm9T84V3ZHjhEUpMVX+FbaNufXiUP4BxFldTa4Y3+7aiZegqw80MGtGcOTyj
         NqlD0oucgxmnW/gntuyeeHFMbb6iXOHciG2wWQRpVkZ8O5m6oZhvGdu1r6MzGTEL891e
         tFeQTP8Cxsil9dbfhObNyo1MzhY9MaPuyiYiE1wQCaBeTf+iMm5SxB1j8AKGoyG2zHMD
         8yRL0nIwWVcQoGG1CIxTKRH4YDkw3i9CbhJDxGJ2mXl1USgDjDakJVbbNeHFXgdlBE6A
         V9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776781247; x=1777386047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CdRrXibCNYF/KbyHk+JJzZQDgp2mzK3weTBbJepeiEM=;
        b=sB7jWlSKLPLM7kd02OdMM8CP92JREWJCeXXsaKcEBKEa/j+HVk+lrvZcteYTXwP2NV
         xheujweRT5kPa2T/5n5A9kA8x9fTL1yq83T3g0GP7s0/B+2kZP2/XF2A94nACrFM+c6z
         4uNJW9dIKvogM3btAxlRImmhuqOePVoQSZsmjtWxTGEB2HauuRebDyGny1Gzhe5M+RIP
         ON2aFwXnSnw+0+6J0uSitZVBfwlwHTeRjYqMaFxCiyHvCXhoI3Mg2wXG0ExWqWApxMnl
         MFHHwSkGf2Ev495w2PEUg/KLOEh901ruiJOpJbZxaL7nVfYMD3XjWtuo+Q0ZOmhJULOm
         aszw==
X-Forwarded-Encrypted: i=1; AFNElJ9qgSM9SLYm/dQyCBfSjf7vaJt0d1zYFHKiipyb8HAVOnwi+PTpVoeo+XoLaYiNPN1PgDjPNdEJDqnb@lists.linux.dev
X-Gm-Message-State: AOJu0YxcRIhdpwimZ28bJr0dF2FqicRMa8qyQ5iEmGzOjA3d/AuqRYIC
	3azvg0v52bQ+IuYkw/+Pi2uX9Ya1sNgk8n8rx0ZPCMXO7RVWgN6bYKfcebbs6Q0bTdcKnDMUJwE
	+jVZWbAEmLlPuJQWa2pojwalya9drJnM=
X-Gm-Gg: AeBDieuVAuaTXRUIklNr6wfQqeGglROHXwfk9zscnIIbJXBhUQRbs54ypJ0Fygmst5s
	DK18JdqBT6KYP2tgBj7EGuRVKtZPit/Do8wJcvkup4VXWSvZn11mII9yhBCWzoPEGaxtkdDT47g
	Y2m2LFjjyRQ0l3vsTq6NR1ZZLcPFCWRt5FamQ84ARq0uw1AXWSVRYie0Kfc/whUFuYl7Xc+YfDh
	3obp6xhrGajubbzw0vmbRAiDJyuyh75KRBXvr8XxS3twgQO7pvyjgtXYzmbUUm4MsHhFb7MJtBE
	BOsuQLUzJZtElggdNQvWpfE/D+BPIIvHdgmyf2sQLaV+JIj8jGTH
X-Received: by 2002:a17:907:94d6:b0:b9c:30b8:dcad with SMTP id
 a640c23a62f3a-ba41ac02790mr892748066b.34.1776781246427; Tue, 21 Apr 2026
 07:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com> <20260420221637.2631478-16-joannelkoong@gmail.com>
In-Reply-To: <20260420221637.2631478-16-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Apr 2026 16:20:34 +0200
X-Gm-Features: AQROBzAeC6DCRhh_zBC2c4LcANTtPORRwHAdQTxiWZjaPFJxch611aogxuOSvBY
Message-ID: <CAOQ4uxi3VML0ZcbnCWuzsi2U-N88xU3dJ6S7030oA_7G+A0GGg@mail.gmail.com>
Subject: Re: [PATCH v1 15/17] fuse: add passthrough setattr
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> Add passthrough setattr for setting the attributes directly on a
> backing inode via notify_change() instead of issuing a FUSE_SETATTR
> request to the server.
>
> After updating the backing inode, sync the fuse inode's vfs-visible
> attributes with a passthrough getattr (which is guaranteed to be
> supported, as getattr must be passed through in order to use inode
> passthrough) so that it matches the attributes of the backing file.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dir.c             |  3 +++
>  fs/fuse/fuse_i.h          |  3 ++-
>  fs/fuse/passthrough.c     | 31 +++++++++++++++++++++++++++++++
>  include/uapi/linux/fuse.h |  1 +
>  4 files changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index ff9a92d8a496..6dea0f8e384f 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -2546,6 +2546,9 @@ static int fuse_setattr(struct mnt_idmap *idmap, st=
ruct dentry *entry,
>         if (!attr->ia_valid)
>                 return 0;
>
> +       if (fuse_inode_passthrough_op(inode, FUSE_SETATTR))
> +               return fuse_passthrough_setattr(inode, attr);
> +
>         ret =3D fuse_do_setattr(idmap, entry, attr, file);
>         if (!ret) {
>                 /*
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index daf7b664e1b9..d722382676e2 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1571,7 +1571,7 @@ void fuse_file_release(struct inode *inode, struct =
fuse_file *ff,
>
>  /* Inode passthrough operations for backing file attached to inode */
>  #define FUSE_PASSTHROUGH_INODE_OPS \
> -       (FUSE_PASSTHROUGH_OP_GETATTR)
> +       (FUSE_PASSTHROUGH_OP_GETATTR | FUSE_PASSTHROUGH_OP_SETATTR)
>
>  #define FUSE_BACKING_MAP_OP(map, op) \
>         ((map)->ops_mask & FUSE_PASSTHROUGH_OP(op))
> @@ -1683,6 +1683,7 @@ static inline bool fuse_inode_passthrough_op(struct=
 inode *inode,
>
>  int fuse_passthrough_getattr(struct inode *inode, struct kstat *stat,
>                              u32 request_mask, unsigned int flags);
> +int fuse_passthrough_setattr(struct inode *inode, struct iattr *attr);
>
>  static inline bool fuse_use_entry2(struct fuse_conn *fc)
>  {
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index 8ecce2a97ee8..c70478f07d6a 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -9,6 +9,7 @@
>
>  #include <linux/file.h>
>  #include <linux/backing-file.h>
> +#include <linux/posix_acl.h>
>  #include <linux/splice.h>
>
>  static void fuse_file_accessed(struct file *file)
> @@ -251,3 +252,33 @@ int fuse_passthrough_getattr(struct inode *inode, st=
ruct kstat *stat,
>
>         return 0;
>  }
> +
> +int fuse_passthrough_setattr(struct inode *inode, struct iattr *attr)
> +{
> +       struct fuse_conn *fc =3D get_fuse_conn(inode);
> +       struct fuse_inode *fi =3D get_fuse_inode(inode);
> +       struct fuse_backing *fb =3D fuse_inode_passthrough(fi);
> +       const struct cred *old_cred;
> +       struct dentry *backing_entry =3D fb->file->f_path.dentry;
> +       struct mnt_idmap *backing_idmap =3D mnt_idmap(fb->file->f_path.mn=
t);
> +       int err;
> +
> +       old_cred =3D override_creds(fb->cred);
> +       inode_lock(d_inode(backing_entry));
> +       err =3D notify_change(backing_idmap, backing_entry, attr, NULL);
> +       inode_unlock(d_inode(backing_entry));
> +       revert_creds(old_cred);

Looking at ovl_setattr() (overlayfs should be the reference to all
passthrough ops)
it looks like mnt_want_write() is missing and possibly many other tweaks

It is generally advisable to keep heavy logic as this in
fs/backing_file.c helpers,
which overlayfs and fuse can share, but I did not look to see how much of
ovl_setattr() is relevant for fuse passthrough.

Thanks,
Amir.
