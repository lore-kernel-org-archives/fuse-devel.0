Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7AA38888C
	for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 17:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782234277; cv=pass; b=mNPO5Gwi8PeL0fgTLA5Y4S+WOTeAff9Dk31MV5N/YGTKdSXD8OeRUYOuHs9Vc037SQc5YInh41vhI7QUUPy8Tv87/OLXfsVu1By2ECb1T1ViVaVopTOm9LxE246SKacyio5mQlBBJZcYIo7rvrK3SI5cClp3o8CDyMuYM6Kc7SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782234277; c=relaxed/simple;
	bh=AmdxDpSAXFZg+NG1Z53JDpqr/ZSkXDFyKiUPoH63AXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QNiWEIJxo7m3tA/f+E2Al8LW0KjLLz3yxjeY0OM8y2qAu0kWya55n0ysucl9k/vCPZB9tSz9u8bQZ4mFB0K8tbrRHv9dgxP0gw5H8xIyzIa0AKKic19GHvyaNL4cT9GM4PZxhQad/OqhQnAypNUDBsmBIEklXmMhsis0teGrajE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N48xUM7m; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N48xUM7m"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso56067f8f.2
        for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 10:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782234275; cv=none;
        d=google.com; s=arc-20240605;
        b=RANHHloOgZRT88y2AMbc8+je7CoKsCauzGhgEYa1VE5q+9FEbhCMn8TiqXhqaqONyF
         bnLYmsGv00a5iGA2jnCRpVuMQv1c/kb3RgUOMJAkFsPf01e+39R0GvQXW40rF5kLBSJ0
         PJyfmZAmYw1C1V9krT0i1Nd6rejtWnA/5tKpT1Q23d70tLOBagh57gvQVzFKWkQemcly
         vWfkWoyq/SVkbJq9sUmcDZ+fdvrRJYKsQEyiNizDYkCZRBaJ3UNA9ewEKcY5ueb3dsV7
         xjytdk3yRTHXGbo6mN/SiPs20PIhFe0HaUFVLGhaW3wzWFIGXLS07R+z84nETcSNgVli
         DH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EchZhDXHLnIIeOQ/eg4q+Ls2B4SjaafDmxoTrWutOys=;
        fh=5HpD5YU3xInOsupcylFxjWxD2qoAKgPDwMmz5Xj0JN4=;
        b=SniofzsuX/Sz1M3D9Uq/dDIaww47FfM0zAsA4leasI7J5McXzdGIdSog+WyWaeT1Cr
         mQkMOYOktJkp0AwCHzL/j0DPG2a5Ids9TI+lmf+5k4nOk8Jc5cMzYaU93GuTUM5hrC5M
         /xfopI1NfO5Uq7VWmZwV8m7cgo5g+m1N4AYtqc02P+I2a2TjglrNWx/6R2gvizkMJg5l
         u9x3f4oLP9I2cXGpnSvqbGTlOqrJu0CDkQSitjKH/LbKVbXDKMuGaeDGdC7sGbOna1tg
         KqZwC9c83Fy4ZUKpkU9G8ip0s8ew5YilfJmGZbohP1PW5eo2POglTUN6DFfm76OIcv23
         KgbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782234275; x=1782839075; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EchZhDXHLnIIeOQ/eg4q+Ls2B4SjaafDmxoTrWutOys=;
        b=N48xUM7mWDTGqWUxgbDRYqGtEFNFzJJOdvl0NOh5HoVD7Ccr1s6gt2IyRcvtvJCJcr
         drOSP3u39P7nYOlZAeIiz+yj4Na8zt5V1hITzUd2T5bBGMpEhRoXwp+HUCiASh6Y+aA0
         /7PZPxHRAi2CFAoTrtyG8OAGfj4mqC7ByEXC3wQjResoICas30dt7SHBYINOpEJ5UMvv
         aOrDEUZCoXXI+f/koxaRYR8XrekmoW7j/Fdp3qIuY2caPHMzLp1816MYjQVi00C1yfVl
         3AootSKpEZTIsRzvrRXYxVQSHsmYusl6DN3J+hD0kKuoQZv/Y+bcxV7itcCYUSsGIlfO
         bCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782234275; x=1782839075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EchZhDXHLnIIeOQ/eg4q+Ls2B4SjaafDmxoTrWutOys=;
        b=nZPxMLKuVz05bIv96eiV9UcZyi3lzwUQ5coLq7ph0ZbAbshXNDRtDc+Ap+/VQKNing
         /BBzjBnlNC/v7Vukaa6iPdf1KTSBX0IMfHOwZRztzj5NGDLazQfAfpR1QZVtegjktkVE
         YoZe2PPNmZkdDSJ6UmsRRWeRYD9DxrfL8Q7A06xnCURInhqMG5sgQ9Fj9r/qaQ7Mx7Jc
         jp/X4I0h+ZpCIrHSa3Uj6NHhCvwv6/o4JBTZ7a4gJcIIcYNkwz/61CpYMGSNy7SgGIjG
         pgdP/M6OEA/01dqJkRkc75YZvnYOkWdKvUrN7DmDTqSVHHEOT6/7C8nYcBXtILkAv3pG
         YfbQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPmc1cShX7qcl1l51TJHP0a2LVAEPK43PO5QYFnCnctLM/XasoXeQWZCBg+SGDYWeLZ71L6w6/VriH@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7E18Cz+7o3tdfFb3Il5xAP34wZfGRwXtJTEN31EZTpC8Ob9+6
	MBHHHw++sqDM7H2lSTAblokMRM30PtZ329C9oEkMIrUbwy3x0zaF7ceQpG6EhL5Oe/3BfICO+MH
	Qcw1rH8JhrB4GP4HJTVi8XQE1M0v9x6c=
