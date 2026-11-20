Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795205590;
	b=ZtA8ylz0kNE5GIh2HYmJmzAhwbB1gXcwzytJ/JEZk+f7pSAcyFJBA/xg7yxQ3hxdhj7p
	 dOsLxvTIn+5/L3zZFch0YHY1ZTrXj+CklWBrdU2dDak+4Qz+WlA5btxJ8lBnJ15k8gBld
	 ankrhVBvIeIDpk18+MUwiyt9lG9LYvQk9KJ4WNhGcUugQmlcONG8Qh+PTS/u4vGbiiVWI
	 /65iMerFQ3KrDKcmcnbuiiSrlRtbFvvHKC8AJbg+Pa+pqzd1YbOjLpU5sMiuVVbglUYhi
	 or98Z6kbUGlQo/m/nHGE87ZAtwYVuMFPyriw6d2oqsidJoNDhaJiIazjnUCqxrhGmPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=GQtVcgf7rcoWj+UINPxz4meljJNdr8d4MFIGXRAkqUo=;
	b=W1O6YkkcMRsZyQoLff4iFqzYsJr8ztsu87sGc+nsY5A4K5O2co3M+EiBvfiscji/E/Ad
	 tX7HrdR3PvDJ3JjSeqBjCNKYsN8Hz6yXFoC3IH5cYPxJKPKN7IwzVo1dph8abKT0XX26n
	 TSDNgwrOqlpKlevdpi1z5Np0sEnxgRiW2Lei9L3iMp6EONUF5Ti9i3JFFZDUfAjIdP+Dl
	 73AjEgiBc4NpF0vs+4kccJ7ilAT54XNG5ZyURP54e7NACm1DS/o7ZIUPBHsoRABksiD0A
	 0q/nkcNyFVM9A7Qiv2IDnlAauGrEgxFLTt9uVJr4AWn5EUCctrM5/bg1Q6DfwSIFfYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=ENiw8x0H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E67F606A6DD
	for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 20:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E67F606A6DD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=ENiw8x0H
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5364042eecfso17124981cf.2
        for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 12:13:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795205588; cv=none;
        d=google.com; s=arc-20260327;
        b=JGssBJLWUrE+mqvO0aFr3W4gvwRkbt9CAIwWR9H83ECPWknlMPY92Xg1wJB5aTdl6J
         p1MeigVg9uVW0a+78eP/+STHo2hzxUytCno2pIK9JKwXp2hiHIyjpAkOVioCrB4VOxXW
         yoizdv646tjpHunIGgcj2XMvtv+fKc1j0bqXwQSRmSqqqyemiqPejxaUpNGEhpw2xOei
         i457wGFGTl5S6vJ6oUT27Yt3rZUoCHo24Ss+Q4fe2fXdR9mhLvCUso8kIFnSK26paOws
         yCxp+Dmz/6z7x3JoTyIjrkWkLHT4oplsi+zS52Xc524kO45FLvXSIGpgD0GcTeYydELj
         T7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GQtVcgf7rcoWj+UINPxz4meljJNdr8d4MFIGXRAkqUo=;
        fh=Axp/3XqWDRhFpXS4G/KvVF0sTplzRM/188uLPXoTWvc=;
        b=Q046aPGQHHc8lZ/J/7JamWOhiwK43QFKo5Jkoft3Jc5W8M7ABSPLFSEqdp87X0QgoU
         VgFziRZof7qJ3SSeR6fDnC/hL6/A0ivz9ks752QpbLPPywp4r2Z4u5IYJeOiG1tbjgLx
         7dOUGCEYXliYbN2eoetJe2LXP2mChcwYmJCf7hY7RqIoTajAuCE04YV3Mc3HeZL6oR6H
         YSfP9D188zGBmIT9uayMNW6Dv1QhmLAdaybAp1Yxp0Nq61OJ4gwlbfIg7ipVZS3v46sY
         DpEOXH5lEib03eOrxZg9e9juMF0hvKLrvUB3iUAAhRe9Zbb8Fy17dQYlTFRdoMWQprUc
         rF+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1795205588; x=1795810388; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQtVcgf7rcoWj+UINPxz4meljJNdr8d4MFIGXRAkqUo=;
        b=ENiw8x0HIlyXnexXeWamAPOAGVQS34Z1iA5VAvUW6seQEs2nVA8Z6GTN+Fi4SjG9z/
         yJZDnBEa3vYW3PH3b/OAEwPTaqABU6t73Wg4btmKxrL0U84khr/myFd1zwEff1PIKiic
         je5ZfehOOR8FCcRooeUezVMLw9eDE0Q0hnV2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205588; x=1795810388;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GQtVcgf7rcoWj+UINPxz4meljJNdr8d4MFIGXRAkqUo=;
        b=Q8m5esoieYKJ9Mi9/dfgk3/ZAai/igp6mKrV+NEU/H3+4JCUJXcLzS2uMjMHs8DAkm
         2DSpIn1ZUPY17a3r8pDuyAg3XZkl9/Sz2siKX55pYrdBpbbsMkAUQnvpMuLAwp9+mHsb
         88/TT+W4KfE/QQoksiSlCmHUu76mj+mRaTWJsVgMqt/NkyFNGGPKcTV5qOT9o33EaA6A
         yZNlGn0XohWb6wVIHrhEWC3TFqdNEZaH7clSPKMefX6g+OlJktfD8PEwr5hqnbBnEE3E
         TPHhONX0ZDxiXr305WO3Aphsd5DhbygLEK7NJC59lNk4TrHpfaoz71c7byFxaUURt+vg
         VD1w==
