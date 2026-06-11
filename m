Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7166C3D47A7
	for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 12:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179682; cv=pass; b=iKcuzQX27mqFNHl0OjuTQwceBwF2fF/nrBwFPfMvnDTIO/KBSEcSyVrK41/0a3y54FpjLv72ZblUVDjoHUMwXn8e+q3TALolLANaDQ/wi4NmeXbYgOHEbAWUZa9ANXMe0aj5oGBFQXN7y3i+WRAKStjH/1BkbT+dWv74wMooFH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179682; c=relaxed/simple;
	bh=/P8nFKpxhWOszwhxueixiWkiXnumuLDuJjue/EZMayQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqzr2q9YpFQZesI8d25/xAzU7dTTR3q7tKv3NZuFEmyPt2rXdaIIL112epitc4VjXsF+gShZB8WjoRCnvlQ7IyW3cFYfaGdbDaIMzWtmOdCGVnv4M3+SPaco/TJZwZkGJAFZFJVKZ2GH6l68O5r3MTX7WKdqFHV8VufXP9sqcEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=a/Dx+rJh; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="a/Dx+rJh"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ccf887de87so90456386d6.0
        for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 05:08:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781179680; cv=none;
        d=google.com; s=arc-20240605;
        b=aAMI/iJcEWueOzUjJAEQiZu6Mt5jOgz1NiW8+qcw/BTxnxJQbpl/8mcZN1tLmAywL9
         m/JXcc0tgJnWVi3Ayg3xKMvmd8Z094vLJEgiStXxwsViTaJgNjPhbzh9qGor0bSMqR4J
         YjtehpOP1JxqHsou43th+TTk/ZKkhr/mZkYyKnCqR2wY5oqCQ4htsbxvcfsf11g+KY+w
         5mF7ExLSpxaXpzifLpdnWsbFahL25T2hbQ7y3jJP9T54Ju+f3vlKzMLF2d1Fj1eXlIRb
         lNfE1+yuQ3Q7zL1whXfb5e8id5Zq5PRPqVcob42/OtcJof5rXZwxVFni8xGgWwmEXHqE
         l6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hN/3MpeRcR8UHLvNFNG42pSKZbaSuvUm5X5dqiUjdTg=;
        fh=a9E2LUtWhjfr66N6R8xiVlvsuphQJlaQoO989uJ90kw=;
        b=XfLeCqoGMucrGJfsj/XyIpH2Sy690S7AWQ335ToUMiTAJVA9WCakpgZid/+a3RKDuU
         9xbDWOAvgxP0oX7hgRzcgFYL0ZlWsvoknvzgFBfXd9/PT23VKKySqC59z1dnyR+2Ur6S
         W8NIVEXDwXNTo1ODYkJLGi5+FZC70Wd93Pe7t29eCWRp0lZRwCKe6MRYj4xTecGAc6vu
         shROv+B1IGXlR3KgiMQRx3A8sxf6eFDtYDWc/WU8iwwNQ/8/rhQ1sHw9m3eIMXtgfX5G
         aiYxdE1C4qw7gDrQ8jihtRrJ8Mpx+z4czUVupp683AldWlJ0acA2dakzQCwIGYtOBdjl
         913w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781179680; x=1781784480; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hN/3MpeRcR8UHLvNFNG42pSKZbaSuvUm5X5dqiUjdTg=;
        b=a/Dx+rJhdzBGPRM6DF0OsxhMztuaiDWopPbYfbQx9FUmpn4h5BRkPzLNvUx8I9jMM0
         DePHwyOEnUPyKYSLR5AxMbZ1eaxwRG6fPBuyHn9ozVcrCUMD2U7Uk7dj9C6zT8UAvkC4
         7VsLS71hC83KLFOsqmpkAzMR9Ojeoeeyir4Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179680; x=1781784480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hN/3MpeRcR8UHLvNFNG42pSKZbaSuvUm5X5dqiUjdTg=;
        b=NLzNdooodPDCDpXmb5k5F3K+rnQHjBuJaVPEf1oIYn6QNnC9EvKS6BLaX70IGzTwFG
         UK/f+83I6Nnya6fl8H0Mm23FQZOg1i8C4zVmquG/lYJao/qZugWQNkjTceF3EX/t1QWK
         f8Mzn5wtzJMi9xvtPRMandpSiQ1IjEAruu1chIvT5SCrXsq9WV1bQEdGisnqteahhR1p
         1nfjHJ3+75rORj3kMFBiGoZcBvMLpet502k+leyBMh6AeOSQRoQL2Q9cWN6xFM3FVp5r
         Wmk51nhKEcgDuQfLDx9suxlqTZu9IU+2zbMOmq5ojWnWsTcOQkpSoBcntyITgk20vO32
         2+BA==