X-Gm-Gg: AfdE7cn91MjykdJ3px4JmBBBP3b584HXAY93oppmWckBLG139MzrlKwg4+KvTPdyC+y
	bwfeyv0HxpUzWzP6/tPCpjthgduoSqn303y7OOcn2BxrMUWl9u1sDgT/nTwvxn7/hapaxkF3YpO
	AnP3D5vEa40k2oNNZthZZnxi0j8ORQyne64XmMIXddTcX5DNYqWokRmkmt3ega1Ej+l9/3/Ebu2
	621eCoDusBmpsIoNGbT07xjLnEwF/nDd0T8II3jolhVvLxoewtl6McLbyLiVdEhK45DRXNP1SFD
	DkulElTiqdRr5A0BjfpQ2Q1IhGq37rFAyuR2iBxRQrdJe/71nU66
X-Received: by 2002:a05:6000:46c4:b0:464:5df5:332a with SMTP id
 ffacd0b85a97d-46add1841f7mr4198572f8f.34.1782234274518; Tue, 23 Jun 2026
 10:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623135208.1812933-1-hch@lst.de> <20260623135208.1812933-2-hch@lst.de>
In-Reply-To: <20260623135208.1812933-2-hch@lst.de>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 23 Jun 2026 10:04:22 -0700
X-Gm-Features: AVVi8Cdq1cSEiVKuIT7rCtOjoNPEfhV6BkfHSOO37MXbTaAKd3fDSsQ7oc8pKTc
Message-ID: <CAJnrk1bq7pJEwwDuimp6GzCfdhrjhzs=MFAdRLOAdkJWmeSg7w@mail.gmail.com>
Subject: Re: [PATCH 1/2] iomap: consolidate bio submission
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
> Add a iomap_bio_submit_read_endio helper factored out of
> iomap_bio_submit_read to that all ->submit_read implementations for
> iomap_read_ops that use iomap_bio_read_folio_range can shared the
> logic.
>
> Right now that logic is mostly trivial, but already has a bug for XFS
> because the XFS version is too trivial:  file system integrity validation
> needs a workqueue context and thus can't happen from the default iomap
> bi_end_io I/O handler.  Unfortunately the iomap refactoring just before
> fs integrity landed moved code around here and the call go misplaced,
> meaning it never got called.  The PI information still is verified by
> the block layer, but the offloading is less efficient (and the future
> userspace interface can't get at it).
>
> Fixes: 0b10a370529c ("iomap: support T10 protection information")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
