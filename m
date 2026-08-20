Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AA42F83A2
	for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219234; cv=none; b=tIgY9koaKJ7HztLFP4AwenHc+gMgiYzUxIbKMyunGW6AlJkDEZeTFMhpOOuuxmvF/Y97DhJ3oId49mBWouDtSf1Hyt/F6Pu7apXXvzp7QEd2VFhC50gJW9iDBNbaCMjAgH0Zvn68kgt9fiHS+01B+FT8Kpc3yLgP3GmzKDRdo88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219234; c=relaxed/simple;
	bh=RBA+20Wa7VTk/zHXlotHY/RE6v/RD6D8rHGUfDI4L4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtdpamXNqGir90MHiIPYB9LLVu7WqkHs9hdCrszqHLeEbHLxCshICa7rzPgtZxw7MlS7Jjd7wJ9nIbr+4G4P4g0DPcXdgIH+3qfXgfs+Pd8TY/USGC9Wx4x+mMbKu2tdtjCkzF68j5H9lrKYRe+iq73+WnmG32V00KXWb2Z1wPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BRglCgVg; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BRglCgVg"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38511175ad3so1831967a91.2
        for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 02:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787219227; x=1787824027; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8e+fOyON/SbAUU8WoHWfPyNmaOSf1udt8NJoA3KGL/s=;
        b=BRglCgVgc2CWb5IoL/UbQsyZZuy4gWd3fdxDnO7TSvqI1geKambyeKIZJv/fBVu8T/
         qWGjtL2fmtM1HoHQHX5DaJkjVK6jx4gJRCCFcNj0Iro13whnXSgdccApoowGBW5nbO7d
         TpFnUgUQXp79Yhs4Kd6nwBF0xfyvTdyvXavYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219227; x=1787824027;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8e+fOyON/SbAUU8WoHWfPyNmaOSf1udt8NJoA3KGL/s=;
        b=HSdvyfN/5SfCAzMtRhLlh8TmUFTmvj2uhbHcNsGb3oyXAIZbAPyISXV8v0i1nHFPN2
         fNaKvO8y6nRozInrL2a51NmdXFAiUhjVWB5qA0gPOMg8C4s9PBV5RrzmOAOqdYJn7grp
         zGqf/RbsbV7m8rkH/ZhrS8hM3CyNC+xu95GRvtesJZk4uDO5e4bqPefT4NsatLNEyhj5
         Kg7nbtpAFI2QwTjkh+mMYX09BawYMX4uZuB5g3Q9UGQuK0Ux40U2crsg4mjUnvP4XKa2
         PZ1/RKt8Y2/ZqdB/aOexfMgZ2VKwy0D+Ldc5D5shxx+dZiBNMW2mOI2XAIQ9S+l5ZhlF
         WjHg==
X-Forwarded-Encrypted: i=1; AHgh+RqZTU5iyai/TlfIlUxPioBDl31JkGPbh+Rt8qmD5x0flj7/k+Mfpe6robzn5dkCG1xqJ7HlcpBSNEwZ@lists.linux.dev
X-Gm-Message-State: AFuF++kSs3r32HPl1auRCc97b+5S6fT6arjXb2aG29LCvicwTOVPxoX/
	vQDeeTAaZ5Yc4S9nCeVKU5dqujsP3FA9kZnjcpd6cAytGdeeUJWFKS77IrkuTS1Wjg==
X-Gm-Gg: AR+sD10UO6xn3c9KxsAl0kjRnBu2fxOEhP1gG1I87L9a4Bdh062yGZdYwMAyA0QOmiN
	uWh0z67K0OVkkSsip2gaWmUSdhNKTZo5P5UPZavGS5pvxR5tW6y5i5JNx3cehD5Aq7/uI4WUq7s
	sW4kSbzrxRV4HVJ7O+2el++8n2nUvp8EZ4tEOX0e3M0FaSmjHovf6USDIjbrA9Wn3u+rdPzA3sT
	xXqO2QoozxXBJ3Q17uom70PDWcTukCaSB/Ho5BdKdI7FX6Hz4t7QGK6eA3D+5dvIXGHo3rxZdFt
	WKLPuMSbCeQeSrn/qT8Ou0OviYfPz9F1QWY67Kp9jfSz9Oi4DGVPycmzI6axETQMjUNvfNzE1M3
	vuVxYedxPOyH43fovoSbWCyNWCEtN9y8hCHsrlnhvukw+RF3SEzTtctsuCGzl1sb0JbaX1NyNWj
	ZCQB2B4KldS/nFpc+W9RXJlPmjS22TTIvC2wO5aT8z/fsRJhw0/v0deWj06tGwlhOGB97DM4HfS
	RuuTU/qnG1rgeM8GIzUlSRQE01C
