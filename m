Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BA2390987
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 17:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780681330; cv=pass; b=JgYT/dq/jEcauvSofzeXFl6ypawqQy4UGl7Q7dJGiFOkQUS71PtjaTvPbv+kwQP4vctbmYcphSS29kPko1hgUob4m2eHgHgEQfs2eab3CttMb0DeF85bPSniHtJHswo1wWlbqRPr0xSCHMNCvXF4/2afuVaOVPzRy5ZxDZjzx34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780681330; c=relaxed/simple;
	bh=dYuQLFZyw9MBV3K0UUurnj4coifzgZE7GVc2qkIpHXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZd+KSbw6kyp1uzGvS2TqyNdtbU0jF93k8Tf4McBgtAH8WdJkBcs4VHy6rtDPU3mzshL57WTxYq5t1r9U5p+rKIOFcOlKoqI9X26M9XtL0R/rC3RqvEGeG+eG1aYkOEEU/w77qC3m6hycpxXAj861SktTaZFIHUyizoXm7oxo+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXKY+e4P; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXKY+e4P"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b3e03939so18937965e9.1
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 10:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780681321; cv=none;
        d=google.com; s=arc-20240605;
        b=dTrugbz6pg926Clu0ZdA5S+O10S1l1kBUK1TPxC9ixOIYGRZP5L/OPCcfp+v6NZ07p
         HDK7nltSWL0/z0BKjCc/SAwewhxgtKrIXCopFqWM6JhLwOX9y4EPdqtxh2DMyJhT2m07
         QtBja9hmctda4O/7XD8Dm10mFM5ycZyfu+VzU7EUQYCeQtEwmtIHVvUX6SaG3OXxCvl7
         hOimSBA/81vZ8aZa0SSt4Vdpzmlv6ieq4ByyqhvYIehsbEt2tbYX4+5QON5gmeXk8jSs
         3itMvzSqFUCn0ICd+NE0BL7G2pQjvyIYljZYmTG7Su3ZDypoGLVwwJuiXffl07BDuQJe
         tJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QW39kiBGB3An2hVUf/UDc+UkyLppS9jaJRb32IsireU=;
        fh=OMK270KSRygzlkSs9dnCq3jKh1di8t7c8KkM7ogo+Nw=;
        b=GFOyAFv2GI2CxAce0RxWb66+T7l/uaE8pkSu23Q1P0Q69SJvbfdoEndDlZ8UcfMGhE
         irBhR/I/Nnn2pkpUvpBSHhMZqjFvqDztGTTdGVcr4pz9p0KXK5x5lsur0aZhx4t+rgdn
         57qVvtPqLswGWmZfYujWJfkxajRDJ/0xkYYl/T4fhYFpwfGnbgHXNmkLJXjZZ9hsJSa4
         9tdp4kZ48bp+VRC4DkrIElhuX2D388LJa9AKNQlEDSscyHl1G8pfkbu8+xvAWllNkREX
         tCJ+/0dLEY6Es4zm6g42tVq13tvDV/PpM0BysnpiwS0tAdtqMOkXbnMhxMOZ75ZzJh2/
         f9IQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780681321; x=1781286121; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QW39kiBGB3An2hVUf/UDc+UkyLppS9jaJRb32IsireU=;
        b=YXKY+e4PMzYV2lW44ZPAnFmvcgOtTwKAOtWeFjhngbO3TZvcuEAVjrbhFqe98gx3Qa
         b6WdKjL+9sxCqzC53Xz+c8rm6/7If7+/fJXohI8l+QHoCq7sY9xSzYgmrXPMPcrDswNX
         fKWv8wQJvtLzUiuvdduo+IKYFE72ILNUFy3md5fS6eSvcw7X42j+q1QDO6VBt6vryCHe
         EIMwb/PjHEOCyXKhviVJ+XibcbaZq9LPlMlytDaUt8ZfttkWUx2IW+bsJvDUPKSuxStP
         qLwQIcSUVOpgp6tZJ5vKzQWSSG2U/yXHrsso43R5GjzK4HhRWmAe5BUQhxYVeBQf92PM
         k84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780681321; x=1781286121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QW39kiBGB3An2hVUf/UDc+UkyLppS9jaJRb32IsireU=;
        b=rqvHq28DJeKMyfG9PWQu1TPJSjZRcCwH1eByjfgsOQ316K6k/T93nlIqwz0NhGBDvH
         +fduR3zQl16TYF2naNPheH2J9FoVisSUSf3Lxw2g/kFkG98yOqUKpIHOBXKXyylBhSyW
         qSZcU5ngA5BTYLoWeJEX2ySKAtb9DAlFgeODknJuyT1yFMzwn9ox35hmtpCdcOThwSBr
         F6QUcVFcY7KyX/9WLe6pO9DN1go7fxRNmRbWmzK8O7acQETOS0sKmyUgn5DqM/teCk5O
         MepNAo9ACFsispL0tMsdt/Jat/Kpm/hDauqn1+PkoNILmz6t0dEghAL1N7/BaNx1D3i0
         XuHg==
