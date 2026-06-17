Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD03EEA8
	for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 12:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700778; cv=pass; b=N9dOC29Qq2t4mjTcqubRLH5yKKMO7tpyVO1/6+YsSnwz/olp7XfD8FS2ANescOlEarE9sB2oLc037GIBn4WhI76x3OYiQHoQdDcvf0/FNzpbtygtiKZbqqoaoY5pskDzhNgGVMOJWZm7+zdontyjoHk47BB+hzOrLP31FoKenG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700778; c=relaxed/simple;
	bh=lApNkgSPZBA2Ow+mLhzwj9hvwrTgNOdIXzY0l0PYTBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kg60ubsU5mIxtNyZ68WdmG7qkK9oQdbXzi3x3cr+2FcfET4RKKKYJyNKlAQAgig/gIFs2m+fdizPLL+FYiC75Z4q8B0379PDejk9Fygi+uQqwheI7cvsL8iuiYRTtzLPIMn3bxSUeZsr9ZbTvDlkUK3m6znKKSyM+11nZlrRW/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=gio/HZlG; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="gio/HZlG"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5178a42caa3so8721701cf.1
        for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 05:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781700776; cv=none;
        d=google.com; s=arc-20240605;
        b=D6Zf8FdR1hNGY+9uijGIf7V3fH9+zMi4UBV9o8w01FgYJO8HSZXaMYc2wgUF6oCQwa
         GSNViZ3TiN2LfCXvyjkU00Yu401uwAI665MyL5oH6Gx6L1licxGGtObK1pVpI1SB5fGp
         /Sc231lyftbft1tuUAfvhV1Td0YKJIGPPjOVk+b7A8XC3YVHpTolKo8RBMU7Oo0e8dNj
         oxp3hmAcD+g1QkSROMf2EjOKh9qgBtOFHBXm9jJl6jecsgF5O5vvR02Flyjn3uUWTP17
         sNRO3hF9yLWgMWy99jVptn/fJTe/z01EcXpSHPQ68tL5PTfq4jwytTdu3lEtYqITwq+T
         fR2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hR94ABTLCGuLqmAmIGRCmzZZMZM4+w5Oiluj9ZDXVPY=;
        fh=w2Dy9MBCymTAHXuuQoFoyTRhGtZ+o5YcX5Bg6rpudfc=;
        b=LuIOV+6ss4+64fjbLVfqdcvW951MbCSXnv8p4ujmx7uoXDCdXvlkHRKCfV709CetOJ
         8Tn5tISJBphL+2NKJC1WrVL6Xm6VOeKj94Z9YzpTMLBTp7qQm6XnyiWg2x3CJPmdrASa
         CC1StY/6+ZMn/rG3Tg6tw1twWrDt6pTojPDusS23SYJSbZg7vGiXhyzHQEVGYqO8VlIZ
         H3J2g+LUbS2iE54zeevS2eeaJCgYkDbe0H+tzgNVdbKawfFMPVralENkGwfWSas1FKaM
         zsmzaVM9g1OnDXsE3FJ84MyclY0SxbmgXUOBlkZu1zQi/btkZLkviIb9KagKFa7EMV7b
         DSbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781700776; x=1782305576; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hR94ABTLCGuLqmAmIGRCmzZZMZM4+w5Oiluj9ZDXVPY=;
        b=gio/HZlGCaSxI3KcO9ZYSWp72fYwcCyHYMNYL2sWldAFPsLzWtcfVyEL3jiHkZQ1Yl
         K+a2VpotwUwYueBfJ5+AWQt0fkH3umJyyx2MOkWQAgmpv/TLvkBmJ/a8i4+9L0gd6KvL
         KWlGdAtWRHPQzGI9H7DDQE18F0iGL4lbV672s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700776; x=1782305576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hR94ABTLCGuLqmAmIGRCmzZZMZM4+w5Oiluj9ZDXVPY=;
        b=mDgzWx22WAxyaQN4PTq6DNntkA7as3Tcb4VRtf2IBp+p83Tpyn4ZaY38PvG72fP2sm
         ViLMYunH6YSrPktfTifkVRU/OROj+qCa9+SFygj3ZNzAQYVrpmamFn82nfyydoMdwLAr
         Qofqr7vNTHtdS03wQRPgNKDQoWCxg/cMMBM4ZlDvvzDC5pd3yrXvEsrPeDpkCQ+lOk70
         QAwkvUyNeYwTQqAotGrTV4HAEKO5BXpJx5mQu2S1dlqvd2YvWQNMeVUoyDO+pR3DafX/
         CZybakpw7cgzBGnp/L48YqIdYR0Y8cHhT3RJysv27PX8pny6RpMEjMZrVKwXDGMlVLUP
         f83g==
