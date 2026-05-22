Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2B83CAA54
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 10:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446013; cv=pass; b=W19yA3YFyz+G27T+0hF/Z/VXPxfEsZABRrJiURmbs34V3WLpWUjpujGxwKQqYCalb9QWYj6YSFZTsGyVjjrtyh4SMXWsLjeNhh0h9Ki3xnI4v8TiKUFr8+r8RhOaXqqLQ4up/ylG2iQuoJdPXRlH/UhXmLNhtSq4a7g/LFfwPvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446013; c=relaxed/simple;
	bh=p/VdSGVbFrqiXAlT5Xg8uLbC62tLXxc2Jw0ObH3UOdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEVmii7nWrvmQ3JchsgrTkf1ucjiUrVNSUPpdm74VG8cZ+QW/4siAf9Yy0KDqurl0GJLMj5gdld8lmgJw5aAFnhfoi7b1FgWXPzZTATjLSQESlQAcXlGnLDI2E2r0M87sbiQhPrMsHSKDo+9i4KExLmetwReNFbMzkuX3+AYlVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=nkc/7m+0; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="nkc/7m+0"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51306c36c3eso79741051cf.0
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 03:33:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779446011; cv=none;
        d=google.com; s=arc-20240605;
        b=fmhJ6FiN/iKj8PFOHnoQxkjjajE9XDPRv5p3Sl30d6Ohd9XYV5S3fYB3xiSghlkKL5
         CNmErw8RIzzzHauaZuXhicvEtjb5mRWhTxVchL1ioYRDnQ0Ji3p148UJ/7wsovQTu/uj
         gG0vnI4veUwwGX3mpDANU3C4/jJcpLP7qwYCBnlRKPSE7w7LoqpEWot33KyKOgBBoq7G
         y5U4vboQviJJIks4GOIcxlS9vChfZVyhdOk0lTongoZ4PkMD4Tjk017Bw4TmxWDgrOfH
         QDxFph0jdh1NqJ7a+jSC32Dh6YuZ0minZj+yBpzw2wONJQ4q/ISiDmFTqXcXNHSKIk9q
         CtAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z14oYsmaJGUy2giC8LHYGQR/U/5uLW2ju6hEqc58FVM=;
        fh=NwpwGNH+fPlvqjD7Gf7Ov8U1h0QTRpr+TYBdZTTIw0w=;
        b=i3s7Uba164a1vgLujsfP5AKAYeyqASw4FD03blKZNjVY/bj7tjHfAHEJh+ifJsBrN7
         oO76OalNAfXl8hfZCpEKLXt8rW5gU1lUH9okrBaNyNVOmCTBkNP9AVJKQ3Wy6GoTeF6X
         M8ZXJd9Vh67Iz1UayiOXOq4daZL47YoP+dn1Sct+bAsrLfbFvTqW5Bc07SkV+Frshwzn
         zjEwcw+bRp4pAPsVclzZ8PjzFq/4Y1xkovlUPTWErcnlYzJbrgLJZ5zzaXylWSJaJBDC
         0LNs5mSSUvy9m4v0aRfwP9RMyby+IA0+rxvNC+jCICcqZgTkb35o6Q7Ol09HpYZKbEoN
         MJ+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1779446011; x=1780050811; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z14oYsmaJGUy2giC8LHYGQR/U/5uLW2ju6hEqc58FVM=;
        b=nkc/7m+02CtIZmRJRuh7PheGJ8hoICKvuxGTTR+dPuMBbaJBRCyqmIj2S3dZDbHWw8
         MtOHSXURWFE83f5ouVbHnp3xfDFJnl7K3kezHqWQU6xzWQVz+9HnOcomq0QfjVDr8Si6
         SWXUBKUammSghoPuQp0jIlX6vE8e2mdz+L+ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779446011; x=1780050811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z14oYsmaJGUy2giC8LHYGQR/U/5uLW2ju6hEqc58FVM=;
        b=c5lNmoQN8xpkWPt4HtMsLcVu8GNIMstsrDpSkH0E1BBhbt6EbDMTvi1iGy9mPvlcug
         dZpFE2gP419VnaWg8c9uA50mASSw3fT/HjPVSyx71Ud3rm0vC3a01w8i8wqXcTM68qH5
         Q44+v813iJTPa/cx4pAH+5xW5HM9ie6rI9HGAGPxuEQZHXQKs79dP7S2vE2XaMAcWnY7
         FEve9T4MNQ2WxGItNLDAvbpy4dD4jGermexqCUS1cOlyIsYHEjd20DDbnICyeQ6dVv3a
         prHTGdPxMiy//xoHnQUnr74+xqg6ORtGW4Tunv9VVDUbIJltkE1TSsitlxSw9tswcc8E
         SbbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9X+kIn289BuEPP0R51BuMq7jHOe7jqUtJ44nW7cZIPqv5cBxr9PHKHGijyaFKWu5IhV83ayx8EUiP2@lists.linux.dev
