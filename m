Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270357;
	b=pkhBZqfYtWlmgS2BfqKZZTeNiSnpXjWYOb3Wj5oSIIzGR4V0sWm2tdo+VLCkpZGArpol
	 BzbF47Lew829AXgfRbLRi6KL9qlDDlX/k7XO2Cx5Z0cmUNwGf42Q3bw+nmeHiTYY815gb
	 Y3kt5aBuazMnuLvJk/rqgeZ5R0oHDS9NIVKx+bfHf4V7XzxzyFRujnv77/WO2RaAQif8T
	 X4PmyYd0E7sswGacs4+tCAvex5p4mqKOaXrLuT4fUYHhNQVKUdeUjneZeWwSn9EQsfJRu
	 e3Sse+3BE2khwTwSy/pkIy02EYQM2UquS4v4isoklew4JZGiEOl5IqO+sUSqzONxAKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JmwoDj3PG9XFrsBQzQoBbAJE6gd81sDGhucCNwLvdrc=;
	b=guIgsnrkqHj0QCfiI81FglkPT6tixyVcP5k8T2lGG2B3nj0/zk4XSNwoh5dOlqXJU9lw
	 MO6vxeVwQdVWH5j3uH4VqjT2cHxKwSazuv7a9+Zut/b66aqIWhm6fhvUJUC59AbLgb59e
	 dsiqj5a8NhL+LSqRy1fs75M+MKla8TKzKbLAB1DEDWktun7vkKy9xEzUpD+dcrtEo55va
	 u1vasGJTnyErsfLGCRbyhfxlf5rKfl140vmt5tmlVVrIHQMHpAk4/Rcz7boqd6Kvq05OT
	 CbAwVj6h7D+ph2Fg/nKMl5Aod/89MklI09H5U1I30qDbwqKGAWYsBps6hnsrQ3dxFYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zjsmw7yO;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A2E606A320
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A2E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zjsmw7yO
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso409446a12.1
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270355; x=1793875155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JmwoDj3PG9XFrsBQzQoBbAJE6gd81sDGhucCNwLvdrc=;
        b=zjsmw7yObAS2VR0XttH/C1E5ID8LImQKxCLLfWIlfFBtJiAZX8Yx6w3hw6iujeg+6E
         ZnBU1ydI1gD0p5X8GDwANHsG3sQOj5I/OXYr9dQCf83mX011ChID/ylgg9uEpcdn8DGU
         omiA+Cid5VJENvoUSTs/dSP3S5V690KUZ4v5qfPrRJ1w3h3Hyfc2CfhwpICQYdSGFIQu
         NiBgz8XbOGi1jEziUIXwq5Bp1ZybI5jSblade8xM6ed6eRBL/THHjKrw14Ou77ioS2UJ
         jdFan24wfV41eh14cfChQSxyD3ZMj7r/pPRNGqUT7rvwsTprf9DNgLw6eeJp2K0z5iSY
         BaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270355; x=1793875155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmwoDj3PG9XFrsBQzQoBbAJE6gd81sDGhucCNwLvdrc=;
        b=eA4Xrp8+dAgLtyH+fYywmPKQeYJuRvjixnOPUmbcsIv4UYTFTI0rVlDtTgwwryajb/
         sZb/N70LkRvur6anjq3Xor7wBkjIZrQpvYC78rLfa2Yr2WQqm6zzvlgjRcdDZp8+man1
         lplA/q1KIjzificdmq2An7hCFQCFAgSNLNca7KZYwllwChwmwE5OC22eDUt3Icz1Jwzo
         J1PM8nfv7pjGFST4CkcV53DMrx1p3hFLqpUpOZ4qr1Zot1MyVI2lzU6HYuFW/j8kO+Of
         aONKdwAX2SkwvqTsWHmDmBLDaFaxEcCMpzREfrpKSauydVkH0bZrfw+HgpuIBFOiH0Km
         TTgQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+l6TL6cLvabYEmr8TW0AH3FrUvUh8pcp2n7dKMAA0CuhhV4K958wTGWEDVillQHjjweWUjrS9f3d5@lists.linux.dev
X-Gm-Message-State: AFq9FYJMkyhmHy+4/suR0dhKUfoEYNoIKp0eobEOadDGym/UQXJ2IufN
	pR97HRgAdNqkh3h7CdrQLv3EFFhdQaLagZ5iE4V1PRUsjABh0s2jyN18
