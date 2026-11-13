Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564189;
	b=FO3KmcU/7FSERnTnalnTh6XWGnaE7MvDkAEdn+BGTiF0eZ1YG/X9kiXQOCVbOXYylThj
	 73ZYT1w4qqp3jDz86+pzbvEvq1MhpX0FXN0SJEbhRzvGTLmwiT5vBeTd5FgUsxHeKoUzt
	 ea+Rj7DDU5ddRKRim3eZ9igk136ZKj87lXuyhptw5Wu8AiqUcwIUSnlDDl19PfkT5FgMi
	 eHl60LuhhRCWn2jBQMW6Sa76X7vYp5G4KtTnj8fNQc1yItUKnbg0PpFiGUg2KeGKgd4Bt
	 tvKDMaoxRwG9PW6AjifJj5oz/FzWE2Qn8mLjLm2WuGpQPxVbKbCVRwZvGglWEOC880g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=SoW/gPie2WRRtXdhiV6ow6HDYwH4jtR4w1oiMzBwW74=;
	b=W6XPZ03KLwPLF9i/paLbMSBxL2pIbjhySpwi9n7oNNQzBWEe4H3QnrgH3xVer5f79K/a
	 5Xb5nbRLgvlJ4hFRnSGqu1JFrJ+gfxom4KKTaQgG8UfrqwZiu3/HA8r8lGADWhxMWE1MK
	 a8+KaSDJ+KuuKUuOhw0wqmFnkDgA2AXn6zYNBGEh0Aret9+Xma0bS4i3H/gT74jZfGraE
	 FKKb0Aoyj3/IPjInyP2bDBRkYpJfskhfveEm1JqjjHECQUQD6COkRMcpglDSFXt6JjgDX
	 CFZlANRI3uei+cROP8PV2ZXVNKov0ozHvdqbMC0ZZG1gBwhLuc5vgp11KBMCrFRHXZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A5AXmBug;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B46606A8AC
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74B46606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A5AXmBug
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d473cfff6so128195466b.0
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564188; x=1795168988; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SoW/gPie2WRRtXdhiV6ow6HDYwH4jtR4w1oiMzBwW74=;
        b=A5AXmBugVWQHGj7zCfxDZY7ex0LnXQpTthb7C7xEqYHZEtqxyq4pM1iyNZVnvB8O3z
         U+yOzodWK4Mj9EaaHXpMVKTCwYXWzpf+NLKvmzWEVwG0chg51TFVB7t4VZBLaeedN30K
         e2dpZDs7ZLY7mIYQM+KBAXVFjt9iMEALB4qeGXDVJAFVERTqqT3XNB1CAZVYamfSusZK
         tcPvxsyK1ZKzkpsqy8RltsGYx9+kjExuGAWkfh91lIO7fwQJzFrH93g2lW0N0aCZK5Gc
         aKKM5k7XdIF0EfPiBLp1YcBXT7vT/neoCHrjc971xHu0wQGBDCepBMk7ymmm5FEydAnR
         QJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564188; x=1795168988;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoW/gPie2WRRtXdhiV6ow6HDYwH4jtR4w1oiMzBwW74=;
        b=PyHx3ocoryGh9NRYxnrNgav4vrO/P5tpSm87YCTG0gd7W8fb4tW2NvPPq9WWWMZs9K
         kIUzN+zfNZjzw7kPlCAD2NBAGX9gm/B7nXT8OOySvnBininVkZpXfARpvODre9n/h6sC
         /2U8vMJ3VxEra5ef6J1nC0naxYIkPsQLDrMYEGwNMGIqowa+T2wm+BW+ipXMGcNzwqH4
         Ti1/qaPxibKQziA2LNDx7LVfqkJwj/pqCDbba3noLO5PQmFHb+ftWzAorkuHMIhzxoib
         2JHgK59qGQeiacqvtfeCQQs1rJqyu2wYCkBxHazV1Mn2FHDajdc9gYwZKen2OEuH6Lcd
         wncA==
