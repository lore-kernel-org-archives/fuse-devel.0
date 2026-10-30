Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324771;
	b=nSTxo7cvTwsdvej4i9SCYjSnz2we8XNSOeX42sPyp2f7XlAZT3TQTe4VAxXgfXRex+FE
	 JXDm1+3dpbT0HzdVUMCjyb6yB97BrQh3Om7OPStEqgmcNAP4Uv/6g60Xqf1ezTLg3CEMv
	 23pNtdcbxqFs4lWDuNjVKGvV6UVdXDctyuRyzW9RWs1tcNnUskPADozQSwNz8a0DDnkps
	 T6RNqfZlvU4K4eOqHNIAe7NmtP6f2Omp2njpiTik6Nt3OPq7IakRgR4khX3oYxnWz4xDv
	 6jAFvqyV1idlm6U6awSIrV5Pb9A4NuDJyw97OxI46Xx7EN3HcVttvwVS9S/OCeMUv6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lCyrcMpBQiz0VtWC05/bFg8KKUJTwPO8EsDhKRgsAck=;
	b=DlOG8PIxUSCNGHeZOKEz+3lJ1dlp3FyR9yvP2nMDJOnY8PbTYUDSEIHqvzT988QsZRMP
	 tcj+r+6ZrzyEGm7JKbGifGm8K5dF9uEBQ2OHA3WQk/XfoSKkuNKxFopR9Q+VVkmQSiDId
	 c247hunrI4lyD140c0AKRuIsMM1oITpbxOwzFhZWADUl4oUm7tLG06FQABhLlMBPabqRB
	 /q8hYGFLhfAJlNW4GF6LZKywINQ5mDFWAFzu6ORuPBG3GpyWeEZTAkTA59W6mA2ZrJ/sU
	 GTRe+mYbhFRzszET7DfHQMfaBsJIChIA2hPC5EjH3O3hny5MWjAVMnkAhLl0PaXnv2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0h4L6eb3;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A2A606A322
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 01:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73A2A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0h4L6eb3
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-369f33df08eso525295eec.0
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 18:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793324771; x=1793929571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCyrcMpBQiz0VtWC05/bFg8KKUJTwPO8EsDhKRgsAck=;
        b=0h4L6eb3Hv31mOHVFy0z6w0ODCCOljbVkpifkc622GulTBsSPn7Uq3/o/2DBX1Xj85
         HhSZOsY4vunitvmK5dLWMl7PQD78VpVDMM1/h6gGlGsysiQqRRzah9sr3QvL+s8hZ4Nm
         7CbZLGBfQ8BNjm1Dh2sP6crG0KhMG2iDfeKqQlwjPgZwwZsf4MODGe1iVlYLyHVkVrd5
         ouNGNfMOP4PSzY6Uds9jCK8RMQiR1TjlT9g80umRotlsLXk0wdOtawCFKGoxQDwR047E
         6lQdO3+GRyUwNuBws2x2TfMdFFk77aKDJMYe7TVdqbYGB6O2h4gOp8t5b3N/EXaHkjo4
         Y0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324771; x=1793929571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCyrcMpBQiz0VtWC05/bFg8KKUJTwPO8EsDhKRgsAck=;
        b=zInDXQqmo9zIN/3wMLxmh/6w5FfEcOQ2sqw/0m2t8McCEf398OTCX42mGJh93qY87X
         PGACLZNViebgRRXH8vLfykFuLnNc6hkt5zSqDpleizEiTLAogY+x/4THr3zO6fX2zrwQ
         pgVO7YSRj8dKgIQYZ5tE1r1OjWrSm0UhDtYu5p2ViF3IGyqSWZR8jXXcLbdlGlJ62yWK
         V7B8gM/i4/8BQHSsuR+vAV6bOf9HBHJw733E7oHOCHHNELI+fdYvbyauLUFT84UTXqe8
         dgFkZ+Qzgw3xyQTHCKC+kpih9GjPTxqemMiaCAREc2vG8XKrjux4YIKkiibmMfLWZx5D
         r7uw==
