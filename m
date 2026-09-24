Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521B647AF5C
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 12:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251294; cv=pass; b=OQPA9xBLduRYKnqxkM06t3rvR54AhAE5q3hzzTuENf5S+CiX2yjNI+MKfEm2CMKBCfTvGMWQXt4EUia5kTeDqzkv1L650tzz3q8faov/4ftH9ojxZr1h9N4ZTMwwFUVEnA9J8Y40oFJYDdm+4wh4e9Dt2n/nSbfAcM0uDDF4OLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251294; c=relaxed/simple;
	bh=ADUClccYk206h7hPKOGkSKqz/BqS2N7kbEdhZoaJr0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DvWPWGojrsD9ny6ldYl6538iXWhSjBnoBFSFUcDApWGAoLM4C4s97PJ1hj0uaYDsITEkxjIToxP62k0Xk2x3lScZzmwqhnyoeI3igF7mzotyuGZ1JbqbY4D30uI+a+aR/9EUnRy//zzZQrn7XNSIKaefwltzmIsBOuXV7SEsy/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JA1GRkA7; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JA1GRkA7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49ccf12bed0so41655e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 05:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790251290; cv=none;
        d=google.com; s=arc-20260327;
        b=fKkN+2XFD0KDfRJyJ47RfxRj1jNN20wQb45OSRv0xmXXby0mUYvaGYod5AzZq/mFOH
         gM8/Kxz96+nMW0IAfWAzRAoBQ9WuK3WbebRvmFi6N0dlWDSFr0ob4kBTiEHaanT5esNC
         yEAEvylSN9yOaI/ZwhJgSz5pCsFDCW+RTO30iZgCmWNJN00AhvvTNitZg99ZZDze0M1S
         KvRTdQmr+2WCnMiJ7xoaLivrwsIVuk1rpTkJG/ce5JDRz2vRPycsKYXjSAJF/GL3rxgL
         cdiEbGL1X0RsweBPQQsyGD+wru2LHoDPfsHVhIOdvs7IDG2gAOxl+fpvlxsOBuP+VLoZ
         Vciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ADUClccYk206h7hPKOGkSKqz/BqS2N7kbEdhZoaJr0s=;
        fh=dmvm/qd8zu+pt/xXH5ZaiKEX0SknDawo3kkjU70NozY=;
        b=ogt8mQi4D4EwZBITjjQP6fWhjZJMePuImUE07wwrztIIDUnRhwXYCysh5yM7jbRcv3
         S1ktWa8oU5UDj+N5B7tP8vbz/B51+KrzyWAb6iIRT+FdDCZSGiLNW5ENMn1b8vVvwI5S
         lEy5X/5A8d9+ROnUE11Is0aquApzm9uXUIfVgWTdgSVfAHO9wafvmHrzEyrNTuBuqhwJ
         JXHbXm87GdBjgydiN9izsB3o3BNEBDO1VRXCT3ifN/H2mE9n/QdkE/Kd5vkm9qx+ztAg
         CJCDrSZ2Fs5VfD2C8v4XjoGb+Lg78ESbqY4ygpylq4sZrnzZEmixpvfO48U88JBeWlQn
         Gh9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790251290; x=1790856090; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ADUClccYk206h7hPKOGkSKqz/BqS2N7kbEdhZoaJr0s=;
        b=JA1GRkA7nXjod22i7AgSvebgXH6Ytq/bSICNrrKVC6Xs6OpkjRLb0qX8n5ev3DTijl
         v8xUuCCE4n+lP7lUJ4PalIuG/DZUXeQquqPycu7ndPh6PqzZG0Rqqe24OofE9kQME5EB
         KFC47UbqWbn7LQciT4zb8Bqn7g1FcgNik5wUAKXvNPJ2xgJHmgYGDNwtsUZ8bIQwm/8C
         LUlKkL7VEQftl+dE3XcGT/3i4rjAOu25dRZaUgQbIWgj5qRnTsrsNSb3ZPSQfKu9Oblh
         s1BQJ3TUMsyuvE/9YQISEopxWZaWW/r5nU6Ppw+6ljVshk6PFus6URzsEABrz3nk5JoU
         kwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251290; x=1790856090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADUClccYk206h7hPKOGkSKqz/BqS2N7kbEdhZoaJr0s=;
        b=LidlpF7QrWGmAOg3ZDzfBMyiUAdgdxgrp3hAlresn3UNfkHw2X/NUSXIlHKPu+xvWq
         EX1WyS1xl7aKsU+OSeFTOQQhRfNIywweIPFywM7D3pPWSTf4xyrN419jhjkZzi6JURTJ
         EuXmhqORn+MSWAlZwX5PbfPEQz3Uh85+T5EIWmcToTX5JfD8HRdvJElZHbyy6sjOcYEw
         ExgYC0l3ZkxDpucVKq1RDvPL1bfOMPnGCk56ea8xKtyTkK27mBLsTANiQ28DaRXMbI4S
         IqE0gMDLX5eRTS/vM9Ovb5+1HTy3F/0hdH2/scLRz8WhfcIHO5+rmYg1YnPT0hIDHXZU
         jODQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXJNQ/U+H+xNHLmO9YuFCaLTxJN2zXBXLCzJFhG6tRw4jC65uY+NHXDpYTPfknVNe1tLPIdZnpDMKE@lists.linux.dev
