Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680356;
	b=jFyglVU6gUVrkB6EzgCcIafoCNwkZZNEszYfGCkV9KfTs2et1AFFCOoqcTvILLiIFOTc
	 RLwYyKDQqSpEejiYHa7VDIBFnCTv3mAR7yAE32tDGxT5y5702EqjvCeoZbjoLKO5f7OaR
	 VhLXw3WA/FPqxZ3G+mD9d65Gmgv6NTBh8OsmPcP6oVxv2V1rBfd/zaToFS31/PDVzNzmb
	 5NHeAvDW3817FyWbAvjOYstP0AGkxYpByVbHklu5JGHolr/mjDyHp80UFWJNPJwUKEEYl
	 z9wfVV6aCCEwL+vHhMDlN5xhAaToIa03gmkLIrfcRMQhVD97XkNU9noin2/PyQU54Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zxlzuK4b3EjXwKJngq0cBhTK9G6JWxv2Wu97XDb3XjU=;
	b=s5tP+yI6WSbGCKsFFZK4D1dHs8PvQ18mId7FH83NYzBPv9vkKt2ehumlURXjU+FTbqFI
	 QmP9Ym01dBdzZ/YdYDycO0PzwqYTFp4jki5wMqNWBrJSbV448QTF2XWFcfZBZSr29Ba31
	 nBlf/kE1pFTYzqCb7aGkdCXUodmbehCRjEFasByFAKla/+Ca481YOzGKpIuZeH1yWRkL7
	 g/WQ2MaTDqy+NMN8A9b5NIkc+yjkX1qDeuoTf6BaqPLYie/Wlo6K0SB7cYMlx1iCBeEdK
	 YJh/T4W58H5wZqrt8LOFtFb5qwOBU4dNFlWwiO8uXcXxPiqvHdBTmv0ezwdobYqijew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oIRnvZ4k;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87571606A330
	for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 14:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87571606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oIRnvZ4k
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-181516de561so575857c88.1
        for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 07:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680356; x=1793285156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zxlzuK4b3EjXwKJngq0cBhTK9G6JWxv2Wu97XDb3XjU=;
        b=oIRnvZ4kUqNVRqU4qZJLUJw5cNdFEj3R7tRqB+YZpn0Q9qvFsA7F+FQ+JyEICFB84x
         Tq+DJ6lJ8AezkbCAF1k54e1/z3afm7czgGBotVgbY4bWY7FsU3lURYHQOl7ZcefI+7lZ
         zVSEUVgKfAYG6Asb2/4V0gl0RbmoYTI8hUAa0InYvUIN46wYF1JHS/lNdHydsbMie5mB
         1eNknUlJQNWeVdL0qaAoi6JYmBd5onlW1KWW5JfduCw3on21yzVyed6ZA1lljecm7y6t
         hFNH6TcR9tcTIuSrP+402CfuNtZABNnW3c073Ig0sd7yinfAwWlw+fqNHvlu81f7ruon
         hFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680356; x=1793285156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zxlzuK4b3EjXwKJngq0cBhTK9G6JWxv2Wu97XDb3XjU=;
        b=ubTxJt0znWEpu0LNKaBL4gCott6c232MNdLDWQDGUIDxnJQQpEqVO0Bsx7YzlANSJL
         WqV6rm2ymdcVG614IxBohXe2ATXnjKQtBK+rhqOskuvID0ONG12hxqlV7UYJpT4CF/SC
         fvxQ+piU0GNsfdzVo6lo3djk25yWs4KKKA+w1hITqCxFI71NIZBfX+15i9VK3NKSJyoq
         1f0prCIs5ToI1noCs2D9qaq9aOxd0gDXxUtqOgg5nabRBPRq8QWTb1U4+cV66clJyAkW
         sB1mKmLf70Th05XA6Xsgrb614wuuQwzXf8USfJilM1JUG2YMlIfqyRzmJN6j/PtFQg3o
         2LBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuqu4JRkKU68zelBpCpdIlCX5+RwdPqDx6g/8jBBJEl5koFVPcl8sPKD1O8ZjjGTM/+6Rj28U0iLJI@lists.linux.dev
X-Gm-Message-State: AFq9FYJSzJvhSyMVnSQrVgDyJclQQeGwyDmq5HjCQDC8C3A+j6aD4qqX
	Pgj/Pom+Cv/EQdFxQMXQY20RS0kN2QFjht3FytAQuS9oGggWyvzqByA=
X-Gm-Gg: AYBFou1k8S7HPzmrTEOle1tcu/AiNuLFcF3A6Z//uf+kGcFcw6FNSP3pWnMnv/h7OCn
	9dfzAXfL3QwyBe/N6K7/GQS7u5W3gmBxPB9B0hICwjZWIcmDia804A+QpflLd6GgiyfiFarMgIc
	/QgKrKdEpDXHSm1+xTAbl2tES3kXvnYeKhyZBOq0h4xn9manaaJekuwpuXaXsbdCGk0kIkfyEvy
	oeCtkGmcgAq40agHgTcJ+I4LBC1MbOrtSuu5O0JjLsJWaXyxFeSP5KwhLLeMFPFCAZIjMEqv04V
	fzKZEPoYWWvpz5ENj7xIxAAcvjRQ+Uy5YL0kxgytvI5yQSZAuI8ML/S7CV+kyzW0vWt2GQnOjzT
	KKPIbUPftRYj1U8/s3oOuLy5nHa/8MZJe/Dse9EpVEYRtoXYRw6nucKlqdAEiO64abuRsMvI6i7
	99ULtO8f+NcJJSvdGojNbbXc36wIniU6PQEwVnhxHvruGp7myfvNz1ZuJLUBr2ySQDBTV6BvGry
	5M6o5Piajznj+Aygg7YfJ8j3DNcRLnYC+Qu0lHQgEoIoLWgpdZEMgQIOfucutRRLBwZ9jiyyFA7
	2MbaJ+WPtwizlZqv+DCL7RVGdbVpqAai+PBrylztETE=
