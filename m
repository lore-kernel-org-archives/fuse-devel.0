Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FEC2AD3D
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776354536; cv=none; b=Yu7eMDWXbDn89OUMKnUGKQw5XryJ0RLnSIBQlq2odpQZUD6mXv/JPexNX+lWBGt8TVmXCpl3Tp/0KmIvKGDdLkATz6oT4+JHfMVL5CVfwhdRQizuW5SAuByhjoLDfSe8noxj/WZuZMQ65B2tMiIDKjNQzDpNgkHqyfrC1Jco0rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776354536; c=relaxed/simple;
	bh=ntlB2gooO8+TyNTMEG5S9IQ8W4EapIAf5AUFUUbVLEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNZTTIfvlzO11IKRgw53ruo/wWMqyhQH6xZqig4ZJ6zr4YE/3eISsRvaAWLPO1SoSHzlTopdOZW/Amqp34MmzE/A50hdtv9mBZ4vQb76e1EChoO+odkEAt1NY4/IEMnTO95h5cIttcEXddD+KodyvpVn9DD5UUmM+QbkVR1imdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5VuasgX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5VuasgX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ad9516a653so41618125ad.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 08:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776354534; x=1776959334; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OIHUIp0RxecXJX7Bf3PUl8SC3EM5FeCaTyjb7bZag6c=;
        b=c5VuasgX6ALN6LUS6tGxWcEIT5KbRMhQ+5+guQDbJ+OszWW5+Gh5arZwd7zEiV/enl
         j9ygqgZknp8H9JzHp01XBqZKn0WJgwINTBduI1jzNGq73A5CgaUrFpFj5usUNzEZq3V1
         /Vmu7Zv9pS0vAIRJKIEdEhnpD7Hp1iUPA466JB0kfwTsOlaLeveaGDqN00OsChj2u+v0
         bw/mZ8v4grPTaOO0RK7qcrj13gBCAcc/iOML9fRCJzrfDWbaBmK2xzY9cgRalOMsRxKZ
         Jcep3uO1AiboHOTC6QUhRQMdH8PuxDLh2rHE9BOTeAp0fid65g22k04r0/p8QLhFVa4X
         FkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776354534; x=1776959334;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIHUIp0RxecXJX7Bf3PUl8SC3EM5FeCaTyjb7bZag6c=;
        b=iYfl7Nr3w3nP52iTmb+0uFWSNZPzzvbJcyiP09KE26iHL5zuld4cJyxAbqmMEq/be+
         teNkfM/cJB2U2QwC51J61ZuUB96CiZaXef7KTHy08VnxWcIdOMUKohd5Sjo5rDgZjOTz
         UPXnffy2QbxHcXCT5oENqfxd+ueYw3EWl67NYRbglAaE9JzFR4Tk2jImuip/t6nNAsxW
         jukhIEmRGRhjVl61d6P2tKydMta6rIwWLB2tOf1QYxOhiaJIk8V7y89Qynqh/Tcr9AcH
         /5FzyY9VixYsgOOF1o12IEdzU6Gu3ba2jXkxIDdleY5HRgN/Pg6jhptOvh14H8QzC3v3
         hMAQ==
X-Forwarded-Encrypted: i=1; AFNElJ96ZmE1dTm3t4+Ql3SWP1lBErGDNPzjSvdI9hd6d3ZT4nYn9VW/SSxYvUZ319ryxjxGYXQeu6mLGTLL@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3pL4BLaOKkjuZoZHounkp2AMbjNGMZP3MIh1qW8vm2YWLBPkT
	lmrqQ4tmOr8h4spnYIcZdB9oaDcwJ4egNYfocTzrYdLMZDR/p598Sdoq
