Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903967;
	b=odlPq9m1vLuzMO5gtCaHpOWO9LZlx38OzRYoREJ8X1F6rk75ihOKyjy7xnkNyIZlMhbo
	 b7T5rn0ZgnBydOatyZRM0CeMbDuU4m6DyoHkpQ8tuyxQRlOdzZe/R9AQGJ0Z0pU06TjGg
	 xIH4DSoO9uUgCzmnQOph8IlMRoyOUaUfTqYnbnIgoX6ucq54oO5/wSQeOnBoAUjjdAd4M
	 m5mzAztl/sSJqcEVeckfrOdXzCqbRaWhlecJG6i2l1D/a5Qbgn7vH6GebHWFm3dchix80
	 sC399Ww6EU8PjljwB9qqOkrscYfT1IKOVlWPJl/ortMhCnu8s+Zl9xFw0l4ukbLumhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=z/NZRmC5bENRF/WsK1hUt6gARTy1xozW3x04wBCWbAk=;
	b=BczIRnfUUOxeQh0KNtI3gNRdYIRfu43O2M/GjKS27GJG/Jw9GLRuki6yV0qgOJsvFuzN
	 OOapmv86fHsfir515cxm5WJeE8Sk1plhrfvlF9Uc1/8ZVg3S6mAFOMVbGYxth0tgh+y2I
	 4wfGWVR0ZccO4KpBx4LWMV5XoTg1967Y5DNCEeSWIcj8PMiNYh1k2CrP1pErv5oltanpz
	 K8YIULn3ID0Sa36ege/92GlKO34QBLFLcBtiNsKrwbH36EO9YVAqXVvSZqlPyDnDQkc4M
	 rB/0YogMFv8UFMCwACGihFr4eAuz5emK8V83AXUYwoguV0T8hCKSkg/mgquNz/903zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UEAOLX7l;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D07606A32A
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 08:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13D07606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UEAOLX7l
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so7875465e9.1
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 00:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794903965; x=1795508765; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z/NZRmC5bENRF/WsK1hUt6gARTy1xozW3x04wBCWbAk=;
        b=UEAOLX7l7cnwnMylb65LK6lGxPXBNYSXhSi4g6VCjlx3u15dXuKJJ17At6S/HsGzXq
         ggqexs6vn/jsiAFSygZEpK/eXu24zeYNDhEt3eX+bIqdQOU7krrH2uAVW4/S6/t7I20m
         xvY6muKC3w7G9OX5wyTrLSj7WIOoFyO8SSNi4wORThA+GQ3ofkoQdeDoOiC93e9UPPMj
         fel92QVVW9w3x0dVC4d1EB3bSzt+Og1bIVxFNuUtg0G0ZUJe79TGR6f/N8bjCEDR2jLY
         BW+lkEDOBfsWAAPxjL3tQbgpzXJiSp1d6PQh3Fy3m5rUsE7Igyx4gJps6nl/+v7iwZHY
         Iq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903965; x=1795508765;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/NZRmC5bENRF/WsK1hUt6gARTy1xozW3x04wBCWbAk=;
        b=lHlJU/73RXFQLLxTxrR9adwfzdT3NggCC4K4jM0la0SIpr/bRFmewH1hHWrrJzUgO8
         82rs8MFRBXOYQ/rKEOTNs1afwCwnQim480r6Mj5vC+gBsbkSHVBG5gYMgQqg3LZ98GHU
         zreMM43oYhFRqjJWJ5v3QdqkYjLfbOtG4CxSvG5d6FfVycdXLpR+xpcde5j7OAUz/Lh5
         q1ONnjvdWQTLLLgjtj2oIrU5OyyPttr9v4zzNv+V5E7KSPvPSS7JpKz0sh9dWJTCXWs2
         nSA5/di52MWfLQGYxRSbQZXGKvKCxR9kC13eLqMGwAodwIDiZbSF4oZmp/ul2OvoKrIb
         NBeQ==