X-Gm-Message-State: AOJu0Yw8hO7QJDylCgPQtpGk68RUcFhafSa919yq9ktZXLIagAp5rmT/
	ssz/mD2Dja5ZmwPRacRoaspITAbSKMcs86JxBVpJdhUQP1Uv7oXiZ3IVDRGdzrZaY5ymM2kZ74v
	aM3BZF64H6q/BP5k7bXU7a0lj6DKZjuJYxgYPc85jnQ==
X-Gm-Gg: Acq92OHk53sTINXtKf6xI4lnKEMIcV97C4/+R0c4tM8CuJtpAee/XMOt+lBTcBKOkip
	wkSEAotPDovZf1sZdqtgQ59k3lHcxMFZmYu5FYn2DBK+qv6DFggrgFxrLU/IPtzcEZDAvgkVEQ2
	k91H4czdm8o4aKXI69v3tYchO7Co/w9m39kedAZlXpEOAE2hLODP4auTTbfwo1JPkIhCque986X
	F3rzUl+24Z8kc4qc0YPPtHy4zz6EUEmksms3vjueqRsGXX3bVFDgiExWjiK1aTNQOe1Z3aHrJd2
	WwjV6D9qAldUnrDEB9mBvSMYS8s=
X-Received: by 2002:a05:622a:5790:b0:50d:7ca3:379a with SMTP id
 d75a77b69052e-519aceb674cmr32597091cf.3.1781700775960; Wed, 17 Jun 2026
 05:52:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-10-joannelkoong@gmail.com> <CAJfpegs+EY+eCDOkBgVWhUyd8hBLE3bFY2oaum-k_tS=Cv2SVQ@mail.gmail.com>
 <CAJnrk1YiUn3JFZCEe5oADyK5+zx6Rh_6KTZbCzeHUjAebUVQBw@mail.gmail.com>
 <CAJfpegvokfiN4b1tEd+fAPfO8n9hSQKeXt6-UM1OzxwHYA5-hw@mail.gmail.com>
 <CAJnrk1ZTOcAP85qYpFz6w2TPBK+WMdT1B01T5O_gL68BYAOvCQ@mail.gmail.com>
 <CAJfpegsixwxHLTMhz6uH=ssvETM4zZOS24x5qUM8fvBHTE7Zrg@mail.gmail.com> <CAJnrk1afks6eorKTSm__CBMhPcg8v1Cf0gFPVnFDWmfBKMBaew@mail.gmail.com>
In-Reply-To: <CAJnrk1afks6eorKTSm__CBMhPcg8v1Cf0gFPVnFDWmfBKMBaew@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 17 Jun 2026 14:52:45 +0200
X-Gm-Features: AVVi8CcI94VBmnYiSYZdIo794k7Lqf2DN5b--zyAJHSaOgz9GubxMe1GL3NtDog
Message-ID: <CAJfpegtzu-M7+u29_Ck1hGHxDQiQPiz1uqOBs_QkCjSGtjMm9Q@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] fuse: add zero-copy over io-uring
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jun 2026 at 14:17, Joanne Koong <joannelkoong@gmail.com> wrote:

> For plain (non-zero-copied) registered buffers, the fuse server would
> still need to pass in the starting address of the buffer pool, so I

Why?  The kernel couldn't care less about the userspace address at
that point, it's literally just using the stored and supplied uaddr's
to calculate the offset into the buffer.

Adding a flag to the _FIXED op to indicate that the offset is being
supplied in place of the address should allow unconditionally passing
the offset to these ops.

Thanks,
Miklos
