Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC1847ACE4
	for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 16:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787242316; cv=pass; b=lDDVqkyIlFqT1jiG1zxXgtSdFqr5tpEDdams4JkqsYsM2RzrNRiA6Ac26fcQKDHYxqFz5fn8ZkREAJZnS2cXNsezF6LE8HS3NBnWRB1Ki3V4WEGK4JTFOInHr0ceFx4i2XH3nMVnIt05gq9r3Y88t2i6hMQII0itgVijaM/pJE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787242316; c=relaxed/simple;
	bh=wdeJi7X/Q4rgQSfLamGPD1WkYbyFGSOSEOk4sVh7M9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAt5ByWDwHhppNq7a7u8XMjVrS8ncsXTj/CUUJkq+rSmeXO8YxUsDufFjCpedoLbmgahUlNU9Dt2sEQMS8GWc00CTSWyuIm3994vb3NfhhnzJy9bIIfbiQ2Dj29IZ7CNIFeo/NJ4MY/O9J3ETqQCT7SCRfLb4mVJM8w9B4mGzAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=ZEMSHs3D; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="ZEMSHs3D"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c928bf172so16613901cf.3
        for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 09:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787242312; cv=none;
        d=google.com; s=arc-20260327;
        b=nM9rBK9IvdQvL3JCPTqTnB4hHx3GQdIsdK+cBQewkat9RjGQqe6S+qWlI2QUYq640/
         zE/nTJmSb6iU9CAk61sAJbC6R5IS0HtQGNMSFCnQkHOPExJfPUnPUjk5meHAay/7FYVf
         ywO9CuHZRy8kH1DoYjjDtCLlZtqBpMsDYd3wpppHi98qstb9HnnEg8WK7RyXLQePhbFF
         /Rzd70Lpki9076Kfb5obwkquqRQ8IBIy2CXxMpglk03twZydJ6oLdn69vLJkGF4hJLc4
         h95PAc/XZq5T6Pp82mn/SPPRAXO/4LC50OfQ+lY38MzsPkqay7GoCzrVVXH47xWWT5jU
         1J5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ymkU8qd4K4bZB6E/swdK1MBXnSrS5Bp9t+afR5EeVdo=;
        fh=W+Qj9KizOrMFzsxnJyrb6qE3W0GjxXA884roKCAmuSs=;
        b=oYaxmEFzmBqH+B0q3oXkezuCZKiUOgV+5aGjXA6svlMygpH5BwBEVE97iaRuJ+umQI
         Kev296rx1KjvITQQkr3tVYaJkx1DSBk+cIqmqwad2s1LsIiULyOkeYvbEw8Q4wFIOStF
         krXi5qqnejNe1neMFZN6KeKa/mZmFR6es9dBsf2o8kXlzUz5J9RciWzVTb2AA39c9fr6
         0HJYwQ8XKdlvFpopVIH+seVsQ3mLk7Y03A9lXQyoImgkx6drJNGrtrtLhCDCbmkfXa/9
         ukhGNWxW5VgOhk3FS6rwxua4d4m8huNhyRS5TUjgZSiF8mDgoK1Jpp/ZdWmd9B10I16x
         a3Bw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787242312; x=1787847112; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymkU8qd4K4bZB6E/swdK1MBXnSrS5Bp9t+afR5EeVdo=;
        b=ZEMSHs3DE4mai6YYBrpuN3XShE5n78BM7N3XTtMTg2/2/nrIVi9ODGvsfB/tBwV8Po
         HoCVlwPXDB3toi30EjSFlImluITIZifr74s8Lb1KAbJTS7MX9Q9oDu9u9ZdJWFE7EuQx
         yfzxFCm+q/amQaT1JUkWUiuPGbNrQHKaprW0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787242312; x=1787847112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ymkU8qd4K4bZB6E/swdK1MBXnSrS5Bp9t+afR5EeVdo=;
        b=RVFLy0C1+yZzQC4UwmmYyLq3V3wd4UU/Cf8CCOl9FsqTpRC75VbU0mhcU3ChoHQGNa
         dG37I5Rv4HSwphrdyGLmo7L3T/z9oUKF2aseGXZR/z2gtMxUwa8pV3Uv0XtTBDIlVY6b
         lOtRg2w1ipHrzIq/v2Pa82tWNiqp+/Ou3dMAA7t+DLoXmioVpD6bnxog/At/oIlPackA
         Zh8jva4xYSMMf4sb6Yq6BFRI+oRxpqzUCa/GyyuZxTgcldVPOFSTZIiMnympTq8FD7Gt
         miK8rsNy/7Mf73Na+qTQbbF6sLdbuYLgWIFxLzAH1O+WYVp+guUO2jhns3FP2cwsBOv+
         zgrA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0Ypt3yZP7H/4BY5jk77DZwX9XN3cak3PBVGsga0WikOr+ypqpOzUENO7jZF58WfSrEVJGcpIy7OLS@lists.linux.dev
