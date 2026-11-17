Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904095;
	b=kfJei4ehx6XNnjKbaXjv5VTfqNFyLh+fin/7H+bwzQW9uMS4Gl+MtiRkMnIzcpK8G3+w
	 eVLR9C2tj9C/OQcf/ARDsqBaxAcLU6reLi7CcMGQKgbiUKQZnF8bzW3AsiDNuzMfx3eV6
	 MIzYIHYy5GX0jiQh/ALKp08o1u01ztBw9IGok61pm6k51XxqjUC0oNBQ4x3mvF0uXDgkd
	 PzLCNqJDxYEsGJTyJysgIysSZ583gHEgSxy8S17jCovnxcpN7sOyH52dM33exahzi3SZO
	 gC1Ge7Am5mws7TbWifPBeveqlkfJACORgR/qKDVMJqlrsjSh1/yD1BMWVfZMY+ImfRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
	b=gZ6+N57kBej0y7EC3StLH/mm/d4PfhSR1HFozDGuI+lxsSSB/4k2UqXpzIGI9TMgAmFM
	 EWxgIJpHRnQAtHw/X+9cnTfJMmTmU4cxvf7mbNnVTYgd2JAmLFZ4vAnVU7Rvzfdpy4+TG
	 EegBxesf5xLUPxGTzrCSt3ioM16Zt1Fqoq4hWj9MULesFaquogwfbMla/49Tm8jfRnYFC
	 OgFawTGM0YfUQGcznauaaiEOJSY99lJQeKU7qS1FOBqIbn93kioBjsyp1GFV6y9MJsuGX
	 PkyLoI07toahU4Rzs4RBnOdSdq92dsi8YOZUYR3NSJFVj+LNEqWIu0nOmCRTHg17RSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DyCDe7SN;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC4C606A8A2
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 08:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CC4C606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DyCDe7SN
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso31738375e9.3
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 00:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904086; x=1795508886; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
        b=DyCDe7SNSyTjN7ARNq2r6DBLnJR3AnbwAMjqkw6oWWqi0VP+lt4bzcc+Biv2jt4pmK
         9FnByKXHpsWexx2uVZCNJSfWJppGJHWm+hjzckrUlZOVGMIKxJJ9gDZ1h2egBiGpIwWA
         ZKz/XD6orkSwQ1yi/OCHpiB8FIxs/Gq/lyWgk98W0rCPZa0b/WWNbRVUo0c7Zgr9FfuC
         pOJAT5nV2PusxKIwhzPn4VieWnlUK6zwsUKaRmUeGLqpe46CRxf3QCTkT7OxbuxDx47n
         kkqI6H0P7jtozyWX8pM5NeZFbJfKgZGvKaGc79eKEDTLu3HLvv3jOrIzbzAOQZxNHQb3
         +70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904086; x=1795508886;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
        b=a9gEX1Hd/6oY3rGpGcoEjnCJAz1LVK7NfaeVchwSQbNnze4A0dFL0crBdrd2oaDWrH
         1zaCLHAOFto5TttkcACuK3Up8gy2BsPnhiNUVDLjeUMbL6qzicpkzZcAoM4fYcAwkpfT
         Tb4UUELw774AxdjMOj2pg4w9BdIvAZ3tX7t0PTeGBV39BC3C1ybHF0r8+73h/GTh3Al8
         fzpSekDCKcngjEviRep5h+Dl5dqUO9F+iElt+Mlx4XLAjCqvzZOd9bnn332W93vCfHnk
         4LTfEpv3ly5CMagnclfz+zeumJTXUdIgWI7/r5xUyA3Pcv9vP8zAwI6A07KxfkLDIjyY
         n0VA==
X-Forwarded-Encrypted: i=1; AL+hErEdF66vbIwmQOY4pW0ytgoTOlkkGccr/xO5xlL02CYDM2kHHxlx/tTpZJqZ/ZrCk9wm+YSwA1xZlpYg@lists.linux.dev
X-Gm-Message-State: APuU4Z9HcOAKQC5XesWFl3EtcWE0tQjS71dTwfvLwY/4r2gT9Dm44hIL
	ymRI/Tp3v2pjpk80rUJqY+UKODI+P0GlH8li9bHJ2dzkq6xd+b05I5sc587BL9vEhPvW
X-Gm-Gg: AYBFou2Udp5udVrSG/7QpTkMxxtLBWdPeTf47XPpG4s0UzkLudPaAgKZyIt2KgYcW8k
	mSwDumHbqBnH3oz2LdfdbwldmxJ+iTCVue9XCHl9ZQZknl4bGIvLYaV8Ql8WKvCj263LHuY2fMO
	lrMVjHnNYDJoLg5aUfRkiWW/rcmIFELS8AikIUcGt8lEJAHgn8qXrDhTv74sRUQuwT2PCLKcSWN
	jqKScO7rWituSj5KXlJUj2SVKZsN2ts2DI5RKfmOss7L+JnMW9Fsi0dVPTzjkVooTf1Je2yrpNx
	evED6WMvPLwVWYBBlSitpSCSoBuI2zqFJRRU/dkRptxyc7KqL7Q9X0KXz5xTj0OQLmlk1JQbfnR
	F7hC1UOLkaa8yOJMGJbaNLMFkLTjbAdenUO3ptz3+2VMXyqYuBkhR6tfWZkOgzZ0FZJSdaJjy/0
	YDtKzgf6YrHki+6dJb8LXoApXMTtHhW2SioCAlv4JllxtnjX1gbhhTlCVqPD0re7JstLX0DOxxT
	QiEBo9M/6uCbYbZQvpctvVAM/g3MyybRm0JDZzeizTQAUNluNAYRZ9YmVGZZiIGl6Xhhqarh498
	riml6/J773yrluJO/24qV7MxJdhtxR22yHhDGyornXjqyl93OX0AvfiYSTT5yNlYHDb6dI/CgMm
	hb4y6OMRaxglHHko4GrfagQgu8niC9bLB5mCm/svOW6ah4Nfs8nUXm97P
X-Received: by 2002:a05:600c:512:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb55a5aa47mr209766355e9.19.1794904086313;
        Tue, 17 Nov 2026 00:28:06 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm74782845e9.8.2026.11.17.00.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:28:05 -0800 (PST)
Message-ID: <fa0ce0f7ecdbe91cc6773bcbe86be137d2129944.camel@amutable.com>
Subject: Re: [PATCH RFC v3 21/44] nfsd: use fc_init_pseudo()
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
 linux-kselftest@vger.kernel.org, Chuck Lever	 <cel@kernel.org>, Chris Down
 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:28:04 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-21-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-21-8cbbea1cf34f@kernel.org>
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
> Initialize the nfsd filesystem as a pseudo filesystem. This raises
> SB_I_PSEUDO and also SB_I_NOEXEC and SB_I_NODEV. It never holds
> executables or device nodes.
>=20
> Acked-by: Chuck Lever <cel@kernel.org>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/nfsd/nfsctl.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
> index f32311f2d7cf9..ce2666deddbd9 100644
> --- a/fs/nfsd/nfsctl.c
> +++ b/fs/nfsd/nfsctl.c
> @@ -9,6 +9,7 @@
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/ctype.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0
> =C2=A0#include <linux/sunrpc/cache.h>
> =C2=A0#include <linux/sunrpc/svcsock.h>
> @@ -1375,6 +1376,7 @@ static int nfsd_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(fc->net_ns->user_ns);
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &nfsd_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
