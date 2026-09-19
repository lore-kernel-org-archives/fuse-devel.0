Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E47D36F41C
	for <fuse-devel@lists.linux.dev>; Sat, 19 Sep 2026 22:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856257; cv=none; b=RjPuRJHKEwxt6s6azO51WOdVtdOXygfFqa+8mYkC5PPzVjxAnHnSJaj880dmwiyIXxJtw9yGHo5CONzySaRuZRdfXmUOGBos912VrbtQZjC7NTcRX1KqD3mlBAjDuD92adz2n39nbD2HbIOtg22r7oLeaQEDXZTymKyhFfVnQdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856257; c=relaxed/simple;
	bh=XTGPByaKTox6U5aPZLCDWKzv+Lqm37WB14EuUf1lPpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lVJsT0C77Z8F+2wgDv5NhpVR95S3Y8US35PX0WddiMloIAxhaWox6b4ifVXfeFU3lb6r30hs+j+VbDhMZ9w/a72OQWF907/oFCMXPIN0O/sD3R3XqL89yV/aIU8Xsc7dT/b998HFxfYcdmRaNowogahprbdMx8UBqZsTekVHngg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0tRJ5MI; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0tRJ5MI"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6185so11402065ad.0
        for <fuse-devel@lists.linux.dev>; Sat, 19 Sep 2026 15:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856254; x=1790461054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6AhYczpStxgsCjFPERIhNOclR7G+/Zd8P+4g7a+UCi8=;
        b=j0tRJ5MIUMO47aM8PPXXwXucI2crqXoCtNViKH1RC5Ms631PklvQcAhLfKmVa5Osdv
         EfUuU8oTMWM9t+cQ4tDoyckm9VSDd+Gj08q8VUff4rngT6hO6n/w5Wz1G7fzwYGEWOIh
         XCtc+hilIkYYKjlv6FbEhlqDQma6bQ3uk+xGeFKW86RuC8nu1ohmzpMAQHrwH5bymz7s
         hZh8OZYK1HGF51xNIWzjcnthvfDgOxXYijLYsr3Oc14izrtw398ApGJfEfUgU/9uaGwI
         k72vtmW1EgpmVsmaWhQvBG9xPOxKXAUzZm/r1kChVoQcBOkfCLC6v8q1cSCwGpYZozEI
         Z60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856254; x=1790461054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AhYczpStxgsCjFPERIhNOclR7G+/Zd8P+4g7a+UCi8=;
        b=YJEqJA7ukEbeiPfgEzIAgyDhKKJ6VlPm/wC8YBnYbiKh8/FZJOMDUJxYNthk9O14CG
         LPYLbS1saqO2NdmOoMXsSiN4qqQwA7+lDcNrX3H6oiUMwFwphPQHSztbj7x2MM8TCHSL
         cP263yAxCQVzeWeJy4AjKBd0zQN32i10tbLEAPhb2n8pDA0cC7UKkLB6Ia2ieQPDXmA9
         bRooxlWaOgVwsnCjP7ndt6+K4Md5fJSe3eDblHffpXsvGuxKCJG0xQIpGhAuKiTIiUgG
         ftCIT1drp3R13/VvRQ/6EIsRL/3tTBNV5a2OQqvAkPo35KoQJaw4QG/vVs53qKsuY1Zw
         hEqw==
X-Gm-Message-State: AFuF++mGpC4dchCxRHg+dMGp7V2iY2qIvw1aMiAgiqW/6mWDwzubRgiN
	5W8tcPl8ei29GVjN3kJVD+fZUT766yJvbProNcygolnoIgPytP4UZmdO
