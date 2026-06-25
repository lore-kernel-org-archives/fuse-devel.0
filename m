Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D89137D11A
	for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 08:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376489; cv=none; b=lNbq6rwa2WUn3mcIecKQUCgILLBp68lTUvZyv2dLNdLq7BFbRaV6BHWZFBEKJ6tHdwU0jjU9JXzw6yI1iYCRC2DdtjdaXfhlEVZWlVpJi4od3W797YHdw46pElWhYiBSDuQEAEa41FLfAIKIwxMlT/DsBPl2lF6BeqBGAD10R4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376489; c=relaxed/simple;
	bh=7BEwt6eYwfYFJfykt1yWvyBcAyXt9b2E6Fr7Bm2s5hY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vg+zaQBiud6oAjNZbDNnEbQ3iiG2hXLpskoxHXUbWV5jYK8bl4DLVEoOmDmP0Mw+B1YP47T+VHcEJbQxO3Ze0jQYLaEGhDrq3E4ebBmScTOxBhrKaht8T2Dk6D1M6CavRYiY3B3QEcDkyb3/Vc/bqO2WqLO+Ti0cCr6jczp3RHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XahlinpF; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XahlinpF"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-46def4bd5e8so246600f8f.1
        for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 01:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782376487; x=1782981287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cwuPvDSXXbiyOTdpO1yF6fW9CB9apWEc+I7V+XWMZf0=;
        b=XahlinpFz9KTIDhYEd0o1fF7ccUelvOv3pKU7ixvmbOk/wWfa1fikU9kGqL8KMwevx
         2bAvh9cvIeVOtvDaWj+OOkahjzSjeUNnyFos6psm/d09U0LE/g42F74wlAud3uuIbCCZ
         3ZZcTElYHP/53CFRx5Mch4sBccwj9xMHJQJCo5uIVdjt3OrpBNa/H4opiZSP677DbzDM
         kAqkRHv1QFP6kUqnYENpy6Wi0qwUs9Hn9X1Sw+EVFufNMf/W2Jem/QHOKABVqCrV6DWh
         RQLeSj1pzCKPn5QdSICFiSFJahwNKGRKgv5Ox0tQxtogesFn8xqeaQrsm6rhYcAZFiCo
         cGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782376487; x=1782981287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwuPvDSXXbiyOTdpO1yF6fW9CB9apWEc+I7V+XWMZf0=;
        b=ml3EGIApC3pv8uVteduatr/OdT0diWgrHGz4Bdz8SZBUfZOK6+BuG9eobZOFb9uhxm
         qDgJJXqsrD5t4B81RSzjNLPd5dx7gIhr/IhzdX0XDRQKtTOiPKuCK6uc2NtctkDLvh9l
         Qyyaznl+soJqOIFUMCKUQW1pDffqZ+Q78rcc4PMmVx6OExm7CPPRgWycG+8wm95P6SnF
         EGnf6LvDMCnEhGgrMnec8Vd4NNr6LRVUUBbZ7oQcg2bE9nTaKpskPf36Qqvp85eyk1Yu
         pa1VD3PI/lGd6P2k/K6UD3/yDAAwtYY8zxnltTn/uJ+mA0dwWQovlCOFdZ4eHozvh/nC
         at0w==
X-Forwarded-Encrypted: i=1; AHgh+Rqh+xbIFJoiSE8Uqc+Mc4SJCGx527b9bJzSyYqhyYiLfi2GtdAkBFj4PsGCbgsT3FXM6iRedl0bUmBs@lists.linux.dev
X-Gm-Message-State: AOJu0YzXTjlIcrYSyZa5IzER0p3IzYiHBDOq6TTe2EGrcYWprLcGqvSa
	7xx538pG9hWsTE/Sz20BK+2iW3QtDxoQnsL86Pg0+RxUFbupu4z9mlQ9
X-Gm-Gg: AfdE7clZCSFnHybuq7DTJRBNpyIxpGGaoDzp4Q7KV9CU5341wD2iPB9MDBIZOfF47CR
	4cWlP/PfhnSvqItLNFa4MCPCJ2niD9AHvtlrH9VbL9xR4yzoGVG20mrL867sNBOsrneOs6pYmG6
	5DEStu0e9lH97au0jmynQAVgfQgtS12kX2LSem222BPmwQ469htOrC7Tpx/PWPmOhWUUU4n3pBe
	cl88zmyKG2lFIL0pW7jB0khydhLv4kpv/OcyC3JPY3omwdJU+gjbIbfv8nbKL/KBcc+bs/5Ci87
	jV2Ka89N5OC+5WhIHtre7ZBfHylk4M75S/nnUCIRhFeenqsTM5bDP4YJa64DSSCI0fbRrgMxwEs
	GC8PkMTOumM7IYRlFyXc+FrvBTXXmtVkwevreWY90nsqc7uG+eiBUHV9HYPgpbDGP3EIIx/D1Pv
	7ZnobQPKSR
