Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A722548EE
	for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771834; cv=pass; b=HIqoEFNiJrY7QK0A/omEvd2rV+ms9vFL0ZB7vmyiV2RkAsrqNTNYe1HeEHGk1VZOvqfxim9dSZqqO+LCqwTLS/N5j39mxdXbfQJHfF7AyeW3DJZyZJckMmlZjOeIqfxr+TcBwVHybd0YNAXuCgoXAYg2kbBsb+36XhehBomKO7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771834; c=relaxed/simple;
	bh=1hb8HL6leNZ847EeT0nnE5zGjwgrY5En1nhxJvaCH84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NuH269kZz0xWJzpKOahAOujbveN6J1KKpNXTbTAn2LKoAx+ZlDTrJDrCAkW6YQuwXtCYoWYpM6zbodEBBrDXTck2GlXY8+1vcdBKMRBODOD6i6GuWy3OVP0quUsZPRoW3q2SjmrWRjxLsCVfbE+FBQ3qwqe6Mfo4gg/asBXmaws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=i8tdPvID; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="i8tdPvID"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5177945a279so7339151cf.0
        for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 01:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781771831; cv=none;
        d=google.com; s=arc-20240605;
        b=e41tu1VA+ydv571nnVFy5Ni+GxT9SppFvyHSbHCpUKX4owa2CRewlGC9gzRvHiN951
         nfRoUI/g/mqR70+jMSBookHZRoVBFs0rwjEAaEpWoz9mwGnmi+UatPbEAB9TRWyZ8ufC
         +ULKbPcSJym31uRRrB4exV568mxHmIDtsl/ndV5JZ4THvi7fDHuwpMwxMmymzlUzFh/W
         QXI2HDvqNYZm6cJHyJX9Zw9H4YOqA/Qh53PakYFeeHrmttD4C5fLxTr2xSq9SasXc8eP
         CEIXqcH3zgCqkBG7LdBuNZXfzZivSOK0uokvbeZ9bUe2zRdbSZL8jPFj11l471cucHbp
         8CIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RbxtbA5OhgCd9IyurVhWHF/jQ2wWhxlHlD4vL1HAxwg=;
        fh=w2Dy9MBCymTAHXuuQoFoyTRhGtZ+o5YcX5Bg6rpudfc=;
        b=f3FXGPeOCPgCBoXZa1eRmAnvOdBPu5umwG2z+I+CR/YA+KL88pVSmEz1CGwOkSS4T0
         mHy+likZyuYNUGNpqcs4s+kQYlefUmv0bq3NxvLYBv/vYxvTldo1Cre7YubJdNMkVxAr
         cYdb43xosD+ZUtZKhrMoRcP7NfOM1QgK6qW0NoohMFV/E7/IyV8e2FTqgjneIEn7GT5H
         LJy7PL1KWOFRrf6UIHA5OcoUPJvz4vcuArCBecxwCCLlAt2QWjTsdQcs1C8mTgc1DnnZ
         Gn5d2Vbg3u2k643PQzBqJxilluYRw3OtgIGWFxPUEUs3sHh8R5aUYd++9kz6x9i+kCb8
         u73Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781771831; x=1782376631; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RbxtbA5OhgCd9IyurVhWHF/jQ2wWhxlHlD4vL1HAxwg=;
        b=i8tdPvIDcz9akYhq/lO8CmQHXiSdHE5/2Uk9d6EdGeWA20pGFc4DGte294hYt5TMiI
         xceqmJu8tCk2BLdYZFNhM+nxJQ7sWcjlTx6H6VVhJS0KyAF8YPBYFgdxGjo31SQzW0ym
         Y7PvnF0xX+kCNRBjcuFDsCl392wSrSBUiF2nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781771831; x=1782376631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbxtbA5OhgCd9IyurVhWHF/jQ2wWhxlHlD4vL1HAxwg=;
        b=HBL+EAujIDBSTOkpWFiIhV2qo97cUptfM64ygaHPSWXJKU2KnRukpgeHb4JrTtmyRA
         zVUfKK/mb9DB5GMumlnp+MmmPVcHmx/DRKDxH/YuL05+S6uk5uAxqS9JLBjbZceQXXL+
         TGWZkSPm4e8cUjUoWaGIZdleFGR288zeCeTYfLR4wdxh51dL37N7iqmY4SQZ/xMKcu8c
         lf2cTBZLXD6xxo8zCa4xZmwnfAdxJLSC5npguw3OANi+8pnMikIc3EUKrYvQY40MVyfS
         iQTR+lZcxxNwJciDXffxM3nyhPWm84nyZWkZaWl2gdXKcw1FPuZxFREgb7KrVFe6IlGH
         1TKQ==
