Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792787335;
	b=ldmBUb37k/h7lggwH+T/IfmfdJYWFiJLznBf2hYLq4N75tWbRQ0I9jWyFY0Tvoa2G64/
	 vQfLT/FLCw2eQoHcG1P7gxNf03J1+g732uJhIk611hy4eZqJN/wnNmiJGzzJMvl3pECFT
	 iy/JIVOPkoreI4urTL7L1svCKMqfwvf0S6rihmGQoPSKe2KcUKGvbZdTMSWSlm1d0NUSt
	 ZJN9vr3FNFfdZOK/+uBGs4ZSPE2pqGsgVAneM4b/VeIpYMoY09UcPQjryDlp+R0Tw3UKt
	 mWWXBppYxjXvOdNCSy0ev515QmgeFFP2ejnPzYjIbG0kdjTcnRVwv54nrBuCv5E3ZkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787335;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=skmoRJSPgiOsVrvlesAzH5pZ1bvo+boWqpa2AAcj0VU=;
	b=Y+5fGij6aXvenoZN/TGhEt9dMmIVgmx0A40Is2a0fsB61giS0MV8b+2Ww998iTMjT3Fu
	 /mY3NGYbV/L6Ar0hP08Q9aYqa+e4H4DcVWdBobSaUMdq8++hi/z8LziqUlDciRt1fy/yD
	 2rnvU++W9XHnmNdpKVZyKM3eeJorKZbE/k60aHJ9fTHufbhn2QnlbkE84VEbuKEChYj5o
	 pe6XfStG6/L0oPfhDtoEuTn7qOAhvIwDjV+JRgSrf8NaAIKIGnOqmUKLcxEy11TU9Y0L5
	 xMFrZks4PIR8NIoLt51VCdQMf+3dsMOpVQIhOHfXv00C6JZkEpyFyKu/Q8WKQ9o9j5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3oG5CLt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B55606A31F
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 20:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3oG5CLt
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792787333;
	b=Z/q9hrVsRbt24DdURU9nc5hbuq6+LXapCOIFusvOX1g4jO7gJ0Oi0cfB9FQ4R1mVbcCr
	 320Mqy6/nBRZdTrGodFbr3Cl78fpsxJAG/MFofe9x6uR9WxDW9wapnlSONmUext0UCyU2
	 tstgjn3rNH0n3w7WCuv497dotO+8IeYrQe8ZpHyPMiymZOl9/hyLnhveiFxMrMhRwpfhm
	 DssVjt+oUjgrpqnzJtcLEPPVmTFVkdD9sZPk3pZPdmPx0aFh5xnupYUGFC2ftymYPwkIu
	 8DLD8yFjiLaq+/5xak45K+8D+6NyjDyFzex/ReD37e0hVk1uA76ZFKwU1ev8tIabDhw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787333;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=skmoRJSPgiOsVrvlesAzH5pZ1bvo+boWqpa2AAcj0VU=;
	b=wSIIrCQHx+X2ldFLtrTcbx1g2HNKpBok+FehfkPode56g6RDU5PcwBEbn2FJemDv8pH3
	 Jlf/zlsxuA0kF5DWGEhX8gtyCIkifWBL9ce4Vwz7Ipq5GN7VbslU/RBIg87L2j+FqmLJP
	 LqXgGIg0Faivi59b1/M49JEt/dP8aL3lpgjHGMHegXIPHravnpg/W+XuQetLNvKJr+zdU
	 PlD5KIpS+pNgdnTYX3KSgtANN4zvyJDWy5byLdArjb+NYknhoBoUPMcD9ysEvA9alBk4b
	 6xxdHFl8HIGYSAXsEv2XB/9EALs5VQTLkf729B8dLJlrO/edaalHgsNWAMcQTa4Ev4Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 225181F01825;
	Fri, 23 Oct 2026 20:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792787333;
	bh=skmoRJSPgiOsVrvlesAzH5pZ1bvo+boWqpa2AAcj0VU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=H3oG5CLtDVemGGdF+8H1ijFiXF94scmL8f+5igC6lgauAv2dtkl+ervuKquS3wwB+
	 53C2Z5p05x+xBLLFkvXXL6sW7/vUMAplwRPwszmr7hYlKQCR2kNajgn3QLdpdvK8I5
	 wK4viVtkZn9G9+sFn22ebZ71raAu++gypNoi4UH/Yql8yQWDggK/RYUBzgK7Se6YI5
	 +K1hu2WUdYdsACWN1Kr00QTWfRxPk6LpM+KcJmxL5IlwsaIjzRJ8tcj2geFlkt97pE
	 Jws5Vfao9EJ50omuiWmWsSyChZ0bQ4DTaazU+wfYDApBcXxyNaowwSZQetlIFE24o7
	 OIL4LFTmbmcNA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 964A9445FB;
	Fri, 23 Oct 2026 20:28:52 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Subject: [PATCH v6 0/8] fuse: {io-uring} Allow to reduce the number of
 queues and request distribution
