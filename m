Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564785;
	b=wtJ40cSdJcea/o/eEJBflnpakfhZPeUWay1LkZjFwjVZSxiO7+eQnPwDihCnaCEzbL+x
	 twUcmNIumEDG6LuC1WENYBzXU0THyujHU1B9uPRmGwfpdCtyprUNISiPGTU/ESZq8rrQ3
	 htc1VRKCNNdARC/7Z+nWHVpHCIriIKqKuULzuaDuvC0RHkfbrKsM2Zp0cniVKVvEnUqp5
	 BCcqUa7VvjdLW6Td0RTzx+B+eEf/9XO0NacQgyL0ikBNMOqsl/h4kC5qStM8AwYqVAqNZ
	 57cxhdzmEqlCws6b7HKOprQX6zaqEqfwT6sOSEiRcwyTesIiKr3DWLfoVxwyySdDVRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=PGZ86VpI4/X6bkLIqgY54HnsW6MSps296zHbeFwxlLU=;
	b=rXWZsC7TL5cNBTYzIWfNZYFYfxcXBr6/mWCZJthqHdVmPo05mLTgKhKK6hL0JszcqG6e
	 Af7fg+anzM1NjJ/aHysClXqNm0RZMNfo0AiMtonAT0+8ULAuzmL4jaagUp/lkcdL2hEtY
	 bMyrf+os+xi5Dz4gDMIMiDH/LuD58wQwZB0c/Q6c2V45So0paOXSUSH6n0tZd3Jk9TNio
	 sJ08t3elZBiBJb5nOCUaqYeNU3/0L5pXSmOBN+8DYrAi94UTDagmD80OnfiQw5NHhii/C
	 F06dMS0glqYsWWbv2pHoxMhaPB6AI+ESAX9YPRQOSlC9UWGsuQoWt0iUCEQkdIPItAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e1myWE6m;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9873F606A88E
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9873F606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e1myWE6m
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so8045475e9.0
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564783; x=1795169583; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PGZ86VpI4/X6bkLIqgY54HnsW6MSps296zHbeFwxlLU=;
        b=e1myWE6m24IWw7yO55WYjJEyiNRIFIH9VtBgLn2wa1MeQOGfiulE/mdBZc22DqUEpj
         LBtiiW6O2Ag0NjZTpRJ40TtRMZU8fCff+u90toSJhGqOAoRyDZWFIoS5We1jrN4WgXNO
         JuRjtUCHP1AOX0G7NXkhoxlO02/HgbXQfM0mp2A6TlFXtekUlZKcwwW6BgwJuTMhjgyF
         C9V6dt0ln8hW4H3BWEtb5Ysens3PIyjbvmvUfZEuE6KFb/JvRKTUmZuX9ss31juLIE9P
         Q5BPM9aE7X46wCjJILMdvD8WVwaHKCgBFWUKkxd893AUBxFjUmMLNvefvu/OXp2qFDMU
         mYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564783; x=1795169583;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGZ86VpI4/X6bkLIqgY54HnsW6MSps296zHbeFwxlLU=;
        b=agCtef/MsTAjrcQ1n0QR5jUgLCxhqrsR4LVHXKFiwUso7NMdZD+UfGDymGFpy2NEfY
         cyEwokVbVnYsR/YhOZz88l7uLZPlb82Z63FTjMspyKi+hHKHwGxnvJicaBYMp9vc8KPj
         LYY9hC5D8d/oBuxvQ/fbghK5zsEgX4faELp7G8Og0MiJGz40cqBcj4TOuDnaEn2UgpfG
         KnFXp4rqs8737AUF5kwcWpR3T5fnzsf71L1ckqqkylOlHCiMKxCTTHQhsI5mjtRAqWyA
         qdr1MWrxcQyqNb/OzB/68uC9FFp0Jl/8PsSJAuiA3Kqur+Fa9GHSP7ZyIms3CTqD+smz
         TP0w==
X-Forwarded-Encrypted: i=1; AL+hErF7jXngoUJ4arevrBrFMyM9R2Hy7Unde8nSzBxSc9jqtICKXHg0bNTSfD2qj9YDU3918L7UhlPe4I5b@lists.linux.dev
X-Gm-Message-State: APuU4Z9zSdyffV8SvTBZ9nSqa7dbpA/Xb1b8eSaHf/w/1aJA8pjBv9y8
	XvAPR8DfrbLZ1h0GMmDS/b1pgX6VPzTuY0FLsIH54BzfRObPJHuOjGxQdt1VmGDRIQ9v
X-Gm-Gg: AYBFou1dpgY9bYHc2CZ8BZ3aXOaTBHSLkoFrsm+VGiwtB4c5WOhoH67mL50bFrqzvbI
	Ubd+1r6t+xPQxW9JE3VW6/a2ESYdlXbfJ9dlkFKfB6Yo52iH0or3u50FRVrNZ1icKmVKXPI8t1s
	URCkuBj1NVn/RqzL0KzQUK6bgx/FUDQ3tAP+GoY9LWuGkUFgGlelTQT7265sdBk8/zjjAWgidup
	yoNiAetLcLxfKxBhZV10P6qcMNxQSiaCgOPAnC8aell1ANplSjjVWF77iyP9I0uJUHZ51CQv7XL
	seSuA14u2w+MMZhUPDsPYPDqPEIFKUPIuL27q7HE5w7s5pHTbVyq5t4+TYKzo1ZhYYIcNCb/4jm
	LfRPrTv0F4YNWnehJvATyuyof/S0LR5xDtvplGPBHaSrWpvKoT+63XEp9emHeXibveJgLAl4/y1
	2Q49ARvq/PW3QHe1FGZfol6c6sRq9m0F1u9bGubCpeGgl+Xw4WkDgQnTKDugUg67/Le6aIA2k4K
	9UpiVjCqLUaQEGjeR8zD+S8pFbfXxfdpe95NjQBPp90bEG/Rmlhqslq13ZIiMH8xBUI80XokKMI
	XCdB+XFaSqF6aRjGUPb2rmzaCzdZnjS7JkmgqdLwcPfaVVmBMgI+XUwecfVDuFbY
X-Received: by 2002:a05:600c:4f90:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb55a47602mr36814615e9.10.1794564782834;
        Fri, 13 Nov 2026 02:13:02 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5d2872edsm4056955e9.12.2026.11.13.02.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:02 -0800 (PST)
Message-ID: <94dfa5ec75f4479663dd79f3ce05c1dc6c080185.camel@amutable.com>
Subject: Re: [PATCH RFC 22/41] sunrpc: use fc_init_pseudo() for rpc_pipefs
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
Date: Fri, 13 Nov 2026 11:13:00 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-22-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-22-4c998976c6c7@kernel.org>
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
> Initialize rpc_pipefs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. rpc_pipefs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0net/sunrpc/rpc_pipe.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/net/sunrpc/rpc_pipe.c b/net/sunrpc/rpc_pipe.c
> index 9d349cfbc483..37277a6d2415 100644
> --- a/net/sunrpc/rpc_pipe.c
> +++ b/net/sunrpc/rpc_pipe.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/fsnotify.h>
> =C2=A0#include <linux/kernel.h>
> @@ -1181,6 +1182,7 @@ static int rpc_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(fc->net_ns->user_ns);
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &rpc_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
