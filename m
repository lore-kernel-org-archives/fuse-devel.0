Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794698411;
	b=ncz+uwivg46TW3rCCzPMScrClWD/QV1TeZcAFWXSP+lryCqBjdDz8LIFgK1WFrs0EWNa
	 zMdIDPsrU4HZ2awopk0S/VjxDvXFlSx/kmjbZbd+CLDTq7g90eCm9umcNghNFc0VFQSpD
	 ME4wPQ5mdJnLfCADiLEsZLGyJBktUq0F0WQm2IBVtghv4k7N9MngS1qPfF7Q+ajB934MY
	 XLXBDDsarvzi3aPhRnkZKEK+rRfh6mJVEESgBUpYfXkgRrED7ryB5eGDKUjcZptmBzS2e
	 T8J400oeDTQYM6xlQgaUsO0fMoOoXHti5WJ7dTli/Uj3DMb5PtmtUy78a63yTKVf2eQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794698411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
	b=hMT2wif+eJinyoD8Dr8lRjge8h/1JyDJac8RLLSndcxDpeCykC/8WjFEFRBpc4p/nkuH
	 d2gD+WEwnps2wtzz0L2+DF2HK3eVWe4GKQ5xD1LlfB3g7Cg67mRNlaOqKgb4f4cmZMhWJ
	 rFhfvUMvZ630sNDT0FG7CrgdDCOdzxly4j5/CagJ98l8FlkSStzoqGH29Wj0Q2cavUCIG
	 yY4rRBmHUlumCNhifenMIdRpT4KB65hxOAJHbExtEeFPAEUwk+zxdYZReQC6/ZBewOnla
	 TjZ68IPolDrNA9qvFCsEj4E0TPS5A27TryayLAjw/XpjbB2m2nZFuI/n/GIT5DmIixA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eq8MMJ7E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B91606A333
	for <fuse-devel@lists.linux.dev>; Sat, 14 Nov 2026 23:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B91606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eq8MMJ7E
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b596569640so4611873a12.1
        for <fuse-devel@lists.linux.dev>; Sat, 14 Nov 2026 15:20:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794698409; cv=none;
        d=google.com; s=arc-20260327;
        b=L2wTPU2Vm1aj+aCC3iaqTXv+7jUJ0PgruVat356axJM1V7sGTPELHDpxaQ5XDI2x5J
         VXqB2rU6E03RQIacPZgjAUScP1b+1e/x6BKLDWHZb5Kcm61d8QCHPA+Eecar6kbr8axq
         8/+kLQUjfwjLP3oCkvtse4lfEc4Rz0hpxF+ZeYb40E9d9rtO/pE/JbtpW/4fJBl2bqTA
         tZQj8klN7PzkP24P0BRibHqF45XUajQu3CERqG5PX0aDEU7fmzMR7pqNQ5mNhghOpWv1
         4WTjv+6k5Eiya1iK6tn3CIvXAxptfecA5QQk0EpYdAZne+FG+wiRCaZ0VyCjZSgKLU3u
         RmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        fh=tR8QD0BWMFWZBuW+EIpkydCZRwc1d0n78VEn30nP/Yc=;
        b=Mu8RhQQk0ttpEHQbRTH93ORysJYG3CnhzyeNm+8kHqAbEVXbTcaWkOKiUYwGLCaUDl
         GYOD927Oo8WFqmQjBmbF8TlEerotrTJV5lDvo3kWBtS53f9JYUeCh/FQBFeZXkZNapnd
         IbNLBfCjJ55Mr1qME7FvW0eK0I36r1ZbskWIayyXM/vTbRdjdiy7CaDAu6R128p+q3IK
         PvkyjUhYQesI5SXP72EeQNmx/ocdTHIFp+KfONbIUvGkGkMhJTYfxLitxOeqFiykdoBT
         czv9WWR7hYH0en7rmhJLY6ZNtYW2igj58Yh9HDHY/MEx0rgUJ79w8rmuXOH71AfhDpgc
         qTfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794698409; x=1795303209; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        b=Eq8MMJ7EAUM8qhA7gIHpM+wwYLHiJOgQoJ+ONSWGg9YHnntBzB0rQQGaylRPUsVkRp
         wHWgynTCQOm0MDmeIoQHf0/GJxQxpL2+t18UktoVBxzTX6+pLGCxHfi6exFM4TMo1v7/
         ucVawa7jay7kzullFaC44kYAYmggjlQ1b7EX7VyTldo4iEKLWOwtPaPStmEJPoarXtHJ
         DxIIs/swFDQJvrYj2AQ7EecdRorpLL9B16mlALFDZVI81KWhfeKfpN8YID3V6YyOGC4M
         00lkv/2pwqzdaN6edGSCJjyAg93JDetC7d8/w6ObdHXV5W4D21PA4T5132kQFdfc2TcQ
         xaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794698409; x=1795303209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        b=x3tjagFsJk663GtJdO+InyL9n/qW29pE1Q2fw+3zKRecvx1r9bnBW5tNUCLYpfuK1t
         nbuXrzO8wLM9lVooUVDlUIGD8RxHXtoAYL0fUNZDlPfdQYcJpWon2sjmybAtpP18ZchS
         MigiyPXR0GMwPBc0ZALPZWeGpXl01CFb5G/L0iDxeQHXbjFASFibDwWIo72b1LnzpUX1
         DvOtOzdAs9rKXm1z0/jt/1h9dirDnVEi0wyrdtLJmzIGGkqf04yg5vRkgayLmg6qbPSi
         DT/JATV614bp/3JTqJdxfissHdSFvXxduTUtzieawM7Ew3/AT660lMRXkNRjHm0OW7qi
         rpmA==
