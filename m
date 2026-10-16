Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA264E2F24
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 16:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166659; cv=pass; b=n09OuMIf9iWyaZAGTSPx0Ysh/D5RfSDb4Jyiq2EKHbn5ZcDqNDiKgcy6BFc+5wJ+aSknrCeb/jOgCzFd68ok/ueJR3W8Zw+eb29I3nakz7mxku/SEYf8SCaVFrnz2R6z4r4nMyol4SsmTv1OQnBAn1Gf8jJ782N3OPWSZ9yITHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166659; c=relaxed/simple;
	bh=9lv8y/8boJJYeoN6PZYJjxSqtNYDKsLSBds0Xi+bxrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMmRRsWdqzOPFM9iyjs8qJWopoDWgqWIQJ6S6H6UUsrh/GkBUX+AQR5nD1N6Fd4O3Nomcqk54y8458yH0mUhFpXyKgq8yCFmhw35ZjHunmwZccHuGsizSaIXcKn9QwT8QlhQlmjbBi0E/Sc9WYoNYvhM1BaFDH2+aH51c4NSL7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTk0g8EL; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTk0g8EL"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so870909a12.2
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 09:04:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792166652; cv=none;
        d=google.com; s=arc-20260327;
        b=AiJDo2m/RFMCoEbBTIEoo2EVlrHwyCukaDnKRjwemUB/RMGHLHk62tQBUTt4kArtnx
         xj89JZ6aEgcFSmwSc247o6lTc14feahbxLiesH8I0UcZDlR6K/wBc4yLT28dsFINQtdy
         eCxyCn57Xs8vAxdBswB55SwH1Cvffs8J2BdIXzcYXKZyJaNY6UIMAZEbmPPr8cIIH7sB
         pDLuHZjeN4YYA7qFK8dYdWvsy37ZLn/Ok7GCLV2dlEh9lT1V3SALiQ2Ika7DCY2GavKa
         n9sazZ8mNaQLbyMH6/WdmZYsxZs3prjQZ0zILRRTmO0IPQcyvZr9J6P+FyXxQTWDjP90
         /KYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0XT9gf6Lc+1fX8Xrkj2lJ0FO4HQTQ65QLq9M5IgaTRo=;
        fh=IJpiE2CUv2MmfEQ/Pv7lUs9fZh6skBgWyHXkE8EdQAs=;
        b=N6eHgWyaaaUe7XBig/lFwkIvT8TgNfCQw0D7M/4DfdSORtrk/PYWdL5plC47+LEpbz
         aFyfaTdO+KknVLZn+7Bdpw8WbeoxmfAaC02HiQutPkOiO18Js/5HUutuhWyWRoK8P6wd
         qqM1NrEQ7rpbogidpqyj12P4L+JIblk3HTpM2cc3X2qGwde4sdwawEyFMM3GDUJPxOgZ
         3+nfuWbndNCTPnYD2/ZFHseoXjwQkitJbP6iPMVpnLS+u2sOY74hTnArBFfJSJj8Ul+F
         +DZTBiVdgiSqhAP4ikowSprs9DZupoed1k+/hXDQ+bamG3cTPTZAUmVSDVqffhRTyQsg
         dYnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166652; x=1792771452; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0XT9gf6Lc+1fX8Xrkj2lJ0FO4HQTQ65QLq9M5IgaTRo=;
        b=pTk0g8ELftlQCkPZNhI+EIq+kzIHNB8LxG0WUhlatxLimO4E1G9yGAFi6IeC4hAFUV
         Xu5C2JslqKr5900s1SjPrpJxOLRDt1gztPI9Lria8UyIZxiHwb01KjhRuKdaIZPGJscY
         xOhqgL6kCVM54ZNTnByO+dmoK/UJ0S3IaUb65843bOySeodP8B4KODbo+doYplZ9zgpd
         2Oh6xJZ/BcKHylhNTI/qgYBucgMLAjSqZQyaSsHEy10hDJIEG6fpBRJeGr+NZAOU2i2a
         5t9xzz/FGDIysuULJedeN81tg6paZBN+z1SHNQcUTVn9ljhuwA8m1uhkQXOJ45SDKxtg
         nghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166652; x=1792771452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0XT9gf6Lc+1fX8Xrkj2lJ0FO4HQTQ65QLq9M5IgaTRo=;
        b=HO0g+vVvpCIF6ngKKy3jzFy3bRn8+02aTcFgzzB7+IsCMU93Ro7cnkBho0nKFGc8Ug
         N7QZzqHBnBATcGw0N/Mx05wfBBnEjqWBO3TdqWPjNUIB8lxmb1UxuMHEWi9Exj05NhJ/
         8Lx6U8Nb7xUhCBsmyO0cBOLnEfPbvbxYfbA9p24SUVVJ4RZDSmTP1LLDbKTDSAFrPolB
         iRcwUSZWJ8r08byrk0J+DLvBTF+zsUrzTa4fjn/VFsb3bHz5qjyTSeyvabwzcc/3+Dl3
         +Q8LiGfE2m1W0Kc6rH5lgC2HgVM6vDAqdHCRDGv8CVjvCIdc6xSLbhE0DVmcVexB33nt
         FKAQ==
