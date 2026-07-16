Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70E13CB2FD
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194863; cv=none; b=bkhHm2oqBE5jg1kDHvxF35SQ4Uf+/rFoGuSSJFS1Dcjx1+bMxLvQMqtCTHYHhxHAtFaB11Z/PwRvSO+Mip3L5QDokf35Q7nlA2JYDQLE5vxsBbz9FD6rO1qrInwtpPAlM1ggp/+sS9W4WUMy/RFpZjpj37X4AMsvOKRX+zddZMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194863; c=relaxed/simple;
	bh=sxHSu0SbBwNDlwewl/H7JI02bAeELrcLbqOYcbCq42I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hffX1GRCF3GO93cMrmItIsEDLToscoWSqOvnisIfH0wrML4FGmcDgDFQQ9T6Djpg85A2AsI/xjhHgu0avEsmiPCgbYGvWfhrIv3yQhyHqJ+w22rycYRKRJS+SHPzY9n6sVHQAAiQPyYwjm6qx2tr5rXmUwwf8vYuYehQr6K3lj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7121c95880fa11f1aa26b74ffac11d73-20260716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:bf798ebb-e188-4b66-a892-393725bd79e6,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:d885b89beae74c2f9ed64c36eb237b87,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7121c95880fa11f1aa26b74ffac11d73-20260716
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 260779895; Thu, 16 Jul 2026 17:40:55 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joannelkoong@gmail.com,
	djwong@kernel.org,
	brauner@kernel.org,
	Haofeng Li <lihaofeng@kylinos.cn>
Subject: [PATCH] fuse: honor desc offset in readahead reads
Date: Thu, 16 Jul 2026 17:40:51 +0800
Message-Id: <20260716094051.412616-1-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_handle_readahead records non-zero descs[].offset when
iomap skips leading uptodate blocks in a folio, but
fuse_send_readpages built FUSE_READ from folio_pos() alone.
The reply was still copied at descs[0].offset, so wrong
file data was placed into the page cache.

Add descs[0].offset to the request position. Apply the
same correction in fuse_short_read for EOF size updates.

Fixes: 4ea907108a5c ("fuse: use iomap for readahead")
Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 fs/fuse/file.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index ceada75310b8..11272983c991 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -836,7 +836,8 @@ static void fuse_short_read(struct inode *inode, u64 attr_ver, size_t num_read,
 	 * reached the client fs yet.  So the hole is not present there.
 	 */
 	if (!fc->writeback_cache) {
-		loff_t pos = folio_pos(ap->folios[0]) + num_read;
+		loff_t pos = folio_pos(ap->folios[0]) +
+			     ap->descs[0].offset + num_read;
 		fuse_read_update_size(inode, pos, attr_ver);
 	}
 }
@@ -1057,7 +1058,8 @@ static void fuse_send_readpages(struct fuse_io_args *ia, struct file *file,
 	struct fuse_file *ff = file->private_data;
 	struct fuse_mount *fm = ff->fm;
 	struct fuse_args_pages *ap = &ia->ap;
-	loff_t pos = folio_pos(ap->folios[0]);
+	loff_t pos = folio_pos(ap->folios[0]) +
+		     ap->descs[0].offset;
 	ssize_t res;
 	int err;
 
-- 
2.25.1

