Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C4B22F767
	for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928856; cv=pass; b=JVHZlzomCajGikRplwmtChwEfBad5HZJjrbje0xvw579Cashf04nNnk01s9dsvp2Dq0gYKiQHJGYVptWixOMq49WC/wmPf9ms8XMNuO4n40zEEBoEq8f41Y7IyDRMB5SO2XuarH7Vflat6zPTLeNQOy4jJ41hYqNJhog3K0pWqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928856; c=relaxed/simple;
	bh=Kynlk3ThA5qwF/0+ADnmZYcZRJ8gAKkHNFPxAd2EGvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dITx9a+aHDddORk1YZFCF01XkuQLQxwkr/pNhyn2CiorS/50xAyKp+TzmFCo0am5RtALpJRNj+kUqQsqSK31HkF6xV5FNsuxiTGL3DcHhIDeXgg8snHT3ni7ZPrqzHewP8Txcghg71pqBgAzXUwduafQl8MCkyFlgZFzAhCT+u8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=p9q5FARQ; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="p9q5FARQ"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8b038a00370so49797246d6.1
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 00:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776928854; cv=none;
        d=google.com; s=arc-20240605;
        b=B1VSUvSwzIx+/0bUmA/CSGxt/r86eXACB3XYtBNh6qZZcMPAcgRUENgDPWXi0TvPiq
         fwzc3AUjcTpUtnzjbXIomimMZ+i8Xsa7ObgJQuxa8Oi31ZynuaQYKX+b15+iHprkK8mk
         LiYetJvcdwT2c4yqSSLJCzk1O5VbCIvHLk9d0VBY1P1eFJm0Onm8Pm4lyoW5+/gcmsoZ
         n/1zrzY0i65dOSkzXNRn/E1JmIFBSA29A8r9uFA/3adAC6SKKZLs5U2/Qdbs6fpNJFtU
         /RJ7TJksgS6rY2kIzq6+4hVE8pn4zO1Pn6mik+Sr8SXWJ3qb3v+n3kU5nT6wKQNcS8+T
         gAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wXvIPI6ZSng0Sr/kVOMhLEpDnXdWNurgPCVFV7D44Gk=;
        fh=B8Jbc8+05cd1N1dUgXBTrdinT89+WX4lnDFiD125Tao=;
        b=NpN5xqaZaLB7J2I20PHNsZfuE0AY7K/WZe5pCXo2aKw5Of22DrfQXNRQh7iLPed0vO
         hcECctWM43/chD94QaVOhG7EeOGjbdKM6UYyjvZ40UBAXqXzQBzJWH78UzHDisXcQlIu
         lAUsnSEdpTuHPREFj5T8rfUwb8ffQ/VParhKnncXgqkJiEtii/y29tmRD+WiwzGymBp7
         39T9k0VgBZrlbmr1NED3yESEN6hTTyS3EZHdYMcwr6TaYGEJeXzisw3GpPTZGTZJQPcJ
         RPH8UJEgErPtgQGsENrn3r71h/mTnURNvZUygvvFp38U+fNU5FixWTh8fnrd7dofRZsw
         N9UA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1776928854; x=1777533654; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wXvIPI6ZSng0Sr/kVOMhLEpDnXdWNurgPCVFV7D44Gk=;
        b=p9q5FARQ2wpodm4Oi+FTT7vnS3H1gtuhojw6dmW2MPT3CjbEAzvnEp+f2l0B4FTRGY
         7m57VI6h5tXq3xxMTkZmlI5GTBrg97WXGeuMI/xNMSvdRYT3q5rPy0Yjufi/2V4H1Bh6
         F7mhRwLRT70Lq/u42SqlX9tmanjnPnJyu8RNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928854; x=1777533654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXvIPI6ZSng0Sr/kVOMhLEpDnXdWNurgPCVFV7D44Gk=;
        b=LmlMmF8EJgdJDob9KdcxfzhMFzgMUpo5EDq3bbuvNKTrFBcNrtv5+iXbI/vHaW5HFO
         XDHwF3EWqYEgZKptqXBoL1mNMwYqCb8ua8yw7oU5nkPYNq+p3E7Ybx+Q/QmuhUXUpPSJ
         C8m326dKSNY/NudUSplIaoTC2Ld8ETI3goCmJFkrMbvb/7eL00vtGKsm1AK7l+r7K5Tf
         Tg17EMmbgec0Xjxb7cjgexdwRWi+Vkf3E0MPMzFTtB8QlDrwL/WpJmrkB9grH7I0t4i0
         jTJ76mULAjABU6nDtXrIopi1Zn/f2k45gJHYfp+UVHsBl2Xip0Q9TD95sR6G1zUFg8MI
         gvPw==
