Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8324418F0
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 08:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573490; cv=pass; b=BnTr7uq4nG3WuHULaKwIR1Ut/NlrpLA9+KtFuhxZe24WkmQxO4mlyCh7VdfLVHMsMo7GKGkr4fd5Zvwq8dGgh1dgrQV8jkmIf2sSwceJuzGRYyD3WhRstVHMyyltMNia0hNbqIY1sRPsU90Xs/iRyUFS+3+rDrH+e+4LcyvWZMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573490; c=relaxed/simple;
	bh=vR4B6nWAaNG2wL5FxOLIegQKVBpVfVi5VwP039YC8TY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbAKMYEEzFYhvhf83aQRFduaZ/CKy9WdMOdfwtivXqeZHEHMPx73qogOQLHkIQDFs8Dy+TZVHd7Xsr8VLOB/CrZq6WDgMa1TfAxjkjhjQEvnwSKC1Ip8DpS2M3v7fNmKPXGfX2p8BNTkIkBxu7MxJMVMSgrWdF3DKqK475puQ9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=avbdpMDW; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="avbdpMDW"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-515226c0cdbso344511cf.3
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 01:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778573488; cv=none;
        d=google.com; s=arc-20240605;
        b=HtnZVNz4qpbQ4p2M4Ipjrhfj5nMdyEeNdjyy9JNGZgSQntYtY4okeH0E6CeMwz99Nd
         CyCRdPEYwm2CSrY9spANRvuZZ7KjgFQGpzQvofjekRAAopTP4WnTS1IjKDeA8QmfDD+i
         0oZkE27JlsC1PVwIarej3tbrcnkp0Lbo9kp8LgYqAqCZHdx18yUttLQZ0GlTTKhiMQbM
         YlwXBB+t7VdgEy1Ppe0UsTa29DU2CPMYjFO28PlWfud8744pFVQvaMWxntIkT/le1Sxt
         o//hDT/g0rOLqJi+VRbRHqCpEPSB2Px3sKzHAHUHxojHRNL9wSrBVfMjEDxNKo0s4Unv
         0jnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=36Q9ZJb+S+FYcY8CC7VRpk3QMo0+LrgwTutEyNv7Gxo=;
        fh=mF3UMUB62a3Xuhps2dtwyigH381Q5xuhvl2mLkJwB3A=;
        b=CEHUeuQHU/Mzo4f0tecTFaIdApcG/68tEnArIvf1cFcv9GF/RQjLbICVr5n6cWjZZI
         eDu9/xRYXj732WyTrntZVM4y+HL7UJKUM4PJJs0cbzmoJmeLDimHZYnn/RlDcSHCmZpN
         KJnlD7+UlCIHyeMUdgzy7AOJjvGllW/sZkVEKDJZQ5muQCpIcieccHB8iAu9CdNkFb2F
         30lSrNJjVb1cBql1/3KSqpL09OETWV8KdMVGe5MpeGb1JeaUZO5cOU6wMmsGegTIOPyY
         6jg/GnrZ2S5gRfBjtctHbr6dGF+OdnBEmQJAiqr6n5qWYKhcQBSj6jkHNOoudHO5exTt
         KPug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1778573488; x=1779178288; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=36Q9ZJb+S+FYcY8CC7VRpk3QMo0+LrgwTutEyNv7Gxo=;
        b=avbdpMDWJGUj1yv/oTpku8lqgzloaQshh4sglLl10yl8JxE6364dCAfQYQ6l2SRP75
         n+6OMupaQ67YlpGAV0UJm43jXFLU6IrOn1vdjvLwB6unkaifS5z72Py6Fifa4NuAAJWX
         noEBDOSTUCTy3TLWWFrE9O4nhZ86aFk1mHvA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778573488; x=1779178288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36Q9ZJb+S+FYcY8CC7VRpk3QMo0+LrgwTutEyNv7Gxo=;
        b=QBdiOqI/IPQ49a6GbrovS+tgOtYAK7ScafswL0JVZjfz4AMaACnIY+NZW+tqtD5C/H
         iMMNgvT8qM1Im1USB8qSV1BULRXXSTGF5e5+IFydRgYE1NtWGwJb2TJWW1N7ZbK2MIc/
         1WuykPqNaWsK0kJ7Hbf59LsmrUNq8yd9xJrCqwLGeUA1aM3+WYGe9IMyeUfXHDnUQPmj
         yABHixA9cFg6FZdv/xuzU0PWQvvpA0mb8HfYCLzplaWtb8628kRXj0pV8ztWVnWtrRqF
         /Wpq5M1emDOglfWicn2MR7BiWceifkhRGMyP1KI69pExfd44XJdmPHn4tJSj5VGWQHSX
         JyTA==
