Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178760;
	b=Pn5O8H+FMDfPudqm6oESVwZdmlBxR5/5MSMLvYgjDy1Ns2R68epal3JmraExNqDP/yzn
	 x7ycvEXsEAJdjAfQzLQHCh1FbYyZjEoK8g3Ni5jfOxoMLHjxwqBtLVCTLpLO0Nhgv+HzP
	 Fb9W9eUE5tNUBQU4AkKV7jD1e4iUsm6jVxANxQVdcHD/hiH3AaExPbs67yj6rJFCuu9I5
	 OojQ/4SOMT69Y+lXFufKUnPS817e2IPcAUjEtF6EhAXntypOZSpT1txY/GM43IWjf6Ef6
	 Ok4/vaSXifD9ZeFryMClsrA0MVNYKfFH7NlXoyDCkGr2mGFcfzmFGz3CIQFXHmNE1/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=A9OJwUcxnXtgHuBv1JNQDTqJALEL8APpF2x+EYn8rt4=;
	b=rjMT1q8HuYhjF/0MuyChB13IYbcYZ2lGpNmW0DeFA72mgeHtv6ZbmyqFfoBdYTikvOLo
	 m6N82ZVEJzu/YyzIxzTk0xjsUkv+no5HYjaKG+XYW43m1gb1V2rVLjWSD/UsBoaGjHiFs
	 3HO/Yrz1gCOTtp9AIN5tLVVotKJL1ZstY8BJV6V8uFJTk+dgyYFIpG1jUWLJBXvrksgZ3
	 ugBaqNXa3YZm9q0DC6pYZoojPmzndRnPc7Wkj9MaDE/ZmtYiq9jUQdYpiC0++g8k4KP8P
	 Pazkl836fWJnZjCsyDFarpEEXGz4mI8TrPkXZ4c4EyPm7BaP15VeTbHK7nmgeIrOvbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n3nGEU16;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB63606A31A
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 09:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB63606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n3nGEU16
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso5971225e9.3
        for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 02:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178759; x=1793783559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A9OJwUcxnXtgHuBv1JNQDTqJALEL8APpF2x+EYn8rt4=;
        b=n3nGEU16PC66UfUSJTI4LxUENbpuvyTrj5wpD7StXwJcxSk/4VpOnM/uEvhthdzwVD
         HFR62veBKU8eQ8Q4Gn7bIDlKLYUgrmKP+emFfXDjUamZg61u0eu6myZgTAA60ENFOcBm
         3iApQXBySdZFUUzrgw6jhX6AonEmsU0XSj1lLw/mdAWUV6sZI/Z8Xt+3pLX1dIuxVqve
         Lp20TqVIeC+WACUEXhkYU1pq+6hd+mBfq5VP+LrivXodH5stmvgMqmnfTZ8ok4LSvJQf
         4J4ZMTnaV1X6Uocnv1v+Fn+obbUnNRUywc8dmg4fsrZB9lV+WUwpNLxeDLE0SLe7I97B
         MQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178759; x=1793783559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A9OJwUcxnXtgHuBv1JNQDTqJALEL8APpF2x+EYn8rt4=;
        b=OhwPVc0fHYZPRMBw1iVY4zNn1q6aLe7pU+Rg8f2kdpn5WXi8ytSRmnaKuWJLn2Cudb
         Hbe5tHpZ9HyUUgqdz3bOFUk+pdj/kGgff7YL5tchnNtR6brffyeu1sby/aUyEMD5l1Cm
         UvekIw1AVY5JdaQtuAoGjinWW3achUq3J2OHaVC89xukOFZHbpfwgUHIS2xPlI4Q6tvn
         HZE3hWf80JhQVeRSM38bnqk9aibI7R6d4FkEqZGpR+c4VbU530kqOwKjUL0ZZzzR+zG5
         KqafJvWgaQFA+qhqaAfSB+dBChrVdC+xD3EMLY6Xld/VDTRzRXykKP6ynvPENqBxnq8m
         wZIg==
X-Gm-Message-State: AFq9FYK5qZNDOJ/himXFLA1+5lORDIbPNx0f7P0wIUqNXYYS4MpzN06g
	Jm+KrWUxfpedC4S58DTcdWLDnfz6giL0j9Ca6NNtX/6k8mUcGDzrR5XylURnBfZX
