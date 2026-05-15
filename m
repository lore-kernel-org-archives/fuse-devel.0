Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311EC3EDACD
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 21:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881417; cv=pass; b=KFTrzpbS4SuShDEzHZJSzSsPQflwjVK8ryj2PGrgdVpUtmNXTqeuMiwVHN3/+s0YzqU0SLKsDNlGRS4QscYpjgpBl0vdYC6zz5XQ2nMoGB6AcQ01hRGkE91skoVlS1zkVHKClZaIrrJsdlw2N7NgmTOHtwgZ09W9ORSRme89Deg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881417; c=relaxed/simple;
	bh=Q0CM9CcP2qsJx8ZTNz96giUIPG82DA4jHkT34z88mlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBpJ3ons54OdJYFL87Jqg3wG8eiSGltAQv64AAtbHuYKOWBRz1P8fOlk5t8nJdJPeu3q1umAsdO0Js7SzBcQ9aU5GdE+mjXw1k9XjlXSvIxTN5s5JMjOXeeGPqtA/7yR4iYcE8iDlVUmks87oPfx0aUiX45XaK0ZZmIyb3Ip5yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBSuTYs1; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBSuTYs1"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso496694a12.0
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 14:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778881415; cv=none;
        d=google.com; s=arc-20240605;
        b=kYqtJhTcvtXHhAGdaUZhMP/LiQZdZVtvnrjHu3bpdO+icgdteBWAXC4pT++lqpkT8w
         Yfgvo0QpFMPNE4EugrA/pYCjJfPEyunKouWetWxuUIFQ9SSbeFRR4aE+SQTeF/LdIl2F
         e8AJh8EzwWMyXV1M2CMzKnd/2BfXy42taOuuudI1/Q0aNtmj7Lm6cb4CZRV+u7Sc2G2g
         iHOOtBxP03FBEo8hSy9FV7prwJANTK8/uiGAySyZbVvfeN4ToIZrQxa96pg4zELxe7cs
         /9A3rOpnSTZlcUEUAZi8F+QFq4MfK+cUIr4bDtVji2S+wUsd7bCp0pPfKWHjsUANrqD2
         pUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4K0dPW2QPPaLp7VmZFFIc9zXTxDqaqGxzNB77scsbfI=;
        fh=i95lqT/F9WJQKLg9qbsArs3MqiwMQpw1/TIn0b94mME=;
        b=CPG2Vjot+ZiwIZ3FDEYQo3TYjqnHbkCK6gsv2wJjBtpFoicAOt2sAVjQKtaCb62nl8
         9zbo1w3+TXdh1H0gnVmdEqNI7vtIt+kYHEBZgF2AjK05O2guu2F9Cq5h6FY0YCfJiZYY
         aoA8XAKtG8UK+Xho5V26vzIE6pZaWmk4nqSPfbaiqDNWoiMTs51EZZLTh3KMwIPle7Ds
         yVrGAEg+HNEr/unClN5Z3DELxmqKp/ykFauTb8Im9w8hL+OTW4wKf+6XXeNGOq3Z6PnO
         HhS28PvzY47iGk5kunoVxZjKv/SdXXQ+6MLBoKDu2fWJbAHc7jvgWHJnk92ua0p6Y3pF
         7Alg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778881415; x=1779486215; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4K0dPW2QPPaLp7VmZFFIc9zXTxDqaqGxzNB77scsbfI=;
        b=UBSuTYs1cFTym1FjnAdJQ0vifeXu5nndFs5RU0YHPGMg6jdCG7tb3SfGy1jYfyoyYY
         msDCo+KwAYnMVv8jJlzI0Ga6XLznad7t9tPcLdAq2hxeo5wkywyd0WDc/gf8llmZ8iZf
         Dc7sAzO53wjeAqDOkNnOpPVN93EbqdbqqjqhU9l2i/FdYL5lMc9j/VVrPuwhLjL7anbV
         VIE94sjKKj/jQVDWsJCRhxhKalu4UmkDEUyFWJfEo+T3jGrSHer0RACixDjDv6+s5BuD
         DmI7uy/eBaxbXMIARPtGwE9XFI9Mv1QCSrHgIiTXBcsJhm9BakgnGqqIMjWWRVtZOfFU
         Hkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778881415; x=1779486215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4K0dPW2QPPaLp7VmZFFIc9zXTxDqaqGxzNB77scsbfI=;
        b=J9oDBo8pSImADU87/K+snwGosjot5ck/4jUrujYwlMdgKnSQpMQOvoOz6RTp0CyyBC
         WgCwoiRZnoX1kqNvr6wWn6+ivRr6Y4MpkvlwtN7mkSUqCabZK4ySFB7J+9JehL/ihuSP
         mBZ/lZEDnhdgylrmlgdFBL69H82RtOQ8vFM33AhT2BEBgXUGPbh3i+CLvPNyXOJQDexg
         t3DNgVUAJYuQiMQlVJwi3ux3upDdRBpq5Fx9fcDDOM67Jx6QyyXnqI3BaJEVi5VjrwF9
         rsUxybqTaXtwNCAe5dxuzCboCm0Kk1/guja6/7kmvp+L2+Y3oSIckZDfw1CQBGjXul3k
         yMwg==
