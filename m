Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424998;
	b=j0U5Fng0ckCcczDLBN/U/jgYGGdIOjj/gTHh3rDPHM+7eLHSD1FLKdkBJGc1YJknz7nb
	 9zjAGjgaiBwXux2f6EZ2vmQIm0Jnrykw7JjG70OOLl68RENdbalchf9zkNHf89+kBRy43
	 tVghXzBiqPbDtG3Tj6cYd7ZSJRcYIrketfvL8aDN85465Keg8w78bJVav2gzRnyNJ8Q2z
	 se345ezCO8ciVS2Ol0L4Bu821tjb/JcNVz62a0mXanKeVLI5YwEyo61UQeilwWyVtF00/
	 cie0gSoSKgV0i+T+8FGoZltDa0a6UyHBloSKcg0Lezm6WjpFkZm1JgWrw3QNdZGMPIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424998;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aT5uOJVtAeeBUAkpAajdbtjwvX4raqbOzSyMQgzblSU=;
	b=5GW3lCCSUBkj0NMFW/s3ar9kDZ1jYr5txm8e39UDEck6TB0VdsN31nkvsyiaQunInrGL
	 qJAZiyA3Pt76Sdbzzz6op8SY1irL4B4VPky01P5q3Jc+CTTC8PhGAO2h+nlTSuQZbppdh
	 MBZXgkNaU763VuUq0lAbLv5sS2SWNEV9hSsc8xauN/bF22qIpHhipMz3QermtTKz4jSkc
	 Y/C7s3ZoyzCVSPnC/j1TyE9YtnSvHTXZ9laQXmBqV3afukwmVFv3tCV5Qm6+wAawQO6Mn
	 z5j+ECFnCvIwVayAifdDZuYjg6wPMqiviWFWmTEhS2LF1c6U+emBCsrvBEgzIaGK3eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OG+oV4Mq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF422606C91E
	for <fuse-devel@lists.linux.dev>; Mon, 19 Oct 2026 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OG+oV4Mq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3F21F000CA;
	Mon, 19 Oct 2026 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792424997;
	bh=aT5uOJVtAeeBUAkpAajdbtjwvX4raqbOzSyMQgzblSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OG+oV4MqpKRiDi/PRW9u4pybGzf0fxfJ6lD40KXgfqfuXWGSOd6XdHyvFrlO9sIsN
	 xgi1JgbO2O6oSkuUR/0OqnBrzExM6oqljALUF5vpGbW/sAEnvhzkw96CnDz2EBCM90
	 rL49g0OKeonHI1HtmVKBa56kDTPqf8Ff8ELNdWBZtnA32eqZdnuA8ySm91/swNDVB3
	 DVdoyYngqgS+vHok391nrY20+hp0NszmSF2oSO99aP2Pw0LBbUYFQuY0niYBOSXKqV
	 oxoMpCHoAhJ8+zDu7mzJCwp0UiP6y9alRy5/desCyzaA/aPK5OUjKbn8293SayfbRH
	 8iOboOUsdt2tQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.ams.internal (Postfix) with ESMTP id 620B51980047;
	Mon, 19 Oct 2026 11:49:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 19 Oct 2026 11:49:54 -0400
X-ME-Sender: <xms:HTzWamok5UWFR8ANGfxdeoFbD9Ximmd0pQOUMN_r9x8pvYyoHLYpIw>
    <xme:HTzWap7Q3NW-2VZqpYyj-229kkB_zabELmWEIrmlDtGbYAryTHIwgTJqNqQ2ZaDbW
    NQu-3P5QT4eYwM1FniJmOwkPHYO-uQXdRbznDnZL1Zk8Z0oc7B7dx4d>
X-ME-Received: <xmr:HTzWat0WZ-ym_d0AkN5_hfvYG0Q9Foyga1fm-cfgFLnNnpJqVKrFEYUcpxg>
X-ME-Proxy-Cause: dmFkZTESqR4vElUNfwe4Wb1kabMg9MdYUtHyNIvlHi5jfGRsEd0tjiYfzpqh5FemuLlMuA
    +QzWL/iolJzzDzQk8vzuoT2/u2xyL/YZG/CihU2eaSQe3uAw7YKu/Z/hQfgMIJpEQrBQkK
    hH3KJVpCmjg+gNXnnOIkdBMKpJa1pvTLqzuojrt68Uovke10kpOzVhZrNEf3d58NDgoR+6
    GBwzdAiHoLFFDGJo3/r+XBHeUTBbw+IeFaYdgC0j5JEQlKAOMB5I7tBUfVMuw5hMfUnXf2
    vE1DwOk7N/x2FbtU++Y3QX/1ODQhD5sTVGp3EMvK4jUTItTZrn4RBPsK+PhnbeHfl8JcRn
    8N9/3E1xHLQzkStTAM1kYcniVBbKweqHzIBqUZ0NEcBBHDz6IupfY1aF3rRGHQ7LEKorpQ
    gVm1/ZBoA9VHbQ2f0U4WL3yW8ieJn87dOng4oTtEeVM77LlnanTJPqYvdg7zkq63FOQgKl
    3kot45HjaQuhK8dJORgnME5BEO93itG6PuiaOezy3CdEINnT/QZfplvecCCoMpOpirmntr
    okr8m3b9OCWqKNQ40j0/FGLxSIYnrEYpesykRn74vh+bLDj7UqIqVtDJTDUCObB8Dmfwl9
    3IkUZlxtEaJ6iiXBMcXuT4X8iGRYOeLYeWrgJmoHU/RRiZrC5LOhzjWwUwYQ
