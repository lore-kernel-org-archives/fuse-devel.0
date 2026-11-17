Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904033;
	b=XsUqRz1O+d9sPa9yOMasFGMSZcxvq8pVz9Dj7//YiuVdxhMcrSsg6xtfCa1N3dN4vpzQ
	 qE5Mt4a0/gpfR90+gF0pIxzBf6bYRK5DMposWBzeeUSUgyKfirqp1+fH+F9UDK9He3Wxe
	 uGzv6SCG3NZ/lVSqLiSlGT6sUkUlGhFauzEbXqyeYcXNZXYJBQjZVCknBo1HbGg3NdkmB
	 YUuw8C/UlpVobC3hhPsahvR/YdrVPPx+i8eWB+ZJhnYBhE8z8AqFDkG1JSBDg2Bx5TS9z
	 +8KTTmb5XnYvqvvAg3/YXJruyN864Fz/fkUgapxIFtrjmeFqTbj6ISrkwJXJxsJxwHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
	b=TDQNFszNc4oRv01dHx3lsR6Ww3XglHXlYTB3AyEpa/LrmnIs2iRKeXMq9fKWyNysZtT+
	 QpFc3VMuoZ1om7JKDYRaDMsFhhA3U2HJcowIQzLLSQiQSgYd7xyR/7I9gKzpUROSeQBCI
	 j+sVtzZ5y5Pos4u2kcgAaXi2Pku6oCoM0uvl1Rt/0i9gv8V0YTX2E0/EMUqgWKKp3N9JW
	 ttQ14KuzDt4MfF/LrlL/Atp+vTew7VSk6iO229zCxIZVOUfbqof36Pg8SXjbb0N25ZGlU
	 aU1mod+RxRIib2dUUTC7hJrhMXniGzANf3XWnOIK2O+wHFaB3FEOcwX0Gb8BR3uLaIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RBb5LpjE;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F80606A336
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 08:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08F80606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RBb5LpjE
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so38964005e9.0
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 00:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904030; x=1795508830; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
        b=RBb5LpjEsd+VbupEZipVBTcqEVhD2BhyuXFAhkzj4zDg4oUBSxuqHMfkELz+gxWIHw
         vbbYve4ZQG9dUKFQfH59c/5gSOKu2NS1C84xrag2t1hGAt8vy7QuR6cb1YLrmFZD4UmW
         DT46O4ChYavt97eaTUH5Wtt38HKPrvruP9H3DCKVDgkYQNzU8Ky+Vq/HRM8ZFv0ueUdm
         m7XD/iNyS7oiGovVbHq2Ni69WekzDkEZ8F7vPDv8wPqAJzJDCYr/rP68HnRhshf+h9xA
         U0p61Y3CD21JkoCNadpwmJt9yGw8qIFf8/NsPUnBcywgAvz3JSnsOmBu5j3Eb6WeQTGu
         7KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904030; x=1795508830;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
        b=F+Y9vDB3tWMWGD9X/8dyft6ZKuVnXb/LIUs1xTE9ejOB7SQkkoAzZxRFRcPpn1fgEv
         y9DT1PdeIbprWhA63f+dgoYw/142SS4PNJNSCHNmlJ/Low2bLWcZTpcu4aMvDhrowZ42
         tLau5bR2ueurjPoe/uKXycYUpu8t28EFvEmOpzGmqxspMZHOoZRKhioxIMsq9sAaqKD5
         oh2zParGoFk37eVpLhaWQcEB9gCvJaiswvia7y9ZAO1Z/VN9JLxokP5zPzG7l3zqFmSl
         nNIFOcSFmmzYYyWxuqDK36RA3vx9HdYfW4ZtiiNu0RjXr1aLqsnxK8gZpKZxrT9lguFO
         MEnQ==
