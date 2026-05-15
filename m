Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6773F164F
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 21:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778879694; cv=pass; b=dLJ5PgTTo1zI814F5M7W3el4bUDgYwf824cGfCANUfbAs7v1c2Pq/piKaF3+hoCLFV65AJiGFmhEjkF+WuBZltEWvJeFWKxjzs2IlASXrWkBnHs47TdLuSknmGEM8i1s/cU9riVmfhqI1bSZmm66wPxdb0SQGplb/wzSgU22cB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778879694; c=relaxed/simple;
	bh=DuT+nlnLaglia7ZNQ7wKTzwqTFOUk916TijZdfnB/Ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etfGdQaRF0UPTgc4QlAS+VV7a1nAUA0u4npC7QWPIE8quDjBJXAlV5RHfFaONAy4hE4q+7cNqnA6A3QspwdKx9Q9jzXj1AXoUglqRSilojauB38B40hfEfVHgBRghbWgxa4NohaKN4hpacviGE4gmKddH9vXOXX+YchDC0QDVIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcRDk2KT; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcRDk2KT"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so547186a12.1
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 14:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778879690; cv=none;
        d=google.com; s=arc-20240605;
        b=YLpTJnSch8mgQIFrAVmGLJBI2wKanxjX/2AVDGXtEc3UU4m+Y0CumnUChkzoJz+nJ+
         HWgOHKkEerioLgtMTgGuwuQ851QriBEy1INWMlJkp/Kqk0RKyw8J/x9xFYmwHiQhjoAb
         YeU5tkU6FZ5DkMonEfvJ1U6SLwB44H1Zz4SduhoNBElw5dyGD/ZCr7f27K7WHbejjhr0
         rLGM5KUArKQpRTk31abvemM0QJARqREJcGXJbGjOKRnQD3/PiIvQxDhqdBjsCPFCHSre
         ZeBDSiZppo7NHM9xyuleo7vXcqqJw2HAr40h4kbaPc63bNVeQkDlyBC/pjhYFR0I5bHR
         bwYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bN2Odr3esQrA9SWUUUdwtrw2+pd4bqhfvSZwexzSm4M=;
        fh=DcT2d1K5enG3x2FwOpiCetHjqbXsoShR64M/LBLFyS4=;
        b=UyFXCS+FknvDZO4LCSzZQcY2TiKHfpvNnLTWtqaypG8LAm/YctmKlLW8K14oZRbPAh
         Y4r0fEbR7GUC08iBrpqwtDvmSO7tVxb+GClxOlndA1JUDelGbD3Z0zMaF9nHNUM8h/7f
         TQrbBuUk435m2jxyJVE+rDz1DlYCrXzbzwdIod5qmP5GFlup7C6AYli/et+/T2qDlwsy
         QDRhLWcxWM/uqwxSjOiaRH1LVUoScVGVN8K7A6WQEwMvIrpgn7hJta7ouKDzhfnFwf6o
         173fNRX2Zbz7SYcXe1+vXN6ibr20QRwkm1/lS4tnSqSvQ/tPLAjdvzURKZKmO/57l3vm
         iFTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778879690; x=1779484490; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bN2Odr3esQrA9SWUUUdwtrw2+pd4bqhfvSZwexzSm4M=;
        b=LcRDk2KTulnxFAhiLq87raLW9wAe0eRCaUDMPgCbRqgv1thNo0Rml/yzwNTngV4Krf
         F7b/CnieO9WecYn32759cetrf7Vxxu7WGw2VtCxuwq4IaTjHLTIzq0GoZXAwbe/uCoqe
         8mh+LWgvgYvgUXnp1rCDGwnyQkG0vmQhkMjgniNEWNddX6SUQzL1dvZOMeI5PSjeURQ1
         wPdLGOwS/zZLN3Qod+nViXZ2Fapgn2CIu/WhPpIycspHb4pdz+aEplyB6vQWjghKjDbR
         ZHnTMLDcCQ1ykPZAKNxAMkw8odAVb7bdP6V2Aq7fGvXidxR9eC1PtdoAyA0gk5R6GENy
         f86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778879690; x=1779484490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bN2Odr3esQrA9SWUUUdwtrw2+pd4bqhfvSZwexzSm4M=;
        b=Ay1Ysim1PW5cv4vL3sV03AbNKNWDMmuny/eg58AXL/JmeBicK3MxOTHo8NDxQRYUjM
         x8DfT0RBBF3/AtVcP8Y7kRZtgU29C5no0OiA7+8z3vsm0a+gFh8rHiodYRP4n132Tftx
         XG9JP39ss29SHD1P7aal1i25CQqxQHFG+sGt59Jm7VSNaxYcHdaRkZ2UdmhrVBIOhULw
         tf9AJPrBSwSTmAdK4gBc/Yqc1+rFm9KErR0HZY6k7TyASBdop3byaCfgteIeV/PBOW/M
         K1PW6Iv8wPX6a/DReW+SliM6/yPMDlxK6O+jf/7zBNhhHJml5tRgR/qaJQ02wSvC5u37
         FiRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TA6GHOA//2PP5bo064VB4TvX7C8lJprCpKqR+ogix6CQ7UmYrVu469q+XaZRtwPytu98+OSwdEsXC@lists.linux.dev
