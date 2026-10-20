Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792478029;
	b=XQUoZvv1RocoMcUU3YuwJgPtOe17Lv+g23AxznQpErxJEcGj4017Y85YyDcqE+KusFCj
	 xeedsE3nYCUNUdAp7iaT8Bu7HQpuM5sZUnsrx3+qPDZTaeHOj+pqc9ZQEmw2xseZ2DcdW
	 uacDk3ZjgJWrtFHsk9SzvV/BKBABTCWa3db9qeFHxhnHfccy8DPibd/Wr2AIqSC73h0zQ
	 MrdJynxgNlAMjgwnxEpykp0CyhnX+rIt7yrrnf72QPP5HyUHkop60SW7j1/3nY0N2f0/o
	 AUjGmwgh8LlQeXghxv+Z6QZt6WHRZe1xLd0W8YOaKGiWIixAQPax9T5Ua1XFUfd+BPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=exeTp1cAoNgGNBzHpnK0Fe4gV+c26CWlkIC+95vHT8w=;
	b=cwIiW1aO/iqSdjsv3GPCYivXeBe7yUgceuHjt/CAyCRkkgrzm/LcqLOsTQvQK/c2/uLr
	 61WOOR1BF69bhiHPxJ2v2am9dqAt711jyMCx2GXVU1jVnz5IcEnHidT9U7F3+DOshj1oZ
	 p/fg7cvNuLBZh7Bdi44gX035dZQV8zEsFCGQsCZGihAKcA5O9/s21kqI5akvj+hL5Pb5v
	 7+a6x8lVQIPDXw05th/yKpwaSVrKp9n8fI1v150HSgKYbIvexMLpYDpspCo+ogTk8+RHO
	 +ZmC9gRmT264ohYYG0NDlyowdNsOIgpgEbnqgXw3GZ1XG1Uh8Vy2Jq7KjFcN9dOP9mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=owltronix.com;
	spf=none smtp.mailfrom=owltronix.com;
	dkim=pass header.d=owltronix-com.20251104.gappssmtp.com header.i=@owltronix-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=D0QQloQn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA47606A322
	for <fuse-devel@lists.linux.dev>; Tue, 20 Oct 2026 06:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA47606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=owltronix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=owltronix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=owltronix-com.20251104.gappssmtp.com header.i=@owltronix-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=D0QQloQn
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so13387785e9.3
        for <fuse-devel@lists.linux.dev>; Mon, 19 Oct 2026 23:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792478023; cv=none;
        d=google.com; s=arc-20260327;
        b=OAuz5qbKjygDoZWs6tSB0PLRS6XFzEmkhE8C/rnRMSNFQapwu/kkKbIX38T2Ilz84W
         6DVaZhfjS38GN447X+SbxhozPaTMCNuvi8JOZoEcMyg8AWyWn/SIllJuSFUyroA8DpqU
         MMq7SAk+Kj4+i8CKZOqVAF7ASYKeZxCvJC50I7CA1YY+qK+J/cP3ITOfL4E4bUPb/amg
         F+FFyay1IU0y8hRYSPCIpxyrT0ixPMx6ZeQpDVJiSL1eLHGgfNQkeWzvDcc+oGDdPUkL
         YTAxHRJTAQnz8u7NUh2anMQZheFvdii+QiBtwUPVNfaUp+PItbh8UkaiHze6jM29HDvZ
         Kwqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=exeTp1cAoNgGNBzHpnK0Fe4gV+c26CWlkIC+95vHT8w=;
        fh=6lEJOOAWgjzROWur04Nl8V0FIgow9XOaS8GYVvp2apY=;
        b=SKmxVNVVfQqasq5WaKn4ugC04tuG7nLOcU9wLdxlNTTha02TViL/SWwrVEb1uoT+Si
         F4wfhchZnv3DP08la3d6zYLb0rkdqzg51A4GqCFNqgaFZxJigxUlhfmvbjxJv635iYTg
         VqUR1VjwxG5cDUl3vGjzvuWzRteHVUnO+jjhnhpz5ZtmxIZ3NZZESYkUocuS8LseJmYf
         cuartzZNsf3xNbF96bD1WdPX9bDolLSAgsSRUm2qt68TmUD9Gf2isqviWdaFss4PoDws
         /37lO9IXjY1RWf47j3xfSn4vXuBVd5dnzWKMN4Y3JkZC1h80AMuWevrhwOpKEGRVWPy0
         05Xg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=owltronix-com.20251104.gappssmtp.com; s=20251104; t=1792478023; x=1793082823; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=exeTp1cAoNgGNBzHpnK0Fe4gV+c26CWlkIC+95vHT8w=;
        b=D0QQloQnh2XUv6erupWUrxhWpNG63ja9JGG7+FHDpZ3B/0NLxKEANuReH0f3lCIk3a
         pdGB4KWNjlCmCpzivnWXKYwDOFc2u8DcMS4XhPWU5a+rFxx/mH/dpirCugPbHBV9UslU
         1k5kqgRSECiZBzX60MjpsSXuRVluDNTOYSEAqu8HIAoSSTM+ciXeHQ4Dm2NkFXJDXUo0
         eLU6wfoh9aMxmAm/NEB2LM+BDI+GdaYD5hwiiOSrmXx+VVeAvdzK3dS5kJo7fO4lZg3O
         49HgFsUnQtFvtzRaTp3mhkHGS57nzWk3D1bA9hRwru7b9sXP9uJKhXCx9iKamNaTylTg
         2U/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478023; x=1793082823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exeTp1cAoNgGNBzHpnK0Fe4gV+c26CWlkIC+95vHT8w=;
        b=vEKcTem62K8hiffbSRZJvTX1T/gvmQmdEZ1ydK0A5U8M6g6UsxeS02ZTdFDOZdEYSi
         +X846AFP+nHpy7ExhlvumKp5Ajyvy+QRO3a9Ev+dMOiWHUWo7EP15tpg/eevIBwYcmA/
         H60Ud4ML1qCEgbxbVmgVeRIja1r7tDtRteFG+tCuh5dKq9NJvSjFBf7fMIXfvz+9Galt
         B4xyz0ky/ljJ8HlPATuLpkkGSsnVGjdmztNM2/yTvh6V6T87bqTKkT7xidxaAD8KxNhw
         K1IH7LZ536E8SKk/Ql7O7pB8MJ5luWM8hIwtxRRbyhKgsrUNDrt/KlDHZDlWd4x0gA0Q
         0YeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwodEKTwtPgfSEwor8eO1opEhsalIAVOzWNsyea+NIH2xp5OR3weRKsYvxw1LyA79XPOje7Czo1oU94@lists.linux.dev
