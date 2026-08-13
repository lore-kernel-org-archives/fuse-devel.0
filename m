Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282A22F1FEC
	for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 07:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604487; cv=none; b=hkLuVL7yGfWpla0me2ZYLEu735aHPozMwlkZ4XsYBg22Rfg79Xv9UkT6hKI+jzAuoHY0Z9MtQODJxXtOT7v6waHjQ51jgYMxKI1EhHE/P15R14zQTUQKK6XdrWXA3IprI2ZeSziw/69uQWlWy742lt8tU2BlLAxGIxQjTcYKfzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604487; c=relaxed/simple;
	bh=pJ4bXSHGfm8TbQyOoSBLs6jPz6gU1/UAwnTr/Sicq3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsQtBqOgLX/g5g8ieiX4IRj2DPmmA3Ltkz4Sr8ZPFMFkvhOv3Qof2QkAG3csGEG4cZWb8opFulLvnzCzj8LZjLBRDPdcXvx+Lqv1dk8ygJknpsj6JwMguPE3h1MyE9ejDYAT2to82dFCUNT6lDXXcfgoShXM15VNyjL8E41MsCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CXF44Hkg; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CXF44Hkg"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so508093a91.3
        for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 00:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786604476; x=1787209276; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/+va/p8eCSzFb3xt/YoCSohYQyDiAZvnN1kvdxdc8t8=;
        b=CXF44Hkgbza01JJQioMua1fSGwMjGrsfOv1TU+By1SMT9EZagPk/EY4uV5P42WNhhr
         J9WaEIh4s27jRxGZHFWUTlW0M0lHWSUH0OflRzgp3p8DdOi45+8rb1YfuZD/V68AEesi
         EIjXrc0METAcvfmKqF6rUQoA03KlvD4RVnNSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604476; x=1787209276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+va/p8eCSzFb3xt/YoCSohYQyDiAZvnN1kvdxdc8t8=;
        b=euCIIge+lph5urGLKpeCol/j9e44k8smYLo5JI1SPXrzLfbNM5em2BXCDwmty4ebA/
         gvEOsmIQG9sZWDkdpJHq3sPQ8BALQFZNdLygAbFgwy+O8j652C8O5jMSzCztFt7o8aPr
         HALi0bBqpRAHCmss3d74syusxpdSLXPjEJM/YBo2BqtDLT4dT6L6oclZHfPbVMJ5An2U
         DgVqs3/LMv6pDCYU4fRHbtgs6m3aiYA3ZaOqCNddTopP2SyGUE/MANWxXlaIZ2eZ6g3u
         +gey/ZBf270f9eDPIO4ddSLKfatIBe1BvGek4Bxf+26Vuf//z/rujO7c0nbrvenH9ogI
         7tBA==
X-Gm-Message-State: AOJu0YyHLX6Oof9s+yaO4fgY4i50YOwSSUu+RB20jesBZ2b5hYGlLBCZ
	2Ai877C75Vdnvj5dQqIiF+buCsjxLHVUQs6g2YP+uxa0zXZNPIQe6Wl9KDlYyOr3Kg==
X-Gm-Gg: AR+sD10aCB33FIzRw79Mv8OJajisJ/BecRXa/wUdi3j5fKf+6a895fuhhp4slrKcDav
	ljU3i87fiFr/5aAh5KSW26lkKNi0jApvPA9SsLHz31w7yYqpa8osMm5Lnq7McGDoDbUp1w+zlCN
	5WogPuYMZXWDHFzBb/3K4by21vOrF/ZpH403c0lsQGD8/Apc9VF/BwbJK13ZOgPSPT1Jsl+st9s
	bE5/dVUofvRR98scHRemEaTaNm//wKsEg+Oj90w0xihPqcgK+3gg5JtaARlvmrgPO7xpox1bg58
	7zIeDNr7rW/wpa0GV2KZvjshuOZ8hrfI2bhun+/FBHQb9ftmrbx9skzpjocCWJGpjD+25I5P9js
	3dMZLSuGH/Bn9tFwiDBA+eE7DLrG2FetMp/E0r55OYfHah/rpdV5p3044TdC+4cRAn/Lw6IKLZZ
	Ssk4CpAp4udOkgbYfm22tYwMwMH0v3cJUSszGh7ZwYIoRsXcegLjneszgqBhdsG7w34uhsqKN48
	ASsRGUD+Xv/b55Bg9vFvekAMCB5
