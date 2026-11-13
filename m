Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564728;
	b=fojCpKqUwVaffms8g0UxOofrjtYsh8Q9nJLyBZZko/jmw7hfA8Roub6RKFtuFD88xWmj
	 0JLREOrNj/UuQqy+J5kd6Q83o7OwHbOirnBAmmdKXAMFM0t6DsMCb4bq+SD2szvtJTK/L
	 aalEoEb+AOXLeff4QuN0tbmunXadenTC9y5v8DvwUJo+WlQd7uWp0+2An+YPXmlWLf75a
	 B9HuWlJLRuV/yNUpBP7TD8q5w59NBkcaUCTiOD/5Uu7JW3uuQCirwSzMIvZaM3rhUbNlD
	 zGEilRUeaoFjHDWm/0KreI2zAk1vp4gNV0WIhVUGWkJhxaBpnkDD6HCCP/WryNMY0JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=C9TZKYRayQVC7UyXoancZRI4bPIYIHY06/n7s/4tB9k=;
	b=nE+o4sDwK0Z3q+Ma2sFyhrihqHmVoQyCfBBztyX77LGGCVYOTGdCas05wwtbuqpJNVG1
	 3x+vz1BZbZ58JjJhfrXvA6MNwRNybgdKvTB6xgBxc8+iWKyW84t6k/7BSw0llL2hCep5Z
	 eA7UhXE5tDm0iA58Jp39WQQmFXJQjsvhZLzRAUVfwFm7RkGUJ8OhrEiydfgwmeL0SdJHO
	 ACQXxNWSR/Z1rxipgHGfdqIxO9M4+q/RZMQfejTtRnmJ9Q8l7cgpcy7Wmb5pbmozcoH7y
	 czZuaUFThk/+CUg0nAJTdhhgCqHizZP+WQ0FdlLAyuCI/M+HVUHJkUTebphmtAH1zXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GuHcZF3W;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01FF606A33F
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C01FF606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GuHcZF3W
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so8032595e9.0
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564726; x=1795169526; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C9TZKYRayQVC7UyXoancZRI4bPIYIHY06/n7s/4tB9k=;
        b=GuHcZF3WORQRAgl1wCIyYPjHEqJzEGqhdMDJqRWcH729UKaWDHPpLvdqOoFkOCdSO+
         Lf6ZuxfCjMgvrTLtn8B37dazIcs7g/DZ935m8uj4NKqLuB8Lhl7kpxFr7lWMZ2qnWa+W
         gO6l1Y4DxQEe5pLUBrRUkzHcc/L4LYnEiSsC+wPSW1i3qMnSYRND5ELJSBT3716oE6yt
         aZQTbF550d7rR3ktdrXrHvBjVRLcFMqF83UrKK93kYG/kXhuOPk+F2RukH+AXiyPcPHz
         0vUSodZrzLEtelSLK/Cs+R20Ora+Oy+f0k1xQ18u97PKVmxgljaWz+GafSz/sbi83utd
         IGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564726; x=1795169526;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9TZKYRayQVC7UyXoancZRI4bPIYIHY06/n7s/4tB9k=;
        b=rJlNNUUmK28zZhYH42klRw201qNzjzGY/gNw2PpPtBXrN6fNF3Y/1ztcnDqg6MoL3C
         A8cUqYg5DlZ5wcoHm7nFyKLJafr0s0DjosNg49tSED7aDnypUuaLl/3ZtsuRxxqgzsK9
         5T+qGze89QahDGKB+sZB4QqhkViL3fJfZ8B8coeY+xj21vGHGk9I8nBZCVwiGLkn2dAa
         vl9PQ7AO1A2DwOKGJAC16l65buz61Waso+qC7Kdn3Wl/UwKHIpo+bAGj6hkUCYpT+lfT
         r2ka66j6WcgLHcbAHEZ8Q4eDf+tD9deEp0VsJ+hK4zPlP1yH7Qz1/YknGSlRA+qI3xAZ
         bICA==
X-Forwarded-Encrypted: i=1; AL+hErECeHJJV2f9odcDUgPhDtxoxQm96SyTNVVbm8QQTpFtSAW4XN/kwpNDP3TcmaWPO0WOPjRr4dJTPiYw@lists.linux.dev
X-Gm-Message-State: APuU4Z8yMzGYwzttG+3Ugv2QSpDKXoPzJeg2ilwYDinA6Md4m8B/7b/7
	axPVpM+3KMoK7H+V8PateF/si6jhbymmcDPty7krktaI9CQaOdX5oLjhetnBnCo5HDGE
X-Gm-Gg: AYBFou0Z59lYb8Ixc8/yK8lUyo6g8IgdTRhBSckdhpFLvI74WbRmUvXFud6tFwkRbCo
	PkfmXhHWCayeuN0jBrdJCjxrqxI4zSoNGPFmDumj2Glh0Bw4nWFRaGDcND83VTQN4CQldGbKkAy
	oh37hgYq0jijPmejSi5T/QKe5xXxWpg7w2ZQQGqc+YJpzUsN7hRkS3G5xot5iQrAHROPiWRVMwi
	0khhZTO48erHL+ONHkXsf9PXiA6FswR39VFEcQ9Jlczm/11LNREBp4LpIvIWdz8/ePsusNgoPMn
	u5YvB40uHyYMOomSYMTjEY/nX3qkgJyn77fHoXD2IbCg+a9+idzsxewF9R+DqKazaHXaPQ89OMM
	JCIA5ANld05bN8J0YIola3itPJ0X590vfl5wIPqJoemg1aC41BiuOkRmbKv/0xmlEokQ6ErZVdC
	FKRmB9Qfst5UDk8dr8Jaya/cwAsaG8fbNaOKnjr7bHDcCjIL+rWCjN7ppHLytLA5IiLo0ofEK65
	lrzRQEulW1izBF/nRQbCIR677tfB7P1aWRUsy+zJ8Khm5Hy3NwiZ0cTCtDCAgBZzTEEfXxPzmFQ
	atpSRU0UVba289gnCJnLiMAhIy+OZMXLdaLWXWcrKOsM+/Ft6GqB1ADvhqQB41S707pbFdFbxET
	73NdwBvwC
X-Received: by 2002:a05:600c:c4a3:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb55a02932mr40317635e9.1.1794564726124;
        Fri, 13 Nov 2026 02:12:06 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm142085915e9.4.2026.11.13.02.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:12:05 -0800 (PST)
Message-ID: <82d691d2db7579d9630bf89f73132e36124bf74e.camel@amutable.com>
Subject: Re: [PATCH RFC 19/41] smack: use fc_init_pseudo() for smackfs
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
Date: Fri, 13 Nov 2026 11:12:03 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-19-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-19-4c998976c6c7@kernel.org>
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
> Initialize smackfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. smackfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0security/smack/smackfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
> index a72bc7fabea9..4a56bbeaeca3 100644
> --- a/security/smack/smackfs.c
> +++ b/security/smack/smackfs.c
> @@ -25,6 +25,7 @@
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include "smack.h"
> =C2=A0
> =C2=A0#define BEBITS	(sizeof(__be32) * 8)
> @@ -2880,6 +2881,7 @@ static const struct fs_context_operations
> smk_context_ops =3D {
> =C2=A0 */
> =C2=A0static int smk_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &smk_context_ops;
> =C2=A0	return 0;
> =C2=A0}
