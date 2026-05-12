Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB72239769A
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579841; cv=pass; b=qpuVaiv2NnucH1oeSyYaB0m9ZAy1jlxSsPzM16qiloGbH/owxNshYIWelKV6kGdIN5sCXpza9n5TI4YA7X+ps3UcZiVqbe9uZqnd8GLFvGuT4xBxNVoOybrBLeev/DW7G8JeAcF4Mtc4N7yACHmVet9L9cTZUo9JumqdeDrbZNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579841; c=relaxed/simple;
	bh=Zk6pQSppwI2XUO+9RM4L9RA06qaWe+fmCGIHtby1NVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=il2s/cNSDIDwyqz2oEVDO7wOOIVdDKtL5yYtguYAVNU4lHshQhqXJ8NOr9H0w2tL2GC6Mlu4eyrIcYNwjVYkV+5l9JU9Stkz9on5dBli5WnGgyC1c0u750SxU9ECUoIEEcnuM2zVQai+y6VlRAwgaJfgg2g9w3XL6UMSJctEE7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=iHZHZxcE; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="iHZHZxcE"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50faf8ed9c5so27832751cf.2
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 02:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778579839; cv=none;
        d=google.com; s=arc-20240605;
        b=PJC/kkDO292/jzV5GqELcR/k1HT9Q3SGwQwEXfxqnNeM7kzFogPW7GV0z1Onv/fAA+
         GR39ke1eRqtsshS0y+DWNsC6GoncXXWk0Fh7a/xuRoFkzG9z7lgZyMlyJXnztSt7GWOd
         wpu4R4Gn0fWEqTvHdKJi40MUo0LnVJtSxe8s+R9+TJOpz3JHpLBZdglQs2ikAleIfvJG
         2ggSDvbElfEfAkcgUXJ3Nv5kN/p6gtYsqLp8WPB5niZFMtRqdb0RjjbWRTvFAgS5hkBd
         lSZ7wlN3xHqEVyCwGS8PTyQvChFUfdwPx/y3jp9oFwF1gIlY/z/SOX6P2nDTFfbHSRQc
         QfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZZ2aWyO1PAZw1uRtjKrB8uu99TCDOu0IFeyL5zerHpE=;
        fh=H+u0vnY6LcZ0nrGruKfOj8yrv8sHENZK+4arRB+TJmc=;
        b=dhtE+zwZzCVPE4oN3KbrBwNi0HIPbnw7pALJM+HOF0OJ1rMKbBZWzB993wD3+heMYA
         XvJF9dtIdsUurf7ejJIRUMqX2eFMQ/xRez7FLCfzAfBnIujlLNDxG3Yhb4Hll5Tdq5QM
         Snhf1qW7u/l/2Vn64S6eI5yhL/kaz45XLlkMO6YwLrRj/uLFyzUHgRQ8JZ1zleC4XeTu
         bYaf8OIyNiwqYEDmUyHvN94qMiAJWplykP0WlV77VEzCenRVKYoj6uW54yjy+Dlwnl3W
         omR15vqiQagsQFb4BQ0RPNiN8aRfHnH7BVDJMaK4H8LrCt3xQxEj5j9Op23PCPh2saKm
         47lg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1778579839; x=1779184639; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZ2aWyO1PAZw1uRtjKrB8uu99TCDOu0IFeyL5zerHpE=;
        b=iHZHZxcET8tM2FD2G/pTRFOMDOTv1obm1XnaVb3R03iFyJI+gP3jn191bsUyepWwsb
         7jwABWL//1WqfN7I0i0KktblJowlC1a+M7blw9j3vlHyNzvnp2mowJ8xAuV8/VqeaaoL
         6D7uKXkBoftZQE9DKuJDwTRgUbiR3YMsAUSrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778579839; x=1779184639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZ2aWyO1PAZw1uRtjKrB8uu99TCDOu0IFeyL5zerHpE=;
        b=op9k31fGorslkrj6dECKuwemst1c2pKUYJ0wAGg2SLbjMQyAxERGeC+LuwNPH8Enxe
         isnGil1cYxF7R1mZ6RiwGaAdhiy5r5qd+nh7Rp3wXyqSx9oVfdOu0W63i8FXO+GCrjYR
         nI4x47nz885ywdftdTY/JOQRVqc69ktnLa4yv51TOMXhCqrC9KzDHRbijVMyu5Mu9zGy
         2nyt+iKAZ+YQMeSZ2Z9rq86a0dECjU5/rO6CyVRCU+sDcgHUWX/WHFnfDFCObxaGwuNf
         M4xMvJjBqXSMAbU6FukwY/uBArgFpyQO6expDrD7+RRpPzyjWwVJc2XcHwurKsQmlU2G
         lVOg==
