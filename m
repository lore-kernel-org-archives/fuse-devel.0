Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680363;
	b=OMGdvXE5/XTxrZ9Css/zaFTvgkJLu2Pmz5ezfO3exHmht19e6n91LUT1hFBOWFJ3MAnX
	 h1wwQVndISbmyYPLLzJmgcdjX1j1cI4Y1dsul99jZx2rnJSEEP+SDgLKBbpb1qykjArdN
	 aiAR54VDCWwCnIwfib8Ut9Si0IcD3fsuOzQeHfg0I/o5FTCbhP4Jqb+v/5rmMOm3BqIIl
	 BtXd/PAcoZwem2XByZ174T8tRbrLb/iEt2SWhg7p0AKPUxEOYBfyOganY8snSGwIGrxQO
	 m69VASyfHz7sT2ybK5BItQPMLtLoo7Y3t/sKKkyBkDmuF4XXZuJbER4i39m1cEQn2CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FUBUxv2+cLHIibfRDgDVbzcbIlm0UwZa4nEXrVqB/pM=;
	b=imnoRqqgAC435hH0CiE2dxVvco9zNN/hy3ZqHdstSdMM8OqkOtliOcAnnh/wbHz0qFpN
	 7aU7MItVU8aNCg1oQl1R+VWryuV8RtilWVTGTbymfNcGnCGaQ5OL4Q3GNcKKgRbocObpZ
	 UwbBacyK9JETI6QXIAVNDYrIe6sceXxRxhxbWm/idgf0lb/Xew/lZCSKCb3TQOXxfE5Fe
	 QMnN+/X2nLzmAjNu3AyUCC1wca8hy2iBLxxLCtzrc030gE6GGiTO+rMlHYKbyl6qlZNR6
	 acyn2+u4+PHAqQlE1c884BG2SmyEo8DDfo1tu1MdYcYKjb98dwHs68pXP0iESHV37DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AVycmGOr;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E66606A321
	for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 14:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E66606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AVycmGOr
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so4403272eec.0
        for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 07:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680362; x=1793285162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FUBUxv2+cLHIibfRDgDVbzcbIlm0UwZa4nEXrVqB/pM=;
        b=AVycmGOr+SzqIGlrMT7HnYEFMyXqnQuohIZnRGso8E20IAJrcEzWnGndjOPKd2YiLq
         8tIsuz/Csp8NsYRgUkSSrfpMjZRhTIoi8DAPAcgGvmZZfbH5k0Ogz2SCKrLD+gA5c079
         8tVELAkIARnhKJNCmwoybBLDzIfuMZspL3tLjfQIEQB2qurr5NAT7JXYeP0yzJkUB+La
         eeHKdYvr7ON1WMix9dLevEe4vZbNkubz62q/mscRhTWHfYwtjhJDwKpGEvhbEsUiG/7w
         ba3SO0An+1GWPjEzwDTbdFx81nE4dQG8RdVFlaGHZpHMNauMuNMk+jDR6UB54v44WU1T
         tknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680362; x=1793285162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FUBUxv2+cLHIibfRDgDVbzcbIlm0UwZa4nEXrVqB/pM=;
        b=ErtVaIsq7BavDdkqj8Qn/yiJqeNoSHpP+cne4UiY2zkpOQun/+sG45i/S0hxWmBGlt
         Sfu9PnClAP4HkZz1frxDhP7853mrMB2ZoGvxNWGfSTtPSUjG+IU4iCNvcG8rwY9MMwfd
         l/zkSsTfW/gbkAr0Pjv3QwoqVQJFmlMmEMY5fA4lcxHPa9wTGtpn8o3V1wlv8D9vf30e
         2PL62MLo99Y+GqeRRILLblY0kyctO/173/8wmU/zJdzbmeeUcmuF4dt1sydLfyDREqZU
         75KJ1FyoS++aD+dwxrJMSOpCRIrXdPWLsnzbpMTzElA93mq+TOKbMjyb1OM8l9ErEaYJ
         3c8g==
X-Forwarded-Encrypted: i=1; AKwUvBxiL/6kjJFPmCQewzLrL4/ys7Rs7sIq0Gv5g4zcnlIMcEXeOVBHdmTHb4hwVisPxd7apvZ95J8AcC/t@lists.linux.dev
X-Gm-Message-State: AFq9FYKiWssSCwY3tNmDEvHGPVJOn2sUijeHgvxSCqjSEC9qro3GRHwh
	kq5tQPzfmY2EnDRQ8n1l9BpoAhkcuLPTovlt7YUnbYL6TLvJa0YYU54=
X-Gm-Gg: AYBFou3ZQvYlm/OZM0q0rOgrYXdJeQ2j4o3f0RG+upZvJmtzXoqS85T/vy5GUVm5grG
	2k/EJNHW6IRYIdl6UZdTxqmKjqc7HlcElNrK4u+MIu+SEMU8Ua0W2KRVk6b3Mr65hUCPyS28dPu
	RlzVAjGGcrj1oa2GS/UGBMnTAm4PDgZi3VZAkJZsT9PdHRJUniP73bFsnxdO2Vby1hG0Eid29LN
	T6/XK8CkFUXvXzFahUuwi+bNHv7aOwpObyXpt6Jjaw/mqLOL1F+gKFR4nHGSA9WriK/9KydbDnt
	kEQxcI9Ip+o28Yh/L14dvaIVZr0wD0Ib/527NFVQ9QXk6QCwxQbePsf2uIWi1VcUsYHGk3HBYlp
	Cm1VIg1inpomH6vG6j//qav0i8X1xxSaMPhowq+O+krgNe9Oan9bmjtUd35eEK1hSSDXifnCuCF
	t7j63hajwqqZwiGHnhWUUVM+X0umNs+8OPLJ080hfjSlW0Wbp7xb3IvrXeoutEtqNrcZqhATP4x
	9Z9BrePlQ8JLYZEMmrLRmsP8ArtQJ7hqk6hPlWaMwI32flNa/kVEXnfEPGf0K7EsSKcqNXaVrBB
	4Nv+y+V7e0b/xQLmFLCn9F3fB6lghgvpi6oqWDreigA=
X-Received: by 2002:a05:701b:4584:b0:166:862b:9bcc with SMTP id a92af1059eb24-190a51e584cmr6626141c88.18.1792680361951;
        Thu, 22 Oct 2026 07:46:01 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:e55a:5016:92c7:7a35:f3ff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm23625880c88.5.2026.10.22.07.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:01 -0700 (PDT)
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
Subject: [PATCH v2 3/5] io_uring/uring_cmd: support dma-buf registered buffers
Date: Thu, 22 Oct 2026 20:14:54 +0530
Message-ID: <20261022144501.2478417-4-anuj1072538@gmail.com>
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

Let callers of io_uring_cmd_import_fixed() opt in to dma-buf registered
buffers with IO_URING_CMD_IMPORT_DMABUF, and attach the current map on
import.

The map has to be dropped at hardware completion rather than from
task_work. Add io_uring_cmd_hw_done() for drivers to call from end_io,
which drops the map and queues task_work, and warn if task_work is
queued with a map still attached.

Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
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
index c2bc9dd242ec..c89f154190b1 100644
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

