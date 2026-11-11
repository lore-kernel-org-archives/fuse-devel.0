Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794396476;
	b=HeonUY6sDhJ7C4Q3tOA2DZYwFiOtYHZfiYCna+BCdohrQd83d9KJ2VOiqJfc2Th+MTTw
	 zYXu7zCDkwCT1dUXH5HSO6LgskmZBZvkz5d3i+eJX4+Op9B1q3SVaYD/rPYHWBKAKF+99
	 c/YtceJZtin6Fold/uiu/UXzFBFOUZ6BzO4rH8QZXf1vNUXMtiAwMqLSQt1aswPVDsyKv
	 EafpMAfh7kfBjbwGxcGHwMhTfJuW637cIuTvYZ7M1B0uVbqXLUvhJIb/DGqsVk2sJayrv
	 J8ZRBqMqwbXkE+lkbJmkq3iPdDg5y1WEIR+jxQrJKOR5MOPOiW1qGdSkVll+qNbk2NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0EBxvvqXHIPO5CH2r1qI1PLw1SVaqc0qdtiXgsZTdiM=;
	b=xIJjPfkcYcgON6XCQexP0U6bN+HzvtJ6Vra8sai4g+OoAPClIce7wXyGP3jt7xXFnMsZ
	 y/M2STeT5fVqFPNoCyTe/LSaQjZiEQatAIfusTPzzvD32qfJWLZbs7Fu6qZYtO/ecWLg9
	 FkKJ0YherQ1f95pfOBNAcTWGGxtOA+lhmsirTTOy+NEnHS8e+Dd3tf8L60IoHPlb2dGGB
	 7ZKVQ7sGRm6wWC/RVZ60mLvPReEppQ/CzvLYPWj4zRxZEIZT9Y/PJ9Gq27X9VTuZkrRBg
	 64rH4ZBgh0Cbee4dQAqn+p3P6iUjLbXv8P3OefBS+RUAsLmlskViIFL1eFNgaEQ/iDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MVO2bT4F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2177B606A321
	for <fuse-devel@lists.linux.dev>; Wed, 11 Nov 2026 11:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2177B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MVO2bT4F
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6767d92cde6so3468958d50.0
        for <fuse-devel@lists.linux.dev>; Wed, 11 Nov 2026 03:27:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794396475; cv=none;
        d=google.com; s=arc-20260327;
        b=gzXvEuChZ5jsSqZcOmZepsYbQQPEA06TxdT7ns6ZZx+8MMZ5HFr9mdYjcUf885Bt0+
         4Lpxjm5V2G+jrEHazWwIdtcMBoY4NIFbzgykiqDWX6+E06tte/1eiIRjlephIX/Czx2C
         uckUe44C6wxSwfyEbst4VvXRFVYBBmEMxByK77fekQmiT/dIUThAtRJoa1oUYAeELIYO
         KDIWNXhz5R4aThPVFmZUrbcwnKAL2XKXatmz5qCZKhRG/GsJN52pt3wIIKCtapqESEQ3
         J17M3RLTE2P2CUA9jNDfOrI152z5kCj0IslsUcwUZL/Xt65d+CwRQMGvDhOSnusUzT15
         UBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0EBxvvqXHIPO5CH2r1qI1PLw1SVaqc0qdtiXgsZTdiM=;
        fh=O68GMC4q+wRZPJFv+lhkXxmsqlasWDQzdnJ8CztYNBY=;
        b=PF+qsRTXgDjUxu/4WIG9dKImZ84hM+vdwINTTwIHnVpstWWYZ7y0fa1Mii9DCm+CIu
         5uIK69vRcGNgzj/r7V2XxswJS3Ifcrlh8rXtDjfGpBe7+cLGqQ44AWTzMf0dgf+DWRnK
         3MIx1uuC504IcJnx/cd5hCAOW0EJtkkMhkRDuHMInDrUtOPzgtRTJmfLQULZWuVw78z7
         y6cv/4+2BbDGJac72g7HRRuhUMvbL2NQs0pPMPVpSbUG4c6ZTRaGBC0aT7kVMzRsIdQE
         Pp697lx65Ds2B5+o7ZhClUHhWgl0ZrI3nQZas4LryvM7bzvxBMRj8uGFqV/9GQjnp9Di
         1L7Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396475; x=1795001275; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0EBxvvqXHIPO5CH2r1qI1PLw1SVaqc0qdtiXgsZTdiM=;
        b=MVO2bT4Fp6gMcyV9PRylXA8yqzAuH7B11BbFQU2eLguUZbBlBv7AYqUVLvPdy/k8/q
         AkPwTyHxSoWmQ+GqpwReLHFSbXzYUKhYn9ZHpz13XDRVNxSdTNFcZEtuTgyuMK371qiZ
         RSGEew93FQ4dwfDBDSSqrMDFM49+4qlTVDv3fgVmy2PNMVbi0uKvT7mIcO8IypHYZr9d
         jCVTxvDI41q4KiZfu69kMyPUKg3Ega+VjLt//EYPsWoKBohG4oGLlSa8Lp1rIKA7h1sy
         lnzapFwqW1EuaPZOvqW2JMBJFuFczh4+hXVtgqbNKxRrJm+sHF055bgX6zf7S1qIQoUX
         Ikkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396475; x=1795001275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0EBxvvqXHIPO5CH2r1qI1PLw1SVaqc0qdtiXgsZTdiM=;
        b=cgXAzyXCewj5QO8G03BC6zG2LcAbhiKZagJaLvNXr9Lvoooxn7vhWgxtjWHseR0+PV
         8e2wzvpW/CInPUtzqzLyvWAQbFzHJ/FwYGcrAkvSZzAQeupWbWuodeS5oo0dkbwRTvNT
         N6eDxT61up9JGDlMuM+TWuVw0ZiAdn+XMtCn8MKvMZ9YNoxatihN+edWyVKLJ8th4b3n
         l9d6zsI8T32UrCdc/kRwEAwcPHh+UhENOOJi95RpgqwfbBh4ebeM4H4iFbKSjGOwX+48
         w3UZkRZDZP3q7Fu6tZCJPCAQ1w8mw5BXPXQPrqznmP3jOAW+ToGGQHZbTyJHIdPbpUTS
         /FWg==
