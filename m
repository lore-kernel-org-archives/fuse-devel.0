Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324751;
	b=v9u13KJhDK5Z/LRRIXuUhMIKDE/sfp0aF3cM95mo7DHc6x3fVuEL26ngeoaJj6lQnnq4
	 bU2j6Mh0MvaLmjLyHRpXxm2aVPM+QC3ZAcxWwQFB1nUiMYuvnZ4oVVxyHteRaB1b9TYsI
	 ypJ0/FHtTGgIipUUmvWtyBuZzrUhyjQFXrwiOhIfXSCOaLpn0Ty854R/dRXRSRmEwY5ti
	 q0DV4ny6o0NZpmxvJB4JCM1fw7hi3UYpG4+vEU7z9bnJp+ac876J2dSYx9AXs+fgo/r0Q
	 /K9gdkLcw9zQZ5Xjdw3eW9l9WMItRI8hwgKW0Ipb5oSyaWpt5qJAzPZ0J1jwG55KRyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8e/IpuSYW9d0QekEXFx6bT2Oe0C5XCSMgDyLhp7uw80=;
	b=SsMP6IcHHebaeOpcIs2gRpMS2ADJ/JUdUNBpDTGHG6o6c+Y+zX/gbV/ydTr2c9mWdzTu
	 fH+m1WmN1Iu3Y5dGn9k5VSMGoc9gTh/SFZ2lCFS3fCF/3V33/zzb8wRSpAerKlmrULx8W
	 FfboZZHOgLEZdPjNTEd/p/pzUg+4Jz6M0Vc+je9TOn3FR8Sg8I5Z+XzAnWBZE44/dERd9
	 1dz3WL6R3Ov2Kg7CH3CPBLjTo/82Hnd/EuReJGYqDPb/g5TJwZHpf7jzM7fU1iehT1wHA
	 gg+umta0RnGU40RjSry6uGXpjGoKefz10o4LvylQ3HfO4hVbYoZOdrvGuLSRRiKzMvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfT80ZaW;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF048606A31C
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 01:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF048606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfT80ZaW
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso444554eec.0
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 18:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793324750; x=1793929550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8e/IpuSYW9d0QekEXFx6bT2Oe0C5XCSMgDyLhp7uw80=;
        b=OfT80ZaW0bGoPai9Jc5ae5t+U25dy7BMV2y0mCIfjhLRZalEmA7y+qR3WZY8CK96Ju
         vGxrpI8Ignlnud5EdwS5GlUDrdcIkV0hlv2t1Nl+EGXIktZkw92nZvJvl13gKBbBLY4/
         8KZ603vsSKcAOjuITbpdTWEElOjFYWDO32Ngo5rekhK3dYoykpcsxlmHU0LuUGgUXAFd
         0RvXVwou6TPUFBtYy6IFJWfURMAJ0KvYk6mMumEsCsJInqZnehOHORiiT8jPVjNWVy0k
         uqYV1A7POCokyvKx+k3ifigOZEaX3z++b18gY1g/HG0/7wm6lXkKzFtnhT6hcw1kyFgn
         tScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324750; x=1793929550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8e/IpuSYW9d0QekEXFx6bT2Oe0C5XCSMgDyLhp7uw80=;
        b=sGKt0p8jD9H9+rJbOmdOoaQhPEqIU7YtUXSQ7kfYICelY3GZdJTXhgpNqrxQ25qgEZ
         iPg0l+xfFIWD9O2PtgaAzRpLNqAazrKH7/g9aJpUbMsVjQpke3OtP1FNDxSl6KheDwp5
         PeOLlxpFVsQ9wNW4HMkjYq4MAOCSsV8KFxnGGOXErT+wlpRwvLCULVNvLyCxg30fhvdm
         gCJlOhq3oFOmQNfsTet7QygHL+sWUr7jjJqmthaij8Xv1BSywHr3WndHNAdU8cyCdIjl
         m5Y5ZT7ulsvQxgigVd8L+cS9t6tH6PXRhi48iEeV0TOJT0Zb8jtGO0v3+oEipoLFPocQ
         n+mg==
X-Forwarded-Encrypted: i=1; AKwUvByIABGnccCXJ0A9j4dBJ3XIdsW3K5Wc/48arX5+RJajXzQffNp2ayCOn18PqAAPptNmWZppRunGlAKY@lists.linux.dev
X-Gm-Message-State: AFq9FYIG/6iY2TJgficSGxUuV+TSMk0y/onuZBZKj4S6yw/NXIg9QIsX
	icqhmWnbPcInGO22df4sk7fGJd+q6sINth3xNJpu+9vkCPyCCQdEfDs=
