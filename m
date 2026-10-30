Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793381800;
	b=btmUWw4lIsulh7ogolDSLBUHMJr7mkhJTPwDdEZD5M1ZZjXyd5j8f6G84twMaaq9dj8+
	 kTWzB8xmzq9GAZR6dPVDvIaXAtfXM6FRyYjiMbm/A/LKqLVbxT+axczE6YV2tj0VjTM2v
	 1GJJ/0CAij+fBc/YdfEJaFy8lyJGwWkuDnWhlUM906fiCYQ4n3UWgHJGr4a4SfpDxFW6Z
	 W26lF4b6FSkhUCoTWXsElViGkySrl6V7nYL2ZfJXT7obOn5XYJWS7DYZeCAMV7bVMOr6+
	 WGrSgNzEG8gRAA3p5y2PB3Weg5SEI/uTY0RiGr9B6olykbZU1d+rA2PHHa5p9OBKRNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BNpaUt6aBdzMCdF+Tz78AVxhWV6Ncmv7N4A1Kh6UWes=;
	b=W49G5PWMTnOYV2DpKL7MFra/OGF3MyZL80vOf3wWpiBeJDVWStE7OK8XniEn17Xo+AgA
	 KBrydRFjuaxRGHoazimwfBo9Q55Gxm9bB/Iw+Pd3zaVxpqHa43Gcpet9XIq7RZCGyZ9vw
	 KkcDc/EzhzsmkMNpJ5miHK1KfQo7klMzXQISCP9qsID/IVkC5pKjWT3Gs+j2/B/6X1sZT
	 ZOUPmlQUsdFdasU0002LSgOWGXEy42mxU2vePaMRMrgFDPUi/TwkLo7gcC1YQVCJDjsK2
	 08umWp3xoD+JSTmJ3EdcAfi0d0dt6z6N/ydw7mtlkPZFy48Vj4sbh0ZQMi3Qg0m7Hhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQSi9UB8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7161606A31C
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 17:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7161606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQSi9UB8
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e7e742a2c7so7338985ad.0
        for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 10:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793381799; cv=none;
        d=google.com; s=arc-20260327;
        b=a/R/GE2n4Q7ruWBmgW6ECOD1bjIn+innM114Mkb9R1/8YDyrHmSrUTrCKlHoGj1FVh
         P/CANL5oiVRSkjwRR1JBt3Bcyb4wqdBLm2/4umjfJ7G7KduhaodQ1UuPkriku49vxqvm
         xLVVMxcQ7FjlX0OK/dYzlwPUkNMuCyMmOxb5vFSmuhc7wz4JBtqFsqegGhZYbC4pBUaL
         rWOeX7jIye+Yu2Lio1iOq98UT2is1+bdT1Z7BQ2yC5qKHfwGYPcsjhRiX8lf17Yc2z8o
         Vyw0dDl/wxFvXyO6Q9Mbk3/GZBxjDsG1itfq59xKHX7UvG8Fin1ZoQ8SUTluf7H//1Ic
         khcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BNpaUt6aBdzMCdF+Tz78AVxhWV6Ncmv7N4A1Kh6UWes=;
        fh=/Nf02iXW97Tz4f+O2eV079um1IcKHez2FSmOw5Cunz4=;
        b=dCPVr0pPtYcSshH5x3X32elODJU6cEqinGaQSkuhYfbpF8xcwbQJ2oW19y+kzR1rqR
         XnaHRnO101p4Tq4Qp75/krWr5XCa4SGsHqD6RyQDec9Kxjg0MusIP065Beeuj2+PL/mw
         rxwNckGvpUFJ4zyMb6gPv1ejhzL+4tYVC0Dn47gauwtyUC6PA4VWYfU0u7zqSIqSmA50
         4403/t2W1rseBezWhrSiUx+09iTF6N0l6OUxdXuFBt7ujod/aIEPwjteumvRNnFKkxVL
         GsmbXL/9P3e9w2jXAuyLWksO9TDKYLIlMHaAaFd6Fv1INkdU8N4xCS1vsATwKXTdGLO5
         ANUg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793381799; x=1793986599; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BNpaUt6aBdzMCdF+Tz78AVxhWV6Ncmv7N4A1Kh6UWes=;
        b=pQSi9UB8wXiPPOvbEuSDNX5gYJqdnCe2aIzcv3eWJDS0P8rtarub5tJI5ZG1IAMpNw
         1+kCgUp2etziVB+PNFZhIZNlUQ00ZxUc2jsAJPvePdL1QuelZ7ls7a7Jlw+1EISbrfFG
         7pm2nF3a32z+PeFDxm97UVINCrzVK/CN1skJCoOz/d3bUyj0yIjZ5naLsTp1gt2JTqEp
         bwh4Y/EHPnqQs42DCkD5eiZe0lPIomhhS1ZoNNGS337gXqDlnx3SrarWufvt/pNcZXVV
         T4N0E69SB2A+e+HojmVjlR/YyRnVZ9MX2V8QfxnYS+iLNiwu+pOMrFvSHjRGW683ZHcc
         J9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381799; x=1793986599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNpaUt6aBdzMCdF+Tz78AVxhWV6Ncmv7N4A1Kh6UWes=;
        b=hMcAetg/uzwwhbJLEx63up61YyJW0kuNtw7/vJQSMixq+9Qz1mqR+4DElIsF5yTCs7
         FqU1PvQx6E1W5oJ2Gn37B6/pmwYuVvh80sZxuFCMACy9sMVNjEPoDJM3F2kz4UQQEeTe
         uQhwCsY8JDvgONOtlQ1P9bAEZGT5VgXWSuhWtDv4RHJtvBVPDVefH/uC63i0g0UPHWbu
         sPbtHlP/4R0/ycPkYl8dr03BAPr4Xt8LB0iyYaeEEaDAoDxorYFt4xhNHzT5h4HBW29G
         mMfb2i/+hTD7D9HxeyGU/1bBcfB03PIjKjzaIlllx3e4lTtIBQtAbJmYqsbgphFZ/yl1
         +R5Q==
