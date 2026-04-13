Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FBB395266
	for <fuse-devel@lists.linux.dev>; Mon, 13 Apr 2026 21:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776116033; cv=none; b=S/lsihGjOgkXDObEIKm7GYWxz0Nt/PCzgyJqwlvlu0RleUIMAgFog9opIClREV+GQdGlKzfOXW2JWidqZqjdZvfRxASQujjtciiNU5Bzq30aMDGoiYFI+fvH2jnwEHv9a6i3Dm2hlO3iUTrlbEb4Y1QI4UOjS6fzQh7SrQzA074=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776116033; c=relaxed/simple;
	bh=E/RZF3fthkTE+ZcEUowB9eO2oQsp/Kexn7L4bb4z1uc=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=eYQQgrhmTmuw3nIyvV7VEemZD6PH3lZlr0WQ9wpXi2n2Pe43QDf/nAGyhKRj5gJ63gfXH2wYytfOfobrmDjAe7iq93R+p79VIfHkvMoRDRtEiqx/y+gdLkAVHQXC2KVe1D+3NJQURBJAF4rMZkiz+7RpTvihR4dHoSMXX8aUPi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=niova.io; spf=none smtp.mailfrom=niova.io; dkim=pass (2048-bit key) header.d=niova.io header.i=@niova.io header.b=ULwzfUMv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=niova.io
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=niova.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=niova.io header.i=@niova.io header.b="ULwzfUMv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so3148143f8f.3
        for <fuse-devel@lists.linux.dev>; Mon, 13 Apr 2026 14:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=niova.io; s=google; t=1776116030; x=1776720830; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:cc:from:to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vzv1DWYUygqhcbUAlLqvn4fRhhrF9M7ub6xcGkeJWuo=;
        b=ULwzfUMv3SJmZK9vab65bWo35In9K0X36L0l862SrVDdDqUVWdkbUa/gu2OMTPnRTK
         LCK40RjeYbdMMJSEVACKctC4gtCZ8P3CJeoNVfhIRHp2lPw+F/p9gHxYaSAPuaOGLd0L
         Pub3a8yW96iAoG974L/kuO/iSZbgD1t1DvOrye10TVtyh4WdIunIzHnPidzDonAdXtvd
         gUBgeKOLjYApA7sw3tUTQEwYyuS/tFLR4K+va/rymOsouwzBI7Z+/KhqSXmf/AnpyHXS
         hlnn3ZX8ALaC/b3pMAj4VHDgzaLXkr0EMNsGd6J/DTImrLiAo7hmBcyZi/Whg7SavNU7
         p+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776116030; x=1776720830;
        h=content-transfer-encoding:subject:cc:from:to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vzv1DWYUygqhcbUAlLqvn4fRhhrF9M7ub6xcGkeJWuo=;
        b=Bgp3zloQTYKjcWIhd+sl1D+cRLP6T6ZznnyXIxAGZ4Sb7ypBI8TFW9WrtLtmQm0rzG
         lQMtmDLTnekj4apCn4vJbzdFMEtXtylgsBYg4wzAEk2Nctypj/IUd5vQpYyC+I8svurK
         RORHOAyle/GDPQPNZXGNHZ3bAUgQ0JLo4pbMSkp2AxZFfYG2amhzkCKbTxNAZ/duk04v
         OivGfUHO8fhffTsTUcEUeIxAnjNQuQKl6BKQYYwB9skW21CV7LnllG96V7Ix+tNCpBSs
         IiJokDP5+yFJLIOel5rmoK8Ea+EONou8hTrqWiOEaYztvfME4etzCT7fw2AqAt7ue9Ai
         vyQQ==
X-Gm-Message-State: AOJu0YwwrCn8D+u6o3a0RKczkXm2Ylovzq9toMakbpT7XU2bFQOMztgG
	lkXo8685vU4Rc6ZkiBQMBILg4V3xSDpDCXmOzMyKNzbp343w78gZR7vRd4wJFLYpRaTm3AS4M0r
	7MpRO