X-Gm-Message-State: APuU4Z9HmRQGEUz9C6sdKL2xtWaYUppZ/FEQIk6g4xy3F7e7I7OV0Y7j
	ilur1p3zPD6XjN86D+j/jj9IFt34h6FYRrkcJ+LNNrIPhfSpOwgUy5QYenDakQ3ybex5sJNdoTq
	in7HstjSWfYmCEm2m73+mL5sVJm9WqCXfIXBDD73WdQ==
X-Gm-Gg: AYBFou0eVKvbBw9iNE9fqQtnICIAqQn7x+0f+v1fRI7VcPwCLhx2XfUYWdMvRib2ZNF
	+jw5V2Uh5/8oIKCiPMHbVDHAVLujSGtDBvkT9W0RtshQNbVqfHPyfv7d25YIvpEe4UyfjCyFJVe
	dLOPBI0VDp+JLus+/FWlQc8B+SlHm59MoxDx5r8ukfo5EcNnazoIuVVRf241WJQDYfBmcQEhArj
	X/Q+0KBG7jB4+ZxNo1rUXkR5dQv0Uu7z7TUX6MQJTu7v4iZhnVRi/2po08UACL0QrHVlPvP70To
	KVVbOYwTByJD8lE/oYrUX1E2MCYLR8XB8bc4sGkzDTsoLhAK8BNd/DvUJGYy7ttRXIc3H8D+lNf
	sOrv1UsfpFxRd9nILmgDk1Zp1Y/aaD5wTC7LKP6SE6CyDElp7JhCoOJtK2tkPXgCy+w==
X-Received: by 2002:ac8:5d08:0:b0:532:9ca3:a400 with SMTP id
 d75a77b69052e-55d769ea68emr80059221cf.16.1795205587957; Fri, 20 Nov 2026
 12:13:07 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-fuse-copy-fill-pin-v1-1-72a0d888f140@columbia.edu>
In-Reply-To: <20261120-fuse-copy-fill-pin-v1-1-72a0d888f140@columbia.edu>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 20 Nov 2026 21:12:56 +0100
X-Gm-Features: AclHuK_WzCE6fLMEFoBBdtGGxb4gbBx1Tr9eIxvpHgcUOcsRzNjJfqn-CaDC7rQ
Message-ID: <CAJfpegsDMb2i7gnO1ZAao4bAqUke6rF2TmvmxZj_pFxp_xv0Sw@mail.gmail.com>
Subject: Re: [PATCH] fuse: pin user pages in fuse_copy_fill()
To: Tal Zussman <tz2294@columbia.edu>
Cc: fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 20:05, Tal Zussman <tz2294@columbia.edu> wrote:

> Use iov_iter_extract_pages() instead, which pins the pages of
> user-backed iterators and takes no reference on the pages of other
> iterators. Release a pinned page with unpin_user_pages_dirty_lock().

Can this have any performance impact?

Thanks,
Miklos
