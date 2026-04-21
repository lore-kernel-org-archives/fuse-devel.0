Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A527035CB76
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 23:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776814746; cv=pass; b=TjUZCMajp6rBWQxeg6kJXSri/+OjJVPyeaZlHoughC1pvfJUjn1qjRel9x6XTOWJ4hqPYsyGupg+0nfKui/FVFvwOmarsvcCiFNk5yuMCXe9MeCZn6gKg+7q2xbAZd3GN87nxqvbZh+qD7xkf8ScHznDSAFllZkKT82VznO8buc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776814746; c=relaxed/simple;
	bh=K/0qXuMnqPOiuw1PA3FUjXkc5fuY3cDfBzsQMOSxOPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eHf/iPPL9r6zuu1qozK66LNxHsKiIY9C0NhERXxuj6RhELMRVYaFgGvb3bNAFhVeXSyXUL1vAHfwRC4AamexN415INij6IyuwBldiZLPUeSYp8x2ePiKe/aYW58AP/9muvP/E2tbAc0D8IKOVxDprz/rasGj40B31bcaEHsXiqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mucDaSpG; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mucDaSpG"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d77f6092eso3275787f8f.2
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 16:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776814743; cv=none;
        d=google.com; s=arc-20240605;
        b=gWUGrXM+NQhq/2wbk02kZMNJEk/jWLkuZ9vckTBnmykhLymlnooe/BsT5voHWfPp4t
         hjswoXIFiRzveb21rdanf+3jtyHjctu54lZHRzEye3SaKwR3VxJUkjeoPBHd9pbVahVB
         0/a55M7HQ+Wmg4A4j4H+Y7w8zKI00H2mvwbZEx7WIqndlA5lOxNOefZDB4fr3iFPycfz
         Sd+GFrUyeuEG2kvQfqAnAO2LVmIkF3RxlO04fNZVIcFLqDxOGC9HJRMOZ9nnmS+Yna/n
         vIDPtqCWUokqdBrU5PHPPU8uVQhi/sHvi+AR3kK0JxW0PlIUehOWh9bF8WFOVLHj9vqE
         pKVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R8YCvYpmcL8mCmMMhiPQddE/SRE90sojRKA2ZE4nHtc=;
        fh=OeEpNwleh/IiPILDy9j4R/u3k/hixLsJpJ1XFv8Nq7Q=;
        b=cqMmBd8fJnHQWPP0wZA958ETOiEigwJxajyXtILkE33JbROw/mReEUpDoeL/TdJ8dV
         k9wdx3yXO/tiKfMgoF8AyC6hgpfOHim9ryhTKNxo24rj0MwYlkGhDLvNrpcKK71McoUU
         UokYa60S9hugGQDc+kviTZdlpu/sLiklm/pw0zqmLt9/TvHrxoi4mK/S8mez7K7A4OfJ
         uOndrHwAj5q725ujiSavAZygx6p/5gkns8JAMCCjMiLJsrLOt7KlnAwr4XX4hg07Gqqp
         id2RORmdDx8K0Gwczhd+fR4EsOynBqnRzEh8eXc8n/mQFxiBRRM8TQOoiprHi1wv1njz
         /cEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776814743; x=1777419543; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8YCvYpmcL8mCmMMhiPQddE/SRE90sojRKA2ZE4nHtc=;
        b=mucDaSpG5X1YzDQ+69yeuw+K6tFSSR0fyyutQKNE+oIr6FcfCe/Wa6K2uIC8dqXApE
         b2kgoT4KoEUVqXmdNLCWAgAf+be/Iats5cG6+Z79c7UW/0DMExgZLKg4LX25WDsTZBFA
         kDLnx+e9vhDTVgWTGiumgZEGmB+LL9YrXNsXYyRzPMqWwwsajriS7oGyBASYPVG+lrIh
         VEadImW7G9M9NUVSpQGZQ8ASzvtjDkJONaoRgS/XDlHY52qBEcvZYv2QiNSodlCOHUOh
         2E6fW7wdxAE21xw/Pp9LeMzpLdpdJ5sT3dsvsZ7TXAGnuaZkHA+CaI0Q/xFEn1Z2E8zY
         NZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776814743; x=1777419543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R8YCvYpmcL8mCmMMhiPQddE/SRE90sojRKA2ZE4nHtc=;
        b=feuUI+DARTpQTW33TQGLiUZZK46B6hr5PXO6r7O5tQSEZs0ydi0FfBiRlXelgRGZdr
         6W2ATRLlA4WW1FN7s6lXnBZx2DR8dv4KLOtPkJH476Y820d5ftLir/5y8JjmEvT8L1NV
         gzL94GMZXtYCQKEnok4VABSe3f0PoJnOQ1+pnxaFyoggSy49Xsf8EaUN+9bqMugtYbR4
         /lj/V27r3zKLer1//BPO6gEFMuzILfCii+leDao/8SmF0ePu3ngRGAW+4yYL/cWhwVCq
         cMPZYR5vT8owvZGA6drpzl14wlMjFKYC1eLNOzYGYZW58LVTmerDYkbyzqVfTAvkoQnn
         kTdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BDpx0GPzrytzVMlVBa1xEyU3ciIC1+ODMGh1m20b/HsRE7uQVg7ergAosvOsNJimAmCOYqDMb50cB@lists.linux.dev
