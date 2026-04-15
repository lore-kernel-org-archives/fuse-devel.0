Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76DA1A238F
	for <fuse-devel@lists.linux.dev>; Wed, 15 Apr 2026 00:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776212404; cv=pass; b=MuaL7u43E26QdfSMl6Wni9mZzRzB2DK2stBYu0cKAOyx7Weqbdh5ijiofCsHZSAPQ3vuP6vnUlzdK4N8UHGd9kMJLuFIBWNZ8dxqAfMa5/D75XKocz2lXVER7QjzcTwH0TJlHSg+BIf5NTC0WWoa8PtX2RKYh+ogN3we7jET5No=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776212404; c=relaxed/simple;
	bh=1caITDgwdheH/M0isdyIXswpQD8x8Z3o1taTNVnODVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g831vTRtj0lOM1nmBBxVPd6vMNupfwujD5Z/hDHJ7Jh3ZPwNpQc6LsPudfti6lhbN1Ydbr8oNE1J7QhBS/rq2Z9Njb3lFwzark3nQoTYHB2RfRQsjbgZMPGCS+mq8TVuSYu0OwI2ahm7tC3l8rjswpNxNlgstCqt6WJpUkq4xv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pbAco8bb; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pbAco8bb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso63040875e9.1
        for <fuse-devel@lists.linux.dev>; Tue, 14 Apr 2026 17:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776212401; cv=none;
        d=google.com; s=arc-20240605;
        b=hknMselXTmsKdr1PeUazSRWu61dbgGYGHri9S3oBnt3y3aBi9DTfUOI8Bt23IKNPps
         9B2oqiv2UsQSyQYU+Ksk/KUAu2P1nW6VeMw1Vq5GBWolRXTk9mZpaa7Q4LHnVEqkWLlb
         TpbOgRtoSaxd3FPiHOJcLU6U1V8S/WleRb0GBkJRFJ6OKtOC4m+xWtNBeHng5gBiDnoa
         nt4rFKLuaYixvTO7Yr4oHI29wwS4uorZlifKGgUcmAyJMsehFUdrI/Wyowc1ASa2Pftw
         N9QRiv5r4tRCbWm7jHOU+BoALo3uQMTpMRYBC0txEyZmC0flhTfmEU0A3LfZJ4T/tZgG
         tdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z5uGFIcAqyz5wNzuMzPehrzfu6ZNsJAgolKPAxtg4WE=;
        fh=kFhFT1aBPuFmFvLlIYD102WpOpHKIJOnd2SzQyjpE+M=;
        b=XY+xwFyS9BX5Odd3qcoT8wWgfWOp06M8S8ZNEGMR5t4WdMl3/IGQBe1B3MTirMJkxE
         i0lTF/8uNAMHxLC6T0CzuC4oIpqcEMtWu+nggm4+8PAAGiNOhc9I5RX0uuS+bTKuB2oI
         WrxhsxFzAXxfMMKTVajui48TlnLYuwdrUlK5D9sHd5/8we1g+M9jJlCxLKXGkon5ezWD
         HDr1XIBYH1/uI5bjYGK/ExEY06NugYulPpNZY71sRVqtNyPKZbE640cgtw4PIWTTc9MN
         xAEh3k6NpGHGY7Np3vWdj6yQAr5uvPJXu9huGMdB0YljnXcinuNRXIVREtv2uwhmBbWo
         UU6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776212401; x=1776817201; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5uGFIcAqyz5wNzuMzPehrzfu6ZNsJAgolKPAxtg4WE=;
        b=pbAco8bb5M8ULmzpH3IoHffo2z7vAntTUq5swuRE8dYEuGRtzmoiEsXzUTmlVN0uGv
         4Zs7ww+7aDxKhWojTMCJvw1yr8te/8th39m8TkvuxoLoJQuBBUpC/J65GV//proOMYFp
         M9ksOBeZ1kZORDFZWM/BXZUfHB9KLOsi4pO3x66tCop+QDqhcZjESjz8E7h8E4gaweBt
         FH0Lg0H07o5MG82bY6aH7QUw/0mgQ6s4ybqORP5k3/lUNgSGo12FGoz+Hka1S5Xux+yG
         G4+PqAPvX3mJDzYsWpbj7gg5blr1V2c8UeybCTOi8SxGvY5hhgSYiGP5yIzkrjCTyViz
         h86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776212401; x=1776817201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z5uGFIcAqyz5wNzuMzPehrzfu6ZNsJAgolKPAxtg4WE=;
        b=g7VypK2J5PUPdgQjtGfiIsvSivIPz7Ql0kgPGzpO42Khv17K4BdwVqwVtfE6rniFNI
         hxaiUo7qba8r6varqf8bEZTgl7oU78QIdqoV8qlTdJcsbpFw6e14XBH173sfdkHzFfof
         fLZ2ZIg4d0Eck0UUgTIr/m+mxHuR4Uqv99bqETWt3AhORFs3lDQllSEafh+Dc0gl6Ban
         8iemX6gMgbGczxuL7rURFejvX5SU7H97Bgmoa7srCWrjKc0jgikDTyRgYIBzPy41AT2h
         oHAnNK+W8bTtCf8KRLlzx/krHpyQvM67AQkjKS2/9+2tGdbq6Ac/xcSwYPp1YCtfT4E4
         ZDBw==
