Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564705;
	b=Bk7esYOjEYuJWKEQjGFU/H109tXRH+ej2dpq3hdmLAGBqaRPAPAVb76yoeoz6BZCTcQO
	 hLSvpm5ll/9+B4UtcK0heEaZihqeC8mDwLGCr4OeYT8iDwC2MNXejkLdyeiolK1+YFGRb
	 DV9MEb08md9UzuPT8xZ6PhtwdxBtUQ1f9YHM5xw3F0zrfe9lC+A0ArmUNwdZQVPjb2hDZ
	 NkKA7wRcCS4ZDFMbajFJ7prv6po5TZRPQ1CKkADVp1GtJ8SrYWLbpBUBkRWNyX0VEUsSg
	 KuOzz1RlR3sFXaIW5Uw+/UBJ/d0co2baGLDDTCeWD2+URAQLG2TxKk+/vM48iEBFj9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=gXMsjTg9KyNTuX1cuQ9yr2iJq2/VClhNCtHhh+FL0ZU=;
	b=1ECKFuTXS3BXc3RCielYGwIh556GD5/yIHXe25al4/Q3VsMbHrsA7NZ3TlDilAoLuXuQ
	 KxXx9QUfIbhMmfPTCTuuN3jkitI7kPjsixZWQ/cClgV3A8RY4YU2QpzHsFqSJbXe7bfM2
	 vGzI11EdYzhGNHdq2QLNJzd15LNIioLajh93PeuxpZ1t12Wge17Wb4Nd9S+JkdNfC8jE2
	 VTeLNC52GlDaD/Gdlt8fBruFx+7YrjYJZ0NcdpTsm2VZIPj/f5j0g3kMfqZIn8+xnnI4K
	 C7BA7OLC88hAU55aqt7tVHh8wJ9sWu72g2eiSayxSKHG8JqD+nKwJNX1HNf7GKMZbBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="j+p/KZ3w";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989B8606A89C
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 989B8606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=j+p/KZ3w
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so323599f8f.3
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564703; x=1795169503; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gXMsjTg9KyNTuX1cuQ9yr2iJq2/VClhNCtHhh+FL0ZU=;
        b=j+p/KZ3wnPwEFYF7F8WvNMoh50Zte0ElviyUo8TGwc6C6lwi3UkoG3t4wDiSzNyX8h
         z27ekuYt+mUh3b4RDsAVd7R8UfZjBu9et6oDxa0Hk+9g6UEzsjKR3SCcR1lLNn2RKqz/
         mKBysjufBSNI4rMp25/G8cklC4oX8zwxCaXbZpIUuEPrvDU2KbULI/UcekyN7NSyNul7
         bzQL4NYVP0a9I3LXIMKCXexHeKjRgS6bF53RBQCLKifyU351o8xMfNMp6ZB8Tg0bjxvf
         K2c3ncZU39Ck0OlZu8ev4rOLPihGJc4ZyDSU5ryvBFGL+DePL3iAg5xr5/Np60YX/h7n
         S9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564703; x=1795169503;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXMsjTg9KyNTuX1cuQ9yr2iJq2/VClhNCtHhh+FL0ZU=;
        b=kb/5PPbBW8JAjv2L1udxRBwYAL1J8pJTDh0w91FuCmtqm0te4xpdrZsQOK0rGfVE6O
         NneiwFEKhI6g1LOMr78AKX6UL+uSl8E5QdKkWbpcAXUONFqNV2hmxZCXG8C2hxEITjEN
         GqvuObz/Byv7JO+1hwyt2gTKdkKccUDZp3Rb9f/ixnH0VM6ZwfOBO0U2La+uNb29xTNN
         9Mkd2vJYVa3W99+03c7JDFhiqKb61rlia/TqcP19K+vIAexJ++vLRvsF01Oq4JPTYxYg
         O88ML4/2eAFfk8pP04u/LxOal6hfM8ltKE8o6LuoFzAMqPVhk48lPiv0SRH4D9x8er0u
         LU6Q==
