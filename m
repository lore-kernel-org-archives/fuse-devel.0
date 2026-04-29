Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA1B37B030
	for <fuse-devel@lists.linux.dev>; Wed, 29 Apr 2026 12:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777466311; cv=pass; b=qgWsCYdICBEM1z0Su17OjQo7KNZsm+evhKfCS23amzPtrdqDlfUtdHq/tdBrooYfWccTd/L8Ft/msi17TXRVWKFcoYcvIm+luIOk2/K4x6DJ72AdNRXmMs9D8mYMwtTWCPh+8BXUXG3jufhYKiwMRojqBJ8IsA0wULw2dSVAhKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777466311; c=relaxed/simple;
	bh=VjhBgsq15Uhr29mI8KAskfSdJKxjDkwt7+LMJEXOUrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syN7jSuG5mLIXh3XVU67/TJpujph6PMrQ5Fx0DrKFVn6Xr9YNTlLpmb4DSm+C4R2xOeGrcYW6ySTV6Z2NjlYiTRFLpQyLCivYR9jHaH6XMvMOkSkNiifUmC1BhI0Cl642EgIDZ0qNaD7uhqSQhO3z9j1VGSS+X2GmIKXtNph1vY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fq8uTHeM; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fq8uTHeM"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-446fea16729so1419383f8f.3
        for <fuse-devel@lists.linux.dev>; Wed, 29 Apr 2026 05:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777466309; cv=none;
        d=google.com; s=arc-20240605;
        b=eZeahFkuh4VY+WJ3Kx9G+GUSSLLnZrVPnKkx9LGB1GALOvBBXjCA1cQ/cWkH9l9ANe
         jiEiv6mlmJabFNEkqFUB/UIXBbNtJwmddb0ISX3JqxWPSyjD0LA6GW89YO//kf7T1XLd
         qzFGmwgPRgBZ5gAg1jeGXnFhr1oATKbdD378j2EHd8vemPVcDXYKBCcEfH0nhsEfAXu0
         D+OGCWr3G/mNEX0kj7IGakIZMicfR/W2Kq4XQ2ceQtrpbz3z0+rh7ro0pxL2tZlc8jxf
         PXkJX0Fla2XBfexhL7LLghlUWZHswPgjM+l8V1rpkJwI/W1lczsj31b/HRA1UcjRA/zj
         QnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VjhBgsq15Uhr29mI8KAskfSdJKxjDkwt7+LMJEXOUrA=;
        fh=qF4gtXUXO+KPNq2BW1M2Pec9HGJxPkNDiTCSpf52U+c=;
        b=MlgiBkxlVrYwx28aoDpA+3bmb0uiikov7D4YvceCiksspHILaVoYhJKGHW2HPaEujI
         rO9BtlYubbakmvBCRNjE4/bqtcXqSbOL0YNKEiiGV/nhvGq5OwNh+S+nvdPaN1AEZpZx
         btsFLJGQYqJxNVYLO/zU3GjLhCK9jiPIbU5N48IneoSYgkROs6ifCcEDpYK03c8ww5qh
         mAP11hXaOJkxAR3XIlX9ruwla0pnxVEC7qZNfa2Oyj2/tN2n056tqeZM38KVhGEuNWoO
         Fy5mNs8hbdqHmXlsIgQTBBN8muqk2+O9QRd3MQQ/KviNE8J374i7xK0GdNfOe0SbZ9Q/
         r5cw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777466309; x=1778071109; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjhBgsq15Uhr29mI8KAskfSdJKxjDkwt7+LMJEXOUrA=;
        b=fq8uTHeMXni1hIlk2QeXsLdQLQ82AiubBfR2NJ8Di2f0wj5GqkryJ2QmvyMDlapGtV
         gQR+yMbMVSdVWt4qcvyfiecTZYwPStxsKPdYwH8WOgcgAsCD4YxobQGUksu8+P77F6er
         sKUGQGgYvzyUBOSMGoy3H8a3CJBR9eA6RA++zBEXgJ3rZk2C1oHxvr/Qfl1Yp9OXpXlH
         6kNAXy9J1FU80/Q3AImGxjxbnYb+tLukZ23GHDsIdNmCiRLjw8Qip37SdHxTkjKcuID0
         rF8TdbswYx3a6uGogMPe/Xs+pf7X9CjQzyA3zJ7Fq5l+EG1rdLUB3qn3D4iDWpX6ZV70
         CCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777466309; x=1778071109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VjhBgsq15Uhr29mI8KAskfSdJKxjDkwt7+LMJEXOUrA=;
        b=ItcYAiQBBQ8HHUVchnBx8PZc828Fif1C2SdNoxiL7frKGBha6xCwNtiaUUOMenkCXe
         w86xbPN4WeGmEw65qfVAP3q4G10Vxy54J0rCxcX1tJ6F9HUmHMwqe9RofX+/7Gt+Gik0
         M49VQP+8SBahVLbeKWnXqkBi3IntD8PBdKuaJ1VyCpQxeyqGdvsQ9/zKzscMvM0BDdIj
         MWJdF1n03NUpTp1sNCKJqojGcNb+vr/XFAAka8ktpXN4zT/sH/RIO8nkMPFcJu/txtaM
         rULfmJK1NARuYCKugcjuhD54wgGEC8b3d4z+qSmmurSp6nJlbQiF23Uf2xr5OwWlsIdE
         ovUw==
