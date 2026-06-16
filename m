Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B794218A3
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605337; cv=pass; b=M/oPnjSMd+lJxg+z/VhK7qnrMzAtOawoWvQif/P4wKFlRWIcvdfXp9X64uLvXYb/UJa00gPjusvLjsmocpBzO2wSp740TnOcIjNGx9ysK0Z9EXRP0d43HYOK1pNshWDOWTdZtn9y3bB6phoE4gw9D5RcCdpVNT7/1TeOd7awELU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605337; c=relaxed/simple;
	bh=S4fds6jzVyK/oUe4rB7RLL4+jcFWYbuMZ/DZgJm2qhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgegBl+wHZ6qoLm09RcWgjtRpjyNidhL6usgJphV7+byMZocudBf7ATMbScgeKAksH2WqtJ2Nrb6ZJ01v1urEVCE5kxDNORXW4lSCbtif2MgaZ3NH238hPBZBjo+AtJkB1SJ8eyRn07QKxoEgcDyLss/oTx6WxTaDjTuqF23u4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=T3yqXEbk; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="T3yqXEbk"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51780bbc560so45775881cf.0
        for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 03:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781605335; cv=none;
        d=google.com; s=arc-20240605;
        b=E1qZTbTjgscoGzC0A+Uhczf/e54lT5MxMSOceIf4es1P/tL7VFyITx9pdef0x+qpa6
         BSkC7zGY9wBKw+/LV7nkXwicMFdpo6RDK283FQzUu0ngtaze6yWCFART+w/kPMUY3Y+o
         TGqjDczUdwl2/Mxt1SIWvl+BUPaOaMqWsJyJjllnLupwKhmwvJh6g5JTnEOVxmizlGR3
         5jDPmrG1YXZVv+HF1Alosz30oUMHbfwJV3aXE7/wdI4Zz7qcRwdO7iD+iFtOp53UPSgx
         GMs1BYzWjgy/fgM6vsA0ma0rWTYmAoCmlcntGlu8pZ75eGcWPzCF6+U/qTFAKPPszF3n
         eubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kJJGYvnNh0PlpDeM+wZNZXCZz59jiTwpPfkFs4ab8F8=;
        fh=w2Dy9MBCymTAHXuuQoFoyTRhGtZ+o5YcX5Bg6rpudfc=;
        b=bd5X4Ao5mv2EyiDbblJAzDZPsmzK8rAIy0cOjTAUEqmeKC08LGuiNByPdtfMDQpBut
         0Wz+axUq/+wtLU5fU6wYITyneyacmjd1+Te9BETeAlsNJOE/bHrWYCruvc8izEHE5j+A
         YNE9/iNmoNygaBVo8aNJycJ+2CyAbKh1GKd2/Eg0tVeG4/1L1MRynnKH8qClNb6BH6dT
         RwJatpCxCI5lH81Dxeem1bfV+ErbTXVlmCYMoEgzQ1Ib/qrDqlLVmu4VcDeyp0KMNBVi
         oFH2hbpyzmdLe1Uf+iNVN5QGpUJq8nYHn3gi7+VGfg5dGiT5LN9rPxWRZqVIEiVciZGN
         X8MA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781605335; x=1782210135; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kJJGYvnNh0PlpDeM+wZNZXCZz59jiTwpPfkFs4ab8F8=;
        b=T3yqXEbkZETZZIsnBggTZ9jARXS21sAkcdKMIWMdldJ8TEf3o5zWP7efmdEBEuUK9c
         sCOf3Q16yv/wF9iJD/HGIXAurVQGUOHrO7bvLxDK+pK7BVkk3om0PSOM8qLBtuBQEeQM
         NaY+6Mj0/vxoTnf/KAvAZNZJy+jbXF39ulJM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605335; x=1782210135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJJGYvnNh0PlpDeM+wZNZXCZz59jiTwpPfkFs4ab8F8=;
        b=iUnpdr58X/mcnONIfo+pmv/+8d9pnrgFGJ6cH08BzXFvZ1LdOSyCy8CRNIuC7EBh4m
         erBzvAopnTVQwy95mu5DlqUKb2cy0b7VQsCD8i6NJhsAabbFqA70Dhr2NZsARfjFRh5F
         dQZhy1gCLf6Zg8rIuAxLi3HurQHOchZu9zWfIVGpNIr+LCvM0Pv3xYgk5hSTpi3KaQVj
         gTZKBR5OgrhrlsnfNe4yqtrx9vwWsPDPayfL9BgmBEICIQArOf9tIci3P5D1brltTfvU
         nnhLsGNUIiWsZq/kWWSHGfUO49F/Ammw0Wn+tzVcQ0pKnSzKxQbhDwQMG+bAPMyzy5ng
         hv7w==
