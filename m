Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564237;
	b=uyRcOogR3c/wowQvfhj558jl32gnurOdaLBZKKDtupD9xhjAddLzwsPjpUGodG+/cGK4
	 Fs1fUhIuBkgMNNGm4SAOGSPVY90eKSHBdcojL7yS9FrFd3EckFFMAIeo1B3kBxosLAH1L
	 GKOppfXO6MFlhLd36ssw7lQuNfzQRYWu4x9oqsKEDvJ/YM9zPlmsKPQxaluEvNmeLMQRx
	 oZn8o5htdoUQn63QSTuXzi0rynV4J6ClBJ8I71SjomjVsPxG8LRHEMoI9zXiv8zbkV4U+
	 BBm6roC1ZMvcVu9TYD5LMjd5PcZ37vloDaoUWM5conajN0q+vf9AtFKQEy2s6amBzpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
	b=zgSH5dHtQ7hchYZ/kvM1CH5WF0ktIwhgj63C1cRWwC9p/DgEFek8q05uzNAg6891hsqk
	 pmoai0cV+IIM809bXbJcTQcWMFzdQUnwTu1th2uoOYMrWO74Dhu9hFHvi0cPkyrTQdmch
	 0934mPzYXQceXkaFn3LGWx1o8nFicl4LutmMFwxDal8NrTcWavwpKx27Zpd4r3DdvCgeU
	 GiuzI8RHF2mUkR0opj4GDeBRaiNSaZ3V9+3WgQ6GGxP0SLVrx5Xr4zDCwqC3ZnB1P0YPX
	 w5tVrz3/znsvq+9UdI8+d/OMHPhxroGX+59dfhkvz2VkBXb+ZY1WhCdTDxklZ+vuZ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q+lMz2fH;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE825606A888
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE825606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q+lMz2fH
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso1006337a12.1
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564235; x=1795169035; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
        b=q+lMz2fHJ9i3ZjybyY+NkVQU7sgwYRyTXlZ+WjMrlNv4qgDUeJ96f51YP5y4KWISsh
         INTW6Ddk59Cg6VNJ2rQRM+UJkEGZREJB1MfKeuCFhrhe5QemJ8KX9wYR9KTdHnxBZxcu
         5xRH0/pVkHe2NjnKa1l/PLhbaWmORZqnS6b4gf1sYNMhN9v0ZQHV+AZvO5/iI9qh74Ja
         x71nDvqD7/9wpgWbzemm94G38fMdL694mQq3QVtHsF5wiqE0FowPDdLLgfMUx63JpXXs
         3vHJZaXJatqwPAiTGDTWQohO2KfvIc8UHDBj8IA/aa+A/wb35COZDzmIU3FIjU4TVIE9
         iRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564235; x=1795169035;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
        b=WcrXJSzsiekb2EWhaPdjq+0HA0BW1sQj9mVAIX05IO8kaD6P+0nNqlTdDbELhNc0h8
         efnaYT0KSk4G4mwEATOftWqeoj42Kbj7KWiZpTGQdYnCa7DI4hXQWTX58cLDYVzXs/a2
         m4G/q4nFf1QKIkizc7J/D8usfusNaY8U3DnxmVxnsSPizvCxXB+SyBGRE9xiYA4hBrhw
         YudhF0Lu78up6ueFCUHWZWkEsopqpAzazPvyQJPF+YgvOYk7sMHZTQtYz7LjiD2NpDOT
         6wsubO60Rum/bXY2p8F6TVjsOmsU47QzkfvfvlsQXJBTjFxAb7+B69An50FFuNpR9FSu
         9HIQ==
X-Forwarded-Encrypted: i=1; AL+hErFIp4U0m1vLZSIH5FFaGWBU+pTRBdU5Hvtfibi7Iu7rI/n+xH2oYaicpA5rrXdbTncN2y2nQVExgLSO@lists.linux.dev
X-Gm-Message-State: APuU4Z9YdrLZ+eicC0p9riXwsGIIIkLHJyWsJhBhTp3rP1ojuPNAF6jJ
	XRPzAeH+BjBjABoUEYwPfBoZU6t/yd6yT06uQbO3Yigog7P0MsH+lHyEvDy1ryAwAdMo
X-Gm-Gg: AYBFou33Ij0zbV6Vpi+fcVuwFpRuq801M776TRG9Vtt0Y2dYU3OnxzY4+VX3c/ASwQQ
	AKB/u7htMrUlUSMiM/hQifYVtsnefVOXZOPHDBsegDpEjkOP+a0TWSG92yFIDpWtEownwPArVHE
	LzU1jI0IJwiK/EA4/DuNVHK6RCLU8ZdHZUNngzdfm2fAJbTJbmDQ23RruqY8AjmhE3Rz/S3yKEc
	afJlFIEDMXMaiG0gaxY13OHMdL/lS8IU+NNapgxau4qlu01P0jCXpg6kwK8Qr3rM0BkWucHxWcO
	iyDOdte82U/ML6V1/y/U59atmvFSC6qocsfbaK4dZp6t2lucj7Gr5t1qMWvF2zT5Ytu0PLjXS2f
	QoCB4ZMFkDnvzKxs4UKhLpA8KA08eVa7jVyzoTEaV1dKSZwzz1PzATXlckcc9vEN3C9egMLgNyi
	EfR11X0f+Lzxx+RivBO4doyg5l7PwpLlm7xHok1cZ85WlV4MfwBuVa+waSi1IutTg7jDmw0XOqc
	WqYbxkxdOdeKvjTiTRw9+2gJfv5w5XnUowA6qfHEMmLVLYq+9BtvUkUR3dq4bpWukWxEYBOerGN
	lyURfpfX9GW4v6lHFa8kaE4BjVf1jd3JdK79DX4/9V2j7xWMdFJWutGdCogviN8=
X-Received: by 2002:aa7:d556:0:b0:6b5:96e9:ae97 with SMTP id 4fb4d7f45d1cf-6b7c0ccaafdmr1234919a12.34.1794564235160;
        Fri, 13 Nov 2026 02:03:55 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm766458a12.9.2026.11.13.02.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:03:54 -0800 (PST)
Message-ID: <16dbddeb5cbb9613dc806b43fc681eb26aa3b0dd.camel@amutable.com>
Subject: Re: [PATCH RFC 10/41] nullfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:03:52 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-10-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-10-4c998976c6c7@kernel.org>
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
> Initialize nullfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/nullfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/nullfs.c b/fs/nullfs.c
> index 319c2f5c5a67..2fe24cb97160 100644
> --- a/fs/nullfs.c
> +++ b/fs/nullfs.c
> @@ -2,6 +2,7 @@
> =C2=A0/* Copyright (c) 2026 Christian Brauner <brauner@kernel.org> */
> =C2=A0#include <linux/fs/super_types.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/splice.h>
> =C2=A0#include <linux/uio.h>
> @@ -174,7 +175,7 @@ static int nullfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	fc->ops		=3D &nullfs_fs_context_ops;
> =C2=A0	fc->sb_flags	|=3D SB_NOUSER;
> -	fc->s_iflags	|=3D SB_I_NOEXEC | SB_I_NODEV;
> +	fc_init_pseudo(fc);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
