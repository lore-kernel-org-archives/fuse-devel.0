Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E37C3BA244
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 10:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146533; cv=pass; b=oqAcIueGfVAS4He+iPHdssE8twIzlEE68cxGevpbJOTz98dRoNLi2xLBYQlVsVbTzUFQGHudns4AM/h/sHluly6S/9bNwfutbf1OEmmq0Sui7+ZX6BP2o59Z6/p8KYmxCEDt1ASoeuF/jZwCO7qGwrC7S0+HebercV+T7Xk1gf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146533; c=relaxed/simple;
	bh=pfrgNF+tr74oCJapKu2IFPZvUZW4uOtS7J0FD4Ai+4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ir+ddrx/YUm1P3P8goOTMNh5gtZHdw5AemBs+1EXCXpNGpVf8XlVLCLxbIZ0km2b7MgHjrYICnnERRGR94Df7JBgIKCRby14XNiO80yzq1BjVrMgV9nqzodpk1elzL4NGfwoscqHNqjkF7Q1GKycqhXUrpqbhuBWx3Q1d5Te57U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUPwZxey; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUPwZxey"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8565d77c277so48520867b3.0
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 03:28:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792146531; cv=none;
        d=google.com; s=arc-20260327;
        b=C5KyQpKGgDItJWwesmjy40vqlSdVa14F8PNURdVQMy32a/p4Tf+bg8UBn7+/syu3qa
         UR4kr8MKo3Dj5Wrb8DepstubgFKgwmGuki9zmrK2VmmcRxM0uWh330uC5gubyFGmSkFf
         irbHFWiCgBWeutC4MXnhIXyQ80vdgCvVRC0WV9Yd/V9L1s5M82L1VHkVIZ35j+fDiRFk
         nu77wcQ+8HD03du6XC0Em4QuQ2fQ7onFzcw169CVSUQTLFUwmw1/V62PWOxZ+RaKYCWB
         t4Jt1UQY6NO0ch7HczwWLhhsirzVTd15ONSjpuh1/OeXKS7agKqPdCuVw6+hZ93CYjNm
         JLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zV6ZIduNaIczlafS5ObokQ7IxrGgGQYf/oXSNU6g1rM=;
        fh=A7n1l+2ZerN8S59oze9IBpMmra2m44FNPCmamwjNx4M=;
        b=PCRcN918n8h7NgGdD5XcX9+01lHeG+kacU3n57L6Od8y2EUvW97A5Vs5WCfXAH6XD4
         r/gSeZBcufozgdEJIuGf8yr2BSSWnhQv32LOEFesOyeWRBHtIc9fWx+8tuO43JyY1rzy
         /kyKHjz7Ynj+Qk4Njblcq7xRBxLBsUi83X6rc2aAgVgmp0kv/CHWf2MCKrfliI7REot6
         8jFxpq4PLUlkkzRRSYOGhN0Sg7r76r5cZkP9LWYWF1EaOg6hYjwCnk0F/Lfch3Zvbvcs
         WppHwRCiFJa6XKOxpwwg1JzxObIENMknmLSTcVLFWOmFQFClNb9REjiKsmEsFpskkHhI
         g0OQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146531; x=1792751331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zV6ZIduNaIczlafS5ObokQ7IxrGgGQYf/oXSNU6g1rM=;
        b=fUPwZxeyi6IA7vQZyalQkn0DdOmeC6fTafvWpoEpLXi57GcwvvRno/3KpD4TpkPhO5
         AqoxpiX2O0+kNWZ7jCdHhaaZZq/tXcO+WkFbQSMyOlTWZ0B0w6EQDDbRaus7iWSa9voU
         cemTaifOFQ0ETctnVeHdWmA4D2NtioSxU4zRHDN+wy7mOJOsBapYZ8foH4CjtwRXeKpL
         /DMhkunrmUHTgxrcy8fbaUPwOTe+KSdxWtRdF40yDIec37Mv9zUBrPzfxjd+6kgXbApx
         //sKQzABl4fpcpYwkaqr/UlhcG0xhblmZ2vM7KvdQjI+s1XiFDa8nY3yZjjDGUVkeeTE
         4gxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146531; x=1792751331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zV6ZIduNaIczlafS5ObokQ7IxrGgGQYf/oXSNU6g1rM=;
        b=UfbdrILVddbP6f8oO9rk+5t05eXHLUfetpCH4OZds1bVhMHlB3tqtDNZbbVB/EBf55
         DexbL7k4iMs5lSlLORx9DS1bCTNtemReJEJLSUFQkrt/mhKT6aaYgNVDqBtGz8Z9crB8
         7sCUqIV14yPJoWFm/FMtl58i/T135eM4PHc/s43Wc3lTSlonPwzNoJfclsJ1Mv/PpAKd
         Tk3ZA9BLzahJJzAu+iRHsi3aOUsUH7+MC6X+fpqA4vWMoXrpVcohf8O7x4djU3Ohg5ex
         Hz2CgMMViw8kI/IqiprilbkjuZzlRghNJeJOJmTAXUjtAU2a5R71RuewqxSPiZmaYEYy
         VmVw==
