Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563701;
	b=jp7kLZq2WY7ISiVlYvImYjTw1oRrEzte1ghCF8n7O0iRNDtmCKXQlKk9JQwSz1SDDRvq
	 rPeKb0TsdZmVdzD09W6l5ND1Y9g04WEFoy295xC4Mq1RIeFFfQbZ74rBiVYwLHJaq9qYC
	 +r4HTs3lqjOlvk34+MRl3a5iPjvseZLQD7cWpY3TlRGHYI2yqaBkBo4jr/3ZuG+4wGJR8
	 0PjJlL6NJ4NPT8P5Y+6prgHtOp3vG9tn5xvOUwpFsmGg+tn5b9Rs0FsDpFGzcKRjkpENu
	 uUHfdDtBX4yAFm5JNWsx0g9DTfPAhLomyHdjo5FH8uzpu1N50T0XEr9fW6H23rxCXrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
	b=FLzdHbWIYzL2XXQltjhsoO79h0IrPUTY590Wxt/535aGWInJKG3Ecrfq2gS7bBSt/OC9
	 MLEwa2VEGTGKC+8GYK1AjWWL7RRcBnplPY57/Y8ghvq/rfh5ht5zHMEZ+P3HNv/SpvBtj
	 orX3ME2N0KLc4SsEMWte6SWpk1eKb77zbS3CvWqTJj28yuWh4qg3dbm9X3rgubvFhOeaq
	 oX5oOEqe96nyloIRmMYIdA9rsSLrB5/BldL+LFZMH4mc2EFa92oIwHxj1qSsskvPo3Q4h
	 2t++vDtYK6qi7u7cWxPTsqnlYLlDPfFXs5twr/qFAF/oPB1ZQYuc7OyYcdET8N0ne6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Pp/iLDW+";
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414DE60A2604
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 09:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 414DE60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pp/iLDW+
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5083bc0e28so142296666b.0
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 01:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794563698; x=1795168498; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
        b=Pp/iLDW+KULLKBMDnLmVBWDK+QDaUtq+Niif6l1EqKwNsNYtPcwvnQTLzN0LEJUP6L
         PGJDotaWKmardus4LLZNBqKDLeC5C760DHoSHYCBjeu9GOQ9nu0DUeM1r3TgFlXbdPcy
         2b4QgvYrhndUcOdRAv48ft5UlYrCX20BkFPnU8mdn/J4gpAqRelBDEhKm+G47Wdc21Um
         dB60lx8fBejOlfSgstrd6pVmDWmsrtkJd4EP1M/XlEbkcm3/IPBAsBPnQ62VuwbnBfxQ
         oxHGU4ZPSKpSsjROdfa5xGV+prmKLZ0Q3cGRMHeCeMEfFndorbVIsFzp5VGEsLT7vky3
         ANiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563698; x=1795168498;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
        b=eSDzl4u0Cvxm3NccGf0TuuDlaOlrYsG6lvhEK21AOz/RMXio1MOqvzJWzmhHDbxId+
         2XQ9XoLbj5m3WjiQcNiyiOOX8kbzYFDu0+EFNO2dt+hjXosWwL6nz+gQ5hX1pjxH6MWp
         DgYNAu2GSUDuDF1JlTpvfbD9vOI6CMkVv1zxR9gvOV0zN/fDbO4FI2THUowdIT0Hjo3+
         D5Qinme9xRsOYsD1QOYRRNFZ1FEpJU8j/DRj6TObe6qgHE8U0NYqtrpec+jiovvpRvR5
         ffL6JTutaDYDS6k2CfNkeGVdnfTQpg6gojj88aJ6JsilHsoHX1a1dpp8iD/QLFpV3R3f
         dxng==
X-Forwarded-Encrypted: i=1; AL+hErG5rj8zKn6pMP8eHdw/1XTQQXZCW+D+ckV1kpXaOyyc82T+X8w0qzZc1L7EGL0YBjyjFVIbQHkmpV2Y@lists.linux.dev
X-Gm-Message-State: APuU4Z+kvf80BS0Vlp88+cJ6kGMZfh+Bz2YIROAQFB3SOB3GLtQHdtco
	UmPIXsCCvzHPJ0Jpb6kfqGkmOspEyU9OlHq3MI46p76RTQc8FVrWGap4wgw9+62YH9IJ
