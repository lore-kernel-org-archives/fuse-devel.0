Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680376;
	b=vW+fWmnxCzF4K2uNXgPSRVZENb/c7MrmJqWeJqJ4SHOZDRsMFmS9avBu+XmJeAyaPO5E
	 GdZzgQTCowO0fW2GcElwJMKV8sE5DVawf0qsIQ4zhGYR4s8Vj3yWA7w0xudVWnTXrLGta
	 NV2xxoQ9zOFWEK2tW1znIeUGvczUhXNflvDqByyezRUOfUiHZVXUVwwr9vGysYvkLU45r
	 4GitNt0FAbhsy2UtqmK6bSLrjvcWhgSg2hltdwGIWp92L42R9NYB6ZEgjskMFsdS7o7LZ
	 yIk58y6sfHodPNP7kzeknuPpKsVtLOdQplfKLd3a2cml1bU2+Lq0dzzN9f2My64DUaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s4dfUUsZqZsY4HZ9PSieo9kggL9QkrHJ8v9DDPPYPu8=;
	b=2xprJ8++K2WLXIouBbPz7VSIo1rqfaTfoRFAIdTl8O6dWMnq/jpLdkZ9KvTdsmCsq2pZ
	 yqiU5YWEAkg8j9J1uTnDltHudw8h+EZQjhjtzivI6QhQ1vDKnO9vVLY8M6HG+B8wa8jL+
	 KMs+a3OuwURQC4wa2hciAZfZz79eSdo5IFmVjYiBXqLZg450FwCvvZxFJLfM6ex6hsSTC
	 OS9TdIh58fAy7gRwMgYzfY88BPC4jbOBwHAVotdKQ013BR7930dnzLhdJcnGfymsQeIiP
	 ATXGGDO8zZWzjPeRYSh6827BTTgMjYzJVlUIswIIL9E9uEDSXbLzkIBUdTDzzq8XVBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="TTkbb/um";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE507606A31B
	for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 14:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE507606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TTkbb/um
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1438d9363fbso817948c88.0
        for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 07:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680375; x=1793285175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4dfUUsZqZsY4HZ9PSieo9kggL9QkrHJ8v9DDPPYPu8=;
        b=TTkbb/um2vC1cwMKoiL4m/ApL90NJytPMWCH4xP+fgX05NkYzvcUoHPUxeDqEESt4L
         s/dCLgYb2xBbk0L74FAn/ox8otSOol4S1wXX5Ezn502tksOrB+PTKKhuwDfeJoe+/5MR
         5qaT+776El5AAMt1qA+afblxN1K0D9Gun8kWYHp8M3O1qODTA9U9UhjVnU2453OqFakd
         IPvYmRdMSbZqrvV9eTJNxP9bTy0HeP3HoBAGfz7ow0BwevoLmKVyrdvngbK9s1Wk2uod
         coM2P3T9u6n6KxaWH5Nm2gbKUhrwa5MhDiufeYua5J3686HPyI3p/FWGsl9LMn32RC23
         jsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680375; x=1793285175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4dfUUsZqZsY4HZ9PSieo9kggL9QkrHJ8v9DDPPYPu8=;
        b=TFqq3zBHxLGUjVmPCa/xMuqYAmZlj4813CXePtezuh6ykxNxH9zUTJFngcw/nFNupQ
         98HcNidxtySDXnLmOYJ6biezhoTVANLohLCSLNy39+pk+/juOELx87XZRwJ4Qu+ywqdT
         7jzFeU35/IQoP4NLlSpse8dtSk1gIyTNg0izYpLXIEjoU8rnh4upIJoq1vffqQSRELTL
         bPBAYA6B/NT0xSeaIW4Bt+Hd2WOUDxlIwxpUWwjIjf9F4V+8BMvqfcNRwsnLB5jKCmb0
         iAouNHXoFfCij82Ba/3sPckccoz7v8FtKVTkHTg93Wu89aO8m2h3odGD35KE1F2fcHOy
         gGnw==
