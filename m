Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E9742A169
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298043; cv=pass; b=IAg64VFa3mQlhfDQd3Nt20B7J4HJHfbz/FzM0FCacopdCXM3lWgLZS0Szt+/kTUeFbp5HZJBksFeguuL7/lQmKiqHYPJ9VfQuprRvkuzqLdDgXF7byNXWs/9ZWPdl3xYOyRO7ZHVq0FYdWt99e3wCkGQMdTulmrszPVaoR6bdbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298043; c=relaxed/simple;
	bh=GgDM3S+JmeSIB1blZsC5hah5tCrkpiQGhtM/gCtQUYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovEYMIToZA+Wph9igekJHHsHY2p5a16Nn7k6Lln725MzkBkw/vsjPm5nFjWpaz1T2t9DGOTY9N+N3SYGFAPjOpBplISbmTX8QK1p0TEwptFUH1HTvGMi5MayTAh7h6J4jYvUJnTxnNhT1oZc8fxo5aApTonAN7nOyR6QOqNhUJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=i81ncSFW; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="i81ncSFW"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c0006ea8eso56935071cf.1
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 07:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784298041; cv=none;
        d=google.com; s=arc-20260327;
        b=O26OlX0lE1s7DRfuJtRNaEimI2iYSnzRQPiVIFroXhIMI0YbVjNSI57VhqOhqYKYoP
         +UKlIJLBQpAqKAYfFepT80IhaEv5RKTHWsMr0nWB0s3AQGyFE9F8EM27MFObx9cFnCTG
         Mwt/cf5nW1D3wyfcLFaBwecv7yTNNEY0Ou9icnF1AZJa6CdwetbZbymI6U9Fgg53tVN2
         Ltj/YK25zaDCeu3Kkqi/crOiK+hyx+SuYfamPHXYSkSQRFgZUr42oR0SgJ4PLYyVLKu8
         dR8l94uSs4DEtsakxx8yQ2JDULNOTfwyls5zJBpPh5ZxP0QUpDG2BYjSN20crBlgCNF3
         4C6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GgDM3S+JmeSIB1blZsC5hah5tCrkpiQGhtM/gCtQUYo=;
        fh=uvOizgSQE2Gnw2hc+mdiCAfMiZ1D1S0ZN4rcNXmqzKw=;
        b=iaHnx1VpV08fg4jg5UbrLMV3leDkd4diVQpfcfJpk0SpBB1oNGy7lo9uZHL/hFU19X
         HokSIscyCrvMbW3hxjsUCuePsNhWpJn3YrEo6K7HoWJTAToB8W5Ayk5uraU5hEGwmifT
         H1AhkMx7ji2zAegvvV6fHazolpcid+b6UJjXi6uXjS8BYm/AK6+Nx+84Q59/FTD2ud7S
         LIgpEi9Ss/ejUeu52cvy1iLnVJaY7ICOXCeBgS55xXWkpfod5hsZNOennhFum9Raf6ag
         AlkrquP3mbKLNvyKiEUa8JqaAcDQd124dSnL7OcabkV73DXVb4+B8ZG96VKFGXCPwWZA
         Wojg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784298041; x=1784902841; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GgDM3S+JmeSIB1blZsC5hah5tCrkpiQGhtM/gCtQUYo=;
        b=i81ncSFW6oHC06CQRFlCRYF5pxQfGDWMo7hYlXm884Iqq/fe8RplmPZNWKItVBmLTv
         OQiz2kYo/h/1n9qnWujfVVMLSpLlwybpuk7SYVE13SMxs7ry9/dOWCSiy2IBTqwkDUX5
         90psPKaKCtZsp8nH/kaiYYAMdwai6rkBVojTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298041; x=1784902841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgDM3S+JmeSIB1blZsC5hah5tCrkpiQGhtM/gCtQUYo=;
        b=VpRBm7UT+8NAaCjT+9fP1BTleXSp8xHfoJefMFQylRMXhleFgl5iWbrHaytNukOO7S
         duCSKB89Xyb7GeujZQdKha26gQGFy9Nxfyquz6OtC7A70FkCpWRTKMtSNs+PvxcHnbUQ
         byEM18d2pnUBN5bLuH9hTsjWG85uJX4OhPbTXoRZPZlIrm7XRq/vF6OuNOqZ1wQLvFOb
         1NgeHci27Sfh/Ha+djqztECdc6KX9Dm37WR19OWtSVFSmVZAzfEnzPHn+i3X9UUBUf4Q
         s7dtb5n/M+3PsKAZsPsk+W5CNjEO6qXq15qTq1ynSuRUd+aDLd4OYlFnnmEUVX6UEcEP
         Daeg==
