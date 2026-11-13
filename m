Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564808;
	b=KcG4F6vjwA00kPjUMHHt5lxDrQdGRhflBNOoAPG65oB4sX4Qex4iWo3VJLX1i3myezbP
	 QplsoL+GHifjg4u8jagzoFCLCPcWK2PhRgQqau6g/qoVv4CdB7Bq6lExDbS5iU6a6VPNc
	 ZvKsE8GbA41/oqPb7b7efia8llH7g/u94FwPPwpaHBC9gRw7pZF1U2EAhjEpFsSXE7hBQ
	 hiiIKvyR5tV51W6OqnJqpbU1kvdVZmymcfbO7EOjWOcZLFmp89+acuLDnJoTHg9kB9xsi
	 oWZq1/GSiAejcRcCJRr9M0Na3nCAmxo7/C0MYFqBOokfncN8CjfvNwb94Oa/7JQ0f+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=UX3uQO58FXw3i2m3kzI3o8uINYIcsljrdUAfEKBly4o=;
	b=Knm5o1yuTC6JvNA2c0YHmJuALkkYjJQ8GA7h5NFUClGuWAMUSa0S2ewbFwz5BQuOnGG8
	 8P7L5kmMNMozUu0EL2bcj1nua7v/z5l44HJJbTYqx8kAjemdBPBCDI7lDSXE0YX6AMHfG
	 X796B09Np3pdMBptxfQzk7ZYcbsvnudUV1k1E0YmJZ0uAfD7Pcvio9bqY/Haozmw2tMWL
	 R65Nq6djhAwOWDaV24XCDH7jLJU7fytkYbiMEIpTGelxoWgJmbtSVpqXEO6w367rwb9uE
	 s+N90rlRRH7i36+l0IDmKR1EuW15cs6EQY0SjyGfsesBXQfNfu3lyQBDbdu9U013q6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bPteaYF0;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5385606A895
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5385606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bPteaYF0
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13721215e9.2
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564806; x=1795169606; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UX3uQO58FXw3i2m3kzI3o8uINYIcsljrdUAfEKBly4o=;
        b=bPteaYF0LDLBhb4MMDrCQcGeBSYdEW8BR1KwVfhIGgPljNrsneiCwDwCEK9a5QlXNc
         tB/NVenooRESnkhjGXly3Q1Et6fehkL1U8U2E2ukOdtymki7dwsktQWlFRxZ11a7bzSe
         hji1GHW2DiXcv3Cnt80tThLj7kjseVPyDyN3t/EE9cQpMSvp7wgFveomObVqSHV5KJbA
         xTiwHsGIqBNzj/OOrSUqXhclJHqjr0Y/e6nO5oN0JD2f0DO4pN2kZpwlf48BmDKyAfJs
         BuAeimIkBNjxJq96KRmplvgcCfOOwtkZ68xFMnVL6czkbH5SzDP2Bq5leyi+KXzlgjwR
         7Hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564806; x=1795169606;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UX3uQO58FXw3i2m3kzI3o8uINYIcsljrdUAfEKBly4o=;
        b=BZyJ7pSKESle5K7te4VPnflHo5IjduowYIbKRmeWRbZCXSWptGR+Z4UxBQrBEA35QX
         D8/RIjvku84oEsf0OgTfiPrHwHfmjT7/O0hQQbJ7CTXOnjoHjY18WatOHRWsiDmc8v+X
         H+fw5oxz+3CIT6Q7nMT3D1nNLL5pV9hc09D3+fDpqw92IOCVkfYnnnJQPtoq7TTcKaLi
         7Cimc9q7sSfMif2jdb0Pn0AOopblUFvCFSOQ9Sv9zcNQfPCyWq+2/OLrLf3HU71mON4q
         j54PrYbib3QJ2xTOr+rRl3CSmj8XYkbSilqxvpPasiwnNOlgsYAl3qwle8BK/eszUQjQ
         Qndw==
X-Forwarded-Encrypted: i=1; AL+hErFwUgXyjfYcIScqTSRwLWG+h2EWXV4ukaNYWcEanUfXKUrTnlOmgXU5E3fNVnUhIY51pvSJ6Mo+2IcF@lists.linux.dev
X-Gm-Message-State: APuU4Z+5bWR02vThy8EHBvNkSIsK/KCGYzCciAnQrBiuzIpSoh923sVt
	gcUQdLvtX+FJrSiCDhi2c7BDUMAbPVAIIFLEK2wGgrKOQIYtZQyr2HK64wk6qNbz5NCF
X-Gm-Gg: AYBFou1x94AIjgnXHuNERA2ere9qBLpiswxZJ1E8Bpw2+5PC2eGJJsr2poavx+oViAq
	cS17aeYXp2+mGJqUHaznRkRhgM4K53x+KvRP8oK777UCjeQBSRi9eumXkRm1elHwHoN9G3pz+s7
	XTCb35H8ba1ktAmWW5Ia3xg1z30MkXzoTHQUFb9n+ZgWtWZqAGIVF4rY3WKU4UQZ4iA2cq82qJd
	76eBOk5CKTsb4o6H1Ku8mATdE4KHCJzGMzjw5Orx9zTG4/sFI+Q17isLSX7SO0cmsGdyqc8ENwo
	8B2UdJJA/AqnqGP22B3fbxpbLA8jbYIJZVhtyVrc6cKIBizib72Tu3lwe5VptQo/Ace80+2vwER
	mX/elUYlGCtsQlAiqRcTwyuryAlfKJa6oK/0JEXYjYdOjX70VS51HYsKqdQVYCnr9k1DO/ZTRGy
	W//8O2M+nrF+xl7h33ol4c/N9Rqgf85xISD5ufVxj/3CWnL7M0RALAlp/rBkw3wnghKIi75VIxy
	yA8+Ge2Lvb+U8cogY9/MYsxFQwCiLXFWjZGBGhfayQMYBQCbJwj0ifiyyfWH/RHevT1MREUi+4t
	XEabrqmzc0dpy+mfru2alr6xpceDx0DhfgVycwaeIQSztPYxMEjCckXGbHhULAk=
X-Received: by 2002:a05:600c:45d4:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4bb559f6f31mr43583035e9.2.1794564806374;
        Fri, 13 Nov 2026 02:13:26 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm4362275f8f.49.2026.11.13.02.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:26 -0800 (PST)
Message-ID: <23edc29c421f5d4c1103004f79e104e9f94d42c2.camel@amutable.com>
Subject: Re: [PATCH RFC 23/41] fuse: use fc_init_pseudo() for fusectl
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
Date: Fri, 13 Nov 2026 11:13:24 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-23-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-23-4c998976c6c7@kernel.org>
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
> Initialize fusectl as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. fusectl never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/fuse/control.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/fuse/control.c b/fs/fuse/control.c
> index 21ffde596d61..4497362e7df0 100644
> --- a/fs/fuse/control.c
> +++ b/fs/fuse/control.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0
> =C2=A0#define FUSE_CTL_SUPER_MAGIC 0x65735543
> @@ -334,6 +335,7 @@ static const struct fs_context_operations
> fuse_ctl_context_ops =3D {
> =C2=A0
> =C2=A0static int fuse_ctl_init_fs_context(struct fs_context *fsc)
> =C2=A0{
> +	fc_init_pseudo(fsc);
> =C2=A0	fsc->ops =3D &fuse_ctl_context_ops;
> =C2=A0	return 0;
> =C2=A0}
