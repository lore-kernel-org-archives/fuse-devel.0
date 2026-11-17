Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904514;
	b=pgpYzMF/T8U7HFOUWCFS8JtxS5eigEXToAZsPQ2OYw3Q2llmsbSdX/h2Gn8eKO4gqJ0J
	 hGq0ilIsKdPH910qyBtYVtaKYd6nAP5P96lVVkG+eEccfEHrmeT4ivoXT777Zm5URRWHd
	 kq2InE/75vMgHPoY5rc/deHCxgOaBztDEqfM1+PKHVJJupMZ3ylSGo2Ci9ivHJx4Lkdgl
	 aarZQqbBYoBl8mJIdc+y7ZY8ys+uZs/ROv2BS5SHt3dq4/Y1ViIFi31ER9FFYsc0foi7M
	 n+hzk7R7PHXemx8oyuZ/Qlbm6qEG3Co2zzn0vY4LdXK2aYmnvUizk0+fcuste8Oe2og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
	b=YNo/bv2A8Z7oJLnh2Cv+YbO+dIrRhPsEBahblFiCUtjj3ZHWoANsSJzXLO7+XUGsoED3
	 7SdNS6vXKP4qH0SRf44Bp+DRFofJDycMHYxKTNUKPyzY/GmPNiuttP/q618wYHHvU0G9T
	 P41pp4amS7JXoyGToK2DTmVHNm8+q7SJrDPQk+Gps+sn+gcnzj8B8lgMgI3DSwhecm+4i
	 dfd8zCMqJfJgfc286tR6a/pBQk8jwW+mknaEGDjUBU0IH8rj43Gsdgp7H8R/zRHUBuzOA
	 qRw7qhqZa6gxE9oux47sIK1XjuMsbIWmud3r7I49ZUKvOZoxp/r566ua4mig2RRKivQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gDWwaTQp;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AD6606A880
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 08:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88AD6606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gDWwaTQp
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so506523f8f.3
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 00:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904510; x=1795509310; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
        b=gDWwaTQpVljzKPt0b1i12p7H1TZf563QmfedQ5NrN9tZKYATj1Zi0/KbfPOB2c9mS0
         dnBq5H/sWRUXlf5znKVZ3+w4LsMjH8xr0q9nuvX9AkfaAZjg0d+eMaQwPq0fuXFC/hcm
         xxh4RNGlYMYWbnlORdg+Xr6rB/kp79Lct+VXcJmAmghQV+Li2GIC4yhWrQbyywmL4FK3
         V5PvE/qYYZmLwJx/hwYtJypHKGG80cEWjq+T6tx25YZQETdUyuFJFvGiyZTjq1gTinML
         QDXCuK/D7WqGiR0SXmPyfYa7bTkAxIJOKNdQqDgIAJGmnmiNfCdsYa/Jq7dH88fyoI0y
         TgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904510; x=1795509310;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
        b=izyuMNCW2rjTM9DNufqXHUd//Niz51b+MA3fHXMuzKotTEam4xYbJjdlkivNa5F1qu
         JrJFh3zhtV++ywXmks5vZuXtB2AbmLFl48ijdEvePhFztaOcFKprJ3BikUe/oGRGPSqE
         BXUDgFLbY3QvWdaXZMRWLIONwOTDrk6ANcgsz1ItAfsGdie+Vl12987PfxZD5nn22GtJ
         /qNNfAti08b4G2L3nhMjyDyr+WN4qv8hUQW7wMPWLPuG2T18cL0UDLmePxPV5Hp+5zs1
         226z1eOddWo/H8ltsrZ4autfLneoSzSCbj4MVdlPzGENKk7mjaq8+pr5KZGf1c4ZVzwT
         f7WA==
X-Forwarded-Encrypted: i=1; AL+hErHE9tOa8f9XMp8oMWOMNwUHR9I4qnRwQ2iz33oA1DwZ7M9QVK/MJ4yvoEEf+1203rebfTyCCjOqX2e+@lists.linux.dev
X-Gm-Message-State: APuU4Z8TqBCmVruOQGs8+MGlPiptdzMhbkGjAuGRcw1NMQankWg1OlIh
	fOREoxJfxAntINfPmjoQjiPou7dNkGsjboFH4uJ4qzi5VPKZvby3N6oJveMs48QF2ioB
X-Gm-Gg: AZFdTZeiFIBOHFulMH9C7pSZiCO7HkGeUskGM19reRnCOoB5FZkD7R01SHlVJzbJP7z
	NAGRuz/ooHpWcRI4hu1D4aPI555qAthhhOa71qQtPkCXbXIV3h0U57ePXCLKrg9wQUHa2Qr0QCO
	l1aDu3x8oSHdnySw369cZ2AL5G03CEJA+zdo1Oc+tXMyBBT76vx6Fo0nFE4J4EXDwJkdM2FhrhA
	seFBjZMBuycW03YAVNqfBtrUJ97bXAkGXyus9SLJ6++X5rwUwyIHkPvtha4HmAKmaHjVz/EFnBk
	JqyjjQeymr7UUPMl6J6dVv9CUJTAlAPvizDLYRSI4/ult1pmOvQDpFVrXATwO8Wsv3AsimBy8Su
	lcfEaEzwetqPMKfapXwbrmdDBrl8QnexbzAE0Zad4lDHLhPMX17gEhGl/OVa+6RWejITY/WzkhA
	MsXJHha3yjZwOiUH2fhhz0e6gFvUH42ACf30agOQzhQ2IdBmK3gLrPns1+XPs8GcjkeSKL2wuje
	JhqpqYAJtped8wIE00bWHivK9DJ2uVZEjFs3QNqyEkndM8TrnpavKA30UTrQPzyDVFDOI3qhETI
	mlKM6k2INf4l57iLnpnrF06hcsD+ZixlUZXUuKgWVJjrBs18Axs+pgJwccDPfyIqT0oQZ9sH31D
	ltnVUqEwn1aNlYn6MwbqIavDp4CWjzk82XFewkuR4IeNjvh6zrltMmkit
X-Received: by 2002:adf:e193:0:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-49c728c6e6amr26569239f8f.43.1794904509932;
        Tue, 17 Nov 2026 00:35:09 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm26338505f8f.36.2026.11.17.00.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:35:09 -0800 (PST)
Message-ID: <b0ec2cd8f9b7a6a2e4a54c6df2fa897bce068cbd.camel@amutable.com>
Subject: Re: [PATCH RFC v3 28/44] ocfs2: use fc_init_pseudo() for dlmfs
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
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:35:07 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-28-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-28-8cbbea1cf34f@kernel.org>
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
> Initialize dlmfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. dlmfs never holds executables or
> device nodes.
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/ocfs2/dlmfs/dlmfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/ocfs2/dlmfs/dlmfs.c b/fs/ocfs2/dlmfs/dlmfs.c
> index d3bfcada3e3bf..1789ec96dc130 100644
> --- a/fs/ocfs2/dlmfs/dlmfs.c
> +++ b/fs/ocfs2/dlmfs/dlmfs.c
> @@ -21,6 +21,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/types.h>
> =C2=A0#include <linux/slab.h>
> @@ -563,6 +564,7 @@ static const struct fs_context_operations
> dlmfs_context_ops =3D {
> =C2=A0
> =C2=A0static int dlmfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &dlmfs_context_ops;
> =C2=A0
> =C2=A0	return 0;