X-Received: by 2002:a17:90a:e70d:b0:38e:7268:220d with SMTP id 98e67ed59e1d1-3931e31b7d7mr4571815a91.20.1786604476449;
        Thu, 13 Aug 2026 00:01:16 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:d0c1:aa7f:9c69:12bc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931db13c3bsm671336a91.3.2026.08.13.00.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:01:15 -0700 (PDT)
Date: Thu, 13 Aug 2026 16:01:12 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [RFC PATCH] fuse: permit freezing while waiting for request
 answer
Message-ID: <an1qlV7yYfnznMbU@google.com>
References: <20260812095431.1216919-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812095431.1216919-1-senozhatsky@chromium.org>

On (26/08/12 18:54), Sergey Senozhatsky wrote:
> Suspend freezes tasks in random order and doesn't take into
> consideration producer-consumer dependency that may exist
> between tasks.  One example where this can cause issues is:
> fuse server getting frozen ahead of clients, which then get
> stuck waiting for req answers that never come (the server
> is already frozen):
> 
>  PM: suspend entry (s2idle)
>  Filesystems sync: 0.018 seconds
>  Freezing user space processes
>  Freezing user space processes failed after 20.001 seconds (1 tasks refusing to freeze, wq_busy=0):
>  task:ThreadPoolForeg state:D stack:0     pid:7873  tgid:7854  ppid:7827   flags:0x00004006
>  Call Trace:
>   <TASK>
>   __schedule+0x554/0x1320
>   ? vprintk_emit+0x2a8/0x320
>   schedule+0x5e/0xd0
>   __fuse_simple_request+0x4c8/0x6d0
>   fuse_do_getattr+0x1e9/0x320
>   fuse_update_get_attr+0x362/0x6a0
>   fuse_file_read_iter+0x13a/0x1b0
>   vfs_read+0x29f/0x2f0
>   ksys_read+0x75/0xf0
>   do_syscall_64+0x70/0xf0
> 
> Make all wait-event calls in request_wait_answer() freezer-friendly.
> This uses TASK_FREEZABLE_UNSAFE because often time we freeze holding
> locks (in the upper layers), which triggers debug_locks warning.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  fs/fuse/dev.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 27dafda2a841..9e98ece4143f 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -703,8 +703,10 @@ static void request_wait_answer(struct fuse_req *req)
>  
>  	if (!fch->no_interrupt) {
>  		/* Any signal may interrupt this */
> -		err = wait_event_interruptible(req->waitq,
> -					test_bit(FR_FINISHED, &req->flags));
> +		err = wait_event_state(req->waitq,
> +				       test_bit(FR_FINISHED, &req->flags),
> +				       TASK_INTERRUPTIBLE |
> +				       TASK_FREEZABLE_UNSAFE);

Or I can switch to TASK_FREEZABLE, people probably don't run fuse
under lockdep, and that debug locks warning is WARN_ONCE() and
is not a terminal condition for lockdep.  We landed TASK_FREEZABLE
a while back in fuse_get_req().  Alternatively, I can also switch
fuse_get_req() to TASK_FREEZABLE_UNSAFE.  It sort of exists for
cases like this, on one hand; I understand that adding new
FREEZABLE_UNSAFE users might be problematic on the other hand.

We use fuse on consumer devices (laptops) and suspend is important,
failing suspend is a bad user experience.
