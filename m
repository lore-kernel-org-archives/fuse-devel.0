Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13943378D7D
	for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512908; cv=pass; b=oOOGThvV+bs1vsUMhPXNM8PHq3RwAKBEnhEj/iO2OYyE7ZkKNrySxv6Xqjb1mud8HIoE0w6reQqYn4YACN1qW8wVlrrdlzk0gdLoGeQUdMys3THQU/+PmXbjLHwNwoyoQHr5HnFn544DPw54pwlO59+Tzjf2eNEIKwR7RrNMbFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512908; c=relaxed/simple;
	bh=42nleDFZYyVtk4ljqFgYqgrgsqJyLTMzP7u0zd42C7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kvbd1cmj85FpVdtwjOMkZqyzi+DgytVqAL4CzS4ziI3KoYtcyWKEv9PZpFjUecrp9Vkmasy7zB3b7IFV2zxpoDZb53Slbenj8lTHtjvL3L//u8VCsrnvB7Jk7ZGib2y48w3d+ZHkC3Vd2FaYDnBfHt8hjU4PjmIHpoI74Jc9oK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=g7FqJ8i7; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="g7FqJ8i7"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-517907feed0so42088471cf.1
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 01:41:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781512906; cv=none;
        d=google.com; s=arc-20240605;
        b=aj1qBX2Z3idRt8l4MkA3wh2x0xnkXGTbtSuYnnlUWwXv59ln8H4ljvR+iL69U+ajZL
         viMNMu46iejbE3vrhxN4cgKnK+Hy80Apl6Hc5lRPEZ2Ep0xFK1b7y3yrhyTgAfNAbC3Z
         hDEstGP70wlFtngFC9rrV7QRbZkijETkUvPjcXZ+i4VWsS1VQS8rK5cKxjhLr5PjtaUu
         gXT4km2XzGSSpl1Fp5HNRUGFwOLZh7WCBRC31ktucY5CclNXPO7NzTw85PK8YrJxFIth
         +O+R93LfrCBuyE4mCVwPjL+IBUWh+VjK6PSSpq/NFu4Kc8F16Rg4R+N9Y/REtUe+AdV8
         Hk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zqm3Bx2UDKuZllmlEYDgKaGSycMbsjHfII7eX+C5d4o=;
        fh=w2Dy9MBCymTAHXuuQoFoyTRhGtZ+o5YcX5Bg6rpudfc=;
        b=Chx/R1ywVNsgeywyoSR1PUSm3oMYFjQtXQyBe41b3Y0fHx4/7Q44rfEA3bSCtFQi7f
         0fcu1+4f+HBJB612+n1iugDVrHlDs5wGT9uab4+u40Avzs93Is4u41eW71iszU90uKtq
         vWioD8M58Ez1iwHaRwJ5uDfaN2d8YvKe55p2zE+SMY/NbEh53AVPrUh0oDTLB/fBum8O
         07tYhXNqPnsKKt9ti/HQiOUW6Rgx+j/7qIZhTC7TC1hCOdVzBm1IPJ/a1zRzdr4ztwNl
         HYuuRO5AwjUXv5i4+ipP4vOLyScYbu9RbNJppW2DrCtPpurUos8oGJomWw6BZv09Pf0r
         p2Dg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781512906; x=1782117706; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zqm3Bx2UDKuZllmlEYDgKaGSycMbsjHfII7eX+C5d4o=;
        b=g7FqJ8i7FHLR9Vp0ub71mn4N0Nooxjb3pNJvnm8QE710EbyafAhw4HlUkP0qYRwggP
         5tGFKKKqb6QzbgadGWUDAGUUEn6ctYmNM0m9DI1lqqQu74j7SwVTBm1fi0HCbTQ7+SFx
         BEuM8A5kBNw3aKzoSCg8chWMA2hEFLDPHEssc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512906; x=1782117706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqm3Bx2UDKuZllmlEYDgKaGSycMbsjHfII7eX+C5d4o=;
        b=D5NcWOjWWYM5prpchvxsxS3J9wU+nbTalDtDo41BqvFBe1HJRuDXK2LzTFHBzoRT/N
         n63iFhadE2ZwDYG8I3Ej8AFVptbbQOYjoahwrnfp5d2IrcDRXnyzUlNrC6Y6g8J+RUDT
         UQNnlJDHyki7KZVQ+ngVCN4JaE4Yste5LrsyR2DY6bmS03EiPU7sMLPgiVuPaEVgAsTI
         szPk9DTP2lkzIURXbOgNvSDc9s6mStJZG90ufLSaQSWbpjGGYzDwbAp+oESdzS8Iekl5
         mW8FhuS9Dq/EWSO19uLM47MlVFTRQQwR7emUSNZ4T0A+xizwQNhoQkcLEhkMbjthl4OA
         YMqw==
X-Gm-Message-State: AOJu0YwRMmUmV/9ej6fXqVbiL7+DdGOe1aXamvh/zcOFgU32vKECoSfV
	7vvR64zUSwKZYRfvdT4OP5KIvgTG9NY7A75DOQDgsD5wfnbhEYqzuUDJVsu6GAmI3YbSNIFRbJY
	IRBOmveF3W6M3x0ZAvnQhF+kchxKw9SDiLmzaxdMLaA==
X-Gm-Gg: Acq92OHbKwtMj4oSOwLVyCJ1LudGmgnhuFh7mNc15vt5haLJC4jaMEOOrIbxBM1jYA2
	AfNks3Lb95ColWz1ZhzEenDP7dMYBACT/xJmhF6AteKCBXb+AllckhPJZ5QnKyb2aGhPyvSGjRo
	X+CCrHOsRaAouJVEAF5fuzDgsgFOMHfNAxJUx2ETnGN/yiJ//s9r7cI8zQkDYQ2wPvilkuK9nZT
	raSxNeFwr3HBTL8XwuVVUm0wD6BOWdaq46DwVTqb1I8FkaRikIh+Ve+cLoSzlSffZ05IR8Y+OLI
	lT7WSiQKYvc41c8MuWe1R5iCpeJXo7V3dbZx8poX
X-Received: by 2002:ac8:7d55:0:b0:50f:b61c:ec4c with SMTP id
 d75a77b69052e-517fed8259bmr155736561cf.7.1781512905986; Mon, 15 Jun 2026
 01:41:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com> <20260612210513.1516038-8-joannelkoong@gmail.com>
In-Reply-To: <20260612210513.1516038-8-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 15 Jun 2026 10:41:33 +0200
X-Gm-Features: AVVi8CdaciaXFEaNWHD0Vuex3Y4O4dm-o3u5XmMhXD8VBXWmqKnrlyHoUK1mMRg
Message-ID: <CAJfpegsWpKE4kUUQo+NK_cu6oy6h6+A1M=xokvSQbFtZzu9UKQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> wrote:

> To use this, the server must set the FUSE_URING_BUFPOOL flag during
> registration and provide the payload buffer pool through the iovec
> payload in the first sqe.

I find this interface inconsistent.   Decoupling the buffer(s) from
the seq's means that the registration should be decoupled as well, no?

Thanks,
Miklos
