Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F87E78F3A
	for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 21:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783976823; cv=pass; b=QP1lqTq8foU9fUhkZ3CjPtsUiILVfisrSMjRlXSyZjBZX3fVlgEhEGl5FkgcdgEg8/YBNG5RaceSRYKMagYXeS6iQ9wvYqvVDG+o8csL7CblT2QjpE+GYx02BY53shn0TtHPBL/oYqGjmxiSw9JIBa7M4RPq2CH0F/dXXEqKUbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783976823; c=relaxed/simple;
	bh=fz9OxtK56LgUSWPkt03Zc1fLkIqSw2NMsL//HktR7Fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uw3zpZKFKZWCiYnOs3GreECN62vC5jEaCAiAVhtrOGMHk44jtmwoQwjzBn2G67kmlNCDAJkHF/RxqiNhnOw2OhVKtwuFNkbilhmIzVJFnrvA1Dpt071cY8mA0IJfP3XHySOGfWf6sskpKa8AStzqAdMBotdhXv6oib73cg9QYA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfU16JSJ; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfU16JSJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso31958935e9.3
        for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 14:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783976820; cv=none;
        d=google.com; s=arc-20260327;
        b=gBzEDq/RlVhrf4f6+4iK/MA5hxoQKUrWXQEUoM8257ANvXL+tj1zArxUrXZE3aDdKY
         kyRMA4k0NHv0tKPd/Bb3d6G5KEZBBDOVZq/5leuztVkvxPbmxuD4mUrMGLF78YaOkVYP
         WKfuyjvBorRndSXEyu86PyoKhqZZNDSsSg6SvV06XZT2JkRhYDWBEbUc+rjZxSD9TTfA
         D8ruBAkssEkXoxx3tHZNHim9w2NanGDlTanFKKuhH8quEoNvun+2tuUSZt8qUdy6VUE5
         YFhseA+icTN0GhPoUzVBFCBKTWKGBqyVM9mr/TPb350vSgcTO/Aofi0zfaW0nclpyxG0
         /C+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iNyztvLbHxYFsPlIv+5VZoMjCcViDe1bIbHCcMD9vFQ=;
        fh=Sj13UDuv+FFOyiQbhZgObA1SkLxoeTyEui6HMysFD1Y=;
        b=bHt7OoiGfNCWqnTg2H8YZPKihgUy9+6klB18T/rOuhcveRkE6yZOJecJgQWHAQaVoa
         nZBgb1Uo/TZYndyBCSL01Mh/zaHMaHD6haRntbk9JkEAmmILzhbBF77cay6MPqDpQfi/
         DxCymFb8+Gd3AwvgVAhANhrGkpKdcnbDejRzAHT1UVfF2Ddjo4tEgDFpoFhZOwN4q1kx
         BnAsEf9pfQo/GgfTa8qn0j+vvYFlDdOwFC0kEoJvhJP9SVx9vPBHEiIEjD894JAkXLLx
         evg5PNsWsEkAOS7BjiC2BvZIu/VMp5YD3guM6GmineqCQcA+PIcIGUEHqCcMe2XtBQlv
         qMuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783976820; x=1784581620; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iNyztvLbHxYFsPlIv+5VZoMjCcViDe1bIbHCcMD9vFQ=;
        b=cfU16JSJ39Iz/vn/upFCqTtFo8vFufBTKcbPiiGawlotSxwXuLpS3TFrvBXSY988Y8
         78Boy/CXn16zxSSSS1louMmFB4k+y0vPRzJoBYvP93BhpA0fZ1KuBXSJJfudYp+JUR3H
         vgwYj4MyO+AKfv7TiGyqWxiXhn51MJM5RrpT6b7IsTvgyMUWP36572fYY0EIZNNQbQ8+
         MyXkjvn7RJMRvVF/WxbbCr9rKajN20HAqM+sg3aziVd3G3L3FHe/I5zIobXmfHBLfvjr
         Yy0M4XXTS6SUCiujorEx49MaWYOzTGolY4cPhjw3AmHzktfVaWEoLAfvXYiPPCKA98o9
         ozLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783976820; x=1784581620;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNyztvLbHxYFsPlIv+5VZoMjCcViDe1bIbHCcMD9vFQ=;
        b=dtB4qlusgFzI5GaHl9+pLMrCpefW5zBYjHN/fHzSVv5fRjDEtJXEtsmfijhMcOqQ4r
         R5P7cBGEpmgfSSayQNT7jYe3ztshL5OidcXEgaqiayzuiTsDajjDAUtCE+9ALofKgnjY
         qNKaVS9OHp99JZCr4OpvwYc1Sbx6/tO//BcwL6cKD4Wlrj9b1N1gWUOnE3Ua+5zikL6B
         bsrgv1y0vc6ovz+Qb/0pinDfxFvhjs2uG25ZkgZyWOOQSTbfgZpgvJOYtlIFfn+6JYu4
         26eIQ/TUKCcjUFx0TG9N2Epi2UD+AKM5gRcjF7+CnD5ma5Pcrz7VGMWQyOe9xh6s3t6n
         GfgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjrYwn/KCtRkAwcdfQeLyU3HKIFBhNszPY5BWVscn93tzUmCEC88X2PYXMH0g/dbhKH0LjEhjjTg+e@lists.linux.dev
