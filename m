Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BD2378D8E
	for <fuse-devel@lists.linux.dev>; Mon, 27 Jul 2026 23:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785195441; cv=none; b=lXYLveMUy8agop55iXBsLsR0L/bdjvB8ElV+5CmY39vjNZaLgtfjV/tSQ5yrXv1MiVZhACfSp1dZSYhMNBMSh3gYc8YasdZPCMF6qwQE0klDs7T1HxUGHf4f2cOiAmCzPFBHyNlhFAsNYAMIElLW7kI65FbCGSQU83GQXfFezLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785195441; c=relaxed/simple;
	bh=HF9Ry0dfbzlzU3T6bGyS1FE6ZfUi4xBEOfOFRYytFZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kZK68diLOpZBPf6wnN/1+iED1fm28aZ6qXvz50fPqJtVmHQ55d/bpOV6PL/RMy/YODMIzTxXFc8gw6tCeBTh015ZECAZWRlt3dtlAfUIuHp7BUJwPO4VkJ6DxCmfu5IgIOPlJLJjeszdd7Ss4+S3fS9SjzKfB4nHjuaryCXW2C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=g1cug8hC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="g1cug8hC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d004f135b1so13598405ad.3
        for <fuse-devel@lists.linux.dev>; Mon, 27 Jul 2026 16:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1785195439; x=1785800239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uoe1e+GzdQiS6kND7+XHKSW0CtkxIftVFnFlad8gR4A=;
        b=g1cug8hCtvkpg+6fVbl7IAE4Pk0+TREO59ysr+OoSkyhwnL1jujR3JaI3XVi+ImbcC
         0UlmEjE5L65L7CMJ2nTOzPFqZhR0CufRFjTWD9VkAZOnwF9fSE0mcSMJj43qOC7iBhb/
         BLjr9exga25YCpB0tZDYkBb77ax5Xyhi52iSzaCqBDfRVQ9jPqDM7mBsbj9tq9bf/Tke
         AqRB31ZjORmOPcAsX4670BraBMvhCqYsZXpl7b0rKIN7s1ib8JHFCHI+rQ5LKYDbc3sZ
         P39u3KeJYuuZ8pUXYVlw6qojQZ4iPus/zsUVfbyJS5G+bnT64QJHCRXucexsjU9S+QeC
         hXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785195439; x=1785800239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uoe1e+GzdQiS6kND7+XHKSW0CtkxIftVFnFlad8gR4A=;
        b=BDOVqxY7DuCBnFeKhQi1ivhv7W57EZaN1LFcx4me8sVaJGDykX4y3IOEFh3iShy57t
         mcphF4mv+K1lVn0ru7WOIVJu5u3KMNxE0G/WbSvlHE4Wxh8o1cdWcb3HP7nAtHKVhN6W
         OfSJxT3rTIENBvqnsL/F59O81gXPgo4EL5y+t0Q2V7+wrIaJcKiS8RfyH14RmwrLESAJ
         M7LQuKJKnHOKRjVZfppFco2BbD3PygpVOdQuskHhDRlso14Ser/YEeY1pgl2JqFZGqb8
         9aguG+w153qS4wY84GIATa4J3yxZPvEGyZsPVXMHxeXPjnQ4+jKAB8l8/QcU8o/Qv/RH
         qhVg==
X-Gm-Message-State: AOJu0Yz6PpyauS6UKMWTdOPcWjFyF4iXNRErBzyBDiQB7RFtqvlaWWYg
	Vf6amDgbPihAHm/xetEWnl/S0iuyCagWPp2zXz7wNwIpJMg7TR7pD9QrGO/FFGVzXg==
X-Gm-Gg: AR+sD12/7WWiWi1b19DyAFOSTWs1uwI6TVdwh8XHOSqaCCvlBBPC9TZLpxmCc0kOQx5
	Hul0ZchSntLaUjWO6w+ac4dFjhZbdwExBNg2OcvvJGTcLKBynWlXn19kQkyVfOYtDdZbJG/vskP
	W3rd/Q35IKWGSQaYSs1RL37g7B2NBlRV5onAyDtOxgvwjhdrQ20y9LQmqFoJVCUWf/X6/zGZJRL
	Sz4o2F3HjUtLI/IKgaFe+edXY8KlkuEZVepqZCinBFKdoJuRQ9/GByMO1DpmPsTE021yjz77VzA
	JBY6El0e+FPvi1pjhd642k8UjZ1CbW7CQ+Me8sGf7ffp81/iIFXWT8p00fkiA8I3zkuVdSmOJY6
	tVUXGM3zryo1nkPjqIte1Rzspl3mvsP18XG8XJayg0vcKNOARQy/JRr0XWLxv/W6ytKX0P7ohzw
	==
