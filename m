Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6602A31F9BA
	for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 23:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779148052; cv=pass; b=EPHRu44kLUoU60YB1i/HnLSOy4AS/GzH8JSOOmUsn5My/mSumpNcXXTOOMPzQGrEtVQh+76ABNBby9fs5GqUrE/hbmLk+55K2jLgwpMr7jFGwoBsdlw3aU9cjfRYG0+uogEQkfgtTf1kkTmsOPNfHD6PpKtzAoDnc4YvxbTSeY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779148052; c=relaxed/simple;
	bh=7JRt76FeYfU75XMfqsMxTCMGeOaC7FKxmLHQrRwmOPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YvBqDihq0quHY0rq2R/Qfvr/voTf0+gXa+osJHPZVOddCEhIGXupAnWnrglXwxqmPznkh4LKYXowDYTicrqTBUPoc8UEs6To6N5zhW+RmNrDIVK20Kh8dVrJEddMoloaqa7sd0ppxlBNf7eSkcMqhxYZq8EmdpSYVQHCPxGYTYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rcDoKUY3; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rcDoKUY3"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4526a8170ceso1276641f8f.2
        for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 16:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779148049; cv=none;
        d=google.com; s=arc-20240605;
        b=P/BDY12xnQ3aV5AEAXSfRjobirxPqAXoW3bCuZtxEg1uVI83fwhyK0an8DaCrQBJrq
         lwiEoUp5fZ7JnKjwlKnGVyV6wnPM/x3S68eUEc1pf/RG1RWgUmOWJqkpg9fx3mBMoljy
         uKwcZ5Wpwmrh20Wc6Pq5+z4vnpfRHEfdSZ4G4DI47JDPr7UUtoCgxMRH9NeGid0MwKRu
         j2GznabMA08XTM5s/Djgkc8mCnK7QD+ECqnjOwL6gDOZ5vP7ReSlSLM20yTFov0NpFkE
         n2+ETAAXPXANk5OWLyvp/ZvDq2xjxV/RUs0Ophv9gpB3dqlvR2B4pOffC5uLdz5SZkrb
         nBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0VSSyTI2tug1r63sRPGJdbXMez/ik64fwDp9DACoM0A=;
        fh=A5XoraDuFSGLUT5SEUNE/NbTYuseZrbVNLPF5w9tj68=;
        b=Ut+pzqBa/m3C/m4BMHeu3jI9Tf0Alv0yuKt0hfDSitwsHdo1px3uxVkImlX/rhZwF/
         GUecwdJFj/BM8ki14OjOuLychCSKwA82xLRO+bRLyensB0/p0rVJDzUcldgFHZEqf9Al
         AbolcHel0spWfzPiIw3qcc8upCF9L4VgFdpTUBh0zii+0rgQXE8kdpy2ILbqtAclIryb
         232mISMt5bpNofe77xM5XV0Z5jhyL+J/jEeRPzv+F68H5kXy+bTfwf/AfVzICZ+cc+x5
         ht/DTZAHMFp6+Tb+NoxBfCXV8qLszNQSecY2bcBimGn4kO9W651UxIgj9f+Etk5VuuKV
         2Cnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779148049; x=1779752849; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VSSyTI2tug1r63sRPGJdbXMez/ik64fwDp9DACoM0A=;
        b=rcDoKUY3ZX21WfWjY2Q5Iq85vVtjpSCIo+Vzo+9uq8fvCnGBfHbE0TkgyZ8W7J7p7O
         w1Vk1puXMXaI2Fhvy2X3wEGksmwKflPEHqdcDihZzTDMFPw8qWb8m9f8rbJvUkZmm2rd
         ddnPl7tP/BGd6SeLuA0rUlGQDMyJF9xr7lVnk9R+QEFOvrSbOnZi/II3/BmcIlDabyI3
         xs/x+Frt8NRHL6qCU302YemkHTgAUjyCJoS/R3iqILPiPfctkGcaF2HSwjL56CP9zcBh
         +YW9wu65jzI/J+512JpD9aeJqAMx2UdVkpx+aTNEA/eo2FllmNuoZ/hi1ntvxF51Rw5O
         gYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779148049; x=1779752849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0VSSyTI2tug1r63sRPGJdbXMez/ik64fwDp9DACoM0A=;
        b=lxZYdoQ0gWd0HizLpwkXqEhg4Y79OhFFHIgCg7clEFxEmZZrgW7Wv9WpyMdIDnNuHp
         38fVyo6U+vQ5CNLkfRQ7RBIQORwr4ounohgBLKZRMHGX6v0shwJtDtE2DSQ4gExAb1bG
         3X3MUN2NuKdgkCUQtC9NaMNwCIJSGkEVK0qTHpDTIgt3R2tZ/rQ0dQDV2rvnK/7wUEXc
         69no0yZp2IZQC85atMfeEvh+if7uvxJ1XtPI8g9NJK8vA8ghANY6d3LWMgbMKCiqGV8E
         5Nre4/BWvSeDxNPhZtWtdC/ptwSDkWW3jRlSUoWgsS5YhREpQOfAn/wZZ/uM6Xs5vIgN
         Z3Ww==
