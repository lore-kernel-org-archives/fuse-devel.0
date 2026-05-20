Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56592212554
	for <fuse-devel@lists.linux.dev>; Wed, 20 May 2026 03:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779247092; cv=none; b=it/bunlH389VXowjvnOI6dcIgCQvMegUNY7N4yCv3JbhPkC+EB+EjcCrzOZD9W0amvLbR73IUs+KFDBILfupjyHRKuIHkNFeP8DWPnUqtqH6pJwinZkzHJsZdCOKWYJrpTqRDbmgegf12qlPDMB7p948fYf2NJhp0+rWlZ3wySI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779247092; c=relaxed/simple;
	bh=ZjBMnhwBC4dYQov25xYuJGFTvAhA+dbq5GOikamTsxA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QjvMOU5k4V96zoLCNW9n5ONOxopaYSaXuNEcPLeuh+8hqm2hA0XInDpuVGre/2TMgYGKE1qZflup6FHZhzAAWALDbqSOYJA5zsvJc9UUm6mDbrcpWrvvXTH4TubjWxhw+nyHcWgsSY/vSsYMCVDhirDhXkjhb/f+ygjx6PtQAcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8140417053fa11f1aa26b74ffac11d73-20260520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:66a0aa16-6971-4da0-86bb-85dd0ea7c0bd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:9a40d36b78919121663b9300498c577a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8140417053fa11f1aa26b74ffac11d73-20260520
X-User: jindongyang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jindongyang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 984749361; Wed, 20 May 2026 11:18:00 +0800
From: Dongyang Jin <jindongyang@kylinos.cn>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dongyang Jin <jindongyang@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] fuse: Use NULL instead of 0 for pointer
Date: Wed, 20 May 2026 11:17:55 +0800
Message-Id: <20260520031755.2637761-1-jindongyang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pointers should use NULL instead of explicit '0', as pointed out by sparse:

fs/fuse/dev.c:2151:48: Using plain integer as NULL pointer

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605071323.XbMBRsje-lkp@intel.com/
Signed-off-by: Dongyang Jin <jindongyang@kylinos.cn>
---
 fs/fuse/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index be4e66ed633c..6e5439515ead 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -2148,7 +2148,7 @@ void fuse_chan_abort(struct fuse_chan *fch, bool abort_with_err)
 		fch->connected = 0;
 		spin_unlock(&fch->bg_lock);
 
-		fuse_chan_set_initialized(fch, 0);
+		fuse_chan_set_initialized(fch, NULL);
 		list_for_each_entry(fud, &fch->devices, entry) {
 			struct fuse_pqueue *fpq = &fud->pq;
 
-- 
2.25.1

