Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1036A294A10
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 08:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018823; cv=pass; b=mzzohVx7ItB7fWmDx89KUIIctqAUJB4HnLHXlApSFqRgtCF2HtADusaC7IaMUgkWBhCeQP1MIS8BpLRzcuSr30ZtTMuvhUU2iCm9FVQEp2aX/OhWSwh2OmffXzC05Kn8gu8l8SWTvfMDmjfVsWA1KedAG4wntasiIPWmi17KLsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018823; c=relaxed/simple;
	bh=hwzhngHx3WDums5Qh6fK6pEHMManwzAsB4ypDhDbR1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sEWjh2kQbICzME2NcicBmd1MFpKS2mjyGxAIxuJxbW35auMiL3Hw9xCR/aMt90pcKykmUVGakr3et3OyKxPjFksG01DbabybKRxwNTLcWraBakE0QiihdgwfAYy0NilLk/CQ0cU7OAVpn2xFgfPHceOLBpKi57aAuh4zR+WL2KQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVZ9ZpOE; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVZ9ZpOE"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so13539055a12.2
        for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777018820; cv=none;
        d=google.com; s=arc-20240605;
        b=jlqO7gdX9eIaZwKobyySYL1iFXouYvBbwFkJsv4M8sisrZupRvPr/vlKkWBRFGpTUq
         OKlGZsixor8So2ZLKfmopEq0osEnBFqlB7UDr6jqbHh7Esd2P7+QDSwaoVPOBJu/H5Lp
         d45zDodMZZo1fOsOimjSkb7EBU5PU4BywuE1bxHcUnkaqPch45knX3ZS8sLIk6cyyy8o
         +ub1GwbnQ5ll0HD+aprMTLg/BN4V9Xb+6XxnTIulb8x5svrr36Tv2eIY6oWy+6Y5jI+M
         JHRiF5uNKbMuqbWBvWzNmmHANAcIb5+m/Ei0v70c0N1WEGBhQmBdKGbneBu23xxqMBbB
         o2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5LQxkfkNSSnHjZIdtI3mN7K4E9Z4SQnBx3T8i1gkRyw=;
        fh=9UhBPq1VjEyon6I4m/kqMHBG6HSxGJdjU9fTcR5Zyxk=;
        b=KfFac3hx3y5wGhf8sgOWFXWbzyK5AD/+SNa+QAzNZ1PDSaQphUX4T9JfH42S7n1g01
         +bSueFMky/lTgy8/1vk+Cx2dVRjL5a7Ljgq5GaxCt6vCUyDKndw5cRcp+F9EzjLvosfE
         O6m5GCOul7HWscT2sdW4UhDRcY6SrtzWO5pGotIqtHxXhgW45+8cimiRLxywJMOz7Lj8
         ksb86Kg/KJiw2VR/ueyhMhvp3sHa1txRW3O/NM35YftO+vnSBlZK4MdeDNgLvNMqmieP
         UZH50zqR7qaXG6EORTXit++IN11yZpzMLt0TQ59Mwm1j2cOrdO5uh7cb2y5YhW+pnqUO
         /gnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777018820; x=1777623620; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LQxkfkNSSnHjZIdtI3mN7K4E9Z4SQnBx3T8i1gkRyw=;
        b=XVZ9ZpOE4fX/8irbLIJphBXfULnoJcKMZfG4/8eWSAYftX2ydpWUy1Z+1o4bRbJqXS
         vGXFKyRk5lSwxcM0eyZyJWk4MrTbyFphh0wGydGCKvzCo5D3JmPQm+UnvslEmcuhfNX5
         u6XnPecr/jWH8MjGtRJ6eN3ZLg5Aq666SKHN4SKgCOu/LEiAHUnnrKyyFUYQSD16ss+m
         y1OypZ0lDaFJQ+UCN4Fz3QoxzZgaCb5fdLarWVX6DK4FiNED/A0AroQO966s7kSDcz++
         axOtMqzkFdS4b+A0kHjXNbxNErpDnnOuLyuO4TXKJaSr8vC94LQBwtlr5B5o6LaI3JTI
         36pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018820; x=1777623620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5LQxkfkNSSnHjZIdtI3mN7K4E9Z4SQnBx3T8i1gkRyw=;
        b=O3fXUEipffdwXJwTXMwFu50dL92gXh7sTvsmUg1JK83WNDf+6fzWqqfNIq1oAh5Qfh
         LyBjYLyYR3HtPdnFnX9ZIQLdnEtYQj3t8D3VgR8LY/xTEOT4XniD/U6XQzhzaJZIlXlN
         Nmy/pjRsd5zQyg64S2FsSopYX97nGKd6aX22kBDdKOb2HR/wHp2JCTjzG/Ynf8sVCLot
         l+KDnaSjsZtjjJ1WyditZLum1rgLmzIbhZ2S5WBEaGAYrbN3pQxdMw7Igg/P9y7XqOUQ
         +Q75r1gFXQM5x6/0aDzwqXCKXHVfKc6Bom48D7f9Acb+foRaTS+hlG/iyjOcPll5/Cpp
         s0Fg==
