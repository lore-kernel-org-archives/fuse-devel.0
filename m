Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC1C36D9E7
	for <fuse-devel@lists.linux.dev>; Thu, 28 May 2026 22:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780008907; cv=none; b=Z+8vqrcn0qXLIbJ2viqJwJj2EwMOSBO/+U+wSHIEA7l+9A7RpPB2KMmwv8GnMMsdzHdAoruywa+mMGBP+EcrqPdi1lVKV6dHn7MQR8YErmoQ/23pW0JciEG2ZqNNz7sfXYZoaT4eU5didQVcF3AbSFpygqLk2OIg/s/7U/uP9so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780008907; c=relaxed/simple;
	bh=1WaWR5FiVXyC4wLvxdmOtIQp7EFXHqzGWvKo45mv9NU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ct+di9uukDLfFSlRybbNG9Aa2qlQKeUrLa/8Ux1PRvY/XQGmgA+Af2Ku4lP+sPYelpacH/yL9f6XQU84gYJKgH7uc2ze38z4/NeYMIS+IMIWbVhQHUROpPspWaJMNL2a3HQi3l5vBHEFksE+LT2ndmT8n5VulrItF/dXSb3fIHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJQeohQw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJQeohQw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B1C9C2BCF6;
	Thu, 28 May 2026 22:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780008907;
	bh=1WaWR5FiVXyC4wLvxdmOtIQp7EFXHqzGWvKo45mv9NU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nJQeohQwrx3XxFQQ7BHa9Kj0wDNbBCuQfaWim8kt8/nU7t05sYkIP2mV5kEz/olQG
	 UAIODx1erlOfLkeHawdpmZQU70SB/0e+t4mjqGzwWO7Nerb/k5fzoTAa9d4U4oPAG1
	 iFX71fLjyu9V6ar0Q1IQzElRS8wi/dcawZ19osVDGJUApRMV9kyPG5ZwSBhvrz8cqT
	 4k1BsYV7GWpQD//NYIWlI0/I1ot7VaKwJvaWZ55BewasqyIDVQahkC5hQCGbLiQTLw
	 2vtUbQLfx9e+VrZ9uj1va4gOBGxckxbPOYiQdfN03/DtZ6P3pdGeLDeeeni51CM352
	 ub2g+quEz+NhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8359FCD4F54;
	Thu, 28 May 2026 22:55:07 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 29 May 2026 00:55:11 +0200
Subject: [PATCH v5 7/7] fuse: {io-uring} Prefer the current core over
 mapping
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-reduced-nr-ring-queues_3-v5-7-1dc08c2fccf6@bsbernd.com>
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
In-Reply-To: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>, 
 Gang He <dchg2000@gmail.com>, fuse-devel@lists.linux.dev, 
 Bernd Schubert <bschubert@ddn.com>, Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780008905; l=1481;
 i=bernd@bsbernd.com; s=20240529; h=from:subject:message-id;
 bh=DDk8GODTMyIIUdkclqSrJjrdLiMt8anI7InbsdR24Rg=;
 b=Ns4gsGgN5qDWQSLd7p2REXqa0sUSJgl60HCmPrCpik6ku1J97j8tupL3mrLQogu6PE0Ih9t4g
 iaH+3URpDBtA7y7X0Dr/9NzpQsLy0R1JZ6vvLE853+Z4EjMcSJ8KWY3
X-Developer-Key: i=bernd@bsbernd.com; a=ed25519;
 pk=EZVU4bq64+flgoWFCVQoj0URAs3Urjno+1fIq9ZJx8Y=
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/20240529 with
 auth_id=732
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bschubert@ddn.com>

Update the mapping to prefer queues that belong to the
current cpu. If no queue is registered for the current cpu,
fall back is to the existing round robin logic.

Example (with core binding)

unpatched WRITE: bw=841MiB/s
patched   WRITE: bw=1363MiB/s

With
fio --name=test --ioengine=psync --direct=1 \
    --rw=write --bs=1M --iodepth=1 --numjobs=1 \
    --filename_format=/redfs/testfile.\$jobnum --size=100G \
    --thread --create_on_open=1 --runtime=30s --cpus_allowed=1

In order to get the good number `--cpus_allowed=1` is needed.
This could be improved by a future change that avoids
cpu migration in fuse_request_end() on wake_up() call.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 fs/fuse/dev_uring.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index b68b2153dd11fd06962c06aa227a5144f4210aa0..7465b513c17eb9901d2dcf12237f2be8684ad6a2 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -347,6 +347,12 @@ static void fuse_uring_cpu_qid_mapping(struct fuse_ring *ring, int qid,
 		if (node != -1 && cpu_to_node(cpu) != node)
 			continue;
 
+		/* Prefer the queue belonging to the current cpu */
+		if (cpumask_test_cpu(cpu, q_map->registered_q_mask)) {
+			q_map->cpu_to_qid[cpu] = cpu;
+			continue;
+		}
+
 		qid_idx = mapping_count % nr_queues;
 		q_map->cpu_to_qid[cpu] = cpumask_nth(qid_idx,
 						     q_map->registered_q_mask);

-- 
2.43.0


