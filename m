Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4C03A874F;
	Wed,  9 Sep 2026 10:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948028; cv=none; b=gX3/wlbGpjdtDNRqLzdIhbr63KumbXlLYM5yIa+sFTN8bN0hbMXXt0Fb10rW7Sg+Xijdd+pb4U1tZt28/ciBPYEdazwWwVLgIKRudG0Jj5g/h8lGnbi6xTCXnR4lTok25fbbdmrL/MJWtUFa8JJYFGzsaGQzP0Fkla0i5xErcbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948028; c=relaxed/simple;
	bh=eNGgSSjrjGwGa7MyUDUhNbv97kA+7jiJHOtpwZPzqqI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=mpd7IsLZqIg0i8wOghg0ShtzimeGpxbWxnI8Y8Q/TXc4z9r1JWIfPtqhQhPAagThUZDziO1FmycIvaxw2fokhcgUwM0pkrlC8lL3Cwjy1FyOXfcoX8wZfrIHZdJ2vP6yhqFVCxCsDEL0PoWUdY49Pv5S3VhFQhDVHSxLya+jBL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ld8YTZJw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ld8YTZJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788948025; x=1820484025;
  h=mime-version:content-transfer-encoding:in-reply-to:
   references:subject:from:cc:to:date:message-id;
  bh=eNGgSSjrjGwGa7MyUDUhNbv97kA+7jiJHOtpwZPzqqI=;
  b=Ld8YTZJwhk5hfj22Uz/8tr4WqLqEWhINAjO8qSEHtWGpj5OCwpUsJ2Jq
   6Zy97XYCedCOSD8Jz+6mI4UF2gSOuiYdBgcfpy5yho/blj2zsm2Fb2QMe
   Q0KhJDJgoafsLMnH+42tpI8Jah4z/lel427EPKOZpPrIJ7ppdnlBhGwfW
   CJy8MjctWx6UbU8y/x1wNhLEzwRQc5XWwHoE4ygWdEZB/V/IGvVkvr8Yb
   lVP6Bz+Det6qdmtd54iAItnA7ZQZEQS1JBAuGbM9FtJCMZcb9P9S/1Nn2
   2f+iULWvnm+/ihUKNUoQI8u+xTWONdCvViolvIRnrvOqFUl5uNXpQ/iFn
   Q==;
X-CSE-ConnectionGUID: TDo5nw2yQbydn+VK8C5pjw==
X-CSE-MsgGUID: LsFNXLz3RW+/i2gntcxG8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="112144521"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="112144521"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 03:00:24 -0700
X-CSE-ConnectionGUID: 8kL4oKFrTO6EoWZIuU2syw==
X-CSE-MsgGUID: kQPjiEa8SV+/VRiuMWp26Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="301145261"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.37])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 03:00:20 -0700
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <178878748003.179185.16833574173741290547@jlahtine-mobl>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com> <20260903145952.848051-5-mika.kuoppala@linux.intel.com> <20260903152224.AD48C1F00A3F@smtp.kernel.org> <178878748003.179185.16833574173741290547@jlahtine-mobl>
Subject: FUSE deadlocks vs. copy_from_user() and locks (Was: Re: [PATCH v10 04/27] drm/xe/eudebug: Introduce discovery for resources)
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, fuse-devel@lists.linux.dev, sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Matthew Brost <matthew.brost@intel.com>, Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, dri-devel@lists.freedesktop.org, Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>, Amir Goldstein <amir73il@gmail.com>
Date: Wed, 09 Sep 2026 13:00:16 +0300
Message-ID: <178894801687.37859.4186888279082797860@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620

(Adding bunch of FUSE folks and DRM folks in the hopes of coming to a
resolution here.)

Quoting Joonas Lahtinen (2026-09-07 16:24:40)
> Quoting sashiko-bot@kernel.org (2026-09-03 18:22:23)
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [High] Global ordered workqueue stall via copy_from_user block while =
holding ioctl_lock.
> > - [Medium] Event sequence numbers (seqno) can be queued out-of-order in=
 the event stream due to a race between seqno generation and event queuing.
> > --
> >=20
> > commit e2061e72d8e954a17bde35e9c970ee41bc2db0ad
> > Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> >=20
> >     drm/xe/eudebug: Introduce discovery for resources
> >=20
> > This commit introduces a resource discovery mechanism for debugger conn=
ections.
> > When a debugger connects, all existing resources for the target client =
are
> > relayed as events via an ordered workqueue, and DRM ioctls are blocked =
using
> > an rw_semaphore until discovery is complete.
> >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_d=
evice.c
> > > index 032a7ec5fbc8d..f10959b898297 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > [ ... ]
> > > @@ -238,8 +239,12 @@ static long xe_drm_ioctl(struct file *file, unsi=
gned int cmd, unsigned long arg)
> > > =20
> > >       ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
> > >       ret =3D ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
> > > -     if (ret >=3D 0)
> > > +     if (ret >=3D 0) {
> > > +             bool lock =3D xe_eudebug_discovery_lock(file, cmd);
> > >               ret =3D drm_ioctl(file, cmd, arg);
> >=20
> > [Severity: High]
> > Does holding the discovery lock across drm_ioctl() create a vector for a
> > workqueue stall?=20
> >=20
> > If an unprivileged user maps the ioctl argument pointer to a blocking F=
USE
> > or userfaultfd region, drm_ioctl() can be stalled indefinitely during
> > copy_from_user() while holding xef->eudebug.ioctl_lock for read.
>=20
> Don't think this is a very realistic vector to address, as it would
> also extend to every other copy_from_user() and also to userptr across
> all drivers.
>=20
> Having a malfunctioning FUSE driver and getting a malfunctioning system
> as a result is probably somewhat expected.

Based on further chatting on this with Sima, I was volunteered to pull
together the discussion here.

We seem to have Sashiko picking up on patterns about accessing userspace
memory with locks held and potential for copy_from_user() (or userptr) to
then take indefinitely long to resolve. And that spreads to deadlocks
everywhere situation very fast.

Based on reading of [1] and [2], it seems pretty much expected FUSE
drivers can trivially deadlock and ultimately in worst case the situation
can only be solved by manually aborting those connections by sysadmin.

It also seems (from the Sashiko comments) that by design, there's no
upper bound for how long an operation can take, so a bad FUSE driver
may stall for however long it sees fit to serve page-fault or in the
case of [3] it may decide to not actually populate the PTEs (or maybe
invalidate them immediately).

Should we really be refactoring the whole kernel for the sake of
knowingly allowing potentially malicious userspace driver to idefinitely
stall or incorrectly resolve page faults? That'll be quite a lot of
complexity added to all the other drivers.

Or should there be more protections on FUSE / uffd to ensure such
idefinitive stall can't happen? Or maybe this is just an academic
problem and we amend review-prompts not to bring it up?

Or maybe I missed some part of the FUSE docs and this isn't a real
problem?

Regards, Joonas

PS. There is a related patch in [3] which tries to address the problem,
but we'll quickly run into live-locks and other issues even if we
refactored things into: pre-fault, take locks, do _nofault() access, and
retry if that fails.


[1] https://www.kernel.org/doc/html/next/filesystems/fuse.html#kernel-users=
pace-interface
[2] https://www.kernel.org/doc/html/next/filesystems/fuse.html#aborting-a-f=
ilesystem-connection
[3] https://sashiko.dev/#/patchset/20260827062142.4038272-1-srinivasan.shan=
mugam%40amd.com
