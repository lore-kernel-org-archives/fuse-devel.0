Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE05632B12F
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 08:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278596; cv=pass; b=YwBabEWi74cX5z5O1Rjdp08TDwk/cB2ZyFJk9VO1xOrXLDhyTn95dNjWmDwj6Nq1239udvB3KPw8e1vZhNNJs0fhpk9MFqas9oQuUu+dPbOOydZyPpDhNBP7X4LK+XOByFJH0MBAhoCxOT8Wd4JeXHQF5iWlom9+CBlkC6cTpJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278596; c=relaxed/simple;
	bh=DiOnusxEQLtTiYWWGUCZdXu8RBl5ajSqJtBR9WFr32A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C4mG8yUDoQg4yC7pP2l6hj4e2tueQkAohr9stbWJyARneJz05clrRgJ3iIX9T1xo0DlcyoRuK8LBy4LlLDIBQ5K2dMoVeAWu6yY2FEdc4LZDHBcZgLr6W9Z0L8rN2GNzIef0nKWFbBgmlPrXDXrCA7OBvN6VlVrEGLlz1MswAEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=LMSk+PHO; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="LMSk+PHO"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c2c8f43aaso68475381cf.1
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 01:56:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784278592; cv=none;
        d=google.com; s=arc-20260327;
        b=Zv5FeZm2RmnL0lkEciHHj7uTF9PUv425oUpnEtNPNsyNZDmypGO/wGwEPbeqNBdXuN
         Kc0cxxc0vvbmcY7fDeiPi9aUUUI/A+VdjozGahOmtBGPzFPRP/+JctH8sSHfio3q/fZn
         BcKDaoS0M7Q4dQOX0ud0n4AzOOovMwXF2KKIbIql8mbPiyjyEJhYLSsJppflPFfpLioJ
         mYiOca6KcnlgOi0ZP49wwzMKgdFmOO4Ydw5Ujpd9I8HFNVttlccuSyZsMwcFmBHasqDS
         exNqwE4keKAXh88ZaLYzxFy0YyUSpHh6E3GNmeAPHUbxxkk4in/c26xfHNjC0428Q36q
         2Dfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+qrDm2HKWMzXxqOdrcl7BD6yjvjHMYMS5+TqLdn0I2Q=;
        fh=4SI0QU2TZhrz9sAbFCYtCMaKx6QUVVVS1eMTi+xyPN8=;
        b=gxi5DryFPBPmOcoOVatrZJ+M58i92NoV/A2ZIyOXyfTe9CbXGM+EE9ppM96j9kkhI1
         +07uOBxPYAweeM/Xtn45yTbNK3Kjaai0eeifhnIZ+Ugtl+Vc7MrQ2oiDYp4y1AEW8jdd
         Crm9AyqPqX44XH0olb4gZZfUjD26T7rPzSq6CM4QwLMP4OBd8dm/oiAsrHY6njcK2d+8
         xxV1RP6+IGx4XcouNq1mVLSRWZ4cAIdhddsaX+FGJgGVyOd3lC0i2uBYTzV7rIZNoMy7
         WqnF1IBQLsplysm/ZU4vgj6a4xVsQEWnS8CpZHgHSO/shBULSwZlrmDg6g/F1rzuWisN
         4oYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784278592; x=1784883392; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+qrDm2HKWMzXxqOdrcl7BD6yjvjHMYMS5+TqLdn0I2Q=;
        b=LMSk+PHO1JPU4L+gigVJYcLlUmyz0hoLDL3zscPBs6SJGcSvdAUAHJZtALBMczo/MX
         X5j1ZWJF6ZiSn75QXUtpOEVLyADOW8Yj8dNeIvN+sahXYtYqNETMAOgmZozv/pOLkAjl
         4reIRk4crf1isv8HUEEMjfrlXp/SxSXybbYRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278592; x=1784883392;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+qrDm2HKWMzXxqOdrcl7BD6yjvjHMYMS5+TqLdn0I2Q=;
        b=CB9i33H8Tvj9MHQkkZIyU5mS0MyUKS3xXqnf0U/1MEHPLEOLIoiJWT9COzmQHJMt0Z
         J8VD3CKGf7mhLSpFwFaeD8RyQlbdelq5lTjP5kC4HVfYWEndsNAes/6HGnvj4I3EtVbK
         TvkNLg3BQ2jeQL4LvIhDdHs1NgqEq7oBo9n2KoocCfvW7tPMqm2+JeTzBch+u0p37866
         XIAfp79USjDRv+OH8oZKpI1hGpjFFc4VUs/rDBcjOUD+3VliZKoljxiZNMDMfQUi3Dfn
         kWXAC/9V6OOni3sx/QDKHiGHmSe8ARhYYdqUqesQkbg1bK2EN/z/8+6/TU6LT6KBm7QM
         GHJg==