X-Forwarded-Encrypted: i=1; AFNElJ/ciO49K3al6MQMOU3CYdxc2heCobJJlDYPmDceYVsJJT/8dJVtir6GRfWcBKxYVhYU3L5CGke4Vz4M@lists.linux.dev
X-Gm-Message-State: AOJu0YxU33vXiclR0dnPrC/3SUuYcQ/mtWcnSkAI6ecjdkcVQ9MyGUZI
	DHBtgiGgXyZfCN1NiZ3Vj9Gtgg7pD4xjkNxA4v0QEfqhDA/gnherdHVb55G04sK/7EmmNdBVuB0
	b107EfQqXgecy6iLf9Tb/ffDHctJcAs/dvHMUKpuq0Q==
X-Gm-Gg: Acq92OG7c7a2b/lOQsAKZ2E/sGOdPTj9kuiAF68q1NPDtZ3zhtT1zZoFnHMmsgFZ2Wp
	E6AdZ58ntYdAA9QWzSQBn7rEW1aqeFGT2f28vp3VFAgu/XZBP7mJ8LZ/JfCbapjvDySY77Pe3CG
	89kSwHLDQrs8FjGGRRuSiTWWZB5Aw2yQBfCZ2LADc4BpTJMBckQUct6zLpjWBGSaUzwz9BpIJK9
	6YXfEbhzmvEdyaXCUn2k2NkHjTIjV3B1mytwtiFEb3EoDO7yPMDMvzngykkyWOoiuT9s1lJRk+o
	SNuD0wn03gk7kddRG/IGV3yFk/tFyBviFPIzeg3KjzBM6UY4EA==
X-Received: by 2002:a05:622a:48:b0:50e:5752:d1bb with SMTP id
 d75a77b69052e-514d1c1e4dbmr28870181cf.4.1778573487886; Tue, 12 May 2026
 01:11:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <afxK2HSiwY32KaWw@fedora>
In-Reply-To: <afxK2HSiwY32KaWw@fedora>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 12 May 2026 10:11:16 +0200
X-Gm-Features: AVHnY4IqKjt3bWi7g4y-OK800aSsTbqj0bqZHtMvDztGN5Cxy1jvogln1dO19q0
Message-ID: <CAJfpegvYM2bdAJJHaqydxRzyVPNwOU95-MS5F+YrnOkJR+6yNg@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Horst Birthelmer <horst@birthelmer.de>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 10:37, Horst Birthelmer <horst@birthelmer.de> wrote:

> Where do you see the biggest challenge for this. To me, it doesn't look impossible to add that,
> but I'm sure I'm missing a lot in this context.

The biggest challenge I see is API design.  I'd really like to have a
simple and consistent API for this.

First task: need to document the current interface, which is long
overdue.  Here's a start:

https://docs.google.com/document/d/1SInG6nc5dF-db3WtCqFOnRDCY1jRl5JQ0Toiryn2PRc/edit?usp=sharing

This needs refinement, i.e. try to document by cache type, how is the
cache used, invalidated, etc.

Thanks,
Miklos
