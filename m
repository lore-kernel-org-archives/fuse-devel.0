Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE003A63ED
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776774423; cv=pass; b=rRGqA6VqvsKkjHfrgPd62SfhrG3OoiEkwB2W2H9nt5dA39SIgJ9DEkuubslWXC5WbGFiJB5lr4SpEgy6IS98/Q/3jHUEfnvlynWd430quiZo82q6Id+OIHGtVlhE4aHmV4HMisLhyIzkHZ+F1r+aLSJQPcKOZCdHVQkcwl9Y6v0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776774423; c=relaxed/simple;
	bh=eOtnH+XZnIH91QAIKn3Hq0UMFpkFtIiRC6JAB0/ECxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SYW3ZyF3KfRY5NImN57TBYiWFImbdAfp31xoxFApXCKMeuE91kyx+8RIeT4lLaqEmzgHAsFW14eGuEVPSr9VOviyV7OEJY4q5EwepZhxjCiakZQ2k5eqqgJ+JksXZsfCUaa03aO5AJeaQdXih8RVzbOxuFoZRA0v5hi/zdh97oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqB00m5O; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqB00m5O"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-672bd8d2400so8037190a12.1
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 05:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776774392; cv=none;
        d=google.com; s=arc-20240605;
        b=KxONEnYCo/+LLGeCN8FgBJSV6BA2AP9eZpkxqvAmKj+LyVM38u1/QtDAEAXC2WOHca
         JSWEyk4g5F7NIqqY5WVhLWPmxSbvJzyvkey/18438qsMvaTBiUZUfOri1TfBfsmV0wxG
         Xk6IE0Z6aDpMEra9JHi5EjfO5t9urCp0nco6c6Or3VqB2pGKdXYMjVbYiyE+1S1Lroht
         ReC5uHNT8UzrWv4q8h0GIN4oUztd3UF7wMI8areciWUbOVLNRVDEDQUSG2dLtQdRvwMH
         fgoIYyW5pjFiyDzK8KVlbvk83kK4Tr8aQZKCQmjWSiqYwHs17+CQvmj7tbw5r1CCiJT2
         upLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lyV7X8muF+Y1c6lCDbFe9PPHgkl0ygNTdItFkpN/bJ8=;
        fh=VRTwBNfDE/0D2fU5QuUSj9a+V+8LWLbd6NxH7lCWR2Q=;
        b=YkY1s0afSgj52FmWjM2I3zA1zU9UGndLVOXlmjJ2/OuAzqNt9q+xbYHc5yI8gqsAXH
         21U0eJJssj5C/L8KhdIRPBYihoeUFEZUrVs+UKncf/RImIJbJokDLSCFJxbpxcMyf9of
         GGJEb/Smo285NEx43WYanN+3Mb2F91+7HfkMojrj041TdBmFkPzepbpm2FXvFyh2cDdM
         B7IRZWDOVXhOmvx4ioK7sF52P7PcoAQzb3u2JZxvOqR0unrFG2Utwfo+pcwOd86Ma4ZW
         FSf+ZfvBLI0Baiv2HXR9PojyBJQ6C2HYv2BFmRTDYbP8pebK5LnRRoypoP+9UrWz5f7S
         pgSA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776774392; x=1777379192; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyV7X8muF+Y1c6lCDbFe9PPHgkl0ygNTdItFkpN/bJ8=;
        b=bqB00m5Ov4GMtcfNWdCraUkhfRy2l6xCWJckrXvWxF7IqtzwbTzeX5C22Cu3Bvuj8m
         3jl+gzXlXnPyHOZB2ugguACSwhhevJhDoz+ilvaYBBiZ1wToX/7hu7EzMelrOeRXNuSr
         8qZHtV2oiUXHifWltFb+IjRxut7ipHRikPXlFdKTkTp4wn4HwS6HgLOF3zslSACptV7B
         G9mleDPQzq5d1+6fw7oqR5VTJxlgyScJqC3jOzt1+8RtpalvCiUTxhuqGoCX7w5r+tUk
         InMcerzb+/nDu0/saVnVXczjYP6IyBwyjrX7tkyOp9nx4HJV3C5TzU1NhFHPfOQCad34
         sF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776774392; x=1777379192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lyV7X8muF+Y1c6lCDbFe9PPHgkl0ygNTdItFkpN/bJ8=;
        b=ZLJKbtpGGPW++/Ff0HP0/9yrDvf8HfIj0mSZXFGPPHIpOZU3/GoWFsRCOQu4AC2yyw
         bgrfS1221jW25k/CtkPG/oQ/DoM4qh5uLhy/zAfutIZ5pGY0i5J8ZLc9v91NCsYJll9k
         3guTnEdnFISICEa39/S4sCC1oXjO07RmvXaJqtaI9NhM3J8wocUAeqrvQebRUR3V7RZi
         aakIRB42ewAzZQ9q27XyRUZm0UQLzI55ijuJA5Tl05rCzYzEXwKtsVTrUJA791+gOa+R
         IKhtcSPsDjfxUzelIaVNFUgz7/pCyZx7W3HYHKGwX9vPEv7fddYObkskiISNoXyJRygi
         53wA==
