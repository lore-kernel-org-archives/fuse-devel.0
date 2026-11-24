Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795532572;
	b=F1906Pt33j4T2y5IMl5usI8QgK8Nt4Th+K7z6/3/x5A7+ydgPB2MNH+f6FF47BCqU+r4
	 rry88li2jgOpt7d3238RzO3B5/OKqPKTnw1SSwG20J7dOdLldRPstTSsOtEwOTFyt6Flh
	 TMBRKaSQ1BFZ5j85HceYf3GkyPfwbIx3RJKOWCK75wpwtJ8P6tN5Vm+jvzjP2dA0PHUlO
	 WA5XPqicDHzAAcIphFuq+K8KalC5FkK0gWu4Qe+ZWiTL7xI/pv5MyoSwug8N1Jde2AeN8
	 VZuxzQ0JZeVuYh2ODG5Ggnu7zq1MibpygfmI14ue2kWkCEo8fuXyV8sRoHPfkx5EYiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=15qhdURAff4Y2KbNVFJtyqKm6cg9Ddnc33WPFF64dLk=;
	b=gYWbxV1e4Lzp23XfqtTWVw1nIiF3CPPY9ll6Jzl9dl7yv3NFWX0O2+k1vtfhTx7HiHc4
	 t+yekIIeUsmU+T+jJILi5NMb8muiJkb0/8gVdYKOgMr9olzBVcNl841q1wRxTad0t5e9b
	 HdtNlML3f3LNdk6Bq4qS1YGNKUfXFlGQ28o6bh47W9sXilpL/QLtz6uOV6aYdUEZ61n6q
	 //yCt+wCnHpdpA4SO6HiCodGfxQL/YThbAsrfDXaF9+dReNPHTLdObZsaj+zXTUzF59OH
	 l/g5fdkh50VX4FVBze3C2as+rc9D1oWgz5JoNrAH7JRReiLKyOVIVUHORSYZuCtkQHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=avDDfu59;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF130606A326
	for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 15:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF130606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=avDDfu59
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4e04eda5aso33882617b3.1
        for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 07:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795532571; cv=none;
        d=google.com; s=arc-20260327;
        b=AAhAb87gepYLyFRQ4mD2gkH4wEzGOK9hqdjoOOxgw+cn3inXLyxE2j0C+UEi5XyDLv
         bIbEQAS1LCAMxDu0gVrlKvYpPne79ct6tlOrn21NpTwyxPGlWeRXRaV7BFL3m2E7tV7K
         9tBTGVqg7+mruGGJOhceYrbYQH0+EpgTjGPui2J6sHLb4TL9Tf61VebOrjNJpNQEmm49
         W0tVjPZEuRIQ+6YpYn5/x0drAjkU+UYx5+uBNXMqew4TCNRFrHkrYmFRBx86+P91eAk/
         r9Y/+wdG7CM6eSTnVcJ5IwJiEsDx6BRmSvQG0Qwx1QFQjopk+NxXsy3IMVzNe6vcWJpg
         4RcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=15qhdURAff4Y2KbNVFJtyqKm6cg9Ddnc33WPFF64dLk=;
        fh=3B++mbskG+RahODH2daQyHIVkHPgZwUgbxwCgMJrkws=;
        b=SzWBlCzsEb+AQ2TB91d9clBe4QuiyRdon5S9Yrk50HAAu/4FUGpaxRAUXGBTrYdf8L
         JUbneN2X6bCpgndk/ZfZfXV3FPZbgdfY5Aglu1LlWR3IY0Di+heNZyaK3hye8G4jBsD/
         E2gspOFZj3dQlmxxt2YHmjPBtaufshC5vgr5eZqmv03U+ciRcvSRr7VetixoL6vGBxWe
         8nua19YTo/9xIXb/9DKlaEEYLivFTi0rqfkEQ2TAfr8kPc1YR/jEZs+/7iVHH/K3oKt2
         qZU7K01niKI/qa69Ass/r8ZRR/L5zmf7wCr/tC+csj8IzFEmyy7czFF2h3jyynq/79NT
         iqzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795532571; x=1796137371; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=15qhdURAff4Y2KbNVFJtyqKm6cg9Ddnc33WPFF64dLk=;
        b=avDDfu59UIfFZKcb9juBDyHEsRG8Op4YV6quyZDSFs9mBUvoNHr9LTHzVd00ESFYF8
         hFmAI98T0JE+BGTj3s+ti2Yh51PYGCgtfOGCe3+bmnjcvI+vOuHj5VGuyAga6e87p9Ob
         o8BG8r5tOT6nMxP4u6IXQnpnl+HYuhm6GhXcpGYVfL/+WdubqPg7hazQj02WFlsc8rU0
         Sebq1mbewFuR8thQa+wCmygPeLEt/sYFtRpBV0hLH5NsXzpC9BUTZP5+bJPmA4QsW6ac
         s7GE9QqU3cDFin/QN5i9me0xpon+0CxRWeDWEinaOvBZBNvTgIWumBa5Ka3vyvvtvx9P
         jNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532571; x=1796137371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15qhdURAff4Y2KbNVFJtyqKm6cg9Ddnc33WPFF64dLk=;
        b=iWAqSdGEMrwAW44bYH72cSKB94MNVSy7bJ1h0z9oZOQRfe6sFX9jq2JeojQw9eLh5j
         wujsg3qQLO3yoApzKhXchBpf+B3/ivrsqYBO9eu8U1cZ/6rignx9FIwkEqez1+O7uYH6
         KokprhBlDe+uc7yQOlTfpHzsQUBLLyFgYr30r2JzMt68r12A16DYud4fxVTF0jbJZoeZ
         6GpPySODYJxgSz0gouSMTbbBCBhD+W5v0rADluKNANXcwqKnAW0TMrpoKLhIa6IykGRe
         prvgBxPcJu1a8KJ/EJzhtUJXQO4iu7bC5iNjLLt+NeSvwJvjVhKCm5QB0iQRMq4A3iSx
         2eeQ==
