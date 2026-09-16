Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5084D5994
	for <fuse-devel@lists.linux.dev>; Wed, 16 Sep 2026 18:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789584302; cv=none; b=aFor1897hvp3GNJxP8mkpJfM9YrVfPb1DleleYvbe3+O+8O6CGOYg35Wfo5TwQn/4oLz+3l9kuNqgnXU+psJBsaHESKHdkNrmnO6POWDgGdT8kvU/ve9ia/Z7HZF/rlRo8fHAaUXyABQ+4PkndRBT8QTZyhld3hsWGP7m/k7+/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789584302; c=relaxed/simple;
	bh=Wi7pnoycbgxmDBtAe9zf848xA4iD3h65TyuHWYJ6Xk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dBc7XP2F27vYOw1e2DpJsCJC+hWFoYmiWzs7Zge/xlNWHba9o/V3uzHB9YsEoKWz7o3RAPpXt+84rD2ug/m1sZEuox/Uh7MvJgti300ee237j4RmK3UQgNQ0JHW5E9FIkn3vGUlMtVtaFwOD/Lh9LvthyI+VsSda9+7Jaw6J+2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQ3PLySZ; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQ3PLySZ"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6b1ae736c63so1000390eaf.1
        for <fuse-devel@lists.linux.dev>; Wed, 16 Sep 2026 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789584282; x=1790189082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ezb4FvlUcLxSnlqMMsz3FPnCFFDMFmJDfUvMk49jk60=;
        b=MQ3PLySZi7UyqzoLnNh+Li5Jo3IZWlfwZ8r4mX0O29rRSCKsFua8X2VshrnGB7wohw
         7UsFHS9o+EC0WBt9HK71EUTps4hi7/wttYoSykfZSLspNMuDm+Jd1tUBmy2KNZ+n4X9B
         R5ZUAAzwA771QDxhEn7jzS3RfG1eeRX188Ap/7Lxwof4gzh5gSTCwiLIkcUsgqQnDdPn
         eajDmDeDUidfP1mpYM550CeWpfBwJC6adT1GxJ9rtbS7Vvm9Q81DNsc8OOgwgawCLbjV
         DY31+WaTzTy4UgXPiWSGVqXV79UgZMwyiJRn+oN73OINqoAuQcWYR4pob16+GNA7u4Ce
         IcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789584282; x=1790189082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ezb4FvlUcLxSnlqMMsz3FPnCFFDMFmJDfUvMk49jk60=;
        b=PF3D99IeWRd5Us6eNLzmHdwS+z8h7sWuGNWnSfG7F7evxdZsgmKx+7variaNoHmuoa
         dm4K+Fr8jbiy9u6ESF+9JZV6RD/cPMq314ZzfTaITHVyovnmMpAiYuDRlYdJ9ngCLXpH
         Fza3DM1Z6C1lgPK7CYqlTUFK3isOtMLtkaXm1Dxk9JtJj9ClfCrZ858WFzwApeohqmw3
         wK+ndhGg+kODOhOUgIJ7GWEeHIENts0Myfq6o93HV9JbbThw081NDqjMPxTYeDuGDhGO
         EIdgnskOCsl8jxyp1utsSZPfwtO/DadK1vNvBeXGeNxmMc6eLN7iHFpYywe5wkBT8dFa
         gdWQ==
X-Gm-Message-State: AFuF++kwKgpVWnt/yihA+UCCLOnTxkr8wACdE/fb6NWVUMSO1BacEkEU
	+9SYZVCG/lviuF09yGKKqATlXMKJ5AwxsS3KGqaBznUIiBLkHEJDkLvM
X-Gm-Gg: AYBFou0bJ9C9/IEOlJaohm4xxt4XIZ7esNOqgVxGS1yPRpnqXmna8g6sflyHZAoZQJp
	VxrhLdRmvHBym4xwWzjSdK5VkRHHIikJoluecj3xGVHZAJPdKmptqflOZ65Vzn6pdm80weLEUct
	3XLEgiLV4N8N8GQkKt7LeOcPm0tubUwVS87Ms3EIJSOZ1xRlom3z5RJqU7Qp/Z1XGkUvuymg69H
	HPFaUE8+zOPim8hdpmEsiNVc6iHQAAE41BPJl7rCIq562svW0Qg22IU9KO8cnNzOIFUVxb2ZBdd
	nYF/1LzKnXtwffxHnZGV3TFPEBE4s1j0z0yy7D6VdrvYZmHOEj2X8SlbMHFrUa/nM/28MI8Qbs7
	L9FGyZj2YserK+JTsnrooTgKUBH/N38vEnBaag8MXgHeeoo9kkmlBZn9mmhTrKvEF2IW9GrC9oj
	aJXlQa18hxRVikM4bZ+gkJFQ3ye6CSZ4xpF5P/2gmanFgDrV7Hqf6MlTOr/0GQ9SIdR5HluIW6G
	DaDB26dYMsm0/BggabZd/xuv9Sp8qxIsmLpZVuK5SQexZSFxuw=
