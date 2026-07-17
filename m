Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26EC381B15
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 18:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784313448; cv=none; b=XztpqyWJX4D/eFfnENkbNEkkFD27RcidD33Vg13mzZeUdieL6cK+jg16tysKflhhUBnBRjFioD0831ZF6CYAzAKsebSvVo7TqfKbKaF3DMLWUZ0lZZ5f25maUZPdaT17/MPwZ+W72j4Z6iGXyLQ5CjCZPRcgeh8Z27vFdvr/abQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784313448; c=relaxed/simple;
	bh=4ReGRvX/XUN9k6+35YgLn8Llyjq6br5bJT3DekW1+lg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oNYS51ecr7uoMfIQuPC4JUq5V6vA+IbZ+j9KC4TEUsxhPgANvaSAYh+r6M7TwVAWTuvlCZzaQ35E185kiwNiwP87yPvCLnBqhSXVT6e6+Y8PV9xJg/lSihpHTtt6PeKGOQvNtESlyQxQA+3GgQKBe9NFtWMqgMhPbHXWo8+W71A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8a05335a820e11f1aa26b74ffac11d73-20260718
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8debff5f-5acd-44b4-b663-a4678c24f217,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:ac13cd638f73cb73f6a5dbafb58701c7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|850|865|898,TC:nil,Content:
	0|15|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8a05335a820e11f1aa26b74ffac11d73-20260718
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2005980946; Sat, 18 Jul 2026 02:37:18 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	djwong@kernel.org,
	brauner@kernel.org
Subject: Re: [PATCH v2] fuse: honor desc offset in readahead reads
Date: Sat, 18 Jul 2026 02:37:07 +0800
Message-Id: <20260717183707.1380274-1-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAJfpegv=akLW1qzq=B=F11Qfx5Gg8qoRiV4Z-pty-0Og+sU4GQ@mail.gmail.com>
References: <20260717032835.922433-1-lihaofeng@kylinos.cn> <CAJfpegv=akLW1qzq=B=F11Qfx5Gg8qoRiV4Z-pty-0Og+sU4GQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miklos,

Thanks for the pointer.  I looked into the cases raised by Sashiko, and
all three findings are valid.

More precisely, these are partial-folio rather than large-folio-specific
issues.  The relevant condition is that a folio contains multiple
filesystem blocks.  Large folios are one way to reach that condition,
but fuseblk with blksize < PAGE_SIZE is another.

On the current tree, regular FUSE and virtiofs use PAGE_SIZE as the
filesystem block size, and FUSE does not opt its mappings into large
folio allocation with mapping_set_large_folios().  Therefore, with
order-0 folios, iomap_adjust_read_range() cannot skip leading blocks and
produce a non-zero descriptor offset.  Unless the test tree enabled
large folios for FUSE separately, this likely explains why fsx-linux did
not exercise this path.  fsx-linux does verify data contents, so it
should detect the corruption if the partial-folio state is reached.

The currently reachable in-tree case is fuseblk with blksize < PAGE_SIZE,
after commit 93570c652b80 ("fuse: remove fc->blkbits workaround for
partial writes").  A partial buffered write can leave leading blocks
uptodate while later blocks still require readahead.

The three findings are:

1. In the /dev/fuse copy path, fuse_copy_folio() zeroes the entire folio
   when page_zeroing is set and count < folio_size().  For a partial-folio
   descriptor, this destroys the leading uptodate or dirty blocks that
   iomap intentionally skipped.  It should zero only the unfilled
   descriptor range:

       [offset + count, offset + length)

2. The virtiofs scatterlist starts at descs[i].offset, but its short-read
   completion zeroes the absolute range [len, thislen).  For a non-zero
   descriptor offset, the correct range is:

       [offset + len, offset + thislen)

   The existing WARN_ON(descs[i].offset) reflects the old zero-offset
   assumption, which is no longer valid for partial-folio reads.

3. At LLONG_MAX, fuse_send_readpages() decrements both the request count
   and the last descriptor length.  iomap has already accounted the
   original descriptor length, while fuse_readpages_end() completes only
   the decremented length.  With an iomap_folio_state,
   read_bytes_pending is left at one and the folio is never unlocked.
   This affects both values of the async argument, since both completion
   paths go through fuse_readpages_end().  The boundary is narrow, but it
   is deterministically testable by extending the generic/525 scenario
   to a multi-block folio configuration.  The transfer count may be
   reduced, but the original descriptor length needs to be retained for
   iomap completion.

These issues predate this patch: non-zero descriptor offsets were already
recorded and used on the reply side.  This patch fixes the independent
request-position mismatch so that the requested file range agrees with
the descriptor offset; it does not change descriptor construction or the
copy and completion handling above.

I will prepare the three additional fixes as separate patches.  I can
either send them as follow-ups or respin this patch as part of a series,
whichever you prefer.

Thanks,
Haofeng
