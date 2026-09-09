Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E9E548576
	for <fuse-devel@lists.linux.dev>; Wed,  9 Sep 2026 11:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954286; cv=pass; b=fVcr9wy3JDSaxtjoUDBvttsCiMsxQUB2I/v28bH1bjsCbtOMEYEmwYxai4VffexHhh96exuapf6NN7xQ6YNgRzb0VZtpUTwbf/135CY31pCkUdVROxvXP7oh0oiUrebYwjx6RFQAs9F6BOZbwN4jrx3u1m5DI/bRYCyyIYIUfbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954286; c=relaxed/simple;
	bh=TiHdvofftLkGJ1d4Tmmtmp05uTxczhnU5MgLLIauK+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARtbUGx+P38Jn368Nn42GKDs8atJgR5QjmCqvejsW0961soI6UUQcEbfT/B+P3wH9B8A6YlAIMyHtqE/igJMayoV0YBFckKrLlCqnyRoqv5i96dFmcT8l4v9VnULj/Cg1yRl+cLCGepQ0I3lYuqLUNy8SfODelNegTHZUD5+2ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=CDJxmCeC; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="CDJxmCeC"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530280b8234so6621751cf.0
        for <fuse-devel@lists.linux.dev>; Wed, 09 Sep 2026 04:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788954283; cv=none;
        d=google.com; s=arc-20260327;
        b=YwwEbRW2HEG1W9tAOmY9XW19p8NqWf1xUbx0kl6Gq+dUPoujLDQhC/qnWanqSPUHsr
         E5qMOiCOqj+BP/svb+pCIz/Evc3JLXnapYVrg9NofMKYdtE8zdjF8czeCcIjl+3AzD61
         J1HzWLSCb7kpi//y6UzHORikrNyyuAIjshfmLYUhyjnavW7EYD8nQRXDeAEUC8I6zUEW
         Yt18HW5W5pnbi2mIsJPw9ahA5FHRwDHwZi60TbG2JX0/tZ5D7ZsYqa7dtsXWBZi8mgaH
         DciQvJ4bu6QIa5focku9Xi6niIx9Kvdh1/UIUMS+RzaBxX0L7ZXtKOQF/2eShBYlCmcy
         BSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/N+0yVy13tQgS5+ScpnESpLk/uyTrS9jGVGpFKTxRCA=;
        fh=m7eNZKdU4mBbSH7z/BQTu4zrl/0Z38ZTRZvqHOYM0C4=;
        b=oNdyUuJOphxC/0RZf227ymBC9TMIyNQ4p0xtV+7USb8Nh03ZamUASbd4qKVvj5yd8T
         yorJSYZrflLlF0wxKbHMjcu6GDuQpoS4Izq+XbLWrVD9MYxvi1YnELwURBA1kIccryU1
         ON0z5Wfu14cygkjFLXcQnae+9c/zOg6CWJN0hUivZw6ztcMbCqL6K8+xcx0YITW/CQed
         6IyIBkSWQHlE296LJt9iJh4N5TAN8kNufG9SNL8EHc6sQfYSt9+RqsMY4smVu9c24oOV
         4UGuFzqqm6BZBPtH2AUGaLnx/xmM2Qa0Ba9Ne7lMIDEk73TnKuiI87enzXlDaPHwQFyx
         RrXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1788954283; x=1789559083; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/N+0yVy13tQgS5+ScpnESpLk/uyTrS9jGVGpFKTxRCA=;
        b=CDJxmCeCWae4rEswWFv18I0b8mtZ1WnjgpRWgjk73zCK2W8IqnrBH4jh0lg6ecA+4Q
         sKJHnki0vdh2o3OIKngRCKpE+tqaDwz2iE0HtNHU6Eg6AFA0ZK7Zg6R5MrXeo45tvD8y
         9Di20cKwctjNdb6zWZT4ytPbAzh0x+E/OvIhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954283; x=1789559083;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/N+0yVy13tQgS5+ScpnESpLk/uyTrS9jGVGpFKTxRCA=;
        b=Zi92P29hqjSKCDk2oAouPdjQavd0NlQLmiR2vXoYG46PkNqQ9yP/1nfkDWT6+SUoq9
         axjj/C2z5blFgihT5jZX2/DDuJWGl6q0bYibwGF059xfwD1+z2Yhw+SIgUrzujkE/ZgV
         MjbaQ9wpuF158iF7PO9nDJK6xZwQ9pJlRjvra5W7t/CDO5gxLpr8hpyN4aLW2rCBJCdg
         55S8RqYJ3Tg8G7dXIaDWaGe42AdL0C1tuqFhKM00R4VA/8lRlzFJ3ySrB0XKRc6E3kxW
         X6AhyQZplRMn0oN0fegfIejcIcCJtlHnMpEcnkdDK2lhwVOdU2BFHe9S/57mrHLpiYnJ
         qKug==
