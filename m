Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C76D481672
	for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 18:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201937; cv=pass; b=pVdrCT1SyXkNvGkdPVDW9+ltZAyzXwu03nIO7YzCnI5UDHFPBIkFl7ABLWhEIoDxcYNCQ3WL3kQuse1HxLtRkOx/VO6CTXjqb6235gFnLwDCdUp5sNYddnvmyK64ZvX57xTENhHwip4/zBsPlC2rl8iFBhOGeJFC9x07RzmgVH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201937; c=relaxed/simple;
	bh=8lDPI5gL41dfwSme5pJZAZFW82khgbDB66GVkxXOIak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPLy0zPnN4cSjng7S2TpX0kmm5Cs/6oYirGvw8FG/xkJJcspJssXCrEGqb5sCXKcyRxycYmfwLaZQ1/GETx0BSlPES7anE1Dr7oXNl6I8gbX4EchNHTJ8fYvciD5lYg+fV/GLaVqsl8Sn3OYeoRlANCL3v1hz04zeMtTHslRugA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=QL4vpphY; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="QL4vpphY"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51790c0a692so812631cf.2
        for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 11:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781201933; cv=none;
        d=google.com; s=arc-20240605;
        b=QjtISsFqtYrK2LUtIm/VhwwCFIwwedup9RJ0PlwlO163SzHZzdbXjvySdCVgvOd0j3
         EcjSEkXNWrTSmwlOUPedFlwdgdNoSpYYR0wfMsMLxoqibWPhKKKopM+h0pGOONwMckER
         rCXBZuRpG7SDOjTE+Rxz4/yw/9VBTFjh2wJ8RlzvGDuCaPqcNG+oI8E5yu1A6SEaxNFY
         yqwYsdolXC2Cdv1abUBEufPDCZVe+J6ELQX/7P2WzmDXt4RLZzSNyu7LDcxiFedKRC3s
         oAxHXuX/jh3xYvbNzl83gxUrnd0exy0W9O8Wgx7DQD7YsBcM4+IhUGWTTWbk4UimLleF
         IBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C3DbtFuRBFlmeffuHTzJiPg/wurU4EJ+AHbFtCHhWTA=;
        fh=FRe1Aepx20bAn3gu5JuZwRK3itv5fSv6k/R1oG4qfxM=;
        b=SrUqm8I6Iix2a0pUaVFMfO7HkATMaOBssjoGgvKQ45Se120of0QrDxLtPQ5r6yOYKS
         SUr9wG56ah1tGQtPQn8MqbAZI9lNlxZnRKDBccQRsCtPKpp8oOY+8CLcN3E37Xc4m6TI
         r/NAmVpeEymZhDth3huJs3hSBKI+0tkyuDTpbPYNInVz6re9aJuCUe5S7kYb3ORIZ71i
         /a5T0ExZ25umMQmnRX4t7yF8ESoIxhrzICIIH+nM0THlCLU2e47gmHETIsBIkH1neMcC
         0dMOkiIWIeyHKPNy5Jgkq3djaq00eLssBDFoluS6xEE7EzW267JYWhlk4e+FvhJe1CW6
         My9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781201933; x=1781806733; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3DbtFuRBFlmeffuHTzJiPg/wurU4EJ+AHbFtCHhWTA=;
        b=QL4vpphYCKfJsTP+b6V+9sfX19S6faCiuUY/mbtRozLM5ZCgFUYAEOihflQpzfA8zI
         dFFP5CQ744knirR8l50inaqoiubSKZX5UAI4gPye9anjZjhBr2pEDCOoZ2c8vlaO6HJw
         3YL3ZBQl3SZP08hnQfilnpRsMU+QTRKYpRFjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781201933; x=1781806733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C3DbtFuRBFlmeffuHTzJiPg/wurU4EJ+AHbFtCHhWTA=;
        b=iOx1OL0Jr6BM12PyUE9s91fyo6N77DOBxnRYeLgC6pq6TRfAz7F+zLjU7g3hnRfn7+
         kBjx19w3Gn2HGPDqgJ6V/HpImOpRVHFtY7HivOkyzZI+vD8xJvXSWRA5nzS102N920aE
         rVfnn2QdNSNAAzsEjpykvImTg6teMhJ1HRWbm4YC2aMKeg/uXVvPsmfz/2lSMwFLgf1j
         iZ642h+Cf2luGo+Shyj8htdvgHrlCz5lPQQEj1PHfwd+2FmzOlpVAUIWjDEW1C3qm5Sq
         t8/HOlQmtbGL1LfItU3E+rTyTt9h3DZMtpd9IhOSY91/4B275CRJeBS4EkT8sPg0prHq
         NXtw==
