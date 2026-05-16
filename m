Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E1204C3B
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 20:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778965185; cv=pass; b=DUIh09uktQJt+Df2gi+6pjldmMrlG0+jzDbeIwne8cB/Px2IGVkSiu3iNhnByJvx71TY9MTULEwcukffdx7i00be5kDJG8J8s90ZMb5dqI85ulUagLc6G6WbVAuZzPht5SQEOwS5HHwLilASi0ANU679d7pNormal8yzEo4fR/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778965185; c=relaxed/simple;
	bh=WMlO4WD3bT6y0k6L5CSsathxan+mn2dzwfTpb0lhLTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lBKe9NdY45/rCaKC7sWVak3ueIC4nMkoV3rTDI0oqttvfjj8plG6NotdRc4Z3K9Y2CUBzb5nWVblIF3xKKNlU+xA+TrrwaGbcgUYcPt1pjBv1iMv84iez5WHKjjL5YEuUL/JUiFtFpsXUZlTzddHVx77NMCOk6wun885sksbfv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYAsYfA/; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYAsYfA/"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bd22b2abaa4so191781066b.0
        for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 13:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778965182; cv=none;
        d=google.com; s=arc-20240605;
        b=d/rooWB1JPMkmlNRDTEHgKihXFVY8c0o77xUS6eLrhLk/AS7C5TsTdkNDroguTxo7H
         4VSKZB8t6gHhw9bAV38hA6KmaT2dhp4MMRpZnzgXgQFwfgn7OYmKCuVq+hE6sXRxcPyL
         vlR7giMviIHizQDcJPX5wOp95jUAS4VVZtbGtHYexpoHmSvTDX1Dk79YhjDzn0Oe2p3d
         /kbp73vD+NuiFu6zjIQaKo4AwnrvOqRyym/80lVuRhUIbnWf0MbQqBhj8P9Gzw2Ud3aJ
         gwif6NRD0TNlTzKSG8hvAvHfohjpxMzC5YRhBVfU0aaK0zTzghopdew5WTSR6aGzMwfP
         Od0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zhZM1WkI8K3/HWi6fYZ7zW3efkgNaojA90IOQYPwElA=;
        fh=jUWRNKqK/5k2hqX8pIjB61LtzcBru5X38G4iwMQrepc=;
        b=bxJoPQaBBq5SE/HtjOZAT4j0/YmKA6eQZnSZgP+N8IrUdwIJe6SoDlDCIAYrvK5Ped
         epevkAe5nfEOjIv7+J+BZ2YLgzo7Gjmwnc/eHcIvPav2k+Fl207m2c9TRkXAGtPmVMXI
         iS5O8/HkvLTrEH4qIKRnpy3pHl0ng2IaSWtIdtv7WdePgM4iVNg36vOdXVEzVzKs2bnO
         wGmuuJq3X+/NUcwlz7okkWrqxRv8JGy7a7rTiAQFx3Gp2UCqBCBqBZIy5k/UekdO3VvF
         eWUxIemI+gmeZH9+GAhdF9zwoylB0K+zrQde6lz4N4iDfEwzW004IXn+ZB2oeLVi3uPo
         rHFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778965182; x=1779569982; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhZM1WkI8K3/HWi6fYZ7zW3efkgNaojA90IOQYPwElA=;
        b=YYAsYfA/9dSoo7es8WllpPnyAWDGA0cUp0TNYQq/6L7rmhXAjaU7ZzDg2sm7zdbLze
         ssvIgLzBOo2lxd8G7uKrJaeEXGs35YJyvxCayr13HhUMx+jl7/zpHb73OWStUu+M5/u9
         GTCAVxghdKRCXafh7Cq2aIHMIwzJoxKFnXFN5eSeLXYk366vooLQsWg9c866ICLKLT/P
         NLBKQhgCegaEiXAmSMWHw6TGB2EkjU85CNqXpZ49C3xUQj1FpdNBDfEL9PjRQICxLQ3W
         yoiYVGk8nL3iuw8jEMX43SkTmFNWPd2OCamNw5S+91NurnxjJuPrGpgBILPslZn82IxS
         GfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778965182; x=1779569982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zhZM1WkI8K3/HWi6fYZ7zW3efkgNaojA90IOQYPwElA=;
        b=kwzX5Sv8Ss1DCMty77vbv6uK8KWo31Qv+5BO+cEREmxPVJ1FKXoehyT0JkVuBBjwAi
         6kwMEcajNI8iK7RQ7XCOuKbcuHkGSS+ICxE/msW1nD4k2uQ7y2sJ+ErCLSC2YLyHBEGW
         hJVuBhQAx2rTe8USNK/acBIl5HbvCcMnOZpA1LwR0p4vFMqGu5tB789ISc0NyV4/OZMi
         VdUeTskIcvC9HYyk+eJe/dz2DJ2bWNXS4GbjkC/jH0hYEWzl05ez6KRO7zPNePN71Vj5
         FA+xlniPTEl6TG9kErHuLSgOV1CHJnrdVJ1yf9UUgHJNLYnlHmRxESbyMqWcDj6YE6Hr
         cbvw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZA/1Ro8Nr63nwijHjXwRD7vG9xUBB30eOc/5ygcZ+HZ30fTf6tJKgpi5xE/l+f4l32yn3NFe27Exc@lists.linux.dev
