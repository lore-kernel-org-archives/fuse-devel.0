Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2723290D2
	for <fuse-devel@lists.linux.dev>; Fri, 21 Aug 2026 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329277; cv=pass; b=e1n65ROuVo4S92DNHg7pi8D2uP7EG4pzw3bNqH0k/3GY3HMpFZ3LXC+yQHGOpAYtcQmv+MlNUgafa3RWW3Z/ojrob0iAN3QuiPXWu4O3hD6CyBdqnARE8mnZ7OClLvzHTS1Y665DPxRyQ8fApS6W/SQZEyjO/2XdSLEgWvAmiE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329277; c=relaxed/simple;
	bh=4Fv3YLgfqFB4xMcyVps8htWqIR9LU00sYfuz4ZAAk4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dq1hn6FKrieyCmUxpCQdHU3YyzdaNQJTTGuInEqeaqupr3RJszfaXgEedPUWt03FHW+tUr5ZhPCQCabASGXJ0SOKEygnqEwNqF5Im7J0g72KhPmiPjxTcHDiwV3yPr0PiWqOq+5M20spHRttzwbEptZRADy4ntCmZdJNxgmp7hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=MI/p1Jbh; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="MI/p1Jbh"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5276d598b96so6119031cf.3
        for <fuse-devel@lists.linux.dev>; Fri, 21 Aug 2026 09:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787329275; cv=none;
        d=google.com; s=arc-20260327;
        b=Bh4Bddbe+aoKroi1kc59Qfx0US7cE9EXZLfB9XlOjrKNGbHQAaWfWBuQpMz6JR4Foh
         hqqZZQDRT5/hEiSOKzLhxRgnMs+/5MGBFftrGbREoL0qse+X76gsks45zZbwrqPYBO9j
         7yjHwUXsdr5s6+oMYTiqVHhLGuzxCFdR1p0u16QbAyW6CassKRQhM4WAhQp7Ui8/Hs+U
         hL3imKyHi/EVZ0giw+1b4+rNDGeUPcP7Gd8sS1yXgooFA1D8H1aYLFlGPblCwzMhFPoq
         xJffv0RtWNNyOX29OQMSN6zRglDUgdE1TQKc7YzQD5mp6lUKOzvMRHX2hvb6zXsYIfqT
         CNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EIsN5rKzbFhicm7vK6ZvsuC9whEPX4hvy3159fOEQI4=;
        fh=h8qFK751vS4e2IA+uZnUJnf5BXcMu8NLy0l0QptwgNU=;
        b=EkPzPd3XFYQKoFvRZAsB8OTgE2XGUThwmyvitrktRlayLbG+L6u8WCg/Bld0XK+n4p
         Ii+J3Ybh5nIwpKnJfkaobQ0AFKC2YXnTPB653+m3gwqWHj0YttUIqKOSfbh+MdeMU5co
         c5T0A8tVx4+F9Cvy/Mgv9UgGaO/beyr8wD1Qou5l1baQ8NXdRluQ5s1sgwmbePhLklwZ
         In9RSZRUYwA9MFi69vABzTBoV6RLuChfzzRQvHtY5yG/7gUJV4C10zCKXawKWnOeBg1S
         TUu4BSa83ory4n5PfXPaCOilwJqEi/NIIlWN1Q4FeGiCdcYsvVrgs/BATvmrGkewC0Xw
         NYVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787329275; x=1787934075; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EIsN5rKzbFhicm7vK6ZvsuC9whEPX4hvy3159fOEQI4=;
        b=MI/p1JbhFXkHOLooo6eVP+yfn0Pog1iAwaZNm8646xqijjt6OH95Gzni92Iq34hk3J
         rOi2xSAdaGFpq2wtA2rhN+DtYjbHdMiyU4ErmN89qdKkLbOoRdAOjuyu/Up64Ne86SaX
         swBdID4Lf9n4IsAQZ4z82ju9T+6Lq8U0LZEi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329275; x=1787934075;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EIsN5rKzbFhicm7vK6ZvsuC9whEPX4hvy3159fOEQI4=;
        b=RDdabGbZ7Jp4vG1GE8tnCNsEkNB4RgmJcGuxAopcTlzmCd2TGNpaRBX89UeWY/eTMA
         EhuOMakt8PAYMD9qYJztRDW9yZzdPuInDBjPI9Y+GTtw0B9yLvUJUoTB3Uysan7VUaZL
         UkT8iAmXrHUkRDUBinjWtMIjN1E7oAoOwPATp44r47vmPhbXul3R7RnSfizwikihLmzM
         1JaxIJyshCagPIOxqhT+zruflrPdBOPFU9MGFuW7sGplXfSGGd4zLGlBKy9O4NSOKHeI
         a8Jx4r2F7qqlkUcOM0jxK4TRv7Ek/5VMHQ9ww/pI6JoKfG3MUj5V88MzDyGCAnMOgQlV
         EA8w==
