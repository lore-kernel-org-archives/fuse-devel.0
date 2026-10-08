Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B0848424D
	for <fuse-devel@lists.linux.dev>; Thu,  8 Oct 2026 14:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468558; cv=none; b=s5V6B+8E/nxAzVcnoxhSzpJ9UbhzPFg8rhFB43lfXspOXJGT1X27AALKmJp2rNdZ/rNOQaRVRqLQ3dqFeZ6/MS/zhQVH+2rSIJti5mqMNPEvd/GsaVIczEcTZrgE9CQphOnsXOH/gRHQ+rHUMlwoKHCZUF5zfae4BwoO46dIrsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468558; c=relaxed/simple;
	bh=6BEIHJjolflX6+Gzn6XCCPW64FuT3A8Y0aHv6pxFkJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JX2OO9HhHXqbYfQ674pDE/7tIjWJDju75f2ZD3wzY3IrYJ07zXj1YRmS4+6TtKKUg/exx5Sk9CVSgaDL+RKrZaoYjIYioR1om6HEg24ie+R1P+x6HqZGTUwk/5DSWmPyLfRjj9gCTynpX+YE1jpibxea3TyTc9f4cR7/w5EPCI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlInKjcv; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlInKjcv"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso3018110a91.1
        for <fuse-devel@lists.linux.dev>; Thu, 08 Oct 2026 07:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791468556; x=1792073356; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSANG6S8NSGoFygyPtolE8Kx6+g//31lIkZsaSMWHdo=;
        b=DlInKjcvJyfVXU1uXXJD6x+sbRL6MEUA8dZm0+lau2sRrhkj3CgBDrrr/35oPsJ4bG
         9Z1KHQYVz3zZ94EpKjqq4ZhHa5MetzgkRrN7kVK9ET9oKGnkyA3EyDQvZz+N2Euc/SgD
         HUR0+ob6jn0U2Yo6IqcHScYSu/8f8lSn8rUzHgAVqPWDaGplWnEYJX+pzdtl5iQmskGf
         T4VZZYteME1SOUd2H8HIWwKX5rUTZ8bj8JvjWyIilK0JHIYixItdFQ40a/96/S6LYirt
         h8fLpjY+ws6lG7Ox9Sm8jEeAh8gQ6OpVEjzNJUVZ0NhCn423rhsMSl4gib57z/XxvTy6
         t+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468556; x=1792073356;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tSANG6S8NSGoFygyPtolE8Kx6+g//31lIkZsaSMWHdo=;
        b=fY794gbouwTifKFHCTPs5N0izAQ7Hty4JC8Qfj9rpoHwj/dGcRzt8n+Wy08jJjBqBd
         twMELMxPsGfRIMV2j1XQukXBDnUKM4nan29SqayQeXF24GYCOfmBL7dFuy9cxR8oWpuh
         UzdyYxvOeO0AResBWeIdAhT3CTSWoAt0XmMnl8JmP1qLR8OWFwRD4ee85VN2pkxf4uHt
         Gnvq3xxw4eo+/T7kBhUHtRAj/RqbyERJW0Bng+rMXH4lDy4kQ4OmfWgUep265rOOJOW7
         A5C4iz0y3l/liWfxmGghXhSAog4y+SwfJ08lxv7MVJnAOfwUmDvq7+HYf06v8NzjKIpp
         SRvg==
X-Gm-Message-State: AFq9FYLlcXlo0gJqUkelvkrEMYPNmx5fc9NSLX858dHI7PwKN7bb6T6m
	crE2mbSxkMEPTNAd0Z6RpcHev7nkoRMf/ADYGN3sFukqWnOkUH51n4o0
X-Gm-Gg: AYBFou3d3oOZS0V5bLu1/JeT6DIif3lsCr3MuXOzd8VMbiEeW/x/yJ0lboQTeKx3qbm
	vLlA6oqYgm7/ZcuTzfFpj2I9adxF+3THE4RPL1T4sbG56QpiFEpXo8r19XAX4vV6Y1zrT/3W0fQ
	DuSaSw9/8k86Lczlvn7VRbL4F1ma+xwEqqONeblf3FAPpmkC7+i6PyeEwEeFLHqt2uTEZsXPdmu
	3lz1c4sADYT8MEq+63lwiMMyPT6KFwI2Hn6bcP4Al3LqAkwdY3+FuE+d2mq3TaKId865soqKoGh
	XCDazvaKR4Wh73YW9MiQlbLVLDJ1KF6R4HeBi8FdzHPcH+GCYK6B8MGo7BK7zGj33o35togo8D4
	zpC7MUKCnG3uTIf3c5HTDULUfl1LFWE2Ls3Nyii1980o7JpoBcEdu6xQT2mUNZFZq7kOgSLshUt
	TRMQDtX4fh7vz8nNXJ/ts/SXuSYw11KM//hW0S9QYRcrESsfFEF9WMGonZKzuvm4+w7w==
