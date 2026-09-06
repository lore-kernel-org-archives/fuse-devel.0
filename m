Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0535D31E852
	for <fuse-devel@lists.linux.dev>; Sun,  6 Sep 2026 01:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788658170; cv=none; b=IQQQJYczBTDOwBcPHbODhT+HKo0i4m13cWfSgk2qBEKcRewIOJUNkFO2AmROE9NCBciBxNR8irPXnjTMqgjjvZUAZK1wau2rLhIIvsMhaHsCB01Q9BDELLMJS8pVHltV2j10NJ5E8YxlOSqxXYmchotL0+dKmS5zmpa+97aJAo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788658170; c=relaxed/simple;
	bh=7a1Ndwvoc4REla0vGLCnEWdMwph1amt4g7HmhXPWcCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZrUgiVHiNhaJXfLJR0x5g9cFFzLlOUFyyNq8MOp86zTliViim7rcGFTOaiaalYFjT0wg/yHi6rptF3xP9OHYCCdsMOuo4NQ5933byHj2OoKQnfQRRUzMQBoP0JBmTKGfdEXeeT5Ivba38EqcoNd5fGg8SZ2NQKFDSw51XFyRCBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=aDnen9wT; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="aDnen9wT"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so1765371b3a.1
        for <fuse-devel@lists.linux.dev>; Sat, 05 Sep 2026 18:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1788658168; x=1789262968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oT8Nfdv6MGvf2cFqhsDb4n1/o/u/U/Uyjhc2N7KsByk=;
        b=aDnen9wT+2w/Ds9BUoZm/bnDnyR6rca44OI7LnSuFBvV3B43Ek4WWAcS9xcZd8l1R1
         Dw3nYxjy1p4eJBCkPoB+Mf8DcXuLL3YDc6WwpPROthgYMrp3H4Sj259CJiXNmoHhRsdG
         QjUweaF5/qw/pJLjyiF8XYkWgZ8G3IUFrFI0fHliUuPnc0j05jtcOkp+X2r1wuPPJub2
         2pO81WWPR4W8+lFSEqFeGKQKDneVh7+obxbpLjh9gYN6TOcg/HJ91aa3WbwB4sL3WO2F
         qZdtxDfF6R6ay3/DMH0fISJBu6z4QUNWaGZLRUObc1q8sqh9BurE5JcFfH0Ifaa606Gh
         OFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788658168; x=1789262968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oT8Nfdv6MGvf2cFqhsDb4n1/o/u/U/Uyjhc2N7KsByk=;
        b=qpiT7jbL87SV52F5vd+8LnwvDLGi9SlJXAbLg2HmWblsbM9XVo63DhaJn/89UiNY0r
         xbOOsgQn4enKMHBukyUKvzz51kStvrf15XjVQJgWVKX/5RY7d0j1tv4ujx6Yozd+mLDV
         sEDu6fH67gjHpNGhUEGCdx/N31ylvE/SBuEUv4eB4F2sxLwQ3C9hj6sYZXtBIziVaHTS
         gv9zQUsep0MvcSHUcOW0/hEth57ZXX+DpJEL5nucCZGjhiMiGIVnkQBeJ1R+QmFajTsK
         8LLguhy4lnW3EY06Gxyw6Uw81uPocJHP8cjtUoXSQrD1yF4zRouX00XLbuJl3N87J4um
         51Yw==
X-Gm-Message-State: AFuF++lLdthGmkdlEj1mN9IbFhZOjCg2UZoxqgG6xHDmS3wShktADGMk
	rpJzha+oXYEBZnmPV8ai2vs3W1ebKl5H0N0vEewARF8I+JEPEHDa8ZGm/sKCpL7PKw==
