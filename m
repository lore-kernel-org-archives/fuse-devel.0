Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E653CA493
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444233; cv=pass; b=J+yoDYaJfxuEdn7NdfZOqHNpZx4Eooj9DHH3IQgCbEc+n+iyuqs7SNAt+yQQQeauTTby5bMjLoXF3vhHqf/c6inPBjy6hCu3OsdGgQhNONuz5C3NqmXVD2bMO6VGhhiXPglXwggUSvJgtJaISDKRCXXwM35P2gHmZBo2SitGACI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444233; c=relaxed/simple;
	bh=gdxsRuXHNkwnRZYBMEBbND2aGhOV+KTpwOY1IDe0yIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erYuon8Zk+ie9FpxsCj7Exg89wOdb5ocuTLSuxjCd0p+wFFf8GrrYueU0QyVnLmbLUnXn87goQhfrV3KDFA8AYSGM8KM4eVIngdpltQ1PwEdq3d9JeECYKadgwErUjTqZjJoSgl2jpfFONT1//ArMTzhwnaTG/xRrDKefxSK+tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNnlT1hX; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNnlT1hX"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso11300104a12.3
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 03:03:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779444231; cv=none;
        d=google.com; s=arc-20240605;
        b=DncXyldLbvvobtpxjX2Eamf6MMhhT1AWOcAc7XtfAU/mZ4rMOOXCWtQYEW90cGQ4sg
         ukBPUYjpNrsuIkOUiUk+/gNZIEMdWqaGabquly7jgmPv06kQ9JUNtc35Kk46W7kNKtlD
         kVmIE1K+2P8IyaSVujAGHB7WY9z87d/rS3qKVbJEUEoCBKb5tlLFzWOYKYHsQmNR1/yB
         OtG3ZD2eC5aVGToZ1y1hnZ1f/ScvP4yUFLPE1eUj/xasENZu2qZ8A0xvCLXalR3DmJCb
         3WSmo6cd1/H2tIcinOh9GCxHFP7ELtwsjWcWHXIDAcTH16EUrMnWJucyADOcaSu1ud+c
         oqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7VTTzNgP8kZ4WZqo/Pt6YUFHI+mQOpC46U4p4u8GdkY=;
        fh=kgVcKaK3uZBtfd4wmPy5rpiLSiUw1VWuYihXsaMHewM=;
        b=AV+Tp/74LT5FmhcvNEqvz8QCQzzEGOIbHlptXyDUO0bWfcbApI3JXCeNhFXnrdT+z5
         bj5Jt6C6m2XyvxcIN4vK00WHHl9XL5QMi/Oq+stZzXxbk4ot/xLr1LgjcwiIqmOSmorh
         gA8grK8vy2wBkgwaocEJf9q3REySgorIj9vcLaAn8CjqBb9rCumVAC62fjq9mjYURt7q
         E7k8a3bmwxAUDpkEWrfhQI9BiguAJfM5xXMQ6ssFiyIDGBs9/e0nxHsL/DQavK5P8jQo
         /B3o+fLZzWCHJ1GnOnojpf2P5b/Aq2y/dFLqVSeDwy7G53P/REJfRh+OR1Fud6Jb70ZA
         cftQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444231; x=1780049031; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VTTzNgP8kZ4WZqo/Pt6YUFHI+mQOpC46U4p4u8GdkY=;
        b=LNnlT1hXwJuD1BG5GMNv6wT75c92KIVQmgbCYfGx24moYyneTONoVnL2pVKK7Q6VVr
         N5sN+m6OjMyCmtNU8uIJ8ux1C34vc0/SmI71aWHIDhnhZQowOG6cMKjr0pBMnIs+9j4y
         ImklCkrutnKwXrN67uAIN41xNhUBMCO+Xf4mHe30G8j2Dqr2k39h+F7QD8wQ47GQVrvG
         Up5M5o7RslQGh39s6RlvZ4Vf11j0y4DQ5AtAfJxKRcZsScnkm+YJGlK9wo6xvPSuuzQd
         KEfp6ZsBZRmRYM3Blr7twayX3gCLIV8FB6AIkyliRgizp9OMTxupFrqDZKd3+uindKAL
         yBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444231; x=1780049031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7VTTzNgP8kZ4WZqo/Pt6YUFHI+mQOpC46U4p4u8GdkY=;
        b=MPTbbP9gsVSecGZyOvBwvFX796oQI72M2+Y/DHJKdXtgO7uxbIcPC3v7B2Gk3qDKa5
         RmZqEgX3soKBXDCgRlhXVntkrcBlEuh2ygzWeWFIj9whdYvDqDuV9jNJDjnLULQOl5PJ
         KH8+pPaEEhl7Pu7Hh8KZU4p2Y6evaFuw0GRhw3A55o42IhrBh+RV26Ccxw7ebaNlztZh
         OgKMzyFSyp2/qX3RwEu5W2YiGmPO/NSRMTbs5xP8dHBE0/rNBKYrFkSVsDMEOXW3SpSh
         XroA49xkD2q/359SKUsUH+PBRBP/aK8cGYd3m2V098plGSAQJwYlZeXZob6t59+U05Fn
         3KTg==
