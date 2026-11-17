Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794923732;
	b=44IRcfv8zZrV9iDZpfPH4Po9RAFSlnkhQ0DPPAtOIRkSR++U8dzXhuBDTETC5399y8JE
	 TPfqRVL6b5D94NItOYpvfcSJHRrAizVKP0QHY9TChKD3KvzgV3yGimVupGgQNW8f5VCOf
	 A/svgww7CASNi+qUUoseMsaIiEZiGRRoz66BfQ8+jIBAILwjHeknw9lM8x9kxE7FG4OtO
	 dkBv5qH9keAzfaAqIdeoho3R81KMaLXuGyiqOdc/t9Sju4v1DpMvupZJcpcWPTZmefKxV
	 kyOs4AB6IB6UWmMlj0wp6x7w3q51+N0737ggAEu16bMHQwOHkv5gp31dbWHUHEoKhng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=PCMFhWYNetgcqgqSD3/UH0RoHtSUqDu9dzIGNxeEMr4=;
	b=C0umGj7g+oucVnHAIcVjWkkvux4n0/2epToSo+D8utHbmMFoSfrQ4+B/emujAS5lgzVm
	 n24bSCGgr+cKnUyAdlTGkxqyc02vaMy7m/sFk/ilAYMcscMlW01muwwFh0vg0pxUpBqOA
	 hGlTzIOmZEVseSzya3+N4+AAFvhAIvnJqEZtd5hdmxCjlVrpV5eF7Z6+K6riQiJkJ57Vm
	 4F1Biocgh9tT6mKMb+JSXDrHDXpS2JS6FmS8I3zgHHZ3dazvvd7Wiqq0il+zFXc3AFHuZ
	 eAF5ckXw2PYqKXOHP2mSDxuxxsPpAtF//X29/q0muXKLzm4+V785Fw9jtzoo83d6pKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=StT9smAs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502AA606A32A
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 13:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 502AA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=StT9smAs
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53665358476so54353231cf.2
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 05:55:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794923730; cv=none;
        d=google.com; s=arc-20260327;
        b=AZn/rfufyMdDxFmtFcwdVSKDT8brAjy2tEPhuuiR8Hb1fEthQRJsnn6KJOnqO8vFSR
         x1IQVjhXO7GKrnK+ppY8CctB4mdoX7Wr9mztQlVnPgkAdet9wUVyKu/PMrKTkb+MbR2Y
         0CHZ9kKeaN8FWFXe5QLVJLW1tIlR9XIGGr6DBajFRtPDsk0aBOuZmc3bhiSa+EWqhGqJ
         4Uqu+mhhzfIv34UtrSrtcMjEfO8Dz6OWQ5iWR8UFKWOLoffrbHFD/gg0be6/DQL0IFpU
         RY9MwQginE0kx/f+lcOWRwQ9+1aDeSfHRwbDdeg+nFAS+no4w10hsejcnmg8h37zoJCi
         hFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PCMFhWYNetgcqgqSD3/UH0RoHtSUqDu9dzIGNxeEMr4=;
        fh=90MVsQXn25FFvsiz50iX00fLA3QkBA5bpC/YYaewMp4=;
        b=bAyXPYaplSue8HZYyPKvipUkuReOZlnGd8gdqYUdmNKArp57AIsGpqj8QXYdGPVK10
         r+4tEZUGf4uUBZeJ0jPnnwP5zKUKqQu25eAImO0OJiFDCbqxW+j9xrADyB5U2E0lxyhC
         qcOzeKiFU4xwo6z/vU9Q9LR3PcWRWWsffqYpMpuxzeU50T8kWOpzNuYpUMlLd6Cqewco
         QNzFoAsnJd2OuiUknXcgMiGTOL7pS60CQoKCJjeSjfD1De+2k26wmCwWilGEixo4GaVs
         4B82QL8eH9BkGz/Xk36wkjggJj1S8fulOjIwnTtEBzL08kXCkEKZs4PKKvrk+L9AH61o
         gF8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1794923730; x=1795528530; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCMFhWYNetgcqgqSD3/UH0RoHtSUqDu9dzIGNxeEMr4=;
        b=StT9smAsM+7E3309wTASJ5YS5bu4j7cnPhffm6H2e06QGCl+i9KG0hnk/leozcfskK
         ddiFmpv2FVKkNcctX/wDZW0XVmi8QH+6+hjxPFPOgEo0HRKLfxZW1lJsDtm/5icjNbX5
         nQzoxjrBBBvLeW/T7PFiwrwF67rSl1KZgxilY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923730; x=1795528530;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PCMFhWYNetgcqgqSD3/UH0RoHtSUqDu9dzIGNxeEMr4=;
        b=SJu3Naj7BVGLcBJuVvaeKHSLuzJcLcI9EhJb3ajiWrv0bVPkBskZMUliqCJgt7VRot
         Ztkj6ueGDj3L9TMWuhfm8ahoqOpvSAYkC138yfoIPwC2pr9Os6u5soF/DEod1ZnZi4fE
         Zwr0H0T9HBcm0tHmU567q/oVovK0HN3xulZok9wMrcjPVV22Jd4OcXnfAK/bW+1vBjAq
         stUOSmSCVkmaMfRA0q2Wx29asSjypsg3AEimMsOUiqkyB74ZRTeFJk2B08F8Ad/DhD30
         l5spiszrg8LvsxHCdWXUKPB5Sbri+6YPGBmc3U7u7RoED+iB9TBkrIPvXbeaKZG4b+bT
         olgQ==