X-Gm-Gg: AYBFou0a9slr2baO5wyEeQ6dMNUSBRlQ8UMiuVp9WblQTToPMOx8uV4hzXL12KW6SmB
	pAZI2Qk21sTbVxlTiNiosGPK0IwS1s55kQBnM2EhCnR9bAup2nMCcyh5foUQjCXNKShC1AHVcET
	zMjU933U0s77t+5GlmaTbWUoux4mgCM6eOpFVY+xnT927Tw5m4KX35Y7g3h0bpz1QMGjnhMCwzZ
	l4SH1qO6cg4hjxLvwIMJh/e5YRYD5rMilZybRNc0wkLJ4N7XnllIGyWDcirf/njNOAELmOky5iB
	AqcPcc5dPKwFBznFux52gyPRHjWWbEHnxbENBtOS8z735kvsj7Mv8gV7lvT4/E0Iu8DM+xSdo8Q
	ULfLhRmUpVsDgZEFc+97epQIz4hyIabBMNgMBpja4GauJ8o4VSjR8GVcIOKzLatfVp4b/aPzyJq
	06Ouo3fU/NN7X6K0iMUeUmbcaAP8uBMLfEnHl16qTDlx5LUzhdYKhvtRSeWtDfZ8NvjwnyT4dQy
	GLI9oBgXY5gjiAIWu6Qv1XZNUkNo4NI2hSlmgULi7XWeccpEyXL+NT4tQx38GK2V03zWQn3NOAF
	b0CAPWgpeA==
X-Received: by 2002:a17:90a:c105:b0:39e:6a81:f350 with SMTP id 98e67ed59e1d1-39e6a81fcc4mr4701834a91.42.1789856253908;
        Sat, 19 Sep 2026 15:17:33 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6fb75539sm5863046a91.3.2026.09.19.15.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:17:33 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fuse: validate folio state before pipe_buf_try_steal() in fuse_try_move_folio()
Date: Sat, 19 Sep 2026 22:17:33 +0000
Message-ID: <20260919221733.3707924-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fuse_try_move_folio(), check that the pipe buffer's folio is not
hugetlb, swap-backed, or already mapped/anon before attempting
pipe_buf_try_steal() and inserting it into the FUSE inode's page cache,
preventing VM_BUG_ON_FOLIO() and page cache state corruption.

Fixes: 394244b24fdd ("fuse: support copying large folios")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 4fec31fc0b84..121bb1f3cb05 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1147,32 +1147,32 @@ static int fuse_try_move_folio(struct fuse_copy_state *cs, struct folio **foliop
 	if (cs->len != folio_size(oldfolio))
 		goto out_fallback;
 
-	if (!pipe_buf_try_steal(cs->pipe, buf))
-		goto out_fallback;
-
 	newfolio = page_folio(buf->page);
 
-	folio_clear_uptodate(newfolio);
-	folio_clear_mappedtodisk(newfolio);
-
 	if (folio_test_large(newfolio))
-		goto out_fallback_unlock;
-
-	if (fuse_check_folio(newfolio) != 0)
-		goto out_fallback_unlock;
+		goto out_fallback;
 
 	/*
 	 * This is a new and locked page, it shouldn't be mapped or
 	 * have any special flags on it
 	 */
 	if (WARN_ON(folio_mapped(oldfolio)))
-		goto out_fallback_unlock;
+		goto out_fallback;
 	if (WARN_ON(folio_has_private(oldfolio)))
-		goto out_fallback_unlock;
+		goto out_fallback;
 	if (WARN_ON(folio_test_dirty(oldfolio) ||
 				folio_test_writeback(oldfolio)))
-		goto out_fallback_unlock;
+		goto out_fallback;
 	if (WARN_ON(folio_test_mlocked(oldfolio)))
+		goto out_fallback;
+
+	if (!pipe_buf_try_steal(cs->pipe, buf))
+		goto out_fallback;
+
+	folio_clear_uptodate(newfolio);
+	folio_clear_mappedtodisk(newfolio);
+
+	if (fuse_check_folio(newfolio) != 0)
 		goto out_fallback_unlock;
 
 	err = lock_request(cs->req);
