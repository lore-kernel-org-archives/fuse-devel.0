Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D741388392
	for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 04:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787201851; cv=none; b=kbNqeKq587MDGcQ0ZzumYqTGBfR6EntZYzmsepm+h6WeS1LxfA9C1iZ/3VYy63qUrQbka9C2yD5GCoZWpL7XV07/wPFwACBAuJXJ87Wsr18nVWAnvTqDozgiUH3xQrEi+Zh4vPXUq5FHBXiEOpl16H5BLK9pg6xm2rQqjFO4B1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787201851; c=relaxed/simple;
	bh=2USlnEWAV/BsZQrU3qAzmNex/6iGANpKQ905z4pSmNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odrQQ9cejO9bAV/lIODfqcU/CPUh8b20b2BYd6RW6ZBqMHQTSSTV5gr+6bvxkkU6/dNWBy24ITQpDX9/dqfXC05xwgvq27Fr+C/0HYCwplu7874KVl7poJyGvFVGyQaBGIAXbTNEq/G2n6kmqvZy5oG7u8EdGxwEpq4VS7Q/aU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l2lAcCum; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l2lAcCum"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cacb8416a1so15445215ad.1
        for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 21:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787201849; x=1787806649; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t8/KAiE7r+9ujV+X79tz4aj1EOYlpuTPQ/LgkCZoCHE=;
        b=l2lAcCumrnN19ISh8gU9jw5E4G5yWSpxwk/y+rpNj78aOnoB2zHWicqOXNZGHhgxBr
         65YgVRCQC1OuG969cHhT47BsgBdMdiOuTZcBP+NzMMmIesMCD3sXhXg/U7MNfYe6QR2W
         gqkHcYs6nVfGZVDPTF0fIed+klyDEr3elTi44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787201849; x=1787806649;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8/KAiE7r+9ujV+X79tz4aj1EOYlpuTPQ/LgkCZoCHE=;
        b=Bpcnhj2g3buDSZ4zRNbYdoKfEySrysoI42XVQ/5iMTY1vlS7epAQseOQPVkTXpt7TS
         6tyLETWw6AekZ2LWgB3x1HGbQ9zFNhlJNs2+008Ffrh4Q1kay9PJ7uH5suVaPyc9vn7F
         LnEKmUh0JJiFX1ptfINHCWmHDacorgWchrvZuO7vfphxdunm6w/9SRtbt75jr+Ea+E0+
         XjmF3S60Z6Q6LeqIXdPPpdcHmV65UU2WIJiOf/fqnl+4N1lze3dPKxC+KRsyZAkvAQFL
         2qjZ/m63G5GosVMEeJ4WmB9ipKNcFE6BII+gWcKGnO4bEjmbaiY1QpEzNeBjSmT3evXd
         VN3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr7Vkd0U2PtaAzl39ygxO+YINjzl1/E9nc5cbyDPXGue1D7a6XW1mt7M5GdlnObGmRLehNlxTSLWzyX@lists.linux.dev
X-Gm-Message-State: AFuF++nEgScZydnZFsGe4u1XSeD4GrkxFOkXdtL4NHGr3rCuDCpf73uC
	WEbQg6eNOEMkFY3e9dGFPv8CigHg4nkr3v39D20fSrMWXfMWljUwIofXsBJQ/edyYA==
X-Gm-Gg: AR+sD12mhveyi0L27EZ7POcyyBodaANwk5uCMuM19PbGh+kYnjL6L5UcTKikyWCGaF3
	qSrqIAqSi7TGtl4mKe78Hyjx/VNBi3Axwrzm0qo4fMCY9gLxxuQUBr2fgVrZAhhtLdH0igjwV6p
	Axm7izXByW+8Ghfl7YmMaFnZMSzNznB0d7z2CNvpRyNWjMtD4LcwEfkhdHfLTd/Sc/THeMDocOP
	9dTbdVasJq/s+QuPbfwOJrJrcWppulTA8ysfqqu2BoWtjwCIr5XuUn/rxaX9uJfJxg/mx0n+ISW
	LKqpdq+vZzpQT3U/jMUQOo2mtJgUF9x6y0wt02JMRhV7Zwh/FFJAl25NAFqbqWBcD2b9fE3P//c
	XPz5TfdY5cwv6V8A6QY+qTyYvNXdCqryo7T1U3zYUPVxC7NbSnWCBrIemG86MPgAlspuR92sg+o
	BMBKEAXyltnLyoeAjzSaxyi/5vogQws7WdysRj4bbHQO00qiu0dECGRC6XgRRcyb+2GBrQdqKLq
	gTs/v229J16PjOvs8uwh4sIyCy9
X-Received: by 2002:a17:903:3903:b0:2cf:b68a:340 with SMTP id d9443c01a7336-2d5fd6af8acmr188906615ad.10.1787201849305;
        Wed, 19 Aug 2026 21:57:29 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:7beb:7701:c87e:f611])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d587eb2sm2002465ad.24.2026.08.19.21.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 21:57:28 -0700 (PDT)
Date: Thu, 20 Aug 2026 13:57:11 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2] fuse: permit freezing while waiting for request answer
Message-ID: <aoaGrFzQFfcd5le9@google.com>
References: <20260819023542.561653-1-senozhatsky@chromium.org>
 <CAJfpegu2wOG85R6KSvCwHOuxe2fWczA1KbrFcCZz=ofUch4K=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJfpegu2wOG85R6KSvCwHOuxe2fWczA1KbrFcCZz=ofUch4K=w@mail.gmail.com>

On (26/08/19 12:03), Miklos Szeredi wrote:
> On Wed, 19 Aug 2026 at 04:35, Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > Suspend freezes tasks in random order and doesn't take into
> > consideration producer-consumer dependency that may exist
> > between tasks.  One example where this can cause issues is:
> > fuse server getting frozen ahead of clients, which then get
> > stuck waiting for req answers that never come (the server
> > is already frozen).
> >
> > Make all wait-event calls in request_wait_answer() freezer-friendly.
> >
> > This, however, doesn't address all cases.  E.g. in-place
> > PM-freeze of a request_wait_answer() task holding a contended
> > VFS lock still will block suspend.
> >
> > Note: this uses TASK_FREEZABLE, not TASK_FREEZABLE_UNSAFE,
> > which may trigger debug_locks warning during suspend (if
> > request_wait_answer() task holds some locks at the time
> > of freeze.)
> 
> This is not okay.  I see the "no new users" warning on
> TASK_FREEZABLE_UNSAFE, but this needs further discussion.

Sure.  In RFC patch I had TASK_FREEZABLE_UNSAFE but eventually
"don't add new users" won.

> Existing users of the _UNSAFE variant are NFS and samba.   I haven't
> checked the context where these are called.
> 
> Apparently __sb_start_write() uses the safe variant, yet I'm quite
> sure it will be called in various locking contexts.

We also use "safe" variant in fuse_get_req().

> Why is this unsafe exactly?  Does that unsafeness apply to
> filesystems?  If so why do we allow freezing while blocked on
> sb_start_write()?

Right, I don't have much to add to the point that maybe file-systems
can get a waiver.  If we suspend under un-contended VFS lock then it
doesn't look like unsafe here (we similarly can sleep indefinitely
under the same lock waiting for server reply); if the lock is contended
then suspend will fail.
