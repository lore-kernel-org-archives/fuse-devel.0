Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23613EAC6B
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 22:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778884364; cv=pass; b=uYx2mQff2aqaj13SF2hshdW8cZYHOgvLnxVDwrYKjsUBMoO7lARla8pGUL0hHC++pNMmzY1GuMuXxDD4KK+ZLNsnPiNsPM6Zl0WLBTDpUFtzWWJZR1NBxB3+mGGIz+fMAvmyUf3GuBRGd+YtDY6nN1AMA56Coxnb4evJZNbUK2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778884364; c=relaxed/simple;
	bh=KEy3rXHuQwUA3D6zy2MyoIddwUAPoFRAdsVTM7rcQDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F0m1P9TSo1KZIaKqT+Gyr73ruSxeg9ZAcZwLdg6LNqDKNx6PlqLbziLpdsgYoCS1ANWvjvRt1cFJEw057hGLWyDom4Kj9yQM7oTl56ptwKcDomwgclGbgeI0r/IJvpXOePTw8dbeAx8uBrE62a/ToBPJ+do9JaiXdak5H0Yrk2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcW5uMUC; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcW5uMUC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48896199cbaso2137385e9.1
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 15:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778884361; cv=none;
        d=google.com; s=arc-20240605;
        b=ezlOmDalOJ3b1D/PJ3sMlvlhvheZ0CL7W6oicY4ZUIJE8wwgzBe4sQbWNXTVKya2Oq
         Kp76Q3iRc1sYiXYR3sD6Y2rpH3YKJIlZ++8qFV4TPFPXxNNuwgCZBHSXtW4lAOHFymM/
         zI8pPr6ysL795zaCIaTkk58HxweacYOByOthyi18ff539a7kx4vDL/No0Y5pJvtTaYL5
         c4iotLTsKaLqMaNsIYcWFfu650gZorqoc3MgKNvMmh9TtBJqGHExaG8vWg8v1f//jdrg
         a8jkB4YCUvE2a9KCdlVlWf7BcBnDG948r47DadF7oE5QjBubXOPB6udFSI+ic/uzqRlW
         1vzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2NWItuYfU1D2m9f78r2wyOhs2jk9CgDDgSslfDxDFGI=;
        fh=FPEAOfosetfPHlwa4Heva1zGNi7Lg0wSQOSL4ynaxgc=;
        b=ETB/G6IVqGceh0V08iGBvz/IcUNdyiFy5AQH+sSIKjI0VBmKOJlnJB5LRVIp6XeXLt
         yrJDQ4aGV+qOsUVX0JQNJLvOQgdk4RS14wOJuJ7vHx/3DSNsBkKISdFc1+3I216EHV62
         qV30Vx/csxcRqUp8Zu4H4jEtFQTH767ijLp7Jx7kliWTzQ6HClbA9n7gT8KsBgEuhp8o
         c7VjUy1mVH55PGS8igS1RaMnmuWx3uTPcDkcHfyMWoWaRtheeTt7DjfrHnOifr1CRIe3
         b7Ows+e+ky1QDsW/HgGIHhNxkAgbQ0Qw853Rw/jsK2Pm4nkCgzbeUVF6yPb12fTP75f+
         xT6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778884361; x=1779489161; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NWItuYfU1D2m9f78r2wyOhs2jk9CgDDgSslfDxDFGI=;
        b=VcW5uMUC2rBY+y1myNHs3jgzkV/1aIKLXGTJgYwjiHNq+qvDHgldQ1Nj3QzF3hOL7K
         K8n1X17M4BmAG6zAJRPs/2yZS49pbADwnU/W52CC9aw3+5XE9tP6fcUyXzYKGaa6pS3q
         YWUVvOdgvTi5rwA827pd0vqJDeZwX2LmYAZEP6XhwfpSYJ/gVuV6IRNBT+Y9E2MDy1S/
         IBhr8Vqsm0/0B7HpFCkyqCdUJC2iQdQ8YTp+v7VnDUkaEysFvf7QinbfDDg+NHoLuiIA
         0zI1NxtSaPoqkDl3OngBAUGAbUk5fCu6gZjSikZ3Oo1ZxsgfKQ+rn+FqizWx/tutm7+h
         513g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778884361; x=1779489161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2NWItuYfU1D2m9f78r2wyOhs2jk9CgDDgSslfDxDFGI=;
        b=m6Fk1P4ghXv7gdQEJB295XDcF3dJKvkC2COXlAsM16C6ubCvbIJIs6LLxhPDv//NKn
         hYqfksmmwHLNrLc41pYPcMkL5PrdB1EJpYc4wlD7sEHCMOL+Z746xAKdgVAF0IKCHWyt
         Dr6AUU4PZBXnlVl09sReKvxjCewT0eciixHR7lN/jm5GT5l9M0XjL8Yk49a0s/CP/1fC
         YZEHShvP8TU3Py5pkvcMqTfX8Ad8246Vqy+iE6P4uNRwVrjnY4Cv5F/T4ogFPyac6uug
         BDv+WkJYQtfv5Nbxwc5bcV7YDZqKDOBifuao+WK2rftXSKMoqA2OOnBu74WS577XSYiG
         7NKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/jXr9NYcURSVbwyaNyPWa7PhD8nWUA9wsXIhBgCr12WhQbCApysPbPiROkgjHAShqzDV4NIaW1Esn@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8j+FoDIY4Hgb/2ZE+Ry8mr1f/8V8c3sXqrcgp2rZ0gqcbAoXK
	gg9NCx45ot8BfzqgP9omtF+Bxd2kA7T4MyHzZmrWEr8xLRQCTK+b4r8hUyuIklEGO9DiGnTemFM
	UUWkGVMhev20H0UabP5/0K+P1FGQSCZ4=