X-Gm-Gg: AYBFou0cULCc5J99ESVhdT8LIZOei2MCBy6k7KOa2TjiktytsWgMZP4fo0UtNTcYv0n
	KWwH1Tqau77e/IWnwQy/Ic6iYlfYZ9Ym9DVdqVSwRhCJDdjgVz9oei97T61h6QkQ6NTOncey5dQ
	/XdDZFWsEIKokHrGdrgRmOGgJv+mCiChVJzJgw4lMUy4jzB4i9LGHCLHTYCfpgex6mp7h6VCpcL
	8+PW9nStg0mGgXLt5SFEyNY78mBaBEBpEWz8yGXVUWEK7hmcTIljCP29isP6SvvMi85SiXYv4Ou
	K783nCqaKDSq1dTLMws1EnUPHUyybJD7tnmDfeR9C+F4Ypqt6WPQaKjPB5MBAZPiXod35GGJ5st
	g4zcj3UxlPixEYY4+4z/LhkDNYVdBzeri3Gm0Nf9yyLManVBftxnJWYrkAD9HSLMlL2YhI7ZpGy
	44Z9QO1pLGjS/oMc72+1fqbh6fF8kSVUEMmfUsLT0eA+/TquwoULbdPW8zAdcd6ZxXH8XKrqzi8
	XfwkZ0oubpM97MoWUW+QYAg
X-Received: by 2002:a05:6a21:e081:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3da39b4390cmr22662653637.4.1788658168307;
        Sat, 05 Sep 2026 18:29:28 -0700 (PDT)
Received: from p1.. (129-219-8-31.nat.asu.edu. [129.219.8.31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm17456853eec.19.2026.09.05.18.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 18:29:28 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: fuse-devel@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	bestswngs@gmail.com,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH v6 2/2] fuse: deduplicate the oversized-request error selection
Date: Sat,  5 Sep 2026 18:29:23 -0700
Message-ID: <20260906012924.1928316-2-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906012924.1928316-1-xmei5@asu.edu>
References: <20260906012924.1928316-1-xmei5@asu.edu>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_dev_do_read() and fuse_uring_args_to_ring() both pick the error for
a request that does not fit the server's buffer, and both special-case
FUSE_SETXATTR.  Move that choice into a helper so the two transports
cannot drift apart.

No functional change.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
v4: introduce fuse_req_too_large_error as a helper
v5: add the explaining comment Joanne suggested; add her Reviewed-by
v6: rebase on fuse.git#for-next; no functional change.  Dropped the
    Reviewed-by tag.

 fs/fuse/dev.c        |  5 +----
 fs/fuse/dev_uring.c  |  2 +-
 fs/fuse/fuse_dev_i.h | 12 ++++++++++++
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 4fec31fc0b84..9fa90a48357a 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1613,10 +1613,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
 
 	/* If request is too large, reply with an error and restart the read */
 	if (nbytes < reqsize) {
-		req->out.h.error = -EIO;
-		/* SETXATTR is special, since it may contain too large data */
-		if (args->opcode == FUSE_SETXATTR)
-			req->out.h.error = -E2BIG;
+		req->out.h.error = fuse_req_too_large_error(args);
 		fuse_request_end(req);
 		goto restart;
 	}
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 981b7c295e5e..197d277023a5 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -898,7 +898,7 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 
 	if (copy_size > ent->payload.iov_len) {
 		fuse_copy_finish(&cs);
-		return args->opcode == FUSE_SETXATTR ? -E2BIG : -EIO;
+		return fuse_req_too_large_error(args);
 	}
 
 	/* copy the payload */
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 4b412a76225f..5435ee069b4c 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -13,6 +13,8 @@
 #include <linux/workqueue.h>
 #include <linux/fs.h>
 
+#include "args.h"
+
 /* Ordinary requests have even IDs, while interrupts IDs are odd */
 #define FUSE_INT_REQ_BIT (1ULL << 0)
 #define FUSE_REQ_ID_STEP (1ULL << 1)
@@ -367,6 +369,16 @@ static inline struct fuse_dev *__fuse_get_dev(struct file *file)
 	return fud;
 }
 
+/*
+ * A request that does not fit the server's buffer is rejected with -EIO.
+ * SETXATTR is special, since it may contain too large data, and is
+ * rejected with -E2BIG like the VFS setxattr path.
+ */
+static inline int fuse_req_too_large_error(struct fuse_args *args)
+{
+	return args->opcode == FUSE_SETXATTR ? -E2BIG : -EIO;
+}
+
 void fuse_iqueue_init(struct fuse_iqueue *fiq, const struct fuse_iqueue_ops *ops, void *priv);
 
 struct fuse_dev *fuse_get_dev(struct file *file);
-- 
2.43.0