X-Gm-Message-State: AOJu0YzeihmoyceEPCajeuMqpt/2HMjLsngtlu65vBADYfLzij5yDpH2
	W/3cZ0hpHQyIFwhDg6zMimb7eyVDv7HGpQ0n14Ylvyp31t0MheKGDtvvctQfU/1pDuE/SQWJS4P
	XWFJ3op52ZA3NsnEUrK/P0dHTwEDfrXs=
X-Gm-Gg: Acq92OGqeYj9ZREOPXUwGnUmUggwavTCm6xpBFMyMqS1gSpEEzvA9jVcRx6YDo6700V
	sKOWqFNLC5VRCpAVBl5y++IjXjqtTUvfWgWWbvpDRRu3z2bHrRdJ2zwL4IX/g41JDhjGg6OScCY
	2gIgRNf4bw/zkGH/qddgTXdLdZkPc9xatY5MifA7u83uatPPZpJBu6mnrkcOgFW5z/LkS3kM5no
	aTuCSYKVJos0D6X+8bh6L5yoyrcWksQGK4/Nh43Igee44+MwktNJOReHWgVaUkhJatDj59mzZfE
	TIQu69oECUc2ZkVPAe5cWU6YSlqwACEm8IwEkFb1cw==
X-Received: by 2002:a05:6402:46d6:b0:683:1cc8:84ae with SMTP id
 4fb4d7f45d1cf-683bc6b76e8mr3008766a12.7.1778879689943; Fri, 15 May 2026
 14:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177747206436.4103309.9048553717124547447.stgit@frogsfrogsfrogs>
 <177747206552.4103309.6736684975553576273.stgit@frogsfrogsfrogs> <20260514221439.GJ9544@frogsfrogsfrogs>
In-Reply-To: <20260514221439.GJ9544@frogsfrogsfrogs>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 15 May 2026 23:14:38 +0200
X-Gm-Features: AVHnY4L-Ntf5QTc8e73PEBQcDqpRfuAunh2WSJB5bCVAbcLQMwr5aJfvjlmHXAA
Message-ID: <CAOQ4uxj-JandJhCQ8VzsqqvkqCCenMFkAQxNwm9e2RRiqQqACg@mail.gmail.com>
Subject: Re: [PATCH 3/9] fuse: allow local filesystems to set some VFS iflags
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, joannelkoong@gmail.com, neal@gompa.dev, 
	linux-fsdevel@vger.kernel.org, bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 12:14=E2=80=AFAM Darrick J. Wong <djwong@kernel.org=