X-Gm-Message-State: AOJu0Yxl4x0gRBXZZNAV2qkWpnSNHX7YGxLel18F0ktgM4NYte1KBM7w
	0CMK8/DURhxzzN7VBhLAlwkyxaEAYrU26qi6EQVNAtmwndkdNQvYSYAtNMACaUsr6rOzuCJLWia
	OIL0z0TjFsGm7VP1jvGUnuSxKiCMTajirqSbOyjpZfQ==
X-Gm-Gg: Acq92OE2dywn/M+VJc3468e62HXtDYjenyT+BpW759he/d5Qm2tLWcYxxD79ZDqEL1w
	IBBwbT1ZIYiyfSCE0tTxuIuvJEdqM+ZaSyJfV6D32AmEE/MX9ZP+bTBAD3YdV+tXg0fiOKzpQf1
	ljeRjnTubl+T9ErSx7ZJ/PLvEdyn60sswQiVq6Vwv6RyMPDwIvf0QwYLesxBjEODmyQGTMrbe6v
	wpQelWiRVkN9T8K8K9PdPIkKlKFthdZy53IfTdU9eq7iPjGjz/wPoDHAX4nRwR6sluHZw7by0eg
	V/BipU3K6m5iDTQcmXrKq1qb6sWLQWoBoMRUDg==
X-Received: by 2002:a05:622a:281:b0:516:e6e6:63cd with SMTP id
 d75a77b69052e-5198de0f07bmr38171471cf.2.1781605334942; Tue, 16 Jun 2026
 03:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com> <CAJfpegt8sfO681aoixfCc2XvUP-OH50GVHG-vmF8Q3oGqxF9MA@mail.gmail.com>
 <CAJnrk1b=Mxy0N+QKjFZwb92arUVDRzz9PJVXvsZSmPq65bsbAQ@mail.gmail.com>
In-Reply-To: <CAJnrk1b=Mxy0N+QKjFZwb92arUVDRzz9PJVXvsZSmPq65bsbAQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 16 Jun 2026 12:22:03 +0200
X-Gm-Features: AVVi8Ce5Nz8X32bT3vUWgPXzXoufJ3kHLtb5whMWxD_wBHy7NfF-_O3eNMcFg6U
Message-ID: <CAJfpegvfyawxKmL923ZwcTv8JNhCYhz-eXGQ=-b0bHgMSYW=Zw@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jun 2026 at 07:38, Joanne Koong <joannelkoong@gmail.com> wrote:

> The server knows the starting address of the bufpool (since it
> allocated it) and it knows the size of each buffer in the pool. It can
> compute from the buf_id the address corresponding to the buffer.

But which buffer?   The interface is supposed to handle multiple
pools, in which case the server needs to find the pool and the buffer
within the pool.

FIXED ops also require buf_index.  Things are getting complicated...

> This would have to be returned as part of the struct
> fuse_uring_ent_in_out. There's currently 12 bytes that are free to
> use.

Does the 12 bytes limit come from the cqe?

> Returning buf_id takes up 2 bytes and I think is better than
> using 8 bytes to provide the buffer address. However, returning the
> buf id makes adding incremental buffer consumption in the future a bit
> trickier (eg the server would need to keep track of the offset into
> the previously used buffer and do any alignment rounding up). Maybe a
> good compromise is returning a uint32_t offset that corresponds to the
> offset in the bufpool? The buf size is a uint32_t, so I think this
> would work just as well as providing the buffer address directly.

Yeah, offset sounds good, but still need to select between the pools.
So should that be the "pool index" that would be the same as
"buf_index" for registered buffers?

Thanks,
Miklos


Thanks,
Miklos
