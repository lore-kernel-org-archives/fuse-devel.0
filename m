Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCC03A6EF7
	for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 20:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778531878; cv=pass; b=gNYdfVesvtLPYqh65d3LcPeVM2ocaIvvK381xFDo2kME8749DkzwzBPgmV/4AffDhQUy1PSDKNeHVfLmLt8sjGyI3m3baBLGBzUjBy4EwFpmKVaMTKI1aOK7oQLnzuZvEq2zbg4k52Ee/xRsYJ0DrFJAQwLxswFM5wqauIBUrrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778531878; c=relaxed/simple;
	bh=zsZZjtc4hz8nOa5USZRyCkSCNh2FgQJnOd92qOHizOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXexvpbMjGun5mRz1m7O3VnT4wC6g/LuxrEdZJW417/ZwQhBrlKOCxFkIxRbV27I9yzabQbaXUd7pOHvPWrhEZ5+KT3F44Wyvf/BB+YnhtKMWZ16AYgYEQuB0vSDTlXIdcnrHIFTMmGWNovk3HO6gho5PEq7/z+Va8GT4bv9Vw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5qS88RU; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5qS88RU"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67929ff6dbfso7288557a12.2
        for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 13:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778531873; cv=none;
        d=google.com; s=arc-20240605;
        b=QBoYA66fAZqXvdG5jwvqkgtVzTozChQbTH6Baw5tFnnZN8xpVIut4D84nIqRk/bi92
         PKpOWLRKzHTxol0oe0F03v/6f7hG2U9an71Njc65E3Yb3UW2eeFJk3z53jCYq6rERWnY
         2GZTkzW55heWZ/qdLbIxnfu/Huz51YVzZBFKIS2vnRyhCyKneie1unk3yrarb+OkpLBn
         EJrDZTKh9VlwQQhW2DLwvNRRPWNvhbRIH/DgY0St5m8ZsGa6UcXPa7zK3wO56mY+0KMU
         l9Aa2NIG0MsvN9y0LA5+iFgofoFOoKG85nAkabJpPI6snxvdrL+KAu/LP4Qfdz/bFm1h
         jqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ymGR6BFMyc1wUyeKUdZg9Z9HwluROuscsoD+J1kunQ=;
        fh=hqW6wdt4aUL5Bu1Zas4HdeZGTQ8IPrh33mCxhon+sVg=;
        b=cdiomypTPscPKj75MYCwTOW254Ky418+SAslycUkgkezNJ4LKH5B6fAhQy5iZP5TTC
         E+r3OZULHrLzyHzUfH6BwTm5qwZb910uk/TJXG5V4X9MexDGaDLSHU+82SqmpszId55m
         iLk8S3XdeX9iHWwFFV3TAYDGMkr8CNszAxih7+iqamFSRPsK5vpbAPxHJeTBkYy7tLBp
         WtFkivhqF7GT5hmCtAcgfxozukfaXqHJ/tJSCJbPqc2ev2bR0ENAPixZ12LttwQN4QNI
         nYnAYdzoPusHEjVc77I40O8UcDNfj5IsZMSpOIxaHTARVSY7dg7UzD/MRCNHKfCZpCKH
         9Ynw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778531873; x=1779136673; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ymGR6BFMyc1wUyeKUdZg9Z9HwluROuscsoD+J1kunQ=;
        b=b5qS88RU1QTcwY1cRez/l+aOw2R1kzeehvvDRMrkGycCWb3afJq3+gnv69LMf+wWWQ
         hMdRJS1Zsq9piPLC+5P/RGnDBD1VdDOdqjvpRYDgCyyG/1a2htKYh0OhK1OXCBAGO6Ay
         Ao99endBueXW+I4S/+jl3KrShLlykfljACwPG4+qgHzgg7bH7MQ3WJ9rEqTOmc59rLQV
         d8BW8S068t6HhQi5K88XiUU7AKi38XuaqAs41KHYAk8KEujTUkrxSW/6grWxgA1l+3pu
         ZqwechVaU3XZRH4JzwIfsYjRKCtvOzzVcdkD0ps/S4CvqK2T1XzQ5QXZ7njlsoKMQU/w
         bSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778531873; x=1779136673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ymGR6BFMyc1wUyeKUdZg9Z9HwluROuscsoD+J1kunQ=;
        b=GB92kL/tfGv/0HUsy3RjYKYNqy7gqt4Q6MnY0lpgx62QsXWA6iCruOHSwx0NA/fOrZ
         4zW4wqPin5oS8AhKVOgdIoJX5Bv/rLJjh8apTEjTYT1P38pP2up4siapnQKFN6Skx3SI
         fqQFXU3hSTmkNe6Ww7kBaL3O1vJSS6jXgGoZnwDorKCq7PIhSQWRkph2lKLauoflNyCY
         94t+BlRhZgptrCDy/nh1gVTyUF6IMotdwUqu8rRsxwLj1cQx609stYly8szvEhr9oZO3
         DJo7yx1f4I9iGhM3OhQPOl8f0SmQZ2icALeEbFApdwrRY8bt8vF7XeM1WgGEStfG8mTL
         XFng==
