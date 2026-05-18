Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833A639656C
	for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 21:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779139398; cv=pass; b=RpTMmawk+1GqUG0TKkHO0/s1mraEACMGP8yQVucSO8vyFldriXzRqiobVIcAKR7jYOJ4nJCNA1+LmIbzf0fz9QXjdT0bztsf0VQPGFfHbD4RKgLO8ya395IiHkC/u0REZz+BcFA43tqUXdjFVQMfDs2jE8LfjMwa9vIijWcgHy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779139398; c=relaxed/simple;
	bh=ehunx5QPTjonSJZ/DC/UmIaaqmqkD6UtPhN8uzXbdbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJOZY/u7dnUEqS/HuG71IjutMsMDcApEBnjgHa51cUK8j7X46IhQNU4L0JlzTl9GIo0jyFRBh1KOmfm63qh5ahEYzrwHFGYWGXcW7hPM2wjOGriACEMBneIpyYLTqY58u8S8xl/bXPkHY4P2NQGLfGoXqGE6VqNIicIJ+Anp0Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cY3DAHC6; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cY3DAHC6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so16105215e9.1
        for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 14:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779139395; cv=none;
        d=google.com; s=arc-20240605;
        b=hggYQN9C0qsp7+X+6whxWKQanJ2rISF8+67RM5jG8xYwZ85/nEKWbaOrOqEoliYSeD
         J3WlaP2y/dV6Q+AD2Hy3Tn7VAE7wNsWgy6rcvqDLMrde64ihIVItZKm6lUJ2T53HUJOc
         qxniB8cfrvGygvh109nFspLtuotPfFXQwTlt9df9Qw8wT2dVtjZ6N8PKeQT6DKN/EnD4
         yxJWwn7Pi1dac7ROU91O5AZ9eqyOp/LEo5nHFA0etOU7zWAUTVsn6ngIcRwxUjQmqnoL
         ArTfd+B8gaVW/7XL+WRuom83ORWTPKTzL2go7f7JTxltIEoVzpyCndqvAsuPdAxM556J
         Y69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aV1RPIE/Suy744QrgJcsEUXldeiHUsxUrC+JiXtfahg=;
        fh=zJOxOSNpeDPilSYR0TW2FBga9ll4cFtNeBvJHpnXmfs=;
        b=T7zGeOzbIhTZJU46UOa/jY70CNqAQQc+4O3EBxMzlUDpZFSPXrzAFSrr6x0XQ9QrKb
         BULJTWhmElSB1YykDTxAbIUCryU1O1AankAM6w3fC1qjzDGl4va7JeqIhJ8yvEKuy8VG
         ojvn5B19f0UxuA0guu1kv6t2YCgv9VYNi8/wo1VeW+3bnYRcKorZvNN5tKwD0OZbIMrE
         GFTGkZLC2Omp9VIkXqqUwXNAaFaJq3PHGhmqBwTUN9u/2vVDH1aBmcyZVJo0cEM8ZgYJ
         9J0Zp0Pd3vLYG3Nlde0YzEB7j8R5meEHwRyg2/Jp0MN4/ADpGCLmtz8LIE6pdIozYREy
         S/nA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779139395; x=1779744195; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aV1RPIE/Suy744QrgJcsEUXldeiHUsxUrC+JiXtfahg=;
        b=cY3DAHC6pe536sFK6fDjB0kU8gUaNQalEO3sN96U89bWBplSF85dbsC7gDhBjaqg6V
         MxpF87+JTZnYMheUimZev2Sf+rtDJdEq3noXPjNbIzs/cKNrEuPolfxiQosnfZzaLtar
         b+Yqv/sLvu18e6qIxirK9gvHRJT2btOxGZ84kUGpCtct/+OgBA8LreVMPZhags0Kh9eP
         a17yqSUqJT3OkAPOKX8HZSEV3pCXvZ+IGReDvdHpmmKrr6E1F9lE8KqjICjOIWiHYcCD
         fFiKuGTjXftjZd1MseQ5gmpGzXTR3rqCz0lJOVfokURn0ELH53XRAx23i006Ae5kSpzJ
         VGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779139395; x=1779744195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aV1RPIE/Suy744QrgJcsEUXldeiHUsxUrC+JiXtfahg=;
        b=NoFDAGwiI4TL+HtWV5+ysC1SxvZWd9kVeSBRttAml4GGtXSP/iTqa8gjH3Nf/jiGfW
         LwrwcckS8qEaTynCgs0NbihtrV0lIv9ho78AJq0axYVaVf2Fe9wWaInGzPl7m2aMI9Hq
         O2OAMULOn9AERb9qfuuWYs1iSZDHCMUp9bCWHOWxRyebyaTsZ5McZB742DKbtOtK2gfl
         N8mFypi381G22sLZwIgKXcvRU0RESwfkOpcshrd99j3zFUzK0C7BI2PlNUWkJiYw53wH
         dTA6wUZEXDITIQ7jbRdkLGOGWBLcZVPDThyoq0VhkSlH0QTLmBKVEHYoVHGcOnWT+v/i
         eZcA==