X-Forwarded-Encrypted: i=1; AL+hErGAsaRWVNQsJrqnkYrO6VahH+QubYMW8xoQ1ER+QG2fS00b9PsOkgyq2CW7FQeVxGIyrpF82/L7jisC@lists.linux.dev
X-Gm-Message-State: APuU4Z/SVaO8hN+XPR0anTmc90CyAGRtrB8ec5RCHHFzXZlEGjL9eRoM
	cVAV6uQ2vva1qFg9m0spXDLk6F8IiER1NgPfDGrTVBVQst33cLgeKb2QdriK9U8l9tkA
X-Gm-Gg: AYBFou1HTW7NQ693PqEBPcImfqI1C9dmgOt2GNE8xoUzfS71+HmbGmn7X6lJAiUUxBA
	0Jq1D8fmO1gEzrN0bOYxjxXRZHgplTLkd/qXK7teNZPB3ZjNMXGH+MqMzXzDoSPa3oCxB+gMhdT
	jaHC5AYRN12piALchMjawT9xjozMFxZAPTCuS38/PaBZz6qc+bOhQ5A5VfOu9ZooA8+XeK8d5TF
	d6XD2+LD3vt1qy4pdVruVoGrpRqTnGDwP5Mm4cHQb+p6KBcr6SUgeab4cFbMqzVf/jmVXjhKFi2
	pDlgWMYspnOe/hySJ9FUAGln0sTuAf3C8o4bwkGhU3inXL4s+XQVQPTFnnjK8aXOPpTK7itaAJ+
	PGLlbGCvsnqHLgJOQK3G857nmhjPK21/VVzUb+/gPx5DwoTpVdaTCk/Xg/KKTyTuvtgAmuFqj/i
	26ejNoMgaLiahWLyaK+O1mXPIsW+2HCsUUN8oVLUKzpgCalPIY9pg9Ck6geV5uMjtyV6dbv+IRw
	7Stz5Ycoeg79Q5salM9RQZ3ttFLDKdag39Wrc5jWABTrfNwATWsYI2mciMw7W8Ugsp46yTCcKYe
	O1ygIE8qSt0tquujFaCltisax55n1HIwrIXHNenukx5YT7Xp
X-Received: by 2002:a17:907:d12:b0:c4c:b4fe:c9e8 with SMTP id a640c23a62f3a-c50963dbee5mr161853166b.38.1794564187801;
        Fri, 13 Nov 2026 02:03:07 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm74933966b.32.2026.11.13.02.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:03:07 -0800 (PST)
Message-ID: <fffc4f7f87fd5f03d1ef409df76f71ddad552213.camel@amutable.com>
Subject: Re: [PATCH RFC 07/41] binfmt_misc: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:03:05 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-7-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-7-4c998976c6c7@kernel.org>
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
> Initialize binfmt_misc as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/binfmt_misc.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
> index d945b4f6e158..7dc233becd98 100644
> --- a/fs/binfmt_misc.c
> +++ b/fs/binfmt_misc.c
> @@ -22,6 +22,7 @@
> =C2=A0#include <linux/file.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/kstrtox.h>
> =C2=A0#include <linux/limits.h>
> @@ -1575,8 +1576,7 @@ static int bm_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	if (user_ns !=3D current_user_ns())
> =C2=A0		return -EINVAL;
> =C2=A0
> -	/* Never exec off this instance and never let anything stack
> on it. */
> -	sb->s_iflags |=3D SB_I_NOEXEC | SB_I_NODEV;
> +	/* Never let anything stack on this instance. */
> =C2=A0	sb->s_stack_depth =3D FILESYSTEM_MAX_STACK_DEPTH;
> =C2=A0
> =C2=A0	/*
> @@ -1660,6 +1660,7 @@ static void bm_kill_sb(struct super_block *sb)
> =C2=A0
> =C2=A0static int bm_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &bm_context_ops;
> =C2=A0	return 0;
> =C2=A0}
