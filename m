Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C8F49553B
	for <fuse-devel@lists.linux.dev>; Thu, 27 Aug 2026 18:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787857071; cv=none; b=ixr3RrjhylQfdZ3Rx1g7ErO9QsZ5fbmpGJbQHU2HN5BbGUW+71mputwNTteN2GrDTbSrEHPTkuznbBl/Bxk6w5KMAZHJOTKBUODgscU/sAQbnTHhvPmh5J3ShiBEQ3lSnEyPGjL9QfIGL6rqaljhMiqsd0xvVQ6SGeDMfpl5VA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787857071; c=relaxed/simple;
	bh=bId58P1f3rx83kEyCFQCmbOQueTyIg0Jg1Ag1a5jGfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tAnGOX9V/L2mQEq8AUqAfb29C6QIQZk22Mv4bmwRXGY28Hl+NIL7uC36nFCcY62teAluDShxEB75vAyJKpv59nCcQnzukmqNLB+JX//A9ff5YBHdYzdECqWlGNlRUyI7kc9OkUsjuJvikpwxJxYf/70NWyXeJ1mNkhLb1Qs13TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=VhMYTbxz; arc=none smtp.client-ip=209.85.210.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="VhMYTbxz"
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-8552619b869so27427b3a.1
        for <fuse-devel@lists.linux.dev>; Thu, 27 Aug 2026 11:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1787857052; x=1788461852; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ex+RB5aItdA3h/bx30wNaWsAq7n74S1CMmypqWLJ+1k=;
        b=VhMYTbxzei7lgDFppJISp4RBH0LRN+UBnOtcZsqVvPnVE/BTjH/XMZWfdMEvuN1v6n
         YPgO0whXCqXeZ+t+h/32J19l+l0+xC0ASkKDjEfReUzkez37E2+Kgl1sIKfrUx4seDFV
         GlN+Jk2G3CMRwkuvvao/zf4qrA+J5uJ+sQ+GeZ/bv8ypRAOvCG79W37IMx7lTTyA0ThI
         K9p+1o4BxhuOZfFWoDbu3C8Cz7je5zYL3cxPXj53QfcuGnpYJrLWSb5vjnWrBWfjE63R
         4A77V5IDdTFG84wH9ZPgpP0egh6DiRfCdUaAYJzMsrCgLkrfvQ4QnGt4CAmEDheG+awL
         AWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787857052; x=1788461852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ex+RB5aItdA3h/bx30wNaWsAq7n74S1CMmypqWLJ+1k=;
        b=iCwnKeEy3IezcOqjhcCAhQRCgGVkh7yU7DBQY60xbKNgTTPRa/smCKuL6qH6KPUHFo
         DQpLmRshMAXuCwdYgFvWX8uw33UZmRj1dK12JNuAJTWvUV9YMCkSgN0wntytRuu+h1rV
         htkLcH8gpmHKTIXzn27whdFumBF1jzEompztdqrGv107LxHujGr4ZaEnIPXujRDYwAW5
         zMms8n6PNQ1QsGJi1JSLEVDQ/OQ2qLq2mAmMSg1Cuj5e4cSfVfdIcFKBRZpmSUEW5Ost
         IA4nchRjS9R6h5WoT+m5dEhaxgk2wRIiqBl3wGUjgLwTdBQIeR9DoWrL50z6Lz5S4ePh
         iP7A==
X-Forwarded-Encrypted: i=1; AHgh+RoNNYOduNWzZWH0m+3JFXLHqW3HcA9OCoeumd2MB1xJuKOF14sggqbeS3+bBhc0qGuRNDsgE7ZNvSI2@lists.linux.dev
X-Gm-Message-State: AFuF++nv2ZzrGA1Y/8oLwsHhVvvpJ5o/a7UECdor0BQtZJu48eDAnv/q
	wx6n8iWzK/QbMzygC4dqph5VnZcnJuwQsAtQIkeGZiypw9kKbr+GTNvkdwIPofsbyddTJDs5qUX
	DDhMaQx9vKvYYR3i0LNrERjTCxlLKYrTyVzuzg3avKbUioXHSgAbY
X-Gm-Gg: AR+sD110QSnieITMzTwEBZOGnYtiMI+6iVPLE8V8WU0BtgCujuv6JosqlX9pi2Y20bu
	Qpe4Mx4kDNSYq3f64IkcFsY9ttEKq4C1cWmj/TxmJIDCw09kQ3lQj+0D/OvTi/e6SVqxzN08ta6
	pLxbNwDCQ2ecAHmh17OnneDIDkk4uJMH4hjx+SmKP8Wd52jxvaiRR/iqlqYyWLlDE8V+WDB+Nkz
	nZ4xqYIeuutY0KPMm3bZ2ay8kq9qDsdAxkugzrvBblICsICn6t/LmxeDneEfwsRCmQdg+/y1sI6
	tL3nlNh4ZhYYq20XxNZcPQv0iGqk3/LHcIcuyByDpqGxBuceTteADern5HOMV7OEUGLZf+IzB5b
	J76bdwOczrAXqm9mj+w==