X-Received: by 2002:a05:6820:160a:b0:6b8:319b:9e1f with SMTP id 006d021491bc7-6c7d04f2cbdmr3798206eaf.5.1789584282146;
        Wed, 16 Sep 2026 11:44:42 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:43::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c8f3c81e40sm748665eaf.1.2026.09.16.11.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:44:40 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	Horst Birthelmer <hbirthelmer@ddn.com>,
	Jingbo Xu <jefflexu@linux.alibaba.com>
Subject: [PATCH v2] fuse: enable large folios
Date: Wed, 16 Sep 2026 11:44:24 -0700
Message-ID: <20260916184424.2531648-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable large folios, capping the max order at the largest request fuse
can issue, so a folio always fits within a single request. The order
range minimum is 0, so under memory pressure the allocator falls back to
smaller folios.

Benchmarks (libfuse passthrough_hp, buffered fio, single job, 4 GiB
file, medians, NUMA-pinned, performance governor, strictlimiting on by
default):

tmpfs backing (page-cache bound):
  workload          bs      large folios off   on        delta
  seq read,  cold,  128k    3110 MiB/s    4514 MiB/s     +45%
  seq read,  cold,  1M      3079 MiB/s    5181 MiB/s     +68%
  seq read,  warm,  128k    2438 MiB/s    4486 MiB/s     +84%
  seq read,  warm,  1M      2403 MiB/s    5123 MiB/s    +113%
  writeback write, seq,128k 1211 MiB/s    1699 MiB/s     +40%
  writeback write, seq, 1M  1462 MiB/s    2208 MiB/s     +51%
  writeback write, rand,128k 1101 MiB/s   1757 MiB/s     +60% +
  writeback write, rand, 1M 1284 MiB/s    2228 MiB/s     +74% +

xfs on NVMe backing (device bound for cold I/O):
  workload          bs      large folios off   on        delta
  seq read,  cold,  128k    2030 MiB/s    2172 MiB/s      +7% *
  seq read,  cold,  1M      1999 MiB/s    2181 MiB/s      +9% *
  seq read,  warm,  128k    2451 MiB/s    4939 MiB/s    +101%
  seq read,  warm,  1M      2340 MiB/s    5639 MiB/s    +141%
  writeback write, seq,128k  637 MiB/s     747 MiB/s     +17% *
  writeback write, seq, 1M   694 MiB/s     833 MiB/s     +20% *
  writeback write, rand,128k 1004 MiB/s   1648 MiB/s     +64% +
  writeback write, rand, 1M 1171 MiB/s    2055 MiB/s     +75% +

(*) device-bandwidth bound. Not much throughput gain but system cpu
utilization was roughly halved
(+) random write was tested as an overwrite of a hot region (under
writeback, this is page-cache bound, so the gain comes from lower
per-folio cpu overhead rather than higher backing-device throughput)

Random reads (4k and 128k) and writethrough writes were neutral with
no regression (no read-modify-write or read-amplification penalty from
large folios)

More information about the benchmark setup and results are in
https://github.com/joannekoong/linux/commits/fuse_large_folios_benchmarks/

Reviewed-By: Horst Birthelmer <hbirthelmer@ddn.com>
Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
This is targeting the 7.4 merge window. It has a dependency on these two
patchsets:
fuse iomap fixups: https://lore.kernel.org/fuse-devel/20260904045651.1442505-1-joannelkoong@gmail.com/T/#t
prep patches: https://lore.kernel.org/fuse-devel/20260916010526.1318891-1-joannelkoong@gmail.com/T/#t

v1: https://lore.kernel.org/fuse-devel/20260624012132.1719941-1-joannelkoong@gmail.com/
v1 -> v2:
  * use min3() helper, add comment, rename var

 fs/fuse/file.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 8083404f4cbc..cd1fc4f32c93 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -3140,6 +3140,7 @@ void fuse_init_file_inode(struct inode *inode, unsigned int flags)
 {
 	struct fuse_inode *fi = get_fuse_inode(inode);
 	struct fuse_conn *fc = get_fuse_conn(inode);
+	unsigned max_folio_pages;
 
 	inode->i_fop = &fuse_file_operations;
 	inode->i_data.a_ops = &fuse_file_aops;
@@ -3155,4 +3156,18 @@ void fuse_init_file_inode(struct inode *inode, unsigned int flags)
 
 	if (IS_ENABLED(CONFIG_FUSE_DAX))
 		fuse_dax_inode_init(inode, flags);
+
+	if (FUSE_IS_DAX(inode))
+		return;
+
+	/*
+	 * A folio is never split across requests so cap the order so that one
+	 * always fits in a single request.
+	 */
+	max_folio_pages = min3(fc->max_write >> PAGE_SHIFT,
+			       fc->max_read >> PAGE_SHIFT, fc->max_pages);
+
+	if (max_folio_pages)
+		mapping_set_folio_order_range(inode->i_mapping, 0,
+					      ilog2(max_folio_pages));
 }
-- 
2.52.0

