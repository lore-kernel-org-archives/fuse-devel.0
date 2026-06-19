Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A25434BA5B
	for <fuse-devel@lists.linux.dev>; Fri, 19 Jun 2026 07:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781855861; cv=pass; b=pByirm/EQkq8Hb0yi8tWTHQNdAxIEvu/OUR2ZXmuW7ArFp8XC6C5deMPthtGfl50unVNY3owQEHgEpTHbJphxxmOX4F/i4J8jyZLGXV2xOpGqOpT/Jr3gLYfi5b/AsvNrBbcq57gc1mzjfB/2G7J6kn5s3KZlS3e9/7WWDyPEFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781855861; c=relaxed/simple;
	bh=hcFvNslR9GIBv86wDA87a8S/oLYtv7V8q5nG/kfE8B8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcpFNpy+qkRYy/Qw5c92GTonTTmVZeC6EHp5qnaJEbXn9pQrlxkIH/U4qlAywPIlueR8V/hVxX6vOqUxJfmk/u9zaz0txNvs35prcVrpmXufckmzUECNgsQkcnWyYjzUhGDr2I737b3kqA42Ka8YRQNf3lW3k0YnQ07MdS8B9eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=niqsfeSn; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="niqsfeSn"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-517b1f2c6adso16500061cf.2
        for <fuse-devel@lists.linux.dev>; Fri, 19 Jun 2026 00:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781855857; cv=none;
        d=google.com; s=arc-20240605;
        b=NEpFodoa4w8TIMVVJYBiKVSkz+dLA84Mb/gQRPquhQsJK8d0w2BI1rlXNDaVaC7JxZ
         wpyFtyr2+i6C1vvIyp5JrqH0JY32fvOBB13HTvYmRmdqSBV04qR5vVWQz9sVJ0L7PZSn
         p8cF7Z64abppdHmvQ8mCqiN+9XQLL2bkU3IcQlhENwtOKUx68VeTMmMCvXq9zrIWuFa3
         13HlUTNIOex0vt7fK6d0RNxBFpbpM6ax+mWPHs7ruGO84ZurXjaodUki0LmX0x2+k4WS
         VmfLtu0dYzoOq8NCvC/eYS4YGcwLzRtW+uV0Kr5MiJ4Fk0z4DHj1YIOOBfQgUHrqIa34
         U/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yueEIqiLMjd4SP69a27bbFdVzyy205bKa4rSPUvc9gQ=;
        fh=w2Dy9MBCymTAHXuuQoFoyTRhGtZ+o5YcX5Bg6rpudfc=;
        b=bbmDhpj9pdK8ZZ8ifNXqJAbzX/D89RahYR9cBaXYFM4X0gkvD1LDH0OJED6Ix0Dufq
         rkrK5P+gXDa3GMaY5j7/NQVaLq1Wyp+LQ+az9cPe6g9lkOMPJP17NF2d/E+xUitIXTDf
         +ghbZFl5lec/6LaXf/Ib99z4MRRYh5V/ULu2qZdhmjmInAwI7p2uh/BYaOsN8claAVqP
         pGm885UVDSfmZafd433KgExOwNExzbun4DmHf3lA6SlL6QTa6AohDNqTa38WrfCA1pvm
         voSb/0F1qXCdz7hUn42WdYnHTJT7vUzPDoS3uHzmT0lud4R2HLIMqMm3NB4XnwtcRhQu
         qQDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781855857; x=1782460657; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yueEIqiLMjd4SP69a27bbFdVzyy205bKa4rSPUvc9gQ=;
        b=niqsfeSn+Yvssm256hdaCOj2eA/8K5kY+RXFhAc+4TGksa9jXNMQyTzD0PwFGVh/bQ
         c53CrHqnBIIOcMjd1L2sa0GLhoWy6XA9Kt/wNoaRNWzqPhtCEUmJpUx5F+IOGkOgPfrk
         heRqvgSsxIWFlbC/NfpenaNjyOAjL+7fR8Oto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855857; x=1782460657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yueEIqiLMjd4SP69a27bbFdVzyy205bKa4rSPUvc9gQ=;
        b=pNwj5IUAKl1Mr1VKpRaUiCnJ7jllp9WvOz7PtCXcTtaVUHQcL0B4PhZeZfgxDZ0/o+
         CKK4eVU4ltNdAzVpltJhgoVub2YtIsw0YFrULXcRWl8q5TO83QtFusXP/VNbLnIxU06D
         ZaXVK5PPeLTQ1Fi5L2CjyMV1tfzRb60AVaHVtFP4ZNtB1wsfM+/9eXO135ZEEzytGb6N
         OQqc6pB9bJYFGDAX7iwoRUs1oUaSvM/ib3XDZ/BRSrHmM1YfIs9fXMs/TUg/MASCKHpT
         8YJaMW24j+gU5IpDfE3ndGY2zVo9xmwjOCWiMsP/HNsXJMPuuQbhxnj1s/srrEJlrWsJ
         JHlQ==
