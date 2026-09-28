Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B6B485925
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 09:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.232
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586272; cv=pass; b=GSqDYIC+vx0tT2+oFHZWFYb02UC7HljJRkwKuHjfBx98c+IqxirseA8GJzGgEXk7eGmLf1uH4yJxIfb8SDHY1y1d4htmZZBEGokjz9idCj5Psi/t+tKImUnvjjdl7eU2aUzxrZ7CMSLw3KI2WCqDVX3DGYTLwzk2hGL9lLJrnvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586272; c=relaxed/simple;
	bh=sJIQb0qppefV+n+o5hwbpJZrM8HXT9DOFxFpufv7NOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7/0VyrL1/RZKndsv1qAOZ/DOwPNnuX7qU1byGBogy8ME7WWSb1KeSz02Z2ZCWpadBLmKpucJX+HsDSmFxuL+2kiTEDjMjd+wbS8VFbwWeIKnhxafrg8eyRsn4gnrdanjHe1srlvG+4p8r8P2Z2HVCqm3jDXFOn2OgzoVMGrb2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=RTh7eleC; arc=pass smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="RTh7eleC"
Received: by mail-qk2-f40.google.com with SMTP id d75a77b69052e-53324cfe178so15891581cf.3
        for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 02:04:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790586269; cv=none;
        d=google.com; s=arc-20260327;
        b=rHQYfnN3OUhD2e2Ibi+Ufaqn340rtrz80FTaXiRL25af3aubbZxWhBGjm/nvgPgQ2w
         f1U6u4Bxr+8bRwhZEoCnmKdBgVcZzMe5VLzgqnSF/Obcn025Ma52LNSYeru++PPxsGSg
         J219Q4K5uYe2+7YfTbOTrqcPHDAI05rSWve3ylXShlQ1Ejq7XlUGwusM+94T+/F51cjj
         BTwlK/6Kddza2sAXokjv49vQdSVSvB48SWZrWBwt4/eCoWtC0jVY6XGZ+suF2lYWAA9O
         Lybp4B+sc+/kI6ED3PMXm8+Jep5eDwrMag5jzVuxjyQwfEPErj79/wdXkK3Tu828iYXD
         gMgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sJIQb0qppefV+n+o5hwbpJZrM8HXT9DOFxFpufv7NOE=;
        fh=eeOdXcSxxQ14xelCJLKd/L+zMaqHg+9fVZpO2elAXlU=;
        b=LG+LOtGX7R4nI0mvGaSaJ/eF9EqRLO8aN+qH4e+5ZSQumfSjfjXFCAbA+n65hgofLi
         FMweI5SqmLKXXWZfkud4OyPCdKbAx4eS6Ao2UYBg7L0F1NQx9BXMQRlzR2IZ1cBUM0dd
         qDRBWmGjk95CQ+IjeqzaRrIz8h8f7/AFF5WfsLrPttVSZ7uPwmAVWKuVmFkXCAosQWJk
         uu9NeEo+sAvHTdetWQvvdfnbLZdA5OKeJH18KHzJ8SwjdgbCb7tDOWvRawtGLz515HQG
         2+hSXFDb4GXQc9V2bQPIZS8wsXzYbyTMW8DgCq13tguCq5LFRm3wsRmb7DaGtIewcqXq
         ly0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1790586269; x=1791191069; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJIQb0qppefV+n+o5hwbpJZrM8HXT9DOFxFpufv7NOE=;
        b=RTh7eleCOtXUKu3c38DcnsOB11iU47qyPb1iwojui/yjPXck7OK0PN2VGqoU52MJqV
         EPUzDS72vyFLrhWsg9It2c21OwHaPqwwuJEk0m229mdWeUBTQBdi1SV/vCHOwdzAb5CA
         rE6jeVfVvbu47ON1tl3P+zDVGeIinUJjF8AZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586269; x=1791191069;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sJIQb0qppefV+n+o5hwbpJZrM8HXT9DOFxFpufv7NOE=;
        b=z7oAwQCOHLiLxrBwYO3XJB7Wq1MOKlal66fR7mrWwYdsZwDDu05VCL8XMwtArCqUJe
         GNWCXJAKzyU4FdWPD89tC0N2GnmYH5B6hHdfAAJB0mlCs9FX5GIe7t/crEljpB7EWLw9
         eBIO1H9d28/xKtgLOsmGzzYb2v7WncHVt46JBJOjTu8hKcuN1E+9QRMsU3nC9q2a1nDE
         20pByWCtlbdDnWGz8w9/yeRa9Fv/uXdB5mGIGgy5xeCOBogLCi4hePszGckArrNzu9sX
         suRDHWAdJKKmgYIluZWWXH+JCd68ByO0Ed4Cp93jihnVWlRb/4DxSh7ZVPhVYUw/MPD0
         u4rw==
X-Gm-Message-State: AFuF++mTbnkQJ5WT6BD7y8V7MK3FEymTETJ3Sbp8HTIuNBIeTj+uYCVG
	S9fWr7QElKP6y0d1C9v4NJP7bTnf3chJI+oIY6p2wPTgGPa45/2M43QtkkGn5i1CP8I5Fevctat
	LOmSUV7z+ySew+A1fMwikm91N/G7qpLoO5mHvHjCocg==
X-Gm-Gg: AYBFou0hU0CsgN6rCWjgjeLccFwaBKD90YpAu4gdq2Yco23rIBZIqdjkVr0aZrhtqwf
	SakDo5n+ezkMBPfWBqAA+LiILTkaJIUXL1t3pUdEC7nsU6lLcoq6Ll2wj+dQ6YPJKcqhowUQNQt
	vFSjoDzsSCYHH0HjXfUwWSI+CBPOESsbdzBH6VKUXxllVl8a8hZcwisHlhp9F+wJTPffmqzx4/g
	/q6QSKT7pVJObJJ0HpVtJ6mNVEAgtlC/GqqEEyC9Nk1qM7zn+AxfaJAzioWV6ez5zF7+8shLCpg
	OSosZXwSDvbkMedl5TDaCCUKpNTVeh9ihpGydE2McHf2TlvkVmyfzQtELkK0GESUVFVJtK47qhl
	vASk6InlCF7042Q==
X-Received: by 2002:a05:622a:120d:b0:532:c7bf:7f88 with SMTP id
 d75a77b69052e-5330b556b7dmr206684381cf.9.1790586269041; Mon, 28 Sep 2026
 02:04:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811195733.38489-1-kmehltretter@gmail.com>
In-Reply-To: <20260811195733.38489-1-kmehltretter@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 28 Sep 2026 11:04:17 +0200
X-Gm-Features: AclHuK-Jsl5DiALC-j7sE0rdr09A1c57R2WXrp1gltFow3WO34CRFJtZ2bJ4p_U
Message-ID: <CAJfpegs_4ae36hERZVC3yDr2w8S0zpoo9ER=NU=jth+pXfHd9Q@mail.gmail.com>
Subject: Re: [PATCH] fuse: fix GCC 8 build with CONFIG_PROFILE_ALL_BRANCHES
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: fuse-devel@lists.linux.dev, Joanne Koong <joannelkoong@gmail.com>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Aug 2026 at 21:57, Karl Mehltretter <kmehltretter@gmail.com> wrote:

> Use umin(), which is intended for comparing an unsigned value with a
> signed value that is known to be nonnegative. The preceding bounds check
> guarantees that MAX_LFS_FILESIZE - pos is nonnegative, and outarg.size
> bounds the result to unsigned int.

Applied, thanks.

Miklos
