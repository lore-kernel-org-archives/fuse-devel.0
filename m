Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1417B38BF61
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 18:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784313823; cv=pass; b=t1Co70oYUbReiLI0wmKREZojH4KGxKDNegtPEVmbiS2LasfgPtoIzQauwvzQfPyY6ra166SGy53jUaokSIMBsEhCRTzE/+cgQaABY/xbZ5ZA4yYLQAUwmuxSk0yw9YMk8mrTy2nGwtgLg89KivYpcu1AUFPU5G7ESDf+CTg6OeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784313823; c=relaxed/simple;
	bh=3O44omyf4x3n+g3oslZ4WofdPeX1dbs53eJkCzQH+II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XUGsAgJ0PxhoJbME0//9X3EQEDQ9n1gAjLKp+VUVEK+PXV3Z9nVXios3QxzQOQtYXF+A6moJebsLGKTTPcyU4DeJFXLMMfjMrBFKzdiaZRplD9HyDzLgEVVc0Bw1ripe1ZltfT3tdGO0XDFFjscsS1M3v42BrKOqIfetY1rUqfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHnGixHd; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHnGixHd"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47de008b020so1450526f8f.1
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 11:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784313820; cv=none;
        d=google.com; s=arc-20260327;
        b=IeXbBXgfKTNxqisE7miLqNRWpgxS35SAaxJ/2pmATzOnnt1dGPIOnHkMaWeWvd6y7w
         g82xLuATgEwa+GPOEPMRhnXxnSiczkT+RHk3nZ+ZJal5aAlWEWYYUjhZr/kgL7eeErrB
         s4fK/k9qALKQJWeBNkGxN0NuyWyzH13qKF4IgpAk1rUZk82eEQgNIDn2rvqlpd+cfKLi
         ejecoIgOsSMl9MKTQuKJLpEbHieWR/3HDGWi1QOzSzub/wdEikvc6qiKuqfb8v5xzI+x
         IuhK7gq3pCgHKfSHetIaKCfrVbtu4SH29oscBpiUQoQ5FpXjBTmj7DzUDKqynRzoko4z
         sZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QweemZovzii7oMyH/f8WwSFHDspexdCq9vUiy9EFGNo=;
        fh=ZaoGBQJbaLBsIwsR2ct7/9A/S54jprhfwotZbeYqF/Y=;
        b=aJ+ZfC3O4DE5V3fJbnqz64kaVgXa3h3TPDTZFZONhEllqPyO0emSO72DiBuAcRTsUe
         lx/WJCSfLKVumUuYgw0r3d0480eAjI5ZtM9fftkreQtjXLBTm/4fM72pb+TlA86zftbY
         pfhrvNuOnlXArpAovSnHT7KV7LZVVq813k9Mq+XEVSAXQmt7kopIuMzpASgKI/E+thWa
         grcxCUSiDg309jxn7AIgZOneSjWOxSl3d9yNMPupophC2XZqsSijhe+6NWpVwE/o7gUF
         bBeJOe5FO4lJZXBYtiaDmPkJMtiW1lyPiNtyTZDLxb5FjGbhq6WWlJKKNiMZGpCqUNnl
         YjcQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784313820; x=1784918620; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QweemZovzii7oMyH/f8WwSFHDspexdCq9vUiy9EFGNo=;
        b=aHnGixHdBEi5dwewMpLjfHI3jxfRQY3NXiqe48kKmIS5HwtuyFFuZNDUMEnl3JBfLu
         R2a9l1VlXlUh4+ljWXQI8typM5ILHDU8RA7vUOeGum9BNtxu7fXKL1MqtVw9avOR2qkL
         dLd7g4v11Uhj+5Z4VUa4QrdR1GoXQ5IGVWe4DDtCWYHiVrg6Z+OW9ag9V7i6iK0o0yfi
         jejwT7zj1rjDX/RrvnmX2XO8QVjGKbPkW1Je31T14JuJJbhH8ZaapFSTcnc4eoxtefY4
         tJn0clhz1yayWj20exkXJXAHn4pIhhnBePjNHtATLXk2Uv/GXA5AGPTCPA7LRxmns53I
         k5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784313820; x=1784918620;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QweemZovzii7oMyH/f8WwSFHDspexdCq9vUiy9EFGNo=;
        b=sewzaOheEx7j9PHL8qc4pJYXILYVSNBGNxYH4HzYZpk+5qYZuj3Wd7ZEeCYRlQjwho
         N+yYAY08zV9Y7IPPGFlNqVjVq7pHq6bfmbOtkEXSWbEqnbDGvIsH8kQ1p+nPvuNIl34M
         pXmRdVGiKcuMphILfK5t5pfWV4SRrDgiAG4j1eCiHJQYPnba2djFVRxVFAoFR+DMofUg
         kVvKyY/Hl08Bmktg1IlWH1WDZAbPkN2h/NYt5dYyNqaiUSiiEwrYvHlIG5Tjd6cfiw+x
         NbCRvwJb1cOURqg31hKLncIsi1jZjevipzcdv7udGgsI5ZTy2h/TKZ/le4bKK6UyLagW
         GL+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoDrFvCMtmUMGzc8Gd5juoBAIYsmG/X15Dgef6O1s3VG13SdIT/Y83LxKQLFaQAwWOCsUsSuzZnKILA@lists.linux.dev
