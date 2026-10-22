Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680350;
	b=yUj0xbQ2KwV4+qRPu9J+giPwjjyC1ZR/zjXmhhm1zGwJVYvYZkJinGDgvdLPNiEJnrdx
	 7wWsYk/zQFlZII1X+khj4AZd6zeZdxhflMROwgvB/ioL6SXtehqBlWOUHPNNoCknGMsnB
	 yJN0CQX4xwA+RL7u4vk9FTUhnju3Up4o3iG1w15ROezQuy9KHPWfltB2TdsPG8KMsgdT6
	 d6fvW3qBTiBWsvIgAWAsqhe2LAZpDcbgMQ9VmQcuwprY4nihhFCWhHDJLL7XigvpAXTKB
	 8/siUerkGw/jIfOB7HRwIC5z2f+XhLBIY3rHdtszZnv1996GAt3XkGNknrpvJoWOUZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8Bvapck2YZWyHBU4/NPzDAoWoqpmu4MGPJ1W1o84MUI=;
	b=UNxYogOo3ucd2XIpAjREWgj6Ehkej6qtg5Dn/3d/R331YtfDPm6IvOlKNU3lzhtdV/xR
	 N7NkNExj9GXoLHIl5hmAF4RSRee+ch4UVN9CUzXTbufyUcfAkin2TdaPL8AUANOMu3KoY
	 I0zO9XaEVxCyKb++i0zo0Wb3AoP/2WEyWP4UlH/h76I6hiv97sNX7x1abps/N/SH/rd14
	 t0BuSNiwNx3lw5Ira8y84ZHfzMLUTe9k4pFIqHNcgsyCLEh+/3ucbTtss6WO3n4FF7hc+
	 ZBelFb0bI0nOSy20to54iEFxIP8lsO+pcjfvlIKX/cu1rvHqrdarSCQP/iBIOYs5+Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iTqbwBQb;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC31606A31D
	for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 14:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC31606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iTqbwBQb
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35b2c599f43so4290059eec.0
        for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680349; x=1793285149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Bvapck2YZWyHBU4/NPzDAoWoqpmu4MGPJ1W1o84MUI=;
        b=iTqbwBQbhHOTO40BgFjA5/LGDvkVdCmmz8DBye3Gpy6m17xnfnFD9OJWn+rRdAZCnB
         HV5eqEB/eBrlm3gdKdlDhNpsyLHOFKULHTBeoWiN7y/gDVgd3p9QBCkpn3rAFOJIn0Tk
         lhWgcWyihcJQANMADbUJAbT9t37ur4qrX+hWThCjSEI0jhMZ0fQF54w8zOtLs3a/hWhK
         rQACq7mtvwi5O4shHzwJ+ANZ2QYX4VwC6zwo5gR4QGW4DIDogONBwLS0yxdeySv/MKhC
         +SzHHIl/hejoU0ibittEQogQkbSxiEvIYaL8f0s1rub8gIOMWhZutqjzT9md9tvTxc3O
         MtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680349; x=1793285149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Bvapck2YZWyHBU4/NPzDAoWoqpmu4MGPJ1W1o84MUI=;
        b=EYoiZo46V1f9XBWap6s3aBR8eUgjGmfOixF2X/QPfr61Pkv7bCH10KvaDSEZNRIXPn
         3N25Uf7AVqTi3ItGa/9t0cpbTpaZ0tSc/mXRQcRqe51Ddo3AnniMb8vGMRGK+aGUF+UV
         R8mGw1cm3a1OFHRMPKU0w0McmOXeKJbSY6J+a3pymXe0HVnvi7XCLDnJCyiDL/mixGxu
         AEhaAPWmIWeSA6V63jSzZlghdDcGUodVLaD19lk5l731V5U1fKctaJE87+ou00F+PlMx
         zfh3qaKkpwTBgTRm/chzPRRkyPzLrwKDMY11x5LEvlt1ERZ9wbWvb2OT1dRsuTLHyhLv
         OVYw==
X-Forwarded-Encrypted: i=1; AKwUvBwfwbiAj7Kqr/dfINXcTaAo3dzBqijRmCyz5toxZsWLcidj8hbZSAWGDj/lf/YdM2VoDb+qMJ528jbd@lists.linux.dev
X-Gm-Message-State: AFq9FYJxXwlt3nRv2pUsCKoo+5f7oiz9BEXr0YhtiPvuOR3YKCMGwdqt
	eOTfG5TA1GdsY8Hc5ZwAGJ/23t9A71eQGD0IxIpq5tBuxwEptcGUdPY=