X-Gm-Message-State: AOJu0YwTrvFVo49/U3Oc5em1joESh9JQb73V3Rj+vsoiGFC0QEinC+lQ
	hJxQPCoeWvurtq0hlLu7VLQz9ruvZAjCAbXFWGlG1g6x6IJ7PIjVSQ9beBQOquBlSMlteC0ksjO
	cUUD9X+ScxwS1YOu7OmhHHck7aiN4dRVkuPR30t0B4A==
X-Gm-Gg: Acq92OHdFdPeeZZCqubfWV9dVB1rp3PlotqyWl19jwQdCQoR5vVyAZG+VDWOYDoVfry
	+PFb+AXHMH+KfO7sMrvBjIC9EA0K+7M0dIBYLEYJWHgrWR04VBWkm9QtM/7me+8uZW2ZyiY8W6I
	GK3v1TITvpBPypkLE73LXKTrqTYYtN1OOJ2aPOWRy1/bczj19QfUFa8/+lMjvaIXSj8gwXIzGb4
	nBYq9stAUNh2q1HmxyaKovifZ3G7/bAPPTNy3ygeEUDCLoFWUsd09FzkV5VLx1CszHb4dU5VUmv
	7Tj4Y+uJK9s8OLzPTCVBHTTE5DuAD3qERSvssVzUjBbeWIes/q4=
X-Received: by 2002:ac8:6f15:0:b0:517:8da1:4d5 with SMTP id
 d75a77b69052e-517ee1cf948mr37029691cf.27.1781179680264; Thu, 11 Jun 2026
 05:08:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331223927.763741-1-quark@lihdd.net> <20260515001412.1270472-1-quark@lihdd.net>
In-Reply-To: <20260515001412.1270472-1-quark@lihdd.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 11 Jun 2026 14:07:48 +0200
X-Gm-Features: AVVi8CerOqPkAPYtqPMF9WmIG0OuAsUv7ffSLLdcojPVMoXJs8A6-drcZPwaSxM
Message-ID: <CAJfpeguO58-TR8DyDP07Vc7MxsxXz9F-S9YNarfgCo10-xcHLw@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: invalidate readdir cache on epoch bump
To: Jun Wu <quark@lihdd.net>
Cc: fuse-devel@lists.linux.dev, luis@igalia.com, Jun Wu <quark@meta.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 May 2026 at 02:14, Jun Wu <quark@lihdd.net> wrote:
>
> From: Jun Wu <quark@meta.com>
>
> FUSE_NOTIFY_INC_EPOCH invalidates dentries, but does not invalidate cached
> readdir results. A process with cwd inside a FUSE mount can therefore
> observe stale readdir(".") output after an epoch bump.
>
> Fix this by recording epoch in the readdir cache and checking it on reuse.
>
> Minimal reproducer:
>
> - mount a tiny FUSE fs with an empty root directory
> - on opendir, enable fi->cache_readdir and fi->keep_cache
> - chdir into the mount and call readdir(".") to populate readdir cache
> - make the FUSE server report one file in the root directory
> - send only FUSE_NOTIFY_INC_EPOCH
> - call readdir(".") again; before this change it stays stale, after this
>   change it sees the new file
>
> Fixes: 2396356a945b ("fuse: add more control over cache invalidation behaviour")
> Signed-off-by: Jun Wu <quark@meta.com>

Applied, thanks.

Miklos
