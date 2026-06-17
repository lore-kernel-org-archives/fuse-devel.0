Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A233EEAE9
	for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700614; cv=pass; b=iSPZO4897hVj4/bv2OiGMaPpIDuyCJ91QEqJq2TkOdmlcmYUlSTSx7rmKVj1nJzH9ziIkOOL12y6NG4k+bYICFCWRjkgtjKcnUn479CLAHoJl8F0wLmFoScg03Mw5AZAnSPV4Aw2zdKX4eUwaCfp95regtS7Jfibr9diIzAuRqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700614; c=relaxed/simple;
	bh=f1+NOEP6ttOYNvymcOwqiTk2PTJ2g67riPvDeG50Glc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbOi2i0ZRl3YPD8L6QZxexoLZvD/44OpaxrWGBHKeaQfhUE0fNhybfwSlkUSGieOjIed2ozo1uDH8exYjo+42g2Srm8twZkK7j4RIyUAPntdR8NwshnlFDrOcL1v0WykgK1WTSzMvJdm9sNHEw2aEUHYNbMziyvpeq+h3kfQRA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AH79iPIH; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AH79iPIH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-462342ac290so1069484f8f.2
        for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 05:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781700612; cv=none;
        d=google.com; s=arc-20240605;
        b=hnlHqNBbJjarNUR1Lq+0+7EIGJRAua0gxHXKlOVDRAp6Kamsp8dB5SCNwerKmWRjCn
         xD1i1zDzyN4hbxcPbPXcqVxHdge1wnLs+cWDwmceN3zsizw3qLwftjrQVCDgZV3CydsX
         8w70RfSDmYYSrCial8aQcFQyRYWfI/67MpP8FKcAD83CCOPiw5W4vMKAGB9vDFfA/5ur
         yN8C9qWGoEihvpy7DsNo//WEF2q6zZsc6HPEuyk8sV6oJyCJrqRSDV6ruuPQhtHAisTD
         sIZ5BhfYi/hLdISSuhaUI93uM7sfnvWeHyhkHkotFy0JhPDPExYe2IjG1nLL3Y5R/8/b
         ObgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oS5HSWNuBeGMsJM2quVi86q/wFWVGuLDCGOrpGIdgxw=;
        fh=8bUFTemOwDoWiOdOkdFFPfADoT45yqq3f7053C+zN1s=;
        b=d/S7w8Idb2cxPeR3LzdH/3jwOcJZgoMS6v4z4MgibfGKEtQBivXz3fYdzjEtVw5mFX
         J2gaDaQWG2kYlUCo66e9d81uxiy9R5fGjsu2GHvqFk9S0HUS331Qbgcv+hE2ohyEqgbH
         qWbLDxRD+6uUF3ZCZPXoLm48yJD7dDS++6On5LXjQt6jMRjsJuUF3Ss1dxBAfqG7H9CE
         f/R9x+YdatxWBOR/bb87vpl5zENB5Lqh70/ig0R7bSA5tRT8gaDyBXm2S+tYeEhBS4Ce
         vhdqhS/ERmbgI4c0c1ewpsASVxZeTkp38Uyo1+1JFOpluDIPxG2gRtL50ZfomtIDifdR
         eEqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781700612; x=1782305412; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oS5HSWNuBeGMsJM2quVi86q/wFWVGuLDCGOrpGIdgxw=;
        b=AH79iPIH8gKmnVDOWEDgXiWL+wFjq8vTYfyOtIotem6rNlYYqrjpiu/IVVOcxybJYA
         VzWtjzF/lT2FHTecwHV2AKm6IcKocIUcLh4zU9duQeQQ9+64mJYzknKivCWVWHQLdCNY
         yzPDoosfAdY0FQRrfUYPaTehYUOjnMJ9RRplmpdyoWN5gulBuRhJHkjCs9Nc4h0UntZ/
         tAiXXCLxcv6GJDyLHhlJ1i0VkWa4PltqTr2Jc4qOH5t+uM8ULbiu9GaWQP/yK+2tJorw
         9nQlq1U958mJmJXaRFB4PReCWTuz3uFFRHzh+DU8epedC+2KLb1AYzjFLQYkMTY23ttj
         tHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700612; x=1782305412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oS5HSWNuBeGMsJM2quVi86q/wFWVGuLDCGOrpGIdgxw=;
        b=socJeAxBWT9lIbDPz5QefNsMQt7e/ycT82T3yyhzIyvRQteAHHZ2S/aA/cPENJ+LE1
         v68bZUeW65t+mnBfUeW3R6LSWqXxgVTA//FSe2Y1+PCpQmf2qmd8Li6Hci15JH7ERV0n
         7UOQUnazj+mzYputwVHhCVXM5P55LRHT9O1QdQg2JDDgWQsnLnPrqfDobGd7E36iU6rd
         XdKa4L/9aACsaq6myun7uIx3f+WPPqiKpKdjEE8n0SBsSSP7CEIIZt+TFk0BojKlEWRO
         eZaF9EyOPZ8pzOrXtg15wcI7ehXezQllRmQSoXsNMxRB66q88fnIDaG08oGrw95gD+Ja
         p1sw==
