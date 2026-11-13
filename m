Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565074;
	b=qt95xcy4gohHRdSPuRhxahDlnncBWOcQ/iu4e9nJElcmE+XGVO9ZHZaDIp3gs0Nxm0iK
	 YKUjZjCtnG8bhwH19pZuUSNaG+qOQ8EDZ1cdE715qzb06YNIUI6wmGH6P5zSTy6Gt+RWn
	 wWLizsFoA7n6MAmZdA4ctaRhuLlZLysDZlRulNqukGszn7ZHjTn5dV0xc9ucf0DYG8a54
	 t1Mz970k+lQGxzUITHNdhwpG+sP3xqeIHB8A8bK0NIvV60CCwmEPUkXCECMoGyDVCNGdS
	 Tvfk0SIIy3GOS9TXqaNgdx5YDqWKb5TB59pddI5JpxRFIeP/4LX15fE2iB9NNRYxgQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=zqPqkCGOaO5RL/5NE1UeXRxAO7AqEHmUDDsiHSGxDsA=;
	b=AuQa0CVVIjF+QDG5rOmsKpCjTwzbzS21lwwRSthoQt0FafuZWFkKohPOZaoTzxQhwdUY
	 iK/SusUELPCZBtDZKeygw4Gvs4QY3du3nuty/v4s5Xt3sx2lv7yJ5DAl258YPtj+0//tK
	 DAFMLAusdEV70X/mUnVjwbw60gO4CQvQ7nYg2JDfRkwLkWqzEOZtKaOFGwKkUsfhi/CDr
	 zqzoZd9AEaaJriA6KaUFt4mIP+E8k3y+PFridd0RFAcUhKf/dS5Mrpjh6kYgbAqXcPBw9
	 EGgY34Vp9qjYKUBP388FkqjEQOcXLwcMuF7ZaxVCiwax2VGfbWFHaLRlgI8Vg2ZvVfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qMxZ3N7T;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724C8606A88E
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 724C8606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qMxZ3N7T
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso10701255e9.1
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794565072; x=1795169872; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zqPqkCGOaO5RL/5NE1UeXRxAO7AqEHmUDDsiHSGxDsA=;
        b=qMxZ3N7TISx7XpMNQRK1jnKLlhEpRTonGMRKIMPpHSGe/Juw2H3Cq4zhDtNAfATL4V
         w19mDU3JyzruRSwgm2fXw9kyP7148iS7PY1cAMcPpKKxK60KknSMnY3RDU5QNjIiiHpS
         S3mJb7gOnfWqCVox1oe+DUcxJ5kLan/9cKAH5aiNVFkZhLJCN6DpJ45uiXymbzqKGV02
         8NbXN3D+pizy9ARwTjDgH0I23olfUuG4UNSZghjRrsSECyHAnOzY1Frc50SMSUXy+7+A
         4qp3u38Ca9MfquRtxlFK6sunOEBbaq/EJAr4iLwy8WwOC2MbMrGIJ0WKrrIYWcY5JRxH
         PVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565072; x=1795169872;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqPqkCGOaO5RL/5NE1UeXRxAO7AqEHmUDDsiHSGxDsA=;
        b=mLAVO8HbQjHp3fUWxvKKUtAxsXLd0rrBLlN1ZnaXVe/2Fdg+U8S61Yut2Au8/f5A3y
         fvwdbzAgKIFiI9HuIanpFoWg8yIXnXjYmytUdsQm8dpjUZkoTZAu8QKYprFNgYd8wWZ9
         APUobrRkX7iYjFFNIaV+CgIvvj2yIoihwmK8FUGph7ScYD4317L1hGGu99APNP8E0Xp4
         EkTP1e+O2fyy/t660KwoHzmDIZpF889v66VcbSDvbOpJXAuNQIOYCtW2qvcbo6+pE/Fb
         Yq+zgfQgw9b35gjYXCoyUrjCyQZ8ZuoamvY4IEUBOeDLU5udErGXsNE+QHc/T9hn7scN
         C8OA==