X-Forwarded-Encrypted: i=1; AFNElJ9MPu++3IRyJ6KQSpbru0t9jAJT96g2n/ZlfCwh9N/hR2yRjLzmuLfYI+q4HQrjUY+wkMMnvD8QubPn@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1vMNl6N9ushbQTy4UNFwcZ7WrGAuqnQACjonbwptqOhSVTN5S
	rQq7Q6zYMSZwa23lARbNF2cFPi4utMiTjssiFpvBlyw2uvoXpbV/FrjNBxruJOrS0csu89Ex2Sx
	b3BFLy8Yz5DLg34cBkBkfGdq/h+LIDR0=
X-Gm-Gg: AeBDietTjnQbRjXjljKdJ/UloXPsEu8iLlQqh5jYsqPnZs3UxlP8D5TU7FU4d50GV1z
	LebD1see2BB6G6yEftqkZ/9xBXWv3WbBOrpEJo1jso6ZUear1pO2zvun44TUQgAsxLKWCbaalzD
	M4EQxzUc1tQnybTHgIvnKDn+RfVsBJ6FAn8zyexL3mAALkbPzZNrPyJCjQbQiWRgXJpI4uzu/dN
	yA/MsvgSSHL/KvTQNKb0L0X5HdPsz56ka0N/BOdDpfOj2r+6KsLdmeIYR5ctc3f7kLlgRcoa6KM
	7WM8z6MLUqzqjLeAhEWv0Sf2TS7KK2eOJTEn0NJVMv24Occ3AKjy
X-Received: by 2002:a17:907:1c91:b0:b9c:6ef1:ed14 with SMTP id
 a640c23a62f3a-ba41e4fc65bmr1771769466b.36.1777018819958; Fri, 24 Apr 2026
 01:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424011646.457682-1-joannelkoong@gmail.com> <20260424011646.457682-5-joannelkoong@gmail.com>