X-Forwarded-Encrypted: i=1; AFNElJ+J9Hk3SOkMHu7MUHNfC9QN27DONQ9fkJ8qgzlgVIQEa72n3bbUsid6wpmYOkirMSMAdyW46eepJEBU@lists.linux.dev
X-Gm-Message-State: AOJu0YyD9xNPfEs334Qtv9WqdIvlK5bcaKrNEk4YFet4amt6EpjwKylU
	lxS8XcSKI1MO0PnCMyfcGo9KeyfJv4VoQHucdCBRd6eKtHYNBeFJPsubDSzUMNE7vyzFpccU6HV
	jXxIYzHXDu3fdecjDmWDU01UXzcY7ytmTaWwOhaATqQ==
X-Gm-Gg: Acq92OGGFVJSS0xTSyAQFyvHHhxNDf+3nUwrCi2JRHwvRoyuxk9vB3RbawyTTc1Jp/8
	yZAng7jrfJm9YHX123UBjsEQuotoEEpUEpyIQ5jm95bUOmCFs5T/7eZfsfSZKdfOFT2kVpLfwTf
	e9iWAbungNDMp8dhTTMOXa+w1PiR1HfLzaKAGWQjRtdsUaO2s6P0FTGC7McjZkDpWqS/MeFE3YJ
	REiCnyRgX6hQ5fsZU+yGlIt3WbUNNZiVFXNaGtJMQKRDJ4psY1Fid7wv5MQ0PbkGaqTHbl+Gssq
	Xx7F+sNWBSHfxzIkk9DIwQ8CWMDtrGzKCXgOAj3lY/9zsuawjQ==
X-Received: by 2002:ac8:594f:0:b0:50d:998a:2d with SMTP id d75a77b69052e-514621ce49cmr385975601cf.50.1778579838763;
 Tue, 12 May 2026 02:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJfpegvXnA1QpmfM9V+3VB470xYDNWH8FV0mBV1R1-HqvjfJ8A@mail.gmail.com>
 <87pl313ni5.fsf@igalia.com> <agIqECaAKFuqdi-i@fedora.fritz.box> <87tssd5829.fsf@igalia.com>
In-Reply-To: <87tssd5829.fsf@igalia.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 12 May 2026 11:57:07 +0200
X-Gm-Features: AVHnY4JwTJeYDTk3FgmCsmv55SVNa3W6RrX7L-4ua9syJLQzzqv6perGJywjg5A
Message-ID: <CAJfpegukELeLG8ksWnxANBaGBpjjyq=3mZbaThNhi=UtcsoyOw@mail.gmail.com>
Subject: Re: [post LSFMM summary] where is fuse going?
To: Luis Henriques <luis@igalia.com>
Cc: Horst Birthelmer <horst@birthelmer.de>, fuse-devel <fuse-devel@lists.linux.dev>, 
	linux-fsdevel@vger.kernel.org, John Groves <John@groves.net>, 
	Joanne Koong <joannelkoong@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bernd@bsbernd.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2026 at 10:46, Luis Henriques <luis@igalia.com> wrote:

> Miklos, do you have a timeline for when fusex will be merged into
> mainline?

Haven't thought about it.  Could be merged as experimental with no
guarantees of api stability for some time yet.

Thanks,
Miklos