X-Gm-Gg: AYBFou3uLad0pnWPogr2f9IQUkJx57m97Lz+bLyTmOgdyYwGKHcghG1DDSCQqNg17D8
	XCztlmL87zjaNg+nNc+6vSMj99xz7bYJx8PokWGKW1KVQEopuKN7MmtY7k72LmUOmabgTratg5V
	uJGRn66GW1b48i83oBIA/OOh2KZYDqXxZj1SL3tAHR0qkC2F+XdtylIphxpcHO1wEBDgCKgKfQ9
	aB7dQxzruDjhpNCFETVqp+vkXBHs4oDtkL3VqIyCPuZr/TFAgF1skwEehd3yKpbPo56NOBKeXZm
	WrCL6MFJLO3yb28HwN9AiZMjuvbTxlV8Gz6GMmku7Uzu8Lg27IE4hYdV58vCrUCkJXpz6S0L1L1
	XNJhBB8soifHfo1PTKGEuxYfS4SbALm6kmh786TKzQ0vGhxy3ZjsK0PEjXOzA75PJzZsUu/mYAr
	UUiT1NZULgV4AHQq8bZ8AnJCweVwKlkW8G9w3hWTTFAVxCEPNpx40M5mtFXGgRGBEw5X150TDnw
	YShSv89jzDgQfmGURMLnlml+IQ3/B9FlvfljfuYaDnE/39K2vKPBskP8ml9Dli7nGoPst+re12i
	KBpy8qGkhJOPDcjeu5JetNI5vNe0X2lNVlZY0Uvpzf/UiMvJnmlOT3v17IEB4JQ=
X-Received: by 2002:a05:600d:11:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a974528f91mr24264035e9.0.1793178758341;
        Wed, 28 Oct 2026 02:12:38 -0700 (PDT)
Received: from t480.fritz.box ([2001:a61:3a4e:c601:fc75:724e:6b78:3649])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c42b3c1sm33507215e9.6.2026.10.28.02.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:12:37 -0700 (PDT)
From: Han-Wen Nienhuys <hanwenn@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	Han-Wen Nienhuys <hanwenn@gmail.com>
Subject: [PATCH 0/7] fuse: use readdir result to shortcut negative lookups
Date: Wed, 28 Oct 2026 10:12:08 +0100
Message-ID: <20261028091215.914885-1-hanwenn@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FUSE servers can respond to LOOKUP requests with {OK, nodeID=0} to
indicate an entry is not present, and the negative entry can be cached
for a specified interval. This helps reduce the number of LOOKUP
calls, but it is still problematic: each negative dentry still costs a
roundtrip. Since the universe of non-existing files is unlimited, in
practice we must still do many roundtrips.

We can do better: once the kernel has read directory contents (through
READDIRPLUS), the server has specified which positive dentries
exist. In most file systems, this means that all other lookups in
the directory should yield negative results, and we can spare
ourselves the roundtrips.

In this patch series, we collect filename hashes from directory reads,
and use them to populate a Bloom filter once the read is
finished. Then, on lookup, if we don't find the name in the Bloom
filter, we skip the roundtrip and return a negative result
immediately.

The Bloom filter is space efficient, while still allowing efficient
updates when entries are added through MKDIR/CREATE/LINK operations.

The TTL of the Bloom filter is derived from the entry TTL of the "."
entry, if specified, or the minimum TTL of the positive entries. We
use READDIRPLUS rather than READDIR, because the latter has no channel
to signal a TTL.

Once the filter is in place, the server should rarely get lookups in
the directory. If the server does get lookups, this can mean two
things:

1) the filter has expired
2) it was a false positive from the Bloom filter

To address case 1), the server should be able to trigger repopulating
the filter, but because of 2), issuing a normal readdir
unconditionally is expensive, and the server may not have access to
the mountpoint anyway.

To solve this, we add a new notify method, which can return EALREADY
(the filter is still valid; no further side effect) or OK (there is no
filter; trigger a new READDIRPLUS to populate the filter again). The
notify does not wait for the server, so it can be sent from the LOOKUP
handler itself.

The kernel reads the directory from a work item, with synchronous
OPENDIR, READDIRPLUS and RELEASEDIR requests made on behalf of no
process. The work items run on a workqueue per connection, so a server
that does not reply only holds up its own reads, and at most 8 run per
connection; further notifications fail with EBUSY.

The notification also lets a server preemptively load a directory:
READDIRPLUS is attractive because a single roundtrip can load many
entries, reducing overhead, but many programs (eg. GCC) only cause
single file lookups, and never issue readdir.

Unfortunately, virtiofs currently does not support notifications in
general, so the latter benefits are not available for virtiofs.

The series is organized as follows:
* patch 1 fixes lookup references leaked on READDIRPLUS errors. It is
  independent of the rest.
* patch 2 adds the Bloom filter machinery
* patch 3 populates the filter from READDIRPLUS results
  (FOPEN_COMPLETE_DIR)
* patches 4-6 prepare for reading a directory from a work item, without
  functional change: readdir without a struct file, requests on behalf
  of no process, and opening and releasing a file for the kernel itself
* patch 7 adds the notify method.

