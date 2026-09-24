Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AF0519DE7
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 23:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293362; cv=none; b=aCM5vwRdjieJ1xymAT02HsXTYFUnc4Ji9gjiDOoZqIo2LxZc4fwnOrX9gTShm6tY3tRdXZPSnYF3wfw7F3tXnFKwlFHPBZzvhlde1XWgc6Rhpfk7IV7ifIcvrOiE5l6T4/if75mMZ+yV3j6cJ4YWwt72aQrXrmTgXKV8OJKsEPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293362; c=relaxed/simple;
	bh=XCd/EXrFmFVFNdHJdolFqfiKIkTkg5kCZkDjHJUVVxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jyueWiU3g5NfxeBuY/E+Tn74tmJLTyge2vOdjKjtNbJiVABh2627J+jNZZLROHqx00axagIXb3ZjsEMjBAVS5T0AUbu7nfq5ocg0ehpl9CECLrVuuxUmhiQaUMpji90PP7MPeKWz+eaEnhTBOWLuX3KVLLCviXhDzrR1viz9oHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ZDcKAs5r; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Cm8hKvje; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ZDcKAs5r";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Cm8hKvje"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMXvLo916232
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 19:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=1W8F
	0tnaOtUsZa7C8naFnLEhuPz2zI+t5temLbb6h84=; b=ZDcKAs5rEPRehiRI6EC5
	SH5pomBGrSvHTOK7zzKw9fLnm8wVE3AoqIhD/Wd0ed9N9fwqRtWY+UNAnRt9k7Je
	fN5/lY1J3n7xVMpSErmL1JoJ9KrWaap/IEKDvqwzwmgSf8ChzKpQTFjn7hoiy/ZQ
	D0JAcTAJvTrV2AMEpyOFttL6o4CgwxieOoVoQsFMU29I0/YJlacSENGMR7UGf7uQ
	fLn2lcMFcbF/vHylpUC1T1gk2d85aR65VI8wJvANXVYJAHOsc6NHr5NiW3ZTa9YF
	hwgHdN4i3Yzx0DIpbFrT4VvlfsSU0ZXIAlZgHBYdpgdo9oPVLZmNwuKdTH6yzQmQ
	jw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gw9vea2va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 19:42:35 -0400 (EDT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d02df2bf09so1935725ad.0
        for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 16:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790293355; x=1790898155; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1W8F0tnaOtUsZa7C8naFnLEhuPz2zI+t5temLbb6h84=;
        b=Cm8hKvje17LDlqm1L8CAPTeoHx4ByHjoPXmdgl+rZR1RrK9f8QPKLmHae/+nzBJCzi
         1PPHj3gXbvTP8nAVRO5Q+0/g3/aU/h6mJO0BvFwYxWsfdIhwJDkvOsfg2T1TGMbl1bdQ
         s9H5b6aQXBXufUoKxKnjD4OupoXiVhPu6Cye/H+VdvjJWjrvuqrj/filVRrFSrZxAQMo
         tjnnzZ0G13Yv0SOVZhI5Nvl8kdm3Gy+TZTgZ3vkc1c+me3WZg5Ky0vZQnMyzxTCiFE8i
         EjXfAoELrQBeApxgSQ9afATgkAjHZz36M056Ba4DjS14nk3NLwr4me4Ob1ofXvcmOWkV
         MQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293355; x=1790898155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1W8F0tnaOtUsZa7C8naFnLEhuPz2zI+t5temLbb6h84=;
        b=fV3MwW1dj3eR6+f2gAE9X9eXoVmBjKDL24T/+QvmfGfyhtOZeuSPc6edRgqB/68tP9
         FwsJjfPxeLptOm4wA9uOh3o17tnUoeMJeOlwfrSVChJX0X2qwumzdxARTREjs2uUpDL1
         Z4H+jEHv7SmV1wUFmWYg7bAvcBU32AkPmxESge/h8bIuvYwN53y/EJethNlapGRE4lum
         u8oMiS7Cizhne2pdsf+mQcsuDTrlGnmbItXOHCbEKtQ9srOxKvqJ1uochbKNAc8pGxU5
         8abKYJ3VpA6CK/WWu5+5Xpwkp5vVkfRR89BJzJA9PtoCJwuwS39Oarkcj8hzwid9OpRu
         W8CQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpszrM8a3OMOzxLpLpOavYdh+qxa+aji/kzS+4gZLV7KulnkeVSjrRGgm0iSRK02dAqGOxnBbAEjqv@lists.linux.dev
X-Gm-Message-State: AFuF++kqnq7g+eJcMC+mmGhlcavTwuLaX+nhwUmIkm3j25/cBI0a17dR
	DnuO4OHroXqTYDmYPrWlOG+ihq0wcjBuskjoBlWadlCcVjYNWBH7ItOTsi/VJDLH6vlZyXGwKOi
	WO6N+xhgTrEnUAhh3/JwVmR8cU7uvCSB4DANmo9YA5LYFt3pypyNw34C4ajM=
X-Gm-Gg: AYBFou3y5RLNeNFRwX2zRje8yTKtKmECT4vN6dh2kikJaWilFewKhA/1M6BMYZmt0zh
	57UJSl2qoYL8XXSlwr8Zp7abS4hByeWv9PlMZPGx7pt3nOtHTe+6XpHUHkrJHpdgWNbH1wkLLtq
	SWdgsFN3RNBzuQEPyUBClDnHHh/+UO0Gb/u4Iu5cZTxPskllaL5lOK/shy8x18BHk/awWFGo4qn
	I3PbNaSMUWsaVn980f110Ng5EX+yNHguOqc9bQe+NJ9Z7J4P5a+iy9SepHKmTP55W8qrVeHqVnT
	juDe72sgKWZBBLILiNuCcWwCznweqBXGKEKhEhWoNy48mHrCma93nipWj9szbvKimD3YD7gWyBc
	ptejkXGts
X-Received: by 2002:a17:902:e54e:b0:2df:8d19:4fd6 with SMTP id d9443c01a7336-2df8d195231mr14350705ad.1.1790293354908;
        Thu, 24 Sep 2026 16:42:34 -0700 (PDT)
X-Received: by 2002:a17:902:e54e:b0:2df:8d19:4fd6 with SMTP id d9443c01a7336-2df8d195231mr14350565ad.1.1790293354338;
        Thu, 24 Sep 2026 16:42:34 -0700 (PDT)
Received: from [127.0.1.1] ([208.115.110.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fc2e5fsm2239605ad.5.2026.09.24.16.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:42:33 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 24 Sep 2026 19:42:17 -0400
Subject: [PATCH 2/2] fuse: convert fuse_readdir_cached() to use folios
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-fuse-readdir-folio-v1-2-8dd97e71c1cc@columbia.edu>
References: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
In-Reply-To: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790293339; l=2723;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=XCd/EXrFmFVFNdHJdolFqfiKIkTkg5kCZkDjHJUVVxs=;
 b=qj0VabmVO0Fh8bfnWzyDw8KfPvG5Iph/+qlrfsMnDKdCepaL/Y3lJ9jnXKhmWi67ggghjOtfO
 BT4FWElodnaAlJplzRQnehsh0s0BTg7NzgZKEDolDEfdjKi7FvDiZIn
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5NiBTYWx0ZWRfX82v6gOjcqoYJ
 IJ0RFXSfqLq4olzs9W3K/uEF/HhnaFPA+vdkRydGEn134R6dP6LMrMdbosGUKC1lwKA0wa3mCxg
 xqy3jH8DtRZ0dMHBPuuftKM5K7OcAg1dLG7rjrLxKXUUbnLk6cQY
X-Proofpoint-GUID: CYFm9dyE_YEjKtmU2NYCIkS2xxasKHub
X-Authority-Analysis: v=2.4 cv=UIFIjyfy c=1 sm=1 tr=0 ts=6ab5b56b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=AP5Yue2pfywxtTblp62eJQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=zMwUTx3Gsv8PcE88Lp4A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5NiBTYWx0ZWRfX3xUV72y4FcF6
 3wK+j1DCzf4UYMjUmm+u6qucaRb84tna09xQWaqtnnhLYGY5lAArgMJar7cplk5x9uXZim9A2hN
 Og1sVbKfaodx5Iu0lNxkLpkIbr4RPrngezH5Zx7OPkS59FCNnLmJ8E9QcdBuNZImpstKq5pzuaj
 QC93ua7Ig/kuoGH9OTVwLV0W0pg5Y++wIrAiuxZT+13FhFcxR9diOmb93kWivEGcq+h2P5u+oo/
 9hA4pcFx+0KjIkQ+/ZQ3GyAaadBdY7dPY+FCCUfL8718hbhx2EbOvDOQwaYKZnj4pqXstb3SypY
 BySeRaadez+h+TzMd/6CYhzb+JX5/VvB/amiFDqLgw1H6AGL3EU5/u2OqRsEw94Vi6LT4SALsil
 aKL5+Jh+RJuA8jWKDTojW0Ubtgdkj8po5QbPpl5o6abUYisGvMehaDk9MmmpJzanRo4KwGTHT7+
 F6NArWTFo92kDlbl3Ow==
X-Proofpoint-ORIG-GUID: CYFm9dyE_YEjKtmU2NYCIkS2xxasKHub
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11915
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=10
 adultscore=0 bulkscore=10 phishscore=0 clxscore=1011 suspectscore=0
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240096

Replace find_get_page_flags() with __filemap_get_folio(), and switch the
remaining page helpers to their folio equivalents.

This removes seven hidden calls to compound_head() and the last caller of
find_get_page_flags().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/fuse/readdir.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index e6b828eb41a5..5e6b3f574e90 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -502,7 +502,7 @@ static int fuse_readdir_cached(struct file *file, struct dir_context *ctx)
 	enum fuse_parse_result res;
 	pgoff_t index;
 	unsigned int size;
-	struct page *page;
+	struct folio *folio;
 	void *addr;
 
 	/* Seeked?  If so, reset the cache stream */
@@ -580,42 +580,44 @@ static int fuse_readdir_cached(struct file *file, struct dir_context *ctx)
 	if (offset_in_page(ff->readdir.cache_off) == size)
 		return 0;
 
-	page = find_get_page_flags(file->f_mapping, index,
-				   FGP_ACCESSED | FGP_LOCK);
-	/* Page gone missing, then re-added to cache, but not initialized? */
-	if (page && !PageUptodate(page)) {
-		unlock_page(page);
-		put_page(page);
-		page = NULL;
+	folio = __filemap_get_folio(file->f_mapping, index,
+				    FGP_ACCESSED | FGP_LOCK, 0);
+	if (IS_ERR(folio))
+		folio = NULL;
+	/* Folio gone missing, then re-added to cache, but not initialized? */
+	if (folio && !folio_test_uptodate(folio)) {
+		folio_unlock(folio);
+		folio_put(folio);
+		folio = NULL;
 	}
 	spin_lock(&fi->rdc.lock);
-	if (!page) {
+	if (!folio) {
 		/*
-		 * Uh-oh: page gone missing, cache is useless
+		 * Uh-oh: folio gone missing, cache is useless
 		 */
 		if (fi->rdc.version == ff->readdir.version)
 			fuse_rdc_reset(inode);
 		goto retry_locked;
 	}
 
-	/* Make sure it's still the same version after getting the page. */
+	/* Make sure it's still the same version after getting the folio. */
 	if (ff->readdir.version != fi->rdc.version) {
 		spin_unlock(&fi->rdc.lock);
-		unlock_page(page);
-		put_page(page);
+		folio_unlock(folio);
+		folio_put(folio);
 		goto retry;
 	}
 	spin_unlock(&fi->rdc.lock);
 
 	/*
-	 * Contents of the page are now protected against changing by holding
-	 * the page lock.
+	 * Contents of the folio are now protected against changing by holding
+	 * the folio lock.
 	 */
-	addr = kmap_local_page(page);
+	addr = kmap_local_folio(folio, 0);
 	res = fuse_parse_cache(ff, addr, size, ctx);
 	kunmap_local(addr);
-	unlock_page(page);
-	put_page(page);
+	folio_unlock(folio);
+	folio_put(folio);
 
 	if (res == FOUND_ERR)
 		return -EIO;

-- 
2.39.5

