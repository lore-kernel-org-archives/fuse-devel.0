Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDE2199E89
	for <fuse-devel@lists.linux.dev>; Fri,  3 Jul 2026 00:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783037837; cv=pass; b=gezex0wvjk/mwgzGee6TVpgFuFumVysL4qB44xum7wOblQaG9iDz2p3dyP7Ep4mIZ6g9y0IdtVvFu79Bfgu+cJ3L1G0ZFJkUxxwm9pbw24DUfKVV4glme0+V/6zLBkml2Ki0cGoFC0PeNsccq4lpPqo7IpEqsCmkkZb4WQ/Ex7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783037837; c=relaxed/simple;
	bh=kRH5ME6cl2uOZNTf4Hz7cjp4HebVSYInnLBFWd3k8/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJpzDru+K6V2Ty2UduxCS4icX/94CQE7PSfQPcuqlaMd4QPCF796LNLYrBcLA8ekovTJJ4pmK4myqhKMUns9dLu2rcC5uqBxvzQqDz0l/R1E85uWe8g6g92DXXa1fWZ00160DB8H6EMZi2LCjvYFx/mL1ChJZNEB9UIZ2dGCAlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBchV30U; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBchV30U"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c59f740cso8115365e9.3
        for <fuse-devel@lists.linux.dev>; Thu, 02 Jul 2026 17:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783037834; cv=none;
        d=google.com; s=arc-20260327;
        b=G+eJ86ZgJ2FS3v6m3dAba0g0CWJSlWiyvfpDPiyOWI+yV5v38M4eoVgw2L/tpmAbD4
         mwJ6dytSV/PBn6P0dsNGxav+BTmrPIbQiRoHoXVFW5MJORgl3IjgL9Gp+31m5ng3LKpu
         lbQAWkhxh4QJJ+6E90minP8YHUJbtZneDIKiLEK4IQpvXN4lnKjnaD/OkLc8qdtmQR6m
         nYxTRvxBXOYsz2KUeR6uwBioyfBtWg5ZWrLmEEPTqjSb+wmjQ2yZN/yA/iOus3fh34JX
         ve9W2zX4LByDVrcTuE/fB6ctOv/m9U9aSgFQWC17riy5sCi3Y2do7CBBNwYUE7wlC/Rt
         480A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vU7OEUrLlyve1bXZ6P0sGV5EAt2DQDqFHvcpp7wTUdg=;
        fh=3sUL2lQXzIQ9KUTbrtrXpoI0qYq41o2OzosMdLnPgoA=;
        b=G7UI1QgMEJABpYNzELrrNAFp9ZD+WZklpYL/jjxNcNF1y3Wt3xWyc0SuFKqG9yPPsE
         ylFrBUMUVeUpjVtmUydPVVcLW8TPjjgbIXuG6vYT6TtZd5Zva4R5FF88wqfzDarbpfIt
         Yxlz1XBuEHJWVpBc0p7mNWI660tQiGjqoFBLgSHlrJjTPXqwIb9rW455XlBZ392DyVnu
         xVeaycftluEXoLEIH7iXR1SZhR2+qBzquylAcSVGMZeJ5NyokqspZ+DJz+iHXbY8TJtV
         HpupQ1AOMG37UPYunI7WfBfGdw8W0vnXJm+W1KVXBaD8u0vQv4sKEzJBeujrQK34EH0T
         cBRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783037834; x=1783642634; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vU7OEUrLlyve1bXZ6P0sGV5EAt2DQDqFHvcpp7wTUdg=;
        b=tBchV30Uub+P+NkFmtsnfZbLWBXKPtWYqaNFPV3tgiaS3MhvG8cHqkQriOkVS49D8J
         nf4V+ROheyi4afaZ+JaYHs15DqV6tnOKQ25Y/BAk2QIlT6jdiYb1M/B6x2Bva41FJDHp
         U/fy8ES7ElanDgMDDrFEAzXooxqppSUydwMMJrrJAQboJ7UulsH1HhKomSr1Elqd0elF
         y0mweFEjdU6A3z4CwySUiddgdFuwktOLfjNcIszkjBQG6ieTMErMAns+2CA6Woc0YKud
         QAiWb7sFYf5QNNKMRuehB1RmIKNpl/AwjrQvGhuSpX5jcNrmkLy7hxUQ5KuIvVKOlqRs
         ooPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783037834; x=1783642634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vU7OEUrLlyve1bXZ6P0sGV5EAt2DQDqFHvcpp7wTUdg=;
        b=WvXrP4+suLJsUZON0O7rl8UrlQHemXLe4MJ9oAvCIA/7kf6tkNF6Ti14ohyxaZw8Az
         C3NgXW/t/e/K47yTasDFlYwnQY/EGT+uOssFRLPs6fsQl4U0wAkMCFlOeccTKK8mH7uI
         vn4zzYZK5JvoBPjvLVm0KSApNsPFlbRYAd3eYIfRSjchu8JUyliBW9hk6YIA7m3v8swS
         IgaG6huMCDMC3LFpP8nYUsU5iWdMPohTBLpuFRW5R98/4cpQfT0OHm5cbmj4L0FydSoG
         BbdCP8OQosSWnDsWwf8EBDp8upuJOc4uVoleoKBofKSt1ux5O5fj0rYz2Ysg7rEKV6aJ
         8Cmg==