X-Forwarded-Encrypted: i=1; AHgh+RpcKg571Qyx+jldZG/QmO6Jfuhuz+Us0D5751QFK089zZp/ve86+Ex0xwg3veK/VISXtigr/s5unS/S@lists.linux.dev
X-Gm-Message-State: AOJu0YyF0MoZBfCruYnIG6LbwQIR18sIDlKA3FZDXlBexdjcbD/ypSuL
	Qlgl+pePxTAZVc5GJeqtCjdx6Sk5OGInScIn5XyEeWgI2Oh+9TqIs1mUFTffIkdo36QYCiQybty
	63713FJEjnU5VuXKxUk7UN9rlzGK1dd/4lkFlhXvp/w==
X-Gm-Gg: AR+sD12ng2JprQ4aN3KGzkDrJmm/noV5PY6dCQrP7N1AEwKEzLRwdAh06xgIz8vlktz
	H91Ir6N5sMjoJvhKR5HJTb+OGhNgHME2N+WL1PJ8aO/27TNYllNTx8ZjoYrYqp42PbRY+iY9iVO
	yR/nEEMbZfdgLGFk6Sp8WqXlW6lgMz7AiqgTiF/cwlGH0IKS3Km+DrnmwirYwTmFrFYL6bfuVF7
	1Cm+WSbwxF3RaEzQINiFlanlhL+fhlQoJhRbjook+uh5bZX9mnTuNxF8u2jGdLHl411JqV6cFDl
	3fxBPLz3TVWWaZhmRrufQAGk7tR4+f1tSbEJxPwAUpUZeVuGBfmAVxylB6P690snxrX/lj1BIqG
	1PUdNo92k+QXd
X-Received: by 2002:a05:622a:c85:b0:527:f4d0:4bb8 with SMTP id
 d75a77b69052e-52df5a3285cmr73316191cf.22.1787329274626; Fri, 21 Aug 2026
 09:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820084933.GA4036497@noisy.programming.kicks-ass.net>
 <aobDGgivy43cz7xQ@google.com> <20260820091018.GA4120091@noisy.programming.kicks-ass.net>
 <aobGRjc7SE1rwIHu@google.com> <20260820093402.GB1837346@noisy.programming.kicks-ass.net>
 <aobKfyGHkdMcleoc@google.com> <20260820104111.GC1837346@noisy.programming.kicks-ass.net>
 <CAJfpegsSzOqs1zkhB9GZxsT5HT1zXDbHsZNEbA7P7mxe0w2dng@mail.gmail.com>
 <20260821083000.GF687043@noisy.programming.kicks-ass.net> <CAJfpegvRw0Emd=2hsEeg3AvYaLgRBUbMdo-=eUMa3FRFfnetgA@mail.gmail.com>
 <20260821145752.GG687043@noisy.programming.kicks-ass.net>
In-Reply-To: <20260821145752.GG687043@noisy.programming.kicks-ass.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 21 Aug 2026 18:21:03 +0200
X-Gm-Features: AcwNN1XIGk29rOsZySV5Qx_mWnay4f675UKPGMfF70APbIOxK_wUlQlG-iEgkZA
Message-ID: <CAJfpegtv6=40SEsbeVU3RpmjwZSY-FLvCg7mcxf6k7djFZrPHA@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: permit freezing while waiting for request answer
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 16:57, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Aug 21, 2026 at 04:33:57PM +0200, Miklos Szeredi wrote:

> I suppose I'm not at all sure how it would differ from having
> mutex_lock_freezable(), or how it would help in this situation.

This patch allows freezing with VFS locks held.  That allows freezing
in some cases, but still fails in the contended case.  To fix the
contended case we need to allow VFS locks to be freezable also.    We
could just replace inode_lock() implementation with a freezable
variant, and that would work for fuse.  For other filesystems, it
would could break the freezer due to various locking contexts.

My idea was to make VFS level locks (i_rwsem, s_vfs_rename_mutex)
optionally freezable.  By optionally I mean normally not freezable,
but certain filesystems (fuse, nfs, cifs) could make them freezable on
initialization.

Adding mutex_lock_freezable() and moving this logic into the vfs would
mean that both fastpath and slowpath get the branch, which probably
doesn't matter in practice, but doing it only in the slowpath is
nicer.

> Anyway, I suppose that in this case the fuse server is responsible to
> communicate this dependency to the kernel -- or the sshfs fuse server
> should use libssh and embed the ssh client inside itself, instead of
> using pipes, dunno.

Quoting you upthread:
"Also, you'd be putting suspend success in the hands of userspace, that
sounds like a mighty fail right there."

Thanks,
Miklos
