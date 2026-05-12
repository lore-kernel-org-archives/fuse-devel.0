Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076633E1201
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 08:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573890; cv=pass; b=blBpMnXdM40kQK51zqvTmcnwbLiThFyA7Kt6qE9EiS5Kr18g694SkdIT3YYFQP0RiPY2+J0n9r7JZkalZr7jag1ku6hHqy6l/o6Lbu+x0XVMB15f4r0i68WtYyaqfynQPJc4GjpqQFeNqLioe+vtx0wWHV9pD2lPeZnd8s6me60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573890; c=relaxed/simple;
	bh=fR+t6t85yPJnynwdIiSSs5MN4Gx5BVIOQQ5VhnY/qCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZxbVjeK3VnZbGltIzEKMpuLR10oOmc79bCMZFxtZYuNPZyQOM41sIRBCGcSfoqzmDHIRYApiG3S1eSw3eyxbLWkci0SA5iPrs5g+HhbkY9zpUvXTrdAYMQ4PW8kGNaKqY2NCgSdNDJ/lUL+FoDi2F/KYXJ+E/J5AjFUHhLXxWCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=PseusamL; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="PseusamL"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50e97863425so51895851cf.0
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 01:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778573888; cv=none;
        d=google.com; s=arc-20240605;
        b=lbqlhKBWo+VAeQyQWfSckXexI4q8+bp2D/BdLhKnlVuv0UEWYj6kCGftDgT+9HeJ3/
         9LSs5SmIvRQ9tDSKN7LrRjS3gF2LIQZjwvB/1sBW6M3oowwZpMFVXDt3ab1ym/AE01Hs
         76H2aqzVG9jyWtaCerSzSoQ4OgL7X5mPfL+unWsP/7iykI9NXyjCvr6n7u1lrDoI1B0Q
         T5PxmLSc63ztRmysRzjQgVWtTHZhtYAI3TeeKVpSDqA8s7o8PkvzPs3R/2yEWfcNH3Dm
         lAkgMcJYdxklV9jSSxechCmonMYIHPtAc/Qhinmkd+rO4aE+pt0cyPWNfpC2WB3jfrhP
         KZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fWKdZDEIz0/5AIUpgkMgXgPG3fN4lkF6Tz2OI9TrOac=;
        fh=RIei4gAho5CNDLuKjtY/QcKs0YUkOoB6MxdDEwu7o4A=;
        b=L5jmKyWfIFrtu0odLDwoJBEUNXkIJaTSw4vpmKiYF94XsILhIilmh8BYt+rDGJ8s3q
         QGXNXxF0gFVl36v5XjCwYGPyzFtJxseI0gEyVbmB3L0C4BQ6HNuq6vLVOCtju1X+zGGD
         DNqXzNOpz4cQL+rLahoJDdOfQ4DF1v9NWYeIBXXAFcy5vG41eaARnVfMEOFyLsgUEDsy
         7urGxqnxuc3627WFP3uCVux5i29w0oDHopa+WQ9FzgW/f7kWkwC9uSZZuORmShFOnnGO
         Wx2bVZ60sq0Y8ggWxxrUPWdgEPBA5DLSxUEslMl/e9wIpYM1nmL8lcFwGnz9czNfGwvJ
         JPjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1778573888; x=1779178688; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWKdZDEIz0/5AIUpgkMgXgPG3fN4lkF6Tz2OI9TrOac=;
        b=PseusamLd2mD/Srp0Ku3DAfcwDMSRrCk8K1BRo35dcwCVm6xs10DXNxAKg63sBCddA
         H9K3WlvuwyXGpD73beaN6Tu0fSnqmRtTNKl648Tj8poiVHKI7NqHo91cTVt2vdTHr7C2
         Tr/gXtUX86j/3DRkYFETu3yewqO0xSWBvKY4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778573888; x=1779178688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fWKdZDEIz0/5AIUpgkMgXgPG3fN4lkF6Tz2OI9TrOac=;
        b=KE6cpcz5UbCPkyNLIhNCrs8JkpOvYS0bpLNSgGxKsz4FefjSgmPFJw8I4IlsKqq4uT
         hYH8cKBsvBEp+tYdUJYZIDZ2csuTI2aOZmbl/4RlClA4DqTbmg481lqJZN1la1OWno1H
         RDgO2fO2fO8zD43KXb18imSyw1Yl5jLiYegSIXVbDfhyRzYrP/nCpN652I8gttaGkAnz
         BIeqVpNsy2fOi9d/aZW477z2pxFF++Fh26nugdskOAr+DjJyE4BTwVC4W1DuggOn7/yT
         2AGfOJJocp+WFzyoGzQNuk9oizuwgeTtsU/Bo92ZY04hrWnvY4rSVLD8kqXcG3FwFr7d
         lmUg==
