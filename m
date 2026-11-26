Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703122;
	b=IkGheXLRK6ONG6dqHcSFUYzrOazoh8mM/u71S6LBEkhjRlEASxUB9THqivcDIwM9mBZH
	 6z0y5hXLtecLDqNw4SNa4jvTQ+LW0fiDgc6oF2WWqTXozac2QsUylY55oWSv1ek0WLQx/
	 CVADKt/mLkYNhecKGE/2EoH+RMytWZdOiPHzojjut2x0qXaZNGk5NTVluhlFVvo/ScLaJ
	 HKw433tucHa/f5xqKx01Sgn3CfCIkecxlwll53FIZ72cmh6G054miZDyCAoNcyJWCTK1c
	 3E4SEI/g0PiXx7gNs83Znjee9Xrdv56dAIyRvAOUWgMNkqhuxBZ1aXx8jjbX7qZlC9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703122;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=KHH1an+fRNgyoEXHVikL1LOnVADDchHnOXre6IBLS9M=;
	b=WxZbJTAKBBJDJYcxrQl2oPZpW6muLJdKRlGiykrdlbokX3rvH6DYISZWhTVUAsP+qp2x
	 beOSqFWC1z+HAHE5oxhp7JqEMs+Otx5Qqgd1Yv2IoHBY9NXhnZEdEmXTXyIZzV42Ly6/z
	 HGUZcCb5Evts+WunUQ6AWm31tfmTVNGMJOhp3k9LjrywyuPcgFBUEk+u3yv4iS5g2R/vM
	 MQcvP2u3B6g0QERynU/KZ/E6gaHEqdNBCH1O81LnNjaaAVjbvhlOyFHBHAcmndHy4zHbu
	 0qO0Qn0tT7jk9z5/q0T5iqCACIpeVYIaPii3s8HCX6A6vc5dxKX1R/2Odc8aSM05O0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P4D3PDhX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F91606A326
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 14:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F91606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P4D3PDhX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795703121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHH1an+fRNgyoEXHVikL1LOnVADDchHnOXre6IBLS9M=;
	b=P4D3PDhXz5t9fJLAK8dA5uP4Nx0PBfjHWxp1JT65oCEAKz8y1mlYoQp7WMnIAxtKYAxbuX
	HvWs8j/jXYQN5YcuC432lQg3gkDbizYnFwXX8Gg2ZAWEqsOfCrPBJ2g2ox5LcEA4YTsA46
	iHdP1sVILIl4hsW3LyGM40fNm+5CdfQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-Dsc2j7T2Niiao7vW5vJ5sw-1; Thu, 26 Nov 2026 14:25:19 +0000
X-MC-Unique: Dsc2j7T2Niiao7vW5vJ5sw-1
X-Mimecast-MFC-AGG-ID: Dsc2j7T2Niiao7vW5vJ5sw_1795703118
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4bcda4c853aso443674f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 06:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703118; x=1796307918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KHH1an+fRNgyoEXHVikL1LOnVADDchHnOXre6IBLS9M=;
        b=Gana6P5Q+/cHSb9swBTd0cqEuVIcYAOftRT3g7s0lSlZoLZu+6d9oop3ZTdlsZFa3T
         5SoU2yKliplXg2qxfyDqr8QkeVuasBM84oqw3xpeFo/Hu/k4LGq2UdmkZ8d+uE+TTNyb
         Yiaduy3W16cZ2yGS3nTgP2GV74fYwwH1019NABgorEwAgc1NseuqA2bBo5NTSCHp/RNM
         qfwAhoQDGRNmSxprohNe3yb+bWH5hl2FG0QSfBPhT8fEsutvstXS72tBmiqnfQRWyCGR
         SCjnDTUkp3uDJIefJyNa/D7nWI9msf7iL/kDgYpMKdIs1v74u7qqqVw9nhISDIDLg/yj
         vu9w==
X-Gm-Message-State: APuU4Z+i70lbu5tl/azY2unqheoDIFNfmTgx+0F1tSpui82MnHMrbLL+
	0z5zdg/ygTVGlEKy7DzinEr5wDWx7VgIdu+VIcijpDNt1nOU0ekjbe4s8X4+z99IM5+M6csq4WG
	tcvslRq3+phJ8VeZHU8kWMeoUfC0b9sWFXhPGKfdxWjD/5G5ugJdICiU07UaoMrJ2kTicJK2HgE
	Ri6VxpEiId1LiCbdmhTsZpR/vGrIFQ86B5MVuR4ybcLoa+7G0=