X-Received: by 2002:a17:90b:380e:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-395810c693cmr20983198a91.13.1787219227414;
        Thu, 20 Aug 2026 02:47:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:7beb:7701:c87e:f611])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957faf6849sm5851279a91.10.2026.08.20.02.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:47:06 -0700 (PDT)
Date: Thu, 20 Aug 2026 18:47:03 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2] fuse: permit freezing while waiting for request answer
Message-ID: <aobKfyGHkdMcleoc@google.com>
References: <20260819023542.561653-1-senozhatsky@chromium.org>
 <CAJfpegu2wOG85R6KSvCwHOuxe2fWczA1KbrFcCZz=ofUch4K=w@mail.gmail.com>
 <20260820084933.GA4036497@noisy.programming.kicks-ass.net>
 <aobDGgivy43cz7xQ@google.com>
 <20260820091018.GA4120091@noisy.programming.kicks-ass.net>
 <aobGRjc7SE1rwIHu@google.com>
 <20260820093402.GB1837346@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820093402.GB1837346@noisy.programming.kicks-ass.net>

On (26/08/20 11:34), Peter Zijlstra wrote:
> On Thu, Aug 20, 2026 at 06:24:29PM +0900, Sergey Senozhatsky wrote:
> > On (26/08/20 11:10), Peter Zijlstra wrote:
> > > On Thu, Aug 20, 2026 at 06:07:18PM +0900, Sergey Senozhatsky wrote:
> > > > On (26/08/20 10:49), Peter Zijlstra wrote:
> > > > > Message-ID: <20260820084933.GA4036497@noisy.programming.kicks-ass.net>
> > > > > 
> > > > > On Wed, Aug 19, 2026 at 12:03:32PM +0200, Miklos Szeredi wrote:
> > > > > > Why is this unsafe exactly?  Does that unsafeness apply to
> > > > > > filesystems?  If so why do we allow freezing while blocked on
> > > > > > sb_start_write()?
> > > > > 
> > > > > Getting frozen with lock A held, while another task is blocked on A in
> > > > > an unfreezable state results in the system not being freezable.
> > > > 
> > > > Right, but then the system says "suspend failed" (tasks refuse to freeze
> > > > after 20sec) and just thaws everything back in?
> > > 
> > > People don't like suspend failing. People like to close their lid, throw
> > > laptop in bag, and expect laptop to not cook itself to death.
> > 
> > Sure, that's exactly the problem I'm looking at.  Throwing TASK_FREEZABLE
> > addresses some of the cases.  Failing laptop suspend because of uncontended
> > VFS lock is not an uncommon scenario for us.  Ideally, however, we need
> > some sort of server/client aware suspend, maybe moving clients to cgroup C
> > and server to cgroup S, and freezing those in strict order.  Or teaching PM
> > that some tasks cannot be frozen in random order during suspend (e.g. a
> > special flag PM_FREEZE_ME_LAST).
> > 
> > fuse is not the only subsystem that doesn't fit current random order suspend.
> > Another troublemaker for us is notify, which basically has the same server/client
> > architecture (where both sides are user-space processes).
> 
> Then propose patches creating freeze order.
>
> PM_FREEZE_ME_LAST is going to be trouble I think, before long you'll
> need PM_FREEZE_ME_REALLY_LAST or somesuch nonsense.

We probably need more than one, yeah.  This doesn't take into consideration
relations between tasks within a priority group.  If client A holds a lock
and enters freezer, and client B sleeps on that lock, then this group
cannot be suspended.  We need clients to reach some freezer checkpoint,
instead of doing in-place freezing.

> Using cgroups for this also doesn't sound right.

This begins sounding pessimistic.

cgroup-s sounded solid to me, because this moves all the clients to that
save freezer checkpoint when they don't hold any locks.  The only
problem is that if a task never reaches "return from syscall" then
we fail suspend.  (I'm only talking about user-space tasks here, in the
context of fuse or inotify.)  Why don't cgroups sound right to you?
