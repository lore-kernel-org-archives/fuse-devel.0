Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F43B8BCB
	for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 23:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782259101; cv=none; b=u0dYwfaVMVXnY5LCi9JJUlmr63tpGg0xCkDGWRG1yTVrnYIkUj7SaW3s1F3/2lfzPviF9T/vL0TdHSJZbNv4/7wflc9pum7OOQ5x8nQ6ecuuSQj2cU1pNBN/K8rneyy7wtYrgtuessdHUlQ+Pn7Kgcc0J5XrcinkiSLq7keqqcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782259101; c=relaxed/simple;
	bh=r9lIUJsfMYD2q090ZAjVUEelW85QmoHpNpLOxraQkds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDW2W4pv9dU0X5d9wxSkzRSH5bQpBmH8Fl3efZ9j6DOfbcv7qUegQs8yLiBraXNL48trM5+c8tcnLYAnxpcBB9WLyK8Ogi1UmBie4g5w+n0Rdq0SHuB2x7SL4/5voqyidkUHquHpuIEGXwgeven0OE17UM+dj3Dvuum/aAzfgVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jx5jXtLO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jx5jXtLO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE05F1F0155C
	for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 23:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782259099;
	bh=O5yRpEyknAxQBuWx/gb9cR/auuwDKfX3rH28YfAhJjA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Jx5jXtLO6qD0eU852kbyhOE7cZg+TuQFr1lFPhjF0se8P1kGZJiypZ2BNLzLIAxC+
	 ePk7KO0AzySggx0z7lemEvppffSjKFrQA3d0sqsYu6qeOKKNd//o6wc1ciWaoNR2tP
	 AQIjTOgThLXS//DkR+tJ3Zf05BozViiHqEq5wVM4TB/8NMF01N+zQCQRGJQKjFHrqL
	 9rhENPAvHOlArt8b0KZYpXNw2D5Ph4nxYhjxMsuD1fN49GwqptBWDVMkef+8c65x/A
	 JxBsfKb27BVKFsQ/H7A4d84hZWAcR+f1lZ6W6Ce8RvI3JabFlb64HX8FXjkQjawBl7
	 IrDVkdLVshccw==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bec43ee8ff0so68248966b.1
        for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 16:58:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+jGfv3bDA75oJKegYP8p+AGTQ2Ca9B80Vy/KZgwGy6F9xmLy17nY0wq0i4jba4hgHmkGsbrQfDzO/Z@lists.linux.dev
X-Gm-Message-State: AOJu0YyekDrVNyJ6NcTpMjSigcRxbAE2oIFTPwTzcojyiInYhMFW8OQV
	uwS1HOEvncUjGV0EpjitV/BHkin/EvKAD0t5FQLh6zoqiVgyEhCHHuyatCjyf8DwI/I6JFJ0l0a
	njd3a0LcvidHSgHhbVE8M2VL6a7XRSoE=
X-Received: by 2002:a17:907:74b:b0:bee:c13f:7ebd with SMTP id
 a640c23a62f3a-c1030fa35a0mr276264466b.16.1782259098316; Tue, 23 Jun 2026
 16:58:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623135208.1812933-1-hch@lst.de> <20260623135208.1812933-3-hch@lst.de>
In-Reply-To: <20260623135208.1812933-3-hch@lst.de>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 24 Jun 2026 08:58:06 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_8W=S8WmK5J7dnm-j0QycJHAdPOdeuSg6EbwSYgHg0WQ@mail.gmail.com>
X-Gm-Features: AVVi8CeHD55lDgJcabqaov8VHEMJrqVQlqyVWrCatN-0pn2R5gDSUfP8EbUYUjs
Message-ID: <CAKYAXd_8W=S8WmK5J7dnm-j0QycJHAdPOdeuSg6EbwSYgHg0WQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] iomap: submit read bio after each extent
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Kelu Ye <yekelu1@huawei.com>, 
	Yifan Zhao <zhaoyifan28@huawei.com>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Hyunchul Lee <hyc.lee@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 10:52=E2=80=AFPM Christoph Hellwig <hch@lst.de> wro=
te:
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
for ntfs, exfat part.
Acked-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks!
