Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904111;
	b=nPNp/9difdd6ouHyMZxvwLVthy7up4n3Ty1x8Ni4mdALqzniOcBYZuCFHXAp6Fx86kJy
	 yhYQ2jJS9MR4sUH+Lg3E7gF2ZUOCpMcno8fHQaxy5EC3YofHmc8B90Vt+A3khiFR2aRYX
	 46Rq7qVroW1YjFi0uxyPgTEXrUAZObNp5oKQt+yt9drferBZ7tbI6CfXtPohgTA9X9Cgz
	 BNoFV+kdK8oNIw4hru6/iLCXeBrXczQtluw8bmWHwgsayTMXCIYHsS30CTfm/2eRH2wcG
	 +iLZjlW1ozkXMAZwSo14AMFOYfbtwN3ai93pu4mTkDAFhCyTkKjwIhI+omeOUmNnXsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
	b=CrPog3jL8uIewrQjlwBB/rpEG95/xikc4IbyWoI0gwgaLG70HV7ozR5oQWjQYQJVie6E
	 3qoh0KqYwZTnY2Yy9099bu/UjljU1NJiuj+4JWJwOgQuT76FQd/K8nzhuFQqmVwPUTb/a
	 XE8eOlKBGUbuTbWx4RMZZRFFNfN6eK9vLzRnoujC6V7i+MUN0KL0FzgJ8ASZPKxYlDp5L
	 nAlyPHuw+PjPz4KzebRAE3o/m+26fWuepNktlAGddcvLEv0batYwHoJ6nx1C6AuEhVCnR
	 gl42sXFNSRpX7tMOPni8Kz2sy9Cc6GZQl8QOJrl9AAYXIbPTAM/DsS77Sh3U+X5ypqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uXanWzS6;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E354760A260A
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 08:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E354760A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uXanWzS6
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso28247965e9.2
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 00:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904108; x=1795508908; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
        b=uXanWzS6KLBuYv3bFiuy7p2Z1+227mW1xrHWoFvaDbJ4eIR86cdI1UfJ1Vl6WUjJqL
         IJaho440FIf8b9IVU7Kam+OSXnIH1jz33WHTujYT1BQfo0B6SnXDwYqbWw0t0qlqzaok
         kNRlJO6ubpwmwkK9bKsbnA8CCcxZtujXfM4mSBx1ucI+Gj/wfMgQKSvTWN80MqHAe4Q4
         K0wutzKwO2Mf+59qNoIzXTOiwGbG/+A4azNJdDQMNWt+RQ7wzSKmF6jTS0qaKJWAuNDN
         YKdae80DaM2Rsb1thTTj773gVDHc6h/SXbfPEUrMNYox1t+BGiLn0VpO0U/ZIX8mo8As
         cNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904108; x=1795508908;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
        b=x0cuflhM+bkDFeIFwPgx7Rn+fhRn++qlm93P7k9fGoMs3Ua4GLjahxTburaxZZpTtt
         0bz+OSZcIBzzaAizYNApCYfHSc/4abVIJZJPhmIbzavflC5tfmL+O3heYIfLm6spAa+E
         aowM9fxTs+YjC5V4z8aV9MGbXB6ONpqUqA8bTkpnj5OfTlIyYva+5gdMdGmw052YTlLy
         jWTuw6x8+2TGO8u7JS43OYMFgmo1w4WySwDV4crLwFYyIcJTZAzY820rusMvcmGrBnt4
         tZ3ee/zeEW52CQDgn0/QKXhxVDcfRj725nRuAGX0AWbOycdeovcLRXkeOPvXuYC0W2v9
         X3kA==
X-Forwarded-Encrypted: i=1; AL+hErFa+8A7ZTsiOcWnCaVoL2g4sLc4ZLeZC/nZv/7OmMYyf/HHH31BpUVg0gyvVZwZ5ASBPwVETRnT9vht@lists.linux.dev
X-Gm-Message-State: APuU4Z9uzNQ11kcwcr2DRT3GHgOpUP99UAB4ZUReOk1oicU5uNN/w5Cy
	YjrXloBmtNAYhdZgBAktrTgJVvaKVIKkTIgOmv9UcjOxxszAnDjEzbHJHpsd8HZKkf/1
X-Gm-Gg: AYBFou1kTu3dhbtaqzOyc/9aYx1GsS0t5xT6o+PGuoW+uSD09TzkrvvNhHl0qcjbGAV
	iW/ei6eBtDJMOCeVN50WLpb5NzSqpUqw/B/MSYCFHbfepn2at4bSXn7g15KAIvgB2xt0YGiP/76
	TX6hOZ222n1q6a9TD6zO8UfTsJR8I75DJw+Ps8N/V0jyiUz49BBFDqQxOZM4x8z6ZSOUK8DJ1Mf
	YrfwYXokO9k+HU7PvOj6mDQ1B90lnQiwXF495HxisVKqMCskFngVD9iQ6D7NkjfwfReIokToHxq
	tTjhSShPpKixj//TzTszKqRXr30XwsHbMMpcAng/31rSgoYZraAPe4SM6QYTkkOWiRLOIFytQ7w
	udVXnBKqRv7DR7WLeH4U7sbPf8bjr3kLLPPkZmv3L5F1ZEsdye9Xj/SjK1PrnHCAJ7H+YQMPqko
	AuQRsdFkWjnBvWU5WhYCpY4Xequ/WKoIQZgdXgpz/5lXK8Z83WcFkdFBIbnt1N2d1H57aYWxByH
	QGkjnXuwiZaxTV5+3/EPIvZ7n14YgtvSb7ZS3ABX6trLOFSzIgH8b1QMMp1GNauo40n9PryMSR3
	uqjB84qy5gwLIAJviv9N1MtYn/OTqjMVC7MClV8XMBZ91lAq0OX5aUM6yrXhfuXrFn6b4ww+H24
	kA344Iq/0udG2HrcqsQvRMPFPcWcmYw9qSHNc0Ir4EoYn+zcYVs2DwzcY
X-Received: by 2002:a05:600c:6286:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb55a5d634mr255399085e9.5.1794904108278;
        Tue, 17 Nov 2026 00:28:28 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm75197335e9.10.2026.11.17.00.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:28:27 -0800 (PST)
Message-ID: <afc070a816e3ae5eb3c9e2d62d4f25c59ee61df2.camel@amutable.com>
Subject: Re: [PATCH RFC v3 26/44] xenfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:28:26 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-26-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-26-8cbbea1cf34f@kernel.org>
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
> Initialize xenfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. xenfs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. xenfs maps the xenstore
> page and guest memory through privcmd, both data.
>=20
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/xen/xenfs/super.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/xen/xenfs/super.c b/drivers/xen/xenfs/super.c
> index 37ea7c5c03469..aba7d038ed735 100644
> --- a/drivers/xen/xenfs/super.c
> +++ b/drivers/xen/xenfs/super.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0
> =C2=A0#include <xen/xen.h>
> @@ -80,6 +81,7 @@ static const struct fs_context_operations
> xenfs_context_ops =3D {
> =C2=A0
> =C2=A0static int xenfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &xenfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
