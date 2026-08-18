Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0BC313E2C
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058257; cv=pass; b=hB8ZY6FUk9botB5jruXKyL0vqKLe/7hFCOZ8XV/R3C/EEXnChKtWJ0Q4vSlJ7LyUMKLwNbDqHc8fJOHxKnAkigO1Z/V1qJtTjZSDWvRMihnuYQ8fU39MXebxs8o0U7CRIJgz2tZUWsGhh4959eRCogaWGEgAEyUVn1tfEab94BA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058257; c=relaxed/simple;
	bh=ploCEruzMLrsvcFKJbusqZCgx+ZRPcCM4jxMdCl5+Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVTE3zNUc4JjxyAb2O3VkWgOuQ9xGkRYCoUplC7SxeDgu1WWyAGB8cYUnLXJL+U6z1vKUeIAg5hvJYUe3uYsN3xr0eZt8dg2iJfoeAWee3Jl1FffT6i1uL3bu+A+CQmaxdkd3NJiZNP90kDLOBQc3mEh6G+YkmU6+rIjAfH3fYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Z4fqncFV; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Z4fqncFV"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92e7632b193so290753285a.2
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 06:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787058255; cv=none;
        d=google.com; s=arc-20260327;
        b=KifmP2AfBYKAAeshCNKUfeRehDbsH5nT3fDyACkx8wkZOnU3/f/eYkY34PgGLtXHr7
         eqgaq3Rxx3RA4ExSq4uWS1q+do/vGdLb6XiWvdfqrFioY2dTJhZgX7QNMu2hkdAZpwf9
         0snxHxTxeEpIfXmyecYnFvPjXe4SyHaZKsqAf5xv5ncGc6tF9GLQ8TJcESbmgWXyWKf3
         Y6iglKVw/rHqsQhlav8GaGhpOCqpO+JF1tPjz99Th0Q+GBKZ91Q94KJKrSYWUBFd0x2F
         9V7uyJEgGwH6hq9nDkYCSY0WN2LdAxM0GMBOZl7wADNa8SsY47+6FhTvcODAl4k4N/80
         bLbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wf9pJ19y5V3dewNhrrazrtHM/xSDMX1kzRQHqyjKLRs=;
        fh=m+QH/pLpX5Wjj8P/v4iAgXlwcyw3A9xMRbWeUbt/U5Q=;
        b=dtzVrjHGrUanLJZVdNlPtv418BiOFArs5K7Z/Y2YocwzQU80Tc2zyIFdhyuKSm+O14
         xg6bC+YR7TX7A2ZW8PDGTMOxyi/9ZO3WVm7ESGndKCe27mfScQArMlkbGY1RPYVWGf8J
         l0pf9yLyuFYxONtTwZXjWnsg4b4odtER8/It343Q2UHuYK4ZbEhzR42gqa0hazI7++wi
         IVJ2UYNKfy4xJO1YqNH/daTj3T4YdvCVEFinTXycDFceeSFXpAM23tUhu8wLAut0miK/
         FS7giwf8nw0PSht5iFvRSb0tEWj+4MAgBgj2z27XWxmeht+de9NEukBSyoRarE1Y0FFM
         1Smw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787058255; x=1787663055; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wf9pJ19y5V3dewNhrrazrtHM/xSDMX1kzRQHqyjKLRs=;
        b=Z4fqncFVxKuYF/hIzrr6THRKe8x+UMwhBUpde4N7nq835rQ3RBKR0K1wtOGk/XXmI2
         fwDvJqlBPbZrxLbn/E8NST91QUFOfYrBPz7zBCLZmO4NIBXLAqmdC+0hpFjeFQHWGmwK
         rvjeXBZsL40YLAmrkmHE9lWoARsKAGPDAvFUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058255; x=1787663055;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wf9pJ19y5V3dewNhrrazrtHM/xSDMX1kzRQHqyjKLRs=;
        b=U50wCqidRDTPIlNzivPQ5qDUozehTAwKvvpYJK+BsvzvAIuTsHmHbG2FcZSD4MV0w4
         i2fTAf1ejwWKkeF7tlAyuv0xrILw+Ajmp9hwjafRBzVSnOGFX+7BY8bTShl05htJ8w9W
         7zRps+Xh1y8LhWYe3OGHFl7ItLJeNRgDwXjYMyqPZ+r1IILm9zawShrU6C94BZrllnOi
         f2JiygQWO5mluX8aVe2HEcXUy4WvPcjeKOq51L3Zod1/THMlWQdmDxyUzSV5c1ZmJU42
         ZGhTfDHKButKpZSBqJiZN4WhAlMawYn2CuAnPJHEjtR+yYLzFmsBTdtmGfhoKdC+xV44
         eEjQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQoqsP3m6s1L2dqNzIPGVmpvHzySRjrO1Vn/ZLMjUZCJMpBK2+RUxmtQ7QueP+dPLId9rOPaPxRqrs@lists.linux.dev