In-Reply-To: <20260424011646.457682-5-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 24 Apr 2026 10:20:08 +0200
X-Gm-Features: AQROBzBv72q7zbMEpti-Kb0rfMgwFjUuv1-rXVw3OWEWws47NvSeH7yUecxddNg
Message-ID: <CAOQ4uxjKX2j0aAWHnCqhEK34ON7Hh0euUHqrPi-oR0kj_2dJsw@mail.gmail.com>
Subject: Re: [PATCH v1 04/13] fuse: clean up fuse_dentry_revalidate()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 3:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> Remove gotos with direct returns and flatten nested if/else structure.
> No functional changes.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> Cc: Amir Goldstein <amir73il@gmail.com>
> ---
>  fs/fuse/dir.c | 114 ++++++++++++++++++++++++--------------------------
>  1 file changed, 54 insertions(+), 60 deletions(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 112d979c49c5..c5b3cb001147 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -386,72 +386,32 @@ static int fuse_dentry_revalidate(struct inode *dir=
, const struct qstr *name,
>                                   struct dentry *entry, unsigned int flag=
s)
>  {
>         struct inode *inode;
> -       struct fuse_mount *fm;
>         struct fuse_conn *fc;
>         struct fuse_inode *fi;
> +       struct fuse_entry_out outarg;
> +       struct fuse_forget_link *forget;
> +       FUSE_ARGS(args);
> +       bool automount_changed;
> +       u64 attr_version;
> +       bool need_reval;
>         int ret;
>
>         fc =3D get_fuse_conn_super(dir->i_sb);
>         if (entry->d_time < atomic_read(&fc->epoch))
> -               goto invalid;
> +               return 0;
>
>         inode =3D d_inode_rcu(entry);
>         if (inode && fuse_is_bad(inode))
> -               goto invalid;
> -       else if (time_before64(fuse_dentry_time(entry), get_jiffies_64())=
 ||
> -                (flags & (LOOKUP_EXCL | LOOKUP_REVAL | LOOKUP_RENAME_TAR=
GET))) {
> -               struct fuse_entry_out outarg;
> -               FUSE_ARGS(args);
> -               struct fuse_forget_link *forget;
> -               u64 attr_version;
> -
> -               /* For negative dentries, always do a fresh lookup */
> -               if (!inode)
> -                       goto invalid;
> -
> -               ret =3D -ECHILD;
> -               if (flags & LOOKUP_RCU)
> -                       goto out;
> +               return 0;
>
> -               fm =3D get_fuse_mount(inode);
> +       need_reval =3D time_before64(fuse_dentry_time(entry), get_jiffies=
_64()) ||
> +                (flags & (LOOKUP_EXCL | LOOKUP_REVAL | LOOKUP_RENAME_TAR=
GET));
>
> -               forget =3D fuse_alloc_forget();
> -               ret =3D -ENOMEM;
> -               if (!forget)
> -                       goto out;
> -
> -               attr_version =3D fuse_get_attr_version(fm->fc);
> -
> -               fuse_lookup_init(&args, get_node_id(dir), name, &outarg);
> -               ret =3D fuse_simple_request(fm, &args);
> -               /* Zero nodeid is same as -ENOENT */
> -               if (!ret && !outarg.nodeid)
> -                       ret =3D -ENOENT;
> -               if (!ret) {
> -                       fi =3D get_fuse_inode(inode);
> -                       if (outarg.nodeid !=3D get_node_id(inode) ||
> -                           (bool) IS_AUTOMOUNT(inode) !=3D (bool) (outar=
g.attr.flags & FUSE_ATTR_SUBMOUNT)) {
> -                               fuse_chan_queue_forget(fm->fc->chan, forg=
et,
> -                                                 outarg.nodeid, 1);
> -                               goto invalid;
> -                       }
> -                       spin_lock(&fi->lock);
> -                       fi->nlookup++;
> -                       spin_unlock(&fi->lock);
> -               }
> -               kfree(forget);
> -               if (ret =3D=3D -ENOMEM || ret =3D=3D -EINTR)
> -                       goto out;
> -               if (ret || fuse_invalid_attr(&outarg.attr) ||
> -                   fuse_stale_inode(inode, outarg.generation, &outarg.at=
tr))
> -                       goto invalid;
> +       /* For negative dentries that need revalidation, always do a fres=
h lookup */
> +       if (!inode)
> +               return need_reval ? 0 : 1;
>
> -               forget_all_cached_acls(inode);
> -               fuse_change_attributes(inode, &outarg.attr, NULL,
> -                                      ATTR_TIMEOUT(&outarg),
> -                                      attr_version);
> -               fuse_change_entry_timeout(entry, &outarg);
> -       } else if (inode) {
> +       if (!need_reval) {
>                 fi =3D get_fuse_inode(inode);
>                 if (flags & LOOKUP_RCU) {
>                         if (test_bit(FUSE_I_INIT_RDPLUS, &fi->state))
> @@ -459,14 +419,48 @@ static int fuse_dentry_revalidate(struct inode *dir=
, const struct qstr *name,
>                 } else if (test_and_clear_bit(FUSE_I_INIT_RDPLUS, &fi->st=
ate)) {
>                         fuse_advise_use_readdirplus(dir);
>                 }
> +
> +               return 1;
>         }
> -       ret =3D 1;
> -out:
> -       return ret;
>
> -invalid:
> -       ret =3D 0;
> -       goto out;
> +       if (flags & LOOKUP_RCU)
> +               return -ECHILD;
> +
> +       forget =3D fuse_alloc_forget();
> +       if (!forget)
> +               return -ENOMEM;
> +
> +       attr_version =3D fuse_get_attr_version(fc);
> +
> +       fuse_lookup_init(&args, get_node_id(dir), name, &outarg);
> +       ret =3D fuse_simple_request(get_fuse_mount(inode), &args);
> +       if (ret || !outarg.nodeid) {
> +               kfree(forget);
> +               return (ret =3D=3D -ENOMEM || ret =3D=3D -EINTR) ? ret : =
0;
> +       }
> +
> +       automount_changed =3D
> +               !!IS_AUTOMOUNT(inode) !=3D !!(outarg.attr.flags & FUSE_AT=
TR_SUBMOUNT);

I am not sure that this help var is really useful?
It is used just once in the next line and its name does not clarify
something that needs to be clarified.

> +
> +       if (outarg.nodeid !=3D get_node_id(inode) || automount_changed) {
> +               fuse_chan_queue_forget(fc->chan, forget, outarg.nodeid, 1=
);
> +               return 0;
> +       }
> +       fi =3D get_fuse_inode(inode);
> +       spin_lock(&fi->lock);
> +       fi->nlookup++;
> +       spin_unlock(&fi->lock);
> +
> +       kfree(forget);

Nit: line spacing is weird.
I would do this kfree before the nlookup++ block.

> +       if (fuse_invalid_attr(&outarg.attr) ||
> +           fuse_stale_inode(inode, outarg.generation, &outarg.attr))
> +               return 0;
> +
> +       forget_all_cached_acls(inode);
> +       fuse_change_attributes(inode, &outarg.attr, NULL, ATTR_TIMEOUT(&o=
utarg),
> +                              attr_version);
> +       fuse_change_entry_timeout(entry, &outarg);
> +       return 1;
>  }
>

Apart from the nits, feel free to add:
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.
