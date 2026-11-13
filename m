Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565649;
	b=MY/NfRojIE1WsG7K48s2/xrBXEhpLTGYNk5ZH+JnN5pcU2n7NriGRgqzUzCtuW+sk0y1
	 amQOrFAHgwl/vspL0Vydp9wahl1FcdvsVI0Xm2PQ5p3HVfQ6KoOL+r78G1ikFkdugkvb6
	 13jc7ns4giQLyfvEvEvpm9Xq8p3ZRrr5hhAYXJq1x9ibty9EpN6lDGi4K7NoN7KI84E6n
	 +knC8HGNNLNeY30/P4Bff8hlXqCHMJA6/MJOuOXfE9IfL0uIyaHdlgYDLjq+3WLxqcZHY
	 uA1mkON9YM2CnvIRae1VnhALgPU1+etb48hm9hmKSsW1e5g73ntOYplZB67uupbkmeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=TXY31nY7nMCHyiOZTp7Dn0JSWYPda+tFg8CPAdTq7II=;
	b=xK5L5J7Qc7mcraBLIk2kCMU1HCxya/D0I5xTmF3KOTPVkEC3hXqSOxsproYqg34iLesX
	 PHHz4QKKwFtCOCs6KPYV0iBZ5G1gjF/42prNDQl0UzQZnIxuwjYO0e9ac7JKMDMpp1LJX
	 vrKFF3HO5cphcMk57/TTqgYL2NNiGyhrFXPbNG7mKNkSekMgYoFVIimNOFo6mv+z+ypRM
	 EbptJMF8hqd7Rk228OxaCW5UhiyuyA5fp1Pp3QmegHKemONowHhEjPlSWr/je6HXkDhEw
	 eTs4Kz0Ydim4LlNtEsQoLfFSmYntouhg81WhxqYc+6Bf4QOPFafysMZ5f28OJwtFJKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=P2Ovnntx;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CFF606A335
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52CFF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=P2Ovnntx
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491846221ffso783333f8f.3
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794565647; x=1795170447; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TXY31nY7nMCHyiOZTp7Dn0JSWYPda+tFg8CPAdTq7II=;
        b=P2OvnntxZklgGup/ZCAKqCiR1BnSGRhZX++h/K+LxEVACpcdsdiAP8aEbgxELzDp04
         fyqJW0hKmvcMvXAUsmAZq5rzuw6DOnAzSl4En1EX63jjNTRhhcRQjMKZEBsvf/yY6qjh
         aQSM+biz1Od5VE8AG0xfPooy3uuM9dKpCM1lc6NyGrPt0pcEH8r0yCoObFji3GZawpg6
         59buDiramCqFSt4U3TQM0Cjf9uaOHjxU+0RLkw+vlWOpzT9FFabgSW0bIGOjhv+0APjP
         RLKwx4XintCLJCvQbx6tUNVbtWObeEbkkD/kdoW7bz1WNnoVmH9V9zbAonV5/31qWhTC
         JFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565647; x=1795170447;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXY31nY7nMCHyiOZTp7Dn0JSWYPda+tFg8CPAdTq7II=;
        b=R20YTrKm1Dc97jZftBsGnefHl+FYE/7UXvYqtDRrlQ8iyWlIcQeUGT5syNrcZAeDCz
         3glXSQZNrSV2G7dwOOcca3gJXfQ+3Tvy7tpsNHLDser1gDUuel+hVNwOPMbJZntoIGe4
         C68crWWJcNGub6hwSMuRljpyA+sKwQud6muWk3F9RxF2xySd5FN75oZqeRBAjC6T0H/N
         u1RjpnfrEN9MekkFnZiHywWxa3iW1paEtAjcQZMaDPriA7b2N/VJrk9HiXkNuxc/+GiJ
         wjdIpXdMl62P14PTHtNCUlxjna1LIJZXE38w2Z44MiwT10T/z9yHuaZGBjGiHqaaROdP
         Y+eA==