X-Gm-Message-State: AOJu0YzKlnjWyvFQxuzPnSV+05zjVe+ND2EIPFRWP7fguIiQuKPSlbdC
	BJhZWLhR73xg9Wl6cEatzsMA7Tw3Vkg0hizVqDPAASlo8uOpR8No4hmAf6gb7k8HASDemUVFIi+
	59yDbCGCcAe2wtLdAGu85GaJKl1VLBys=
X-Gm-Gg: Acq92OFgytwPMGWdsYT1EeX+Gs9bbikG8SpR/A2uBdwIQUppRhiOr9Mxdj+zDru7+3N
	6kXN3MWhysKnO4vL7u3Z7O43GCL+MEDBK+VtSqNsSGgsCfO5In0bmDD5Ca89nFStSDGBxFIj9CZ
	3qJA+JPuF5tM3Iy5g33H6VPKnzJOf5Hj6Xmp4Njchf32WtdLwoXciF50oykFxrXboUaaNd9dNKa
	+Lvgu6HGiGXHYEubAFoYK3NdcKAHWN2KcRUJCUFVDo7vKJETm2JGF2S86nPhiZX4QRBvoehB3Md
	tyRRVEBvVqQ0aPasi8yIG306a+c3vNtCReGDwwBqzQ==
X-Received: by 2002:a17:907:8b86:b0:bae:456f:fbb2 with SMTP id
 a640c23a62f3a-bd51792e251mr542069266b.23.1778965181640; Sat, 16 May 2026
 13:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-22-joannelkoong@gmail.com> <CAOQ4uxjg4ULPKC7K9PabXPOOT7J5i2EOnzsv5ABNP3R5Y9jdYQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxjg4ULPKC7K9PabXPOOT7J5i2EOnzsv5ABNP3R5Y9jdYQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 16 May 2026 22:59:30 +0200
X-Gm-Features: AVHnY4IGxYNtr2y7VrLVGVJr70bw2E7q2uoqmijq5R58zGKz8oZFXwhJolNrDXc
Message-ID: <CAOQ4uxg4+6s094=ka7xG+Rjz2A6amyrSOr6C0QpYQ_iyrR4f+Q@mail.gmail.com>
Subject: Re: [PATCH v2 21/21] docs: fuse: document extended passthrough (FUSE_PASSTHROUGH_INO)
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 8:23=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Sat, May 16, 2026 at 2:53=E2=80=AFAM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > Add section about extended passthrough (FUSE_PASSTHROUGH_INO) mode.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  .../filesystems/fuse/fuse-passthrough.rst     | 126 ++++++++++++++++++
> >  1 file changed, 126 insertions(+)
> >
> > diff --git a/Documentation/filesystems/fuse/fuse-passthrough.rst b/Docu=
mentation/filesystems/fuse/fuse-passthrough.rst
> > index 2b0e7c2da54a..751d27c6fc5c 100644
> > --- a/Documentation/filesystems/fuse/fuse-passthrough.rst
> > +++ b/Documentation/filesystems/fuse/fuse-passthrough.rst
> > @@ -25,6 +25,11 @@ operations.
> >  Currently, passthrough is supported for operations like ``read(2)``/``=
write(2)``
> >  (via ``read_iter``/``write_iter``), ``splice(2)``, and ``mmap(2)``.
> >
> > +With the extended ``FUSE_PASSTHROUGH_INO`` mode, passthrough is also s=
upported
> > +for inode operations (getattr, setattr) and directory operations (read=
dir).
> > +In this mode, a backing file is attached to a fuse inode for its entir=
e
> > +lifetime.
> > +
> >  Enabling Passthrough
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > @@ -46,6 +51,127 @@ To use FUSE passthrough:
> >       the ``backing_id`` to release the kernel's reference to the backi=
ng file
> >       when it's no longer needed for passthrough setups.
> >
> > +Extended Passthrough (FUSE_PASSTHROUGH_INO)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +``FUSE_PASSTHROUGH_INO`` is a stricter variant of ``FUSE_PASSTHROUGH``=
 in
