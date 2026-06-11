Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B7B14B950
	for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 13:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184558; cv=pass; b=SdZnRkrAf7awvG4k9D1JfoeZR7o/BnHH0BJs7C98IFW6L1M9DMiuLHjlbo1NHoQ71DR8zYHH33/vE9cxnIqKwZXnzRU5a++VHQU40xbK8K1a+r8kp91QUTKItpbUoag5IoTCBa/Yq1G4H1JEHZ14etvm13tBuO1Tmss9QqPGLBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184558; c=relaxed/simple;
	bh=7m/mbY34w6uJNT4Wl+k01aI4vP5FZ0vUO29Vu/xlpLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWgpyQ4Xf/CJg69a6UWMO7aCmPz1G4dtNTGl1pmfK+aa2ePRgZzFivSxPAOcj+vNLFCJI1UaGDKgZHY6YZ2XlEBuL72Y4/zIZSfQcEFhatgRIogkQRF0qJf6F++ndNBHlm9H64SzHmfyHHqUsItidWoUZydtnmL9qWNkCC2l+sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=jApS6UND; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="jApS6UND"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13721dfd471so10256926c88.1
        for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 06:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781184557; cv=none;
        d=google.com; s=arc-20240605;
        b=ZNYiRhqXKx3mSi3pgELQT+1MqPcBunp9rmOYUnZrN30yrj7uh7lHVWw81FsrB8s0XS
         7n4J5yE4CyPSRzBO5S5wj/NVYdslrNUBJ8EnQUG065oh578Z3If4RZO7BNKoaFvfY9/7
         uGAZykqPbpOKvK+dRnVphX1XA80W6FYxOLlI05RfQ1a4hjIAFo2eJT4ZsPItMM2pDTrb
         ebLMeyJqvgZz6u7xV4TDXYUDdYRt6HszL0K6w+WshvfBIj/Hh1MqznuEjEXaDiFh+C2w
         KXytS/4Qani+sGltBkr6KRenTsF604kmqeom2SXf5DMUV9j965M3BXgHapUJF5acqLWY
         rqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cPGWz3cznGuInRTRnQGJcIO5XyR+AVcuc/1CzNRiXmE=;
        fh=CjzN65LAidOlP//WDZGHqNBYwhT8Y/k7dGTdwCxWStU=;
        b=Kzs3peO996naBsbC6ewps9ZpT7Wj01HSBKdp9Q3gnaxj3oXzu+wwJ/qfsGw3pgKLX0
         hCx3Ow9mZXhRprbGngVFwXsxOBypgOE1JrfrI1uUBfCfNyILlxXNMSBJdh2xTK7hLi9m
         3jWEa7R14MIuk9Y6PXU9icCStqeCbEKskhnXRQqy+XNzz4aCjv2E06fWVWFRQlTJqbKI
         bPhnU39bCqonIZ4GUxR8T3lKvZGc76ALFGQxMmbPQc5q/XUkpAZBINBhTjGQCbsS0sgB
         fnmukcODe3/TuHFHy2u8z6QRe4M1t0pMZXtsvuelnBVrxiqGMZbqSxtADbyazNsTDXl9
         7nCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781184557; x=1781789357; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cPGWz3cznGuInRTRnQGJcIO5XyR+AVcuc/1CzNRiXmE=;
        b=jApS6UNDIdaF6oN/0RoEM6SRVAGT/ya04tahwkyqGqM6ShICAqC0E+eCvYm6FG/yAn
         6hKLhBH3CM2dDvAbuWKAnmNciwrogxjNdhgmR4CYdnNs3QEbealqQWTIs6fY9u42hvg0
         gPK7sWtIq4JuD+n2Fa72XRKtBDv5yghZN5Uvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781184557; x=1781789357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPGWz3cznGuInRTRnQGJcIO5XyR+AVcuc/1CzNRiXmE=;
        b=sFVeyIoUM45yI5uheEYWLmv2L/pShiBI0wn13U7niX0wvxPyszZG7LGMXLVNFbX7hL
         NaeCYceqf2c7W6/+p1UqsNFQTrczmmBuE9UNW5A+WbjM2+rKFju90oHGg9QM0djoGiCq
         h1FSLyCCw85Z7UznL6InRd6m3Abb8N0e4ecIBDCnBYSgptGviknOWDSclSvFYt81fUIP
         MOv8XK4W9Ov0SXscNsb3NIT6s7Fqi2VhcIgZvDJ3z7yi9UgPTFYKB2+5nij0IknWBUFK
         VE8CQlm/o63Ojwk4bYuN1a9sjPI806qIs79B0TNvhdaC5tW1dJ8cVRCURxc+3ngdJX8D
         SADw==
