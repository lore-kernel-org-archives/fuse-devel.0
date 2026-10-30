Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324760;
	b=f0gtBTqVfvODP5dH8NNBmQXcI/8gpIPouu0m7tfyrI8KxNSrthK5e0/+tlgEFA+p5Kw5
	 ZI/TYCWz8leaqmR0mUKhQZPCD8K7d18tSsHU3k4gqagOUy6JHCZiWmTVvrJhmwsYFFJxT
	 QNM78xTKMy09ocJJunAzeY4u+FpLeM672ncOo4BIbkZgLSWnaNycJchV7sxrsuSdI1C4w
	 w/8NkRsvc1DN+d5OeQqnNdBtcmEa0vmcAUuvIJInn8fcfbq0L4QDTfccTAPwoS27r9kD4
	 2a4UCxKmJ4P+2PrW/n/M/WPJ0n93zxqmAO+jdItx6zSAnkso4p0g7qRCqwqXZIdE+Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ODvSAgyV/h/yeJCArNYdVO3F0icLZBSUlmTqdaSk0qI=;
	b=PDH2h1Y2AIVWhuhIX9zfyL9dn36mCWfRh0OZnt/SFV9fyC3bnBcgRTTkWdOwpVvogABj
	 yzeLLnydJf8cWV4w7dTpzwzpMiBw5UsX4bGnQesFKst4ydVEpIcqiKbClPsFuNCPciVLn
	 8WNeJk3mi6M2AC3avrjUkoY3DAggbZKRYkFmsLyqVjNFzXZA7x5YjEBbqb5D99yJwqhpx
	 GzkAZQF7EWvyCbpo9uplXVDejz6bponOtR2mJm1yg7Bum8P2VCSyKV9RiIyt1LnFD9lJl
	 nxUYdpATcHOmaZXNaJabARBAHVEdhhCyx1Rh0nRJWOTXMOVSA38uJkeUVoO8Ze6Z82A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnGyzGRK;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3278D606A31D
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 01:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3278D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnGyzGRK
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35c76e9614aso409579eec.0
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 18:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793324758; x=1793929558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODvSAgyV/h/yeJCArNYdVO3F0icLZBSUlmTqdaSk0qI=;
        b=ZnGyzGRKBUrCGwBJfy2LDdGIzFujNj9n/uILdZOTrxtqI4/r1i37RRlbs4phXhjRE2
         bFkgwk1bivNVmeg/EqPuuyb+cDUMChSToP5v13LV0USILny/bPSlrkRpoebu5gU6UdUD
         fCE9uR2oMDCFfYEgtjsiPkaYB7kTqj11ZFN2ar3TzcyLbrL8e/42AddZS7y4IkygFYCe
         utdmQQdavOz5Hu56TihwriEP8lAT9Tayp67ncfq4pDL6OicmC8Y2fWuVt6jE0DixYRRM
         rviaQM4oLc8r176fYgwJIJSHHaJSocu/ZNheKWpnJPZJSFQVZv5JHyZKlxnUMYNLmfGl
         rdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324758; x=1793929558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ODvSAgyV/h/yeJCArNYdVO3F0icLZBSUlmTqdaSk0qI=;
        b=yJ7mY5cU7MJi15H31st3eY0piPnYlf4KK1h7tTFwOWsk+m7Q7G1TCmb6NN14GQdaBX
         rj/ZN7T+RbPIejUDiwNri2g6mJqWaulp6DOKac40KtEzSKdYyJCMRQPIqJ9EwZfDjbRQ
         KUt5kq3/kKHCYL49pBZ29KCxKhRuEhYhzORgKOs6ztv0zJEZ8N3y07DoU9AdkujesWAW
         y0ISjgSl0hz23At3EpThbv7SfdyJguy53xEvfyvG/v5irXTiR5nr+dzGCNvOF7+19d/U
         7ocjeU4L2DW3GqbooZVh29J9cxWxYjRJ/yybfp2X70++Srn6nIp7O2Ecmup9UYr3thT3
         57MQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7t92s7CLCpmbe7WbawNEsfpbOPEndr2YMMI7/BMVWXWz7DjZALJ/ZF7pg5IBOqEeCW+g1qpUqAGBc@lists.linux.dev
