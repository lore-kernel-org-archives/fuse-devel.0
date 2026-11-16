Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794859450;
	b=vvbRKWZ5yg5wD0qfrEtfSrS8/4i/YF6weA/ri4VT4cCQohEi/TLZzc1bnnoJu7lXjbOE
	 ec/yZmooDLYm++Qz/nXJqX3QVvRjYbnIpe9Pd3eLO1euT/O0YP5S5QRzY1HGp/f13W6l+
	 7eVBHYWDW9brfKpAvJ49oIPeVl7IdDsvvgz/P17dOCDyJManCpKeEIbdwJNIym6OXKfxz
	 +Fo92eZ8ANJUTMkt8kuaxu3ihxjn7ULd6OM9h01yMbJPCHpmMOt8/5XPy9Bh0oHr3GdTl
	 9FPcWLxR049i8z15H+N+NxgfZXh2iRkO0iaT5U1bfdHVgMxEFgl6Kkj5IxWIA6itRHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
	b=jlBZuxSvtARxm39Mxf6MdcZuKaHeOMY6+hmxK+7IWydL4C3VV5jBEpvYK6OWHp+r63wP
	 uC3PPzekiMIo1a6y5qBHv1Gqo0SBwTL0rxpkJq8Abua8IPE48wmDNZ4RuOHdeOU05vKOs
	 geFXlDA7J7XO/iLdaoBLwV1Y9+fhnUH6lVUVw1Wd82LkE/4oZUTBVtKj4iB0d4lm1Aq8Y
	 IcQDXi3gf+nWBw0Nj5Brx5B6pUuLH4VeZL9IH2m6kZG7G5W5G7BpWMFiJ+6DHhF5M0Ph8
	 KyS5gYTlz/G35Drn4TbRWerYefv2bPVVyl63/Fx+rAVAEQJNYCHCY8i3fW3RuWdeP1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uHbfv6zw;
	arc=fail smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E7C606A322
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 20:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24E7C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uHbfv6zw
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49a92144733so1559081f8f.0
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 12:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794859448; cv=none;
        d=google.com; s=arc-20260327;
        b=Lc7IXfgBJHnjL1W7AN+NvOAmEjClLXU7Lmci5itGuz/cH02KXMzHDviJMpvACYeVxK
         RYKKKZZhjApbob1/RFHVN+6whEP705ARrcJftMIIjsnUprHFKSyYtIWBlDBexmLM7+W8
         hrYfoasaXAfRXFjBSHVGv4Qi+GFGUZ59XeUiAic8ud9qJiRSRWOTeET36DuFwDpxear6
         6VdR5IQBj/wIKFI9Aq3fTExXbP48I2MGHnUjGGaWcRYlW89lqi5Btho8T93ItIJKvnG0
         0EPiE5mksFr3VPZdBVcWsxLVNkQK6sOYii4adcAU/hf/vSMVBPwwePWtI916+Aw8LpXy
         BzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        fh=B88h0gxtV0mFuJ+zatIirt/8ewyYCX6kVODIz5iz6QU=;
        b=MmB0iVr+naEeHST8Lbdkollb4jxt2RgcsxJCklCpnDxGU7EcQZ4/kO+Y60ik4EPPRy
         /V94Za+WWKnx3J7O/G+2ZUN0zHp2KWHkXHNRn/iSwVYJUEfKjLtww/pmlkqNYn+2OOD/
         j2RSPBCiMiyD3kRast7QUNCyw2tqIvqcyjwk9UzK26ErnyD0m26DEwP7gwNNefH7vMkX
         QVvWSBWUseU6obATs/zZuUEMyD+8V1j+6iva1IgcUkjmk1gZz13IbOEIzCbsV4Up22/+
         FqksliuWty45n/HXNFD1gTU0KnFsaYufBXkm/dQ9DBYCsaLY5c8IP3MWLBsVySBLJclr
         ITbA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794859448; x=1795464248; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        b=uHbfv6zwy1lrNLaaDDbEkVO8ssYj/qyFKtfSbCf6dCSR34pFTLKtssc0BSUTVKDnMu
         mUY/++Qcz1KX8Ogb2sP0/Jz1g/BWEGgoFm5oS+25+X2no/pwBQ3/X78Kepr/irGJMSNE
         3gT/frU4pMxR7n1+ps02VbwjRh4tMLWxLxyNLP8keSVXnpjBVZPYnTT+c5wZ+iecIZv2
         7S2V/VFSlcgm0o5RvV16ycxlulKRs40excOeL7ZbwOsDzxUCMlYvUBzfGE+BrYAVAPFl
         i5boq8/bHOyLGWd4pfpgYpy2FKsVJAt6V8aPFCGg5KeRIJDFvIDXcerxrzKv91ysSK+Q
         s1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859448; x=1795464248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        b=yiRqbp6/nR6RD2jq/Px730n70EOtCzhg4oixlYafoCBgXQs1Vmt06snBzPMKyPtGIb
         dg/smgrIKGMm022IYL0SJJZwCfMa7T/DeejijR5xNw4aYziR9vfarfvxCKw1uujXITWi
         jTX7nBEvbiEWcKdDixEi3X2JfxoQ98BT74gnxSRj2PuMtpnMJClD9a3tNJMkWdSKCq1E
         RiakUT/Fhexb3rnW3cMLiMVlBjKYvAwfzi0ix9m33InY+u9LPsgz0HAPzJwnUdP8ISyC
         GqpYilqHl1dkY/hpONASN6aXSKscfjS+Y7A9s1Alwxhoof8IIRyLY64JWVr4Q627dEZ6
         qnzg==