X-Forwarded-Encrypted: i=1; AKwUvBxnf+OSDfSQJOcZh4TymuvkxCWS/SZsdelSfNPnKskpt91h7YhdfEsRoL3INKkUI4K2BHaf0nPTqU23@lists.linux.dev
X-Gm-Message-State: AFq9FYKquqCmoEEq5j3HXYDwaT1pTZprmnmBkb0KDKKRsbEIScq8/ZGl
	liAyyPVK8f+8a8o/Ysgr7ytwbvAz0jfisA9NzCV97uQQYx5ecZNw+yE=
X-Gm-Gg: AYBFou0XbiEvkGJQjjdBwbjz4D5F8fxsFViaw6K9AAhr39BAiO0R+j+oKXVngmnLVqH
	MN1v0kz59YnTdAyv2sPtO50ZTozrgOZ/oMdjquEIBCWF0Xx1XMUvBlBU8j6VX8RFrLoX4q9HEH6
	j+9GNrcLwkLeMJ3jJ98A/58+4JhAcMmQGWq/25xwu1MWkBbS9/2+9KXy1DcgwKe8mXYbk+BMOmG
	BOy5q9UT2pgkdQG896/u9LavQTORIVFn92L2kseGqqpZzj8fvlsaH4shS+OD20vPMqcyrI3qlxk
	z8B2hnSLLlMdXkHAx2zH4AELZWxsq7gcpZpsp0NpA4a8w+QzZmFxh7AxNOmNIgZppaL45JZMEen
	DWQNrAQwlazkA4gC/KaPBKR9pE0v0MBNW8IvLZoGQ0x3NAvYFttueLauKvZPTjbC1fSweF6nmzf
	Rg+O5AAXECQAz+suw3pHkTrFfRYb6yeiwg51lR3+CZUbwWzk9gWwO+1N9qIxztqkME/vCi9oOBf
	XE3AUccfWtiWmoH5/kcIdQQ6Llfahz4UlctUK4m/15Djr7qNoYkUKYNYTxAxw3xAGX+2IjWOoZ3
	4VWDroPd+1FUPS1oDQSejgr8If6RLjjBhgmHXvKP+kiv/fEfSyahQX3/Z6931IMAnx0HMbor8rk
	HLThYSLAFkH2YOTXUDQ==
X-Received: by 2002:a05:701b:4189:20b0:182:6c6c:d876 with SMTP id a92af1059eb24-1ac5cb1a331mr1177745c88.8.1793324770340;
        Thu, 29 Oct 2026 18:46:10 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:75fd:f9a4:4062:7980:1324])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm2209020eec.12.2026.10.29.18.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:46:09 -0700 (PDT)
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
Subject: [PATCH v3 3/5] io_uring/uring_cmd: support dma-buf registered buffers
Date: Fri, 30 Oct 2026 07:15:38 +0530
Message-ID: <20261030014540.3065403-4-anuj1072538@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030014540.3065403-1-anuj1072538@gmail.com>
References: <20261030014540.3065403-1-anuj1072538@gmail.com>
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

Let callers of io_uring_cmd_import_fixed() opt in to dma-buf registered
buffers with IO_URING_CMD_IMPORT_DMABUF, and attach the current map on
import.

The map has to be dropped at hardware completion rather than from
task_work. Add io_uring_cmd_hw_done() for drivers to call from end_io,
which drops the map and queues task_work, and warn if task_work is
queued with a map still attached.

Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/linux/io_uring/cmd.h |  9 +++++++++
 io_uring/uring_cmd.c         | 28 ++++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
index 23fb66a1e2c1..d4e17c2f59fd 100644
--- a/include/linux/io_uring/cmd.h
+++ b/include/linux/io_uring/cmd.h
@@ -12,6 +12,9 @@
 /* io_uring_cmd is being issued again */
 #define IORING_URING_CMD_REISSUE	(1U << 31)
 
+/* io_uring_cmd_import_fixed() flags */
+#define IO_URING_CMD_IMPORT_DMABUF	(1U << 0)
+
 struct io_uring_cmd {
 	struct file	*file;
 	const struct io_uring_sqe *sqe;
@@ -86,6 +89,8 @@ void __io_uring_cmd_done(struct io_uring_cmd *, unsigned issue_flags);
 void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 			    io_req_tw_func_t task_work_cb,
 			    unsigned flags);
