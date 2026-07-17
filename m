Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADDA391845
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280776; cv=pass; b=ui5lk8Op/OPJIfX3BmFeGeJMstR3UBI4JipaAPIboWuIE0va/Spfz3x/gw03YgIFqZPYEojO2jW+F455MJcxorSy6BbDD0ts3KaG2MaCwN2SiFau6HeWlj2O72NGNs5GteRRM151nXmEVeMpMBIwtClDWct7oULInOTYKtlKuJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280776; c=relaxed/simple;
	bh=EOcoM3NVJxyoUJKMiuYL7XV3Isk90eFpxl6BkeBiY+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMUt5gd9P/ToS6VESh1TRdH+gSDY1kTnyaI6EMrUdDN5hxt3kwoj8I3sCR7DRJfFDTjJxdUYmvPHwoYI6blLaf56rbsAFfaV0Cxpb7ML5qYI3TS1Ruupw1zyJc/GFh5KRyd0ZAEIfkSL05qsbokh/DTLkXUUgYjd34fAnHDYCAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=l545UBqe; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="l545UBqe"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51bfa429aa6so8724591cf.0
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 02:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784280773; cv=none;
        d=google.com; s=arc-20260327;
        b=N6hNbL1KnKyUopvk1eBJQlKgyUZuMH28h9XopHQmsb94MNQKzennLb9TFM581yzh2C
         E7fo2mm3MufZ8+aePJ31O4Eba6h+lzJBaa9psdMOdINrdNUpWU6VDVFC/z/tBeClY97w
         w27pagakgc9cKqc9fCoDUFe1QeW4lrKS4fNHXSu6dVpPe4tE4Z/gtwjPrmZ72CaQ4+Cy
         WUcfcfK1VrbB/VbDz9khDMvR3Q7iTl/n62pgEfeFdGotSApHv/wqNA6evXIRN/mKqAQS
         40GL8aEkvDF35s8q6nP7tqtcb28upkGO2mfVQT6gb2U1YOUp1bfnjoH/QwbU6+ZpikyT
         12CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Br2rAChfq5LxgdYoEAnojNMavSxSyNWgCgnaRat0FcM=;
        fh=/EqMhjG1Isgke6IPK1UW0gXVeIYUbpCcPOVrEi48M8c=;
        b=ELxPlY5NySrks1inHVISsiCzTqki+GqjvedXEiOdgxpkk+pE7p5BRaLyabY6e6DSJL
         gwQDfmBvY7SNOjVZo/hRlFnxozSABauOQ4a5I6qwBaj8b+ts6+SDuHoBLKkZ5BBe+rxS
         Yj5EjiwgYqZSiByRZpDY4YcMcEnWrPgtw8gaQOJHGA2ResOomaSGSLa8iWMTA7I3jK8Y
         wnK61eLmd8P/EHQjfsWl+oJ2oS5B+e2dtfG+EjcavhJ3MFQZmqMVuQXBAxPbr/V1LQgT
         uYRyo70bIm9BJyRSz+K0a9g4Ob8DgKLjuytcu4Oku9/ucBKa1nxFD57AO30/n27QqBg1
         RpMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784280773; x=1784885573; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Br2rAChfq5LxgdYoEAnojNMavSxSyNWgCgnaRat0FcM=;
        b=l545UBqegJqO/D54jqTd0y/AVM/DdIXapmwpcJBV2wJT3ETmVWxJI5n/QFBJ3E/o3H
         R/vLzWnmck7m4TwzmEmGYbB8xqU8Rt7bXwZ4QEP8BShTtmPpLuxfOCf4Z0znlOoyRA1u
         P7UfEfE1bXs8qjKkhNhh+haRshA5y07QsGZpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784280773; x=1784885573;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Br2rAChfq5LxgdYoEAnojNMavSxSyNWgCgnaRat0FcM=;
        b=BTwOzdrUqVWQnLunSLrCz+f8rMMgdd3LmSpYFgYW/NUvGck1mprjkukGL8s+mUL3wM
         z542neWP+q123dIP+c8ek7rogflSmCtn3Xb61K0ujr6uP83AUAvHIqeuAaiZO6c5s39e
         u0MjcndJu+ZbPv8/AT20wwpysOYMvRbQVmJ1i3c67dNNWLW7rEgDrAwNUwE1BSI5VBgd
         cRKhriTlXjJRs17hW5iKmo0RQl8/5h9vyZGF6Jd62nN71J6T5NIKgNZvGavWeunpIm7Z
         aVaBkuPsRPYVsDMnz6ulzzsMa4vCmt5WGibcKt83CQkrz/VCx8V3OhefNv1zo8Xtvc1o
         2w4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpzrE7BqnlJyLEaI3FMs9CRCfypGZiWldOc0/q6RHif8wLI/mLLeoz0mfZllJ9cAqMubJx0Hlup3unX@lists.linux.dev
