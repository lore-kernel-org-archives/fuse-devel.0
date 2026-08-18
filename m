Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9233CD8B0
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 08:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042035; cv=pass; b=d1jlRHXqltEA7fDGTWZhycqgO48/G3U2AesqyX+R0mDTy57+MmcjeaI/z1EbnlsIfqGPSRQKPb1SA+YnaBA8wvd3dWV53WEEvmjlyduOjsutJ5SZHz+FoTte6mWdFZUvbno72wroFvnCGpTmXOEXvOuoyLkKOJw5rzjhvJj6qOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042035; c=relaxed/simple;
	bh=SKttsLqHHef/ZYfaFeBWGqEb3ljNSuqipQ+udD/dJIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oj/e5SXWQkFdcmVi3okHR0oO5SxmSN8Fmdwz9gRx4/5QjHAmz534PFwdPIZm47Nw8XfKr+gkaRHHNE6DcAOhbnh62wb7fJ6ZcmeW+2z2l0tzmFfKNVOIA9gxwXAXgx0fQfwRTx1diTHaKzI4D9qbjIF2Yqgo6pfmTz1rPorrEFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=WDOnv0z6; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="WDOnv0z6"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so31914976d6.1
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 01:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787042033; cv=none;
        d=google.com; s=arc-20260327;
        b=o0N09tEwqTQT+6wKu1en++mfLdQwU3PO2caYmnSoqfEhU9d3bMhD/8b4ZwDpZNmRTd
         YWmNCsNA6lVKNRjpzcSRZQu9irHR62N3o1kJbs0DxV4XMEgB3S2N7WA128LjTTFDECtx
         khCf8lpUzqORAtqw3G/O7nYJDk3daFU1N/tIzExWn0nEwdDeqR8yRrZ1eLyeUwJ8MUq6
         runKhQpsTPwtUBWM7/2OuHSTve4E2W2M+dIVl1ytbxLv/milHRvxfERk+LvOWV57wpPM
         6T1O8g6vOuzIeEo/XZ82BlFi5ZWbtPWHtIYIzzQWli5JbOQy6zTw0Kjfh8Hck3BjHqRw
         j1uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SKttsLqHHef/ZYfaFeBWGqEb3ljNSuqipQ+udD/dJIM=;
        fh=o1jogKNzfziq9ahFEttIVBoB766YNFmGqQjy4yYI1Eg=;
        b=aSGTQV0VUVWTxEstRpbltDAsE0RwdXVQFTmPKmX50a+8t4Kfuln+sqwUYxc4IBKC22
         TmDYG983Emi644DlqPrZNVQBwVs6Q308xWrOA5zRZTFsSEiu7oLux1/VS6YXian2JxEJ
         LKXRQJ6xEafdxythjZqOk625n6U6ikDkzZwUM2OtHtpShahRWIe31XAvQQ5S8spDu4SV
         3RE21H7TQzDb1G2J0PqI5n9U5DFXnxGn+Vk7/oHlYShPeviD+HFBhqcbGC91/ubhqm+L
         Ocbhu6NoWQgKD5yAHmkNVYUDgBuA5grnyu81YOYyZkWAFlNtmJL/DKmEToM3mNrf8elS
         0H/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787042033; x=1787646833; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKttsLqHHef/ZYfaFeBWGqEb3ljNSuqipQ+udD/dJIM=;
        b=WDOnv0z6hVzmg4qIXOEA7oWt5ETKGzxw+HsmFoXIYSMrusxhPbQ9hl6UXFvT4AL3GP
         SlJJejDA5XsiWc0rJz3+tu9dAcV1hVea5ElMVSRxUsB+3Y/VmKmH4p05LQwbgyt2kW3w
         tMXwqO/U26LJ/VlOi5jw6//ekp0ouxHIcM5f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787042033; x=1787646833;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SKttsLqHHef/ZYfaFeBWGqEb3ljNSuqipQ+udD/dJIM=;
        b=ieAIPbHbehjHYb9PoPIP08sQzwJMoY0wM44Rwnbs/CsUeAnELxv0jsQQ9YL9DqbJyb
         S/PpA4slDrFKIywCI/7lGM27bGvwLz9rC15xlsZfD1kI0koa8lcz68JWHN3Ml4OfZQM6
         uX4hbF5HPIPmbRScEbQV7OMHHjScXcQDE3mxY9/bkzCG+4wmNr6gKempL+jdNxCW9/Fj
         vRAuE2/nFTh89ds2kV8p5MPjQzSkFb0DLptJqWABqZiBhI7pyRgLMI/JZgMPvZyJAu5x
         +zqc9u/aihGowYRJJY9VZF0ZCHOcZBUkd7jCfjVV/y8XAq39n2gv5iYzQ/419Gcd6n0a
         H/zQ==