X-Gm-Message-State: APuU4Z+61o6bocmEN9Ep5JWkXMoxEp+arbISc8vyle7haU/LS60z3CuH
	tGAymWWvWW/ZkHUHuKQhEtlFqntNRfYEUEJLymVvco0Jmyzo5pNZ90loxAOKTj5GkTc1gjzN9Ig
	n5jFCtOI6ecHXwPDqKjxWbRuaE5gxqSTBFm5JK4xvJg==
X-Gm-Gg: AYBFou2Tc2pVa9Y6cE8IzYIkuP0g6iCQBEaRXCzHohz1L4vREvL78i5byMGSN8oflke
	iBEmoA1onY420jJGOJu8rXg4NxJbUDVNVhDKgAPH9kbpbmiWwSo/9o7db07jr/VZ/usIopobMqB
	iRjxl5tpAYWkX/Msrwqlpd0obzcASTRzonlLWrVGszcS8e2YzApKqPzSfOIY7jo4c1PCg6n2AIb
	mbJZzgST1YxfVYyybddCZkOidWVpLH2pEGY4X0pxYLEPW5SJ6XgW591G69kwEDpijdfFfhZijiE
	ewh2lL5b6a2WZP5h+2GpvWCFnvJnrOxVR/qnpi1a8wHGh1R8jGNcH6ELXUudm9vRid4mfaj6Hfy
	xtP614cQVK6RpjjGg+2v4PscsVx/InME7RMy/PQshjkGwocKoaDxuqnVyMZYvc3oVXg==
X-Received: by 2002:a05:622a:1649:b0:535:8509:3138 with SMTP id
 d75a77b69052e-55ac366a4a7mr228951361cf.11.1794923730002; Tue, 17 Nov 2026
 05:55:30 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029033700.273707-1-leonming@meta.com>
In-Reply-To: <20261029033700.273707-1-leonming@meta.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 17 Nov 2026 14:55:18 +0100
X-Gm-Features: AclHuK864qzqHSTrfZsL886LInnKNh2XiAhmdPhsQx2jCLEfINY9UG0itbitE0I
Message-ID: <CAJfpegsKJCzdBGmQmbHt-Hxhe-b9cs4z5s-uDBMHDx3ZsnHQFQ@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: set dentry epoch before making the dentry visible
To: Leon Ming <leonming@meta.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Joanne Koong <joannelkoong@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 04:37, Leon Ming <leonming@meta.com> wrote:

> Set the epoch before the dentry is published, and keep setting it on
> any alias that d_splice_alias() returns; the dentry that loses to an
> alias is dropped without ever being visible, so setting it too is
> harmless.

Applied, thanks.

Miklos