X-Gm-Message-State: AOJu0Yy6KMUeikCixtFn9aPDaAfTHEB5QBqpRlUHWAfZxyB9Jv66tKhT
	dIe2kniTX82x5xMjRcyz/ByBgsx860xAOFaJ8Z+ktBtZA4aD64jQOjJOi1LuarIML3+ROCeilyY
	qYzIAQvLTch93x3q4xx4YyFREJnar3lkUVnlnSbiF8Q==
X-Gm-Gg: AfdE7cmAUSWCaAkGdzCrEMYPSv254FwWLUsNEs/56gF03J0CO8Wsb0MUuAlwGQsg8HF
	W+VLK2IyfwvuqlnFJa4IvtEkDlnL3lspdjJSeSsb2fhFk+aIMENAjL5IDfr+y5vT00R3z6pBDUi
	RrKGIijEQeOHO2uDx9g0Iqd+iYvhOUpetqkvchVXVLgSJtG16avxzMHDR2Qjoov8RZogsGTaMPH
	Jo2eB8oD/IL/T3CE2CkGv1Dm/KaWcFw+Rb6eMvyurMIMffGwYhWVjddc2+YWXtJd41bfGz9WFca
	9zGWYAyOkRNuBBbO4iugwZQ2jlY=
X-Received: by 2002:a05:622a:24f:b0:517:580c:bcd3 with SMTP id
 d75a77b69052e-519f02dae0fmr17957461cf.19.1781855857151; Fri, 19 Jun 2026
 00:57:37 -0700 (PDT)
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
 <CAJnrk1b4r0vbrm_HNe5bV11FVmdKDNAcZzkoLtoW_hEmmBjpdg@mail.gmail.com> <CAJnrk1ZVs2hOc7CRAVb_fQPJiUvqK837MzOWQqv4VB9YU8q6mQ@mail.gmail.com>
In-Reply-To: <CAJnrk1ZVs2hOc7CRAVb_fQPJiUvqK837MzOWQqv4VB9YU8q6mQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 19 Jun 2026 09:57:25 +0200
X-Gm-Features: AVVi8CfeSufonPFqYEkhcpi3RKlCchShW0ve06oR5Br7dkLamMFWBKoO_Z5Cf1Y
Message-ID: <CAJfpegsKX6g5v8jaT0iHhSXJV7SzQs1kKBW=ftnRKU27_oPZ8w@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 00:23, Joanne Koong <joannelkoong@gmail.com> wrote:

> I like your idea a lot about just passing a chunk of memory to the
> kernel and offloading the management logic entirely to the kernel.
> Maybe I'm missing something obvious, but why would multiple pools per
> queue still be needed?

Maybe you are right that it won't be needed.

But I still feel that splitting the buffer registration from the queue
entry registration makes sense.  But maybe we agree about that
already.

> > Even with separate waiting queues and the kernel prioritizing sending
> > metadata requests before io, isn't there the issue that if the
> > requests/entries on the ring are all IO requests and then a storm of
> > metadata ops come in, they're still backed up waiting for the IO
> > requests to be finished? Or am I missing something?
>
> Thinking about this some more, I think the kernel could just
> pre-reserve some ring entries specifically for metadata ops / non-IO
> requests. That solves it on the kernel side but the userspace side
> would still need a threadpool of some sort if its backend IO blocks
> its queue thread.

Do "normal" filesystems use different block device queues for metadata
and data I/O?

Thanks,
Miklos
