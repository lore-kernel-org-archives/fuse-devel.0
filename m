Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF51649A3CC
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593038; cv=pass; b=o1P2DbSKihjz2evjc1XUKEI2FJ6Jw03OA16TPRU4ZdN4mBtYUTMmDeOAvQyf4j9bDzCp6PD734SU0iR3Wn2J8kJuAFkEyISY8pBwgUGZatjHGpio0wTWEjxwRX1bOoWjyr0zIEo5H32B+qa3BhaRpeUQ/KgXxeSjyHIc7J/FDfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593038; c=relaxed/simple;
	bh=wBo0p0y7TBsCMfAM7c54lxbawcAJ1FYPL9ngEz3uRJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgcTQZf9E+pwQpIapZnqVW5aJw4M4LQBRBBSNXsmRRBLBjUwagyOAtq0pEjMnjxW9NmYXfRERI/6Sl7GKzZdGXE83gNlZSArZA6JqkRxPtRalq83BqvNsxpEKSKEGyVqmc25GAaB2hXIH2kFq278iFoboSJ+uNVYTaAyX8PK+3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=lb+2wyAr; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="lb+2wyAr"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530d0d5ae11so35646201cf.0
        for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 03:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790593035; cv=none;
        d=google.com; s=arc-20260327;
        b=S0LMV4xnDEGU/HF3pcVZda7om3cURzTj51GseeA/6ZnXUqU9KdFQMOd3vvHjqEDvhe
         VXbMB7gDsF8hbPLBHfjoIyATUnuLsHnSzxdM0A4/KUJLQsKfRzElYAdDJxQk9tb3NMoe
         wHPq2Saac4HuTEGgKXliqqEdbcfV2nOPJLDcMxGNhnKIayAEcTQ279Yooh7bgr0HYYE0
         /XGKyqzzToSq9qyPeKzDaoPmjzNM6uYTprpCoVXl8+GX6JRt8KiU3Jh5pD0HMZDU8/fl
         Mzl7fPcbhxrSDckLA1pmoMpeDLIgb/9vBoOAiUrrm/+gJ03zJ4qGpGoFuQ2JyL7qpNCf
         ODDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Oc+8vWuJmp/tN9qq+8ZPBR+03C638Q7lrG+r32i3EIU=;
        fh=CTgdzXQW6Do+VwmYfDn3BG6fPeFKe0nsJ79LI+62ss4=;
        b=Pfb6go92T2VA5kVl4C91QF7BakN6gXq2URO7EjLfFbb99Gj9QluL7BkGE2pU96CPAb
         6vZlBMQ0ODv1G5tBXTjWH4gkLpzzTW7xt/IUtdjlFGzn777iqDHMHt0sjtSHa3awSONR
         bWGd+DYKGdRjr/e4NS6CEla97PxYCaY/4p1CsLWJZzWfO7TROfnswshlZja1NH2//fqt
         atLMqAGEVXJGTRWqF746lJxUt15klHf1GYd2zANutfwlgy+AEL/sqY09wleCwK+8U9Jk
         NzDe7yx5OmBlzmxEt+m3tVgFLF+Is592FG0TmRwPZbNQ/TD4qcdrYav7YVWgMEE7COYC
         QpMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1790593035; x=1791197835; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oc+8vWuJmp/tN9qq+8ZPBR+03C638Q7lrG+r32i3EIU=;
        b=lb+2wyArrgVIVoHzj4X8vkXvTOPBOMWIA3pHLwpm2gziJRyy1Mdafvcd8dq2deLb8G
         DdhUopFD4XE09l1GPCBXdIycruSzpm065XH6IiNchZ/vhAahRuKiO/0I5uatn2N5Vjyv
         nxB+5jZZnV40zodGn5ufXD1QELp4gSaUv1Xpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593035; x=1791197835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Oc+8vWuJmp/tN9qq+8ZPBR+03C638Q7lrG+r32i3EIU=;
        b=Z1NMlawaZ0csYOsrV6uKJn/Vut2Y1n+Q63LS/ixkpfvgUMaNi/ikROnIgK/f9M+y8B
         xsYJIIl2a2topLAsfEY5HB60mtRe0DR1WWvA8Dt0hXg+k53bSKm7XKeB52UC3TqN2oLA
         yNULTRnV1TR+FVvwWbcrjR4oC5Li6A67zNBZMynEMrD+8wKu3LjZSYFEQJx9yVayBpob
         yB2c0MJV9P8TqJE890A0yvXiAmqRzf/rQPkPVIT1vAofMMRe5+Ev5oZPGDpeqw9SZ8vc
         2C/XU2fKH57XvgI2mSPOzDrfyQduiG8DD1YuWyoZkGIKbfWnKAXYna9MqCZnvkYu16Et
         TyGA==
