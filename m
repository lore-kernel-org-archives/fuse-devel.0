Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564363;
	b=pspQ/w627dJDJefNwf2NvjMPjVdE6QvAoye1RHYArOo9V6YwXB1PLAQM/Jy5x/luohxX
	 eiRvD6a5Zcg9N69GLpukhMPWEf8cTbrc+LE8vseC7O7ET2+pkHRjOYrorztZlazSowo7e
	 b4bfDxoDERafz2rkpl19e0rfJcujPC/fRpc23Zm2TXees4HZz7MHfbHe365vnbWOfJOup
	 UNBeaInJxsSDelclrT6t1D4r5QF79SqZdjzGaXFs7XvpTG+DL7tgcHSod3hN5nulKJdqJ
	 eQYTqAGJ28t7hvWNl8W7imfkbeqjz8NHEFC1AwNwGeAYehMV3/krHluHbFsF1vfYi1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=TjkCmA8zoLhZK8u7U4HhR7QcElVzore/o+jClE5BdRs=;
	b=hjEsdlsVRtemsRSBEyD5tDCojoJu8/lMmXZxyJFywGgnxF3oySy0KdBw1nORNLhUvFhJ
	 z6+xVoTpgnX1N9OxaX2XQ4mn6y93IOVQCv51F6YdO1MoaaomMsHiEV9Kj6Gmxy4v7ZohY
	 h4fJZO8Z6f3A7BmTtIZIgP+TPfUVPSgo0WCYt3mHgtbC9813Jr6DXGxC8/0shUbvQ1sks
	 u2rSM/Bma6Hc+uWT5ZtH0SMEi/b9pUvmvEbjvCKlQDpObb3oQnpwTM9RDQTAUtScd/CFQ
	 RuLrVXjL82AKNKX+eO2n0qH3PZSVGOtr/NURY54iKo1gbXu7Xihtrsi3ilu3fVbyy+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XkasCFgR;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6DD606B10D
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE6DD606B10D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XkasCFgR
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d427836e9so121960066b.1
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564361; x=1795169161; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TjkCmA8zoLhZK8u7U4HhR7QcElVzore/o+jClE5BdRs=;
        b=XkasCFgRcW2n/QtIYXNSvlZBXNIBBsqMLGJuJmkERtFMR5+6z0hqHlKgD/xMArveUW
         J2VXj8PiVwQ563gSQKA8C7zD1fnQ6Z35WpYPA65ISHAeJr7NugcLhnhIpruuH2y5fXWE
         GCouy1L2EhCfo93wX0075MjqQecCEYGUhFZPMB+ht3XYgLTPxWRv5+/LxJIMNRojVtnb
         n+dz5X7qgHwxsAu7bmUE+fDNj7BJNQ2r/uCX9NDMfa6/4v6bkGqxnd/26Ch3aJiF7soK
         OlD2oi7cJ4f8SSw4zxIykCl7xjg4Aorga6OmCWorwRAb3B1KEikWq4Ep0Qnx4WWbTfoM
         Qu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564361; x=1795169161;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjkCmA8zoLhZK8u7U4HhR7QcElVzore/o+jClE5BdRs=;
        b=UNdtz6Y+QCJDCMHq93PRHVuN6QlR+ktQg0FcUZSKNey3PdYAQcVfSkwotDPUtSb9Mw
         YGzt2X4/3mFQukHXpCVldFLAfoD3RHISfEHPZr2NxRZkuj8kivwZAL1Zd7amrEVpycJS
         11IqLlFk+aCVRF1Qkb7jBla45ZILsXjW/ZWu0LeDwQidWuPfokVWYjNvlP3NdkKka2gQ
         51SBMipepjgyJ6OOOgcF8Lu+sgVEh426lphcsmYeGCQKE+OcvEcdXJXkBHajTeMsr88T
         vwALjRPx9A5IUoLOQwLLLfjpnfWxjnnv1tFKEEHmqjePmuKNm+smsWhMDtZrQUD776WJ
         8L5w==
X-Forwarded-Encrypted: i=1; AL+hErGBlOrcIDeV5H7GrZ4bXa84ECDWBPyu+CVQr5GNaRlnzNdD0apzYVLU+Gqd8lGUWAIllT2/8gspolhD@lists.linux.dev
X-Gm-Message-State: APuU4Z8cWrZSGQ3Q1UOTAJPMbFGlyjNV+7rONLOwfJROJ5i9c/SLYF8F
	jDuQV02qILWqF53CNYnKScNjaEQ3srt168hjCcGEBI1jTcHKQqwv2jFqP648UrWYgN9s
X-Gm-Gg: AYBFou05W/er7TNS7CHXX3nkY75ok2ka3X1a1mVHO8QhiblXAn7h2hyZ/AnBKKomBua
	QSBIOvMoTW992a73QOHecySKkapmm98VU9wTu/ybGSuidB7HXmLWPfykBJejwvWDJiyXIhBbD3Y
	lMsGYesTAJTzkbWHCHIEqftyeQXc1XbF4oS4JJLly/A558WSkS3kdhgUOmv63a5eFunIBb5XilR
	naK0JcCf8v3jAi2PLy2h8QQestys7LCi9/+7GC6+qaChPGLyUAkhoZFy5lbWzxahpNJ9mNPGovJ
	iOljdDEauWa+Idrl74XJqTJzKZZoRxSsSp+PYyv5tieQ45ltIeqxkTSHbdNNmHHDhqypORlsSoV
	jEG1zh6Z96V4iyBuhhO+OR/A5NqAPCCNvO7qc9HuuC6BMSQG6nz2nvgnseMg/WO8agXnlsko8ch
	+YwlPa26q7xfcSdTr7K2yUssoaPLgO9PI4WH4L4Xja1ioU/3Yn98AUMw2zeGoJh9oLH/yUMr+ig
	VTswF4uo4HQM/rCkXQtyt9c3ilViUIZlrY9n2p9ZDOlzjlihQa4FqUjmr8Ki21D96/S+ZIaED2J
	xn+d+00O4vTVtvddvB4pJgv98FvKT7wYprud4szsD3rx/oCFylxR7a8NyLp3aHI=
X-Received: by 2002:a17:906:ef07:b0:c4d:5820:325a with SMTP id a640c23a62f3a-c50963dc627mr169588066b.39.1794564361325;
        Fri, 13 Nov 2026 02:06:01 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm73693366b.78.2026.11.13.02.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:06:01 -0800 (PST)
Message-ID: <e8b71a2778d7d7797d433e7bac1a37ee64aaa30c.camel@amutable.com>
Subject: Re: [PATCH RFC 15/41] tracefs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:59 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-15-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-15-4c998976c6c7@kernel.org>
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
> Initialize tracefs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. tracefs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. The only tracefs files
> that can be mapped are the ring buffers and __rb_map_vma() refuses
> VM_EXEC already.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/tracefs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
> index 5020365ca704..e04febd868eb 100644
> --- a/fs/tracefs/inode.c
> +++ b/fs/tracefs/inode.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/kobject.h>
> =C2=A0#include <linux/namei.h>
> @@ -510,6 +511,7 @@ static int tracefs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fsi->mode =3D TRACEFS_DEFAULT_MODE;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &tracefs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