X-Received: by 2002:a05:6000:2f8a:b0:46d:d6c1:8383 with SMTP id ffacd0b85a97d-46dd6c18494mr1746107f8f.44.1782376486646;
        Thu, 25 Jun 2026 01:34:46 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46c221d998esm13183555f8f.24.2026.06.25.01.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:34:46 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-api@vger.kernel.org,
	netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@infradead.org>,
	David Howells <dhowells@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Andy Lutomirski <luto@amacapital.net>,
	Collin Funk <collin.funk1@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	Stefan Metzmacher <metze@samba.org>,
	The 8472 <kernel@infinite-source.de>,
	Willy Tarreau <w@1wt.eu>,
	Joanne Koong <joannelkoong@gmail.com>,
	Val Packett <val@packett.cool>,
	Andrei Vagin <avagin@gmail.com>,
	patches@lists.linux.dev
Subject: [PATCH v2 0/7] vmsplice: fix some problems in my previous vmsplice patchset
Date: Thu, 25 Jun 2026 08:34:02 +0000
Message-ID: <20260625083409.3769242-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset is for VFS. Of course, it depends on my previous vmsplice
patchset ( https://lore.kernel.org/all/20260531010107.1953702-1-safinaskar@gmail.com/ ).

I fix some problems in my previous patchset.

1. Fix problem with CLASS(fd, f)(fd). See first patch in this patchset
for details. This is probably not so important, but I fix it anyway.

2. Change "unsigned long" back to "int". See second patch for details.
Again, this is probably not important, but I want to fix this anyway.

3. Fix that LTP vmsplice01 bug.

4. libfuse relies on sharing vmsplice behavior. So we detect particular
combination of flags to pipe2(2) and vmsplice(2) and return -EINVAL.
This forces libfuse to fail back to non-vmsplice code path.
I. e. we fix libfuse-related regression [1].
I did debian code search for regex "vmsplice.*SPLICE_F_NONBLOCK" and
I found no other packages with this particular combination of flags
except for fuse itself. (Okay, other packages are fio and stress-ng,
but these are merely testers.) So, I think this is okay to return
EINVAL here, breakage will be minimal.

5. Set FMODE_NOWAIT for named FIFOs. CRIU relies on ability to do
vmsplice(SPLICE_F_NONBLOCK) on named FIFOs. So, I fix this CRIU-related
regression [2]. But there is another CRIU-related regression, which I do not
fix [3]: CRIU behavior in splice mode becomes so slow that splice mode
becomes useless. I personally still believe that removing vmsplice is
right thing to do. Other option is doing nothing. Yet another option
is to implement some deprecation period [3]. Let other developers
decide.

See patches for details.

Please, run that LTP vmsplice01 test again.

Notes:

- I want to repeat: I change behavior around SPLICE_F_NONBLOCK.
Previously, vmsplice ignored whether pipe itself was opened as
non-blocking file. Now it is not ignored. And in my opinion
new behavior is better.
- vmsplice(2) now is in fs/read_write.c . It is very similar to
preadv2 and pwritev2 now, so I think it belongs to fs/read_write.c now.

Please, review this patchset carefully. I'm still new contributor.
In particular, please, review that do-while loop, I'm not sure I did
everything right.

Tested in Qemu.

[1] https://lore.kernel.org/all/CAJnrk1Y9egYizkx1H9K0cqxSYuB+7vLvQbV7Tf4C5eHFqnnC-A@mail.gmail.com/
[2] https://lore.kernel.org/all/CANaxB-zK5q=Xw6UZTmeFtXsDZjUsPkFk=p485m-wtNTBnf4hgg@mail.gmail.com/
[3] https://lore.kernel.org/all/CANaxB-xUrLQYGiRJZc4Boi+KX=0TJSWymErNovANVko20fMDVA@mail.gmail.com/

v1: https://lore.kernel.org/lkml/20260606061031.3744880-1-safinaskar@gmail.com/

Changes since v1: fix fuse-related and CRIU-related regressions (see above).

Askar Safin (7):
  vmsplice: open-code do_writev and do_readv
  vmsplice: change argument type back to "int"
  splice: turn wait_for_space flags argument into bool
  pipe: move wait_for_space to fs/pipe.c and rename it
  vmsplice: make sure we don't wait after writing some data
  vmsplice: return -EINVAL for particular combination of flags
  pipe: set FMODE_NOWAIT for named FIFOs

 fs/pipe.c                 | 23 +++++++++++++
 fs/read_write.c           | 71 +++++++++++++++++++++++++++++++++++----
 fs/splice.c               | 19 +----------
 include/linux/pipe_fs_i.h |  2 ++
 include/linux/syscalls.h  |  2 +-
 5 files changed, 91 insertions(+), 26 deletions(-)


base-commit: 8d86fcfc2857d64af85f5c87c193c25655c970af
-- 
2.47.3