X-Gm-Gg: AYBFou182JNHAI+iX7L0QPwH1PHd6rsoFT9utOfoBh/tYblegJjaIdHZ76ySjNdalrA
	Ewze5HaVhBX9u6CLiHmZIHzQLNIhr282aD0zc80uoJmG8XjkuTO4ISD1Nk5yhbM2vx/0pehhBiL
	LlzTqo7tz14tdl+CSJe2kMVRnxArhDxkm1kn6CIkk6f7Oc9mdoG7U6lZy0ewkXrXPhVk3QPHMyw
	I+uGdljnaLC/oUSENY2/i/8g3ry23LvFPZk8AxkIHt+8JhQN9R8hUtKtlzmiR+zz2tk16NQj/EC
	gTRkqQozrujpH0DMlQF9Bc13BEMuTRxw4mmpBp18wjydxA5jDRG2cZIxNaE63o85g/wAn1dMVqL
	35ssFuQP1mApjlVMkSyaqN2AUjXE+xymbjbeH/pxwpG0gL2eLhbSTZe6SsZ5jFsc3p98yF4b6UC
	nMp9aegpSimvsAiMgSy8mIfaZu7ocVXT4ouj3O3ipvHstR8gdlnJhRwhAYhsKLE2zlaI2eAPPFf
	3zDoAnhPgsni67RCfgvNYWKrqq0OLtfUptnUdv1XXKjwkozNG/8+t04F6HsZzIu5pzT3iCuIuVN
	1hSDvV/ZOu3WyYSdV5ob3ZIC0JxVFDFmDTHmvpnon2eQ2hghVY8j06R9LswEerRO
X-Received: by 2002:a05:701b:4284:10b0:14a:9dc3:dd11 with SMTP id a92af1059eb24-190a5999e7fmr7654858c88.18.1792680348543;
        Thu, 22 Oct 2026 07:45:48 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:e55a:5016:92c7:7a35:f3ff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm23625880c88.5.2026.10.22.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:45:47 -0700 (PDT)
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
Subject: [PATCH v2 1/5] io_uring/rsrc: pass import flags to io_import_reg_buf()
Date: Thu, 22 Oct 2026 20:14:52 +0530
Message-ID: <20261022144501.2478417-2-anuj1072538@gmail.com>
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

Give io_import_reg_buf() the import flags argument and drop the
__io_import_reg_buf() variant, which only existed to pass them.

No functional change.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 io_uring/net.c       |  6 +++---
 io_uring/rsrc.c      |  6 +++---
 io_uring/rsrc.h      | 13 +++----------
 io_uring/rw.c        |  5 +++--
 io_uring/uring_cmd.c |  2 +-
 5 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 050ed274170a..63089744d43e 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -644,7 +644,7 @@ int io_send(struct io_kiocb *req, unsigned int issue_flags)
 	if (req->flags & REQ_F_IMPORT_BUFFER) {
 		ret = io_import_reg_buf(req, &kmsg->msg.msg_iter,
 					(u64)(uintptr_t)sr->buf, sr->len,
-					ITER_SOURCE, issue_flags);
+					ITER_SOURCE, issue_flags, 0);
 		if (unlikely(ret))
 			return ret;
 		req->flags &= ~REQ_F_IMPORT_BUFFER;
@@ -1216,7 +1216,7 @@ int io_recv(struct io_kiocb *req, unsigned int issue_flags)
 	if (req->flags & REQ_F_IMPORT_BUFFER) {
 		ret = io_import_reg_buf(req, &kmsg->msg.msg_iter,
 					(u64)(uintptr_t)sr->buf, sr->len,
-					ITER_DEST, issue_flags);
+					ITER_DEST, issue_flags, 0);
 		if (unlikely(ret)) {
 			kmsg->msg.msg_inq = -1;
 			sel.buf_list = NULL;
@@ -1509,7 +1509,7 @@ static int io_send_zc_import(struct io_kiocb *req,
 	if (!(sr->flags & IORING_SEND_VECTORIZED)) {
 		ret = io_import_reg_buf(notif, &kmsg->msg.msg_iter,
 					(u64)(uintptr_t)sr->buf, sr->len,
-					ITER_SOURCE, issue_flags);
+					ITER_SOURCE, issue_flags, 0);
 	} else {
 		unsigned uvec_segs = kmsg->msg.msg_iter.nr_segs;
 
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index d64228b0e19e..1abfbb86dae8 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1365,9 +1365,9 @@ inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
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
index d33b925a848e..71782a23e16b 100644
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
index 73b606899833..45c9c845f5d0 100644
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

