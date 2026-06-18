Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8879378F39
	for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 07:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781766204; cv=pass; b=I1Eal/MKog5JBp0xwHqhF4EiR3SdF63YY77MqeC2viKsmhRUvgPqX6vvsSnYLeUxluBodsvK2REZ0NxcHvQxw1VMmZb8Eu6i97ob/rZgWiMcA/wuQagxs6T+sNsAcCwgw4RKaTIFLJ2rxxnpi8vjliQ4qS97yO/LH5W8RnwhN3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781766204; c=relaxed/simple;
	bh=oIpAISBMJHw5b9rJC5StvlvvQIL2ARm2P+WJMmEHHxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDheZXyy0Id0igoEajVb0+781xsCY0OsMMqoqzHZzN2imDJ1zwoghNmsnFy5fR4ZDLAEMrpEGmf7/lCcU62gN7QGgkgQBTdWG1W3FeHuQv5/2b5TzahZafEgW+CDKg0n/mNr+XSqkTjn7D1c+HK3/22s1vR+Df6/8qwPLNAoLeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hy+6/58h; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hy+6/58h"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1037349f8f.1
        for <fuse-devel@lists.linux.dev>; Thu, 18 Jun 2026 00:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781766202; cv=none;
        d=google.com; s=arc-20240605;
        b=MJOoq/1dDrk3lu2u0NzDdRzpwmBVcsOZc6TRlAQtj4A9rKLzczkl69HoHx+yOef6bD
         HE+sZePSZPO1yu8YN7X+J6rwY7nZWOlga/Rp5Dx8+6Qy/+r29kiJSGvmsoG+qKyLo65F
         UXnV/NhQqlL6I6zoLlhheThI9kox5PHyRoPkzRYv3u1kOUSoZlXt2q+FcX/qGQXcXCHY
         6Uj/g5LNTQHoltvraQyAk5ToUJQYqGtfQy2xPqGS5uFL0gsBYM+7TWtamRlw0AqnWYfh
         XbHClvbsedz9USSTP8ZXToU+pjKZd3di9eLg3WgR3lr8cYOSvg+R2CfsnSG6uRIJvZHX
         8qsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TrcMLQFwjaDsrs46Fk6ri8zY9Cg/4AtcRbLjzElIN4M=;
        fh=8bUFTemOwDoWiOdOkdFFPfADoT45yqq3f7053C+zN1s=;
        b=MJzUlAtn5Aq0GQ2FqO6+B6QPn+v/lnRw8TVdW3zcBwTLDMl5lV1qZPqsfHQKeolgAZ
         rBvt1RjQFVJPwbjCPvZ8zwmnEM9lwURcFtWmC60+KK29wAUNPV8ZK5PgVdfC3I2woLg1
         XtKJziAqAxnc9J2FZ9elBDkNd9nH5efliVb0Y0r5OWbdQYjDbdG70rsaiZwg2F3dXAyZ
         u0FL7pMasBdLa3yj61oSH1n1ouJlw8Aq/1Rqx76QclCTfDmm/rzaJaKRmC8ENCRrAQ+l
         /gCcaOecaKQNtA3Tdp+fWbSId2J+LZ0xmI0Gy48vQ/gdOb2QMROnk5l9QEq7C+8YcG5Z
         5yrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781766202; x=1782371002; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrcMLQFwjaDsrs46Fk6ri8zY9Cg/4AtcRbLjzElIN4M=;
        b=Hy+6/58hinrcotsuYwlMHlZQzdJ0Db3T3h34+oyrGTz7lohLjC/tsHNrwPJh1jf/uM
         1hBOi7YlypBlmf1UYKERlHzk+9hT6A35K5RSi5LtxBJqZ9WTVHfS6duP2bNIHHHkLJ+D
         9A0eX/5Rc5a/HCBoAAEm9kCUS/OzE9OomPmrk3ITy41x6TuNmfvXaGXtTIuKUUKFdlX3
         /cJIiGj4jup1rZfK289Tuy54BRZM1zUvnEGPLveS5fjMFTIajgh4ytWreGlx5mYbQDUc
         kAgID0nNZ+mayUOg8GoxwTzUdyAU0OKFn2ZDzXyhtq3oUWyQhSTwOBChfrUGYvzqSqWF
         4hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781766202; x=1782371002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TrcMLQFwjaDsrs46Fk6ri8zY9Cg/4AtcRbLjzElIN4M=;
        b=tBJAWrcpsqEGtWLtjmIp71/7bzzMd+dCJUKGjyfVe/wrXH+U6I/Z+mQiTIfRs0rqpB
         McHcO5e2Lq1yoEpUFBkpabCFEfnJ7aW8AujrWsdJvOtfJmIzm7F1GXY1cUuW4AkwektI
         FAAMSfKZ3Z2pxPm6SEEhMjHzQ/pp2uhjijRifwf1k+IJbXUxVMohbfjMst4TDKYr2LR4
         qcpa88L3Wga/9AOmpGU1S4VfnL6G8HRSefX7tlEp0/mxraYbL9zA8xerw7bXVhvkWEd2
         tJm6KfZvuSFq3l4TY9G1CFeF2W04x7FVUIun1wt2z8NCUdnI+xi2S7qZjuT7gj1mptq2
         uPOA==
