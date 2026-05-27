Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0C3292B2E
	for <fuse-devel@lists.linux.dev>; Wed, 27 May 2026 22:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779921639; cv=pass; b=ZeLO3wM99NA7QnLjspYYTSarpDc8sdeBvcGrT+M1syiNsI1zxdcp1qW+nr6cttU6WFa6aQq7rCfhlH3LQYnRMwI/0ElEgVvEwlXfKG2ubHczQr1Hy5IkWYsWgDQQrsOyFlxZfRwEoR0j1FU0Y/trcLJrF7u6Obw+HPt1ufxdkQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779921639; c=relaxed/simple;
	bh=apu/P6/fBfHw730fI/dCBoHLTtx+6SzUKNBbDiT201w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QlF6Wpex4zNJV6Xov7r4LXQMTMAtSetHNCbY8Of2JYxEYeLd4wfRdAffiEjFW6ximmxIPS80kAWG9ceQvVZ1YMu/51HJRRQWZELXm6eugmdF+n/BXGcCMVPN4CNyOLbsPGYXkvqCQpS5Zg3+wZwo1/pj9RZebWtgRGM6t3cciG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qd1h7nTp; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qd1h7nTp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4904fd4f6aeso44095035e9.2
        for <fuse-devel@lists.linux.dev>; Wed, 27 May 2026 15:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779921636; cv=none;
        d=google.com; s=arc-20240605;
        b=ROML9rk9zhLkxb9EmRdoKb0zEy6PTmnfXoWPrbHWY6AmyJUzWikAgZLyAjyh740iNT
         WrpDM18GttdsMlqe56TG3IFWjsBOAJZ0q9ZnXxe+NG0Rkvthh3QQ+gwSErqjIlJcopH+
         /jFaYjyj6f4hgCdfdvHOBRK+Eut3w5/C3QwhoZJnbqUQNQx3XtYA52NVXxhfbjicAgsw
         SVsadpOkcyBtQD7ZMC0m2ONuPqsMl7Tq8jfWw2Ze7f6ohnwYghCdW3mEv0KAlXgBIDd0
         Blm+lzEhJaluja9xSHxnDXNPfauQxQ4RcBH+8I5vSUwCqSRx2P4LfycWvpZ9DH3PqTZe
         v1KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=apu/P6/fBfHw730fI/dCBoHLTtx+6SzUKNBbDiT201w=;
        fh=oYeG/pBFsr4eQ7GKvYFBAVDddq3P1rlayxKQ6UsHItw=;
        b=djETIpJuR37ogKwb2DXkDfAYTY4D7I0AN+jTZ3YxhXUABVcefX/mBAIJiSxfoQQbNz
         hVSCgGbB/l5A4TZrI6mYsI2+mEq4mUR9/hwWYOto2r4iFScJcRQl/WnQlsVQcH2oVUj+
         3Ft+Dz3DMRCI1vYqe56RqKKfV8Gk7ab2O3S2lHV4HaoQj68oczfxjqfkWCdwURrKIuA0
         Hg05c0tBEiz0b4VzCcXLUKi2WWUveBwbJ0go78jRHF6D20a1jvorZt064xnS5JC+/O4v
         vJlBhv1clKsFvZH29rroZ5PNt1dLWN41gcvpDBS5l0uEIL57Gm//CwyKfjxHpJyHNOXI
         1cJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779921636; x=1780526436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apu/P6/fBfHw730fI/dCBoHLTtx+6SzUKNBbDiT201w=;
        b=Qd1h7nTpp2fa65hD/whJzjwQKr3HHXJHU3mMeFrl+cdD4yrKzqVjfX+ktVHAqiwFPd
         aikw5zYchLa+Rt8PTm5Ur44R1Yhpr90kgRTep70G7ybYneDnhZCXD2JQDP2zQhDZRjVD
         Tu0KnYLDbVjBQFd0kFtVUDVCDmuaMsqgcj3/ssQRhtvZa9uVVPiX0+PK7lg+zjLiw4Gs
         SwAboLAqhWxjmrsaFWelyWjHcYHwWuF2oBiHO/Kr9Ksu7weng3mjJGseeqG/YQe0AjPa
         OLdJbNNk7nOmjNSkZFff6OVkEe0bJAAqPA6etuBIrqC4rB71vln/13t61WsRfKKlvBKQ
         Eq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779921636; x=1780526436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=apu/P6/fBfHw730fI/dCBoHLTtx+6SzUKNBbDiT201w=;
        b=KOYfArKEuSu0dlkMb9r+pQTs+2wEXDGwuPJCcMtOIwZOlx+6H5u7VUKD9b+RWC4NaR
         FDkudXo5IOqe6Wsw+zWLg8EKIbQSqDk7Dfhx+ht9OSfLidgugH0hbWvc2o/Asu+aJSGV
         yO4VERXMqNGNGmQv+Ud6RTXEt20I6pRBxNSdnkrRkQtaeFeC9fKZwHCkExCpLzJBuid5
         OoZkZD1TEC5yXGmfNtbPBKSeLOX06wvMnVAhHl2yD9Q9yJLE5XnYL9jR0tfARlimpHOR
         7oTBtCtEEQF0SMCPxMLOP1p4qH4GrqaXoYx1UCGnT7eNs4NONKoPyfhlCwyA8CwbOdFR
         qlQg==