To support this feature in userspace, the server only needs to reply
with FOPEN_COMPLETE_DIR flag for the OPENDIR opcode. I did this in
Go-FUSE, and added tests and benchmarks for the feature. Tests ran
against a kernel with debug/paranoia settings. Benchmark against a
kernel with production settings.[1]

An i5-8350U pinned at 2 GHz yields the following performance numbers,
in median ns/op over 11 runs:

    ReadDirEntCompleteDir (per entry)      2,281
    ReaddirplusHint (per entry)            1,801
    NegStatUncached (LOOKUP round trip)   22,192
    NegStatCached (dcache hit)               797
    NegStatUncachedDir (Bloom filter)      1,587

This was a synthetic, in-memory file system serving a directory with
500 entries, using the Go-FUSE high-level API running against
/dev/fuse, measured with single threaded access to the mountpoint, and
GOMAXPROCS=2. ReaddirplusHint drops the filter with
FUSE_NOTIFY_INVAL_INODE and has the kernel read the directory again
with the new notification; it is cheaper per entry than getdents(), as
no entries are copied to userspace.

The bloom filter is sized to 10 bits per entry, but then rounded to a
power of 2. For 500 entries, this yields 8192 (16.4 bits per entry),
with an expected false positive rate of 0.0006/op; the benchmark sees
0.0004/op.

So, the Bloom filter yields a 14x speed up on uncached negative
lookups, at the cost of a full directory read. This pays off if

   size-of-dir < (cost_LOOKUP - cost_BLOOM)/cost_DIRENT * unique-negative-lookups
   	       = 9 * unique-negative-lookups

As a practical one-point sample: one of my open source C++ projects
(lilypond) shows that a single G++ invocation gets ENOENT for 145
unique names under /usr/include/libpng16, a directory with 3 entries,
so scenarios where this is a win are easy to find.

This code was written and reviewed with Claude Opus 5.5. The plan is
included in [1].

It may be interesting to lift the Bloom filter into the VFS, for two
reasons:

- other filesystems could benefit from this performance optimization,
  if the negative lookup is expensive.  In particular: NFS, CephFS and
  overlayfs.

- the Bloom filter uses little memory, and makes negative dentries
  cheap to recreate.  This could justify a more aggressive reclaim
  policy for them.

However, unlike the FUSE case, there is no way for a server to
request a readdir, so it would need kernel-side heuristics to guess
when this pays off.

Open questions:

- Where should the filter TTL come from? The entry timeout of "." is
  convenient because of backward compatibility, but it feels like a
  hack.  Alternatively, we could extend fuse_open_out (or repurpose
  the space for backing_id in case of directories).  This has the
  added advantage that we could populate the negative filter from
  READDIR as well. Then again, READDIRPLUS is better overall because it also
  loads positive entries with little overhead.

- Should filters be reclaimed under memory pressure, and if so, how?
  The filter costs ~2 bytes per file name, which seems little, but can
  grow to 512kb for a large directory.

- Should filter use be tracked? A referenced bit (set on the first
  negative answer) would let a shrinker drop unused filters first,
  and would tell whether re-listing a directory paid off. Hit
  counters per filter would contend between parallel lookups, so
  observability may be better served by tracepoints, or per-cpu
  counters per connection in fusectl.

- For the background read, can we use a kernel thread and leave it and
  its buffer unaccounted for? An earlier version used a background
  request, scheduling follow-on requests from the end callbacks, but
  it looked more complicated.

- what level of self-tests is appropriate for this change? The
  simplest test I can think of is a file system that runs the notify,
  waits for the readdir, and then checks that stat() calls don't
  trigger LOOKUP.

[1] https://github.com/hanwen/go-fuse/tree/complete-dir


Han-Wen Nienhuys (7):
  fuse: forget READDIRPLUS entries that were not linked
  fuse: add a negative lookup cache for directories
  fuse: fill the negative lookup cache from complete READDIRPLUS passes
  fuse: split readdir requests from struct file
  fuse: allow requests on behalf of no process
  fuse: open and release files for the kernel itself
  fuse: let the server ask for a directory to be read in the background

 fs/fuse/Makefile          |   2 +-
 fs/fuse/args.h            |   2 +
 fs/fuse/dir.c             |  35 ++-
 fs/fuse/dir_names.c       | 274 +++++++++++++++++
 fs/fuse/file.c            |  48 ++-
 fs/fuse/fuse_i.h          |  66 ++++
 fs/fuse/inode.c           |  18 +-
 fs/fuse/notify.c          |  23 ++
 fs/fuse/readdir.c         | 613 ++++++++++++++++++++++++++++++++++----
 fs/fuse/req.c             |   7 +
 fs/fuse/virtio_fs.c       |   1 +
 include/uapi/linux/fuse.h |  45 ++-
 12 files changed, 1054 insertions(+), 80 deletions(-)
 create mode 100644 fs/fuse/dir_names.c

-- 
2.56.0