X-Gm-Gg: Acq92OF+X5ZWSiAtEbQBxgy7S8blSzJyhHJ/+dW8/hCbmju57QoixSPEjFrpogyw1no
	mnoVNhN1ZtfwK/Jm8+gm04q3q8do2a1wsw4ScnBpQMT1KVq2L7XKbRO2gMs8WQGqhF5gfyJAHaq
	cCwGUL/GCAOwZoSpNq0n4BIHNzaXQ/0NzpKt9bggvKsK1Ji9wY4KdJS+oScF11GTHx7Y/IVZ/oS
	CoPgP3Ht/MuCrH+I7sAYuDOQv60UCDzpWGM31fOxxwGdFO09krgBpyOOVqqCKukyzVo95lYi7ev
	oXBTCt7nfaN001/g
X-Received: by 2002:a05:600c:a11c:b0:488:9bf8:7f17 with SMTP id
 5b1f17b1804b1-48fe61f27famr58024205e9.14.1778884361132; Fri, 15 May 2026
 15:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <CAJnrk1Z_JWtuA3UjucF9=YH63AH_-J_0hzr9jbY99Hx3O8YrAw@mail.gmail.com>
 <CAJfpegspraqMp1Z3mi_csiw6haawZPa4zWheSUN7MhBy47aYKQ@mail.gmail.com>
 <CAOQ4uxgV4_Pet0w3f+Sq4kLkvgKM6FyJwZ4AQsnvctC3w=dP6g@mail.gmail.com>
 <CAJnrk1ZvB-R3Szn-VxOZvPRgX_dXwMLouBphnT9_URCE8SxTvQ@mail.gmail.com>
 <CAOQ4uxidwSn69A08Urue7S7n8wrGQcyGuvRL387pD+rpSFP-Ew@mail.gmail.com>
 <CAJnrk1ZJ1pVWn21HZATRes55RJD0F0+6SHbq-8FojPutQTiW6Q@mail.gmail.com> <CAOQ4uxgDGuFq=Szw8G1BMuhuBhZ029kf+FrVq6y2Oq+gaQ78sA@mail.gmail.com>
In-Reply-To: <CAOQ4uxgDGuFq=Szw8G1BMuhuBhZ029kf+FrVq6y2Oq+gaQ78sA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 15 May 2026 15:32:27 -0700
X-Gm-Features: AVHnY4LNM2kfTA98WtS7ujLuT4FWn5GAgg_YH63gClGBZqE1ZWJ9NzSsXR_V2zc
Message-ID: <CAJnrk1YpbLMCM0oUWBBp1t-zfwneWhyv35ckc5JeNxs=SXFePw@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wOn Fri, May 15, 2026 at 1:17=E2=80=AFPM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Fri, May 15, 2026 at 1:24=E2=80=AFAM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> ...
> > > Cool. Let's get this rolling.
> > > I need to get my test setup back in shape.
> >
> > What is the test setup you are using? fstests with passthrough_hp or
>
> Yes. *was* using while I developed the passthrough patches.
> Didn't run it for a while.
>
> > are there other tests in addition to that? If there's other tests
> > you'd like me to run besides fstests, please let me know and I'd be
> > happy to do that.
>
> Nothing beyond the libfuse test_passthrough_hp sanity test and
> fstests with passthough_hp.
>
> >
> > When I ran fstests yesterday with passthrough_hp, I saw generic 683,
> > 684, and 685 (dropping suid/sgid on fallocate, fpunch, and fzero)
> > start passing, but beyond that I didn't see any improvements (or
> > regressions).
>
> That's the last report I have on record:
> https://lore.kernel.org/linux-fsdevel/CAOQ4uxh=3DcLySge6htd+DnJrqAKF=3DC_=
oJYfVrbpvQGik0wR-+iw@mail.gmail.com/

Thanks for the link. I had compared my test results against runs on
passthrough_hp --nopassthrough.

Comparing them now to baseline passthrough_hp (no inode passthrough
commits) on the tests you listed:
   - on baseline passthrough_hp, I'm seeing generic/193 and
generic/355 now pass compared to when you ran them in 2023.
generic/080, generic/120, and generic/215 still fail
   - with the inode passthrough commits, I see generic/080 and
generic/215 now pass. generic/120 is still failing, which I think is
because the backing mount doesn't have noatime but the fuse mount
does, so getattr passthrough to the backing file will fetch the
updated access time.

Thanks,
Joanne


>
> It speaks of some tests that are
> "failing because of missing mtime/atime/ctime updates" and of
> "failure to strip suid/sgid bits in some cases"
>
> I had imagined that the passthrough of GETATTR would fix some of those
> failing tests and to some extent, this is in line with your report.
>
> Attribute cache and passthrough is an unfinished business.
> If we could force passthrough of GETATTR when inode is
> in passthrough iomode, I wouldn't mind.
>
> Thanks,
> Amir.
