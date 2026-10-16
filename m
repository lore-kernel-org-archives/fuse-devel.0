Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906852F83B5
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 09:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141433; cv=pass; b=B3IIFCpl1PjLYElYL5D5/IkPDp5tsn8URi2+Djf/1rrRujaMI+S/jmFPJyAQFnMNL93PuRS+NjaLg8F60z0EvkBYbuEZMEDS4M0jQ2NSqVJYqLHPDuQRTrOnSqKojSqpj+2GgDuY4diJEX5q/CPPPs4w2ZJ5SXruQLJ6xV5RbHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141433; c=relaxed/simple;
	bh=fwMAW1uFiNTEi2jtLJQQkrtRDnV/gc+W3LGqCFhfAQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqIntxYxUNDR4DCrRmltKj8rH4Wo584L5W7K9kRToBGFLjjMdZKD5Gkh/dYSmZjTfznJlI7uzmNC/HLthURMAOT4NVTP8/Iv4rPExI507fS9WOCFQbMXSsT1+qjq1WSfCZyz0pK9k10SzHYJketVPRE+fUBONNdw/VqBft1wMYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=PUz21U8H; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="PUz21U8H"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5350d9ea106so75683871cf.0
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 02:03:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792141431; cv=none;
        d=google.com; s=arc-20260327;
        b=W/u/IvBRhSKH71n0QUwf6oVUekigAja0eTyF4XvFk5BG6ouFFGwk+w32r5ALg/vopq
         4H5I5baLAt1+0BB68iugdqROhaYVd3zKqLpbjfVCqy5xDcxLI4bqylEkYLfJHbmTKnfq
         6hkSZCaY6T5ntZ5FJ5VjFnlPr5sIWYLCCmtRU1tfT3lT20hRD6pCvvpzo+UNSAxAnSjS
         +0Ptp252lyaX9p24bMhnPgxfNsuygTkSrKJC9KRn2PBY3L0Sr89wTEGW5ehf341gB7oZ
         ryroeGS7Lrcg0mLbgzCZ9RD8yyn8JkoEsCycb48K50YPVJacl4r3h6IkLeTvaqqvFo6y
         VkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3ldt/ovP6OCRMk7JZB3e2CxtQy31x7HqZOQU7pqKqnk=;
        fh=RnCRa4srjnsZQEcnQd1F1U1GwJmUxSDEImTPN09Om9U=;
        b=sb9tydiFOjXF6a65s9duiieyvwWIkhfunuWXFP7Uhv0PgJbbpKcBPlbQpKHvgqdGX/
         IEb0DinaQXjtJd3Y3SLPWKJaTLKjZSCA+LHw/+T2fDvCB8jOaOZN7ZjI92Gyu4YzIPUY
         VMZGypPCfeywZTL4fYcNZvQwxaj/+FmTrkyr/JysY29n5GXcVG6lCsn4uXk7JT9vQ368
         ybasVCUdFxkZOre5isjiafOEW4q0BxSWdjr+P8xlSqz1Kj2GcccmXS5LJ8AJhDC6sjV3
         xq/7MtitLoXx4jCJvcsU9RAoObqj5gYGJwZ8eBq0qJQj1DH8xmlanD1gIJNG1KuGt11I
         nEPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792141431; x=1792746231; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ldt/ovP6OCRMk7JZB3e2CxtQy31x7HqZOQU7pqKqnk=;
        b=PUz21U8HRkN+Y+SHSgnzg4yRAcBSfU76O9r1Bd3K140Or41PN+Q6nAVxb2/Rx6fyON
         RO91pO7SPuU5wpCKHNbPSvDe8OpOGWil9ww0slfS+1qJiodQIlDPBfSCSBlF3gexq0vO
         J93avEc38j4HgZiWGBWF1J0RnYX/R84YjXY98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141431; x=1792746231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ldt/ovP6OCRMk7JZB3e2CxtQy31x7HqZOQU7pqKqnk=;
        b=jPfYFQR8R62L9nZpA/D/dKxonVntixPTNbC10c4l/Z7FIInj1/xuO0RP/b2LAmm165
         WEDz9HSB7/1QlP8mxJgapnI2O0ApNOXkBMur0g/owhgM3vN49U8x3hnAOteWYyLrJZQT
         qPC5X4kGKZwaVbgmVaCtzk2iTRUXUeT5Xhe2OzJEiEYSv8uUrshGQFlGsJQERguEjsEL
         fnsI2ZuLmZj1l4c9m7lCbhsBN9ZHXx7QRKJsRsm7pESyWCV2dke+OB1XyA9V/YL2qtPC
         i55IC8tcfyXxUf7pl58qW/dp45ALvqg41+/T8L6SqRCjwtwp9h49zYozyaMOK198vADe
         QtEQ==
X-Gm-Message-State: AFq9FYJrq7zyIukrcvx04mBrhuJ2tOxIS4nCKBAFIeiznMJEJJ/CsoP3
	eWdkpM0uyCayZmiKNEXdD9dswWk3Iy5JBToAJ2qEYMheXLZPnDZEwcOPtEdw2P0TsvOofLTNjB7
	B52E2ggS+eRgiS3djKcNtzgu6SjgKtOEbGt18Xnf3rQ==
X-Gm-Gg: AYBFou10ZhoW+JtksyU3NPM/ZVMhC5bjywvDjm3rQcgGnlBZeEC1VCj04kGTLnV516f
	CCQfBp7V2WEGltKYokGSqsEX8dyfSj1ofJC8ax2WsVKgMG2mox+LY0/TXqgzwzh4kPlN1FSMibf
	6LWm0ip4s28YHF+rLEn4HpKXGJNxJIY7EiMqvv8cE3+Xrbir/GWCh54yQ25aX2bEtHBOkYsWFTf
	f2lWNHUV9qwo88gtfSN71BwNTq2gMCd656nBnqG136YQG95myydkOLEDBbTtDZ9RN6WOTt9pzOR
	MH1IKCW6k4liO3OM/0PibrhGl70DkWacldnwDSf8nobEA5DBZ5rydM5CA+LxS/BiYUfxBAY9Nnh
	b8+YGLQ8=
X-Received: by 2002:a05:620a:45ab:b0:939:6dee:4b09 with SMTP id
 af79cd13be357-93ebd28ade5mr3524269585a.51.1792141431447; Fri, 16 Oct 2026
 02:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015175856.13333-1-luis@igalia.com>
In-Reply-To: <20261015175856.13333-1-luis@igalia.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 11:03:39 +0200
X-Gm-Features: AclHuK-GRQ2nqGxByZtvVUtGPEc6GMVKcrUJWAGLTUfAUZd_De9hnkNE_Pgdx3g
Message-ID: <CAJfpegtTEgAZHXh4Op3ei3SfSd+5cZN3TeOwD_cjFRbbTo5yiA@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: rename fuse_direct_io() to fuse_do_direct_io()
To: Luis Henriques <luis@igalia.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Oct 2026 at 19:57, Luis Henriques <luis@igalia.com> wrote:
>
> FUSE has two functions with very similar name: fuse_direct_io() and
> fuse_direct_IO().  Which is very confusing.  Rename one of them to remove
> the ambiguity.

Applied, thanks.

Miklos