X-Received: by 2002:a05:6a00:4449:b0:851:c2bd:43d1 with SMTP id d2e1a72fcca58-85628a85b9amr829996b3a.1.1787857051450;
        Thu, 27 Aug 2026 11:57:31 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8538d0c4935sm2212871b3a.7.2026.08.27.11.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:57:31 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.12.104])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id A24254030A;
	Thu, 27 Aug 2026 12:57:30 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 9F60AE404C2; Thu, 27 Aug 2026 12:57:30 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Ming Lei <tom.leiming@gmail.com>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 2/2] nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()
Date: Thu, 27 Aug 2026 12:57:21 -0600
Message-ID: <20260827185722.3234622-3-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827185722.3234622-1-csander@purestorage.com>
References: <20260827185722.3234622-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_uring_cmd_set_res32() only performs loads and stores to the io_uring
request state, so it's safe to call in interrupt context. Move the call
from the nvme_uring_task_cb() task work to nvme_uring_cmd_end_io(). This
unifies the 2 io_uring_cmd_set_res32() callers and removes the need to
pass result and status through struct nvme_uring_cmd_pdu, saving 16
bytes and a couple memory accesses.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/nvme/host/ioctl.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
index 131959c00287..b50bba207818 100644
--- a/drivers/nvme/host/ioctl.c
+++ b/drivers/nvme/host/ioctl.c
@@ -421,12 +421,10 @@ struct nvme_uring_data {
  * Expect build errors if this grows larger than that.
  */
 struct nvme_uring_cmd_pdu {
 	struct request *req;
 	struct bio *bio;
-	u64 result;
-	int status;
 };
 
 static inline struct nvme_uring_cmd_pdu *nvme_uring_cmd_pdu(
 		struct io_uring_cmd *ioucmd)
 {
@@ -438,29 +436,30 @@ static void nvme_uring_task_cb(struct io_tw_req tw_req, io_tw_token_t tw)
 	struct io_uring_cmd *ioucmd = io_uring_cmd_from_tw(tw_req);
 	struct nvme_uring_cmd_pdu *pdu = nvme_uring_cmd_pdu(ioucmd);
 
 	if (pdu->bio)
 		blk_rq_unmap_user(pdu->bio);
-	io_uring_cmd_set_res32(ioucmd, pdu->status, pdu->result);
 	io_uring_cmd_done(ioucmd, IO_URING_CMD_TASK_WORK_ISSUE_FLAGS);
 }
 
 static enum rq_end_io_ret nvme_uring_cmd_end_io(struct request *req,
 						blk_status_t err,
 						const struct io_comp_batch *iob)
 {
 	struct io_uring_cmd *ioucmd = req->end_io_data;
 	struct nvme_uring_cmd_pdu *pdu = nvme_uring_cmd_pdu(ioucmd);
+	u64 result = le64_to_cpu(nvme_req(req)->result.u64);
+	int status;
 
 	if (nvme_req(req)->flags & NVME_REQ_CANCELLED) {
-		pdu->status = -EINTR;
+		status = -EINTR;
 	} else {
-		pdu->status = nvme_req(req)->status;
-		if (!pdu->status)
-			pdu->status = blk_status_to_errno(err);
+		status = nvme_req(req)->status;
+		if (!status)
+			status = blk_status_to_errno(err);
 	}
-	pdu->result = le64_to_cpu(nvme_req(req)->result.u64);
+	io_uring_cmd_set_res32(ioucmd, status, result);
 
 	/*
 	 * For IOPOLL, check if this completion is happening in the context
 	 * of the same io_ring that owns the request (local context). If so,
 	 * we can complete inline without task_work overhead. Otherwise, we
@@ -469,11 +468,10 @@ static enum rq_end_io_ret nvme_uring_cmd_end_io(struct request *req,
 	 */
 	if (blk_rq_is_poll(req) && iob &&
 	    iob->poll_ctx == io_uring_cmd_ctx_handle(ioucmd)) {
 		if (pdu->bio)
 			blk_rq_unmap_user(pdu->bio);
-		io_uring_cmd_set_res32(ioucmd, pdu->status, pdu->result);
 		io_uring_cmd_done(ioucmd, 0);
 	} else {
 		io_uring_cmd_do_in_task_lazy(ioucmd, nvme_uring_task_cb);
 	}
 	return RQ_END_IO_FREE;
-- 
2.55.0

