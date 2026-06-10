Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61E63B992A
	for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 08:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080943; cv=pass; b=MW+MolAHXSUmTEx8NAfSLq2v7C0LyqNqybLOfzyhIG7+aMuq3RuleM+NuU5t3D7IHkAy8kfdvWcAtPLGTFcNqVb6I8L242nysbgz+LWfI6q6+wD/LbQn7kMEKZnhag9IEA/841o/LrssLxwXTNcZ9RCxUQyqQAuXivug5fr219o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080943; c=relaxed/simple;
	bh=glXQUa+Y/DatHXeZD7fW80kJFjCOEtx1CgYnVJJw6Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JRKeO4kyhAdzmNSxQNlQlq1vzutYmsc0rdQPeVsNlh9Gt+PlfpENWNwV6LouAr5Nu5e+jm9mBGWZ6zZwLh26XaHNk7Mz5PGZlSA7wAEMGTl8Xt3Ng/UixaQjTe+7hJRPdlzhac5UB6wEg2qiUc8SxtS7ahwHDupa8dpfk9nANQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=YEnectKb; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="YEnectKb"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8cd45d4b7e2so73875956d6.2
        for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 01:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781080941; cv=none;
        d=google.com; s=arc-20240605;
        b=kmtXFNFrkPhhuEUemuvRCzARWwjfQ3MMZi4RkWrDznBrB7AcTGiTzXTqIZn4s0VUbP
         tkpU8cR9Ez7j4iO8S6uMcLmgCgBO38d/3+qXdO23CTNyQP2yn4ogGcAZwd0Ngm/HFrG1
         CnwoWl7QJ7H4H8MznrJ4PqaBoE6zmS4sqdV3eaQAHlfCqqUOhFXvLN2VzbuHYyl20ByQ
         vxLsVozPFk0/IrJ48rar9l8EemUttArJYS+iRuCMDZEmoU7Bhip/1cD4aLmEnkZoUWNx
         k0THPbJzmrYPKDfGyckzKSz7njErCbHsV8huqbGeViIgwzjaidBpKgsnRvS3XLBgVjxc
         OGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ED/QJ6ABfSnyR/f8TkNH5YZmLu7z8QYXHSgbyRBn6rA=;
        fh=lc39jgyMUY/Ax5Daa3EwFZh5WPdNhbcuMgTbLLoT2ao=;
        b=CzMOjJqMofbGmHrJZzc7CZoXs1AGtE1rtP6bBhYbRw+5XGW8NUfXslu7p6rdhI9h2Z
         XH9WTpcO/c5294rU17TDIgMiHA28H9LISdAC2kkCMllHq5V3IgPaIifVE2debsaitQeJ
         O53j7U+xjYwG5AEbyNr1ckOI4p/oFUKdqPpYh528YqpePRZp1TKZCQqJ8Xnv6MEKTt+T
         xjVK60AO9SPfgFyiPZ7iJflusewKkbzY76ECuji2GNL8Kbvyx06/tsTCU6J2IJQfmOa8
         tXXTHX6WK1fhfMddnyK4t0sFa5Cta48QeioUePEfQ2pfEm86uNuQ9f/fbiEqMbc1JJd6
         FBmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781080941; x=1781685741; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ED/QJ6ABfSnyR/f8TkNH5YZmLu7z8QYXHSgbyRBn6rA=;
        b=YEnectKbjaj9h1x9qMSCSX89CEmwxeOwLJ2Q4S/pl+XOTzEXLGxQmGWEhA9Xew3TkL
         8+OtD0cd2coKvyWaGH7YLGm0aMgmDXywZzbPEQUPcyv/DqCpMQFTr6e4XTGF2dzJbtNN
         NCnyfaK9THQiPPpceOfoxvudPno74O9vOySMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080941; x=1781685741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ED/QJ6ABfSnyR/f8TkNH5YZmLu7z8QYXHSgbyRBn6rA=;
        b=mAlfQ/0u2EdbPbMdqZgjMEb87B755bnAfMuFEB6APpPma/uNHoq/uxHQcbN0EDhCRM
         9B/+RMnAyp8/Vfz5u5CAIF/g14XYlSTfYCqQMEKnIbrLjFEI4nnPfq/b+hcX1FSiE3Pl
         yLUgeQlQ/9KGmAyoqEGW9Hv+DbOVUiDul4BEUymF1iEUCWvmxd/fP+SXnRndpqPSa6rp
         dDdv71Wquk5egelWFK1iT3Zao0z+C/QgZoAF/ytVuahy4Upf2F2kph9iASPIOXgVkPqG
         AZaps2Z6XhI9JSffNaPOob/NyztkfNv0rKJww6PjPf6RqZsL2j6YJROzxLz/4Drk8FoR
         H2TQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WbxwqNIel8WKb/8bTtzSkc3loVgYE5Q6h5/ZTyFvIuBlV1XHASOjgSK5+iX0Gw8PfUsl6nob9m6bZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyDo0WBR4yHjdyf0tM6YreePrUz/8/vBIX860QGzALuNbg2D/mD
	md5mbeJshUvNGDgS5+w9TnKmE5ub+lEHp9i2Yx7Uv7wYU1Wcgo90DyQdgqyClFDrzaQny7UqNu+
	qsJZyGS0XLYaLZHgnUuA5sfAMAeZPh8ncRVTABm5s8Q==
