Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714031;
	b=CVxstLLkFaSi74mg2bwcdMRe7jrM2IgyXJbpPJ6Z+KTor54q3CS/JFi1qkzPCJRzfWBK
	 xJdW+Ob7WRZmKHQy3p9ltn84oX/qivZ4jaQ0AZFFNAqYJHuizmKjRAtO4t8qxTEADNlLK
	 l3guXw8RyUpfQKU2YYtvbgwy0M17kwS9ELNJrIbjhdA1DvZO7jVEY4eNIG7Rxtb1WFL/6
	 zQUu6kWt/jnYrbZPNyowOOZc7K5ze9KuNYogIqJBj/sY9Dp6AQHEkKqnv73j4ee1Eotj6
	 A8tF9S0hajlpk7dmgesOl5kB+N516R2Ut6bM6oVkDfqBvRxAyeSeDSyOa8LISfpbk0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:In-Reply-To:Date:Message-ID:References;
	bh=Z4tHu2iJi/e6dWyG5BERUmTg792NLmlKYp88xKISYEc=;
	b=QWu3fs3WYUPspxH9imfx931FfVmqZuZ0LfJiXveUtMuadNVcDz1Y+BTtOtRzCwX2lISX
	 gPGis9sqdumwRjxW/+6eskziOuRldMuy7QWDFTjdcA7WitFSHk+alzkTrIO8Zwds3EOsy
	 kjpf7djGL+Rp9O+18WvZh8AHh0pkJWhovh5aQfLqjFjWdFvBN3exXbvykQYwRdieqextt
	 yDLH7WlAb58vpPjDnKKguZVQBh0LGRErkmvwiOdVDfRGMoGFeVWBQbD8iGLKP0d5qxBbZ
	 H5x+1Dt3GOMkFnX+Eb1tZEmV6Gee/f47kAfmqbWMHfMYaA8TOcE7YwAUN4PgzrV+25A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bIVXrGgB;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B660606A319
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 00:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B660606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bIVXrGgB
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so888588eec.0
        for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 17:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792714031; x=1793318831; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z4tHu2iJi/e6dWyG5BERUmTg792NLmlKYp88xKISYEc=;
        b=bIVXrGgB3YuSh/dSy9t7EUx0gw0hMeNTgL6gLOLVKuakIrOT9xVFFnX2bhEo+aLpvA
         9zIgfYtT6Zdt903ZIxpOHwcfahDLzY5zbBQJkUHrFxdP/QRmXm6i4Zah2XspvgCU5bJ7
         YgdqGUhGQDS4nEkBugU9jNfGotJFuGAaQOnEu3hZvahujYoAUqIev1N8wqxP6xFsWRzP
         l61/+beWCYv8yK+8Xupcs36H15RzzRQoaLDQMlmoCNn9XQwDrRrXmUQfiYMJqDN4+gb0
         Y7qCMWEtUN4XGxw63GoN6UHsJ/3TZVMtbDdQUXtLE5KDBlsYHuZHXcichsdPcJIgIm8H
         xlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714031; x=1793318831;
        h=references:message-id:date:in-reply-to:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4tHu2iJi/e6dWyG5BERUmTg792NLmlKYp88xKISYEc=;
        b=f96j0srIhpGEEyo4dfoNFr29vy1vuYPEBBD0/qQbc6EuPJSgGaj0RW03n6LOxKp7d0
         LO9bO9z+AnkVxLgABJVxizRrIckuBM3/i14RecLMvhQe66R3KyOcZtz94cbiAeO4+qN6
         DzPqEfTbE8UFW8Gd5Oj204FVL94EfTot4EqtImapkbDwtYZ2hf8rL/EXkshkW2uQDknq
         tWaE79LrrXwmGbavd6lS816256dRhxoGMagYfWvMSCiSXUp9i2T5+oLR8arvxAIIhlv0
         pZMaylqXl9pR822NgjGVqN1ApY1CBIarNCufW5GDWyaK6P94H9bQYa4KeuRD+S47+7q2
         IcCw==