X-Forwarded-Encrypted: i=1; AKwUvBz0YcgGpgi13TnchXNJk/QGtvNuNl1QPV1255iMp8dBWoT1G1SXQwys4qOu67m1E365sCxkR1tRiupW@lists.linux.dev
X-Gm-Message-State: AFuF++ls89Kwa4zaIa7afEsPnNUR//BcrwtC+hLe5FVq4+dvOJ0vhONK
	M+gPfyMeLc95z5Yz1JSAD6mH5fhGVn43YO/jibIZVnFHywifsCZ2if4CPxhRGLxRyXC/uwXx+8B
	RrYceZ6cmrBAMw5Nm2TYPo5M/D7CSGmpi4k/Kf7W1ow==
X-Gm-Gg: AYBFou3Y4SvZU/36rVdLYQ0i7njZux3EVOgcNruezErtFyfLB38U7/OoVOCIKxKOiNX
	7tRaLR74mVv+AW94GMev3DHa99EtGkiM6Tr6QuHT0jMOiXlWj2FHH0r9FpB1yDHw/mQCWHhElRx
	KoM7/7jwwauCHYholjz6arWzllZx2hkNk5xYFjtr0kocj+0+GP4Ds6GEcdRW0hVwHQeeithGrhB
	0aEciz1O8Gzdh2WbpYoumvzY3z+l7d+/oU5v8BCK58L6at6diElZ0cRDg6t/LAaREhk2Kqtq65+
	Zna+ofO5NA9RS+F/wjsKw2YOTbH+zCt3fO6XJBAQJmEwRDbISADWKp3myCmmF9bwJ7SsQQ/bNEO
	JmlyvtcDGLFQG
X-Received: by 2002:a05:622a:308:b0:530:42e5:f39d with SMTP id
 d75a77b69052e-530913734b9mr126064511cf.25.1788954278478; Wed, 09 Sep 2026
 04:44:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-5-mika.kuoppala@linux.intel.com> <20260903152224.AD48C1F00A3F@smtp.kernel.org>
 <178878748003.179185.16833574173741290547@jlahtine-mobl> <178894801687.37859.4186888279082797860@jlahtine-mobl>
 <aqEzHQMrI8p9XVcu@phenom.ffwll.local> <785085e8-c9db-4d84-ab55-3a8caf9f4a35@amd.com>
 <178895308548.62143.17472983986994555742@jlahtine-mobl>
In-Reply-To: <178895308548.62143.17472983986994555742@jlahtine-mobl>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 9 Sep 2026 13:44:26 +0200
X-Gm-Features: AcwNN1V9qQ9dKCqab0SB2yrcU61pfAYqyf8l3R94yNLcs1Mbssj6NoYvC5wSIfw
Message-ID: <CAJfpegv_qh6u+GSFuPp8-PDXLoAqVWwz+kkwXv_zsxyL1PnkPA@mail.gmail.com>
Subject: Re: FUSE deadlocks vs. copy_from_user() and locks (Was: Re: [PATCH
 v10 04/27] drm/xe/eudebug: Introduce discovery for resources)
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Bernd Schubert <bernd@bsbernd.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Amir Goldstein <amir73il@gmail.com>, 
	intel-xe@lists.freedesktop.org, fuse-devel@lists.linux.dev, 
	sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, 
	Mika Kuoppala <mika.kuoppala@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 13:24, Joonas Lahtinen
<joonas.lahtinen@linux.intel.com> wrote:

> From my position, if userspace is injected to the dependency path for
> resolving page-faults, with potentially unbounded execution times, the
> timeouts would better be asserted at the FUSE/UFFD side and then simply
> failing the operations with a bang if not met.

It's possible to set request timeouts in fuse, but it's not going to
be made universal.   There's just no good general timeout value.
Whatever you choose it's going to be too short for one case and too
long for another.

Thanks,
Miklos
