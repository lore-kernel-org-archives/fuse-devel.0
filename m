Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65AB42981C
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605599; cv=pass; b=f6ZqKHDFfT1U2WWHm7lMI3rESlrDy9oKVWzKGHCi6tMQOH2GBYSQgSPtg5dzq3vIei7mAycEgn2WLmfyEDWfY5+IYrKiY61t5NE03J0Nw84EPtJvhXrU8uTIYb3xyndrwmNLxPokAAVbpUmH6K+qAaW6/q3c7wRNVgJ79oWhCQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605599; c=relaxed/simple;
	bh=fZqx4t/bQI7F7wi/K1hO0Hh11Yzk4TY9FVsSsvV08Fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8yd7XXnmiSotcW7c0SNcTc2OshGrRLJaox1kMkTlA76etugebWHRCilF/M5MorBWvdTjCTzbVMijPbAYWO1WP/nARgVHlTjGdPAM1+fYblOTXgkwNdfbSiD8pp+BDgGFOJ++BEGFSPhU3+5QA4A3val8Q7NkdY/7o11oOrtBPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=mkW70cbv; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="mkW70cbv"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-517b1f2c668so48788761cf.2
        for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 03:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781605597; cv=none;
        d=google.com; s=arc-20240605;
        b=YxyNHwGPDpSzOQKZA0hXjpLrQrIT3BA11mohl+pwU1vDgX+L7imy8DAWKl1W60Ih53
         v7KpWnQRZhoV2Z2S/gimxGAjIjxzW+qxbU5h/o2T3PffmPxSJLSDu5I1FzYXbea/EORY
         HhNCcHznU/byqzhiFPXKAaKhdR3Llaro2OknpxFyxsuVhXmnaniPpU35s9H0QlXxSFNr
         TFw5s1DIkjm5b3ylr/zxE/JLoVPJj1FQap3Rioew8iF7qavqiPEXzHoDqkWeF0mLJwRB
         cqs8o6LVBWces/T7vXrZv3Tr/5l2Ns2oN6UtbaZR1XQOmE5CBw8PGzACWvDbe02aPhJp
         I3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gjb8efrMaJdB5dvpiI3QGvSixI4jyVcwzq3+jljz3Ps=;
        fh=w2Dy9MBCymTAHXuuQoFoyTRhGtZ+o5YcX5Bg6rpudfc=;
        b=CF/tchtwFEN0Q0mIx9KYSmo47pqxgNhabgbX6opUF0MOXF79fWN1zymZYYNQVaSS5g
         i/n5Xy98d0uhEzcA3XztB977JPYAjLSdjwQ7Bw9CW2rUbt8IHuzxgefOaK0m2Y47BXF/
         +Gjd4pP77lSW8GlaY1KZju7NoU8ZueofReisi05GJ462cL9hhESj5IN6Xe+zBSEsM0xR
         NHhoopvMpXMi3LRGdh04ge8ltFKkFQDiGPMo9x2BUbX5pPkob0+FvYQDI0H8naG4Hm5J
         a5TI8abXzMP6YwY6CzoC9z0SHQwXSG8TRhnwEJQzg2BZ7qc0wv9PbgfY6egyBnZQPuTi
         r7KQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781605597; x=1782210397; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gjb8efrMaJdB5dvpiI3QGvSixI4jyVcwzq3+jljz3Ps=;
        b=mkW70cbvYESlQCp8HXX1foJhM6zXHc0ulpU5UZTjMaZNlfpx/i39HG9fm3a5BxaZ7W
         o9Htx3uaaN+dceiaKlQ7r2Qf7v57mXp8Ho9HZGQsSwSK6CCL+WlG3sIDqLQ3HG/2uJ1z
         t4y7ld0CDE8uWR4TIsvZy2R/3xX1eteREfy64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605597; x=1782210397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gjb8efrMaJdB5dvpiI3QGvSixI4jyVcwzq3+jljz3Ps=;
        b=Yy7uaFBGiGhrhLejRFbKD0z39PwoOM/tJVDp0eeTqsUKtNMfpbtSXKb7tomMMlk7IX
         7zeY4AWRCWVA8XH0Jf2E1/ZViphmtZQ5bmkqFrOZujejGVYIqHikhPSLTO9Yp31Tv1P8
         ORd5tj06UAcwYfMZxZcKJyL72OBmZtg160niWMHZfTYTghbJTnEPtz6E+8nkXJnoxOFt
         ra+jcM/em8EnWdOaO5ShaMiI00dgBVCXyAcQRVLIon1mnT/Joq0ezrle8dysevzN5S0/
         T0YMypvGfNeV/1IKpW1+xAk96jPz+DZVyPz9HFj41o1JBhjdRn7MSmPwlZm//CenQERG
         pUUQ==
