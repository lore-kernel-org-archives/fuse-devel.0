Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F738836C
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 23:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779491344; cv=pass; b=Eq+SJS+S4L236cJXeR/KI0qi6u5qADr6XTMpVYI+dDSJcLaV7XGktc1S/iO9UraL5zweZQ0Zm4dDRn/1WIcU43/bO9qlobhj9/nGcKQM+eVeiCiNifiGlnGLDU6nxRRQpIhGgp/jkG3auW+C1mFHf8Bwux6VY832bulahYxWnu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779491344; c=relaxed/simple;
	bh=8qZg4roJ4dPy4jPcTj5MlYVhyi4lhqKx68HBCMzDBiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tWwZ3LBICGdxCxQTJSac/knsqyoOU97nIcUtl2Issx8zNCyBXqbPMFKclfpY4PylFOLsINNzOoLGkmQ3d4V0cAZVF3XA7aALEeyypfB13+TBUsInDSJrmdBsoxHOxEU6fy6WK8QrUztEK0CwxDI0hs7Gg2WeZChE68TczOimIOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QW0n/Y/t; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QW0n/Y/t"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d77f6092eso4625395f8f.2
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 16:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779491341; cv=none;
        d=google.com; s=arc-20240605;
        b=Ykzk9KH/a2ylwRnLPBp9kJSSIn23/zfMO5hItV14q7rmV7tcz3oOAhyEuM5KP0gKjd
         snL6kNahTsJcUFUWaTfeKGB/S6VJ8L8NBtIF30pvet1TZQpE1ApAsDIGlbA18wUXCjn/
         QtUL214FSCTzBFjR9d6TlIx7F818PqEVg/aMQo9r6zB5US0Njr+jbMQ3IVQkALlNwExw
         pphHJbO/d30FoUg18SgsFWN//MonpQ6K5zdzONGova4HQKGz99I3czH/sLKHvIIU3iTV
         y/X53vr6I+Xiks8KK7WRVRU+2UJ/x8YmPRTUPCsNqrNDHMYU9uHkKB6HEL8f50IjNR+V
         QEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DU0H5uukgO36iu4MFzBovNxGuijMKEk1Y16TgT3h7Dk=;
        fh=6sG4XlmduU+9cDESNUb0zx+qLXqAg9y0Z0FhTvBg2bI=;
        b=hIhCFHL5bONUXqHfseZ3OUM8Z8dNfIBaVn0HI3mrEgDJhDVolzD5/sQ6trTt/eYvtj
         Oj7bvVqWrsipNJmWfdxOwBlb61AEvXsUJjQWaQunpC2rA5DTloxBUINJuDFo7TUzuckg
         cBRM/O/hc5xjnY18YJSu77gkkir7Cfd7et+BzM8xJttHT17qVpvZVROMG3c8B/ysViqg
         FkRnHAVMIjwpLV7bDkoX/PHSS2gevqAhDcSfrkMCRYTrMde5ta+VLGGwOlWEqo9cpBEK
         w8EnnG/JahkGsBtmldV6uDmjNWUqJgqwkBazaaFvWDRaRytFPdqnxodKiMf482dYAOEx
         oVlg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779491341; x=1780096141; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DU0H5uukgO36iu4MFzBovNxGuijMKEk1Y16TgT3h7Dk=;
        b=QW0n/Y/tRTQl/m7lRcz9BU6uI050hf7cT/1l7h2+p/7G1U0xDYlcCTX7YvRoFWEl4f
         itkp8heV0ZjkfKlnGKw8fzIJ3306C27V73jLCGbr7NR6hLLCJnAfhibfDqiZCKFTV0Mp
         +5QswABgH6QdEg10KdeRX3yNg7sYZlwTOiYnS5VUIpZEDchcW2hiW4Lgb/UoCur8x6dh
         UIfTNtjM1SXHL27LFwQvj7z+Bdh182B3vNtBMufbrGgBNteUYYFF8NXCQI0E3i4wRjjZ
         N5ZyuIiBRKnei+i6QNM536fMTsS0DPSDL99et6C25HcUormzmHRwl7mcAI6oCGJOFNHZ
         +tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779491341; x=1780096141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DU0H5uukgO36iu4MFzBovNxGuijMKEk1Y16TgT3h7Dk=;
        b=Lqjm4w9mlPrjTG/Y1GMbr0y+RJwW63qKMkz4nvtd6fHfQOubHcD9XmOF++UEbs5gbr
         XVQLk2pUlpf8nzJmq5PnxXdqrp4+Bn3cAu5GALY06F39hRmYt04F9pUlcBMCfMCXvZzP
         QZ2Jbbu9o6jWasvY9M/K4YfScqq7m1qSgy1VrFixE+Q0k8L2lV8UTq/i+O/22zL97kfV
         eYykPV+5SdYXnYeuG63/Da2SJqSrmC33itEl9JUT/YfjW6lWdUFmrkrafSIVgVSeZQrb
         k1sGpF7T2PkyBEfuGsKYTgxzeKHEF2Stw1ju9nZbPHOqSgi3sBzg4UVNpUyCd/rI//yf
         9tDA==