X-Gm-Message-State: AOJu0YzfqGpRDZstU3sQKsuz8/Gc3vOT4a+WEZkN60GVEpApjOJeF/Ek
	iAeUEePe5YZQvG5eFdOW3I/vauhgCyXin9FmPvLqlZDSJNY0tzPz3+RrXaH/D8XcAE5MLYMVVVF
	cVwuvJymbNXOxD66cSDZhRaOBD+Q8nGWgX4+mNkt/xQ==
X-Gm-Gg: Acq92OGtzfbcYhbW0NoCqTyiEv0C0hIF+b8USOsXy3GS+ER3FNevqmxIjYsqhCLge57
	euHWmCo9ECYJuAqKq228NeDFYDU2/vDfupZViodH24wwm8juvJs2/XKnLSJV81qvjkQipglL3E4
	M9fLiPoLusCenC7qn+TgVNvNzH5mGu2cmnxUNxjNtiRGs9Xf/2aYNpzDQdsbxSCp+Hi6gZsHs2U
	JotVqcAyAVRerDgmppoIhb9fYdVrF70MnoSikU2bHHICOWATNhOUNMU+8YOQLXmeLiZ2YMVDtI+
	uiDRtHfwsV2PFPZmNFzB+xkJ0RHilpRsTfFUJBU=
X-Received: by 2002:a05:622a:1a81:b0:516:3183:c1fc with SMTP id
 d75a77b69052e-516d43b30camr41920731cf.50.1779446011222; Fri, 22 May 2026
 03:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177922944800.2436629.7011047808676668088.stgit@frogsfrogsfrogs> <177922944844.2436629.11205124993260163523.stgit@frogsfrogsfrogs>
In-Reply-To: <177922944844.2436629.11205124993260163523.stgit@frogsfrogsfrogs>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 22 May 2026 12:33:20 +0200
X-Gm-Features: AVHnY4L7xM_lm5a7sVX1WwSJTsMcU54KLYfEIl-hzIah71ML5fCtCjdZE6197HA
Message-ID: <CAJfpegtZ17FOj0QB2aJCiqt8Bx=CeA+i8Tvx1BhuPJFDVyUegQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] fuse: move the passthrough-specific code back to passthrough.c
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, neal@gompa.dev, bernd@bsbernd.com, 
	joannelkoong@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 May 2026 at 00:25, Darrick J. Wong <djwong@kernel.org> wrote:

> +#define FUSE_BACKING_TYPE_MASK         (0xFF)
> +#define FUSE_BACKING_TYPE_PASSTHROUGH  (0)
> +#define FUSE_BACKING_MAX_TYPE          (FUSE_BACKING_TYPE_PASSTHROUGH)
> +
> +#define FUSE_BACKING_FLAGS_ALL         (FUSE_BACKING_TYPE_MASK)
> +

Please drop the last two defines.  The _MAX and _ALL style
non-constants are essentially an automatic API breaker.  There's no
sane use for them, and insane ones WILL get broken when they change.

Thanks,
Miklos