X-Gm-Message-State: AFq9FYLHQodUZeOyFzfOIr61pd295f9w3fy/Gi4ZuOhVBqSQIurL30bu
	EbvWFpPlSVMpbYm4p9ai0OMW3vzkbEmVRnhtH3vBx4X5Wb072Eu1Xvk6ani9XiEzsa47m7mgIUh
	d5E7f5Ga6F71JYoj/YwZZwd60kvJJCSE=
X-Gm-Gg: AYBFou1HfnonvWdm/QSVAExi96BjsRtEwbDhY2k+UcJTJ2nZHIQ6xsgQ+Ixd+u7SxZp
	4uFBl3d/1R481R4uYS9foLI9eFWHDRt+79PkGKp9NF+wHUMDMQCp2mmLBCPt8wxpS4X/uYQ9aiK
	iQFoiijdT+CEQ/UTmpb+nBlch3ceW8f7MBzZjR2DYJQ+APv2c+Csjpg61/DbAiBZScZSPTr39lz
	BK1R+0KAhpQxZTkvedWYMymWIK5jwhKAzdzStFHKhpUGKvNkiLz6WJS3LyMK2U/9iugA+Ptw3Dx
	5azZqcEFKWazuXGDBVnj2H864x6FmTz2aqwqh20vAOFEDJ1bL6e0jYTS
X-Received: by 2002:a05:6402:4402:b0:6b1:c299:b3f8 with SMTP id
 4fb4d7f45d1cf-6b1c299b53dmr13158335a12.33.1792166651834; Fri, 16 Oct 2026
 09:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008112004.1899560-1-mszeredi@redhat.com> <20261008112004.1899560-9-mszeredi@redhat.com>
 <sashiko-outbox-164097@kernel.org> <CAOssrKeEOMUHz_Esfi6L0tu0rbd+aMbb9+fi9fzFYu5NWczOZA@mail.gmail.com>
In-Reply-To: <CAOssrKeEOMUHz_Esfi6L0tu0rbd+aMbb9+fi9fzFYu5NWczOZA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 16 Oct 2026 18:03:59 +0200
X-Gm-Features: AclHuK-Evug5KGDMq7YW7UlXb9Ln9FrCYT22ooxxec4w9tRZ6QLvbe-ThSbMDYI
Message-ID: <CAOQ4uxhgFM=SN_WKGp8PXGpHJhk=vr9ADS0OU-UeEv8Mrba-XQ@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] fuse: add extent map I/O support
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	sashiko-reviews@lists.linux.dev, "Darrick J . Wong" <djwong@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, linux-cxl@vger.kernel.org, 
	nvdimm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:26=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.co=
m> wrote:
>
> [Restored Cc list]
>
> On Thu, Oct 8, 2026 at 1:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> > > diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> > > index e9ab1aea34e27..040817ad76e94 100644
> > > --- a/fs/fuse/passthrough.c
> > > +++ b/fs/fuse/passthrough.c
> > [ ... ]
> > > @@ -74,10 +73,13 @@ ssize_t fuse_passthrough_write_iter(struct kiocb =
*iocb,
> > >       if (!count)
> > >               return 0;
> > >
> > > -     inode_lock(inode);
> > > +     guard(rwsem_write)(&inode->i_rwsem);
> > > +
> > > +     if (!backing_file)
> > > +             return fuse_ext_map_write_iter(iocb, iter);
> >
> > [Severity: High]
> > Does this introduce an ABBA deadlock between pipe_lock and the inode lo=
ck?
> >
> > For normal passthrough, fuse_passthrough_splice_write() acquires the in=
ode
> > lock first, and then calls backing_file_splice_write(), which ultimatel=
y
> > acquires pipe_lock() via the backing file's splice_write callback.
> >
> > However, the EXTMAP DAX path added below for splice_write() directly ca=
lls
> > iter_file_splice_write(), which acquires pipe_lock() first. That functi=
on then
> > invokes fuse_passthrough_write_iter() where the inode lock is acquired =
here
> > via guard(rwsem_write).
>
> Brute force fix would be to prevent mixing plain and ext-map
> passthrough.   Might be a good idea anyway.

You mean not mix on the same fs?
Make sense. So another init flag?

>
> However I'm thinking about why fuse_passthrough_splice_write() needs
> to lock the fuse inode.
>
> Tracing back through git history that inode lock really originates
> from commit 2a92e07edc5e ("ovl: add ovl_write_iter()"), which added
> stacked writes.  That was copied into ovl_splice_write() by commit
> 9b91b6b019fd ("ovl: fix deadlock in splice write").   Which was then
> added to fuse_passthrough_splice_write() by commit 5ca73468612d
> ("fuse: implement splice read/write passthrough").
>
> Even for the original ovl code, I don't see an explanation for the
> inode lock, but I'm probably missing something.
>
> Amir, any thoughts about why that inode_lock() could be necessary?
>

It is my understanding that the inode lock is used to synchronize the
copy of size/mtime from the backing inode to the ovl inode by
ovl_file_end_write().

We don't have this model in fuse passthrough (yet).
I think that fuse_passthrough_end_write() do not need to be synchronized
so could probably lose the inode lock in fuse passthrough.
If we even implement the inode passthrough mode where the
backing inode attributes are the source of truth, it will surely be
a mode that does not mix ext-map.

Thanks,
Amir.
