Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4090377566
	for <fuse-devel@lists.linux.dev>; Mon, 24 Aug 2026 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585661; cv=pass; b=QC72GgQZbAR2J25TVeKJ51ZIJNpLQKzfutv7s5ayQj0YfNLsJPRLY/pcBvN0ebJWk8sYq7V41X50CjyMyZkxD2ZwZdBVJ/c5aoPc8yY7q1TjTYYP4kfKtQY341EJsCNc9w98mHydOk04f98eszMrXgYvM7Z5DXtL0cQDwgMRkEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585661; c=relaxed/simple;
	bh=32nSNOpMGPh9qRcnMJUtAsNx+M0mEPM+1sZroO1Jats=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+4Xm8nJaMti/qjo9vNysq/nI/HDasZ4YZq6FjL5Srmy8C48Njg0K0xUldAdVdCgbfWegQrP5UB4NtjjdWG3mJqCWYNZb9stHH8VgftCfiEWAYf9C1cr0S8TQ/TfMytl8o0b2ex46FLzm66bhUNgSBNi/8GBJhJpE7wgrLUr6H4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=W9cShNfe; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="W9cShNfe"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52d590ce5cdso24872291cf.1
        for <fuse-devel@lists.linux.dev>; Mon, 24 Aug 2026 08:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787585658; cv=none;
        d=google.com; s=arc-20260327;
        b=d5MrHrl1tNV3Kf/wGWzq6+Uux3O2w/miP8GtGTBctUZ1Ezeyf2l1eVU06NhxmrwMca
         CBITaAvuyBCRai6Q4PB9G4sFKfqN8vG5de6WnOCldqO0/VCwMI0BARlZYfiHM443ej4S
         UciAIETpmQ3bb1lwoe4nUABJc6KrBqirFHo3yjicuVFMPwtZuANgCXZCeahGroZ/UhDE
         T6HKnVLHxgi2H7SFD2YY9SnSx+RgXrsPAeCkzW7gDOdQGSTK9ePjOE1g9CH4QaRLrCUF
         Es1AwgnKcF7cA1TeK4u+qis9vZKgvYIdPExN/iTrGCMI0kcUAeTJQMNZlc2x7ZWLD2Aw
         nCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hycNtgvpht71cjHG2+Z66QrYTBlKhoZLRVPq0RXTZRQ=;
        fh=ZVyRV+rZm2Vh+WZxiVbovgz64aAidro8kf0kKV77IKY=;
        b=EAkLsCfJAa95DL8H+EGdNINcbBjpItj0MzDI/ptMlk9NAXNremv9FB7kTUSQrxRVs3
         4h6Kq243+nvXrBpGI9sSocPtGLN4eTS+VnJoU2Kq/7XHXbxQtdNqX0LjEFIKi5nOHzFc
         QUhy/sHyEbLXCibTrrFxZsQhiZGZToB0HRPkcej8Cu6LdDwEuYNOytNQ1u6bLAQm4BTK
         wJtVJid+vFivKuN0IlCq4U5WMVfNjzHwhmUWg++43JWXv8ccxTlUHjnMmNYJsvEI2N28
         byPi0qG/llvU+58iTGv2wFgCY9Nl0nxsxzwZBQIRGzVyTHm1gc9iTV6Q7QdJ0y4AesVR
         4icA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787585658; x=1788190458; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hycNtgvpht71cjHG2+Z66QrYTBlKhoZLRVPq0RXTZRQ=;
        b=W9cShNfe/RemYXN8M2fHdn4vAnsgLgNNaIdpeyREvUegXISqogvAEVLxIBQi1t9J/7
         iXMCC9KWNtN/52/5r3QVRnWTG5uNlqC3pQrt/5zGUJT7gvAbJ7TA2Mp/gMy7OA3tDt9x
         LN1Bedu6QN94585i7/wuVL6QcTItHi31BoWQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585658; x=1788190458;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hycNtgvpht71cjHG2+Z66QrYTBlKhoZLRVPq0RXTZRQ=;
        b=msH26XBOW/f+feMFZMhiuqzzMBptggZ3MnLzNHw2lfmzww07dwjJocyzx1kq4w+Vde
         fTh1bHMDoay6pGNw7lECKsM8tYFZmWiDYw5C8nvnhbi442SJHqF+M1qApAWd+otuNoXI
         QNtev6/gk3PmDwUTVg3g0FifuDirtwg4FXZAAiuhQup911cxW78+GhGLD+KIROZDVSzf
         feNfYFyxRWAKwY4LXQ1Q7uF+5VcruzfLZymDfV2fUN7K5L+O6h5PrnKcjcfW/AWzqmIu
         c9r9neva1O7+tYrV+mLiRpVDMsJgQ2AtKfdqWJcET9Jo/3M+UJXqwsmw7Sk26s5IlJtj
         79aA==
