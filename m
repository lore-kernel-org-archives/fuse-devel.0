Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65AC1E515
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781300825; cv=pass; b=T36TVDKrA76yjx3Vyz7gN6Asz4nvJaHsuT7/6FUBRap04Hz+rHb7VP8JwrVZU87FmdSyo7TXY6ELjTquJEvoA3RxQTENKcdKWgslgEC0XJaxp9RK3Q9q8cKTJVXVFujOPwQznl6JCbCwrilsdP0+gLN2GZi8OAzo/f+AqL3QL2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781300825; c=relaxed/simple;
	bh=WJONFdPCH2mf664MOKW1x0/NPoSpCusKQR8BM7zAVPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Al1+sMs04rGQRUQQUd8K/8VZWnJGjoLipu3qE4L6MBzOOmheta0eDjtcTWwp5m+O8dHtcDowpKpkmvQQEqdIuu1mE6okDzg5o1zHYc1K96hKtPzwBU1pwMf7ti1+P0AsLOQyCQvEFn8a19M6ki+bHZLDbUeJY5YQWFCGMsYftMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Csz8g1rh; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Csz8g1rh"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4600cbb06deso867911f8f.1
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 14:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781300822; cv=none;
        d=google.com; s=arc-20240605;
        b=MmwlNFVIuPMGLpHC74vzGiM7YEQZEUaVr3hs47P9E7qR9zi4V2NhwIeHmsrEVk7l6k
         H1NmqygLIUAL1xl7s+Zr2gQgWjDemI6klL059SRCJ8ulyMK6NcvW3Y7G7tdoarP8c4Hb
         N+HBRb2Ci10KAWZdSfih/prJ5OAF2+mbsaxQVWZCbq4LftOzgSStOvP6XyN96YUP3nmD
         HOPgzcypdTpYQIlnzBaKPJ/tuiRqCddDxg9ZLQ6gwv1M3N9MUJeOt9aTXzHGuBSiskm9
         UXaHq4n1MLhwV7nqjfffZckwUmJ7gXZE1nkmwxf9a/J99ruV82U/WBqRbVDTm3bfmeWp
         hOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WJONFdPCH2mf664MOKW1x0/NPoSpCusKQR8BM7zAVPI=;
        fh=ZLDcbO/iVF5pN0TodDMLaiuB35NxNHGhbLVH9TCNVBE=;
        b=fhy+J2KOO9HH9nq45jPhWLpdY2wHqOZEXGjlb9l1B6WCTZTeV/NuFZkAr71wnCRzGq
         8O+MtTT14zVmC14gqTU2v/fXw/0elursfPC5EGhjqHjPXTdV20EnPwKA5p0IcwfBqTJ2
         PRKFk+6S/dOUVBEAy88QHkLkraOkwkuWB6jdtkIx4JjEcm3yCu3X6qMAhI+Aqh+PzFw9
         QhYH6V/rZ31g+0PQ5WAelgMFtP/M0O+BKc270VZQBWFs1kImZRqJmfzmXidsFesghIfW
         Miah+Il4gkYD559vUkGKZQBGr4wE56CTW30xDuTEcZmpPT+065YzZdhEQfYJfg6zMZ3r
         vOGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781300822; x=1781905622; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJONFdPCH2mf664MOKW1x0/NPoSpCusKQR8BM7zAVPI=;
        b=Csz8g1rhhLRwQHohtIIkppEdzChaOtBjwHWxkYcx0hym0+p8InuF1cJNM7PKlSaDJD
         tXw5T2A58fKZMMyEcdkjG266NfkEyEbgx4DDS4iVcydpkZDqfe9Tg+yJyXOkdKJ54fy+
         Pl1MmsSPjv0cc4nb18WErue1WqayIlHJxZAgnCepAR97LSU47WMKl4mCmNc8ygDtjYTa
         E+Uh5A0N93YO3UEVMlGtqBfchmJ/llYNYHK60U9C73SiOvEzAk4o5ef4OtcPFykS77P2
         pAPTt0vAEAMBc3f69yuWzAeNvYKx1ITLGw7pVisV5vzXJoRX3q5hJ/Ei/V5awzo0nVF9
         JyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781300822; x=1781905622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WJONFdPCH2mf664MOKW1x0/NPoSpCusKQR8BM7zAVPI=;
        b=IXD9GUIbsBieW1tLprtEO0BsPgwK7RnS9Se3HXB2ZK3RkSZs/2lXMrfdZ0p3r6uDEv
         5y7Capbeqbj1feoVjxp4dXVwbOWAT/BdhdQ1WzYebGHWQ00swm1APl4Br0Oa95Nyb65h
         tUDBS4PtuBxKZINGMrCB7pvV2ZlCz3eOgriDZKhqR+YNAyd8HgnQUxBn4yBzuTU4sGtd
         rjT8ulgCWOl1BVS7gce7j7CDyZGOZvirgLFs4HNzI3djNs9q6HFm7KVqNNlRQ46nEEjA
         Znr9AczVBe/7zS5MZDowRqvB4VnREoadV56o5ZuFVtXsw9QVDJAwSODtDPyQoD0tgQ6m
         1wEQ==