X-Forwarded-Encrypted: i=1; AFNElJ/nD0Ql/xKghvI44BtZNPVzC+EzTUF4Qg/XwmT418b2xqB7oT5w8qsTWtgdiiEQhuXoZCA4Ggx81hds@lists.linux.dev
X-Gm-Message-State: AOJu0YxNTNBDTPbGu5+D2xd1PDVqGXGAo75dTGqb76OczQZWWGsmjMaT
	h65jXh8wcjq3DI/mMOh6hOTRjwmTMgD+oBlLzN11UwwnSjjYAPNPm8VXahCOqVI71yCLwYA4EQm
	9htnPqSwPFUy2h4965Qzc8Zpt6x+p0su6SIDhHRAsGg==
X-Gm-Gg: Acq92OE2wJgpTmEUpi26UUxKF23mcwb0S8JsiF0gSE8/FuPXta/mn6WF/+OwsRKZlhB
	0PMMWuIeKxv1V6oYQYsZn7BemkSz2vijhJ7PJQEkNzwH/X+c/LL7pq4BFvMSb2NuRITin+b3nOu
	7Y/B5/yn4Smp+4l41x3qb1BkwhX5+wRef3yjGxRp8CH696xEkO8IVSmHEqW/IlXcrakKEvJHOwp
	NQ3hsJnBikhV2mABlhgL76YrvAZPm0UhOJ4H3+ldpPWJc/L7fsXRI2nTG4VXmnwQMQT+hMfSbIr
	ccmaPDMNTflgS9eqTkfdb17x/u3Sv9/aH7dHRdw=
X-Received: by 2002:ac8:5ad5:0:b0:50e:89e6:669c with SMTP id
 d75a77b69052e-51461e7ee12mr387316851cf.37.1778573887932; Tue, 12 May 2026
 01:18:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <afxK2HSiwY32KaWw@fedora>
 <CAOQ4uxg-tgCmJkjFAQ86_xB7dDQKGy=geKAcxT2vB8cUSEKdPQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxg-tgCmJkjFAQ86_xB7dDQKGy=geKAcxT2vB8cUSEKdPQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 12 May 2026 10:17:56 +0200
X-Gm-Features: AVHnY4JfMfmMXvsRGKbeyZ84gKB5B6Ce7WEB8KUqMJ2guAlNbV7mShn9mWFkO4U
Message-ID: <CAJfpegt7hj=WDKKASjWLVG-R2tGYUKMJ1qR0iv_Y+GaYS0mW4w@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, Horst Birthelmer <horst@birthelmer.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 8 May 2026 at 15:01, Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Thu, May 7, 2026 at 10:49=E2=80=AFAM Horst Birthelmer <horst@birthelme=
r.de> wrote:
> >
> > On Wed, Apr 29, 2026 at 12:20:57PM +0200, Miklos Szeredi wrote:

> > > Major differences from regular fuse:
> > >
> > >  - local filesystem mode only
>
> What about things like?
> FUSE_HANDLE_KILLPRIV | FUSE_HANDLE_KILLPRIV_V2
> FUSE_ATOMIC_O_TRUNC
>
> Does local-only mean that all those (and default_permissions)
> are handled by the kernel?

Yes.

> I see no reason for fusex to not support lookup by ".", which is
> anyway needed for "reconnect", so a fresh FUSEX_NFS_EXPORT opt-in
> for "re-export to NFS" may make more sense.

Why add reconnect?  If server supports persistent file handles, and
all req's get the file handle, then no state (nodeid) needs to be
stored by the server.

Thanks,
Miklos