X-Forwarded-Encrypted: i=1; AFNElJ9BYvPlbX1zguS7ZrK5SO/93GNpgVIjhaRWx5cRAexcGbjRJUpP8x7hfpWTb7qzIgu2/kXP8vldZYuZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy3CG2UFBtEw8Kqh2VHNHrcvv3uFuQJ4p4cJ8kwRgdDEiIsyIw
	Rp4IrvFquwrH6fa6tWOYD4aJ2KlVOI018oJnMWxQZkYIRc+9BCIAWqbPYc7t9Wj+WFZXuqSv26l
	lUFv82RKLAFWuBf8YQ55vhBO1V0O/UM8=
X-Gm-Gg: Acq92OGEQbOvXN/eq1L4nPlZ/kXnkhwlZo2GaUc4JDi0chKxu8kx/Az2PUpPDvOW5Fs
	GtOwXZkaTcSM7iY3hBRR1s66V7LfY9XGJjqqyjkjNkkITkGM5OovKuHysYNbvkNmplkKx/ZKEeK
	ErFgD1+9N8toUtbETYf5IAFT6g1ubXam28Txio4YGMijXf4JPX1PNzCP/aZJrazIxSUT5wjjL8G
	jQ6agkeEpTJzlV9bSTvJkZDx5lOxz/i07exF+nagTA7WHo3xVp7+jP1OKp1UrednWYjjGNrRxmH
	4bR5BQ==
X-Received: by 2002:a05:6000:400c:b0:454:35b9:803 with SMTP id
 ffacd0b85a97d-45eb38afb39mr8236354f8f.30.1779491341505; Fri, 22 May 2026
 16:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1aV1Z0wBQ=ViTKEsojrVkqaNnpRHiBOqFLRL+QtS2gMPA@mail.gmail.com>
 <1c3ef92a-d3b4-47fc-9d34-9c996b8eb0c7@bsbernd.com> <CAJnrk1bOyoUD74byw3ZXWzQ3dAiZObE0V46+=rtkPG8-3vqUEg@mail.gmail.com>
 <55b80c43-2e84-4a42-b383-108f06254b6a@bsbernd.com>
In-Reply-To: <55b80c43-2e84-4a42-b383-108f06254b6a@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 22 May 2026 16:08:49 -0700
X-Gm-Features: AVHnY4JchIdUseERuymaH2NuKMamQzSaB8ORfR1mZmsxq_UM7KGyxN3bNirdGek
Message-ID: <CAJnrk1Zby7T4WMShk+d8QdVoqtAFLSotc9_d0RbGKSnP4fXq9A@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 3:49=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
> On 5/23/26 00:38, Joanne Koong wrote:
> > On Fri, May 22, 2026 at 2:51=E2=80=AFPM Bernd Schubert <bernd@bsbernd.c=
om> wrote:
> >>
> >> One piece I had been pondering a bit about, though did not dive into t=
he
> >> code yet.
> >> What is if payload would be registered per ring entry (as without your
> >> changes) and just the header would become a buffer ring (so that could
> >
> > I think payload buffers must be decoupled from ring entries if we want
> > to reduce memory usage in the non-zero-copy path.
> >
> >> be pinned that way without loosing one page per entry)?  For zero-copy
> >
> > For the header pinning changes in my branch, the headers are one
> > contiguous region (not per-entry), which circumvents having to
> > allocate one page per entry.
> >
> >> we could register entries without a payload? Advantage here would be
> >> that that header buffer would determine max number of entries, only
> >> little memory would be needed for over-subscribed entries, but entries
> >> themselves could be registered dynamically on demand.
> >
> > For zero-copy, entries still may have payloads (though the buffers
> > will definitely not need to be as big as the max payload size!),
> > either for the non-zero-copyable args or if the request's args aren't
> > page-backed. Unfortunately I think many servers may not be able to use
> > zero-copy due to the CAP_SYS_ADMIN requirements, so I think it'd be
> > ideal to minimize the memory consumption needed for the non-zero-copy
> > path, through the buffer pool for the payload buffers.
>
> Well, my problem is still why would we need to register ring entries if
> they don't have buffers - why not just register less ring entries then.

Entries may be used for servicing requests even if there are less
buffers than the number of entries. Most requests don't use the full
payload buffer size, so for example with incremental buffer
consumption, this would allow multiple entries to use non-overlapping
regions of the same buffer concurrently. As well, if we want to
support multiple buffer sizes per ring, there shouldn't be a 1:1
mapping between ents and buffers. There's also some requests that
don't need to use payload buffers at all (eg flush, fsync, rmdir,
etc).  As well for registered buffers / buffer pinning, it is more
optimal for the buffer pool to be allocated contiguously and pinned
contiguously rather than passed in one by one as a 1:1 entry:buffer
mapping.

Thanks,
Joanne

>
> At least I do not see the use case for ring entries without buffers.
> And that is exactly where my question about keeping the possibility for
> dynamic ring entry registration comes from. If ring entries register the
> buffers themselves, every ring could be set up with a single ring entry
> first and only once ring entries start to get used, libfuse could
> register more based on demand.
>
> Thanks,
> Bernd
