Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F0648F029
	for <fuse-devel@lists.linux.dev>; Wed,  9 Sep 2026 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949287; cv=none; b=YdzS4W7gIo7JVlI+SJWuwOSjJqZ9MH+XcpowNsmWMIjKoxjdb1oHrLkUBYuQolXFWwfUyueYjVGheKW0yt3eH+/vOxhINgvmdUGGyu/CrBH7NJU3mW/UhlQnFtJgBpUMnioaAEW+ltmxUljPjyIywaMcXqSuPmayCkY3Ov62xHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949287; c=relaxed/simple;
	bh=VLstWzBDA90Ll3KP/e7MAAdlmGR1TcA8A3ZIvFVZZWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHSCf1bUUbIyTO2L5XhYxJlBrHIsYI790YVvWg55WLKDjOm5uLeFOhOtViNei88LuylgLa6SqyiZMzm7WjVIQeqFbjt7iS1j6SvtYPY8/cLOWiEP5M0L1yoOjOzmG+jd/O2APyYlgGJkdglTzma9ihV5pm/+vJD5Md1ISxcorbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=UO0TKzGM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="UO0TKzGM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso53958695e9.1
        for <fuse-devel@lists.linux.dev>; Wed, 09 Sep 2026 03:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1788949282; x=1789554082; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QW7FwcI5CLpgkHE+mMHfthdjtYGSrqpt8xAnoW9r4Hs=;
        b=UO0TKzGMQUs/0vX6qNGkbxmtSY4gTmsP9UjOYLn+GkTIECZnxUanUTort0eQODVaSw
         obcCgpGUrABIabLoDZI14EfjkZ5PLYXIpgFAgkInzLudtGPArNdvCeBSSDs8gXR/urcS
         WCXONu2u+UXBVDplGbjPWapfL/oUu+5elro4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788949282; x=1789554082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QW7FwcI5CLpgkHE+mMHfthdjtYGSrqpt8xAnoW9r4Hs=;
        b=FNsXbotfdKyl8sZRmmgzkl4fVCPHIcxyiYqXal9WWAsrOLnVNmnH4D6JlJ0ahjrZ2z
         vgCHOidHvvoTG3WSE5p66IdKvKc+jtgLYVV3GwIbB2KLuGkJqzQFzBCEDdqO/EZG4uDs
         0YudUviIzAtmSTv2Ag7v2n+OM3RDRxu2GWnJurlY9NmBmze6Vuy/pBhDXodwiYD2ZNgP
         QXws/W0IDu+mR0I5Ty6o060GPLdmKbHEYcvaBf8ZAOC1vaqoYrTSlYGRV0vd7lfNSAjM
         smroc1/1QhGOvEXsOFcANdlUyN5s/q+o74zui1O0aO+B4Y29DKwiJlRIiWULwSIWMJZp
         kXGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVfr/SrEs8v/PvAlPdhpoNoJY6or2m6XuIb7kUiFK947Y2/4M14cIEZsXK4xUygKu4zGlUYN7nkhlC@lists.linux.dev
X-Gm-Message-State: AFuF++mHABeSDuHcXkzWaICjIFYl7/cbEHAnJ8Me8XbfPooDSj1hwv0R
	EgqcYXpwXvE4icEMvAU9eHGCxvJXd/+Np9ijVLNy54t/knELmf4MAbBgMLNpxgm/TlQ=
X-Gm-Gg: AYBFou2RwS64T1W5jUny58k9Oja/+9JyOGoqKObtjxSfTEt3wI0fUVVwJwiZvcy6hIc
	cF0UjRSpzvp0qHvOpaA9vjgmtk1x3mH3KID4Ib3OKEumMrQu1Q1f9BLn65mJv6Zq1jni6duSMix
	mJfpzwFH9tMu7578vcNGkR2J0MbXFMwug/u/yR8skxjGfufGMAXphbkekcdOPCAp7LaY6Pf6Amf
	ZOccTCjza6ZJrlfSMgIHczRy+Cn2jmathx5whMHDTb/frmhq0HQfXgpkr/s/K2ClBx45KOrdp/R
	dWjL7A9y9Q5Vgbl8EPqaJZG5T1PhBFD1SrLXme8CIduoHcT1GWV38Th8qC4ZGOZkAqNYmwJYAmV
	ft2CvGKZyewU1C8LjZPe/PLuoKoy4Oc92ghPBJp3A52s1/zLfZnNtgqsx4njzjC3CruMqPq04zT
	tgkqCn++knkATXavwdxsmLeHNNSe2c92wLDBXKgMZr1web778Vtb02R9Uc/k4O7uJ9M0q7Ps6Og
	7cXKCpcIwc=
X-Received: by 2002:a05:600c:3e06:b0:49d:99:1d98 with SMTP id 5b1f17b1804b1-49d00991db1mr277639155e9.9.1788949280007;
        Wed, 09 Sep 2026 03:21:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm1008046105e9.15.2026.09.09.03.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:21:19 -0700 (PDT)
Date: Wed, 9 Sep 2026 12:21:17 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd@bsbernd.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>, intel-xe@lists.freedesktop.org,
	fuse-devel@lists.linux.dev, sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: FUSE deadlocks vs. copy_from_user() and locks (Was: Re: [PATCH
 v10 04/27] drm/xe/eudebug: Introduce discovery for resources)