X-Forwarded-Encrypted: i=1; AFNElJ8K5Lf+B8X1lzxKAo0r88+W7GGBdDRbwD+FQRP1G3sC49Ncl3+hLGC1GyOrNhS6anfGtb/PKFe0FeNl@lists.linux.dev
X-Gm-Message-State: AOJu0Yx++LaObS1l3eNX0Dws2xJ9xjJ38y+9hmWjFo6pUZiuIr9q6i2w
	/AgVq2fo0KHMb01G2xsMa90ihgylOT3cnvXC5SPoh9jjCkcX9jcU+3MO0/GgEBT9nU+9jyxjWbk
	+lM8HvCm4eAtZ7mG3RD8BgHNi2Ydvrkw=
X-Gm-Gg: Acq92OGBl86bwurcea0K0ngAGbprmzfULKqL7jI+nh0sKtSbLxSuY7BRa0gOu8c7pxC
	frKXy8biyqD4OTxLASti5iy0p6m1SpQjtBEXIIc1uXbUF8DSOkmrYUq95ECstNaYxtLdt4eM5Ex
	bfaSRYIuX5Q+xzGMmlxpNanUQhIFxWgi7/z/Jrvf9/Rifds6iQgpzOe0Zp54VSaJtUy3UBbnq+C
	pr4T1A+A01m9XsrpANnc1gI6ypL4jAxsU5OthkSzlUD+lWANl/A6PQoIkZT0in6WD76h2uvxK1P
	kFnR4gwGP/B6OobxFoe5jRx1m2NV0De526jxhIFvpw==
X-Received: by 2002:a05:6402:458e:b0:687:8a9f:3142 with SMTP id
 4fb4d7f45d1cf-6889c4331b9mr1337257a12.10.1779444230564; Fri, 22 May 2026
 03:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177922944800.2436629.7011047808676668088.stgit@frogsfrogsfrogs> <177922944844.2436629.11205124993260163523.stgit@frogsfrogsfrogs>
In-Reply-To: <177922944844.2436629.11205124993260163523.stgit@frogsfrogsfrogs>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 22 May 2026 12:03:38 +0200
X-Gm-Features: AVHnY4IK_mvuSe5-3KT9gh4fnkJ4klzAb59GOzP4QZrEfJEjjgpQOz_XglBlrvs
Message-ID: <CAOQ4uxjJ0eF0vE0hgsNoWqqD+UQ4r-1-b7493cYNPUGSUR+tcA@mail.gmail.com>
Subject: Re: [PATCH 1/4] fuse: move the passthrough-specific code back to passthrough.c
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, neal@gompa.dev, 
	bernd@bsbernd.com, joannelkoong@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 12:29=E2=80=AFAM Darrick J. Wong <djwong@kernel.org=
> wrote:
>
> From: Darrick J. Wong <djwong@kernel.org>
>
> In preparation for iomap, move the passthrough-specific validation code
> back to passthrough.c and create a new Kconfig item for conditional
> compilation of backing.c.  In the next patch, iomap will share the
> backing structures.
>
> Signed-off-by: "Darrick J. Wong" <djwong@kernel.org>

Please add

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

and please keep in it future postings even with minor changes.
I realize that fuse_backing_id_remove() was changed in this version,
so that's fine, but I only know that because recent revision still fits in
my ever shrinking context window..

We discussed the fact that no one has lots of spare time for review
and re-review is a big production killer (in general).

You must know that very well as a review and also that having
a "what has changed since last patch rev" is very useful for reviewers
and also very expensive for authors to maintain...
...unless AI agents can help to generate per patch Changes
for the post --- notes?

I assume that Agent can do that on a patch set after it was created
just by giving it two sets of patches?
For the very least, producing a "No changes since v.." should be easy
and useful.
Letting Agent go over mailbox and verifying that all RVBs have been
applied is also trivial.
I realize that patchworks and b4 review can help with these tasks
but they are more tuned for maintainers and less for authors
(I think).

Obviously, I could do that with an agent on my side, but that is not
a good use of resources and not a good model to put this burden
on all the reviewers.

Worth a try IMO.

Thanks,
Amir.