X-Gm-Gg: AeBDievxQE+ofJLIkm16uyxpowjrIoKmwyNZqYxMuggtTDzInjMWjKaEEgXrb+m4zap
	ZDNVd6zG73FSYlheZtZC4h/BwxQeFdr1IZmLS5nZB+3x9MZ8yQ5cwk0kMWmAqVMt8jkBxdhsoUF
	H2es2cqGnJXZrqQcBI1r/+IZpS4Pi5aPnk4ducD/1COS9m2WrxVlmr4930ihJ9fkGQSl8JmIOJp
	Hnq3U50uDkx5OdwBZPiIWD81ehQ/V4kLIV7tfRtApK0QQyclp05gxJQG8nNZZJlO9clyCzyhngv
	TydEbKD9YstAJN/9f736Y+JHVqY0l0oIXpbrIK2Hk9Wpy+cGDTtBVQCsC5s3NPR0S7JTVJKxNCi
	bf3TYWBfqeOq2Km7ShA5cC1LzninNcY8CTxUG+8SE07qGXsWiGqymuuKUvbTldt2LFGFRPP8JCl
	1MM2xaMfIVTaisi/vXohCiKnX1krl7g7Ka34M8DLx8/lkaC8Ss2aCy6htI//nfkMuMuCOswU/8J
	IhawuJ6jtsLYUE=
X-Received: by 2002:a17:902:c7c3:b0:2b0:61c2:8e7a with SMTP id d9443c01a7336-2b2d5a14be8mr202948645ad.25.1776354533841;
        Thu, 16 Apr 2026 08:48:53 -0700 (PDT)
