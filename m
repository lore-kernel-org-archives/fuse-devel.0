Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA5A1EEA54
	for <fuse-devel@lists.linux.dev>; Fri,  1 May 2026 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777629216; cv=pass; b=t4+ZPvFQW1Hw7r+/dSaDcQCwf/qxC/KYeh9WgmQYxXb55Pl5bP/ZiuTEXcVN0Fwn1pUtYSsA2J1Wbtg13dT13HtfEGaAaF8FOyNL+F07w8pQ5yb+EGwS3oILlybKc44JOeYf3HBQhYtlZwXs9XO1/x3CGwOZD3+iDZtnASqNG7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777629216; c=relaxed/simple;
	bh=pnCF7RKW/ZBea3QVIcE/BoVQI4fFbh72snkbEaZJQKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I91F+UC9WPJznebyA9+JcZFBbX/csDRkmqtlcQk4JWdAGSSgHAS00agGni2xO8cTvelD2E/LumxiLWttEXkKyawDIxZKkd8oPgMGSPNfp17yAkXiVuCmMvoQPIwzap+5E67NmLF7nleUbEGzSNBrgSkdJjSLbilKm3+fqXqg/Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sfl6Ilwm; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sfl6Ilwm"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso15898875e9.2
        for <fuse-devel@lists.linux.dev>; Fri, 01 May 2026 02:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777629212; cv=none;
        d=google.com; s=arc-20240605;
        b=GeHwvqLvJcI6p1nT+NQOajBvTVQebSbumbi6GZDr3I8vMilHENawfoYGf6TnN79h40
         Q3mOBh2jTo8hhJ5fCEw8IQEDxhpPjMo1fCc+6QBXOP3n6OnxVnJImu9edJ406VaSjtcu
         IZ6CyTpbvTeRUqe4v4pr7aJlgRr2B1lfNxNjTXyI1HWiosKlWDXRBf0bYT8YW/aUgwrR
         1iFRwhlPrjRfQlYDMBgro9sMeX5bAaJuLcEFSPztcxnZP+3a3exNfHPDSbbjr1KJHMvw
         VvrqzeJPggWnxSp3N070yrn4TcsEaSxTtjeNzeuhwgm0ThafPo9Br3CmSfnWp+UPy8T/
         hQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xL9mVkPxyTMqA24T0d3gnXjBA/spoHwfySHOCNQ006Y=;
        fh=I98+uZw/rTH0azZslGup4ezHrYnGO+Z37lt8W+1PCso=;
        b=Lys8hfBen/PdJeAb1EteePbHG7fo3JG0SCKs41eOBOBjcAL0V0Ot2EhnraRQXtx8Oh
         1VOQxEGoyj9BT7VaOfy3IrSoZXCH8i0QzmQv7DnX12UEj1Z4lTRdU7LICjklsrY4UeAV
         jLhSuyhFgs0TzOgmqyPAfZ73oyc+ITuiLsS6pCrqMHbh9H73NoZXCz7zqUkTYFXjwxu3
         qKn7KebkdJH/1SuDv6Ffv6GXJXL9G/3yF/sAQUr2mei7U3XerNbG0H/CVJFPrU9HltdV
         XK2OzY81gUagmoicGmrg87HKFGn5D/+e4sBqG29Vggcbwh2r5yy3UE8cIPLYPMD32ZYt
         nKwA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629212; x=1778234012; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xL9mVkPxyTMqA24T0d3gnXjBA/spoHwfySHOCNQ006Y=;
        b=Sfl6IlwmyRhtayh1hAstkowmjDTqvLLyNQxbymzT3fk5XdGu4czxy+iv7PXXFDer6b
         fjbCQ09+jkxghkqalW7hBTggbSF4Oz2Pp31t5G6XqPZGmpgtxKtCuweBwuD24UT573T5
         lYp1tvJa2eP1qG4/h2KlgXAiTU8ubkvKcT861cSpFDETrWVfzuECS4Y7uO7uUxZH87Ul
         r4p4yi+hJtTwjXqMUF8XwY8VLkWnN5GgjgxcPEF1QWrDDSvES4tay1VepGLMw+C5hwdY
         1UUd+ozoVwRHExwLHzU6Az4EcRYD6YJV8/xgjJPjt0cwX0bcFdJO9a9t9wiFckNIs2k7
         yDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629212; x=1778234012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xL9mVkPxyTMqA24T0d3gnXjBA/spoHwfySHOCNQ006Y=;
        b=jxcOZmXPWoUa/sKulocgRqvEgjU8GaflkFPjlYVDDgxDrmlNDlAwTrxX2uOClYRM2D
         TvVCVU08rkZJcRr42NystR+I4v0vGFuAS91oDCn2afzl/IGNTQolPbJ77I+FHvAitC4D
         DGz8OXYof2Qi0n7QU9RAXmKjUtAy7pZjv0gGxsabqanWOFdksau71z/jQvT/bfawQq6w
         MWoiyS24gFuiCDZJg4ICsY1Jvl76yxQlp+ZgAOK/afyjQxB4fK6YZBSEuMIIGjsAlIZ/
         6vO7UD/FKcdWrryF1MMDJwMEQQ4eE0Q+GCcYX5HPYXX/fhxVRM4l6Ja3H6Pa7XE02vVp
         NDtg==