X-Forwarded-Encrypted: i=1; AKwUvByga9LtEw0LpW/7BxwH1s/rZo4jgp+nPUYwmFwnW7jOEdcHzGbehqLqJ6W7gesz8Zmxz/DvNomHeljB@lists.linux.dev
X-Gm-Message-State: AFuF++mDK3gDzHupTEyVGpquoVY5MCCdsPsPYHLJOlqOIUUdVUYmrrUt
	SpBmPATlObZTHpWVzy2dsmDI5YufNHmWbixulNZnLmLjkpLwuPs1ACfMtWM4IpVV5++DfxxnmPY
	bfsGxvkgSXMEDxbnySGENkjNv9Hz0+M/sEtKBziPaoQ==
X-Gm-Gg: AYBFou23V8hcXqAbHXWRtsZ/vZl04BuuqH9hdTMrRHLiXVwy4GfBzcNgQ48JwNHYleq
	GARCGFx3qQxjbLuJxC5NIavvermB8DyrgPlzvoMlUWjNbX2Q5RJk7ttQwKLe0BGcLb1VqkgHL0p
	SlP1boRHouUAx1zDJi8dxbq5k9Xi6orhfvpFU47RteMiD7RE8JhTFfiXxs3xq0XHLR3dZGzrIr7
	4BeNbdA5m2xBUmGktmOWHRW9DTZ7FVw2F9qX7oWr6qeAsoWTTBfRKhRntQeS+gk26OgBOcdrXcf
	pOQT2rSl9/lpU3IM0H0gKllrLXEO4foDT8DnTkxwvrl2DAS5k9yFIuLjdGzfZLIZkR4dbSU9Qal
	VuaA941Fn2RTiEA==
X-Received: by 2002:a05:622a:4805:b0:532:aac4:7c5 with SMTP id
 d75a77b69052e-5330b590eadmr214282931cf.16.1790593035680; Mon, 28 Sep 2026
 03:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-6-mszeredi@redhat.com>
 <CAOQ4uxjv1rm+_5rbj0vv3nNSXZxN8TVY8=90qNY4-_25OfDYGg@mail.gmail.com>
In-Reply-To: <CAOQ4uxjv1rm+_5rbj0vv3nNSXZxN8TVY8=90qNY4-_25OfDYGg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 28 Sep 2026 12:57:04 +0200
X-Gm-Features: AclHuK_arG7ENpqvtiiHbXj7on2Km48xJvyTcNMJxQSSSX167iQ7pH9VvtXZR9Y
Message-ID: <CAJfpegtdYfJ0waADMaw4g+o+1WpBESbHPxWsBa8P5rFXuayoRg@mail.gmail.com>
Subject: Re: [PATCH 05/11] fuse: add helpers for EIO return value with kernel message
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	John Groves <john@groves.net>, "Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 11:59, Amir Goldstein <amir73il@gmail.com> wrote:

> > -fail:
> > -       pr_debug("failed to open file in requested io mode (open_flags=0x%x, err=%i).\n",
> > -                ff->open_flags, err);
> > -       /*
> > -        * The file open mode determines the inode io mode.
> > -        * Using incorrect open mode is a server mistake, which results in
> > -        * user visible failure of open() with EIO error.
> > -        */
> > -       return -EIO;
>
> The reason for EIO is not immediately apparent so suggest to move this
> comment up and remove moot err = -EINVAL;

Makes sense.

> > -out:
> > -       pr_debug("%s: backing_id=%d, fb=0x%p, backing_file=0x%p, err=%i\n", __func__,
> > -                backing_id, fb, ff->passthrough, err);
>
> Why remove this pr_debug of the success branch?
> it is used as a debugging trace for the lifetime and usage of backing files.

Restored.

I'm generally not a fan of inline tracing code, as it can be
detrimental to readability.   But I agree that such ad-hoc removal is
not the way to go.

Thanks,
Miklos
