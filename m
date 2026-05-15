Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6200B3E0C40
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 20:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778877230; cv=pass; b=h3hBalgYLFMNie5Bm6JUIVOkkrWw1twFcS9w1oUnu/z6aOMThSgnBtAnoj0quDF1OekkNVthw974WksoTCKAO6Pb27DHeiJ5S2Btf8vDp2IfrLamhevaTTshYsrIfMvNP+Khhb15gXWTczACz4BYFMPrtQnLEh/0fr5YUGCn4ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778877230; c=relaxed/simple;
	bh=sJ08cfxGxtMWEPXCgzYLZJMNbjtpjryi3KoiukkfceI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u62biQWNCiAmpJWyly8FDY6tvYqurZKx7qzEqv8PkG9h58TuzgBo57lwjSAGQbthj83KKd98Ujs4l4jpO24qzajorPr5zoEI/ZW9NaR6gRu9q92hx5W28RAGx0Ztf0g5y731kKf0q6KGmYN9Sn1+bSZkHeGrW1Dd1ssV5WZn/3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Im1EpaZH; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Im1EpaZH"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67929ff6dbfso468149a12.2
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 13:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778877227; cv=none;
        d=google.com; s=arc-20240605;
        b=BvgxNC78Knk2MPQwr0tJlwM88n3qMFLgvbPEao5K1bMvCsHX7nSeWIK1jWHGTsZATi
         NyTwGwdfco05sEtWK8xQ4Is03A+sy86NJ5eRAOSv0Iq3Uia3u4yxKUopxGzHYEeiKxTQ
         WuYMiNnnDGLfBimi/L5Uqgx4KB7bIBkBtlSjgYWFiBOOoUlj+fqWjJECOZfXA2cDw1hP
         m6SIGWDUIO/mDgU4yLnRLre1lBUcO9iDc82PMuuxQ5AM0X3m7iftHdVf3ovQMLbSz4LY
         +4LiJyMWWFfN8wQGi+5R4uXtXeyko90tdIufUP/+dT0ukn7n3rO3E0uCqBM4slnjLH8J
         z3cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9YwlJJcvYwY8fns8m48KGL1VHm6uk+SQqlLXYhIKgz8=;
        fh=t2tHLq5FfNrk5xiI6ccEeK7jhqyys61qhOAXjUrWMis=;
        b=KIVJJrxdF14Ja7rMveZOo9ERZr4k7IJpgNAfNun8ejLphWZEWJK1ZQRYDUaTgM1+az
         YObyLCol78jt0C1b0cD6pcgfqLfSCW6ej7FPThIZyrEZie5onh5zRWpRQfSk5aVw3SDO
         Rz695WYMsCaywZ7Ghbi0XnLQZHcKz/UbLZGhmKfdBE+Kq6gZ9raVNOOsTbxox1MnTU9L
         BLe0h+9kueoDhtl58hIRf891B68WOAiAus5iupCw7NMW3LEu/7GBoBDqN02ikP868H/u
         u5J8T7m88hsJaBCXoGlBkg3JdRg4h7kDorxiqCfVcqaKKQi64GybN0yrJhYat5kpCPd8
         T92Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778877227; x=1779482027; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YwlJJcvYwY8fns8m48KGL1VHm6uk+SQqlLXYhIKgz8=;
        b=Im1EpaZHRAMpcyHR5bQFiz4qOSrTUXMLIUJINZdX/pvBFVfi+k71LYLMY0AjInXND+
         tloqdb5CPY/LesoL7qu8Xz+Ob+/fKVx+e4t3j729qVBne5YK5wQuHf/QIwEL3ikzra8+
         Gekk8eVPH0I+ZdHLHtMSfTQKjH7mPEaHM4aNctQuAni2vDioTxdkULOhhYnnpKo17PiU
         IbhkGPxKh5jsJGwDq1TYSYNcnD6zWD4XBbhZ9jFur3YKtKs9Do4CeWI6K5xbgU4VwpRX
         QVoqGsseVcNxFYSqK3HDNzZe5yvSPTO9ChOigE/sIihd3jxdoqqu/DbwEYklzcyqyAI7
         RqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778877227; x=1779482027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9YwlJJcvYwY8fns8m48KGL1VHm6uk+SQqlLXYhIKgz8=;
        b=LBtrqTXoxF6pfKHBjy5Abd+K1Q8haBec8LBhvgdBKVVKyczIevauDuimQ19FTwI67e
         kyaqJOHECKbnBTcj4TBg2ZVn4nJxjsSbjgEwzVctXlljwuQJfWICaLgkbpK+wGBtpojo
         dhFit7FkqlLO0yRQ1BRA65qO4tbMVbgP1TT/9OTMJFruhb4xWcxCETzgRqmyRq5hFJHJ
         6B3QVagz6DFPOtTFKybGUFzod/QnWgnyp1j40HTiX8PUfO08UY8X/V+2bO4oRnI2RtyF
         3denrFLhHutPNutzQTkPFpBnx+UU0tPRLx9ee5EZI07vjFCzk0wevOYKqPlKeN28FT36
         VJSg==