X-Received: by 2002:a05:701b:4241:20b0:15d:d7a2:3a88 with SMTP id a92af1059eb24-192f03cb835mr3210408c88.18.1792680355569;
        Thu, 22 Oct 2026 07:45:55 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:e55a:5016:92c7:7a35:f3ff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm23625880c88.5.2026.10.22.07.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:45:54 -0700 (PDT)
From: Anuj Gupta <anuj1072538@gmail.com>
To: axboe@kernel.dk,
	asml.silence@gmail.com,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	bernd@bsbernd.com,
	joannelkoong@gmail.com,
	miklos@szeredi.hu
Cc: io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	joshi.k@samsung.com,
	anuj20.g@samsung.com
Subject: [PATCH v2 2/5] io_uring/uring_cmd: add import flags to io_uring_cmd_import_fixed()
Date: Thu, 22 Oct 2026 20:14:53 +0530
Message-ID: <20261022144501.2478417-3-anuj1072538@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022144501.2478417-1-anuj1072538@gmail.com>
References: <20261022144501.2478417-1-anuj1072538@gmail.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anuj Gupta <anuj20.g@samsung.com>

Add an import flags argument to io_uring_cmd_import_fixed(), so callers
can opt in to buffer types they support. No flags are defined yet, and
all callers pass 0.

No functional change.

Suggested-by: Pavel Begunkov <asml.silence@gmail.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 drivers/nvme/host/ioctl.c    | 2 +-
 drivers/scsi/scsi_bsg.c      | 2 +-
 fs/fuse/dev_uring.c          | 2 +-
 include/linux/io_uring/cmd.h | 5 +++--
 io_uring/uring_cmd.c         | 5 ++++-
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
index 3aa5d2f2dfbb..612d3009dd29 100644
--- a/drivers/nvme/host/ioctl.c
+++ b/drivers/nvme/host/ioctl.c
@@ -533,7 +533,7 @@ static int nvme_uring_cmd_io(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
 					ddir, &iter, issue_flags);
 		else
 			ret = io_uring_cmd_import_fixed(d.addr, d.data_len,
-					ddir, &iter, ioucmd, issue_flags);
+					ddir, &iter, ioucmd, issue_flags, 0);
 		if (ret < 0)
 			return ret;
 
diff --git a/drivers/scsi/scsi_bsg.c b/drivers/scsi/scsi_bsg.c
index 5eec248a77a6..e53b417c27b9 100644
--- a/drivers/scsi/scsi_bsg.c
+++ b/drivers/scsi/scsi_bsg.c
@@ -87,7 +87,7 @@ static int scsi_bsg_map_user_buffer(struct request *req,
 	if (ioucmd->flags & IORING_URING_CMD_FIXED) {
 		ret = io_uring_cmd_import_fixed(buf_addr, buf_len,
 						is_write ? WRITE : READ,
-						&iter, ioucmd, issue_flags);
+						&iter, ioucmd, issue_flags, 0);
 		if (ret < 0)
 			return ret;
 		ret = blk_rq_map_user_iov(req->q, req, NULL, &iter, gfp_mask);
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index c6dd420c4034..5cc206abccc0 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -727,7 +727,7 @@ static int fuse_uring_import_payload(struct fuse_ring_ent *ent, int dir,
 
 	if (bufpool_registered(ent->queue))
 		err = io_uring_cmd_import_fixed((u64)(uintptr_t)base, len, dir,
-						iter, ent->cmd, issue_flags);
+						iter, ent->cmd, issue_flags, 0);
 	else
 		err = import_ubuf(dir, base, len, iter);
 
diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
index e18d4af62e1a..23fb66a1e2c1 100644
--- a/include/linux/io_uring/cmd.h
+++ b/include/linux/io_uring/cmd.h
@@ -64,7 +64,8 @@ static inline void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64
 int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
 			      struct iov_iter *iter,
 			      struct io_uring_cmd *ioucmd,
-			      unsigned int issue_flags);
+			      unsigned int issue_flags,
+			      unsigned int import_flags);
 int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
 				  const struct iovec __user *uvec,
 				  size_t uvec_segs,
@@ -124,7 +125,7 @@ int io_buffer_unregister(struct io_uring_cmd *cmd, unsigned int index,
 static inline int
 io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
 			  struct iov_iter *iter, struct io_uring_cmd *ioucmd,
-			  unsigned int issue_flags)
+			  unsigned int issue_flags, unsigned int import_flags)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 45c9c845f5d0..c2bc9dd242ec 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -272,12 +272,15 @@ int io_uring_cmd(struct io_kiocb *req, unsigned int issue_flags)
 int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
 			      struct iov_iter *iter,
 			      struct io_uring_cmd *ioucmd,
-			      unsigned int issue_flags)
+			      unsigned int issue_flags,
+			      unsigned int import_flags)
 {
 	struct io_kiocb *req = cmd_to_io_kiocb(ioucmd);
 
 	if (WARN_ON_ONCE(!(ioucmd->flags & IORING_URING_CMD_FIXED)))
 		return -EINVAL;
+	if (WARN_ON_ONCE(import_flags))
+		return -EINVAL;
 
 	return io_import_reg_buf(req, iter, ubuf, len, rw, issue_flags, 0);
 }
-- 
2.43.0

