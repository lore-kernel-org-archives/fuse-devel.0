Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538006;
	b=UMsQQHry1+pwhl3jg4EAYJAxtdzJtmucb6q1y7zDdLUP/YmO6jVJ30h+J17HMUCb+L4L
	 INAS85p57GR/ln+bp8zr9E0iPP/rme++7amhN4kvkvxYHB4v0UOO3nCHvOkWCbuwPrR6o
	 xjhUMyWhel0xyAvXsLdf+IvGsODCD9gtDz1qSHpVWHPYi6veIIFmfnBFzNOYWAL3SIgHz
	 gOjsRsdzm7ofmXc25K49vZwmuqf8FFh6N3ZKloG5A3CecdaZQ7jYZscVJPnpCbCsi91sw
	 zGUql1pBHiTm1Ky5TMU1oGT6sH0QZbY0hL938JWBekbUHqjFfR9UuZukfXV/Y4+ayTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RWL8USnmTy+KwJMsv1mm6fJtCLW5dOGP1PUWvK7nhKA=;
	b=SKJ7Vp1jIp6ue97Dw5BkIa7AMqkZ2ASj4+ClNCJcrZkPHpi0Wwa5LRjaVTPw0/PCDXVQ
	 7v43VHlRLtYTXI7TmJyiDA35dnp/IXfvxfdqe9neG01HhCzTuaoGOYSrDe776caBpi2TZ
	 uOJVdjE5R0EEbZyrEgmyMSRBuNPWEJPAkf3nA4gyHzAwSefA5Zq+sFL6N8pV7DPPpBPbm
	 cqZhlZBb2MHlTcAnSFjt+DXv6Ol6jWhUbCTzdYSWMthrujE1kruKfyw6WO9aFUInb39AL
	 PcOgb8ufTfzuFDvemWbO5PCR7CjqCbQTLARwcx1KQB6Po3lO28Ggh/nUaqdotVteocA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHqYazvl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5971606A31E
	for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 16:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5971606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHqYazvl
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4d5e645d1so30357907b3.1
        for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 08:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795538005; cv=none;
        d=google.com; s=arc-20260327;
        b=auS77FfQ0USzKVONzarhn5lqxbQy7XiAHT2k47Siec0fu7CiOsQldQ6XTTqd7XqtgS
         kN6UHLnSeE8FEPVAeKAfebjEYYP4smJEXZvdoCF6Aca5cG0MYR0mw1YJKAagOaVdQYOX
         yv4/8l8TE+LVEtQFA4/EgFTF9QBETCh6rl7pt53/5tvFAWRuXlWBtFzV3mj6+StUy07w
         4C/Um+ED4dmxSMdWtdMAEO+j+xawdlYCTyWdYvu6oysUZotxU7L5Is0GRPDU6yha32Ju
         MypyshEHJ9iCPyt3MCSBwQaJ46IPe6TnHZlgDAEqw0cCZFdRdDDntlXDtvfJwTP84KX9
         tMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RWL8USnmTy+KwJMsv1mm6fJtCLW5dOGP1PUWvK7nhKA=;
        fh=tGQBkvdON9RB+n7exkVN9Xe1JvVhGBINs53A/tMHJ4g=;
        b=h1UpOoMuP92Lor5hOaTG5JS64GSOjLbaderRekdvoxQImciHFy5BSF2JAnrWpa6YYF
         f1PQdyRsAaqF45w2pBBgr186zLpxqcXeQ/IN65CvuMJyzTdrWRQabgebmQFzc96nKJXX
         bEKK1Lngt9WQwBJ/sML1IV6T6ZqGyBPYeqF7oB3mXl0b/jCBVN6TuF2q49dd52qMy+WG
         MJZPZVg59HoDYc/5fKfd8WaS4/+DMNdzw3a3L/X5GV3cMZ2aLkJjIY/EEyVDVt+tIbJ/
         rVdp8FTSNBeu/z4xRkP0tj/cQxB4jKoliW9TDYBoUEC9wTtdkA94AGbLgeJueYHwlESE
         DnMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795538005; x=1796142805; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWL8USnmTy+KwJMsv1mm6fJtCLW5dOGP1PUWvK7nhKA=;
        b=xHqYazvl/GHsa2km+KzU2LzGriCaYKkA3ZB1tR2J43eAoYZKws3zVVBBhPlssG2Bs/
         2y1LbBB3ASecdZcYJFyEBhE2lT1iNa6cdFXESyyCokH29Wu8fRcdEyP5UPgHwALdZJl6
         FXl9Q+FbcvcumrOJFnmgFKC+YocUSWRpDcdDgzCCKnUrSnsaxVJ/7wRN8RZ09E4h1gev
         VvAwVo+pxmTQ6Py+gszmL/6QzhbyBrxf42z4qSY+qMMBLCIGB8Av/Fo9CGvhLCMRDDMr
         GLeyirEAh+rObx7eseybn0vvbGIcX4uNIStiByJ4zSDYt2o5hJotr0C5AtRNc9pEg7Be
         Fnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538005; x=1796142805;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWL8USnmTy+KwJMsv1mm6fJtCLW5dOGP1PUWvK7nhKA=;
        b=a95JcpZuin7ILk08w4a7XjW9CbOrpQg+V4uxvOmSpQHYBLg4tTP1O0JJrd0YZ6FyVK
         EO+C7B73qRZO3hkJpC5nmGZLKRCcdfyhWZmsmHcGSdENvuDD2S9UIlMJ47eQCsLZ97c6
         PP+/EkBiIzf4mj17vzWw9oBUtewk7Iz/MqwWjJpdsKSsUvHbYfVejSEaxglRLlaA4Wui
         hA6XfP5xSJqXOFuxd3wvs9W/Sr6Qee+Ee7/363eROPvz76DbclyDWVxJoErgGlozZqqV
         6mwYEZ6QtpoH+d48MAECrlj9JY1kZokmM/Oo8p1xmlS6gwXVuCea1EkU9MMxEzbSgFww
         EIeA==
