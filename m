Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798D53BAD89
	for <fuse-devel@lists.linux.dev>; Mon, 27 Apr 2026 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294121; cv=pass; b=DLFskxE/Q7x7GZkL8wLRPEVVqfMofpvW40wF3mPpJ1D3ciKI5MQNYWSb8uO5N5b5z90X8mpWE4iJy1sMrnreRuvDMKva+/IFHDvrxEanRn7Lq2LyWoCcaRwHtR91U/aceou3jiuQQVcr8utDWiAyqbWtJrxFLzCeUYVn/exeNFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294121; c=relaxed/simple;
	bh=b0Icckm+Plk021xclbvKmb7LSU2YUWfD7jrM6zKcdnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQy3yFfjeDp5JfWY/xPoBvopiSzRsgV4rBbdzX5HwrPgPd6LXhIvNfUX/K3hmCTs+dnfU3HdApnO0bek0wHkemfm7SCkeSR3+NngqnjkKW/lINhRybBb4qOh1l2dGilC34YcG0JiJMY4ws5Bs9R2IcDnNvf8xXHJfBmsKzCrTUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n9OvtbFf; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9OvtbFf"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d73352cf2so8583939f8f.1
        for <fuse-devel@lists.linux.dev>; Mon, 27 Apr 2026 05:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777294115; cv=none;
        d=google.com; s=arc-20240605;
        b=NfTKBAfX7AtP/IIWQbivwxmDBrwLT3h2CxWTU4a9fI0ilHGAc2UCA03cyLvCRhKSwD
         tuagVpzLb7Y7TA8VFrnXOf0csV/q7hXrgZ95ilWZPhRcS9s74avDWCLCHV8sc7q2P8cB
         hSsqs0yLXn8L2LlDdD7h1KiWwZzAK78mdoYI7JaL6jj3pcSy1BF4HLsplM+zTc6JImwb
         sa0zitPQ1yRHBR683Gy01fvb375vSkVFztgClDWAgCV66dTPgIuMwHrC3wakFaSYcS2l
         F7N/Yv3Cvn7ikVoOThCNFYjaUvbf6aeDINIl7Gw2dfCQw23s0tGNszm4EQpN/6NmMN4+
         h+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wWMmBdrmkGuOGSH1/NGgSO4BjSYy8FKRbM9YyJi/QYE=;
        fh=6y/g5HPUQDoxku+UBTW1TnEe3y97WwXLu+s4Fk144lg=;
        b=A8gNrDouJ+Nx8J5+kWxdgaSY+TqmCrNv+UCSDTAeFbJSasN1S36yA0ff7+jkutFDxA
         qwMXmFzr5903gLoYJ8Tb9CF3IRrdfJCSGuQPwnREL2Jrq1CXY65gplX0slfv75VQ5386
         usmz9dIGqdNjnXeod06lh6xeZkPSM7eN687GvCe5O9gvLCX6cir/gIqD10Cdy3ltugwj
         D04bOFmswrra2yr6ToYwZXCaxMPD7jzZfcFl7QkXU0PHjpDGtcufJ3nn7ZGUFPyga8eB
         aEiFQHzJ+asjEDQf2kTP/wFRG4mNTQjXmTIqUe26lno6DISHe98D0Twtb83VSkYVImq0
         ujEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777294115; x=1777898915; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWMmBdrmkGuOGSH1/NGgSO4BjSYy8FKRbM9YyJi/QYE=;
        b=n9OvtbFf8dfoCABufqnnXJHWMpK0CuDu+RLizGl0u32Ht+qvErb5RrnTPiUeRBLscw
         hGC7oOEAThjv2t0IOdkJRiB0aHdReEw2G86/KjtNhShXoSOp509wD/LsjLbV1aM9RRZO
         ViSdDOMZde70F7eJlqFNNBriL7FStxJvmXxqw9kJexsHOcQ6aGcPuvAuNvK3CZypeQgH
         cEbR5Ib7Uq7cEO+UfSSy1mTeKCG6u0frXMw1WLWw/K0a9TRUQIrRQ/KTRt9Xuypsd6XO
         gjRTvLL5QvwFeJIAC0jg6kOcucZPuJML9v2jHSniamTx0FCVtLKP17mCyEaLSdFe5DqX
         XYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294115; x=1777898915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wWMmBdrmkGuOGSH1/NGgSO4BjSYy8FKRbM9YyJi/QYE=;
        b=hZjjr/3VaXlQ+LgjDtvWss1k9copty0rr5tL9OOmXdA4QMro3KuLP0MNT4kK5F9v1j
         YPT2JHsN8ZJW8jCDroJ3uBRI5IQ6PV04dOBtz511e5h+b0cZREMKOBgyQ6VGdrXYoNkS
         o8eFsBRo1Ybx4arayHrT5HjAcaQfqytRow6Ky5PYRwIbtckPJUGR4Pe/MVAUGkMJevez
         iwrFUoFaXblbW2ugLfpDeEytWJLemr0YL9cJ7BA9qiYrFcMyMQy6lCvNN3CcvyLrezpi
         rynHKyQLcruG1rIrWdjWZTv53PoBA9GZDgWF0H+yHOhtE82ig3CcGJaIdY2yVHPjTDzl
         4E8w==
