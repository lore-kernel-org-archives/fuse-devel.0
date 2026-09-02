Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD9D4CCDC8
	for <fuse-devel@lists.linux.dev>; Wed,  2 Sep 2026 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377713; cv=none; b=coUHBF2q1T5SRhLdm9/+isXpnczr79Ms72yvhkBHhRfTvPJBS6dCmgx8Vyi7W68GZ8jgCtVS4oIjT7fcepeR4PJRK+FgMBtbvDmLTRfflk5qdf3MUN9B6n3cQnSQGaivQCw7WuxXkkhxQphrcjtU3UPUwtBee2sm2ps5LpacL24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377713; c=relaxed/simple;
	bh=BvdDyPUvlOpdi9wnTRyO+uo5N4XFvGV8H4S7yy3KuIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiBtJynuBcmJZnR+26koofs+fXI3dvyXErQjiFQhUAFssmlT4rE4F2uRAxMVuko+9Eu9my81lGEgg+2LK2uRbw8Kd3f+Oe3N1GJaq2uJA21lMQAy6fODHdI5+Onn+IAiY8zVjPQ9K6lBRugkM/pJgMPPH2LVMoxJcUM8uvfPzuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DS+R64jP; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DS+R64jP"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52fa223df07so13096841cf.3
        for <fuse-devel@lists.linux.dev>; Wed, 02 Sep 2026 12:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788377702; x=1788982502; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZzpxxPA75w/wx7lhKvy8pkZXTVKN6GbmCrT4ENXQUA=;
        b=DS+R64jPIsZNELGcaAECY59L6Gwjgu+BnlhUdtFAsiJFwKiaPV8V8OiWx2NQ6LaNxt
         8gmiYbto80yn0lo6z14rJ7a9ySzJtsHv7LZejz5rf109HdWKef01VhUOk13d4D7uteFp
         VohEk0sakBSsfRA8YW47FHzO6vnqGpq5+LpRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377702; x=1788982502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZzpxxPA75w/wx7lhKvy8pkZXTVKN6GbmCrT4ENXQUA=;
        b=CUx57/ugidivsgcddK8/J9lJUEsMs/WK2V+fC5d5mb4e0CGzhEYAk3WocIVAZFyZDc
         wmGQ8kliuhfLylBeI8l7GGWEsIIxEjbH7jWyIvDI90tmLXJeOC5QQn4NS/KCgRIWyQGS
         uWGRCvBXzjCNo+aO0fsUirly+d6NK4ed554K+Y3GsetJyq1Pe5C41l792Jh1s1kyfYUX
         Jjw+iQl7dZ7OmlAtWmg/ms1MeejEfOBwIDOriZPIENra2vg218RK28HFqmXSklqY8DER
         xnHdOYI+tZEZbSnF99Ub5r+yfvhgT4n5lrrw82DJe2TStJaVcviXDofWYu4wGAi5OFpb
         knVA==
X-Forwarded-Encrypted: i=1; AKwUvBwTAZ1uX+6JKQkLzcAcdtSQFiVZvS8DkhfytgZoOFcoBN0zyPus7GGrGoERTDuquBboK+adVud5y+k5@lists.linux.dev
X-Gm-Message-State: AFuF++nLfHEeBNG72A7jm5wn1G4KUZ1Y5b59sZy7hUsd8JQyr+mQgKAx
	L4Lw+ecTKZEvuOMCfFEzK09V/esVd2W7QDChp4UjZTMk5Go/8S1uGcdymzge+xLnnvDgbU5Q2ls
	ueLTDQg==
X-Gm-Gg: AYBFou0PG4Sx0Vn1ne6brtZDTLeNoU02N2zK2TiD+sl+lRDxpuT6duE6W8MYR1Z8EWt
	vo/7u74or+YXIukc39GL1O1iYgeoDRf1w3Gbv+i68xTzRTV1h975ix/XrR4yVW5fxDEtBPgejqB
	P99yRG/F5OnxhpXIvf772hO0Krha1k4PTq+aqJd5jQgXsaAwSLiAWcqPOvRnHeyPUG25KCoGAsG
	vyFHfxpdgmcbdCbx/KI51n160qMaC3sy67i+XuCGoUFk4Pkaqc5YRnJYqRHKlqari5SpXSHCHkO
	simCuzY3uhccYzLi9uEBkHMiqY3bX/DI9jHoimRcGRB+mdVQvuRxLKXdglZrSivm37YK5z6kr2x
	cgUnoVcb+jlQyPBPlMsBLAeZ7OdqQ6IRzqihneiXnLouI83V0X6p7fhoCHAB3qbcaLRfL1M5+YP
	6kFame/s0xCmyPrlHH6AxpHB7ebd0L5GcfUnIYlzX5wV/r7KH3BmByWCXyFjHE4/YJr85yZky/r
	eH/ltG45C5IMDRaC5fOh3yqug==