X-Gm-Gg: AYBFou2EbqM6KRcBY1KMQXhKCUTQzH4V25TsCgZwiT6wqSWTbTkIDzR0/Za8H6w6pZ7
	GaZc2rgOBWrX0GQ+pK4U/Ljnjf3ry5vb99WDWqnrpbfEfMCX1GnJ0QtYibUE4iTDTrqWoY/kGR5
	WjrqaQKu2V3mc7qV/3UJXKXGUwyQPZEncbG9C5j4lzD93jX1/KplPKE8wWV2deHzB992r3GNBSe
	mknUd4De3gK/TsLaDsXPlTVMZfhFU0t+YCwGXlvElY7ypV7wzIBJ3ni+VFTpwZimMDj1+1B1Fg2
	a1zGzI1ZbPtnCY6QTIgBcu40pLVf+CGPaiy4k0J/z4Y2XPNSJplJiBK9tKm6VABx3bZKTr0RS1/
	10dYJiYWhOpiqMPlh2SZO1iBx8nGyP69hkU3zWP0jt2D6GJyXB0zIiYc5nQI//8iBZ8UUn3L71g
	DuQx5t+8lVgxe9giFcGpWt00Rd8M32za530CTRWgrjDFC9l6j00JikiOBoghOn/LMe+wtUVQkdX
	xnfoSkRxXpqRFH2dvax8hzo+SYNfEPxddDcE4BVuKUMgWws9Un+uwOyi3E4V/CAri0ysPE72myr
	f+7K6t1lOQGrlemyyeGonRgKaDoHnnND/aeKEwmICVIIACVG6txAFD0I9jdRhbA=
X-Received: by 2002:a17:907:ea93:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c50963bdb9bmr198299566b.44.1794563698514;
        Fri, 13 Nov 2026 01:54:58 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50957c6c1fsm75151566b.0.2026.11.13.01.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:54:58 -0800 (PST)
Message-ID: <b42c9f4d29a9cbea66929c95cc8f736f12703c72.camel@amutable.com>
Subject: Re: [PATCH RFC 01/41] loop: refuse backing files that aren't open
 for reading
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
 linux-kselftest@vger.kernel.org, 	stable@vger.kernel.org
Date: Fri, 13 Nov 2026 10:54:56 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-1-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-1-4c998976c6c7@kernel.org>
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
> loop_configure() takes any file as long as it implements -
> >read_iter().
> Loop itself never checked whether the file was actually opened for
> reading. Buffered I/O went through vfs_iter_read() which refuses
> files
> without FMODE_READ. Direct I/O has called ->read_iter() of the
> backing
> file directly ever since loop grew support for it.
>=20
> Since commit f2fed441c69b ("loop: stop using vfs_iter_{read,write}
> for
> buffered I/O") buffered I/O calls ->read_iter() directly as well.
> That
> commit was about O_DIRECT handling and the FMODE_READ check went away
> as a side effect.
>=20
> So whoever can set up a loop device can read a file it was only
> allowed
> to open for writing. Open the file O_WRONLY, configure a loop device
> with it and read the contents through the loop device.
>=20
> Refuse backing files that aren't open for reading. Loop always reads
> from its backing file so a write-only backing file never made sense
> in
> the first place.
>=20
> Fixes: bc07c10a3603 ("block: loop: support DIO & AIO")
> Fixes: f2fed441c69b ("loop: stop using vfs_iter_{read,write} for
> buffered I/O")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/block/loop.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index a3325ceab484..c96e35c3ef42 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -528,6 +528,9 @@ static void loop_assign_backing_file(struct
> loop_device *lo, struct file *file)
> =C2=A0
> =C2=A0static int loop_check_backing_file(struct file *file)
> =C2=A0{
> +	if (!(file->f_mode & FMODE_READ))
> +		return -EBADF;
> +
> =C2=A0	if (!file->f_op->read_iter)
> =C2=A0		return -EINVAL;
> =C2=A0