> > +which the backing file inode number must match the fuse inode number, =
enforcing
> > +a one-to-one mapping. The kernel offers this flag during ``FUSE_INIT``=
 if
> > +``CONFIG_FUSE_PASSTHROUGH`` is enabled and the architecture has 64-bit
> > +``ino_t``. The daemon accepts by returning it back in the init reply.
>
> IIUC, ino_t is now always 64-bit.
>
> > +
> > +Enabling Extended Passthrough
> > +-----------------------------
> > +
> > +To use extended passthrough:
> > +
> > +  1. Follow steps 1-2 from `Enabling Passthrough`_ above. The daemon m=
ust
> > +     also negotiate the ``FUSE_PASSTHROUGH_INO`` capability during
> > +     ``FUSE_INIT``.
> > +  2. When registering a backing file via ``FUSE_DEV_IOC_BACKING_OPEN``=
, set
> > +     the ``ops_mask`` field in ``struct fuse_backing_map`` to declare =
which
> > +     operations should be passed through. At minimum,
> > +     ``FUSE_PASSTHROUGH_OP_GETATTR`` must be set for any inode-level
> > +     passthrough.
> > +  3. When handling a ``LOOKUP``, ``CREATE``, ``MKNOD``, ``MKDIR``,
> > +     ``SYMLINK``, or ``LINK`` request, the daemon responds with a
> > +     ``fuse_entry2_out`` (instead of ``fuse_entry_out``). To enable
> > +     passthrough on the inode, set ``backing_id`` to the id returned b=
y
> > +     ``FUSE_DEV_IOC_BACKING_OPEN``. Set ``backing_id`` to 0 for inodes
> > +     that should not use passthrough. The ``nodeid`` in the response m=
ust
> > +     be the backing file's inode number (``i_ino``). If they don't mat=
ch,
> > +     the kernel rejects the passthrough setup with ``-EIO``.
> > +  4. When handling an ``OPEN`` request for a FUSE file, the daemon
> > +     replies with the ``FOPEN_PASSTHROUGH`` flag set in
> > +     ``fuse_open_out::open_flags`` and provides the corresponding ``ba=
cking_id``
> > +     in ``fuse_open_out::backing_id`` or leaves ``fuse_open_out::backi=
ng_id``
> > +     blank. If the daemon would like to opt out of passthrough when th=
e inode
> > +     is already in passthrough mode, it may additionally set
> > +     ``FOPEN_DIRECT_IO``, which will forward read/write operations dir=
ectly to
> > +     the daemon.
> > +  5. The FUSE daemon should eventually call ``FUSE_DEV_IOC_BACKING_CLO=
SE`` with
> > +     the ``backing_id`` to release the kernel's reference to the backi=
ng file
> > +     when it's no longer needed for passthrough setups.
> > +
> > +Passthrough Operations Mask
> > +---------------------------
> > +
> > +When registering a backing file via ``FUSE_DEV_IOC_BACKING_OPEN``, the=
 daemon
> > +sets ``ops_mask`` in ``struct fuse_backing_map`` to declare which oper=
ations
> > +should be passed through::
> > +
> > +    FUSE_PASSTHROUGH_OP_READ
> > +    FUSE_PASSTHROUGH_OP_WRITE
> > +    FUSE_PASSTHROUGH_OP_READDIR
> > +    FUSE_PASSTHROUGH_OP_GETATTR
> > +    FUSE_PASSTHROUGH_OP_SETATTR
> > +
> > +Operations fall into two categories, which can be combined:
> > +
> > +**Inode operations** (getattr, setattr): Activated on lookup when the =
daemon
> > +returns a ``backing_id`` in the ``fuse_entry2_out`` response. The back=
ing
> > +file reference persists for the lifetime of the fuse inode. Getattr is=
 the
> > +minimum required inode operation.
> > +
> > +**File operations** (read, write, readdir): Require the file to be ope=
ned with
> > +``FOPEN_PASSTHROUGH`` in the daemon's open response. Read and write ca=
n be set
> > +independently for partial passthrough. If only one direction is set, t=
he other
> > +falls back to direct IO and mmap is disabled.
> > +
> > +Extended Entry Reply
> > +--------------------
> > +
> > +When ``FUSE_PASSTHROUGH_INO`` is negotiated, the kernel uses
> > +``fuse_entry2_out`` instead of ``fuse_entry_out`` for entry responses.
> > +This struct carries a ``backing_id`` and ``fuse_statx`` attributes ins=
tead
> > +of ``fuse_attr``.
> > +
> > +When ``backing_id > 0``, the kernel associates the inode with the back=
ing file
> > +for passthrough inode operations. Statx attributes are not cached beca=
use
> > +passthrough getattr fetches them directly from the backing inode.
> > +
> > +When ``backing_id =3D=3D 0`` (no passthrough), the statx attributes fr=
om the reply
> > +are cached normally.
> > +
> > +A negative ``backing_id`` is treated as an error. The kernel sends
> > +``FUSE_FORGET`` for the returned nodeid and fails the operation.
> > +
> > +IO Mode State Machine
> > +---------------------
> > +
> > +The ``iocachectr`` field in ``struct fuse_inode`` prevents conflicting=
 access