X-Forwarded-Encrypted: i=1; AFNElJ+EmrIhlX4b1eDfhqrpR0pNFskYmQe7LeCWaW/TF27wyGa4Qyqh8DyGpPbqYUdSnMDGoD/KCkZrdnI6@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0Q77yA1wGMimT6/y+k6ezhtAh+19Y1U0P/VsclSFhVWXdtnui
	XA8uPRC0+EToeXGU6AnQrgJ0vvonHYlT4FKTJh5rdIADK8lQbnp2vHjuVNjMMhleczyc/XPCuLN
	BSrfxRCnztepcs2pc4Oznn9lOgXiKm1c=
X-Gm-Gg: AeBDievRMFmbh9feKknlsEVWscCN0tQALcWolo5lXWH2/PG5F2JBgahgTlygMd9welW
	CBLHYa6CopHktw7+ATyXxNG1W2pliZ4Qy6nwVRHgpz+6fXk9UfWriutn7FahuJpsXcDSeuuE7E1
	/WGA+e10Nx4poF75O10Hai12aDnGoRQn+hoGYZ4xC7Rmj+FzH4htYMm4ON+Tam/7e+DllecnxJB
	UlZWLXZgvC39hVrL6TX30nCSOm3nu008ZV6G9DIZlHy9Re+9mYrN9Ccd8MoxFDvRKpZpzotonze
	gtlmyDu51JV2C8R1PfJ00yBKTKb2CXZhCw==
X-Received: by 2002:a05:6000:186c:b0:43e:a70d:7632 with SMTP id
 ffacd0b85a97d-4464a168496mr13327467f8f.25.1777466308707; Wed, 29 Apr 2026
 05:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403035752.20206-1-liwang@kylinos.cn> <20260423110954.2676-1-liwang@kylinos.cn>
 <CAJnrk1Zb=+syR_aOLVs4aXMTOUO7BRBi=MU-20xQOcDpf2iQ5g@mail.gmail.com>
 <1a25fd7d-f122-42b0-91e2-487235263af5@bsbernd.com> <25e00efd-c0ef-446e-a246-6eebd7a68c9d@kylinos.cn>
 <CAJnrk1ZyucU4LMn6UFDAJpmpUJzhzroLTvJnA-hL5SHR5zedMw@mail.gmail.com> <25cfcc60-03c9-4343-9b15-4424e1e419a0@kylinos.cn>
In-Reply-To: <25cfcc60-03c9-4343-9b15-4424e1e419a0@kylinos.cn>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 29 Apr 2026 13:38:12 +0100
X-Gm-Features: AVHnY4KeLOxwnWaoFI862YcC3UAKaiAHvQ4MOLKXReS3lWeSvCaXbBe9Yf1yAb0
Message-ID: <CAJnrk1YBoQoS-RXvGDt86okLidYaKqsnm8G-jZEGEzNdrBu9+A@mail.gmail.com>
Subject: Re: [PATCH v3] fuse: optional FORGET delivery over io_uring
To: Li Wang <liwang@kylinos.cn>
Cc: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 10:06=E2=80=AFAM Li Wang <liwang@kylinos.cn> wrote:
>
> Hi Joanne,
>
> On 27/04/2026 19:31, Joanne Koong wrote:
> > On Mon, Apr 27, 2026 at 10:56=E2=80=AFAM Li Wang <liwang@kylinos.cn> wr=
ote:
> >>
> >> Hi Bernd and Joanne,
> >>
> >> On 26/04/2026 23:48, Bernd Schubert wrote:
> >>>
> >> Furthermore, in the current implementation, forget and I/O requests ar=
e
> >> dispatched through different paths and handled by different sets of th=
reads.
> >> This means we cannot guarantee their original priority order upon rece=
ption,
> >
> > I don't think ordering matters. forgets are inherently asynchronous
> > and there's no correctness dependency on a forget arriving before or
> > after a read/write request. In the /dev/fuse path ordering isn't
> > preserved either (eg the order they're queued by the kernel is not the
> > order they're delivered to userspace).
> >
>
> Yeah, I agree, and I apologize for the confusion. By 'original',
> I meant the logic used before the io_uring path was introduced =E2=80=94 =
where the
> system prioritized reading FORGET requests into the userspace buffer
> while still maintaining fairness. I wasn't referring to the order in whic=
h
> the system receives those requests.

Gotcha, thanks for clarifying.

>
> That said, I=E2=80=99m curious: since FORGET is asynchronous and doesn't =
require
> a reply, it doesn't seem particularly urgent. Why prioritize it? To preve=
nt
> a large memory footprint for metadata-heavy workloads? Could we be more

As I understand it, yes, forgets are the only way the server has of
knowing it is safe to release resources / clean up state. Luis is
working on lookup handles [1] which will help mitigate how much state
the server needs to keep track of, but without that the server needs
to keep locally stashed info for that inode alive so if future
requests for that nodeid come in, it can serve them.

[1] https://lore.kernel.org/linux-fsdevel/20260225112439.27276-1-luis@igali=
a.com/

> aggressive with delays and only send them in batches once a certain
> threshold is met? Also, if a FORGET request is lost for whatever reason,

I think we could but the current approach seems like a reasonable
balance already. i'm not sure I see the benefit, as it seems like the
right threshold would be different for different workloads. imo this
would add complexity for unclear benefit, but I think it'd be ideal to
keep things as simple as possible.

> what are the consequences? Is it just a matter of causing a memory leak?

If a forget request is lost, the server has to keep maintaining local
state for that inode. on server teardown everything gets cleaned up
normally but while the server is alive it's effectively a memory leak.

Thanks,
Joanne

>
> Thanks,
> Li
>
