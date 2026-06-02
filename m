Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD4136495F
	for <fuse-devel@lists.linux.dev>; Tue,  2 Jun 2026 17:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780422445; cv=pass; b=UJSSEm/LSKWOToj5w0X4awNfalwaDIIz7WhC6DvnyMh83LdUsMrf0pCj9h5fJpDMM5WvuTyD6wCsFBMI2cAHPiewTin8wJ1trGbpnO9aC5JCtOMBzQpG3zNM4OpvkpUCnTfY9jW8ACgvq6rWCksFrE/Pi9eccuIgdbMryRrXFCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780422445; c=relaxed/simple;
	bh=Et1REafkgt0h4blmUf+LM66HGc4JX7gnmJjTyUp/h+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXOyJwx1sdMMFYptBMHTTIg+tTHW6nmw0jyRiNSq6R0QfWIJ76zPjWNEktPYIxk2YbewrwygUfwkUHyoP0LNpcDsCUozcwC3ttAsy7AuqKcB9xVw8825TAlQs9vGC7z64SkAe4O8oVDEeWHyPeV2okhJPIqoAifvF9F1kzJ67rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BE0Pnszi; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BE0Pnszi"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b3637b90so7915485e9.3
        for <fuse-devel@lists.linux.dev>; Tue, 02 Jun 2026 10:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780422442; cv=none;
        d=google.com; s=arc-20240605;
        b=BkSR8IogJsJQQ89R8GkLdkdFi1R2TpY9E1SHnJG+dAMWfK0FhhO55Dr8mR+BzSM4dJ
         r4yaFWT4ToZ2zV7eAnyb+vfmTdP//gAYTmceYw1Elsh/vyVy1g5nr6ehQo44uxWWipT9
         EhFtBfzlQngr87RBAK5lAQLsnxhosePwvKB9my1mq/e4xqQWOeBKRef1K20ZKC02CKvR
         bVKof2a/uSn1zd2FqGNbj3faV1Kyh1ZXlX+v9dbI3P+Fzv+/IFqVP50rNNXEmwBdUbwo
         jEWw6qd4ZADpd0V+Yxy4fmwZK2tmQPNDlfl4ACJSbeXp4FJ+Uv9646Zf/Sco5op9YCgs
         B21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/4kh4W/NC1tmHC3ywV5Z2oAqBxDhnkcQIxV9wrIAK7Y=;
        fh=yJuUQNdBP9CKduFvKnOXBRe4xLTTNYo5VxVdS9FylZk=;
        b=JGhEcNajN97wIisx1sLzEjMIs0XNbPa3r/k+OD6jfUwTPy1ckIHrTD5ZdHq7nhsXvV
         XFbpyc9ZZgiRzFN3S16uSv5MIENttcB0ZRfINay5z4cvBc7NVEj9opoSqOSVXfBveLq9
         oXeasxWoZVkv+BMnwLdzpR6AEx8Qjjei8wpCqDrwz+4svWDis8ZLoEeN4aIPDnpR0+Eh
         U6tqRVgwgIKO3XeCHgt2BBNUvu104o71UovlUVSEe327QckMOcooLEXGdR120GdEJIOs
         4DQ2T5V7k6s97ujRdHf1/4ALb0Ct8Rqjvz8ni3IKnOmTZ6YcqgzZyeEIE/sLQjwd9Ip+
         RO5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780422442; x=1781027242; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4kh4W/NC1tmHC3ywV5Z2oAqBxDhnkcQIxV9wrIAK7Y=;
        b=BE0Pnszi4MyXB9aoRLzX3pSF8HokCDJg1aPBvYEetMwucX5zcLUIjGu9PbQvqBa3IB
         CcJQ+NQfmUrNFoEP6R8dfgFNNGWQSIQ8RXEsUJW7d93vjF1ty+mez8tl5vLXxmdLvDUy
         IK/hvWr04xak+CMOOwzxuCBAW0Iph4dcSmWpIl4Kd16HDXlRLX5EaxyS7hUgN+FJ9FGR
         wzCl6Z9vax08GOipZn1F2PEhjfPqijm14NtTnR530lpuCEkXn9kTXnwVcd3578+/P+Tp
         RmZ6Aid6wi588rtPFBD/2Rz9EtOherGKqfx4DPU6By+t2INhXs/Ppzl0LJ2HKdi08f/e
         YFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780422442; x=1781027242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/4kh4W/NC1tmHC3ywV5Z2oAqBxDhnkcQIxV9wrIAK7Y=;
        b=Jf3gdtQyzz2EiwIRLF/hpyl19FjmEyHWxCKHH+E2zek/eezF+g2o9bnkXwbeGyf0ue
         yB2EfKAFIxdvNGPyDlHsttBsixqO2Tcv10+AhgKEk/vBXdFxIuNL9ty2olV3tMT9Bl81
         xj5fKvT4Vpv2veW1IFS8ne4JiKFKEyslaTxAPm4atdbiY+RQeWcA/cMU2jdf+yLovycX
         lGadNSf7/h8Lr+CaaXDCY+Vr72SGVzcCukFGZq+UchDOdJcSOz+GtM2x/KhKCu/4GPfp
         hecDtccw0la0OIPB90n1DhelrRuJERT2ZTmmckWDQvSigoH0YOU3sdqvpwqboqh7lOAw
         a9uQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Wxsm/vT8TR0LSJie/q4crUH9fBWlqd9fvdPjbFzg4d+j4szVq96OVxhiABowjxXmGWZMV9m5h0/kw@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5glpSjm4ErGGB9fu4qhw2DJQhQWFQAiB4Itrkz0X2Rv2ZZMkI
	QqkrugH5jZPC7o2s+c7XpIkmLLA0xdZG3zTeMKbfE+n4PW0jg1wutjzJ0+Z9wo4Z/fb8kkufqGx
	7fMDWRZbNEKL/QXUzhv1s23HO0i811Qc=
