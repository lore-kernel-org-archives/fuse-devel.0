Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C9550EC1A
	for <fuse-devel@lists.linux.dev>; Wed,  9 Sep 2026 10:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949838; cv=pass; b=KpV6jfSzQQBobLMYogeNWYziA3sY/RPThZodK4txYQp2yWv4Ml0aghrY2n6v3xTvHaI4GseskrtmxnWTI4U1hL0NEx6RCrDsKUB4zHIGFJuWAVioeQTxk9O4vVtxUqhvAlW6s6ZLpVnJoYahHutv1ejzXKP6fNhBobQMkYL1Eno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949838; c=relaxed/simple;
	bh=Vl/Vp4zgPlpJ8OWYbPuWPyaywrrhONTpt512uVBR9kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEtKkhWCFn5gLjaH0FKefrqezoHCl1oi5Gc9Izi8enNyG3f3BMoQMmFFcn0ASMG8chV/Vo2DE7aINV/VuFruhbowhCmOroLVBSTStbrv1uYyVVprecx3R/gV1pWmfkrAKfQ01nES+4V3u4uNn7WgoU4b5ZN2GJrvBEPJNZXBP2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=aWMnH3Ty; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="aWMnH3Ty"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-90cc39e06bdso68974896d6.0
        for <fuse-devel@lists.linux.dev>; Wed, 09 Sep 2026 03:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788949834; cv=none;
        d=google.com; s=arc-20260327;
        b=FXRY//yVoOjZzeUROAHMUuOEAX3rglpPlKVojS63ql922l38QVgNbsyOkEul8yirxV
         1F3qjA2qMfKLtQUrY1lHYaJPBqhShlWBi55mzSux+wBh/D/jldKxHWbf6P73ESzDkWIE
         1q9YT6maeKG45QgJqV3tXN4W9e6zqMvZCq97h2U0MjABTGWpTrRKYMMJ3ZCUztOZnvKP
         bFVEG+lyzGlDBWp2Ej8UVd4NX+gl0jMmxw1KVAzMVIxIiD6zfUkpYSbfGGyzCfbmipim
         8y5gLsVzKi9KH2FVhJRIjqwtfPPqfI4Yui3oYJeZ65P4ntPrzmkwCIglXuEWIhGwCM39
         qWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jpRvNvSvD7V0OL3stsnfs9SVxZoTLrRcZKUqJWQu3kQ=;
        fh=dSrKx7r8T44/a0k4gcpJkS3OqFGEKgQ0fw5SCeOXdYE=;
        b=rJKl2tU3xeGaPfbcUiq0mctdccFpKrPsmZgFfeBTwlmBZm4EWr7qP9DAhOAc2foM5n
         g0G2dJcSPYxRdEVqYR9AD3y7qIDRbkINfYCvvHZ36369xKxbKtdZZdNxzZE40H0o9Zh6
         bY4+FEjZu1f0NqNbCA6h3JI96r7/AvgpTsZ9i8yPmrm7Pc6RrPWhROjbFxyVpmph4A51
         myax/5wu6fSwm7w5CTsjy291L+C14KA3jXKhFEzLSL4GiL3brJVypxdNIBOEW5wOKSCH
         xn0/ia6vto4pAyrj/9rP9cY4gCDI1wk5nygn/fXQ68UHDsr1/TA0z6Il0gzp4I3cvIU8
         ewkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1788949834; x=1789554634; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpRvNvSvD7V0OL3stsnfs9SVxZoTLrRcZKUqJWQu3kQ=;
        b=aWMnH3TyfI32aeLGBxjMjO2r996YjUYAwA5JJtXIxNxJKr5fUZ5PQ1TotfkiNfajZp
         aUKD/wpYHR/x25cGmQqhs6RE/OwyT73nLGG9h/sRGGT9x0wL30tIlni0wY5K4O1uSMzp
         Mxki2Mnf5J7FBo/zkueIHbh4SagGBF5R085G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788949834; x=1789554634;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jpRvNvSvD7V0OL3stsnfs9SVxZoTLrRcZKUqJWQu3kQ=;
        b=oA5i8SYFoqfruVTinqmLyubPdisjGtpLwHk4q1fMdzcIQHty42C0031PRh90cOivMt
         +oeY0XEwZyQ8FLsF0WZC7WNfBanFZE2U0vevpzLqJwn4LSorTvWswg1z92Qak4NE6TQd
         yrLQH23elT11tv9hlaDlvFR2+VH7ab3Cut6McQeMT0nw7nvhfsb8b/MjxhdqQzlhkE/e
         IRMgQhSL/EitHL39hNzGoSWvCrfFIar4nJ2jUpTX4VcaWQjB0wIIGar1cz3FSCs4Rq+2
         +od+XpwH7hIM+0x6R/CujgANbDDM2PI04uYJO3QyEvPigeh0K9RMqrMD28kpopcYX4KN
         U8jg==
