Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508F83CE084
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 05:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781587712; cv=pass; b=kitgNHgtZM9tJKbyFw+fa55bAJZ/X3UajdxgPPet0XTh3Voc1yoNpdB4OaDH9P0YRVcJmHUG3lzYCx98zm8bVCDrPOrlrH5yLnuRT6lLMh7/lw+LzLkvdQPIF6GOp54JkWhKQp/kAOqDF+BBMaYz43ZKbTelzBTdoyfCabeFaOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781587712; c=relaxed/simple;
	bh=wmzy6NTPie4E08TGFZeseoPLmqomCzYmhXyUe5m2SK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkdJx8qGWxsXTRCAfxvBgHE1n5N+EpYk9S2D2EjLL5kunb7JFpvvJ4imJtYyZ94lYjrNgBb/8W0kTdYmXTeiBOBvhcmumFAeAx8/JxuPWOQtE2SzGX4a8ow6ol2jbmhFWe/TSLKRshXCvG1sH9m9G4X6Ri3sVdL0DJE/y/6lu6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kahfgPUo; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kahfgPUo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490ac357c55so39338435e9.1
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 22:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781587710; cv=none;
        d=google.com; s=arc-20240605;
        b=O6huxw6FoX01sHxlJs/O4QdjFWUPLKQQkKGGMEFEpalP5E3wZu4Y1+E6byWNRjbvOX
         B7I0nGgMypiYRUH6XmKkJqo461/IvJYqGOAqb0BrEBOSuhsr+g4UonICHoqlEIm6KjAx
         kxKGpKEhfvGVkBqto82Gi/gKhN+VsanpQ8fHWVpDJ8T2UUFtiuuJAC6MzdYfadzgl+8l
         NNW13pattkpiMG0uWIVnEkP5mMkE7kIBiYOWWheWmg3l/I7ptlPbsBTdkmofcMPCLTLz
         CUU9ENvw/wDBht6jK9nt+bNqW5h8AzWeb49BAtYgT4KawFbS705lROPgVzGlqndyYUS4
         hgFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T/ZQ+VU7Dg0tzIbScBQFAK9eg1db1WJ5p4QvCQ0QP6o=;
        fh=8bUFTemOwDoWiOdOkdFFPfADoT45yqq3f7053C+zN1s=;
        b=iA9CQ0nywsDgIsj9yzlgcsuUrg232aF33BpLdXb31oXRABKm29AKEZaKxCMTUZVB8h
         TJTFIUFH3kTmFyasXbUNCiTTzQ9Iw7b7uUOnk+knDg312RQgQJzJnclqAy1pb7fTRoGP
         SCNv8xALbk2zHTIJ520fdBQI82sxBvs0xChRiP4g8u57Q4RDkHnb5KBKPMPXLCVLLEHI
         o2VTO9AATNCdFtSgrZ80DvDrwvDxJQrxACMx/WaYaZ7K/zg8CmIry3yitxZJJLH8hrgl
         liGy1bFmw0riJYGd9LcEm6PWn8+p2tVIY4lnIAWIGK+PQmPeYavDqJ7SqWLOkoOthv87
         2oGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781587710; x=1782192510; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/ZQ+VU7Dg0tzIbScBQFAK9eg1db1WJ5p4QvCQ0QP6o=;
        b=kahfgPUo9YVa9GT9MmQF9Lr8VyOYnhzAbYQc1TvNmP2g0T44gW7SgHmp4FDFo6A+UV
         8w0MLfwMLlwEhhMVi5vMBg26xB8kLeLPQ3uhLQvvsdHoENJXlv85OpPk3U0kyvqaHxj+
         yPSleKfd24FUvA93HXhFF1ELn/SHnnKuc11QaZisAnMf877ePad0XawD/bxcrM+xGgKi
         WQpuA2XLq3ZIvR6E5bHK+FmNSgqipp0gWrhIXX/rzcYi1E+IKgA99Xj8LVim5hnn6IQ2
         S19Ufj0sicodIerGefeK4kSQlBVeMwE2dG+uChcSeck4WwC8d7pATaeYBoD7gBunAqAf
         Ewwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781587710; x=1782192510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/ZQ+VU7Dg0tzIbScBQFAK9eg1db1WJ5p4QvCQ0QP6o=;
        b=GX1DcZrPoeXIdkvPHmlU4VbfzSPcUt6nVniyE6NPFE3xEEXOJqvaKc1O7ljHAyW41J
         +wnoXhnuiAXBuhpryZ1PtU4R1hFAK0xoj3LTOz8BI3ZqoRPJvIJJvZTidoHmwWPlC19/
         A7sqRXEA4ygM+sl5vwNgUcVmxSif/xX9p5a845GaMj6nJu2xyU+bkQhks571LMS2Y+Le
         QN6+KWaVwRJj+lEEeiNqKkhy2rVepR06qmWJLkvPtQ8uWpRKhYA8uvfvuV0bOZBbA20G
         Ct1W2SJaXRnI4bYoz4qshW+BmgX3qE8UUBhGJ4OFPqRbgeoiQeGUtwlm4iLn7pTfHPlU
         7qWA==