X-Forwarded-Encrypted: i=1; AL+hErGjaMBLE4HbQdfCNLkfzjaFmXhmDfe8ZB9ww5bE/+XKHywQOphUNcv/sJwxIvEkSRi95EBdguuJLnbo@lists.linux.dev
X-Gm-Message-State: APuU4Z+P2EU7VCnienjnNLCgHSSFjs37cZTfEwtxpquNbgVNMcUfi0QD
	Qig//H54rojZGYy4w+1I75uKrupRfas9gwZdTvagY5ZrCtvGQjR8qxM1Wt8+rQVFq6Zo12GYvZG
	yOVRkQCfDCfnhqUh91i6t69AXh+4TOvc=
X-Gm-Gg: AZFdTZddui78b+DDTYZZYpjjBONpcxVih5o8/Dn52C4CIL+RIPLXU4l1MGpf2K6CX5o
	KFUTkL03f7OqCc7fY7O7yoKWE/P+VqaMKDUUxjrPVG30lgwjmCK3iww6tmo0qQAwG46QKwMCFyz
	G1A91vPdhnJYgW4UZQMBHkBSrf5WAv8jNmf1amaVTSmvxTFQsqWpntm6k2mz6jK4TT9MjBnUJKc
	KmTn5MrYjLtv5+Y6emPLNYIqwoLji77+/8yQvpa97e0ZNOb+WbZuFZ8la6A4qY0siRxR0Bz81Ox
	QpTDtSu5XQGXLwu0i6PmY+XW6N07VTdAPhMXUSTciLtBEyc2oTFoY+i35Db1EI57dT2VbmUCzHX
	1N8hnh6nJkY1btQZ5SFCeZtjyTJwtcFH7GNgHNmoJ262MIpnYAv/slFO9oYIGp5rX7tt9OUzIP7
	UK1aQNwE25tVA=
X-Received: by 2002:a05:690c:9a8f:b0:8b4:dc8e:2e6f with SMTP id
 00721157ae682-8b520514f25mr53029687b3.63.1795538004573; Tue, 24 Nov 2026
 08:33:24 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120150008.1144420-1-ekffu200098@gmail.com>
 <20261120150008.1144420-2-ekffu200098@gmail.com> <874id6cuvh.fsf@igalia.com>
 <CABFDxMGGtxxm5OyLiihbVLBJKihoTxtV2g-FG6rURdPWnQdwPw@mail.gmail.com> <87mrqyb3lc.fsf@igalia.com>