X-Forwarded-Encrypted: i=1; AFNElJ+u9QkKDKtz0BDEE7qSLI2Uw2fNdSQs2yBITe17jxW/8d6A0YmSNx0CfjqTJ6DTqLmmwCcYcWJJBT7M@lists.linux.dev
X-Gm-Message-State: AOJu0YwIgG3SZ3ZJhR3lWNvktfidDsrBU5LXbWJYtwGfm++ADYiKvn5b
	JyVWOcIxY/TLCZfc6abzcWQVDFxyReF7HZz3CF06YYJu7aCMGAaKW5UcDn8YMJA2EA4tQh1g+Si
	jeqBGtqKaSMKLbOyoSz4dN9x07uq3Eg67LcVFMKs=
X-Gm-Gg: Acq92OGemZOWJhVQRGp2uwdselqirLrnfI2QKADXHx6PYFDmE/ooH+QWc1yYFb1T9Jj
	UJMPJCffzvg64XeGWpBSRTExFSMfHs+VuQfm+3fQmCWpV7D5rizDDE0JNPQsBGDCa+eZtXoiP1g
	GyzubXd6d0WZzvLxGXX4/Y0YLIe3Yq56orv/XQXLvFdpIjR2sjmJcjP0lpxGTlUhgYH1ueJzJBw
	Q4Q0OegsHTtIENU2jKBxRsN/cO8ytro0VcfB2SOeRYP/ztFqfTMXxGQz9aNwdvMFPrGq7QkiwGR
	Rlbh53AeHSPkyaRBxZsZkVmb72F9oCx+YCcKuRm4
X-Received: by 2002:a05:6402:782:b0:672:64b:c97b with SMTP id
 4fb4d7f45d1cf-67d648b4214mr9821907a12.26.1778531872789; Mon, 11 May 2026
 13:37:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511123837.64930-1-mszeredi@redhat.com> <CAJnrk1bmhY5+9H=WETv+gWDvpTEy2wccu1uZMVjb2rY50bFwPA@mail.gmail.com>
In-Reply-To: <CAJnrk1bmhY5+9H=WETv+gWDvpTEy2wccu1uZMVjb2rY50bFwPA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 11 May 2026 22:37:40 +0200
X-Gm-Features: AVHnY4IHZ7sEBtaDpOdvYcfkZPRykKT-otaLCtV78ytV-DmZsauKIgWE5iQtF40
Message-ID: <CAOQ4uxjoc20BNScA1aa4k-kaWYFx=8DR9je7yjd_oo94aPskwA@mail.gmail.com>
Subject: Re: [PATCH] fuse: expand MAINTAINERS with subsystem info, update
 mailing list
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	"Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 8:15=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Mon, May 11, 2026 at 5:38=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.c=
om> wrote:
> >
> > - Bernd and Joanne are maintainers for fuse-uring
> > - Amir is maintainer for passthrough
> > - mailing list is now officially <fuse-devel@lists.linux.dev>
> > - change status of fuse-core to be "Supported"
> >
> > Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> > ---
> > [this time to mailing list as well]
> >
> >  MAINTAINERS | 26 +++++++++++++++++++++++---
> >  1 file changed, 23 insertions(+), 3 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2fb1c75afd16..6e3da76e4cb1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10574,10 +10574,10 @@ L:    netdev@vger.kernel.org
> >  S:     Maintained
> >  F:     drivers/net/ethernet/fungible/
> >
> > -FUSE: FILESYSTEM IN USERSPACE
> > +FUSE FILESYSTEM [CORE]
> >  M:     Miklos Szeredi <miklos@szeredi.hu>
> > -L:     linux-fsdevel@vger.kernel.org
> > -S:     Maintained
> > +L:     fuse-devel@lists.linux.dev
> > +S:     Supported
> >  W:     https://github.com/libfuse/
> >  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse=
.git
> >  F:     Documentation/filesystems/fuse/*
> > @@ -10585,6 +10585,26 @@ F:     fs/fuse/
> >  F:     include/uapi/linux/fuse.h
> >  F:     tools/testing/selftests/filesystems/fuse/
> >
> > +FUSE FILESYSTEM [IO-URING]
> > +M:     Bernd Schubert <bernd@bsbernd.com>
> > +M:     Joanne Koong <joannelkoong@gmail.com>
> > +L:     fuse-devel@lists.linux.dev
> > +S:     Maintained
> > +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse=
.git
> > +F:     Documentation/filesystems/fuse/fuse-io-uring.rst
> > +F:     fs/fuse/dev_uring.c
> > +F:     fs/fuse/dev_uring_i.h
> > +
> > +FUSE FILESYSTEM [PASSTHROUGH]
> > +M:     Amir Goldstein <amir73il@gmail.com>
> > +L:     fuse-devel@lists.linux.dev
> > +S:     Maintained
> > +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse=
.git
> > +F:     Documentation/filesystems/fuse/fuse-passthrough.rst
> > +F:     fs/fuse/backing.c
> > +F:     fs/fuse/iomode.c
> > +F:     fs/fuse/passthrough.c
> > +

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.
