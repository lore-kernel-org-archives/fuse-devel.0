Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4781BC2C8
	for <fuse-devel@lists.linux.dev>; Wed, 16 Sep 2026 01:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520746; cv=none; b=HpcAlgeeMoDMTEEVIETYshzudbk1uGj8AwzX9QaGX0nRtk+UkGPLG1zROVaB78EGKIT3Vf2XwtwkvRCELJN9EfTCwnnjyCHEcGhIqhdtQeN6VOW+nFmXAkAfbMxPm7XwkWl2/1l5yRrTLEjfj+rv4pKgcgC2eMTMxwCcA5DVn3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520746; c=relaxed/simple;
	bh=AX7Xl2Ct2/0CcNXiWFOMRGlJ8MUmG/PDuL4x1mu8MUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KbRQwwVbE6hpG3Opr5vkF3sCV0QgAL7bF2jGMBToMU0hBmdeaZRinfL6++9diPDTE+rpcSaWv2LakNwBz3Lmqi+7WUg8fT6moEbdSRvRzMdOnlqyC2n0zLiMBEJPga3cuyN9SWwfvL9YGUWcg3fgIyl8PF5WIPoP/4NlyH8uUnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaW9YWpw; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaW9YWpw"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-469fdb78b1cso302092fac.0
        for <fuse-devel@lists.linux.dev>; Tue, 15 Sep 2026 18:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520744; x=1790125544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=omvSsRWlhYrqn/54C7RVZhsZGdMO5D4mmzfO0WlGrEI=;
        b=JaW9YWpwqmfCjawN2c5CA6mNlElbU1MAPmrsCOsr3eyPSTYuTExZ1KDp/tupTs4C2Y
         Dnfl4lHcgjdrBolDpx4xV6s9WY+NBJ0GtGij6a9Huk+fKg018fM9vl4AUqBJq/djAqqi
         GINqIul8/ubOBoQPhikVovVsps7w/EBIVhTEoE44TnUfmzNrWuI4ApiRvuPtc3MJF4m+
         wNj+PTwUKyoEWP5bxFrOhspccorFK6feuvssXL1jNm97yxZCInOafsE9VXM2o330BPLi
         mJfJkzjcoVMy4B+FRP+YGZoWV7na3pqJMw63l7nkjzlmM2v+OcgJohh/iydQbHhCjlna
         SzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520744; x=1790125544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=omvSsRWlhYrqn/54C7RVZhsZGdMO5D4mmzfO0WlGrEI=;
        b=S+/LNlHjm7+xWVHzyOuoPPFwbHC6wCeoOqGx2tjU19uKcEF0tIfSaZ0bPDdluMOKOW
         dQeAAcC+LDD8+qBl4fl/h7UWOyliX6bKFO/1VrL9L6q0m3FqSkhx267LQY53tqBFMULH
         EOklwhpmAzsEEcRFMVQMOWtaE7e9U5qvYPTZYZd5ZYFYqM83WnnAH+RTlPC0tGe1nnVb
         2NMb5vLNHvInJ8myPTcXOQuClmiuW5MTY022T12uJIUj85ZFm0qcZM4Ss5u1CeLuSoFq
         u7R0/tEKfJjVtdlBGuu/RR0A0a5uDqRZkE/cEHdkHo5wmd/Qe+hErPi+kpmhDiln6Zt6
         WwVg==
X-Gm-Message-State: AFuF++nsBSDp4Xf6bNoSX2lxXkFCt9N6q6J2wrg/AQsFmFEvO+5zaJHT
	oMLa1Iu10r5R4YlJrzgiVZ51o39cj308lmFFwvRo3J3hc6/J2LbIxF81fkDjiQ==
X-Gm-Gg: AYBFou1bTjmfjfhgpRIAa3GIfShx5ftdw/a+iyzobdEK+rB+AJSbPgDE5aDxnpy2LIt
	/ptIQF15V7p6mAl6mv53lRVkxDV82o4/qgMi9ryR8rkB9JkTdgxrhtPpkqAa8oA4Wul1mqdXtlj
	YrwfZhn19G0S9+HtArb5m7K3McGA0D8HubKTc6kLQOf+UWtV/L2vcf8GMwavsCXCLEYG7OJbcAB
	rJJnEedUFRLkLbTp8Sa8rvCxZSrfmRkwyN1R0RWkqQ0Nh/JtPiZ0XXFRUpoWolCRK2iVFt3Q+QN
	UTn47XOPbynVAHKhqxoU6Igya1MIbgrX1m4KuX8rYmH7d8CdfS1pFYFEC5Gl7jwJAQiDUKgqVx7
	GmzECKm9naIua4LFkonHFfNRoyBmr0oyJMnV73eMhRKgpS15R+a+vMxSsWz+PpyZu3nCd+AdXL4
	X9NyvY2vzdP7wX9m0N9LYH3namqdiCnKUTD1oMQ5SThH/DAwhhRKBm0UvkyisDQPVjbIjfj2IS0
	ej985HFqnSoO0chJD7+50Fkk0sBGTMD+C88hMHo+3aCy82jLuo=