X-Gm-Message-State: AFq9FYIU+aDDbPvDI3BrHPEGn5VMtIRgUoqxKN2OSsZH+bOKjtU8y/yi
	tsiI/Fu48dctwzOQ+AXxWOruhMfaubNlUzgc59TaZBzNsstmPvLTAvc=
X-Gm-Gg: AYBFou19/zpFh1t3Uo825KJcsvTACd89oRcHIWePh6zdoK03Iml1c7UQXm0J9LxufRH
	hCRcG0SQCEnwr5iuHwhBcK08oKWibjnv2FjnKMYOm5xAD8SSdB/zvDoglbr+dGsj84IBC5/Li6j
	HLM13O+52i1UrSO0kw/+xWz2WBYp8h568RVS9g8L2U60jVaaVD8g/spf5+Y1TgRQpJKpj7Hl3p/
	ae/KR91Jq4Bs6t4DpqKNPdJ5h1Y5A0X+zwDj0sJ/1J+MVW4/EAMVgINvit0ncdUTL5wY2VuQBXS
	JJj0wWJX3YcDfL6/MDqyIilWRvLGo+MGWgh3qCrwApMC8UGYhM9uN0L/TsdpwYHGoOPJVpBOX/I
	otgXYBPivARoVtWmMOZFYBc3ZCU/quOu0RFdyEsMPPxwAJU/Ti5myKhsQmI9hjkO84v6dJcrdWu
	EhYXT7YbB510kZeTXaSNP97NsZc5vfNOX3/xlslZR7Vpy+4pFiO+XYQap2F4+dHUZX0u0hQRhsm
	uuP8FF30hQWdluu9Y3WYlSkzt+8TKI5DOIO/6RFRfAwnDM5NPNWMoOT+YR0IcNfVpf0aAaKjwCe
	0BadEx769DU6Idi+DsWZbgWK2WTMHAoSTxTu4LQpL6FG0ZLBXAbeE+cwLhS4HWWT+/LSdMv3/hi
	LDIKyNYGuuQ1tZNKe
X-Received: by 2002:a05:693c:639c:10b0:36a:1f8:a56e with SMTP id 5a478bee46e88-36a423bb931mr1471206eec.23.1793324757946;
        Thu, 29 Oct 2026 18:45:57 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:75fd:f9a4:4062:7980:1324])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm2209020eec.12.2026.10.29.18.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:45:57 -0700 (PDT)
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
Subject: [PATCH v3 1/5] io_uring/rsrc: pass import flags to io_import_reg_buf()
Date: Fri, 30 Oct 2026 07:15:36 +0530
Message-ID: <20261030014540.3065403-2-anuj1072538@gmail.com>
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

Give io_import_reg_buf() the import flags argument and drop the
__io_import_reg_buf() variant, which only existed to pass them.

No functional change.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/net.c       |  6 +++---
 io_uring/rsrc.c      |  6 +++---
 io_uring/rsrc.h      | 13 +++----------
 io_uring/rw.c        |  5 +++--
 io_uring/uring_cmd.c |  2 +-
 5 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 533afd335627..5d0f7c0a1825 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -663,7 +663,7 @@ int io_send(struct io_kiocb *req, unsigned int issue_flags)
 	if (req->flags & REQ_F_IMPORT_BUFFER) {
 		ret = io_import_reg_buf(req, &kmsg->msg.msg_iter,
 					(u64)(uintptr_t)sr->buf, sr->len,
-					ITER_SOURCE, issue_flags);
+					ITER_SOURCE, issue_flags, 0);
 		if (unlikely(ret))
 			return ret;
 		req->flags &= ~REQ_F_IMPORT_BUFFER;