X-Forwarded-Encrypted: i=1; AFNElJ8fYAUq7lM5sqnrRpfVNY6+w6v3N/PnFhzhMij888KtW6hNGDV5Z77Ma9b0Z9AV2QjoEdIpOkIUuCVp@lists.linux.dev
X-Gm-Message-State: AOJu0YxeOv8to0toROjerLJHym3/Dq3K4I+Z9vapBfeC543c6qHIsg2e
	pI8exxyap0VlK7yiI7QaNUp+R1aCb/A3azwkJxWKoTf9VsKcQQKHtjceCqbLDpYxn66jy+R3VWr
	YLEFgXKf0IGCTf5KEjwj9BmIvAn88EwQ=
X-Gm-Gg: AeBDieuwDxXUBfBi8JGclUA9fQPNx6xo4a0XTYTRLV2CvRXUX4ep9uY2OyqSnye//u/
	DLOT6fz2FQF3wndevE78rS8CYcmFiYnldas+0us06J3Jg+ZrurrR/YkyMx3bkuvcWAzDaRzx+Wd
	pzT3erWN6yVkKqac4TRZCINKfzBIo5CmAAVlE/zuiLasaW2vq+RB1Kb/DXgmEGJIAwOAzol/fGe
	eavQYLsBd99CSlR4p2Z7JhrjMi+yxbclEHRzmx4v8+thIQivv8k4XKLHyQGT+qlUxjrUDNZ8oRr
	NLUs6ke7XvGwavTo66epRDjJFmg5CTTs7Q==
X-Received: by 2002:a05:6000:18a3:b0:439:b8b2:fabc with SMTP id
 ffacd0b85a97d-43fe3dd4b7dmr66564872f8f.21.1777294114923; Mon, 27 Apr 2026
 05:48:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424134935.16161-1-luis@igalia.com> <CAJnrk1bv4NK7MF4msYMAmbS=+vL=k8NLoLiNyM4QB+amccpOww@mail.gmail.com>
 <87mryokb89.fsf@igalia.com>
In-Reply-To: <87mryokb89.fsf@igalia.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 27 Apr 2026 13:48:19 +0100
X-Gm-Features: AVHnY4I2KC03jSnyEaPe91Ov5H2L0IAjkV2v1_J9s7LaLGq7nbWyDrYCpJ4nnL0
Message-ID: <CAJnrk1ZCyHtL6NEaSuww+RQvNNfAW8NkvRA=+=HXQwdG_4aE_Q@mail.gmail.com>
Subject: Re: [PATCH] fuse: fix race between inode/dentry invalidation and readdir
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 10:23=E2=80=AFAM Luis Henriques <luis@igalia.com> w=
rote:
>
> Hi Joanne!
>
> On Fri, Apr 24 2026, Joanne Koong wrote:
>
> > On Fri, Apr 24, 2026 at 6:53=E2=80=AFAM Luis Henriques <luis@igalia.com=
> wrote:
> >>
> >> When there's a readdir in progress, doing a FUSE_NOTIFY_INVAL_{INODE,E=
NTRY}
> >> on an inode or dentry may result in stale directory info being cached.=
  This
