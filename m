Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD413AA2D
	for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507389; cv=pass; b=mqKPVb27Pm7r1736WgZG5WiU8zapglJ6Jaehz3Ocka1g8FihWZ0jFgCHm8rsS8Hd0Fkh6aSicLXRjbVEffQXb92cnJmbCUadnzdzOgPgK1wB0Dc4rfeQN5ZNjyaw/HSzBci4u6jbKaca8GsfS45HliaWv7ah7UrSL+s+lqO8/KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507389; c=relaxed/simple;
	bh=YNx8jkSEPhuQBKYye8AREJ5JE/d+V8ohlitBPkL9+zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nwOqc6A/sAzHGCoHfym3mhoio/6mYAn7oYa+1dYypVouYV4M5Ix2QaTFY19hTfPI2ApV2KUmnnfPUuueG82+QQfiVaj3Zi6lzWmjN96smuGxUn3FSIpNE7Vg0Ev+4WSv+btjSlbOiQc4zauykqERNg/7QIz2T2lW1ZqZ3sVAyto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=RQQiCeso; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="RQQiCeso"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51758478240so15814841cf.2
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 00:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781507386; cv=none;
        d=google.com; s=arc-20240605;
        b=YzgJaNmlq9KIdB2hhNPsCvVdhTh5CW+H/O46YeZb2rOp4CM8q+IrrxiqiBonfRxVB9
         QsojRJMDVGQ5Rl4RDFbgxyEEszlSXMTQHgmS8fzXT/Ff8xTE+fGCYyttzcJanTdZV5vO
         TiOdIwdRGtYrPaeMqS+VAIS6OWu28/jnAMpEHAuJElZt2vdB2aVfnyUI5ooT+XgXEFCv
         bXthH322Q/AFjvPtLQbPOqbFLwwQVtV539ZAp3glFkPwcBg5vOQgfO4Pr9oEghW7EaMU
         2meLc1/EXX60VrBF/e+UPdy6GdPpju8VL36fnBYeH65uIvXRG4O3rURjz298cla3PgW4
         sCTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YNx8jkSEPhuQBKYye8AREJ5JE/d+V8ohlitBPkL9+zE=;
        fh=w2Dy9MBCymTAHXuuQoFoyTRhGtZ+o5YcX5Bg6rpudfc=;
        b=iP34F1R3QGyHT4tnxdAoB5P8mpw5kaQv0fW6m3QdY0Bk96ilvH3tCQx1yOD+hnYLXI
         C1E/Et9uXCEod6+vZtYMY0bXnMo4wNFxBWzda6I4SZGrWFAzwBDDmdmG/PjzTGOSJWVK
         U+junwJqEiun7u9jnUdNn6rwIhwYC8fwt3G56B6b9IgPh+5pgtmgUspw8O6ZgpuLkkcN
         oRhgDOyB5U49MMRw5t0a0tygcKLF5ArsG/2YHkiEoXZlfakiTCwFx3qZnLV02oYugdM6
         72plo6VR97agmEKIqhtF3QuKbtwMMgWqKgF1ASa1xxzJDzc35OeCi8uPrE5t5b+/pGG9
         NNJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781507386; x=1782112186; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YNx8jkSEPhuQBKYye8AREJ5JE/d+V8ohlitBPkL9+zE=;
        b=RQQiCesowYUHmT13hSXg3yhZvJE7jFZr2ge3sUW1tmUdRTDkuGlP5h1OSobaAWQxqG
         5pF6WXN5i7sB/kpU08+lkAjZZg3qVe0pNUi3+iNuzKDuKvWYctjMFrD6Qdhwaf1va2rv
         /WjND6AdLs0VYv1EWEeHozvTHoS8A6Qw5vQ4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507386; x=1782112186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNx8jkSEPhuQBKYye8AREJ5JE/d+V8ohlitBPkL9+zE=;
        b=oF3CspakNKjWzsq0X1v5c6NYzUJqI82yBIlMIzbKCgdA06368cneN3MMu2zU8KnBcZ
         y7uNqXn71RQBNAgdIxNb2T9T6y8to+Qj+aSNjSbRB8ATV0Nft3XzXvWxwi+iV1ZbZcJ/
         KMr6CD9wjZnTNTZVlo3xIad6GUTHmTSX6dVB1UzE9wiKRYc8wdXayMi5mwrL1sjUWyaH
         96FvG3ocVQH9YuQrfPEPH9H5uzwOXHLBoRptiRcJJ/tVsit8rERmmA3nybSYDP6rLxNL
         HdFd26ecZSB3Cso2oEiSc/4RaRDM3OHndDfkyxQlOEPTWgoc6qjy/VHsDUH7HhVquOq0
         pLFA==
X-Gm-Message-State: AOJu0Yx8aoDOl9Nj1fOgwBZgL0MlAeMJmUVHpxbo6XAnVJ3+92W7bUP4
	aJv4dcQFcHKLWfaFL3ZJEOOLWQnCC+46M2pYP4luw45jCZtNQfKiCSmYDutuXRD0R65QYAnikQp
	mrOUO0QyY2+ClZu4WDDSH4nEvdFUuegcGcADyvSb0Yn+5x/t4lLeN
X-Gm-Gg: Acq92OEQ98ZXJU5DSc3dXT2/P6DcMuNTrSIQ1hjE4qUW7TNwtdRfZuDVQbyLix1yAdA
	WG2plU/vy9L/xqcAsyVEN2ahDZ+1tEM/bWg8zPYbPdGtgZbi9L0Yw9J2oKmUdb0KQh4mqVE8dS7
	HMntKAjtTQqNi0XCitN5FOwvyTXzAKDfWH4AODjZaDuTLjsRuU4SEJmx6B3UCtjqOsnwY87hElE
	6i9vLzDOz53Ynwc7qBZt5J6Wc2u24mDg+yiQ5KdLYjnyjWsTXUZCc8SHT2Ahg9je4kw8G1NW4Wg
	kEnjeDPSTnS/3tHiRpsanHEi6d7n99TLlf/AtQCURd5nhrRfu+Y=
X-Received: by 2002:ac8:5785:0:b0:50d:7406:8f05 with SMTP id
 d75a77b69052e-517fe4cd241mr186196931cf.9.1781507386440; Mon, 15 Jun 2026
 00:09:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com> <CAJnrk1YtpVgELApN4ttFi32UcCcWW9dwv88aJpLwN8C9AmT5=w@mail.gmail.com>
In-Reply-To: <CAJnrk1YtpVgELApN4ttFi32UcCcWW9dwv88aJpLwN8C9AmT5=w@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 15 Jun 2026 09:09:34 +0200
X-Gm-Features: AVVi8Cce47irnkNauQ2OiqQCD9ymAGMUB64qJy4HHCbB51MhwgQ4a_YaTzP-k0c
Message-ID: <CAJfpeguYHYgOE1dUt2p9Nr=o9uXp21F2O1RQwEDz=SXhUXYewA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jun 2026 at 23:47, Joanne Koong <joannelkoong@gmail.com> wrote:

> Patches 1-6 are refactoring changes that have been out since October
> and have value on their own, independent of the bufpool and zero-copy
> work. Could you please pick these up for 7.2 so they don't have to be
> carried and repeatedly rebased?

Applied these.

Thanks,
Miklos
