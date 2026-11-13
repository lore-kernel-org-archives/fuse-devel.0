Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564339;
	b=Ws1+9y9RJTzmy/AayepeIAqipyvKvdc6IiC4NH0W/9ClaDnGoDnxCm+5E1LwuoCN+og8
	 Y0aIAPpk/qmXKvC7UHevn3t80TtZ0psykeRMZX7D8XLB9bFNBdv67mpKBU3J327jqMiDn
	 289kDePuWjx536CjMaQv0AT1IO3u1lRzvtg5p5T+IXqI8dtumRdktZKw51MFiH1F5fADV
	 bxJ7IjM5ZnEhDALDc03wyCAjfLW48SLG2kV2A5FQqgWsy6CjST2QtwbsL6io980I3WIfo
	 DLMq9r17A2t5/IkKN40woTtplue3Ha1Q3VeGkuJKgsVHAisOwAwYeIHSSk7mZj3fJAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=/ZNAGjGCHSUHK/hbpNrctHFuArQcFUaSPHFuYTd8W2k=;
	b=TLhdruywBrHB76gUF3QCX2B+OdMdldEFJC0RFxJuiv82iRk4i5tLrfNaHSFE2XvPi3WS
	 dzJPOY8yYEq21FcLWa/2F6/dt7YZoAhrbujTvIbDI2LPyo8+d1G0S01fz1b8IHPbA099X
	 6wQNXDwdyYtw0j0lA3qXah1IKiK3vA2jznqO+kOnCoABuA6IBTlDeecBeZtRkU1POKAus
	 WJUZPSoIMJqqaj2YsAnm4gYmQV04Qlhv9KQOt7tsBjDtinAmPi5natovz3KJQ/aGFgL5f
	 pM0yEKXU+c4J3+BeIzvPOxrCn1/jvthtDv/sGl3pyW07l008Yn+xwPT9qh9nRwhs+yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AoGia1ij;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00763606B13F
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00763606B13F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AoGia1ij
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5080ef9b31so142138266b.1
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564336; x=1795169136; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/ZNAGjGCHSUHK/hbpNrctHFuArQcFUaSPHFuYTd8W2k=;
        b=AoGia1ijUoi5POLg+3kM2/Pe+o1QdHrsano3zTnVFrn0BdN0JWGlda2M1PK/eIT3W0
         BN3m/MP6RYCvYVBOGo/SZ8S3Q2i0XokzNrc84sPvoRmJYPY8v5S5a1Fih+cvceIUQKGz
         pjAFVEhotD15D9Ac2eXZsnnm8Ota4W1xN7GlPLzqg6f2KfLNrKFAVi1ulVefSZWtszUq
         Mc0eaQX6XMN5uRyMlhpufNDowzvRtSAxhE8fiESA2SnQJfgFX77r2aLRpQUu6eGsN6fa
         H/q9Thit2w59GDa0Y7C7UeVw0t+0EzECj4+kv+4diuCGRzpFKDcUZ2ilQna79OhC/X8Q
         VmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564336; x=1795169136;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZNAGjGCHSUHK/hbpNrctHFuArQcFUaSPHFuYTd8W2k=;
        b=lPZ67bFn9oSrxwfIE0HFrAoyaKIKp6Xx1AFQOWlic3VcUXeRvMNNuMoq8B9ky1vPvL
         8zKZz9/kC6ZRzU6P2geyD/2zeGPv2mHlkmpd1ch1Wspq2U60LZ5+DOnt1+i9hVVyHQ9R
         8BZe9umscx5J2vfCKhHU4lY7fcIFRe8wmRhpaApEl4vEDThK8bTHxlm9bvvFFRW5c2fY
         okH33e4wV1+DxYjrU9Tu0Dg/hQqnakZkrFRbcJR3oWY/RsWPAtY62TYAMtFNpv3Kar5X
         Lk5yhoIZvrzJMstiAPsqsGeQFmqYs1awFSIGjM2d52fUaA6PBFM4h+/hddMpphD0eAQt
         wXyg==
X-Forwarded-Encrypted: i=1; AL+hErFSkTq04xLyPqTJQIpPMRYjzYX0T9mJb92JeB+jKIZHHbhZ0QQWtqL7hzn8FpLSEwNucCffsn0Oc7LA@lists.linux.dev
X-Gm-Message-State: APuU4Z/jvdkW7JY+/vq3EMfWHcgqk+3qSK4qUbnCaAy77AvCw62KEDra
	C16hcesJUnPKBf48G8C+7uJTyMttXr4/1VreDoHT/Tr/U3ihu9gdkYY3OIdBqeWBpNc5
X-Gm-Gg: AYBFou1xD6Q7ApBN6ZNSGDNuKdil2ELKL1Xto/0oZEBlsbFO6xXQ9vzeLgjk1W92Njp
	W/mDO8PL5odlt32dDWnPiCfld1iubULqW1qe4Jo5j2AFE1XcVfC9vQ2nklK+VZy0QuU7/YyEhAZ
	xe6bJZFteBlaKUOKME7M7NAFRhS2Nwn+Xdkd64jhGSRfyilj1hbHDjw290sGJddrc00bv3PoX86
	CTC2MbBqvK98mNU1G8eyBSTkY8844WVXv2NgimVZ3weTDWesyK7THDqPOLJYMrJuf4xC7d0/GB3
	HjltuH9jmyn/fz7nS628BGAlhp7by9insbpbLKVnckRbs1MLDadNi72X8tXWQLsrNeX2ixd0Ug8
	vDtIKK8QYyjmz6cTqYd93sRHDjPe2SkwPnQVygH0MDo3dzQGf1Er+hZFiB3Ct78SVaprOUYZL8+
	LghIls09l5+2sbE+58S2R0UtCoS/FKtDetgB7LQ7VTGhzp+gjG+5agXm9USIq+j1r0bgVl3XJ0F
	lqZvRIem1r+sg5tsBcYJbpqWV4YhP2IF3N8ZCRx6mVjGiRfnGqtJSDsANHdHZz7lInETGU1WHMB
	vx/sn42qXrRkfE+l63iSt8OO6PmryUFpE7kVdcoql85Xg3T58VqUK+xzmwHOsO0=
X-Received: by 2002:a17:907:94cb:b0:c2e:3a72:ffbd with SMTP id a640c23a62f3a-c5096389759mr162937766b.41.1794564336347;
        Fri, 13 Nov 2026 02:05:36 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5b93csm75365566b.5.2026.11.13.02.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:05:35 -0800 (PST)
Message-ID: <8f532a01f6cc2eb73582864343e25be4ec990919.camel@amutable.com>
Subject: Re: [PATCH RFC 14/41] debugfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:34 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-14-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-14-4c998976c6c7@kernel.org>
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
> Initialize debugfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. debugfs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. The debugfs files that
> can be mapped, kcov, relay channels and powernv's memtrace, map data.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/debugfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
> index b4915551ad31..f163f0bc5703 100644
> --- a/fs/debugfs/inode.c
> +++ b/fs/debugfs/inode.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/init.h>
> @@ -317,6 +318,7 @@ static int debugfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fsi->mode =3D DEBUGFS_DEFAULT_MODE;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &debugfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
