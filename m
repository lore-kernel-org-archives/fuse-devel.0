Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93CB40E8C7
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666802; cv=pass; b=rn4pMNu67Co/WyMZahDFfu6/qOfuRiupxMdRn/G1sH18hB99nNkL/MWh3TnD3JdWG82CiQ9HwVa1yh5rYG7hikVN9wPNtE70GgvyFQ/jX3FR8N4UXDamzHYhnpgHw6n9vjulMGpmsNHSxjVcLHi3IH3FQzGtAmRLNDxyxnsU35k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666802; c=relaxed/simple;
	bh=ddC0cWv1M4hv269WAR5tImFxDWD0eevWIDYp+Yw5+BQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pup1O7GY4+TIkXI3hOnOWDSh8kYwn91DlvNrwsEPeSHQaQrIBf+ZdZys8BELT5UbITp0FlTbIe0Mg/qhPHbyPO592VUw+E7WQSBxfpDc5roXp8eOdl2qqrSR9ka8exRmFdql6Ndgk3zY8R99FUsJdC3no1XZQINAmpycf4ASuBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=gu5f1/7c; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="gu5f1/7c"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5175cb5946dso11914291cf.0
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 06:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780666798; cv=none;
        d=google.com; s=arc-20240605;
        b=WgQzE86Y8jQsaqcffmsQyBlpMLKFMo7lL4GYbVCwiEFkoukjTd3kTqchDmUZcbzE+3
         kF3MRixJN2JcpDFuvfX4QFASVkP3opPFDXdkhndckWR/QS9Hm3S2MMXbWXEc7mgaRj3C
         wRXoe7m5a1GFw+nDHjK6NfyBKZK+vV8VyEJ1QFWYXW16EexGM3VlW2ZpHxHjUJErka+v
         mGkmwHlu8TKmt/+SrbQs8Hgcd78l3B2+7c/4nwysEYyxtL7TiTIIHPYp12c1H+Jzl0iB
         tV6ngU5YM+ZII8iAHJo19Ivb2fMIxmsW7zdmb0UJ/PYVreovmenTghPNvf8KQZCXlEzT
         O0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zSIdvlqyQTppGKE+ThJUC6AH1f+r92q5JNs54WBTtRg=;
        fh=wXMQ8QLLllloc0Dr/v+Ota9IfAHxcTlDklF0ZkhR8Cg=;
        b=EP2dZXHRY7ap/h1FawFNHRG0mO+Hf32NkDUbyLvQtgK/0jf8VToE9vgOPzYGkxkHjY
         9hlAQ6aPCbR6JJAfTgVoSB2RH9wLW9Jffj0FkqBgUakHzuDIOUB7cKmz6MYWB4F/SQn7
         Vmv3UPBZDnG3qAD+ZE/mhjJyyYS9HsoKQBu5c7rTchuptF5n/OAnraeBkXTD9cgmnSPs
         RE5DS+A1mq1aD/bLR0MNjVyEMESM9hU2vbB1p+xAKAjelk0k5LZ7rss0qgvv/bQA0VU9
         U3Y9dHBsaXQBCryRe+kpcjL6+B78z/UPucVvEauRBu63UBceNLkY0CpW+DjK4Qb/n8gl
         yPsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780666798; x=1781271598; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zSIdvlqyQTppGKE+ThJUC6AH1f+r92q5JNs54WBTtRg=;
        b=gu5f1/7c35ovaffnkgzSkREtdC18AsgReZmETMNATLOGy5pPsIBmtN5AEcj+LoaP5I
         d9usNC9kG49iWI0uUN5YZ7mfNpQ7tf7RV2csCqHzKWatqICXFLd/OJ96VI56p7bwNUIk
         J+maKxuycEaHl5jE+x/+KZfHEmQNTO3EmbNME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780666798; x=1781271598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSIdvlqyQTppGKE+ThJUC6AH1f+r92q5JNs54WBTtRg=;
        b=JzQLZ3deOwAploTS9fiHdF+EqiTUB9bOo+Aikvdi1pHbDGWQtE2F9itJz49CsIkcPE
         r4Ak5YyuSjB/AE+4//JJTQeWZ/0RAm+/Iaw/BGlcpXZ7Xp6g/I7s7QjFnT9iOMMEXu86
         fBdbQ6gEKNuaF1NU28jlNvvmQ07i+82nvIzwmgtkkbl5Vt/HknuFHwE483T1rUiOVVV3
         uZzoUyCXkV9WxHD7qU79x8GruF/F8RiwXsfbQ8wklEDkIH1KM16RBlEl3aQsWSghZOmH
         EV5UBgEDJJTbdqspRp0mjLj4oAVAjujV6Wx2GlwbB9eyik/rmYIDwbzURZMn5utW9ulK
         ZftA==
