Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4EC38D404
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 12:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056006; cv=pass; b=PaeOC9bc4dE6SG6O+x+px9jUx5IgDuU+fuCZN2F5JISEuV6Wm90bUOLTNq3yOh8x6xAIsT7Dam52VGXKcMX66DN66oX4wSjB61o+6r2daMGewohpmt8FVTcUzyixLFQFBJT3ny3Hg65s8GEpn2MJe4Q5Z5NUw+yXPnelrL0iaIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056006; c=relaxed/simple;
	bh=kLjG4blPBMdpWzPmKacj4BuVzm/7SEdFKQgIAE8kGpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Puq7U4wr0bPGuZcQJ/hqF7uCDlmuWpS3FiaWuoQZGo4we272UjIL/aibz1kd9B+IvKEsBtbVkwmGv7tvTHAlDojawXRMCHRJqs/fb8W5CY5qWWPkKFUflh3q9hgUrpt9w2SX6gvwiD2vVlt/5sxfWuQB3xV12rTin8CTwfndEV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=SB94R4RL; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="SB94R4RL"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-52d8679c149so29482691cf.2
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 05:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787055999; cv=none;
        d=google.com; s=arc-20260327;
        b=NkoGtN2Esv5L8veah1InqZnohzThmnqAn4fc+zd8lVEZ26e9zU+FrHP0/thpgOJWYZ
         TIiP9m+8L9tS3uQr9mbxOUGjPpgFEGouBrTIyPmx9wi5hUF5+LFPIDKimJPXq9hVQy9m
         oJCUOPq53g7VwNkplVT8y4nNc/UDopwXA82MQ4EkyE7V6RW16vEQZl88ZjjzycjdfqTx
         VB6E5LDpTvio9xmDxShWk4+o0xKm58742QrajI01TSP/pHtg2j5oLNpCA8HznTJagHwE
         X+VpEM344/2bTkFjCWRQMOgWfMaNS3NXejrw/oXRnjxF8Omn3iF44FU/4CN1yA49uwYv
         z6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kLjG4blPBMdpWzPmKacj4BuVzm/7SEdFKQgIAE8kGpU=;
        fh=Ws3Fnw9HUsx/C3q0XopnhaIe9WDnajalvI9UV7pDSpI=;
        b=FlFxd2L+SDNUEGAzY/8LZYF6VvgIipfchqv5uB5J9X1AtNSfVSRQ50LP34E4p1+2EB
         3beRKJUsnB9g4L3VP4LG81K+Y1G/BLbzws7kDZjHTyLvxfaXwJHaUaQhyg0f0tkXHQco
         7CoRzFavtj17NQmP/LPsLuyrQ+RkIoideIHNdHSHjOJlBFFf7mU5akyyNYYeh92xvhT5
         3aufIDMcfYWhbnpTpyGFehfwV9HKWcZNPdNdtgY7LU6n7Re2kinqMeHVKW+NLYMCw3H/
         cbOvI5FDkJAYBuKboclnFIYldBPly1az4ksIBVgURC4JrRuJfcDNssCxc0zVHxJGewAj
         w+/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787055999; x=1787660799; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLjG4blPBMdpWzPmKacj4BuVzm/7SEdFKQgIAE8kGpU=;
        b=SB94R4RLdmbYFriVuM+Dm0I7HRolZtFW5/dsidHO4kz++9n/HjRAUp4r25FZhXfS3F
         FCVI5lwP7fl2bF/2v3/9ETNhmbDIdIbbg8PI1y72OdOsbjbTdWHDbXM/uxjH7oYzXjDL
         vPg95yA0N2qvVrlOdNaAxFHGKyYiG0PXDXmFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787055999; x=1787660799;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kLjG4blPBMdpWzPmKacj4BuVzm/7SEdFKQgIAE8kGpU=;
        b=jTHRwHkHdTxBjOWqtN30+E2YWQ3eqMTzV54CGvFoCYaCbhwxC82cbrmIZGRjA3mgbJ
         mrWXL8k3xhbGV0yYlgY4ziXubOvyaOV8dGMwe+Zx9Dh1/hwoGcefnWBn7XNZPxhR2Vi0
         uPsUkXQA0zpZ09XkTEMjKpugFDXZZIjAROHsFFcc7DHIYh3zk5SXN+SGh7dF8J496Gy+
         o6KIez4p0zdwfe8aA9SqkO4Q7z0KReBtsc91YIa2gJIMc2RGtMHcchvVxcJbLUUFr6um
         YZY9k5Q34HtBcHhBzxWxX8GtgYHZJ/6H+oA+Tksj0zZlRx9qbsMOleJVNTLncOw4cWE4
         wIjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3jMJpBAPtXxwszvJsl2M7xfaBu3KOAtUT4azf3tTBDB8DwD/Spkfdw1hiL8TZnRbXBPbTtGm/8oOT@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8zX/gYzLAfwWKewT3jRlfXzLSG+opUHqQrn3Q3zwFdq/K7qI5
	VuE22u71Fc4VB5fiHl/I/9sl4CSbHkzTWcmozXB+FjY7aslXlH/MR/eL79Zq5w3emHwH2AD33/e
	8MicUpAW6wLm8s9Mj36Z58GPbSNV4dXD13xqLYB9G8Q==
X-Gm-Gg: AR+sD10ye3Ri8/Tyqpg5JI08onUN3hPYHXmm068xxZehsW2GMU9+x9wzAhjdARL4XP6
	fRLEIVypB3neOCbOTAGA9gZB84QyU51DmgGMRt+EsEfrX4VKf4zI+SNdrfO/gieLq/n8MBpEx5N
	rKXRcbHqkA6F4gRTOqXmwQheag1w6ns4zH6z5J7Bgfqes0aJx4G84UU/yJkwwZNBkbO+0O0M4i5
	hyss8zLueu7sLXN/Q7+BW14T/ZlWlZfUfxb1We49W4MXFp6WBYtkR5uQ5s2I3/OqB6AyBTafRjC
	axHAFqPvp9p/ZS/3yb2Bkcw9sxA+o9oaGVVDybphfRFFGFF24RqT1ajWaVu0DcXUvAHkygvbzh9
	Q
X-Received: by 2002:ac8:5949:0:b0:51c:fc4:a144 with SMTP id
 d75a77b69052e-52d8530ddcfmr335928241cf.4.1787055999194; Tue, 18 Aug 2026
 05:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727233706.218446-1-xmei5@asu.edu>
In-Reply-To: <20260727233706.218446-1-xmei5@asu.edu>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Aug 2026 14:26:26 +0200
X-Gm-Features: AcwNN1X3TurRVqh3drsMqsffCnxzux841IzZnvq7PDJVAO37SPootEXFLrLLa-g
Message-ID: <CAJfpegv_cfPAiS29SBR9Jb0BdcGT6ZqP0ajN4nEKF_Dbz6ifiQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] fuse: copy request headers via a stack buffer for io-uring
To: Xiang Mei <xmei5@asu.edu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	Baokun Li <libaokun@linux.alibaba.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jul 2026 at 01:37, Xiang Mei <xmei5@asu.edu> wrote:

> Bounce both headers through an on-stack copy so the usercopy touches
> stack memory, not the slab object.

Applied, thanks.

Miklos
