Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FB425776
	for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781288316; cv=pass; b=aXRM7p5ZT+ErU3ofOo7kGPMUo5OPs9MInDr7x1OCfydLrqTMNRKsz7OYxJEf/WcYyt/qF9P6bBmeCE65zUsZihXyEzzRl2tGb9uUCk60jDLM+zh/XQ/o6f9NbBFXhyzPxk/c1A5l04El9k5oWCYfoqCgEvLmyXBvFaD6MKAAWw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781288316; c=relaxed/simple;
	bh=4ZvobI3YGx1vql06D6jKZGJwMcHE2w6WOgFCM6lM4rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTV6l2VxMR1ANIPm6KGkuNCtDYyTnI7S/e9/52nLj8uB3H+J0l23eSQ31bKhYQcEnp2s3VH4lS34LOeN8Gxhnk6/Y8CM8VXH8fQRUA/t4/i2gwFV0pUNtrrnW5wvpoT1nnq9oB2GWfno9C/2fYMtHGmcMIsiaW/IBkT24Oxy8hE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjuYiMXw; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjuYiMXw"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45fd45e596cso734028f8f.1
        for <fuse-devel@lists.linux.dev>; Fri, 12 Jun 2026 11:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781288313; cv=none;
        d=google.com; s=arc-20240605;
        b=Cm1t3VKFQCP71L0Y/CMl1UAAGuWeEVGn6wicFzOvx90AvMm6u3IyIldQIeF7FZDC0j
         1ydJBRzsuC8hn+tjnYA6ftOgsBOsa7Mxs49yKHZDgoN+426TdLtZThuAnhBYWbhWNZPT
         HjwLkP3jmA81FtWeQuS/j2V4dPqCyqbYKE8HGfAy+DSj/BYKJ3SsreyyhFqHCEykUzyJ
         OmWgCBfZf0nlmJb/QexsIyD+ScsNdmHi1GFz88D53f4wuMdXqqPATaRgPshLny65s9jL
         HXsOo9Uc/GNBGeGIy4I3u5Odt3LKd6yCbysa/t0mJvgrSAdwdfSypPec3nR9DNcDwZDj
         6UAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lj4/Wqj7pbdsV8NIWiiUVYzWp9SfSJwvkoNytjalPEs=;
        fh=eQQKVVexWcuhtEYwXoCVpsezKWYajGwM5vfLb9s1RgQ=;
        b=BI836+FK91AkfxW5/tL6igR69k7aDgjegUxl2640c/KTZMRpQKlNvLrwReDpOHkft1
         B1SUT7ROp2FsULgQmPx6olFtbWIHVU8xF923B2wi0SysNECn/50lkhYXGRzYVhlErcuE
         QB3lYhgcRe70Z4Vuve3v04kr2FUQHrWw6Qq/NTHjaacevjBNKdVf1KGUHUs6p/wpg764
         7ue31MXiCmsFlAtkDCZlgKm8N/iTA6BlSqHKXz3QMCr7vE+umwmZDRRCE+uzfLIHW3hL
         3v8xHc9Bgb8oh0hyGrpYHRObL1aXHW1U8wfNBcshcLK/R17G3ccZpL3nAIuenPzXf9Bb
         7S+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781288313; x=1781893113; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj4/Wqj7pbdsV8NIWiiUVYzWp9SfSJwvkoNytjalPEs=;
        b=KjuYiMXw8KcdT7sb90PRsMqsDRiHU67J3LT4FQrBo483ZFen932hDj1xggvs0xqbAs
         mIDF3xmTdZjRVQ42GpxMQ827sHixY0BkF7BI78HTekL4JPgpw9SEsBzwbsuKrkLLDlhM
         pm9mAUK0S/GdAVilwDZJQyASBhNyaB3DqZWlrAa1yX9Q5dzqtQDRdKGz20NDeMJjB4Mf
         lAWrwnV8pimAorVf2TpsyjCzILkGSA87y+i7LYWH6MazdV+c4BqvXgtPK7vCnZPjG+Ou
         1/FSKZbTiiuNcLaA+FZQKnzUBM/mwXjB4amoOJMBkjq74ApJ2/sn6oqvpstZRabl+BVr
         xKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781288313; x=1781893113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lj4/Wqj7pbdsV8NIWiiUVYzWp9SfSJwvkoNytjalPEs=;
        b=BsDNa842yvCrL0Tg514tnTUEyNJ/DhU4egBxACR6yXg14dl+E7e/+lDu+5TZV45ASh
         Q9pC0jMJSkIyXgdxqlw4/LgmkXUe1P/yV/hOaaqQlLNxdkDsJKMJH0wQcRNkYChVeaGt
         w2/rmsg/a7I6K4cAERHh3EVEbbVPJlpXn+/dpJN8InhxdNynZEvZ4VuSvDxeM4WGrqDZ
         OvMJE3aQvxxKfhM7D8Bg+AFI2XqBabzOcABEblYdYw/p71In7Z9aMpmrflqhCVjVLUmk
         Ld8haA1dXGE0kfq+RW+4tnCuiJLxHK6ze7WFjB2iSaEhHn2QfJrsK/qzawcs/LSbIxeN
         OXHA==