X-Gm-Message-State: AOJu0YyWGZ5GHqBoSYP3yX4py7gWJtugEGhy6oQx4OCw+kEAr/6tqZ6A
	fYlhgGT/uggCDHR/7uVKprbbl91dj4HrzoVVQTMl2g/sqNAtvOcEHJuHpmdCoximRXCDomeIi+X
	brWZIU63ZsDtzjxDZ+iorqzbjyYZsNr4RiO/pTHoOFw==
X-Gm-Gg: AR+sD12wIehtsKo8a/KZiYGbXTXgUFA2HkVkk/WMdphYxFKjotG6INi/BsJ0rN9H3ZS
	78d8I/I2Y+l7qbeer6M1bkeRQS5aus9dwRgKfUcE55VPmfz5E81ms9BnfnGIPTf4IF6451WPgWN
	+sLQisKod6sAVEx4HpzHd+9YZdN4GqQHdKn2XxCzly3wEJB3k7GdM4/oa0ckFvlFFP5kGyXeH8w
	UbP8g6rxpaXWvTGwhZh2mqwoc0xt/enpl0oUocp+9zZlWPcfLF6K1c2M8QzuplraNrsDd7ZK2yv
	qNmOM2uWKJFmz+ON4nYgtxZhXyOo5X5hnloE6P3F5R3wEV3VnCi8eDgB3qT8zR+F8Pd3mvWEE8q
	9
X-Received: by 2002:a05:622a:2447:b0:527:43a:2f31 with SMTP id
 d75a77b69052e-52dd58cf89emr139582711cf.15.1787242311914; Thu, 20 Aug 2026
 09:11:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819023542.561653-1-senozhatsky@chromium.org>
 <CAJfpegu2wOG85R6KSvCwHOuxe2fWczA1KbrFcCZz=ofUch4K=w@mail.gmail.com>
 <20260820084933.GA4036497@noisy.programming.kicks-ass.net>
 <aobDGgivy43cz7xQ@google.com> <20260820091018.GA4120091@noisy.programming.kicks-ass.net>
 <aobGRjc7SE1rwIHu@google.com> <20260820093402.GB1837346@noisy.programming.kicks-ass.net>
 <aobKfyGHkdMcleoc@google.com> <20260820104111.GC1837346@noisy.programming.kicks-ass.net>
In-Reply-To: <20260820104111.GC1837346@noisy.programming.kicks-ass.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 20 Aug 2026 18:11:40 +0200
X-Gm-Features: AcwNN1U8VRCnKe90HOpNZaDIfAjWPtm3XBLjBJ7inxfgMD5QyxcpFAhW03fUODU
Message-ID: <CAJfpegsSzOqs1zkhB9GZxsT5HT1zXDbHsZNEbA7P7mxe0w2dng@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: permit freezing while waiting for request answer
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Aug 2026 at 12:41, Peter Zijlstra <peterz@infradead.org> wrote:

> Also, you'd be putting suspend success in the hands of userspace, that
> sounds like a mighty fail right there.

Freeze ordering is also a hard/impossible problem without the help of
userspace.  One obvious heuristic is if task has a /dev/fuse fd open,
it is a server.  This simple ordering between server and non-server
tasks fails if

 - task X is a server of A, while also doing ops on B

 - task X is server, blocked on task Y which is not a server

What about adding a flag to mutex/rwsem that allows making them
freezable at setup time?  Then fuse fs could set that flag for its
locks (including VFS locks).

Thanks,
Miklos