X-Forwarded-Encrypted: i=1; AFNElJ++yeO0yV/GDvvLQc1YJSiHMDKUuQexofVM7t6Tfqt24WBq/6XKkIz+jlHvT60W7ovPW3xeSx+UC38S@lists.linux.dev
X-Gm-Message-State: AOJu0YzI7iUZFiMsY+9ozTX7D8URc14Or4ufUPTFJEZ2HmMN39Sb0kx6
	UzAbGRgeWB0hGQG+xH40wZI/VvaA+QDogR9Qzy2a1n6lxdwBweG4HLxdH2Ty4UgjTULLbBfuRrI
	QIpKmwJ4qR+l4/NklHLB7syeHFx84lbo=
X-Gm-Gg: AeBDievSjvBemuK04+Ssrtcsxcugmt3G51oquWhhdrCLMb1a3K9WKAYGL/sVmV8PbhK
	D7gtPq9+hwxLVkgWKDttvOwFroKUQmqCV43h1+/2QSmTt8sDWCZW02w7Jd8rmZ/WXu2tQzR/Exe
	Y5Vq+knRsO0XlvdRJ72wXYvYgzEBdYcvXoLxTCs/jLenVUoPnJ9IsoKgqN4x7FilIAsDvI/Xung
	izE20kgX3CulKz+BVN46o9a907nfoOhYIMft08p+gL59fzxr2TXXYdhc9HsFzcpZQ2EW5lwuKx5
	Lzy+fQUcPaAqVRbUKnwths922owLaid2nKq3+gG87Q56eKwzb/Mh
X-Received: by 2002:a05:6402:1f01:b0:674:37b7:227c with SMTP id
 4fb4d7f45d1cf-67437b722e4mr5550565a12.2.1776774391335; Tue, 21 Apr 2026
 05:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com> <20260420221637.2631478-10-joannelkoong@gmail.com>