X-Forwarded-Encrypted: i=1; AFNElJ9eMOzg1yMZvAPFdrrwYRL6LKkJxfyY8/Fk8ollmmDXRv8gANR2pE+DhfKOjZGEHy8t2mjhc+OssAxT@lists.linux.dev
X-Gm-Message-State: AOJu0Yzln10RCrQ/Jz/aFnjlkDN1r7fH0Mif6QWe0eK/deYiExWis86/
	qHjfD+pb16AE25WzI+n0AobyqDrxzqMdxlaPrIZxRsw06UBm0cos2Ck8fKmT0gWRbpVPQCn9w4Y
	svrY1GBzX1ULyYqSIApUrfKAt8BuRMsk=
X-Gm-Gg: AfdE7clsCy4fgWusE8YlEe7trpx/nrZ+vWPBoCNXCWDinTjmWk59LJy/1HjSdxmSv68
	UCd9CIPCNCbwdpgn+F8WgkSf0mxcPFICtnJAOaDGfLr7efnqYstXXkz7K5ALgrinn0tGbze1MKT
	3Ad2jUxHDtF4f+igUWrXxgqAoxp7UhQ6eOktDA//EUdNixylmVTKaN44X08HZWvlq9tSiZm3QN1
	H8Lg+haWbIMu5LSf0ZxNDgHyNyg5ig+ySPS1f+Px5gXdGCtnJ5E+FLguH0edPIQKn0vkb8NGZIM
	3ignQeSKM73/jhdeqsWNWrpPsEsbClrInKbY/8ygJ6bdD2mil9C88/V4tNZK+c4=
X-Received: by 2002:a05:600c:46d0:b0:493:bc4a:c6b6 with SMTP id
 5b1f17b1804b1-493c2ba1d3emr113298325e9.38.1783037834179; Thu, 02 Jul 2026
 17:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
 <20260701000949.1666714-18-joannelkoong@gmail.com> <20260702165841.GM9392@frogsfrogsfrogs>
