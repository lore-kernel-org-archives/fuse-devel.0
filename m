Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324784;
	b=JtnZDnXCWLFov0i2jeZnITnj+dhP5VitBshq0noNUhvZE+fFkORApxFuwt7Rr+35zsTo
	 S41Hg9/1loS1TyTC4jFFwq4UvTU0xisbyN3MkcGC5KSplSd033cjkD+PpKOGc5OswJW/D
	 bdS6sMXHZh9l0xYzKMmqEJbnZx4cS7AIWn/h4JWcbtAnGmgiqcbGiAbGeBSWcoGpotefz
	 FxJm0gtHqr4KpJyO9IS7S+S7tXu9imPTYSpmsf0k7gBozGIUtTeiVza0jJKy3Ur+7CHoL
	 F8mwmWoAdmEKFMY3LUK21p2T0TCRjKBoiJFhKBU5c527MXbCOaM92xsmpbw4dCFERsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SF9HmYpsqJyt4I9c/G5LCdmVYCdb7Ms79eOZlmLUUW8=;
	b=aCKtMuIVHbsi2lnocJiiHyAXDMCl1wjlvvD98l24X5u4eCJbTAzSW7eUVA59Mv/u9JSh
	 RPqL+wEqUJeiAUnlgCd+wqcarTCQaecsaq6qMTFkvkyXSJLiGrGrKts8VyoHRA/ewJh5p
	 GQPGqu4eNZjGZR3RoX+sstZpt1vLj8v3r8oxuZB4guPcYYU4Dk1D0i8TvrEqQV9f6fMdF
	 9d2krBROHU6lCsUSykerSiRj2Ze1NyIjwACdiVu4bOvcnF461dTK2mkhwWjgFPorwZf9F
	 rp6+N2On4OkeOxmc6Ws1pkL29VXoFuRvIeWKXnFg8yxCHQaI1lydPej5ChiqD9cLcpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H314+0lY;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A5C606A31F
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 01:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A5C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H314+0lY
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36661f953e4so393914eec.1
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 18:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793324783; x=1793929583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SF9HmYpsqJyt4I9c/G5LCdmVYCdb7Ms79eOZlmLUUW8=;
        b=H314+0lYhb2/mA6729Nm/QYNzBSxKW317gX+UwNlcvpwf7nC8UYDkiwjxcC1NOfv3C
         XT0Zx6UWa6o1yOAIkX6n1V7fahGwH1YazwL0jh+7EUskd+3svH9XADReqausL55lUTc1
         ohLvLmvG/sQBQviZK2PpdqMsUAr5Q5VTxvsi3e8/C02o6gnK3V6DgvtY0+yRyQ2bECWo
         xlK77FPgZnnLtq5xjMWaEwzG3fQ8nBwaD1FtgRQXLMJOVILmpFu52LDH8YaBCLs85xhU
         OFQULxA5nL29ZXMjXjHpob47MC3LVCZlfXiS3BMJJHTEzsrvVzTHS1F8GS/yq2Ff60Ui
         jgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324783; x=1793929583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SF9HmYpsqJyt4I9c/G5LCdmVYCdb7Ms79eOZlmLUUW8=;
        b=h2VadXxmeg/QkzksQ/W2YSOD38u3UFDEjRG8j1HGKOjsEYbLyoaPrUjPnA4m2oRgqM
         AINrlbRMf5cT3vmQz6vXPpSjy4qSZVDa4N9RX9Gm6dMaBeQtAxwOCTaCMZ4u80Hjkxhu
         Cd7rjrL6YjN4zdP0WbR2PAlgSzxlNF1fYw4InkRJp1vowVdPQsGKY2K7stn6mnUlmXsU
         eU+a1SL17e3pxV6/th9zA8zUNaFXpbFuKftpqcwZ2kCmCXoB2GnyxDFYwLBXZ6Q6otVQ
         I7FsqepiBb0Eg5HuiISmO18vV1nJ54Sv4sFAlMptZ6nAO1Cg46hI6ggsWM833Y2BsFie
         1HoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFL8blPzdkJC4yWpE+F/o/fK7oqxj1yuuCVXcYgZ+rna4n6dQUmGRLnfE/5w7Y8fIhapYwkng3g2TB@lists.linux.dev
X-Gm-Message-State: AFq9FYI32FMrlxYu/Jb/utC0MYxLenheAME08wlJ5SCWlRGlWUXAZN4y
	H2gH3kFSXfnFnoe8Bxm/NEKWlNmVztHFJD6tuo4LwvwwLHRDbrr7A0E=
