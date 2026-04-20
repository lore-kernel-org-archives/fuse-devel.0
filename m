Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DDE392801
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 10:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776680075; cv=pass; b=BPmP1lI0ZFUxZagIYNnSch0gGS5zW13/8UUQ/lzdfrk8FFA4YaNaKSSa9bPqBvlqRS/nF5sOU5LzcN44I1VozuHAb9yXRZD7Dz3jWEZ+JTZC1M14nfF4872AukdAv3Vmd/N87Grr6RdmY++90Yy0ImccXECILzSTPUnbFWJRljQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776680075; c=relaxed/simple;
	bh=8lgmDExFcXpY7s3eAFFcs7uqszUfPLz6vN1ZC8pE900=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=muCXa7XhcOQrNWc0WzPuizA5E0rkaj+5rNKWkrb7xt/BmNHesdanu7tWeTyTaODEMu8OhpmJpEdP0MUTn+QzncKDm49AHHZMOGEsAkubY+/J6lCBjoCHecQHkmYp8GzM1QOcjUFxMoPERr9Pt/P09ZEmyCb+nsk6TqE0lKfLBo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=cuqLM6PZ; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="cuqLM6PZ"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50d8da3e656so33763551cf.1
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 03:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776680072; cv=none;
        d=google.com; s=arc-20240605;
        b=ZrcVpOyZNc60yJqhn4vo99wWtFoLGAVxvReTK1c/qbmAlvZLFTgO7bSClkhOKQIkWR
         m/wMj6RmyNi/HY5hXmj7ccm1FYZfYY4blncuv7K9vZRYyk7Vpd83WjMFGyxB7rGaLl26
         Xf3fz+2ME/le7+Y4Drzmumf8keShx/aoRlCYm3sP1mLk02PmBuo/FpfktlTvtP9kafpC
         FmcqjteqRNIWM551jLPfluyUpStvcipntNt5hD44TWk/SpxHGuBsY/vjREbBMPiTAkzk
         1R9THY5FNkjCEE38MaB4F/3yGBNT5qtMJ63CuYl5ltzaqRibFJpKx/pIXoqwE50Zt1dI
         Cv4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4yQrDGDk/wcFrASZmcYEDDh4Yv75Vu53tanwvJ4+ZkY=;
        fh=q0xQQCcE9ENEcUkySmSX4Fi1DXS4Pd/MiQzbrN2/5KA=;
        b=emcNjmKfaCSbGpg4z2HgROlBHY0IQ3L+3/jmdSx7Hfi+aKTU8WBZCpecal96nT51Re
         MoHOXXrqYyS5E8v9punXpEKB9oW3USH3VTsrsWfsWQSoQbRsx9pwYMpoLPSDFMjdHIpg
         2zu0+owshAzUgX1xkG6wPBXvzpI6EiD3BIojmxjE9sfq2hQVFvUthYMavyly3EbL2flV
         MD0Iui6dVcFvNr9tN4ev894jBCFbsnfe0DIAaul10YW19/f4RcrVi9c5KTvEc7Y7/GDW
         X6ylen785BZNXqfNDLrAN5ohmYjI56UxsXFjdbPCPDpoFFAp7LgnBkSMhSNssKmAEX/l
         qmRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1776680072; x=1777284872; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yQrDGDk/wcFrASZmcYEDDh4Yv75Vu53tanwvJ4+ZkY=;
        b=cuqLM6PZOMlEP/M+ef3YlACjqS9jyNWLm9F+ee61Lpre/blVuNvJ16s3KIffyEYbXh
         3wnBmacynWhFxCH83uyFqjkkA1EInofS2/oSjaTM1gQ3an4UN8Wpt0gBUeGGt8JC0l6T
         2HqUvXQNGEOYVjqipA/++w6gT5RhJlrZDnvOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776680072; x=1777284872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4yQrDGDk/wcFrASZmcYEDDh4Yv75Vu53tanwvJ4+ZkY=;
        b=WUNkhdJ39JcpHh2m9+7jlQ6gB8bjQvG8/5XgLHrFAygHu1YhpvWPMTdexaqoTsJx2i
         XmeJOd4/j5vaSaCq99zllm2vNYvWetKecqHnp0tnAWkMCVRhukhzQEoxQmib9FjuVZJW
         4Yi2R5RU+ymzkrpoZNmTJIjLwGQHZyCA92KWDGMX15EY2CRz3RTXdsyGA78i+c1xfZgn
         nUdlzqTddayKjFMmtwRqijt/lkEm8PQxFkVud+Xg9heycYS6eYsDwnEnBEsoNUYw9iGM
         JkxBYoXISt9VX0p8+sqcqIzlwi3BCcwvF7Tzz3OX86jHBozhuuUSPMqyaFIGrJuc29G5
         ntFw==