X-Forwarded-Encrypted: i=1; AL+hErEH2H/zk06LEjuAZnqJhRlyPgJSUjzfVVhBcV14GlRr6qJ+VlY433Tos5Lj6FTUwRj+wOR+G/g2eNxM@lists.linux.dev
X-Gm-Message-State: APuU4Z+r6VO9NibHv8erfKYF27ZO3VvqaPROXOjgAizTfGh0bfSzRu/p
	FM/VgOf0R5dQkCIzyuPwPi1Q1Yud329pKYEt5VVU9mjMChiwD3PAZ5krIcagYcpx9WWWBt52g1f
	njwwzm7c9fqnvbGB9Fpsy1PDiSbvkws0=
X-Gm-Gg: AZFdTZe07q/T16G44IKQ2Jg+7R0oGTrXw31FSpRy7uR3y2/1B7K6AK+XPpiDItyySUS
	1u5vBAjHIdT80+edFx4wH2P70v1saj8EzseQzHkwNe8i0m1NBeH+zR12BgDPn75e3lT6pVyT6t3
	EeuqyMLFz+bBzuds679Crmw/ZJCg1dGrZ+B0Ry8DElGp+OfeMLCANBkOv+4794Cp6URja54pThg
	FaytaTLJ5Hfoh8lrKRF5ZQnMmGStFvIcTSMairTVgPYe4zwPIiR4Vfm11I+it5sokkOvQ0Qfybd
	KTuHzx7/WP5vPxTxgOGv/y7L4aPfBFKPBmg3fmZUO7MeQ1dKLMpx7Jazy1ZdcdN+5yfocZT3KzT
	FIGNX2gZt26QJMiso42iyyfhyJ6MNlNFPHA9LFOvt2r3VH+xUF/KSwrTwX1convKnmQ==
X-Received: by 2002:a05:690c:6c8a:b0:8b3:33cf:1fdf with SMTP id
 00721157ae682-8b52043a56fmr73445267b3.14.1795532570462; Tue, 24 Nov 2026
 07:02:50 -0800 (PST)
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
In-Reply-To: <874id6cuvh.fsf@igalia.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Wed, 25 Nov 2026 00:02:37 +0900
X-Gm-Features: Aa3M54q7McbRkX2Kvq38FE_QJzJaOozwIIO4D-O26WWXQe2rdNcekeLEZ0LCW74
Message-ID: <CABFDxMGGtxxm5OyLiihbVLBJKihoTxtV2g-FG6rURdPWnQdwPw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Luis

2026=EB=85=84 11=EC=9B=94 24=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 8:49, =
Luis Henriques <luis@igalia.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, Nov 21 2026, Sang-Heon Jeon wrote:
>
> > inval_wq_set() schedules dentry_tree_work when inval_wq is enabled.
> >
> > But inval_wq_set() can be called at boot or module load before
> > fuse_dentry_tree_init() initializes the work, so __queue_delayed_work()
> > warns and the work never starts.
> >
> > So defer scheduling the work until fuse_dentry_tree_init() sets it up.
> > Also hold kernel_param_lock() in fuse_dentry_tree_init(), because a
> > sysfs write can call inval_wq_set() at the same time.
> >
> > Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidate e=
xpired dentries")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> >  fs/fuse/dir.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index da23ccd8685c..0d5d04df477b 100644
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
> > @@ -224,6 +229,14 @@ void fuse_dentry_tree_init(void)
> >               dentry_hash[i].tree =3D RB_ROOT;
> >       }
> >       INIT_DELAYED_WORK(&dentry_tree_work, fuse_dentry_tree_work);
> > +
> > +     kernel_param_lock(THIS_MODULE);
>
> I wonder if this is the right solution.  The solution I had in my local
> tree was to simply declare a spinlock with DEFINE_SPINLOCK() and use it t=
o
> synchronise access in fuse_dentry_tree_work(), fuse_dentry_tree_cleanup()
> and inval_wq_set().
>
> Do you have a reason for using this kernel_param_lock() instead?  (Honest
> question! I've never used that before :-) )

AFAIU, parse_args() (boot, module load) and param_attr_store() (sysfs)
already hold kernel_param_lock() when they call inval_wq_set(). So we
don't need to declare another lock if we hold kernel_param_lock during
init and cleanup. Let me know if I miss or misunderstand something.

But using a spinlock should be okay as well. So if you prefer using a
spinlock instead of kernel_param_lock, just let me know and I'll
switch in v3.

> Cheers,
> --
> Lu=C3=ADs
>
> > +     inval_wq_ready =3D true;
> > +
> > +     if (inval_wq)
> > +             schedule_delayed_work(&dentry_tree_work,
> > +                                   secs_to_jiffies(inval_wq));
> > +     kernel_param_unlock(THIS_MODULE);
> >  }
> >
> >  void fuse_dentry_tree_cleanup(void)
> > --
> > 2.53.0
> >
>

Best regards,
Sang-Heon Jeon