X-Forwarded-Encrypted: i=1; AFNElJ+2TB4wrHzYLc05fX4wVtvk6/8ieY5Xo1/Sn/CjT04mGnd4YZV+rxTk2TssI383VTGM2JtdJXY+zpX1@lists.linux.dev
X-Gm-Message-State: AOJu0YyB47JsiEQZSbLLX67e6FnN/XbzJLdMaH+9rcnLShHsA2NxfoDw
	HfLLgEdGUHWxpjvVViDiWRdqI7PIL0N26jdngJNeO0+cmc5p5JXasHqHAWrAF7rsERcBmAmkIjW
	ny9vXI3R+dviZlLtkJ5iWyk3Nv10VrTY=
X-Gm-Gg: Acq92OGPaKYIL9hkQ8rKsOoMBK2nlnj643tke0ZaRi5lzlU03au5rFiPY4AZhhRG3he
	qn10cyOExd33QyG9dTubRimXQisZ23bmBQKqpxE1EQXzrIJGfRIgbQKBkM9UwkXEhr8uz8mAntN
	fROPzkzUFN3zmWsQacNuPUjoJ7oJILYHhIu69NxKRIgAFZryW1X4fOAv0Ffq4T53oqUE3K09lE3
	wqEnN9E6q/c3NBGR1KPMkoZ3MksjhmvAwTAp96E+j+t8vd6iG/qVHVofi7RIYynm4gvTCalse09
	KQt+iUp/rO9sPnoioLAH5aRYyNjXCYvG17n1D4mKoQ==
X-Received: by 2002:a05:6402:1f45:b0:67b:7d77:14da with SMTP id
 4fb4d7f45d1cf-683bc8a94b8mr2651562a12.8.1778877226469; Fri, 15 May 2026
 13:33:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177747206436.4103309.9048553717124547447.stgit@frogsfrogsfrogs>
 <177747206510.4103309.7610933581068572895.stgit@frogsfrogsfrogs> <20260514220921.GI9544@frogsfrogsfrogs>
In-Reply-To: <20260514220921.GI9544@frogsfrogsfrogs>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 15 May 2026 22:33:34 +0200
X-Gm-Features: AVHnY4I8kyXSTZqiDtcBeg8yln7B_x_AdIYn1XaB6rWDgusxSClx6hrtRtpnpKI
Message-ID: <CAOQ4uxja1znK3pz3YAX2uFM-GFVS1zENHJzHBLAVrVqcz6bVhw@mail.gmail.com>
Subject: Re: [PATCH 1/9] fuse: enable caching of timestamps
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, joannelkoong@gmail.com, neal@gompa.dev, 
	linux-fsdevel@vger.kernel.org, bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry I was absent from iomap review for a while.
Using these Codex replies as opportunity to get back to it..

