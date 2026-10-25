Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792967365;
	b=tsauaITeDEJjAooFgOauX1nzer39yJQ5zG7Oj9Q9z/eg5D6cF5XqffQDaDqSQ5U/o+UX
	 2FjHluND3yvTi0/JSlvTUfcykQTTdwTvKFBWbf8MXmLYcHQevVYb68YUByoXTBlRMGzGa
	 np+QLXBKI8YEd1mLtt03715jqQ26Qbh/5IjxY30muwNc4D0Z82QpIV1Z6Z7pVm/AhmT9V
	 FvHarDktEphd+7lhrVPOiS8Gv/i2YQ7Va7s43mppmZk7PQ9hYJVsO1j/3xJouxTQRqjEg
	 IJUFz24WO0WlTqHeM3NN/MZR92wunJzezdBmq7XmgnfLCsAnC79NCjZ+FRu24V2RD9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792967365;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Co6kM+95P1pL5AC/suB4Q7d5SKqKmhYIPMXEo5v/bwU=;
	b=TLoz4t0rExgbqlnJ5kVWmOYxIqgDYq0ICt4AvXH9akXF9QO46kQaBexqya0v/NAulEF0
	 O0qQAzf9RUV/tz7ClAF2Ui2sCCQnZr5NAukal9If2F6MNTIPW633v/U3TqKoW6xj0h/hL
	 XzKKsLQI9pNl6vW6qyBkQDBOh54gF8rN7sD34aGkecKCkrl17kg0TPjgQoqniSyJD03Bw
	 johogLoR3DotFCBK3lnnQ5FxHcAntT90S4/9a6Z8eCsHIdW6VS03VbQGIZRUGzYzmI/CQ
	 F374jQdklOXGg7SD9RUhyJBJD0BjJL2xQkvOV4MBck5q86GJGPthw/ypJbfFTesIlyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tb5w16vO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E2F606A31D
	for <fuse-devel@lists.linux.dev>; Sun, 25 Oct 2026 22:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tb5w16vO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792967365;
	b=fWHWn+ysSHeoyXR+pZ5k4m62gPLOy+esqdCln4NMTHrTSSaUBet56/yEHA1DIhFXO9Is
	 pc0rsLMDgSgxczN2mgpobppWtXmqISDJl0RtCU7Fkq/8i6In8DN7T1f+l5T3adW5SKtk8
	 rxZ8ZdrZphROMuIGEnBzQIUhXwKFQA3ylMh+1/sf2om4vFDDgfiUHXAbGeFPyYjQbkErx
	 mrT/EGvNHVPeEGGb57wDdli60mxacdnuG6fjBAqWbAcULI/70++uS6wEc0PJkdgfN+KrX
	 roDYMIwtCw51e3acWnD3qneOGEqmgmJ6cYJK3A+HPH4+4DLogIAHrZP+0+GnsnCCPOg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792967365;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Co6kM+95P1pL5AC/suB4Q7d5SKqKmhYIPMXEo5v/bwU=;
	b=S8y2pp0J/BLLuJkam2mGxJHWq0E2ccyqFGwDw6rry/zzVtNfiszltO0n2vDw4SEXbKcA
	 7nQ1C1Xqk2BxmBAmxbnXUX+uLc8/kTylwSU5qnR5UaonG3YQLqkL+s8ZIep/THKs/MiXU
	 QwieSiwlKvWMSk38fsxAkAcCtUyKa6Djj3EP/1//v9r0J8vIrFy7nlkN/kie+dcVimgv9
	 p/OjYmWYOIvyvZ0iR6NzBH0ldFR26oXkvTVd5QB3mrVbAg8/D0GgpczKjpo6Z10SU4uy5
	 wwvXdOjWFvScTIC4WnSjlTUXJCYAijYx6w8uP9TzgJ8UPm64fw9TaHhlUR6e06IdSXw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C5281F031E1;
	Sun, 25 Oct 2026 22:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792967365;
	bh=Co6kM+95P1pL5AC/suB4Q7d5SKqKmhYIPMXEo5v/bwU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Tb5w16vO0UWZhMKmaY+VEy2Bfl85+7TXGYug+QTUKV0ZEUovqZx4LjDCbygMWsrCM
	 qOu/iIdX+FPpzX8NzL/zHffWjaU/lXa4NgcrcpPFil7+YexelvyxND8Y6eCERyhJoJ
	 Q1ul8pxgq17qe1qN79H7gprFGjE63bpYNWI0YXAdpC9+rP3lhlqMPhrB5cd4HoECbp
	 PomlM0HdhZbUGmimWovmjN2JLCuFDwYx5Iq51R2UyOGAn2EY/5ID+La55S6B+qABmi
	 aOs9cYVY1EI0XZZGQRZ+AIZwyRpjqarbuhdKFJRUIIHQ5cr5S3RQlsanNNc4e0A7Q3
	 VYGMQizqhb0Og==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AE57344B02;
	Sun, 25 Oct 2026 22:29:22 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sun, 25 Oct 2026 23:29:16 +0100
Subject: [PATCH v8 8/8] fuse: {io-uring} Prefer the current core over
 mapping
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
Message-Id: <20261025-reduced-nr-ring-queues_3-v8-8-8a2570e8d2a4@bsbernd.com>
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
In-Reply-To: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1450; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=tpcIJt64KMjnkQcqgwgIdVkmxlr0O8K5l+u5VmbpUA8=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLLuNR2smzFp/6fMJSXimv0S708s/adSKHLRhfHoX1ez5
 f8XS95Y0FHKwiDGwSArpsjSJbHHdso/Plm1r+uvw8xhZQIZwsDFKQATcc9kZPhbYyQ/OXZzRdSj
 KOfb9Wyry7d8kk1KX7PTQzA3IchwgRnDf5e3vsWvLnsf1V/XK3iklj+R687LgP8d/ApLZZNOqq8
 9xgAA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com
Content-Transfer-Encoding: 7bit

From: Bernd Schubert <bernd@bsbernd.com>

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
index ca82965fdee1..2efea959d7e6 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -398,6 +398,12 @@ static void fuse_uring_cpu_qid_mapping(struct fuse_queue_map *q_map, int node)
 		if (node != -1 && fuse_uring_cpu_to_node(cpu) != node)
 			continue;
 
+		/* Prefer the queue belonging to the current cpu */
+		if (cpumask_test_cpu(cpu, q_map->registered_q_mask)) {
+			q_map->cpu_to_qid[cpu] = cpu;
+			continue;
+		}
+
 		qid_idx = mapping_count % q_map->nr_queues;
 		q_map->cpu_to_qid[cpu] = cpumask_nth(qid_idx,
 						     q_map->registered_q_mask);

-- 
2.55.0