X-Forwarded-Encrypted: i=1; AHgh+RpNRIWL2W7/d2NvgQTMJPuA8AoVdfRZsxEKUSGbVuvLahPsFMu3qpzub0Aa75RWdiUCihWaRxJCCxHb@lists.linux.dev
X-Gm-Message-State: AFuF++lS4ukmPb0/EXcfKfpepyDelIg3QGGEEISVr4GpYpogqqY5qQJR
	Sp1wX7Z/50dhizwQEBrPlOWZwTfGsmh5zz7umgK+/RdAr6wjTdrf+BxUs6WvkvoF+D7w3eAYRLg
	gSgGJy6Hhl4ajoTV8DUPx+JTXX3jUnZZe4p/xf7B9mA==
X-Gm-Gg: AR+sD10TcwYqcULMIU7IycCjmt8NbrBohwGupxGQLgUywvhpODOXQKxbdZYNsjfHkuU
	R2aom8Q7081qz8ONLOb6qgRSw4W+D2brVeqQomhDFW/alaZw7038xAQsXY5EbGRMvingFxQ9tI7
	hy/eyh5pb3kAmvkzUGAwPzAP1Df5hnMyPuuRzS2dDd4sHDXE/JyhudIy6xxxxNXtRE1G8Mqo+bn
	LpWB6T6hd5/UtljdXT0Yd/XXwNIn2LGk9OyUPfb/0DSJduHzkoYqzmwLcRU+uqRdZSkXUP/7hWd
	4Jod6w7ko/oH8V2Ur4f8IO1YkeaFrPkTZyr90oEQXYqlE+eDvHY6lew3axh+S82rA8k8XZJP5YK
	x9i3qZYktQwA2xA==
X-Received: by 2002:a05:622a:1249:b0:528:a8c:aa00 with SMTP id
 d75a77b69052e-52df56e1163mr281535771cf.8.1787585658497; Mon, 24 Aug 2026
 08:34:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824143052.1546163-1-jamz@amazon.com> <20260824143052.1546163-2-jamz@amazon.com>
In-Reply-To: <20260824143052.1546163-2-jamz@amazon.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 24 Aug 2026 17:34:07 +0200
X-Gm-Features: AcwNN1W-VnyK638CSq8E1OwB-y-_gztBKgOlAD0RqXrRmLoimit5mhOa4dqhUzA
Message-ID: <CAJfpeguP21v1thJytdPOfs9VByFcVNdMcnCHUUYteCm+Ck3qpw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] fuse: zero the partial EOF page when extending a file
To: Jimmy Zuber <jamz@amazon.com>
Cc: shuah@kernel.org, fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, jack@suse.com, joannelkoong@gmail.com, 
	bfoster@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026 at 16:31, Jimmy Zuber <jamz@amazon.com> wrote:

> This unmaps the stale mappings and zeroes the partial tail of the old EOF
> folio, so a later read returns zeros.  Truncating [old EOF, write start) before
> a buffered write keeps the dropped range disjoint from the written data, so a
> write that lands inside the old EOF folio is preserved.

Applied, thanks.

Miklos
