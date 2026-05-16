Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8B22264C0
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 23:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778972640; cv=pass; b=B6WGNtl1aZxk0iBzrNT9EY2iTtD3nXFM0nP2l6rx0GmAgYeDudv9iD2QqN0MG+wdlpL7Vitv9m/hOjanYm+imVjVqwL+MNipwZfB+q2z7Ov6Q59O0/MgZVZ7+gBDCzZyQmKSrQw6RKH0pNY3lrVi5GovPeb5NnmtY4tnJCljgvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778972640; c=relaxed/simple;
	bh=/y3rTsfAPA+TdIxNGL50QvOlD4VMMFGYfew+jato8a8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3fqdcuhSVIFERoxluBxM+UEYVG5izitS6Ih6ysWfQ02nTsISbGB6k+Byn277QPLEISmjIPrdRsKofMlYAANZninvxJjQww9vz+HilyiSRLHJcRPMctjibMcybGyvE4I6MJFUxYmMEYuwerjAWk//NHk1WitdBYzfccqccA5XFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sg/aAQ5G; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sg/aAQ5G"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso2900972a12.1
        for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 16:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778972637; cv=none;
        d=google.com; s=arc-20240605;
        b=KNy7gVoBbaI6F8A+ZE8nwNKDragmab4usAzfbaAl5v6KOwSryfZiLVRm/xSshqgXKT
         Lq52FBlfpJPKkIOOEc92debHNDGUrbMJXCj1ee+Umbp+XySpioMmXgqK5TABD4ov/xiE
         qh5aRhJf4kORrg8rSiPiNIWilWe6dfoTX5gCIbwX+66zc6zZpVujpiMeQOhM8a3f2ScA
         GyH85DP17JEjTq/KnjUKKMAQLpVtE9gkqGWVE7EccT5uwMS84EZKM9pCqbw5Adzmg8Jk
         f4q+AR1/5wYlMWJAJlz8DAYbG7cudJdq2ORTxh7eCWoIZb013VRKpRE7Zuiq1/1HX+bM
         zwvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8DEfMqQ5RG6l620YFRFpDY/yq4az/n7LwelUR3R4K3o=;
        fh=Hw6SvA1TMhQzjNR0eGj09y/mHvHEIIBUFaq2hfNjnkI=;
        b=M1fHxvrOh39xWR1XbGJ7LoblY+IG19bSvPbrd92oucHcAmylaATZQLilp9fvkW3EMy
         gJ8KgtiwPJT4O30yQKs8T7lZ0/kkG8i51GFdbzhnzQ4Fi8vKefyOVAS7gzWTakU23ZKf
         JKf6eL0I8I2mfsKxJSwq6/9KLurfLOxAFhWUOyK8mCM6ZO5Kd6aKQzu4axkJR5aR/r2V
         iWzNj1o8OnD7qw/aBHaVtq0Jy1bryl1dPquwDXIVC9z9p7YBkeZrgNByh91YMi/iPFLv
         los9l2JufYMYnjW+9UDAYFwV5zMv10HuRdwu+ZTdQ5WaBg0kE9gXiLwAIMQ3PLacQRZo
         njHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778972637; x=1779577437; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DEfMqQ5RG6l620YFRFpDY/yq4az/n7LwelUR3R4K3o=;
        b=sg/aAQ5GTeeIig5F9LYfCqzpIS5FN6iX8433gwwkR3/ybTZnHJNrjdfBY/SZtrF8f7
         EPraBxpPqf1CiEK/3GgTJC9hOdWWFSJZZo4sw0ZFq+7aN417AuLW8FmZuhKCGafGLKWY
         UEadMpp4beMBQr2ZwTLaDgGgiTEGQzhzi5GUqbv3wn1Wm0xDieT0U6OuCF3eKErODihd
         f+HpRB5mSYJK4Py69MiJ0PL5aQbO2fRpHeqwjvoWsl3Qgf5UePZBP3HUyDDL81csL62w
         POiKUnGamm5h7I61R0l++1Ptzddg7/OUpNVyIr3DpIK/pmhaURzHvs7ArRrYqhbqcXgT
         MOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778972637; x=1779577437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8DEfMqQ5RG6l620YFRFpDY/yq4az/n7LwelUR3R4K3o=;
        b=r/X1hE5qiEGD10BDj8ApVNy8lcguIhVHpv9F5s46sSw1xpUGuWmO0UqIJYkwWp2S8g
         E/S3XFRfQnpYhviVbrpDjwPo1rBXtaREJsGOJ6YvtGHqNYVQtqPL7GpMVegmmOVy9eur
         ILsYxGZ2AQfJkTD00qmeYS3kzghbNzitlu/pOyAdxeVqlqT4+Z5iBB7JsIlohI/xCbJk
         o1tI8TnV99d5Wh8MPnXzpLYXwMiX/IpR2oQXE3QRtJJ64LAT8YvcqH9h6x4DPv5XOlIC
         PCnhNTHGo/as4LxqwujhwqYZ3S09IxDNjNPETP+FWGXw4jhesQxpnEV3fGeHxSUNz6CB
         Qpgg==