X-Forwarded-Encrypted: i=1; AFNElJ+gXM4vZSUG5l64FX7WiNme8t3MenAzzDFXacN6ePfwdnxh7uj20zEe+DwwKolYheRrYlb0Iopg+C/2@lists.linux.dev
X-Gm-Message-State: AOJu0YztGHf19lCQLzrCHWIfIAZU/iaqhArD/QY/oT7+mTWRkB4YWiU9
	h+dgmGDauDoaj4SBbolccybsiNhHqtkqTgzYPnkIJ7pZwPd4vctX0hlET85BiQIio5qmIBbXPSk
	5dI4TpUYEpXuGacZkNQkAt5unKhr44t4=
X-Gm-Gg: Acq92OFkk+XgPvOr9ATX1SCYjoIUmOSqiYgwvg872D+1t112KRMomQ9/zgr3rOes2aR
	owiiaqlaQ+OfYQ6XLce0pp/vwDZOOc8tj/hslA+dZgHA6TIXC3fxri1tFHws4raD7mvbLlYq3Ae
	q77N/kGdfxfINkUXBQETpDl0294iqTHGcA3XZPpJC9CiDBd5X1V5YnRrsICryJANawTuDc7S1iK
	SVjc5igdrDh5MTUzqlRUjzdgXrCAL/DhI8CxQ5lx8bYgRX2UC2bb13M2T9jjMMDrBKHoPJfT1+I
	8W+5+Q==
X-Received: by 2002:a5d:5d82:0:b0:439:c299:4d8f with SMTP id
 ffacd0b85a97d-45e5c5cbe4bmr26543378f8f.17.1779148048602; Mon, 18 May 2026
 16:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-20-joannelkoong@gmail.com> <CAJnrk1bm=QOmY9MNZf5rbi-aTLaYetJ2Ziu7A5q9m4MMy5-Y7A@mail.gmail.com>
 <CAOQ4uxgfEwhy+YRbZ2H6=Rj4b7d=R-DhZVd+_28MA-9VAd-C5g@mail.gmail.com>
In-Reply-To: <CAOQ4uxgfEwhy+YRbZ2H6=Rj4b7d=R-DhZVd+_28MA-9VAd-C5g@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 18 May 2026 16:47:16 -0700
X-Gm-Features: AVHnY4KcV6afCDxl4fkWuJFDwIiz__bxO9eLHea2g--HiDIodYXuy5AM5fR5xQ4
Message-ID: <CAJnrk1bF9jFmqBtY_PgkA3x3muossApur4LpDo=6KFsA6vY4YQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/21] fuse: add passthrough setattr
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 4:03=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Sat, May 16, 2026 at 3:04=E2=80=AFAM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > On Fri, May 15, 2026 at 5:53=E2=80=AFPM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> > >
> > > Add passthrough setattr which sets attributes directly on the backing
> > > inode through backing_inode_setattr() instead of sending FUSE_SETATTR=
 to
