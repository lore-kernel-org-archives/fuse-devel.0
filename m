Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC95224AFA
	for <fuse-devel@lists.linux.dev>; Tue, 14 Apr 2026 00:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776128176; cv=pass; b=IE+5NGVCuAshZ8nuj7/pNuMzvUVOfAXiHUyRb690M9oT09Sagi9jLLmpeQWG3RXnhVMU3HhXlOcvJehdnA+8aSz5y7z8dDO/WB2P3m1ipAnk3kMXJ4KtOT7/h4rbyrxfObuf/dnKs5vxXuofonTpqklzahZJes17SuyOBXTBb2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776128176; c=relaxed/simple;
	bh=Vp4pnW+APqoJ6vsm4GKCCFVCW8H7QvOZo2BoRfNkO9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G12vue6snKF9v9ZN8bvcQhT3/2YDfjb5hTnuC35G/2BB9zBs20kdBUFDfl0ke9W5DGf0NY0tedOiOwi6XD2k6Krii7jNQvGexk2paWvBqJ+3ZACg67wuvDqZxCQph4OAnX3Y47M2yndKuTHkFF9wuzaXgykydHZBnq5yPWRlMEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I07xn8dQ; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I07xn8dQ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d7645adbdso1018318f8f.1
        for <fuse-devel@lists.linux.dev>; Mon, 13 Apr 2026 17:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776128173; cv=none;
        d=google.com; s=arc-20240605;
        b=DD3euYqYPuyei0ixnEjESq3ZzPXuSX/CpdBed6rtB8q7ssAxUjdaloTyoUpom5XajX
         by6aZ0rw+A4Ki6b0OoEUeMYkdONR2i1fNc9X2dVBAJ6E05IaYTwr0IbsjXXx157jWHZ8
         ioAuKNHX0Xdw1F74QCAGfjcQl2B25KWnFQ7fXU5LlvPwPDHMF+nrdzoTPh6f2yBREt6B
         0fQoDyL8GV7wJ8CcwL0dPB7w1Ywue0M/JMC04YSOAjBHGHxftLN7vZEF3U33ui62vqz+
         8ZJRJrUykSxNZ6it4NP7p19u61pKFUzuuzLrsbvJiUIWsdK5u2f4Z+I+FYsnE6OnVxTA
         5Fow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ALvfb/xM9NzyOiSdrffQV62MeEy+q68iWYXwc1mIBkE=;
        fh=kFhFT1aBPuFmFvLlIYD102WpOpHKIJOnd2SzQyjpE+M=;
        b=cYLliVAlH+xkAs8tOtUM2QxOOkrJQs1NJ4PYlvhfzH99BR97t4OqZ2J/4h90aKhxrM
         cjynhYtPYyR/ZTnO82hMhnOw0/XwLo5guE75vBg/omQHVoFCnd1yV3afeXfNt8CoEZ+x
         MHmKdAnrpgcJcK9+z7uj63EadYEi6Wvin0Ruyw9Eu27jfw1Nc+TmMnww/X/fV1wFF7CU
         orhBXa3TuZiVncVqMk6WTLR2PukhdfSoK9Q7DIbzxlZkbZfbpudFMXtwFSsXwMHdQ60o
         W7xqMaObRMDCqzDfJ9T+jHn35d1fnHFOjDDngEcOyBBi+KbO1BqtOSKl+WaBklsD8pnz
         mtjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776128173; x=1776732973; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALvfb/xM9NzyOiSdrffQV62MeEy+q68iWYXwc1mIBkE=;
        b=I07xn8dQQAREk8jEoXaFgPLsl5A5oHaNyELiBqdhrkcwodb3P6xAkzoRbCueYio7y4
         CVDnC4F3yUxofevPZu8Mx7oKFMz83K+P6tKA5Ocn2l+TSE+Zy2FKJ54hixzyc/PRcLJ/
         9Vnz9cLxbjHHWPRcW7YEz3zIjbMQwABgxJr/9YRju8CPqYHG9LyQ1UA1hTaoJRRmani5
         te+K0fjViH6PH2cAzYL4cIgxp7Z7yByDTXNcX5M93fcejSZ/D+PLHL5E9Ok4QPRag2LA
         97H+R2ruATiDX699o6/r2XdTNhmebBYc+tazG69MBFXRGPeO8kyBO1LshFnLNupbEy8Y
         ZySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776128173; x=1776732973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ALvfb/xM9NzyOiSdrffQV62MeEy+q68iWYXwc1mIBkE=;
        b=T7YwZ34tAQLH1+FvwDIlZ47JW9LWTOn3Fp0jtyG6xp2IDaKUwN6VCB2/fs/SGb6eLD
         aPUOf/7fi057+2WxrUvr32SdmHudnEf9LdftPg/5EireZNtLr37qTSqI9BsvysU0HbOd
         RvdFll9GptmHm2z/AnLS0mbVJb7cc/a/tuR+7yzfrWMOrq0uvuor+BtBNx7wDZb7921F
         gqhI7yBUFouVcLYyZJ2eN6MJxxl7JcoLrAYbXJxtAjZGyVyYF2fcjeEAYT61RJK20pS3
         7v0HlBZW6d9WDNPfId/QnzHWdMEiUIQ88+S7ocE8946xuI26eMA1jX6TjbwzIHfCYLrA
         zkag==