On Fri, May 15, 2026 at 12:09=E2=80=AFAM Darrick J. Wong <djwong@kernel.org=
> wrote:
>
> On Wed, Apr 29, 2026 at 07:33:20AM -0700, Darrick J. Wong wrote:
> > From: Darrick J. Wong <djwong@kernel.org>
> >
> > Cache the timestamps in the kernel so that the kernel sends FUSE_SETATT=
R
> > calls to the fuse server after writes, because the iomap infrastructure
> > won't do that for us.
> >
> > Signed-off-by: "Darrick J. Wong" <djwong@kernel.org>
> > ---
> >  fs/fuse/dir.c        |    5 ++++-
> >  fs/fuse/file.c       |   18 ++++++++++++------
> >  fs/fuse/fuse_iomap.c |    6 ++++++
> >  fs/fuse/inode.c      |   13 +++++++------
> >  4 files changed, 29 insertions(+), 13 deletions(-)
> >
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index 3a76eea04c6425..11898102adefe2 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -2265,7 +2265,8 @@ int fuse_do_setattr(struct mnt_idmap *idmap, stru=
ct dentry *dentry,
> >       struct fuse_attr_out outarg;
> >       const bool is_iomap =3D fuse_inode_has_iomap(inode);
> >       bool is_truncate =3D false;
> > -     bool is_wb =3D fc->writeback_cache && S_ISREG(inode->i_mode);
> > +     bool is_wb =3D (is_iomap || fc->writeback_cache) &&
> > +                  S_ISREG(inode->i_mode);
> >       loff_t oldsize;
> >       int err;
> >       bool trust_local_cmtime =3D is_wb;
> > @@ -2405,6 +2406,8 @@ int fuse_do_setattr(struct mnt_idmap *idmap, stru=
ct dentry *dentry,
> >       spin_lock(&fi->lock);
> >       /* the kernel maintains i_mtime locally */
> >       if (trust_local_cmtime) {
> > +             if ((attr->ia_valid & ATTR_ATIME) && is_iomap)
> > +                     inode_set_atime_to_ts(inode, attr->ia_atime);
> >               if (attr->ia_valid & ATTR_MTIME)
> >                       inode_set_mtime_to_ts(inode, attr->ia_mtime);
> >               if (attr->ia_valid & ATTR_CTIME)
> > diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> > index fa67b20f5ad3ae..eecd0610fbd3e5 100644
> > --- a/fs/fuse/file.c
> > +++ b/fs/fuse/file.c
> > @@ -262,7 +262,7 @@ static int fuse_open(struct inode *inode, struct fi=
le *file)
> >       int err;
> >       const bool is_iomap =3D fuse_inode_has_iomap(inode);
> >       bool is_truncate =3D (file->f_flags & O_TRUNC) && fc->atomic_o_tr=
unc;
> > -     bool is_wb_truncate =3D is_truncate && fc->writeback_cache;
> > +     bool is_wb_truncate =3D is_truncate && (is_iomap || fc->writeback=
_cache);
> >       bool dax_truncate =3D is_truncate && FUSE_IS_DAX(inode);
> >
> >       if (fuse_is_bad(inode))
> > @@ -477,12 +477,14 @@ static int fuse_flush(struct file *file, fl_owner=
_t id)
> >       struct fuse_file *ff =3D file->private_data;
> >       struct fuse_flush_in inarg;
> >       FUSE_ARGS(args);
> > +     const bool is_iomap =3D fuse_inode_has_iomap(inode);
> >       int err;
> >
> >       if (fuse_is_bad(inode))
> >               return -EIO;
> >
> > -     if (ff->open_flags & FOPEN_NOFLUSH && !fm->fc->writeback_cache)
> > +     if ((ff->open_flags & FOPEN_NOFLUSH) &&
> > +         !fm->fc->writeback_cache && !is_iomap)
> >               return 0;
> >
> >       err =3D write_inode_now(inode, 1);
> > @@ -518,7 +520,7 @@ static int fuse_flush(struct file *file, fl_owner_t=
 id)
> >        * In memory i_blocks is not maintained by fuse, if writeback cac=
he is
> >        * enabled, i_blocks from cached attr may not be accurate.
> >        */
> > -     if (!err && fm->fc->writeback_cache)
> > +     if (!err && (is_iomap || fm->fc->writeback_cache))
> >               fuse_invalidate_attr_mask(inode, STATX_BLOCKS);
> >       return err;
> >  }
> > @@ -820,8 +822,10 @@ static void fuse_short_read(struct inode *inode, u=
64 attr_ver, size_t num_read,
> >        * If writeback_cache is enabled, a short read means there's a ho=
le in
> >        * the file.  Some data after the hole is in page cache, but has =
not
> >        * reached the client fs yet.  So the hole is not present there.
> > +      * If iomap is enabled, a short read means we hit EOF so there's
> > +      * nothing to adjust.
> >        */
> > -     if (!fc->writeback_cache) {
> > +     if (!fc->writeback_cache && !fuse_inode_has_iomap(inode)) {
> >               loff_t pos =3D folio_pos(ap->folios[0]) + num_read;
> >               fuse_read_update_size(inode, pos, attr_ver);
> >       }
> > @@ -870,6 +874,8 @@ static int fuse_iomap_begin(struct inode *inode, lo=
ff_t offset, loff_t length,
> >                           unsigned int flags, struct iomap *iomap,
> >                           struct iomap *srcmap)
> >  {
> > +     WARN_ON(fuse_inode_has_iomap(inode));
> > +
> >       iomap->type =3D IOMAP_MAPPED;
> >       iomap->length =3D length;
> >       iomap->offset =3D offset;
> > @@ -2021,7 +2027,7 @@ static void fuse_writepage_end(struct fuse_mount =
*fm, struct fuse_args *args,
> >        * Do this only if writeback_cache is not enabled.  If writeback_=
cache
> >        * is enabled, we trust local ctime/mtime.
> >        */
> > -     if (!fc->writeback_cache)
> > +     if (!fc->writeback_cache && !fuse_inode_has_iomap(inode))
> >               fuse_invalidate_attr_mask(inode, FUSE_STATX_MODIFY);


It is so easy to get lost in the code handling attr cache coherency
between kernel and server, so many little details (a.k.a maintenance
nightmare). It's not great now, and becoming worse with iomap.

On top of existing writeback_cache special casing and now iomap
more special casing, passthrough code also has special cases
that may need to be handled better.

Can we maybe abstract some of these open coded checks in
a way which is easier to review?

Thinking about some attr_mask in the inode which determines for
every attribute, who owns the authoritative copy, server or kernel.
For example, for (writeback_cache || iomap)  kernel owns ATTR_MTIME.

This is very hand wavy and far from dealing with all the complexity
in every specific case, but the bottom line is - very hard to review that
this is all correct and nothing missing and very hard to figure out
what's going on when looking at the code
for humans I mean... Codex seems to be doing well ;)

Thanks,
Amir.