X-Forwarded-Encrypted: i=1; AFNElJ8/rrRiW5tsoVYakjtkehqp6v1qSVADhUj7UgdBUD8rLicRRfH7gVP1RiZv5M8s8NPeA5PaaioGZ7VF@lists.linux.dev
X-Gm-Message-State: AOJu0YwccfHyyG/5V8xEQ29gSJC32pM1kuAgcesrrD4cerzS7alFMoCo
	1n9aRIDoTHvazyv7u9mrnkXYeC5z0l7apMwlGtlxmKF1CYdyJcUqcHGJbeoBK+IqTYzUE900EwF
	xFZo7PShy6rNwR6+fMBQNm0bMvdwPisg=
X-Gm-Gg: Acq92OEtL0WHHt6uRdJESH/60jAUvdfFF7LvcN2CJ1xH1Sw22aYyfmGyUGteTHtHKGn
	ToVagZCE4klbWmohvP2XXFICoTnEv2006FGe3V4vZB7IeoJI5PPrwtDZ1edyIB9G2iXE3hPXHI1
	udxSrYjc1rICg7Ds2RUzZLVHl+0pgUqC83s9mey4ttjd0iVbgJuAyrfZX9MxDOWaS26eWQHewbb
	ag3W4fpju5g0R4nQ5hIbCTvEeaaeCkzxdQ4w49tFt2snNDxj1/TBSWXMTXKLdxDYVU+oxmyex60
	mfihyw==
X-Received: by 2002:a05:600c:1595:b0:489:1c0d:c9cb with SMTP id
 5b1f17b1804b1-48fd633273emr201774585e9.5.1779139394735; Mon, 18 May 2026
 14:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-22-joannelkoong@gmail.com> <CAOQ4uxjg4ULPKC7K9PabXPOOT7J5i2EOnzsv5ABNP3R5Y9jdYQ@mail.gmail.com>
 <CAOQ4uxg4+6s094=ka7xG+Rjz2A6amyrSOr6C0QpYQ_iyrR4f+Q@mail.gmail.com>
In-Reply-To: <CAOQ4uxg4+6s094=ka7xG+Rjz2A6amyrSOr6C0QpYQ_iyrR4f+Q@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 18 May 2026 14:23:02 -0700
X-Gm-Features: AVHnY4LAEpfAtKN8TeM5qcqSPbVu1r9rOdXldlZv_3lP4D0JY0hEO0Iv0LsBVk0
Message-ID: <CAJnrk1ZD8hQX1jrnRzQ3aDTsihvDC5g9fV-NDG1V53gE7TL_ig@mail.gmail.com>
Subject: Re: [PATCH v2 21/21] docs: fuse: document extended passthrough (FUSE_PASSTHROUGH_INO)
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 1:59=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Sat, May 16, 2026 at 8:23=E2=80=AFPM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Sat, May 16, 2026 at 2:53=E2=80=AFAM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> > >
> > > Add section about extended passthrough (FUSE_PASSTHROUGH_INO) mode.
> > >
> > > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > > ---
> > >  .../filesystems/fuse/fuse-passthrough.rst     | 126 ++++++++++++++++=
++
> > >  1 file changed, 126 insertions(+)
> > >
> > > diff --git a/Documentation/filesystems/fuse/fuse-passthrough.rst b/Do=
cumentation/filesystems/fuse/fuse-passthrough.rst
> > > index 2b0e7c2da54a..751d27c6fc5c 100644
> > > --- a/Documentation/filesystems/fuse/fuse-passthrough.rst
> > > +++ b/Documentation/filesystems/fuse/fuse-passthrough.rst
> > > @@ -25,6 +25,11 @@ operations.
> > >
> > > +Extended Passthrough (FUSE_PASSTHROUGH_INO)
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +``FUSE_PASSTHROUGH_INO`` is a stricter variant of ``FUSE_PASSTHROUGH=
`` in
> > > +which the backing file inode number must match the fuse inode number=
, enforcing
> > > +a one-to-one mapping. The kernel offers this flag during ``FUSE_INIT=
`` if
> > > +``CONFIG_FUSE_PASSTHROUGH`` is enabled and the architecture has 64-b=
it
> > > +``ino_t``. The daemon accepts by returning it back in the init reply=
.
> >
> > IIUC, ino_t is now always 64-bit.

