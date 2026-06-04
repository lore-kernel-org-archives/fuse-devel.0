Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7AE3E008B
	for <fuse-devel@lists.linux.dev>; Thu,  4 Jun 2026 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780582651; cv=pass; b=m3b1aiBuxGlqK4gS7Yb7vXBpwaob5pLK2Ilq0Gh3jLPa3T3xvulmdaLEnHbpOLmzDL5tlPXBPlbRgfpOqwQyvyqqwYqYnvhDp0ac1NFr3h4dVw3lUPTIQIhOmQLkAK41Kq5iXc9ZudY76IdzgjiVIPeS37Y+f3j1hq9mmESy3B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780582651; c=relaxed/simple;
	bh=g4s8q6wCkTd+WvxFn8JlUgsNJt/EdkDuJ9t+wJpILjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LObLP3meQ0ncKq0SRxbqjBHnAfvq+YZJf6KHykDBWzdIaKC5heWcYYvus8CdhxEOgJLQh4B8cIijnywDsdDPjhGUv2dCCGbptvEw3FwKS+eWNkXfFliSKStlToOKQ4RD4L9j1M6z4MOm41Ofmo1eoN/2eZSUsM20cXbsL7SzSjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=hKYZc6Ua; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="hKYZc6Ua"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51758478240so3327161cf.2
        for <fuse-devel@lists.linux.dev>; Thu, 04 Jun 2026 07:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780582649; cv=none;
        d=google.com; s=arc-20240605;
        b=SgFtWY6aRDq+XzceRITgXrpsx5I0BLTCgjJY4YwT7HP6wf5EbI5sYdWCGakNRI4hev
         9B+/hrrZNFcnB4zMYLVkKRjE7+fVCc0fE3opK4mknN+i/TJiofa3QVQGpOLe8Ii82VAn
         1/GUJlOCuv3SoFSRLPV7WeYKn5Yq2D6ER4j0lmH5cgRRCfKVBM5qxE/OMPkZM8bJJPwK
         f/SuNY6HYjr2dfWr+VEqrk04Faim5VvOtjyqEHEiRvDZC3y57yTco97UrDuYRhl9WktI
         Fn6IhhTAVdfq28FHoIixUm1yyMPlh07rnDCRx2SwVeP6SIMojcUrozj2wWlG7++51B0G
         rVBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0YcKMZOwZ9iXobTM6Q5V1uLTk3dUBPdkuRRogVK0zIU=;
        fh=ov2H6DvaykLXBhYyeNMuYmsXWV7d6b+9UzQJaB+C6rI=;
        b=HhfHP1hKidEKUJIrHh9/XPSX4GauzcEH0SZOVVkbBChvj2o0K4dcKP5NeH0GDGOBjn
         TVQ5oU7XtP+FZviN4QFa3ndu4lfVdK1wiA9nnDqCmnBYNnMNtLhctAKUrvkCnRjhi79t
         OHG9R2agAIe6CR9J71BXCzBZ0XDD6qNubrQUbJUkaMmzkkPhoeY6d9hB9xIS8EdDbdoW
         L1dX2Dn5R2Xg5+3jGlVLkMfCwl3rDN8pEPLvwybubRtqwB9JarXqkbKAPY24N1MPmj36
         cfExSKXF85L/zoMEUKNH605cBfGpLhOUzN/CXyG40U12Aduz0f/zOoYjTMu+/zAW3ywa
         njKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780582649; x=1781187449; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0YcKMZOwZ9iXobTM6Q5V1uLTk3dUBPdkuRRogVK0zIU=;
        b=hKYZc6UaEL51CQ84loh5wR3Id1vVdX4UIXrGP7vp1tX0QuX0mdOZAM9gPUNPBQk5XU
         vX+XjhWK9m9IHwPLy0WMuKvkKvD3c16OOquJz5587vUqw/+TXeY7syRJfM1bn8t01CLl
         Z1gpxJw2Xedd5Jl5RajApgG7ewUYABaYZ3AVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780582649; x=1781187449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YcKMZOwZ9iXobTM6Q5V1uLTk3dUBPdkuRRogVK0zIU=;
        b=d33hKuEq8swEPeaqeZnoXtyBS7aPApVyPfpnJZ9dLhghtfsrSUqbBm44QmMA+KbgrW
         /jA2mNTk/KU+USQS4UsgolXw+UrSjYxCjmETWijl1hAkaiqsXUbtXCFNwYpYyHnm4teD
         sax47tKWOa6NWzOOHeCKjk7sz9pmChVetqRqmR7Of3klhcEom0aFOkQ6ns/GSvUbmxWL
         T+DJ5FgyS+oSUhIAIJvZ8TUe1nPI38Q4kaIE+Nv9bUP2OYS0OK9615ytzY9+OCnrgcPV
         0whyNJYFK/ua4RYnOI+gtQy1aIPtG3ssthtINTS+Q5DAlLWsbRVpjR1/BU8hCSQlAFA/
         CLdg==
