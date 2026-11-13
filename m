Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564657;
	b=rkTOi7cpoHHifxgxPgabhJuDHNeEYj62ynpRgKxOHGg6ERLzm2x6U0fEz6ApNUEZ40L9
	 UQmE1wx0fbIWlaV3mTiDpA5xn6b/Y+VKTv7UwLeRD7v338qLWW89rBkRvg1fOP300Gtk5
	 LeXqwyJeJjGIjLiybrSI4NbaYhHMJlak3zojmUKW/xAe8wGrHn5X7D7AQoHnXbP3QccGj
	 L3Bq+ggqz/VfuXpVRWDhkVb5e6CvYqx5XHZJESpphSWJxbllbWrj6TkNe7j1jd7BL9K7w
	 xtkq8tMQs8ijb7jbP3Vf5hAtyZitSGe1to5DOd/B0t98K9k/cBT286g/twK/U6jQM9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=RUn5HyOzv5zK74OCIfLVACQcizuS/sHn5qpIQd0Zvv8=;
	b=DVnhF5XP/7lmrbYvU+5i5ZItx4HHw6tIS+ekdG12SkbGhHRUnzu7UZjAs72xMt+bumho
	 BkEdxVOqTVYCCSWo8i2yjKY3cJJNixHa/NykGLzL4N8kTs5p+2ytvh/d2WTK1NIAabIZT
	 NnwjiWSHM6iVPp0S1e1mQGFJTUyiK5shJCA21/ZzPUZLrmaSaFzz3jM+8Q9DU12X6I4kg
	 boXD+t8Ao9F0SU8TVFmQkdHWAcW3RRGjN7yrwwsZWGg0uoT3ywvnMwL7rmlZXh7OoDKKQ
	 Lg5CvGINBZYJMSbEZ616cz5LrV/3H8mPzJFncAJD00YAU8iO/iYwzwOLnzK8tW9Wokw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YyixsAnn;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F55606A338
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F55606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YyixsAnn
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490f38e9688so497679f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564655; x=1795169455; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUn5HyOzv5zK74OCIfLVACQcizuS/sHn5qpIQd0Zvv8=;
        b=YyixsAnnapd/Rvl8+lSQ84+ZBeTkaw3lSU/fX19g+6gwoyuLlKK6O5pBNAaN2kK0V9
         pAlc9aYEcGEdP447rFkDIE1Jfd0MxIxafvSKI7iUrbOTbUzGnHFCBux10U0kAQl7l7BY
         jkYrYsh5ZRWlEgih7tBguRHpmMgebEDwJKuZFSbTgial0etuxKeuNofRZwluQF0x7ULZ
         6QIE6hE7AhwB/rQYo9lr5GVEbiXYUz2mqaVCPuVeqp3eEevDcFVfnkOvNsdKWxq0LeGF
         uNfgjgazNULaHD9VYriD2ZUPJJLdjenC8V76iDgDz4n8gl7Di+StEW8D+aA8weVhaPI8
         77VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564655; x=1795169455;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUn5HyOzv5zK74OCIfLVACQcizuS/sHn5qpIQd0Zvv8=;
        b=J/yFYqx+O5tucDZmfkxDXEs5txY4tdw+DkQ1H8EBRt0qPe7w5ixtx9ux9kLHwBjnaR
         nss8g1bmvYoEw24A9LeZLfiPjzyglqYjIP5krhtB0IAaKj5wPZ59qHADVRIrKubJ4kxC
         oNbFur5V3hru+IJrZ7HE5tOszg9lTSEv6OoJDDYKfo84AG4PNZqEc9wlzd0+i+iniYN4
         S7bHEwiWPut/ZikSS1tQpqFD/yDi+7wIKGxI33BQZmPYR8u9OW6I1n+Zgn2NxC4Hlgfc
         9SIFGU3RJ3WTyXpMGwT3Vg6a4KYFwk9d/drTzvF9opgsd1tO8rXgrS/+NiFbYUigMABZ
         n13Q==
X-Forwarded-Encrypted: i=1; AL+hErEarS6ZrHUAtoKlJgMGEuvOmswHsc+JG3ytKkxWLRio6HAdrjAZfE8ZCl7o6UDh2TFnv+pMw3+LMt9F@lists.linux.dev
X-Gm-Message-State: APuU4Z8VvIHXnfmKpJ6DOUQGyIpj1ZkWslOqEXuvDPBPEZoef0Ak5V4U
	qSdQO1odg8r6UVfJiHjECf4R2k3ml3oWE1K7IB39remZJegi37Dk2r+K+lelWApCn6n+
X-Gm-Gg: AYBFou3DGFAQCpOYGl9d4/Adw8NJSSMZSEXGGPoWvxZxBTPlUO60c2EaOyYZk+usIsi
	F9TOloif050du2JC1OA/0CrGylHZ89RbvHFI0mG+0eiq9cZefP7zFewtt6Lr11hYcu3p66OfPbO
	bDX5ItMUcmTzlbA3mD5vbVWWqLW7+4Alfk6eEF4KILEHwGEXDavj9W/Stel3pBBbZI0JAAtcdMG
	5QEg7cy3sB4DNh2i601BF+aZf85uNeOXXf/LSP66EVOk1eKK9LvUTAi0wDvFlL1+11Km2WsSLxI
	WgPDfLYze/vplcyOLwxr5gtCesw5zcULkM6ROfWlE0haBYWI81SFDT6JEpYhXQAX9wkcoWCvTPT
	NXEQlhnZTklSsNzUW++ULn7GQzfzwR3QfmYZExrHRcn+CAIDti2vmFcwot+936rkHCxwTDLoKHK
	Z4GyKEP+KV59dTKUzmqc3VVbk4qpipKUgNMGs3J/peV2wc4ZYWNWf2BY7sUREwaBQ7xuwEUTwzG
	IcjJFUK+toO4AuyR0JFcZY86EZwQxfBDns1LHy2M3UU3KM3QCjYEARVeWc31gLx6HCyExtGCILx
	nRloRoiFYpX9DBxmaaU0KnN/mr8OcfK6/wUatRTBlYFZmcbGc0zexHx54cu+MGk=
X-Received: by 2002:a05:6000:470e:b0:499:ffd4:f519 with SMTP id ffacd0b85a97d-49b02d4c2cfmr11662822f8f.23.1794564655454;
        Fri, 13 Nov 2026 02:10:55 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm4988050f8f.0.2026.11.13.02.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:10:55 -0800 (PST)
Message-ID: <0894c601b3f3c5b92008c6c399faaa539b658307.camel@amutable.com>
Subject: Re: [PATCH RFC 17/41] securityfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:10:52 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-17-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-17-4c998976c6c7@kernel.org>
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
> Initialize securityfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. securityfs never holds executables
> or
> device nodes.
>=20
> AppArmor puts a .null device node into securityfs but only ever opens
> it via dentry_open() which doesn't care about SB_I_NODEV.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0security/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/security/inode.c b/security/inode.c
> index 080402367674..93997a9f16fc 100644
> --- a/security/inode.c
> +++ b/security/inode.c
> @@ -14,6 +14,7 @@
> =C2=A0#include <linux/kobject.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/init.h>
> @@ -64,6 +65,7 @@ static const struct fs_context_operations
> securityfs_context_ops =3D {
> =C2=A0
> =C2=A0static int securityfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &securityfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