X-Gm-Message-State: AOJu0YxS52L7EGBXAUpgmnokcq3I/NiVO3tu7cEfZ4brMFju/NwwMtPL
	iPTo5O24WTCtLUZFQLwSw5MN6pDtRvHx+DeWNPAVWg3lMfwbNk+1i7gfG7eUy54bSwoAiIMiHZv
	8xtE1kPq6BDv/LXpNx6Z3dbPpRxhLJzM=
X-Gm-Gg: AeBDiet+YV0hWZfw44UNYfqdkBcFfDbDxCjD9J4wW+dtlUhGZ0If/jwsCNt7KBR8q42
	jWHb7VSfs0vT4KwVrO6/aKs49MeDyTYaMr0S9DOyA1GF/zXi5mbLr6KQnNOKHi0wGAU4FEl3RFR
	fWdXBp7HpfXnGhobNmXDx4M7AJ/45rSiqM3w/eIIHKEaZRcew5FeCOl/Xd+S0azT3t4Kknh56Bm
	11xAVfiQImB5XGufihazBj8DXvYxOLJVqTd8C0frX4sIOFHp2HkTYpT3IWbxFdQgGqeJXX6FCm9
	SC+RXA==
X-Received: by 2002:a05:6000:24c2:b0:43b:8f30:39bb with SMTP id
 ffacd0b85a97d-43d642ab9a7mr21513670f8f.24.1776128173330; Mon, 13 Apr 2026
 17:56:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <18936160-308a-4817-a295-54eef43707a3@niova.io>
In-Reply-To: <18936160-308a-4817-a295-54eef43707a3@niova.io>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 13 Apr 2026 17:56:01 -0700
X-Gm-Features: AQROBzBnMmFdOWWID1hWI3m5zWA1RGTzSCqJVLAJUC4BPrTd247iOe6Ovc9QqEI
Message-ID: <CAJnrk1ZknZJQDdJwE5WBK-yZzocMCN_eiCUzxqfHss5ZKBZQ4Q@mail.gmail.com>
Subject: Re: fuse/io-uring: Proposal to support pBuf in additon to kBuf
To: Bernd Schubert <bernd@niova.io>
Cc: fuse-devel@lists.linux.dev, io-uring <io-uring@vger.kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, Ming Lei <ming.lei@redhat.com>, 
	Miklos Szeredi <miklos@szeredi.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 2:33=E2=80=AFPM Bernd Schubert <bernd@niova.io> wro=
