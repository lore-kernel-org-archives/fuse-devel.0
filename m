Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66446211A14
	for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 09:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781515982; cv=pass; b=nWxeoc/sBK6wpaUUEY6FS4BZflPKDLvFYGMpS9LNd9C4tpAjgBts65wcgXlzO3uVCT6J6UQ835ZSciXfsLidRPj2Oo5QvXvsTDHj9h2vZZLyX3DjSIm4ewVMHDWFYVUh9ip1vkM4sjWOfU44Apf4NcVCvpGqYSpuycIm+DzKOBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781515982; c=relaxed/simple;
	bh=aB6CHC1bHUiVtTWjXxxuFu+TTGw2S+6AY2q5gHS+cWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFR0z6z4Df41/2sVKyLbeoggvREIe23ANBIq6htjghy2tlAMlvjipcnlaN5HcXlrsmG1qbFwFQirW6g8ggqf/+PtcNXiAQrS49Hq4jd/woRp+GWIrZHudX1DJX9/n2QAvLmUU0MGwkVMUoZT7BP0x2hm8YiQJl79XjBzSSTutsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=efbKwzM8; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="efbKwzM8"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-517654b8e28so21788371cf.3
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 02:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781515980; cv=none;
        d=google.com; s=arc-20240605;
        b=FoO04vnZUYi4wtKgfhHnsrZKSSChlB8yXEugsoEmu3tgCm9dguP6/xCQ4jwFREUgeV
         bNt/LJrucdhF/i/LFjkoWr5ENq7i5X5/NaAemDpmeAQhrmVQwHRhYPGFjdJ/kozTPFFD
         LC5mpyojlSU45H+G8E8FMAUW/5vHKrGgTf11hBzjEaKYNAtcEq27xFwOM+SxQ/H8g2NQ
         Q4O/Er/IIJ1K0yHvm9+I/m67NvIQS05inpyDlDesYXqQSin8sDqmTcyTAklGibsXQ1Ez
         al6Lx3YIELMvC9P0ut7+YGHOhzpYZ1CsCdUvFtA1LHs9PBxgmzZlDpehUXeGPREBPT9K
         r2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gZMC2mw3qI6nOdoCS2OegMNbER4r7r5gqe58XKg0zR4=;
        fh=w2Dy9MBCymTAHXuuQoFoyTRhGtZ+o5YcX5Bg6rpudfc=;
        b=T+NMQxuI/Zqj7DJ7mtpmobjLdi/AX8ijXJHDjyNLHK8lj1a2Q0iJL1BEoFxQHSVgy8
         oS3t0lzofgHEidc+S7bYHVIyKmynRXOsaeAfItrRzsK/ykyvcsU1nXPSOd0f3/o+q8nn
         cDFj4+MH7tq3aHpoDXVQNsH9+v5T7n0S3Z7PyZM3n7nxpFY8v7rZWmj30tr4KqQsB9Mx
         yc/tcLPPnkU2+BZelf2a6MitIKlGpMIBynfG0QsgMgzqNAiIshKQ75IdNdd0gsqa7S7V
         8dI+MD08N1v88ARNjMcQUey+75rKT0eBGDvM2mcFlwNHgNUx/N627GUgPiuf/5dKhkRu
         AntA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781515980; x=1782120780; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gZMC2mw3qI6nOdoCS2OegMNbER4r7r5gqe58XKg0zR4=;
        b=efbKwzM8h1m6QpzvVEnaaRgoC4QYnywMXTFM5lioHfoj023Ojt7Wkf04ccjvmEo/Qo
         jYKjoWcEf1NzhdbsLi51E8f7eA0g+gEA4m6/8e5+ZzPaRrM4WILtVRtjZYyd8axIx3R+
         mvtEOcJId+u6FEia4zWDsMhhHcbj8FGoYfKLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781515980; x=1782120780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZMC2mw3qI6nOdoCS2OegMNbER4r7r5gqe58XKg0zR4=;
        b=jNwTFJeCzzpjI22bjcn5wQQr7sqtloOtZLznAXpEcgj23eKcADimSkIWj3v6WaKZRf
         WJQH3xqZZI4l+Cye+7+3TUzX3nEI9Vm/dRfmRpsNttwVlnuPgHrF8IuIRKgSERHQLuO9
         dJOmfv3nCQczFb+bf31dhEJXdHTze8lLfuk0fOkhusBOI90wTrJI4NWidJaQ0KjH9EBJ
         DTk526QKNuRrctKD8cIJYtE/XT1cNF7fxR90e1pe8S+QsfoEj+N6ZJdgDGqmhyGXu7EB
         ZIDNm4T6UrtANzc+1I0F0K4CXzq6/3dqEKhMkrp4ofVrF855Vp2aycbtzzCjKLfBjEIY
         j7fQ==