X-ME-Proxy: <xmx:HTzWallm8sG8Aup5VZsl5PzNa3cpKK_EC_wAItU7rJav44IhcfYKfw>
    <xmx:HTzWamgYTpnBo_nKl0qojFyfNN3YF6V9kwBxTCSAWrqrrzIwOtQA3g>
    <xmx:HTzWas3mZmVCAWowCp3n3NhDyKfzK8Ci8PWV01R2-pMks0q4jOrz7A>
    <xmx:HTzWajatqHLVXJjoVLB9hIZgmfusCt-Y06NkaWv29lW15FACmNkb6w>
    <xmx:HTzWapmJE6JyTcysaC0rWG8eI7DRl6oGhQTupYC9K73Q5SDPdWJ5qSeS>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 11:49:49 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Hugh Dickins <hughd@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Miklos Szeredi <miklos@szeredi.hu>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Harry Yoo <harry@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kernel-team@meta.com,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [RFC PATCH 05/18] mm: expedite the grace period when a CPU has many deferred frees
Date: Mon, 19 Oct 2026 16:48:58 +0100
Message-ID: <20261019154913.1765974-6-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019154913.1765974-1-kas@kernel.org>
References: <20261019154913.1765974-1-kas@kernel.org>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Linus Torvalds <torvalds@linux-foundation.org>

A deferred folio waits one to two grace periods on its CPU's list, where
the page allocator cannot use it.  A CPU that frees many flagged folios
at once, for example when a file is truncated, can hold a lot of memory
there.

When more than 4 MiB is pending on a CPU, a work takes both of the CPU's
lists and frees them after an expedited grace period.  That grace period
starts after the take, so it covers every reader that found one of the
folios.  The task that frees them does not wait.

An expedited grace period interrupts every CPU, so keep it for when the
memory matters.  That is when the zone is below its high watermark, or
when the pages waiting in it are more than an eighth of its free pages.
The watermark alone comes too late for a bulk free.  A truncate or
fadvise(POSIX_FADV_DONTNEED) of a hot range defers all of it while the
zone still has memory.  When the readers that refill the range then run
short, nothing is freed that would check again.

With rcu_normal, as on PREEMPT_RT, the expedited grace period is a
normal one.

pgfree_rcu_expedite in /proc/vmstat counts the expedite runs that freed
something.

Assisted-by: LLM
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
[kas: take both lists, expedite only when the memory matters, rewrote
 the changelog]
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 include/linux/vm_event_item.h |  2 +-
 mm/page_alloc.c               | 61 ++++++++++++++++++++++++++++++++++-
 mm/vmstat.c                   |  1 +
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index cbe849701653..45527fa7d0c1 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -36,7 +36,7 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 		FOR_ALL_ZONES(ALLOCSTALL)
 		FOR_ALL_ZONES(PGSCAN_SKIP)
 		PGFREE, PGACTIVATE, PGDEACTIVATE, PGLAZYFREE,
-		PGFREE_RCU,
+		PGFREE_RCU, PGFREE_RCU_EXPEDITE,
 		PGFAULT, PGMAJFAULT,
 		PGLAZYFREED,
 		PGREUSE,
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 15bb66e36304..a9058d414f92 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1313,6 +1313,8 @@ static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned int nr)
 
 #endif /* CONFIG_MEM_ALLOC_PROFILING */
 