X-Forwarded-Encrypted: i=1; AFNElJ/4TT2sf/t/ZEFcae5COufKxpPYZP6tCE6Hou3SN9Nuhtl7qA8tu7RyqaPIedqKeBYygSu76c6t68RK@lists.linux.dev
X-Gm-Message-State: AOJu0YwPDsnsylcUY7caa/jkLABf7BWoWeZaaRafHHsCp2DerxcI3BZD
	fej+x/hraiwdXdH466fw61emZJyjvXWtWuAT6g09Je7Jqw7vM66fdd8QXv9V85cJOXQf/2KRwns
	CFO1ko4Dmx0S2ROybya540nJJLZGqPsIUBg1X7Cll+w==
X-Gm-Gg: Acq92OHyYt30dvo6oqbcw/NiwMD88UVjet6vaFEzkXo+6dKgCQzX3ceMwtOAqyilGaM
	T9ekkqlRdFw6RDB/2RtvN6eP+E4mQHfxgJ6K8NHsY/MaTw20Qf+j8pExpsjC2POkEQAbHMS42DB
	PTT25KgaVMw/VbneUxsTuORIlW0KpwMdyjN2VShDRv95Bps3sc/zDBqWTiAHf4LWADfh8Aw5B6R
	mimN4bCEDpd122WF4Pw5NWGnN85fFkxP2mrR1FOd9+fUgJWrvWOXZVhfAXc92hiMrYXUx3/uO0/
	6yKgdR85BgYFg2vcidQJLjcfhnKjes7nBJNVH5YZJ7kiwlzEWiE=
X-Received: by 2002:a05:7300:5713:b0:304:c651:bdea with SMTP id
 5a478bee46e88-308049fb8abmr2089919eec.21.1781184556612; Thu, 11 Jun 2026
 06:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com>
 <aeb9c03a-0330-4e41-ad33-b884f00691a0@bsbernd.com> <CAJnrk1YPeeCSsQFjaFNROYcOdBO-kTovOTDkCigNKRt57JREJQ@mail.gmail.com>
 <6ecc45f5-4bce-4af2-bfe4-36c69e624b01@bsbernd.com> <CAJnrk1aS=3KwZ3LpiqcK=gKsj7oru-k-1Xpe2j5puDdmn+hjUA@mail.gmail.com>
 <CAJnrk1aacCbOWWWvW2xnQZ0a954-4shXdyO9LBn_Fv_dyUAWnw@mail.gmail.com>
 <CAJfpegtorFv9u2NCPA8v5OHiBUNT-XzUiw_y=7c3U3WEaXRUZA@mail.gmail.com> <CAJnrk1arYPY1u8_aiMfYUbmb9Oy4epRWJp_W7-hjAxQ_ggJn9w@mail.gmail.com>
In-Reply-To: <CAJnrk1arYPY1u8_aiMfYUbmb9Oy4epRWJp_W7-hjAxQ_ggJn9w@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 11 Jun 2026 15:29:03 +0200
X-Gm-Features: AVVi8CfklaUE7LhLHgGiO4bpP_0_0um1s_PoOKE1QSBjXabqzxjL-ZeHiapmt7M
Message-ID: <CAJfpegs7ttuzD14cnEeRBeDnw2E-5Dz=+xCEWVDRCKqMhDZ62A@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jun 2026 at 03:51, Joanne Koong <joannelkoong@gmail.com> wrote:

> a) I don't see a compelling use case for needing to dynamically
> add/remove individual buffers from an existing pool. If the server
> needs more or less capacity, adding/removing a whole pool or queue
> seems more practical. If we do eventually need single-buffer additions
> to an existing pool, that can still be layered on to contiguous pools
> (but removing buffers can't).

If server knows that it will want to remove individual buffers, it
will just have to register them as separate pools (containing a single
buffer), right?

Buffer pools are a more generic concept, hence they come with some
extra complexity and overhead.   But the interface should be a
superset of what individual buffers provide.

Am I missing something?

Thanks,
Miklos