In-Reply-To: <20260702165841.GM9392@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 2 Jul 2026 17:17:02 -0700
X-Gm-Features: AVVi8CcxJan3XgaMiYmE7l9m1K7rjamtB3vH8NBAZsWn7x4K1BrIcNnVAJIzZPo
Message-ID: <CAJnrk1YW0gKRVvHRC+WeKoV2vrquzaC6UkipZkQ34Z0RAQDjtg@mail.gmail.com>
Subject: Re: [PATCH v2 17/18] iomap: pass iomap_next_fn directly instead of
 struct iomap_ops
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: brauner@kernel.org, hch@lst.de, willy@infradead.org, 
	hsiangkao@linux.alibaba.com, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Chris Mason <clm@fb.com>, 
	David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Dan Williams <djbw@kernel.org>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
	Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
	Chunhai Guo <guochunhai@vivo.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
	Baokun Li <libaokun@linux.alibaba.com>, Ojaswin Mujoo <ojaswin@linux.ibm.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Zhang Yi <yi.zhang@huawei.com>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	Andreas Gruenbacher <agruenba@redhat.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, 
	Hyunchul Lee <hyc.lee@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Carlos Maiolino <cem@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, 
	Johannes Thumshirn <jth@kernel.org>, "open list:BLOCK LAYER" <linux-block@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:BTRFS FILE SYSTEM" <linux-btrfs@vger.kernel.org>, 
	"open list:FILESYSTEM DIRECT ACCESS (DAX)" <nvdimm@lists.linux.dev>, 
	"open list:EROFS FILE SYSTEM" <linux-erofs@lists.ozlabs.org>, 
	"open list:EXT2 FILE SYSTEM" <linux-ext4@vger.kernel.org>, 
	"open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>, 
	"open list:FUSE FILESYSTEM [CORE]" <fuse-devel@lists.linux.dev>, 
	"open list:GFS2 FILE SYSTEM" <gfs2@lists.linux.dev>, "open list:NTFS3 FILESYSTEM" <ntfs3@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 9:58=E2=80=AFAM Darrick J. Wong <djwong@kernel.org> =
wrote:
>
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index 3f0932e46fd6..0aa8abc438c1 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -626,7 +626,7 @@ static int iomap_read_folio_iter(struct iomap_iter =
*iter,
> >       return 0;
> >  }
> >
> > -void iomap_read_folio(const struct iomap_ops *ops,
> > +void iomap_read_folio(iomap_next_fn iomap_next,
>
> If you took my earlier suggestion to rename the typedef to
> iomap_iter_fn, then this parameter ought to be named iter_fn.

Hmm... maybe at that point, it's self-explanatory enough that the arg
could just be called "iter" instead of "iter_fn"?

>
> >               struct iomap_read_folio_ctx *ctx, void *private)
> >  {
> >       struct folio *folio =3D ctx->cur_folio;
> > @@ -650,7 +650,7 @@ void iomap_read_folio(const struct iomap_ops *ops,
> >               fsverity_readahead(ctx->vi, folio->index,
> >                                  folio_nr_pages(folio));
> >
> > -     while ((ret =3D iomap_iter(&iter, ops)) > 0) {
> > +     while ((ret =3D iomap_iter(&iter, iomap_next)) > 0) {
> >               iter.status =3D iomap_read_folio_iter(&iter, ctx,
> >                               &bytes_submitted);
> >               iomap_read_submit(&iter, ctx);
> > @@ -688,22 +688,22 @@ static int iomap_readahead_iter(struct iomap_iter=
 *iter,
> >
> >  /**
> >   * iomap_readahead - Attempt to read pages from a file.
> > - * @ops: The operations vector for the filesystem.
> > + * @iomap_next: The iomap_next callback for the filesystem.
>
> "The iomap iteration function for the filesystem" ?
>
> Using the term "iomap_next" in the definition for iomap_next isn't that
> helpful.

Agreed, I'll replace this with your suggestion.

>
> >       return ret;
> > @@ -824,16 +824,16 @@ xfs_file_dio_write_atomic(
> >       unsigned int            iolock =3D XFS_IOLOCK_SHARED;
> >       ssize_t                 ret, ocount =3D iov_iter_count(from);
> >       unsigned int            dio_flags =3D 0;
> > -     const struct iomap_ops  *dops;
> > +     iomap_next_fn           dops;
> >
> >       /*
> >        * HW offload should be faster, so try that first if it is alread=
y
> >        * known that the write length is not too large.
> >        */
> >       if (ocount > xfs_inode_buftarg(ip)->bt_awu_max)
> > -             dops =3D &xfs_atomic_write_cow_iomap_ops;
> > +             dops =3D xfs_atomic_write_cow_iomap_next;
> >       else
> > -             dops =3D &xfs_direct_write_iomap_ops;
> > +             dops =3D xfs_direct_write_iomap_next;
>
> Probably ought to be called iter_fn, or at least something that isn't
> "dops".

Nice spotting, I'll rename this in the next version.

Thanks,
Joanne
