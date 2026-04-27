Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F145339708
	for <fuse-devel@lists.linux.dev>; Mon, 27 Apr 2026 19:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777317879; cv=none; b=EozMfbKv+VwR0y+wTbJ8bDDbIr44GSj2vNbn9aXs1ruEn2FwFb+eLJwHSUnQOSuX926PR/tFr+Xo/PJENEAKFvipmjQgUjjzu5NWDMBe3GnAkH/fdFon1R7CuzhT1nTO+rlGZTu0oo197GxlqfDIF0iQ0rXeFBhWuZr7f7ppC6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777317879; c=relaxed/simple;
	bh=QuUokkY+4Q2XP6vae3Usa4NS9FTMDLDODZzPvq8b1i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUThYLOyuOFoxQ7b8uYv2YNagIjEAYwluJeGw8JBHG1VPMsgz3AuOk5NmPsWmaXkZACfGJplKlYGb5pBGYHc6gTfWVpNhCJzBLmJimZmG7x6OwhwdHCY9FVlrtYL1e673FzfXfjqbzNjkFCMU4dEBgrSLtMzPJ6aC81TMISr3UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/hSZlZb; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/hSZlZb"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-678adefbd26so5425059a12.3
        for <fuse-devel@lists.linux.dev>; Mon, 27 Apr 2026 12:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777317869; x=1777922669; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RV1aio//lRH6vrC7iKsNXbkY/M33Jc85/wH3A0aXXHE=;
        b=U/hSZlZbwlxMMK/6/1NjYo7xvHAP6oV2n0JmrEvvu8mXDwca5tnuVnQuhkVVt6NHN3
         tW5dmyxiDQXoQgT0LIcm2yI9GcLrwHjKeZU5AV+/HZjuecDN1H9+oNdR2rfjYGLfgl7s
         Y6faX3BEj5TEXU6LJN0iUa6wIhUKu19kJvh4jFtzJJILJLwM1jDHZlD2gS4ds1yJEMMm
         ZlI2QSrP/LXVeiipAroFf9ieAD/mI/8Oz/egljmj2/cGsU17d5dcjvz5LXY50lPxY0LE
         2XsWijJNN2aXtIezmmMiKBtCzxeWg6rGkJuVkphkYfq65cNPcTO52p0C9mprbR5Fxvsz
         Wjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777317869; x=1777922669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RV1aio//lRH6vrC7iKsNXbkY/M33Jc85/wH3A0aXXHE=;
        b=GKe5XlIcUMm7jf0h6wtRdRNCefFBzqX3EJbwaOh6TKkvxqbS0U3OIwtooG73pE4AKS
         8X03bvW6vlCgchSMm2a2gi0qTzBeaLGirNATmJTrXPIWhhRnomt1EjrAmawKzn6J7btL
         C/X46azAt2ad45i0LoOJ+GT2263P7WwrAyhf+ocCNGWUNqSyzKBAd4mzJSTJNTKdsT9L
         oNs8yQgQvPa8jPQbV/cfrTJ+HHKVc/GYRMQ9f8Kvz5KNTEyCUHWM5l6sJrEz0y5CDBXI
         +a86tMgONb5scpHj/bjmbjOLstbQEU4bNHUDovfupGld5hx7t2inu3I1lr9ut0aYIC/k
         UOSA==
X-Forwarded-Encrypted: i=1; AFNElJ+oeW8v6CBF2VXlIO/8+XQnQnAmxV7tbjc2Sj96gzugQAVIfghQ9QmKhsKRzbZea1WTwuew52kemQn7@lists.linux.dev
X-Gm-Message-State: AOJu0YzI+BkSNNI0e4EOaY7eABj1Z/uguq2r05UOJqnIk+qrZWVmASOL
	B29nUYtTg30vQRauKkmrEyVfEQQOwxO83iEqa/v2QUoDvuER6whTGkmUl0b59YUl
