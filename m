Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903942;
	b=F2t+fisufN5ESSSXaserttrWMxtSsMk7jTGI/NtJgpkoxDPWDCVXm6cPktmaFUpKSMuZ
	 Hg15+W6fUGHEEhhrhiBZcnlVkvLgYtWKv7Vyd8geELPVFkiL//gEg1tDSbtVdDZrUqF0E
	 17zx2x+rHaSI6v+cnbbVsof6mSXd84uLUku6sPZvfXUiIqy0rO0TdXRuKfGm2vKAR/tgk
	 wH52K5cnqrvo/xTkSoT/ES09M5l+tqZVCTPTRrNqAUfNT3KXThuUjvfKs/PNImd4aiEkM
	 71iEGAM/Bhx7GEGz+ZUZsanoExDgpnZZvemK7ukLHzoAYaByiwHFURYGLxItz1rf2UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
	b=c4rzAPRTDvZwBdl4f52f7IuDhFkEUzmMYzniqXmdxqldYsndw/krFr39WrYOGLhV/367
	 QPezeU0ev4xC4budXmUJGlWEjd0hxe019jnj/6JvdlbKOyrXQjuNo/4/xBVHQfe35NVNI
	 XdPzPLf1maefc7xuQWKX7Ab6bF975bzqi4TcQsQtsrmIa2A7yom1u8i0Blz+Ijom5CKe/
	 knvMhCn0bVJ5RgFJVgS4iQxbeTHshpnrMEpU2VPwWEoCcaP/jVyZ1zdinSEBG9fp8txSU
	 lptrl+pXj08Aa+gjXgFT1uGJqa9TV4cpPUs8ygia1jiYkuYbz/F6D5kZRxjsrPpQnaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aIDDMWql;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2F1606A890
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 08:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC2F1606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aIDDMWql
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b001cd92bso2841221f8f.2
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 00:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794903940; x=1795508740; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
        b=aIDDMWqlcsvWCl8wkffyd19iPiZve3bOwtkKaR5hDwI6c01iKD2ss/YeqBhIrgUfj4
         x+s9IJvJe+AubzVZiNh2cuVgwWxAl7SBHWJIqn5qeFYhMkisAV+nJvIuZ6Rqc/JC1GHE
         zTi8D2FHhQw4ioOPMzL9h6yGR1sWuWGvxwwkxBFCJYeMasTxm4G3dRQ1rm93cDL0gjAa
         JEdGtPTNQLczCCkZKw6NgKhOhL2mVb1KWaKQxS5nNW0qxl/TlPVgJ3VN7XeMKD7bwh/b
         A4kFG2aMOu7jG/Ub88E3Jfj4lvmkD0zV61g+xMae0XvErLXK45NwlBtABdMDGkzWWkTk
         vfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903940; x=1795508740;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
        b=b+oeb6imemzPA9v/8G4cmh2tPCLkrx63HNVqesAK28stF7mp3QG6NTyRmi4o1N1Yds
         puBJQDplgiXSyu+u28+exPjMJn/YvBKMbScJOyqhA5YXKRjmjS4xmCD46MAPgiAmSqnP
         KL7B7h6ZyS7vyibsRsOMD0ZL87/VPCOe1zFwlQzC1HSv2alQTr4ccfWe+6alFXB6eTKS
         Sxp2H+6BP5tyApwPoHTJ1cR+LpAIMWrmoKlr7kfKnthucuegmVxUdkl///f16WtUt4SA
         5TC/uvTENIG83zyvE3m+kbqy4jhCdsb60brbuxoVOlxsR+CC3x/EbgdFN6zJ4xzMp/65
         Vi/A==
X-Forwarded-Encrypted: i=1; AL+hErGCWfYcnt5AC11lfBLaYsGmAq9C2m7pK8wwZ+CzCXolWf/Ey89Ry4vLSR2ZE9Sw11lXFNm2yQZ/yfsb@lists.linux.dev
X-Gm-Message-State: APuU4Z8F7KobPyxpUMEJGuepe4SkhjKTb1LrDUY57CPdcSMIcOE/VVgc
	y8f6/gJVUli+v7Gbs5BZeMH0ScsgCU5rrECLTVs0A6SljjAzQ763/0qSxnJke2z2c+vF