X-Gm-Gg: Acq92OHUOmSt1gyiqhFDKnwk2hf4Dz/tjMLeyMAYZiz/RClIuKWSAiBFgG2Hw36P0D4
	MiH87ds7IvLJP+BQ1n+k+q6DHbbKnUboxNykrIocsUXfNHBqJ4kx2o0DtQ7RAN49wCx3AAHXsb8
	iGAOEZUU2g1n5Mmlxnxe3ieoU94I8Cf4ZxC8eIL98kB7LvDJcvgIXks0KeNSJJFrnQ6tvJbHYjD
	CA6ZR5Vru2RZlVkksDmw89J/dTTXqa2FmesFiB/c4DT/0hvX5UKxJVAEGOsTYkt2Gen3FsOdebA
	Vl55dTtqUI36xKGtkBnlCeTfkZE=
X-Received: by 2002:a05:600c:5394:b0:490:af90:f9c2 with SMTP id
 5b1f17b1804b1-490b5073c0emr13481605e9.12.1780422442545; Tue, 02 Jun 2026
 10:47:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <20260522205823.1597313-10-joannelkoong@gmail.com> <d1d588e9-5d4b-4e3f-8154-e769e9e69f12@linux.alibaba.com>
In-Reply-To: <d1d588e9-5d4b-4e3f-8154-e769e9e69f12@linux.alibaba.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 2 Jun 2026 10:47:10 -0700
X-Gm-Features: AVHnY4JjOP-MCqO93I-_KoH4vglhHfmLL5YvgfrbjZKpOTo7HLt0wf11ZXtcqRE
Message-ID: <CAJnrk1bSr7B3kp3x8RdZWM+6F6H2h7r-pJhvqxoFpxaOtjF2mQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] fuse: add zero-copy over io-uring
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: miklos@szeredi.hu, bernd@bsbernd.com, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 2:24=E2=80=AFAM Baokun Li <libaokun@linux.alibaba.co=
m> wrote:
>
> On 2026/5/23 04:58, Joanne Koong wrote:
> > Implement zero-copy for fuse io-uring, eliminating memory copies betwee=
n
> > userspace, the kernel, and the fuse server for read/write operations.
> > The server can directly access client pages or page cache folios withou=
t
> > copying data through an intermediary buffer. When a fuse request arrive=
s,
> > the kernel registers the relevant pages into a sparse slot in the
> > server's io_uring registered buffer table. The server can then operate
> > on these pages directly using io-uring fixed buffer operations (eg
> > read_fixed/write_fixed) and the kernel unregisters these pages when the
> > request completes. Non-page-backed args (eg op out headers) will go
> > through the payload buffer as normal.
> >
> > This requires CAP_SYS_ADMIN and FUSE_URING_REGISTERED_BUFFERS (which
> > requires using bufpools). Gating on registered buffers keeps the
> > configuration space small and avoids partially-optimized modes that are
> > unlikely to be useful in practice. This is gated behind CAP_SYS_ADMIN
> > because zero-copy allows the server direct access to the client's
> > underlying pages, rather than operating on an intermediary buffer that
> > the contents of the client's pages were copied into or on page cache
> > folios.
> >
> > The request flow for the zero-copy write path (client writes data,
> > server reads it) is as follows:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > |  Kernel                                   |  FUSE server
> > |                                           |
> > |  "write(fd, buf, 1MB)"                    |
> > |                                           |
> > |  >sys_write()                             |
> > |    >fuse_file_write_iter()                |
> > |      >fuse_send_one()                     |
> > |        [req->args->in_pages =3D true]       |
> > |        [folios hold client write data]    |
> > |                                           |
> > |  >fuse_uring_copy_to_ring()               |
> > |    >copy_header_to_ring(IN_OUT)           |
> > |      [memcpy fuse_in_header]              |
> > |    >copy_header_to_ring(OP)               |
> > |      [memcpy write_in header]             |
> > |                                           |
> > |    >fuse_uring_args_to_ring()             |
> > |      >setup_fuse_copy_state()             |
> > |        [skip_folio_copy =3D true]           |
> > |                                           |
> > |      >fuse_uring_set_up_zero_copy()       |
> > |        [folio_get for each client folio]  |
> > |        [build bio_vec array from folios]  |
> > |        >io_buffer_register_bvec()         |
> > |          [register pages at
> >                  ent->zero_copy_index]      |
> > |        [ent->zero_copied =3D true]          |
> > |                                           |
> > |      >fuse_copy_args()                    |
> > |        [skip_folio_copy =3D> return 0       |
> > |         for page arg, skip data copy]     |
> > |                                           |
> > |    >copy_header_to_ring(RING_ENT)         |
> > |      [memcpy ent_in_out]                  |
> > |    >io_uring_cmd_done()                   |
> > |                                           |
> > |                                           | [CQE received]
> > |                                           |
> > |                                           | [issue io_uring READ at
> > |                                           |  ent->zero_copy_index]
> > |                                           | [reads directly from
> > |                                           |client's pages (ZERO_COPY)=
]
> > |                                           |
> > |                                           | [write data to backing
> > |                                           | store]
> > |                                           |  [submit COMMIT AND FETCH=
]
> > |                                           |
> > |  >fuse_uring_commit_fetch()               |
> > |    >fuse_uring_commit()                   |
> > |      >fuse_uring_copy_from_ring()         |
> > |    >fuse_uring_req_end()                  |
> > |      >io_buffer_unregister(ent->zero_copy_index) |
> > |        [unregister sparse buffer]         |
> > |      >fuse_zero_copy_release()            |
> > |        [folio_put for each folio]         |
> > |      [ent->zero_copied =3D false]           |
> > |      >fuse_request_end()                  |
> > |        [wake up client]                   |
> >
> > The zero-copy read path is analogous.
> >
> > Some requests may have both page-backed args and non-page-backed args.
> > For these requests, the page-backed args are zero-copied while the
> > non-page-backed args are copied to the buffer selected from the buffer
> > ring:
> >     zero-copy: pages registered via io_buffer_register_bvec()
> >     non-page-backed: copied to payload buffer via fuse_copy_args()
> >
> > For a request whose payload is zero-copied, the
> > registration/unregistration path looks like:
> >
> >     register:  fuse_uring_set_up_zero_copy()
> >                  folio_get() for each folio
> >                  io_buffer_register_bvec(ent->zero_copy_index)
> >
> >     unregister: fuse_uring_req_end()
> >                   io_buffer_unregister(ent->zero_copy_index)
> >                   -> fuse_zero_copy_release() callback
> >                      folio_put() for each folio
> >
> > The throughput improvement from zero-copy depends on how much of the
> > per-request latency is spent on data copying vs backing I/O. When
> > backing I/O dominates, the saved memcpy is a negligible fraction of
> > overall latency. Please also note that for the server to read/write
> > into the zero-copied pages, the read/write must go through io-uring
> > as an IORING_OP_READ_FIXED / IORING_OP_WRITE_FIXED operation. If the
> > server's backing I/O is instantaneous (eg served from cache), the
> > overhead of the additional io_uring operation may negate the savings
> > from eliminating the memcpy.
> >
> > In benchmarks using passthrough_hp on a high-performance NVMe-backed
> > system, zero-copy showed around a 35% throughput improvement for direct
> > randreads (~2150 MiB/s to ~2900 MiB/s), a 15% improvement for direct
> > sequential reads (~2510 MiB/s to ~2900 MiB/s), a 15% improvement for
> > buffered randreads (~2100 MiB/s to ~2470 MiB/s), and a 10% improvement
> > for buffered sequential reads (~2500 MiB/s to ~2750 MiB/s).
> >
> > The benchmarks were run using:
> >   fio --name=3Dtest_run --ioengine=3Dsync --rw=3Drand{read,write} --bs=
=3D1M
> >   --size=3D1G --numjobs=3D2 --ramp_time=3D30 --group_reporting=3D1
> >
> > Reviewed-by: Jeff Layton <jlayton@kernel.org>
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
>
> Hi Joanne,
>
> If a connection abort happens while a zero-copy request is in-flight,
> io_buffer_unregister() is never called. The buf_table slot remains
> occupied and folios stay pinned until the io_uring ring is destroyed.
>
> So perhaps we need to add the corresponding cleanup in
> fuse_uring_entry_teardown(). Otherwise looks good to me:
>
> Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>

Hi Baokun,

Thanks for reviewing this series.  That's a good point - the io buffer
is unregistered in fuse_uring_req_end() when a request is ended, but
the abort code calls fuse_uring_stop_fuse_req_end(), not
fuse_uring_req_end(). I'll add this in.

Thanks,
Joanne

>
>
> Cheers,
> Baokun