X-Gm-Message-State: AOJu0Yyt9Fgi/HUCcN29KrbS6p5Ku1Fwz/dqMOJqXCYoDEbeBTiSiZMv
	r4wUjaUFjTIFEfXe7YkBd/nvEj+nZW4cwgL/WYxzqpJSZrS6E7QlmaAAsFUi39K3Jz0moLBVGLE
	UtJIvmn595o/Hnb3PxLgGNOuwlI7o2k4DEFf7VeklJw==
X-Gm-Gg: Acq92OEo7CUL9RY5H4umEguBpOdGClPpctUpOfH/2valsZaT7FC3dGBLIzkLsWMrLr6
	WlwOtack+xG/O6Hs6Nm68oiq4Wc0SoK10SlFcw84W2nQ0/AjkQvIRas9S/76RdWHCEKtfboUPAW
	9ArfjZI9N3os9OfA5EtInaF3x3j692L1d9n2O/aeO9WnN5wr0RXAourn8KBD/iCCmCHECXJBapF
	UVMgSw7gY4TKQwUG6GdEm5manoO30xAQhXGntyCOh8VPSecca+Ulq92ZMcxMm3ltHxelzjNSAg8
	ZGsJbNFP5eYsoEgn5+cJDVy/j3LdefksDFmOyg==
X-Received: by 2002:a05:622a:8592:b0:517:8da1:4d3 with SMTP id
 d75a77b69052e-5199195221bmr34189001cf.22.1781605596757; Tue, 16 Jun 2026
 03:26:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com> <CAJfpegsWpKE4kUUQo+NK_cu6oy6h6+A1M=xokvSQbFtZzu9UKQ@mail.gmail.com>
 <CAJnrk1b1nVFZ8dQYA=iGn-p182HNhhRfZEVe-e_ks_daZAU3Rw@mail.gmail.com>
In-Reply-To: <CAJnrk1b1nVFZ8dQYA=iGn-p182HNhhRfZEVe-e_ks_daZAU3Rw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 16 Jun 2026 12:26:25 +0200
X-Gm-Features: AVVi8CdHaLCCrQblWO2Q7Nsm-xL9C2EiB0SPr0OdPZP5yhPPrf_LEMdj-GWsR0w
Message-ID: <CAJfpegvNyqSS2h28-0sB2j2HUoMnKd7StMsPbvNPz67PiS9w9A@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Jun 2026 at 07:28, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> On Mon, Jun 15, 2026 at 4:41=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu=
> wrote:
> >
> > On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> wro=
te:
> >
> > > To use this, the server must set the FUSE_URING_BUFPOOL flag during
> > > registration and provide the payload buffer pool through the iovec
> > > payload in the first sqe.
> >
> > I find this interface inconsistent.   Decoupling the buffer(s) from
> > the seq's means that the registration should be decoupled as well, no?
>
> Looking at Bernd's reduced queue series [1], I think we'd most likely
> want to also pass in the number of reduced queues separate from sqe
> registration. I think along the lines of the config sqe Bernd brought
> up, it seems cleanest to add a new cmd op
> (FUSE_IO_URING_CMD_QUEUE_SETUP) where queue-level settings (eg flags,
> number of queues, bufpool, etc) gets passed in.

Why not a separate op for bufpool registration, so it can be done
independently of the setup, possibly at some later time?

Thanks,
Miklos
