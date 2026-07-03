Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BAF22CBE6
	for <fuse-devel@lists.linux.dev>; Fri,  3 Jul 2026 01:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783043279; cv=pass; b=dJ5pFrV5NMsLMV2UHZR1jbDJus5z3s47r8djO5uoUFlvL9QAECqrf3LvgSMg8uYMvuq0X/U5dX6M9zC3oLrjojRb3/sK4lX1Og8+V8AQOXs3GE7is1M+aHOGD91WJk45VZQ5q2rZAB28vM1039noaA2F/s3cHxYfJZgy8rhhDvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783043279; c=relaxed/simple;
	bh=JLtvplRuOrV1XCd+vmBKYGpvhguS1Ynr34OsxGcjbOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0FwJm9j3Lkp5f/hG9sTtF9aDEdpoGMKjREidj9ViGqOdoSUbG13kzokIweqquD57m9xxn21VZdLuDEbvd5myiWOzqyONjQpsQKoNhaffO4PqfLpi7ADyp3D9uHGpjSpj5GuDsKdXA8Q03ENuOAy6TfMwX2VRQAa5vzqG3kpqfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fu/DB+r0; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fu/DB+r0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4631679f204so708729f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 02 Jul 2026 18:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783043277; cv=none;
        d=google.com; s=arc-20260327;
        b=N83O2tjISSE3kORq1wbKQwq/nWTqKzrD2akSI2lhpNDI+6uOipFX2agydw6CrqbiE3
         h1c5lRrLAcxq2a4fIRRSDmrAQ5haGM7eaCuiI16yy1HtCmSWiFEEsxsxdDuOK8puU4gq
         VUuwsC89DfG7T13DCYcXWBtZOl6ep8a7/xQKAbhZlg9H2fDriphpl5cHrUJXYQqnQo/g
         4ENRN3gmcb7A+Dqewuvp+0U9+q7bw+Z9H2YLAZarrAszBProI5FjR9lk/urCNf2y1W2n
         K2053h4Mo3tubMIQIV53pzrPo74Fcw6x+cQ4MmJhOoP6zWUxQth7RK+i3iiAtJiiLDT0
         n1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DOn6vRfEsVTpudhzzAfawUs56a4yn/B/CVb7CXUItZw=;
        fh=4vPxwBLwkt6BhGHGxKbYZ7tyB/bTXuQOHB5U/7HA3RU=;
        b=OHljWZEtc91haw1WIJG5P3+qrA6UxXeoEscplhxfW0SBRUMwJsWcsbzpVK/EeOEog5
         J92kLJ+y0MH+gvmqd2kTKEPi546h0rIHh5J48I92tGYvA55m5dqJT4NgjKbAyao8bLZ0
         WW5Orbn4gy9UGWMhtKABfvC0QL76XbAZpU89ofSlOpUnWJgPbfafF1butA9W9MTfkRzz
         rxZijm79qVjMDJe8E/rRj6Kzjz51OaPIXoyj89nVxFLP75iWNwr+Ogpgl3wsDjsGtsPf
         XcK4Bxh9AA2/cnzns6MY/BJZH3S3sD8nVV46nwm6AOJSmzgyqBMfodXQ0lx3z5dW69KR
         D88A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783043277; x=1783648077; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOn6vRfEsVTpudhzzAfawUs56a4yn/B/CVb7CXUItZw=;
        b=Fu/DB+r0RBfUABT8PEyvslicdeQXmm7zrMcI+2UHThrUm5r7yVzhIp0iEPdIkfQIgA
         SHIl5N/8GRo6FlvUM84ngKL3T1XYx40Lp93VxFODs5D8HJ7AxeuwYhNCm16U5Rv6q93P
         lGQHWvsWbg9RYEO99IO9W3XawTBV8u0GD+WTvM8A5OeaYovTIfPfbjbh891nydcAbr9h
         /rASLySe6E0QgSgZoyzZOjXJXr2GKghzTvxt8Llc3aCFHqKxNSCtreQ7oYAWY7pDcwyY
         0jVuReXqYyIlxJfVFaiyydFKW3AUfBpSItuu1Vsu6V7mZ+U5SKwMAJo+csQodB3QXYAP
         vdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783043277; x=1783648077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DOn6vRfEsVTpudhzzAfawUs56a4yn/B/CVb7CXUItZw=;
        b=hXZpWYSH5fjIwPFCWif5GdBjqo+W+8l17e6OoHDoHPG2A6uF0YpV/SgbDickuD4myG
         YtLk2teT3PU/ZTq+RDg36UgN6m4HZmWzXZ/tUZTD6wbR6srHg/FaJbonRMaUe7RbpoCd
         WKLtvAWO2dFjp3xTADha8eOPr0Df6ItlAn7LGEupvHUiNvMAmO6QfkO5A0/t+sXvH/bE
         5Zce2S/8bCOo9gT2QhbzAigDxzRuNrIhvKwhrEWYGo1UOXCTrMluE5CwCAcSw1jgU2Wc
         p0aNSdOjbyXAJuR3xKHY8XOS4NGmO0e8Rltfgcc9EQe/pp80SgOa6k5pw2iiotsPl5h6
         7Smg==
