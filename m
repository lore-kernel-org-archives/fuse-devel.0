Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12091392C39
	for <fuse-devel@lists.linux.dev>; Thu,  3 Sep 2026 06:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788415350; cv=pass; b=j9VGQQJLAQYhtB/2uLb2dpMcZMcvsL4FLLIqVMiTqtOqZJCqfxmU0m1MMKXwJ8yNfDVxnRDaYZ7DSwOeZNRZWphHAb0BqG8OvypMwuh5WuKmSZ35xoI+JPkJyZ49xhCG2kL2tRL6BvHUym0S+ADwWb2QTTQZgWCBNmF0b5/lcY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788415350; c=relaxed/simple;
	bh=MqCVsIXApH5rSZl9riM2RDiGAEQhKGYbfZVh9vQvGRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezwiVz5GHXrhVQqrXlOkl1emlrCiYbhtZmcS3+co9eQ+IipEhl+FjpU19VDaXdbRwjdqZbEtrHGMgE8PviQ5uBlSiY1czyVMzLorxQkYySlZ7+DKHIMS3UviW2v7uPGfVX6s0DKRx7T4BJagmxAt/AlniqT+i/kbZzMaKsKE6Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=o8N6TQx0; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="o8N6TQx0"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52e2d1bdbc0so13983431cf.0
        for <fuse-devel@lists.linux.dev>; Wed, 02 Sep 2026 23:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788415346; cv=none;
        d=google.com; s=arc-20260327;
        b=MuiLnCo3P/sY7Q8bJ07m5r0IRtPom3jjEwQtDadMIZLK/aCj5EDzsmMiO0pFRHxd+X
         rDCopZyPpa4aVwPe02vPLD3bZR5wVbsnd0iLxVjmSbMbSR9o77NIa/nfvc1f18ta5/8x
         JK1Ga+kCkS/h0kXEOSABZy8V7ReY9CY/65MXq0SOIIt3O2rRKoLWNn3RBkK9u68+9kkc
         nZTA+d6OVIUvV8GpxteeNtEM7NfuGDa+5yATbs8NgPDeTo69t4Qpi1PJ0NvduBdPmHlr
         N0uiVoeE/Rne2qMY2ao0BmItl/p14XTcmA3oJFTE0BY6Nj1JpFaloCQI09/gktcN+O15
         4HWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1yu7nHtD7hEUEB0dyUurj+KKcQHD9tfZrm0XNASdrI=;
        fh=PckpVpHu5LlqdIGDMWJBnqQ5EINgEsaSx2kKegDM5Gk=;
        b=WC4d4izzyumyszu+gGfH/kvaCdK6Y6nocsC/r3SHMllXsGubAppeBQVs3cFi4Mu+EL
         k7s2KFtXp/TreB0OzdBPc6a8pWphuSNr+0QV242F+FI60siSL32GHnsF3gKLNGNVFzE9
         wRVRDlEoiq+hlK3Ksoypb4LwfMknfyEnwEEML+GuFpv++q2XBnl4foDe9yjQGxECYUhz
         AILQ4EzrT1Usy13LejT4vh2Kn+lgFhHbJyUSyzNR5m2p4rNZwY1u0Pv0pgwv0I4pVozP
         sRzT4Hip5zqOK7MTzQxnas32IGcXS4c1aSSBgKImNAIFsojhXjlbAQ/ZvkoQe/6tjh9m
         Qywg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1788415346; x=1789020146; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1yu7nHtD7hEUEB0dyUurj+KKcQHD9tfZrm0XNASdrI=;
        b=o8N6TQx0i0FInrtvG/9PFjFTzoYVeJtEPk8lHkyxDGdPNSt6evzddtCc7uLeiJvD0W
         MVV4dMJtCpk1erTOFSPztIva1QdnXSbs9P3JsKxMpR/XiNEI1BttertzyYAIh2fdzo8Z
         X02E5k7n/s9y2gqAnKh4Ey1pAngDHyiGBwT4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788415346; x=1789020146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1yu7nHtD7hEUEB0dyUurj+KKcQHD9tfZrm0XNASdrI=;
        b=BI0LvzSeV1tf+fWaDN0JJGdhEuhRRxJ10sjpFmTez2OIehuSZj2Oh8MxiH4zCwuQbN
         gDVXK78DTharjOL51TSBQWo8Oef0WuLoxesk+IF689m8XxXABTCmkNJOdajisiuvQnT9
         PWPLz8acTZPhYW6xAjPI/saWp+43DNiEK3QaI4BsIemCLWAVGHYN73KeADRM3x6Sm7OL
         /RpWuDXWf24Ebcx/USU9bIMxK8OtfDBFIDU7GiB39JjlkDllnHACnAaez7JPXxAQ/hBm
         eBWG5+uID3O8iqufpElgc5r1u8DlDmsHgywweFnq6JTpr2UMa3+TBVDMxgNZqDC9XDfI
         zblA==