X-Forwarded-Encrypted: i=1; AFNElJ+iNtSMoLNE764890lpJjrF7CgSOr1vxjNeI17qnKHHNNfiCI3R+uo4YiSNB6b+MuEjbXq4i2GIrq/U@lists.linux.dev
X-Gm-Message-State: AOJu0YxT0yovRCOcbp4d+/xGvUg7W31bsZkBc9B7uEpvgRBIAo8/EIZT
	TfALO2inrCRQcovFRoOBB/DjdgFWcrrD2dluSnQRSv42vF/glR/qsMpnUIrigoVY+AMOrjLsIib
	MHV0HqVJSpwdRpSSzk8l+yPJbf+v+WLgmewrmtMBUvJB3FXEE+LgF
X-Gm-Gg: Acq92OH5p1Yv6b0gLRZoY04aT8+/yI+fWVRThRLPz7dS4CVcXnANjEq8L3j6CFA1lbY
	lL6k2JNPVlqDXJf8XChFlYKt8E23ZFwC8ftBDezjA1YH3ehZc+yz78nsSJdKPV1eUBwg+b3wVjg
	AkoUopnCSmSk5iMePeqKQgpbHyexnSvbeK/ZFeCkdyKs2F4YxGRmqnpAsa5GlPm/1Yy4wrQitHu
	RwinwJW77o6Av9R+1tA1Rk//qThHvjIOxJSl2N2whFuKDbHLijoNMyMSUWdje5nvX3jK5X2RH6l
	VTXqxf9nJP+jL2CaoJCBsFYxe9Q8lMDF5QjWoQky
X-Received: by 2002:ac8:7d55:0:b0:517:7ed5:b570 with SMTP id
 d75a77b69052e-517edd1b7bbmr61380701cf.12.1781201933302; Thu, 11 Jun 2026
 11:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com>
 <aeb9c03a-0330-4e41-ad33-b884f00691a0@bsbernd.com> <CAJnrk1YPeeCSsQFjaFNROYcOdBO-kTovOTDkCigNKRt57JREJQ@mail.gmail.com>
 <6ecc45f5-4bce-4af2-bfe4-36c69e624b01@bsbernd.com> <CAJnrk1aS=3KwZ3LpiqcK=gKsj7oru-k-1Xpe2j5puDdmn+hjUA@mail.gmail.com>
 <CAJnrk1aacCbOWWWvW2xnQZ0a954-4shXdyO9LBn_Fv_dyUAWnw@mail.gmail.com>
 <CAJfpegtorFv9u2NCPA8v5OHiBUNT-XzUiw_y=7c3U3WEaXRUZA@mail.gmail.com>
 <CAJnrk1arYPY1u8_aiMfYUbmb9Oy4epRWJp_W7-hjAxQ_ggJn9w@mail.gmail.com>
 <CAJfpegs7ttuzD14cnEeRBeDnw2E-5Dz=+xCEWVDRCKqMhDZ62A@mail.gmail.com> <CAJnrk1ZbThfvHBfVq_SntuRLFsvHC=DMBQnNcS7Zu4MV9YXTgQ@mail.gmail.com>
In-Reply-To: <CAJnrk1ZbThfvHBfVq_SntuRLFsvHC=DMBQnNcS7Zu4MV9YXTgQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 11 Jun 2026 20:18:42 +0200
X-Gm-Features: AVVi8CesWE6oQI6PnCNkV8-YIgJF0pIzzhuZAYBX8qa-UTU2uVF9jPVGY4aSe5w
Message-ID: <CAJfpegvfu2heS4GpvcKxFXaCHfWSrrdCqswkwY2my8zdX_M7Ow@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Jun 2026 at 17:25, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> On Thu, Jun 11, 2026 at 6:29=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu=
> wrote:
> >
> > On Thu, 11 Jun 2026 at 03:51, Joanne Koong <joannelkoong@gmail.com> wro=
te:
> >
> > > a) I don't see a compelling use case for needing to dynamically
> > > add/remove individual buffers from an existing pool. If the server
> > > needs more or less capacity, adding/removing a whole pool or queue
> > > seems more practical. If we do eventually need single-buffer addition=
s
> > > to an existing pool, that can still be layered on to contiguous pools
> > > (but removing buffers can't).
> >
> > If server knows that it will want to remove individual buffers, it
> > will just have to register them as separate pools (containing a single
> > buffer), right?
> >
> > Buffer pools are a more generic concept, hence they come with some
> > extra complexity and overhead.   But the interface should be a
> > superset of what individual buffers provide.
> >
> > Am I missing something?
>
> The interface is a superset. Internally the difference would be X
> bufpools with a single buffer vs 1 bufpool with X single buffers.
> There would be more overhead for X bufpools (eg allocating X
> fuse_bufpools structs, looking across more bufpools to find a free
> buffer).

I don't think this is an issue.  Allocation should be as simple as
keeping per-ring freelist for each buffer size that would have all
free buffers across an arbitrary number of buf pools.

 I don't think it would add much additional complexity, given
> that multi-bufpool support would also be needed if we wanted to
> accommodate different buffer sizes in the same ring.

To conclude: bufpools allow allocating/freeing multiple buffers
together.  The API is a superset, since allocating/freeing a single
buffer is still possible.   Additional complexity or performance for
the bufpool layer should not be significant.

Is that correct?

If yes, I'd go with bufpools.

Thanks,
Miklos