X-Gm-Message-State: AOJu0YwoznTxuiaCkYOjnX3GQ4nCOorQt/I5HsAnePhUx3xNA749+JsV
	/f4vFYCFBzPt+r2ECKEcU2KcLfj7BB9fj5panysDMrB1BdkEe36pGe7T7znWcBsHJ6VDc1uIfk4
	l+OsLFfkSEXbALTJ6fB+qZil2ruot6Wc=
X-Gm-Gg: AeBDievsC2eNSGJ/xDVdBjq+CR3DOhehuEvkGuLO4nUQleoa1Tnf7bCP4NhmFrK+1xG
	lJdemIU+6OHt6w76UfSMBnvtfMtiivtK3o6riInPEjMj0ejmwRzIacBCjy0kLzx9wmmlfXSyZfN
	/ulFiAY0DOE/Kh79iJ0LxIiPNEC50P6a+GP4Z1QicR9ryGLqlCl59/HaGrOfSODietShxAGyOjr
	31v8XVxImkKwRRaVqxGjTddvYrXKH6pZi6lZ7hzjBXqQhwGqEZCvZB3eAIogZK+D8fIueRlIv83
	qy4KN9c2AvVVB9Io
X-Received: by 2002:a05:6000:2387:b0:43f:dfc3:555f with SMTP id
 ffacd0b85a97d-43fe3e1f3eemr31102747f8f.43.1776814742952; Tue, 21 Apr 2026
 16:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-2-joannelkoong@gmail.com> <20260421211127.GA7739@frogsfrogsfrogs>
In-Reply-To: <20260421211127.GA7739@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Apr 2026 16:38:51 -0700
X-Gm-Features: AQROBzDOCoKy_qDF_vcO_bnplfWwswkmbuHGxCdlPg6yGWmqatmwD6KTEbFRNr8
Message-ID: <CAJnrk1Z1LKss2JEKVWio8dNRRCf1X29x4NKa-p0sW1uhuP6o5A@mail.gmail.com>
Subject: Re: [PATCH v1 01/17] fuse: introduce FUSE_PASSTHROUGH_INO mode
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, amir73il@gmail.com, fuse-devel@lists.linux.dev, 
	luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 2:11=E2=80=AFPM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> On Mon, Apr 20, 2026 at 03:16:21PM -0700, Joanne Koong wrote:
