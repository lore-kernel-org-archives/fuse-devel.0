Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794924426;
	b=tz/2Dhs5UpZuABg+NjhNOuE6hIgJ0E0vgeyzz37suHSZsLhg3LiOc6lMq5qvS0jIzvFc
	 8aMn/GZaV4qtrp47UWdZZjpf/2kF98TKRNz7tWX7KMXDBaiov998KK/TnceV38aCSYCj6
	 D36/kurMI0I99LutFSKnoF6Z4nzpWVhznz+nKoiRJmzxpB4FjmLGLRRyEJNsFEND4fBJv
	 G8Z2/jdEAqeTdHYDwAQy7iM4wiso8Er1EhP+ibb5nKLYVvHdO0odbEldL344/DeuvlSXO
	 2fECDMb0Giq3jPnPIr4CUXRqdldyTCmBdI1tRAkD/XY7IXNvgglRYFrKtTZ666o40oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=x1PMpSXB1r1OFkmXjhmoKzOBVvwoXs6UzqD2BMYgi9w=;
	b=AoAd3FQ9gOhWDHhqB6duM9Eugui6yeKJ2GhWVDri1s+mw+kZ54XCw18olkpAI2Pb5ont
	 vvVLvH2ErqRMydVOpdaUrDhxnB+fia++4+Gf3LnG8yiGRokexYQDcfU97Y3rdCtmZqKQu
	 q016S6FeFUdBtyqW59g5ORysaiBG1JW8OqnoBXseW666Cu+Op129SyN2SlErDcwUWfNHo
	 XJHIZ0HfJR126fh3N2KfDPsGgGQTqnt4U88RfbyVnq5o6D/4o3KC7ZsXHE1ZdJ8XcM9J5
	 TIoyfAMN/PoaTeyJGjW2gI5vKBnFUHAFhaiITuytzDC3QwEeY/3iK+l6faeVDXI1ErA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b="VlXrVNf/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163B1606A329
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 14:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 163B1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=VlXrVNf/
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f22a8515eso482642285a.2
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 06:07:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794924425; cv=none;
        d=google.com; s=arc-20260327;
        b=SLTDQlhjB6MXbnUVojrfRLwlXWzYPRMS45wkx1mfW0F+5nyKxW7BlWU4XgwZuNHP5p
         +gLY224mVS+I1OngDl8X62wsjqPThMeB7QZGqWM93C9HrMXVRRe9b/jWf6r41bsRBG96
         7bOhhzN+dkXUv2Cw1f6faiYq+hTuvjgo5rP/Lgv0U86HY9qdjzk01afqzltT7cEdrchs
         /9REMwshZHnouOUqMuL46mvI1Bk6lTLUD6se7i4C08THm7qmyQS5F7nFIfA4tKXl80eO
         Wig2WXh+V7x5EmPJOjtgtKSNdjiHJY1fWwOrUy1fz4UCzuTSxPW07pPLr+8OVQWFtH+z
         a2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x1PMpSXB1r1OFkmXjhmoKzOBVvwoXs6UzqD2BMYgi9w=;
        fh=RLJD8NGpYgMJxWj9MagIbsJeiyNBpR7bOb1rDAeXPaE=;
        b=HDfCFPP0KvNimGSCD1kaHbQBQixX1vniIJ39ubWoCLYau+sTd1iT6dZttDlzBvPJsx
         pEGKypg8mLAJqJVwUYeTefC8hxieuP4SEEOnEr0TYiE4Q4DjIPp6sif1NtbmoX9KrXzS
         MZs3s4r83DRYSUsZ8VBuAB9OZyqWao5OZ9cFv5H+g8oYNkYXYQo7xtLWpvYJHS3QtjG6
         xA09eQeRgLemnyfnsq4Ov4zQmSDRh4SGoDStgNjQ6fA0c64qkhIsHsW4VtFLDpwBi7eY
         prA++V8c0Z5nm9o0bUuVnci+ukF2S4hL8xy22epFBUkH015HxDSL0UCKWt1oWYUowPTw
         lEkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1794924425; x=1795529225; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1PMpSXB1r1OFkmXjhmoKzOBVvwoXs6UzqD2BMYgi9w=;
        b=VlXrVNf/yrAWR5UU1y4igkTYsop9nGiact9GUz75iJaS9czYRzAAaayqIMuQq3BdwP
         A7XDX4aqxBO6s/j/rRQml7d0v/kj+2OxEp6DmzL2T17CQw7Z3IayzstsD4chsDl9vfzc
         odDN8ikatisYUzgPDnf5Kltd49t/e3nTvVU44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924425; x=1795529225;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x1PMpSXB1r1OFkmXjhmoKzOBVvwoXs6UzqD2BMYgi9w=;
        b=Xmbc4hZ48lfmtYND1iCwDuFzgMV8tMWzHUdh65yMmNqbWqO/AE1XkcS/aazX94xoFW
         CSd9meNlSearf2vkj+T4pcbMvc8aEJSDxptmd8NRh3u8QCiCKlQnjBx2E3mcO23uGfhY
         3Xp7Gi90j2OOypWsGQnZM5neviAUe2ZKme8b+Fn/+O41/EGbnOiLHEA0v+E3oEwZPcPQ
         yH7Wl2U3cUqFE6Nih2EvdaI6EXV4KJxHIcVU12zHQ6NCcTMx3w+jAJnM7EwiZ+0HMpqe
         g3NcrfV/TxI2hDNUTrLVP+83Cw0RJxUbHmGyRsExj0jmL6LiTeygDxo8sarLum2/VrR7
         +KqA==