X-Gm-Message-State: AOJu0YwK/CrPiFrPIViHKYsvzsiyV1vWmLRsjL6fpzdTziO7tlMdLqLy
	w6M93MznALyicDWd3zUkZr60ekAkG6Qknm9Jda4hHwBg7DBFPlMunDhqgqt4p4msp8yG4MnO32W
	3eLJGydIuE2km/ziGQx6nn9ktd9cZxAc=
X-Gm-Gg: AeBDietAf7t61F5IZX3w4ZCKo/VGDGEEyf6BfeSD0Ouj+tiPpw23Fed9UMYmBto4mmz
	S+OVHsV3hloWpZ6f3h+WRCwLLXOi94G5E5Um534vFnKMPbxXfMz3LsGR0gBMNmqrIAcDG847yYz
	Zq6+3+8h3e1DZm4wlewsHNkWGwXdLqBAnxkytXPiVNk2rXs+QeCq/VVYpvnQVxHzyfqsNg8Zp+5
	VAzj1MaauzzitaJf1G8ra/MsR/1b3ONL8B0seWcjwo2NsALE4gFEDMkDn3cCm4Yl36HBlLRc1wn
	ao41ohUkJCde8CLu
X-Received: by 2002:a05:600c:c08b:b0:485:3c2e:60d5 with SMTP id
 5b1f17b1804b1-488d6816f66mr187389025e9.2.1776212401077; Tue, 14 Apr 2026
 17:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <18936160-308a-4817-a295-54eef43707a3@niova.io>
 <CAJnrk1ZknZJQDdJwE5WBK-yZzocMCN_eiCUzxqfHss5ZKBZQ4Q@mail.gmail.com> <e5553fcf-04bc-49e2-9eb7-17f9007e7fad@niova.io>
In-Reply-To: <e5553fcf-04bc-49e2-9eb7-17f9007e7fad@niova.io>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 14 Apr 2026 17:19:49 -0700
X-Gm-Features: AQROBzB5VnBua0Tj33oLBjLUCqbPDJEOwRxBLNxj9m6OHjtjQHWP_tRVjYcDrHc
Message-ID: <CAJnrk1btU1Mqw9GgbNUXOcTm56odiqW5Qe2uGx_KC9RB0u3GQA@mail.gmail.com>
Subject: Re: fuse/io-uring: Proposal to support pBuf in additon to kBuf
To: Bernd Schubert <bernd@niova.io>
Cc: fuse-devel@lists.linux.dev, io-uring <io-uring@vger.kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, Ming Lei <ming.lei@redhat.com>, 
	Miklos Szeredi <miklos@szeredi.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 10:34=E2=80=AFAM Bernd Schubert <bernd@niova.io> wr=
ote:
>
>
> On 4/14/26 02:56, Joanne Koong wrote:
> > On Mon, Apr 13, 2026 at 2:33=E2=80=AFPM Bernd Schubert <bernd@niova.io>=
 wrote:
> >>
> >> Hi Joanne, et al,
> >>
> >> this is a bit of duplication of the discussion we had before, but I wa=
s
> >> badly distracted with other work and also switching employer - didn't
> >> manage to reply [1].
> >>
> >>
> >> I'm still not too happy about kBuf and its restriction of locked-only
> >> memory. Right now I'm reviewing your patches from the view of what nee=
ds
> >> to be done for ublk (for my current employer) and also for fuse to
> >> support different buffer sizes. Let's say fuse only support kBuf and i=
ts
> >> restriction of pinned memory, I think we would be forced to add suppor=
t
> >> for different buffer sizes to the current ring-entry-provides-the-buff=
er
> >> and the new kBuf interface - from my point of view code dup.
> >> If we would allow pBuf for fuse, we could put the current
> >> 'ring-entry-provides-the-buffer' interface into maintenance mode and
> >> support new features with the new interface only. I know you disagree =
on
> >> using pBuf [1] with the argument that userspace could free the buffer.
> >> Well, if it does, it does something totally wrong and the same could
> >> happen today over /dev/fuse and also the existing fuse-over-io-uring.
> >> Just the window is smaller, as the pages are extracted from the buffer
> >> during the copy.
> >>
> >> I was looking into what would be needed to support pBuf and I think
> >> io-uring could extract pages from pBuf when the buffer is obtained - i=
t
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
> >>   - fuse_ring_ent (bufring union side): payload_kvec and ringbuf_buf_i=
d
> >>     replaced by io_ring_buf + pre-allocated bvec array.
> >>   - Buffer selection under queue->lock removed.  The lock only protect=
s
> >>     request dequeue and entry state transitions.  Page access happens
> >>     after the lock is dropped, in the context where the copy runs.
> >>   - setup_fuse_copy_state bufring branch: is_kaddr/kaddr replaced by
> >>     iov_iter_bvec() and would continue to use iov_iter_get_pages2()
> >>
> >> What do you think?
> >>
> >> And my current primary goal is to let ublk to support multiple buffer
> >> sizes - ublk would also need to get support for kBuf/pBuf and I'm
> >> current assuming that fuse and ublk rings should just get multiple
> >> kBufs/pBufs and a config options that mapps bufs to io-size. I'm still
> >> looking into details for that.
> >
> > Hi Bernd,
> >
> > Thanks for your email. There were some changes made from v1 -> v2, so
> > please see the v2 "fuse: add io-uring buffer rings and zero-copy"
> > patchset [1], as I think this will hopefully address your concerns
> > about mlock. In short, what changed from v1 -> v2 is that I dropped
> > the approach where kernel-managed buffers is an io-uring native
> > infrastructure. I realized when trying to implement integration
> > between the io-uring networking layer and kmbuf rings that kmbufs
> > didn't tie in as nicely as I'd thought with io-uring native requests,
> > and fuse has too many constraints for the kmbuf ring (locking
> > semantics, request lifecycle, etc.) that it made the io-uring side
> > less clean; this made me realize this logic would be better off not
> > part of io-uring infrastructure and instead self-contained in fuse, as
> > Pavel had suggested.
> >
> > In v2, the fuse headers and payload buffers are passed as user
> > allocations during registration time through the sqe iovs and
> > server-side has control over whether to pin the headers or payload
> > buffers or both (or pin neither), eg bufrings can be used without
> > pinning (no mlock requirement) and pinning is an opt-in optimization.
> > Zero-copy requires pinning both headers and payload buffers, as zero
> > copy requires CAP_SYS_ADMIN privileges anyways. In this design, the
> > buffers are only recyclable by the kernel (unlike pbufs). Unlike pbufs
> > where the api contract is that any buffers not explicitly put into the
> > ring by userspace are under the full control of userspace and not
> > touched by the kernel, this design continues the existing-fuse-uring
> > contract that any buffers passed in through sqe iovs during
> > registration will be copied to/from the kernel as long as the fuse
> > connection is alive. In the future, if the buffers need to be
> > kernel-allocated for dma contiguity or other reasons, that could be
> > added separately if/when it becomes necessary.
> >
> > Does this address your concerns?
>

Hi Bernd,

> yes absolutely it does. I had actually thought that Jens had already
> accepted the kBuf changes. I had seen the discussion with Pavel, but

Yes it had been briefly merged into Jens's io_uring/for-7.1 staging
tree and then it was dropped.

> then seen (at least I think) that Jens had accepted it. And with the
> different versions, I didn't notice that v2 (in my counting that is v5,
> I think), doesn't use kBuf anymore.

No worries, thanks for taking a look at it now.

>
> If I understand it right, the io-uring bvec changes are only needed for
> zero-copy?

Yes, that is correct.

Thanks,
Joanne
>
> Thanks,
> Bernd