X-Forwarded-Encrypted: i=1; AKwUvBx/E6k1WAzG5J0CTLdONgF8V/W+s2dSkZFuYRETVMAGHOXdjfWxVlLuWnthN/sbOrI2Z60pi3RKdLtr@lists.linux.dev
X-Gm-Message-State: AFuF++loiarfSd4UBRR4y7iRZg+ZC/R2b3HaWJEJbP0RWxuaaceHk3CJ
	E0wfPINFDESsZGH0bOkQj7ZsN/AUEGucT1WA2Yhwlzjlj6zH+Gun9fNWABD+m3P5dE80lU0LhZx
	AOaEKVq5GdWy4ullH/pwd6oglt6XjVF808Wi865jMmg==
X-Gm-Gg: AYBFou0kl4rvteXpjkNFUS2odSP/JSJDVGGlj7HTHzjGFTw56jKvOOQM0Qs0puw2zeY
	KytS6eYeAd5rZ7So3G6SSTnFXfchzbQmp71Qx+e1M0g5UZdYZ+oyiv49bFaHZO6Y+JnLZqICcn0
	o86+6ByM7Wu5SS2MSC5+T/WeRVVkQrgU2OxKz0p6pbDftMa2NJqwH2kX5Tdx6ryL+mYUSnigklS
	eI3E3Nbr79UIpuOFYR6LAblwkx8d/5kvWytXAf2CY99ds0sJdcDIt5VAuYsN2B3ANumULkfYSQY
	DIWpj3XwX8g4uQ9mVgC8fwkH2HvJ8ju5L5AJBs8B6lCE/wkXT6LkxAUQVOE7W20conxIuwBjMnp
	2NPvWMgw830ouOpcR8BVLZAV4bPKBkXYUKA==
X-Received: by 2002:a05:622a:350:b0:52d:ca81:e5b2 with SMTP id
 d75a77b69052e-53036b92bdfmr107966781cf.5.1788415346430; Wed, 02 Sep 2026
 23:02:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901213412.1763253-1-changyuanl@google.com>
 <CAJfpegtWYP-q82428iHd9gOBkAmoB=mgfGZRs3oi2FiAm3W-yA@mail.gmail.com> <CACGdZYK7wk0fMz7v7K_HSBfJvOYRmpWvaeNF8fBfU=j041gYuA@mail.gmail.com>
In-Reply-To: <CACGdZYK7wk0fMz7v7K_HSBfJvOYRmpWvaeNF8fBfU=j041gYuA@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 3 Sep 2026 08:02:04 +0200
X-Gm-Features: AcwNN1XVuV6dMjB2XnXfKHVLJna_Qp6Z527eNokz21zXxuW9nXlLJkU0cPkN91g
Message-ID: <CAJfpegsWp-s1v62mwhafAsGPXsP_aEPTgG_FoOLHVmNeWtevHw@mail.gmail.com>
Subject: Re: [RFC] Handling 0-sized pseudo-files (cgroupfs/sysfs/procfs) in
 virtiofs and FUSE
To: Khazhy Kumykov <khazhy@chromium.org>
Cc: Changyuan Lyu <changyuanl@google.com>, fuse-devel@lists.linux.dev, 
	virtio-fs@lists.linux.dev, peternewman@google.com, 
	German Maglione <gmaglione@redhat.com>, Hanna Czenczek <hreitz@redhat.com>, posk@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Sept 2026 at 21:35, Khazhy Kumykov <khazhy@chromium.org> wrote:
>
> On Wed, Sep 2, 2026 at 12:46=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu=
> wrote:
> >
> > On Tue, 1 Sept 2026 at 23:34, Changyuan Lyu <changyuanl@google.com> wro=
te:
> >
> > > 1. For virtiofsd: Does the automatic detection of pseudo-filesystems =
via
> > >    fstatfs magic match upstream expectations, or would upstream prefe=
r an
> > >    explicit configuration option (such as per-path cache policies)?
> >
> > Why not just set "--cache never" for the pseudo fs export?
>
> Enabling caching does give a pretty noticeable performance improvement
> for those files that can be cached, and we'd like to have just a
> single export instead of setting up multiple and assembling it
> piecemeal. (To this end we do have an out-of-tree extension to the
> virtiofsd-rs passthrough module to allow changing caching duration on
> a per file basis as the protocol allows..., been meaning to start a
> thread if folks are interested in this since it has proven somewhat
> useful for us now).
>
> But I felt having first class support for this felt more "right" -
> enabling caching shouldn't break reading of certain files, and the
> server is in a position to know if a file would support this or not.

I'm fine with this.  But virtiofsd maintainers will have to make a
decision about merging or not merging this feature.

One idea that occurs to me is that the kernel is in a much better
position to give a hint:

 - file is normal: POSIX semantics apply
 - file is pseudo; POSIX semantics don't apply

The "normal" category could also be split into:

 - file is local: changes always generate fanotify events
 - file is remote: changes do not always generate fanotify events

Thanks,
Miklos