X-Gm-Message-State: AFuF++nwWvin5hXBmT1URj4FgvUQj7A+CepzPH+6NYpHILRGtLpGgNoX
	SUof3zVtov+2pZcLlJtx9H5iqtaH+M4wIRUwZWHygYegF7JK07tVtHP3N7CrGqAxQ8/h0ZehELh
	BtyrGJ3w1NNj3ENgT18h1mvGpAnrmgGYpWIsG8Cpp
X-Gm-Gg: AYBFou2tN1bSOxSMmzLDXlOEGpsVrT0FqMa65hnJM2oOvEo7yAglJx+mMQUucJqmVst
	vzcgC0sM+jQdJA+UrOuYHEO3LrBO/hp8SY0V3UbI3kOZalHjp6290K7etS8ogGdmBxoJYqR/Q7D
	2nLQfRky60hJmE1deV4bWIExhMFg8rJUnrxrfAtuQ9CEK20Z9t/Vld67piivWeA7ChB3mageo+M
	8RfNv5Pfrwmk0AH//5PiISFhs5XXfIGH8YneRo9ojcaq13lOEHShqGDLyr+/jsiMx5Jlq6G+E4N
	p5u9RIEPgV4VRI8JNqaQTn91ohjddf4blAbZQd2n1t/6/MqLsJyqbrMhJtHP7mHRoU4ABU+11CO
	V1BMYXzw=
X-Received: by 2002:a05:600c:570f:b0:49f:e1d3:fe03 with SMTP id
 5b1f17b1804b1-49fe5996f16mr573675e9.3.1790251290130; Thu, 24 Sep 2026
 05:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909232351.1533034-1-shayba@google.com> <20260910184424.156341-1-shayba@google.com>
In-Reply-To: <20260910184424.156341-1-shayba@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 24 Sep 2026 05:01:15 -0700
X-Gm-Features: AclHuK9Au5z8ENRx2IaBAjigCgDpk1SWcfpHMs-ScW16pQ0_dNBiZHTtShRfceQ
Message-ID: <CABdmKX0B7zVfLY9Rov37U+gOTEXYSCMUe6=xFddOrKDVneiBGA@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: Forward vfs_fadvise to backing_file in
 passthrough mode
To: Shai Barack <shayba@google.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
	Bernd Schubert <bschubert@ddn.com>, Sandeep Dhavale <dhavale@google.com>, 
	Akilesh Kailash <akailash@google.com>, Suren Baghdasaryan <surenb@google.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:45=E2=80=AFAM Shai Barack <shayba@google.com> wr=
ote:
>
> When an application invokes posix_fadvise(..., POSIX_FADV_DONTNEED) or
> other fadvise advice on a FUSE passthrough file descriptor, the VFS
> currently only executes generic_fadvise() on the upper FUSE inode
> mapping.
>
> Because FUSE passthrough does not forward fadvise operations to the
> underlying backing file, pages residing in the lower filesystem's
> pagecache remain resident in memory.
>
> During media-heavy workloads (such as image thumbnail generation or
> streaming), single-access file data accumulates in the inactive pagecache
> of the lower filesystem. Under memory pressure, the kernel retains these
> stale media pages and instead evicts active executable pages from
> running processes, leading to severe direct reclaim latency spikes.
>
> Architecturally, Linux VFS supports filesystem-specific fadvise
> delegation via the .fadvise hook in struct file_operations. Implement
> fuse_file_fadvise() in fs/fuse/file.c and register it in
> fuse_file_operations. When passthrough is active on a fuse_file,
> fuse_file_fadvise() forwards the vfs_fadvise() call to the lower
> backing_file under the opened credentials, allowing POSIX_FADV_DONTNEED
> to cleanly invalidate the physical backing filesystem pagecache.
>
> Signed-off-by: Shai Barack <shayba@google.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
