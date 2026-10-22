Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792672468;
	b=yF77D0HdNVGWEMDxq2o3mHiThCl9wB/paUS0kG26EYdS8zOVB1paeSlXIIqQfy+2bNx2
	 zvYUSoKwDf6xXu6vIxPFmJgmDSPfFofCHKl0unaBZsVETTpArhSRLg0DpoXR73mmF7QmO
	 iba/2iLkrLqYUIFpd1RgkpzJygF4o45t9ZJIIcUSvvd6A5CawFnrxJ12g64HolANzPfZ7
	 va4NYHWBJrHnXSskci+G476WS8lkoHslXzL1MSg8M9ukKcpSKBO0rkHxTwdohORqwlCnp
	 +oU61dGvhzC9JmGHj7TTxGvVpdpViL/we1lOtiwbmVRsncU/la5FTWUqtif1bB05H+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=8pzSegMbtnY6/1RKLihO/SOAWvLnSjFljrtKv6aZvIk=;
	b=KwxCxWqRiDJNl2FpLhjJcOD3xCUPCNRMmwmdytj6SolFAbNz1tX0OBCo0yGfTfmclUTL
	 65y+a2JG3HNf5hRKTllkGu/bB+Js2gUQ60iZXyV55q6h9BXnSzrUPcFofcQd1opkA/xEe
	 XFPfenfUzo13y78WvBYp/0vn8Jv5kqrB06yo6HsvnBdH1gWFh+OH6B5Q04rzfzBboBV5W
	 05lP1AK32BT7YEZOdk/+RwserFK9tu9k/b/3B0HZtefdPUgqLjgXwz5QsMPgcz/7tduZH
	 37fb70dw8+NIowfrTymcV/lGhWMl6l8QSd35ax3ZgMSANh98vlM960lsDG1DF9ok/MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=i96VS051;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47802606A31F
	for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 12:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47802606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=i96VS051
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53634b8328eso14525931cf.0
        for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 05:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792672466; cv=none;
        d=google.com; s=arc-20260327;
        b=AhAyVf2pH6TQc/cK0cvTmfXYCK8bIwKsJirJyKAvA4uxJAQ1KW+gj5uGtssdSn+SYb
         5b12r6B220/Oop+mC1cmBSpXrTSc7IOdxg2G2LQ1Seac0j7gTbOIgE49NyHN7ptck52j
         P+zsL93CsDwrbQGXRSOZObCug1b0isVEZazxks+PyYB46s2OvgFgEXdj6OYNRf0Pgd1F
         1WPr6ZnwAF0z9i7rKL31V63kbCTNpweXMXO6B4DGVLlsIJXDqjt9PP2BEf2+ZzWojv9z
         p08orpBC/xja7Wg97zrQxFx8OaHFR2AlvjpVJBpb4VCz7RQNSTC9jV+hTbDsWtfRAB0T
         ETzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8pzSegMbtnY6/1RKLihO/SOAWvLnSjFljrtKv6aZvIk=;
        fh=tDd7DMm4gjtV/P0N5z51ul32RpkTCz5frqqoHn9/RN8=;
        b=BghxNReMpRFXA6wDvjGtghv6GOtwlFFOXi+k2rWCHYdhsDpm6VhgZvwTLjX5jAC7S4
         hyXrcd6XVCQ4U94mdTU3MyNiS6g4uO27K3ACs0vVPkpjeFou7XQvNs9hIopFltCWTcU6
         4I4icod6jvBx1OgXF4uNodgkokIU56mTg37YN32EefkYyNb57w6NfEY703UOKZMCdHde
         /SE2zQkEDq4k/P4xyj48fr24+I0bSgrWNpDPUwvMnFu3RtIK/UXSy3Uv6lzesSPrgDA3
         a2/XxxZinh609AeBZevPwyidvOUPY/ActND19JGWI1XE1p225rO2aUPplBaSCB3P4MYJ
         xzJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792672466; x=1793277266; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8pzSegMbtnY6/1RKLihO/SOAWvLnSjFljrtKv6aZvIk=;
        b=i96VS051B/OCytKQJPCJ6w/SwCIf/eDCKqnc/lIIk/t5iNTsvNHJ5Pu+m8ldQMVRwX
         vXu2Vb83pNgi/G8h6WWGVuBdqGn5BglN5l7+5zlBPNFDWsnR8I/vCgQCXz4EaAUwZsMI
         Nt4Y6dJI94FPPo0Mm58OsbNBE+grzaY+m9HJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792672466; x=1793277266;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8pzSegMbtnY6/1RKLihO/SOAWvLnSjFljrtKv6aZvIk=;
        b=NC9LfLSEizVaEH8VffjxYcP4YhehoWFGBOyLXVR2Jnzn3GvhEPFeay+0/zL0gU3IEH
         azbwsLM4Ekcq5FHI3/7xJSujfxkz+iKrw8oLjdQOO+e27hXYyUKT2KEfu/AA73r6gbnA
         +Zyp7gziyWOJS2A/Ezs8cKu0kVJW6MevziPLB0KdnaHjRpQT5srZVIk6OMXOK4o9BrBt
         o7ZNSd8AfZVliwDUZILRG8kWPt480paTXXxpMj1esMaEPrluvoLd0DAbyeAeyDtsGbYP
         XaLSqH1w7jAHA2LgpnAFqylD0DaZfJY45c5CmrhW+NCwuSuRl7ll718nlmyKTD+R3Pee
         57jg==