X-Gm-Gg: AZFdTZdU7LpHnwBm+6hm9J4yZJEIOadYLmJmwaE3f1U62X4keo/e/hIHM1JyRgI20AO
	JKBfXmUOtudDqYPPVoze+drJHjCEoy1WxF44Y6CFyvmk4Yfb76FXPJa2MEBmHSAlQFXznXF6A6V
	Q0EVp7yU8LaNZ1J3bHpMwdinMJM2aj7SvgWu1RwwMj/w/6aJ9eEmtLBdxVclwhaPBa1dHM+5aAY
	cq/qPNMpY5gbMlHR2AlD5zwPNe045OqVtmeyUOTn8HElFCFasyMDKZSPp2042RqW74/rkaiOmNG
	jnL+pIhGD9sXVXuQO93i9OiPraEG4ULW039lk9xhc/rqgsCDc936KHo3gXmBnR40PgrPzK4Uve/
	I9wLeF7UjzBZC1O1mZL61xitvcWy8yT2wUTabe4ZLELKCPQphOgGJJOBs6S7j8lkGVX/EIp3e0h
	hQS2N2R3RjbKa5g/biha9iHFpFWIYS+JxP3tj/6qd/
X-Received: by 2002:a5d:59c3:0:b0:4b5:b60:4814 with SMTP id ffacd0b85a97d-4b50b60487bmr24406902f8f.54.1795703118367;
        Thu, 26 Nov 2026 06:25:18 -0800 (PST)
X-Received: by 2002:a5d:59c3:0:b0:4b5:b60:4814 with SMTP id ffacd0b85a97d-4b50b60487bmr24406792f8f.54.1795703117525;
        Thu, 26 Nov 2026 06:25:17 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (193-226-214-34.pool.digikabel.hu. [193.226.214.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm40768370f8f.42.2026.11.26.06.25.16
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:25:17 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Subject: [PATCH 5/6] fuse: fix readdir cache size overflow on 32-bit
Date: Thu, 26 Nov 2026 15:25:05 +0100
Message-ID: <20261126142512.219535-5-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126142512.219535-1-mszeredi@redhat.com>
References: <20261126142512.219535-1-mszeredi@redhat.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p95qvG1BhV0mAQMxIzLRX9dmOhW0LhybmvLv84_yiQ0_1795703118
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

fuse_add_dirent_to_cache() computed the new size of the readdir cache as

	fi->rdc.size = (index << PAGE_SHIFT) + offset + reclen;

where index is a pgoff_t.  On 32-bit architectures the shift is
evaluated in 32-bit arithmetic, so it wraps once the cache grows beyond
4GiB (page index 1048576), and the truncated result is then stored into
the 64-bit fi->rdc.size.

Instead of fixing up the shift, keep the position of the new entry in a
loff_t from the start and derive the page index from that.  The same
value is used both for the offset within the folio and for the new cache
size, so no 32-bit intermediate remains.

Fixes: 69e34551152a ("fuse: allow caching readdir")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-4b4222e6-7496-43b6-a0cd-fbd47bdeddb0
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/readdir.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index c1e2a8fd834e..750e88fbfb4e 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -36,7 +36,7 @@ static void fuse_add_dirent_to_cache(struct file *file,
 	size_t reclen = FUSE_DIRENT_SIZE(dirent);
 	pgoff_t index;
 	struct folio *folio;
-	loff_t size;
+	loff_t size, cache_pos;
 	u64 version;
 	unsigned int offset;
 	size_t folio_offset;
@@ -57,12 +57,14 @@ static void fuse_add_dirent_to_cache(struct file *file,
 	version = fi->rdc.version;
 	size = fi->rdc.size;
 	offset = offset_in_page(size);
-	index = size >> PAGE_SHIFT;
 	/* Dirent doesn't fit in current page?  Jump to next page. */
 	if (offset + reclen > PAGE_SIZE) {
-		index++;
+		cache_pos = PAGE_ALIGN(size);
 		offset = 0;
+	} else {
+		cache_pos = size;
 	}
+	index = cache_pos >> PAGE_SHIFT;
 	spin_unlock(&fi->rdc.lock);
 
 	if (offset)
@@ -78,7 +80,7 @@ static void fuse_add_dirent_to_cache(struct file *file,
 	    WARN_ON(fi->rdc.pos != pos))
 		goto unlock;
 
-	folio_offset = offset_in_folio(folio, (index << PAGE_SHIFT) + offset);
+	folio_offset = offset_in_folio(folio, cache_pos);
 	if (!offset) {
 		folio_fill_tail(folio, folio_offset, (const char *)dirent,
 				reclen);
@@ -87,7 +89,7 @@ static void fuse_add_dirent_to_cache(struct file *file,
 		memcpy_to_folio(folio, folio_offset, (const char *)dirent,
 				reclen);
 	}
-	fi->rdc.size = (index << PAGE_SHIFT) + offset + reclen;
+	fi->rdc.size = cache_pos + reclen;
 	fi->rdc.pos = dirent->off;
 unlock:
 	spin_unlock(&fi->rdc.lock);
-- 
2.56.1

