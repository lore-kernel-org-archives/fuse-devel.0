Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485D93F20E3
	for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650858; cv=pass; b=DcbKgJ7g9BJrxY/vui7b4oD6SlcJtuxlM2z5c3NK/X9mG6PD2knZGTXrKZqDHLW5tLt+ghefJgM1uYtgo4lskZPKR2E+JcgBGftIMUkB4BSozQcSY9DlUo7r7nhVSzhsY12pL/+u8OVk7qsSZy1R+J9XdH/JzGQGTXegqq3CZLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650858; c=relaxed/simple;
	bh=mXiMtyLOOYxxVMQ8MUK/K08ApFUpRcECz0ksD1wsMDE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=s8RVFZlef7G+p6m06/FCCp59yfGyr6P8CzlSl932t9Ktxw6lfxJvoU6QrXWWnGECfdh5537mcbPhl0UfcJ8HGfzzWUApeIztG0Iuq4STOThRCvAa9puebjGKw7qEJVFf+6O2NsHOGd7u0U8eymWj2tP4X3tyJMClp/seLHvy0tM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=ivMlqSZF; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="ivMlqSZF"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c0ecfaee7so29509031cf.0
        for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 02:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787650852; cv=none;
        d=google.com; s=arc-20260327;
        b=LzyB/1x+nJVTQXKaNuD6R8W7PYVbf7rrl9u/uMk4ZkNJZTbmYOFNfb6I7eAk8gFh30
         iUu2pmX8mL1bY5uSos3NPGP1j7WSkVkRAXMznJktkmXTKu44S+xxTcIIyj9Igk4rGJms
         qEBuHKbpegXwOCdtjlNKebnbDbCNkrXq1APWQr2Ugn7QI2nTpcHXea+I39443i9q9Pb9
         Ihb+64N6qrqhWv6No6Rc7fz8gSctWBbxp/cP70k8OvjyPDW6pXDwrMCjIWRfUb8mufzb
         uDUqg/on2u1Fga6TFvtNGjbBN6mQFp0c2DO59cD0/9wjGAdJYTbh3eQs4Bu0IYV/3TyG
         Xgjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5+zCHFKCNOCONPbwIiY32D/ElA6N423eilIEaRYhv2E=;
        fh=Ac/tL6fFGINIG6ym31MYZamHCUDbisWDb6p4FG3SuJs=;
        b=YElVe67pDMpY7lPD2iDBmsF8loA0u6o7s+Nwjl/iKuyqQ8W8A8j4yxw5ft/TOkCXYe
         XPSdFSs92RE8nvmoGQTBAOTU+VeTVX6hiEqDWY6rm5erZ+6chsKcPXnzhvu9VvfVwYJG
         TO/5llO2p7w8hSDIusN8um12fgyzv6bezIQ1fAurK8bfTe3Ku8Wvr1t2ScC66+Ng09MD
         KIx6T9fMppvogjRdY50h5awinjRRLPWIhGip6pTh9oaqS690lZZmajGbPDqwjFWajIAO
         MA0NeFqdgi5xDa/qe0B7sPrHyfa1U+yrJ/8vgigJF5YrBCJQ8r0dFBwulm5RnX18ILfU
         hShw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787650852; x=1788255652; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5+zCHFKCNOCONPbwIiY32D/ElA6N423eilIEaRYhv2E=;
        b=ivMlqSZFmUYgn/lVwrfWcxCxavuJ0kV0rmF4RObrVf+tYAvsPKFjSVYWdOjJvaldP1
         GlBm+YxFKvon3A1/d5hSLeCM3PkYEJlEBRrG+J/LWhdnVAMjlvlwnFSyLD1wwlIXRnU1
         GvBQdChki1L8+zETLeEGBQheJHHk1fID9bwsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787650852; x=1788255652;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5+zCHFKCNOCONPbwIiY32D/ElA6N423eilIEaRYhv2E=;
        b=lDlQj+2PeIQ9F4fuK1Bkc3c3bdLR4evj3gywCD5Yl70cWt1g8LVe/SgdktOBkeZFsE
         2cZZENF6bt3ukW6XjtK7ScVlix3LOs6mRedmOIY0ZA7VdAnbFhoKCFBJwJz9uoRSixz8
         A/JGsO7lZXeLZixUB66o2m1uS1/YugUmxIscy3+EZViAoRbYx5oc4njAXCdR2/WzZtL4
         VCjV0zFvwia1jimC3HJGMO52aTDvURti8jWG9Tqv3ief5a4yNV/ulirG3vUqfqY5J6MT
         K264LcIKuQAvEvHVup0Ve3S+b4zEm73fi0aWlL20/jWcKwN5sRjPdpNQ3dY2P6vcNuV0
         E1gA==
