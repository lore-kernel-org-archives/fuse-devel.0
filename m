Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564919;
	b=BIqUjfTxSGJ9IJjeVHOhnzcOkdxkXSUgOGJ0AvAbLGajKL79AbhIbwoadXdpKHyX5rk7
	 TDU13vwCRm0CdljQUH3evkp5s1EYG4A9e9jYt6T9YUyQjZRmue4T5WztJxz5B8oNfskQk
	 IRdL4vy0XYCILGS2pTJhCVBK+4b4l/WslsMKBF8yf9JOit/At+fcS1OdaeVUA0vwOV5mP
	 PSmI5ZJTYcL+706qvnU27iOK4mpuRQexxytsv+pHNw5LHGVnYinilxPdxaGa9wsfggj7A
	 Jum6Pg2yGCkG/ORgtXiOXXXFxIsGFVzM54zxGjHsbkAdKKC8sNM/5Tai5CUOGDtVMPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=QtOsdPCKGJ1fBhMqXd/zLQfd50NEx4L7veNiE/G2OUE=;
	b=EvF2YQNFjw3u2njYkg653ABH3t4B4OfsgHD/fB2vaQZPyYNndamaGTZGwInceUbLbBGG
	 FycMjF9VNE/7jUXH+XGfaP443soPAH1Qy2HbnCrgBlGhqF+5MXG2ZyiPLutB0BbVxyety
	 IHPqDkmRhZG6f4YOxEVQqi68oyTO3KKqsXcy11ASPDp808BWHFJeMI00So0p/yQ27khtU
	 rbv59MFTCfuoulsRK5KljfQGYpYFwjD8xZtLLXwvf7wjTRLihC/c9IwAU52e78NqCqLOo
	 31oAncgvl0iV4BdGNqIs6aB87t5hkV5++BESSys7yuHX2vcgZ3NpK/T2osHY4p+NePQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oUQDzZyz;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D040606A8A0
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D040606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oUQDzZyz
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so4413365e9.2
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564917; x=1795169717; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QtOsdPCKGJ1fBhMqXd/zLQfd50NEx4L7veNiE/G2OUE=;
        b=oUQDzZyz2AVCafrrp6ylKsFDwkCE/KuxxcUjE+7jIzMtLoNeObK4QQ7mZfupNQbwOl
         +pyaTMHqi5/892TWRjZrSy+jYABF9LXTKjnnON+Qy3x++5f4lxppW6OaN68J2uiqMLu/
         aP8A+CeEPOmH23nQ0aSaiC0c6u1zqxsvTUEQap2O/LoC2jKbqTiBk2O40s2W/k/Hi8Qw
         AXn7wQXaZet5QDXDghdB7evsi7ngxju96Q9Mgx0pkEAnt02pGje74i0v+goEB//zCa5C
         rfFAdiqyBtsLZF/bUdzN188hJd9+elqSU6yWmw4lTKInByJEwfAvsvWzAmmHk8LIQ/kG
         8drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564917; x=1795169717;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtOsdPCKGJ1fBhMqXd/zLQfd50NEx4L7veNiE/G2OUE=;
        b=sbKprZNEedrHay/rEK+qBihT8xdEugKg2uveCUQ+fs0pY4cSJ+GGlPbCbro2YI+Gn3
         EgsYtkGv72I9WSt+YADLRaNkTfbN38H5zT+DF3nqUairTPoUeFhSdXQLGaN12kXD2h+T
         G4obSJxKE424Z1ku0jIw7/QWuvhydK0fQFUAjwd/l18dotWaKA76k15/8rXRUoidSOJ3
         E/dAIcKo8czXlGy+ExuNvd5+cijv8A351rFaRhh9bmnYJKTJgMsXINHYNOOSCJ8KXfWm
         kZuEaOT553BWgixpNGhyfXvY3Mt22N8N2CTqnZQUL7mwU2rpcOW+k7AfVsb/EwC5n+xX
         4hqQ==