> >> is because the invalidation does not reset the readdir cache.
> >>
> >> This patch fixes this issue by adding a call to fuse_rdc_reset() (modi=
fied
> >> to include the required locking) to these two operations, allowing the
> >> readdir cache to be invalidated while it's being filled-in.
> >
> > Hi Luis,
> >
> > Just curious, are you hitting this issue in practice or is this mostly
> > theoretical?
> >
> > afaict for fuse_notify_inval_entry(), it calls into
> > fuse_reverse_inval_entry() -> fuse_dir_changed(parent), which calls
> > inode_maybe_inc_iversion(). afaict, this actually increments i_version
> > (since I_VERSION_QUERIED flag was set when the cache's iversion was
> > initialized with inode_query_iversion() in fuse_readdir_cached()),
> > which means the next readdir call will detect this version change and
> > call fuse_rdc_reset() (in fuse_readdir_cached()). I'm not sure I see
> > how this leads to stale directory info lingering in the cache after a
> > concurrent fuse_notify_inval_entry()?
> >
> > For teh fuse_notify_inval_inode() case, which I'm assuming is the case
> > you're running into where the directory is the inode being
> > invalidated, I see the call to fuse_reverse_inval_inode() which calls
> > invalidate_inode_pages2_range() if the offset was non-negative, which
> > will invalidate the readdir cache's pages, which means on the next
> > readdir call, will already call fuse_rdc_reset() when it detects the
> > missing page in the cache (in fuse_readdir_cached()). So I'm not
> > really seeing how this can happen either for the
> > fuse_notify_inval_inode() case? Unless you are passing a negative
> > offset, but as I understand it, passing a negative offset is used only
> > if the server wants attributes invalidated [1], not any data.
> >
> > afaics, the onlyy stale directory info returned would be for the case
> > for a concurrent readdir that has already passed the pos =3D=3D 0
> > iversion/mtime check when the invalidation arrives, but that seems
> > like a server synchronization issue, eg if the server wants uptodate
> > data when doing a concurrent readdir and invalidation, they have to
> > order that themselves. ANy fresh lookup after that though, I think
> > wouldalways return fresh/non-stale data for the reasons mentioned
> > above.
> >
> > Does this align with what you're seeing in the code or am I missing
> > something here?

Hi Luis,

>
> First of all, thanks a lot for looking into this and for doing such a
> great description of the issue.
>
> So, I did had a report regarding a possible race between a readdir and
> invalidation when using keep_cache and cache_readdir.  But, unfortunately=
,
> I don't have a lot of information regarding the actual issue, and it isn'=
t
> something reproducible.
>
> Then, looking at the code (and, for full-disclosure, I've also looked at =
a
> claude analysis that was handed over to me) I could see a race that I'm
> trying to fix with this patch.  But I believe it's the race that you clai=
m
> above that it's a server synchronisation problem.  For example, with a
> NOTIFY_INVAL_INODE operation, when fuse_reverse_inval_inode() is called
> while fuse_add_dirent_to_cache() is being executed in parallel, the
> iversion/mtime update could be missed.
>
> It is possible to hit this small race by instrumenting the code, and I
> could occasionally (and momentarily) see stale data while running readdir
> in such instrumented testing environment.  Do you think that's something
> inherent to the usage of the INVAL_INODE op, and this race will need to b=
e
> handled by user-space?

imo yes, that is not a bug in the kernel and userspace is responsible
for synchronizing/coordinating that. I think the kernel is just
responsible for ensuring that any subsequent readdirs are not stale,
but afaict the existing code handles that.

>
> In fact, the report I got seemed to indicate that the issue was not going
> away with a fresh lookup (though an 'echo 1 > /proc/sys/vm/drop_cache'
> would fix it).  But maybe that's another indication that this is a proble=
m
> in the user-space server.

that seems weird to me, maybe there's something else at play here in
addition to the concurrent race? Is there a repro for where the stale
data survives a fresh lookup?

Thanks,
Joanne

>
> Cheers,

> --
> Lu=C3=ADs
