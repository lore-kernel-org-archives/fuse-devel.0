Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B76C367F59
	for <fuse-devel@lists.linux.dev>; Tue, 14 Jul 2026 23:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073254; cv=none; b=mvflX11F0M7Pl7zZHeUVh3omCj3aHqurqj/VwSbryDWvtmMNJ+tfTjvQtnRtq42w1ti2w7c9ZKJNyZ59lPqZB1PxcZTz77KUoxJzfrOz9tMKnZgfysFwm8iStlLtn3BjOkqzce5C4c6vfxd1e6cq+qLOUKH/Qcdiijfaa7K6bxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073254; c=relaxed/simple;
	bh=AuZlmqiR8+NPISpjMyL03Y3+6R9Uu6pS6O/DvI2I34E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpYfVTt5PBdyKF27KjdC5Dyd9606Fn/618af3bz1kl0CyAmnnkeFrsLEVCe2LzelI/unFRikQQDeCO0rU7PLcIdYr8LlV+H+g2lZlVG5jgD44PyDzr2qcAlxn4P6lzU2ic2TQqYxJfqq8yL7N826opfRpsKrkjlTRay0lHwJgGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=ddK73DtZ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="ddK73DtZ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cace91f112so43916945ad.0
        for <fuse-devel@lists.linux.dev>; Tue, 14 Jul 2026 16:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1784073251; x=1784678051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6qOgI3AhwNY3MyS5Yl8AT4tj9fOaqiCdXwpSFV0QdFk=;
        b=ddK73DtZUfIQi2ww+lVMhnUhyC1U8k8UxHIr1wlMeqyBjdGpJK+IuFizzQDMkdlUat
         1JK/OZzVeo0B/3vQV0oJA+POeX4SWEsLGxnDpJrzVf5H6Y1cIOO8D0+NPUpaxt9uD7zN
         k/NQTQUkG+MGvy9Wby267XF7F2IwSEb/XjYrcxIg0+jBsDcMCYloPp1EmbaRnzexkKn6
         IFrvUQkHu8Knt7meomVRgOZb7OsCwMa+j2uXBLO5BeJxpg82T7nDO7mZ7sve0/VSg8GT
         LzXkQnNcpWRlWmhFhsXgHLPrlkBJpX0C5lubjkMcId/i10UssQmmaacN3ZsB4/1N7I5M
         kyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784073251; x=1784678051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qOgI3AhwNY3MyS5Yl8AT4tj9fOaqiCdXwpSFV0QdFk=;
        b=qJcWkNm7+Rurz+Ym7KiwlKFOz0N8iirFH+zJgiOHljIHIC6G5fKlypO70eHGzsans1
         1UkFv50m3p1Z7kZcaPoqs6UiJeng7xsU4j2QRJbzPkbETQde9QLxaQs3347M/K8IOdIf
         k/n1hMHNB6M6UBSOHWjmteGRN6mqhFe9jRCzOulda5ITCeZ2Cr/CzNWXAmm84+IKWCtx
         bTI1o253+K7Il0SLaFPp7/YLv8oTOujQvce5dlyxaHsHXN4dWfSPLRJuCa7GnB/xJhZR
         zNMH+V4juITZkBuWvshsuwSmwAwLn94Jsxm/ZGYARUEv6OifnM+GcABL6PUOMK936Tv+
         chPQ==
X-Gm-Message-State: AOJu0YyXG3Ooezr0B26Z6/BmVr9HAV5bPlNLrLqHEiWoEjpNV1Y3MREt
	iGCyLRdcOf/fR/NzjHBhcU+M14F+Xk0Hqrr5alpfZUszytxJJ/iqpGYNRzCRNb8DVQ==
X-Gm-Gg: AfdE7cklHDmL8OpEKAMJrYjg2tCrFDannrdB4/rCLfY+iHzZWH9Tgv4b3zoTlwUVrAq
	vsU7+rdmQIXjb0/1/TSsQTwL9DgTxI26jsV1sNI2RtMrLto7Z+UzKxl+0KMpIBzrCIV8Qep5fcM
	o+z2lBw5U4MkMrHART++5+AkRPFmLiCCnzHW2IZiBe5N0+wGtq1xDhTTPrwyrkQhN+SP7tl7zgg
	eelGmwqb+h92sM0g5FkLGjHZJS6oaGDM2tRdC1wsidKTgzSSAZCnUyXX67O2c6qdD0hzbs7jgiw
	3xIUGUoDtu3j2LJre5XlpeiQUHOYivbFeoeCUZ+i+VNh/14s2ueBojx3hDpoUOMnAA2WkeTISkM
	r1AhHlEKvaE62KWR3h0NXfubuM7q1CTgIlo2bzV3uTc7fToJbGjJOMNvAMmEqBqpTiEbLKpgI+w
	==
X-Received: by 2002:a17:903:186:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2cf03c7f0f7mr5116715ad.6.1784073251584;
        Tue, 14 Jul 2026 16:54:11 -0700 (PDT)
Received: from p1.. ([2607:fb91:1513:463e:34c6:f6a3:8e91:2983])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm123236075ad.65.2026.07.14.16.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 16:54:11 -0700 (PDT)
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
Subject: [PATCH v4 1/3] fuse: whitelist the request headers for usercopy
Date: Tue, 14 Jul 2026 16:54:06 -0700
Message-ID: <20260714235408.1666063-1-xmei5@asu.edu>
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

in.h and out.h are adjacent in struct fuse_req, so a single usercopy
region starting at in.h covers both and nothing else.  Create the cache
with that region whitelisted.

Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
Cc: stable@vger.kernel.org
Reported-by: Weiming Shi <bestswngs@gmail.com>
Suggested-by: Baokun Li <libaokun@linux.alibaba.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
v3: no context change; add Bernd's Reviewed-by
v4: drop previous tags; use kmem_cache_args to reserve usercopy area

 fs/fuse/dev.c        | 9 +++++++--
 fs/fuse/fuse_dev_i.h | 5 +++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5763a7cd3b37..b8e43e374b35 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -2404,10 +2404,15 @@ static struct miscdevice fuse_miscdevice = {
 
 int __init fuse_dev_init(void)
 {
+	struct kmem_cache_args args = {
+		.useroffset = offsetof(struct fuse_req, in.h),
+		.usersize = sizeof_field(struct fuse_req, in.h) +
+			    sizeof_field(struct fuse_req, out.h),
+	};
 	int err = -ENOMEM;
+
 	fuse_req_cachep = kmem_cache_create("fuse_request",
-					    sizeof(struct fuse_req),
-					    0, 0, NULL);
+					    sizeof(struct fuse_req), &args, 0);
 	if (!fuse_req_cachep)
 		goto out;
 
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 668c8391d61c..b511aaab6bfc 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -81,6 +81,11 @@ struct fuse_req {
 	/** @flags: Request flags, updated with test/set/clear_bit() */
 	unsigned long flags;
 
+	/*
+	 * @in and @out are the usercopy region of this cache (see
+	 * fuse_dev_init()); keep them adjacent.
+	 */
+
 	/** @in: The request input header */
 	struct {
 		/** @in.h: The request input header */
-- 
2.43.0

