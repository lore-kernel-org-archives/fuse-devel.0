Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D33D65192
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 13:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775377; cv=pass; b=S9QfaGFYJ4CkSkfIhJNkobc0qNlgyT1Luv8GvL3jeLV8Qv2NaxARAtyfzQCJ7dqnV0s6WgO6Xm6Ynmib1bzyBgqyf7uX77hp1NLALfAy0hsZV6pPMcG+BY9Md+hq+EpWK1gtxdLEPVzYwS63EIrG1c48RX2GJ0uwYQtzbbOpIQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775377; c=relaxed/simple;
	bh=SXhpmvBhQ+TXtxniHLWeCSa452bmcr1rqYYurbJuz+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpf9l1uXtrgByw99Aq8dH4oHgcmkIxA0CuJWAGnKikWum+t+3pqHX3x2PsRq9vTZ/l3youOKwSXSYfrMgc9KCBnT6hWIxmyT6bBQdbI6MZ4WbcJEW5SEhSU7qKPR4XueIYJwmFh9gKolNNlXZ7uKzGVtUuNJIo9rCOQ/mkQXh48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qeuqde8I; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qeuqde8I"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ae185cc40fso633507a12.1
        for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 06:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790775357; cv=none;
        d=google.com; s=arc-20260327;
        b=jBGZEnUqyCNxDwMS4OcNFEvbYqBnsdHXBk+fmAS6IW1GemXaAy3rqIfY5xU1ARW3bk
         NoPjMlEk8eX1mFYqLp9ahn31HJc+TTeRZTNcN/uO/FwjlolTsQdpzC3sqqOyZojhPEyS
         3RRJCVqy0Jf8nGpY67WQ7Oj97+w6lPGpnondGWMJ6LORHNTo/e3U9/3/4mcCEjsRHg2D
         u49gsg+niTScVEsBve1q2XQmbrVvq12kf9rJDM4dPV+wt4W9s0WKfC8ng3IjTYU4uiOJ
         i3gDP9HbjKOPTX/p1tbdKPgYnIcb3UN0vBTz5Zc6LrRnMR4DkiqEs6ELSrA41KF+/KL8
         MJtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4QchkhwI1w5bSASLXqcxUjuWuiosjQacZxJlQZryO/o=;
        fh=C2hvFbqtxCCQlLXtYuG++dZvZg3/X9npOaJpSiKOfHY=;
        b=Z2uglnhb1LuQPs9IGVN9yFhaManN5hetmz0M2GQ+UbBxt4CYmfqYkpaMP+U5eVSQWD
         3q5EhTesOFgQvJRHmCkC5vunRGEkhU0r/xyenF659CliBqBmrfW7VwR6bx0sNaKfUT5Q
         09LQmFxoOCUQu91eD0oEfp9r2/XyqOYDQHkwECooORkrxJDIEI5dJqoq0XEMRQRsNUDl
         4UVfjH04QXwE2Zp75oKi6Xm0T7VeS4p36RGRVP/IqKMiKiJ0Bm8ltZlcsw/Z6UHPV99K
         aNuaGoXL3Yoznh7XcOOAOEQyGWde4RYe3CcQpaZHELPMrWxmEB5bYcI8u9X8polfw25k
         DVpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775357; x=1791380157; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4QchkhwI1w5bSASLXqcxUjuWuiosjQacZxJlQZryO/o=;
        b=Qeuqde8IhgmE6WzROaBH0z+GgJ1MR6IONk3nLHZy+at/ZhZ6JOP7ySLCGrSU2uJY4q
         elUqWcVtxWKW2oN0+I4pYC3ag8JdD1igz3/b/KJRdLCDdlvI+Q/dKSteEwvUakEcMQh1
         9RoMLE4jO+TC5lFOZB+7ZQHnqMZUxW6BeiwE2ilZeVjJVCGOrb33QTDLRJNb8/vk9zgw
         S0Scl8+IkKk4cOZzpmi1OCtKdYKBwrWc5u7q7wUaaw7jYvK3Hb5Ez7b34MwbjiCpKqfW
         mvW5d/DLnJ65GrXlxzaxeF03xhBqTcM/UPP/BojgCNUvyv3zGJoSqSlIpAppK4U//vh4
         4rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775357; x=1791380157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QchkhwI1w5bSASLXqcxUjuWuiosjQacZxJlQZryO/o=;
        b=UA+eDwNAyvT6cL3gj2gjYOev03yNvt/RxrebL1ipP2bZwuMrVpBC21FL2m+YF+iyWw
         biVNvDg2b7FPI9zze8zIWIZDFSyF0Pnb8wW8XrvS6f7AQ5Rs8InSsgr+mNLBVE4/VhLf
         XVTtuGBbDUmdm5VimNuPIufY3jx8ZW+c4x12/Flsd78/TUtn1jNjrIvFGTjhsYyGrITk
         MH/UqNHUB6eFlGmGWmPNVqKbHKvHvpigdemdfDlUGL1yIreaBL6pVX7jVRy6744ZGhxk
         ENTCehQ2SVqwbllYV5NPXgW5AFL/tPjZZehb/lJw3J5SqIRkGlEK3Kotwt4jhjG13D18
         N46g==