X-Received: by 2002:a17:903:1106:b0:2ce:b096:e50b with SMTP id d9443c01a7336-2d00f5f7411mr11253795ad.47.1785195439553;
        Mon, 27 Jul 2026 16:37:19 -0700 (PDT)
Received: from p1.. ([2607:fb90:ec26:45a7:d22f:3f56:f9b2:423f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde4650a5sm42256915ad.0.2026.07.27.16.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 16:37:19 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: fuse-devel@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	bestswngs@gmail.com,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH v5 1/3] fuse: copy request headers via a stack buffer for io-uring
Date: Mon, 27 Jul 2026 16:37:04 -0700
Message-ID: <20260727233706.218446-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fuse-io-uring transport copies req->in.h out to the ring in
fuse_uring_copy_to_ring() and req->out.h back in fuse_uring_commit().
Both headers live inside the fuse_request slab object, whose cache
(fuse_req_cachep) is created without a usercopy whitelist, so copying
them directly to/from userspace trips CONFIG_HARDENED_USERCOPY and
panics:

  usercopy: Kernel memory exposure attempt detected from SLUB object
  'fuse_request' (offset 56, size 40)!
  kernel BUG at mm/usercopy.c:102!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:usercopy_abort (mm/usercopy.c:90)
  Call Trace:
   __check_heap_object (mm/slub.c:8268)
   __check_object_size (mm/usercopy.c:197 mm/usercopy.c:258 mm/usercopy.c:223)
   copy_header_to_ring (fs/fuse/dev_uring.c:618)
   fuse_uring_prepare_send (fs/fuse/dev_uring.c:776 fs/fuse/dev_uring.c:785)
   fuse_uring_send_in_task (fs/fuse/dev_uring.c:1306)
   tctx_task_work_run (io_uring/tw.c:96)
   task_work_run (kernel/task_work.c:233)
   io_run_task_work (io_uring/tw.h:84)
   io_cqring_wait (io_uring/wait.c:278)
   __do_sys_io_uring_enter (io_uring/io_uring.c:2685)
   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

Bounce both headers through an on-stack copy so the usercopy touches
stack memory, not the slab object.

Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
Cc: stable@vger.kernel.org
Reported-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
---
v2: add: Cc stable and Reviewed-by tags
v3: no context change; add Bernd's Reviewed-by
v4: drop previous tags; use kmem_cache_args to reserve usercopy area
v5: revert to the stack-bounce approach; restore reviewers' Reviewed-by

 fs/fuse/dev_uring.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 77c8cec43d9c..0814681eb04b 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -744,6 +744,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 {
 	struct fuse_ring_queue *queue = ent->queue;
 	struct fuse_ring *ring = queue->ring;
+	struct fuse_in_header in_header;
 	int err;
 
 	err = -EIO;
@@ -765,8 +766,9 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 	}
 
 	/* copy fuse_in_header */
-	return copy_header_to_ring(ent, FUSE_URING_HEADER_IN_OUT, &req->in.h,
-				   sizeof(req->in.h));
+	in_header = req->in.h;
+	return copy_header_to_ring(ent, FUSE_URING_HEADER_IN_OUT, &in_header,
+				   sizeof(in_header));
 }
 
 static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
@@ -871,11 +873,13 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 			      unsigned int issue_flags)
 {
 	struct fuse_ring *ring = ent->queue->ring;
+	struct fuse_out_header out_header;
 	ssize_t err = -EFAULT;
 
-	if (copy_header_from_ring(ent, FUSE_URING_HEADER_IN_OUT, &req->out.h,
-				  sizeof(req->out.h)))
+	if (copy_header_from_ring(ent, FUSE_URING_HEADER_IN_OUT, &out_header,
+				  sizeof(out_header)))
 		goto out;
+	req->out.h = out_header;
 
 	err = fuse_uring_out_header_has_err(&req->out.h, req);
 	if (err) {
-- 
2.43.0