+void io_uring_cmd_hw_done(struct io_uring_cmd *ioucmd,
+			  io_req_tw_func_t task_work_cb);
 
 /*
  * Note: the caller should never hard code @issue_flags and only use the
@@ -145,6 +150,10 @@ static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 			    io_req_tw_func_t task_work_cb, unsigned flags)
 {
 }
+static inline void io_uring_cmd_hw_done(struct io_uring_cmd *ioucmd,
+					io_req_tw_func_t task_work_cb)
+{
+}
 static inline void io_uring_cmd_mark_cancelable(struct io_uring_cmd *cmd,
 		unsigned int issue_flags)
 {
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index d77a94d19cb5..446bc8a363e6 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -10,6 +10,7 @@
 
 #include "io_uring.h"
 #include "alloc_cache.h"
+#include "dma-buf.h"
 #include "rsrc.h"
 #include "kbuf.h"
 #include "uring_cmd.h"
@@ -28,6 +29,7 @@ static void io_req_uring_cleanup(struct io_kiocb *req, unsigned int issue_flags)
 	struct io_uring_cmd *ioucmd = io_kiocb_to_cmd(req, struct io_uring_cmd);
 	struct io_async_cmd *ac = req->async_data;
 
+	io_detach_dmabuf_map(req);
 	if (issue_flags & IO_URING_F_UNLOCKED)
 		return;
 
@@ -132,12 +134,26 @@ void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 
 	if (WARN_ON_ONCE(req->flags & REQ_F_APOLL_MULTISHOT))
 		return;
+	/* the dma-buf map must be dropped first, see io_uring_cmd_hw_done() */
+	WARN_ON_ONCE(req->dmabuf_map);
 
 	req->io_task_work.func = task_work_cb;
 	__io_req_task_work_add(req, flags);
 }
 EXPORT_SYMBOL_GPL(__io_uring_cmd_do_in_task);
 
+/*
+ * Queue completion in task context after dropping references that must be
+ * released at hardware completion rather than from task_work.
+ */
+void io_uring_cmd_hw_done(struct io_uring_cmd *ioucmd,
+			  io_req_tw_func_t task_work_cb)
+{
+	io_detach_dmabuf_map(cmd_to_io_kiocb(ioucmd));
+	__io_uring_cmd_do_in_task(ioucmd, task_work_cb, IOU_F_TWQ_LAZY_WAKE);
+}
+EXPORT_SYMBOL_GPL(io_uring_cmd_hw_done);
+
 /*
  * Called by consumers of io_uring_cmd, if they originally returned
  * -EIOCBQUEUED upon receiving the command.
@@ -257,6 +273,7 @@ int io_uring_cmd(struct io_kiocb *req, unsigned int issue_flags)
 
 	ret = file->f_op->uring_cmd(ioucmd, issue_flags);
 	if (ret == -EAGAIN) {
+		io_detach_dmabuf_map(req);
 		ioucmd->flags |= IORING_URING_CMD_REISSUE;
 		return ret;
 	}
@@ -276,13 +293,20 @@ int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
 			      unsigned int import_flags)
 {
 	struct io_kiocb *req = cmd_to_io_kiocb(ioucmd);
+	unsigned int flags = 0;
+	int ret;
 
 	if (WARN_ON_ONCE(!(ioucmd->flags & IORING_URING_CMD_FIXED)))
 		return -EINVAL;
-	if (WARN_ON_ONCE(import_flags))
+	if (WARN_ON_ONCE(import_flags & ~IO_URING_CMD_IMPORT_DMABUF))
 		return -EINVAL;
+	if (import_flags & IO_URING_CMD_IMPORT_DMABUF)
+		flags |= IO_REGBUF_IMPORT_ALLOW_DMABUF;
 
-	return io_import_reg_buf(req, iter, ubuf, len, rw, issue_flags, 0);
+	ret = io_import_reg_buf(req, iter, ubuf, len, rw, issue_flags, flags);
+	if (ret)
+		return ret;
+	return io_attach_dmabuf_map(req, iter, issue_flags);
 }
 EXPORT_SYMBOL_GPL(io_uring_cmd_import_fixed);
 
-- 
2.43.0

