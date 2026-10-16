Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5023F322DB7
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141171; cv=pass; b=ADL+psJ6APxIvJrszEhRbBW+QGLh884W50A7YOtUwCjgoUcOZ3e/jlXSf32gE7fwXTPNpBylSAThbpAKKWgaOJJSSyupV8h5O1omrObBho8o843fnJNpflBQ7x14nJ3LJVQ35ifAEyYV9wqZlqxWvgc+5FWgkki1N6xB3+beIz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141171; c=relaxed/simple;
	bh=yT4fNRH28Sk1sBZ6mVlpHgBhbu2LgeUp5plOLVqVqCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Am+5Mdh7jKRNdAwvrA3ra/vALEMCgLwjAC8MVr8HdgYsxEVjbOPdwUcbdsqEDQF9uWyGejuiq6Q/sz0d6nJ3sJa9a2jA9oK1wFmkTzB5v3Ew5ZncDFXS3KDWYjua82BndDScxreRzJB1SsfEOnrrZoPceEDUXQfdgTAvEvdc4ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=dJZPoFml; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="dJZPoFml"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53391786e55so101682041cf.2
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 01:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792141169; cv=none;
        d=google.com; s=arc-20260327;
        b=guG9QU1ZC905hVLHREeeYM+h6/v2l61rrBhiLCJgjNM0SO1Dv29fLWg22agEylqvlD
         HirPWzov5PsSAF+qBRGKPhCBxCHe+M0QTwrUzSgQAZtXX0rA4ci84WrBeaIpz16zcLyK
         wySmhl8JYGgpvwZ9wa8dSZ7cjO7NCUt3jWeqxZuLEb0GyppNKymTP2FYkP6o+d2ILzKr
         v+4ldm3w9JxJE+1WtOiwvTdxcozBwwEg7s7v1O1TmUIPmfcj1Fb8xLyyo1lVkvZt3GU+
         zmzGL+3MhEVm6PUmwbmMED8vQmEHQYc6p8tCt6aCZazGVjaBxeSQ5WhjCRLlwFaRpcvw
         GKzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yT4fNRH28Sk1sBZ6mVlpHgBhbu2LgeUp5plOLVqVqCU=;
        fh=tgheKzIPBlrL2qx8xUHaKzqtx+I1In7+MnUlPJdFLZg=;
        b=cDcOPVG8Y6ifpEjBmdl37gSHoJ9VCWVVoVnRhTCt8Yd/QVUivQkyohuLNSVshc+DDf
         Zz9TeorzWeZVAkp8mhZq1zlhfEaa2Rtc5s0zpfvpNL8ov7vvKVvEEgYYrlSl+aT2sHZ5
         bV7OLvVi/NEr1iVwRWJYRiZV1KurAFnRpnujw9U+DQpFucoTbLYMZNax3CtVWpmyHRlx
         ic1Xu9wQK5C3utHE7PNjMx0aU/bCLjS5ysh5qI/AazspKNO8rY14ot69W6n0nmNS8ntr
         L2tX2f5l6Xs5scG9Iu7RR9hGV2Esg8nU4uf0/OAAA37SnexidmoLodZlhVCQEN8ZwWRX
         n8Tg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792141169; x=1792745969; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yT4fNRH28Sk1sBZ6mVlpHgBhbu2LgeUp5plOLVqVqCU=;
        b=dJZPoFml0E/hkdWHO7Jbw2phW8H+T0W66pLvM55dCaJp/XY6r/3Ppygd1sui0iu5XK
         2Rr4S+hCK417Hf9az8bsn2oxJl4XMQ+WWMHy06x5nzX5KqCcdIyE9DIJWPtgBF6KZzj/
         a1vB7Igy2sItxHfxLqDE+/70T+dAXqrIYTwCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141169; x=1792745969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yT4fNRH28Sk1sBZ6mVlpHgBhbu2LgeUp5plOLVqVqCU=;
        b=QHek7cfyeZf6U5iXzkaZ6hX7jriorU0ZbybRVt3t6B46d3xmYwLtaPm4VjALMjAPjq
         zcUu8jFj5/N6zIL0dCDKzM89/fakeIhsmpNMyPwuGWTq9WdNPPqh5alDYY1gvVTOm9Ce
         Phyx7Da4AZ1osmve8QBlCRn1/21ObbX1Yz/2V007BBmXyKMV6ElHKpFm3OJ0IW+AtI25
         aparvynkE1R8H/QWliPdC1TdCgmM65VbeOhsatjqQflDaq2h2S3sJc58RLG5HxW93epY
         f7CBVOFSDux+nMZuAWTbR0ruKu0Z6FXAx4my3J4YCfaSbF/hf/dOqoV1+qCnZXsctfxh
         ABRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNm4VBKFMGj0Cd7iRUcHJ7tmhjYZ5xuwMW5GcbFyHTNbGWw+MDYIESGHcEXTUS3hFIjVD8LGrkJCO/@lists.linux.dev
