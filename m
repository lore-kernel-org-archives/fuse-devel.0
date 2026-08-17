Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677CC3033E7
	for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786980572; cv=pass; b=dymSGc7lAMjB7k5FTjQRoPTaMnBC+9CQnXsd3PVg0MBVOo6w7maaUlmXjEldg4/MZWRZawCppGqAiosGWFJ/2PcIwSDM4ZDSV3nE5Po69ByMyHja8oBHV9e2bdmt23GM20gyJmIKU6iaWzVS5Y80ngTNNd9l+QTyGEIYNKcMylw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786980572; c=relaxed/simple;
	bh=DAg3SDDbcHnvslbJZtynVgoi80jxJ95p35r5cV/Hr8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dCd/R+9c9qrAN/OkjBLUJQhKfoHIHDwQnYjCQSERUCvEYGXIe5ico4sTG5kge63+tKBjDevXaPrQLyB6BGlZR3rjCG+v54UUHg8c4WiPlUzLXXkDKRb7gTycaI68dn9qJsb0Fgzx88UAsWNfNMBATFG6P5ub9pBE21v8KmQ6YgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=j8ImqsRe; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="j8ImqsRe"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-529a1ee0e62so25104751cf.2
        for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 08:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786980568; cv=none;
        d=google.com; s=arc-20260327;
        b=WIj8I8Twc3lXNJZcHpeATWVm8ecYY6W7wJAzEsi1zfnlxqS4/f5P6LE3ixYTow57mv
         ach+1aQlfxDwb6en3y7mD/7gcQYWZuKnDELMF9ec4EpUm22gaXzp7qs2cQbXoQ9Fnft8
         SUsh7E3WG61ekoTUheoAdkHJwTwDgTE2++9G2yJ5eyUdMw4WAgZofLAAHhMdUxZhQ5p5
         B1TJP1tXouAKr2y4YKWjSMiel4LEvhJTXxVQj71M0k/OEoALeNN84tZ2wPNQI/bSIlr8
         xJb0u4GSOr6EmGk2mF45Rr1JAB/X0v/Ps64Fv0kcIRmAMOcpigkKyJlotNNbtPazet53
         djuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DAg3SDDbcHnvslbJZtynVgoi80jxJ95p35r5cV/Hr8Y=;
        fh=pOUhLjL98A3Ype7sRpwOjAk8ixdPoBq9jLKDWl3hag0=;
        b=D8YIhz5QQh6R75+HDVYiiUJ6OKo+dROf1lgKmfVCktaSvGZfZGQF8ARBZZ3BaKwFIu
         Lp6FQfQ8daMtM6PVLaSu5Hob9Z53b79oxy7UAgx01ZsqiEqfz9xeyyOlfv4QgDrT/obj
         ya9nWwfxOiBtdtEvofHHrZovocJ1cyhQT+pUv2qDnevM3nG8nnTxnHFhU91czPfdG66D
         RN5THBjR9bx6On62rBw3eYRdJ1wjbbVdfPUVmOrTMdpFh30Y5D75D4+eovyUYw6r6aWA
         j/1fCoDc6A9D3V9+Yi/kT6vazKZtDuVZj+h/GMKypo0x6Hl5iVZgxmVIhTt93+ebULd0
         QJTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1786980568; x=1787585368; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAg3SDDbcHnvslbJZtynVgoi80jxJ95p35r5cV/Hr8Y=;
        b=j8ImqsRe/qbqid24vQhYgSVSIOUIzTx5pkdgFRn+O0x95ZPlAEEwZDsXwdbWwt1HQh
         2jKwr69+3oWGwHZSrPZmQzOvnXp9QXPfhqzTdG/Ca9VBqs2A9TqNtyqA+gTB8McAWMsf
         QVugufPa2Ih0M1v2WNfguJ0bf6Zpp3Zvq3aTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786980568; x=1787585368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DAg3SDDbcHnvslbJZtynVgoi80jxJ95p35r5cV/Hr8Y=;
        b=ScaHU8YYkr+CEx4PBg6VIiLWb1uJ+v2+6Cth+CqVV+4xi5ZK+Aje8SjYSc7z2S5Uso
         ErNHh/VD277Zt44PNyhIk2EM3WYB5sDLWLp7x4lf3lK6A0fAkPPLXfWdQ5YmvlPqmjCL
         HHgOXmlYO/d+dt2PkiaeoLjGtGtPpOz9c/NWnRyMeLZbcARR+bpEa8RRKdD8YuLtawSE
         14bEZQZuXJd3wbuaHxe6hVKPJ0SWz13jtOgoCiiGPDbLjUFalKlOnYTLfjKZgXPS2RR4
         fJN59R1QVNpiyGlWRLar49AJpUtel3PnANvBO7GcYNw0z1Ou1iqnxUSiHF7FY+uRGK6I
         iQlw==
X-Forwarded-Encrypted: i=1; AHgh+RpiyWg9aaNtuhejXJn8twunInz45D3p1pHyfYeD/IJ8yxmYLWTWmbGlbeohDvrRDD3DufvW+C2ku1hj@lists.linux.dev
X-Gm-Message-State: AOJu0Yz569eyuoaes2/0B5AMH5IRKMGMXaNVcs8w94ghp7vkJEF3hOUH
	B/u+X2zqt4jKASkKppJXpifA+6Z0u2H+PEx95AZWRWCYqdO4KB2iygiAFEr1Hg5H+KvpMye9O46
	Ifd1tNNmNV7HR/bFTexMyat0PKhMVvNyFebzPAJp+yQ==
X-Gm-Gg: AR+sD12v3ETddX1AuQDAj8EJUg2Fg0ExO2Sf2LNgRfUVqCyVh2C1xpRvEwwv3QRysJ5
	je3z/vFEXOG3f6FztTWE0KhR6kx41PvgxSTsmtUpyLO2eMftmAefhpvNDjC7TPu9RlPDzYbD1vF
	sZ6qMTASAALEwn3sGsYjH8nRqNuDl4AqJ1T8TJGONsZHt5AWEunSXoh1ftYoQK0wpz1DGXVgtps
	yfoumhxMwGLV8TnJw4p7Yt0BSF2GPGm0UAC5QID7tJ1imYJ2Ca8br8z8mzuVI2kSgIPqatNnFsB
	LP+3QxfTtNWNAHHtgoQMr/uyiEowUpbOig1o/ifQPkxzlZCxiS0PcsiuAnnKmYViUp22iWKJ+tO
	E
X-Received: by 2002:a05:622a:1b1e:b0:516:dbf6:f8e7 with SMTP id
 d75a77b69052e-52dbd6491e2mr17809991cf.17.1786980567974; Mon, 17 Aug 2026
 08:29:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
In-Reply-To: <20260814185946.3679478-1-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 17 Aug 2026 17:29:16 +0200
X-Gm-Features: AcwNN1VNe-oG6IULSywPKUMJo7X_Kh7uAWHN2MtaXNrbbfLfGd6M4ZeWt2QJpe0
Message-ID: <CAJfpegvKygVyKMatZwySzqQaS-Q64kjocximitducp9dyBXRBQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk, 
	bernd@bsbernd.com, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Aug 2026 at 21:00, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> This series implements fuse io-uring buffer pools and zero-copy.

Applied.

I cherry picked the io-uring patches, since they don't seem to be
bound for -next.

Thanks,
Miklos