> > > the server.
> > >
> > > Passthrough setattr is checked before the
> > > handle_killpriv/handle_killpriv_v2 suid/sgid stripping because the
> > > stripping is handled natively by notify_change() on the backing inode=
.
> > >
> > > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > > ---
> > >  fs/fuse/dir.c             |  3 +++
> > >  fs/fuse/fuse_i.h          |  3 ++-
> > >  fs/fuse/passthrough.c     | 28 ++++++++++++++++++++++++++++
> > >  include/uapi/linux/fuse.h |  1 +
> > >  4 files changed, 34 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > > index 4c7e3e1604af..b67b3b334e69 100644
> > > --- a/fs/fuse/dir.c
> > > +++ b/fs/fuse/dir.c
> > > @@ -2506,6 +2506,9 @@ static int fuse_setattr(struct mnt_idmap *idmap=
, struct dentry *entry,
> > >         if (!fuse_allow_current_process(get_fuse_conn(inode)))
> > >                 return -EACCES;
> > >
> > > +       if (fuse_passthrough_op(inode, FUSE_SETATTR))
> > > +               return fuse_passthrough_setattr(entry, attr);
> >
> > In the v1 discussion [1], there was a suggestion about gating
> > FUSE_PASSTHROUGH_INO on FUSE_HANDLE_KILLPRIV_V2 to avoid the
> > non-atomic killpriv path, but I think we were only encountering the
> > non-atomic killpriv path because I was calling
> > fuse_passthrough_setattr() in the wrong place. I think we can avoid
> > this altogether by just having the backing filesystem handle all of
> > the suid/sgid stripping atomically through its own notify_change()
> > path, which will let us skip all the fuse killpriv handling logic in
> > this function.
>
> I think it still matters, but to the only-passthrough-GETATTR case
> and I am still in favor of making this change.
> My point was why have the discussion whether getattr
> for the purpose of killpriv should be passthrough or not (next patch)?
> Why not drop the next patch instead because it will become moot.
>
> If FUSE_PASSTHROUGH_INO requires FUSE_HANDLE_KILLPRIV_V2
> it means that FUSE kernel is never trying to play games removing privs
> itself, not with passthrough and not without passthrough.
>
> Quoting your comment on next patch
> "I think there might be some use cases
> though where having only getattr passed through and not setattr is
> useful (eg server wants fast stat() but needs to intercept attribute
> changes for access control or policy enforcement)."
>
> Valid use case, but in this valid use case, said server may reject/allow
> attribute changes, but eventually if it allows them it will likely apply
> them to the very file which was set as backing inode, so essentially
> FUSE_HANDLE_KILLPRIV_V2 is the natural choice for a
> FUSE_PASSTHROUGH_INO server, even when it wants to introspect
> setattr.
>
> I think the same is true for ATOMIC_O_TRUNC.
> Either backing fs deals with O_TRUNC or server deals with O_TRUNC.
>
> But this is my opinion - I am open to hearing other opinions.

I was thinking from the user perspective, it'd be nicer to not couple
things unless it was absolutely necessary, especially since
passthrough is a per-inode/per-file attribute whereas KILLPRIV_V2 is a
global server configuration (eg server might want passthrough on just
a few files without taking on killpriv responsibility for the whole
filesystem).

But I think everything you wrote makes sense and I don't think
handling the stripping stuff is too burdensome to ask of the server.

For v3, I'll make the change to require FUSE_KILLPRIV_V2 for
FUSE_PASSTHROUGH_INO.

Thanks,
Joanne

>
> Thanks,
> Amir.