X-Forwarded-Encrypted: i=1; AL+hErH40m1Vxc1Ci8u+60u8TEz4PbPPOA3LZg7j6y4xcyUUydKRZVIL4DGoyt4ZFE8HQJWinzGEcqTAYBlW@lists.linux.dev
X-Gm-Message-State: APuU4Z8ImtulwdV5EexbiQUpfrwKWtZhOuUoXsk+Su42DlPz98BIJz6B
	OR8pQgWZJbyH4pymfjUI5lg7usaN6k63/336SpGC7KbVerHAGE+Xmv0dOkx95F3ZFOhM
X-Gm-Gg: AYBFou1RzTH33bc4TixN+MyeIOC9xoUTDeC8FjYP0jTm8uuGt/wZqkXnt2YGTvrzIHN
	MZlm/ydWfHzVsHwvt7+9fIu47H12gJuiwchHkB0Y0IVDfMR/ddLuOOp+F/VmFNhw8dH9YEWvgLC
	MTOBC3k/voHt/Kkj9cRG7lnIOqQ9DBQS1WQisuiSR6lM+9hNPfRVwPawl8AqGQRISN2rkFCGoB8
	/Qpy8NR+TC0CswueIhcnI0/qNsMtrsUR8ke2V5EI91fOx9v/Wndol/yjPqUhM7s33QTl/Tp3HUp
	JKXqfeMPtoVvGlmUeDJRga1UisutrqjE+yvBPYke/DCXfgvFlij444lzSrs9e91I/Ik3DTlSbK1
	N571YZPEoXH8r5+3L8jDuXhBIaeb8ULNCYXcdtVIHymYTSaEMr3302VKD8EnFWSsCYP9ExnTw8i
	lme/YDLE7kOiG31Qjd01BmgpKjENWWLrkOpWE3qlBkzQNbEo19wQCcOp+i4aZLLFI48Zq6g3eHf
	yZC0cL9cltz+997RQf99lRMINp0eG6xnYDBF191nQz+TPhe+uYExWTWIyYrA0RwbRRK9pYH46uL
	FNeG75VHOVp6KDcj27CPZpEL8qk6Yw/iG6yZrZA3eOKHc14DNYviZw6iwXGyL8Xr/qwN016NdBW
	+2u4OplhvwruY52IKWmqxWhyYIvW8paaIV0PR8VO6xUBR5H6FizoafFB7
X-Received: by 2002:a05:600c:5493:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb783813a7mr42606245e9.10.1794903965400;
        Tue, 17 Nov 2026 00:26:05 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm12629125e9.15.2026.11.17.00.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:26:05 -0800 (PST)
Message-ID: <88041240268f70b218de7dfd58c41977d03a60d3.camel@amutable.com>
Subject: Re: [PATCH RFC v3 03/44] target: fileio: check that the backing
 file supports ->{read,write}_iter
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
Date: Tue, 17 Nov 2026 09:26:03 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-3-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-3-8cbbea1cf34f@kernel.org>
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
> With fd_async_io=3D1 the fileio backend calls ->read_iter() and
> ->write_iter() of the backing file directly. The synchronous path
> goes
> through vfs_iter_read() and vfs_iter_write() which check for them but
> the aio path doesn't. So a backing file without them calls a NULL
> pointer on its first I/O.
>=20
> Refuse such files when configuring the device. On the synchronous
> path
> every read or write that needed the missing method failed with EINVAL
> anyway.
>=20
> Fixes: 769031c92c8b ("scsi: target: target/file: Add support of
> direct and async I/O")
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/target/target_core_file.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/target/target_core_file.c
> b/drivers/target/target_core_file.c
> index ab9824a4852f1..a5391e57e9aa5 100644
> --- a/drivers/target/target_core_file.c
> +++ b/drivers/target/target_core_file.c
> @@ -144,6 +144,14 @@ static int fd_configure_device(struct se_device
> *dev)
> =C2=A0		goto fail;
> =C2=A0	}
> =C2=A0	fd_dev->fd_file =3D file;
> +
> +	if (!file->f_op->read_iter || !file->f_op->write_iter) {
> +		pr_err("FILEIO: %s lacks ->read_iter or -
> >write_iter\n",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd_dev->fd_dev_name);
> +		ret =3D -EINVAL;
> +		goto fail;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * If using a block backend with this struct file, we
> extract
> =C2=A0	 * fd_dev->fd_[block,dev]_size from struct block_device.
