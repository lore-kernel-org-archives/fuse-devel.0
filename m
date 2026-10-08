Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA543AEF22
	for <fuse-devel@lists.linux.dev>; Thu,  8 Oct 2026 06:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791441179; cv=none; b=cs+M401bU3rhNrCunLTSK9bewkFmSb3x12jZYXuOq5LEYDVq2NoGuu6A+NRfw0uEr4LwE7ZQX+d+almyMc4CQkkxgMbLiLuOC3toUtCs4j3ZcWLuzYbivK/HxyVkAmy7u2MtsOK1MjwsWCpS1KSqrtRyPZ3uyTeEImFeLdQUsdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791441179; c=relaxed/simple;
	bh=aIwAUAWsiODGxZ224eOITcUPvbEFhGe0KOPRy13kkHo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Tm6U/SiVmk1XL94381Y0YqPa3EaNc60P3gCAdkX27V3Tsb8p799HbfKXsBbirlcjImM0KpsVesqRLZiILCAajiDlMu8OyjBYrSN9Y5NvVscEUG53GRDFJAXe70uDPJ3aJZjwiHEif3rrlAinnc1FJIGOwzWpjT/hHTS4jawA7O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDTApO10; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDTApO10"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so220786a91.1
        for <fuse-devel@lists.linux.dev>; Wed, 07 Oct 2026 23:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791441177; x=1792045977; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmdCkCPZNwQQ7ZHzl51SdYDb62VPGEqmXUOyx3/kjWI=;
        b=jDTApO10qge49lWj/LSWzmQeWJIsfFXbf3KtGthcyKyiFfa8EmaBFB6uJcOnrHoExX
         BV+cMcEwnGL/zSMzC/3gEayqr3HPN7wdiUqZLaPEFWYb9NU5TIjg1PWsEnApGuRO7V4P
         uxpEsIJedop7pmRrqwaARvuupsdIihoFJJdsTwKnqwUWLrKcnn7D0u7hAuLe9nuVz764
         OLNIkuqiisGqhSzWbj6C7psiXD6fs1iNNBlNgy6FV9SRGu2Qy2/tDhWJXIFvgJXsqAuG
         DScp/BvBsugcgntWAzN9gwGb5199q+V3zbjXuowwK6h8P2o1/0BT1liKk5vn12sAtqFL
         6zHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791441177; x=1792045977;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dmdCkCPZNwQQ7ZHzl51SdYDb62VPGEqmXUOyx3/kjWI=;
        b=bRaDtvBiFgb47no4NB0H4T2haZ/lCKN6ISx9ewI7B58EreupikQOxgkOn1wgZ68KfY
         r/0IVItAzMkMrekF906t9bkB0TulqjsFOqA03e2Q+oJ+bcQPSmEcgaSzZ2YJamRRU9rE
         7Jl7uqDa/nKlLhBwErzz8pWI9jN/INv6kXJosb7+0ALV9hLG51hoDq0UTm8SMoHVqxTF
         Gw8JPl3RSu48KgxYfdqg0ZgW7LWOnAndsuRY4UN9CsokA0L1TQOYeUBYqqXjU4wrpYrl
         NCvGEZ3ETWGQeUpXx2kXzi7GakS3934+Md1hZA5IZ2PAVm04Hc0S2LMq/sG1Vw5i6TRz
         B28g==
X-Gm-Message-State: AFq9FYJkP6Mj72d2jWQmlFTOzctTYfWpUJs7Ba/9iohz36Djvmk4wLey
	76R2FAVuo4tl6dVo3upkScFrarGSoIH5nsR+6N99qqyJZktXnnQ8vG64