X-Gm-Message-State: AOJu0YyevDo/sO6lhdrLVO03A+IGAwDxlCwp0kOHofVPxqmhgsrzEKqQ
	VvrcYUPnyvtIrFmoqXWQpwvDkJ2x/MBUm1BFl/OxCEpZaEDU/BsBfU8MoKbJjA2XvHtqm5TV6ha
	//YBMDo+4Ud8RfbzYGv+cp3SVZDhEJCpzhPfmQ/yEmg==
X-Gm-Gg: AfdE7cnki9kYXK8lVY+VtTqm8gTYSm4XYh4CHgWoH7PU4x34DVL6gm/3VA1NATqLARZ
	vcKthzajmAKdS/BK/ioK/ATFcYYwk8ZAlz9mTXcjWQtxUnOMNLjqImz0A0j3ZAUVLeHbwH2MuG/
	tgr9foORmPj8CqKylV9FISmcP0qJf2bAytBPrvwdPeAJmYkzgCR9XmeQkBQzcmlw4WyLvvuJh6r
	+N2xUGqjMOuIMn4fCFPnfe2nrr8iGdr6f6/mS+jrZhE44gkar6Uit3mtu5ox3MjY+3Wr6w4N745
	B7+tF3PrebC5lEQ=
X-Received: by 2002:ac8:7f8b:0:b0:517:5f04:f23f with SMTP id
 d75a77b69052e-521298a8a73mr16412201cf.4.1784280773369; Fri, 17 Jul 2026
 02:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com> <20260716175908.2339738-2-joannelkoong@gmail.com>
In-Reply-To: <20260716175908.2339738-2-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 17 Jul 2026 11:32:42 +0200
X-Gm-Features: AUfX_mwTDUoDcJfEO7khi5zy09C8QU-gv9h0evyLHT1GQLJGwMuxuV2425kM3UM
Message-ID: <CAJfpegsNb=1P7Vh+DVfg3Ve9T8ggHxi1Y-ZhqiQ6R1bbnCTHGA@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] fuse: decouple fuse_ring creation from ent registration
To: Joanne Koong <joannelkoong@gmail.com>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk, 
	bernd@bsbernd.com, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2026 at 19:59, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> Currently, the connection's fuse_ring is created lazily on the first
> FUSE_IO_URING_CMD_REGISTER command. A server registers entries from one
> thread per queue (one per CPU) and those threads issue their first
> REGISTER command concurrently. They then race to create the single
> per-connection fuse_ring, which required open-coded handling in
> fuse_uring_create() to detect and protect against concurrent creations.
>
> Decouple fuse_ring creation from ent registration and move it to
> FUSE_INIT reply processing after a server has negotiated and set
> FUSE_OVER_IO_URING. The ring is published before the connection is
> marked initialized. fuse_uring_register() no longer creates the ring and
> it instead uses the ring set up at init time.

What about if the fuse ring is not yet set up?  Should
fuse_uring_register() wait in that case?

Thanks,
Miklos