X-Gm-Gg: AZFdTZe44JrFXjcZHYkmfM/daQjMnk/kxYKYOH/YtSMAGH8XqBiioeFcKX/fiN7ZFZ2
	wZnRAMueJqY0KMBrIatR8eqTOsFl4lL1jlVGgJp3DhouRQM/IKk6VPZcjxpG4IXt1h0bHTvDh3v
	DIxbtS4tZaS5co4NVPGaX3IoS5laMQZZzYQE7Qf3At3OrsGu5cUgzwvB98W+yrAs75rFLRgqdNs
	+5wTyMMz4pM3DPG1WaUvZAMNDzC6CKPlpx3QrIzglTx/glhFOeZMVkQbP2MYMuHkaVqvE/qUahQ
	crzxNOYZVhp5YFpJ2nk4Cu1AJ+hvk4Es+/lmvRMvdnUGJC1ULo3ErwXWpByRdrp4nMUwwLDMEln
	PiIGgxmcobT1WFC08n7h8XpiQGaQI/SpCiqBjInHSDhVa1G9oZfLL14x6SX6zwW9FepBf6Ton0b
	pUE6ZsTAJRtTDjkfgs+k7wrIMqxrLR8dw0B1ya/1DdDcFcSIM12SZziC4k9UzdzOIbE5TJlhDcT
	FkbTxVPvp7ohxqUKPfauogkd9OSKVqt4Cm5VGZIIopwqYAhHgWFfZTXh0aMqzhhtnVAiq34v0Ce
	QbvzoX9XXrgdoFG2Lo6l654wrWokT9w6JpB3CX8lKb/g21mwpAIXjve6lTTAGsCESuAcFwG0lnq
	91dHFuNEcWI5dY+CvUPBssbXPpIc2kU3XCe74EleU5X/Iuc2ICNsw7Rohhuk2koqi7dyzh4gUDW
	f9bA==
X-Received: by 2002:a05:6000:2084:b0:492:46e:d4ce with SMTP id ffacd0b85a97d-49c6fd932c8mr25238543f8f.13.1794903938925;
        Tue, 17 Nov 2026 00:25:38 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm26907832f8f.28.2026.11.17.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:25:38 -0800 (PST)
Message-ID: <a9124bf1c858cef3e8ac06b1b2396dcb0e19e2a5.camel@amutable.com>
Subject: Re: [PATCH RFC v3 02/44] nvmet: check that the file backend
 supports ->{read,write}_iter
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
Date: Tue, 17 Nov 2026 09:25:36 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-2-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-2-8cbbea1cf34f@kernel.org>
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
> The file backend calls ->read_iter() and ->write_iter() of the
> backing
> file directly but never checks that they exist. Everything that isn't
> a
> block device ends up in the file backend. So a namespace pointing to
> a
> file without them calls a NULL pointer on its first I/O. Only
> buffered_io=3D1 gets that far as the O_DIRECT open fails for such
> files.
>=20
> Refuse them when the namespace is enabled the same way zloop does
> since
> commit 0c10f8a1a7ae ("zloop: check that the zone backing file support
> ->{read,write}_iter").
>=20
> Fixes: d5eff33ee6f8 ("nvmet: add simple file backed ns support")
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/nvme/target/io-cmd-file.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/nvme/target/io-cmd-file.c
> b/drivers/nvme/target/io-cmd-file.c
> index 695963dd932ee..dfa8aa46188c8 100644
> --- a/drivers/nvme/target/io-cmd-file.c
> +++ b/drivers/nvme/target/io-cmd-file.c
> @@ -47,6 +47,11 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> +	if (!ns->file->f_op->read_iter || !ns->file->f_op-
> >write_iter) {
> +		ret =3D -EINVAL;
> +		goto err;
> +	}
> +
> =C2=A0	nvmet_file_ns_revalidate(ns);
> =C2=A0
> =C2=A0	/*
