Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792795843;
	b=il7+LWaWx5+36kpX935ENzZRsh30L7dOp15a3kz4NkuGjz16EhKdPBdg8SXDRb5GTrSi
	 VYpLW87ivIYL3DtJ/65tqT9cPW/CxflKXJtv1ToMHJI2SKSrshoPSBo7u2JLlX9ZvV75z
	 UymLM9X6Ec2HZ1JVKmoGnsfc0mvj6Jx7X/UOr+/2y5WenzXqlVCUU0zoBMDfnRMfwWWLu
	 ICm+CiCa9Fc1i49yXbM3SimBYfB+v+9TcyjQiScvdZ5uGN1oYjmzcn+IfdQOvAPeE/DPI
	 yj3cgN9/k3KIrtWQNVpOXpA2VkrVAz4cuHV4JAuba8zgwVCKqrJn2lBT61/6vuCfvnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795843;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Co6kM+95P1pL5AC/suB4Q7d5SKqKmhYIPMXEo5v/bwU=;
	b=b+AzC1xXwKbF//PEcdRWAAey1+wzQCrM7EGIC1Sv/2m3HQkQK0jpX8TE2KjKAwH9CooM
	 jBOtlr07iY+UMNvCjkJmzesIDxD4VSQFtEZn0Mt25xrvl/xOieZcF/Ofwh1yejaZVr3Vn
	 iBGfJZjNeHKI+SsFJun/kySUE7FAyOFyRK66va4vXFhAMehZ1+0+NnXqR//9bYYwwoJsk
	 KcNFfc4QYDTJOGmhdLpovGfC0JxB7ysh09mboDdxB4R0es4D7m6utRC1HH8ISGSEs/Jxr
	 GolK7ETM9zj5372mVsFC6hhlVJEl+zrzUa7QdgHWvephPzP8uD8QN6Xi7CKq4aTKuBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bdpch5Q1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5B6606A326
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 22:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bdpch5Q1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792795842;
	b=VcZI002uEbbqbdtrPCtMfvkil/NXo2xaWeiZ/TWOsYjPPhTY6jcO95fT+GP/QQdh9uGZ
	 YtFDiHzY4zGeKwY98gmzqVBoJae+Feni9v+lNNYowyBrOh1/CiIXKHbvZPB4SmvUhFjEF
	 ZdJu/i+bqDKLmq55OsAYNcrZhUP6xcmAXNvJ7Dk2/vbr8c10zshJ9CU84kpmlK0+wnQwz
	 engt3JM/0R5KiJG2daD2tDTObZJ2fAVm6ESEwK8AaS5tFVy2Nm67ya4OZNwsnvfhp1+VA
	 WXvR1Bhg0onQj5nh36lF5cYmXLLVkDhQkb3DYxeTVukox8vKMrzENS2pPw1R/ulM6/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792795842;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Co6kM+95P1pL5AC/suB4Q7d5SKqKmhYIPMXEo5v/bwU=;
	b=ZC+DTJww4Wn4WBtbw/58HwDRWaf2fnxsIwjTENyj30j+SZtKRf3mc1L3fjVCMzi8gX3O
	 aj1HIHW2wuO/YXZJQpZ0MHFd4AvrqM/4v7ml2WfHSq4o6nvV1WcHmIH8m2WxHFoWTLt2A
	 ja6IV3oksj6P59IaNQMdlM5Af4o+YNLmpihJ0eK3qFTnroEBjGVx2X4RGNgrFsvbEmi2y
	 1ibR3mkYX6jZlVvCUn9y3jUOwNIw6gzO9rMsPLxqQzNY8do1nj/dyc8Z60V7ANRTWUplE
	 D/8v1S2fvZLVjfscyaEa23d7aRhMqVZI8Fu2/OIfbaGXShlU0ku5//OzN/gFyeDyUdQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 129CC1F031E6;
	Fri, 23 Oct 2026 22:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792795842;
	bh=Co6kM+95P1pL5AC/suB4Q7d5SKqKmhYIPMXEo5v/bwU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Bdpch5Q18LJtsahvXjAOsx8zQAbdqry2PlWX64CbZgboFjjD7YkBsdY0tab4eD/dZ
	 Xg7MYgIajtAUSUJ3A0sTPqh7Y+F7QAbNw/Sey/mJ3jt0ngBrgPUdVJE/1hGg4Z1qAV
	 zkJaVii6dRJggST/MZoDYZodhQGMKUr5IfwW+4zmRcBK3Uf2eANFHA0xTtlDvccPCO
	 0T/VHmctTX79dpXw2AGpAgzLisaNxSH+RjkVwnnJzsbsB9lSgXQpyDyOKGhHFFcINF
	 qPmdkL+HP1lrHH4b9jHD27LEzurNHMwFUaTQBK8ZCZzOyd49Nqg8s506JoJNH0GYb7
	 1AzEqCwm5yQww==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2EE6144689;
	Fri, 23 Oct 2026 22:50:39 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sat, 24 Oct 2026 00:50:37 +0200
Subject: [PATCH v7 8/8] fuse: {io-uring} Prefer the current core over
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
Message-Id: <20261024-reduced-nr-ring-queues_3-v7-8-4e77e284fd48@bsbernd.com>
References: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
In-Reply-To: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1450; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=tpcIJt64KMjnkQcqgwgIdVkmxlr0O8K5l+u5VmbpUA8=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJuP9nLHWJ/4qKSY8hyBkGN+AUX3TZelO6L+ajQEhhUI
 lfx9qNKRykLgxgHg6yYIkuXxB7bKf/4ZNW+rr8OM4eVCWQIAxenAExEcAXD/4jnQkf3+Zsw/c4r
 89R+mhI5Y8m7zedE9568klX2kzH5fh/DL2a7VzNk3Jbauqo1PNy7fnobn1mgwC+/n91eN5malKt
 c+QE=
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