X-Forwarded-Encrypted: i=1; AFNElJ/vMqlYESxFgzl9uIBZD/+gLwXUSOYbsky2e3LpXP0mzPpL5+42sy4yT1j5N0FxxuWEFitYfVd016cH@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh8owZhoFZyx9mS8GW5I1thYPle3ue6oGq0e8PAgOXxp/yTw2h
	BQ8jtP1Y18MQnAugYt47iDMLx56T23QkQsi28iaHO2dXKLSJ4NMGdvIftToGvOxrKSlWvLZyf4S
	tq4XHXrENGN/47i2u/U+SP3DGVo+xhETQ31D7rPdOFdGEI1YVluc7Akk=
X-Gm-Gg: AeBDievoz/5txWddmz2xR3x2+IgiX398uMLbapzbRwdEWwN1cN71xTd9mogztWOWtsU
	rnFCfBEMvjjSKrsf/1Ba2ziaav3HQ5syAx9kCS6a4b+BvDwWNtffoBG3bQO8KYZMwDsxFWBKUPj
	OIHmrZ3YDpcPEhv5g5NLv9owQNxQ6ANA6f9vz1VQ7RD5+tVc+2BOreyVgfLTVcvNvk+4inzCDPU
	3wxzoto/mUbzAC571hkgC/FO+3lJz/cD2VE3t1vWtSJfED1nyY5uqXE8HiMeS/Ur9DVon9uP4Ya
	Vz9o6fSHgBSjlNntNACTWMf3qu8vDOzW5Ol23LG8bCHWzrz3ONw=
X-Received: by 2002:a05:6214:4a90:b0:89c:4c6b:4615 with SMTP id
 6a1803df08f44-8b027fd979fmr407792026d6.8.1776928854442; Thu, 23 Apr 2026
 00:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416091658.462783-1-mszeredi@redhat.com> <20260416091658.462783-7-mszeredi@redhat.com>
 <CAJnrk1a+wEqZxgLDYJObfGiAiW=SgVvV4LgR6_PnwwW12t=1LQ@mail.gmail.com>
In-Reply-To: <CAJnrk1a+wEqZxgLDYJObfGiAiW=SgVvV4LgR6_PnwwW12t=1LQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 23 Apr 2026 09:20:42 +0200
X-Gm-Features: AQROBzCE93EyEF4GFLjUFckdPSGhMwPPhhYdVyfggLY4_wbt5kqW7ESzzvJ06cc
Message-ID: <CAJfpegtrURTw5MTbWuwRAiY24KXpt8z-HeZBj5nz96giBw_Npw@mail.gmail.com>
Subject: Re: [PATCH 06/32] fuse: move background queuing related members to fuse_chan
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Apr 2026 at 19:54, Joanne Koong <joannelkoong@gmail.com> wrote:

> > +       /** Protects: max_background, congestion_threshold, num_background,
>
> nit: should this comment be updated to remove "congestion_threshold"
> from the list? congestion threshold is accessed locklessly.

Agreed, fixed.

Thanks,
Miklos
