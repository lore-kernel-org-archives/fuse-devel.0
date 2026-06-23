Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96453101C0
	for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 00:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782174500; cv=pass; b=IbVMDG6DyQZtVDpmNenqhO2k7NhSeLkdoAd0BuYdZy4316wF4cW0GL+It8IT8C2SQ40IGS41okG9i20GbPLl6kcJuWro/iz515AkiuUIxjuweAhtbKn/+KM0DMzMlvLU4P2eFV9zx+pOyaxVqxOo1Ve0kz9mLczXy9z2ppLZkWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782174500; c=relaxed/simple;
	bh=s3ynWqf52DPj7JHDpT+y/F26yWvSZ/RIxjcRXOZL+hE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AO48BAVOgnPJ6TuDnDqXE0zTfMp8M9Ab9UbxjhB0ULYMCy4PxhSWSAoN9/Zv3xKscn/TWOVRq4PY5tt1Q5wazSMxJwUr/kjLnEoRy38k2Mh0wZxADjAzqiBVmUwlsoOIwS+Y62SdIDFw75mOYJL7vEF+lYQZpW8blZF1xQaHBDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqJHzgRT; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqJHzgRT"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-460662fcb4eso3336737f8f.0
        for <fuse-devel@lists.linux.dev>; Mon, 22 Jun 2026 17:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782174497; cv=none;
        d=google.com; s=arc-20240605;
        b=BPKZp7ix1//lOv8JP2suaL09VQvCYrsFW3M/i7VDCtVg+dTXhZJz4qeuH6BfCf/xkL
         4RUpDCuwD90V7cQT4yJZvKYAboxphTD5ZNeu8e463LMwukggam+BhPDJHa85MZUmiTaR
         CGjnDceDlnwA/cLw0KxYnq90anucKrJA0TZKF/41r8sll772DsoLH5Cg0Kee04ig5mNz
         HFVk88bDYphYkS1WEkLzVbNVlisNlUNTSV5ERCf3DiekmUm0cf3cpmSgAMA6qOS+Yq5K
         inE2ww77pmaaziQDb5IARxbgaQSe1MMy4fz7+cHDuTynWv9OUAoRb82DYtA58EBgW7Q4
         4IqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3ynWqf52DPj7JHDpT+y/F26yWvSZ/RIxjcRXOZL+hE=;
        fh=8bUFTemOwDoWiOdOkdFFPfADoT45yqq3f7053C+zN1s=;
        b=R1ZbP2em4QRxodI4yDKV086AqmvZkWwJ1E0LAuvzab7AFBegeuo08voDSGs6CKFQtX
         A0smWV67aOPkdsDryVl40iA40va77XA8FojuVnN00m2O+RMGy7qN8qNDD2zDEJQz1RZo
         VV5LX6JLoJ2NMzwT0gUgnDi39ZX4F72KxCiXIpg/axtA/LMM0IhjyqbJxjIh3HOw4t8o
         ZA/UNVOowFRy44OBN0dUuv7GnGnYek+FmXkdq06Ua/nnAleK4VJVd3M02WFCwrkXaYyQ
         WCNV19o6Ad1jscxpPM18pnVLuU5k43u97YpRicz2IdEqLAnu57aYfbNdOQv9La+e9w1H
         sUYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782174497; x=1782779297; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3ynWqf52DPj7JHDpT+y/F26yWvSZ/RIxjcRXOZL+hE=;
        b=mqJHzgRTLmsmvJFklyFZw0xQa2+NbVLAsgJnuS2Lb93I6yfdgBc3S6PgNt2OJEpkVi
         3gAlj3OKF5QnvjfX/avAUOjrS2Cp9DUNEuau2yiez1jwP4pXrTTqch0jvCuuaPN18Hyb
         Tzy6mc9tdzNb1KrAXtc9cV7XoqlsUalqvY7+E/vu2U4og6TDSs2H/q1A6MG9Q2ECoV1h
         wAPLOg+TmG77OnDcBIilbCbWPi9GbcqqRSgJmToU89tuDebm3l5u9s1nXTPPaW2IaoWc
         spYzZJbvpc+h0GmiDnEZRKsUBDbchvbDjqOnv5Dt2pTl480blr4Eo2AWBaGRinrvSlhl
         YCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782174497; x=1782779297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s3ynWqf52DPj7JHDpT+y/F26yWvSZ/RIxjcRXOZL+hE=;
        b=JeLRO2lB4yUQzG0ZIm/oRgOS/aFE3BUSdV28xiX6QC+IC8qHaUxwyjySda8ANS5qcj
         3gY4UYk8ecyAK9XCP47XadIyGYvJo4nzNIKwtbHKLq900kODcDPM0NrAZMw3q13zJ/ez
         3wYW91CK8o2pmHEgABYLYMVDV6CojL7GE9ZBSZ0O2Qqha8mnZRv79aKJjiSQelBzTDLL
         wQte5lJldf0/uKY6cuxRgcNcqqTcz588awu8pPuCOCaA5mhWvmLGnLrs/oOviD6vXjEx
         pkKdvyq0ip9HJNyEIRy4njvRcs77kUL7ITpikUoiEVTtmM7hLY5lGfAUq6kP4U8TajYA
         wyDQ==