X-Forwarded-Encrypted: i=1; AHgh+RoZNK9NWsxzJKda+clzY3taSna6L8Jpc43M2Kb+KZJNG2hf9cCegoufkmcfNPSuxyiNRGJYeBru+VOf@lists.linux.dev
X-Gm-Message-State: AFuF++klb4mRsH0+XClG8eUE2J67axysYUdsLq0jKByJTGSS1VOsAO5C
	RdRGv1hJB9fLubHlM6GbXCs8OSTOYsb6b0zFTtHmvf1qCg4DGpARhLiRHJzVLa9e5QxNn6hNHGm
	/Sn6nPMUghtD7KDHs52zz1CtD115hvMFDcOr9c9UZOw==
X-Gm-Gg: AR+sD10kySknd3+0kY//tDNR+eGrni0b2GEN+DX/LoaVYA7JiwwQ2b91aJh1IvXKOW/
	rU762Xj66gaqMMTXsCM1GKnz679UYQMBBuZU62XbEl+ULLhHX7/HPqMq0m/XfzGseOco9ILsrfO
	5FeFi3mcP656eDWak5No+JEB+a8jw6XU+CzFEcb/Bill3/lqT6DdyIg7IWDm6kqXLnxy8EzN9OC
	T1i+fqyR70kypSsYI3MpIRPi7N79RVP5ZaWuwYibJ2PVqe/54xHDq9dUe9M65U/grdSxP29JCdD
	kORGrMVqw/Uc6ISVTuHRtGrw7ytmM9CQwXQYUjtsHanwyPszZ2V39DJMsMDb9b2YH56jonQ+kzM
	B339ztF3ll4Ldug==
X-Received: by 2002:a05:622a:2b09:b0:51b:fc67:c73c with SMTP id
 d75a77b69052e-52e09bb401amr277343041cf.16.1787650852351; Tue, 25 Aug 2026
 02:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 25 Aug 2026 11:40:40 +0200
X-Gm-Features: AcwNN1X_1gdCMa4DF67VXGoGPqzeSAs-aOF2k1OnofG-LbfJv4e1RDFSRaIrsoo
Message-ID: <CAJfpegu_5Sfbbi36ss3_4k_3Va+RSbnHxRbCUxWoTRcraQ07cw@mail.gmail.com>
Subject: [GIT PULL] fuse update for 7.3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org, fuse-devel <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull from:

git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
tags/fuse-update-7.3

- Improve performance of the io-uring transport by introducing buffer
pools and zero-copy (Joanne)

- Fix lots of bugs (Baokun Li)

- Fix io-uring initialization issues (Joanne, Bernd)

- More prep work for large folios (Joanne)

- Don't limit buffered read to 128k (Jim Harris)

- Fix zeroing of page end (dirtied with mmap) on file size extension
(Jimmy Zuber)

- Improve performance in certain cases with wake_up_sync() when
queuing request (Xuewen Yan)

- Misc fixes and cleanups (Xuewen Yan)

Note: some commits touch io-uring source files, these have been in the
io-uring tree and have Jens' SoB.

Thanks,
Miklos

---
Baokun Li (7):
      fuse: fix invalidate lock leak on setattr writeback failure
      fuse: fix invalidate lock leak on open O_TRUNC DAX failure
      cuse: wait for pending RCU callbacks on module exit
      fuse: reject a duplicate fd= mount option
      fuse: check for NULL root inode in fuse_fill_super_submount
      fuse: wake one waiter per freed slot when raising max_background
      fuse: invalidate the correct range after O_APPEND direct write

Ben Dooks (1):
      fuse: make dentry_tree_work static