X-Forwarded-Encrypted: i=1; AL+hErGOq/pKj2avbeLzPb9+sl4Cm1OgSXITGos7tAi2L3GM14I4nzY1O8nNuSWKmLzBgFJImiW3jPUwygPh@lists.linux.dev
X-Gm-Message-State: APuU4Z9oM2KErvSW/lqjiSbijh5iYHZO3214p8OLvrgSOqJcy3Z3EJwP
	LWTH9loGfEZ8tRy0iAs16E4Toh+E8nvlVx7zYM3emvbwNR1RksBQpWPn5qTri900d2UwgE6UdT8
	q9+hih44mZGsI/QBu/T4NGtwUajij9Bs=
X-Gm-Gg: AYBFou0TOoE7Ww2itFnyHQUU02O/TB5ic4owdRgold5XfG9mcR7rScZHZKwvhFMLiME
	60FDKX9XNQOvPXHlXnps/wJAykDFgff/eA1cM49Yzii/2ZDINrWhjVVsl5OOscl7GqrKTlG7FSL
	t3w7AgeZZE1uVkM8n7Egq3On1l4P5ke1G1O2kTBOgMk87CIKshzLeoyJH0xMgnvRXwzBLr3GBwp
	OM9DrYX+lxGIzA8JP9cwtKAYNnfr/vAlJUfOaIH6WMG4ejqtz2CnzzdEK4/U5ULctwnAY1zE92d
	DB4CmiFis3cdsfCShRwIUvRVCNMHw4fxbctNQTkHUrNhdwYAZdsQQSAgY2qbe7GXeHhGt/YlKFE
	V7Bpbg27O6I5MBHCgJDmngUBt3VPAHiXBjwWT4eDv/zaxl646rbv9fNPKYPYf3pZeetoI+1myxt
	Q+d383QppX6Bc=
X-Received: by 2002:a05:690e:4509:10b0:67b:f332:3030 with SMTP id
 956f58d0204a3-67c67ea2783mr1208582d50.26.1794396475030; Wed, 11 Nov 2026
 03:27:55 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110150250.71520-1-ekffu200098@gmail.com> <87cxsbg1fs.fsf@igalia.com>
In-Reply-To: <87cxsbg1fs.fsf@igalia.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Wed, 11 Nov 2026 20:27:43 +0900
X-Gm-Features: AclHuK9BiFb6sNzHQ9jjn5eMBNmWcB62rZUWBjlZHzqw5mESL9SL1A56UNQEYP8
Message-ID: <CABFDxMHOy2JRYfCk0ovp3nzXWMjpXyiYsLGO3k3Up3e76Z-wXw@mail.gmail.com>
Subject: Re: [PATCH] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Luis

2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 6:28, =
Luis Henriques <luis@igalia.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Nov 11 2026, Sang-Heon Jeon wrote:
>
> > inval_wq_set() schedules dentry_tree_work when inval_wq is enabled.
> >
> > But inval_wq_set() can be called at boot or module load before
> > fuse_dentry_tree_init() initializes the work, so __queue_delayed_work()
> > warns and the work never starts.
> >
> > So defer scheduling the work until fuse_dentry_tree_init() sets it up.
> >
> > Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidate e=
xpired dentries")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> > QEMU based test result
> > - booted with "fuse.inval_wq=3D5"
>
> Thank you, Sang-Heon.  I've sent a fix for this already[1], but sashiko
> still has some race complains which I haven't looked into yet.  But maybe
> Miklos is happier with your patch, in which case you can add my

Sorry, I missed that thread.. sashiko also complains about the same
race condition between init and sysfs setup. But I'm not sure it is a
realistic scenario. So I want to hear other voices as well.

> Reviewed-by: Luis Henriques <luis@igalia.com>

Thanks for your review :)

