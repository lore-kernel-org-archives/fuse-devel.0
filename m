Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D733D953F
	for <fuse-devel@lists.linux.dev>; Tue,  6 Oct 2026 09:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280116; cv=pass; b=pigQ2wLIqyp/zF0aHJHnuQIhK2BEz46XUQdPdX0e+kVagmTowRyXCxdM+Yfa/l7PPBs7uxnA3LyJ0AFfXu1RbR5DBnZz1MwrZ/0ohikU0ZbrDwdkv35j4SHmS8pO2gMy/jJLVN1ufCp3MTit4GfLb8oy8IMohQe7ZuOjJoJ0I/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280116; c=relaxed/simple;
	bh=z8C5llEeSas+wDevoi5ayKBoOPvXKhtMoOZYxs8J+Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQqCtkB/j3Pnxm78mPv/Jy44EhIoAX4ld9Fdk04NZyJbc3zaW7ufG5fWrNZT9iA62nmpyrx2LlPyF1cyqYsNXmkqXuTwYrKJcoXuPPFySPISgADvByjUueAY59iG6D1JNu1NWmMVLPyCo6nGCLyKIKdKzbqSfW+2p1SY7ZQKb7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=mSYp4mDV; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="mSYp4mDV"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5338f65913dso30619981cf.2
        for <fuse-devel@lists.linux.dev>; Tue, 06 Oct 2026 02:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791280112; cv=none;
        d=google.com; s=arc-20260327;
        b=QyY5sa8x1bMiCRnyrVZBwJ/8rqtsoCJgM1wL4Y72zZIgmpI34tKfFBQshJUYOtd8tK
         SiU4F2F6T0RZ/r2jiLlSoHloBbvDMkiaHfE/xwSCmaooxIsvqavcohQqX0GfJdvlfVzD
         b66/Kb8a2bvIu1iWgTduH7jpLsN8+QWg1J7FY2a6wil1XgyibVur1+D37yeCatyvV8EH
         oUCYt0ArrLpmKzp3lxk+XeQOvovcZC0nogQpJu3SpFYsdHawM9821WjE3NdHpsV8FxU9
         rMg4DuWiAcSpsQX9nPsco0LPuKGmQoQ5OGJnaojSJn8pJ+y+U339l/UZ1Oz4T5F6jAsq
         K9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/5ZFcmaqybTJP5VKzEwaO+zhe9+eXiIc/pJbQP9+B04=;
        fh=9Q+XLupmzOxn5W1AzyHu4/oKK0fja5RS7D2zMFRS0Mo=;
        b=Li/RdIh2f5ZT81L4+l083AhymBa30qJsuI0qGMNAtHdVMx0Mr6bj9GQOjsjA9FjaQn
         Vr6DchPBr2PzjQw/WLN8qSwADzrKVMDsejRs2OWP1CgP0l8z0Aq5K65Y/LJFTFKkq0GM
         6idZ1uAkOuVeSBAgglNZ0uAxIj+lyJAYE1NNEZExuKtVG+JtO5TZIh9ByZh6s80LGTzA
         NpQwS9ymnDlrmFwWXtnE00bu8lnX+rrKsZnEimXriiMoHgqSayPGXB4MTfz6fL51ciDz
         lOpj26NguV4+2YGdTyZAfaIfL3jv++oGG4ku+cqDuD9/E9i0rkCq4T5b7ndrIjHW5M1K
         fybA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1791280112; x=1791884912; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5ZFcmaqybTJP5VKzEwaO+zhe9+eXiIc/pJbQP9+B04=;
        b=mSYp4mDVTrzyFnRgWwxkEzQb+gh8YEVPz1yKaz8mjUtI8OhoHTi8ghbTOuuCWB39M0
         xJO43T0bROvW+PfhvaQwoFlsScGZjlzL7SaGdtTwfZAXWoqzyqz5rh+rigJvG1ZqkcRo
         M3ex6cN4fEK+c8KPNHhTHsvXvDV3QRQyzD3/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280112; x=1791884912;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/5ZFcmaqybTJP5VKzEwaO+zhe9+eXiIc/pJbQP9+B04=;
        b=1eJQCkiyYYP1DoOeTfvRfJWz+AAkLLTDL7EOCkS8/p8hb0cwF0iibjk7xJUZnm+/dn
         2OfzApmagYKGNDqHEGcBtIJtCjJ6/4l8Q3bRIFCT+v5BMxJv9hGTF5LKXH6zXUx3fM2E
         Ag0eE+cT5B/ERN6xXt3gj3x+kiKD8u8g7YMkBBdQjQoNMMY8FJeZx5Ge8dJIKSxTph4Z
         VBcCAMyn2GgLz6pvQrN1+oz6dCuUs//TOmSOEZI8KZeTlowNUS0OGvR/7dXpFStOMkdN
         l6h8Ik5m99LyEL7UhPlWJIjiLgreaqRf8ZmJIrOFVtsPQYaInQzLwpddtz75Cpzbu7ge
         w4Fg==
X-Forwarded-Encrypted: i=1; AKwUvBxN0qU63jRGEoz0Yt7exVUkDAADjk4IpS1/0PA3NSgwsZadAFahN1koxtzXppwehJlHiEDIKba40eaD@lists.linux.dev
X-Gm-Message-State: AFuF++mf0e+byR17QHwHQVJQYdLphwTlNWZHNZ+x5xLaMhrLuYLYYZ2h
	N/8SQlkSI7e0+/2kHq247bWGEnuMYlsjNzGRLQqhGC2U3rh4PR5RdNKWik7YrzXJoZRLrG85PoH
	z1wFD18Ap4MgRkBQBG/oVmW7Y2cQ6bKpmZ32c3Z99lA==
