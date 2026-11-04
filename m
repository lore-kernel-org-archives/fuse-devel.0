Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797303;
	b=gg7CGnApb/+afHAFhP2D+50XEN/T7hE8K8/4ExDFZYSBBFFMHCpr8rJCCIDnWb+8+qtu
	 75sbfKzot380TIbjxxxS3qMbvZ2KMy3/oBOsZDIr3ulwRufi6TYqF0Ta2Bzwo5GQXKKo7
	 KEIfStsHrJPr9zqLBkO0/tuIf3epOV8lRRoqJBg9f71IdfCNa3Bc/BsL5BlKtbrEEcbaJ
	 yA5C4MPe28ykhg8XADh8B9Elben+AGtv2A2yzMLjpXx4CxE6SY313uDqvx0o0uNeNBa3c
	 iaU5b5JmTMeT9vqiI/HsGu+HwqnHItIYF5WwHJ2euCa6qSvWbsMOnobJOxKFtlfkA/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797303;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O/dxa82xWVm6PMFOoBLZfnKEj8mtykd0dOrhKJ+ZGuY=;
	b=I+xM9nA8v1N3anzYbX94ZFU4XY7rzJ7iRTCzpHFrdAd3+Ou8p1FTl2GSl7p/zXWXFOpM
	 EL2TkC2eb/w0uCHJ991P2ge2vv1dXULUuAgKnX+VbIxG5RfS5TNz0esGHE0KWcXfMDNeB
	 YYjNAhumrGRANKEkw4TMdIcfVOq9FtG9l5hnWS4jMFQlYHNBOtIlQqy8ZOaC/fB/LgNC8
	 svD8mgd+jgz3vzVFVtAjyJDOcq8cUiqAwCc0dcwhE2dn3B/NIAkglQPVg4ziCWcHH1Rm4
	 5UtvqKs+cdmlzUSS2D5/WrO20ttw9hQZWJkBaJ7+eQTbA8LK0gIhgmL7WIdhRrcsYZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kj8h01YM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D52606A32D
	for <fuse-devel@lists.linux.dev>; Wed,  4 Nov 2026 13:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kj8h01YM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B73F1F00A1D;
	Wed,  4 Nov 2026 13:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797302;
	bh=O/dxa82xWVm6PMFOoBLZfnKEj8mtykd0dOrhKJ+ZGuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kj8h01YMHVT7XPUbl54W9a+Cf9NnC3mkXY1i//tL2xAMm2zD9aatg4HZPm7QkL/Qn
	 lWfQpSSIBvn9+NIKtoOTzp+foBpgBYSDmroA9sDxSjRNAk2M5KfsQFXE3zuEvASHKi
	 D6BRxfUo7stWTmzfraDVHwhBzU8r6qP5m+HbdBIUl2krZTPJzmOHQrEeAU8c7aSTjy
	 wKa3HovZ3hGG2NUZYbpoK+NQHAqDJtv3/V2UK1drkUlYXgENsxd5qGIFo1sP6+HzTx
	 9WVE8EqWp9aCpe0rUUm9ywKJkTjjxZT8CthiNA52/YxZwDh6+cVvok28CYKjV6zGlQ
	 IrIKF86VeIVAA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.ams.internal (Postfix) with ESMTP id 18C311980052;
	Wed,  4 Nov 2026 08:01:35 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 04 Nov 2026 08:01:38 -0500
X-ME-Sender: <xms:rizramMhR3FwPI5-KuM6iDPnV3bRBUy9QeXTrkejJ4rRMuylCN58TQ>
    <xme:rizrar542OiBnGHAuFkdWIy8e2x7ol8kQCXnQx6wC2HaQ4DRLq4PQ8gJ06zgTsl-U
    _Ma_SIThk_Qxy2JzqsisrJZk5r99Js9PW844Dw6hrFURAc3ednGEsRn>
X-ME-Received: <xmr:rizraiY5lXWqOx8hhKxWSZ8JoEgRQ0MeeiV9MDKJXzghgWmQ1Jv_UTF9X2o>
X-ME-Proxy-Cause: dmFkZTGcnWxWNdwzviArTqwO8SleswujEAoF3G5cAnzgWuj9VIXYzVn8L/YtSSoCVpDQCx
    AFAjkaMBKJDECegKseyQPi3BoJ2ULdzgEWHQh0kOOdV3qcZ96T5qYw8zvnYBduU6y+7gOl
    ju1hRqdfaUd029Zpq0M1QKVfvNYpVJXA03mIXM/FVYF2n1TVZdGxcwDBil6kVRafbiJtv0
    QuPNDwYksKVrYzT4QGS7HIxmz8ayVgiPQk5G9zoQji1nSBMTr/zV+0QH6w0a9BT4L54N+d
    cRhB7KhKgiZgmWNJc1G8l9d+gvjQ75B75nEIsy2loqzEXGvtqjUcmfJ5UhZu2fDzNX4RXN
    Sos3iNNV9RQQ+6u4LQiUkpyMrihOoJ01WcTinUsG//G0WyVORGzl/J6YD9u3h+RbNhtPuK
    Fo53IOAMnXTw1Ofxe3I1lptXm4IL/KoDyapzPRkcOl6t9VEJnbx5PTZeXVFOelGmkmiMm9
    fdmKcVmV56TLAB4Vg7nKut/7z2cVFZF/tju/fjr23Njo7juq6GrcVzYUN5TcCWyd4E9zdi
    ZodfXYJg+CHnrHsD4BiEIUjvFnzurjL5k2LpqmWZNqI4QLawAlZOCj1IdOgA9oEt3zaM+h
    w2nWvBmvJsCpEGgu9fY+X7D0puSrcuRoICY+NZKENxCkPLVE2qppRUjbaBaQ