X-Forwarded-Encrypted: i=1; AL+hErHsPNbtIe0mPd0F3ENwIiQJEzIIT9Bw9UWLxRU6+50XyTYyRG/0lqgPl1nq8umqADvLn3UoUGoZr0oj@lists.linux.dev
X-Gm-Message-State: APuU4Z8RCu/nDGjBV5zwv8RdiZ/F+f3u5FbX6wCMaw6C4MS/BjRQIgNq
	11g0PFas8EC7VBpkGrgq/DaIfXrWn+UOQllD1zVbprudDabzjpYod0IgxubhJRn++ShD
X-Gm-Gg: AYBFou02J3nWSY1GcN0uv0s8t6pnB/52g3jVZ1AI0rHBcIIcfuKjT5GHucuyU63FGbs
	FPRwVcyHL9ebx518PZ229YfWQK968i7PWTvak/RNjjj1c30mxBKB+wJO1BGB8FErd+2J1FxMVil
	zehTNuIrCLkLccfM36Da5ExGxINzv6m2YPQmM1n9ebZH3Lm1pUSg28tekPyZewzeU6IsxEf4CKH
	pRngjVuLKD8W2m4atEq0iLS0NcJeyQdx8no187zRaSMeu0xcb6VHmoTPnJ/YqN8/WBnUkgLKq71
	HCpcURihDMnWqYgmiL3sRU98Djge1eTj7b/7U6tuKlHU003An1j3QTGcqAJQrF/nzIk1kzKaVWa
	y27fopcWgwm5M8etMZFmuJQuFAQIzOswfMLvwklUR6TuZNc3jASCl3Zq2MyfeLoQb0avSSsE2pk
	/QRu2SqBSAFYBhwCGRbwptedaXB0HO1/2gRIRHY7//SStImUlCB+6a594fbZF9L4HT1FgaUINXL
	J4iLxIHOTawwNPVP3gJU59CNDik0obBukv0xhuBn7IVQ0wocCUjsafoXtuaxR75Kc1CnoeiNP0g
	BL0PLtiNBFLJ36LHj65U5B6YHlZ9KZ4poGFflD0mAflpHW/ndCaVBAiXTJJUfuSo++00odrpLNs
	WZW7qBL43GxWTFxfhfUi9/3jzzAqmP6+SgWMfS6qHrXbG3Y40NcxceRjU
X-Received: by 2002:a05:600c:3494:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb6c71c232mr134135095e9.6.1794904030378;
        Tue, 17 Nov 2026 00:27:10 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7838c912sm45730155e9.4.2026.11.17.00.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:27:10 -0800 (PST)
Message-ID: <0ec7b8c90cc456b24e5b19c1db673d497ae43735.camel@amutable.com>
Subject: Re: [PATCH RFC v3 12/44] rust_binderfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:27:08 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
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

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize binderfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC
> by hand. This adds SB_I_PSEUDO. binderfs_fill_super() keeps clearing
> SB_I_NODEV for the binder device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/android/binder/rust_binderfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/android/binder/rust_binderfs.c
> b/drivers/android/binder/rust_binderfs.c
> index 5f020226720db..04468c5b5c116 100644
> --- a/drivers/android/binder/rust_binderfs.c
> +++ b/drivers/android/binder/rust_binderfs.c
> @@ -3,6 +3,7 @@
> =C2=A0#include <linux/compiler_types.h>
> =C2=A0#include <linux/errno.h>
> =C2=A0#include <linux/fs.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fsnotify.h>
> =C2=A0#include <linux/gfp.h>
> =C2=A0#include <linux/idr.h>
> @@ -667,7 +668,6 @@ static int binderfs_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	 * necessary and safe.
> =C2=A0	 */
> =C2=A0	sb->s_iflags &=3D ~SB_I_NODEV;
> -	sb->s_iflags |=3D SB_I_NOEXEC;
> =C2=A0	sb->s_magic =3D RUST_BINDERFS_SUPER_MAGIC;
> =C2=A0	sb->s_op =3D &binderfs_super_ops;
> =C2=A0	sb->s_time_gran =3D 1;
> @@ -759,6 +759,7 @@ static int binderfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	ctx->stats_mode =3D binderfs_stats_mode_unset;
> =C2=A0
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &binderfs_fs_context_ops;
> =C2=A0
> =C2=A0	return 0;
