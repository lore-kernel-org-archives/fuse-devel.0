Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA17B3D969B
	for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217878; cv=none; b=gaN/o8P62qRdlKrx2vZ5OoKYrH1O+wWLs8xrEOxWvl7bkXIap6Xb/opTuVG30Zra/frrASqDaDnTYA8064xmycIWCwUabtVDjehAYLr9I9HvZ3XiGm+i6Jufo1FPEstPW13shbkGiH2HBpZV/HhBjv9ITma/ZYFy4xQfRTtB0DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217878; c=relaxed/simple;
	bh=klXFhfncEfqfgBAeaxYMbdKqMYba0lqahrn8tgVU45c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DN2NO73zmIV3TbcniFpZAcVkZD9N0AvnotbSLC3jjM/lieMFMmAW2KO8BSvFSwGg42QnZzXOaRej54qYfn1TKRv0L6iwAtFlWA3xQhFxwvNdus/llHhBl2XqL5OfgPjYZt5Em5BraUxeqCapa+Ha0PejXzsq1g4qPrisTV+QpJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fqUyn4RA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fqUyn4RA"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d58efc7356so21779945ad.1
        for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 02:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787217875; x=1787822675; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JUgWPkpfVwetzI+lBlGmW+f/TRLvR7v5NBOCskWpSaI=;
        b=fqUyn4RADTAM52e0z0tKbsqXy1oNmUOyHGJEt9pOJ5GP0dQXZV/RdnCkEwasK37Aq6
         qqtP8PDK7VvsGWxwhxAQnnVG2pHVj4JTS1VtXGjJXitTfX9srvPvjW/eNREqVrrJBYe3
         9kVuW7T1sKcQ5R/j0MmmvNgy5SlwWvtDJRGlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217875; x=1787822675;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUgWPkpfVwetzI+lBlGmW+f/TRLvR7v5NBOCskWpSaI=;
        b=o7oxovz+6e7KN7qf36EegMHdG6GA7mW1xXDz7VJ2cp3yvjb1vJCTy8maGnz8fH7Duv
         3eS3BC4U65hqJ8TYOzIyEdOtlQz/32iNKe80Ksu2ga2ZSTr/UJHlzgZU8QdQR9ipD0jH
         6dfLa9XUs3sE1befTIkikjzKcPSRPMb5XV3q4gvAsyoBSTFKlmF2tZkgJU0dpA5NLNwA
         UeGDyoAF65B4yAxznxoU266Rc4RK6dAmk4aSfe8g4Drr7b4+uczupOT11Fk0wRkwTFEW
         HUfCblk2QjEjItURR9WeknSe2Rv4UtCm60W0T3l24sTz9iBzDaw6VoLoGBmvl8p1XUS8
         KXyw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4k5EaxzGyA7cnLVB8iBA9Tda8xEwN0TYyvhDxk+aRXsqjcvgsyyIUODf1SRP+B29SxvUTsVfJMWjJ@lists.linux.dev
X-Gm-Message-State: AFuF++nUWytemI8IUAMkxfWascYcjAT0EeLGa/cc3bSEENCmlOCYB3Ml
	ybKPtfq3u+1n2tm1R8bXlNP2crQE9alwW8bgWjUcE0Ew+0ctNp/+mH+cPxuYZIIXZw==
X-Gm-Gg: AR+sD13IZ2uBXxB5ypXiLA9jW7zdfORSubS4Lgs3HcjyRUOhWBDOXECQZYRtclMkk/X
	1QwJ2O30EUO3RwrpTeoiygJuW+9xF9pd+io47l+t1bKnnzUl9ocxbWrWsUs+5UHbabrF6a9kI17
	OXUxzYg6yKP/B7+PLPWgypo63dS4CoJq5K+nOcpe2wyujbV+xPZb7ygpuNDVQm35hDHSL1qcjOA
	d6WHK22p2Fkx7I9yLu51/sGP9a67fCjzVgla3BTjZundpYbCuzbetJvoq/rQMerlZ0H2eNTOYUW
	MmfwUoJzeBOkU6/HVgbbnMJILgDF0x76F3xbUfuwONdvDtwzyPxakMfSZcIzgRKeNInLe2t2uQ2
	cs6tspcnSOBEMMt86KNM/uIbiLYJdOXe4HK6Op6+UKXHL3ZsZEVLxAMEToj0BcqBQ0YDm4avQ42
	+AuM0GpPdQk39iuHVpOkxEYOprh44TUCMLUoR5O/D99KlEqVl6XH1R1Ejilsju+puLq/XBj8yMc
	ofhgjIA+f7D7JcQ6/AFeJ5tW35s
X-Received: by 2002:a17:90b:380e:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39581212176mr20716008a91.9.1787217874644;
        Thu, 20 Aug 2026 02:24:34 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:7beb:7701:c87e:f611])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395ada1deabsm610991a91.2.2026.08.20.02.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:24:33 -0700 (PDT)
Date: Thu, 20 Aug 2026 18:24:29 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2] fuse: permit freezing while waiting for request answer
Message-ID: <aobGRjc7SE1rwIHu@google.com>
References: <20260819023542.561653-1-senozhatsky@chromium.org>
 <CAJfpegu2wOG85R6KSvCwHOuxe2fWczA1KbrFcCZz=ofUch4K=w@mail.gmail.com>
 <20260820084933.GA4036497@noisy.programming.kicks-ass.net>
 <aobDGgivy43cz7xQ@google.com>
 <20260820091018.GA4120091@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820091018.GA4120091@noisy.programming.kicks-ass.net>

On (26/08/20 11:10), Peter Zijlstra wrote:
> On Thu, Aug 20, 2026 at 06:07:18PM +0900, Sergey Senozhatsky wrote:
> > On (26/08/20 10:49), Peter Zijlstra wrote:
> > > Message-ID: <20260820084933.GA4036497@noisy.programming.kicks-ass.net>
> > > 
> > > On Wed, Aug 19, 2026 at 12:03:32PM +0200, Miklos Szeredi wrote:
> > > > Why is this unsafe exactly?  Does that unsafeness apply to
> > > > filesystems?  If so why do we allow freezing while blocked on
> > > > sb_start_write()?
> > > 
> > > Getting frozen with lock A held, while another task is blocked on A in
> > > an unfreezable state results in the system not being freezable.
> > 
> > Right, but then the system says "suspend failed" (tasks refuse to freeze
> > after 20sec) and just thaws everything back in?
> 
> People don't like suspend failing. People like to close their lid, throw
> laptop in bag, and expect laptop to not cook itself to death.

Sure, that's exactly the problem I'm looking at.  Throwing TASK_FREEZABLE
addresses some of the cases.  Failing laptop suspend because of uncontended
VFS lock is not an uncommon scenario for us.  Ideally, however, we need
some sort of server/client aware suspend, maybe moving clients to cgroup C
and server to cgroup S, and freezing those in strict order.  Or teaching PM
that some tasks cannot be frozen in random order during suspend (e.g. a
special flag PM_FREEZE_ME_LAST).

fuse is not the only subsystem that doesn't fit current random order suspend.
Another troublemaker for us is notify, which basically has the same server/client
architecture (where both sides are user-space processes).
