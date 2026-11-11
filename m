Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794410688;
	b=oMvjeVbGo0Rrw3RP3TvQC4s5DDjqVmHnq9bq3UiFT8LjpBeUaGcOQ85jAmdGqwnjMjWM
	 jLvc7HVEDO4wm78sWQ9UlPxov9zpGN5rN8cNScktXNKMT0QvgH3iLkFoojKIX+UJC/gde
	 SBDLQ0NUBr2K+20ymDUa0fuL9NHNzqdLd5wJLsvy+3zwD2q/TNbBiNGWuSU0DOiEdjCRQ
	 hSaYqhWDTFwDalXDhvrXLhGIF0oZm6aYaqwqjYfP96EMiG+93fNGJdMmUmjF5zJAhYyS2
	 qAOI0JPqXHmRLPOMcoWSsyglzgC6Q7rp+asgwBPI6SGklgaI4J+sYSuZ/fzqGemworQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n4i9xV6coeC0dw23WHMaqm6dfnSZyHsCImBOodlCWGI=;
	b=t7lXO5HZXR+bvZygMD187evXRJcFojSEfI6RuwZshIh1bU4RcNUKkjuCPiICmWVyRA7G
	 GI58SseKRW4U7hDDkmj7fLY5vw+tRB57uw96+D86s26AIiGOv7Rf0NTBU+TJvETEYfagk
	 /Qgh4pVMeCgvVE+Ju99ioV1wkQcUfSI6DnpTmZ25dejPPW+3uhGSIUyYSjBDW1LWMOl/6
	 hGuitLT/ugQ7+3aPsx16Akk3qmM8rHzYWiUSX4C/jGTcUGv8FTH4zcqj6o08xaPAR5Kyq
	 8pPt8Q9BPMNeL3b+crBztMzMr1Vi35KcT9YorgpYJEHjWazwwd+BYmejQqZ+h/e16Rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKC3mqtc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26B3606A33C
	for <fuse-devel@lists.linux.dev>; Wed, 11 Nov 2026 15:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A26B3606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKC3mqtc
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67990a45e02so3306024d50.3
        for <fuse-devel@lists.linux.dev>; Wed, 11 Nov 2026 07:24:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794410687; cv=none;
        d=google.com; s=arc-20260327;
        b=ZcUTngHjY8uOAz3K9vEqFPnYnJoik5/ooXlWocr7i4jGAltxEX5sl8QyAwX6b5zG13
         mkk8w0d+UFatHqzLYcT5z/qiK41SlNv22+fwEHsl2Tmft4GuT4hW8x5gBIT2vsHPYGl4
         psAJ58EbpBUBuP4sgwEVr4VoKb2RWn8XadkiWZIs0+8h/W2hoUUbTYictNu8a49Jhhje
         zGv8RCNyEBMDF+iCBXfR6PqH9+5G33HfgVUWCoEhDm4DhSnhllp/9ECAJZw7PQwhLCld
         SAGPveZTWZSN4r4oSgnl6hSFTYlFrxFLesfQoZOgYpT00mR1x3qMw+sRm589c6CVG3Bg
         MBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n4i9xV6coeC0dw23WHMaqm6dfnSZyHsCImBOodlCWGI=;
        fh=E+enJlOhiKrJZqkRTjEQ1EUke7mi1V/ntWp7d/JL59Q=;
        b=sb5NIpN5zXmXCsKshf4RtsE0AnL0NNO3930L6njmHzk0RD+f2eIOoUNsU0CQVcmPUR
         kv/Iwbnu5JvyU74MvLDzSKKXEPBB910spjrSM1OeBackFO1NevVxqe0ay1ahV1voF5pF
         rhfKfAJuMLUdJbBThU1MfgCw7KxKuV3Cb5jP+70BAOEabZEzPAQsb80Roz4i6z2gOdAb
         K/VW0PIWoLEYz1SkUCat+A1HSw2kZJpSL0s2NZTuho7Zn9Kja4XV88JnAzxYhzfkykT1
         T5P+NycASNS6sEiWWnV3eDCk5S/aKQsTP3Hbe2OwImGB3Cqi8Fo9/Vp2rWQQE0z6Hk01
         4Hug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794410687; x=1795015487; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n4i9xV6coeC0dw23WHMaqm6dfnSZyHsCImBOodlCWGI=;
        b=pKC3mqtcPNpPqYt5XGEHAuVYK2cCp/eItZR2lixINquL5o9VAhUq0QJzZ56q4DnriN
         j6xymllx0AKd3HU/ONj8vyLRgwykAyK0CClBe1trRpSN4QsRQ7GHXMnLYBYActLgYTur
         96mW+fH8X4KLYIq31a9pHYpuYJkPX4gRUb1CMFJxUHnJ7CD/uOt4ekiddFmuoE5kDeKg
         TOhex3nLbgsZoWd4pZGOyKB/Nw+PV68UD7FJSMNhhJPQLh3wyeXKbYfsxJSIE1cDz5Zw
         JHEl02Q3TOeUGXe1Fb0XfG48rYP/twwrKnpQXI+ZIR4PFK8OhSszEw7qKPaJ7d7C2Yl/
         ShGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410687; x=1795015487;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4i9xV6coeC0dw23WHMaqm6dfnSZyHsCImBOodlCWGI=;
        b=rB2YiB6Zq4Cj2dvhKFi4PneXxuzvR0V70/tzUj1pOfZy+k+/txIm+IRDG82fUseUde
         c36afeqwRNOkOMLBPS2hNhHRBmWyHUkwow4a7gzDGWFyjGMaBdXnOevq+iXD49pk4Xmq
         aCN+u16LqXStbCbRliDDbSfm87ckEAJEFrmcp6BfzsYnDeB5VYOBDh6CoAzgP4jPcSrL
         56LlQ+RMJ/gueYhYjzw7xmq4yXAfynHZLlwsx51brgYtFy55+aETFz2si/H8gFrDdjTQ
         1w8k7BSmkGvZmDYMV9IJR8yrEQTC8WsRbb1T5nwM9bYKQY/4uLhvhcCApiLlC1AHhDiN
         YGkQ==
