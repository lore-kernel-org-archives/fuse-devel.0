Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031F336680E
	for <fuse-devel@lists.linux.dev>; Tue, 21 Jul 2026 13:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640817; cv=pass; b=crE5/lbQh0m7WM40DR37FQDQrvV59Oz0oZx2fqop7/S4TnUHDZ6UFuFGhOshKeztxjsOJfxTma4LsY/2cK57S2NN0DYT6g5esFr57kWumUsqvUyutfmSVK/P1h6nhaPKDz5V5vqzHrehnZhv9FxFtTfc1HkOIPQHlOmcRB1h0Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640817; c=relaxed/simple;
	bh=rNzrvZM88XZhJ/ibbATDgXG7xLkMNA1yYRwnbou2tjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfhbqIdxgmiGAC5A9NqAFaDaHrMaG6E3JCy8uf7o7akfkqKLproK5Z/HwRsv2WXeWXlXv24E+nPFuzdBet1HwMv5PUWQ/mpC0YTwhhxR87DYUqRHvCmx8ZF/jBBBUpsVEEWwDFXuPjqtjbH/aL3ScpDkAvpkVFtFOy9+ksp5blw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qcjiewOH; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcjiewOH"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba320so11192077a12.1
        for <fuse-devel@lists.linux.dev>; Tue, 21 Jul 2026 06:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784640814; cv=none;
        d=google.com; s=arc-20260327;
        b=qToNx9JoVFWXOTFV+kRoy4jWh9Z8HX3eQoTND91nJnGwHHiwEo7qyW/qCxxXUY4AgU
         FmLBRRoRFg/k6KcJdrbLdjJNYs2UygyhjA1P2Z9sZJQebA5DVZHjhdC9zSU6igvsQKt4
         0ksAqyvnDkVIRjSk6dC10eFie8BQnB29yUKM5xaCMChRiz63xmP4C38GWsi69p69ClvT
         OxtEHZMBkhOrWSWlfHXkrdaxvMcESs5mhIjgL2DiB/3BGrCMqPeGf+1W+KCWnBWpP008
         7bxSjFtRvRUCVPPfU33ybHHCl/lvQNEV3xGa/L5e4zk1dJi1IGLLFMp14pwcyUecoc2l
         ZKXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f1XXWrkonfhWp4x9b+npN+8YhmLz2dbbZnMxAHV6hr4=;
        fh=WCoosAIv2x6VcIHDaq18Rr9yVFRp8rYcuDvvYzFBup8=;
        b=JJe4D55vG19d2MvtqP6zsypz96oJ5SBY7wqZupx3JalVlxCwfjMOjcETigBopJAEYx
         gRbqabAIkt9rfMxW3WOaaeX2Pre4V0mzgfhAJ1ncG+cztR6oaMSwYglkFQ/UFYmg8JKq
         z2J/YO8fzowo8EXF03uEFqLbjAorBlL92ilaSxyUUJy//rLKzjwTENen/bIJk7vwAPmJ
         T9xEC0ui8UppgCKztMNxOjEbSJ3RWDbax26FMYdaqxJwGfKlu6Nji077Woj86aES3mbY
         YlzX920jr6K1vpUP+Iq23au4ZQ/135mnuCtcc/8HxsFvYYo2ji+puT+5f53JgaJOMqD0
         laJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784640814; x=1785245614; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1XXWrkonfhWp4x9b+npN+8YhmLz2dbbZnMxAHV6hr4=;
        b=qcjiewOHn/6Pm1ODjZlGxpvbNbIIAbjpYFKjsKqxKjwsaFii2aQCQpW3mQmlJUNmeM
         t3+CSTL/8/9rwawUOXinuSoWiSdOfBV88lDUhs0CUqPTX9DU9G7h91yr42c7gGEopsnN
         9GqqFEGoX50/tt9xKgftpENre2HRVE+bn06haCEIcQslw5NgmAg3bFhTWIp9RcifXeFs
         YfSVH8+PfH1WiUuvNH6KcdxA8gFfr7yroe9lmMh0lM7XLT3N9s6OzGNXR2RVtgKwMxtX
         OHkOUUVU4hD83q8w4OkE4MgrnTWjmGEA/Go5bhd0WHQ8w/zUxfx+U2OBolh1rH9D6xdP
         ks6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640814; x=1785245614;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f1XXWrkonfhWp4x9b+npN+8YhmLz2dbbZnMxAHV6hr4=;
        b=da//eNeKuXkkbpw715oX1pwWAHCbbEKlrOId5fv7qiCIPjcUdmQDmbO3U8dNMSTqr1
         NudCRcSbdYVF8Si36CYCGmneHX52HZtiYbmERpL4Ptll0sdc8oPzFemLEIn+Xd9Uak2N
         yboiLTWcfZbynDnsbPNHVpiMznwcLWSSKKTfNQ96wGljazMUbGo/C2iaR8djDRYxUkzW
         XSkyX9AaRPANuzxU4Q9M5JVI2DSU/ItCsdIGMhGTKT8HgWfNP03UlOOrvYDr6NQ3Dcpn
         3E6HqVLuvw/4hGPNeXV2xWDZFOV17uTcc95WZYWhbUGlih1zFYgRHkhGs8AfvbmF0SPa
         kpIg==