X-Forwarded-Encrypted: i=1; AFNElJ/b+Z1jLXx/ai78nsjlm6QGVBMhHMXjJb9F/7SPwO4UXtTZal/k7baSENzQn2tiUDTp/hGFpUldrOlf@lists.linux.dev
X-Gm-Message-State: AOJu0YzfSR9oDpJgFf9WsgPbuqnF7W4cCXrO/Oikp1PcLPuX8Jd5FYeo
	DgYYn5IMGVlvwb6D52DETSMOW5zpYoqY76fT7R/8Oz49tOAn34vmVXdAO6JSxexSbyOyay4KMGX
	LvEo215QiGVu44W8iYN86D5bqZYPwzlE=
X-Gm-Gg: Acq92OFl6M/Wd+6b8lmQ7Jnv53CnYtCqgcAe/3OhxSEQ4yk2zrhBCKjhAABKTV0e13I
	5gEWRwOtYSpmFmIzoSHy6+d8s/iavCu4xB8JISecKQ6rWftzEXmzXOnPUF496+T4iPo5v8r1aE1
	B9ftTRjt0E5M2oxMgKFGzqqoFzmLaAOyHIcQxIYuqfhdEhG6VDjusIPExL1kqBqpsh2n3HvPh7K
	Qur5LV3e6ETcLwppaj5dASa1iKm14tiXKiDpULIDuHvFxmU8RzdCmeC6t0VdmAtbTZDRRhyDTbc
	+rcnB0Ygg2UQASwKR+i5vJEBC+9kh7qwAuF8pCJjXg==
X-Received: by 2002:a05:6402:11d1:b0:67e:53a4:5807 with SMTP id
 4fb4d7f45d1cf-683bd08ff27mr4435341a12.18.1778972637445; Sat, 16 May 2026
 16:03:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-20-joannelkoong@gmail.com> <CAJnrk1bm=QOmY9MNZf5rbi-aTLaYetJ2Ziu7A5q9m4MMy5-Y7A@mail.gmail.com>
In-Reply-To: <CAJnrk1bm=QOmY9MNZf5rbi-aTLaYetJ2Ziu7A5q9m4MMy5-Y7A@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 17 May 2026 01:03:46 +0200
X-Gm-Features: AVHnY4IY2vvNxdmoXtMcnAf1FkqaoedjoYIyMCVPCDMOwBHuc7ExpaUUbmAQTEM
Message-ID: <CAOQ4uxgfEwhy+YRbZ2H6=Rj4b7d=R-DhZVd+_28MA-9VAd-C5g@mail.gmail.com>
Subject: Re: [PATCH v2 19/21] fuse: add passthrough setattr
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 3:04=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Fri, May 15, 2026 at 5:53=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > Add passthrough setattr which sets attributes directly on the backing
> > inode through backing_inode_setattr() instead of sending FUSE_SETATTR t=
o
> > the server.
> >
> > Passthrough setattr is checked before the
> > handle_killpriv/handle_killpriv_v2 suid/sgid stripping because the
> > stripping is handled natively by notify_change() on the backing inode.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/dir.c             |  3 +++
> >  fs/fuse/fuse_i.h          |  3 ++-
> >  fs/fuse/passthrough.c     | 28 ++++++++++++++++++++++++++++
> >  include/uapi/linux/fuse.h |  1 +
> >  4 files changed, 34 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index 4c7e3e1604af..b67b3b334e69 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -2506,6 +2506,9 @@ static int fuse_setattr(struct mnt_idmap *idmap, =
struct dentry *entry,
> >         if (!fuse_allow_current_process(get_fuse_conn(inode)))
> >                 return -EACCES;
> >
> > +       if (fuse_passthrough_op(inode, FUSE_SETATTR))
> > +               return fuse_passthrough_setattr(entry, attr);
>
> In the v1 discussion [1], there was a suggestion about gating
> FUSE_PASSTHROUGH_INO on FUSE_HANDLE_KILLPRIV_V2 to avoid the
> non-atomic killpriv path, but I think we were only encountering the
> non-atomic killpriv path because I was calling
> fuse_passthrough_setattr() in the wrong place. I think we can avoid
> this altogether by just having the backing filesystem handle all of
> the suid/sgid stripping atomically through its own notify_change()
> path, which will let us skip all the fuse killpriv handling logic in
> this function.

I think it still matters, but to the only-passthrough-GETATTR case
and I am still in favor of making this change.
My point was why have the discussion whether getattr
for the purpose of killpriv should be passthrough or not (next patch)?
Why not drop the next patch instead because it will become moot.

If FUSE_PASSTHROUGH_INO requires FUSE_HANDLE_KILLPRIV_V2
it means that FUSE kernel is never trying to play games removing privs
itself, not with passthrough and not without passthrough.

Quoting your comment on next patch
"I think there might be some use cases
though where having only getattr passed through and not setattr is
useful (eg server wants fast stat() but needs to intercept attribute
changes for access control or policy enforcement)."

Valid use case, but in this valid use case, said server may reject/allow
attribute changes, but eventually if it allows them it will likely apply
them to the very file which was set as backing inode, so essentially
FUSE_HANDLE_KILLPRIV_V2 is the natural choice for a
FUSE_PASSTHROUGH_INO server, even when it wants to introspect
setattr.

I think the same is true for ATOMIC_O_TRUNC.
Either backing fs deals with O_TRUNC or server deals with O_TRUNC.

But this is my opinion - I am open to hearing other opinions.

Thanks,
Amir.