X-Gm-Message-State: AOJu0YyFcZFa9mRrnKry+OzUjut2C4R/iIAYQLAWQqefCOjFEvB9gq7J
	k2w//7FjdTeWc1+ni/30v5Zo0O4OG3gkhFQJPPJsNTuXDWnT7yKA5iNrcJGJ5oOLZCegJ/42R1G
	44D+v1GRmcohN0BvqHXlys9RP91WcOBgkmf1RPitBKQ==
X-Gm-Gg: Acq92OEvORxev3QY2rpxjjG6H+0BztxWYrDQnp+0mm65iGG/oQEPQMHLID5QSEx02kc
	jMYSBcXpqLeQ0cPoN9UDnkXdHGAhvQaRglrfqTX7nj9qxFGAMFZX27AEDkIYfVr5R+H/JNzaO0E
	sF2hS3duyztL1crN/tAWlsZJe5iCW7yMrQZ4BDiKtM0sNwA8kaVARbPO5eWxa9XHKGEZbo+gf+0
	zEfTNWHyBczrJHGi7KevxaaL99ickLWcImJIBMe1IVzSqOu72nAYIdsPaJbfKZtdO7Z0FGqX2w8
	4o6AFTvFDal1NJ1UNQBWURPRuJU=
X-Received: by 2002:a05:622a:20c:b0:50e:6182:b4c with SMTP id
 d75a77b69052e-519a8e20845mr102951081cf.25.1781771830766; Thu, 18 Jun 2026
 01:37:10 -0700 (PDT)
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
 <CAJfpeguq+LVHoyC7ZzkF_VSAQdqmQFw4DBztiQA1Jfy=U+D9wA@mail.gmail.com> <CAJnrk1Yqa0nvXCBo6GzHc2bP_V5+2dHaJn+2pWkumV0QLr0nSw@mail.gmail.com>
In-Reply-To: <CAJnrk1Yqa0nvXCBo6GzHc2bP_V5+2dHaJn+2pWkumV0QLr0nSw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 18 Jun 2026 10:36:59 +0200
X-Gm-Features: AVVi8CebVU04FgfxLlkTbdKJ1AViCyT3lNqZ2tyn7EY-BWeTwz13-16ix1R3N8M
Message-ID: <CAJfpegv=u=jfOqtHXpEC60unrzO7XFeP9o9HM18AVqWfN=O0Ww@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jun 2026 at 09:03, Joanne Koong <joannelkoong@gmail.com> wrote:

> imo the main benefit is for incremental buffer consumption (allowing
> non-overlapping parts of a buffer to be used by multiple entries
> concurrently). To recycle back a buffer that is used by multiple
> entries, it would require all requests to have been completed but I
> don't think in practice this is a bottleneck with reasonably sized
> buffer pools across queues. imo incremental buffer consumption scales
> more dynamically with runtime workloads than preallocating fixed
> buffers of different sizes across different queues trying to
> anticipate / guess workload needs. Overprovisioning small buffers
> wastes memory if those requests never appear, while splitting the
> memory budget towards smaller pools reduces capacity for concurrent
> large requests, and workload patterns might need either at different
> times.

Hmm, so why partition this memory into buffers up front?

We could just as well say that managing that chunk of  memory is up to
the kernel.  This would simplify the interface: the buffer size is
redundant, since it's the same as the max I/O size, no?

> I think we should still make the design for bufpools
> forward-compatible with supporting multiple bufpools if a use case
> comes up in the future,

Yeah, and separating buffer registration into a separate op would be
one step in that direction.   It doesn't have to support multiple
bufpools from the start, but splitting out separate functions during
initialization is a good idea regardless.

> From my perspective, the use case I see for queues supporting
> different payload sizes is for separating IO requests from non-IO
> requests (eg lookups, getattrs) onto different queues so that non-IO
> requests don't get stuck waiting behind larger IO requests.

Note, "queue" could mean two things here:

 - fuse's waiting list
 - cqe's on the ring

Currently there's 1:1 relation between those, but that's not mandatory
going forward.  So we could have multiple waiting queues for different
types of requests, but a single uring for sending them to the server.

Thanks,
Miklos