X-Gm-Message-State: AOJu0Yy360pq+FnNGt/wsN+UtOPaLg2FuQkc+N7ZmvpJzwT2rJLORQpS
	4lOmK15Zbb04xD31JuaHNP/LcfPhzNgJdgH/KL0/n8eMFkObm8w6MoejHvOOxQguD5rhPQQqbb8
	i20+E9dg2tYih2grYSHMOHoguqL0279m6Yff4yVk=
X-Gm-Gg: AfdE7ck7l1JRfcdFUQo4LegX07pONcuU8IfHCz/CZlB4WG0wK9pzJzs2k68zuSGdthH
	0CR+lg+VG1opx4595/lHpXroYFqJsjXwgmMNq7cGMZmlz25iCXebga0nwiPsWZ5B1dzND47H6QJ
	5AAHlX1hEIuvVv9lApTWIh73g7J4cJabG3TI8ujC/sqkRvZXjltlKp4uU/FtJg8lvWmfFxC6XzZ
	bRjS/Ipk598Q5tjLWXWg2oetksu3fS77+gGgY9M0fxFz9LQg4koUmKsGb8g/rMS9JXSG8UE783z
	y7Q93jVqERp/5F0fMwYNyyo5I1af659Us2tVSprWbEY6x3U4KyC2oYKNHkojiE2+rg11ig==
X-Received: by 2002:a05:600c:6048:b0:493:e97d:97e3 with SMTP id
 5b1f17b1804b1-493f883e9aamr82808425e9.39.1783976819848; Mon, 13 Jul 2026
 14:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630211436.2062816-1-joannelkoong@gmail.com>
In-Reply-To: <20260630211436.2062816-1-joannelkoong@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 13 Jul 2026 14:06:46 -0700
X-Gm-Features: AUfX_mwD8KjJAw72iiKmi7ptB7VcBxXEbSnIECilLW-p7uwSbBCB4itJD2ElABU
Message-ID: <CAJnrk1Y2tiwCecH-HVyaP79kcmBoEYu--mmwRKzp=9uZNaiSUA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] fuse: add io-uring buffer pools and zero-copy
To: miklos@szeredi.hu
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk, 
	bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 2:16=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> This series adds fuse io-uring buffer pools and zero-copy.
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
> This series allows servers to pass in a buffer pool (a contiguous chunk o=
f
> memory) that the kernel will use as it wishes for servicing ents/requests=
.
> This decoupling reduces the memory usage requirements needed to use
> fuse-io-uring and lets the kernel do any optimizations for assigning payl=
oad
> memory to requests.
>
> This series additionally adds zero copy to fuse io-uring. The server can
> directly access client pages or page cache folios without copying data th=
rough
> an intermediary buffer. This requires CAP_SYS_ADMIN privileges and using
> buffer pools. The zero copy patch has a dependency on io-uring registered
> bvec changes in [1].
>
> This series is on top of commit 7d87a5a284b with the io-uring bvec change=
s
> applied.
>
> The throughput improvements from registered buffers and zero-copy depends=
 on
> how much of the server's per-request latency is spent on data copying vs
> backing I/O. When backing I/O dominates, the saved memcpy is a negligible
> fraction of overall latency. Please also note that for the server to
> read/write into the zero-copied pages, the read/write must go through io-=
uring
> as an IORING_OP_READ_FIXED / IORING_OP_WRITE_FIXED operation.
>
> The throughput improvement from zero-copy depends on how much of the
> per-request latency is spent on data copying vs backing I/O. The gain
> comes from eliminating the payload-buffer memcpy,  but accessing the
> zero-copied pages requires the server to issue the read/write as an
> IORING_OP_READ/WRITE_FIXED operation. The benefit is largest when the
> mempcy is a meaningful fraction of per-request latency while backing i/o
> is still noticable enough that the extra io-uring op's overhead doesn't
> dominate.
>
> Benchmarked with passthrough_hp (--nopassthrough, q_depth=3D8) on a
> 2-socket Intel Xeon Gold 6138 (40 cores / 80 threads), using fio (sync
> engine, bs=3D1M, O_DIRECT, numjobs=3D2, 30s run + 10s ramp, 3 runs) where
> direct-I/O throughput is against a RAM-backed (tmpfs) source (backing
> I/O is not the bottleneck):
>
>                 baseline   registered-buf   zero-copy   (zc vs base)
> direct read     ~5.1 GB/s  ~5.4 GB/s        ~8.9 GB/s   (+75%)
> direct write    ~3.4 GB/s  ~4.8 GB/s        ~5.1 GB/s   (+50%)
>
> On a device-bound NVMe (~2 GB/s reads) the read gain shrinks to ~10-16% (=
no
> measurable gains for writes), as backing I/O rather than the eliminated c=
opy
> dominates latency. The benefit overall scales with how much of the per-re=
quest
> latency is the data copy versus backing I/O.
>
> The benchmark script and results can be found in [2]. The libfuse changes=
 can
