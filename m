Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF5235F60A
	for <fuse-devel@lists.linux.dev>; Tue, 11 Aug 2026 19:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786478267; cv=none; b=oaUSZVTn1B0S/YJ9mczX/OHbiAljZ7PT1NIAAKxpRpxzneGlF4nYNS6iWd9l3l96gUNbNtx0LKndiPSL2XLp9/3hTVI45yVVN69QywYNa0WJZiYcTbC1404q/rccTJlh/QYBvqzt4RdVuIgYYrZy2rcGcm4GHV6/AWqEVjgFUaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786478267; c=relaxed/simple;
	bh=lw/qBV6EAcsMqQGzBzbBCpBRsAqCuH0e7ZukyutHFVY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GQ6P01zzmx4pUZ3qZlUpE6icVS8viw8rYV+Tjeifl9GywCIWrotGkax4oJDFYfXrKeDqwwyrDcOb51/QQ9ooJRAS32Xtmf90tDjUeT9K3bYgA9NUl5/F7Xmhx54bSpl0WGsZKKDngsY+Rp6Hhfdmy4V+cdaAN8ws+MPhrBiLITQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hb1rJBOy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hb1rJBOy"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so478845e9.3
        for <fuse-devel@lists.linux.dev>; Tue, 11 Aug 2026 12:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786478262; x=1787083062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P5I1h7k9sgU/X0BDonPRWDnDR4tKZyrHhT5a1azB5BE=;
        b=Hb1rJBOybr3MOPIGvzA94e7JtOV0GR9IW3zxi7k/s9uw+XJjoYIt9osFTo+zWvWXyu
         14GM6oKfePlgf7HZ0DdyrdCS3bNfS09bDcE9w5wBF1ZTMo9m+xw/ww80lOlDvCaKUU0A
         +6mA9SL/lq8n9Kz+1vxxk7/iLKcP3SPqNlMv6ygaKFA+LQnn1x95/PGHDepXLe/ilFzD
         jeDB87s/u7mM8qnfr8eTX7ZsGLF69BkG+PvN2uVcfjbOBimg5H4MX//rEj1odIX5YHnq
         xxchLkjK1Fk28+0M5E156yX0ARPI8p3V4F+uIDmBx+n2nxu9SbMFaa0cHjzJZSiXAtws
         EiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786478262; x=1787083062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5I1h7k9sgU/X0BDonPRWDnDR4tKZyrHhT5a1azB5BE=;
        b=EbJtsEn4tsKdr0jNIgoaVY1l1V4PGENi0VHWmRNrzO9rIKFlDyPe/Q2SFL/G1cWKOZ
         TTfsEKfLPJ6hOQlzvl240h/cBiQn650EUSDiPovYdrHBPc579XZ3nLFvkHv1kcvHliac
         Gn3wtM6J2YFKb+mlB+3F4a0kD8bXbZzBwWhpltCB3TYFUPbonf7XpSu+NMpgBu+hOe2m
         aMH/+L0Eirlv5KDkKAoN3x2y8k9NDT1ynWv+x5jIn/Q1IN8kdKjKCR7PcxywyXssi4ow
         w3Mi6qyaPnGj7ylPdaRvSeNy4EE26lb/05eZtcaHJTYmu/jxEdOkNqcqWgpkrbn6IrGO
         aslg==
X-Forwarded-Encrypted: i=1; AHgh+RpYTzn0BF1xm9G5aJsgIMV1snTDWozsoEqLgTIarWwTWABWtxFBFLRpLfKWyo8X+Ebo13JaE/v+IqDa@lists.linux.dev
X-Gm-Message-State: AOJu0Yww0486zGS/Y6ER6P1ZUm+1J2MjkWD/LGLeuC6MCstHyxi7qovY
	uMUZIm58KoBB7C6Wv72bSvNuyN2ofWyCVR9R30GbIL+vfvyMBPxGf8XB
