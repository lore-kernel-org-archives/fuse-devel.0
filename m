Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4DA3B635F
	for <fuse-devel@lists.linux.dev>; Fri, 17 Apr 2026 14:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776436551; cv=none; b=GH3s8kspZJQVugQ7spnYEKErPw5XBFdzjfnWbYdKcXhl3dC+h/8mfBR1MJR/colU0K4jvrwTtagayiTh5Q4zwBaNINLfF2zZ3444lPjijsPf3mJKhoAg/qoR5I3+6Er5IU0v5KkR63718aO/OOeqOySK7hOU07GY+DaMCHC2fQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776436551; c=relaxed/simple;
	bh=zLSRvxuJezn5knvIQBgSjbQdMRyyImGUoozeC/CsSOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/VMfz1dtq7RY+LNe6M6yx+SCLY9tj/Mir/ffxETYbkcLCwF+B+XZOUnH0jgSqDYABzdIlIqEtyu0Uz9QOgSvT9IL1S9hTYZjveIurPTJB5QSXEUK/o+rrd79nXVXHcNSF9Mu1ecMk5ava6L+AKLl184Tb4DPe826pamcwJpWag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSkHEiSj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSkHEiSj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso8193515e9.2
        for <fuse-devel@lists.linux.dev>; Fri, 17 Apr 2026 07:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776436548; x=1777041348; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jA3YbhSUsNdLppcNpGxb5cEbWpDvT0O/nJo4+itqimo=;
        b=fSkHEiSjY2sD5sAmizOU6ELLRVMKjkAe9JkfA2dz/bX/uLYR+yBuwWDrAf7OeKmN+9
         V0PTzEm/wfIUKeK+8EVvEQ5jov7Xz8pZ+Wfl6GYc1r/2tcsRD4wubCwxl45tPZay/R3C
         dr1x+rf0CQeOrpwq22A9JQlpIaz5G425ToHGTeFJ0O0t7TclZTszfabQvt0seS2pef5H
         sc7KGLBMDNH8WyLPXItVb8ESyB6JBDUMKJ/t5G0PB4PZYj6mWoGPiEwwJSkpW6PLbL2y
         AUwF2dkRxcS+0hweqm3UGJ8W0BTFQztepQdxVDK4YbcseCLTBuNXqlzBGrrDRKxLpqBI
         NVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776436548; x=1777041348;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jA3YbhSUsNdLppcNpGxb5cEbWpDvT0O/nJo4+itqimo=;
        b=Ha9tvLxz/feVHB1NfDNX2gUBvcZDhJh+Fkft/aAvFFvJTl+KolqDOOk8+vKUDc0MAM
         WlLoO+PbLgqn5BeHzMkVtm/gJeKYmdhf63tIgYnZtcSWaCAZC+Yljj8Wg3xRT0Tbn4v7
         inRQ05hsIE+bmD90B/bDYiYbH64tffdHNwUCVs4tXRME6VewBgMKOcrPEmfGaFIWRyzA
         5ItPStxigqli8n/y1f8QSzGlgoCddQsVd7MFgyeGZZP0354ImzdNUOSKJMTbRqY2g3ji
         qvJQ1nB6CtNq7A9+2nmxvhI0aNkZdnnwOgdXzjCHHETnhAHifZ/JhjUdojGCtwFGtb4q
         GUpQ==
X-Forwarded-Encrypted: i=1; AFNElJ81dTRRUHXXizQ+dJd97QeOzQoBHG8rm+QgzSSi7KvPpP9gY2MpG7rVTKLQPrJuC/iwDorF3S/hNCUr@lists.linux.dev
X-Gm-Message-State: AOJu0YyxGjaOX0844SiidesU/bN23gf+O7hPlxwf01OyJ8sxnq85S72y
	H3t7utOtJFqSkDplnimaJiQO5fiWlH/pzP6dN63IcH96EfQZwVf+ykGQ
X-Gm-Gg: AeBDieuYZpUbpBfHm2WTUoJCN2tIiDGTYQ1Mh5v2+CG1RaTpknqAg6T/b3PPlRIDeDW
	gqZWfN+IuxCsqkJ9y9CVa+Z0Hut3S2i9zDdjY+qoeTbPCMky8FIp3S+rV8segsl5bkAc6qi4Tgp
	Fl1O3MTQ1xBs54N87F4sqKt/tAQqjcJY+wbhsCwv9I0glJp0XsoM+C4Kxl5N4W/E/7t68b5+ii9
	UGIXEKZO+C/+a1JmSn8ofUx51IIL/BSDvRFVQ+MWkCxy8FACPLAg3SEk4WDkrlfRzAQUYfyrE5Q
	/tRDFN+LTlvky1Dp5nTpct/J1z3HI2n1wDoLvKzbyc40gub5XDTj3bxA6aeU/cnLgMqInB1iP7B
	WBRBqEXzoPzINM0ACNkLdDFdYKwR35E0zDEY6q0Oe0YrIwhHfTLlxM9BoFPtTUUCDaFdUZ1ym9o
	DdlE1NctvPRJQKiH9hxaSPDrJtkWAo2P1eEG5qlrldYZTk5b9ed5QYWbKGzYjogWFEbuoZPpRgn
	raStQZxQQ5EoWUoZ5LqjGys440Seg==