> be found in [3]. To test the server, run:
> sudo ~/libfuse/build/example/passthrough_hp ~/src ~/mounts/tmp --nopassth=
rough
> -o io_uring_zero_copy -o io_uring_q_depth=3D8
> Once this series is merged, the libfuse changes will be tidied up and
> submitted upstream.
>
> Thanks,
> Joanne
>
> [1] https://lore.kernel.org/io-uring/20260612184840.4058966-1-joannelkoon=
g@gmail.com/T/#t
> [2] https://github.com/joannekoong/linux/commits/fuse_zero_copy_benchmark=
s/
> [3] https://github.com/joannekoong/libfuse/commits/zero_copy_v5
>

Sashiko had some comments [1]. These are the replies to Sashiko's comments:

Patch 1/6:
1) Will add missing smp_rmb() in v6. Fix for pre-existing missing
smp_rmb() is submitted in [2].

2) Pre-existing issue, fix is submitted in [3].

Patch 2/6:
1) Pre-existing issue, fix is submitted in [3].

Patch 3/6:
1) ->uring_cmd() cancellation happens when a task exits or when a ring
is torn down. In both cases, the buffer is not marked as available
again in the bitmap, but this doesn't matter since the task/ring is
torn down. There's no buffer leak anywhere - the buffer was allocated
by userspace.

2) This introduces no additional head-of-line blocking than what
currently exists when there's no ent/buffer available for a request.
If a server wants to preserve memory and allocate fewer buffers than
entries, then requests have to wait until there are available buffers.
With ents and buffers decoupled under buffer pools, this also opens an
optimization where non-payload requests which require no buffer can
still be serviced when entries are free, but that can be a future
patch.
Buffer recycling does not need to check for stalled requests or idle
entries. The buffer is returned back when an in-flight request
completes, and each completion (commit-and-fetch) automatically
assigns the free buffer to any request waiting to be serviced.

3) It is safe (and expected) to read directly from cmd->sqe. uring_cmd
has different SQE-stability semantics than non-cmd io-uring ops.

4) A payload carrying request is added to the tail of the queue and
does not jump ahead of other payload carrying requests. Only
payloadless requests would get serviced first in the case of
bufferpool exhaustion, which is safe since the requests that can be
reordered are independent.

Patch 4/6:
1) It is safe (and expected) to read directly from cmd->sqe. uring_cmd
has different SQE-stability semantics than non-cmd io-uring ops.

2) This race is not reachable on a correct server. For a
buggy/malicious server that fires COMMIT_AND_FETCH concurrently with
ADD_BUFPOOL, this is safe since this returns an error regardless.
There's no regression introduced, but the barrier pairing should be
added anyways for robustness. I'll add this in for v6.

3) No, this is not necessary. See answer to 1)

Patch 5/6:

1) I'll drop the WARN_ON_ONCE. I don't think loopback mount can
trigger the warning, but I think other cases that go through the
kernel_read()/kernel_write() path on a direct-io zero-copy-enabled
fuse file potentially could.

2) This compiles, it is just currently flagged as broken because it
requires the io-uring bvec changes queued up in Jens's tree being
available [4].

3) same answer as above for 2)

4) same answer as the answer for 2) in patch 4.

5) There is no permanent leak - all resources are released when the
ring is torn down. This scenario is only possible if a server
deliberately tries to manufacture it by crossing rings. The worst case
that happens here is that the index in the buffer table of the
original ring remains reserved still and the folios are pinned, until
the ring is torn down. There's no use after free, as io-uring's node
refcount protects against this. Given that zero-copy is already gated
only to privileged servers and all resources are cleaned up when the
ring is torn down, this is not worth fixing, as the server would have
to deliberately self-inflict this.

6) No, this analysis is wrong. io_uring's teardown logic keeps
retrying cancellation until the ctx's references are all dropped (see
io_ring_exit_work()). This is the same in the task exit path as well
(io_uring_cancel_generic()).

Patch 6/6:
1) Will fix the typo for v6.

2) This is fine. It is safe (and expected) to read directly from
cmd->sqe. uring_cmd has different SQE-stability semantics than non-cmd
io-uring ops.

Thanks,
Joanne

[1] https://sashiko.dev/#/patchset/20260630211436.2062816-1-joannelkoong%40=
gmail.com
[2] https://lore.kernel.org/fuse-devel/20260713175345.2542331-1-joannelkoon=
g@gmail.com/T/#mab904e0a63035e094c18184930284727399174be
[3] https://lore.kernel.org/fuse-devel/20260713175345.2542331-1-joannelkoon=
g@gmail.com/T/#m00c29b80ce418d05a791e330be7a9b9530e4ba99
[4] https://lore.kernel.org/io-uring/20260612184840.4058966-1-joannelkoong@=
gmail.com/T/#t
