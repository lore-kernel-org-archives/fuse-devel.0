Received: from mx.n90.eu (mx.n90.eu [65.21.251.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D211747D935
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.251.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155425; cv=none; b=LN4MENVmryylCWjJmMbhYi9S83/DOBaCSEeLWs9uAQmHxbX6/zIXoY6mxV0b4rsbYHfbClEgJLx2mX2mVl2w5jhPs3p9O0IGP89n08bfKz3+/zmVs5t7TKIieZSU2bL//mlPyYayvneOyr8weWyD7NeCEXPJNweNHv+hVcdzjRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155425; c=relaxed/simple;
	bh=4C3ITrCp9h/hHpOoVGYQw/7N+imzuqscbF6qP7o/VCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JTDSKFygLiDZqU94UP+XZBbSXP52Uid5cD6RMD08euSozfQLBhRL4mfBohzMGJwncrinpBDCIgtszhq7xvKoYhNDgSLO93f0pfRJvkJ8hreprJkmJOEvw6oM28Se/No/KyNXNa2uRlmTmmt/CaTR0yMC278fp8dT0tXKThbKaas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=n90.eu; spf=pass smtp.mailfrom=n90.eu; dkim=pass (2048-bit key) header.d=n90.eu header.i=@n90.eu header.b=ceOk5g8C; arc=none smtp.client-ip=65.21.251.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=n90.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=n90.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=n90.eu header.i=@n90.eu header.b="ceOk5g8C"
From: Aleksander Trofimowicz <trof@n90.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n90.eu; s=default;
	t=1792154914; bh=ruFGFlZsWPf3yxBeJJCfhLrciKPhNYCLVlvLeNh3Yvs=;
	h=From:To:Cc:Subject:Date;
	b=ceOk5g8C1VL8FoEe+UPiFwnptHKUX6R1cBuMvh9lduA/6/bF/um7fi1LrAlLVKm5i
	 HagOVeTfdsMHdDatfpZQYXtDreDS3QszjSS4MxJudkjuQllirj7zBD3uvC5rFqi1ZX
	 dPUTLAFBXMF4ygv4MTljMtiZsUN5uRsruw/kpIrucB7n/RCu/rTKlJBn54vs5vDFXu
	 HumcSMnjo2y6qi9exCeMxmKnRrrVtNC3tF0kN4IMy6WUJJuuCEH8Mb5FE81fZQ501b
	 fNmYvR3ZdcZ5CQc+zmb4fPUWs9/CCdsBvJTcV5njxxu/I7Z5SVY0itQbQNYGKJCUos
	 I/c3TmiD7bEjA==
To: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Aleksander Trofimowicz <trof@n90.eu>
Subject: [RFC PATCH 0/1] fuse: per-queue background request accounting for io-uring
Date: Fri, 16 Oct 2026 12:48:10 +0000
Message-ID: <20261016124820.316741-1-trof@n90.eu>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse: per-queue background request accounting for io-uring

This RFC proposes an opt-in path to replace the connection-wide
background request accounting in fuse io-uring with per-queue
budgeting.

AFAIR the concept has already floated on the list, but nothing has
come to fruition. Nonetheless the problem is obvious: the existing
implementation relies on a single connection-wide spinlock
(fch->bg_lock) that is taken twice while servicing background
requests. That severely hampers the scalability of fuse io-uring for
certain types of workload (e.g. direct async I/O). Suffice it to say,
with this patch applied I can easily cross the 1M 4k random read IOPS
barrier, while the baseline gives a mere 600k IOPS (caeteris paribus).

I envision this enhancement being negotiated with a daemon, but for
your convenience the feature can currently be activated
unconditionally via the uring_max_bg_per_queue_force parameter. Mind
that the value of uring_max_bg_per_queue must also be increased to
obtain any meaningful results.

I am looking forward to your feedback. Thanks in advance.

Aleksander Trofimowicz (1):
  fuse: per-queue background request accounting for io-uring

 fs/fuse/control.c         |   5 +-
 fs/fuse/dev.c             |  93 ++++++++++++++++---
 fs/fuse/dev.h             |  22 ++++-
 fs/fuse/dev_uring.c       | 187 ++++++++++++++++++++++++++++++++++----
 fs/fuse/dev_uring_i.h     |  32 +++++++
 fs/fuse/fuse_dev_i.h      |  18 ++++
 fs/fuse/inode.c           |  13 ++-
 include/uapi/linux/fuse.h |  11 ++-
 8 files changed, 347 insertions(+), 34 deletions(-)


base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
--
2.56.0

