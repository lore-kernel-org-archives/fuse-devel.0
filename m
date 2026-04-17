Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148F02701C4
	for <fuse-devel@lists.linux.dev>; Fri, 17 Apr 2026 13:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776433708; cv=pass; b=Q5iawGY/pMtcE4MGdEsJg4bxrpgq5C0a1AcokKFHO+j38rIlXbccrzP6LVY88Jbzo+f7H9U0oQcNArv5c7i55M50DMVcMmCrS1iZTAnpF0v8HBxVd/sgEDUdROJpebT/0ctLpIlNfqWwSG6bWuUVtJS4bxQPn1f8JczEUrt59B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776433708; c=relaxed/simple;
	bh=epdooTCjdaaQWNQbHPFoui8Z7BrwSCiFwvDv3fwddmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWm1Drvw2QT+GQkIXrTm8Yq/wltbeQL3RR7OKiiuj0Om4T1yLOqC/A67SQfckXwnkoaSxASKMH1Ap1dJGY1LJrWDR+6Dcel2Kvu7bWqbmd91cX0objSKBF2GVQgkV5PH/JXl7pFOhuMngr0NCeiGWR7kgOVmMGNVFm8kKcuEmVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=asfbttU8; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="asfbttU8"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8a110e06b4cso7989696d6.1
        for <fuse-devel@lists.linux.dev>; Fri, 17 Apr 2026 06:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776433705; cv=none;
        d=google.com; s=arc-20240605;
        b=Y6Plq88FPk60hnJn9sFL4FAMv9g7yvNdMgVPsNW/lMmKPd7pldTp9t1pRMToHlc012
         chKtneKx0NGktFacfuQwQ+0NuBKqoSJ4V4voV4GkqXVZ2+cY1gbulkHDyow9+MVeg/9H
         mpANgSOdNxdn9L0TiPKVOH7dkHurpZHlepIyFy+KB0wSZxEw/w6C+OPr3PRyF0O46hnv
         lW0TUD1meC5QmjO+fzip2aan04zSGzCwhvvsg2UVBqZGW2RrplYbRlNIkcUVaieZFf7c
         mv+1tWiBTBYjiVy5GTqvOWe2bOJUz+4dKk2A8qTNemywfeYN6Jd4Ho5beC8BtkdLoR06
         4POg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RaBVFY7AnNSnD9b2BentSR20VU988SdCAvqd5GAeFSk=;
        fh=01NMMXmaLczP8lH9nOMmFfadqNgSoAxxKp3exr5KtDo=;
        b=JbeX2WVqA6ePXO5me5bsv4qgoxZsQfwj6V+aYNQ4p3SYL2KACU0bdNa0mE6dXJaGkH
         vTtLM6zgIy+jpAHnHEDQt9VyI+oIF0mn46c/LEFj5yxYOsisABz/QCXXYilqLw6JHMcm
         J0A9uP5diykrAqnRtFSfHUO3D8eNr8NdRYOgzWconl+T/AzVEX87P3iqRsYPSTdObikA
         GR9cgs60/un+qmbUPwiAEuWw2hRl8CUMoxjkwL584QzgM3xQihDszOqhceVd+wAZvjWK
         fkmDMxULarYxE5EIIQOaZBCETztUjmFYNWaZdqZwHC6wOJlQ3vDQUMIjbY3aFulpzfgQ
         VYRg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1776433705; x=1777038505; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RaBVFY7AnNSnD9b2BentSR20VU988SdCAvqd5GAeFSk=;
        b=asfbttU8y27blefnRLYt/FtD1iqPIRizo/SG0/INDNFjs+HxeG6EASwD3sS4QHUYsA
         bhDOoOrloy0aiukhk5ggdK7sCTh06ACeEru5zX3neyfGuUOp8qJZ+7X5XguhLGG5iLZN
         XMb/x6Eqod4MUdvVz5/TaphBTuiGBd90VZcWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776433705; x=1777038505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaBVFY7AnNSnD9b2BentSR20VU988SdCAvqd5GAeFSk=;
        b=JduNI6PlO5id1AC5IICANTDgwy9PiPUSh8ir71lxbKca96e4+owxzcXlcPr5dGXZEN
         QSWuLfnG1j3VorGPtrChWJc1vy/e0O5VpyYvXdwx6F0HLu/T4J+HEt3YeTnjvxaabALY
         /McM2zrMc/bRrNIOrVhwLzKPhRxMuGZUP4doJId+235o6e5ETSvSUQMLP/JYe+33E0nm
         8bUFwMW6fUMtR4gZH/T7sQ3HxUffcP9ym3QKg3vTQ561GgBN6zeamZbEjKZWuRYJUiGw
         6UA1+L28OtklS+mWWK9wyAqNlJgSyeI/fsOexmxD5++O7i9XTT1ICb4tK8BGcNU5o6sF
         jHvw==
