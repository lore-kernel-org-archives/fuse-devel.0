Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CDA3C81B5
	for <fuse-devel@lists.linux.dev>; Wed,  1 Jul 2026 19:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782933430; cv=pass; b=q6XaHXn+6Opm/0sghRub16yb9U7oKezPAM03md0BQPzqahKOhfzy72L7YZByl42SkT8gRJEM0aiBLqBtchrweR1gugImCUi4bX5P+2kLcw8AGIbPPq9w2qw8kPHHkp8aVJHvi2UL5W+RmrW66OLsV/P/KbiA2n761gAmaDVXWqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782933430; c=relaxed/simple;
	bh=r+NletA3FmRDG/GD5IvXS5VhekYurTM15nt1C3iy2LU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0l88xdFPocaIlnGRFQUFyPfACkgaLb2ZYzayMqaTHFE6Ff8V8kIOu/f4AyzyRjDZQP59Rnx2HlgvNbmQMnQC70JsKIGN8NAqBhZDSH6H+nZHav5rXOPtLEPGCJ+gy12y9HT4/eh5F85a24CxTbHbLcJrNzRfPNInLUPS22kHNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=opqq9qRu; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="opqq9qRu"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-44aeefa1c00so752558fac.0
        for <fuse-devel@lists.linux.dev>; Wed, 01 Jul 2026 12:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782933428; cv=none;
        d=google.com; s=arc-20260327;
        b=dwO5Q3m0cRb32LDV/kWfugCApAth1oPAa3UYtOQXXFtPP7gJLYOoYvCKJXQleCJQJ2
         KxS8DrLAi9yTuxGCHqBIGW54qfQzEc2cCSHMcVLrR3UNBkb1A6GsE3VVvkWWdzeOSS6p
         QbYkZZpRG6wVQL10PnjwWYqKCXGtXeTY35lDnysUOUqk6m7g71zjSSn+OlRXCZ3XwyYx
         fIOlbnQzPZWLis/T9TgzOoNu1L+hSJ9CeJrokVoo/kIW3EbJFWjnZeDekd0LsfqMvZAl
         R4O2p0XrNowPyw2fSBw+tTDNE1d1wFICDd0qmKhMjxEhpsXqNBVzEJs5pxL7vul8klWy
         LLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r+NletA3FmRDG/GD5IvXS5VhekYurTM15nt1C3iy2LU=;
        fh=y+kNHygKoQ1Z1eZvN+ucIY3t+/6Soz26Mvn6vwwyujE=;
        b=qjDdFYR/xy+dbc3Gb1m9QN3RtYYnuc1YtCg+uwL2NmWkLPxCwB+JEIs0mTxW9jVcQb
         UaIu3QMp+fo07i45QqHeKpk+1Axud0T/u/9AypLpCrpj7MQ3MTOEY6tMGCo6M9se8ONV
         0lWm2dOUUpbyWKk91gVNrehxRf9sqGrNRTwDlXvFLHUcYknxPhwgHztiYIfwFhHopbdu
         je2GrZxIq2D42DLTtAMAtWWiCBflpVAlJ7Jh3wEFNpNhG6LVGIckHSJjX9cv+FDjhVcs
         o45iw6sRg061vqxtoOTLNQDc2DOXC8E7fDuj725IRJMFgvYjAQYZGWR/V70Ub5G2PDGC
         ptnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782933428; x=1783538228; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+NletA3FmRDG/GD5IvXS5VhekYurTM15nt1C3iy2LU=;
        b=opqq9qRut9Uo+inVjyj9+ZsJzF3gGLKQtPhPG8faBNay+c1dl7VRTsUKC3duhEHSBw
         +wzsHoE/33UkHbrgfxucL7bPWzciUHL9GKHiBJbGMdjmwm101xSSDN682bWnPXi6zhNw
         w2STiXNDadeZDV9NnuI/1pRXk+N5OBlTAgqR1rzkYIX5QJvQGslzfDD9JVlI6OpIs6Ss
         cLYnHYKdNxuUWWDS8lz8D0ASSwhvaYih7LXKTyi3XJNYfB5VYwDSbUizSOBdJWS71gF3
         3CmzzRNaWcCqyIs3+688z4YsL6zhLc6hfF06dEPWO3Vrvzd7THUvSuV/JrcR8VQqbro8
         9PMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782933428; x=1783538228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+NletA3FmRDG/GD5IvXS5VhekYurTM15nt1C3iy2LU=;
        b=B8j1NQm+uEoJvT3kqW+ek4B+KmycAFEQ/kH4cWsApV7qa9EMIZdl3tykA0J9uXROUZ
         QQa+12rWkce38/pO+n1UyTRxG2vyfg70Fd7OQQa1GSGmL9MIkuuvRTmPmFJPhgzcsTfk
         zne+MSj21R/jULZU2Fw2DQoVWX067nVyzkUxPw9yqgVrLwBBJmhm4boZG3T1qgGlYCSj
         Smlek+TPnBUNyG2LATQrgWSsQwfkGxlzK4GsFpDk3Bt7kNaxFNpFn+cY5/SfZ1q6/PEa
         Nhrbj81JMWTz8+5QvAro8ZusIPvNJSgrTsaiEdqp0iGo/sIZp3wkimiJYeoog0YPoRfD
         kf2Q==