When Jeff's changes for u64 inode->i_ino land in the fuse tree, I'll
get rid of this and update the 1st patch accordingly.

> >
> > > +
> > > +IO Mode State Machine
> > > +---------------------
> > > +
> > > +The ``iocachectr`` field in ``struct fuse_inode`` prevents conflicti=
ng access
> > > +modes on the same inode (page-cache I/O and passthrough I/O cannot c=
oexist)::
> > > +
> > > +    iocachectr > 0    Cached mode
> > > +    iocachectr =3D=3D 0   Idle. No files open, no passthrough
> >
> > More accurately, no open files in caching or passthough.
> > files open with FOPEN_DIRECT_IO may exist and they
> > do not deny entering either caching or passthrough iomode.

Good point, I'll update this to be more precise.

> >
> > > +    iocachectr < 0    Uncached/passthrough mode
> > > +
> > > +Each open file in passthrough mode holds one reference (``iocachectr=
--``).
> > > +The inode-level passthrough setup holds one additional long-lived re=
ference
> > > +if the backing has inode ops (getattr/setattr). This long-lived refe=
rence is
> > > +released on inode eviction.
> > > +
> > > +Cached mode and passthrough mode are mutually exclusive. Attempting =
either
> > > +while the other is active returns ``-ETXTBSY``.
> > > +
> > > +For directories, the same mechanism arbitrates between cached readdi=
r
> > > +(``FOPEN_CACHE_DIR``) and passthrough readdir. A directory opened wi=
thout
> > > +``FOPEN_CACHE_DIR`` and without ``FOPEN_PASSTHROUGH`` is treated as =
direct I/O
> > > +and does not affect io mode.
> > > +
> > > +Things to note
> > > +--------------
> > > +
> > > +- ``FUSE_PASSTHROUGH_INO`` requires 64-bit ``ino_t``.
> >
> > Not relevant I think.
> >
> > > +- Readdirplus does not set up inode passthrough. Inodes created via =
readdirplus
> > > +  use normal FUSE operations until a fresh lookup occurs.
> > > +- An inode's backing association is set once and cannot be changed.
> > > +- Passthrough and cached I/O cannot coexist on the same inode.
> > > +- If any inode operations are passed through, this means all opened =
files need
> > > +  to set the ``FOPEN_PASSTHROUGH`` flag in the open response, even i=
f reads
> > > +  and writes are not passed through. If reads and writes are not pas=
sed
> > > +  through, they will go directly to the daemon.
> >
> > I had not considered this.
> > Setting OP_GETATTR/SETATTR in LOOKUP without any OP_RW bits
> > and then requiring that the server open files with FOPEN_PASSTHROUGH
> > with the backing_id sounds strange -
> > I understand why it was done this way, but for users this could be perp=
lexing.
> >
> > The thing is that if the server is only doing GETATTR passthrough there=
 is not
> > really a reason to deny open file in caching mode (I think?).
> >
> > The limitation that requires FOPEN_PASSTHROUGH is encoded in
> > fuse_file_cached_io_open()
> >     fuse_is_io_cache_wait()
> >         !fuse_inode_backing()
> >
> > We have two options.
> >
> > Either we decide that server passing through GETATTR and opening
> > files in caching mode is not interesting to support (for now) and then =
just
> > maybe we need to better document the reason that server needs to
> > use FOPEN_PASSTHROUGH despite not doing io passthrough.
> >
> > Or we relax the limitation w.r.t cached io mode, something like this
> > (completely untested most likely broken based or earlier review
> > suggestion regarding fuse_passthrough_op):
> >
> > Thanks,
> > Amir.
> >
> > diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
> > index c5f3e2201c6ab..7c33e7a974f6c 100644
> > --- a/fs/fuse/iomode.c
> > +++ b/fs/fuse/iomode.c
> > @@ -20,7 +20,8 @@ static inline bool fuse_is_io_cache_wait(struct inode=
 *inode)
> >         struct fuse_inode *fi =3D get_fuse_inode(inode);
> >
> >         return S_ISREG(inode->i_mode) &&
> > -               READ_ONCE(fi->iocachectr) < 0 && !fuse_inode_backing(fi=
);
> > +               READ_ONCE(fi->iocachectr) < 0 &&
> > +               !fuse_passthrough_op(inode, FUSE_PASSTHROUGH_RW_OPS);
> >  }
>
> Obviously, this was naive and not close to enough, because
> fuse_inode_set_passthrough() still takes the negative iocachectr
> refcount.
>
> Please ignore this. Supporting caching iomode and GETATTR
> passthrough is left for a future exercise, if anyone is ever interested.

Sounds good, I will continue to leave this unsupported for now.

Thanks for reviewing these patches.
>
> Thanks,
> Amir.