X-Forwarded-Encrypted: i=1; AFNElJ9hnJvGGzPA8TeooE4xBNhrE3CdC8CXy1nFITICuEtR38rqh+38elUildbLOwJ87h9QJtXNv5fjjDTQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwcRisUuSYrdG5jWCtfC5ryBLoYdyu8iZsrpo7ISJ2GUaWUuqal
	dsAMt4rgddK8xWyPiVLa5aiIhm+XpiKjrMOAZVZPbrYrigr9NtkX/JKCQWmxipto2EU+L2aZ5ny
	/rJ1ZJEpXFNDDSaBIC+hhX4aup7KiyBA=
X-Gm-Gg: Acq92OH42+YtbGNUkr56T7wiBzrc9VVnSI9mkLEMSZKDEI/Uu8q0Y/9GrJivBkJ3/TX
	4uuiOEusdFmb1/IHowwHsZt4oaKVBHNK4I+ew+niPEXGrr5iFc1Z3dmH2RALv4HhBLhheICRzxN
	pCRBvOi9lYDX0wyR48Q5IosYXmsWZq6sU7e+VIukuZoXE5nb7Zyb0aweQXWVQOmYzezvMm87Wu4
	p9bVgcfOXRWCqJg0qv6qWcuV9Shg/1SpJ07Vo9xzRNjujfNlsr4D7MiM3RrXPPhZYdXtb24ZI00
	6+DB95ZmpF0k/7q53wIynf7huCrONLoNduA+X3c0uhAz
X-Received: by 2002:a05:600c:1d0d:b0:490:601f:d788 with SMTP id
 5b1f17b1804b1-490601fd8bamr278017935e9.5.1779921636078; Wed, 27 May 2026
 15:40:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251008204133.2781356-1-joannelkoong@gmail.com>
 <CAJfpegsyHmSAYP04ot8neu_QtsCkTA2-qc2vvvLrsNLQt1aJCg@mail.gmail.com>
 <CAJnrk1anOVeNyzEe37p5H-z5UoKeccVMGBCUL_4pqzc=e2J7Ug@mail.gmail.com>
 <CAJnrk1bx+32Tq5DOk6=C+_smV2HgP3+RT6gpYLSNMEirFs_EkQ@mail.gmail.com>
 <CAJfpegsy2XRR6g1J4Mg0MXPckx3NVprW56XvYhEko0=7PcHiQQ@mail.gmail.com>
 <CAJnrk1bZX44HaXmNMxEeEwhuFHgEjxXLnjKy8a-6T6LFuf+K2A@mail.gmail.com>
 <CAJnrk1aJwdY+fphnhHjAXFwjGqWQgVB+sn2Ce0gReein3H8EWQ@mail.gmail.com>
 <ahaF7UaeQlgajYDi@fedora.fritz.box> <CAOQ4uxiqP=f+5py=2Ma1uEchogYttQ5sKZte6XKRVHAO=pY1DA@mail.gmail.com>