In-Reply-To: <87mrqyb3lc.fsf@igalia.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Wed, 25 Nov 2026 01:33:12 +0900
X-Gm-Features: Aa3M54pPy5MGws7-VwziFvwz9vT5ifSxWMpohqSuXzhnuGyopXjPnX2IMBf0Wcg
Message-ID: <CABFDxMGfVFFwcUYwHM1bmo53E+ZrvPvjPF_gnoxU0Oo7ZzkqFw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 25=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 1:23, =
Luis Henriques <luis@igalia.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Nov 25 2026, Sang-Heon Jeon wrote:
>
> > Hi, Luis
> >
> > 2026=EB=85=84 11=EC=9B=94 24=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 8:=
49, Luis Henriques <luis@igalia.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >>
> >> On Sat, Nov 21 2026, Sang-Heon Jeon wrote:
> >>
> >> > inval_wq_set() schedules dentry_tree_work when inval_wq is enabled.
> >> >
> >> > But inval_wq_set() can be called at boot or module load before
> >> > fuse_dentry_tree_init() initializes the work, so __queue_delayed_wor=
k()
> >> > warns and the work never starts.
> >> >
> >> > So defer scheduling the work until fuse_dentry_tree_init() sets it u=
p.
> >> > Also hold kernel_param_lock() in fuse_dentry_tree_init(), because a
> >> > sysfs write can call inval_wq_set() at the same time.
> >> >
> >> > Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidat=
e expired dentries")
> >> > Cc: stable@vger.kernel.org
> >> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> >> > ---
> >> >  fs/fuse/dir.c | 13 +++++++++++++
> >> >  1 file changed, 13 insertions(+)
> >> >
> >> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> >> > index da23ccd8685c..0d5d04df477b 100644
> >> > --- a/fs/fuse/dir.c
> >> > +++ b/fs/fuse/dir.c
> >> > @@ -39,6 +39,7 @@ static struct delayed_work dentry_tree_work;
> >> >  /* Minimum invalidation work queue frequency */
> >> >  #define FUSE_DENTRY_INVAL_FREQ_MIN 5
> >> >
> >> > +static bool inval_wq_ready;
> >> >  unsigned __read_mostly inval_wq;
> >> >  static int inval_wq_set(const char *val, const struct kernel_param =
*kp)
> >> >  {
> >> > @@ -62,6 +63,10 @@ static int inval_wq_set(const char *val, const st=
ruct kernel_param *kp)
> >> >
> >> >       *((unsigned int *)kp->arg) =3D num;
> >> >
> >> > +     /* Defer the work until fuse_dentry_tree_init() sets it up. */
> >> > +     if (!inval_wq_ready)
> >> > +             return 0;
> >> > +
> >> >       if (num && !old)
> >> >               schedule_delayed_work(&dentry_tree_work,
> >> >                                     secs_to_jiffies(num));
> >> > @@ -224,6 +229,14 @@ void fuse_dentry_tree_init(void)
> >> >               dentry_hash[i].tree =3D RB_ROOT;
> >> >       }
> >> >       INIT_DELAYED_WORK(&dentry_tree_work, fuse_dentry_tree_work);
> >> > +
> >> > +     kernel_param_lock(THIS_MODULE);
> >>
> >> I wonder if this is the right solution.  The solution I had in my loca=
l
> >> tree was to simply declare a spinlock with DEFINE_SPINLOCK() and use i=
t to
> >> synchronise access in fuse_dentry_tree_work(), fuse_dentry_tree_cleanu=
p()
> >> and inval_wq_set().
> >>
> >> Do you have a reason for using this kernel_param_lock() instead?  (Hon=
est
> >> question! I've never used that before :-) )
> >
> > AFAIU, parse_args() (boot, module load) and param_attr_store() (sysfs)
> > already hold kernel_param_lock() when they call inval_wq_set(). So we
> > don't need to declare another lock if we hold kernel_param_lock during
> > init and cleanup. Let me know if I miss or misunderstand something.
> >
> > But using a spinlock should be okay as well. So if you prefer using a
> > spinlock instead of kernel_param_lock, just let me know and I'll
> > switch in v3.
>
> Well, I think your solution is correct and it should be OK.  My question
> was mostly a bike-shedding question: we're using a lock that is defined
> outside of FUSE, and that doesn't seem to be used a lot elsewhere.  On th=
e
> other hand, this kernel_param_lock() was likely created for solving
> problems like this one so... yeah.
>
> Let's just leave it to the maintainers :-)
>
> And sorry for the noise.

No problem! Thanks for looking into this.

> Cheers,
> --
> Lu=C3=ADs

Best regards,
Sang-Heon Jeon
