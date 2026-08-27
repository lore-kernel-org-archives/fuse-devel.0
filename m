Received: from mail-vk1-f227.google.com (mail-vk1-f227.google.com [209.85.221.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1684968F6
	for <fuse-devel@lists.linux.dev>; Thu, 27 Aug 2026 18:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787857061; cv=none; b=SH6kzGwsHQY4/C7nirICklfxTigthT4tD6Q8MVG+i4dLz/59AqKfhvtsToDWpn5zNEvhNHnoZ+ugr4F18UFxsrfYZxuNsnM3du9t3wu3k4306D3l4ObqE8+gERUF4Nn+61Uhy3ioGzdvrkcNIBBjgID58S0W79BxjJG2xcSBCU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787857061; c=relaxed/simple;
	bh=LC382L91Fjmkvg3DzrJyfTe6xYWA++BUDclrQpsPZnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tqC41Z1SgVMGgA3bIIF+fy/4sKkQvisGaUeliki5Gs3wdTAsqSzB6+xSLp0x1tZrsJAFPecibtEZ01lsf2hfbO8+UhJchc/XnNn1Qk56T3AKmswiaf0clnJAV2XU3EGX5V/4nJgx5kjGpUAWW/UeZ2vHMfqrOcGvtlJ3KBh4rBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Qi5foL9v; arc=none smtp.client-ip=209.85.221.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Qi5foL9v"
Received: by mail-vk1-f227.google.com with SMTP id 71dfb90a1353d-5bfb1151c8aso7647e0c.2
        for <fuse-devel@lists.linux.dev>; Thu, 27 Aug 2026 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1787857051; x=1788461851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i10FjmX67zefyeXKozkB0Kmfyho0gXqWl4rPPjjJZ9s=;
        b=Qi5foL9vJxH2+xhoUSK8uwgx2i/RumP2ULiEE8H76AzvVtJggfiFE9zCU+gfBbJRL7
         CwuNsYBWLH00VKgE7hVe3JWU0JlpJP/8FYnVrsDHdHxVKUNSGBdbbt9ysxXjqdEz9d66
         1n2bL/9CTf5cX9UzZNr62a8RL1v3Pu3jqGfAn/puMu4FPlG5cVZNBS0mcYRbVmoZnuXO
         oaS8V8YcWX0T4K1HF3ViyxFaOfrNwQDHRgcTy+PV1PpOdhD4D9igJo6XC2nwbpYMoCsb
         PUqL1YuGZZinO73Z+VXECZpzLK1OrnphEWYSp3L1NkcLryk7LMb6MaTAqxCxu6rLAYMc
         F9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787857051; x=1788461851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i10FjmX67zefyeXKozkB0Kmfyho0gXqWl4rPPjjJZ9s=;
        b=j/EZqGhHwsix4EV3Xvb2IDZVhhiXtllBT+SBehPHyBlTQz9QDrEwkt3ZPwyFDPiLn3
         d2dKYAi8aiRPd6d8eMjuMppWqJr3ZGfBv8Ondu8aLPeVXjwDrOvXyiO6AyO8661Jx7Lt
         jQaPj5ZWP541KnH9Gd0WcA78zr9Ki3BwTay9N+nU3yiutmpBxr9kzHJIOj/ZQD2adsxF
         XRl+nxRIZq19gnMM247WJpDPWx6j+dM2S0AX1tCHCvdg35SEfTnSI/HSU32HxGlB1a8d
         LMXUdhmydSFSy187JXkcLG19JmFOPx8BVfbc3thiHs9+cBSssCjHhWQRqVrAdmdwDFcm
         B82Q==
X-Forwarded-Encrypted: i=1; AHgh+RqiJ3BCs55ARCJGq4lY5wclX12Y8ucXsiTrRphsTwlI8QnyUewtXNFYC3YNYq0+X9SRB5zdY0VcQ1zv@lists.linux.dev
X-Gm-Message-State: AFuF++mQJmL05A3m4aNXx8nE8EW8Lc4lh9v/JMDLYmbQcEMDPkyJs/eo
	7A65dnKUYrZe5nCogduay60xZmkeA+mXciMNt0Ra9YuugNXoVloPHbzgbITwGav1WX7YqRCnx9d
	y/Akg00tbiiuwY1XnlygAEEVpNuPWPd74syLKO+1vvEDm4a3n8NJr
X-Gm-Gg: AR+sD12oeVRixU7GOcEDEVfdplXSxzW7pEQ32ARVgpaPPOyhQlLbonO5BocdLvPgItg
	RrmrTV0yv3qsT5mcQ88hoo4ozCGDB1l5J8b84AEyohrTG3A4ETtHDN+N5bWWrvlNGinAy+MqzAL
	pnNZj7bMsatdEWfv+IUEbdW/zP2VRJ6l12iXQT96nYb3X5m4q15FOS8r5BnnwPXCDKykUfhiKn5
	qFowBRxBAtCEtKsZWgWjeYfyK1srAXvaN5mC5whqqbEAdT8H1dwFXFn9831K7MDrS/rjOVgT02v
	CFIM/qN4ucL02y8h8USq4+fZOCPHMVIP5NtnYwaBsSaPAd3cQmr6/D5OW7lEemryaEnOW8dOXzb
	Toebtyx/OEKnR+LX6
X-Received: by 2002:a05:6123:593:20b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c680feb0f7mr218849e0c.1.1787857051036;
        Thu, 27 Aug 2026 11:57:31 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c6600147edsm1730496e0c.8.2026.08.27.11.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:57:31 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.12.104])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 64D774013B;
	Thu, 27 Aug 2026 12:57:30 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 5A653E404C2; Thu, 27 Aug 2026 12:57:30 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Ming Lei <tom.leiming@gmail.com>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 0/2] io_uring passthru: set result on blk-mq request completion
Date: Thu, 27 Aug 2026 12:57:19 -0600
Message-ID: <20260827185722.3234622-1-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_uring NVMe passthru currently receives the NVMe status and result in
the blk-mq request completion callback nvme_uring_cmd_end_io() but
doesn't post the io_uring CQE until the io_uring task work callback
nvme_uring_task_cb(). The status and result must be plumbed through
struct nvme_uring_cmd_pdu, taking up 16 bytes of the 32 available.

Store the status and result on the io_uring request in
nvme_uring_cmd_end_io() instead of nvme_uring_task_cb() so it doesn't
need to be passed through struct nvme_uring_cmd_pdu.

Caleb Sander Mateos (2):
  io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
  nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()

 block/ioctl.c                | 10 ++++++----
 drivers/block/ublk_drv.c     | 26 ++++++++++++++++++--------
 drivers/nvme/host/ioctl.c    | 19 +++++++++----------
 drivers/scsi/scsi_bsg.c      |  4 ++--
 fs/btrfs/ioctl.c             |  3 ++-
 fs/fuse/dev_uring.c          | 15 ++++++++++-----
 include/linux/io_uring/cmd.h | 29 +++++++++++++----------------
 io_uring/uring_cmd.c         | 34 ++++++++++++++++++++++------------
 8 files changed, 82 insertions(+), 58 deletions(-)

-- 
2.55.0

