Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564840;
	b=KteTddod16Gyjap103hFx5pXXu5GdUHPIPIdyaffdo542sH2IPuS58w2XDPCpLMluIYz
	 dwmPUkDAxVmLxdDXWbwTT3nQSw70H8T6edYC51aBPAm0m76UG0pHGfnL6HbB9ZT1PX0RG
	 zlnav/MXpBiIhS5tMgk2Fo/lIiiAHriBpa2d2m9Oo8dohBPH2aSxR9Rv0tHFK7hZElNmU
	 PPbe3Cp9rbMUWsPXenieQRxsZ+2d/pdICvkb7pxRf1rmd8yXKZ6SsAYpZjuvfjNCrt5L8
	 yDUyw8JwKyPjphrCmEUxg2W2ZA8n6bN7skzPduDKLzwFR33O53oA+2WiX+k74HyNcgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
	b=dAnoIVdOH8lTt0ZEp1TlFAKzeRQFiyxP4xBohogX9fcvt+KLL+bnicmMMBq3Fg8u/Oc1
	 rFycdIeAc1skiEXFSyxqmGvuBacpb399/+UB84bgL/XTGwfKcCozZT+bMmh6RiGQzXhQY
	 6JsdNJDVE8LrM/nxTxb4rxr9Uz9zPA0nRiy7P00YB9kPKKcmU+oArvq55vMnaWdkmLEdN
	 P3aCghewHpw5mhrkuqea7Bn6cXFb4rqbnN7dZCSr55BgUa5S/iv8Vs+xioa3YjMleCPrg
	 wKxPsBOhPcMOEuzQVYKRWCNcmp+FUcW0sRMrFfTYRgtrldqL1UY1RbpzG8mIqmRJSNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VkmPFwxl;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B935606A8AD
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B935606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VkmPFwxl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dee593f18so1055764f8f.3
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564839; x=1795169639; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
        b=VkmPFwxlBt1DKCLk7Md5fLX4sExE7Go0YTW2KyJ3Ob+xcELI51Gh5kBlyEza3uk2CW
         2/BltvRAiDBCN1EanEp0V5TXUOPBojZ/0AmskP7ksgrYEBLZINv3oPPLN6dBk0PQHKvO
         eNO6bnwI73kRLHO5IgQoWQTWfDMrsisQOaOhi7paYOrkWbd1IvwmpIBJ5cWsUqt65JU4
         +yEvymNmPLliHA69w7R1xHWzwpXdNq8OK+bAuYJRQewpZfkioB1HnG4LEz7Dt0dLX/Ru
         ePSIMvsdbHb7sRM/LmdWTqC+di/we1OoAsFHrXsXAr3EK6Wu+aCaZYLtG8/7MLDF25fG
         kKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564839; x=1795169639;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
        b=qyC9fINFqburQOfIcKyaq8iGoRcxO/fcRSOCuFEzKoWTDzCUdv6KWzfkYlFgVISWp6
         F/BoE5trkEMmt5Xpbcxt4MpBA07O6bvRUib6ICQoKxBB81/rPsljUzjImi4kMsGlRI9n
         f4iAzcrL4ksLhHJqAGmKaTj3g2MANcFjwjhqWtyZBEsLsrTFiBUXNu/YfBZC5GULWEr9
         poIhV737g1+2DwJF2uw3iaWclGiA5sGNNlM98C6QyEa8P7BE0H81CetV8tiBOr+NY9Z7
         45O9qWz2Xw82rAMp35J0++u4HVl3MaVqE4P5fX64eVq5d4hfH8Cy6IeYi4op3Mmcwlbp
         dQHQ==
X-Forwarded-Encrypted: i=1; AL+hErET/Ot/TfAr/7t4IPwksD5hZ3MXsNL0jeu8aMX0oBWCsJ+AwSEiWmYO98zWlqzU6YmaYIOevdnQ8jTK@lists.linux.dev
X-Gm-Message-State: APuU4Z+T8WcJ79zHxiNf5dbsUuJtlNgogr9WwoeP3GLx+7jV1jW+LoUY
	lST6XIzyxpWrJHk/PkQxsX92lwoctuM+0ZFyYmtWAHJuXP47UnsjeD4BqMCM2a017g+T
X-Gm-Gg: AYBFou394eSZYwcs1bf2lc/RDzgklQg5yrmDlToEsb9Bwy3NZBqoxi2LtKpqK5x4iCu
	sZKNvrUE8P69yWk+bxd4p8PSjTYPYA1lZox4aXF3UodwO3K3xlmvbOSwOuUJkYsDm3LYEDbwkwP
	D8NcTufxGKMVfgOi0O9iK2gUA8X+CMGlgxnrBYa72lZxZ4bAQt3pPDgxaYqBxqXeVbVG6AUj/gc
	5F5g2XtGy11nLkln+Z3CeysIQr8h8xPtg4BREzwlv/DQhwmfSRck19Y1wwEUE2zZMBdqrmz27b1
	QsV5eyb+2sEhqwZi/41AVczC13SxyPvWaoXElIFAHnOzE2cNkJ7me7JQhPnW/180Zha8//yQ22X
	+5PmYAbj/Fv0c8XO73CGTDaeVUO/+WXL4/F/nammla4hT5H/KR5QOjI+qoSCn9G3jMruug8RRw0
	YOn/TCI6aT9+7LZw2lEKXxi6bopqi2w3Lnw5a5ceS0v89yPWtHKwGA2R2vUgjRrIl7ZPPaSu3OQ
	1xSW5oKDcBWHmWQ6lH95rkcgu5DrMet8EnBlXPBpSMN0pb1EuSJRSWGNhDO16q9/7tsUcghoHrj
	11u9uzxK4TEwSu/ExCFzNih3c9CF8jO6IV254KE2szrGOxR/QeGOyjNMMkQm34c=
X-Received: by 2002:a05:6000:993:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-49c6fd932f0mr4358101f8f.12.1794564838578;
        Fri, 13 Nov 2026 02:13:58 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d673ce75fsm190118f8f.55.2026.11.13.02.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:58 -0800 (PST)
Message-ID: <77855be3fb9f0e1888c6dddc56d73a1683c820f0.camel@amutable.com>
Subject: Re: [PATCH RFC 25/41] pstore: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:13:56 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-25-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-25-4c998976c6c7@kernel.org>
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
> Initialize pstore as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. pstore never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/pstore/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/pstore/inode.c b/fs/pstore/inode.c
> index cf499ba72702..4658561cf90b 100644
> --- a/fs/pstore/inode.c
> +++ b/fs/pstore/inode.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/ramfs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/pstore.h>
> @@ -491,6 +492,7 @@ static int pstore_init_fs_context(struct
> fs_context *fc)
> =C2=A0	ctx->kmsg_bytes =3D kmsg_bytes;
> =C2=A0
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &pstore_context_ops;
> =C2=A0
> =C2=A0	return 0;