X-Forwarded-Encrypted: i=1; AHgh+RrmUdU+ZHp99UsoHvK2JC8euTaq1vwR64WNEs8tdgBFHlV9Cj+uFNLTFR703M1FHVIKg+PzfxBJJjgc@lists.linux.dev
X-Gm-Message-State: AOJu0YzHcxZQyJdJdaeC1FfFwZhCi16NmFGp90oZma90e1Cbt8bNVWvK
	quXd6kTBKT0qEJERmTloMNQYDX6atV2Jmk/XStKIZ5iaWp8bVzqwnFAzcSLZWTgsVdI/3ULgZY/
	Xas5twrLS5ncKydKW9teOXWtGZvDEkEi8Se4ja4isPg==
X-Gm-Gg: AfdE7cl8A4n/YASO9joNPwaalUFR5oKn6j5JZbsTZuGksZm316oG8C24ZKwQO9x6GUI
	vDWBRXh0Lb/kKue2hz7l2Ql3QSnrbh3i/oekDIW+QM2eq/6SZfYmAy1Gt6lhFci7AUporh4/i7Q
	JPhd52rGoTAQI8qkTS+E5sGqGPVmn7SHS/aLu6l4CkSHICX43UuUleqpNufgEglbgkppgulN81P
	AIfU8PAZqbO0L3YUgVDRlA2lIEfo7kexkWvb+UWziXr8SKXN3L+WXWnejLNy5gYXS40CU72HPDt
	FDRocVz3NiAKI/8=
X-Received: by 2002:a05:622a:206:b0:517:8f98:aaff with SMTP id
 d75a77b69052e-5213daa206emr13449681cf.49.1784278592479; Fri, 17 Jul 2026
 01:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJnrk1ZDc=f1XvRU6j6WsqiSAy75wd1-X2fNRhcK3j-OGDkqcw@mail.gmail.com>
 <20260717032835.922433-1-lihaofeng@kylinos.cn>
In-Reply-To: <20260717032835.922433-1-lihaofeng@kylinos.cn>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 17 Jul 2026 10:56:20 +0200
X-Gm-Features: AUfX_mzASs-EDrh0VB5BZaCBvD9fFJ2-S-mmpIaqZwvl7JdqsRLojMHJfiB55QU
Message-ID: <CAJfpegv=akLW1qzq=B=F11Qfx5Gg8qoRiV4Z-pty-0Og+sU4GQ@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: honor desc offset in readahead reads
To: Haofeng Li <lihaofeng@kylinos.cn>
Cc: joannelkoong@gmail.com, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, djwong@kernel.org, brauner@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jul 2026 at 05:28, Haofeng Li <lihaofeng@kylinos.cn> wrote:
>
> fuse_handle_readahead records non-zero descs[].offset when
> iomap skips leading uptodate blocks in a folio, but
> fuse_send_readpages built FUSE_READ from folio_pos() alone.
> The reply was still copied at descs[0].offset, so wrong
> file data was placed into the page cache.
>
> Add descs[0].offset to the request position. Apply the
> same correction in fuse_short_read for EOF size updates.
>
> Fixes: 4ea907108a5c ("fuse: use iomap for readahead")
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

Sashiko founds some more cases:
https://sashiko.dev/#/patchset/20260717032835.922433-1-lihaofeng%40kylinos.cn

This is a large folio issue, right?  I do wonder why fsx-linux missed
these with the large folios enabled.

Thanks,
Miklos