X-Forwarded-Encrypted: i=1; AFNElJ+EjfocsIh5RwKIDQ6mbJAuKWV83kI74VFOiV/v23hE/sDrPkvd2JysdMVQkSPrhdokkxQ40RC5ahmJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzwbjLqY8EewJwHUrJK/KdVcTRyBMQX6lZBeSsImwlHoHRJV1/M
	GyMlKcCTHuKR/1IcqtV6tCrWTT7D1NdKy3gRhX6Dr+dRSJQ+o/vzORvjvBJWtRI7ctn/Jxrczhn
	kvZqpAN/Y/5NSCU/W9UE0nJo92BZRllc=
X-Gm-Gg: AeBDieuVBhMrYpPmsE7TGk6OAobCt1CNf7oHyHXKX85ATeJDSpPThILk8a/CuJ9k19T
	yo8wjp+uXWnKQoyduSmhJcVt4p1C1BVPkZZsWZhmjHdiiy2oVoQgzVGjKs2cKRNDo0WRhCL+xp3
	JVSml0w2YmPy+WZntN+hjOq0xRWGVc+BBrpTdX9FdBmxmWsyNY7sdMnfp4Ogz/DljQBi8tlEFgr
	3k4SUIh6ZQFEVPOeTabNTxPGAt/00/evDLY7wlTAEjHNLDmnPnKUUEcX8BZUJay3DYqyfMx8FbO
	KzNmECdyEDaztIJWZ8Q=
X-Received: by 2002:a05:600c:c086:b0:489:1fa5:997f with SMTP id
 5b1f17b1804b1-48a8eb6bf02mr25197125e9.9.1777629211898; Fri, 01 May 2026
 02:53:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177747203969.4101397.1905820467457875817.stgit@frogsfrogsfrogs>
 <177747204051.4101397.16466232272715875212.stgit@frogsfrogsfrogs>
 <CAJnrk1bYYBf2qYBvhv=MFKvG-2VekKwHCuRS6tjva=tExw6Gdw@mail.gmail.com> <20260430205731.GV7739@frogsfrogsfrogs>
In-Reply-To: <20260430205731.GV7739@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 1 May 2026 10:53:20 +0100
X-Gm-Features: AVHnY4IcyjwgT_beDnjwb1HgtmHdIEhuwAm6TNcJqefjCh9ew0C4iwMvZS1ltcM
Message-ID: <CAJnrk1YCXxXvd7vgTm5vhbHOJCiW=FGWkMNQLzGPh5PHdZpvpw@mail.gmail.com>
Subject: Re: [PATCH 3/4] fuse: update file mode when updating acls
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, neal@gompa.dev, linux-fsdevel@vger.kernel.org, 
	bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 9:57=E2=80=AFPM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> On Thu, Apr 30, 2026 at 02:48:29PM +0100, Joanne Koong wrote:
> > On Wed, Apr 29, 2026 at 3:22=E2=80=AFPM Darrick J. Wong <djwong@kernel.=
org> wrote:
> > >
> > > From: Darrick J. Wong <djwong@kernel.org>
> > >
> > > If someone sets ACLs on a file that can be expressed fully as Unix DA=
C
> > > mode bits, most local filesystems will then update the mode bits and
> > > drop the ACL xattr to reduce inefficiency in the file access paths.
> > > Let's do that too.  Note that means that we can setacl and end up wit=
h
> > > no ACL xattrs, so we also need to tolerate ENODATA returns from
> > > fuse_removexattr.
> > >
> > > Note that here we define a "local" fuse filesystem as one that uses
> > > fuseblk mode; we'll shortly add fuse servers that use iomap for the f=
ile
> > > IO path to that list.
> > >
> > > Signed-off-by: "Darrick J. Wong" <djwong@kernel.org>
> > > ---
> > >  fs/fuse/fuse_i.h |    2 +-
> > >  fs/fuse/acl.c    |   56 ++++++++++++++++++++++++++++++++++++++++++++=
+++-------
> > >  2 files changed, 50 insertions(+), 8 deletions(-)
> > >
> > >
> > > diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> > > index 4c135a7edf54ac..0bcfb42592895c 100644
> > > --- a/fs/fuse/fuse_i.h
> > > +++ b/fs/fuse/fuse_i.h
> > > @@ -1050,7 +1050,7 @@ static inline struct fuse_mount *get_fuse_mount=
(struct inode *inode)
> > >         return get_fuse_mount_super(inode->i_sb);
> > >  }
> > >
> > > -static inline struct fuse_conn *get_fuse_conn(struct inode *inode)
> > > +static inline struct fuse_conn *get_fuse_conn(const struct inode *in=
ode)
> > >  {
> > >         return get_fuse_mount_super(inode->i_sb)->fc;
> > >  }
> > > diff --git a/fs/fuse/acl.c b/fs/fuse/acl.c
> > > index cbde6ac1add35a..bee8a9a734f50a 100644
> > > --- a/fs/fuse/acl.c
> > > +++ b/fs/fuse/acl.c
> > > @@ -11,6 +11,18 @@
> > >  #include <linux/posix_acl.h>
> > >  #include <linux/posix_acl_xattr.h>
> > >
> > > +/*
> > > + * If this fuse server behaves like a local filesystem, we can imple=
ment the
> > > + * kernel's optimizations for ACLs for local filesystems instead of =
passing
> > > + * the ACL requests straight through to another server.
> >
> > nit: "to the server" instead of "to another server"? another server
> > sounds like there's 2 servers
> >
> > > + */
> > > +static inline bool fuse_inode_has_local_acls(const struct inode *ino=
de)
> > > +{
> > > +       const struct fuse_conn *fc =3D get_fuse_conn(inode);
> > > +
> > > +       return fc->posix_acl && fuse_inode_is_exclusive(inode);
> > > +}
> > > +
> > >  static struct posix_acl *__fuse_get_acl(struct fuse_conn *fc,
> > >                                         struct inode *inode, int type=
, bool rcu)
> > >  {
> > > @@ -98,6 +110,8 @@ int fuse_set_acl(struct mnt_idmap *idmap, struct d=
entry *dentry,
> > >         struct inode *inode =3D d_inode(dentry);
> > >         struct fuse_conn *fc =3D get_fuse_conn(inode);
> > >         const char *name;
> > > +       umode_t mode =3D inode->i_mode;
> > > +       const bool local_acls =3D fuse_inode_has_local_acls(inode);
> > >         int ret;
> > >
> > >         if (fuse_is_bad(inode))
> > > @@ -113,14 +127,25 @@ int fuse_set_acl(struct mnt_idmap *idmap, struc=
t dentry *dentry,
> > >         else
> > >                 return -EINVAL;
> > >
> > > +       /*
> > > +        * If the ACL can be represented entirely with changes to the=
 mode
> > > +        * bits, then most filesystems will update the mode bits and =
delete
> > > +        * the ACL xattr.
> > > +        */
> > > +       if (acl && type =3D=3D ACL_TYPE_ACCESS && local_acls) {
> > > +               ret =3D posix_acl_update_mode(idmap, inode, &mode, &a=
cl);
> > > +               if (ret)
> > > +                       return ret;
> > > +       }
> > > +
> > >         if (acl) {
> > >                 unsigned int extra_flags =3D 0;
> > >                 /*
> > > -                * Fuse userspace is responsible for updating access
> > > -                * permissions in the inode, if needed. fuse_setxattr
> > > -                * invalidates the inode attributes, which will force
> > > -                * them to be refreshed the next time they are used,
> > > -                * and it also updates i_ctime.
> > > +                * For non-local filesystems, fuse userspace is respo=
nsible for
> > > +                * updating access permissions in the inode, if neede=
d.
> > > +                * fuse_setxattr invalidates the inode attributes, wh=
ich will
> > > +                * force them to be refreshed the next time they are =
used, and
> > > +                * it also updates i_ctime.
> > >                  */
> > >                 size_t size;
> > >                 void *value;
> > > @@ -137,9 +162,10 @@ int fuse_set_acl(struct mnt_idmap *idmap, struct=
 dentry *dentry,
> > >                 /*
> > >                  * Fuse daemons without FUSE_POSIX_ACL never changed =
the passed
> > >                  * through POSIX ACLs. Such daemons don't expect setg=
id bits to
> > > -                * be stripped.
> > > +                * be stripped, unless they've explicitly told the ke=
rnel to
> > > +                * take care of that.
> >
> > nit: imo this would be clearer as its own sentence, eg "For local
> > filesystems, the kernel already handled sgid stripping in
> > posix_acl_update_mode() above".
> >
> > >                  */
> > > -               if (fc->posix_acl &&
> > > +               if (fc->posix_acl && !local_acls &&
> > >                     !in_group_or_capable(idmap, inode,
> > >                                          i_gid_into_vfsgid(idmap, ino=
de)))
> > >                         extra_flags |=3D FUSE_SETXATTR_ACL_KILL_SGID;
> > > @@ -148,6 +174,22 @@ int fuse_set_acl(struct mnt_idmap *idmap, struct=
 dentry *dentry,
> > >                 kfree(value);
> > >         } else {
> > >                 ret =3D fuse_removexattr(inode, name);
> > > +               /* If the acl didn't exist to start with that's fine.=
 */
> > > +               if (ret =3D=3D -ENODATA)
> > > +                       ret =3D 0;
> > > +       }
> > > +
> > > +       /* If we scheduled a mode update above, push that to userspac=
e now. */
> > > +       if (!ret) {
> > > +               struct iattr attr =3D { };
> > > +
> > > +               if (mode !=3D inode->i_mode) {
> > > +                       attr.ia_valid |=3D ATTR_MODE;
> > > +                       attr.ia_mode =3D mode;
> > > +               }
> > > +
> > > +               if (attr.ia_valid)
> > > +                       ret =3D fuse_do_setattr(idmap, dentry, &attr,=
 NULL);
> >
> > maybe something like this is clearer?
> >
> >     if (!ret && mode !=3D inode->i_mode) {
> >          struct iattr attr =3D {
> >                 .ia_valid |=3D ATTR_MODE,
> >                 .ia_mode =3D mode,
> >           };
> >          ret =3D fuse_do_setattr(idmap, dentry, &attr, NULL);
> >     }
>
> I know, you said that last time ;)
> https://lore.kernel.org/linux-fsdevel/CAJnrk1YL3KnON-WtNjNi+2GZ+6rYvnVUnY=
wCk5efv0o41XkxcA@mail.gmail.com/
>
> and my reply is the same:
> https://lore.kernel.org/linux-fsdevel/20260325222308.GH6202@frogsfrogsfro=
gs/#t

Fair enough, I'd forgotten the conversation from v7.

Also btw, I think there's the edge case where if the fuse_removexattr
succeeds but the fuse_do_setattr() fails, then the acl would have been
removed but the mode bits weren't updated. Maybe reordering it for
that case so that the mode update happens first before the xattr
removal would be safer (eg if the xattr removal fails, the old acl is
still there to enforce permissions)?

Thanks,
Joanne

>
> ...which is to say, does anyone think that's worth the churn?
>
> >
> > Overall, this lgtm though.
> >
> > Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
>
> Thanks!
>
> --D
>
> > Thanks,
> > Joanne
> >
> > >         }
> > >
> > >         if (fc->posix_acl) {
> > >
> >