X-Gm-Message-State: AOJu0YxYoAkQMnS80H6OtV0TTy50qNc1/OTzOt5dF3MKvwz/6q/7K8FB
	Sea3xxi1KpT+IfkoyP9L76RKRNvxC2SWEPq4RcMnSEf3FZPPK/YpV6krtHuaGEHnH7U5I9EZOWQ
	6rYb6WDXAqqOxv1vxwE6PdurNX43chTY=
X-Gm-Gg: Acq92OHcwx/k9rVLI+51n8IEVSx4xVI/Tt28v3lqzuukXxhRmo0tSI9ZWKdDXgobLU+
	ah5yTkyLegn3LrHPQ0B/GXFxyDcxFy+ZDxUmcqKd2fd5QJc9/K7lec2qE+XJv2dtQOUnI+qOWy+
	xplLOuPm+FMvsFZD0cDObara2qgfsHmj27EdzloOu/JDakTCdcmGIKmDXEQORlAg6Pm25aXODwq
	u2pSJ5C93b/UnhH+93hpbqkitP782LwNuTSvqztpQhIhB9PkVBLoljmjs/xg4+OWh/u0JUplyDL
	zSyunlBakEERw7syTYnJJ2Vc6drLCewMDoJN4stDM+C6U2C2wAdntxHgaiZtjso=
X-Received: by 2002:adf:e18d:0:b0:460:11bd:3fde with SMTP id
 ffacd0b85a97d-4606f24d00amr6093968f8f.13.1781300821936; Fri, 12 Jun 2026
 14:47:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
In-Reply-To: <20260612210513.1516038-1-joannelkoong@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 12 Jun 2026 14:46:49 -0700
X-Gm-Features: AVVi8CfeV8JlnY5KCFEBs6-lPZGxpTQGqdAP7mf1h3wR4SFbAs5RNBFVAbhBO1c
Message-ID: <CAJnrk1YtpVgELApN4ttFi32UcCcWW9dwv88aJpLwN8C9AmT5=w@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] fuse: add io-uring buffer pools and zero-copy
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 2:06=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> This series adds buffer pools (implemented internally as a buffer ring) a=
nd
> zero-copy to fuse io-uring.
>
> Prior to this series, ents and buffers are tightly coupled where each ent=
ry
> has its own dedicated payload buffer, requiring N buffers for N entries w=
here
> each buffer must be large enough to accomodate the maximum payload size. =
This
> is suboptimal as most request types require vastly less bytes than the ma=
ximum
> payload size and some requests do not require payload buffers at all.
>
> This series allows servers to pass in a buffer pool (internally managed a=
s a
> buffer ring) that the kernel will use for servicing ents/requests. This
> decoupling reduces the memory usage requirements needed to use fuse-io-ur=
ing.
> It allows for future optimizations such as incremental buffer consumption=
 and
> supporting multiple buffer sizes per ring.
>
> This series also allows servers to use io-uring registered buffers as the
> buffer pool which eliminates the overhead of pinning/unpinning user pages=
 and
> translating virtual addreses per i/o request.
>
> This series additionally adds zero copy to fuse io-uring. The server can
> directly access client pages or page cache folios without copying data th=
rough
> an intermediary buffer. This requires CAP_SYS_ADMIN privileges and using
> registered buffers. Zero copy (patch 9) has a dependency on io-uring regi=
stered
> bvec changes in [1].

Miklos,

The zero-copy patch has a dependency on the bvec patches in Jens's
io-uring tree. Since the merge window opens Monday, it's probably too
tight now to cross-coordinate this for 7.2. What do you prefer for
syncing between the two trees? If Jens stages the patches in a stable
branch, are you fine with pulling that in and then applying the fuse
patches on top?

Patches 7 and 8 (bufpools and registered buffers) don't have this
dependency, but to make the uapi cleaner under one single umbrella
flag, it would be better to co-ship them with the zero-copy patch.

Patches 1-6 are refactoring changes that have been out since October
and have value on their own, independent of the bufpool and zero-copy
work. Could you please pick these up for 7.2 so they don't have to be
carried and repeatedly rebased?

Thanks,
Joanne