X-Gm-Gg: AYBFou1D5ByCjfty++7VCeD2IBBig7t7WhNNIWGZE9CfVQhxaW90fTYkSDLaDYePNQO
	T6m7m4bqYL7cpPJdM7gIdr7furiPdqkoZiKJ3T9ve6wN1OjyC6WRSPYyMJR1wphwSrIAMaTaVDV
	hGvyXIhM7qdU8FWg4yaytEkJhGMkLCgcoDkWcXnURV1/jTKJXG37Mc4Zw24TTl7pWA9L+R40xZe
	uLMLXEF2p3vEqqh69pvsD26tObXB01BlL95ieD+V7+F2/qJZxYUCXjkVes0iKlJ3KGi02IgC94A
	Wc+sS0blNbnDP3++XykyM1IPK4sd/lgp1KzHPdAbaAC7E8U387Vm+y5LYFUwezeKCblXkaykrRe
	TJRKhs+DG3pn0/Ore7qTunVfM2sCiNPzqtRARM/RoLkLngMHSY1vh3sPUjLskVKmPRpcfGYP3wY
	HLzum3srFMnV/0bYie496OzI3E1OGOHXzMbcs+RovOdY000WjBew6dnJfNnE2ZenkgOgVqnh+G+
	a/cu+Mq7qASUwJO95TrUZ4jE4XaHJQZc3emNI9yjpZmFrjGI1zfzeE7Vmfu2mjZ+Lj6ePtKndGs
	ffiT2Is6V36T7vcr49Uj4q+6HgLSmE09+kltvIviQzWCd6pmWbcbuz059WeRd8F1cNeBiYnUl4G
	NuKx0miz+/5LNagyRj+nF8IPnYZaojDdy
X-Received: by 2002:a17:906:99c1:b0:c29:22cf:b0f5 with SMTP id a640c23a62f3a-c49bdf39ecbmr404107366b.33.1793270355081;
        Thu, 29 Oct 2026 03:39:15 -0700 (PDT)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49954c8ff1sm479288166b.78.2026.10.29.03.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:39:14 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: [PATCH 00/16] Overlayfs fixes from Chris Mason (batch 1)
Date: Thu, 29 Oct 2026 11:39:04 +0100
Message-ID: <20261029103913.2785828-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Hi folks,

The following batch of patches is part of a collection of overlayfs bugs
reported by Chris Mason.

These bugs were found by Chris' AI code scanner (kres), but underwent
extensive manual auditing and filtering by both Chris and Josef.

I thank them both for handing me a reasonably sized pile of patches,
most of them important, correct and ready to merge.

The patches selected in this batch were either simple enough to merge
without questions or important enough for me to invest the extra time.

Patches that I changed include a note [amir: ...] with my changes above
my signature.

Notable changes from Chris' version:
- Include "fortify ovl_copy_xattr()" and "assertions in dir cache"
  patches already posted publicly for similar reported issues
- Use LOOKUP_EXCL in "do not copy up a dentry that was removed"
- Add vfs helper try_take_dentry_name_snapshot() instead of open
  coding it in overlayfs code
- Fix for empty security.capability from Josef adjusted and rebased
  onto "fortify ovl_copy_xattr()" refactoring

This pile applies cleanly and was tested on top of 7.3 and on top of
master of the moment.

Backports down to 6.1.y are either trivial or already prepared in
my local tree. I will make those available to the stable maintainers
after upstream merge.

PR will follow soon.

Thanks,
Amir.

Amir Goldstein (4):
  ovl: fortify ovl_copy_xattr() against underlying layer modifications
  ovl: add assertions in dir cache code
  vfs: add try_take_dentry_name_snapshot()
  ovl: skip copy up of empty security.capability

Chris Mason (12):
  ovl: do not copy up an xattr value that was never read
  ovl: set OVL_WHITEOUTS before publishing the upper dir
  ovl: check that the parents of volatile/dirty are dirs
  ovl: take a snapshot of the name for copy up
  ovl: do not take a name snapshot in RCU walk
  ovl: use the pinned upper dir in ovl_fix_origin()
  ovl: hold a reference on the parent in readdir
  ovl: do not copy up a dentry that was removed
  ovl: fix a torn path in ovl_get_redirect()
  ovl: read the nlink xattr of every indexed non-dir
  ovl: always encode the origin fh when index is enabled
  ovl: set the revalidate flags after d_instantiate()

 fs/dcache.c              |  29 +++++++++--
 fs/overlayfs/copy_up.c   | 110 ++++++++++++++++++++++++---------------
 fs/overlayfs/dir.c       |  22 +++++++-
 fs/overlayfs/inode.c     |  14 +++--
 fs/overlayfs/namei.c     |   8 +--
 fs/overlayfs/overlayfs.h |   8 ++-
 fs/overlayfs/readdir.c   |  61 ++++++++++++++++++----
 fs/overlayfs/super.c     |  21 ++++++--
 include/linux/dcache.h   |   1 +
 9 files changed, 203 insertions(+), 71 deletions(-)

-- 
2.55.0