X-Forwarded-Encrypted: i=1; AKwUvBxx/eNcRqBRjU5j1sCoQE4rWURQGjUGfsDWDGm1keNycu3CiHuMbo3hSkwshIJhOd83fMX9FkalcDV+@lists.linux.dev
X-Gm-Message-State: AFuF++kJacD5ctPTCwtkTI9RpjcUdAd1dA4WHyCDb8NnDMFnGdlQSWHr
	dZkUxaXNfDbbfHSPnEKxh5jrljX2GBo8WoQN/wD/xybXI2Jaj/F7cLGg12rzh4gQ5ObZPEp2TqK
	ERg3UmESHDR42eqqDVsY6iSTq1Tg++Qk=
X-Gm-Gg: AYBFou1TlMaj1rrD3n7JmxAY0GKwYuAEW8NfgRTczR8lDJpKedbu4w9YpJaShqwsRra
	3sphm68OrjMUgUOD2K4tGFxKm3HwYCNhh7O8VvpwoQO0UYVJJ06WRsOiqAKnwRiIFsdjxxmoW0/
	xPUeN1kI1o9wag1VmudSOcW+poEkS+SHqb4JR9m9jgTmiIEnkxyLQH4WbEn6OLsna/licgEQeZ9
	ckZ3i3Iqh9wF4jQ08sba0SWjO1HjRMZAkD/SpA5HUvSfiuOe12YFrs7zQ6ea9a8KsXssToyBzrR
	f6aWr8MOHQanLvu2PenCecF67yAe5eWG7VaC9rTfVQF6Bu91e1GUeJkBJzzc2uMGdLOK
X-Received: by 2002:a17:906:6a05:b0:c2d:b9b4:f4de with SMTP id
 a640c23a62f3a-c2e23d9207amr125564266b.18.1790775356627; Wed, 30 Sep 2026
 06:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929034158.1455429-1-neilb@ownmail.net> <20260929034158.1455429-8-neilb@ownmail.net>
In-Reply-To: <20260929034158.1455429-8-neilb@ownmail.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 30 Sep 2026 15:35:45 +0200
X-Gm-Features: AclHuK-7IYZDCVZREHuHZMSP_wgME-NMrM9tsJnpybGevda7U-xOXfVzEqygZdo
Message-ID: <CAOQ4uxjv3Ziqy+CjbCO7noAPse+a0066UO7pkFhStnnW9FFSPg@mail.gmail.com>
Subject: Re: [PATCH 7/7] ovl: stop using lookup_one() in ovl_iterate().
To: NeilBrown <neil@brown.name>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	Joel Granados <joel.granados@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Breno Leitao <leitao@debian.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Jan Harkes <jaharkes@cs.cmu.edu>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Hyunchul Lee <hyc.lee@gmail.com>, Carlos Maiolino <cem@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, linux-um@lists.infradead.org, 
	codalist@coda.cs.cmu.edu, coda@cs.cmu.edu, linux-mm@kvack.org, 
	ntfs@lists.linux.dev, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 5:43=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote=
:
>
> From: NeilBrown <neil@brown.name>
>
> lookup_one() is expected to be removed as it does not fit well with
> proposed changes to directory locking.
> Specifically d_alloc_parallel() will be ordered outside of i_rwsem
> and as iterate_shared() is called with i_rwsem held it is not safe
> to call d_alloc_parallel().
>
> We can instead call d_alloc_trylock() and then call the ->lookup, but
> that can fail if there is a lookup attempt concurrent with the
> readdir().
>
> ovl cannot afford for the lookup to fail as that could produce incorrect
> results, and it cannot safely drop i_rwsem temporarily as that could
> introduce races with handling of the directory cache.
>
> Instead we rely on the fact that ovl_iterate() has an exclusive lock on
> the directory, so any concurrent lookup will wait for the ovl_iterate()
> call to complete.  We allocate a separate dentry and if the lookup is
> successful, it is hashed with the result.