X-Gm-Message-State: AOJu0Yy7WUjELCOMF97644e8zJAfJDKUIk0xmuqiL2I2UxcrTIM0zYdx
	k7b36NfB0oncDj6dnMsXeaZlj8s5vhous8pZG7OFsowU5JlQpyunuYT3icMqHa9dx0xoOmOV8qs
	Cop9jwDyRuA/0JLk1FYjO4OprzFpc0GWytI2C0jPC0g==
X-Gm-Gg: AfdE7cmQPL869ty93W0oehIuouB7rbi7HMB827efoop/IiukTsCcP918q6Y83rpOloP
	K6+4eoqXREcSsHofIBLbhqfKfj536/OhFYdDO7zPV5O5pT/n/HR64ykrrZEkpiSqejCQr1q4unO
	PtBt2VyVVM4HHnsX11TC4ChbrtkyjX/5YKXGyg8lDznRtxd4u5q24rBJ5Rr+f3uCtXZ07rqE6+8
	q5nisrKjzZD6lFsAoUwp6JiNyTQLyT3qcGbKL9Bt93si/ee60A9kj3w2W+z0IvyiNz07HgUENtP
	/MJNqkY74CfvgdA=
X-Received: by 2002:a05:622a:1a9f:b0:51c:a70:5ed with SMTP id
 d75a77b69052e-5213ad60752mr25546661cf.30.1784298041388; Fri, 17 Jul 2026
 07:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+XhMqye_NBihcadRTU=w4xAfrdY9rsMB3oHF5+bwHukkjHMoQ@mail.gmail.com>
In-Reply-To: <CA+XhMqye_NBihcadRTU=w4xAfrdY9rsMB3oHF5+bwHukkjHMoQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 17 Jul 2026 16:20:29 +0200
X-Gm-Features: AUfX_mzM4MQGKkrn_frck21VLwQTdV9LcapRzUotZsVFPcWMHTYwDrCVDauGyJw
Message-ID: <CAJfpegvi7ChiOaiZhikdcELRs8ogPh6jZaG9-x6H20Mrh5DXeA@mail.gmail.com>
Subject: Re: [PATCH 23/32] fuse: split out filesystem part of request sending
To: David CARLIER <devnexen@gmail.com>
Cc: fuse-devel@lists.linux.dev, 
	"open list:SCHEDULER" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Jun 2026 at 22:16, David CARLIER <devnexen@gmail.com> wrote:
>
> Hi Miklos,
>
> This change alters the pid sent on force && nocreds requests =E2=80=94 in=
tended?
>
> Previously these allocated a zeroed request and skipped fuse_force_creds(=
),
> so they went out with in.h.pid =3D=3D 0. In fuse_fill_creds(), args->pid =
is
> now set before the nocreds early return, and fuse_args_to_req() copies it
> unconditionally =E2=80=94 so writeback, release, and DESTROY requests now=
 report the
> triggering (often kernel-worker) pid instead of 0. uid/gid sit below the
> return and are still left at 0.
>
> Looks like the args->pid assignment was hoisted above the nocreds check b=
y
> accident. If keeping these requests credential-free is intended, setting =
pid
> only where uid/gid are filled would restore it. If unconditional pid is
> deliberate, disregard.

Your are right, this was accidental.

Do you want to send a patch?

Thanks,
Miklos
