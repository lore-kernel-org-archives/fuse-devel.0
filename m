Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9183B47EF
	for <fuse-devel@lists.linux.dev>; Thu,  4 Jun 2026 21:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780609393; cv=pass; b=egA2s8Idl4HLowJMZKbP5UNO+6Aanz3DHyo9wTSkSWjryOe7sxCKDYUw7edU88vmpfLz7KcXTs2wFy7m6fG+qf+EwB5z1QQXZEZMFP923tKRRk046GzEvLtMwBOAy83kSs1OgyK4uHvC+fmlQMg7CxQqlSOClziGFjWZNGWTVnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780609393; c=relaxed/simple;
	bh=ciL0zYtmW5GYGLDBTQ/r8UFglQE1Uz8/VvZaPKN5W9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVLPwGSoSmUZLuDUcIkgfVQEwuZNzteVANIMc5d2UWbfWXWgyH8GkUmSYDBmsw7SI+f44wixyXd85e9pT46iATFyL7uC3v3j1wJyVLNgaVlCVv9s3nIbSIXqZLKY+1Kmonb3wY5lFXoR17cSatR1sIZbs5PEGIeZSz6w7Uh3CLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFkHWICm; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFkHWICm"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45efb698ef2so596335f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 04 Jun 2026 14:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780609390; cv=none;
        d=google.com; s=arc-20240605;
        b=Pc+fQ2fwuyljcnn4/wT6yaZprbP66r1gow+ipw91B4LEx1Rr2FktVy6OEwkM+sSPLL
         EEiSXB35AuwDWLd6QI8MtgtivRVIfSnIsLSi4XQfLSSbX7z/wEvCgu+kyaxFAgr5zXlt
         zuPypYLn/qCryzgH2CrGbnj1AsCfBRMPcwxsjcIj3dol0Wlihn/nYoP5GfsQ/ROdet0k
         CVKXm9yDnyCmhQxwtjP5hq4ijqfw/9ALaNnWiLeth5O5NiGcxkonObcexVTT6t/3Bpye
         338b51aEoatwqzGfRIMdjvTB711ZEflKpOGUecIndpOxU9UBAlrxVYK1DllAGgxNelVB
         T0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GOFbYiyro+vD8Ni+LEe3GtmrhHPFuXVJtKfWcwPMcDo=;
        fh=vNW79QfdmmnrLdxn2RdsF3EH5klSwuwmcvAsEsYibsY=;
        b=XCEL+eB+Zx4HGpFsBsT645WaYGuC7wyt2UqVJZHZZ++jGDyVRYzVhYgp1eXiWsEKtQ
         ZqwZGO0M+/UBXFaSQUmbVLcg3iINLDCD13Oil5JyFrIjrNx4O8WoWMZumm4P3j06KWWH
         J7eBVLQ9iervfSFnXLvmIQXrwlE0Uc5tPZ+SYr2yd1vG8C5VhjwinXtCwvD6xZi6edGW
         428ntp8XQvlx02wMbkTJ3CxRWJPSeld4/j0inrImXoJI0TwUBOr6tybr5o+J5pGSC+xQ
         /setsWc6FlmHbxVQrgKcRDl7RDCQ1SaHTL/1VSMKWuRIwVTne51JBuKmXbCrM297KcGf
         Qraw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780609390; x=1781214190; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOFbYiyro+vD8Ni+LEe3GtmrhHPFuXVJtKfWcwPMcDo=;
        b=NFkHWICmRCOLuiSzwPcKs7ttUZEyhjX5+94fJ8CYFROOP01cOmBKq5pv53hb5vCM8Z
         WzxGOMQCrnuDEDpJxr/mxpylGEYKOrbvXOxlDl8aVMPxXt+fXOYzxl2gflyz82asWfYN
         SdvnYzq+TOVpwE12cbWSDtvGxukAEyo4Qan4Kg0JyrgT9SaYhHvNjD/iMHrqFU4EZo6b
         yEuxt3w/4yGBNd4TDhuRzflJ43awava84z/5W4F+S2tzuL/TRZFw8d0528tbw+HVxaP9
         RkSyvHWvS/67DI8n20wrJsvZbEeI/sJw4cB9ZHnbaISuw4yUIy6EWXOg7bpgD4qmHsM0
         LO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780609390; x=1781214190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GOFbYiyro+vD8Ni+LEe3GtmrhHPFuXVJtKfWcwPMcDo=;
        b=qy0lKo/NCECBetANqn8XfSmrS/LZWTfUN/28atmhkrh3ZwOQPl7BtK6y2l+VaZFxvY
         5NeQdM5rF+f1c7WkAYhA0bf6yk6rReLG6KZBRo2qaB2qh+ussfVA1mrCX8c9J21ADehQ
         rUvjdWHuwN3ZSHpvwjLmVJYDegrRu3prbWi4rIeklIkP6/NjjlgbC8u4/r6TbFJLzZHT
         kC4nxCFtlWD2a5XGZOO2+tChXd0FX5CpxpjCCXLyxYuPdsX9rMZUdHXzDPePOzPW3/J+
         bRJJOuYl433Mw3xDmhTZ0G9/l+yrkb40BCkxFIvfDPnMWnyhn3zJOLdT3i4V/I+G2HlN
         oZOg==