X-Gm-Gg: AYBFou3/qnpyjdeII0bjaDjfhyB/kA48mgZpUVcXb/ejI8UvGA9/Kvj9092f2kgM4Xg
	HxLrHvZ0l34JHam3MbJOepD9m8vBcNG+vcPXXg7FBeSJ+vXZhpBgu0MlL2LTD4/EKV42ztCMviB
	JEFYrxl+i+uxgAT8zhGhNm5IDga0nnbFXMjRpgpKZnPCvf6qmt5wRUupkMe1BxcE+eGLEg1G9q+
	Wl76/L8tksnjy9rD5+u15PJPjpDL2R0n8ElAp7oLvEG14TRZt2UntiPo+Lk8JFGfF8Rg/kAuKpi
	nI32SWxYdmeR/gtMWfkgBuUrTbs6elFkDZUT/JDyAXvYY0b5gDRJIcdtamTV+cZDs4HcS02oalq
	uwnxkGjcP5ureNLD436eGJtWCXOu/E2FMweTVpgK0gbFqSCj8/JcScFXNRUTYYvxHtHX54EiXq5
	UmD0JChaYz4xSUarfXbW9RjXGzRSgTGzRBFTsD0JVUv4WlBFnj+R41CMv5dAeZKjZr31kcSXHBj
	tfZgIbRfAl6OjNkj8/PHjMCv4VDNn081vFEtexETBYfyupvY3/MEa6QNGUNuo89hZJVpRnoYU9C
	T7rY0uvTa9G6Q5jOnsyL7IK7aHSd9+ykAQ4ejF/2skatPUc7xkxTYQuU1NulsJRdJB4SABDXRIP
	YxMuZAt+1WoNb4zBA
X-Received: by 2002:a05:693c:69d2:b0:368:9553:f2da with SMTP id 5a478bee46e88-36a423f5c39mr1635691eec.31.1793324783143;
        Thu, 29 Oct 2026 18:46:23 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:75fd:f9a4:4062:7980:1324])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm2209020eec.12.2026.10.29.18.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:46:22 -0700 (PDT)
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
Subject: [PATCH v3 5/5] nvme: support dma-buf registered buffers for passthrough
Date: Fri, 30 Oct 2026 07:15:40 +0530
Message-ID: <20261030014540.3065403-6-anuj1072538@gmail.com>
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

Allow registering a dma-buf against an NVMe namespace character device
and using it as the data buffer of fixed uring_cmd passthrough I/O.
Complete through io_uring_cmd_hw_done(), so the dma-buf map is released
at hardware completion.

Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/nvme/host/core.c  | 16 ++++++++++++++++
 drivers/nvme/host/ioctl.c |  5 +++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index a7a4d09644c1..33dbaa319bb9 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -8,6 +8,7 @@
 #include <linux/blkdev.h>
 #include <linux/blk-mq.h>
 #include <linux/blk-integrity.h>
+#include <linux/dma-buf-io.h>
 #include <linux/compat.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -4008,6 +4009,20 @@ static int nvme_ns_chr_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static int nvme_ns_chr_init_dma_buf_io_ctx(struct file *file,
+					   struct dma_buf_io_ctx *ctx)
+{
+	struct nvme_ns *ns =
+		container_of(file_inode(file)->i_cdev, struct nvme_ns, cdev);
+	struct nvme_ctrl *ctrl = ns->ctrl;
+
+	if (ctx->dmabuf->size > UINT_MAX)
+		return -EINVAL;
+	if (!ctrl->ops->init_dma_buf_io_ctx)
+		return -EOPNOTSUPP;
+	return ctrl->ops->init_dma_buf_io_ctx(ctrl, ctx);
+}
+
 static const struct file_operations nvme_ns_chr_fops = {
 	.owner		= THIS_MODULE,
 	.open		= nvme_ns_chr_open,
@@ -4016,6 +4031,7 @@ static const struct file_operations nvme_ns_chr_fops = {
 	.compat_ioctl	= compat_ptr_ioctl,
 	.uring_cmd	= nvme_ns_chr_uring_cmd,
 	.uring_cmd_iopoll = nvme_ns_chr_uring_cmd_iopoll,
+	.init_dma_buf_io_ctx = nvme_ns_chr_init_dma_buf_io_ctx,
 };
 
 static void nvme_add_ns_cdev(struct nvme_ns *ns)
diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
index d342ccad067a..3f240c9a537f 100644
--- a/drivers/nvme/host/ioctl.c
+++ b/drivers/nvme/host/ioctl.c
@@ -472,7 +472,7 @@ static enum rq_end_io_ret nvme_uring_cmd_end_io(struct request *req,
 			blk_rq_unmap_user(pdu->bio);
 		__io_uring_cmd_done(ioucmd, 0);
 	} else {
-		io_uring_cmd_do_in_task_lazy(ioucmd, nvme_uring_task_cb);
+		io_uring_cmd_hw_done(ioucmd, nvme_uring_task_cb);
 	}
 	return RQ_END_IO_FREE;
 }
@@ -533,7 +533,8 @@ static int nvme_uring_cmd_io(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
 					ddir, &iter, issue_flags);
 		else
 			ret = io_uring_cmd_import_fixed(d.addr, d.data_len,
-					ddir, &iter, ioucmd, issue_flags, 0);
+					ddir, &iter, ioucmd, issue_flags,
+					IO_URING_CMD_IMPORT_DMABUF);
 		if (ret < 0)
 			return ret;
 
-- 
2.43.0

