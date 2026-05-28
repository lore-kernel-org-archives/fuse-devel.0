Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C6E36BCC4
	for <fuse-devel@lists.linux.dev>; Thu, 28 May 2026 22:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780008907; cv=none; b=uUbyxLIrdiCeM/4hmxqIrE8lZWqr0bYlDMhKvRWS8AcxSfdN2macIxZ7ecH1/QeBzK5Px78bwq3pL62iYxsSWk/hR3MjaZp/Ob35nGqbqYIxicLpvdt4ZNJddPdyPdh0iTtQLn1jLKA7cmjXr1/5Z1ROFZAnqmvZAxpNl2sNdDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780008907; c=relaxed/simple;
	bh=QZwi2+4P0m+eJRFUsdOIG+lBm5lAYwWOJStlyDgC8U8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fdZbe4PjLyC0ihL7ru8ekfCA6JFV5uzxpq9XFQPKtYQJsYe62RLrNv4UG5oMCwbdwSw9psuZzuX7mXSLjBibTDUY7qCHtPQE99chGPie9bEDewVjrVBgQZ4g+eEVeyzZ8I9gRHAQ79wvzCl/evsi3f1X9oHUcTuz2wzIbpLgUE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdEhueI0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdEhueI0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 275E7C2BCC6;
	Thu, 28 May 2026 22:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780008907;
	bh=QZwi2+4P0m+eJRFUsdOIG+lBm5lAYwWOJStlyDgC8U8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SdEhueI0R8KXfkWUmWUfaNafd23GfRDDv4qH23ErZcvkSXcU4z8hs82XlcytU+0EL
	 kn+7xjnyHtx2627vtqoEc1XPzE93y3KJM8fF4HmXDbWbKo7VQn9BFcurVdaoqEqli2
	 P49QpiHnfohc5DJQns6F178U/0ULFa7tWwgiRQoQPyV5ZWUBz5PzfSOemTEc4sL86s
	 o1m+GCJqvw1mJAaq61M1i9rnwxUN+IqKY4kimVkOSIzD30xKUq4fH/qUeYRwsX+5ZQ
	 oZImxOEPDWN3/Iy7ZQhXmP2bM9VWnl5J683cekHoxClSNy2G2NLmKpaUTooIvpkdV8
	 sjCFB2+gjKaYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF29CD6E49;
	Thu, 28 May 2026 22:55:07 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Subject: [PATCH v5 0/7] fuse: {io-uring} Allow to reduce the number of
 queues and request distribution
Date: Fri, 29 May 2026 00:55:04 +0200
Message-Id: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMjHGGoC/43Nyw6CMBCF4VcxXVvTi9DiyvcwxoztFLqwaCtEQ
 3h3CwsvG+LyP8l8M5CE0WMiu9VAIvY++TbkKNYrYhoINVJvcxPBRMGUEDSi7QxaGiKNPtT01mG
 H6SRpCeasKgu2Uprk82tE5x8zfTjmbny6t/E5f+r5tP6B9pwyCqBRKsBKYbm3NmxMeyET2Ys3w
 xmTC4zIjNoK5zhoZwr9y8gvhi8xMjOl1cpoAMkBP8w4ji/RJSX/TAEAAA==
X-Change-ID: 20250722-reduced-nr-ring-queues_3-6acb79dad978
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>, 
 Gang He <dchg2000@gmail.com>, fuse-devel@lists.linux.dev, 
 Bernd Schubert <bschubert@ddn.com>, Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780008905; l=2550;
 i=bernd@bsbernd.com; s=20240529; h=from:subject:message-id;
 bh=QZwi2+4P0m+eJRFUsdOIG+lBm5lAYwWOJStlyDgC8U8=;
 b=pwzoR5JUxGJQNSaHJVMgT7CCBsDiCqw7zWpGcsCc6ke4g+vZ25Q5TdsvcVLQrfSx7Op+3y2r5
 0ATJoR6FPXNBezf8ArQCk3mheHnbVYnGBCsOaULcyqUn7cnsEV1ZftV
X-Developer-Key: i=bernd@bsbernd.com; a=ed25519;
 pk=EZVU4bq64+flgoWFCVQoj0URAs3Urjno+1fIq9ZJx8Y=
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/20240529 with
 auth_id=732
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

This adds bitmaps that track which queues are registered and which queues
do not have queued requests.
These bitmaps are then used to map from request core to queue
and also allow load distribution. NUMA affinity is handled and
fuse client/server protocol does not need changes, all is handled
in fuse client internally.

Signed-off-by: Bernd Schubert <bschubert@ddn.com>
---
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

Changes in v4:
- Fix leak of ring->numa_q_map
- Fix q-imbalance due to an issue in static cpu->qid mapping
- Performance tunings, like preferring the current cpu
- Removal of distribution among queues, Joanne had concerns about it.
  As it is an optimization, it can be added later again. At least
  most of it was removed, some light distribution is still left in.
- At the end of the series, add fuse debugfs entries. This could
  be factored out.
- Link to v3: https://lore.kernel.org/r/20251013-reduced-nr-ring-queues_3-v3-0-6d87c8aa31ae@ddn.com

---
Bernd Schubert (7):
      fuse: {io-uring} Add queue length counters
      fuse: {io-uring} Rename ring->nr_queues to max_nr_queues
      fuse: {io-uring} Use bitmaps to track registered queues
      fuse: {io-uring} Allow reduced number of ring queues
      fuse: {io-uring} Queue background requests on a different core
      fuse: {io-uring} Add retry attempts for numa local queues for load distribution
      fuse: {io-uring} Prefer the current core over mapping

 fs/fuse/dev_uring.c       | 313 ++++++++++++++++++++++++++++++++++------------
 fs/fuse/dev_uring_i.h     |  25 +++-
 fs/fuse/inode.c           |   2 +-
 include/uapi/linux/fuse.h |  10 +-
 4 files changed, 269 insertions(+), 81 deletions(-)
---
base-commit: 2dcf16d41cc04472a4f9bc6e99d0ab26cfb1afb1
change-id: 20250722-reduced-nr-ring-queues_3-6acb79dad978

Best regards,
-- 
Bernd Schubert <bernd@bsbernd.com>