X-Forwarded-Encrypted: i=1; AL+hErGbXvQtcBvHL0+sJL/Q0lEvMKBDQkRROS++ImsQqp+4cUZDfMpKikcVzBTgqnlra+wHtutRWB5Ytt2V@lists.linux.dev
X-Gm-Message-State: APuU4Z+5pPGFb0Ire8woostYvn6EiiXlLf9pu04hKv5fj8k/MgtXUi1N
	pnZXZJt+HksV6nAGEeEW3hsICg0dbDaqCDoJ0be48qqx0v6b6bB27rtkDgcKk4I3U+bjJiqlAFE
	u1fxH67LPtvuO0adv1QR86ry752Z36II=
X-Gm-Gg: AYBFou0honUkkpDHSVpLT9EbM1rD4YhnSFvP6uDNF3iE1LVfsUsd5Q5GxUVFWD5ewMz
	cawE/ZamhOgopudiRnQOoHW1PJQvo4id2MQrJjx4g5gg2likKkBGOKk104fm/zZbKSdIrHrQueH
	3ActBCyDrVTHmqTRjzpToEtDgyxOam822O2mIl1jGhKNeoddBW6NVpWiO+dxknGuhbHYwtknImE
	CRF6y8s0iLcM2Pg6AlGKfE2t9bnS3dQEhfnhpE74v2v4eEPb31r9Mvus+r2Q92h3+nik61+V/43
	9zK8yEOIxeikhrqULqdh2Ynoq6sPZT7P0cB/JFA/qpBN+VtQQiu7jhiAsTOAKju3egCeVqE7Emq
	i2/S7ywPgbyiRVu9ULGX8Ec2O4iIX0wuxGg3ukBcn9qu0pYXu2dTGe4M8UZuXkWfo8g==
X-Received: by 2002:a05:690e:1504:b0:677:da43:28c1 with SMTP id
 956f58d0204a3-67c67f95cdcmr1887314d50.61.1794410686353; Wed, 11 Nov 2026
 07:24:46 -0800 (PST)
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
 <CABFDxMHOy2JRYfCk0ovp3nzXWMjpXyiYsLGO3k3Up3e76Z-wXw@mail.gmail.com>
 <CABFDxMGJ+Uum7dde3AN5Ab+H4Gwb23Upj7r9=SO21NWCo+Mhow@mail.gmail.com> <87mrrf8o4k.fsf@igalia.com>
In-Reply-To: <87mrrf8o4k.fsf@igalia.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Thu, 12 Nov 2026 00:24:34 +0900
X-Gm-Features: AclHuK9pJt9whdPT0W2osC63TiBxJY3kQf0Ig_irSJmHZwpSbOdmq-OOp5cP5hI
Message-ID: <CABFDxMEuH399Q5CPp_Pnvx1ZCpr0MAaBLDmVz2aoKqJ26ng4ZA@mail.gmail.com>
Subject: Re: [PATCH] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 10:58,=
 Luis Henriques <luis@igalia.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:


>
> On Wed, Nov 11 2026, Sang-Heon Jeon wrote:
>
> > 2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 8:=
27, Sang-Heon Jeon <ekffu200098@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> >>
> >> Hi, Luis
> >>
> >> 2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 6=
:28, Luis Henriques <luis@igalia.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >> >
> >> > On Wed, Nov 11 2026, Sang-Heon Jeon wrote:
> >> >
> >> > > inval_wq_set() schedules dentry_tree_work when inval_wq is enabled=
.
> >> > >
> >> > > But inval_wq_set() can be called at boot or module load before
> >> > > fuse_dentry_tree_init() initializes the work, so __queue_delayed_w=
ork()
> >> > > warns and the work never starts.
> >> > >
> >> > > So defer scheduling the work until fuse_dentry_tree_init() sets it=
 up.
> >> > >
> >> > > Fixes: ab84ad597386 ("fuse: new work queue to periodically invalid=
ate expired dentries")
> >> > > Cc: stable@vger.kernel.org
> >> > > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> >> > > ---
> >> > > QEMU based test result
> >> > > - booted with "fuse.inval_wq=3D5"
> >> >
> >> > Thank you, Sang-Heon.  I've sent a fix for this already[1], but sash=
iko
> >> > still has some race complains which I haven't looked into yet.  But =
maybe
> >> > Miklos is happier with your patch, in which case you can add my
> >>
> >> Sorry, I missed that thread.. sashiko also complains about the same
> >> race condition between init and sysfs setup. But I'm not sure it is a
> >> realistic scenario. So I want to hear other voices as well.
> >
> > I also checked the other sashiko's complaints from your patch, the one
> > about race between module cleanup and sysfs. It looks easier to
> > reproduce, but still I'm not sure this is a realistic problem. If it
> > is worth fixing, I will sent v2 with serialization between module
> > init, cleanup and inval_wq_set()
>
> I agree that the first race doesn't look realistic, though it could be
> fixed by adding an extra spinlock (which could protect both inval_wq and
> dentry_tree_is_initialised).
>
> The second race would be easier to fix by setting
> dentry_tree_is_initialised back to 'false' in fuse_dentry_tree_cleanup().

But I think race can still exist with that.

CPU0
                    CPU1

                       inval_wq_set()

                        READ_ONCE(dentry_tree_is_initialised) // true

                        <sleep>
fuse_dentry_tree_cleanup()
 WRITE_ONCE(dentry_tree_is_initialised, false);
 cancel_delayed_work_sync(&dentry_tree_work);

                        <wakeup>

                        mod_delayed_work(&dentry_tree_work) // already
false but executed


                        fuse_dentry_tree_work() // later can cause
UAF?

IMO, if we need to fix the first and second race both, then I prefer
to use lock. But if we need to fix the second race only, then
disable_delayed_work_sync(sashiko's suggestion) looks better.

Please correct me if I misunderstand something.

> One thing I like with my version of the fix is that it replaces the usage
> of schedule_delayed_work() by mod_delayed_work().  But maybe that's out
> of the scope of this fix, and I should send that separately.

I do believe that is a great enhancement. But as you said it could be
applied separately :)

> Cheers,
> --
> Lu=C3=ADs
>
>
> >> > Reviewed-by: Luis Henriques <luis@igalia.com>
> >>
> >> Thanks for your review :)
> >>
> >> > [1] https://lore.kernel.org/20261106155512.24801-1-luis%40igalia.com
> >> >
> >> > Cheers,
> >> > --
> >> > Lu=C3=ADs
> >> >
> >> > > 1) AS-IS (before fix)
> >> > > [    0.011073] Kernel command line: rootwait root=3D/dev/vda conso=
le=3Dtty1 console=3DttyS0 nokaslr  fuse.inval_wq=3D5
> >> > > [    0.011114] ------------[ cut here ]------------
> >> > > [    0.011115] WARNING: kernel/workqueue.c:2704 at __queue_delayed=
_work+0x11a/0x140, CPU#0: swapper/0
> >> > > [    0.011124] Modules linked in:
> >> > > [    0.011128] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.4.=
0-rc1-00010-gab9787d7e66a #1 PREEMPT(undef)
> >> > > [    0.011130] Hardware name: QEMU Standard PC (i440FX + PIIX, 199=
6), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
> >> > > [    0.011131] RIP: 0010:__queue_delayed_work+0x11a/0x140
> >> > > [ 0.011133] Code: c4 08 48 89 df 5b e9 85 28 0a 00 90 0f 0b 90 4c =
8b 42 08 48 8d
> >> > > 42 08 49 39 c0 0f 84 1c ff ff ff 90 0f 0b 90 e9 13 ff ff ff 90 <0f=
> 0b 90 e9 ec
> >> > > fe ff ff bff
> >> > > [    0.011134] RSP: 0000:ffffffff82e03e00 EFLAGS: 00010003 ORIG_RA=
X: 0000000000000000
> >> > > [    0.011135] RAX: 0000000000000000 RBX: 0000000000000040 RCX: 00=
00000000001388
> >> > > [    0.011136] RDX: ffffffff83a3f320 RSI: 0000000000000000 RDI: 00=
00000000000040
> >> > > [    0.011136] RBP: 0000000000000000 R08: 0000000000000082 R09: 00=
00000000000001
> >> > > [    0.011136] R10: 000000000000000a R11: 000000000000000a R12: ff=
ffffff82c09fd0
> >> > > [    0.011137] R13: ffff88807ffcfb89 R14: 0000000000000000 R15: 00=
00000000001388
> >> > > [    0.011140] FS:  0000000000000000(0000) GS:ffff8880fa26e000(000=
0) knlGS:0000000000000000
> >> > > [    0.011141] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> > > [    0.011141] CR2: ffff888003a67000 CR3: 0000000002e30000 CR4: 00=
000000000000b0
> >> > > [    0.011142] Call Trace:
> >> > > [    0.011143]  <TASK>
> >> > > [    0.011143]  queue_delayed_work_on+0x6a/0x80
> >> > > [    0.011145]  inval_wq_set+0xc4/0xe0
> >> > > [    0.011149]  parse_args+0x299/0x3c0
> >> > > [    0.011151]  ? __pfx_unknown_bootoption+0x10/0x10
> >> > > [    0.011154]  start_kernel+0x3b8/0x7c0
> >> > > [    0.011156]  ? __pfx_unknown_bootoption+0x10/0x10
> >> > > [    0.011157]  x86_64_start_reservations+0x24/0x30
> >> > > [    0.011160]  x86_64_start_kernel+0xd1/0xe0
> >> > > [    0.011162]  common_startup_64+0x13e/0x158
> >> > > [    0.011165]  </TASK>
> >> > > [    0.011166] ---[ end trace 0000000000000000 ]---
> >> > > [    0.011173] ------------[ cut here ]------------
> >> > >
> >> > > 2) TO-BE (after fix)
> >> > > - no error while booting, and also fuse_dentry_tree_work works wel=
l.
> >> > >
> >> > > ---
> >> > >  fs/fuse/dir.c | 10 ++++++++++
> >> > >  1 file changed, 10 insertions(+)
> >> > >
> >> > > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> >> > > index da23ccd8685c..6965a77a871f 100644
> >> > > --- a/fs/fuse/dir.c
> >> > > +++ b/fs/fuse/dir.c
> >> > > @@ -39,6 +39,7 @@ static struct delayed_work dentry_tree_work;
> >> > >  /* Minimum invalidation work queue frequency */
> >> > >  #define FUSE_DENTRY_INVAL_FREQ_MIN 5
> >> > >
> >> > > +static bool inval_wq_ready;
> >> > >  unsigned __read_mostly inval_wq;
> >> > >  static int inval_wq_set(const char *val, const struct kernel_para=
m *kp)
> >> > >  {
> >> > > @@ -62,6 +63,10 @@ static int inval_wq_set(const char *val, const =
struct kernel_param *kp)
> >> > >
> >> > >       *((unsigned int *)kp->arg) =3D num;
> >> > >
> >> > > +     /* Defer the work until fuse_dentry_tree_init() sets it up. =
*/
> >> > > +     if (!inval_wq_ready)
> >> > > +             return 0;
> >> > > +
> >> > >       if (num && !old)
> >> > >               schedule_delayed_work(&dentry_tree_work,
> >> > >                                     secs_to_jiffies(num));
> >> > > @@ -224,6 +229,11 @@ void fuse_dentry_tree_init(void)
> >> > >               dentry_hash[i].tree =3D RB_ROOT;
> >> > >       }
> >> > >       INIT_DELAYED_WORK(&dentry_tree_work, fuse_dentry_tree_work);
> >> > > +     inval_wq_ready =3D true;
> >> > > +
> >> > > +     if (inval_wq)
> >> > > +             schedule_delayed_work(&dentry_tree_work,
> >> > > +                                   secs_to_jiffies(inval_wq));
> >> > >  }
> >> > >
> >> > >  void fuse_dentry_tree_cleanup(void)
> >> > >
> >> > > base-commit: ab9787d7e66ac7e6e94fc975b37c5b56fff98ca9
> >> > > --
> >> > > 2.53.0
> >> > >
> >> >
> >>
> >> Best regards,
> >> Sang-Heon Jeon

Best regards,
Sang-Heon Jeon