X-Received: by 2002:a17:90b:2751:b0:3a0:9640:8039 with SMTP id 98e67ed59e1d1-3a8a0ba984cmr5074558a91.30.1791468551666;
        Thu, 08 Oct 2026 07:09:11 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd35715bfdesm53008a12.20.2026.10.08.07.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:09:08 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: miklos@szeredi.hu,
	bo.liu@linux.alibaba.com,
	vgoyal@redhat.com
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2] fuse: dax: Clear stale mapping when inline reclaim lookup misses
Date: Thu,  8 Oct 2026 22:09:02 +0800
Message-Id: <pm-fuse-full-objects-candidate-0016-v4-87d8eabc59be23301791@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A mapping returned by inline reclaim must be detached from its inode
and the connection's busy list before it can be reused. However,
inode_inline_reclaim_one_dmap() leaves dmap unchanged when its second
tree lookup misses. It sets retry but returns the old pointer, and
alloc_dax_mapping_reclaim() accepts a non-NULL result before checking
retry.

With DAX enabled, an exhausted free pool sends a file read or a
non-extending write into inline reclaim. A pinned DAX page can make
fuse_dax_break_layouts() wait. The inode tree semaphore is already
released, and fuse_wait_dax_page() drops the inode's invalidate_lock
while scheduling. This permits the following ordering:

  1. Inline reclaim on inode I selects mapping D and copies its index
     under fi->dax->sem, then releases the semaphore and waits with
     invalidate_lock dropped.
  2. After the page is unpinned, the reclaim worker acquires I's
     invalidate_lock before the inline caller resumes. It relooks up
     the index under fi->dax->sem, removes D and returns it to the free
     pool under fcd->lock.
  3. Mapping setup on inode J takes D from the free pool and publishes
     it in J's tree and the busy list. J has separate inode locks.
  4. Inline reclaim reacquires I's invalidate_lock and fi->dax->sem.
     Its lookup misses, but it returns D. Setup on I then reuses D
     while J still owns it.

Successful stale setup remaps the same DAX window and reinserts the
embedded tree and list nodes, allowing accesses to reach another
file's data and corrupting the mapping structures. A setup error or
an existing mapping on I instead puts the active slot on the free
list. Later reclaim can encounter a cleared inode pointer in the
corrupted busy list.

Clear dmap on the missing-node branch, as in the adjacent branch for
a mapping still in use. Returning NULL with retry set makes the
allocator retry through the existing pool and tree lookups after
releasing both inode locks, rather than reuse an unreserved slot.

The failing worker produced the following KASAN report:

    BUG: KASAN: null-ptr-deref in igrab+0x2d/0x260
    Write of size 4 at addr 00000000000001e8 by task kworker/u16:0/12

    Workqueue: events_dfl_long fuse_dax_free_mem_worker
    Call Trace:
      <TASK>
      dump_stack_lvl+0x93/0xd0
      kasan_report+0xe0/0x110
      ? igrab+0x2d/0x260
      kasan_check_range+0x105/0x1b0
      igrab+0x2d/0x260
      fuse_dax_free_mem_worker+0x172/0x9e0
      process_one_work+0x908/0x19c0
      ? __pfx_process_one_work+0x10/0x10
      ? srso_alias_return_thunk+0x5/0xfbef5
      ? lock_is_held_type+0x8f/0x100
      ? srso_alias_return_thunk+0x5/0xfbef5
      worker_thread+0x65c/0xe40
      ? __pfx_worker_thread+0x10/0x10
      kthread+0x34f/0x460
      ? srso_alias_return_thunk+0x5/0xfbef5
      ? __pfx_kthread+0x10/0x10
      ret_from_fork+0x659/0x940
      ? __pfx_ret_from_fork+0x10/0x10
      ? srso_alias_return_thunk+0x5/0xfbef5
      ? __switch_to+0x74f/0xf80
      ? __pfx_kthread+0x10/0x10
      ret_from_fork_asm+0x1a/0x30
      </TASK>

Fixes: 9a752d18c85ae ("virtiofs: add logic to free up a memory range")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v2:
- Drop the duplicate Oops report and format the KASAN trace.

Link to v1: https://lore.kernel.org/r/pm-fuse-full-objects-candidate-0016-v2-f3854498f12705839ecb@gmail.com

diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 85cdf0199bc0b8fb121324ffaf8046a054cbfadf..361538bc41e5a44d01da11b76070f8af0e783b2b 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -951,6 +951,7 @@ inode_inline_reclaim_one_dmap(struct fuse_conn_dax *fcd, struct inode *inode,
 	node = interval_tree_iter_first(&fi->dax->tree, start_idx, start_idx);
 	/* Range already got reclaimed by somebody else */
 	if (!node) {
+		dmap = NULL;
 		if (retry)
 			*retry = true;
 		goto out_write_dmap_sem;
