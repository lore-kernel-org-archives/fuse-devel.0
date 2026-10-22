Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680344;
	b=ttY8ddMsBOvFd9QLxAKgddEwcvJ+bT+9U1Mj5r3ITOdpEmnCVxG6b5ZKY4GA/bGbsj8p
	 GynlktUaB5PgSd5ngSvpvKe+wPP0Ok1uR9tsYHet2jH90rNq9bljZk1jhIoY9AsbSOUHH
	 lVjxNX/aPIOlM8HbEd6fL5JhmtxZ9K5srxwOwlYzc+giMryN2zHQ5TipSsyGD02rgX9ri
	 6YVbKdSXv9TGMd0aNQDEK8dp8D/optTWfG0+xdBUbUEuOX0VFiuGmBVB590soBOLxDKfi
	 b2E+ZpC4MtSe/UI5JIjC/hzmJCmFXcWDk2rIFSBeJOhxgDvui3kqcUA4qRbm2K/NYMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YHBFmHAZzkTNwhPEuQe/n0EZjSl7NRJ9RBTHgn7pG6g=;
	b=kcx14FHBenWLwRPLpkfRviVP2dnN4gQcJjaPsCUXUQi52VJyQP82PUUWRxLDbWfjSQQn
	 z2rONuUKFocpvE0m/eCPLn3wpgyv6WmBbH+UuNN0XgkFBx9sgwRpTcdL3Tj2Xz8tqqAnB
	 mdZOqi+O//JZOV1pvEbvnrmrVtSRuVfxfnivPzLEEQQDMC7xxeBJZNEV0Xi9FJvFaptnt
	 +1dNENL7n+3lG7Fkw4xvMR9uOz/CIVqF9eqxBT2ylUJVOuOZWwBQSQ9lWs70TDj0LLr9K
	 7XARKDYWcNQKjbO7RdHCGhyD0tqpx/GP/lAea/WadEOK07WVoqBltghCUhSv4tVC5ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LC9SCOu0;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC83606A31F
	for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 14:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC83606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LC9SCOu0
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-157fe9d771bso2498674c88.0
        for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680342; x=1793285142; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YHBFmHAZzkTNwhPEuQe/n0EZjSl7NRJ9RBTHgn7pG6g=;
        b=LC9SCOu0UZ8G89Svg3UP1nl/OJBsUVxCLwVRYjyJELaEgnzu9+uweIbA/hss0Via4n
         a3Qca+VfSRWcG+KxBTANQtEGBUsRILtBJvV83eyeUfjJtq2bvdQ6lcIegPQr3GQlkZb+
         Vy5GoKxKU79wDIiRxUHitckH+vAupGlPrcEwVTYBZiFlMURkkM428AAHLB0cRMyz5E5x
         EXLKWJEdwvPgy/Dhor8VGbQqiC9GqpokVJk7d+ba0o/pe078eHZyuxkCbw9ytPp7AFE4
         VZnBwfTC4rjTsNV4eK0eiPT7TZp7r6XMuptdgZt3ivaX+kmr24mR51wS4LUb53kP4eM4
         tPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680342; x=1793285142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHBFmHAZzkTNwhPEuQe/n0EZjSl7NRJ9RBTHgn7pG6g=;
        b=HiY7mJk9az/0H1v10E5qv8+D3QN8ROUWi/dp+7OAFICj1U1ff2hEkXP6L594a6W2V0
         SbOXzgP3gH5RBSV4bd5yXZvOOGuGy7GAsu12gXt+P8o50lm28cIMksdgLdAqFezsEpIf
         M5fWWbdTpWSrcGAYQDzyyoLiA5DhGBvahs412PsDo+drevKHLENsioZpacRvb4AfZT6r
         gDjupgCDXeMjSsqk8ubW9lRBsq3Y1wQJtTs6TDut4yzAwobepoOR/is0IPhk+WRKuQpd
         mBYy2tzPRBF+ycr0kqwWO+DaUEP4/7IQTrB/rdMyND17nVWC7cSRbG8TzqQDcOkpNW2s
         wJ7A==
X-Forwarded-Encrypted: i=1; AKwUvBwj0w8AZJFWTtEihXWRw7VBZbPJzVUr42kEVeQanW9Ks49QvII1ysRmB38H4EMRb46+bccvmt8UPbzg@lists.linux.dev
X-Gm-Message-State: AFq9FYL+K473Q/RpqmFuBmMc4Wpn9Dufi6pBhU4sZEz6WS+IGfRX3irv
	yLxVkeThup6YLg3saIGeKs3YR3g6eNdpe34ASupZbeAXjJR+WV6BseULIPmzOoU=
X-Gm-Gg: AYBFou0IGLm2/vFKWK4iKTqYF4wB7XL5uvhgSfX3lNCCfgy5NifRvy+RKfjRoO4yNX2
	R1E/fFcoDhfDtKuPLlGhACImxY5kFRpNiBi73wZjn8SN/6cVFtOIFuLt+YxHUnuxgWnZE4Uu4jN
	Av07fvPlo36frkcRBHi56KoSJKLk0Eyc6TKuMqFV1Beyf+rkot1PWMYEpWbJOXz3puBU847l5gv
	A9tAtWnBZkWUmNHocKtFGo7INx8l4GZ7TKHBFArwzyXywwET82WT5qDMzhtBQkNKo1/ZXt0+mn8
	CLskT8H31FoSKUb9M4yZ4MLk1ri8TTLBLTIA/yjICegxgEA4hm5kMxDx0yvLRh8ShDlykBHiWaB
	8KqaWvz0MsiLF2HVVMGaoUk1oJnAllEGyn47rSlZOqD0V0H+CwtjBnI7DUfZaueD4aPEwOYc9PH
	w/dR2m3M2vVteWTfo0LzOr4wEZDriPonQC3uJ3TaZpbbIOBK1qKi97NhbvQ+ArEmEBsE7LbC5gF
	+BSkK0oBs0g/k/SoNLjsnVyQXIhf+a40N+wV4Va3dy7qs08LcB9AU9VKeq/vuuz5Fw7oPShUO02
	Gq/JkKidwPCxDkdW7vW7U55j/kuOKF+RdKFqC+WJF74=
X-Received: by 2002:a05:7022:286:20b0:191:17d6:ccdf with SMTP id a92af1059eb24-19117d6ccf9mr5773178c88.8.1792680342117;
        Thu, 22 Oct 2026 07:45:42 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:e55a:5016:92c7:7a35:f3ff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm23625880c88.5.2026.10.22.07.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:45:41 -0700 (PDT)
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
Subject: [PATCH v2 0/5] dma-buf backed NVMe passthrough I/O
Date: Thu, 22 Oct 2026 20:14:51 +0530
Message-ID: <20261022144501.2478417-1-anuj1072538@gmail.com>
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

It depends on this fix:
https://lore.kernel.org/io-uring/20261022132027.2293931-1-anuj1072538@gmail.com/

Patches 1-2 add import flags to the fixed buffer import helpers, so
uring_cmd users have to opt in to dma-buf. Patch 3 adds the io_uring
side, patch 4 lets the block layer map dma-buf iterators for
passthrough, and patch 5 enables it for the NVMe namespace character
device.

Tested with this liburing test:
https://github.com/anuj7781/liburing/tree/rw-dmabuf-pt

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


base-commit: fd13f31ac62abac4df2166bb0a6fbff53b288e0c
prerequisite-patch-id: 6ad52e1ffc603df71c6855926838f2df402c3ed1
-- 
2.43.0