X-Gm-Message-State: AFq9FYJhetajNNoSPRDStzbYFybcz89B5BKvnu4rUaqY0HNrKP4KJlPE
	DSN15bPG8POH8ZrsBESYOUtWU+k3QYcuOWXeBz+HGkapK42CR5FmbYec/om9MOk2YfkmNc+Z2KF
	qYlAx6B+XbDqBY3UjJEE8g4Sgh09X0GY=
X-Gm-Gg: AYBFou0URgfLAr6zby+e4uslkoly0woPfzhOwu97+2/K9NTPlP2vPlKYNJOKX19rEIj
	Ki5F69TvtuxwB3b32BisB7FloOSCylrJLesNYJf6jLngzGGlOAPnGtMBTEjPy22nQHWF9cyuO+V
	gXV+co4AEk/2D1iRS5uw65B0gNF7LmBw0PZvT8C9e1MbInW1sjnGCMhoHoy91bsVFdpxeg+dDlQ
	PSxFujtGMbKBZQvsoMBtZAs4ykQ493cS318OigrBcn7iZQCId9TNdK43dtfFyhSyJBFmcoH+aYf
	suvJHoeQVbLzaqyu0+GiVCQJtDGZNTHOX3SiGQ2mvmDfN/O8pQ2ejWOXohWkn8yrQGFb0udimN5
	scM0E9AlZiQ==
X-Received: by 2002:a05:690c:389:b0:8ab:436f:6e7b with SMTP id
 00721157ae682-8b07ee91c26mr65816367b3.63.1792146531063; Fri, 16 Oct 2026
 03:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <pm-fuse-full-objects-candidate-0002-v2-17d6013e5066de33396c@gmail.com>
 <CAJfpegteiu8+=1QJbHq9Z9BuBHRYnmHAkYn2bMxbxxhNGvpBxg@mail.gmail.com>
In-Reply-To: <CAJfpegteiu8+=1QJbHq9Z9BuBHRYnmHAkYn2bMxbxxhNGvpBxg@mail.gmail.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 18:28:39 +0800
X-Gm-Features: AclHuK-KMTYlHjEguu9yYQE4h0G8BU9J8aYJfl5UYC5ANVzGsYvGxeSqHSHMniA
Message-ID: <CAFRLqsWfJpH_TF_B13AzBFGNsZM7MQ3NLJn8tG8Z25RY4XGH8A@mail.gmail.com>
Subject: Re: [PATCH] fuse: serialize processing table installation with I/O
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miklos=EF=BC=8C

Miklos Szeredi <miklos@szeredi.hu> =E4=BA=8E2026=E5=B9=B410=E6=9C=8816=E6=
=97=A5=E5=91=A8=E4=BA=94 18:18=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 8 Oct 2026 at 08:29, Cen Zhang <zzzccc427@gmail.com> wrote:
> >
> > The processing table of a /dev/fuse endpoint must be initialized before
> > I/O can use it. fuse_dev_open() leaves pq.processing NULL, and
> > fuse_dev_install_with_pq() publishes fud->chan before assigning the
> > table. fuse_get_dev() accepts the published channel without taking
> > fch->lock, so the installer's channel lock does not protect the reader.
>
> Thanks for the patch.  I arrived at a very similar fix for this issue:
>
>   https://lore.kernel.org/fuse-devel/20261016082243.2865588-1-mszeredi@re=
dhat.com/T/#u
>
> Added Reported-by: tag from you.
>
> Thanks,
> Miklos

Thanks, Miklos. Appreciate for that.

Best regards
Cen Zhang