X-Forwarded-Encrypted: i=1; AKwUvByYIWxZJ7jS9BPTWsKaqR8xmrwBwO0YSYIeyJ4z5bVBfcZR1mEEkQDCKMt56sv2jLotkqaF34T8Hpn0@lists.linux.dev
X-Gm-Message-State: AFuF++leLW+YuMFA659NL9FmKAVzJmwh7PpRlARLIkzGUUW/jYLwUXXO
	9qaYiTzdjBYRRR9PzYCe0qsPNk+vLF0ZIlun6LSzp30OjfmR4y2En8wgrCiZXqT6T7ml0IfK1EH
	mR1Ij1WE55QA/Y+Gjm7lHcpFnPhWjkw7qLcZMp4avxw==
X-Gm-Gg: AYBFou1SGEjG3LVinVfc2UcfLBUHKwrrwuDkFpccoDsQ6IThN8A+uovlgdF0Q6D8ea0
	3gdiZyu2ZE/CnmCWCFffWgYEtqb1lOcrv4jV/ki59Ovr8gxyyIUwhW26mwHdSwVjz9W0lOvuiT+
	RDqveoPjz+0eWSsSA2Dy7GZM8oob0yQXUJUpZHbNuU72cMwoF8imiSZT6NmbbvghqUVuWeCR8JA
	b5SSUOKClTa0DddFgiNghoMREHdkejLSYN2PFwVCNrKJeOCyJoniBR9msBDPpiHtSZNDfIGPaVE
	vU7RX070wVWbaPGTKuFXTVdn9D6F95PoMyEKfAd420mQAcQk1JkW7TscDjzsbwM5bK/VOoZG8tI
	IfBAWBhe4EyKY
X-Received: by 2002:a05:622a:1489:b0:52f:bc89:4933 with SMTP id
 d75a77b69052e-5305483d9ecmr389465191cf.20.1788949831561; Wed, 09 Sep 2026
 03:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-5-mika.kuoppala@linux.intel.com> <20260903152224.AD48C1F00A3F@smtp.kernel.org>
 <178878748003.179185.16833574173741290547@jlahtine-mobl> <178894801687.37859.4186888279082797860@jlahtine-mobl>
In-Reply-To: <178894801687.37859.4186888279082797860@jlahtine-mobl>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 9 Sep 2026 12:30:20 +0200
X-Gm-Features: AcwNN1Uh9cE_469mX3O2aBqf9qMn4Rt3GJCs03Vdits2s9ouaewG7zKYcPHnkzU
Message-ID: <CAJfpegsFJkghPimBYAnJ_KyZt43T66cAATAvpENZeX5Lj73zSQ@mail.gmail.com>
Subject: Re: FUSE deadlocks vs. copy_from_user() and locks (Was: Re: [PATCH
 v10 04/27] drm/xe/eudebug: Introduce discovery for resources)
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Amir Goldstein <amir73il@gmail.com>, intel-xe@lists.freedesktop.org, 
	fuse-devel@lists.linux.dev, sashiko-bot@kernel.org, 
	sashiko-reviews@lists.linux.dev, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, 
	Mika Kuoppala <mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 12:00, Joonas Lahtinen
<joonas.lahtinen@linux.intel.com> wrote:

> Based on reading of [1] and [2], it seems pretty much expected FUSE
> drivers can trivially deadlock and ultimately in worst case the situation
> can only be solved by manually aborting those connections by sysadmin.

Exactly.

The real question is, how far the effects of this deadlock can spread.
If it remains within control of the user that mounted the fuse
filesystem, than that's okay.  If it affects processes not controlled
by the user, that's bad.

So it's not about being able to stall a process that accesses the
filesystem, that's trivially doable using fuse even without any page
faults.

I'ts about being able to stall an unrelated process.

Thanks,
Miklos