Date: Fri, 23 Oct 2026 22:28:42 +0200
Message-Id: <20261023-reduced-nr-ring-queues_3-v6-0-658235c9b9bd@bsbernd.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Nyw6CMBCF4VcxXVvTi7TFle9hjBnbAbqwaCtEQ
 3h3CwsvG+LyP8l8M5CE0WMiu9VAIvY++TbkUOsVsQ2EGql3uYlgomBaCBrRdRYdDZFGH2p667D
 DdJJUgT3r0oErtSH5/Bqx8o+ZPhxzNz7d2/icP/V8Wv9Ae04ZBTAoNWCpUe2dCxvbXshE9uLNc
 MbkAiMyo7eiqjiYyhbml5FfDF9iZGaUM9oaAMkBP8w4ji/okbxkTAEAAA==
X-Change-ID: 20250722-reduced-nr-ring-queues_3-6acb79dad978
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2558; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=KUk6hPwjwJba4divXeCUDPAxEnplWEnau4Zm9bn6kd0=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJuH25QOBT/7+Wi0IbPm/1LL80+ZjujXnzzqx9rpKwMp
 YS2358T01HKwiDGwSArpsjSJbHHdso/Plm1r+uvw8xhZQIZwsDFKQATeerKyLB62kHvHqO2ax57
 bp4w40lO7he4ffq/y0/x8DnFQTyKcxwZ/qdtk6xyWqvN5zI3Z2XVXP+FderNZTWXL6lUl6VUeD0
 7yg8A
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

Allow a server to negotiate fewer io-uring queues than CPUs through
FUSE_URING_REDUCED_Q in its INIT reply. Reduced mode requires ADD_QUEUE
and starts serving at the first entry. Legacy mode waits for every queue.
RCU-published CPU maps retain NUMA affinity, background queue selection
and limited retries of busy queues.

Libfuse PR: https://github.com/libfuse/libfuse/pull/1659

Assisted-by: <various-ai-models>
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
Changes in v6:
- Rebase onto ADD_QUEUE and bufpool support.
- Require FUSE_URING_REDUCED_Q in the INIT reply for reduced mode (Joanne).
- Publish CPU-to-queue maps through RCU (Joanne).

Changes in v5
- Rebased to miklos-for-next (Linux 7.2 base).
- Folded "Fetch a queued fuse request on command registration" into
  "Allow reduced number of ring queues", inlining fuse_uring_do_register()
  into fuse_uring_register().
  - Fixed retry logic in "Add retry attempts for numa local queues":
    replaced cpu++ with cpumask_next_wrap(qid, mask) so each retry
    advances to a genuinely different registered queue (Joanne)-
  - Simplified "Prefer the current core over mapping" (Joanne).
  - Folded READ_ONCE() annotation for ring->ready into "Allow reduced
    number of ring queues" to match WRITE_ONCE() on the writer side and
    suppress a KCSAN data-race warning.

To: Bernd Schubert <bernd@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev

---
Bernd Schubert (8):
      fuse: {io-uring} Add queue length counters
      fuse: {io-uring} Rename ring->nr_queues to max_nr_queues
      fuse: {io-uring} Add CPU to queue maps
      fuse: {io-uring} Select the queue through the CPU to queue maps
      fuse: {io-uring} Allow reduced queues through INIT negotiation
      fuse: {io-uring} Queue background requests on a different core
      fuse: Add retry attempts for numa local queues for load distribution
      fuse: {io-uring} Prefer the current core over mapping

 fs/fuse/dev.c             |   2 +-
 fs/fuse/dev.h             |   1 +
 fs/fuse/dev_uring.c       | 318 ++++++++++++++++++++++++++++++++++++++++------
 fs/fuse/dev_uring_i.h     |  31 ++++-
 fs/fuse/inode.c           |   8 +-
 include/uapi/linux/fuse.h |   4 +
 6 files changed, 320 insertions(+), 44 deletions(-)
---
base-commit: 1d8630946017ead740c4126395d4763371f0107c
change-id: 20250722-reduced-nr-ring-queues_3-6acb79dad978

Best regards,
--  
Bernd Schubert <bernd@bsbernd.com>


