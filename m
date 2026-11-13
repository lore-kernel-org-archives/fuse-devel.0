Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564378;
	b=xuEEaRNRhim42gYf3/dwzNwqZRls3wFUBNOCg4cZK2rG7PNPzKSr4vH5NAyngb+oLhnq
	 EFHaoqnMaEjI7RmY3hMKh5gk9fdM/1zflzJ67aFBKnfvynh23R1zLo4hFSl8Ou19KUHiu
	 R6/I/3XRGQoBkPQqLTKNjNhLe/yX5xCYTNoB/R+/QexWftRIHZquoow5njEOm4jVlFjta
	 d4q5OmG6YefEx8HQzLnzwz6VUNupvp33TonCP6tADUhS/+CXoQ02GDmj9YbflnaWhUdr2
	 Sqo0EZ0rRFsbBHrLNp1VjEHaJKFjJXerDb8xYCvAcTlXJL2icdoNR2nF+svKG7OdBGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
	b=DQHwKiYaBGLtmeDO7OEqnd0zym1rllBePoFSqZZ1Ns4BUvTGHLk7xtiKBqFVdEmLkQgo
	 /FN5lQ1A3euWKJXQJnJDtkIcin6pZ7hDuwq7kBjdMFZBNjHPjRqTI6adpsX644uqmT1yB
	 2Bi8TVdIu8egs/+KPwf475TC/X4v0VEud+o1kboom572ndUWjodaCO6+tU2qU77bdrfbn
	 76etv9+b8vXVJY9YwhVqdHmm156np3tV3dn8KaihHYLek4x+zpnbjxQ/8k40VRrWu4bmc
	 mpIEfA9X3YDt+aLcaHitnw0FxcQBpDaIv5uc4PzaGNY6SXWQcOHPibGk+5i1EcZKlgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GgjqTCm7;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8D5606A33E
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD8D5606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GgjqTCm7
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so1596900a12.0
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564376; x=1795169176; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
        b=GgjqTCm7Kj5MQFDKFqubD1FnGJCHeJvNTYTUuQ2gPiceCfH1RyQMlmD5DRF+oa/BoR
         BCdYuYqjNoInmO5e+o68ivjTe6m5iMAF+wWKmuQ5qo5ZTedHmBnbD97mBHzXq9tl5zyL
         6HzB7kynfUXQ1gQICGGSwSbb164cboI66lYa0zrHE5fZSQXzsu2i63guruX+a12jWTAB
         MmLnokqXzngoDK0e7I+hhbAD9ncEFvoN1/2P2Ha1Ev2o2Bpv5Jla3GWUmPGWvPfDMkI1
         UOCMEwjyYDO+RfZT3UJXeqjNblrjJ9zs1h6n0v05XtnFSpD18LDuYEzyI2Pt05y7bwS6
         HL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564376; x=1795169176;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
        b=AhCIFucNtxMDndfYvbO6xEl8HO8FY5y0iOsaUVK1ljzDwhjPBf9qfFMfstfN8eqdRT
         OWzcWAZlPEjgupWthNiJlE+eH9wwRLRNOnHJltd3a7DmFJYR4JnCoZkQZ36omdC9dXTH
         UGR2m6ebeAzB7YReN9r17/guFu3NIa5ZcwyWKU5Qv9c7naRaZZsqHgEfwZmYSHclLED2
         Ry82+xqAspHL9vz9RNI2YFOWI2uZP19IeCeMkVKk/l00x8yLRjGvLf9qlLYi5iHu7Emw
         Gv1f86uvNrZddQ5os9xAMHJiEhZYRh6NPlTTVwRPuLjWCaTJhjZsnZnp4dX7WM7jlTyZ
         Mu1w==
X-Forwarded-Encrypted: i=1; AL+hErEL/o4l0z+oJ2qxqTHnRjL52c+l04pmkvoluV9Sasl1K1DAK4xak0lGAHCnnqFTmJ5D+x07g9hdJzXw@lists.linux.dev
X-Gm-Message-State: APuU4Z9aMM+hzSYYo/Oy30gNVdbn2bBJYiZeVvjLvI696rvvLVsyvcCk
	L77z21Bj39IjPcPp+izeA3hlt4oR3EnyBQOWtiNGFyCopSoKjk0hseiYsvnHr7EUrNTt
X-Gm-Gg: AYBFou1wvKsB2DOaqUh1HpR5yR0k89I6dhfSWf9XQrXmkvY4BJO6kG/n8KIo6IfiR53
	tnFlDKkhjlE95LOs+q4agzE5mC0Da73+EEFy6HezEYSQ65XdN47X5inpbWiz0VGExB44w6CyktC
	epP6lyGgVp2iTNcIVW9zw0LOhnwFAId9EB6c8gGqydyxzk9PbsKxt6yOSs6CvkpZhtkks5k81Aa
	MtrHzE/aYCovdHow9EEoyXiQbnOtpo9ylR4iEZEEpRz+ZdSL3NJDIQp1s3KXUA+DsUI5JWnbdSx
	jslgdFJ1AhVZuSeKIMW4KdEW/xdIVy9VRGmId4kgq94yRo9O9eRyubGHlU+FiW9s3KP+K6N4g52
	kHJta4D/Bcpt3h0MpIdp8JwA7zlyNyhIyiKsZr/O7dsUX3D8reprKPnsM6FpPHBhjJZuMZ78gH7
	9EUhBNya+ydUqLE6uzAUPaGFwbBtjI6ZUr5Awvp3bszzzQBWLK0ykVK9n6nOPiWaHq9TPFY6mUG
	b5/FUm3QOHoMk1/J0LiIBnD8AgXszNfjHl0ombxWwq9BkZO+TKtrK+VVVLMgRmmIPiNF1eWuBhM
	a9MjFJOMwRyZXQvoEZci6soTiavQyHNelCjhWDd6utJqscsOXaWqtSp5TWxFy4g=
X-Received: by 2002:a05:6402:280d:b0:6b6:4dcd:967e with SMTP id 4fb4d7f45d1cf-6b7c0bbc394mr1685420a12.20.1794564376161;
        Fri, 13 Nov 2026 02:06:16 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1b5asm706711a12.4.2026.11.13.02.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:06:15 -0800 (PST)
Message-ID: <4dfa19dd41ec1a202182284d9617926a259288a7.camel@amutable.com>
Subject: Re: [PATCH RFC 16/41] configfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:06:14 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-16-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-16-4c998976c6c7@kernel.org>
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
> Initialize configfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. configfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/configfs/mount.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
> index d8cac1cbf3bd..60ba24e7ae2b 100644
> --- a/fs/configfs/mount.c
> +++ b/fs/configfs/mount.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/slab.h>
> @@ -106,6 +107,7 @@ static const struct fs_context_operations
> configfs_context_ops =3D {
> =C2=A0
> =C2=A0static int configfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &configfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