X-Forwarded-Encrypted: i=1; AL+hErEi7rW4jfMNDObn0gd/Q9kUvC+LNUjvNvPazstob6N16/eSwZ2dkHLcmLMrvtsf7vHFhSIITSWGUMAC@lists.linux.dev
X-Gm-Message-State: APuU4Z+n0gs4iiJg1B3xH+p2tFD8x2OuTk3PHh+HmLwyetcJoMmbMVrE
	cPkedZYpR4lQ6GQNvq5p5X6Ejvmpvz1QCj8h80PyRvE8xfFj8wVxITPxvAYSQ5k62DpJuzjdGo2
	6LLwCJKfsnOGH+yIhqLGY8XFYaQtJjls=
X-Gm-Gg: AYBFou2NYoJxC4Ggwmpv81e0Xxi0H77yyCmfrPm+kGX9mB+GlT8H4aPb7G7sJ56WpM2
	UFPGmoEW2s0VrLQWW0MawJETCW+pB5U6EwnfEJGnjQTw/Hi+SoudI/vgfeoFc40iFAMaieembw4
	rhZINLT0qFsEhbnxMQYrlIlcVF8ho6ILWIEImcOY4upC0Kqfo4c8cup7sV/CQHs3N6+OGBo+97w
	/8CDkVwPj/bc+Ve7DRi7ZMZMhpf+XDPqWN+uW+dHQEbwNSvTrws6PuCE+Q+UBrpTghUhWIB+ZbJ
	iILFezmlNG542FVkUg2RYCrI3mmaBbe5Fm1Uhj2apw5wuYjAUxrocfi2pYnpfYKDFcg9vFmkm6g
	pjGrmdqk0+b//NvADbssFlAjOlRQnIOPpwC2oeetF9/0hKDFwsPXoiarBVkKE2edDwPfrrQ==
X-Received: by 2002:a05:6402:e10:b0:6b7:f00e:5e56 with SMTP id
 4fb4d7f45d1cf-6b7f00e5f37mr1542816a12.1.1794698409123; Sat, 14 Nov 2026
 15:20:09 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
 <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org> <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
In-Reply-To: <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 15 Nov 2026 00:19:57 +0100
X-Gm-Features: AclHuK_YVxhIpv6JLzeNAX5mX5IHGfu05WS6uQ-TCKewxE3JKeci2PyA-UDMCbo
Message-ID: <CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo91QjJHH9T_Yw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
To: Chris Down <chris@chrisdown.name>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 9:06=E2=80=AFPM Chris Down <chris@chrisdown.name> w=
rote:
>
> Hi Christian,
>
> Christian Brauner writes:
> >+      /* Look through stacking filesystems at the inode with the data. =
*/
> >+      if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEU=
DO)
> >+              return -EINVAL;
>
> This looks good in general, but what the bots said about O_PATH files
> here is real. With FMODE_PATH this is reached for a file that was never
> opened, so on overlayfs nothing has been through ovl_open() to look up
> the lowerdata of a metacopy file yet. ovl_d_real() then does the lookup
> itself, and when that fails it hits the WARN(1) at its end and returns
> the overlayfs dentry, so the check passes as well.
>
> Only fuse passes FMODE_PATH, so it takes CAP_SYS_ADMIN to get there, but
> it's easy to trigger with that. From a quick test with a metacopy file
> whose redirect into a data-only layer points at nothing, registering an
> O_PATH fd of it with FUSE_DEV_IOC_BACKING_OPEN gives
>
>      ovl_d_real(/f, 0): real dentry not found
>      WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210
>      [...]
>       file_check_backing+0x308/0x5e0
>       fuse_backing_new+0x219/0x4a0
>       fuse_backing_open+0xe8/0x390
>       fuse_dev_ioctl+0x53a/0x7d0
>
> and the ioctl still succeeds. A normal open of that file fails with
> ENOENT, so nothing could have used it as a backing file anyway, but with
> panic_on_warn this is now a panic.
>
> Maybe ovl_d_real() should just stop warning when the lookup fails, now
> that it has a caller that isn't trace_uprobe?

Yeh I guess that this needs to be a Fixes for lazy data lookup.

The correct fix would be to teach all the callers to deal with an error.

> The check would still pass
> for an O_PATH file whose lowerdata couldn't be looked up at that point,
> though.

One observation relevant to this patch set is that a datadir layer has no
business being a pseudo fs and that can and should be blocked explicitly
at overlayfs mount time.

The other observation is that fuse_passthrough_open() should probably
check the backing_file that was opened for io in addition to checking
in fuse_backing_open(), which could have different FMODE and specifically
could be FMODE_PATH.

Thanks,
Amir.