X-Gm-Gg: AR+sD13TvbRVne7YOSy8cgHfGnfh5z8VVtCm6y3CugoCtUAj6InUJRrnxS63kLB2nVU
	fLj9eyksLS45KomEQbPAjQ69OSr9klHgbsTy/mlylqjSqbuBl7PJS9NMpk0ih8qYZe8GVuG8LG6
	GKGO1X63bHTYxaYuAMR2zPuwQbBDa9WCXdrA3chVOeFkaasXepNP1u5Huq3CykRZ3K8BQWoXgK+
	GWZM+7fJNSJ0UbaY+isEG+jQOeOpLa32dF91Ai8OAQ6F8gsjwbVtHwyBI5npaoaXizjlgZR8i0U
	Uq6Cha+QVSXHaSrAp8yKlJCbchGaRSfarDBAtQLNqW1XOCcqJhtLbfuMmEdfY8NUOwxtIpNDefh
	68UZlNe/tpZ3h0Hzwb4ypbPNo+tA6YQv2iWtxpmbtMo5ouEO7Is1YQ2etmU99Dzjn3b4HZgP3OM
	IbLu2TauTy98mwZfX2ddM1wQMhRRuAQCkVAobq1EWQQeSkTPENVZdIY+BHh+Xu+qywIsXVceIDG
	Hlv/H5Ve87MFXr3N6hCWeoMt6SmmyBqEJEVZTcNG9Bf9noQvQXBEtrqPt8X6Obm4+zCtp/mXIA+
	AHqJwpyMJx0EPOQb1+5XLcmPQaW071XJZNqcJ+8v++7htAmUsztq1e1B4B16uVNZGo8o
X-Received: by 2002:a05:600c:1c21:b0:495:6396:8b67 with SMTP id 5b1f17b1804b1-4997a5f22a1mr38583495e9.4.1786478262211;
        Tue, 11 Aug 2026 12:57:42 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a133-e401-bc8e-d36c-2d08-c5e0.310.pool.telefonica.de. [2a02:3100:a133:e401:bc8e:d36c:2d08:c5e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150c08dd7sm789136f8f.16.2026.08.11.12.57.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Aug 2026 12:57:41 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	fuse-devel@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Jingbo Xu <jefflexu@linux.alibaba.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fuse: fix GCC 8 build with CONFIG_PROFILE_ALL_BRANCHES
Date: Tue, 11 Aug 2026 21:57:33 +0200
Message-Id: <20260811195733.38489-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 25307ca50b815 ("fuse: simplify logic in fuse_notify_store() and
fuse_retrieve()") introduced a loff_t cursor and used it in place of
outarg's offset field. In the min() expression this changed the second
operand from unsigned to signed.

With CONFIG_PROFILE_ALL_BRANCHES, GCC 8 does not propagate the range
established by the preceding MAX_LFS_FILESIZE check through the branch
profiling code. Consequently, min() cannot prove that the signed operand
is nonnegative and rejects the mixed-signedness comparison:

  min(outarg.size, ((loff_t)((long long)(~0ULL >> 1))) - pos)
  signedness error

This happens with GCC 8.1 on x86-64 and GCC 8.5 on arm and s390.
GCC 8.1 remains the minimum supported compiler.

Use umin(), which is intended for comparing an unsigned value with a
signed value that is known to be nonnegative. The preceding bounds check
guarantees that MAX_LFS_FILESIZE - pos is nonnegative, and outarg.size
bounds the result to unsigned int.

Fixes: 25307ca50b815 ("fuse: simplify logic in fuse_notify_store() and fuse_retrieve()")
Cc: stable@vger.kernel.org # v7.1
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Testing:
- Fails without the patch and builds with it: GCC 8.1.0 on x86-64 and
  GCC 8.5.0 on arm and s390, each with CONFIG_PROFILE_ALL_BRANCHES set
- Builds either way on GCC 14 and GCC 15 on x86-64, GCC 15 on s390 and
  Clang 21 on x86-64
- With the preceding bounds check, umin() changes the signed comparison
  to an equivalent unsigned comparison. Instruction counts are unchanged
  on all tested targets
- Reproducer: defconfig plus FUSE_FS, FTRACE, TRACING and
  PROFILE_ALL_BRANCHES, then build fs/fuse/notify.o

Stable backport note: in v7.1 the affected code is in fs/fuse/dev.c

 fs/fuse/notify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
index 29578104ae6cd..3370ae344f751 100644
--- a/fs/fuse/notify.c
+++ b/fs/fuse/notify.c
@@ -153,7 +153,7 @@ static int fuse_notify_store(struct fuse_conn *fc, unsigned int size,
 
 	nodeid = outarg.nodeid;
 	pos = outarg.offset;
-	num = min(outarg.size, MAX_LFS_FILESIZE - pos);
+	num = umin(outarg.size, MAX_LFS_FILESIZE - pos);
 
 	down_read(&fc->killsb);
 
-- 
2.53.0