X-Forwarded-Encrypted: i=1; AFNElJ/s6MmrjuUR4XbcyjboN2ItuDE8566EXfZaKsh0Ash9gsVgZbFIPj2zJiR2NewvReoHzAbEQ3o60V/6@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1pJSyyEq3ZazdWMeLdGvQ6xsE35Y714A6M1lDXt262raDzS18
	wx9Zqoq7gDjkjAMivAMN9hXzElBMTOEpFZAiqwWxm2R7E3eFlm8POjpAypvJ0BWHV60KrUs6tyY
	Rpr31mzPxzpJIw2tuM8grhM+2f+voQYI=
X-Gm-Gg: Acq92OEkC4jn+A8AyR+bDoyA/IAo4mUGta76lIJxVp1lVBVvqvR6omXILhcaiZ86ncS
	XUoBj7/hrXt5DEfpQIlP/OWlpeBZxNFJ5HY5Htg0V8THs8Lu/bXEeTXm2+1n0ZVtqM3PwDmrv3J
	3F2k5yI1WcwybLQKzhSkWMVQU+kLtbVEOzT54Npc8JsxtYlKI7by2OsMkjKTcBx5613TTR2O313
	8RiMjJk6/+c/5I2DyqaHypWdxkEAL3ixsXbhBtrgMm9ljXvfLKvjIY8o67PfEO1/JNJm9RcSdN4
	l674/8xLwIwZSVsS4HgMt4Tc9YQ=
X-Received: by 2002:a05:600c:3b04:b0:490:af63:2cb1 with SMTP id
 5b1f17b1804b1-490c2cdd2bemr60415115e9.7.1780681321251; Fri, 05 Jun 2026
 10:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177922946123.2439242.16666495969848656301.stgit@frogsfrogsfrogs>
 <177922946372.2439242.13829037107289830266.stgit@frogsfrogsfrogs>
 <CAJnrk1ZQbvCL=ok4WHBn0gC+=k88Cejts_-_DP3epa51Wz5+5g@mail.gmail.com> <20260605000134.GJ6070@frogsfrogsfrogs>
In-Reply-To: <20260605000134.GJ6070@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 5 Jun 2026 10:41:48 -0700
X-Gm-Features: AVVi8CdkXR0MXAvVFry-1RgGSo7c735m9aAqhN8hZzwidZowcJTOmI28WGekW5I
Message-ID: <CAJnrk1Zig5+97Qs3JiaSgLE1KJMn-mgXSFUcxM9-kv6xvpfBHA@mail.gmail.com>
Subject: Re: [PATCH 9/9] fuse: set iomap backing device block size
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, neal@gompa.dev, 
	bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 5:01=E2=80=AFPM Darrick J. Wong <djwong@kernel.org> =
wrote:
>
> On Fri, May 22, 2026 at 06:06:15PM -0700, Joanne Koong wrote:
> > On Tue, May 19, 2026 at 3:33=E2=80=AFPM Darrick J. Wong <djwong@kernel.=
org> wrote:
> > >
> > > From: Darrick J. Wong <djwong@kernel.org>
> > >
> > > Add a new ioctl so that an unprivileged fuse server can set the block
> > > size of a bdev that's opened for iomap usage.
> >
> > If I'm understanding it correctly, doesn't the fs/iomap layer align
> > all i/o to the fuse file inode->i_blkbits and submits bios to the
> > underlying iomap->bdev without ever reading the bdev's
> > inode->i_blkbits? Why do we need this fuse ioctl then for setting the
> > block size of a bdev?
>
> It's not for the regular file IO, it's for the blockdev pagecache that
> sits in front of filesystem metadata IO.  Block devices do writeback of
> their pagecache in units of buffer heads, which is a problem if the
> buffer head size is not aligned to the fsblock size.
>
> Basically, imagine a 1k-fsblock filesystem with 4k pages.  Let us
> further assume that block 0 is a superblock, and block 1 is the only
> file data in the whole filesystem.
>
> If the BLKBSZGET size is also 4k, then dirtying the superblock now means
> that the bdev pagecache will think that the whole 4k is dirty, because
> there's only one bh for the whole 4k.
>
> Now let's say iomap writes to the sole file data block.  The ondisk data
> is newer than the bdev pagecache.  Next, the fuse server initiates
> writeout of the dirty bdev pagecache.  It writes the whole page out to
> disk, which means the ondisk super is newest, but the file data block
> has just been clobbered by stale bdev pagecache!
>
> Ouch.
>
> So if we can set the bh size to 1k, we avoid the clobbering.

Thanks for the explanation.

From what I remember, fuseblk servers can pass in a size at mount time
for what the kernel should use for filesystem inode i_blkbits size.
imo it seems like the responsibility of the fuse server to make sure
to pass in a value that matches the buffer head size of the block
device it's using, or does this not suffice for what you need?

Thanks,
Joanne

>
> > It seems like this ioctl is re-implementing the BLKBSZSET ioctl but
> > bypasses the cap sys admin privilege checking that the BLKBSZSET ioctl
> > requires, which seems like a security violation. Am I understanding
> > this correctly?
>
> It is, but the assumption was that you'd only get fuse-iomap if you
> already had CAP_SYS_RAWIO, so you have to have some privilege.  But I
> concede that RAWIO !=3D ADMIN.  This might be unnecessary now that fuse
> service containers can ask the mount helper to open a bdev in O_EXCL
> mode and set a particular blocksize.
>
> Though note the weird thing -- a sysadmin can use chmod to let
> unprivileged userspace to open a bdev and it can open it O_EXCL, but it
> can't set the block size unless they have CAP_SYS_ADMIN.
>
> --D
>