X-Gm-Message-State: AOJu0Yy6i2MEIZNPug9i6inpB7rDvk09eu5piU5Bo65DaVoMaVWvixLd
	9DQFxiC940/9Djhifn1uXpwvRb+jCt/EEl7USDG+7s0mNKUFp2KC70Euh3Ozgkuo6pCEDabqF0d
	0Cmsp3buCizV920yvOhglqEE/Hw4YFZ4=
X-Gm-Gg: AfdE7cmrLTPahDs72EPkCQCM8RBLAn++QUN9BEKMMkVnriAIez/uNVjHHfKAN57Sq7s
	LDo2Bsq2k8CdWteL0YdYgciGKZnfRrtOjn15MQFYse8OMwGRaz7We7ivDbr6ifyPEe7vJp2jemx
	U5JB+AJ7TbqG2CPdY5XmNGjCes9GP54QUWKP27KOruej7BmCjPKJcgVYoR1i/HXAbav9yQJw3e4
	zFWHeWTV0hSuyGrCeQnhN2tx8PNLVGPiGfjN+x8p4MgaKu5S/M7O0YJl4X5AlwcXuf0j+dKVFyt
	PXulZ1s78xDYfpmDqEO/2T6xpPq+OdJCGCzD7oxYG0uqryw89gfs5iQEy3a2R2pAmGA=
X-Received: by 2002:a05:6000:136f:b0:43b:3b80:6776 with SMTP id
 ffacd0b85a97d-462411cf9e5mr4634876f8f.30.1781700611479; Wed, 17 Jun 2026
 05:50:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com> <CAJfpegsWpKE4kUUQo+NK_cu6oy6h6+A1M=xokvSQbFtZzu9UKQ@mail.gmail.com>
 <CAJnrk1b1nVFZ8dQYA=iGn-p182HNhhRfZEVe-e_ks_daZAU3Rw@mail.gmail.com> <CAJfpegvNyqSS2h28-0sB2j2HUoMnKd7StMsPbvNPz67PiS9w9A@mail.gmail.com>
In-Reply-To: <CAJfpegvNyqSS2h28-0sB2j2HUoMnKd7StMsPbvNPz67PiS9w9A@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 17 Jun 2026 08:49:58 -0400
X-Gm-Features: AVVi8CfGObFwGPVTheB5RlD5nUn_gooQMm62aC4JKK9ZNL0SfdbzrrU47xRj6eM
Message-ID: <CAJnrk1bK-3tpZoeJQKPLjgpQW2F0YQKVhLeGwkN_5tpBVpZ-VQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 6:26=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Tue, 16 Jun 2026 at 07:28, Joanne Koong <joannelkoong@gmail.com> wrote=
:
> >
> > On Mon, Jun 15, 2026 at 4:41=E2=80=AFAM Miklos Szeredi <miklos@szeredi.=
hu> wrote:
> > >
> > > On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> w=
rote:
> > >
> > > > To use this, the server must set the FUSE_URING_BUFPOOL flag during
> > > > registration and provide the payload buffer pool through the iovec
> > > > payload in the first sqe.
> > >
> > > I find this interface inconsistent.   Decoupling the buffer(s) from
> > > the seq's means that the registration should be decoupled as well, no=
?
> >
> > Looking at Bernd's reduced queue series [1], I think we'd most likely
> > want to also pass in the number of reduced queues separate from sqe
> > registration. I think along the lines of the config sqe Bernd brought
> > up, it seems cleanest to add a new cmd op
> > (FUSE_IO_URING_CMD_QUEUE_SETUP) where queue-level settings (eg flags,
> > number of queues, bufpool, etc) gets passed in.
>
> Why not a separate op for bufpool registration, so it can be done
> independently of the setup, possibly at some later time?

I'm not really convinced there's a compelling use case for needing
multiple bufpools in one queue. This was the discussion with Bernd in
[1] about this. In my opinion, incremental buffer consumption and
allowing different queues to support different payload sizes would
address the use cases of multiple bufpools within one queue, but would
be simpler.

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/CAJnrk1Yw3=3Dz7W_my4pLG6avBeDZkUp3j1=
LZk-RVpGv2vAsw-ZA@mail.gmail.com/