Bernd Schubert (1):
      fuse: Fix the condition to enable over-io-uring

Jim Harris (1):
      fuse: allow larger read requests by setting bdi->io_pages

Jimmy Zuber (2):
      selftests/fuse: test post-EOF page zeroing when a file is extended
      fuse: zero the partial EOF page when extending a file

Joanne Koong (16):
      fuse: don't clear folio uptodate on writethrough errors
      iomap: add helper to mark folio uptodate
      fuse: use iomap helper to mark folio uptodate
      fuse: fix missing barrier when checking io-uring readiness
      fuse: use release/acquire for fch->initialized
      fuse: publish io-uring queues with release semantics
      io_uring/rsrc: rename
io_buffer_register_bvec()/io_buffer_unregister_bvec()
      io_uring/rsrc: split io_buffer_register_request() logic
      io_uring/rsrc: add io_buffer_register_bvec()
      io_uring/rsrc: rename and export IO_IMU_DEST / IO_IMU_SOURCE
      fuse: decouple fuse_ring creation from ent registration
      fuse: add FUSE_IO_URING_CMD_ADD_QUEUE
      fuse: add io-uring buffer pools
      fuse: support registered buffer pools in io-uring
      fuse: add zero-copy over io-uring
      docs: fuse: document io-uring buffer pool and zero-copy uapi

Mark Brown (1):
      io_uring: Add missing include for ITER_SOURCE and ITER_DEST

Miklos Szeredi (2):
      fuse: move "epoch" from dentry.d_time to fuse_dentry.epoch
      fuse: fix race between interrupt and resend

Rochan Avlur (1):
      fuse: wait for FR_FINISHED on abort_on_kill to prevent use-after-free

Sang-Heon Jeon (1):
      fuse: use min_not_zero() in fuse_init_server_timeout()

Xiang Mei (1):
      fuse: copy request headers via a stack buffer for io-uring

Xuewen Yan (1):
      fuse: give wakeup hints to the scheduler for synchronous requests

---
 Documentation/block/ublk.rst                       |  14 +-
 Documentation/filesystems/fuse/fuse-io-uring.rst   |  36 +-
 Documentation/filesystems/fuse/index.rst           |   1 +
 .../filesystems/fuse/uapi/fuse-uapi-io-uring.rst   | 126 ++++
 drivers/block/ublk_drv.c                           |  22 +-
 fs/fuse/args.h                                     |   2 +
 fs/fuse/cuse.c                                     |   8 +-
 fs/fuse/dev.c                                      | 104 ++--
 fs/fuse/dev.h                                      |   2 +-
 fs/fuse/dev_uring.c                                | 633 ++++++++++++++++++---
 fs/fuse/dev_uring_i.h                              |  56 +-
 fs/fuse/dir.c                                      |  37 +-
 fs/fuse/file.c                                     |  40 +-
 fs/fuse/fuse_dev_i.h                               |   5 +
 fs/fuse/fuse_i.h                                   |   2 +
 fs/fuse/inode.c                                    |  16 +-
 fs/fuse/notify.c                                   |   4 +-
 fs/fuse/readdir.c                                  |   2 +-
 fs/fuse/req_timeout.c                              |  12 +-
 fs/iomap/buffered-io.c                             |   6 +
 include/linux/io_uring/cmd.h                       |  38 +-
 include/linux/io_uring_types.h                     |   6 +
 include/linux/iomap.h                              |   1 +
 include/uapi/linux/fuse.h                          |  63 +-
 io_uring/io_uring.c                                |   2 +-
 io_uring/rsrc.c                                    | 127 +++--
 io_uring/rsrc.h                                    |   5 -
 .../testing/selftests/filesystems/fuse/.gitignore  |   1 +
 tools/testing/selftests/filesystems/fuse/Makefile  |   3 +
 .../filesystems/fuse/write_extend_eof_test.c       | 368 ++++++++++++
 30 files changed, 1487 insertions(+), 255 deletions(-)
 create mode 100644 Documentation/filesystems/fuse/uapi/fuse-uapi-io-uring.rst
 create mode 100644
tools/testing/selftests/filesystems/fuse/write_extend_eof_test.c
