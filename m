Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C145F28850E
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 13:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058803; cv=pass; b=j+x16NbCq7A0ClqDno/ac66//gGtA3jd0maFvw8oDN2L8XWl7ewNzZlKeqQ26v19zkfam25e9vf9ZM6mIR3BBCpsn7IlFciktRm8B1B9pwy4EbbY1DV8SZRg6x2b34lG6R+Umq6Vbk4VOjZtf0w7z984ZbwbtCcFbzFa/lGpgz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058803; c=relaxed/simple;
	bh=NrvfAoBO2gpa5p2tJ/J9rrAX/Lc0FG0htGkiFU8pvAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pneli8wYx1A2BbfeIHIqWxn8zWomSmFlyYgDdZhHT02ElZmL/fNQq1jdncWc1Gh10sei6gA7UBrbiT3IprIc28uenG2l+1e3zzItaQrKV22TkTz2Wb2DpLboCFdFJhR3AS1NOF1eQ7t0q6lGaTyA6/TtpAF6wnS60YF9G/vZ2q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyGAGX/g; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyGAGX/g"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so8223722a12.0
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 06:13:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787058799; cv=none;
        d=google.com; s=arc-20260327;
        b=q+oO02UIl3Syah9zEox312z1cxzbR8s5YoAtecpfsVWtTRTTPH1e1oVWLCx+Q4Vywr
         DohesAJixq1O7XK4di06a2mOyWuyle/7/cnsCKZ3b41QgM3pfOBZ2k/cGMvsaQMi4qQ5
         +7jW+XtivO/XMap6fIhhLKYHEWeEvEs/HFeDQdYk1X3kmG+MRynhnGRhyIzyAiXwaZAS
         MiT1/zF+mqdJMD0EK8B57MJZzlDzz4VHDKfco99g/WJtJVYzZrYjYazfZjH4+8pN9gaa
         j9Na4m+pvvtew/1iR2nklcMZt/Ck2qIgmo2Mrg5kral4WpzP1kuTtGaI8X/RVH01OvuS
         GFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iGklY9B2TVwZnj8ed5pwTJRS4Y3AlZdf07yaEbb8FJE=;
        fh=BlMcofPMvw+EEeiXVKX63IDYHUtkPpI3uVfjEqsLLwk=;
        b=FrA6UGJtA/2P9TldxrYfV5gZ3Qsir+nKXQyVGuvPld/bqb9mtQOHC+XzvXsO2T6mxW
         LjDLlEwAABXtna6fu2Pq1TCL1tb+A8CauX341Ct6jzpTyNi921rHgxh42T8mRRdzt5HK
         vNYhTtA+WyZaqReBFTJib3OYbWqZT04GWtZ3luUsZG6/nn25LSUVbYGUmJUhIp1vCgiL
         1oEsRDvSByhw/ytdZe9vBpmSrqkXr8oKwFc7IIFG3bRVWSxXWH6fkDR7fW1XJgBQAuhs
         Jh23T9iGIFwLLmkC3Ti+rZR3wV1RVNgaCQ4M2/HYBmQdrn17k1surW0LcUvjryqSH9/1
         nMvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787058799; x=1787663599; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGklY9B2TVwZnj8ed5pwTJRS4Y3AlZdf07yaEbb8FJE=;
        b=YyGAGX/guj5yexO4fYUGm8g7MOC/Wz95/qzWCaeLgZXhNf5YUZb0dRRbAYSCxiCHgr
         OIgpSpUquWVsUEJRe+C13nq31mLgGrvTPhsH37fHGgeQOdn7F0omfnBsIqAR6i0IFPpR
         xXhALkYJVr0SIVYmxPaPorWhmPR4sXsv3LQPpOIBZcX2oixam4pCeoPCLiaPww0Wr+hU
         AKlIz2/+kI8CRUCHFqyUbL6r480KrQrX7gUxMWBiYJdwqRbMZrdYT3PxC2ARX6D3wYxA
         k+sz7gY/HHABAlv3l3d3Sw93XJGhr2K3UyiM/szhGqf9VEdXraM3TspBfoVS0aPOT1xW
         RYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058799; x=1787663599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGklY9B2TVwZnj8ed5pwTJRS4Y3AlZdf07yaEbb8FJE=;
        b=dYHr86fl/IGK1LjwEM8ATbIveBMb9X/ZSBI2iSjF0v+iuJmJlRpn3/P7ElKVTQaevh
         OSjKc85+2yHyTaUVdaIrtrUiKbKnAMUx2LmhyajBBxwx4DhAc9wgcwXWYcfaALaop8RG
         hUaid51YtcOw9QtdgMI1YsEcKnZhN96Dvrc5hnpyyc7m8r73C8z8/UAkI+tWSoa3Zo1a
         PglLeZLVopGQXWz9/Hs0G3SE09cjfCbmIyWFhfhtFD/cKW6UayXQLjyfDP0Qkng6qJAV
         w/Lk/VkltK/wYDN/WdlXGohjSdwOTlzyMMUBNP9oA3G9B69pkYRlzEO0B81t2HycdmYm
         uJ5g==