X-Forwarded-Encrypted: i=1; AFNElJ9PKhcWgCuV2Hg7P47J3e4CRDu5JIwvSJIRp2WnPACJJw8JMzLJ6d105pfCEwBEDehnypvhk3xNoXZf@lists.linux.dev
X-Gm-Message-State: AOJu0YzQMuc9gfZxYkaU6gVMBkcOpH6hzSijvHZCQftdiQiTm55Rdtlu
	uw020xWBB/aFqcB265BpHVUoSx/V8BrdYxhA4wtF91fsAQ3+txMttwPEkIUL2smHnxrKK7pmn9B
	rLfctocg0MC2mYxVet2436uEUn8wqve3tR4bPqipVAw==
X-Gm-Gg: AeBDieveEY/y+l5FoaCdma895zTCShasUrRVOwg7VG7vZ6mARiZCEv1lHn/jsyipY3N
	ZrI8cw0pkAvgF7dAf/oaYlokdpC3ggesGdIdJVYrSjGClWT2bTtIlyyOuKYqA72Lbwkel4mv41v
	S+I+nHa6D4AZMVi3mKcLcCxE8kmgvrUKeTvk5oHNKxtltGr4bvpfLeZAFftS0nvbv04uqASIszs
	vbggDrigpzDMPeGlwEcVtVBPZRrVFIaOqD6k/tGbiJaopNAIhKlPSDJ8BTykbRlWG+Vclv+iIr/
	tM/O1Pm+JWfJHCZvHszyzOXLL4KZSEZ6DT3K8Eulx1tOtyDsVYA=
X-Received: by 2002:a05:622a:1110:b0:50d:a8f5:d51f with SMTP id
 d75a77b69052e-50e36c5861dmr193555201cf.45.1776680072432; Mon, 20 Apr 2026
 03:14:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416091658.462783-1-mszeredi@redhat.com> <20260416091658.462783-21-mszeredi@redhat.com>
 <CAJnrk1Z7cgKGM6s5CaOg9t+qQ206otDop6YdzGmV1dFw9M3KSA@mail.gmail.com>
In-Reply-To: <CAJnrk1Z7cgKGM6s5CaOg9t+qQ206otDop6YdzGmV1dFw9M3KSA@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 20 Apr 2026 12:14:21 +0200
X-Gm-Features: AQROBzDLy1_pOJ6hHmsMyUpa8Kx0Z3MNs-rLkzH3sHWUW9SpUyLFstJGJgCljbk
Message-ID: <CAJfpegtMBZeM_f=KhNym5fW6HCXvU5ydMtmeZS4q8h5Fneu9jw@mail.gmail.com>
Subject: Re: [PATCH 20/32] fuse: split off fuse_args and related definitions
 into a separate header
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Apr 2026 at 23:53, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> On Thu, Apr 16, 2026 at 2:19=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.c=
om> wrote:

> > +       void (*end)(struct fuse_args *args, int error);
>
> I think you accidentally dropped the first arg (struct fuse_mount *fm)
> when moving this over?

Fixed, thanks.

Miklos
