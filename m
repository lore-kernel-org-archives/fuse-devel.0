Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564960;
	b=L2zvEZ/vSluxBj4Ww5b7k6AgTkYY2oxdrbIp8Cwke9SIOS38rLe1/sIQ9riKVCLSvrPX
	 ElsfJcT+0Q3Bn8iYQymz3Iyj8ccB3Xcj234ZwIojxfT1oFGDAYsvLsXuXUjhb53hJamKE
	 FRHlMddsMwH7FQmJMfzFiD6/Cp97OGiuoIy7GxzIFfLTJGGHs7QUNRZQn0UB6IO1YzS/W
	 cmkibrQmpKqqaMBq2KJASHEP/3Y0VDDLC2EeaoAbCt1SdHbuaTlNH0171zOo7hHQC3zQn
	 OFISRCcuAeCeV6V1tZ0uoXX9nsKBKS2RPsHN8SL1bxAGhY3XgCES/LEpTbfNGfMKBpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=PfCz/38ILdxPmJBY1NDzDaIsiECcLTMyKpoKPJStEV0=;
	b=GzVZM0xVER9MjoKh5xIo3//AVDG+jRHBJeey8RuH/D4OavxSx91BT88cMm+1AiFK0JJZ
	 +9BhASAsGHFGDtcldHyxPj1dQz+HZ24ChdmhDNGAc23wBskZFrB5XH9/1qlXagiPb8HsR
	 7sMs8z3OybjPuZctlcMlzVVy0fakzNMyEA3asd/HSKXFKx6rtH6Hi43e/BVc5dLJE9EsV
	 puYKiqXlLHNviGsuRsSJBunHtiaa/yQPeuirTYOIRu9RjYE2vaMSDqJExvOUIvhY3Z73g
	 xtdfD2zsufZwcsdhAIy3ovr4oUFnskkgxzWb8FgtAQOtwjWpE7aMdqiGXOKCSnI1l1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="lVl/VZr5";
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEE8606B104
	for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 10:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEEE8606B104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lVl/VZr5
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c505186727fso155864466b.3
        for <fuse-devel@lists.linux.dev>; Fri, 13 Nov 2026 02:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564958; x=1795169758; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PfCz/38ILdxPmJBY1NDzDaIsiECcLTMyKpoKPJStEV0=;
        b=lVl/VZr5BEKWYu2dn0nBJM9BVsCcn1qVSaho3GfNRoL5CKw9b5y1pd30LtFxa5ri87
         BxGoNTFc1G7PzLtAUJjpX7/maTT0x9xULYuKIH6jhYNdAsQ5e735jwJ9vYdciRmeO3u+
         aZfXsiN6Tw8MYD78u7YorsDcyj1veF+ee2WNcb+ncYPkNhQ3pEyrm14UzjIuv8LVfsYV
         u2utRCV1ETIwz8JGAWIw0deTXq7E6kE83uizlO06QsX9XQfslW+SQ88x7qhJ37VSNs/P
         elUhGr3NkLO6absGYQXhhO6PHw8yGJkpPtEKw1TZLSrXolJLIn3Ob4jPs6h9XFXOMV6F
         qfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564958; x=1795169758;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfCz/38ILdxPmJBY1NDzDaIsiECcLTMyKpoKPJStEV0=;
        b=Tyqbl72trIs2Ktlluvpozl24PzJ1+OGxI0a1n57IP9xcFf5h470QfMvseMSpUDT3UI
         YAclgZ4SMTQnQmwRwvb5ravbbj97ZKpAhcGEl3ZEUo280NmblFkGKGYq64csC5oPhVWY
         UOQc9Ns2THzO5FCp2ZjwbSBPcYEpJsvgpcOIELTHVu2eTc3fPXocF6w6uBFcfVSSNwJ0
         H752oTY6R0XpPK6oZSOpMJbsG2drfa3/BRC/hko/to5ccWuJSTw8k0TAHkN6x55uCK+W
         n6Pw0JwaCtOGCurkqzoE8KQohnUdvT5mtnx9SqNRYFhs/9yyOGb2QJSV1/D3a4msyoID
         3WUg==
X-Forwarded-Encrypted: i=1; AL+hErGNMGcZYR9ehfUYRIXLUsSOlwcA+/zpaj1QhT0GBpjW93uOytZslfz9iF34PdMCqamWp6RVYOGhIOWe@lists.linux.dev
X-Gm-Message-State: APuU4Z90SPVQBVFyGEHHmbnJJrnNgjOKnlSX1cbty2ap6Xl8f9aq08la
	ZV9tUWvXnhyQlk2ri1zNREEE0baDiYSi+rmlnlUoBXrl90117WhKYyo8FcXgHEiOc78q