X-Forwarded-Encrypted: i=1; AFNElJ9edrADACfx0QfWjcPnARqynBF3lyh1j33jmtsxUZhZVWnQzugrAWDnRlq1U3xQlXvhU5A9H9T+BMKH@lists.linux.dev
X-Gm-Message-State: AOJu0YwyzOLip3nt3LFgbKgWvQGCF7RIy3XUPDOxEnwz8QbPtaLiSUJG
	ecCav7hRMOSR1ezb1CMh5//2sLZb+Jl2Jtq0KT1UeYPetI3SWX7oOp8RrEKbDTf/ZHKWHwOutwv
	8Yj519LptTXwrPBG+O+tsdtP0CQ25us8=
X-Gm-Gg: Acq92OHrZLzSwvO1gf2f3Lt6iGJF1dJshZM7ccXZpsEW5qsg/D1vHFQ6H9vkNWfSf1/
	QS+Ze55QNwdNTYc7y3kwDZjnJ+yW9A4l8oMQIWeHH6E7ShjTbeDGK7PvftyFyGJeHueUpXeJkQ3
	RwANwGKIeWbHt6LslovGiUcaZ7pdwIhN6IAAcZTT1pO8MUG2JI2DivvH9wPWMfre8nygXiW8HXO
	hPevHzRk5d+HqLzkUetrReZ34Kt8zCpK7FccqxcMCLf8iwwIxrtoN7MRd3Z/EK/Dj9bart00jUK
	22gYxrjVFQobVv6YoFoXohECS1q9BJSnUGXOt3exn6DZs0iS4jXm
X-Received: by 2002:a05:6402:3510:b0:67f:7e9b:afe8 with SMTP id
 4fb4d7f45d1cf-683bc5bdb08mr2947889a12.6.1778881414446; Fri, 15 May 2026
 14:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177747206436.4103309.9048553717124547447.stgit@frogsfrogsfrogs>
 <177747206617.4103309.9491664333731079107.stgit@frogsfrogsfrogs> <20260514221847.GL9544@frogsfrogsfrogs>
In-Reply-To: <20260514221847.GL9544@frogsfrogsfrogs>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 15 May 2026 23:43:23 +0200
X-Gm-Features: AVHnY4Lo33sQrExWGKxaR_cAZTJSjaGP-L92Ukdt5ubczf1SkIvoAriEDI8DfUw
Message-ID: <CAOQ4uxgU7Gsqd3H7v=izpm8Wbjrc7Qzv_BHzB8WQNpg=X4oMvQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] fuse: let the kernel handle KILL_SUID/KILL_SGID for
 iomap filesystems
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, joannelkoong@gmail.com, neal@gompa.dev, 
	linux-fsdevel@vger.kernel.org, bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 12:18=E2=80=AFAM Darrick J. Wong <djwong@kernel.org=