In-Reply-To: <CAOQ4uxiqP=f+5py=2Ma1uEchogYttQ5sKZte6XKRVHAO=pY1DA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 27 May 2026 15:40:23 -0700
X-Gm-Features: AVHnY4IwTYY5ddtTAGaKtbU2Fh0R1_NeaT1KtLDt7fmycX1PzTpXR0Gv5QqS7mI
Message-ID: <CAJnrk1a_8SCDUPCjAT6a7xK7r=b-iqKeRnkPSbv7dUvjjBGDyw@mail.gmail.com>
Subject: Re: Re: [PATCH] fuse: disable default bdi strictlimiting
To: Amir Goldstein <amir73il@gmail.com>
Cc: Horst Birthelmer <horst@birthelmer.de>, Miklos Szeredi <miklos@szeredi.hu>, 
	linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	fuse-devel <fuse-devel@lists.linux.dev>, Jan Kara <jack@suse.cz>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 3:59=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Wed, May 27, 2026 at 8:06=E2=80=AFAM Horst Birthelmer <horst@birthelme=
r.de> wrote:
> >
> > On Tue, May 26, 2026 at 06:42:35PM -0700, Joanne Koong wrote:
> > >
> > > For getting this to work on fuse servers with strictlimiting, I think
> > > the next steps are to
> > > a) as Jan had suggested in [1], come up with some heuristic to
> > > constrain the max order supported for large folios for these fuse
> > > servers if they're running with the writeback cache enabled
> > > b) benchmark ^ and if there are still regressions, then we should
> > > probably just turn large folios off for these servers
> > > c) add the granular writeback/dirty accounting for large folios
> > > d) look into improving the balance_dirty_pages() throttling logic to
> > > handle narrow gaps between the freerun and full throttling zones
> > > better and reduce over-throttling
> > >
> > > Does this sound like a reasonable way forward?
> >
> > Sounds good to me, since we have seen pretty much the same when we enab=
led
> > large folios for testing.

Awesome, glad to hear we've been seeing the same things.

> >
> > >
> > > For privileged servers, I still think it makes sense to remove the
> > > strictlimiting requirement or at the least, let admins opt out of tha=
t
> > > if they are confident their server is well-behaved.
> > >
> >
> > Here I'm not really sure what the most logical and sane way would be.
> > I really don't like limits for no reason but I understand the necessity
> > to have limits enabled for unpriviledged servers.
> >
> > Do you think a module parameter is the right way to go here?
> > The connection parameter might be a problem since an admin would have
> > to set it for a large number of mounts.
> >
>
> Not saying no to a module option, but I am curious.
> This admin opt-in per mount could easily be implemented in userspace
> in either libfuse and/or mount helper.
>
> For such a niche ("I know what I am doing") feature, why does it matter
> to do this in the kernel module params?
>

I'm hoping we're able to keep things as simple as possible by just
getting rid of strictlimiting by default for privileged servers on the
kernel side, without needing any module parameters or libfuse changes,
but I'm not sure if Miklos is comfortable with that. imo if the server
is privileged, it can be trusted to not misbehave and should be given
the same kind of capabilities as a local filesystem. But I guess there
might be the possibility of user regressions if it turns out people's
privileged fuse servers are accidentally buggy.

I think the module parameter makes sense if admins trust unprivileged
servers enough to turn off strictlimiting globally. Otherwise, I think
Miklos just mentioned there's already a /sys/class/bdi interface that
lets admins disable strictlimit on a per-mount basis, so I think it
would be cleaner (though more annoying on the userspace side :)) if
libfuse used this to turn it off by default. The max supported folio
order is set per-inode when the inode is first looked up, not at mount
time, so the admin can disable strictlimit via sysfs after mount
(which is when the bdi sysfs entry gets created) and new inodes will
pick up large folio support from there.

Thanks,
Joanne

> Thanks,
> Amir.