X-Forwarded-Encrypted: i=1; AKwUvBzHR+xN6lzYAVhiIWPc88yuAnVFpg7KOXRuRjmd7dPYYTCtK/eq3CTEOq5Z2wTSPwsjmRt+nM4RY8R8@lists.linux.dev
X-Gm-Message-State: AFq9FYKL1uE0FEfO5Y9tQcI/vAjKtG9ZfbpRGSeSooO3lV9VlN6tEKk3
	ub90IcgBjsF5r7VueXNC8asx3YbJemeHVlo1ftvCAam6SFlH7TgbEK95
X-Gm-Gg: AYBFou07OiNVi4HDWc7Vfcep2MOxBqRlPvq7q6nD0nQOkvRmIBCy7UxdxAvIn6zrl/h
	pTJfFcZ3N09/ahFmGhx7TP3EnLyUHaXR+RfyL6nu9NlBnWs1JR+6HgrbqS0sfm4a1RTToJVPD/o
	Karaqg+cEZoSBvEcnILRGhMZTjWrPc/OLp5SDsKkrl3fvbXpUvNMU/YI/sQMIZcm0cp6xGcu60c
	JhzAFixh3DeA5+NXjQBCnxLwooI+lGVER+l03GHIlB2fAo1J45vITwY4UtQu7t/0n0+yQT7Qi7I
	lnGZ8oETRIQxDAaJiMXnhJdKVnIr3zbHLfWLueOL+ZRxAFFuX+0mOVMplX/IQeuvOL5xcGMxcHo
	UJqHBET/3Vp76DqdlsOC1JnoSt9Aa5c2EWANm+cOQCM8MeszHNpynaUEUGDjSYunlgDrkoDEJWL
	rkOEge2v810SZBExZxOGgMRGjddKf5ybtSX23KoGKLN7b0hxS11/wJUpWEFXf5fuL78bGd4sAm5
	APUMeBQonMbTZEOvOluCet3raaj+No1sD3kM1pEed24sOw9q6vBJA==
X-Received: by 2002:a05:7301:fc82:b0:35d:84c2:eb27 with SMTP id 5a478bee46e88-369d986918fmr703493eec.35.1792714030379;
        Thu, 22 Oct 2026 17:07:10 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9db7970sm1525194eec.19.2026.10.22.17.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 17:07:09 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>, xfs <linux-xfs@vger.kernel.org>, linux-ext4 <linux-ext4@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, fuse-devel <fuse-devel@lists.linux.dev>, fstests <fstests@vger.kernel.org>
Subject: Re: Farewell!
In-Reply-To: <20261016160037.GA107919@frogsfrogsfrogs>
Date: Fri, 23 Oct 2026 05:09:47 +0530
Message-ID: <fqxx5mpo.ritesh.list@gmail.com>
References: <20261016160037.GA107919@frogsfrogsfrogs>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list

"Darrick J. Wong" <djwong@kernel.org> writes:

> Hi everyone,
>
> After 14 years at Oracle and 23 years working on Linux, I've decided to
> take an extended break.  Today, October 16th, 2026, is my last day.

I was a bit sad to see this email :( But then I read it's an extended
break, so I am hopeful that we will see you around after your break.

>
> I don't have any immediate plans to drop the djwong@kernel.org
> forwarding, though ultimately that's up to the sysadmins to decide.
>
> I have very much enjoyed working with you all, and I'm proud of what
> we've accomplished together.  Good luck!
>

Thanks a lot for all your help throughout these years on mailing lists
and over other discussion forums. Really admire your maintainership
style.

I also feel lucky to have met you in person at LSFMM-2024 and to have
had long chats with you on all sorts of topics there :)

> --Darrick

Hope you have a good break! 

-ritesh