Received: from fedora (173-245-219-252.icn.as140952.net. [173.245.219.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47810b70csm54090905ad.23.2026.04.16.08.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 08:48:52 -0700 (PDT)
Date: Thu, 16 Apr 2026 23:48:48 +0800
From: Ming Lei <tom.leiming@gmail.com>
To: Bernd Schubert <bernd@niova.io>
Cc: Ming Lei <ming.lei@redhat.com>, fuse-devel@lists.linux.dev,
	Joanne Koong <joannelkoong@gmail.com>,
	io-uring <io-uring@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: fuse/io-uring: Proposal to support pBuf in additon to kBuf
Message-ID: <aeEE4FVGdi5RqKs_@fedora>
References: <18936160-308a-4817-a295-54eef43707a3@niova.io>
 <CAFj5m9LeM4S82QEsRQ0uQiXj1eWCFAW3v2fLTxUj1YM7UO-V9g@mail.gmail.com>
 <fcad39e2-37b5-46a9-a280-2315e0397985@niova.io>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcad39e2-37b5-46a9-a280-2315e0397985@niova.io>

On Thu, Apr 16, 2026 at 04:46:01PM +0200, Bernd Schubert wrote:
> Hi Ming,
> 
> On 4/16/26 15:49, Ming Lei wrote:
> > Hi Bernd,
> > 
> > On Tue, Apr 14, 2026 at 5:33 AM Bernd Schubert <bernd@niova.io> wrote:
> >>
> >> Hi Joanne, et al,
> >>
> >> this is a bit of duplication of the discussion we had before, but I was
> >> badly distracted with other work and also switching employer - didn't
> >> manage to reply [1].
> >>
> >>
> >> I'm still not too happy about kBuf and its restriction of locked-only
> >> memory. Right now I'm reviewing your patches from the view of what needs
> >> to be done for ublk (for my current employer) and also for fuse to
> >> support different buffer sizes. Let's say fuse only support kBuf and its
> >> restriction of pinned memory, I think we would be forced to add support
> >> for different buffer sizes to the current ring-entry-provides-the-buffer
> >> and the new kBuf interface - from my point of view code dup.
> >> If we would allow pBuf for fuse, we could put the current
> >> 'ring-entry-provides-the-buffer' interface into maintenance mode and
> >> support new features with the new interface only. I know you disagree on
> >> using pBuf [1] with the argument that userspace could free the buffer.
> >> Well, if it does, it does something totally wrong and the same could
> >> happen today over /dev/fuse and also the existing fuse-over-io-uring.
> >> Just the window is smaller, as the pages are extracted from the buffer
> >> during the copy.
> >>
> >> I was looking into what would be needed to support pBuf and I think
> >> io-uring could extract pages from pBuf when the buffer is obtained - it
> >> would limit the window when userspace can do something wrong in a
> >> similar way current fuse and ublk works.
> >>
> >> Suggested changes:
> >>
> >> io_uring:
> >>
> >>   - io_pin_pages() gets a 'bool longterm' parameter.
> >> The new pBuf path would pass false, every other exsting caller true.
> >>
> >>   - io_ring_buf_pin_user() / io_ring_buf_unpin_user()
> >>   - io_ring_buf_get_pages()/io_ring_buf_put_pages() -> fills the
> >> provided bvec
> >>   - New struct io_ring_buf (in cmd.h)
> >>
> >> struct io_ring_buf {
> >>        size_t                  len;
> >>        unsigned int            buf_id;
> >>        unsigned int            nr_bvecs;
> >>
> >>        /* private */
> >>        u64                     addr;
> >>        u8                      is_pinned;
> >> };
> >>
> >>
> >> Fuse changes:
> >>
> >>   - fuse_ring_ent (bufring union side): payload_kvec and ringbuf_buf_id
> >>     replaced by io_ring_buf + pre-allocated bvec array.
> >>   - Buffer selection under queue->lock removed.  The lock only protects
> >>     request dequeue and entry state transitions.  Page access happens
> >>     after the lock is dropped, in the context where the copy runs.
> >>   - setup_fuse_copy_state bufring branch: is_kaddr/kaddr replaced by
> >>     iov_iter_bvec() and would continue to use iov_iter_get_pages2()
> >>
> >> What do you think?
> >>
> >> And my current primary goal is to let ublk to support multiple buffer
> >> sizes - ublk would also need to get support for kBuf/pBuf and I'm
> > 
> > Ublk server is just one liburing application, and it supports all generic
> > io_uring buffer types, so kbuf/pbuf should be fine for your ublk server
> > in theory.
> > 
> > It really depends on how your ublk server is implemented.
> > 
> > Maybe you can share your motivation first before discussing kbuf/pbuf support.
> > If it is for DMA,  there are other candidates too, such as hugepage,
> > recent added
> > UBLK_U_CMD_REG_BUF, ...
> Joanne had actually removed kBuf and switched to pBuf alone and that
> simiplifies things a bit.
> 
> Motivation is to reduce memory usage. Let's say you need 4 IOs of 1MB to
> saturate streaming bandwidth, but still want to get smaller IOs through,
> for these smaller IOs you don't want to assign the 1MB buffer for each
> queue entry / tag.

Thanks for sharing the motivation.

Maybe you can pass UBLK_F_USER_COPY, and each IO buffer can be allocated
dynamically completely from userspace, then pre-allocation can be avoided.

> Zero copy is currently still out of question for us, although I will
> look into your recent work for integration of eBPF and if erasure
> coding, compression and checksums could be done with that (I guess
> checksums is the easy part).

Got it, compression could be the hardest one, however, the recent added bpf
iterator based buffer interface may simplify everything. I'd suggest you to look
at it, and provide some feedback if possible.

Also if your client application uses direct IO, recent added UBLK_F_SHMEM_ZC
could simplify implementation a lot, meantime with zero copy & user-mapped
address.

> 
> Ublk already has UBLK_F_NEED_GET_DATA, but that has two issues
> - needs another round trip (testing on my laptop shows a perf loss of 10
> to 15% per queue)
> - It does not release the application buffer on read. I have an idea how
> to fix that, but here at Niova we would like to go the dynamic memory
> appraoch with pBufs to avoid additional round trip overhead.
> 
> Idea with pBufs: Several pBufs registered per queue at registration
> time. Every pBuf represents a different IO size. Optionally as with
> Joannes patches [1] the buffers can get pinned to avoid mapping to pages
> for every access.

I feel the plain fixed buffer might work too, but I may not get the whole
idea yet, looks I need to dig into pBuf first.

> I'm currently working on a patch series with some luck will sent an RFC
> tomorrow. The harder part compared to fuse is that ublk_drv does not
> have its own queues/lists so far. This is my first work on block layer -
> I'm not sure if internal struct request queuing is allowed at all.
> Testing will show in a bit :)

Great, glad to take a look after your RFC is out.


Thanks,
Ming
