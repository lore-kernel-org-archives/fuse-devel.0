Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794924219;
	b=bg25dU41aBqDlh5MkaXDgWQsNWoipswgZITOBS/HKw7Wv2mwJRCfrj+Nw9QnEIXVzGB/
	 6ylBEe4Drp3sKp0WgVYf4tjQilRx05cxXl8p5Oph5H8/zArM6y5T6egzEsYoKQbAAZlap
	 NTb2sjA92QY3A66Uuwp1zQIg7IG+a6OmttuTQZTz/DhXHQaS8aVBDRvGhAAMbhrfK4P6X
	 GuQd56DMIUnnZywwmdS2OLn1gFh6q1oROaBFsUkDzjXNlH+QmQsFRXfgk2VrNgVcv8nXT
	 F56pViNn5KJl/3pqyRJmFqiu1dy/Jdt1XT7ATY0Qc1vlP6GNDyZgMTJYYK8kwC8imWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=alFbhvhmLX/J2fLZw0YpZ2rT70ZCayDvSm7eBC/5SBs=;
	b=0pJ44xXUJ763H+Xru+uxRFzGHR6G2AJUmAY29hkrgOr1pRVeIBkFAj8ljpdxg8beTt1P
	 HLVouKv+Ql04mNGztPqWqVK3dhGxRdqDf0rRUVk9qAC1b+8bjnfZlUm2Y3XdpvkIwenLD
	 GJzaw0yVYitMMAqS5svd7SSenMk2uuknEtVgGBLVcymvYnCjEOXvpVUaY3jVzq5v4o5nc
	 1oDkyX/izYd5wtxasnv0+w/5CcZm0hgJxy5bBfNlcEQys1qHiCdRNMz+iM0c+ol7IYHiS
	 cgpIs5fhqLitp2X2dGPI2fQnBuG6t2nzQJd5F/+NEBawmW7M7VfCVKK4/YcqGGGI4vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=dQwCtxcU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219A5606A32C
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 14:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219A5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=dQwCtxcU
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-55c4e670fc6so23981751cf.0
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 06:03:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794924218; cv=none;
        d=google.com; s=arc-20260327;
        b=D43XeAvHh4J80yey7XB3Gn+ZhXem8Z4t9Rf23+mm0dCzQBMwMfh6PXptGA9GN7ulbC
         of94COwuSUvZ8Yn/6MqJSgWryI/4OAdKPUwM0uPUXAJeki86L8LodSMXc1qh3aJJztm5
         ckKTP1vFHq760Kqr7wpFSY1ddPb1O7jQTVaOIZSdTSC8p2NHeb80GHr0RDhlxtHSSxSq
         FFMD4tZNAkKe1I3Z88+rkAgiuI7wpgAEt0f0PCQUXdZXmnK7t/q/VLgIPu07Xb/OXGJt
         NbRS+WChytTAQcjQH7po4cJZ0ZWPM4ZTPBMreWgzUNz1aVj78X3Cg1vnZMdq0nUtKOmm
         0aTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=alFbhvhmLX/J2fLZw0YpZ2rT70ZCayDvSm7eBC/5SBs=;
        fh=uSfIWz5Sjgpn5db1djV6gIAWHx/S+LWTvPbfHTZ1JTs=;
        b=gxyf3Zc5pFlMBpwYyyTnkummGUA4D12Cc7EVyMpwqNjVBCcm/ekiWm59591RF0DGwP
         QUqlqU10XP8L7NYLdLk9Nsd547I/Ok0OvVS7h8qRDjxLvz0vM8sjCbDCk3cjkZknb+PW
         Wuj5lUEtBHqtHPv7KguPQGQV/K6P1YDYgOj11f5GwfPCz72Z7Nky1oUuvsTZOdM4r7Gu
         T6SGoGmVmMEl62JDNGofsM9XjvKnmGxFhyknultizjNaVrdsV+h3XTXolQvEgcMXs1sR
         1SddMX0E8W8RhC0+rVBcLMV9uPProMUxqZmzxqkgD9SuO9JrowjQZ3pmwqDpQy4U/aDJ
         ov0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1794924218; x=1795529018; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alFbhvhmLX/J2fLZw0YpZ2rT70ZCayDvSm7eBC/5SBs=;
        b=dQwCtxcUDupMGeh2b74igTmIPn4vlMCoiEfPbhBY3FoaqgXXClGNhiR10vu00YP7RF
         N2E8OYnqdtoEntOQ+go/1nfsF//xT8dE/ryAcWmu/9iv3URwOp42rSSqn6MFO1IuqPAf
         fExwBaes8KJNpRuwsVRFX23wgDegULl6SkQzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924218; x=1795529018;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=alFbhvhmLX/J2fLZw0YpZ2rT70ZCayDvSm7eBC/5SBs=;
        b=IbSc2By8aNal7YSKLyekx/jnAuExHT5YTYZIXpZ4eGzMcBlnueBA+lowx717qhzX4u
         MU4Kj2r8OPScA480Zv8Qg/5LYowL/QJeXGV4NrUOCBu97EQ4DAHs8Ue3Chz8mXcYML+b
         Phre1AxXm8xlGTBzX0d/ZzvuZKFCYlzhhWV9OLoDDRAwJVpzfa1yn6A/Sfjgbk8dL4YO
         LiccjUWym2+2mRkJYOiYlF1B25wbM7/TJELf5xI4lIvQPQzQ20F+2dzctXW1S6YMqDR1
         rp76chbGW/47SLCRqx1Ab0dtSOXH1NkOyBCzywlptV/8vZcv8M8UM6iqLFtSj9/7H3PN
         DUow==
