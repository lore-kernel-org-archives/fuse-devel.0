Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324766;
	b=w3mkRoVQBev1O7fhob9lMUzBCcfhEFSVLMgw5A5fA91K8NKcKkfm+EHP47sqW1k/DwS3
	 3lyINcphEvCDI+06NjW8u82jY49R2MXrdNXAABW1eiOCLcaZd5xJ589jgHAA3rV2N1x4G
	 6ofr4PSSd2Gz9GanMKi1J8ZoKPB47jmRxH2NnNJT07rOoCYYwC7RhfuS3fryKjY8h3XjZ
	 44wLcD5fQksErH4VDddcFNcZCM3Qic4zASQD/d0WhucHiIvIqRCkrGmsRO3d/VweyAQDS
	 0YrEsy8poExfyfKQaCczWnl35lVX9/LSFhzwwoZ9WJ8Vr1DYBsWDUfT6dq+KK3N+8Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VA9n7u5udKY5o86NILqNHNelhcHr5Omn4I4tRtC62Fg=;
	b=NxQrSgxxaXUtzxocmz5NUz7HXrCi9SZW5qQL55H/wl4g+k7RlHU91g1ueFV4TS4+i4RM
	 JBVUjhBNoFyXtxDSHts3Gd6Av0KLV9H00IAIvnqPABc5ZBV9pMgE5DfIjuC6ell3oIXvq
	 99BbpTIUjF3xE3rliFvhQZYAyWVVtxrL4dhxN7H65Xlj1gAJh1SAsqyKtOQYk3DPS3zeB
	 88QTUtqUtVGXXAJfde47VOSn6oQUUURDnJNQF1U4mKpdn7wPNjnfjcpueTm+TZ/c4TbCz
	 J92GjhEfH9YT/7+6X6TXzxrBUiDf8a8a0TxPhlTP34V/3jMtW0Vd9O+7lbzdGAg13Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMSSXh4C;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E0E606A32A
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 01:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E0E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMSSXh4C
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a18fc7a38so631497eec.1
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 18:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793324765; x=1793929565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VA9n7u5udKY5o86NILqNHNelhcHr5Omn4I4tRtC62Fg=;
        b=fMSSXh4C8BRGDmg0XCdJ0K6G64CoMeWBKGJJNXpP5PfonRwS5SXD+qTwF6HscdusHr
         0YTKI7X2wHPwglHKAGj9xqfTp/mrbCaWZ92bTzMjayjZBOOBEyTdHjCbNQY0I47Ta8Ts
         4ymcDYmsSwRWVmFB9qiJPoZprWNMLZeWtjL90tdKSxXYfYPg4b0pL+zftXzHfaQJZOFX
         tTwSuP2DnXIe6B6EcszEQfB7G55lRli444fflH87biUqfmJLH8rNPbcEa6Gim+XzxdzF
         ynIr5n48w51zC3+DRDCbpzin+/bHHomzqPGcZcH6Ra5tVTYr4oEegUdPMwqFEwV1WiAW
         026A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324765; x=1793929565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VA9n7u5udKY5o86NILqNHNelhcHr5Omn4I4tRtC62Fg=;
        b=LaJbByNg10PWX5oi1209O1HoTg+dS25oLZjdWkzt8S5OK6yD4kl4faCI+n8RpEpVbj
         OV1nCWPzGhqZO/HeSXOlwz96XWMiHDqS3f4UVrSaQpe4f35LNTt1hGMsmfVkGIS/RX1I
         /0rdozAf4TaMRvX1wQusL2JqNjSuApRNK+E2gwkjVEaT6B2EQF12NZOHPuCGwl61Lxn0
         6bFZOxbkf27rJSaG8fjYw8fBVBM9uxdVp/3UCfDp+7Fx7wSYKS3xmwtoOCxxPLUtYEPI
         MKKqwCNtvP8AS0dnkJ2U6yH6OVK8qQqtFliyrRrLTCDMrkzEBBfagEug7tNNEqLYnWNc
         tpLw==
X-Forwarded-Encrypted: i=1; AKwUvByGJhtrm6uWLtL/0VWnFCNELTOhVXL4ER1zEmwOY8EhZybmoumboOMoxvA+uP7TJjJdX47GfnkxlUnM@lists.linux.dev
X-Gm-Message-State: AFq9FYJBbb065NLQ6T4m9Olut1g5mNQLibGdc0ME9UiNNXfPDMnrFEmz
	cinXRjK4ggjMG8o4XYQE1kJ0SArQhdufAja/mRy5bn4WjMyBF2GMjTxeHwYd1f0=
X-Gm-Gg: AYBFou33uLX8g12vuA8Qmm67AHNeMgj0lm8IgiNiBqDnPnCUYIR+s9e85KMPAiG2dFv
	4eOG0qFt5oQAj5N3PRufRQZ12TIRd9kE8Al5W5AHuM4z81ZR+OXWoRC/8eVf6aqIpfqLzbRE3Xv
	8yHaSrsDi1E8Y2nskwQApDq6LwLHwTCGp+nou1lfIeP1jCwdjRAXsj7Z3BXUA+b4/x9lGa0Ne/N
	sPsQbJ8Tuob6SiMsIpehI5keDWhxO0/qBtzIyoLsB+9kjsdK1m7Ei+5pqdWN8uCdyXk9+Si28/l
	weBGF2hM1Vn2AzLwXY6mj1rMy/fWjAhMdpSg91UPq51iIAa33CvnjuDGApXokTlvW010wTify1G
	gnm/bj218oH5iHduWfdtDlfj9nX4ilREbUjpXX9eEuWdSGT7JBEzSSscbCtrQmWllUjiSikb/5q
	tG1DnluBXa0PztJIvWOIcNCaRJYBLKzUwDw+eA/XE9KvW68m52ZpaFcMTZ4OeAiaQB4o24htpVt
	qmwFTYgU7VLkwl+b3VniviQMCB4EgVRZVGiswHppjEwk4y4GohNYwz6QjuDb/G6GDcZYKbBpu/u
	NlpXMlcqBaXGyOhEdyHhIPrbEIdzaeWXHnKzhMXv2ByLxeuddVOV1j2JFcty54/bH9YcFTTsCje
	cB8YuEd8df8ijOsfb
X-Received: by 2002:a05:7300:e918:b0:35c:de00:93d3 with SMTP id 5a478bee46e88-36a4247d812mr1334717eec.40.1793324764241;
        Thu, 29 Oct 2026 18:46:04 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:75fd:f9a4:4062:7980:1324])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm2209020eec.12.2026.10.29.18.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:46:03 -0700 (PDT)
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
Subject: [PATCH v3 2/5] io_uring/uring_cmd: add import flags to io_uring_cmd_import_fixed()
Date: Fri, 30 Oct 2026 07:15:37 +0530
Message-ID: <20261030014540.3065403-3-anuj1072538@gmail.com>
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

Add an import flags argument to io_uring_cmd_import_fixed(), so callers
can opt in to buffer types they support. No flags are defined yet, and
all callers pass 0.

No functional change.

Suggested-by: Pavel Begunkov <asml.silence@gmail.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/nvme/host/ioctl.c    | 2 +-
 drivers/scsi/scsi_bsg.c      | 2 +-
 fs/fuse/dev_uring.c          | 2 +-
 include/linux/io_uring/cmd.h | 5 +++--
 io_uring/uring_cmd.c         | 5 ++++-
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
index a87c9ca9d06c..d342ccad067a 100644
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
index 4dac3ba162ae..d77a94d19cb5 100644
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