X-Forwarded-Encrypted: i=1; AL+hErGNBk0TiPY+mZHODYkfJjbQsBy3ggqF7nhZzpoYZ4RK5mzw/4DIhbpfY142N5I1Jg6WPsX7wS9AvTy3@lists.linux.dev
X-Gm-Message-State: APuU4Z/p8b6+9basNPyV6xKAPBXMs42LEktWmtTNSXbdaIe50bxjopSJ
	AYwxP1j5l9vYea2f2RwLUO4dqXj2Cgo8FmTgkD6SV/QulU4yv/Vf7kwCYTOgfXfYv4kE
X-Gm-Gg: AYBFou0tcmEfUtmY0GjM6z9XyklO2CGct44XhpQItCb7vK1Mg1OZFRuAJpA7fC/pdsE
	8V7lEt558IqQxzZKScu1xNFelnjvZxluTZu8b8B6mgdvhfzZEQuYejXLW6Vu2eshTAl9IHFaEhY
	i940JI79QO774bBqNwKAuKmIJsqsDYEU0d+SUuhz6LvYZDfurpB473ff5rfBPUbBAtATME/K0VK
	zoYJWP8XFXuOBjM/ledALjuR9pqW0UzzoWZ0flcPm6AgxA5TmdmOMEjM5bsd0OxZFVDo3Pu21zO
	pnFRd+98KH5fR75XWwwTUj76kITrbcR5pBWXmJXDwoEVo+mx5sTPsxp0PCJefxKrY+UgnC5gziD
	V6jOO/3bNNL/0hkO20L29hSv+7xnwTyBirCbX+och1OdoTHoqDbesdn5xuNf2TBlmzz6jIXfCYQ
	jdB49txSHLgeNj/hArkkxLpRGNZhNrGsm93ofI2KkYPKtkZjYq4Aj2NmL9iG6U8pv/Hy9G4ihXQ
	dYvyOPPYH13l1k1H0s0XVWY8sRufFAe9v39aZIlYO2OdgCJtnzHA6pNP+3oTZLCiSEs6RS8jrZ5
	pX5+qvjT+V1oXegff/CH/L+P/FutpbMME1P1pJC5WLbUsEXGBYOLYsIbcnRpi+M=
X-Received: by 2002:a05:6000:4707:b0:498:c419:3728 with SMTP id ffacd0b85a97d-49c713ae367mr4463557f8f.22.1794565646661;
        Fri, 13 Nov 2026 02:27:26 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm5077482f8f.0.2026.11.13.02.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:27:26 -0800 (PST)
Message-ID: <0c109a58804a2d782e549af6ad13e89532d9f9d2.camel@amutable.com>
Subject: Re: [PATCH RFC 40/41] erofs: refuse files on pseudo filesystems as
 backing files
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 11:27:24 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-40-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-40-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> File-backed mounts take any regular file as the image and the same
> goes
> for the extra devices of such a mount. erofs reads them with the
> credentials of the mounter so this doesn't hand out anything the
> mounter
> couldn't read anyway. But files on pseudo filesystems aren't images.
> Refuse them just like loop does.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/erofs/super.c | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index ce05557bd998..980d5fc2b576 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -158,7 +158,8 @@ static int erofs_init_device(struct erofs_buf
> *buf, struct super_block *sb,
> =C2=A0		if (!erofs_is_fileio_mode(sbi)) {
> =C2=A0			dif->dax_dev =3D
> fs_dax_get_by_bdev(file_bdev(file),
> =C2=A0					&dif->dax_part_off, NULL,
> NULL);
> -		} else if (!S_ISREG(file_inode(file)->i_mode)) {
> +		} else if (!S_ISREG(file_inode(file)->i_mode) ||
> +			=C2=A0=C2=A0 file_is_pseudo(file)) {
> =C2=A0			fput(file);
> =C2=A0			return -EINVAL;
> =C2=A0		}
> @@ -835,6 +836,9 @@ static int erofs_file_get_tree(struct fs_context
> *fc)
> =C2=A0{
> =C2=A0	struct erofs_sb_info *sbi =3D fc->s_fs_info;
> =C2=A0
> +	if (file_is_pseudo(sbi->dif0.file))
> +		return invalfc(fc, "source is on a pseudo
> filesystem");
> +
> =C2=A0	if (!test_opt(&sbi->opt, SUPERBLOCK_SHARE))
> =C2=A0		return get_tree_nodev(fc, erofs_fc_fill_super);
> =C2=A0