X-Forwarded-Encrypted: i=1; AL+hErH6n3jwQp/EaQJZ/WHzJ/7Udi43e4WByOEHDQblWId5s9L5ANuWc8uJ6+e41JTb3AubSyd3GOMZlVV1@lists.linux.dev
X-Gm-Message-State: APuU4Z8FijvWRzb6GVvYCfHaFftfUY+3n1CUuPfdW86bp2xMiRTov5WS
	7H9UIlCL0S+HkSF9O/zlRK7bj5rwThveQTtUt4GL8wAxqdI49YYUczstUfF9de8kFDO1KQBB+Cq
	om9KupzW97z7qtmpLz5kwMu7hnwc7E7hgzIB3tVpOPg==
X-Gm-Gg: AYBFou0DgS2ZiSMjP7Gsa4gcEl7CLZknpyroHgeQueLxMBzguQOTCyNC8FIDxQDMUrS
	EN26/XxNHySJwZuJS46uPy5yQxd0BHisrMpdBh0PNO1Q/793DTT6p91ArzTjJG1fjBf5+IBMsMV
	U63qdEfo0XJyTEETsqWna/hHPiCl44rxVXPvdpBk0wmlxdciSpuaLtuq4f8rHdHLtRlmXG939QW
	0FDS5GtmbT4yEelLH2sV10YYeaad1UPivvfYyxQPuzHSUQ61O50U4sW+pIWllAb2hY4RAOxnqYo
	1nqXmEU7lubpRL9AekFA+tsNtnK8GYe5y1w8wiu11JGlQfvM07wN+P7j2HAGxZeBYa2XkDSAJql
	JFIvBYcrtl29TWcg5GVUKvc6UaaHhwVkiWBScTVkNJ+YOPye1XFar/hgkSHjlxqfCrw==
X-Received: by 2002:a05:620a:8394:b0:944:dbd:8253 with SMTP id
 af79cd13be357-9494bc7b8aamr2034423485a.59.1794924424868; Tue, 17 Nov 2026
 06:07:04 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAKLmikMhOYpGEw6uCqX_Bm0JPEg-4FhdJMNa9+tgtw3-Kf+eZg@mail.gmail.com>
 <e75cf549-07a6-4095-bbf8-8caff7a3338b@bsbernd.com> <CAKLmikN9Aod9Va=FsqkRmF20=69sdgdDOoV_bUuGh6wTykVcBQ@mail.gmail.com>
 <CAKLmikO5y916zgeX_UFqfGQ+BUmNC6uvHFR_bsizeTJu4AwxcQ@mail.gmail.com>
In-Reply-To: <CAKLmikO5y916zgeX_UFqfGQ+BUmNC6uvHFR_bsizeTJu4AwxcQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 17 Nov 2026 15:06:53 +0100
X-Gm-Features: AclHuK-jg6F3I0kg99mlIx_XFVtVAv569UkGYtDtRYivNkgNJwJN-1RoSdv9luk
Message-ID: <CAJfpegs9wm7JWBSqY6eFj+9JeaThE1RGtdxqo21_ytL1_okN_w@mail.gmail.com>
Subject: Re: fuse: HANDLE_KILLPRIV_V2 does not kill suid/sgid on fallocate()
 and copy_file_range()
To: Mitar <mmitar@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, Amir Goldstein <amir73il@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Nov 2026 at 08:58, Mitar <mmitar@gmail.com> wrote:

> Not sure what the process is here, but how to get this patch further?

Posting it as a proper patch (e.g. git send-email)

Thanks,
Miklos
