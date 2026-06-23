Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C6438B13C
	for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782235810; cv=pass; b=IwTGD4T3Ct7qWSk7MUzbA4RPkQgNX+yVWwfqC5CSMr1GKYzIfc4VY+Wesq/bHB0pZx/BctwSEuEHg4+BF1WBVIhKKibHyuJGX+R0BzsAJ5KIx4ML8z2iJnwU08KxJOUC5IP+t1HlcJbOrNT+i753oE43GMMq6xOaZ0wXtPvPW60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782235810; c=relaxed/simple;
	bh=1XpXzTFHWJsw8C2JyfoXebC5Ni6jg74rJbCKW4Yfwc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBua06NS6EKsOkMbJxHUJiMrxstYnEBJ+Vczcn4sSKVYzP1KJkjtTiH10af+ji2OCEhpOjJwibau96Egm1D3uX3hE45R1al1Dis/Iag6fiLVeAyiMndiFalyAamW0MnjRbICKVwXHQTa5vWf+EAcD25reX/TpipY/baArmFe3s4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Spi1dBK/; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Spi1dBK/"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4633193af19so128985f8f.2
        for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 10:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782235807; cv=none;
        d=google.com; s=arc-20240605;
        b=VUo1w3BsWyWxxsE/cDs5ylB6BsBqb2fjMEai/5ZPCgjOECGgvqqEqdctswJXZ+1vpf
         JJQ1sFy/PqvXKQrwgve/GTPsbNqyXXAkTlr3OfHTafMzPbj/R8mrs9Cho02vQYu+CXI6
         2mBFrrw66tGcqO8Wq2Fjugq9JDr61jQ8UnZsG4Cu7TkUQw3PGINgqfpOuYsDuhoOZ9wL
         o2vaqIKXP1duJsQN25cdW1o6um9HQqjgVOgwSafj9TUn8uEb74UldyGDcDRAbSF5tDSK
         4BCrQi3dxDohhbKlg43k73zLAiGOks0oyp+W2D4oLrlrM/BiMwqYasK/vOAALN10UxEC
         2N9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RzrzEGZb0ltwNCVmNPEJth41Ktgi1EiQYCAOhqDS73Y=;
        fh=FgvDHYjC8HMKUXqTzyHoGxfUv7LShpQ4opjtOQGzfmE=;
        b=g8YcuK807E2MGFnWoTMyJJXC3+sfAWHb8WpljscSWBdythZPZ5M5gPbSl/tIZ7cl17
         yyvKWCTwHU7DRS77VGwdjAg82B/SpZrgbUtwbi4/4oyvD5Uz5Taifc0QXpiVHdsWOxxL
         Q91ylgYLTFYBO9BLEREQlP8o1FRDWgm0qrBVe1RliID11radepdb0DnWyiU/5ZC4i+IF
         6+NqHzx7ga6ELVaJTYQeoo++Dp9IHcqya0CDLhUguf6VAlY3d8ObkA6G3D/qsrT0gcFE
         X2guhEcw/deAcZ3j7BnLkkNGFkiptNDBjybda/Epd7ReAgzPogjBHevNFFGbeUSh8hny
         EmXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782235807; x=1782840607; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzrzEGZb0ltwNCVmNPEJth41Ktgi1EiQYCAOhqDS73Y=;
        b=Spi1dBK/V5mVgZ63YgmZ+zZsM/274Vpk5nOUHEpByNpTKtklSW3/gDtwNkXoIfAT+v
         CxJopNJbb/dPFKn2qzyX2MhqaYvxzWMW5Z/imZEVtGIMHIpCsKpeV1Q9ezF5J/eWfMgh
         a9vthVHUhcL9AROJDM046L/MT2WEpD6+CL/9l91IJq7/kS7yBIVv0xPEQ8D+/Vyg8c9o
         Gpm/HOE/JisPVhuQPtknfBxv8VPSbrE0anr8j+pfmoqNO28a6aSe328/h1Rh3QNCaxXp
         /tEmTxO/TNEV2/9bws2ReDDU1Nt+5KXryPM1EelXeJ/eHdGcazAfQf+pJCeHluXGhGKO
         nK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782235807; x=1782840607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzrzEGZb0ltwNCVmNPEJth41Ktgi1EiQYCAOhqDS73Y=;
        b=BvSkdX8BxXePBXAqbjW9wh/8ZPYTuh88TgptT/NIsx1psgtUAIVIrFdqcYbDt1dBaD
         KLvyoIdyxbMiiWKg7cflfCO4Z/c8vcqVJ0tGq4rIJLjMtMmmm+8hWeTi2A5dH7nG2WMP
         gYHGkSFkF5Tzfm21FhCfOGBBsaXOKt0fWcUmLEvy/Yu4Zqj3u3CiqecfXAQQ/i8YRajs
         +58s6e+KyIkbZkAFZ/CFQFk5maIVQfNqEyvW0fSgpKZZqNHgkKSRtLMVQAEyfeyyG5wX
         TE73JBsESrCqaHrUraT3cKSsKniRAUR6CgdWl9dV01QFuLK+oqabtOBFE+BFoefMXveZ
         841w==
X-Forwarded-Encrypted: i=1; AHgh+Rod8ysJ36USw7jg4oIueHUIbJivtYpibdaHII4IZjjVyHS2CrS3FtyMA/3r9iwZNMoA+Xh5axDSSbyw@lists.linux.dev
X-Gm-Message-State: AOJu0Ywzxml2hPWZzKnhY8Ka8RDI8Z19BOjdLCLaGo2djiw8VazrxIWH
	tPFTIk+9Y5NduqVqd9i2YwfuZKCEyAkgq8EAD+sPdFZ4IXqW7I5EHrWgBpqjWphWKKPdoomILt2
	VgkqL/C+KjWKiUi/ZAKd/A73IYnW4M1Y=