X-Forwarded-Encrypted: i=1; AFNElJ8cFWAhvvvnbXSEJ0uGVnK0dnSA3wwLODy/Z3RUM8IKITM7u12a5v8L6ZngKJP9KeHLNVunDit79G5G@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5eUsbSo7bPuFfbgv889Tpo7rBqETJ+4YFDzQoW7c9Md3jhWQM
	qM8iPk85rWdd2UgcnBwFoNVuKD+fNHHG46tLjJ1mqEANRE5iGvV7WWBbykJWknPDcmtB0niyHie
	DskRyTtHX2ApTRVRJl2NFx5LIRu2xOtAhSyLXGfI=
X-Gm-Gg: Acq92OEKA64DbzFyOXp0ej5wrdA3rVJ//hfWwqD0OgGeyOJVJ9QMAwSH+fqaok08BFo
	2vzuj08DWDuODnp7oUzbELZtE0VYy65Vah8MjqXoEUnYlkS7gJeqivvBG9F74uC2k7z+/kRzhLh
	HSvzPyuEZ/oJ7S2O+KgjAZQWS6HcXqyn/sH3+APBv9+1zEJu3ZMM2fX6kES+6aozmYs00IHVQzL
	mk65Zn2CzF5v+bUF6KdD+7yk5+0eXToStZjAnKNNHQsbOnvvYKTABnPxQ7s6/qxkMUAYGPIvL8i
	ILPDiE1R43712Jvo
X-Received: by 2002:a5d:68c8:0:b0:45e:f381:cd86 with SMTP id
 ffacd0b85a97d-460302f2b2amr898380f8f.14.1780609390053; Thu, 04 Jun 2026
 14:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <20260522205823.1597313-10-joannelkoong@gmail.com> <d1d588e9-5d4b-4e3f-8154-e769e9e69f12@linux.alibaba.com>
 <CAJnrk1bSr7B3kp3x8RdZWM+6F6H2h7r-pJhvqxoFpxaOtjF2mQ@mail.gmail.com>
