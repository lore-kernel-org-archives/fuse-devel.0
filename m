Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793204284;
	b=iXj+7FxcdNC+IDhTzAPGIdOit6XiLG4M/NggFtzhRiBr8kq7WC9HpoZfA9+r04/nT18b
	 iw1icrbsz27zeEXDJWfZIJyPy4yX0HTCMELiVpHsMZaAjJ6bp8/Db53TNq+QOwZYHhwfH
	 g0OtdeMZLzTsmmP2JUgavXeTEfEtETYbvUSzDIGuxsvePoHM1n49BYJ2Eps7T584y6aTw
	 p2a0cRkIUe5CP1o83UtJH8iLSo1a/zyQH2L/8qi8PI6d/0sfB1KV05W3LgdvgWZosorXA
	 cm0XmtY8RJpVKg+JSiQaQQa2gt1tUUcj8ACKOOsw8/S0qglEa18KqMLt3kZeobHlFpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LR+4Nh8FYTRY8kZRrhgD+RKAvmlbTqJy80aNBobHu6k=;
	b=q3LrDxqHobymRoEkK9HfAgt882qrZz1PDx7RztbQdLaSP9HcWQEGT1VeXa9xlCOfZCuB
	 ICRtbEp8SLdmg6CUAvIzMA3wv/VwOy1jsqmSqrWiwdA+pjopBKkE2kVdQrYCoYP3rg5Rk
	 RDgmzJNIx+FfgWsTaqJCsHIcnCkV3F5e22JRxxT2NLRyTs0qkumkbQHpLCFeiTYGWYZ4K
	 tOVxY2R9TtbetN10cOsdbYNGj6FsFX5rgvTgE4vZ/kM2m+Ir1BiawXpxAiwr5f5Vn/RFq
	 FrcbHUPy1Dk8ApWV3h9jJaZ03SziiYka2PrHlvOuzE1T1JaACWwJX9BQ9M3BVedfTKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hM+FUkaT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E22606A31F
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 16:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E22606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hM+FUkaT
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso678048b3a.2
        for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 09:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793204283; cv=none;
        d=google.com; s=arc-20260327;
        b=luw+/1MbWGUzT4pz/UNR6ZJSWuj6ggznhTjSmcOp9Vzt8koSAwefDiBwDMPHSsrnPB
         aNp0X02ijL9BHixUQ94Dv1YYe5gp225Yqoyq44wd1A1iDcoaIxAfuvD1MhudpKJyFvNZ
         3OaBdqF8BcbhidQO/XA8nd828RxCell1SHApuS4Dnd1/btKsMHInvQj6Em54uc8Iv0eD
         XAGAm61q1+x6kF5pS7B64wgyrhkrt5HMma23xI7Pnrmzc0aBN0e6T8khp4uj1eP4JYOQ
         Yug0ywrbfpcmSILFFpjjQBfCHtZo4iIPsDu/3VXZFVeK586NQxeP7Y/hXyr9TbntBTp6
         ubEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LR+4Nh8FYTRY8kZRrhgD+RKAvmlbTqJy80aNBobHu6k=;
        fh=/Z8elD2DGThreBvcclgWFXLrVEUrCb2PDlR3FHV0tuw=;
        b=j/xPsBq8/RBn7Z+oUVKxP4Qz7skhukOxhqMN7XrNj5csyVex6mnHFtPF3GTDcZYgOy
         o5mT/RbIzh0xF/VW2i87MIfPmUFojPK7e+TisvbYIuTrhkgaUd19+khMeR7MVYqiKuLN
         pllu+juewA+KreH8W362l/++M9vkU7cxDX7sqaecYjeP3LdmXPLTfHXhNxAMOZGwkQKY
         qKng5debP9UgjCyJkjFJIo4ZvS8RekW2TFtegHLOl2YcycMo0+8g5iQDs5HLyX8y7zcE
         O39eyhHImDbLpJK8lsfidFUrOTIFP9srJT7U6T4JW7qzZ8Lkyq9xnBIE7uWTdR/ui57/
         h/ZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793204283; x=1793809083; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LR+4Nh8FYTRY8kZRrhgD+RKAvmlbTqJy80aNBobHu6k=;
        b=hM+FUkaTc9Cjg1ZcknM4dqbLlNORU/sXssQ1cCzPd3yF8++LTP+yaYyDBsDgZgpmWb
         Zopvl29rCUX4G7h9/PY0sqtYjNbJtfMkemf50z0cJvdDajGWz6RIbkx1f+gZIDH3ys79
         AJD/t0A0TL7LdJUOLbiUFIYd6pwtu7fpPgbjwdRtqe3+mY4JYiHz0FOYGHa38yisToDB
         I00ZPgIMBKwnm2Wkke6Tcne9aeF38s3QcVRfpAlmhv/gD5sT/7Qb/63poyxQ/6E8fCob
         wBFBfyHCDboS8BqlhQBHkC9qg+EVnZnM0MXQNmCQJKsyP1K7u6PGsfVo6Ec1xuJ9cay9
         dsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793204283; x=1793809083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LR+4Nh8FYTRY8kZRrhgD+RKAvmlbTqJy80aNBobHu6k=;
        b=hwTEGNEgve+lzAje10U9mcM/YC/UHjbtEoiUT2cxI1iu7H9mvwBJO24Q5PoLbd42za
         8SWMPZV6seKRWCkl47U5pkFPpW+ZJD7NvCPLB4U3xoJFDxMTalzfscB97d+BaeryULnX
         vP6jYzgvDSId7ggvTEcbr3WL4n/Y+1gAN6H+LmbgsSc5376XdxYYNOZltn0stLS1GW5f
         HLjGn1kHp3UChooRnoP80GOAaxkusDsdaTWXK0F7As1O5phQPxo7kwRyALkQZpg74tYS
         P7UVsKO7SqKfGy58drgd7CEf2iFzIB7ie/cpy/jBsxNtvsNvdWS2LTjTRGx/ZZysZ1az
         ojiA==