X-Gm-Gg: AeBDieskLyf8EIzdf/zAF/uiBa5u1Ktiy6vSDpkJV/MdsCK4nTjQ0Kl+osnGdT72AQP
	dVhJtrJonmPYD6h+y6M/5g5JsjcjajH87jVBGi6/3HBUw+BQiwzYhHqUhxmtJyqn/mv2VW1y9so
	sxKHWaopcI8Ddk4Ymh7zSVNUUgyKEjnqjGO+gWhBkJ6+eDu06nrAfagOo92xY+w3xBhTJ+E5iCM
	czUFV5UmUD+qONRCwe6vkeO3pVhGghBuqC55mdCUX2aCMoNnkrtRbIu08R7SvplH6aQCDM97B89
	fI+XjzVVcLczkkB7MyL1IeXsIx2+Dt0AgKggOlr7EKAhYpK0aqSVEyUWxBGHKU0FCU2f7sATfpL
	8hwjWjI5c+Fn6onScfaweGlg5h2qnHu0Es5XXb29gA9O42AuIO5K1I2Y/669mHqp+X/NW+rN4dX
	BQfMOn8/bR1WmFr3hAdXywhDx60bp6ihrtRBJfqxFy0ZtmoffqsjYDE1zhDsLTTnntOGJI/b+U5
	D/obJnQHKbhQinIaMHHKDSJlBgsoIgZHG256cSkXC4UIv4pOaTdGKD0
X-Received: by 2002:a05:6000:1ac5:b0:43c:fa96:d939 with SMTP id ffacd0b85a97d-43d6429c737mr22577854f8f.22.1776116030111;
        Mon, 13 Apr 2026 14:33:50 -0700 (PDT)
Received: from ?IPV6:2a01:cb00:1870:d900:6453:5464:a83f:ca58? (2a01cb001870d90064535464a83fca58.ipv6.abo.wanadoo.fr. [2a01:cb00:1870:d900:6453:5464:a83f:ca58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7b543057sm8725777f8f.6.2026.04.13.14.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 14:33:49 -0700 (PDT)
Message-ID: <18936160-308a-4817-a295-54eef43707a3@niova.io>
Date: Mon, 13 Apr 2026 23:33:48 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: fuse-devel@lists.linux.dev
From: Bernd Schubert <bernd@niova.io>
Cc: Joanne Koong <joannelkoong@gmail.com>, io-uring
 <io-uring@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Pavel Begunkov <asml.silence@gmail.com>, Ming Lei <ming.lei@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>
Subject: fuse/io-uring: Proposal to support pBuf in additon to kBuf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joanne, et al,

this is a bit of duplication of the discussion we had before, but I was
badly distracted with other work and also switching employer - didn't
manage to reply [1].


I'm still not too happy about kBuf and its restriction of locked-only
memory. Right now I'm reviewing your patches from the view of what needs
to be done for ublk (for my current employer) and also for fuse to
support different buffer sizes. Let's say fuse only support kBuf and its
restriction of pinned memory, I think we would be forced to add support
for different buffer sizes to the current ring-entry-provides-the-buffer
and the new kBuf interface - from my point of view code dup.
If we would allow pBuf for fuse, we could put the current
'ring-entry-provides-the-buffer' interface into maintenance mode and
support new features with the new interface only. I know you disagree on
using pBuf [1] with the argument that userspace could free the buffer.
Well, if it does, it does something totally wrong and the same could
happen today over /dev/fuse and also the existing fuse-over-io-uring.
Just the window is smaller, as the pages are extracted from the buffer
during the copy.

I was looking into what would be needed to support pBuf and I think
io-uring could extract pages from pBuf when the buffer is obtained - it
would limit the window when userspace can do something wrong in a
similar way current fuse and ublk works.

Suggested changes:

io_uring:

  - io_pin_pages() gets a 'bool longterm' parameter.
The new pBuf path would pass false, every other exsting caller true.

  - io_ring_buf_pin_user() / io_ring_buf_unpin_user()
  - io_ring_buf_get_pages()/io_ring_buf_put_pages() -> fills the
provided bvec
  - New struct io_ring_buf (in cmd.h)

struct io_ring_buf {
       size_t                  len;
       unsigned int            buf_id;
       unsigned int            nr_bvecs;

       /* private */
       u64                     addr;
       u8                      is_pinned;
};


Fuse changes:

  - fuse_ring_ent (bufring union side): payload_kvec and ringbuf_buf_id
    replaced by io_ring_buf + pre-allocated bvec array.
  - Buffer selection under queue->lock removed.  The lock only protects
    request dequeue and entry state transitions.  Page access happens
    after the lock is dropped, in the context where the copy runs.
  - setup_fuse_copy_state bufring branch: is_kaddr/kaddr replaced by
    iov_iter_bvec() and would continue to use iov_iter_get_pages2()

What do you think?

And my current primary goal is to let ublk to support multiple buffer
sizes - ublk would also need to get support for kBuf/pBuf and I'm
current assuming that fuse and ublk rings should just get multiple
kBufs/pBufs and a config options that mapps bufs to io-size. I'm still
looking into details for that.


Thanks,
Bernd


[1]
https://lore.kernel.org/r/CAJnrk1armV9VzBqrrdfr15K5ySBx2YJRk_P0okGnkzyMx_eDOw@mail.gmail.com