X-Gm-Message-State: AFq9FYI10+qeMWYIrstAANOtzz2YE/ESMJkcOTa56+LrGkUoZhXwpLDg
	w3GsDoeXdQ1qCGDdzWAIc3Y7TU6QGSfQ7gYF9MTGZDC8KMSalGM3rmV1Djx126KcAMeFPTTOnMT
	Cfwd65sPHVr4yVdP4xAz7hhO9xvSnGB9AfJ2f0e8QCA==
X-Gm-Gg: AYBFou1Sg1hH9AD/xM85Y4dKyhj5mJPUsx48QQZS1EZOgdrnM3+YzF309ySaUZXwdzi
	9dx8GoLq9hyf4QIrIN9xW2q4GAgX2DSVgPFJv4m3oQJXyP18VaE8FXmBI6Jmbv+NrNybH1uiltJ
	uHkzIjSz8d98teUW8/VCrrIfJv6UUqpTi3NiJPrhnJtSDgrD9jU1SVEANaKoOACBnKpjZrxEbCC
	uMw2U8eLtvAYDVx1pbYt3jg52zAmWJ4BBeGdUB5jyUU4Xfz9A0Ui8sTAjr64CpAShbySLcWVg0p
	qSP4kBF/U+zDehEn1msWHP0RUHZrVxPCQGs6uHAMhx3hBJJazIt9FYvn2tGEiu/tFzTPEd5gLX5
	qcLQ3qig=
X-Received: by 2002:a05:622a:1804:b0:535:a5f8:a5c4 with SMTP id
 d75a77b69052e-535a5f8b53amr352445591cf.68.1792141169297; Fri, 16 Oct 2026
 01:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820130158.254808-3-jamz@amazon.com> <20261014200112.1363344-1-sashal@kernel.org>
In-Reply-To: <20261014200112.1363344-1-sashal@kernel.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 10:59:17 +0200
X-Gm-Features: AclHuK8plkUWG0caIufFg1j5DIBTkx_nzXhY5cYIKKqxQ1cPSAaRX-yvQIYuAck
Message-ID: <CAJfpegvGBZaEw_tS-EpOKMyzb-AG3CYBG7DwbQQa3280fRNQRg@mail.gmail.com>
Subject: Re: [PATCH] selftests/fuse: add the missing FUSE_HAS_SYNCFS privilege test
To: Sasha Levin <sashal@kernel.org>
Cc: Jimmy Zuber <jamz@amazon.com>, Shuah Khan <shuah@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 22:01, Sasha Levin <sashal@kernel.org> wrote:

> Add test_syncfs.c as posted in Jimmy Zuber's v3 submission. The test
> talks the raw FUSE protocol over /dev/fuse, so it can choose whether to
> advertise FUSE_HAS_SYNCFS and directly observe whether the kernel
> forwards a FUSE_SYNCFS request.

Applied, thanks.

Miklos