> > From: Amir Goldstein <amir73il@gmail.com>
> >
> > This is a more strict variant of FUSE_PASSTHROUGH mode, in which the
> > backing file inode number must match the fuse inode number.
> >
> > This mode will allow the kernel to instantiate fuse inodes by
> > passthrough lookup and passthrough readdirplus and notify about those
> > inodes to the server, using the backing file inode number as a unique
> > identifier for fuse inodes across kernel and server.
> >
> > This mode limits the possibility to map multiple fuse inodes to the sam=
e
> > backing file, unless they are all hardlinks.
> >
> > This mode is only supported on 64bit arch, where ino_t is u64.
> >
> > Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> > Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> > ---
> >  fs/fuse/file.c            |  3 +--
> >  fs/fuse/fuse_i.h          |  6 ++++--
> >  fs/fuse/inode.c           |  8 +++++++-
> >  fs/fuse/iomode.c          | 13 ++++++++++---
> >  include/uapi/linux/fuse.h |  6 +++++-
> >  5 files changed, 27 insertions(+), 9 deletions(-)
> >
> > diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> > index 7294bd347412..f239c8a888cb 100644
> > --- a/fs/fuse/file.c
> > +++ b/fs/fuse/file.c
> > @@ -1431,7 +1431,6 @@ static void fuse_dio_lock(struct kiocb *iocb, str=
uct iov_iter *from,
> >                         bool *exclusive)
> >  {
> >       struct inode *inode =3D file_inode(iocb->ki_filp);
> > -     struct fuse_inode *fi =3D get_fuse_inode(inode);
> >
> >       *exclusive =3D fuse_dio_wr_exclusive_lock(iocb, from);
> >       if (*exclusive) {
> > @@ -1446,7 +1445,7 @@ static void fuse_dio_lock(struct kiocb *iocb, str=
uct iov_iter *from,
> >                * have raced, so check it again.
> >                */
> >               if (fuse_io_past_eof(iocb, from) ||
> > -                 fuse_inode_uncached_io_start(fi, NULL) !=3D 0) {
> > +                 fuse_inode_uncached_io_start(inode, NULL) !=3D 0) {
> >                       inode_unlock_shared(inode);
> >                       inode_lock(inode);
> >                       *exclusive =3D true;
> > diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> > index 23a241f18623..86fdf873d639 100644
> > --- a/fs/fuse/fuse_i.h
> > +++ b/fs/fuse/fuse_i.h
> > @@ -913,6 +913,9 @@ struct fuse_conn {
> >       /** Passthrough support for read/write IO */
> >       unsigned int passthrough:1;
> >
> > +     /** One-to-one mapping between fuse ino to backing ino */
> > +     unsigned int passthrough_ino:1;
> > +
> >       /* Use pages instead of pointer for kernel I/O */
> >       unsigned int use_pages_for_kvec_io:1;
> >
> > @@ -1535,8 +1538,7 @@ int fuse_fileattr_set(struct mnt_idmap *idmap,
> >
> >  /* iomode.c */
> >  int fuse_file_cached_io_open(struct inode *inode, struct fuse_file *ff=
);
> > -int fuse_inode_uncached_io_start(struct fuse_inode *fi,
> > -                              struct fuse_backing *fb);
> > +int fuse_inode_uncached_io_start(struct inode *inode, struct fuse_back=
ing *fb);
> >  void fuse_inode_uncached_io_end(struct fuse_inode *fi);
> >
> >  int fuse_file_io_open(struct file *file, struct inode *inode);
> > diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> > index 8b64034ab0bb..014b9af42909 100644
> > --- a/fs/fuse/inode.c
> > +++ b/fs/fuse/inode.c
> > @@ -1518,8 +1520,12 @@ static struct fuse_init_args *fuse_new_init(stru=
ct fuse_mount *fm)
> >  #endif
> >       if (fm->fc->auto_submounts)
> >               flags |=3D FUSE_SUBMOUNTS;
> > -     if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
> > +     if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH)) {
> >               flags |=3D FUSE_PASSTHROUGH;
> > +             /* one-to-one ino mapping requires 64bit ino */
> > +             if (sizeof(ino_t) =3D=3D sizeof(u64))
>
> Now that struct inode::i_ino is u64 and not ino_t, does this check need
> adjusting?  I think it's the case that the inode hash will work fine
> with a 64-bit inumber.a  The fuse uapi defines ino and nodeid fields to
> be uint64_t, so I think it should work even on a 32-bit kernel.
>
> That said, ino_t remains kernel_ulong_t in 7.1, so this still won't be
> enabled for 32-bit.  OTOH maybe none of us care. ;)

Ahh great point, I remember seeing the patches for that. I agree with
you, once i_ino is switched to u64, we can just drop this check
altogether.

Thanks,
Joanne
>
> --D