X-Forwarded-Encrypted: i=1; AL+hErFBNy10uZCMUzVvftwzE0B4oYHUx28q0+mCIvvHyR2GVfm1TJ4UJTVT5tZBYazxZ9gmMfxiQp7kOIe1@lists.linux.dev
X-Gm-Message-State: APuU4Z/7b26xmfOBxd+J4WqmQZfqlResNO9K7GppzsQa0YOH94vveBU7
	WSRmiaYYhgy+aDl1xw2RodOCOi+y/j6C1LPP/4oZq9j4y0q9gxdreq79AYVOeEyFOiKQ
X-Gm-Gg: AYBFou3Pf3RVpOzqxGH8t6IjouYCEiDeD9n/IddOnMG724sxF+DhCfXlXKGfArf91Kf
	5amZb4WJolYMQwP8TFZ7G7U7esRR+BHMWtQDIHR5nba/cc8H9a9LiaXS1F+5XwaYvawNxHQFiTv
	OK5w6PNuDeqTNOdce7OHauW6x88kC24otsJFzsOm+8StcgWyERMNaPAndG1fFDtWJwMyRw17it/
	WovsZoebgXWwb+9+8aYzCm0SMyZCKMsucj848Q6uRgmo6KMoeJG7zkEr4koeai9wnTlkX+yGcYK
	c7wdJkoBh+old/FeWIIjlukf+J+wKV/PWm1je/bWris5PQYKGnP+AlkSLW1IGo6Wx0Fl5nmJLqz
	KHaCPjMCqvCFLKAQafj9nzPdwtRzOB6w+yfaEzeGGTqKNHJIzxftdb+tu8CBgDpQaqXoE4D3KCf
	Xmd57jPhQdC05zs0JRNfUK2Y/zhbvIbDD8LOwBFjQZDmAPc3Fdo5BPOjEtzmBTVMOXwAGxjfCm4
	KWsF0Jx3bHLq9nEyUNb43OX6dnJWJ+K37kt++WIcBFEOWf7nfQ5m535NvhVyx9iAxO/0A6IOJ7T
	l0jxIqvEagHbQUoXEWwW1zgmY8YeHTSNMJ+gmvz1byp2dpz8sLaAstb4pRmteS0=
X-Received: by 2002:a05:600c:4f84:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb5599ade1mr43492835e9.0.1794564916955;
        Fri, 13 Nov 2026 02:15:16 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56680ea9sm31982365e9.0.2026.11.13.02.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:15:16 -0800 (PST)
Message-ID: <e2edfa06d185acd86b46945622b6eb6dff97b307.camel@amutable.com>
Subject: Re: [PATCH RFC 33/41] fs: add file_is_pseudo()
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
Date: Fri, 13 Nov 2026 11:15:14 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-33-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-33-4c998976c6c7@kernel.org>
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
> Add a helper to check whether a file is a regular file on a pseudo
> filesystem. Only regular files count. Device nodes on pseudo
> filesystems
> such as devpts, binderfs or the block devices on bdevfs are what they
> are.
>=20
> Look at the inode that actually provides the data via d_real_inode().
> overlayfs accepts sysfs, cgroup2, debugfs, tracefs, configfs and
> securityfs as lower layers and reads of such an overlayfs file are
> served by the file on the pseudo filesystem. Checking the overlayfs
> inode would miss that.
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0include/linux/fs.h | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 99caef43ff3c..407ffb6342ec 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2553,6 +2553,18 @@ static inline const struct inode
> *file_user_inode(const struct file *f)
> =C2=A0	return file_inode(f);
> =C2=A0}
> =C2=A0
> +/*
> + * Regular files on pseudo filesystems are kernel interfaces and
> must not be
> + * used as storage. Look through stacking filesystems at the inode
> that
> + * provides the data.
> + */
> +static inline bool file_is_pseudo(const struct file *file)
> +{
> +	const struct inode *inode =3D d_real_inode(file-
> >f_path.dentry);
> +
> +	return S_ISREG(inode->i_mode) && (inode->i_sb->s_iflags &
> SB_I_PSEUDO);
> +}
> +
> =C2=A0static inline struct file *file_clone_open(struct file *file)
> =C2=A0{
> =C2=A0	return dentry_open(&file->f_path, file->f_flags, file-
> >f_cred);