X-Gm-Message-State: APuU4Z+hyEmwpszdh7J3AnWqqqK6+4ncvcbw5Zx5wwI+tFqhAmcrovXa
	DB6qMEZRG+tjFPVP/ozYeV1OLM6L5pXsPsls/n9zfiVXT8m8xhJjtEhAnld5xEgO5coWJZp0Y0C
	TOiv6ZZJjXx/SCufrGeCyYwAYyrvVp77uhIG2czWavA==
X-Gm-Gg: AYBFou3dV+uLDUMVQbji6+ALw1i5Saum7IXOyQ+HQhJyp9b7BaQzFS2MIQcZjeMjNV3
	EzXe80sPtgSCVeAI8KdVavla6vXpHHhbeNFpjQHQDxCp5oy4TRKnwPOyLif1mDOWSEPE3NuzVRl
	ylTF6UdaWUMy1ah735J79hyA0q6QG8T84O249/evNHdJ7mLrXhzJj2TYOiiJJwBNC6E3wGNDZJo
	RwZdXxSJlZOuD3iHX8tWykkpROh0anvNu65tUTECgANrKdYmSLQQLrOyIdg3Xp5vtV2wXCrwhwF
	/mlHAc9K4+siXm1tmMYXebALpGN12RlCOlUMfVDf65HujDFrk7XhJHMAwHfiNzPeJNUja+DMJWl
	Ogv9J6Oo9JtWPZ7PVhy1p6AFKNUeSgqd+/lkm+b9sdJed3IReGFPWV3vJnn9oZUz52oqSODuYhl
	JVliGmImq3pwM=
X-Received: by 2002:ac8:5ad3:0:b0:535:2047:6363 with SMTP id
 d75a77b69052e-55ac448c12dmr221360331cf.6.1794924217487; Tue, 17 Nov 2026
 06:03:37 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110150250.71520-1-ekffu200098@gmail.com>
In-Reply-To: <20261110150250.71520-1-ekffu200098@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 17 Nov 2026 15:03:26 +0100
X-Gm-Features: AclHuK-p32xS9Ymw_ghXNjlBRtB_UAl6rx4OxdJZvic7C_w4sxAcHG3mT5pB1sc
Message-ID: <CAJfpeguXcXTPpYshszCDM=Va7Rx5VZiMStFbSi66R1NjB566+w@mail.gmail.com>
Subject: Re: [PATCH] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Luis Henriques <luis@igalia.com>, Miklos Szeredi <mszeredi@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 16:02, Sang-Heon Jeon <ekffu200098@gmail.com> wrote:
>
> inval_wq_set() schedules dentry_tree_work when inval_wq is enabled.
>
> But inval_wq_set() can be called at boot or module load before
> fuse_dentry_tree_init() initializes the work, so __queue_delayed_work()
> warns and the work never starts.
>
> So defer scheduling the work until fuse_dentry_tree_init() sets it up.

Please add locking as sashiko's suggested.

Thanks,
Miklos