X-Forwarded-Encrypted: i=1; AL+hErHb7tSUbWps7/zc9uHNoqLv09uJtF8nWp2OAWmK20/kALP3MSP4iYr4dwkMXKQn9fusob/RsMZvo5HY@lists.linux.dev
X-Gm-Message-State: APuU4Z9pxSg518//waaYiyMHYZ8XH+4cWCB8hG8urI6oYTz8iyeuX2y4
	8hlCUbX14bXxwHQrgejmbOoD3oatGT0Gp8XKu69LnEs6UDKDsMLorzaijzWzgVWgi/BH
X-Gm-Gg: AYBFou1VJTW3uMDgcu/RDcTrRGDhs8HAOaClMNe4/og/32WFVzn8L6sgdwxrMjoZAzj
	IiLtE1knFjq04YpLSV9hmu44yt0ABGJPsbK0yHs58uPgVHhVGVZfvoLKo969luQXxr49kwBl38d
	JqHzN1BU13Ceq0PNHZfKel7U3PZ0s2a7+wNOBvVkPAEgFE6L326YxOlkxVBnMJORzEIQSXO2kAu
	3ymX1Dg85xdSKKo/oIyAz3bHhz93Ewk83hmk9PZdb/r0XrNYh/O/L/R8ffLGRDde/hHjczJ7NYb
	u83LBNkf0WN3ZsXC/DjqfuCPWqB4XcmXXh0vimrbG1TQn8xQOPOeh2YyBK/ZgJaJvAM7Zkzqeco
	9IW+mqEN2HsJ1RoJ/4x0mFCrfPYK0rPEbvBPZhvyAlL0bAaqJr58etBy+B7jqHv++wcouuzIJC4
	/bZ+RctBN7BWSSzJv/qIN0lNhCvdv05+d12sGrThBrGi7ai1P23ZbGlizqNZLzHhv64TGbjfTuH
	qpYExYA065NjCHKFwXWkwzpX07yCETaeMYwCuQo+kHa9bYpZ/zuPxfD9ZBxBlslCu1kfrGYKcI7
	rnzDWNKQSwMuGUoDjpQ3b8MYqmjW7aZK1t4IKd6MAbXM6w1js7s0l/5H8TA21YM=
X-Received: by 2002:a05:600c:45d4:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4bb559f6f31mr43851425e9.2.1794565071804;
        Fri, 13 Nov 2026 02:17:51 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm3937770f8f.5.2026.11.13.02.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:17:51 -0800 (PST)
Message-ID: <7cde6f3091f9d90593e4a6441723b6b889cc4024.camel@amutable.com>
Subject: Re: [PATCH RFC 35/41] zloop: refuse zone files on pseudo filesystems
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
Date: Fri, 13 Nov 2026 11:17:48 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-35-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-35-4c998976c6c7@kernel.org>
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
> zloop opens its zone files by name below the base directory but a
> bind
> mount can put any file there, including a procfs or sysfs file.
> Refuse
> files on pseudo filesystems as zone files just like loop does.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/block/zloop.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/block/zloop.c b/drivers/block/zloop.c
> index 65634a39b0bf..dcc06dd47b04 100644
> --- a/drivers/block/zloop.c
> +++ b/drivers/block/zloop.c
> @@ -1137,6 +1137,11 @@ static int zloop_init_zone(struct zloop_device
> *zlo, struct zloop_options *opts,
> =C2=A0		goto out_fput;
> =C2=A0	}
> =C2=A0
> +	if (file_is_pseudo(zone->file)) {
> +		ret =3D -EINVAL;
> +		goto out_fput;
> +	}
> +
> =C2=A0	if (zlo->block_size) {
> =C2=A0		ret =3D zloop_get_block_size(zlo, zone);
> =C2=A0		if (ret)