@@ -1242,7 +1242,7 @@ int io_recv(struct io_kiocb *req, unsigned int issue_flags)
 	if (req->flags & REQ_F_IMPORT_BUFFER) {
 		ret = io_import_reg_buf(req, &kmsg->msg.msg_iter,
 					(u64)(uintptr_t)sr->buf, sr->len,
-					ITER_DEST, issue_flags);
+					ITER_DEST, issue_flags, 0);
 		if (unlikely(ret)) {
 			kmsg->msg.msg_inq = -1;
 			sel.buf_list = NULL;
@@ -1536,7 +1536,7 @@ static int io_send_zc_import(struct io_kiocb *req,
 	if (!(sr->flags & IORING_SEND_VECTORIZED)) {
 		ret = io_import_reg_buf(notif, &kmsg->msg.msg_iter,
 					(u64)(uintptr_t)sr->buf, sr->len,
-					ITER_SOURCE, issue_flags);
+					ITER_SOURCE, issue_flags, 0);
 	} else {
 		unsigned uvec_segs = kmsg->msg.msg_iter.nr_segs;
 
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index e0345c3e764e..e9e4221ef86f 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1366,9 +1366,9 @@ inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 	return NULL;
 }
 
-int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
-			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags, unsigned import_flags)
+int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+		      u64 buf_addr, size_t len, int ddir,
+		      unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 418d236152ff..6226c7862d4e 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -66,21 +66,14 @@ int io_rsrc_data_alloc(struct io_rsrc_data *data, unsigned nr);
 
 struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 				      unsigned issue_flags);
-int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
-			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags, unsigned import_flags);
+int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+		      u64 buf_addr, size_t len, int ddir,
+		      unsigned issue_flags, unsigned import_flags);
 int __io_import_reg_vec(int ddir, struct iov_iter *iter,
 			struct io_kiocb *req, struct iou_vec *vec,
 			unsigned nr_iovs, unsigned issue_flags,
 			unsigned import_flags);
 
-static inline int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
-				    u64 buf_addr, size_t len, int ddir,
-				    unsigned issue_flags)
-{
-	return __io_import_reg_buf(req, iter, buf_addr, len, ddir, issue_flags, 0);
-}
-
 static inline int io_import_reg_vec(int ddir, struct iov_iter *iter,
 				    struct io_kiocb *req, struct iou_vec *vec,
 				    unsigned nr_iovs, unsigned issue_flags)
diff --git a/io_uring/rw.c b/io_uring/rw.c
index 3a8559ff4dc6..327215e0f8b2 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -360,8 +360,9 @@ static int io_init_rw_fixed(struct io_kiocb *req, unsigned int issue_flags,
 	int ret;
 
 	if (!io->bytes_done) {
-		ret = __io_import_reg_buf(req, &io->iter, rw->addr, rw->len, ddir,
-					  issue_flags, IO_REGBUF_IMPORT_ALLOW_DMABUF);
+		ret = io_import_reg_buf(req, &io->iter, rw->addr, rw->len, ddir,
+					issue_flags,
+					IO_REGBUF_IMPORT_ALLOW_DMABUF);
 		if (ret)
 			return ret;
 		iov_iter_save_state(&io->iter, &io->iter_state);
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index b5486b56ee0c..4dac3ba162ae 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -279,7 +279,7 @@ int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
 	if (WARN_ON_ONCE(!(ioucmd->flags & IORING_URING_CMD_FIXED)))
 		return -EINVAL;
 
-	return io_import_reg_buf(req, iter, ubuf, len, rw, issue_flags);
+	return io_import_reg_buf(req, iter, ubuf, len, rw, issue_flags, 0);
 }
 EXPORT_SYMBOL_GPL(io_uring_cmd_import_fixed);
 
-- 
2.43.0