X-ME-Proxy: <xmx:rizrarEHAnpecQdYd6l_ChFGjfCsimVZBZes41VJIZ8nNTxERFIaZA>
    <xmx:rizrauJeS6DfQBn8GD_dijDgSBwrCvzCjm5f2GiHKIZWoCbMD1g8hQ>
    <xmx:rizraiesLrPteMRJHMkuAiPhBBXW0IZGSitpI51cZeyT9uWyCSG0RA>
    <xmx:rizrajacWYJ_3Pmq9yzbtS5qTw-3CspOaj5U9zZ0baQq1kf0hNYK9g>
    <xmx:rizran79poDBkQLiKB8Fk-xAqyX6OLWB3p-ubGRjRyYnUTLmi9-6cZbv>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 08:01:33 -0500 (EST)
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
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Harry Yoo <harry@kernel.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	"Liam R. Howlett" <liam@infradead.org>,
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
	"Paul E. McKenney" <paulmck@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kernel-team@meta.com,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [RFC PATCH v2 02/18] splice: don't steal page cache folios
Date: Wed,  4 Nov 2026 13:00:58 +0000
Message-ID: <20261104130118.2507513-3-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104130118.2507513-1-kas@kernel.org>
References: <20261104130118.2507513-1-kas@kernel.org>
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

PG_rcu_free holds back the reuse of a folio's memory until a grace
period after the folio is freed.  A stolen page cache pipe buffer is
reused without being freed: remove_mapping() takes the folio out of the
page cache and the caller keeps it.  fuse_try_move_folio() puts it into
a fuse file, where writes change it under a reader that found it before
the steal.

Drop ->try_steal from page_cache_pipe_buf_ops.  fuse_try_move_folio()
and virtio_console's pipe_to_sg() then copy, as they already do when
stealing fails.  SPLICE_F_MOVE from the page cache into a fuse file or
a virtio console now copies.

Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
[kas: rewrote the changelog]
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 fs/splice.c | 51 ---------------------------------------------------
 1 file changed, 51 deletions(-)

diff --git a/fs/splice.c b/fs/splice.c
index 9d8f63e2fd1a..0133c2348da0 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -55,56 +55,6 @@ static noinline void pipe_clear_nowait(struct file *file)
 	} while (!try_cmpxchg(&file->f_mode, &fmode, fmode & ~FMODE_NOWAIT));
 }
 
-/*
- * Attempt to steal a page from a pipe buffer. This should perhaps go into
- * a vm helper function, it's already simplified quite a bit by the
- * addition of remove_mapping(). If success is returned, the caller may
- * attempt to reuse this page for another destination.
- */
-static bool page_cache_pipe_buf_try_steal(struct pipe_inode_info *pipe,
-		struct pipe_buffer *buf)
-{
-	struct folio *folio = page_folio(buf->page);
-	struct address_space *mapping;
-
-	folio_lock(folio);
-
-	mapping = folio_mapping(folio);
-	if (mapping) {
-		WARN_ON(!folio_test_uptodate(folio));
-
-		/*
-		 * At least for ext2 with nobh option, we need to wait on
-		 * writeback completing on this folio, since we'll remove it
-		 * from the pagecache.  Otherwise truncate wont wait on the
-		 * folio, allowing the disk blocks to be reused by someone else
-		 * before we actually wrote our data to them. fs corruption
-		 * ensues.
-		 */
-		folio_wait_writeback(folio);
-
-		if (!filemap_release_folio(folio, GFP_KERNEL))
-			goto out_unlock;
-
-		/*
-		 * If we succeeded in removing the mapping, set LRU flag
-		 * and return good.
-		 */
-		if (remove_mapping(mapping, folio)) {
-			buf->flags |= PIPE_BUF_FLAG_LRU;
-			return true;
-		}
-	}
-
-	/*
-	 * Raced with truncate or failed to remove folio from current
-	 * address space, unlock and return failure.
-	 */
-out_unlock:
-	folio_unlock(folio);
-	return false;
-}
-
 static void page_cache_pipe_buf_release(struct pipe_inode_info *pipe,
 					struct pipe_buffer *buf)
 {
@@ -155,7 +105,6 @@ static int page_cache_pipe_buf_confirm(struct pipe_inode_info *pipe,
 const struct pipe_buf_operations page_cache_pipe_buf_ops = {
 	.confirm	= page_cache_pipe_buf_confirm,
 	.release	= page_cache_pipe_buf_release,
-	.try_steal	= page_cache_pipe_buf_try_steal,
 	.get		= generic_pipe_buf_get,
 };
 
-- 
2.54.0