X-Gm-Message-State: AFq9FYL87WW1GrKrAkgV46Pse8LgMLzb12wF9+rnpIoro8/szjNfbhVD
	aCYJkQrTZ3gOK3HhTwbFCIQvTQChy1UvjwlYv7r88eef8tGWio3ZwqOQM2PNOX2vCIPMclYxn5M
	TJS7LKj3aejmzTjWwO/MJo6/ywCLRtjGnB0oFZ+CNgzqM1soWTvrI
X-Gm-Gg: AYBFou2A3Us+HQcOSHeAyWT2N5xsKaaL+bjIa/eiaQPq/z6XNnyNHtj7CbfvOqSQJZ2
	iDFWD+mNycYAQdFE8h1rPXJERVKoNEa5cYWzZnpm9ozOp7P2id/IzxuBK1jM+VRtYKNGfSzBPGo
	MDjoV8YnRNIxtpM1zjaxjJPzVWcWqqom/LmJHi8nuNGkqQ350bjctrori2KbMeZHTAQM6cQBFko
	54bMtHZfZZLqlcVVAj1JJ1B9w0wVQPT0fC8B5JFAwLWUXyDwj7F6gZ0xoHO1kKcciqM1y57Eyln
	IWPgto3ffx3DhBBEbcEZvxZWnrIZo6dRHqrsZSN12bjUvDBq9e4I52VV
X-Received: by 2002:a05:600c:b99:b0:4a1:d36f:1ba0 with SMTP id
 5b1f17b1804b1-4a1d76227b4mr199950255e9.35.1792478022502; Mon, 19 Oct 2026
 23:33:42 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016160037.GA107919@frogsfrogsfrogs>
In-Reply-To: <20261016160037.GA107919@frogsfrogsfrogs>
From: Hans Holmberg <hans@owltronix.com>
Date: Tue, 20 Oct 2026 08:33:30 +0200
X-Gm-Features: AclHuK_ADi3z0cS39x96qE3d4XzZpXIuupVRKpApcCWwiB08hyMIjCfxAVkNnMI
Message-ID: <CANr-nt1btFt4FqSgrsjMW5tRihyKcUKG-irW9su5AM943+1vzA@mail.gmail.com>
Subject: Re: Farewell!
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: xfs <linux-xfs@vger.kernel.org>, linux-ext4 <linux-ext4@vger.kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, fuse-devel <fuse-devel@lists.linux.dev>, 
	fstests <fstests@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for everything, Darrick!

It's been a pleasure. Hope to have you back one day!

Cheers,
Hans

On Fri, Oct 16, 2026 at 6:07=E2=80=AFPM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> Hi everyone,
>
> After 14 years at Oracle and 23 years working on Linux, I've decided to
> take an extended break.  Today, October 16th, 2026, is my last day.
>
> I don't have any immediate plans to drop the djwong@kernel.org
> forwarding, though ultimately that's up to the sysadmins to decide.
>
> I have very much enjoyed working with you all, and I'm proud of what
> we've accomplished together.  Good luck!
>
> --Darrick
>