> wrote:
>
> On Wed, Apr 29, 2026 at 07:34:38AM -0700, Darrick J. Wong wrote:
> > From: Darrick J. Wong <djwong@kernel.org>
> >
> > Let the kernel handle killing the suid/sgid bits because the
> > write/falloc/truncate/chown code already does this, and we don't have t=
o
> > worry about external modifications that are only visible to the fuse
> > server (i.e. we're not a cluster fs).
> >
> > Signed-off-by: "Darrick J. Wong" <djwong@kernel.org>
> > ---
> >  fs/fuse/dir.c |   11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index 61015e83888ee4..e664a60200ee26 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -2477,6 +2477,7 @@ static int fuse_setattr(struct mnt_idmap *idmap, =
struct dentry *entry,
> >       struct inode *inode =3D d_inode(entry);
> >       struct fuse_conn *fc =3D get_fuse_conn(inode);
> >       struct file *file =3D (attr->ia_valid & ATTR_FILE) ? attr->ia_fil=
e : NULL;
> > +     const bool is_iomap =3D fuse_inode_has_iomap(inode);
> >       int ret;
> >
> >       if (fuse_is_bad(inode))
> > @@ -2485,15 +2486,19 @@ static int fuse_setattr(struct mnt_idmap *idmap=
, struct dentry *entry,
> >       if (!fuse_allow_current_process(get_fuse_conn(inode)))
> >               return -EACCES;
> >
> > -     if (attr->ia_valid & (ATTR_KILL_SUID | ATTR_KILL_SGID)) {
> > +     if (!is_iomap &&
> > +         (attr->ia_valid & (ATTR_KILL_SUID | ATTR_KILL_SGID))) {
> >               attr->ia_valid &=3D ~(ATTR_KILL_SUID | ATTR_KILL_SGID |
> >                                   ATTR_MODE);
> >
> >               /*
> >                * The only sane way to reliably kill suid/sgid is to do =
it in
> > -              * the userspace filesystem
> > +              * the userspace filesystem if this isn't an iomap file. =
 For
> > +              * iomap filesystems we let the kernel kill the setuid/se=
tgid
> > +              * bits.
> >                *
> > -              * This should be done on write(), truncate() and chown()=
.
> > +              * This should be done on write(), truncate(), chown(), a=
nd
> > +              * fallocate().
>
> FWIW Codex noticed that in iomap mode we still send FATTR_KILL_SUIDGID
> even though we claim the kernel is supposedly handling the mode
> stripping for us.  Granted I've been starting to suspect that some of
> these file attribute related things ought to be gated on exclusive mode
> and not iomap mode.  Will have to do a comprehensive review when I get
> through the current round of bot complaints.

As I told Joanne in PASSTHROUGH_INO review
https://lore.kernel.org/fuse-devel/CAOQ4uxipQJt5zskb_THxueGi_MXpFdywFiGpd_n=
mWeY_sMHwzQ@mail.gmail.com/

Why do we need to deal with these special cases at all?

I understand that you want iomap to be per inode and that
both you and Miklos are in favor of allowing mixing iomap and passthrough
and other inode iomodes on the same filesystem, that's fine.

But we also made a note that the iomap patch set is very big and we would
all benefit if we could start with a slightly leaner patch set.

Mixing on the same filesystem, iomap inodes where kernel handles
killpriv and regular inodes where server handles killpriv seems like
too much freedom to me.

The moment that filesystem opts-in for IOMAP, can we say that
the rest of the inodes are at least "local-only" (no remote changes
of those other inodes)? so server should not be able to have both
iomap and handle_killpriv enabled.

If IOMAP is going to be merged via the FUSEX protocol, this is one
of the FUSEX requirements anyway.

Thanks,
Amir.
