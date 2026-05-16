Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3773722F01
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892759; cv=none; b=sC2X7Oco0mh1IPVPGPOtQlA5eY5rax6yCXk3CRnn2aUmYKzgXFO40gSwa5MdImaoK3uzvyh8ujrEmfdnsjLbuBy42wLQwTMYfRRr2X91dHdLQWG4v7709hqTbkPb4vJvlnMh+WQziOG43HYtjskyfmP6OFsYK5TJUDVvwcx5AHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892759; c=relaxed/simple;
	bh=oaVjW+kto9iJmTBWvplDeJOWF9LQ5WC98I/67i6KwSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jliQCr1qudylw5NnINILJuNS4ZNIuxtko0NyuqxUJES6RRTO5McrWk2nhDu6NFPSjC/CmjCzxeWsMSC8ppS1PbLcKjYakvJADh5oLe2tQmEEUEe8cQO5J7/gAyWSnojvp7C+fcLA5ulNz8mMkvyzlHiF6KH6U1F7skiijwQggTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsTSsqnj; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsTSsqnj"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7c58e6eb3edso413297b3.2
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892757; x=1779497557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBcpSskz4i7VuiAz2sQnUJMSd3u4qsIaknHE8pSV17M=;
        b=lsTSsqnjGXcnqgUwiFLTeL3KxbGlD7Qut+H5lRfXj1BKy3tqIM8Yg52xc32eTdSl/h
         ZPBYcFi6q3cpuFeqmfje+epPzTeLHdmLNkgIsE52bAYs9zj+0nqVUKIMTR4dkwQAOTgo
         az4UqgDJEWmxsHQTV8MnFnlwaF1b16vBTiK6c+tcN0bBUfamI/LBR/EQDY3qPGjil1cM
         DdX0M3it3geaYo0cJDyURBM5qUEGYTM6clvOmmfcdECoKGD6yFFvhqX2jBgQxQaA8xyh
         cPYVUxCm7Et2Kn48Yt9LI/jtULI+gNzDmFawW8tefI5kuEXCiyXbroEBYZG/jMh33XqR
         6IpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892757; x=1779497557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WBcpSskz4i7VuiAz2sQnUJMSd3u4qsIaknHE8pSV17M=;
        b=Lh16vpvrrxmtM9bvqX5qLIDlXBVpRei7LNOZu9AIKXxlzGJdHwuDMgYILfpmuXFPX3
         lPDtscIejSk8uhXAFhPcmPiIrGsvTfOJt2RK0MPlY4Fai8mOEHDAIfcBu5w1M0elVeI+
         7wSyEWtkIDy99DIq7CoE81UoZGymgF63GsQaDzjV+k/vxRm3WZ9aKMI9lkclQJEzFJ+t
         gETsS8q0Jo4Xggw2tKoPXC3N77yFAPUfpn//u//GqjuSok6XRzdTA7aXO2b03EIgPkZs
         DVl2stX11gJ2UmIhyo4Iq0gVM18NZTGFfjnl/LqyqUNRLnh+ww1eD4F8pyZIHjCNj/eY
         cB6g==
X-Gm-Message-State: AOJu0YxnXkizAlhwxMIxad5kzvttmK50RCwAYe/1VitvJl0SynhHzbGz
	6MV13k4Y+vldBWgPrpoZSBQoGvq4xFsTfMxQ+Pobex2DcbHSyCFJQi/S2qrEISTu
X-Gm-Gg: Acq92OEJbMeX0ljJUJqZrqkt5MvTqJcV6g4KdhTf89Ma4/yfrZqaP7wQO0xxaAUTCxn
	jQM10QsDFPLtozBhfLKZX8zxBR2QiDrfMh/5/FjpXiU0U5ErR1EM6nDoYGTM6s29+SLcJuqCzOG
	jpsQ61QdHwcrsfm7HjjhPL4qh8jBpdBa4wlhkM++0WYidgorVYsz4I17PVsgNIEl8R0kNz61vAz
	E9wxehO8TXNHJb1V6U/FTTHBPbb20H3U3XYbevhMMvHEvEna2WMhFbJ464dEQ4qgnCUmWtvlGSf
	KNNOYgkjFZ9Qk6wt4RjFTQkflInGjL1duNDO+tjUHTPeAOKk/Wv7q0C8KbxK2ra6sFqU0YPjCaW
	MDHqX8W6VD97zYJesCtRgmSnXZwGKJuWlzjs/YtI88on18ld+ds/v0cbIEY/x5N/Bjq2psWN3Xz
	lOFgIUWuqHurztxSJrapn7XpSP1UnF3Q==
X-Received: by 2002:a05:690c:c504:b0:7b1:d1af:4b95 with SMTP id 00721157ae682-7c95c8eccc6mr76943427b3.45.1778892757232;
        Fri, 15 May 2026 17:52:37 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:e::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f5c965d6sm38263367b3.47.2026.05.15.17.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:52:36 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 08/21] fuse: handle zero ops_mask in FUSE_DEV_IOC_BACKING_OPEN
Date: Fri, 15 May 2026 17:39:51 -0700
Message-ID: <20260516004004.1455526-9-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260516004004.1455526-1-joannelkoong@gmail.com>
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Servers that pre-date the ops_mask field will pass a zero ops_mask in
FUSE_DEV_IOC_BACKING_OPEN. Default this to FUSE_PASSTHROUGH_RW_OPS to
maintain backwards compatibility.

For FUSE_PASSTHROUGH_INO servers, an ops_mask must be set.
FUSE_PASSTHROUGH_INO is a new feature with no backwards compatibliity
requirements.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/backing.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 2234ab47406a..b499860e1185 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -119,9 +119,23 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 	if (map->flags || map->ops_mask & ~FUSE_BACKING_MAP_VALID_OPS)
 		goto out;
 
-	/* For now passthrough inode operations requires FUSE_PASSTHROUGH_INO */
-	if (!fc->passthrough_ino && map->ops_mask & FUSE_PASSTHROUGH_INODE_OPS)
-		goto out;
+	if (!fc->passthrough_ino) {
+		/*
+		 * For now passthrough inode operations requires
+		 * FUSE_PASSTHROUGH_INO
+		 */
+		if (map->ops_mask & FUSE_PASSTHROUGH_INODE_OPS)
+			goto out;
+		/*
+		 * To maintain backwards compatibility with servers that
+		 * pre-date the ops_mask field, a zero ops_mask defaults
+		 * to passing through both reads and writes
+		 */
+		if (!map->ops_mask)
+			map->ops_mask |= FUSE_PASSTHROUGH_RW_OPS;
+	} else if (!map->ops_mask) {
+		return -EINVAL;
+	}
 
 	file = fget_raw(map->fd);
 	res = -EBADF;
-- 
2.52.0