X-Received: by 2002:a05:600c:8183:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-488fb750809mr45782885e9.13.1776436547740;
        Fri, 17 Apr 2026 07:35:47 -0700 (PDT)
Received: from fedora (185-147-214-8.mad.as62651.net. [185.147.214.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc16f93dsm69109315e9.3.2026.04.17.07.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 07:35:47 -0700 (PDT)
Date: Fri, 17 Apr 2026 22:35:38 +0800
From: Ming Lei <tom.leiming@gmail.com>
To: Bernd Schubert <bernd@niova.io>
Cc: Ming Lei <ming.lei@redhat.com>, fuse-devel@lists.linux.dev,
	Joanne Koong <joannelkoong@gmail.com>,
	io-uring <io-uring@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: fuse/io-uring: Proposal to support pBuf in additon to kBuf
Message-ID: <aeJFOmvCF3ArL9iq@fedora>
References: <18936160-308a-4817-a295-54eef43707a3@niova.io>
 <CAFj5m9LeM4S82QEsRQ0uQiXj1eWCFAW3v2fLTxUj1YM7UO-V9g@mail.gmail.com>
 <fcad39e2-37b5-46a9-a280-2315e0397985@niova.io>
 <aeEE4FVGdi5RqKs_@fedora>
 <55db9a65-4408-42d2-8958-3bf3aa79d554@niova.io>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55db9a65-4408-42d2-8958-3bf3aa79d554@niova.io>

On Thu, Apr 16, 2026 at 09:13:41PM +0200, Bernd Schubert wrote:
> 
> 
> On 4/16/26 17:48, Ming Lei wrote:
> > On Thu, Apr 16, 2026 at 04:46:01PM +0200, Bernd Schubert wrote:
> >> Hi Ming,
> >>
> >> On 4/16/26 15:49, Ming Lei wrote:
> >>> Hi Bernd,
> >>>
> >>> On Tue, Apr 14, 2026 at 5:33 AM Bernd Schubert <bernd@niova.io> wrote:
> >>>>
> >>>> Hi Joanne, et al,
> >>>>
> >>>> this is a bit of duplication of the discussion we had before, but I was
> >>>> badly distracted with other work and also switching employer - didn't
> >>>> manage to reply [1].
> >>>>
> >>>>
> >>>> I'm still not too happy about kBuf and its restriction of locked-only
> >>>> memory. Right now I'm reviewing your patches from the view of what needs
> >>>> to be done for ublk (for my current employer) and also for fuse to
> >>>> support different buffer sizes. Let's say fuse only support kBuf and its
> >>>> restriction of pinned memory, I think we would be forced to add support
> >>>> for different buffer sizes to the current ring-entry-provides-the-buffer
> >>>> and the new kBuf interface - from my point of view code dup.
> >>>> If we would allow pBuf for fuse, we could put the current
> >>>> 'ring-entry-provides-the-buffer' interface into maintenance mode and
> >>>> support new features with the new interface only. I know you disagree on
> >>>> using pBuf [1] with the argument that userspace could free the buffer.
> >>>> Well, if it does, it does something totally wrong and the same could
> >>>> happen today over /dev/fuse and also the existing fuse-over-io-uring.
> >>>> Just the window is smaller, as the pages are extracted from the buffer
> >>>> during the copy.
> >>>>
> >>>> I was looking into what would be needed to support pBuf and I think
> >>>> io-uring could extract pages from pBuf when the buffer is obtained - it
> >>>> would limit the window when userspace can do something wrong in a
> >>>> similar way current fuse and ublk works.
> >>>>
> >>>> Suggested changes:
> >>>>
> >>>> io_uring:
> >>>>
> >>>>   - io_pin_pages() gets a 'bool longterm' parameter.
> >>>> The new pBuf path would pass false, every other exsting caller true.
> >>>>
> >>>>   - io_ring_buf_pin_user() / io_ring_buf_unpin_user()
> >>>>   - io_ring_buf_get_pages()/io_ring_buf_put_pages() -> fills the
> >>>> provided bvec
> >>>>   - New struct io_ring_buf (in cmd.h)
> >>>>
> >>>> struct io_ring_buf {
> >>>>        size_t                  len;
> >>>>        unsigned int            buf_id;
> >>>>        unsigned int            nr_bvecs;
> >>>>
> >>>>        /* private */
> >>>>        u64                     addr;
> >>>>        u8                      is_pinned;
> >>>> };
> >>>>
> >>>>
> >>>> Fuse changes:
> >>>>
> >>>>   - fuse_ring_ent (bufring union side): payload_kvec and ringbuf_buf_id
> >>>>     replaced by io_ring_buf + pre-allocated bvec array.
> >>>>   - Buffer selection under queue->lock removed.  The lock only protects
> >>>>     request dequeue and entry state transitions.  Page access happens
> >>>>     after the lock is dropped, in the context where the copy runs.
> >>>>   - setup_fuse_copy_state bufring branch: is_kaddr/kaddr replaced by
> >>>>     iov_iter_bvec() and would continue to use iov_iter_get_pages2()
> >>>>
> >>>> What do you think?
> >>>>
> >>>> And my current primary goal is to let ublk to support multiple buffer
> >>>> sizes - ublk would also need to get support for kBuf/pBuf and I'm
> >>>
> >>> Ublk server is just one liburing application, and it supports all generic
> >>> io_uring buffer types, so kbuf/pbuf should be fine for your ublk server
> >>> in theory.
> >>>
> >>> It really depends on how your ublk server is implemented.
> >>>
> >>> Maybe you can share your motivation first before discussing kbuf/pbuf support.
> >>> If it is for DMA,  there are other candidates too, such as hugepage,
> >>> recent added
> >>> UBLK_U_CMD_REG_BUF, ...
> >> Joanne had actually removed kBuf and switched to pBuf alone and that
> >> simiplifies things a bit.
> >>
> >> Motivation is to reduce memory usage. Let's say you need 4 IOs of 1MB to
> >> saturate streaming bandwidth, but still want to get smaller IOs through,
> >> for these smaller IOs you don't want to assign the 1MB buffer for each
> >> queue entry / tag.
> > 
> > Thanks for sharing the motivation.
> > 
> > Maybe you can pass UBLK_F_USER_COPY, and each IO buffer can be allocated
> > dynamically completely from userspace, then pre-allocation can be avoided.
> 
> I had looked into, but that is still another syscall / roundtrip, will
> have the same performance issue as UBLK_F_NEED_GET_DATA and probably
> worse because compared to ring IO that is a syscall per IO.

Yeah, it seems true in your use case in which compression is followed,
so pread/pwrite for read/write io buffer can't be linked to io_uring SQE pipeline.

However, I am not sure how you use pbuf for this use case, one big thing is
that the buffer has to be provided to ublk FETCH_AND_COMMAND command
beforehand for handling the coming ublk IO request, which size can't be
known at that time. I will study the pBuf patchset later, but it depends
how ublk driver uses it too, IMO.

Meantime another (more flexible)way is to use bpf struct_ops for allocating &
freeing IO buffer, following the basic idea:

- define struct_ops(alloc_io_buf, free_io_buf) for allocating & freeing io buffer
which is used for copying data between request pages and this buffer

- ->alloc_io_buf() can be called from ublk_map_io() and ->free_io_buf()
can be called from ublk_unmap_io()

- the allocated buffer can be accessed directly from both userspace ublk server
and bpf prog, bpf arena is one perfect match for this use case, page
pinning is avoided meantime.

- the two callbacks are not called for the following features:
UBLK_F_SUPPORT_ZERO_COPY,UBLK_F_USER_COPY, UBLK_F_AUTO_BUF_REG or
UBLK_IO_F_SHMEM_ZC is set for this IO

- motivation is for avoiding big pre-allocate, so ublk server can
use dynamic per-queue heap for allocating io buffer in space-effective way.

- with this feature, userspace needn't to pre-allocate io buffer with max
  buffer size, and typical implementation is to provide one bpf area heap
  for bpf prog to alloc & free buffer. And it still can fallback to usercopy
  code path in case of allocation failure from bpf prog.

You may compare the two approaches for your use case.

> 
> > 
> >> Zero copy is currently still out of question for us, although I will
> >> look into your recent work for integration of eBPF and if erasure
> >> coding, compression and checksums could be done with that (I guess
> >> checksums is the easy part).
> > 
> > Got it, compression could be the hardest one, however, the recent added bpf
> > iterator based buffer interface may simplify everything. I'd suggest you to look
> > at it, and provide some feedback if possible.
> > 
> > Also if your client application uses direct IO, recent added UBLK_F_SHMEM_ZC
> > could simplify implementation a lot, meantime with zero copy & user-mapped
> > address.
> 
> Oh I see, that was just merged. Nice, thank you! I don't our users will
> be DIO only, but nice to have that ZC option!

It can be thought as speedup or optimization for DIO use case.

Thanks,
Ming