X-Forwarded-Encrypted: i=1; AHgh+RrOsuXSCbRrk6BbMxdp+YGzo/U29HW4sKv8bIlAhqvLaLgi/D4HUkSKt9qbuBCyOSwhXaezDvmeJ5gt@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3xEmZpSjtyYdZK50kX5bXRMe3p+tKi79VK1chaYnwYAXeIqQb
	1MCRJpFVu5jCRuLluy0Fy7OHSD0v2wetq4o6jBin4qf4b5JzAoQY5DTYZJjPBffGj7/CvS5sDeM
	RMpibd+k8NKIdlx3GjwhGHoGiGFAOVbg=
X-Gm-Gg: AR+sD10fAtQcOdLyJU1bFXJdCk309cX8/Wh4KtgD1ggXNkln34NiZml4FsJeLFFOE31
	t1UUJCpqaej688AT8UrqaDGsrfbAXCkf86UbTNcqNx2X5rRqIllWeSNsZhNowYYFx0tZm+rg0W6
	+PwfB4+zaHOS2Gktd75+SJxPu24Dr9EFh7LfPLm08eEsy3L5dJSMJ3mGMnRCBlZ9DwgKIhTu1tT
	L+5EjUK5eVpqZSILkOp/l9Y9WbfF6KNEe5to15U12c+mhCTc7XlIZYcq8bMXDM=
X-Received: by 2002:a05:6402:40c7:b0:697:eb97:a4ed with SMTP id
 4fb4d7f45d1cf-69e64dd54d5mr7238368a12.7.1784640813894; Tue, 21 Jul 2026
 06:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708131122.2917-1-luis@igalia.com> <20260708131122.2917-6-luis@igalia.com>
 <CAOQ4uxg6WHG1S4--ZN7dsEnYOKY+q8y6qCNYL7=UE+=9G4-+GQ@mail.gmail.com> <87o6g0o5kf.fsf@wotan.olymp>
In-Reply-To: <87o6g0o5kf.fsf@wotan.olymp>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Jul 2026 15:33:22 +0200
X-Gm-Features: AUfX_mz9yUXAR3es9RA7Uhh_aBNVWfJzCtuGsyVUMkBx_EfvpbZEeVo4PEoSjPA
Message-ID: <CAOQ4uxjTs5xh3-bMOOm1s9j0LiKchtVj+z0ZzK=EEepeR+uweA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/5] selftests/filesystems: add fuse ACLs caching test
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"

> > I think this test is already covered by
> > https://lore.kernel.org/linux-fsdevel/20260713220932.413004-3-amir73il@gmail.com/
> >
> > If there is any missing coverage, it could be added to my test,
> > assuming that my test (which tests a regression) will be merged first.
>
> Sure, that makes sense.  I will make sure that any addition ACL testing is
> added to your selftest.  To be honest, I saw your fix+selftest only
> *after* sending this RFC :-)

Fair point.
TBH I didn't see your test either because I was too busy chasing the
ACL cache bug ;)

Thanks,
Amir.
