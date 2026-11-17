Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904594;
	b=jd5JelYcoXzwnZbIQiYXWw84hlgb8P4sgDNIJZCfwXC/orDliTvtVL6QdHhGRBtZKyLe
	 NmzbOVnxganFIw58xxF5weijflwCuhJHGGcHcjGNroR3pDcqa07j6u0ZIQqPEQLayzCNF
	 y2BYnj8zpuyO/Vvs20ieu8ZXIzsAvF0KM8YtM9UZ0J5QDZUAzC9nlQavDjV8qA5r8bCtW
	 3Rzuo/WPycn/IjfqZWS/7sIaHR8CSHiHrhG4Wm0PAjF2rJBjzN8IF2+hc0l8xv67D2O+Q
	 22TU1V6BAqVgR5oZdnuu5PSfOF/vPnaHTp8j7cvPcKBXMAjMdw9lApsswKU4svR0l5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
	b=Bgnc6A/Z2e2B09Gm6rZ6oNqrwUCkfwi2ej+Dsbp/8G2tWjVnfExhHRQM2vrEvleHKjkZ
	 tKf2rU8h11BPp7v8uSdVg0TCPrL8fv919McaVJRVm4qx1bAyFvCiwJ2DskZhjVGOI6U+l
	 qPeQQkrhqvzgE4WRqBiZL0anS+Qw1PMBhcGYd78QRPfznmTBMPFMFEHFXFGAIwXduJkFZ
	 4QGSzqsNwhmI5lF12J1fgrygwtQSpBl2JtwrcwEsHa9EIEYUoEqpy1TZGtCsJOr0rDNEF
	 5MfX9fJlM8ZZfQ54zc3JKCuUN+pUi7NprHGkwRBJ3zU3d3kQCiHFdNMSBHvw0qqE47g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="aYmM/GlQ";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD271606A89D
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 08:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD271606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aYmM/GlQ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b467581b98so39088935e9.0
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 00:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904592; x=1795509392; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
        b=aYmM/GlQram29k41kbBU3ySezqx9KNWUNuYe3i1xKxJ0y1xgZQ+LJM/FIr9UDBi5wt
         EUIqGzXn8CbeolIR7DvOKSNeYuIBqIeeNK8F0MQKLJ7qwm11En3qO26JhPNvGk2paD69
         U7N7xncp/GRVRFDNcIuifTpVuVJNG8jU4Q3wXsQNed/0Tg0YFTxAIww71hMFw+5lkdi2
         GSwBoD8x4+l2SuhioCbR6ytEgNPnEziI9cNFaAKiGxS/sGp7TnJ3m82dxZoPJmTczkS5
         Bb33DDhE3GKslfQDvo7yH7Tf+R7T4kSPBZf67kZ/+WH9Lydj4/+1e7HD0vsiAQN2GjGO
         iL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904592; x=1795509392;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
        b=squoz8KgL9F8xJGTlLZOISPkuW91V60SEC9tvp0skj/boaCLZrKLXccETp69a4jJMJ
         QvakDK6jiEC0nNy2R1bGDhdrcwUM8aP5jm6GVlzmQOA5DxvUxv62CyprdoUzYD8qop7i
         ymCG0cZiJ5/4LhVIrWEP2VpxP3cFJAtKvYfAPlJbcsN0CVJypEUgsOqysUtWU+DCQTOk
         RbJ/7lYeIlF7at4gKzpQ2YIiN1S3c2WjYHk9YMqfosV7Z981X7ADx75dAkKnDH/DdGlr
         pKcKAAJb6yvsluiRXkxTyR5n+zAwLkft90if/Q2ybI0sd7KTG09xO28K01ygFJjVaZm4
         FDzA==
X-Forwarded-Encrypted: i=1; AL+hErFBzxmIdtZGn9J7AiL+BjaKXOykx8Tx2k2myJTimTTTBcAYA6h+kM6N6/ihT5iMAZQmfdZpP2gTXukH@lists.linux.dev
X-Gm-Message-State: APuU4Z+H7ochgzBCyL64kYYJvzvgY52W/0EJ0YX6UvcwiV3qHsm4RECJ
	m2ovW5/FzMvPv8AHaPHzOwXluysFRUlNiIXpgtUTgoyUftVsgaOHD4j4HuXsQo7jXWbj
X-Gm-Gg: AYBFou0CK9b2F/th3kkuGfd3Gw47Qy4wFCDKwCbnzpGeaKjE0BItk52Wd1YZXT0r2dN
	pY1iQ4AYXMGKJfAA0ySyfS5Nol28Yp3jXwZ13QTlVPoi+XNPR4k8Bc6eO0mg/e3LZ1XcRR1oatm
	IQOkfn06mXHkitEz2MipbTTAoonWU32+JSdxdV0Ny44nvxa+Qm0xeZIviZM6BGvSK9DmPsOv2/y
	DQ09x4ZwkAuJ1Q7xGjkxW223Zf+T8bVtrCB15CCRWMblrF11Ed1pu+mXl7OLuJ/seIJOk9ijSg0
	e1wVVqMt5yxTcBHukDzYZB/VDyQ4NZGe6tn33LEXmP0Q4i3ieDlvb/lCnIFrEDTGtNjZlvGDcZ1
	35wJf4qMho5gFmqqiBvj5PvO3cuTIaDp5MIx6wdpnuESZywz9Ivk6waH3+GcA+cjF/x/i+vc/pt
	6QWaPeOJelpvSILn2/TPjbG3qB+wXkaTiTwQwB8HU62NGopmwJiHn0ue+CgeSro9TwLyZfgZV3q
	gwm9D16MtjOwKTVKozjRsqg3tCfnAK1dB9jKLn9pVpXYv0gwlH57fZh6HOkSHDy4nhu8HlQaMXJ
	mUgtHHNfumcG2PL9nXLINOyk3ZcbouDTQ+gWU0k1u8zobVOduVqDTKq5MBNdGUdGqfaSIaeB4E0
	41FFdcOBk2mfPh2E2m/a0mAHQlUhGJABUKf92U4BJ6lsMDEBwWqshu3AO
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr266345525e9.21.1794904592167;
        Tue, 17 Nov 2026 00:36:32 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm52548565e9.12.2026.11.17.00.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:36:31 -0800 (PST)
Message-ID: <411502f9a4f940c223b2b88d7e19fafdce63172e.camel@amutable.com>
Subject: Re: [PATCH RFC v3 29/44] s390/hypfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:36:30 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-29-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-29-8cbbea1cf34f@kernel.org>
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

On Mon, 2026-11-16 at 12:05 +0100, Christian Brauner wrote:
> Initialize hypfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. hypfs never holds executables or
> device nodes.
>=20

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0arch/s390/hypfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
> index 559b011e68800..8662169de477a 100644
> --- a/arch/s390/hypfs/inode.c
> +++ b/arch/s390/hypfs/inode.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <linux/errno.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/vfs.h>
> @@ -301,6 +302,7 @@ static int hypfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	sbi->gid =3D current_gid();
> =C2=A0
> =C2=A0	fc->s_fs_info =3D sbi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &hypfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