X-Received: by 2002:ac8:7d93:0:b0:517:92a6:fcd5 with SMTP id d75a77b69052e-53036c4218fmr90456461cf.18.1788377702170;
        Wed, 02 Sep 2026 12:35:02 -0700 (PDT)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com. [74.125.230.204])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec71c5sm25513956d6.32.2026.09.02.12.35.01
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 12:35:01 -0700 (PDT)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so160261cf.0
        for <fuse-devel@lists.linux.dev>; Wed, 02 Sep 2026 12:35:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwwW3qzD0PTjzSdQo5iJp/sOV2GaJVVIba1NgM1IMpqe29KtYSt1zHXO7cAmsckjBzV7c8Bo+HD7z7y@lists.linux.dev
X-Received: by 2002:a05:622a:22a1:b0:52e:2243:6292 with SMTP id
 d75a77b69052e-53043cb05d3mr3477651cf.2.1788377700377; Wed, 02 Sep 2026
 12:35:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901213412.1763253-1-changyuanl@google.com> <CAJfpegtWYP-q82428iHd9gOBkAmoB=mgfGZRs3oi2FiAm3W-yA@mail.gmail.com>
In-Reply-To: <CAJfpegtWYP-q82428iHd9gOBkAmoB=mgfGZRs3oi2FiAm3W-yA@mail.gmail.com>
From: Khazhy Kumykov <khazhy@chromium.org>
Date: Wed, 2 Sep 2026 12:34:49 -0700
X-Gmail-Original-Message-ID: <CACGdZYK7wk0fMz7v7K_HSBfJvOYRmpWvaeNF8fBfU=j041gYuA@mail.gmail.com>
X-Gm-Features: AcwNN1X1Mg4LYCUjdd1XdfvBEc5eboyV6sEgS52Rgi2jqZ-kCC6ZRG_IJMk3rMs
Message-ID: <CACGdZYK7wk0fMz7v7K_HSBfJvOYRmpWvaeNF8fBfU=j041gYuA@mail.gmail.com>
Subject: Re: [RFC] Handling 0-sized pseudo-files (cgroupfs/sysfs/procfs) in
 virtiofs and FUSE
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Changyuan Lyu <changyuanl@google.com>, fuse-devel@lists.linux.dev, 
	virtio-fs@lists.linux.dev, peternewman@google.com, 
	German Maglione <gmaglione@redhat.com>, Hanna Czenczek <hreitz@redhat.com>, posk@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 12:46=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Tue, 1 Sept 2026 at 23:34, Changyuan Lyu <changyuanl@google.com> wrote=
:
>
> > 1. For virtiofsd: Does the automatic detection of pseudo-filesystems vi=
a
> >    fstatfs magic match upstream expectations, or would upstream prefer =
an
> >    explicit configuration option (such as per-path cache policies)?
>
> Why not just set "--cache never" for the pseudo fs export?

Enabling caching does give a pretty noticeable performance improvement
for those files that can be cached, and we'd like to have just a
single export instead of setting up multiple and assembling it
piecemeal. (To this end we do have an out-of-tree extension to the
virtiofsd-rs passthrough module to allow changing caching duration on
a per file basis as the protocol allows..., been meaning to start a
thread if folks are interested in this since it has proven somewhat
useful for us now).

But I felt having first class support for this felt more "right" -
enabling caching shouldn't break reading of certain files, and the
server is in a position to know if a file would support this or not.

khazhy
>
> > 2. For the kernel: Does the proposed copy_splice_read() fallback for
> >    FOPEN_DIRECT_IO files in fuse_splice_read() look acceptable?
>
> Yes, in fact this patch has been sitting in my local tree for a week.
>  Pushed out now, updated with a link to this report as well.
>
> Thanks,
> Miklos