Please document this assumption with:

rwsem_assert_held_write(&dir->d_inode->i_rwsem);

and comment in the code. Having it in the git commit message is not
enough for future code reviewers.

Other than that, I have no further comments, but I would like
to have a review from Miklos before this patch lands, because
I don't remember him reviewing any of the revisions and this is subtle.
I am a bit concerned that we have no test coverage for this subtle code.

>
> When the concurrent lookup gets i_rwsem it mustn't do its own lookup -
> it must use the existing dentry.  This is found, if it exists, using
> try_lookup_noperm().
>
> Signed-off-by: NeilBrown <neil@brown.name>
> ---
>  fs/overlayfs/namei.c   | 12 ++++++++++++
>  fs/overlayfs/readdir.c | 26 ++++++++++++++++++++++++--
>  2 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
> index ca899fdfaafd..f56e33fd4d6b 100644
> --- a/fs/overlayfs/namei.c
> +++ b/fs/overlayfs/namei.c
> @@ -1385,6 +1385,7 @@ struct dentry *ovl_lookup(struct inode *dir, struct=
 dentry *dentry,
>         struct ovl_fs *ofs =3D OVL_FS(dentry->d_sb);
>         struct ovl_entry *poe =3D OVL_E(dentry->d_parent);
>         bool check_redirect =3D (ovl_redirect_follow(ofs) || ofs->numdata=
layer);
> +       struct dentry *alias;
>         int err;
>         struct ovl_lookup_ctx ctx =3D {
>                 .dentry =3D dentry,
> @@ -1399,6 +1400,17 @@ struct dentry *ovl_lookup(struct inode *dir, struc=
t dentry *dentry,
>         if (dentry->d_name.len > ofs->namelen)
>                 return ERR_PTR(-ENAMETOOLONG);
>
> +       /*
> +        * The existence of this in-lookup dentry might have forced
> +        * readdir to do the lookup with a new dentry.  If so we must
> +        * return that one.
> +        */
> +       alias =3D try_lookup_noperm(&QSTR_LEN(dentry->d_name.name,
> +                                           dentry->d_name.len),
> +                                 dentry->d_parent);
> +       if (alias && !IS_ERR(alias))
> +               return alias;
> +
>         with_ovl_creds(dentry->d_sb)
>                 err =3D ovl_lookup_layers(&ctx, &d);
>
> diff --git a/fs/overlayfs/readdir.c b/fs/overlayfs/readdir.c
> index e7fe29cb6028..bc41da4bace8 100644
> --- a/fs/overlayfs/readdir.c
> +++ b/fs/overlayfs/readdir.c
> @@ -574,8 +574,30 @@ static int ovl_cache_update(const struct path *path,=
 struct ovl_cache_entry *p,
>                 }
>         }
>         /* This checks also for xwhiteouts */
> -       this =3D lookup_one(mnt_idmap(path->mnt), &QSTR_LEN(p->name, p->l=
en), dir);
> -       if (IS_ERR_OR_NULL(this) || !this->d_inode) {
> +       this =3D d_alloc_trylock(dir, &QSTR_LEN(p->name, p->len));
> +       if (this =3D=3D ERR_PTR(-EWOULDBLOCK)) {
> +               /*
> +                * Some other thread is looking up this name and will
> +                * block on i_rwsem before it can complete the lookup.
> +                * We will do the lookup in a new dentry and when that
> +                * lookup gets a turn it will find and return this
> +                * dentry.
> +                */
> +               this =3D d_alloc_name(dir, p->name);
> +               if (!this)
> +                       this =3D ERR_PTR(-ENOMEM);
> +       }
> +       if (!IS_ERR(this) && d_unhashed(this)) {
> +               /* Either we got an in-lookup or we made our own unhashed=
 */
> +               struct dentry *alias =3D ovl_lookup(dir->d_inode, this, 0=
);
> +
> +               d_lookup_done(this);
> +               if (alias) {
> +                       dput(this);
> +                       this =3D alias;
> +               }
> +       }
> +       if (IS_ERR(this) || !this->d_inode) {
>                 /* Mark a stale entry */
>                 p->is_whiteout =3D true;
>                 if (IS_ERR(this)) {

How do you test your patch set? Do you have tests that exercise
parallel create/lookup/readdir?

It would be irresponsible to merge code without showing that the `alias`
branches have been exercised. Do you have an idea how to do that?

Thanks,
Amir.