X-Gm-Message-State: AOJu0YwoMHG02scH1osHoyNC9z/stjXsSyd+3MXxsbPjjjazPo2KsATc
	fe2IPBmSQHXW5bacebce18eQEscNWw26ov2egK/RbfzgAAIhdQPitrbKdQfh9MQpibCeMUcZWGf
	JOC12UzC1+8CUVO8mPOl24pnD0tv40XU=
X-Gm-Gg: AfdE7cmYnjYnXKKToqLCR9z5PC9xsCkKVHqbJNRdYbRN7z0fc6L26IfBPYGOBP0SdUT
	8/sA/CH8g7BLcMs8uoTDUrVmoDmvBPpbeYw+Ca3zG55bR9fM6aTjcL/ad4wHJJ8tbdhwtbxXKgK
	osqbdTFJNq7UUtIRX2oyEO1BUksCY3z3v/PQHmZQo0ot9ISjHc98WxEXZDGIpwSTEeExSKnMtLJ
	tyLRa6yy3xkxSur7HasXQV8PYgUNCqpZc7Jl4Lo4M+DFMsj5aj7i1iVUssWdrRgFCMaRJ45faEn
	5wCmV8LR38R/UvGV5AgvpFI4UrhyAlqJCS6zkKCd7j5+QCr9Efig
X-Received: by 2002:a5d:5f49:0:b0:473:5bbe:780a with SMTP id
 ffacd0b85a97d-47f5a67a858mr11204682f8f.31.1784313820116; Fri, 17 Jul 2026
 11:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com> <CAJfpegv-Yiokb3YNkCNXf8f7YTSxsEVSD8YmrAt=y+1mg2oJ2Q@mail.gmail.com>
In-Reply-To: <CAJfpegv-Yiokb3YNkCNXf8f7YTSxsEVSD8YmrAt=y+1mg2oJ2Q@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 17 Jul 2026 11:43:28 -0700
X-Gm-Features: AUfX_mz6vJfsBF8deV4QgsQCGFYp88tHV63CBbC5IFOB971gYawVgOsOIJ32ndw
Message-ID: <CAJnrk1Y1QaD2tc0LfPxS8yF4mv3K7x7q02pOqbWGBwYgztEkmQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] fuse: add io-uring buffer pools and zero-copy
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk, 
	bernd@bsbernd.com, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 3:18=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> I think if the synchronization between INIT is sorted out then this is

I'll submit a patch for the INIT synchronization separately to avoid
respinning a v7, since it's a pre-existing issue not introduced by
this series.

> good to go.  Sashiko can't apply the series, I guess because of the
> non-standard base.   Not sure if we can help that.
>
> Also because Bernd and you are co-maintainers of fuse-uring, I'd hope
> for an ack from Bernd (when he returns from vacation).

Bernd, this is targeting the 7.3 merge window, which opens August
16th. Because it involves cross-coordination with Jens's tree, I'd
prefer to get this in at the start of the window. Can you please look
at this series and make it a priority before then?

Thanks,
Joanne