+#define RCU_FREE_EXPEDITE	(SZ_4M >> PAGE_SHIFT)
+
 /*
  * Each CPU has at most one grace period in flight (@queued), covering
  * @batch.  Folios freed meanwhile wait on @pending for the next one.
@@ -1322,7 +1324,9 @@ struct rcu_free_pcpu {
 	bool queued;
 	struct list_head pending;
 	struct list_head batch;
+	unsigned long nr_pending;
 	struct rcu_work rwork;
+	struct work_struct expedite;
 };
 
 static DEFINE_PER_CPU(struct rcu_free_pcpu, rcu_free_pcpu);
@@ -1337,17 +1341,29 @@ static void rcu_free_start(struct rcu_free_pcpu *r)
 		return;
 
 	list_splice_init(&r->pending, &r->batch);
+	r->nr_pending = 0;
 	r->queued = true;
 	WARN_ON_ONCE(!queue_rcu_work(rcu_free_wq, &r->rwork));
 }
 
-static void rcu_free_pages(struct list_head *list)
+static void rcu_free_take(struct rcu_free_pcpu *r, struct list_head *list)
+{
+	lockdep_assert_held(&r->lock);
+
+	list_splice_tail_init(&r->batch, list);
+	list_splice_tail_init(&r->pending, list);
+	r->nr_pending = 0;
+}
+
+static unsigned long rcu_free_pages(struct list_head *list)
 {
 	struct folio_batch fbatch;
 	struct folio *folio, *next;
+	unsigned long nr = 0;
 
 	folio_batch_init(&fbatch);
 	list_for_each_entry_safe(folio, next, list, lru) {
+		nr += folio_nr_pages(folio);
 		mod_zone_page_state(folio_zone(folio), NR_FREE_RCU_PAGES,
 				    -folio_nr_pages(folio));
 		if (!folio_batch_add(&fbatch, folio)) {
@@ -1357,6 +1373,17 @@ static void rcu_free_pages(struct list_head *list)
 	}
 	if (folio_batch_count(&fbatch))
 		free_unref_folios(&fbatch);
+	return nr;
+}
+
+/* Free what rcu_free_take() took: the grace period starts after that */
+static unsigned long rcu_free_flush(struct list_head *list)
+{
+	if (list_empty(list))
+		return 0;
+
+	synchronize_rcu_expedited();
+	return rcu_free_pages(list);
 }
 
 static void rcu_free_workfn(struct work_struct *work)
@@ -1374,17 +1401,48 @@ static void rcu_free_workfn(struct work_struct *work)
 	rcu_free_pages(&done);
 }
 
+static void rcu_free_expedite_workfn(struct work_struct *work)
+{
+	struct rcu_free_pcpu *r = container_of(work, struct rcu_free_pcpu,
+					       expedite);
+	LIST_HEAD(list);
+
+	spin_lock_irq(&r->lock);
+	rcu_free_take(r, &list);
+	spin_unlock_irq(&r->lock);
+
+	if (rcu_free_flush(&list))
+		count_vm_event(PGFREE_RCU_EXPEDITE);
+}
+
 static void rcu_free_defer(struct folio *folio)
 {
 	struct rcu_free_pcpu *r = raw_cpu_ptr(&rcu_free_pcpu);
 	struct zone *zone = folio_zone(folio);
+	unsigned long free, waiting;
 	unsigned long flags;
 
 	spin_lock_irqsave(&r->lock, flags);
 	__mod_zone_page_state(zone, NR_FREE_RCU_PAGES, folio_nr_pages(folio));
 	list_add_tail(&folio->lru, &r->pending);
+	r->nr_pending += folio_nr_pages(folio);
 	rcu_free_start(r);
 	spin_unlock_irqrestore(&r->lock, flags);
+
+	/* Unlocked: a stale count delays the expedite by one free */
+	if (data_race(r->nr_pending) <= RCU_FREE_EXPEDITE ||
+	    work_pending(&r->expedite))
+		return;
+
+	/*
+	 * An expedited grace period interrupts every CPU: only while the
+	 * zone is short of memory, or while more than an eighth of what it
+	 * has free waits here.
+	 */
+	free = zone_page_state(zone, NR_FREE_PAGES);
+	waiting = zone_page_state(zone, NR_FREE_RCU_PAGES);
+	if (free < high_wmark_pages(zone) || waiting > free / 8)
+		queue_work(rcu_free_wq, &r->expedite);
 }
 
 static void __init rcu_free_init(void)
@@ -1404,6 +1462,7 @@ static void __init rcu_free_init(void)
 		INIT_LIST_HEAD(&r->pending);
 		INIT_LIST_HEAD(&r->batch);
 		INIT_RCU_WORK(&r->rwork, rcu_free_workfn);
+		INIT_WORK(&r->expedite, rcu_free_expedite_workfn);
 	}
 }
 
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 64068d73d6d2..aa7280b5e69c 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1345,6 +1345,7 @@ const char * const vmstat_text[] = {
 	[I(PGDEACTIVATE)]			= "pgdeactivate",
 	[I(PGLAZYFREE)]				= "pglazyfree",
 	[I(PGFREE_RCU)]				= "pgfree_rcu",
+	[I(PGFREE_RCU_EXPEDITE)]		= "pgfree_rcu_expedite",
 
 	[I(PGFAULT)]				= "pgfault",
 	[I(PGMAJFAULT)]				= "pgmajfault",
-- 
2.54.0