> > +modes on the same inode (page-cache I/O and passthrough I/O cannot coe=
xist)::
> > +
> > +    iocachectr > 0    Cached mode
> > +    iocachectr =3D=3D 0   Idle. No files open, no passthrough
>
> More accurately, no open files in caching or passthough.
> files open with FOPEN_DIRECT_IO may exist and they
> do not deny entering either caching or passthrough iomode.
>
> > +    iocachectr < 0    Uncached/passthrough mode
> > +
> > +Each open file in passthrough mode holds one reference (``iocachectr--=
``).
> > +The inode-level passthrough setup holds one additional long-lived refe=
rence
> > +if the backing has inode ops (getattr/setattr). This long-lived refere=
nce is
> > +released on inode eviction.
> > +
> > +Cached mode and passthrough mode are mutually exclusive. Attempting ei=
ther
> > +while the other is active returns ``-ETXTBSY``.
> > +
> > +For directories, the same mechanism arbitrates between cached readdir
> > +(``FOPEN_CACHE_DIR``) and passthrough readdir. A directory opened with=
out
> > +``FOPEN_CACHE_DIR`` and without ``FOPEN_PASSTHROUGH`` is treated as di=
rect I/O
> > +and does not affect io mode.
> > +
> > +Things to note
> > +--------------
> > +
> > +- ``FUSE_PASSTHROUGH_INO`` requires 64-bit ``ino_t``.
>
> Not relevant I think.
>
> > +- Readdirplus does not set up inode passthrough. Inodes created via re=
addirplus
> > +  use normal FUSE operations until a fresh lookup occurs.
> > +- An inode's backing association is set once and cannot be changed.
> > +- Passthrough and cached I/O cannot coexist on the same inode.
> > +- If any inode operations are passed through, this means all opened fi=
les need
> > +  to set the ``FOPEN_PASSTHROUGH`` flag in the open response, even if =
reads
> > +  and writes are not passed through. If reads and writes are not passe=
d
> > +  through, they will go directly to the daemon.
>
> I had not considered this.
> Setting OP_GETATTR/SETATTR in LOOKUP without any OP_RW bits
> and then requiring that the server open files with FOPEN_PASSTHROUGH
> with the backing_id sounds strange -
> I understand why it was done this way, but for users this could be perple=
xing.
>
> The thing is that if the server is only doing GETATTR passthrough there i=
s not
> really a reason to deny open file in caching mode (I think?).
>
> The limitation that requires FOPEN_PASSTHROUGH is encoded in
> fuse_file_cached_io_open()
>     fuse_is_io_cache_wait()
>         !fuse_inode_backing()
>
> We have two options.
>
> Either we decide that server passing through GETATTR and opening
> files in caching mode is not interesting to support (for now) and then ju=
st
> maybe we need to better document the reason that server needs to
> use FOPEN_PASSTHROUGH despite not doing io passthrough.
>
> Or we relax the limitation w.r.t cached io mode, something like this
> (completely untested most likely broken based or earlier review
> suggestion regarding fuse_passthrough_op):
>
> Thanks,
> Amir.
>
> diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
> index c5f3e2201c6ab..7c33e7a974f6c 100644
> --- a/fs/fuse/iomode.c
> +++ b/fs/fuse/iomode.c
> @@ -20,7 +20,8 @@ static inline bool fuse_is_io_cache_wait(struct inode *=
inode)
>         struct fuse_inode *fi =3D get_fuse_inode(inode);
>
>         return S_ISREG(inode->i_mode) &&
> -               READ_ONCE(fi->iocachectr) < 0 && !fuse_inode_backing(fi);
> +               READ_ONCE(fi->iocachectr) < 0 &&
> +               !fuse_passthrough_op(inode, FUSE_PASSTHROUGH_RW_OPS);
>  }

Obviously, this was naive and not close to enough, because
fuse_inode_set_passthrough() still takes the negative iocachectr
refcount.

Please ignore this. Supporting caching iomode and GETATTR
passthrough is left for a future exercise, if anyone is ever interested.

Thanks,
Amir.