X-Forwarded-Encrypted: i=1; AKwUvBykiE+oTO8Seu14CUs8I52Q56kc2sL3Gxy+USHpU54NCQuMPMXKIVpyRM6QEdr6l8rkkrT1R/NWjSLI@lists.linux.dev
X-Gm-Message-State: AFq9FYJsJPGWYeGoTSzzb6E+NR6fs52+SDqvjLOXmyr6zbfJzTD291jZ
	zzXVd1Zdza6RuLaE9hK+WMEg+dCNoRajnt/8DatCxNtxc62L0XsXFQ4jD90wIc5kTlqw9XYoTb4
	N0SQ2X7G1rLNBXiZJ9VoYUxTcmTl4Gj4=
X-Gm-Gg: AYBFou22qMQ7Q9GQEJk+XRxatlH/W2q2DtRCCIvqsMRVLyyyT4hzd4KpfRneh4KzO7k
	24Q/cbT50Dji2q6FN6ev01kCPDg3FFldKwP0VNpiZwe8acXxZmwPkJjiSX60+pwOWgqxniE6fYQ
	FC0HwlHQzLxC2QgFJVX5/CAMate6Z6om+loLmmqn45eeiFJDpU/hKH1WeExmWOGQOArGt2qKPxQ
	s3jkMl4sTOoWfqR2M+VAsAeLofgXYDapcSIOMP+47VPh6WA4Qrrzmdaa2D7qs/iIMVaaTLWipn5
	XEViKFJUe1pmgFc3g1ME+o6hTSVzNJsuBm5efxSgFzjvE/L8IxAz5bZkRNhwANF7adUEZsfR61V
	KH/1rpttlweQuTX3t53ZAfWYnG/ipVarignGcJQ==
X-Received: by 2002:a05:6a00:391f:b0:89e:9560:fc7a with SMTP id
 d2e1a72fcca58-8a6e6efa7a7mr2168656b3a.29.1793204283163; Wed, 28 Oct 2026
 09:18:03 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027215326.2693300-1-joannelkoong@gmail.com> <20261027215326.2693300-2-joannelkoong@gmail.com>
In-Reply-To: <20261027215326.2693300-2-joannelkoong@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Thu, 29 Oct 2026 01:17:43 +0900
X-Gm-Features: AclHuK91pZpqmliH2N1ROYQZJFORz_xx3uP0uM_hYUkPFZ1oO9AzV0q2NKIx0ms
Message-ID: <CAKFNMo=Kqs0T=a578WN+=PZ2gse2APWZ_jnJ64XyrerFK41sXw@mail.gmail.com>
Subject: Re: [PATCH 1/5] nilfs2: convert iomap ops to ->iomap_next()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, "Darrick J . Wong" <djwong@kernel.org>, changfengnan@bytedance.com, 
	kbusch@kernel.org, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Jonathan Corbet <corbet@lwn.net>, David Sterba <dsterba@suse.com>, Gao Xiang <xiang@kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, Andreas Gruenbacher <agruenba@redhat.com>, 
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Carlos Maiolino <cem@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, libaokun@linux.alibaba.com, bfoster@redhat.com, 
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, 
	Viacheslav Dubeyko <slava@dubeyko.com>, linux-nilfs@vger.kernel.org, fuse-devel@lists.linux.dev, 
	Zhang Yi <yi.zhang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 6:58=E2=80=AFAM Joanne Koong wrote:
>
> Convert nilfs2 iomap_ops to the new ->iomap_next() callback. The callback
> is generated with the DEFINE_IOMAP_ITER_NEXT() macro, which wraps the
> iomap_iter_next() helper to finish the previous mapping if needed and
> produce the next one. No functional changes are intended.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---

Hi Joanne,

Thanks for picking up the newly merged NILFS2 iomap code and handling
the additional conversion to complete this series.

While this patch is an intermediate step, the changes look good to me,
including the finalizing conversion in patch 4/5.

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi

>  fs/nilfs2/iomap.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/nilfs2/iomap.c b/fs/nilfs2/iomap.c
> index e130ed63abd9..359786c97f2b 100644
> --- a/fs/nilfs2/iomap.c
> +++ b/fs/nilfs2/iomap.c
> @@ -67,6 +67,8 @@ static int nilfs_iomap_begin(struct inode *inode, loff_=
t offset,
>         return 0;
>  }
>
> +static DEFINE_IOMAP_ITER_NEXT(nilfs_iomap_next, nilfs_iomap_begin);
> +
>  const struct iomap_ops nilfs_iomap_ops =3D {
> -       .iomap_begin =3D nilfs_iomap_begin,
> +       .iomap_next =3D nilfs_iomap_next,
>  };
> --
> 2.52.0
>