X-Gm-Gg: AfdE7cnWn9+n9nGs9hovTnte68M3R/Ob8MlVbrt7OLjoCHqZ3Sz2KQwiqaKmSCfIk18
	2N/pnDBI8ZTNTMVbaxT9HBLtsyd0LNnrrEgg1qQEaUjR8aZiEasR1trwMoQ/j0E233WrBN57/XT
	rO9naiHW86Id9yz4ADz7XkZyG4hqsDGxydEBa4xqbq0WutOBcjKRq2z3W1TbSEh66r/nglKDd0v
	0pEzKIGZ5f8sUmDw/YC/i+gKYU4a+Z1Gsu6Ya/ATjwSoxqPQj9OckuwAGxdfsmPN06wLztQyRkk
	wCJzkLYq7qO0BaixNCv9VakcGYLoMlmQnIt8jCwIDmrGDBTZQPVV
X-Received: by 2002:a05:6000:22c6:b0:460:3233:beed with SMTP id
 ffacd0b85a97d-4666348bb1dmr24453136f8f.41.1782235807180; Tue, 23 Jun 2026
 10:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623135208.1812933-1-hch@lst.de> <20260623135208.1812933-3-hch@lst.de>
In-Reply-To: <20260623135208.1812933-3-hch@lst.de>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 23 Jun 2026 10:29:54 -0700
X-Gm-Features: AVVi8Ccm_eFaYYj-vQlgAXEMOrnUjeoeLhiRjoMn01eUhrTiB_xWHROB6LeYb7s
Message-ID: <CAJnrk1agx-qUizNzCnzvZ6Marf7u-K4EtKOak4c2MQN1sJfgNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iomap: submit read bio after each extent
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Kelu Ye <yekelu1@huawei.com>, 
	Yifan Zhao <zhaoyifan28@huawei.com>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Hyunchul Lee <hyc.lee@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 6:52=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> Currently the iomap buffered read path tries to build up read context
> (i.e. bios for the typical block based case) over multiple iomaps as
> long as the sector matches.  This does not take into account files
> that can map to multiple different devices.  While this could be fixed
> by a bdev check in iomap_bio_read_folio_range, the building up of I/O
> over iomaps actually was a problem for the not yet merged ext2 iomap
> port, as that does want to send out I/O at the end of an indirect
> block mapped range.
>
> So instead of adding more checks move over to a model where a bio only
> spans a single iomap.  Change ->submit_read to be called after each
> iteration, and pass a force argument to indicate that the bio must
> be submitted set on the last iteration.  Switch the bio based users
> to always submit, while keeping the single submit for fuse.
>
> Fixes: dfeab2e95a75 ("erofs: add multiple device support")
> Reported-by: Kelu Ye <yekelu1@huawei.com>
> Reported-by: Yifan Zhao <zhaoyifan28@huawei.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/exfat/iomap.c       |  4 ++--
>  fs/fuse/file.c         |  6 +++++-
>  fs/iomap/bio.c         | 11 +++++++----
>  fs/iomap/buffered-io.c | 23 +++++++++++++++--------
>  fs/ntfs/aops.c         |  4 ++--
>  fs/ntfs3/inode.c       |  4 ++--
>  fs/xfs/xfs_aops.c      |  5 +++--
>  include/linux/iomap.h  |  5 +++--
>  8 files changed, 39 insertions(+), 23 deletions(-)
>
> diff --git a/fs/iomap/bio.c b/fs/iomap/bio.c
> index 0f31e35567b4..f71aaaf60301 100644
> --- a/fs/iomap/bio.c
> +++ b/fs/iomap/bio.c
> @@ -79,7 +79,8 @@ u32 iomap_finish_ioend_buffered_read(struct iomap_ioend=
 *ioend)
>  }
>
>  void iomap_bio_submit_read_endio(const struct iomap_iter *iter,
> -               struct iomap_read_folio_ctx *ctx, bio_end_io_t end_io)
> +               struct iomap_read_folio_ctx *ctx, bool force,

nit: might simplify things to drop the unused force arg

> +               bio_end_io_t end_io)
>  {
>         struct bio *bio =3D ctx->read_ctx;
>
> @@ -87,13 +88,15 @@ void iomap_bio_submit_read_endio(const struct iomap_i=
ter *iter,
>         if (iter->iomap.flags & IOMAP_F_INTEGRITY)
>                 fs_bio_integrity_alloc(bio);
>         submit_bio(bio);
> +
> +       ctx->read_ctx =3D NULL;
>  }
>  EXPORT_SYMBOL_GPL(iomap_bio_submit_read_endio);
>
>
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 8d4806dc46d4..06a216d37548 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
>
> @@ -642,12 +649,12 @@ void iomap_read_folio(const struct iomap_ops *ops,
>                 fsverity_readahead(ctx->vi, folio->index,
>                                    folio_nr_pages(folio));
>
> -       while ((ret =3D iomap_iter(&iter, ops)) > 0)
> +       while ((ret =3D iomap_iter(&iter, ops)) > 0) {
> +               iomap_submit_read(&iter, ctx, false);
>                 iter.status =3D iomap_read_folio_iter(&iter, ctx,
>                                 &bytes_submitted);

should the submit_read happen after the iomap_read_folio_iter() /
iomap_readahead_iter() instaed of before? From what I see, it looks
like iomap_submit_read() would hold the iter state of the next
mapping. It seems like in iomap_bio_submit_read_endio(), the
iter->iomap.flags would be the next extent's flags instead of the one
that needs to be submitted?

Thanks,
Joanne