X-Forwarded-Encrypted: i=1; AFNElJ/YmCPC0BeuUQDVF0zegZTGo4YE07LsRWP5gYe9P2BbJid5HP4VrzA0dZ15BDYsfQzDfjrM8ZYNeNIs@lists.linux.dev
X-Gm-Message-State: AOJu0Yxvdm46sqrJWqF3XYjmJRYA2AxC6Y6x0HgCQR7c53uexKtTxxBY
	vTod2hByNhESncVdinikrWkx4RoN/WzLoYuWz21f5jv1BG9YOAqwQ294vmdf0yE+C55pPpse09x
	krwDzIy0Lv2zkMBRnA2qMFFjL0kKqdFXZryn4nshmZw==
X-Gm-Gg: AeBDiesXfsSwUf8dmnRxsfGNO7cAkzlF3JUQ0OaKXCLb5PHIhmtBCvRBpT8jl7MFP8G
	5Z0W3q13OgLnL0C3ZFtODAj3ENcRvVLqAdTnpJBs/gR0kSe13oVwrhfb++RiCBUXGckt/B56msm
	uDaaX+3b8/hODONazQFp4FRtu8imkbVWJ/xQUzuFdYyUa6eoc+ObtqjI1bogjtCu3KM3Fxrh5XS
	dITsQ38oRxhL+Yzt9aVfVWj+dVf9SnLpZiMus3YjeXzQW9Qm2zr2kfm/NOwL+4dDLbDgTmC1/8N
	XYFoeyn4zin3R/vUkVZwlGaNeakK6ErZ0DDqP4L8DfEH+vw=
X-Received: by 2002:a05:6214:470c:b0:8a5:104b:e361 with SMTP id
 6a1803df08f44-8b0281693c3mr37122346d6.50.1776433704794; Fri, 17 Apr 2026
 06:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <898a4e10-6193-4671-b3b1-7c7bc562a671@fmap.me> <CAOQ4uxjoS-PvnZ2poh0bx0C6ocTYwuEpfV0q5md15SjS620OMg@mail.gmail.com>
 <CAJfpegvxF7F+XKFKokSH4eOgCA0V2RNm6B54MS9nr9wG=U66OA@mail.gmail.com>
 <59ab54f6-680e-456e-91f4-0a26889844ef@fmap.me> <aeFuarTL7xBbut0F@casper.infradead.org>
In-Reply-To: <aeFuarTL7xBbut0F@casper.infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 17 Apr 2026 15:48:13 +0200
X-Gm-Features: AQROBzAW7iBVOcbWzWDl5jliPnjlXzb1RPsfJkPFfxAumnXuWNvcGTGMUJbuMrQ
Message-ID: <CAJfpegtAeyMRENdneJkJrMKu8Uwnyk9LYBThjvTrFjHmPr6O_g@mail.gmail.com>
Subject: Re: [fuse-devel] Debugging a stale kernel cache during file growth
To: Matthew Wilcox <willy@infradead.org>
Cc: Nikolay Amiantov <ab@fmap.me>, fuse-devel@lists.sourceforge.net, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	fuse-devel@lists.linux.dev, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Apr 2026 at 01:19, Matthew Wilcox <willy@infradead.org> wrote:
> What you could do, rather than unlock the folio here is to initiate a
> read of the folio and allow the read to unlock the folio.  But I don't
> think this is a good idea, I like the idea of invalidating the folio
> much better.

There's still a race window if the page is invalidated after being
ref-ed by filemap_read() and before i_size is read.

Should that code check for a truncated page and retry?

Thanks,
Miklos