X-Gm-Gg: Acq92OEtKAJDvGCdkJ1zU9wdNqSbAjzA2FWq4oqSZOOq5DrVJG64em5tRDq/VnXlbWn
	cnWrqkWdgXeIYNnRs8AkofPArxOrU1j8zn09Ge+wsV/pDW38ZuBkYZUyYPF48VmIHZSN3E1hf9W
	tkc0MpNrniAxumoS/dFcTdlP3dgFigb5xx+TDka+URZqBGqLEqwBFBZKt6t/yBpEFFs1sKb6nbG
	JOtgYXoL8v8vAaSgOl6NMfY6jJ3wWLgwXbzWMWmhOi3gA5JVdBN1KGFsDaDvNWoSJGPa+wUs3OJ
	/+Sxrcetg4PYU+5zI4k/KDogiTCRSSrJHCWZq8kYadbBg4JfC2Q=
X-Received: by 2002:a05:622a:598e:b0:517:29b1:5433 with SMTP id
 d75a77b69052e-51795a48088mr322115091cf.24.1781080940521; Wed, 10 Jun 2026
 01:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177922944800.2436629.7011047808676668088.stgit@frogsfrogsfrogs>
 <177922944844.2436629.11205124993260163523.stgit@frogsfrogsfrogs>
 <CAOQ4uxjJ0eF0vE0hgsNoWqqD+UQ4r-1-b7493cYNPUGSUR+tcA@mail.gmail.com> <20260606045414.GK6095@frogsfrogsfrogs>
In-Reply-To: <20260606045414.GK6095@frogsfrogsfrogs>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 10 Jun 2026 10:42:09 +0200
X-Gm-Features: AVVi8CfbqDw7vdXcHIb2UID4p1vvU8AlAuzASaoRQ-cjkWHX9R7KMBWVkvcWtWw
Message-ID: <CAJfpegv9SeV4xciMyfDBZ=9CTAk2_=erhBvZs6CMk5MZZZfA8g@mail.gmail.com>
Subject: Re: [PATCH 1/4] fuse: move the passthrough-specific code back to passthrough.c
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Amir Goldstein <amir73il@gmail.com>, linux-fsdevel@vger.kernel.org, neal@gompa.dev, 
	bernd@bsbernd.com, joannelkoong@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 6 Jun 2026 at 06:54, Darrick J. Wong <djwong@kernel.org> wrote:
>
> On Fri, May 22, 2026 at 12:03:38PM +0200, Amir Goldstein wrote:
> > On Wed, May 20, 2026 at 12:29=E2=80=AFAM Darrick J. Wong <djwong@kernel=
.org> wrote:
> > >
> > > From: Darrick J. Wong <djwong@kernel.org>
> > >
> > > In preparation for iomap, move the passthrough-specific validation co=
de
> > > back to passthrough.c and create a new Kconfig item for conditional
> > > compilation of backing.c.  In the next patch, iomap will share the
> > > backing structures.
> > >
> > > Signed-off-by: "Darrick J. Wong" <djwong@kernel.org>
> >
> > Please add
> >
> > Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> >
> > and please keep in it future postings even with minor changes.
> > I realize that fuse_backing_id_remove() was changed in this version,
> > so that's fine, but I only know that because recent revision still fits=
 in
> > my ever shrinking context window..
> >
> > We discussed the fact that no one has lots of spare time for review
> > and re-review is a big production killer (in general).
> >
> > You must know that very well as a review and also that having
> > a "what has changed since last patch rev" is very useful for reviewers
> > and also very expensive for authors to maintain...
> > ...unless AI agents can help to generate per patch Changes
> > for the post --- notes?
> >
> > I assume that Agent can do that on a patch set after it was created
> > just by giving it two sets of patches?
> > For the very least, producing a "No changes since v.." should be easy
> > and useful.
> > Letting Agent go over mailbox and verifying that all RVBs have been
> > applied is also trivial.
> > I realize that patchworks and b4 review can help with these tasks
> > but they are more tuned for maintainers and less for authors
> > (I think).
> >
> > Obviously, I could do that with an agent on my side, but that is not
> > a good use of resources and not a good model to put this burden
> > on all the reviewers.
> >
> > Worth a try IMO.
>
> How about a range diff? e.g.
>
> https://lore.kernel.org/linux-fsdevel/177758364789.1315233.15610945404741=
826500.stg-ugh@frogsfrogsfrogs/
>
> I think I'd rather spit those out than either (a) try to remember all
> the changes (esp. minor ones) that I slipped in between two patchbombs,
> or (b) go all agenthappy.

I'am open to anything, but the patchbomb thing isn't helping, that I can se=
e.

For trying out a prototype posting git url's is perfectly fine.   For
review we need to go with single patchsets that are manageable size.

Some general suggestions towards this goal:

 - leave out anything that's not strictly needed (e.g. tracing).
 - add only minimal functionality to be able make it do something
useful (e.g. read-only, DIO-only, etc)
 - add to the uAPI only parts that are actually used, leaving reserved
space in structs is okay

I can understand that the additional work  seems unnecessary and
overwhelming, but I don't see any other way of sanely integrating
something of this magnitude.

Thanks,
Miklos