In-Reply-To: <CAJnrk1bSr7B3kp3x8RdZWM+6F6H2h7r-pJhvqxoFpxaOtjF2mQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 4 Jun 2026 14:42:58 -0700
X-Gm-Features: AVVi8CfN-_xuMsLMwUoknS9UEIv3cwtaji9cnOSc3GUmbo6hOqbJfY5hAgTCVAQ
Message-ID: <CAJnrk1Y5AMZYz8cy9RJHFzYTK=H0we0b9uJiCHQz5EcZaMZzqg@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] fuse: add zero-copy over io-uring
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: miklos@szeredi.hu, bernd@bsbernd.com, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 10:47=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Tue, Jun 2, 2026 at 2:24=E2=80=AFAM Baokun Li <libaokun@linux.alibaba.=
com> wrote:
> >
> > On 2026/5/23 04:58, Joanne Koong wrote:
> > > Implement zero-copy for fuse io-uring, eliminating memory copies betw=
een
> > > userspace, the kernel, and the fuse server for read/write operations.
> > > The server can directly access client pages or page cache folios with=
out
> > > copying data through an intermediary buffer. When a fuse request arri=
ves,
> > > the kernel registers the relevant pages into a sparse slot in the
> > > server's io_uring registered buffer table. The server can then operat=
e
> > > on these pages directly using io-uring fixed buffer operations (eg
> > > read_fixed/write_fixed) and the kernel unregisters these pages when t=
he
> > > request completes. Non-page-backed args (eg op out headers) will go
> > > through the payload buffer as normal.
> > >
> > > This requires CAP_SYS_ADMIN and FUSE_URING_REGISTERED_BUFFERS (which
> > > requires using bufpools). Gating on registered buffers keeps the
> > > configuration space small and avoids partially-optimized modes that a=
re
> > > unlikely to be useful in practice. This is gated behind CAP_SYS_ADMIN
> > > because zero-copy allows the server direct access to the client's
> > > underlying pages, rather than operating on an intermediary buffer tha=
t
> > > the contents of the client's pages were copied into or on page cache
> > > folios.
> > >
> > > The request flow for the zero-copy write path (client writes data,
> > > server reads it) is as follows:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > |  Kernel                                   |  FUSE server
> > > |                                           |
> > > |  "write(fd, buf, 1MB)"                    |
> > > |                                           |
> > > |  >sys_write()                             |
> > > |    >fuse_file_write_iter()                |
> > > |      >fuse_send_one()                     |
> > > |        [req->args->in_pages =3D true]       |
> > > |        [folios hold client write data]    |
> > > |                                           |
> > > |  >fuse_uring_copy_to_ring()               |
> > > |    >copy_header_to_ring(IN_OUT)           |
> > > |      [memcpy fuse_in_header]              |
> > > |    >copy_header_to_ring(OP)               |
> > > |      [memcpy write_in header]             |
> > > |                                           |
> > > |    >fuse_uring_args_to_ring()             |
> > > |      >setup_fuse_copy_state()             |
> > > |        [skip_folio_copy =3D true]           |
> > > |                                           |
> > > |      >fuse_uring_set_up_zero_copy()       |
> > > |        [folio_get for each client folio]  |
> > > |        [build bio_vec array from folios]  |
> > > |        >io_buffer_register_bvec()         |
> > > |          [register pages at
> > >                  ent->zero_copy_index]      |
> > > |        [ent->zero_copied =3D true]          |
> > > |                                           |
> > > |      >fuse_copy_args()                    |
> > > |        [skip_folio_copy =3D> return 0       |
> > > |         for page arg, skip data copy]     |
> > > |                                           |
> > > |    >copy_header_to_ring(RING_ENT)         |
> > > |      [memcpy ent_in_out]                  |
> > > |    >io_uring_cmd_done()                   |
> > > |                                           |
> > > |                                           | [CQE received]
> > > |                                           |
> > > |                                           | [issue io_uring READ at
> > > |                                           |  ent->zero_copy_index]
> > > |                                           | [reads directly from
> > > |                                           |client's pages (ZERO_COP=
Y)]
> > > |                                           |
> > > |                                           | [write data to backing
> > > |                                           | store]
> > > |                                           |  [submit COMMIT AND FET=
CH]
> > > |                                           |
> > > |  >fuse_uring_commit_fetch()               |
> > > |    >fuse_uring_commit()                   |
> > > |      >fuse_uring_copy_from_ring()         |
> > > |    >fuse_uring_req_end()                  |
> > > |      >io_buffer_unregister(ent->zero_copy_index) |
> > > |        [unregister sparse buffer]         |
> > > |      >fuse_zero_copy_release()            |
> > > |        [folio_put for each folio]         |
> > > |      [ent->zero_copied =3D false]           |
> > > |      >fuse_request_end()                  |
> > > |        [wake up client]                   |
> > >
> > > The zero-copy read path is analogous.
> > >
> > > Some requests may have both page-backed args and non-page-backed args=
.
> > > For these requests, the page-backed args are zero-copied while the
> > > non-page-backed args are copied to the buffer selected from the buffe=
r
> > > ring:
> > >     zero-copy: pages registered via io_buffer_register_bvec()
> > >     non-page-backed: copied to payload buffer via fuse_copy_args()
> > >
> > > For a request whose payload is zero-copied, the
> > > registration/unregistration path looks like:
> > >
> > >     register:  fuse_uring_set_up_zero_copy()
> > >                  folio_get() for each folio
> > >                  io_buffer_register_bvec(ent->zero_copy_index)
> > >
> > >     unregister: fuse_uring_req_end()
> > >                   io_buffer_unregister(ent->zero_copy_index)
> > >                   -> fuse_zero_copy_release() callback
> > >                      folio_put() for each folio
> > >
> > > The throughput improvement from zero-copy depends on how much of the
> > > per-request latency is spent on data copying vs backing I/O. When
> > > backing I/O dominates, the saved memcpy is a negligible fraction of
> > > overall latency. Please also note that for the server to read/write
> > > into the zero-copied pages, the read/write must go through io-uring
> > > as an IORING_OP_READ_FIXED / IORING_OP_WRITE_FIXED operation. If the
> > > server's backing I/O is instantaneous (eg served from cache), the
> > > overhead of the additional io_uring operation may negate the savings
> > > from eliminating the memcpy.
> > >
> > > In benchmarks using passthrough_hp on a high-performance NVMe-backed
> > > system, zero-copy showed around a 35% throughput improvement for dire=
ct
> > > randreads (~2150 MiB/s to ~2900 MiB/s), a 15% improvement for direct
> > > sequential reads (~2510 MiB/s to ~2900 MiB/s), a 15% improvement for
> > > buffered randreads (~2100 MiB/s to ~2470 MiB/s), and a 10% improvemen=
t
> > > for buffered sequential reads (~2500 MiB/s to ~2750 MiB/s).
> > >
> > > The benchmarks were run using:
> > >   fio --name=3Dtest_run --ioengine=3Dsync --rw=3Drand{read,write} --b=
s=3D1M
> > >   --size=3D1G --numjobs=3D2 --ramp_time=3D30 --group_reporting=3D1
> > >
> > > Reviewed-by: Jeff Layton <jlayton@kernel.org>
> > > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> >
> > Hi Joanne,
> >
> > If a connection abort happens while a zero-copy request is in-flight,
> > io_buffer_unregister() is never called. The buf_table slot remains
> > occupied and folios stay pinned until the io_uring ring is destroyed.
> >
> > So perhaps we need to add the corresponding cleanup in
> > fuse_uring_entry_teardown(). Otherwise looks good to me:
> >
> > Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
>
> Hi Baokun,
>
> Thanks for reviewing this series.  That's a good point - the io buffer
> is unregistered in fuse_uring_req_end() when a request is ended, but
> the abort code calls fuse_uring_stop_fuse_req_end(), not
> fuse_uring_req_end(). I'll add this in.

Revisiting this... I had this cleanup in the series I sent out last
December [1] but in order to accommodate unregistration on teardown
during the abort race, it requires nontrivial changes to io-uring, as
it requires operating on a ring ctx handle but it's tricky to
ascertain if the handle is valid or not. I had discussed it with Jens
at LPC last year, and we came to the conclusion that it's not worth
introducing the complexity to accommodate this specific scenario and
it's fine to leave the buffer table slot occupied with pinned folios
until the io-uring ring is destroyed.

Thanks,
Joanne

[1] https://lore.kernel.org/io-uring/20251203003526.2889477-30-joannelkoong=
@gmail.com/
>
> Thanks,
> Joanne
>
> >
> >
> > Cheers,
> > Baokun