> wrote:
>
> On Wed, Apr 29, 2026 at 07:33:51AM -0700, Darrick J. Wong wrote:
> > From: Darrick J. Wong <djwong@kernel.org>
> >
> > There are three inode flags (immutable, append, sync) that are enforced
> > by the VFS.  Whenever we go around setting iflags, let's update the VFS
> > state so that they actually work.  Make it so that the fuse server can
> > set these three inode flags at load time and have the kernel advertise
> > and enforce them.
> >
> > Signed-off-by: "Darrick J. Wong" <djwong@kernel.org>
> > ---
> >  fs/fuse/fuse_i.h          |    1 +
> >  include/uapi/linux/fuse.h |    8 +++++++
> >  fs/fuse/dir.c             |    1 +
> >  fs/fuse/inode.c           |    1 +
> >  fs/fuse/ioctl.c           |   50 +++++++++++++++++++++++++++++++++++++=
++++++++
> >  5 files changed, 61 insertions(+)
> >
> >
> > diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> > index 95b37f4660cc1d..3b38b98dc0096c 100644
> > --- a/fs/fuse/fuse_i.h
> > +++ b/fs/fuse/fuse_i.h
> > @@ -1651,6 +1651,7 @@ long fuse_file_compat_ioctl(struct file *file, un=
signed int cmd,
> >  int fuse_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
> >  int fuse_fileattr_set(struct mnt_idmap *idmap,
> >                     struct dentry *dentry, struct file_kattr *fa);
> > +void fuse_fileattr_init(struct inode *inode, const struct fuse_attr *a=
ttr);
> >
> >  /* iomode.c */
> >  int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff=
);
> > diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> > index b6fa828776b82f..bf8514a5ee27af 100644
> > --- a/include/uapi/linux/fuse.h
> > +++ b/include/uapi/linux/fuse.h
> > @@ -249,6 +249,8 @@
> >   *  - add FUSE_IOMAP_CONFIG so the fuse server can configure more fs g=
eometry
> >   *  - add FUSE_NOTIFY_IOMAP_DEV_INVAL to invalidate iomap bdev ranges
> >   *  - add FUSE_ATTR_ATOMIC for single-fsblock atomic write support
> > + *  - add FUSE_ATTR_{SYNC,IMMUTABLE,APPEND} for VFS enforcement of fil=
e
> > + *    attributes
> >   */
> >
> >  #ifndef _LINUX_FUSE_H
> > @@ -606,12 +608,18 @@ struct fuse_file_lock {
> >   * kernel can use cached attributes more aggressively (e.g. ACL inheri=
tance)
> >   * FUSE_ATTR_IOMAP: Use iomap for this inode
> >   * FUSE_ATTR_ATOMIC: Enable untorn writes
> > + * FUSE_ATTR_SYNC: File writes are synchronous
> > + * FUSE_ATTR_IMMUTABLE: File is immutable
> > + * FUSE_ATTR_APPEND: File is append-only
> >   */
> >  #define FUSE_ATTR_SUBMOUNT      (1 << 0)
> >  #define FUSE_ATTR_DAX                (1 << 1)
> >  #define FUSE_ATTR_EXCLUSIVE  (1 << 2)
> >  #define FUSE_ATTR_IOMAP              (1 << 3)
> >  #define FUSE_ATTR_ATOMIC     (1 << 4)
> > +#define FUSE_ATTR_SYNC               (1 << 5)
> > +#define FUSE_ATTR_IMMUTABLE  (1 << 6)
> > +#define FUSE_ATTR_APPEND     (1 << 7)
> >

This feels like an abuse of the FUSE_ATTR_ flags.

Seeing that Miklos wanted to convert LOOKUP
response to a compound response of LOOKUP+STATX
it would have been nicer to get those flags from fuse_statx
only there is no STATX_ATTR_SYNC <WHY?>
I shiver to suggest adding it to statx.

Oh well, I don't know. It's up to Miklos to make this call.

Thanks,
Amir.
