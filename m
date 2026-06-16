Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741AF1EEA49
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 02:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781577560; cv=pass; b=fucgyZJjLv2uw46oNBkxCiepIVYm1ezuRNszUs66DHX+ijgkrqCgJRYq4eS1qsZLByRkG/luhwePgz+rwG2AFHzNF2elDRMP+E1GXqE9hMPFKBeV0ZhlOVN0BlsTvRxsjNCpA4oyPjd23Nia1f76c72Xz3Ov48T0TMxLW07V4/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781577560; c=relaxed/simple;
	bh=eFE6fZ1RsdEiMWet9YZaiG3x/gEkqKeMB0pxK+beUNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPnxMP4wAlJAnVA7BfQY1SrZIxxxeTinCwIdZfZuaHhpmTXR7RukbBmfAWIyM0vSqqp8lJ1hEfxuJIfVByKMYwEoXYK4yZ+8z+YymCY7Glj2NButwk/t6HDDtzfQEuKKQ12yRnZ2+3MEozDV5ZoNJiOxsVrt4Uz1pCqBoogqBPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8WvoNv2; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8WvoNv2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so24890135e9.0
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 19:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781577558; cv=none;
        d=google.com; s=arc-20240605;
        b=WEE4NMIFe1btC8B2EKGnny8mJLaeRn7QP08knM/jrD4QyXdl9qqxt02SUj3gARuy4k
         YPjvddXr3fJP6VPb2fFnHfzO7HewxsT+8Rx0WZ9hmAC6zUdEM/kwcBB92fQ0ACYVnEKC
         d92OtHZASkLwGJ0gtD1EhYevxyjHfg2DR1G17QYUfi5g9ALbIcKC347Fp4lonC2NWXL5
         9MpAchodD3W//SjaUZixL75oaMRpRXg4coueMSMDj+CBJWhf0EK7W4VqN6K/1AF2iWfO
         40DWufWdIL+YpIBGsnjP+1fhbz/1G3KLwjCtRoFiFYyQyQMyAX3VAek385dU14TVronU
         ItXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DWR0p+1TpGHgQzXnq2KjJIba8MOShjDAM+VoYOEAHz0=;
        fh=8bUFTemOwDoWiOdOkdFFPfADoT45yqq3f7053C+zN1s=;
        b=KCMAN616EMLMBnyiIc8eB+fWPhhx1Drs11+LAgLk2asrNoBxFbEGd5BZoWLHzvVf7+
         kcV3SuZVlQR8QWrtyxz7lbYk0WH9DW72AtETwK6wFQbvn7djI9K/V9PBFlpZbKOwAn5y
         GkgvM3zK13JmtFE2+vBI9NPtnotQN+EPUFPht5bF6RyvZObAqHzFtkSdkmCQcff/ZoL3
         YIndD9+sAF3YDV9aFm/UCUTpJGO7QhiiZfQUgOVyHBQCcKPF2VeJS6bmhX1F86zI/K3x
         WtjgOds+zMZLeZO0F7nRzA3NfNPZ9ktKHFt7+PHSh9f7Ja/t6IhUQ3ksRlojDCe/dyru
         qaUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781577558; x=1782182358; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWR0p+1TpGHgQzXnq2KjJIba8MOShjDAM+VoYOEAHz0=;
        b=X8WvoNv2p5Pl2Ft57tJxjsRYYtb+w2/S59WOjaHwlKzXcfhDtnw/2HlPKgQ7pvbmDj
         mExoiWfnPwoMeFb6fW4LYX4p0qQLni0JDE+YHAp94K+rh7AEmwNlnGZMMuWJ9Qw3Xboj
         gn4yxti0/GXaPq2G/2/BNhBCCwLkXSE2dC1hC8V8BGhpsiloQ6IorpVkaLxyX4PLa8Qi
         MqK+eCOdsJKUOKGLTEKcT+rzNXJsF8hB51FH4diq75K+0/Lczi92WTMnrt0tmgkDxsrB
         R8syvqNTCNR6J/17fYKLXQDtmZ0uY+rar4uP6zc8XP8LTciYQu4Ojzzvcr8OSze7tBot
         YfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781577558; x=1782182358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DWR0p+1TpGHgQzXnq2KjJIba8MOShjDAM+VoYOEAHz0=;
        b=X1rNnyjUFAc2CdtzYCxxnMjnSuZMPOsMIEcMs6hvZeRicQAxkcgXMCmYqRodP96f3i
         ANxCv9RM60QNGJbXtVUvPinnIb6vrt2IHkkrwOeWN52gj4+kLjRNSWbTsmWwWrBZn6cD
         /NBMZhh6OWAoTBeyHzwCb81ap0B/WSvqc7CigoO2CPOeVey53YVYrVSXRjEAxIzdY5+C
         15t5Ag7expPRlSCA/0s9GjJwK0BvnItoW9Jv/9VDC81aTnfCDMhSCOunDuNSC/ZWBlQq
         kQ4K+z+wxcg6IZ8FPcBvKOqE3bydNXvWRswpa6soxZxismBVzzj43cb7ZnQkD+k8CE0h
         WphQ==
