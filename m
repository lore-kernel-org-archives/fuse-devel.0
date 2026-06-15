Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7700F3C3439
	for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514371; cv=pass; b=i+QojFJMIecHCa9azdNcHB7FsSwJSmPSdeixqBVvwqvyWx3ZtXOc8OFMWoDGNxElZU+/+kMy9pv41/Gw+Pne/q45wa8G+a29Cls1ZBoQU4U0YwRuvCsopYPgcRr628IhChZ6IMnjasdn591LX2e9sVFJhsQ2n7j3h5/+rXdUO2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514371; c=relaxed/simple;
	bh=HR7ndwoHbGcHjLA56nW29Es/UZgqXH/akJ22Ot+2m0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIaieCAVseceqAdMSMcjk9eizb/dl8bC3NzXcMtFBwX+X4epZaCrEStcoplVMCp1Hk0R+GzeVhVoCCkK/pASVlebk0XDjgLnliZSRoMwc2KCK0NfSdPaJkzEIXtDqwmHg/DZ9AOeztM9Vi7gb73zLN1cc1sgXAx+gfAjO4wYWGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Gw1L9Km6; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Gw1L9Km6"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8cce77eb087so27517676d6.1
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 02:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781514367; cv=none;
        d=google.com; s=arc-20240605;
        b=Zw1R9liUpsmrPYsMNK0yJZZI725Z7bK8I2qtPn61Asvr75spJLo74IpSaELxB4YTer
         kIIrz1v/wUmBcB+nC9Rp+ilEqvNgr7sBfRTztwtyKAn3/+ccSIG0lAMbmiMsLEv0gaKi
         EjciMjf2/ok+Zh78lzePTzLaK292u2acMB8vM1tq63IXDlNPDTkF74EGn+hDUFeXhde8
         eKKtuDjtAgjPOJq5WSWn8hAqb74zc0afJlJvEkwEk+0w4n/ocrK8CLUCjG26aj6WFhlW
         FhHaX2+7ccj2RPikpL5qJyuij4QY807Cz0+IY9iDqdbtljfCaPOZ6cMBeQSsQo5/y/kH
         +wmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V7VN1ym5TubmX7uaTRm3VJM/TsZx79pXZAE6PxUgOoI=;
        fh=w2Dy9MBCymTAHXuuQoFoyTRhGtZ+o5YcX5Bg6rpudfc=;
        b=FfOOy8mcxKQITsG3f3kRHWLGcanxikSUYhYlzzWZY3Y42+HOmnRatv8W06e56TuBcK
         eCg7U74WRN3/NyWN7hgYdc3tchN1YKy13vBLSNcvQ/1TFYrHGMuaDoN51pz2ydzWriv8
         VC4roNvHr8Y3Yi1IW84T1WZDa5+96XA0PeYbhFxmp+u3d9NDP71YCZ1OsVVDY8zgXRIE
         f+D7EPTdMVcUrJB2qG8AHWwjxSB2BlGh+VWXrBonsb29y0dXM+82BcJM9oSEqGtbkCVZ
         /U9q9Lau0pPJTt6AA11PGYwwaIcPLvOwXZcQ4lFzT1PDSced9GGqFtFwpDwkx0NI4YbD
         bCUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781514367; x=1782119167; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V7VN1ym5TubmX7uaTRm3VJM/TsZx79pXZAE6PxUgOoI=;
        b=Gw1L9Km6I6BQi2RR+DljzpB6z9tY/iuyhRPW8p+VEdj8h8p0dMBIcsh/woNPYuhW0n
         18Bft5SJo4MEEeupE/0FBm2kGCzj6A5HRDia7lL2Me5yKSGKfwfvwyeehZsNKeOFFpcP
         /LqjnTua9zY/BpLCuJrFb8CkAgE9Mp0jwWATs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514367; x=1782119167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7VN1ym5TubmX7uaTRm3VJM/TsZx79pXZAE6PxUgOoI=;
        b=PXBUv0Ah5RTE8OBqf3hGKSUY556E98N/NhOXy5QcWNtRdJN1oB+lMDA9ijag6KRs0D
         V4iWby8HoVlo3HxNypDbKxAph5nnZv34mkyJpn5OaY1/bFjS7FcxWT/u4xr+iBF/l+Kw
         qiIAmlfTzWUv0S9ekl/vgSAcFfqF6Ecrs8tg09h8px4EJmyKXdn+CFsnJuS1wo8uTDbc
         aSaxgYSkfHFTacHXHn4b2fI83CR9qhEw+s3uoUyGyHP9Ii5tXJ98QiuYbVU2w6sBWT8N
         jCwnyJbS59rYaj3x0RR4/4dWM3SgpBB4lNuZHLBuaalWJKJx9VFbvRlqwuhO9ViaGA/9
         qzJQ==
X-Gm-Message-State: AOJu0YwqsbsyGgCimzEAy9GbHmmGdraa7ybD3WOY6MU6Tr3nvLL5QVgT
	UQqnYSZotXQTc+qUmEslKsMPpCVafJdcqtXIp/zhj/qRBfWjdNRsE43KeHEHdiJCX26T4zNWwjP
	1Wkn3LGBJx+KrkYPFD0G9Yx+S9eYqoT0+xj8ZN46GUw==
X-Gm-Gg: Acq92OFnsqs//J8taiuR1r5XupNlqDNvcZO6z8RIS1snR0RZOfpitxCtGwBVV+dfw1Y
	9vTOFiCmfzR4/8zt/YMhN2w1o1Ore0JK0v5vX4uZ0Xwoco1iVXHfQtAtXw7zpnUReAmxV0SUeDq
	yFHfbiA6HZVxBL0Uq6Xoteoq5GjCfFasfpB5lDMOD7WDOC9ayl7LL6C7c67lwtlv1rjlcnbJgwn
	8kObOgpdmb2QuvPBGbokDHaT7zvm+pA5AnSBTz8RwmnUvV2W46Ka0p4B37ugvoZ5TRAm/pIWv5m
	ozmb5EH9z2yhoA6fmXtpf5zlAQYKxtIzJ1mv3Mka
X-Received: by 2002:a05:622a:2598:b0:517:580c:bcd3 with SMTP id
 d75a77b69052e-517fe230451mr193211741cf.19.1781514367174; Mon, 15 Jun 2026
 02:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com> <20260612210513.1516038-9-joannelkoong@gmail.com>
In-Reply-To: <20260612210513.1516038-9-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 15 Jun 2026 11:05:56 +0200
X-Gm-Features: AVVi8Ceakk5mGo7kalt2CUm0NwNG5B0oOaXzCb3T-cju8ZhBnHzLYE0DefNBnKo
Message-ID: <CAJfpegsHxCbhZ8v1W7KA8A+9mUwR1iXEoxDDk4vhVaPCpw7Wfg@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] fuse: support registered buffers as buffer pools
 in io-uring
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> Allow servers to use an io-uring registered buffer as the buffer pool.
> When the server registers buffers with io-uring, the pages backing the
> buffers are pinned upfront. This eliminates the overhead of
> pinning/unpinning user pages and translating virtual addresses per i/o
> request. This also allows servers to use the same registered buffers for
> subsequent backing store I/O (eg read_fixed/write_fixed), keeping data
> in the same pinned pages without additional pinning or mapping overhead
> required.

Are pinned pages accounted and limited?

> Registered buffers require the buffer pool (FUSE_URING_BUFPOOL) to be
> enabled.

Is there any particular reason for this?  Not saying this is bad, just
wondering...

Thanks,
Miklos