X-Forwarded-Encrypted: i=1; AL+hErFiJpDcLn0m80KajoAfXVlPahBw5A4Ej6pkrVNAXWzXb+Del9dtxBGAsgEha/uBf7ByFtzFev7ASvUQ@lists.linux.dev
X-Gm-Message-State: APuU4Z8ncFaTl+SJ4ER8k3/Dq2U6gqdlgqoJLliLfWxpseLIJacNP83L
	YHoUBvhnzduhPOvEgZ8CcekBHPPH8yJF0YZwv/hFFeDiYDV4sp/6tW4sTCG3kiSw48fo
X-Gm-Gg: AYBFou1alaCgXy4ox2EJ8mQh7rVaVoIyRbMjlbf8tfo9VF2a6FkrJ9ljq1hWfYX5zsF
	YiCB/AwpR9BX+NkQcnd9wqT9Zx1djOGJ0yONAVIgr3+bwUmaMoH57bR2hmZXgAS892IlwAK/YyB
	Jee+Sq/Rh6saDKZm+muwaLrIzP1aB5fQdUCvPjoMhmEzIzF77xnrPCMtjcyevbuH+uJvmLHhkJE
	02tEvaBLzivih6UE8iAWHx1OG3xUOGLDPmGq+Mt9ImHgKe+vtY4NPzXez8ugWgZHnM4q80nl9Wa
	gdzD12htMFCUoa6V3YiTUUbNgFTvgiKBY4J6v3GepjfJiM2JXhBU+kRWHr25H6bAjGP5ypsQEQ+
	E+wzlYOqGE/06FlMKRz50x6lNx9MULcXB2ZabH3Haew46sP4TGws8r9AxjOOxvZGkQdcpvvJXkJ
	RcL5Gdm61cvdsEZFjk1lWkYtxyauYH9x7xv+G9CwSuLfqDBh1jOC4yt2G2FMkWep7Ce5ye5UrsA
	jn10YQm5h8jesxq9JPngtRJyusLUdNQR/qjUSfyYlaR94bF8NFO65jzOXoHxoP2gSA//VaNiaeL
	nb8JXzmBj74iTbaAgywWQAxy2gMJk925E2iQ5X5WKl1f9pNlvauyq8MI/oujQJc=
X-Received: by 2002:a05:6000:2501:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-49c73259cc3mr5012611f8f.14.1794564703010;
        Fri, 13 Nov 2026 02:11:43 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1797sm4931434f8f.11.2026.11.13.02.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:11:42 -0800 (PST)
Message-ID: <ff6d2a8c8623f5476d5c352dac1ad98ab3da303c.camel@amutable.com>
Subject: Re: [PATCH RFC 18/41] selinux: use fc_init_pseudo() for selinuxfs
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
Date: Fri, 13 Nov 2026 11:11:40 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-18-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-18-4c998976c6c7@kernel.org>
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
> Initialize selinuxfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> SB_I_NOEXEC. selinuxfs never holds executables. SB_I_NOEXEC also
> refuses PROT_EXEC mappings but the status and policy files are only
> ever mapped for reading.
>=20
> But selinuxfs needs device nodes. The kernel replaces file
> descriptors
> with /sys/fs/selinux/null on exec via dentry_open() which doesn't
> care
> about SB_I_NODEV. Android init however opens /sys/fs/selinux/null by
> path as /dev/null doesn't exist yet at that point. So clear
> SB_I_NODEV
> again in sel_fill_super().
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
   I.=20
> ---
> =C2=A0security/selinux/selinuxfs.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/security/selinux/selinuxfs.c
> b/security/selinux/selinuxfs.c
> index 310e19efff1d..d7ae853b6d68 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/vmalloc.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/hex.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/mutex.h>
> @@ -1852,6 +1853,9 @@ static int sel_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0 /* last one */ {"", NULL, 0}
> =C2=A0 };
> =C2=A0
> + /* Android init opens the null device below by path. */
> + sb->s_iflags &=3D ~SB_I_NODEV;
> +
> =C2=A0 ret =3D selinux_fs_info_create(sb);
> =C2=A0 if (ret)
> =C2=A0 goto err;
> @@ -1955,6 +1959,7 @@ static const struct fs_context_operations
> sel_context_ops =3D {
> =C2=A0
> =C2=A0static int sel_init_fs_context(struct fs_context *fc)
> =C2=A0{
> + fc_init_pseudo(fc);
> =C2=A0 fc->ops =3D &sel_context_ops;
> =C2=A0 return 0;
> =C2=A0}