X-Forwarded-Encrypted: i=1; AL+hErEbgJpbmdzOT/UZMy1LrTLvZU4OFBiIryUo9szS5/X7xHSsbVGQE5CqV+SNvmghxlsl7e6hdC0LGlUU@lists.linux.dev
X-Gm-Message-State: APuU4Z/P6hw698XkwIZp4uE7oCED/YkmjAV07RrRa1gXWXNgT+1/lSNv
	K44Nl3e+mZipAv6wLGj58mSp/CayqKD8xoKJMZjMPKLDinudR/TLRt6yO4Mp8/NEkTHH6nx9aVH
	egnaHFY2xjHybZQoAqx1EdysvM1BNS7w=
X-Gm-Gg: AZFdTZdIMbOGqKd3qJPE9WUS47/04WZ3136mMKYqPxKYWIR0+flojxXj2yLLkOqiCKB
	egFsJwg6cWxX8lMc/nQabvY89D95hZTZ7KSXHRWg5QZGLPO/t5+6tP2yvy7ZubgzG37DHZBfsAL
	SodLhGXS9QJ3DaikIsKoyJYs1JOlvEIXJmOz/7vxFbpQyVnq2da/RbOgQj9niPrjyeRrynVJKWO
	b7wObRzmiTJSvkLdW6hy8L+UBfk0Fr+0YXJbFTDTJ1mWO/pFTJceeVaniqyFi5Cnb4HzmrRBtlg
	AzQuVhnoc1vZ1hqk2sEwU++aY/75JscwH8Ba8ivUJci0Grcxls9v+Im+RlOKfh99nFi4E9whb2+
	ecij54N0WDEwkuMTbmg8HCgbUwALA5KDH5/FHZPZas3r5/Ze9T7pghg4PwnUFe4pCuvNqpyCsRV
	pNuwlI+UNDuTjcoQ94aEs=
X-Received: by 2002:a05:6000:4692:b0:491:3fdd:af34 with SMTP id
 ffacd0b85a97d-49d61c80db3mr13343868f8f.36.1794859448335; Mon, 16 Nov 2026
 12:04:08 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-9-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-9-8cbbea1cf34f@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 16 Nov 2026 12:03:57 -0800
X-Gm-Features: Aa3M54q6P4M0RFDCKQ8HHGNCWJafItTSPdWR1qNwVGtToDAv2VOv8vDfWHzYR6A
Message-ID: <CAEf4BzbLFVawibuX0wk=8uzy0WZSYHbkgK55d7rqLab2qAM1Fg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 09/44] bpf: use fc_init_pseudo() for bpffs
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Alexander Mikhalitsyn <alex@amutable.com>, Chris Down <chris@chrisdown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:21=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> Initialize bpffs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  kernel/bpf/inode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
> index c6f328e4752e1..57cf3775c0766 100644
> --- a/kernel/bpf/inode.c
> +++ b/kernel/bpf/inode.c
> @@ -15,6 +15,7 @@
>  #include <linux/namei.h>
>  #include <linux/fs.h>
>  #include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
>  #include <linux/fs_parser.h>
>  #include <linux/kdev_t.h>
>  #include <linux/filter.h>
> @@ -1197,8 +1198,6 @@ static int bpf_fill_super(struct super_block *sb, s=
truct fs_context *fc)
>         sb->s_magic =3D BPF_FS_MAGIC;
>         sb->s_op =3D &bpf_super_ops;
>         sb->s_xattr =3D bpf_fs_xattr_handlers;
> -       sb->s_iflags |=3D SB_I_NOEXEC;
> -       sb->s_iflags |=3D SB_I_NODEV;
>         sb->s_time_gran =3D 1;
>
>         inode =3D bpf_get_inode(sb, NULL, S_IFDIR | 0777);
> @@ -1261,6 +1260,7 @@ static int bpf_init_fs_context(struct fs_context *f=
c)
>         opts->delegate_attachs =3D 0;
>
>         fc->s_fs_info =3D opts;
> +       fc_init_pseudo(fc);
>         fc->ops =3D &bpf_context_ops;
>         return 0;
>  }
>
> --
> 2.53.0
>
>
