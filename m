Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EB0432E84
	for <fuse-devel@lists.linux.dev>; Tue, 14 Jul 2026 23:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073258; cv=none; b=m/bmWB39lS9gye0pIHTX/V2JW+fx4KoKP8vK+p2Ao0dBfERg+OHcCzuxNIledhys/r5r+fODq5eu1rdTjaTQK4rEyqcByqOcHqje6zivorT/j7d9tTQgH1oXHj1PbfQxVdASGF6qLJuv1z4dORxREiGyjXEDgiNjTj9zRb+02Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073258; c=relaxed/simple;
	bh=t2bCjvQESDfrtTkydLO1/4vSR4Czd2I4rz/vDz9rwe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=URRCAs7rx5Z30hTMw0O3rf/xbw/btuHprHeUG/ZVboF1L0AzxU82UIsSJf00BzTL+VS1CQAad3J2haFu90ZZod3cjK9ab0yXm0ExkgBJ2D0TFkMMDTwHJnreRTZUF0rhksNxsuAwgt+ERUcwDirYFqBFxc+xWCkw97Rx9W2wVaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=kK1/+wGS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="kK1/+wGS"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caced6038eso21347705ad.0
        for <fuse-devel@lists.linux.dev>; Tue, 14 Jul 2026 16:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1784073256; x=1784678056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WEci7FoVON0/ZMv2IFLGjX0V0D6atEWv0SWH6c8vLwQ=;
        b=kK1/+wGSRoWnxRwlJKY9id2noDRKODa0RL92ZYrw+iFvOhedw8JP0TY7GNjkS5L8D/
         4djxYVyQjJnRJ2uA+O8f0vlKZIJ72o9yul4+JcyWpSA25VC5QZhc9tfeUDF58nOa398S
         FEzMAsFxz98wtn0ocjBd0fEfpowO2Cmxnc0MQR9DfEnbU2oEkIsR06AzWZgWMAzF0BxB
         SY0tvfrsYugs2QdX7wW9jNTnSTwE3/OYeWIs6s8Xd65J5GKpfivkk/qtVtSzezfffmA4
         f6omJlPUfG/UVY8nw2OhcBAc3zhbrfkwAjzoOejxrRgTbF06C04HToirq4m4cZ/oNLyq
         Hxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784073256; x=1784678056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WEci7FoVON0/ZMv2IFLGjX0V0D6atEWv0SWH6c8vLwQ=;
        b=mTyGmV16ocLjO4QktH0LXFsx/LvsScfmWuAc0nrWsnIil1hJyhcTVAMRoCcPDUUwQP
         Hwn8azb3ZcBFdytgzVGRbU40zzWd+dNpP4Pz4B/LzEWLEefLY2kFKzBYSh+gMG0CAPoI
         TRsybE5dv8Gs+AoJY5zo6rMsws6+OPY/WyWoZrRMNTeycFXOVWljl8yR6kJbjJ4i5DcW
         3iX938JirAZAbVP4/dN5aDXPanPjdfCs6H0eeVYnGyU6StzbH2Fc59oqS1BxN2jbGwnX
         WSbbPFiWssk22QNorUAnhT+3NqB0cAaoCpcf9j36KXfpl9kDtzCh8s8a2oLs34X3MnK7
         y5KA==
X-Gm-Message-State: AOJu0YysSHFz7AsOIzVU9neIVH0YIP4BWQCLWB6+7Bkb5fGagHJT8Fvh
	cFfuQqZjFzZQzUUolD7sHbNljUU9xYKqGlE20muVgmhOmEtxQAEsGWP48/Xq/vrqfA==
X-Gm-Gg: AfdE7ckINCoMPRLZ64A+4G5/KiGOh4Wbs4/WxFcp8WQWX5Yr9B9PRlnjROM3AKIOpgS
	aN6rDDxAfENx6ijUs2dLPyPjM1oa36Rp6rW8ZUOJrlCZprupm+pHoijUAZMnJKbTKy/PW+BaT94
	g1Cf6qeIYxsFeqkXpxNEVLs15HKlze6qOSyipmMAZd4JCSg66dc/KspMcS+6gDdPdpBrkOhphJu
	KvMDlI10k8VNMf2SXlEyM1v1e51kNC3Db3eDZhj6ZZpeItMU6zvNg3tvBcRl5Fey3BCa6Uj323S
	o0cZOw/72xxf92TtA8QbeMgdeoZjDQOnQifL7yEWEuIjyrucda1mi4MID2eh2MovrgWdir3WkFD
	44VXfEhr4cVk9VkSaAmcWYGtgRCzVUc2fO/SaE+sZdWohE7xyRlMK9nPptEI26qjlz5xvtnQCmg
	==
X-Received: by 2002:a17:902:e785:b0:2ce:b67d:cf06 with SMTP id d9443c01a7336-2ceb67ddf65mr114511605ad.1.1784073256262;
        Tue, 14 Jul 2026 16:54:16 -0700 (PDT)
Received: from p1.. ([2607:fb91:1513:463e:34c6:f6a3:8e91:2983])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm123236075ad.65.2026.07.14.16.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 16:54:15 -0700 (PDT)
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
Subject: [PATCH v4 3/3] fuse: deduplicate the oversized-request error selection
Date: Tue, 14 Jul 2026 16:54:08 -0700
Message-ID: <20260714235408.1666063-3-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714235408.1666063-1-xmei5@asu.edu>
References: <20260714235408.1666063-1-xmei5@asu.edu>
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

Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
v4: introduce fuse_req_too_large_error as a helper

 fs/fuse/dev.c        | 5 +----
 fs/fuse/dev_uring.c  | 2 +-
 fs/fuse/fuse_dev_i.h | 7 +++++++
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index b8e43e374b35..56c38aca7389 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1584,10 +1584,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
 
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
index 4529505b2bca..cebd8f871627 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -729,7 +729,7 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 	}
 
 	if (fuse_len_args(num_args, (struct fuse_arg *)in_args) > ent->payload_sz)
-		return args->opcode == FUSE_SETXATTR ? -E2BIG : -EIO;
+		return fuse_req_too_large_error(args);
 
 	/* copy the payload */
 	err = fuse_copy_args(&cs, num_args, args->in_pages,
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index b511aaab6bfc..4958158c0f02 100644
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
@@ -367,6 +369,11 @@ static inline struct fuse_dev *__fuse_get_dev(struct file *file)
 	return fud;
 }
 
+static inline int fuse_req_too_large_error(struct fuse_args *args)
+{
+	return args->opcode == FUSE_SETXATTR ? -E2BIG : -EIO;
+}
+
 void fuse_iqueue_init(struct fuse_iqueue *fiq, const struct fuse_iqueue_ops *ops, void *priv);
 
 struct fuse_dev *fuse_get_dev(struct file *file);
-- 
2.43.0