X-Gm-Gg: AeBDievJV/HU1MhKM4qxk2nmGMgKq+asUtIaM6E+nPZIrKnYgqHtoyuPTDwwrtIj5g0
	pGg9+KBJwgTE+8q99nmd3JmFyxCTDiMo3sFNo0/Rcx8PQmEmMaNebj/yqcz3Sqsdyj+f2rdq8lM
	qNBBC1LGjBREI2c2vhoCp8WiEcwY0x0BAGZYAndz0QEGnxxngJ6ZU5YcCEd1OQNTo8Isouf8EJa
	2+sxwt7OxPvCdrFPprjkpdxYR4k4giAZOULbchhidx2f/FHzo+NF9YKOZrsG6PgMYKwCptCALbj
	ipOEYH8MyHv+PbsnEGBQ3grZt8KTlyWeghUJ/hFaTAmE+lIoil13FfeusYUv5yFvgApN7kmckIX
	iqafX8ePeMOoWVW6W0iz8wLkKA40c9uESr3FgxnvjXlqFKqNQ+3CzE6ws6fyp8OdEwFySbTU/P+
	s8vxC1tYORWg/2njYsyfarExUQ7ZkQjB7DDQ9lekVysNH+M85hjXfCJC7AtF5Rcw0Du4eTzzTD6
	HgZlyrA74MjaJRjPmLc8UuHYnk5rFkd2NdvBHI=
X-Received: by 2002:a05:6402:8cf:b0:66a:8002:fe17 with SMTP id 4fb4d7f45d1cf-679b670fc2emr230141a12.13.1777317868371;
        Mon, 27 Apr 2026 12:24:28 -0700 (PDT)
Received: from localhost (2001-1c00-570d-ee00-b693-672b-1361-8711.cable.dynamic.v6.ziggo.nl. [2001:1c00:570d:ee00:b693:672b:1361:8711])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b68523f3sm69374a12.20.2026.04.27.12.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 12:24:27 -0700 (PDT)
Date: Mon, 27 Apr 2026 21:24:26 +0200
From: Amir Goldstein <amir73il@gmail.com>
To: Matan Cohen <matan@matanco.space>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: Re: [PATCH] fuse: expose backing files in the daemon's fd table
Message-ID: <ae-36oamXRxbGbbj@amir-ThinkPad-T480>
References: <20260424144553.6241-1-matan@matanco.space>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424144553.6241-1-matan@matanco.space>

[removing irrelevant lists]

Hi Matan!

On Fri, Apr 24, 2026 at 02:45:53PM +0000, Matan Cohen wrote:
> FUSE passthrough backing files are currently not installed in the
> daemon's fd table, making them invisible to lsof(8) and /proc/<pid>/fd.
> This complicates debugging and is the reason passthrough currently
> requires CAP_SYS_ADMIN.
> 
> Install each backing file into the daemon's fd table on BACKING_OPEN
> and close it on BACKING_CLOSE.  Add an fd field to struct fuse_backing
> to carry the installed fd number.
> 
> BACKING_CLOSE always runs in the daemon's ioctl context, so close_fd()
> targets the correct fd table directly.
> 
> To handle fds that remain open at connection teardown (e.g. on umount
> or connection abort without an explicit BACKING_CLOSE), store a
> reference to the daemon's task_struct in fc->daemon_task on the first
> BACKING_OPEN.  During teardown, fuse_backing_files_free() schedules a
> task_work callback on the daemon task that calls close_fd() from the
> daemon's own context.  If the daemon has already exited (task_work_add
> returns -ESRCH), its fd table was already cleaned up on exit.
> 

I am sorry but both the approach and the implementation are wrong for
several different reasons, so I will not start to list them.

Please follow this discussion:
https://lore.kernel.org/linux-fsdevel/CAJfpegvaCTxS_wC6EGFfh3Gim5DEgOtuju=_=qCsouzkCRvJog@mail.gmail.com/

It does not end with a definite decision on the best way to export
backing files to lsof, but it does pave the general direction the
the solution should take.

> This is a prerequisite for relaxing the CAP_SYS_ADMIN requirement on
> FUSE passthrough; a follow-up patch will drop the capability check now
> that backing fds are accountable via /proc/<pid>/fd.

This is one prerequisite, not all of them.
See "Resource Accounting and Visibility" section in
Documentation/filesystems/fuse/fuse-passthrough.rst

Please CC me and the new fuse-devel list on future attempts to address
this issue.  There is no need to CC LKML and selftest maintainers.

Thanks,
Amir.