X-Gm-Gg: AYBFou3SPWLs84mD6OoENc1YEyIPDMQxclKoscPthaw8pbF488STjyG2dJ3bw++5hNO
	xGAMMJV3HTWstse+IQC1Vyktq3kk3rFM6ifHdoqhwP63d//iKl+QAqG5/uBzlIW2MMLv34FCH3o
	dRyJQIL2uluUQOfRnKqagF+f0ttxqmeZ7t6NZgBhmkOfuUsQ6BQAtgZlfVU2TaU8/bABtXVXY/p
	7OnkGIlZoP4EB+4EXmqVCsaSPWFeQRRRLsCigiq+432cSeyljjkcmYosVkX1GC0RYUfh5m3t6dP
	CE3uvp6oHSb7ryGF3VYscmxJsZVaXsP9nRd/CoWkzdaqFECAyW72ZFnMPoKrYkLmkcECizYu3hy
	oAFowrjipFtB+ECv0ERgOpSKHiB8wxpU+qlxUENaJtIwgYVgu7r6hAp6oYI3VmsRRxMnabtSvbW
	VBtocoK/YdyUnOrCqq0Uak/Q7jqScFL/TgeBnZa2Xg3w2H3t83k/630NpXNhfsisbkZF8XM/KSZ
	GUv+DemOWPGvqSoOQBROO+mUKqJRz+soizYeN3kf7I/5j/s8p4FHlgvE8cG/NkGD+pp01zlHmm9
	DcSJojN+4O7Gx3CYsoOFcT1TJN7F+8uoHYi4PZrL23sX+2/Mzw/WV5ZOW2SvqQo=
X-Received: by 2002:a17:906:f59c:b0:c42:102f:15f0 with SMTP id a640c23a62f3a-c509614d4c1mr171873666b.3.1794564958075;
        Fri, 13 Nov 2026 02:15:58 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7d1b7sm75606066b.74.2026.11.13.02.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:15:57 -0800 (PST)
Message-ID: <c5a694991af7e9182fd475a20bf4cfd73a13e395.camel@amutable.com>
Subject: Re: [PATCH RFC 34/41] loop: refuse files on pseudo filesystems as
 backing files
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
Date: Fri, 13 Nov 2026 11:15:56 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-34-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-34-4c998976c6c7@kernel.org>
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
> Currently loop accepts any regular file that implements ->read_iter()
> as
> a backing file and any that also implements ->write_iter() as a
> writable
> one. That includes files on procfs, sysfs and other pseudo
> filesystems.
> For example, /proc/kcore attaches read-only as a loop device the size
> of
> the kernel's virtual address space, 64 PiB with 5-level paging. sysfs
> attributes attach read-write as 4096 byte loop devices. Writing a
> block
> to the loop device of /sys/kernel/mm/transparent_hugepage/enabled
> changes the THP setting.
>=20
> That's not just nonsensical, it can be abused. Loop calls -
> >read_iter()
> and ->write_iter() of the backing file directly from its worker which
> runs with kernel credentials. But pseudo files enforce part of their
> access rules at read and write time against current. Dozens of sysfs
> ->show() and ->store() methods call capable(). Behind a loop device
> all
> of these checks are done against the loop worker instead of the task
> that opened the file. And setting up a loop device requires no
> capabilities, only access to the device nodes. So on v7.4-rc1:
>=20
> - uid 0 without any capabilities can't write to
> /sys/kernel/reboot/mode
> =C2=A0 as mode_store() requires CAP_SYS_BOOT. Writing "warm" through a
> loop
> =C2=A0 device works.
>=20
> - uid 0 without any capabilities can't read the files in
> =C2=A0 /sys/firmware/dmi/entries/*/ as dmi_sysfs_attr_show() requires
> =C2=A0 CAP_SYS_ADMIN. Reading them through a loop device works.
>=20
> - An unprivileged container that was handed a loop device can't
> change
> =C2=A0 gro_flush_timeout of its own network devices as
> =C2=A0 gro_flush_timeout_store() requires CAP_NET_ADMIN in the initial
> user
> =C2=A0 namespace. Writing it through a loop device works.
>=20
> The same goes for hard_offline_page, the md and sd attributes, rfkill
> and others.
>=20
> Refuse files on pseudo filesystems as loop backing files. Note that
> file_is_pseudo() looks through overlayfs so stacking overlayfs on top
> of
> sysfs doesn't get around this.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/block/loop.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index c96e35c3ef42..1482580a1979 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -537,6 +537,9 @@ static int loop_check_backing_file(struct file
> *file)
> =C2=A0	if ((file->f_mode & FMODE_WRITE) && !file->f_op->write_iter)
> =C2=A0		return -EINVAL;
> =C2=A0
> +	if (file_is_pseudo(file))
> +		return -EINVAL;
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