te:
>
> Hi Joanne, et al,
>
> this is a bit of duplication of the discussion we had before, but I was
> badly distracted with other work and also switching employer - didn't
> manage to reply [1].
>
>
> I'm still not too happy about kBuf and its restriction of locked-only
> memory. Right now I'm reviewing your patches from the view of what needs
> to be done for ublk (for my current employer) and also for fuse to
> support different buffer sizes. Let's say fuse only support kBuf and its
> restriction of pinned memory, I think we would be forced to add support
> for different buffer sizes to the current ring-entry-provides-the-buffer
> and the new kBuf interface - from my point of view code dup.
> If we would allow pBuf for fuse, we could put the current
> 'ring-entry-provides-the-buffer' interface into maintenance mode and
> support new features with the new interface only. I know you disagree on
> using pBuf [1] with the argument that userspace could free the buffer.
> Well, if it does, it does something totally wrong and the same could
> happen today over /dev/fuse and also the existing fuse-over-io-uring.
> Just the window is smaller, as the pages are extracted from the buffer
> during the copy.
>
> I was looking into what would be needed to support pBuf and I think
> io-uring could extract pages from pBuf when the buffer is obtained - it
> would limit the window when userspace can do something wrong in a
> similar way current fuse and ublk works.
>
> Suggested changes:
>
> io_uring:
>
>   - io_pin_pages() gets a 'bool longterm' parameter.
> The new pBuf path would pass false, every other exsting caller true.
>
>   - io_ring_buf_pin_user() / io_ring_buf_unpin_user()
>   - io_ring_buf_get_pages()/io_ring_buf_put_pages() -> fills the
> provided bvec
>   - New struct io_ring_buf (in cmd.h)
>
> struct io_ring_buf {
>        size_t                  len;
>        unsigned int            buf_id;
>        unsigned int            nr_bvecs;
>
>        /* private */
>        u64                     addr;
>        u8                      is_pinned;
> };
>
>
> Fuse changes:
>
>   - fuse_ring_ent (bufring union side): payload_kvec and ringbuf_buf_id
>     replaced by io_ring_buf + pre-allocated bvec array.
>   - Buffer selection under queue->lock removed.  The lock only protects
>     request dequeue and entry state transitions.  Page access happens
>     after the lock is dropped, in the context where the copy runs.
>   - setup_fuse_copy_state bufring branch: is_kaddr/kaddr replaced by
>     iov_iter_bvec() and would continue to use iov_iter_get_pages2()
>
> What do you think?
>
> And my current primary goal is to let ublk to support multiple buffer
> sizes - ublk would also need to get support for kBuf/pBuf and I'm
> current assuming that fuse and ublk rings should just get multiple
> kBufs/pBufs and a config options that mapps bufs to io-size. I'm still
> looking into details for that.

Hi Bernd,

Thanks for your email. There were some changes made from v1 -> v2, so
please see the v2 "fuse: add io-uring buffer rings and zero-copy"
patchset [1], as I think this will hopefully address your concerns
about mlock. In short, what changed from v1 -> v2 is that I dropped
the approach where kernel-managed buffers is an io-uring native
infrastructure. I realized when trying to implement integration
between the io-uring networking layer and kmbuf rings that kmbufs
didn't tie in as nicely as I'd thought with io-uring native requests,
and fuse has too many constraints for the kmbuf ring (locking
semantics, request lifecycle, etc.) that it made the io-uring side
less clean; this made me realize this logic would be better off not
part of io-uring infrastructure and instead self-contained in fuse, as
Pavel had suggested.

In v2, the fuse headers and payload buffers are passed as user
allocations during registration time through the sqe iovs and
server-side has control over whether to pin the headers or payload
buffers or both (or pin neither), eg bufrings can be used without
pinning (no mlock requirement) and pinning is an opt-in optimization.
Zero-copy requires pinning both headers and payload buffers, as zero
copy requires CAP_SYS_ADMIN privileges anyways. In this design, the
buffers are only recyclable by the kernel (unlike pbufs). Unlike pbufs
where the api contract is that any buffers not explicitly put into the
ring by userspace are under the full control of userspace and not
touched by the kernel, this design continues the existing-fuse-uring
contract that any buffers passed in through sqe iovs during
registration will be copied to/from the kernel as long as the fuse
connection is alive. In the future, if the buffers need to be
kernel-allocated for dma contiguity or other reasons, that could be
added separately if/when it becomes necessary.

Does this address your concerns?

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/20260402162840.2989717-1-joannelk=
oong@gmail.com/T/#mb8f96895aa2773424005ee06bb62ae980e95e604

>
>
> Thanks,
> Bernd
>
>
> [1]
> https://lore.kernel.org/r/CAJnrk1armV9VzBqrrdfr15K5ySBx2YJRk_P0okGnkzyMx_=
eDOw@mail.gmail.com
>
>