X-Gm-Message-State: AOJu0YwD3M55UXUvAD7IAUe6cgt/DshFXKxMqQyeRleeOTIxguBdb3Jy
	52jOduTI4AmXry5rPv4CtNB2wrBsSi9Fml9jJZanwrqcQsEpVpMzllPRFrSWfX1qy11E9HtdB6n
	jlqmZpa+fp04T/a72DqZpuYCduzclrys=
X-Gm-Gg: Acq92OFdB1VQPwWDTX/8PEJlczyDsV1KMN0m+bMiy9rZLjCuXk+g5dJdWSoi2Aqa3TA
	QfjnfR1tYUImDge/Za2k/EtTKieM6nObwiYGwb9fkybPiEMRyR/wuN8/nhGTVa+r93rMLoUSso0
	fB2xe58gmFAsvOiWpGcoTaySTJq0pq+WdCzR63O88v9i3TDLhyj5Dw6ve2IZtuNg649JUhPLXNq
	gtpJ6ndJFz3Z48gqt5ckyOpGobjUhrZT3WI+odQcJnCMDrZKeukXyAOsx5QlLLH19Iosjp0XOl8
	/7PcNKrbovQjpJZ+RV1M/6LUxM1yQfD+bibhCMRHxBIDaGf7Jcfp84EJBPKzzLFMF1o=
X-Received: by 2002:a05:600d:f:b0:490:c2a3:23cf with SMTP id
 5b1f17b1804b1-4922ffbed65mr22656575e9.34.1781587709620; Mon, 15 Jun 2026
 22:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com> <CAJfpegsWpKE4kUUQo+NK_cu6oy6h6+A1M=xokvSQbFtZzu9UKQ@mail.gmail.com>
In-Reply-To: <CAJfpegsWpKE4kUUQo+NK_cu6oy6h6+A1M=xokvSQbFtZzu9UKQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 16 Jun 2026 01:28:18 -0400
X-Gm-Features: AVVi8CdNnUNR20DrsYvkFu6ntbgEExwofmjoQhA1Uk6oUWPwzDs9QzKMUfW3CPY
Message-ID: <CAJnrk1b1nVFZ8dQYA=iGn-p182HNhhRfZEVe-e_ks_daZAU3Rw@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 4:41=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> wrote=
:
>
> > To use this, the server must set the FUSE_URING_BUFPOOL flag during
> > registration and provide the payload buffer pool through the iovec
> > payload in the first sqe.
>
> I find this interface inconsistent.   Decoupling the buffer(s) from
> the seq's means that the registration should be decoupled as well, no?

Looking at Bernd's reduced queue series [1], I think we'd most likely
want to also pass in the number of reduced queues separate from sqe
registration. I think along the lines of the config sqe Bernd brought
up, it seems cleanest to add a new cmd op
(FUSE_IO_URING_CMD_QUEUE_SETUP) where queue-level settings (eg flags,
number of queues, bufpool, etc) gets passed in. This would have the
nice side effect of doing the queue creation in this op instead of
right now creating the queue lazily when the first sqe gets
registered. On the userspace side, this adds a bit more friction (eg a
two-phase setup where userspace submits the queue setup cmd, reaps its
completion, and reuses that sqe to register an entry), but that seems
like a reasonable tradeoff.

Does this sound ok to you and Bernd?

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/20260529-reduced-nr-ring-queues_3-v5=
-0-1dc08c2fccf6@bsbernd.com/T/#u

>
> Thanks,
> Miklos