X-Forwarded-Encrypted: i=1; AFNElJ/zltWQHC1eN0bU/sWtTlTOsZtciQ1aKvIyjOfcGXbW40MPS4u8dVgmvoQSwrmQ6Ya5E1JQi57anJEd@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfddai1P+mw2xd4W3WHgiNQC5XD6b/16sj6SW5D8UiSRdcOYCj
	TjO1pfgcF6F/DmQUOiCWrJHu6n/wJqj45vSjANDqyBQtgmfzUt4NflJRlq5zzfio0CzQp17nA87
	LZZv0lv8pwtnMZ6uX4KZTFSH1Zf7/09KqVU6/EoWlcA==
X-Gm-Gg: Acq92OEHrfZ3pvwhK+KXcZrTM2PMq8Jgr1By/v4SodFGI7rzZEnFPqvbGn3fd7U07YM
	Gxe/quZCE3DYj2PJfUvTjUsnIhpOet/RLghhNHooTdDOHPuqKd4D7eGuxyw04NdXrRCKAdaR84F
	bZ8dB3YnX3utJ1UJ8NSqpIBlSvY/qp6MfGYZPI8POUeKMvwlRAWC+VWhcuMyAa1jVd0jaT/MUIn
	znXcdGNzyX2ErKOYK8ahiB1yB+JcixegcWANiVTAr4bYb4IGB3Cy4d/am38tEGTgwSyWXfDupcv
	l4nPPdOdIFnhqoN/bm9bP1KegtYgAIbD3p5UZaIeXGtQlso=
X-Received: by 2002:a05:622a:1c19:b0:516:cfb9:2856 with SMTP id
 d75a77b69052e-51778683f95mr112927071cf.31.1780582648812; Thu, 04 Jun 2026
 07:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529134302.1989958-1-mszeredi@redhat.com> <CAJnrk1YQO99GUfTF4n9SOrAVncLYraA+mc79Fvg4g6Fum1m7VA@mail.gmail.com>
In-Reply-To: <CAJnrk1YQO99GUfTF4n9SOrAVncLYraA+mc79Fvg4g6Fum1m7VA@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 4 Jun 2026 16:17:17 +0200
X-Gm-Features: AVHnY4LvKDF5pRQTNZRq4yOjJPUv7iyIYXVDPDNxqhKwGjyI_EEQPBIoVtdu9wQ
Message-ID: <CAJfpegv7AL0+j77EL53iEMgpHN0nb6ExuB83m+UMggMJkvQqzQ@mail.gmail.com>
Subject: Re: [PATCH] famfs: FUSE_GET_DAXDEV -> FUSE_DEV_IOC_BACKING_OPEN
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, John Groves <john@groves.net>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2026 at 00:13, Joanne Koong <joannelkoong@gmail.com> wrote:

> struct fuse_backing {
>         enum fuse_backing_type backing_type;
>         struct file *file;
>         bool error;
>
>        union {
>            const struct cred *cred;      /* FUSE_BACKING_FILE */
>            struct dax_device *devp;   /*FUSE_BACKING_DAXDEV */
>        };
>
>         /* refcount */
>         refcount_t count;
>         struct rcu_head rcu;
> };
>
> where that would let the idr just be one type and would let us drop
> the fc->famfs_iomap branches in
> fuse_backing_{open/lookup/close/files_free} and the corresponding
> famfs_{daxdev_lookup/daxdev_free/devidx_free/teardown} functions and
> let daxdev piggyback off the refcount/rcu in fuse_backing. Otherwise I
> think we will need to also add the recount and rcu to famfs_daxdev
> separately once unregistering a daxdev backing is supported.

Agree.  This is more of a PoC for the uAPI so John can experiment with
it.  Will clean up the kAPI once it gets some testing.

Thanks,
Miklos
