Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707781;
	b=jgQd1x49O1aF6al44bOmNWQ8kHr9n/5v3gi7iy2PeSNgVpFezrlSe+GlcQ4I7P1SeqiW
	 vK5aha88V07Is5NsRfJqQ0QMJYInMfDqeAYL1aWGWfmSKINMU7Y7rnYwLcfkH9v8V15xK
	 4w/nRsn84jKb0McEdeHUkARsUjeA1SFUQFXcVS339Kxe3tq77pfIwMfBXdrAbqa/3nzDn
	 i4K88Jw39qtFWxPiAwbl9avGHt8PH9F5r5A1AjVwdzPUsRr02XFiYQc1Sm96Bvq97/ySL
	 QZQ+Agf9VkLqR0oevfzoozzAMCkevMP2kdPfGqghwJvrZLa/FjLyq+cwADFqydNC7zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707781;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=QhoKjPnHiUbMdA1MWfT8w2f75q9tWZoXj5wagtPE6y8=;
	b=3JPKcpU/Z+f2xvh6+7vj76qXJbbKtE8ckcQD5YTM9C9K0RVuHjBHV4zNLb+J+FrmgXXQ
	 N9jE8FZ4A1+/JSXCZUO8dJNlTfDdC50EPRVldzshYA4T1zcigGNrqkOhI0OJBRLVaQiwG
	 b27dhehxvQgs4Cx0ziUf4857wBtdvJrDaI0AQrucCEO4rYC+ACmnY/kwrWYJS08vF883R
	 er+/N1KH3KImoeQzNsU74+EBP2ALaw7Cy2LO3inO+oRa35yo7pxhZUYh0deJ/C0kccQln
	 uQg//Z0xcqNOyo6OmcPef5naEsxwwHjMZ3Ii2Xo4icnzeWKMZP1Qm6ksiYbe9LPa9DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=X9zk8A8O;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7287606A321
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 15:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7287606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=X9zk8A8O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=QhoKjPnHiUbMdA1MWfT8w2f75q9tWZoXj5wagtPE6y8=;
	t=1795707779; x=2111067779; b=X9zk8A8OgU9ph+TwxEA31MDLEb0gRXTNW6m+nWhakl16vy0
	xBumUJjjsLhwtR1haBbVvfxJVxASaJOHuX6kXM+5bIZXMeKd0mhQ/bN4eXvlD/5iC2nJx5p5zJSMS
	wObIwUFp6k4zXi8Yev4d5eMRw1SR+HfImc0ZCzjqV2rC6z+QWpT2H3YPs8Wq3GcsmAIxBHs+/YHvA
	IOjNsVZ/bGjPhKsFjMAhDio+uTpPNQp1Aq8/zl9KZuf1QL9RBdinP9INUlzWERfGmM2wmPupLuYFO
	IDk97t0qyWGJiUKy/iHfiH6x7Lo7sccIjYsyaNm4F+gcPXIfl5Udj2O8KPyuhRKQ==;
Received: from bl17-56-70.dsl.telepac.pt ([188.82.56.70] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xWbcd-00000004Saq-1OKr;
	Thu, 26 Nov 2026 16:42:55 +0100
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Andrew Morton <akpm@linux-foundation.org>,
	NeilBrown <neil@brown.name>
Cc: fuse-devel@lists.linux.dev,
	Matt Harvey <mharvey@jumptrading.com>,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [PATCH] fuse: fix async readahead check during congestion
Date: Thu, 26 Nov 2026 15:42:51 +0000
Message-ID: <20261126154251.11148-1-luis@igalia.com>
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

When performing readahead, the page set being read is divided in two:

  * A set of 'sync' pages, which filesystems will try to read, and
  * A set of 'async' pages, which the filesystems may decide to skip.

However, there's a change that the initial readahead pageset is split into
two or more requests to the filesystems if a page within that set is
already cached (for example, if two different processes are doing
concurrent reads on the same inode).

When there are too many background requests during a readahead, FUSE may
decide to stop sending reads if all the sync pages have been handled
already (i.e. if we're sending requests for the async page set).

However, the test to check if a page is already in the async set is not
correct when the initial readahead has been split.  The problem is that in
the second call into the filesystem the readahead_count() function returns
the correct number of pages for the *this* request, but the ra->async_size
will still refer to the *whole* (non-split) request.

Fix the problem by using the current readahead request index position
within the page set instead of the number of pages in the request.

Fixes: 670d21c6e17f ("fuse: remove reliance on bdi congestion")
Signed-off-by: Luis Henriques <luis@igalia.com>
---
Hi!

This patch was the result of my digestion of some AI-generated outputs I
received.  I believe the bug reported is real, it's just that the error
isn't fatal -- in some cases readahead is throttled unnecessarily, and
performance may be impacted.

Hopefully I'm not missing any details that may have impact elsewhere.

Cheers,
-- 
Luis

 fs/fuse/file.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 993a1d2b3151..9e1cc011c413 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -947,6 +947,21 @@ struct fuse_fill_read_data {
 	unsigned int nr_bytes;
 };
 
+/*
+ * This function checks whether the index is within the async part of the
+ * readahead window:
+ *
+ * |<---------- ra->size ---------->|
+ * ^             |<-- async_size -->|
+ * |
+ * ra->start
+ */
+static bool fuse_ra_is_async(struct file_ra_state *ra, pgoff_t index)
+{
+	return ra->async_size && index < ra->start + ra->size &&
+		index >= ra->start + ra->size - ra->async_size;
+}
+
 /* forward declarations */
 static bool fuse_folios_need_send(struct fuse_conn *fc, loff_t pos,
 				  unsigned len, struct fuse_args_pages *ap,
@@ -975,7 +990,7 @@ static int fuse_handle_readahead(struct folio *folio,
 	}
 	if (!ia) {
 		if (fuse_chan_num_background(fc->chan) >= fc->congestion_threshold &&
-		    rac->ra->async_size >= readahead_count(rac))
+		    fuse_ra_is_async(rac->ra, readahead_index(rac)))
 			/*
 			 * Congested and only async pages left, so skip the
 			 * rest.