X-Gm-Gg: AYBFou11/AO7owtKv9netwJ+v9WqhbZFxAbXWPRQgZUdIhXlwwUJDWU5jQRIqumpWWr
	TYIN90HzVbLhs/JzDwHXmYVYbbpaXYCld06eGdHM/cj8LIZ4JNwk+PtRaD9zDFXFjryo/Q/TOCG
	KOLsO6kzv6tN3w3s/7UHCBRPgzRnj4sPfsH1Crc8TycpDMhdMn9D8LHrEexVbllYzNIgKnEA5og
	EaeqKNUyEklw8VyTMQJ7YrRDnvUCuyQoUNOiM2wSEjRlKiVqcTQpp47LUh2Zh6UOpP+mcnCkDYO
	5gmzQHItr5+DlE+/M97nDmoQmUOpxOp+i/3+mW0ScDQvCDwN2rIl4N3152S1t6K3cqa7g73kE1g
	kvDnQ5HzlVxIckMub1/rdLR2mdGOlPuQeoR+0X6vzvU/rXmYUBocEdDNLYUH9TLvaSWvIJxNGCj
	IBH8oz9rpNkjdLaSUs/xE3K6HACZcK6Y9YPSBFI21ByEmn7vHO1ozFFbktmccibtXFX1or3dkKf
	tiFARGZXRN5SXaiPYcFhnCiSNs0jgUamwQFlCTTOLFP1TcJT1d2Do3y90CNy99kC1+0lJe6ThE3
	WCFNDCtEf3zdxHpkPe4IEWFUta6TcNjWyqRbVXfSrx60QxDnUq+La80a0dZ2nyU80dKGtK8fR5P
	z3OvaQ5F57baXct4Q6pknm2x+yFFJw80MN7iA8w==
X-Received: by 2002:a05:693c:8806:10b0:369:f97f:72c1 with SMTP id 5a478bee46e88-36a4241bbd5mr1678012eec.36.1793324749832;
        Thu, 29 Oct 2026 18:45:49 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:75fd:f9a4:4062:7980:1324])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm2209020eec.12.2026.10.29.18.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:45:49 -0700 (PDT)
From: Anuj Gupta <anuj1072538@gmail.com>
To: axboe@kernel.dk,
	asml.silence@gmail.com,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	bernd@bsbernd.com,
	joannelkoong@gmail.com,
	miklos@szeredi.hu
Cc: io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	joshi.k@samsung.com,
	anuj20.g@samsung.com
Subject: [PATCH v3 0/5] dma-buf backed NVMe passthrough I/O
Date: Fri, 30 Oct 2026 07:15:35 +0530
Message-ID: <20261030014540.3065403-1-anuj1072538@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series adds support for dma-buf registered buffers in NVMe
uring_cmd passthrough.

Patches 1-2 add import flags to the fixed buffer import helpers, so
uring_cmd users have to opt in to dma-buf. Patch 3 adds the io_uring
side, patch 4 lets the block layer map dma-buf iterators for
passthrough, and patch 5 enables it for the NVMe namespace character
device.

Tested with this liburing test:
https://github.com/anuj7781/liburing/tree/rw-dmabuf-pt

Changes since v2:
- return -EOPNOTSUPP when the controller has no dma-buf support (Pavel)

v2: https://lore.kernel.org/linux-block/20261022144501.2478417-1-anuj1072538@gmail.com/

Changes since v1:
- split into io_uring, block and nvme patches (Christoph)
- pass import flags to io_import_reg_buf() and
  io_uring_cmd_import_fixed(), and make callers opt in to dma-buf
  (Christoph, Pavel)
- add io_uring_cmd_hw_done(), so nvme no longer handles the dma-buf
  map (Pavel)
- warn if task_work is queued with a dma-buf map attached (Pavel)
- make the -EREMOTEIO conversion explicit and comment it (Christoph)
- refuse dma-bufs larger than 4GiB on the character device

v1: https://lore.kernel.org/linux-nvme/20261016103453.1129150-1-anuj1072538@gmail.com/

Anuj Gupta (5):
  io_uring/rsrc: pass import flags to io_import_reg_buf()
  io_uring/uring_cmd: add import flags to io_uring_cmd_import_fixed()
  io_uring/uring_cmd: support dma-buf registered buffers
  block: map dma-buf iterators in blk_rq_map_user_iov()
  nvme: support dma-buf registered buffers for passthrough

 block/blk-map.c              | 15 ++++++++++++++-
 drivers/nvme/host/core.c     | 16 ++++++++++++++++
 drivers/nvme/host/ioctl.c    |  5 +++--
 drivers/scsi/scsi_bsg.c      |  2 +-
 fs/fuse/dev_uring.c          |  2 +-
 include/linux/io_uring/cmd.h | 14 ++++++++++++--
 io_uring/net.c               |  6 +++---
 io_uring/rsrc.c              |  6 +++---
 io_uring/rsrc.h              | 13 +++----------
 io_uring/rw.c                |  5 +++--
 io_uring/uring_cmd.c         | 31 +++++++++++++++++++++++++++++--
 11 files changed, 88 insertions(+), 27 deletions(-)


base-commit: 70866cfa169d5ee149364267289e71d50f9a7ae9
-- 
2.43.0