In-Reply-To: <20260420221637.2631478-10-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Apr 2026 14:26:19 +0200
X-Gm-Features: AQROBzA4gqxDs0d9mJmWZ2h9NGABTaI1crvU9gQdYSRcyEcyakRdoFMGlhR0UW8
Message-ID: <CAOQ4uxiHf7YMqeAfMXPDDZKWJjC3eXBdeOrBHSTQJDOtyv2OiA@mail.gmail.com>
Subject: Re: [PATCH v1 09/17] fuse: prepare to cache statx attributes from
 entry replies
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> Add an arg for a struct fuse_statx pointer to fuse_iget() and pass it
> through to fuse_change_attributes_i() so the statx attributes get
> persisted in cache.
>
> All existing callers pass in NULL for the arg. This change is in
> preparation for a new struct fuse_entry2_out outarg which will contain
> filled out statx information from the server returned on
> LOOKUP/MKDIR/MKNOD/etc requests.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Looks fine to me

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/fuse/dir.c     |  6 +++---
>  fs/fuse/fuse_i.h  |  7 +++----
>  fs/fuse/inode.c   | 12 ++++++------
>  fs/fuse/readdir.c |  2 +-
>  4 files changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 2d037591a3ab..94ab05cb89ce 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -589,7 +589,7 @@ int fuse_lookup_name(struct super_block *sb, u64 node=
id, const struct qstr *name
>         }
>
>         *inode =3D fuse_iget(sb, outarg->nodeid, outarg->generation,
> -                          &outarg->attr, ATTR_TIMEOUT(outarg),
> +                          &outarg->attr, NULL, ATTR_TIMEOUT(outarg),
>                            attr_version, evict_ctr);
>         err =3D -ENOMEM;
>         if (!*inode) {
> @@ -890,7 +890,7 @@ static int fuse_create_open(struct mnt_idmap *idmap, =
struct inode *dir,
>         ff->nodeid =3D outentry.nodeid;
>         ff->open_flags =3D outopenp->open_flags;
>         inode =3D fuse_iget(dir->i_sb, outentry.nodeid, outentry.generati=
on,
> -                         &outentry.attr, ATTR_TIMEOUT(&outentry), 0, 0);
> +                         &outentry.attr, NULL, ATTR_TIMEOUT(&outentry), =
0, 0);
>         if (!inode) {
>                 flags &=3D ~(O_CREAT | O_EXCL | O_TRUNC);
>                 fuse_sync_release(NULL, ff, flags, false);
> @@ -1017,7 +1017,7 @@ static struct dentry *create_new_entry(struct mnt_i=
dmap *idmap, struct fuse_moun
>                 goto out_put_forget_req;
>
>         inode =3D fuse_iget(dir->i_sb, outarg.nodeid, outarg.generation,
> -                         &outarg.attr, ATTR_TIMEOUT(&outarg), 0, 0);
> +                         &outarg.attr, NULL, ATTR_TIMEOUT(&outarg), 0, 0=
);
>         if (!inode) {
>                 fuse_queue_forget(fm->fc, forget, outarg.nodeid, 1);
>                 return ERR_PTR(-ENOMEM);
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 45d9184d0f7a..e422d3dc2202 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1147,10 +1147,9 @@ extern const struct dentry_operations fuse_dentry_=
operations;
>  /**
>   * Get a filled in inode
>   */
> -struct inode *fuse_iget(struct super_block *sb, u64 nodeid,
> -                       int generation, struct fuse_attr *attr,
> -                       u64 attr_valid, u64 attr_version,
> -                       u64 evict_ctr);
> +struct inode *fuse_iget(struct super_block *sb, u64 nodeid, int generati=
on,
> +                       struct fuse_attr *attr, struct fuse_statx *sx,
> +                       u64 attr_valid, u64 attr_version, u64 evict_ctr);
>
>  int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qs=
tr *name,
>                      struct fuse_entry_out *outarg, struct inode **inode)=
;
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index c80ec5d2ce82..3b71685e7148 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -469,8 +469,8 @@ static int fuse_inode_set(struct inode *inode, void *=
_nodeidp)
>
>  struct inode *fuse_iget(struct super_block *sb, u64 nodeid,
>                         int generation, struct fuse_attr *attr,
> -                       u64 attr_valid, u64 attr_version,
> -                       u64 evict_ctr)
> +                       struct fuse_statx *sx, u64 attr_valid,
> +                       u64 attr_version, u64 evict_ctr)
>  {
>         struct inode *inode;
>         struct fuse_inode *fi;
> @@ -532,7 +532,7 @@ struct inode *fuse_iget(struct super_block *sb, u64 n=
odeid,
>         fi->nlookup++;
>         spin_unlock(&fi->lock);
>  done:
> -       fuse_change_attributes_i(inode, attr, NULL, attr_valid, attr_vers=
ion,
> +       fuse_change_attributes_i(inode, attr, sx, attr_valid, attr_versio=
n,
>                                  evict_ctr);
>         if (is_new_inode)
>                 unlock_new_inode(inode);
> @@ -1070,7 +1070,7 @@ static struct inode *fuse_get_root_inode(struct sup=
er_block *sb, unsigned int mo
>         attr.mode =3D mode;
>         attr.ino =3D FUSE_ROOT_ID;
>         attr.nlink =3D 1;
> -       return fuse_iget(sb, FUSE_ROOT_ID, 0, &attr, 0, 0, 0);
> +       return fuse_iget(sb, FUSE_ROOT_ID, 0, &attr, NULL, 0, 0, 0);
>  }
>
>  struct fuse_inode_handle {
> @@ -1755,8 +1755,8 @@ static int fuse_fill_super_submount(struct super_bl=
ock *sb,
>                 return -ENOMEM;
>
>         fuse_fill_attr_from_inode(&root_attr, parent_fi);
> -       root =3D fuse_iget(sb, parent_fi->nodeid, 0, &root_attr, 0, 0,
> -                        fuse_get_evict_ctr(fm->fc));
> +       root =3D fuse_iget(sb, parent_fi->nodeid, 0, &root_attr, NULL, 0,
> +                        0, fuse_get_evict_ctr(fm->fc));
>         /*
>          * This inode is just a duplicate, so it is not looked up and
>          * its nlookup should not be incremented.  fuse_iget() does
> diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
> index 1f2ff63cd317..7bd17b3389e6 100644
> --- a/fs/fuse/readdir.c
> +++ b/fs/fuse/readdir.c
> @@ -234,7 +234,7 @@ static int fuse_direntplus_link(struct file *file,
>                  */
>         } else {
>                 inode =3D fuse_iget(dir->i_sb, o->nodeid, o->generation,
> -                                 &o->attr, ATTR_TIMEOUT(o),
> +                                 &o->attr, NULL, ATTR_TIMEOUT(o),
>                                   attr_version, evict_ctr);
>                 if (!inode)
>                         inode =3D ERR_PTR(-ENOMEM);
> --
> 2.52.0
>