X-Forwarded-Encrypted: i=1; AKwUvBwVYR8O2nHn6urxgLnxWtZ9LqA3OzoM0tOkBvAOPEf2+xYv65MEE6Yw++0j2n9S4PNA1u2CJ8OmKQix@lists.linux.dev
X-Gm-Message-State: AFq9FYIKWzg2bM+ErbEBU2BvpXbUNl5idfNmOL6KJXHnCKVLv6HAcdoH
	XzGNV7mo5VwI4Y0nu6rbxaJr7M32bAj2nY8tb1Decdq8RvxK3eI4RTA=
X-Gm-Gg: AYBFou3Vg/tCAur+0+CZ72fqieY0+D/JE/YLpmW+NeLAWoI2wLQfrPZM0OhPixDRKGm
	vs+SlR/f0kF/6lZdtuoWnwg+/KJNQ7hGW9YqCKMiS4hBHmqV52EyogR0yw2sQtaj7EYnaDeYXXL
	nyPX/txsjkBYzlwKdVS0tJqYYAUz73O45bNFja8wG1kb8f3coBgl1wCjkaaaYidPvALXPfijXZj
	aFGmcZ+Yiy5islx7eXOlTjPMEW/XQZ5T3ke+G82M/MIMTRkWxLoAjHEBSnWAp76TWAiWIUqc3Vj
	wYQeY4g2W79PEnn8FfdzgnWvKROP6VCMFyL4QH/rP6AwVQM5zIVUEZMEGcQMk7uCjKUzzizOSyO
	vldCtn6948kGwTqcrkJGgqLNooCuelvFmdnUqmCcxS9yJ/+l20tzw5ZW5eLbuHAa4M+T2QRNDCQ
	WPwCwh94RaLpjMmwGzOwr2raUPylfiegrZsFRLA20ceIzxQjXMlX1pCKF5scElERB5YpCwPBvFv
	wk8ZRz7mRugUmNQ5BoXM2sXL+w+sbZIEoKRfiq6EhQ9tCDTfWL71ARyTSHj/CvPHTuU0rRqynGE
	dBcE1+KYgWnpB9iX7nyrdUDaAJ3uURNK+urv3T0zxYo=
X-Received: by 2002:a05:7023:a47:20b0:159:d448:dd1c with SMTP id a92af1059eb24-192f4dc4252mr3056915c88.19.1792680374872;
        Thu, 22 Oct 2026 07:46:14 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:e55a:5016:92c7:7a35:f3ff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm23625880c88.5.2026.10.22.07.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:14 -0700 (PDT)
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
Subject: [PATCH v2 5/5] nvme: support dma-buf registered buffers for passthrough
Date: Thu, 22 Oct 2026 20:14:56 +0530
Message-ID: <20261022144501.2478417-6-anuj1072538@gmail.com>
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

Allow registering a dma-buf against an NVMe namespace character device
and using it as the data buffer of fixed uring_cmd passthrough I/O.
Complete through io_uring_cmd_hw_done(), so the dma-buf map is released
at hardware completion.

Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 drivers/nvme/host/core.c  | 16 ++++++++++++++++
 drivers/nvme/host/ioctl.c |  5 +++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index d81462e864a4..6157ff839929 100644
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
@@ -3982,6 +3983,20 @@ static int nvme_ns_chr_release(struct inode *inode, struct file *file)
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
+		return -EINVAL;
+	return ctrl->ops->init_dma_buf_io_ctx(ctrl, ctx);
+}
+
 static const struct file_operations nvme_ns_chr_fops = {
 	.owner		= THIS_MODULE,
 	.open		= nvme_ns_chr_open,
@@ -3990,6 +4005,7 @@ static const struct file_operations nvme_ns_chr_fops = {
 	.compat_ioctl	= compat_ptr_ioctl,
 	.uring_cmd	= nvme_ns_chr_uring_cmd,
 	.uring_cmd_iopoll = nvme_ns_chr_uring_cmd_iopoll,
+	.init_dma_buf_io_ctx = nvme_ns_chr_init_dma_buf_io_ctx,
 };
 
 static void nvme_add_ns_cdev(struct nvme_ns *ns)
diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
index 612d3009dd29..645446acc10a 100644
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

