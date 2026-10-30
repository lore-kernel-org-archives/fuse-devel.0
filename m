Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793374063;
	b=dbh/5nb6X8sJmHazlAK14BQfc8h3Yhey4DTGQXLVUlTQqd89s9Zy9E3rWD345wmgImtt
	 fJJFw9nZbcsTUtMd2ZQlT6LDBQTd/qv1CgQ7xFCmLMcV5lYUyp0XdueY6XAvqyiTWUtW4
	 d4buWGruL9EPXg0vooplWVYpnFEwqbAAh0xJ7HW+W5f7JK+i/npkGuOeAMmmhw4+WnP3I
	 jgXJfsfvmlca8ZWEHIVm/LCXrCR8//hLGmVPPKXrSQ7ooV8U77990a5oORPQHu/kKGNWc
	 tMNJyov6/M+QGgkxmFjcGflBXYKfTZu5nUyzlDI7o44fs1kVPs0BICbmQy9Jsv7kYIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gBnh0au+bqhOXvQQRGkJNLPo++sPE616YnlxDnGaF/g=;
	b=cUGsGPVgHuA3kS7ojcx4C4Huq18fL639yFXCDxdASWDv/g1+hdZrxgIjQtv11BPZCCKD
	 /nBw1IRtzDhrfrN2SWtmf3yp89MDJVJBmq1XTs+u0D5GAPmKAHrcrAvl+HRLCOx3cllCL
	 gVNQ1WATsUQ0/Q+m47hXAC7GnvO2pn2F9gW2g63oGwAw8Jp/z8chCwg2l9QIQ6H6xFpGs
	 ZvIFFtJocybJOfXvXuI3nMAFs0bJQRwVQJoQYNdC+N5Wz9mNQTzoes+IxHLL46mpSMr6X
	 EW8+OqJpyICktcZSZP4MqKUzUWA5whq76p+iJ6MIaIVKX3PBrwV6VU8SaKMF5zMcVbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zeAnGE1l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3B3606A320
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 15:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C3B3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zeAnGE1l
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so1233180a12.3
        for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 08:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793374061; cv=none;
        d=google.com; s=arc-20260327;
        b=K/IUr9gZWLVCYiAfHyNaqcLhybwup6FfhsQxTLrxq17IxwuS2VFSVLw066ZPiSOn2E
         411dNuopDqgrusmyrP4sCBw7UQqKmLOqh46pJy0iRA9Rf8NyUS0Eyqc6L6grCENtcs69
         nFq//L7xZBuuxjVzLuk9KcwqJdc06wQTtboJfQr9Ri584NsHU9YDxxBRSC2LxRdNLUcg
         U69jgb6EKDPXhXXeJXavUIKmdp87GTU/dUSfX288VCOBcL5oENPTHmK1lAgPU++G6TiD
         X5Tu7gl1VOf75rbfkGBdD0NVa3WI2EP4mSu/BbwzieFZmSZBPg3LE5RYs0dcX2aoqP7I
         i/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gBnh0au+bqhOXvQQRGkJNLPo++sPE616YnlxDnGaF/g=;
        fh=ib3ZIgkILNt9j+kq/Iu9tTiNq6e/MboCZRcowPfHpVM=;
        b=EKlBmchBNPDwqx2L7l+8e5iUImU4KKQVIusUbTMwkTejHTiULcIdiI1KJSPGFOg9ZX
         gXqro5HAZ1cCH3EW9xmKNgbTUPKKiImALrX0k0SlopAe7D9Y17LACU/7rU8uvPs8JcTq
         l51vQEp4NdTHzDbj3Jl2Syali2QvDX3gJ4c2XfCYYljKeAhXCCyCr/nDqrrTPDjAaOrw
         rEdSMlAbvcbkdxqF9DGNBL2J1M321mwRx5Dn0LTK42x+rhmE+NOc/j3dwtFigEgyFNNd
         AuNm6fCn4a9Zpue2we/xkhm90uF+4H4h3ly/J5USCDmqCWaVNK2sAhhnB8QBAcIrcO0C
         yr0g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793374061; x=1793978861; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gBnh0au+bqhOXvQQRGkJNLPo++sPE616YnlxDnGaF/g=;
        b=zeAnGE1lO/YFPQbeGUhT0A2jtaZYna3dC38zb/tYJIz4kggdLBnvSDZENhMHjJu++V
         V78HIfU7MRI8i7ZVUhlDG7/puvE5KPD2ITAcLNIGXHsHPESE3IbzPxVL6D2CtLV98bgu
         r7uQURlPS2QG2ifbzoQqD6pef4SXPinOjYUSGqCWUvSbLkxaCKEex/hLWsJMpLwFkPP5
         WKjx5UJmmrPUSJyAfrAzExy6un2cvF+mOUuQK/9c3L0+8VFhxSh1aImy5TBx7yELXxm/
         bjK/XW01+uVx5zKQC0aFlBIxylWLKZhd5BL6jQfCg+0+Je3pko7Ct0AQo5VU3MNi9GF8
         pdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374061; x=1793978861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gBnh0au+bqhOXvQQRGkJNLPo++sPE616YnlxDnGaF/g=;
        b=VViCtL+5Fsmy6fUCJ4+ZPwbsI88lEGny6xiMDqNlQPK9+lIul3Jp5L1tZSgXvkwYwf
         B64BokE0z95NVtxX6LqF7jsHSxxLUc95KFe+SqQ+24HM5rKmZNe0vErhNhhqSme0XRHS
         Y2041DIdXGNzvsqySbdcMbPq+x6G5EQ+76T3GX9vRAwBtiFEhLGhfZR983WapxSRwCCY
         BW+XMe8RfJHfGZXXkj/xN1mQcnkdXbd2EAtRVM+KT8JmCVLBX12tK1499A5KRDmpXdck
         iMYEvjz84r4FOH+QphrhqUQz3Iu0JDFlQcIYtQinhEj/2mQSQTqiBDM+aKlbX7s8NmKc
         tucg==