X-Forwarded-Encrypted: i=1; AHgh+RorCwkxSs94tn/8u5UBH0InXEhPz0QpgPI4U8l8GZwC117R+eqfxcfHqPBZaW8rKhRtbYnmXgEte3Rk@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3lydYk6WnuoU2mA69sZKRwnh0tZeTYjXf0yVnneKMbzGlW811
	ns+R/cqqCRQjqjiPyspqOv5/OWotgkRFCWuGgdT62xEC7/IwK+KwaQwwUkTg+2SaVPjRUUo/cLh
	z/VZCzMIgspYrAlKwbtFMdaJ4KaznRQE=
X-Gm-Gg: AfdE7clkM2KM6xB58je0dpD189oisTDdvLR5YPr6tzZdjDeOzDU6R8CLghx0YsuSNnv
	UbNzdDVgQNR/Z/HUID7hMMnSpGJMNia/xZ/Uxs3vG1o+6l2riYFnGDfnNzW5k0SC2ygZb+tFRUH
	eL7ga0XCKc7P5C963DHhEoX70GDCmqNslWookXmDpG0cMoqQis4vLt6CyVO+t6xJ56I+Ot0b/ON
	CAwZEnefhWK3fyq7WxzU2sVY64ZtpZZ14zhuWajjmdls0pMWbvngI9uJeJnq4T6DxhuvX8=
X-Received: by 2002:a05:6871:c8c7:b0:439:ecb3:52bb with SMTP id
 586e51a60fabf-44ae2b77260mr4418100fac.2.1782933428320; Wed, 01 Jul 2026
 12:17:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <89ea76b3-e956-4232-8180-ee3929adf905@kernel.org>
 <20260625101132.3859505-1-safinaskar@gmail.com> <63f7860c-4f5c-4682-8914-27978b9fbfe1@kernel.org>
 <20260629-bauland-knabbern-abgeladen-c0acbfa62cc2@brauner> <CAPnZJGAJROqfCWSeeBu31HsE6nmgxVqHTNeC554S5y1Y-VN19w@mail.gmail.com>
In-Reply-To: <CAPnZJGAJROqfCWSeeBu31HsE6nmgxVqHTNeC554S5y1Y-VN19w@mail.gmail.com>
From: Andrei Vagin <avagin@gmail.com>
Date: Wed, 1 Jul 2026 12:16:55 -0700
X-Gm-Features: AVVi8Cfr-c-MwbiVa4Na7Gy64V9E0QAPHBSr0wHsSXCEVpPyigPKnVtNTDOprcQ
Message-ID: <CANaxB-wewdUnxApVU3yn7hqbztNJFQfN6Y8r_XZk-TZRXpOQ=w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] vmsplice: fix some problems in my previous
 vmsplice patchset
To: Askar Safin <safinaskar@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org, 
	axboe@kernel.dk, collin.funk1@gmail.com, david.laight.linux@gmail.com, 
	dhowells@redhat.com, fuse-devel@lists.linux.dev, hch@infradead.org, 
	jack@suse.cz, joannelkoong@gmail.com, kernel@infinite-source.de, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@amacapital.net, 
	metze@samba.org, miklos@szeredi.hu, netdev@vger.kernel.org, 
	patches@lists.linux.dev, pfalcato@suse.de, torvalds@linux-foundation.org, 
	val@packett.cool, viro@zeniv.linux.org.uk, w@1wt.eu, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 9:01=E2=80=AFPM Askar Safin <safinaskar@gmail.com> =
wrote:
>
> On Mon, Jun 29, 2026 at 11:56=E2=80=AFAM Christian Brauner <brauner@kerne=
l.org> wrote:
> > The amount of regression reports that we got in short succession doesn'=
t
> > make it likely that we can merge a plain degradation.
>
> Let me repeat: this v2 patchset fixes all regressions found so far,
> except for major CRIU performance regression

Askar,

As previously mentioned, this isn't just a major performance issue for
CRIU; it completely breaks the current pre-dump implementation.

The other proposed fixes look like workarounds that target specific
projects. Since few projects run tests on linux-next kernels, we should
expect more projects to be affected by these changes.

Thanks,
Andrei