X-Gm-Gg: AYBFou3kooNEHch2XwNj56dt3tZp5Y1Yx0GlbokliZ+bIrge1Ha//OQQabLfIvGZMKT
	+qq14Mqh0jLgg9Hzb572pIeoY0y8N5XUY429Rpg17sQkCyd7606SkciqDEd24p6ePprSy1z/PcQ
	BUwUUxTxo5Bc0lj+ESLnmx7+/jM+yPYm45s6w9L3KvjAQaqiu9uKVk9iu1x4INyPZ9xA91OPnvj
	cUIqJGmWhYnGZyGP/9uj/4mEpmELYWjF+RkD2d7ARypE/IhbbxQrKWAgOTKue4776Y7ya8ULPRG
	iRYG0lmRA+LmAU7F5ZlJL4tANc+MZMDHXNyifLlT/oD4UpcOjQ0PgeMGLeJX/EPVOFT7RXWm4NB
	ESdzyaLcFt50z
X-Received: by 2002:a05:622a:1911:b0:530:f77a:b162 with SMTP id
 d75a77b69052e-53511e4f3f3mr177910411cf.27.1791280112604; Tue, 06 Oct 2026
 02:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001150935.655979-1-mszeredi@redhat.com> <asQcBebepPb9CXzS@groves.net>
In-Reply-To: <asQcBebepPb9CXzS@groves.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 6 Oct 2026 11:48:20 +0200
X-Gm-Features: AclHuK80ssbUcTC90bN8pi5U0qILib7vm2yX0MtoI7xgqfk-YgE_-OE-vHSlWAI
Message-ID: <CAJfpeguEUTYk9m7g2gZTMui0yFDYWSGL1SZ9PvoYiCqjDmHp9A@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] fuse: DAX device based extent maps (famfs)
To: John Groves <john@groves.net>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	Amir Goldstein <amir73il@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, david@kernel.org, 
	willy@infradead.org, brauner@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 01:37, John Groves <john@groves.net> wrote:

> I see the kernel-side rejects these s/size/chunk_size/ strip extents if they
> are not all the same size. Why not put the chunk size in the header and let
> the extents honestly describe the offset and range that they cover?
> The current design can't test for sufficient strip extent sizes, although
> it replaces code that did verify this.

Not adding chunk size to the header is intentional to keep the API as
simple as possible.

> However, the smoke tests passing isn't fully legit, because the patch to the
> famfs fuse server passes the entire strip size on CYCLIC mappings, meaning
> it just produces a concatenation of ranges - which does not achieve the
> interleaving goal at all. That case degenerates to simple extents.

Are you talking about the case where there are multiple simple extents
each with a different striped mapping?

That case is supported by the API, but not the implementation (since
there was not test case).  If you do a test case, I'll add the
implementation.

> To be specific: each chase/dereference that results in an L3 cache miss adds
> a stall of (1 * MEMORY_LATENCY) to the fault time. This is the good reason
> why I didn't do any chasing in the fault path of the famfs code that you're
> replacing.

Please benchmark against the in-kernel implementation.  If there's
significant (meaning it may have a real effect on a real-life
workload) performance hit from using the rb-tree, then we can add an
optimization.  I don't want to add complexity without actually being
able to measure the gain.

> OK, one more. You're using the rbtree for indexing by file offset, which is
> a zero-based non-sparse range in this case. If this could not be avoided
> (which I think it can) you should use an xarray or radix tree for that...
> right?

Unlike xarray, the rb_tree API is one I'm familiar with. But nothing
prevents switching to xarray if that's a better choice.

Thanks,
Miklos


>
> >
> > Thanks,
> > Miklos
> >
> > ---
> > Changes since v1:
> >
> >  - moved 3 prep patches to fuse.git#for-next
> >  - introduce FUSE_PASSTHROUGH_V2 (Amir)
> >  - lots of small fixes and cleanups (Amir, Sashiko)
> >
> > ---
> > John Groves (1):
> >   dax: replace exported dax_dev_get() with non-allocating dax_dev_find()
>
> Golly, it seems like there's more than 1 patch worth of content from me here,
> but the chipper/shredder might meet the letter of copyright law in some
> jurisdictions...
>
> >
> > Miklos Szeredi (7):
> >   fuse: add helpers for EIO return value with kernel message
> >   fuse: support 64 bit, server allocated backing ID
> >   fuse: support opening 64 bit backing ID
> >   fuse: add support for opening dax device as backing
> >   fuse: add extent map data structure
> >   fuse: add extent map I/O support
> >   fuse: add support for striped backing
> >
> >  drivers/dax/super.c       |  38 ++++-
> >  fs/fuse/Makefile          |   2 +-
> >  fs/fuse/backing.c         | 292 ++++++++++++++++++++++++++++++-------
> >  fs/fuse/dev.c             |  21 +++
> >  fs/fuse/dev.h             |   3 +
> >  fs/fuse/dir.c             |   3 +-
> >  fs/fuse/ext_map.c         | 299 ++++++++++++++++++++++++++++++++++++++
> >  fs/fuse/file.c            |  16 +-
> >  fs/fuse/fuse_i.h          |  72 +++++++--
> >  fs/fuse/inode.c           |  17 ++-
> >  fs/fuse/iomode.c          | 108 +++++++-------
> >  fs/fuse/notify.c          |  75 ++++++++++
> >  fs/fuse/passthrough.c     |  63 ++++----
> >  include/linux/dax.h       |   6 +-
> >  include/uapi/linux/fuse.h |  53 ++++++-
> >  15 files changed, 904 insertions(+), 164 deletions(-)
> >  create mode 100644 fs/fuse/ext_map.c
> >
> > --
> > 2.54.0
> >
>
> John
>
>
