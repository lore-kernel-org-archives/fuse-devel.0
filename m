Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564337;
	b=XXWwRmmd1d6sZvbRRUxE5BVlkY+OJlFhIU9OtQz2e5gI0wUPpo8ZULe/83MWb8027wyZ
	 4R0aCZrwpM8DSsIz1XTQfFyqPKo9aYigmBOcKrGJ8XGMmizgqqNNde0wWgIRHSWE7O2+B
	 0NgltskE/scCIcYLRSADWqZr3Qs6YdsZS9xDneSxd27+wtRHSUGhCvc8Di6kjkJn1fLp+
	 AuA94fXE+GeZxXEf5KVc0JZc4OgGdTWLxajGKzJ0zawSd8id80HCunTyTZmHhNtyKBZKz
	 IiKP5pkVO8zrrPr27Y2zAP3A9u5w5wXWdlFoOtLW4sOqMNXIq/RQsuWkjLcw78ISoQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
	b=SJKz0/KSTH2erj5p2B4yvzbssQadtiFmV9wNS/Xhg+xb/v24mPikaYjxcjOczCZnXyZu
	 t2xdo7WxZcuHezpayZuPRmS+3hsw4IwTUiFAVBasX+woNXhKkXNdfKltZ86HV/x9y7HJn
	 D/hFmFxnLXvh/JgtdgdxeXZyb45deMY8DZeHkTt8mMlti3BgHuh9krlElcCN+OxwSNm6H
	 Vt8fxSwVmSuigP2G8odXRbs3iaUPEXDURwhJeDGkMhc9w2J2J6hYl0JKgDXbnc93bbaVu
	 cCDP4xkPWlOztho/IxWrh1/37/4Y9mEVwhZy8n39f9lJtO+4UPyQzbSdIt/WDt2zGYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Jn/dkLNl";
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15E7606A8B4
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C15E7606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Jn/dkLNl
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c247f6687dcso182007966b.2
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564335; x=1795169135; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
        b=Jn/dkLNl0ovyerSt4MCl59DKCIiOZG2u5ryQ7WeMIfqMh1uM9gm96UnKRB/88czBv6
         TbeCRSp2bJT5bCdy62R0ppvlrW5RVM2zA+RY68PTTrCdUO85tcEVk8BpaE35qNTTD7+H
         dzsKzFcaGqf17Tdljh2ByjACa/M62fPd2OWZCQ+P4XSUI1AH78MLGdmg+BSRUygRaojZ
         llWgqX1/ON+ZqaZSus2UwB6par6plJib4y+H5jfABsm6L/FuIghBXx5cxMUk8uJS6dyt
         iPxcIaQD8iLziRYGqd9VzzCVjociVN+VG4Zt6XP7UnNt/Xq+cpqZB71++3e6LLADqHr2
         iNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564335; x=1795169135;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
        b=syJfRWNDX6srOr5KumJFVKfyCDZdFk74ri/ELjDqOrqFmWKwNI6pFe7xPrfwWBpTV9
         6wDSO/Qq8RmHK4q3Rf9W0uD9KphqR2xnWGqcM0gx3NaTbSb78NV66DNloYxoG7IMJz0I
         oyldghx7nauF/kYCaZpXS9Be6pfuJy5wKbKtL+yNqxnM9Nyt6/6VjOk3tuAjKLlj7EsL
         vg/ULuEwVBBu7HFPLy4hbuZOfzna/x7ZUSuu7dR0+6Ips2nVYwREENgHmsPnXuRUzU/d
         4/EDRIJ7YHXS5vSJQ1edcNMDKhkKFhDIfMkDWO6os3SvlJITvJl41MkYPnd5pM/TvSUE
         BhMA==
X-Forwarded-Encrypted: i=1; AL+hErHiBkHhbmerN594VLbxq6jWWf2tpqro4M3w3NLOwqK4Rbs3NTUOwJmMMYuN0Kcf1O1HJ/l28CMk5sCE@lists.linux.dev
X-Gm-Message-State: APuU4Z9t7yxws/ktlkn6kFVFI82mJ3NRK8I4YZbnFiZ7Ha0f7AUBNIrL
	6oT0DYtZBikdBumucHeZlOApgHAtQJX8UBVwPHXfV/25kn7o6XrXfA5dtjFNaO2xxYr4f7u3H/b
	tqSgZS0ADHP8=
X-Gm-Gg: AYBFou037Fl8PAZPBaQcoDKBXV/S9+Tbvu3RsoTLygO7u//UG0wu5EGDWE4Wv/1dFkA
	kBIzbaO8w/XEKe3DE76x4e/9KhZNl1/IKhFLmoMU7vAzysimKU3fCnCeDoOA75Nfm4ZH05Alw48
	LRR3sZUG5SRGdRA/Vn3JMZRWiI3XIpg0vCup1p4s0A26FXTYqHZiBoBhlGKBXipRqM4LUA6futm
	B1SgTLJmxXMTYi6iBrE84ocPS6X3Zf5muv2DsNHKH1Lw/e2LNCp9DXoSjFuVqgqOrrjFCUXG0N+
	EAu5ENgU9q1tyb5png3xSpX874Jq9fURmdsuQ3FGfDJljwdnO6ebrp7pYq9AiyaZxrgwWKj0+p0
	7jD6F6IIpLmbBselTH2pzez7rsd/WvnfKHYTbxZUod4xSfoQ8ShaIzt6jePiKpESE+bmynvCHdJ
	M0Fpg9L2ddhdV4WcE5qnOPvGQTuKVZiF8WN3QpRk0ghRThQ3RdsGC5PyVJO7j38TeXSkVK3OsEA
	Pd8f1uu6y8/aabFV1sygmGfJd6hAdImRGr+KOOzE8dDF1nhgvJi8yEDPOZ7ceGPaOWMJgp0x4VM
	SlNVYd0W4oop6f42suRp7iNsVuM6pCrExkN+UxPgSJ3D+h5/jUt7aN+Wp9sGcl8=
X-Received: by 2002:a17:907:608f:b0:c43:eae5:ee80 with SMTP id a640c23a62f3a-c5096398b03mr148720566b.17.1794564321873;
        Fri, 13 Nov 2026 02:05:21 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7b2c9sm75811766b.73.2026.11.13.02.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:05:21 -0800 (PST)
Message-ID: <08fa1be263cf4a3db6b3e5ec2847107fba7acfba.camel@amutable.com>
Subject: Re: [PATCH RFC 13/41] devpts: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:19 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-13-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-13-4c998976c6c7@kernel.org>
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
> Initialize devpts as a pseudo filesystem. This raises SB_I_PSEUDO and
> SB_I_NOEXEC. devpts never holds executables. devpts_fill_super()
> keeps
> clearing SB_I_NODEV for the pty device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/devpts/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/devpts/inode.c b/fs/devpts/inode.c
> index bd1e8eb26edb..47ef12241d92 100644
> --- a/fs/devpts/inode.c
> +++ b/fs/devpts/inode.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/namei.h>
> @@ -438,6 +439,7 @@ static int devpts_init_fs_context(struct
> fs_context *fc)
> =C2=A0		fsi->mount_opts.reserve =3D true;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &devpts_context_ops;
> =C2=A0	return 0;
> =C2=A0}