X-Received: by 2002:a05:6870:712d:b0:46e:f5ae:f8ac with SMTP id 586e51a60fabf-484751eac3cmr676928fac.4.1789520743828;
        Tue, 15 Sep 2026 18:05:43 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:70::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842a2488fasm1544105fac.13.2026.09.15.18.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:05:42 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev
Subject: [PATCH v1 2/3] fuse: drop rather than zero the copied range in copy_file_range()
Date: Tue, 15 Sep 2026 18:05:25 -0700
Message-ID: <20260916010526.1318891-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260916010526.1318891-1-joannelkoong@gmail.com>
References: <20260916010526.1318891-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a FUSE_COPY_FILE_RANGE the destination page cache holds stale data,
so __fuse_copy_file_range() clears it with truncate_inode_pages_range()
over a page aligned range.

truncate_inode_pages_range() is built for ranges that are meant to read
back as zeros. A folio that the range only partially covers is handed to
truncate_inode_partial_folio(), which zeroes the covered bytes and then
tries to split the folio so that the covered part can be dropped. Today
every folio is a single page, and a page aligned range is therefore also
folio aligned, so every folio in the range is covered in full and nothing
is ever zeroed.

Once folios can be larger than a page, the range may not line up with
folios (eg the folio holding the start of the range can begin before it
and the folio holding the end can go beyond it). In this case, only the
copied ranges inside those folios will get zeroed. If blocks within
those folios are dirty, then splitting returns -EBUSY and
truncate_inode_partial_folio() returns false. The folio stays in the
page cache with the copied range zeroed, and those zeros are written
back to the server, which overwrites the previously copied file range.
__fuse_copy_file_range() issues a synchronous writeback call before
calling truncate_inode_pages_range(), so in most cases the folio is
not dirty, but there is still the possibility that a memory map raced
with the copy (which is the case the comment in the code already calls
out).

Instead of calling truncate_inode_pages_range(), use
invalidate_inode_pages2_range(). It works in whole folios and never
zeroes, and fuse_writeback_range() has already run on the destination, so
the folios are normally clean and are simply dropped. It is also what the
rest of fuse already uses when the cache has to be re-read from the
server.

Outside the mmap race, the two are equivalent over the copied range for
order-0 folios. Regarding the mmap race however, the old call
(truncate_inode_pages_range()) loses the mmap changes but preserves
the copied ones, whereas the new code (invalidate_inode_pages2_range())
launders the folio before dropping it, which means it loses the copied
changes but preserves the mmap ones. Neither is entirely correct, and
the (nontrivial) fix for both is the mapping->invalidate_lock described
in the comment.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/file.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 2aa575a02e05..8083404f4cbc 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -3002,14 +3002,16 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 
 	/*
 	 * Write out dirty pages in the destination file before sending the COPY
-	 * request to userspace.  After the request is completed, truncate off
-	 * pages (including partial ones) from the cache that have been copied,
-	 * since these contain stale data at that point.
+	 * request to userspace.  After the request is completed, drop the
+	 * folios covering the copied range from the cache, since these contain
+	 * stale data at that point.
 	 *
-	 * This should be mostly correct, but if the COPY writes to partial
-	 * pages (at the start or end) and the parts not covered by the COPY are
+	 * This should be mostly correct, but if the COPY writes to a partial
+	 * folio (at the start or end) and the parts not covered by the COPY are
 	 * written through a memory map after calling fuse_writeback_range(),
-	 * then these partial page modifications will be lost on truncation.
+	 * then that folio is laundered before it is dropped, so the memory map
+	 * modifications are written back over the range the server just copied
+	 * into and the copied data is lost.
 	 *
 	 * It is unlikely that someone would rely on such mixed style
 	 * modifications.  Yet this does give less guarantees than if the
@@ -3063,10 +3065,9 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 	}
 
 	if (bytes_copied)
-		truncate_inode_pages_range(inode_out->i_mapping,
-					   ALIGN_DOWN(pos_out, PAGE_SIZE),
-					   ALIGN(pos_out + bytes_copied,
-						 PAGE_SIZE) - 1);
+		invalidate_inode_pages2_range(inode_out->i_mapping,
+					      pos_out >> PAGE_SHIFT,
+					      (pos_out + bytes_copied - 1) >> PAGE_SHIFT);
 
 	file_update_time(file_out);
 	fuse_write_update_attr(inode_out, pos_out + bytes_copied, bytes_copied);
-- 
2.52.0

