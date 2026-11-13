Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564824;
	b=SAkVe18IKOexa9gm66s/5pgXK8sUJJ3DM5JoRmH6dZp1YjQW2SvC0oQNnCzh5NV3cW/2
	 N7NqoNOWGBISfzFo+HUx3c/2fE9JuAJVSsW+3/CCk9To1xHrscgtJIUVpEBcSqlXE93fQ
	 CKFVOlwqLpaPQgJJDqYxuhNom8ISLMsLBsVjpknFP1ipsEtjwFNo4GIYJEtxE8IqvD3Ml
	 ARu7ac+3qdpg9HpNspE0HLgAf1IDWVxkFFukH97pJZtQf8blCjDcKBSUcPRDW2XMq9yMX
	 Htg1ixrslT4u8EqOdGUuBVJH/YWiJpNa/OHLWgbUl08NNktj8LMvgumlr4CU5APwPog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=ycFr7tcHP3BtNSevVHScuCcUOF/OuOrXOdu+rsUd7U8=;
	b=LvDWagB1CjXMYg+D55XYiW46/yYGvabIFiRxtLJeLmQCrzYPRdXNkg3emN5APIAhCZGC
	 FqvtDGGCEE/5bS4bH9wpvsYzUqpu8koDmqk8jIDr1DEbmey1GAV0ihEy3qZVeatQAMx7o
	 TKqslAFIb9PdKNPRDIR0rQJYeYAxqBImRXgQv5sMdZTn3aW9jmydCyc7/eEiQhF1izefO
	 gD1XgdltJ/p4UYaPDdFw1GZfeaPmuTxUBBzmkByzalvCKKIRrvoB79/6HBd9CCaZQ/1c6
	 3WlQCXiQy7Eg6/eygPefby7pJu/o8+JVVg92t45FnKYr9WBWJSFLVtVUkUWJd0E8u+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dITlcekz;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0489B60A2613
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0489B60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dITlcekz
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so1116384a12.0
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564822; x=1795169622; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ycFr7tcHP3BtNSevVHScuCcUOF/OuOrXOdu+rsUd7U8=;
        b=dITlcekzeKl3qmskAXnNLGUfDGpVhiFMiTE4D1OeFYCVMO4tCp+xhEDm+GRZW/FgVe
         fOoZ9pPCsVkkgGWDJDCR/44+Oo/sA8GkLA4P2sqtoO4EgEo/PB+Yxfqo92dLSZTasa+b
         fsidJyaKs8e+ynTZZdf0xSjssmHfKTvWZnZvXnA2fyV5HRtAjGgSmVHi3e0ZG60L92tq
         WG60vz8l471Ay4hwM0HLbO3CTd1QCo/ZJMlvoNriwauWu4F/9Aq13rDRmsfXU2Ni8sVM
         SDBGR7CVc7wRveRLk8WWn2n25Oek95cbs9U+R4i30EdOOpdYULXbQ2YEL4e+KRFpYNl9
         j+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564822; x=1795169622;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycFr7tcHP3BtNSevVHScuCcUOF/OuOrXOdu+rsUd7U8=;
        b=Ux9NY8w4Vrwlnh6fb8vZXV4D/Wp7EeydkW2WlltjvgLvWmSFLsDYJxa9wd/wgYKhOw
         jpUwdOZrozmWeWkp8mSiUYGIpTsqnviWEZOnP9OmO/CnOhKxvfhPW/AZjyIZ0mTjTVTy
         /qEQF4SrDZEbL0a2X3x7OUKPK4Z95bZTeYAnrVk1cMABZfumDqwTZ9HjU4FD8IP9piFT
         P3WC8K5WsLGkVOGRaZRJIoy5vpZA8MkI+ffjyCYXOmsHDp8LOqu1i+3q22mR0WodaJpn
         ePBqA5vvW3tXrPkaJQGeYWj/ChrNT5hEizHArk3cMiGyjvsB+VERm0NDny0OTxVqrnOM
         73eA==
X-Forwarded-Encrypted: i=1; AL+hErGvrSdfBlk6WS14tSHzGvVXte+QSjww7qlU2HWePMqFhrtpa4j/qQ9YTnLx/Qv7/X5Y+L04rh6/VZPY@lists.linux.dev
X-Gm-Message-State: APuU4Z/1mIRHeQ2tSIPE6vcG0bu2Qgkt3jwvw9KvmsZ0b69W1d0AVgBm
	800Jq0E9RCg7JRjVLhwCT8iZmLnVHWZ1/CyZPR5QJb7rIcVOki79VGJmCzfJW/X27KoD
X-Gm-Gg: AYBFou3aHH3jHtKKxtJHom3yJy0eIBJrQJt1YMe1tWE7ZY0bwWnfbhcmYOZ3EL27wam
	cGP/RkxjocUBfRHyK2prXGnLBptw2Gpl/5FRSRjVGzv5yMGPdSdtqvbzvbAzYxtS8zws+cz/BVS
	a6CD/jVlB7IE2dB1cRiWlI0R+2dJg2/hkxXSPqfPJfd9F9AZ9itcMgIzMrqGdifKbcE2QYFzvhH
	TWh/mYKE7Hh7LFLdeLoJeNvaWDd5gWY7ziVNrmfSvPOQ5FbopyCp4Nicnu9SWZhQQt4uCNGLGJS
	a/0uj4gxeMBN2WyG2b8UDGAITkcr2o4NB3MpNDB6ZBFfCrnZCiyHsOLalwfe8dKsTpOZtqXyLyH
	Rgaau7ATdVeh6WF3Yj0HecEhITgGcbBXIlHFHU/ZK8tufbIsfjMEGpd9xJfk0QvAyD39yNmn/iE
	Tk6foVGlKTJwOvTmDToy86StKeVXV+NuedoZNJcWhW/T1RdASyRVdyBg0zFmhbRNPSe/HJI4n1D
	hC9omhkiZRlh6hVzFNcqK7JATAvR5R800jF3mN0Kt4N7IGx/J6abfSy5v+gphMVeQAUJ1QTXOlY
	ejKqiACqCKUBqPtXVLboLXzv+MjBAMCe4DYUegu33uqcsSW0hHqgVOZSxJpgeBYpDZVD2KfHRnB
	ZfFHOiRT9
X-Received: by 2002:a05:6402:208c:20b0:6b5:69f4:e7ce with SMTP id 4fb4d7f45d1cf-6b7c0c62bacmr1415990a12.39.1794564822367;
        Fri, 13 Nov 2026 02:13:42 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm4332158f8f.35.2026.11.13.02.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:42 -0800 (PST)
Message-ID: <3546dd28b1d63c1478d391a2015fff4c1b976639.camel@amutable.com>
Subject: Re: [PATCH RFC 24/41] efivarfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:13:40 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-24-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-24-4c998976c6c7@kernel.org>
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
> Initialize efivarfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. efivarfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/efivarfs/super.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
> index 12746ced6dc6..e598d42c5f42 100644
> --- a/fs/efivarfs/super.c
> +++ b/fs/efivarfs/super.c
> @@ -8,6 +8,7 @@
> =C2=A0#include <linux/efi.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/pagemap.h>
> @@ -554,6 +555,7 @@ static int efivarfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	}
> =C2=A0
> =C2=A0	fc->s_fs_info =3D sfi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &efivarfs_context_ops;
> =C2=A0
> =C2=A0	return 0;
