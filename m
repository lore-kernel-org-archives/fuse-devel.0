Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B1051120B
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 23:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293360; cv=none; b=H1YBlcJUKKHs+O+7gOMTK4carSyh+x62dCD4+NrykV+5jEQL+uLodEJWM9d0IhCvA37EWNF1Gg/s/22z942aryNsrqH9quxmpUSu33c4EC41TaOfwBj+tiSobd+9o+Aicd1GmmwI1w1gBiG0f94Bb/vPCEfZMvtbOe9bLc+Zjvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293360; c=relaxed/simple;
	bh=M0z1JCY0hKQ30hf6qGaQ8ZaEutPJR8AyX0o0aOQxvKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mM4JueqgkjDcgVcBMZ2Z88SuBscDNia4NNMWp1/mAYLGfSrAB9myPPbbIlIOCVtyHUtXYJqZzWzbS3m9ETzJDfERVUY0OZVu/BuQthfXiZte5uOdKWCTZUs5fd75A+OoU5yMsynP76SQyCBDMnOUaWCptZIymb2WFhivVSx3W+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Z8Jql7OG; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=UX3SfEin; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Z8Jql7OG";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="UX3SfEin"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMXqaT2469950
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 19:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=6TCa
	n+7XKf8kThtM9GoM7KKJ/B7qFfiyA5H9QrhRig0=; b=Z8Jql7OGw5OdFVySuXDt
	/AQ7UFOHDb71KWY5fsT9Ci6pbClozlBU+Fw9sWIN1rAqP9TuUIMzRtVbSiYYrHnn
	DtVkVW7rzFSyJMPeC7/SwmNK0QHOacQ8kkMWUUMcVGZOAYLzciLdqe7qppGkoLgu
	laERsOc4Zam4Y137bhAkDZnAL+xSoZYl/eMpouCpBADcl8dzyO2ysIqOjDcbCST9
	YmijqkHxVk1YmyNXfmAjUP4roMsWVjCKZKx7RKIxEZtPSmnun0m8UcDKxa+XXw62
	TezBa8qW+pAA82pCVmiEXTkd/YU54r6w+IPQaUpkk80YvOXXltbbnAgRlgMBMMKB
	gg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gwb86191m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 19:42:31 -0400 (EDT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so210833a12.1
        for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 16:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790293351; x=1790898151; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TCan+7XKf8kThtM9GoM7KKJ/B7qFfiyA5H9QrhRig0=;
        b=UX3SfEinU428763t6Dv2YL5L0JZUQr5JlX1Qfl6a1f8lAka3dlpS2wvG200p5oGupJ
         Xds1Yh1iO/w8Lr+5/pTaTvjlRNSvs6fskhgdio+hPVk0GYrsL7yIKscHIANkY6lfEFpb
         G7CPZH7LdWmgL5Kd1IAJ2nBLEszOqA/zbJEdk5BqnuEVius05+E4VLCBER1fy6L1HMQ2
         Ou2ElSFbhHPMggOv7D+pPSmNlh2i5nUGAQCMYYM7QUjtjZCM/6kCWUv00qD4Y8NmhPLE
         1nrMEqUnG6lwuMrOPWW/Uzpg6Tr/FPCTZFmFMxvO+wQqePQE10gyYm3GJCICGQ51rLhd
         jsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293351; x=1790898151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TCan+7XKf8kThtM9GoM7KKJ/B7qFfiyA5H9QrhRig0=;
        b=Uax1AWacoy8Je+b9+qn7kPlxbc+J6Wi8v3PgAADNRnmLGyOmhyApOGtQMX1CkB3v0T
         mxK2CcBEeHi7hXGkjEtD6bdJ0/zg2MS1Qqd2T0cvD2WBQsChWnXiDbucawhhISTeSZvI
         KrfrSGBYeLKIHV8Ky5fSSP97W6Q9gO+8mgza5iocZua2HZ4y7Na4qP4g2F2xDvLrymN1
         u6pyK9S9aBbXJcRDP3LXxA2ASAHKqssOZv8sYsJOyE48kecKwAumrV29BdXNOwN13INA
         F9DNvNQ891zCuSUY/8tsCn+seYhheYQ5RDejxe38DFTlptcRZjLmGZoChhOaRQnqasiZ
         Ah4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmWLn/ATxEPQRSMYvfwyqGogaLueuuIztz6Ejuowf2RmlI6X1CxGqMKj+fO2SFiatR3aUBD40lVv99@lists.linux.dev
X-Gm-Message-State: AFuF++luJje1E4E1iNfmLS6z7RRO8kufvYdxwy3kTyciBSzMbzWyxZ3h
	/u3xqqpoVsIzzgfJpaz9a/pmLd08/KafB5YVSxrURuVoJUa4J3F4crO5ZNwmo+PXyNgdLi0qf0Q
	7C6C2znpAXz6iXhDfUbB16s5POw1E0fXnoIgkoyqMMmI6rJEiSCoLbs/CslY=
X-Gm-Gg: AYBFou3RlkGCDZvyh2X1B4TyzDxQEGNeAo6P870C+C72/J9ujjxTdwa/djLguN6/peg
	RIu8vPAtsBHJzYZlLs/qTjcUPe7haGWqgOxwnkx72e5Ss+wTwp0k9OLDHsTAb1bYUkDyoMM27l5
	FHuw0YSmPOLOrEXFcrqSHCrmSP/b8na5JnrGxXiKxv4qLr5iRINN9uU6al6OxUgvqCyXOAbS0HR
	UzraaY5DP5pyl1K9csjRF6iJ3LJqd+9IQBhOoBKEUQzNmZw3WzS8Ky02ryBjZo2fYIsSZpMZwYk
	0iGQYwZCjjJvYGibzW0fv3mOrczIcxtzoWdjSAvRZopXSPWhvX5b5Olbz94Fwpe9FkaLEpIiPyy
	oC0WX5Cb2
X-Received: by 2002:a17:902:6b04:b0:2df:8e7d:f8f7 with SMTP id d9443c01a7336-2df8e7dfc64mr5379845ad.30.1790293351051;
        Thu, 24 Sep 2026 16:42:31 -0700 (PDT)
X-Received: by 2002:a17:902:6b04:b0:2df:8e7d:f8f7 with SMTP id d9443c01a7336-2df8e7dfc64mr5379735ad.30.1790293350445;
        Thu, 24 Sep 2026 16:42:30 -0700 (PDT)
Received: from [127.0.1.1] ([208.115.110.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fc2e5fsm2239605ad.5.2026.09.24.16.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:42:29 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 24 Sep 2026 19:42:16 -0400
Subject: [PATCH 1/2] fuse: convert fuse_add_dirent_to_cache() to use folios
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-fuse-readdir-folio-v1-1-8dd97e71c1cc@columbia.edu>
References: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
In-Reply-To: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790293339; l=2662;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=M0z1JCY0hKQ30hf6qGaQ8ZaEutPJR8AyX0o0aOQxvKA=;
 b=Q2uyVuqgXSmaGY/AwIsWfcmkr4r59/TP+N7CLOpgAbwLAJcTZSDnt49OaCnnPNvBzwzYwLAXa
 +NHl5pOEoNeCbkdELnpU6xPmNPwkLHVuzhOR/Qn0nPdBfHLJQcXurRm
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5NiBTYWx0ZWRfX5d+qEHOV5xiX
 0vnD9e7I90otWY2AVToN+Fl5XoaCz+Ij1SN7Xm7M+1PeI5E+yjsQ3zSSKZmHFTSKFY2KCwwu7RT
 O/rsoC5u9FCK7x7/fW/6Xyb5mo5eQ/znI+fZQitB/drFK245ij9e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5NiBTYWx0ZWRfXwpDtvWAnAN6R
 b1kqfy/pO3l46YQ7A8TgaPYeIA6LKu9AhQ8L7Xs0F57lEp3++CZBELkRIBnGGyEWRx9oK+ouUQj
 r72GzHUZj6KciaZHVAGnrr4EHbiMxSyFIHOLyDvdvoi7QdvU+K7URknh57HQwqEGs08sfXVafkT
 u/HZ00MRZDpoZHvo8z4S8fCfcNZuV7ejMztahgQRK3fhIj89WGhCch87bWfZog7bvdTyzd6Grzz
 UaEJ4B1VooEbUCC8Fcopj2DD6Udts8I/4vkqJOcfS7kxgiE1ZSCVuQqtGNhAT5hCN3nXIpAPe3Q
 V3j9EQ8ThNmpoxVRfGpa705oyGTcPz8wwarmOwhWCAwzGBv54ZGUDVKwOVC46q7LDGDJDZTk4Pv
 UX7pqV7NVDk212MDDACDdlYw0OXvnGLIFo7xpcik7mf9DZQSZROHbOeJQt6rZHF8/4HHFFQymLN
 fb2XMFuhLrNV7F6YcZA==
X-Authority-Analysis: v=2.4 cv=F6rC5ahN c=1 sm=1 tr=0 ts=6ab5b567 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=AP5Yue2pfywxtTblp62eJQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=u1sHAvkQqplEvoskXzMA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: lQXKjaRnAYzov939wRvTLI7FKSGm8WQk
X-Proofpoint-GUID: lQXKjaRnAYzov939wRvTLI7FKSGm8WQk
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11915
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=10 adultscore=0
 priorityscore=1501 impostorscore=10 clxscore=1011 suspectscore=0 bulkscore=10
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240096

Replace find_lock_page() and find_or_create_page() with
filemap_lock_folio() and filemap_grab_folio(), and switch the remaining
page helpers to their folio equivalents.

Each index of the readdir cache holds one page of dirents. fuse does not
enable large folios, so these folios are always a single page.

Also write the dirent with folio_fill_tail() and memcpy_to_folio()
instead of open-coding it.

This removes two hidden calls to compound_head() and one of the last
callers of find_lock_page().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/fuse/readdir.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 5ca87151d70d..e6b828eb41a5 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -34,11 +34,11 @@ static void fuse_add_dirent_to_cache(struct file *file,
 	struct fuse_inode *fi = get_fuse_inode(file_inode(file));
 	size_t reclen = FUSE_DIRENT_SIZE(dirent);
 	pgoff_t index;
-	struct page *page;
+	struct folio *folio;
 	loff_t size;
 	u64 version;
 	unsigned int offset;
-	void *addr;
+	size_t folio_offset;
 
 	/* Dirent doesn't fit in readdir cache page?  Skip caching. */
 	if (reclen > PAGE_SIZE)
@@ -64,13 +64,11 @@ static void fuse_add_dirent_to_cache(struct file *file,
 	}
 	spin_unlock(&fi->rdc.lock);
 
-	if (offset) {
-		page = find_lock_page(file->f_mapping, index);
-	} else {
-		page = find_or_create_page(file->f_mapping, index,
-					   mapping_gfp_mask(file->f_mapping));
-	}
-	if (!page)
+	if (offset)
+		folio = filemap_lock_folio(file->f_mapping, index);
+	else
+		folio = filemap_grab_folio(file->f_mapping, index);
+	if (IS_ERR(folio))
 		return;
 
 	spin_lock(&fi->rdc.lock);
@@ -79,19 +77,21 @@ static void fuse_add_dirent_to_cache(struct file *file,
 	    WARN_ON(fi->rdc.pos != pos))
 		goto unlock;
 
-	addr = kmap_local_page(page);
+	folio_offset = offset_in_folio(folio, (index << PAGE_SHIFT) + offset);
 	if (!offset) {
-		clear_page(addr);
-		SetPageUptodate(page);
+		folio_fill_tail(folio, folio_offset, (const char *)dirent,
+				reclen);
+		folio_mark_uptodate(folio);
+	} else {
+		memcpy_to_folio(folio, folio_offset, (const char *)dirent,
+				reclen);
 	}
-	memcpy(addr + offset, dirent, reclen);
-	kunmap_local(addr);
 	fi->rdc.size = (index << PAGE_SHIFT) + offset + reclen;
 	fi->rdc.pos = dirent->off;
 unlock:
 	spin_unlock(&fi->rdc.lock);
-	unlock_page(page);
-	put_page(page);
+	folio_unlock(folio);
+	folio_put(folio);
 }
 
 static void fuse_readdir_cache_end(struct file *file, loff_t pos)

-- 
2.39.5