X-Forwarded-Encrypted: i=1; AHgh+RoNYg2Oh6xMRXh0YMHCP4nAx28oykKcsSEh8tEgnoutChNL8WMU2nTmEqknxVJa8QnDn3RtjVved8tU@lists.linux.dev
X-Gm-Message-State: AOJu0YwCTzvEOLGQ+ptJJUuYV9eKGVLgJdbJcw83btyR4lPTpDU/8Ua1
	Gdoy8bTDuv1JkMhpmysSj9XTmzBND+GVy8fFky+pYr3ozDzTY3Y7AAmiRcd6K3k75pR7FDmpNd1
	RwXmQkj6zCNV22EqbIucJczDWvDQusjI=
X-Gm-Gg: AfdE7cmzfZY2F/nsVOwVz8vqV+jrlvgfSjr1MU3r9rsZmePuw5Tm6EYOAYJEA5qSVxq
	FHbCyIXPChGLDMAYsn0gvBgj+fa1+E6Y16xPYji/vtD5opHVSQ33CaKl3eVuGC8+pU1KCfIPWl0
	K5ZMKzGCOQ+DXyoxLq22I49e+9iyEtRA6GCDiVC1GM/0mfHKDp0r2qLtzHjmd3u9r9mmURgGZlm
	m1zgggvQ2JoR1Pbpb0eaikhpslcK7X/787ti2KrU5gTQ2n5bq6/KL/KgCh1QlpJTmNzWd391I5e
	PpNzNLoql+9zqqytg1Z8CXC6K9vxIj25TfAZ9eIdvsyHG8gLKpaz
X-Received: by 2002:a05:6000:188a:b0:474:88ef:cdec with SMTP id
 ffacd0b85a97d-479347abc89mr3414307f8f.6.1783043276701; Thu, 02 Jul 2026
 18:47:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
 <20260701000949.1666714-18-joannelkoong@gmail.com> <20260702140705.GE21339@lst.de>
 <20260702165117.GK9392@frogsfrogsfrogs>
In-Reply-To: <20260702165117.GK9392@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 2 Jul 2026 18:47:43 -0700
X-Gm-Features: AVVi8CdwjVgCnc8OibEiAJiLFqrCHykAhTtcw0AOMmm18cQj3dSCo5Q-SEBvMhY
Message-ID: <CAJnrk1b8j5WHtbHOWNXc4=QBFOxde1f2QxTOeui7Ta8O-xWcTA@mail.gmail.com>
Subject: Re: [PATCH v2 17/18] iomap: pass iomap_next_fn directly instead of
 struct iomap_ops
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, brauner@kernel.org, willy@infradead.org, 
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

On Thu, Jul 2, 2026 at 9:51=E2=80=AFAM Darrick J. Wong <djwong@kernel.org> =
wrote:
>
> On Thu, Jul 02, 2026 at 04:07:05PM +0200, Christoph Hellwig wrote:
> > Looks good:
> >
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> >
> > In terms of merge logistics, I wonder if we should delay this and
> > the previous patch to the next merge window so that we can minimize the
> > cross-subsystem merge pain with more file system iomap conversion.
> > If none of them actually happen until rc6 or so, orif  the merges aren'=
t
> > painful we could still pick them up late in the merge window.
>
> I'd say everything but this patch should go in during the merge window
> for 7.3, along with clear instructions to brauner/torvalds to expect
> this patch to appear right before 7.3-rc1 gets tagged, to clean up all
> the other changes that come in.

Just to clarify, did you mean this patch and the previous one? If i'm
interpreting Christoph's concern correctly, I think he's worried about
other filesystems converting to iomap using the ->iomap_begin() /
->iomap_end() functions still? That sounds like a good plan to me, for
v3 I'll submit everything but this patch and the last one and then
submit these patches (and any cleanup ones that become necessary) to
Christian right before 7.3-rc1 gets tagged (which as I understand it,
is when the merge window is about to close).

Thanks,
Joanne