X-Gm-Gg: AYBFou0kdij/wqRRA/i9rrKRq17RmWFpeRbP8n7MVcxzfek1Em/gq2Q7lMzlofjCC6a
	JBxUPrn4NoEIiyD1Ft9r1EfJ1WplfE+jny9Afsik4RGQRs+R4EMoeUZwI7C52gJE2x1nWLLLmM7
	qYkyEdrhFCNBFtGp8oDG/WF7vQOZkKsRUKzPolWeTjHHHkBLhpHNY67qxtkMlol1Tic58B05nGs
	JcOO6oGqTg6npk8m/+e79VmFYSJPUYO6pwjxoDsImIpz3pFqEpqJb0xVK6YFzYXuoA6JIwj1wbx
	J3TnK2ZK1lxSNiHevNhJhheQSl5ljdf8D8jxJOm00MJNv3RDsmKeOmwxdgFb6PD/a37hFAHNWdu
	at2MM4yYaP3Wvkg28aKh+2OyncLKfjP5jmlypA+4QmvYfGLjcF+25MeUmSeyDiFdGOa5zoGhtC6
	Kq1Ig4WeKzaYhoLp0vBTpRCymDdqDYJMOwJKa9Rln1DR5BXUOz3yR7gWDp3nh93Zwzkjs3Bg7MB
	JGA9w==
X-Received: by 2002:a17:90b:4f90:b0:3a6:f1d2:57e7 with SMTP id 98e67ed59e1d1-3aadffb032cmr865522a91.11.1791441177046;
        Wed, 07 Oct 2026 23:32:57 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a7e9e4sm2882285a91.7.2026.10.07.23.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:32:56 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: miklos@szeredi.hu,
	bo.liu@linux.alibaba.com,
	vgoyal@redhat.com
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] fuse: dax: Clear stale mapping when inline reclaim lookup misses
Date: Thu,  8 Oct 2026 14:32:51 +0800
Message-Id: <pm-fuse-full-objects-candidate-0016-v2-f3854498f12705839ecb@gmail.com>
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

KASAN report as below:

    BUG: KASAN: null-ptr-deref in igrab+0x2d/0x260
    Write of size 4 at addr 00000000000001e8 by task kworker/u16:0/12

    CPU: 0 UID: 0 PID: 12 Comm: kworker/u16:0 Tainted: G        W           7.2.0-rc5-pmb-fuse-functional-v2+ #1 PREEMPT(lazy)
    Tainted: [W]=WARN
    Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
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
    ==================================================================

Oops report as below:

    Oops: general protection fault, probably for non-canonical address 0xdffffc000000003d: 0000 [#1] SMP KASAN NOPTI
    KASAN: null-ptr-deref in range [0x00000000000001e8-0x00000000000001ef]
    CPU: 0 UID: 0 PID: 12 Comm: kworker/u16:0 Tainted: G    B   W           7.2.0-rc5-pmb-fuse-functional-v2+ #1 PREEMPT(lazy)
    Tainted: [B]=BAD_PAGE, [W]=WARN
    Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
    Workqueue: events_dfl_long fuse_dax_free_mem_worker
    RIP: 0010:igrab+0x3e/0x260
    Code: 4c 8d a5 e8 01 00 00 e8 d0 82 92 ff be 04 00 00 00 4c 89 e7 e8 63 91 f3 ff 4c 89 e2 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 14 02 4c 89 e0 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 c5
    RSP: 0018:ffff8881009dfbb0 EFLAGS: 00010212
    RAX: dffffc0000000000 RBX: dffffc0000000000 RCX: ffffffff81e63d2b
    RDX: 000000000000003d RSI: 0000000000000008 RDI: ffffffff8af59680
    RBP: 0000000000000000 R08: 0000000000000001 R09: fffffbfff15eb2d0
    R10: ffffffff8af59687 R11: 6e696c6261736944 R12: 00000000000001e8
    R13: ffff888113c90100 R14: ffff888113c90148 R15: ffff888113c90100
    FS:  0000000000000000(0000) GS:ffff8881fd71a000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 00007f2c45b15000 CR3: 00000001129f3002 CR4: 0000000000770ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
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
    Modules linked in:
    clocksource: Marking clocksource tsc unstable due to frequency skew
    clocksource: Watchdog               kvm-clock interval:            22712ns
    clocksource: Clocksource                  tsc interval:            22542ns
    tsc: Marking TSC unstable due to clocksource watchdog
    ---[ end trace 0000000000000000 ]---

Fixes: 9a752d18c85ae ("virtiofs: add logic to free up a memory range")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

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