X-Forwarded-Encrypted: i=1; AHgh+Rq9mgR1Fd5AajiQn17jvcb17rY4CyKEp+ceu155mxZjc4SZWGZNLxCaSnqiO3kKfyBB7APCHvJHRjRC@lists.linux.dev
X-Gm-Message-State: AOJu0YxGeaoGc3zbnGwdwKKWl3+nZUUyaAg17Z9lkU3dO2qcmh0v5h/h
	dZCPGl1OqkL0SiJ8i65CBjmKNW0IlCyVQ/ng/cSoDRl2J9VHqMvLJLxGTDYLySzYYRDBYGJ+nv+
	tzDSZvQUadjQ6MqLmjJ/OsB/DIaH57Iw=
X-Gm-Gg: AR+sD10FwRadj8x79i264CcxQL0LNQEvg5eGX4xf3NFrtp7RYHTJqCzMPRMQ7zPY235
	EWEleacX3oRLHWJZckZ27ZEuu14u+NRuYVstnZZmRO/ARTZoNgdHlGSsrlqEisE94mynx9ggJEi
	OlZHdkj8fC1otcCfCOIx2tUOOMVNhFZCxNPPIkjR1OgSTemh++2hERVuTfowF0fEeBChQwAuoaY
	3yl9wakvctWxDS8+tWIAVQInhwag6Z6eyvds8in+ya43hR7tcvN9/a/sHFtKI4ns7IMd33QiEBM
	Q8IgizZgG8XDiUazxF8cCV/n3egpPrDelJRet1VHO+0SxQ==
X-Received: by 2002:a05:6402:21cd:b0:6a3:e40e:f650 with SMTP id
 4fb4d7f45d1cf-6a3e40ef8e1mr3821993a12.6.1787058799088; Tue, 18 Aug 2026
 06:13:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817141156.6079-1-luis@igalia.com>
In-Reply-To: <20260817141156.6079-1-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 18 Aug 2026 15:13:07 +0200
X-Gm-Features: AcwNN1V62W8BaaJ1kbcQBcxCIwzScRNatY9AKqmKZPaqUboU8xIVjVTh7a2De5Q
Message-ID: <CAOQ4uxhoOKC7XyK7D_izd-=28RC2OA0Xmjf41rhhO2kPhM7F1Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/8] fuse: caches documentation and testing
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 4:11=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> Hi!
>
> I'm (finally!) sending v2 of this patchset.  It tries to document (and ad=
d
> a few kselftests) to the different types of caches that are currently in =
use
> within FUSE.  As I mentioned in v1 the idea for documenting this came fro=
m
> Miklos during this year's LSFMM, where he mentioned he would like to see
> caches usage documented before he could merge an initial version of fusex=
.
>
> This version documents symlinks, attributes, ACLs and readdir caches.  St=
ill
> missing: dentries and data caching.
>
> I'm still sending it as an RFC as I'm still not sure if it fulfils Miklos=
'
> initial goal.
>
> As usual feedback is welcome, as I'll (slowly) continue looking into othe=
r
> cache types.
>
> Major changes since v1:
> - Added more caches to the document
> - Changed tests format to single self-contained binaries
> - Since Amir added a new fuse3-based test, the conversion to fuse3 of the
>   fusectl has minor changes to the Makefile
>   - NOTE: I've kept Amir's Reviewed-by anyway (should I drop it?)

It's fine. I trust your judgement.

Please see Sashiko review comments.

My main concern is with the doc - it's not an easy read
and I would have liked it to be and I found many correctness error
which is not a good sign.

Thanks,
Amir.