> [1] https://lore.kernel.org/20261106155512.24801-1-luis%40igalia.com
>
> Cheers,
> --
> Lu=C3=ADs
>
> > 1) AS-IS (before fix)
> > [    0.011073] Kernel command line: rootwait root=3D/dev/vda console=3D=
tty1 console=3DttyS0 nokaslr  fuse.inval_wq=3D5
> > [    0.011114] ------------[ cut here ]------------
> > [    0.011115] WARNING: kernel/workqueue.c:2704 at __queue_delayed_work=
+0x11a/0x140, CPU#0: swapper/0
> > [    0.011124] Modules linked in:
> > [    0.011128] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.4.0-rc1=
-00010-gab9787d7e66a #1 PREEMPT(undef)
> > [    0.011130] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
> > [    0.011131] RIP: 0010:__queue_delayed_work+0x11a/0x140
> > [ 0.011133] Code: c4 08 48 89 df 5b e9 85 28 0a 00 90 0f 0b 90 4c 8b 42=
 08 48 8d
> > 42 08 49 39 c0 0f 84 1c ff ff ff 90 0f 0b 90 e9 13 ff ff ff 90 <0f> 0b =
90 e9 ec
> > fe ff ff bff
> > [    0.011134] RSP: 0000:ffffffff82e03e00 EFLAGS: 00010003 ORIG_RAX: 00=
00000000000000
> > [    0.011135] RAX: 0000000000000000 RBX: 0000000000000040 RCX: 0000000=
000001388
> > [    0.011136] RDX: ffffffff83a3f320 RSI: 0000000000000000 RDI: 0000000=
000000040
> > [    0.011136] RBP: 0000000000000000 R08: 0000000000000082 R09: 0000000=
000000001
> > [    0.011136] R10: 000000000000000a R11: 000000000000000a R12: fffffff=
f82c09fd0
> > [    0.011137] R13: ffff88807ffcfb89 R14: 0000000000000000 R15: 0000000=
000001388
> > [    0.011140] FS:  0000000000000000(0000) GS:ffff8880fa26e000(0000) kn=
lGS:0000000000000000
> > [    0.011141] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    0.011141] CR2: ffff888003a67000 CR3: 0000000002e30000 CR4: 0000000=
0000000b0
> > [    0.011142] Call Trace:
> > [    0.011143]  <TASK>
> > [    0.011143]  queue_delayed_work_on+0x6a/0x80
> > [    0.011145]  inval_wq_set+0xc4/0xe0
> > [    0.011149]  parse_args+0x299/0x3c0
> > [    0.011151]  ? __pfx_unknown_bootoption+0x10/0x10
> > [    0.011154]  start_kernel+0x3b8/0x7c0
> > [    0.011156]  ? __pfx_unknown_bootoption+0x10/0x10
> > [    0.011157]  x86_64_start_reservations+0x24/0x30
> > [    0.011160]  x86_64_start_kernel+0xd1/0xe0
> > [    0.011162]  common_startup_64+0x13e/0x158
> > [    0.011165]  </TASK>
> > [    0.011166] ---[ end trace 0000000000000000 ]---
> > [    0.011173] ------------[ cut here ]------------
> >
> > 2) TO-BE (after fix)
> > - no error while booting, and also fuse_dentry_tree_work works well.
> >
> > ---
> >  fs/fuse/dir.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index da23ccd8685c..6965a77a871f 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -39,6 +39,7 @@ static struct delayed_work dentry_tree_work;
> >  /* Minimum invalidation work queue frequency */
> >  #define FUSE_DENTRY_INVAL_FREQ_MIN 5
> >
> > +static bool inval_wq_ready;
> >  unsigned __read_mostly inval_wq;
> >  static int inval_wq_set(const char *val, const struct kernel_param *kp=
)
> >  {
> > @@ -62,6 +63,10 @@ static int inval_wq_set(const char *val, const struc=
t kernel_param *kp)
> >
> >       *((unsigned int *)kp->arg) =3D num;
> >
> > +     /* Defer the work until fuse_dentry_tree_init() sets it up. */
> > +     if (!inval_wq_ready)
> > +             return 0;
> > +
> >       if (num && !old)
> >               schedule_delayed_work(&dentry_tree_work,
> >                                     secs_to_jiffies(num));
> > @@ -224,6 +229,11 @@ void fuse_dentry_tree_init(void)
> >               dentry_hash[i].tree =3D RB_ROOT;
> >       }
> >       INIT_DELAYED_WORK(&dentry_tree_work, fuse_dentry_tree_work);
> > +     inval_wq_ready =3D true;
> > +
> > +     if (inval_wq)
> > +             schedule_delayed_work(&dentry_tree_work,
> > +                                   secs_to_jiffies(inval_wq));
> >  }
> >
> >  void fuse_dentry_tree_cleanup(void)
> >
> > base-commit: ab9787d7e66ac7e6e94fc975b37c5b56fff98ca9
> > --
> > 2.53.0
> >
>

Best regards,
Sang-Heon Jeon