X-Forwarded-Encrypted: i=1; AFNElJ8QXVaMBfT+6b+RrdsoePqh33JJQNu84q8n6pg87ChDALm4elq/IR2laEbVKS6E/gB/BZ/ckfRvqNBT@lists.linux.dev
X-Gm-Message-State: AOJu0YwqIFS6MpYFqfqOc77RT+QTdzNnk7YKlzh9rUn42nLMw2BTd5Hm
	kJL8dLmtxOq1oFHBt6R1RbWRdhmBgvfdxZoSUvNNgyFxhSSCHgQu2lbt9ddcJ9KNxQrZ5sEbOqU
	sh5iQiEC69HMASkLCyYqW8IcM6hNIoSk=
X-Gm-Gg: Acq92OERvdq+iA81EtKALNfM/PA6JOPscTMEFtOvSfZ7PYUzBJXGaeGhAOp02vZcLqX
	+2Uvf/JmVgK5fTjt3mVg918HmN8Ozdd3Hg9lzaFOC/TfnOzsnq4wsJT1Tg/n2jUdfrVAGM6qkYS
	eHquBxd64mcdrE7+aHxH2cX77jU+0+1+cufmxWKjkTgee4B7YmCPqbrTsX/CJimLBiorFXgMh3X
	49NZnnvR/jG2R5MBpjqyqFtfkIY6dz4LmXOG9ZYGKdC3S2iAZnPQd077e9k6ZiFWUCgM+qq3nA0
	YIzx4VFLU+ocgFgMa6dImvCxaEK26fHgxmUaKJPn7tEDzvfVVc2+f9aQlterfJg=
X-Received: by 2002:adf:e003:0:20b0:45e:f672:40fb with SMTP id
 ffacd0b85a97d-4606db97637mr4295533f8f.22.1781288313081; Fri, 12 Jun 2026
 11:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <20260522205823.1597313-8-joannelkoong@gmail.com> <80f49e88-c342-44e7-abef-f65e84beb9b0@bsbernd.com>
In-Reply-To: <80f49e88-c342-44e7-abef-f65e84beb9b0@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 12 Jun 2026 11:18:19 -0700
X-Gm-Features: AVVi8CfLsTKCVNcYInDIRLoqSKqkKG-m8WDVc5kVejpvsiZ7u_SID54M8JvNt4M
Message-ID: <CAJnrk1b_eMi+AAAHmC0J4eP-JAj5FYPsZG_+C3NK9UEpQkmTUQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 5:02=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
> Hi Joanne,
>
> I one generic question, could you also add in for which kernel branch the=
 series is? I think I need to do the same for larger patches series as well=
 (recent reduced-queue was based on 'miklos/for-next'). Basically 'b4 shaza=
m' fails to apply on linux master and also fails to on 'miklos/for-next' an=
d I don't even know what the base for the series here is

Hi Bernd,

This was rebased on top of Miklos's for-next tree (base commit
eee3f1a62). This has a dependency on the io-uring registered bvec
buffers changes that were added in [1].