X-Gm-Message-State: AOJu0Ywjr8e/Cy/Yj6up23pg48GlOiI+vibG3Lr39/moeQPFetCCzy7N
	1jOJAyruc69xyRPrylb5w3h2aOtraMY+r9wC0KvSBWgDTui7ro9avMSEaN6sTIhsn9Wrh2bk4qE
	miOrs9reR6ifSjd0X+e0DB1TMlDGhdyc=
X-Gm-Gg: AfdE7cnyq/GKABNRswcyW8/1vh1RGKFBgHFHZXhKpUGZbi2TzUa/xXEq0j9INfdxNOS
	UMcKHvV3Ohmysud9rztQU9h9raLCzxyf7D9YdVKTeevIj3HbJrj8TAhb4Z/1OA6PIUKhbAEPAOh
	pCuQfkIKhQTbjsT8nM2ogNB/FwUNAYTiDkrgsGAU/t2SalgEhnAjehKGl+f0ZwOrQ6cHHWpXma4
	8aIcfOciC4qcRM44kQWnJkB6/42ADO/cCC78ua0KwGRjP9VraVuA5MKFR1buQGv8gT2cNbRXJ2F
	7FrNfycc9CLKfQEGJ41emYa5XckM/Wz1a+jHUhd/vddJEbrCRy01
X-Received: by 2002:adf:ebc5:0:b0:461:a15f:6df4 with SMTP id
 ffacd0b85a97d-46509f4d2e1mr22894885f8f.35.1782174497192; Mon, 22 Jun 2026
 17:28:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com> <CAJfpegsWpKE4kUUQo+NK_cu6oy6h6+A1M=xokvSQbFtZzu9UKQ@mail.gmail.com>
 <CAJnrk1b1nVFZ8dQYA=iGn-p182HNhhRfZEVe-e_ks_daZAU3Rw@mail.gmail.com>
 <CAJfpegvNyqSS2h28-0sB2j2HUoMnKd7StMsPbvNPz67PiS9w9A@mail.gmail.com>
 <CAJnrk1bK-3tpZoeJQKPLjgpQW2F0YQKVhLeGwkN_5tpBVpZ-VQ@mail.gmail.com>
 <CAJfpeguq+LVHoyC7ZzkF_VSAQdqmQFw4DBztiQA1Jfy=U+D9wA@mail.gmail.com>
 <CAJnrk1Yqa0nvXCBo6GzHc2bP_V5+2dHaJn+2pWkumV0QLr0nSw@mail.gmail.com>
 <CAJfpegv=u=jfOqtHXpEC60unrzO7XFeP9o9HM18AVqWfN=O0Ww@mail.gmail.com>
 <CAJnrk1b4r0vbrm_HNe5bV11FVmdKDNAcZzkoLtoW_hEmmBjpdg@mail.gmail.com>
 <CAJnrk1ZVs2hOc7CRAVb_fQPJiUvqK837MzOWQqv4VB9YU8q6mQ@mail.gmail.com> <CAJfpegsKX6g5v8jaT0iHhSXJV7SzQs1kKBW=ftnRKU27_oPZ8w@mail.gmail.com>
In-Reply-To: <CAJfpegsKX6g5v8jaT0iHhSXJV7SzQs1kKBW=ftnRKU27_oPZ8w@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 22 Jun 2026 17:28:04 -0700
X-Gm-Features: AVVi8Ccv6UPb9cen6Vz_9PIGrOx0tPtJY8n1TaoOhK4DsrtdOJIA3RDtRdIEvg4
Message-ID: <CAJnrk1bDL7PTgDkQH06sR5saqqTRYVOPuZt1oWOoP8ZQRovfQA@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 12:57=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
>
> On Fri, 19 Jun 2026 at 00:23, Joanne Koong <joannelkoong@gmail.com> wrote=
:
>
> > > Even with separate waiting queues and the kernel prioritizing sending
> > > metadata requests before io, isn't there the issue that if the
> > > requests/entries on the ring are all IO requests and then a storm of
> > > metadata ops come in, they're still backed up waiting for the IO
> > > requests to be finished? Or am I missing something?
> >
> > Thinking about this some more, I think the kernel could just
> > pre-reserve some ring entries specifically for metadata ops / non-IO
> > requests. That solves it on the kernel side but the userspace side
> > would still need a threadpool of some sort if its backend IO blocks
> > its queue thread.
>
> Do "normal" filesystems use different block device queues for metadata
> and data I/O?

No but I think in the block layer (from what I understand), requests
are always serviced asynchronously which avoids the head-of-line
blocking problem, whereas the fuse server can't always issue backing
i/o asynchronously.

I don't think this is ultimately that important though. I'll drop this idea=
.

Thanks,
Joanne