Message-ID: <aqEzHQMrI8p9XVcu@phenom.ffwll.local>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-5-mika.kuoppala@linux.intel.com>
 <20260903152224.AD48C1F00A3F@smtp.kernel.org>
 <178878748003.179185.16833574173741290547@jlahtine-mobl>
 <178894801687.37859.4186888279082797860@jlahtine-mobl>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178894801687.37859.4186888279082797860@jlahtine-mobl>
X-Operating-System: Linux phenom 7.1.3+deb14-amd64 

On Wed, Sep 09, 2026 at 01:00:16PM +0300, Joonas Lahtinen wrote:
> (Adding bunch of FUSE folks and DRM folks in the hopes of coming to a
> resolution here.)
> 
> Quoting Joonas Lahtinen (2026-09-07 16:24:40)
> > Quoting sashiko-bot@kernel.org (2026-09-03 18:22:23)
> > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > - [High] Global ordered workqueue stall via copy_from_user block while holding ioctl_lock.
> > > - [Medium] Event sequence numbers (seqno) can be queued out-of-order in the event stream due to a race between seqno generation and event queuing.
> > > --
> > > 
> > > commit e2061e72d8e954a17bde35e9c970ee41bc2db0ad
> > > Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > 
> > >     drm/xe/eudebug: Introduce discovery for resources
> > > 
> > > This commit introduces a resource discovery mechanism for debugger connections.
> > > When a debugger connects, all existing resources for the target client are
> > > relayed as events via an ordered workqueue, and DRM ioctls are blocked using
> > > an rw_semaphore until discovery is complete.
> > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > index 032a7ec5fbc8d..f10959b898297 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > [ ... ]
> > > > @@ -238,8 +239,12 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > > >  
> > > >       ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
> > > >       ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
> > > > -     if (ret >= 0)
> > > > +     if (ret >= 0) {
> > > > +             bool lock = xe_eudebug_discovery_lock(file, cmd);
> > > >               ret = drm_ioctl(file, cmd, arg);
> > > 
> > > [Severity: High]
> > > Does holding the discovery lock across drm_ioctl() create a vector for a
> > > workqueue stall? 
> > > 
> > > If an unprivileged user maps the ioctl argument pointer to a blocking FUSE
> > > or userfaultfd region, drm_ioctl() can be stalled indefinitely during
> > > copy_from_user() while holding xef->eudebug.ioctl_lock for read.
> > 
> > Don't think this is a very realistic vector to address, as it would
> > also extend to every other copy_from_user() and also to userptr across
> > all drivers.
> > 
> > Having a malfunctioning FUSE driver and getting a malfunctioning system
> > as a result is probably somewhat expected.
> 
> Based on further chatting on this with Sima, I was volunteered to pull
> together the discussion here.
> 
> We seem to have Sashiko picking up on patterns about accessing userspace
> memory with locks held and potential for copy_from_user() (or userptr) to
> then take indefinitely long to resolve. And that spreads to deadlocks
> everywhere situation very fast.
> 
> Based on reading of [1] and [2], it seems pretty much expected FUSE
> drivers can trivially deadlock and ultimately in worst case the situation
> can only be solved by manually aborting those connections by sysadmin.
> 
> It also seems (from the Sashiko comments) that by design, there's no
> upper bound for how long an operation can take, so a bad FUSE driver
> may stall for however long it sees fit to serve page-fault or in the
> case of [3] it may decide to not actually populate the PTEs (or maybe
> invalidate them immediately).
> 
> Should we really be refactoring the whole kernel for the sake of
> knowingly allowing potentially malicious userspace driver to idefinitely
> stall or incorrectly resolve page faults? That'll be quite a lot of
> complexity added to all the other drivers.
> 
> Or should there be more protections on FUSE / uffd to ensure such
> idefinitive stall can't happen? Or maybe this is just an academic
> problem and we amend review-prompts not to bring it up?
> 
> Or maybe I missed some part of the FUSE docs and this isn't a real
> problem?

Thanks for typing this up, matches what I think is going on here.

> Regards, Joonas
> 
> PS. There is a related patch in [3] which tries to address the problem,
> but we'll quickly run into live-locks and other issues even if we
> refactored things into: pre-fault, take locks, do _nofault() access, and
> retry if that fails.

Yeah just quickly wanting to add here that in my opinion, trying to sort
this out in all the various subsystem is not how we should even start to
think about this issue. This would be a fundamental change in how
subsystems are allowed to nest locking with stuff that can trigger
userspace faults.

I did ponder a bit how this could be solved on the fuse side of things,
maybe with some seccomp style filters. Like maybe lockdep could be
enlisted to help catch deadlocks, with a special "this is a fuse process,
it all defacto runs in fault handler context. But that only catches bugs
in normal use, not malicious exploits. And given that userspace can choose
the timing and unblock at will (I think so at least), this is pretty
powerful tool for being nasty to the kernel.

But mostly I want to really, really stand back in awe about this issue and
not think too hard about it.

Cheers, Sima

> [1] https://www.kernel.org/doc/html/next/filesystems/fuse.html#kernel-userspace-interface
> [2] https://www.kernel.org/doc/html/next/filesystems/fuse.html#aborting-a-filesystem-connection
> [3] https://sashiko.dev/#/patchset/20260827062142.4038272-1-srinivasan.shanmugam%40amd.com

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