X-Gm-Message-State: AOJu0YxmwArAUgtU6b5bRY0hJ4nBf9/ra339xy02/nQ1eXL9AvNIoaE7
	aQMs+l9dFsr1CDbi1MlJF3t03UR+7+F7VrSDdtD+/P+cX0tIGWdzWRE68tL1LafaY7JQmmxBVa5
	Z1vxb7+jj0+oEoMVKWNmv+hg03BNxrxqbfK1nIF0h/Q==
X-Gm-Gg: Acq92OFRrqC5WwdJCIk6ey7yZZEhPLl1WZm46u1K66j/xVtw8jkRmKcrcJ9AbQzT0yI
	0+rAzn7/rAh9M1i6bXCJ89CvrYGXiDGTk+0WnLDE3xvhgSQfbrZMVYZmMi5FyoMyAuOfUYzxCnv
	mGNJsCoxUQMea90zSmlABkWpRY6xxagp8expA1hpZuEwPdcn4uZ/t+62WWb5e/WSVpXzE+mje/q
	hV1lt6E0bk1QgjRlSA20WYUioJULMrJPXXRkgyWXnrXZoIcaRSw4rkKJgtdTuFNNGuETROc5IRd
	7v+I2u+3rSll1bhrFDB6t5H7WZZDSBJTuQAaj5Hw
X-Received: by 2002:a05:622a:5b0c:b0:517:7f42:76ed with SMTP id
 d75a77b69052e-517fe1ddb42mr182646841cf.12.1781515980266; Mon, 15 Jun 2026
 02:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com> <20260612210513.1516038-8-joannelkoong@gmail.com>
In-Reply-To: <20260612210513.1516038-8-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 15 Jun 2026 11:32:47 +0200
X-Gm-Features: AVVi8CeBPc1nsJ_8dHPoU6pNaZuqOazNpIZA3DE7LZlp6kTP58KZ3_5zn92gufI
Message-ID: <CAJfpegt8sfO681aoixfCc2XvUP-OH50GVHG-vmF8Q3oGqxF9MA@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> wrote:

> Buffer ring request flow
> ------------------------
> |  Kernel                                  |  FUSE daemon
> |                                          |
> |  [client request arrives]                |
> |  >fuse_uring_send()                      |
> |    [select payload buf from pool]        |
> |    >fuse_uring_select_buffer()           |
> |    [copy headers to ent]                 |
> |    >copy_header_to_ring()                |
> |    [copy payload to selected buf]        |
> |    >fuse_uring_copy_to_ring()            |
> |    [set buf_id in ent_in_out header]     |
> |    >io_uring_cmd_done()                  |
> |                                          |  [CQE received]
> |                                          |  [read headers]
> |                                          |  [read payload from buf_id]

How does buf_id map to a buffer address?

Wouldn't it be simpler to provide the buffer address directly?

We also need some uAPI documentation (generally not just for this
patchset).  What about a new directory:
Documentation/filesystems/fuse/uapi?

Thanks,
Milklos