X-Gm-Message-State: AOJu0Yx+9Mqrv/w6OZpintiIylZGm/57DNJYoFAq+90CU7CClEI58toV
	6yGug2KTMNW172+zej+KhhhouN84irr7GM+QhlgkhXIMvYnCiCf1tFIITQCH3AhwomCdKZ7z3Bo
	KzNLFSWuZ7+j9uVbUtNV5p2z9KM0mJS4=
X-Gm-Gg: AfdE7clUzQoPDfzSBNW7Ibd+pN8UTOXHfzXe+57LA/oZvNQhCzD2JviJSfQZpCGmiH0
	/bJWy51twKJriCHI4TXYxYs4lhiBnQSHLxjPm/viaHsEnUnbJ153TSUuw+rd5EERut657JGTtR/
	D+ZBKGbJDEYE4oxXZVSSIZvHUr7d/i8kHL11PCJ90a4YY9AqXhB8XnesiUyOIblcYNPak0sZbkT
	bPFSM2rX7sAQiN+gUGjNb5R53BlYKOdjsC/Pkn4EAI9gHaOyI/mrTUOEQN2y4fwDeHNAgzoVbni
	y8FJly3sfpnfoJ+aG6AjGj5XZI4FYgslULVD5AGT3Wge5XMnfq5V
X-Received: by 2002:a05:6000:41c6:b0:460:1c31:7cc8 with SMTP id
 ffacd0b85a97d-46397c90a6dmr4017674f8f.14.1781766201513; Thu, 18 Jun 2026
 00:03:21 -0700 (PDT)
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
 <CAJnrk1bK-3tpZoeJQKPLjgpQW2F0YQKVhLeGwkN_5tpBVpZ-VQ@mail.gmail.com> <CAJfpeguq+LVHoyC7ZzkF_VSAQdqmQFw4DBztiQA1Jfy=U+D9wA@mail.gmail.com>
In-Reply-To: <CAJfpeguq+LVHoyC7ZzkF_VSAQdqmQFw4DBztiQA1Jfy=U+D9wA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 18 Jun 2026 00:03:08 -0700
X-Gm-Features: AVVi8CfGQ09vIUCPtwgD72AjFS_ZUTrId6A0Mmig0ELCDaDF6D84Opr385iPUDI
Message-ID: <CAJnrk1Yqa0nvXCBo6GzHc2bP_V5+2dHaJn+2pWkumV0QLr0nSw@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 10:07=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
>
> On Wed, 17 Jun 2026 at 14:50, Joanne Koong <joannelkoong@gmail.com> wrote=
:
>
> > I'm not really convinced there's a compelling use case for needing
> > multiple bufpools in one queue. This was the discussion with Bernd in
> > [1] about this. In my opinion, incremental buffer consumption and
> > allowing different queues to support different payload sizes would
> > address the use cases of multiple bufpools within one queue, but would
> > be simpler.
>
> Confused.  I thought this was exactly about multiple bufpools
> (containing different size bufs) per ring.
>
> If not, then what's the point of dynamically assigning bufs to sqe's?

imo the main benefit is for incremental buffer consumption (allowing
non-overlapping parts of a buffer to be used by multiple entries
concurrently). To recycle back a buffer that is used by multiple
entries, it would require all requests to have been completed but I
don't think in practice this is a bottleneck with reasonably sized
buffer pools across queues. imo incremental buffer consumption scales
more dynamically with runtime workloads than preallocating fixed
buffers of different sizes across different queues trying to
anticipate / guess workload needs. Overprovisioning small buffers
wastes memory if those requests never appear, while splitting the
memory budget towards smaller pools reduces capacity for concurrent
large requests, and workload patterns might need either at different
times.

I think we should still make the design for bufpools
forward-compatible with supporting multiple bufpools if a use case
comes up in the future, but I think for the majority of
servers/workloads, incremental buffer consumption would meet their
needs and be simpler logic wise and avoids the server having to try to
figure out how to optimally distribute different size bufpools across
differnet queues.

From my perspective, the use case I see for queues supporting
different payload sizes is for separating IO requests from non-IO
requests (eg lookups, getattrs) onto different queues so that non-IO
requests don't get stuck waiting behind larger IO requests. The non-IO
queues would only need small buffers (eg <=3D 4k). Userspace could try
implementing separation with threadpools instead of fuse uring doing
queue-level separation, but I think this adds extra context-switching
overhead and is a lot more complex to get performant. If a server
truly needs multiple buffer sizes beyond just non-IO vs IO separation,
I think having multiple bufpools per queue would be a better choice
than dedicating queues to specific categories of buffer sizes; in the
initial discussion, I had assumed the buffer search overhead /
complexity would be worse with per-queue multiple bufpools, but with
the free lists you mentioned, I think you could do the same thing here
with a free list at the fc level for bufpools across all queues, and
that would address the search concern.

Thanks,
Joanne