X-Gm-Message-State: AOJu0Yxp9scO6x4l5b82NTgPdP3hrQ5YjSiivxxrQ5gbDcOG1VvCjYLA
	ahgt29USWSgg7T2/SD04CSNcG9okrqVwHz/LfzRCOEt0tGzsofMH6fjIeWu8EOg+XhTpL42Cmil
	cpQi9vh6G4X5KUNiTZJow5+eKp5fWnJOgjgkyFCKiIw==
X-Gm-Gg: AR+sD12zznpisx/AyuDnpWodckD9Mso7kiMIrY/einAlbDYHyu1lBSO/TE7+B2C5vjb
	aPFf8aRHiZrbKqS8ggpHEWMGTfSe0ok68RbF02q3ukCD0FRkRP2HGfgEPGwtdFS+npHvr9q5BdN
	8UUFFH4NWgWTQP4ClupDoDJ/on4gY27DAfI3tlqsMdo/44YXguODKZ0Z8HVhLjOQAvelo2mEPJy
	WZ8TRNF0P2xpznrES7/WzHHjUUvpbZAkDTp4ImGUwchG96aK1Jzw/nsUb1NSEkLCTeQsv9LdBTp
	5ArtBvZL7SkBu1UfjdwLIbaQIRuGlKLvQIN/takM97Oz/+8krxz5tLMs48gyM3ZBn7KuEdTjLHg
	3IdHQDZBlsTw=
X-Received: by 2002:a05:6214:21a2:b0:907:5aa8:ceb2 with SMTP id
 6a1803df08f44-90a91d647d8mr323277136d6.18.1787042032962; Tue, 18 Aug 2026
 01:33:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814134015.618488-1-libaokun@linux.alibaba.com>
 <CAJfpegvKQrOGAFCDidFeELrQb08sebJVo=WHXB5SoWAwjodSKA@mail.gmail.com> <4b0dc107-f9fa-4e84-9a6e-f1fef12d56c9@linux.alibaba.com>
In-Reply-To: <4b0dc107-f9fa-4e84-9a6e-f1fef12d56c9@linux.alibaba.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Aug 2026 10:33:41 +0200
X-Gm-Features: AcwNN1VXYO6xNCojCdkXsyY5H3THuDSLH4RdaJM7EA9h-rP00PZfUTxto1M7Viw
Message-ID: <CAJfpegtMS-j_KKAxaki3Um9U=d=maQKWG4naCCYGtYxSiep9uQ@mail.gmail.com>
Subject: Re: [PATCH] cuse: wait for pending RCU callbacks on module exit
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk, 
	jefflexu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Aug 2026 at 10:00, Baokun Li <libaokun@linux.alibaba.com> wrote:

> Many modules (including fuse itself) already call rcu_barrier() on exit
> for exactly this reason. Documentation/RCU/rcubarrier.rst also explicitly
> states that synchronize_rcu() does not wait for callbacks and cannot
> replace rcu_barrier().

Got it.

Applied, thanks.

Miklos