X-Gm-Message-State: AOJu0YzA/mULO1hHwPzynIowVneauk7d5KfAReZNtV57r2N/mtDp7fhj
	/Hzd4yFzA0ES8t9CmB/MhUcW8wZQIw7amE+SMxS+2KiUCsliZtX7nlWsTduyPaZkA8gX0MJWreY
	a3JTqI21ruScXVWDXmgjFtSNf648SWxUntRtXR7tHKw==
X-Gm-Gg: AR+sD133Y5ELj9HJ0RxG84KiXJrzjRaRJVizuuWn3CwJ7UxR/ayhPi2guNqFCcrW7ms
	3hRfheGrViWLMOw05GW8euXVnCvtOkRtM8g3Xm57i+XeW+J8vJlKII/I152+mDOVE66X6FJyvnw
	3lAmdnsPGaswAxXzFakJiZ2VpFppxFd2GDUAMI+fLWE+W9oiumEzADARLMbXCJQOjIuGkwXko3h
	CzonrjNngWC+cK/cfAHT7Km06cF0F2f7E/Ilr9l0u+6tcNS2umxRKc/301CcLqYuTFxRc/HkjAC
	uSE2Go/pZ+xsqvV58I1Nyox55GrCKC7CLkZcMSqRovxUtDiFq00fh7Ooy4bZEx/G4Z9mv8ehFOs
	U
X-Received: by 2002:a05:620a:1793:b0:937:7ea:3421 with SMTP id
 af79cd13be357-93707ea37b5mr558245685a.26.1787058254552; Tue, 18 Aug 2026
 06:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731120353.558833-1-david.lee@trailofbits.com>
In-Reply-To: <20260731120353.558833-1-david.lee@trailofbits.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Aug 2026 15:04:02 +0200
X-Gm-Features: AcwNN1VGq915hcsob5kNsXXFds76SFj9nmfNmaFXNVfhjgc8ZfBiwmIN9uIVwNY
Message-ID: <CAJfpegt5g5j-OOQeLXH=z-7wMXn564iKWRiUtuD8z7Fpezg_7A@mail.gmail.com>
Subject: Re: [PATCH] fuse: wait for sync init request after abort
To: David Lee <david.lee@trailofbits.com>
Cc: Kyle Zeng <kylebot@openai.com>, 
	"Dominik 'Disconnect3d' Czarnota" <dominik.czarnota@trailofbits.com>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jul 2026 at 14:03, David Lee <david.lee@trailofbits.com> wrote:
>
> After a fatal signal interrupts synchronous FUSE_INIT,
> request_wait_answer() aborts the channel and returns immediately.  If the
> request is in an FR_LOCKED reply-copy interval, fuse_chan_abort() leaves
> it for the writer to finish.  The synchronous caller can then free the
> fuse_init_args that owns the reply destination while the writer is still
> copying into it.
>
> Wait for fuse_request_end() after aborting the channel.  This keeps the
> synchronous caller's reply storage alive until any locked copy has
> finished, while preserving the fatal-signal abort behavior.
>
> Fixes: 204aa22a686b ("fuse: abort on fatal signal during sync init")
> Cc: stable@vger.kernel.org
> Bug found and triaged by OpenAI Security Research and
> validated by Trail of Bits.
>
> Assisted-by: Codex:gpt-5.6-sol gpt-5.5-cyber
> Signed-off-by: Kyle Zeng <kylebot@openai.com>

Thanks for the report and patch.

I've committed an equivalent fix to fuse.git #for-next:

64b0b5cacbd2 ("fuse: wait for FR_FINISHED on abort_on_kill to prevent
use-after-free")

Thanks,
Miklos