X-Forwarded-Encrypted: i=1; AFNElJ9bcblwib83Y/OZCp4djsJCXml1JVIL54cSCrHClECAx0whm3WH9H8Zz6ucwFLn6s5UreRJtYVtYLi1@lists.linux.dev
X-Gm-Message-State: AOJu0YxXnhym0uvA+6BwukCCcQMIA6L/mCSLFSJHbUBQdQWovXrtodM5
	LDbnKwOqrUmVqabi6vQYoYJm3R4T38Kd7dcR8jYK9Pv9UfURNJSHlgYTdzYYMJRlsuXIyoqRTJT
	3fk/O8lozlk/Ou/8ixm/9rRK6dTBzLEi7tAf+WdWgoQ==
X-Gm-Gg: Acq92OEyU3BXiqyTY9Xva86WzDnmPMfiGOcEda9rHwUn+Y6KtYPE4XXKM7YF0KCRnW8
	xkR4I0X7hE4UT55sjd3ZO6gvNPbzmhp1PMPhVTLT0TKawk+xDOXGwaLZsTx762vumGK923Uxbbd
	+7FrgsfgMjMNZaevn9n44aupKP0G/m5ZaXmIvYgMJOfnUwYhxGdDy28XIM2h2P/B0nev81bwRdc
	pHSN3aJDu6kFchUbijUoA+YxjJnFmXhP4VVhAbql7ZQ+BDS22xfoFcU3MQfnsOId/ptIFAm/SwT
	xK4RL0zvuTKavsQ4r+g+MHYEjo60eVi1yie7nEpWOUo9AnA=
X-Received: by 2002:a05:622a:586:b0:517:899b:7f7f with SMTP id
 d75a77b69052e-51795be149emr52787971cf.34.1780666798498; Fri, 05 Jun 2026
 06:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com>
 <aeb9c03a-0330-4e41-ad33-b884f00691a0@bsbernd.com> <CAJnrk1YPeeCSsQFjaFNROYcOdBO-kTovOTDkCigNKRt57JREJQ@mail.gmail.com>
 <6ecc45f5-4bce-4af2-bfe4-36c69e624b01@bsbernd.com> <CAJnrk1aS=3KwZ3LpiqcK=gKsj7oru-k-1Xpe2j5puDdmn+hjUA@mail.gmail.com>
 <CAJnrk1aacCbOWWWvW2xnQZ0a954-4shXdyO9LBn_Fv_dyUAWnw@mail.gmail.com>
In-Reply-To: <CAJnrk1aacCbOWWWvW2xnQZ0a954-4shXdyO9LBn_Fv_dyUAWnw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 5 Jun 2026 15:39:47 +0200
X-Gm-Features: AVHnY4JGPD_ptnPjrvAN1YoJBN75-CSAJYOFXuIhPgqkboXZbQSh140hkiBoCSM
Message-ID: <CAJfpegtkt1oFNkM2aM1V_9VS10BYEMGsGQJTb6O6ao5gxhbjoQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jun 2026 at 00:07, Joanne Koong <joannelkoong@gmail.com> wrote:

> In my opinion, passing in the buffers contiguously as a pool leads to
> simpler and cleaner logic at the fuse, io-uring, and userspace layers.
> If a daemon wants to dynamically add/remove buffer capacity in the
> future, they can add/remove another buffer pool or another ring,
> depending on their workload.
>
> From Bernd's perspective, passing in each buffer individually allows
> daemons who want to dynamically add/remove buffer capacity in the
> future to add/remove capacity one buffer at a time based on load
> instead of needing to commit upfront to adding/removing a pool.
>
> Could you please share your preference? This series is targeting the
> quickly approaching 7.2 merge window.

I simply lack context to make a good decision right now.  I can dive
into this next week...

Thanks,
Miklos