X-Forwarded-Encrypted: i=1; AKwUvBzHC/YMdJirBRuINgw/zKV4v8I6Ww8j3CazV6LIXn+za2YU5zGa+cCD5QWr77xr/b//adTqNPZUfirR@lists.linux.dev
X-Gm-Message-State: AFq9FYIpEkFnrD9XePTpGS634qRh8IXcXZEDuY62Wq+MTc684Th8UuU2
	1RkCiwyGMh4JDQ3HweZZOcJadp0KuzKBV4XwDc7f1XQFulDYjA3T558MEhVaIvzR5Sw09SKjHhY
	RfMvQgilJSj41muOUIri5yftpRjZrwuT3Wq6CaIU=
X-Gm-Gg: AYBFou1U8abQZPVak+PVg5HBOtNo/UxxHnm/xKawgf5/umTICzxhZdR12nPXmar1FEw
	5fFytbqHLZVZLxyO0e/NHDGQu2wF+YQoZHOzHodoZMlnOM2nIsah1V72LhNDOIWQr+E9V91mFpJ
	NreLdodjJMEUMKSGUaWx/3tqbYJOrRGQUjgFK9kDREoxu2HmlLVDsuW2Ou6/8xia/d7KZW1Ym7e
	o3JlG+A/yu9GPbuKirQryZDIeon9WsXjes5y8FzIL0mvQWWgIOpgNqk4LSf7ipdnwmB+Ermll0z
	NzSqsPwSehnjKHZzFB1F3Vq79b7u2SGhhX9EwmwlIXqwB1kYDCcK1aqS/L1hraGERaNMFRcdqQW
	6QxDSkgazoGWCI8HMuqxtay3OKouESSxxRc+NX0uj6JXXDRemSMDbA4UujOYvHdJpiHcuAg==
