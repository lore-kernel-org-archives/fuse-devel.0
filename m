Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B22DC2C8
	for <fuse-devel@lists.linux.dev>; Wed, 16 Sep 2026 01:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520748; cv=none; b=HrWxiRUjeMciR36Wv43m0IDgbI0iw8MARKdlLzMIUPu4WoJJA/oIgKHl/5rDIUVFonmdNv7l/19EdoS6lcIUBIf9zYBhNt4uXKW+7YxjZlVO7WhLpvZOGpp0YIBefDl1E8b0yjs+eYBBOQ/vfLeSBU6PQf7/+yXWsP1XN2hc5wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520748; c=relaxed/simple;
	bh=tdQk67Srrwlcqs9Vx0ZQX9ZNWGoo6M05cdkNoiQlIo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JC17ccl02QxsRXjoQ/1l+8yBv8F5fqurQYM8dAFDhhW7ZSdQDJhtF3kUgbSTI2dhhXG4wYTWAXJI+MW/iVl6+SRo+u5wKCDfdpwu5qED7dpgFH0Qf+XCekgr+c1PceOEUeQCcTTuecc3XM6p6zNzOyUgjsF/5yUJQMcpx3MZ6qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKqdyhvd; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKqdyhvd"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37dcfe9b2so200241b6e.2
        for <fuse-devel@lists.linux.dev>; Tue, 15 Sep 2026 18:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520746; x=1790125546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mjwUxZia73ipuPhoEMZXfDqSW2PWZMu/KK+O50Z4Pw=;
        b=fKqdyhvd2in4AzQugQNEtSlf97BzTEQqNH4pypsiQ2WnJjghTAaqfUfghB427EBgzn
         ITGmjr5Mxa/UNjZd/6/n7MhhMOxY2KyE/bDY4TddTa1RDHGKcxPPLN5CD/h/2UdAgNrD
         D7OulCixSddRJr3RWg2SQun+bO7586/Ddn4Rp8rUByDQRn/eH1AAW8NpCKwuH4O0TE8d
         a8gwKVv81kzJpy2jkEOvxE37xM96E5NRp4s6jRkSzcnjCRiJdY53c98Vo6LfmbyfxQ9s
         sbWJKnfXJ5wweuB/56lD6HinSlTJgwf1VrlghkvCpW3VVblYZVGrhgRfb0tEjRMvn56N
         yAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520746; x=1790125546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+mjwUxZia73ipuPhoEMZXfDqSW2PWZMu/KK+O50Z4Pw=;
        b=Tm4FsTMYcAR99Dqs50iXDwFMk+RkUzj79VUDGFeA8ZbVnmRL/y0M6NKjfAoyWfFm7m
         R9RJcKLu9NBmTMXNKOPBHyKhb6YNZwzYrpwWzr0KycOa+1gMzQOSx6OFUqAXwM8B6Upf
         A4ciItVOj1sboUF2Z55OtDfI28fp2hrf+24GiPYsa1q2zVX7e9f9cxO7uFvehbM/Lg7X
         uqY6q6577iorkR5aKxu/bfhsQ2rZ4GRKUVxuNKc2yryisMZcTtvcOVi+38WqYbNqOrC6
         1T1THU8J8/0JLTUKRqANPw/0B7K4MraAAAkpik6upDYU3pyTQsD8ed0dQZC6RyH9FifD
         DqHg==
X-Gm-Message-State: AFuF++lk+Yw6fkbIwnKUZb08SF0962QeZMjgm5LOzo2PHaAigJYbfpXL
	JnLogzmTtPSDV5D5MFE/BYP0mWdtulo10a9qfc1jRU4ZxX44cRvU3msqP6B1mQ==
X-Gm-Gg: AYBFou15k5b4JAJz7RUgzOj1H0RhGaoaSEPECGqHfmecZvw1dpk6DLWtc3JixUcDa/x
	Uhdk3Dcrx7K3UbPURkHYMVomaGX5GCCmnpGSxR6x95eLEccwRW+TvzDo+H8KoBOzWt01eerRgjv
	aIhUnrAd+P3r7EsfAw5gaoPPa9rBcrdcj17U3seo6qLFfbWpEkxIZAlcRgYyNXAsau0Px1MgT52
	HLnkXgNAeLg9JFTS+y+Zx8CP0DnZ8qRjmW06o3dAIas7FqjKWFaaMVR/VylHyq6nCKKEc58dndf
	YMAdghR2qQmzHEHKRtSuaWxtqMFP6UTJc1hon8fkJkLx9Qwzb+wtuEAUZcc9nS2MF9PUY3UGnII
	tXOOMYERkGb9Xh0yGLApq2Aqq5HTrDsQ71eCYwAB2FCjUg85fJMVyq2gjFe10jo95i5Cj1AWrxY
	uE9hWSGMSNT9FsLjkfxcyp8FNaPrUwu35BLNYUAJ59vXm4v7F4G/NBl4xOdDrhyGcQXlgR6SB2n
	GfuqmxMmvhTNzlICXD1S9JSdKRgBcrYsjzJG0ghHqxT5V/9d4A=
X-Received: by 2002:a05:6808:2223:b0:4c3:438d:7b16 with SMTP id 5614622812f47-4ca4b633232mr1706509b6e.8.1789520746144;
        Tue, 15 Sep 2026 18:05:46 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:47::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ca2377ac00sm1194402b6e.8.2026.09.15.18.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:05:45 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev
Subject: [PATCH v1 3/3] fuse: replace folio_test_highmem() with folio_test_partial_kmap()
Date: Tue, 15 Sep 2026 18:05:26 -0700
Message-ID: <20260916010526.1318891-4-joannelkoong@gmail.com>
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

fuse_copy_folio() maps the folio with kmap_local_folio() and limits the
copy to the rest of the mapped page when the folio is in highmem, since
kmap_local_folio() only maps one page in that case.

folio_test_highmem() is not the most accurate test. On a highmem build
with CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP, kmap_local_page() maps just one
page even for lowmem folios, where folio_test_highmem() returns false
(see __kmap_local_page_prot() in mm/highmem.c).

The other highmem.h helpers that walk more than one page of a folio
(memcpy_from_folio(), memcpy_to_folio(), folio_zero_tail(), etc) all use
folio_test_partial_kmap() instead of folio_test_highmem() as well. Fuse
should use it too.

This is a no-op today since with order-0 folios, offset + count never
exceeds PAGE_SIZE. It matters once a descriptor can span more than one
page, which can happen once fuse enables large folios. Without this
change, fuse_copy_do() would copy past the end of the mapping on a
highmem build with CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 293b8a936e1e..6da77dfe84cb 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1288,7 +1288,8 @@ int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
 			unsigned int copy = count;
 			unsigned int bytes_copied;
 
-			if (folio_test_highmem(folio) && count > PAGE_SIZE - offset_in_page(offset))
+			if (folio_test_partial_kmap(folio) &&
+			    count > PAGE_SIZE - offset_in_page(offset))
 				copy = PAGE_SIZE - offset_in_page(offset);
 
 			bytes_copied = fuse_copy_do(cs, &buf, &copy);
-- 
2.52.0