X-Gm-Message-State: AFq9FYJoW8uckX4b+iH9RzXMw8aThDVpiT6R4IEDDnHN6cn15T9LmgUH
	tAYws28edJeIWVnVMe8iDzXDnittJOVnE79Fq5gNSjyFkyPJlwGDb9i31KFD5NRU1pMZAc4jMhE
	2SL3fEbRcgovRu0oibCX3crtFDweUMhxrnimIeGWijA==
X-Gm-Gg: AYBFou2y9jW9tVRysGKa4XeYmqYnXoKlBD5I56Bd3PLIhBCB0Al3BzFGBJikpupspkG
	5oFdXnvhFG4S3w9UQAiOa9WLKYZzZ25/l+8rMv4Z/Uae+WxC0FJB+L+l/oaXZ3IocjAqABV1HcY
	rtVLPym8Jc3q9/2k8zQe70YA3T2CnbES7w778Luc8WeN/A9QeGNkye5Cj8pFk8HwMFqh8k3zIPK
	fQcSyTbT7Fh+GpRjvBgUWwjkU+LiXldeKuytUfaA2Nd79WBmcpcbhKrzpLZCeX60q2Jpqq+NSd7
	Hf4hZ3N9xk5BiAwxRLabdtrpy0Q25a2Kqc2ZLbEGlpCCA3fmCKxAS8b4MUKVv9gPH/KocsMgZSV
	+iHASrBDaDQwz0PSwAoTMWll8no8ClbLhlJq8J2i3LDPcgTM7q0SJVf1vutquoL+/zsHJyhc=
X-Received: by 2002:a05:622a:13c9:b0:533:8c7e:c6ec with SMTP id
 d75a77b69052e-5369b670ed3mr78883331cf.36.1792672465914; Thu, 22 Oct 2026
 05:34:25 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <179257301723.1724252.3370267307562330639@noble.neil.brown.name>
In-Reply-To: <179257301723.1724252.3370267307562330639@noble.neil.brown.name>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 22 Oct 2026 14:34:14 +0200
X-Gm-Features: AclHuK8wYVTF-WVMtvNev9UD11LxspoRkURzBWZKuI2NSZS2QVtqcYoSSaSJhBQ
Message-ID: <CAJfpegt4wYoLQDgsw=gpEW+xSnGhCV3CqB0aLaeecLXwL-XwQQ@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: Use d_alloc_trylock() in fuse_direntplus_link()
To: NeilBrown <neil@brown.name>
Cc: fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 at 10:57, NeilBrown <neilb@ownmail.net> wrote:

> So change to use d_alloc_trylock(), which doesn't require full_name_hash
> and d_lookup to be called first.

Applied, thanks.

Miklos