X-Forwarded-Encrypted: i=1; AKwUvByPxvzPEBzi+gVIwTcOgktNH8Q0MtI3TzM8Xx2TysgA94Cau7H85BaY5+CTRqdYrcuLrHvBNpXVCEOq@lists.linux.dev
X-Gm-Message-State: AFq9FYIby5wKXFHBuoOELvNdwtNSOo5NVXQXgBlWp5+zAokqxKMtO1lZ
	tZUaRzn6cp3YCuel/Ffx51zG6sEZzNCS+k5XrWVnoQteij9/VxVNmVcGLBepbM4Wa4Cj7ImNaIG
	xAQEnzLOh+erw6ULPAae0V7NpeHK24rA=
X-Gm-Gg: AYBFou1g7kbvsibPimlXhgjR8pED9cMDbr4XIWgSuu4DgDJVXZ+Qasaj/SJB1+lCMm9
	nAo1TiT7KZbeQ4cEs5vTgiU4+xuNFuzK8oSx5esZ30B7/K+2YmKmK9s4H7NVU4uWJPhYdCrLif/
	2289ac8lYbenZJDiNEVrRV1BdtiAlhcKZ0lWHV5WifInFoMhNhICifMidy0Q7nG6GS3a4X72OKK
	Lv9mHtHz7ctJViUUNculf28YNJnwbSnPp28yQ/MSu6Z1TJ1L71Bn6DQB1yeUsZpT4f0fZq59Jj5
	mGLFWW5KaMO3o6ghcl/vhBbYMmz8we5EDLQ7dmYdAiOq+o3jqd1PmCCqAopE0EQhs1nw+zb4Bv3
	lKt/niEyrIPm8uQ4rtCT+9qcS+ZTTwjaQAKkjefHlcc63uUvgiroDny+XfeSIL+eHtqsdYac8js
	fheg3uhzCbPPKqPL6i1hI0m5lbEA==
X-Received: by 2002:a17:902:da8b:b0:2e5:ff87:57f3 with SMTP id
 d9443c01a7336-2eb1ac94b8amr43961805ad.32.1793381799063; Fri, 30 Oct 2026
 10:36:39 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028091215.914885-1-hanwenn@gmail.com> <CAOQ4uxiQcyZv8B50MKM+Gn==JcoAVbgbCGBneXJhXUwR5X8ppA@mail.gmail.com>
In-Reply-To: <CAOQ4uxiQcyZv8B50MKM+Gn==JcoAVbgbCGBneXJhXUwR5X8ppA@mail.gmail.com>
From: Han-Wen Nienhuys <hanwenn@gmail.com>
Date: Fri, 30 Oct 2026 18:36:27 +0100
X-Gm-Features: AclHuK92kvtxtdSN2UFSaBxan_VjKVntbjB9PhuV6gf7_cAEWJ8uwqSMCtx4Qy4
Message-ID: <CAOw_e7ari1kQTz+qKKg9wZ5dCsv5sZY-KNM-bwkietEmrjHZ-g@mail.gmail.com>
Subject: Re: [PATCH 0/7] fuse: use readdir result to shortcut negative lookups
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:27=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:

> Thinking out loud.
>
> Is  it really important to support FOPEN_COMPLETE_DIR without
> FOPEN_CACHE_DIR? The two feature seems to have correlated
> use cases.
>
> Bloom filter is built at EOF, so it could be built at the end offset of t=
he
> readdir cache buffer.

Isn't the readdir cache dropped as soon as there is a namespace
operation in the directory? That would severely limit the usefulness
of the bloom filter in writable directories.

--=20
Han-Wen Nienhuys - hanwenn@gmail.com - http://www.xs4all.nl/~hanwen