>
> On 5/22/26 22:58, Joanne Koong wrote:
> > Right now, ents and buffers are tightly coupled in fuse io-uring where
> > each entry has its own dedicated payload buffer, requiring N buffers fo=
r
> > N entries where each buffer must be large enough to accomodate the
> > maximum payload size. This is suboptimal as most request types (lookup,
> > open, release, getattr, etc) require vastly less bytes than the maximum
> > payload size and some requests (unlink, rmdir, fsync, flush, etc) do no=
t
> > require payload buffers at all.
> >
> > Instead of requiring a 1:1 coupling between ents and payload buffers,
> > allow the server to pass in a buffer pool (a contiguous allocation of
> > buffers) that the kernel will use as it wishes for servicing
> > ents/requests. Buffers are now pooled and selected on demand. Entries
> > only "reserve" a buffer while actively processing a request that
> > requires a payload buffer. This decoupling reduces the memory usage
> > requirements needed to use fuse-io-uring. It allows for future
> > optimizations such as incremental buffer consumption which will allow
> > non-overlapping regions of a single buffer to be used simultaneously
> > across multiple ents/requests, and the possibility of multiple buffer
> > sizes to be supported per ring in the future.
> >
> > To use this, the server must set the FUSE_URING_BUFPOOL flag during
> > registration and provide the payload buffer pool through the iovec
> > payload in the first sqe. The server must set init.buf_size and
> > init.nr_bufs in the struct fuse_uring_cmd_req it passes to the kernel t=
o
> > describe the buffer pool configuration. Buffer pool usage is set on a
> > per-ring basis. All subsequent registration SQEs for the same ring must
> > pass in consistent flags.
> >
> > Internally, a buffer ring data structure is used for managing the buffe=
r
> > pool. The kernel manages buffer selection and recycling through this
> > ring structure. A payload buffer is selected from the ring on demand if
> > the request requires a payload buffer and recycled after the request
> > completes if used.
> >
> > The contiguous buffer pool passed in is partitioned into individual
> > buffers according to the buf_size passed in at registration time.
> >
> >   PAYLOAD BUFFER POOL (contiguous, provided via iov[1] in first sqe):
> >     |<-------------- payload_size ------------>|
> >     +--------- --+-----------+-----------+-----+
> >     |  buf [0]   |  buf [1]  |  buf [2]  | ... |
> >     |  buf_size  |  buf_size |  buf_size | ... |
> >     +--------- --+-----------+-----------+-----+
> >
> > The buffer ring logic is as follows:
> > select:  buf =3D bufs[head % nbufs]; head++
> > recycle: bufs[tail % nbufs] =3D buf; tail++
> > empty:   tail =3D=3D head (no buffers available)
> > full:    tail - head >=3D nbufs
> >
> > Buffer ring request flow
> > ------------------------
> > |  Kernel                                  |  FUSE daemon
> > |                                          |
> > |  [client request arrives]                |
> > |  >fuse_uring_send()                      |
> > |    [select payload buf from pool]        |
> > |    >fuse_uring_select_buffer()           |
> > |    [copy headers to ent]                 |
> > |    >copy_header_to_ring()                |
> > |    [copy payload to selected buf]        |
> > |    >fuse_uring_copy_to_ring()            |
> > |    [set buf_id in ent_in_out header]     |
> > |    >io_uring_cmd_done()                  |
> > |                                          |  [CQE received]
> > |                                          |  [read headers]
> > |                                          |  [read payload from buf_id=
]
> > |                                          |  [process request]
> > |                                          |  [write reply to header]
> > |                                          |  [write reply payload to
> > |                                          |    buf]
> > |                                          |  >io_uring_submit()
> > |                                          |   COMMIT_AND_FETCH
> > |  >fuse_uring_commit_fetch()              |
> > |    >fuse_uring_commit()                  |
> > |     [copy reply from ring]               |
> > |     >fuse_uring_recycle_buffer()         |
> > |    >fuse_uring_get_next_fuse_req()       |
> >
> > Reviewed-by: Jeff Layton <jlayton@kernel.org>
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/dev_uring.c       | 356 +++++++++++++++++++++++++++++++-------
> >  fs/fuse/dev_uring_i.h     |  35 +++-
> >  include/uapi/linux/fuse.h |  29 +++-
> >  3 files changed, 353 insertions(+), 67 deletions(-)
> >
> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index 5f407a79c280..5947b834121e 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -41,6 +41,11 @@ enum fuse_uring_header_type {
> > @@ -1123,12 +1324,30 @@ fuse_uring_create_ring_ent(struct io_uring_cmd =
*cmd,
> >
> >       ent->queue =3D queue;
> >       ent->headers =3D headers->iov_base;
> > -     ent->payload =3D payload->iov_base;
> > +
> > +     err =3D -EINVAL;
> > +     if (!bufpool_enabled(queue)) {
> > +             payload =3D &iov[FUSE_URING_IOV_PAYLOAD];
> > +             if (payload->iov_len < ring->max_payload_sz) {
> > +                     pr_info_ratelimited("Invalid req payload len %zu\=
n",
> > +                                         payload->iov_len);
> > +                     kfree(ent);
> > +                     return ERR_PTR(err);
> > +             }
> > +             ent->payload =3D payload->iov_base;
> > +     }
>
> Let's say a confused user library would not know how to set up things and
> would in one SQE register a buf pool and in another register payload and
> header - should this fail with an error here? We could add that sanity
> check later, though.

This is already checked right now with the
queue_init_flags_consistent() checking we do at registration time.
That enforces that all or none of the registration cmds for that queue
must have the FUSE_URING_BUFPOOL flag set.

>
> >
> >       atomic_inc(&ring->queue_refs);
> >       return ent;
> >  }
> >
> > +static bool init_flags_valid(u64 init_flags)
> > +{
> > +     u64 valid_flags =3D FUSE_URING_BUFPOOL;
> > +
> > +     return !(init_flags & ~valid_flags);
> > +}
> > +
> > diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> > index c13e1f9a2f12..5fb4a7a3772c 100644
> > --- a/include/uapi/linux/fuse.h
> > +++ b/include/uapi/linux/fuse.h
> > @@ -240,6 +240,11 @@
> >   *  - add FUSE_COPY_FILE_RANGE_64
> >   *  - add struct fuse_copy_file_range_out
> >   *  - add FUSE_NOTIFY_PRUNE
> > + *
> > + *  7.46
> > + *  - add FUSE_URING_BUFPOOL flag
> > + *  - add fuse_uring_cmd_req init struct
> > + *  - add buf_id field to fuse_uring_ent_in_out struct
> >   */
> >
> >  #ifndef _LINUX_FUSE_H
> > @@ -275,7 +280,7 @@
> >  #define FUSE_KERNEL_VERSION 7
> >
> >  /** Minor version number of this interface */
> > -#define FUSE_KERNEL_MINOR_VERSION 45
> > +#define FUSE_KERNEL_MINOR_VERSION 46
> >
> >  /** The node ID of the root inode */
> >  #define FUSE_ROOT_ID 1
> > @@ -1263,7 +1268,13 @@ struct fuse_uring_ent_in_out {
> >
> >       /* size of user payload buffer */
> >       uint32_t payload_sz;
> > -     uint32_t padding;
> > +
> > +     /*
> > +      * if using bufpools, this is the id of the selected buffer.
> > +      * the selected buffer holds the request payload
> > +      */
> > +     uint16_t buf_id;
> > +     uint16_t padding;
> >
> >       uint64_t reserved;
> >  };
> > @@ -1294,6 +1305,9 @@ enum fuse_uring_cmd {
> >       FUSE_IO_URING_CMD_COMMIT_AND_FETCH =3D 2,
> >  };
> >
> > +/* fuse_uring_cmd_req flags */
> > +#define FUSE_URING_BUFPOOL           (1 << 0)
> > +
> >  /**
> >   * In the 80B command area of the SQE.
> >   */
> > @@ -1305,7 +1319,16 @@ struct fuse_uring_cmd_req {
> >
> >       /* queue the command is for (queue index) */
> >       uint16_t qid;
> > -     uint8_t padding[6];
> > +     uint16_t padding;
> > +     uint32_t reserved;
>
> Dunno, it was a padding up to 64 bit? Non-needed change?

I'll change the padding back to uint8_t padding[6].

>
> > +
> > +     union {
> > +             struct {
> > +                     /* FUSE_URING_BUFPOOL: buffer pool configuration =
*/
> > +                     uint32_t buf_size;
> > +                     uint16_t nr_bufs;
> > +             } init;
>
> If we want to support multiple buffer pools, this struct should add in a
> buffer index or at a minimum reserve a field for it. Adding in
>
> uint16_t buf_idx; /* currently unused */ would also fill up the hole at t=
he end.
> libfuse could even already set buf_idx to 0 and then kernel could check i=
f zero
> and fail something else is set. Would save us another flag later on.

I think a new flag would need to be added regardless for multi-pool
support. I'm not confident we'd need an explicit pool_idx field in the
init config for multi-pool support, so I think it's better to just
leave that to the future if it does turn out to be needed. As for
filling up the hole, the later uint16_t zero_copy_index fills that up.

Thanks,
Joanne

[1]  https://lore.kernel.org/io-uring/20260402160929.2749744-1-joannelkoong=
@gmail.com/T/#t