X-Received: by 2002:a05:6402:2750:b0:6b3:cc4e:7c50 with SMTP id
 4fb4d7f45d1cf-6b4d4d7df33mr2083278a12.32.1793374061204; Fri, 30 Oct 2026
 08:27:41 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028091215.914885-1-hanwenn@gmail.com>
In-Reply-To: <20261028091215.914885-1-hanwenn@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 30 Oct 2026 16:27:29 +0100
X-Gm-Features: AclHuK98Hkot19yNzs8o6P0CNkrnmjrZ6ce5PgyXlQTdkCXp8G1mQvsd0CU1TEA
Message-ID: <CAOQ4uxiQcyZv8B50MKM+Gn==JcoAVbgbCGBneXJhXUwR5X8ppA@mail.gmail.com>
Subject: Re: [PATCH 0/7] fuse: use readdir result to shortcut negative lookups
To: Han-Wen Nienhuys <hanwenn@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:12=E2=80=AFAM Han-Wen Nienhuys <hanwenn@gmail.co=
m> wrote:
>
> FUSE servers can respond to LOOKUP requests with {OK, nodeID=3D0} to
> indicate an entry is not present, and the negative entry can be cached
> for a specified interval. This helps reduce the number of LOOKUP
> calls, but it is still problematic: each negative dentry still costs a
> roundtrip. Since the universe of non-existing files is unlimited, in
> practice we must still do many roundtrips.
>
> We can do better: once the kernel has read directory contents (through
> READDIRPLUS), the server has specified which positive dentries
> exist. In most file systems, this means that all other lookups in
> the directory should yield negative results, and we can spare
> ourselves the roundtrips.
>
> In this patch series, we collect filename hashes from directory reads,
> and use them to populate a Bloom filter once the read is
> finished. Then, on lookup, if we don't find the name in the Bloom
> filter, we skip the roundtrip and return a negative result
> immediately.
>
> The Bloom filter is space efficient, while still allowing efficient
> updates when entries are added through MKDIR/CREATE/LINK operations.
>
> The TTL of the Bloom filter is derived from the entry TTL of the "."
> entry, if specified, or the minimum TTL of the positive entries. We
> use READDIRPLUS rather than READDIR, because the latter has no channel
> to signal a TTL.
>
> Once the filter is in place, the server should rarely get lookups in
> the directory. If the server does get lookups, this can mean two
> things:
>
> 1) the filter has expired
> 2) it was a false positive from the Bloom filter
>
> To address case 1), the server should be able to trigger repopulating
> the filter, but because of 2), issuing a normal readdir
> unconditionally is expensive, and the server may not have access to
> the mountpoint anyway.
>
> To solve this, we add a new notify method, which can return EALREADY
> (the filter is still valid; no further side effect) or OK (there is no
> filter; trigger a new READDIRPLUS to populate the filter again). The
> notify does not wait for the server, so it can be sent from the LOOKUP
> handler itself.
>
> The kernel reads the directory from a work item, with synchronous
> OPENDIR, READDIRPLUS and RELEASEDIR requests made on behalf of no
> process. The work items run on a workqueue per connection, so a server
> that does not reply only holds up its own reads, and at most 8 run per
> connection; further notifications fail with EBUSY.
>
> The notification also lets a server preemptively load a directory:
> READDIRPLUS is attractive because a single roundtrip can load many
> entries, reducing overhead, but many programs (eg. GCC) only cause
> single file lookups, and never issue readdir.
>
> Unfortunately, virtiofs currently does not support notifications in
> general, so the latter benefits are not available for virtiofs.
>
> The series is organized as follows:
> * patch 1 fixes lookup references leaked on READDIRPLUS errors. It is
>   independent of the rest.
> * patch 2 adds the Bloom filter machinery
> * patch 3 populates the filter from READDIRPLUS results
>   (FOPEN_COMPLETE_DIR)
> * patches 4-6 prepare for reading a directory from a work item, without
>   functional change: readdir without a struct file, requests on behalf
>   of no process, and opening and releasing a file for the kernel itself
> * patch 7 adds the notify method.
>
> To support this feature in userspace, the server only needs to reply
> with FOPEN_COMPLETE_DIR flag for the OPENDIR opcode. I did this in
> Go-FUSE, and added tests and benchmarks for the feature. Tests ran
> against a kernel with debug/paranoia settings. Benchmark against a
> kernel with production settings.[1]
>
> An i5-8350U pinned at 2 GHz yields the following performance numbers,
> in median ns/op over 11 runs:
>
>     ReadDirEntCompleteDir (per entry)      2,281
>     ReaddirplusHint (per entry)            1,801
>     NegStatUncached (LOOKUP round trip)   22,192
>     NegStatCached (dcache hit)               797
>     NegStatUncachedDir (Bloom filter)      1,587
>
> This was a synthetic, in-memory file system serving a directory with
> 500 entries, using the Go-FUSE high-level API running against
> /dev/fuse, measured with single threaded access to the mountpoint, and
> GOMAXPROCS=3D2. ReaddirplusHint drops the filter with
> FUSE_NOTIFY_INVAL_INODE and has the kernel read the directory again
> with the new notification; it is cheaper per entry than getdents(), as
> no entries are copied to userspace.
>
> The bloom filter is sized to 10 bits per entry, but then rounded to a
> power of 2. For 500 entries, this yields 8192 (16.4 bits per entry),
> with an expected false positive rate of 0.0006/op; the benchmark sees
> 0.0004/op.
>
> So, the Bloom filter yields a 14x speed up on uncached negative
> lookups, at the cost of a full directory read. This pays off if
>
>    size-of-dir < (cost_LOOKUP - cost_BLOOM)/cost_DIRENT * unique-negative=
-lookups
>                =3D 9 * unique-negative-lookups
>
> As a practical one-point sample: one of my open source C++ projects
> (lilypond) shows that a single G++ invocation gets ENOENT for 145
> unique names under /usr/include/libpng16, a directory with 3 entries,
> so scenarios where this is a win are easy to find.
>
> This code was written and reviewed with Claude Opus 5.5. The plan is
> included in [1].
>
> It may be interesting to lift the Bloom filter into the VFS, for two
> reasons:
>
> - other filesystems could benefit from this performance optimization,
>   if the negative lookup is expensive.  In particular: NFS, CephFS and
>   overlayfs.
>
> - the Bloom filter uses little memory, and makes negative dentries
>   cheap to recreate.  This could justify a more aggressive reclaim
>   policy for them.
>
> However, unlike the FUSE case, there is no way for a server to
> request a readdir, so it would need kernel-side heuristics to guess
> when this pays off.
>
> Open questions:
>
> - Where should the filter TTL come from? The entry timeout of "." is
>   convenient because of backward compatibility, but it feels like a
>   hack.  Alternatively, we could extend fuse_open_out (or repurpose
>   the space for backing_id in case of directories).  This has the
>   added advantage that we could populate the negative filter from
>   READDIR as well. Then again, READDIRPLUS is better overall because it a=
lso
>   loads positive entries with little overhead.
>
> - Should filters be reclaimed under memory pressure, and if so, how?
>   The filter costs ~2 bytes per file name, which seems little, but can
>   grow to 512kb for a large directory.

Thinking out loud.

Is  it really important to support FOPEN_COMPLETE_DIR without
FOPEN_CACHE_DIR? The two feature seems to have correlated
use cases.

Bloom filter is built at EOF, so it could be built at the end offset of the
readdir cache buffer.

I also think it may be worth having a mode that invalidates the bloom
filter along with readdir cache on mtime change.

This is a lower bar for servers that don't want to notify on all dir change=
s.
In this case, the lifetimes of the readdir and bloom filter are aligned
and truncating the page cache gets rid of them both.

Not having to deal with custom memory shrinkers seems like
an advantage for the first release.

Is this making any sense?

Thanks,
Amir.