X-Gm-Message-State: AOJu0YzDGKPejr69JXDZbIdOx9+epLh0D+qU/4E7x+afSuYqPNbKYeHE
	lnK8MVyq3f9bK2Q55HXynkKoU4/2IxGzkL2IhcXAGnCf7AIg/btBMdx/0gA6+nGogyi9N3+bcvf
	X7wxGL/NWdsvSWakf/QCFRwnGj37zzf8=
X-Gm-Gg: Acq92OG+RBp0Ge/XrydcWQov8lj0jJvedb0S5xKv+LqXDjQQ6jp5uTVVgl3y2+WRy2l
	IhL+g7dgoF7kJh5IaSiCZgHKoLz+Z0VbxBvBQWcdLAZhV9s58GRofjt/2ojtSjeLK4fiqn58BUU
	6sEJQT/EkRp714lwmTwXiP2IshFmiEHRCyTUZhIVkpZpVAYxMY6EsSl9mW7Iit5tA5b3EFjAl0r
	JktHJrHMa/uIQ+7gaendNpkSoJCEmx77AXkRH2A6USTCkdc2ENbDE/tw6i2gqoYBpk3BYSvNmvH
	NpUI9hcsqCqRn0rwWBOMBE8OrHbQy6QPF6wircFAThO5s0CIwFfjk1XeAno7qSVIh+k=
X-Received: by 2002:a05:600c:190b:b0:490:adb6:7957 with SMTP id
 5b1f17b1804b1-490ec524ed1mr216793335e9.33.1781577556097; Mon, 15 Jun 2026
 19:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-9-joannelkoong@gmail.com> <CAJfpegsHxCbhZ8v1W7KA8A+9mUwR1iXEoxDDk4vhVaPCpw7Wfg@mail.gmail.com>
In-Reply-To: <CAJfpegsHxCbhZ8v1W7KA8A+9mUwR1iXEoxDDk4vhVaPCpw7Wfg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 15 Jun 2026 22:39:04 -0400
X-Gm-Features: AVVi8CfM3ASJIV7f0VOfmudqfqqW-XLeCgOscJQsSjkax0Vads5b0-Jrui0dMPI
Message-ID: <CAJnrk1YCKLPRVAhLSXou+FsicD7Zvu8QgEPYaOkNZivvp9dvLg@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] fuse: support registered buffers as buffer pools
 in io-uring
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 5:06=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> wrote=
:
> >
> > Allow servers to use an io-uring registered buffer as the buffer pool.
> > When the server registers buffers with io-uring, the pages backing the
> > buffers are pinned upfront. This eliminates the overhead of
> > pinning/unpinning user pages and translating virtual addresses per i/o
> > request. This also allows servers to use the same registered buffers fo=
r
> > subsequent backing store I/O (eg read_fixed/write_fixed), keeping data
> > in the same pinned pages without additional pinning or mapping overhead
> > required.
>
> Are pinned pages accounted and limited?

Yes, pinned pages are accounted and limited by the kernel io-uring
infrastructure (in io_account_mem() in io_uring/rsrc.c) when userspace
registers the buffers in io-uring.

>
> > Registered buffers require the buffer pool (FUSE_URING_BUFPOOL) to be
> > enabled.
>
> Is there any particular reason for this?  Not saying this is bad, just
> wondering...

There's no technical reason it can't but it keeps things simpler (with
the buffer pool, userspace can more optimally register the bufferpool
into one fixed slot since the buffers are contiguous), reduces the
surface area of configurations that need to be tested, and allows the
feature to be advertised under the FUSE_URING_BUFPOOL capability flag
during init instead of needing a separate flag. I think in practice,
servers that would want the benefits from registered buffers would
also want the benefits from buffer pools, so I don't think we're
leaving out a wanted use case.

Thanks,
Joanne
