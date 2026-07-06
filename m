Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A903C277E
	for <fuse-devel@lists.linux.dev>; Mon,  6 Jul 2026 19:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783365198; cv=none; b=W7q76M587a5N2+V7BAgaVXbEPg7GLQN7BqgXe1ymFu/tTs8fd/JMBEfndsrbVgoDy5EVq1Cj+tt70LPpcP2k/XVSs+AicL0pyBgNNK4gaS9E6+PoYxwC/XWhTEWyq5Qh8i7grw9Y1w83VDISJaoSqB3e81bfn8nJ22Lm26HJ7DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783365198; c=relaxed/simple;
	bh=9ycHXKKYgzcgNy0jvuDfAvWHQjH3DviNh/TFCBghgW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kb8iBNMLNnQoa556TPvJGU5StI/++KLbZ+R/VkhIP9JZxnNP457b3vsoy19cSKD54ol8KZBZ2wTUKkPEPGq6jVuLULDsZtVBLguNk7sgdN9s59EgWXtiZ009oxwNnUhsPFf2P4Fu4Dpev4w4J21lofALPyixlbQ7EiMF7h/mpSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=ZnoZWsM5; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="ZnoZWsM5"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so3532813b3a.1
        for <fuse-devel@lists.linux.dev>; Mon, 06 Jul 2026 12:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1783365197; x=1783969997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKqpdcCvljZGvMO/gtBZsal8oxLUKVmgK0GewuPsVsk=;
        b=ZnoZWsM5AdmLWAtfhM6gTrxTKAhjhXz3ObP1gwfWmJXXoAkXBALD+UIbrY+NhjgA6T
         s7p50MQOb7s7S6VnQ0V1xuIzI3B9kUKD8nBzhesClu11/Lz9nXE9F7bXiDCR1yZi2uHR
         r7++vgtWb2cLCxQUk3RaPInN3PYYrv3FPpvCxZOuvyrR1xXH09Fq7j8p+wgDlp6pCPbT
         tPRqf1im2VhnOXngitM8+6l9YEnGLUbL/Gb3QphLnH9FKSO0Vpuf3rwBcRLKlEM9Z4hy
         nd2JPZcSWn6gNnEsTrd3qgJUNbCX9dd4ncA7zHIikqV+2rAZdK1Wl/kKVsA78mzbe3fq
         BJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783365197; x=1783969997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VKqpdcCvljZGvMO/gtBZsal8oxLUKVmgK0GewuPsVsk=;
        b=QhppFLAzOQpBXjDw0BER5sEvJm8YsDBH7Sze9zF6g3ftyGteLBL6/Jyf1EA0yqnezK
         6F+UTDPRRNfE0GfmQUDVeek2GXxRJ2O8Ac4Rxqn/ex1yqmIrX/9SAs6gW45Exd96mAwg
         xww33Nv+i2cvtQOSqnbPEgP6Qxja/h1q+9g/xgOQ10SPG2RIYspqvGijPOcZgqnuWWTT
         BA6xf38Z5gU+NXnIwE1cISu671k/qSytESCcEBGVANuL2vh/PmAR9Gj5vTPtfhj04Slx
         R4fXmXPVdIFt2Sm6JAfAbjNUrS0aldobkhbHOqIeC2/bvhhAZEasof4XNvVVDDZW9lZ0
         hfQw==
X-Gm-Message-State: AOJu0YyhoXDPDxfvjWHNer2fwWfwfk8g47X6sFWWZViNr4QhGRuVVv5S
	zHX+2ImTC1trK9JfO9TfA1rqD9OPJmJXSQJY0DMqfVj/ksksIYPdZg3V1/1VPTibYQ==
X-Gm-Gg: AfdE7cniycuXPn5zQc2tVS97LP+pktAIdL5W8wA1F/BL4X8DmVXbP51KxI4t3Of2xnG
	UC3DqZmR+2OiQu/7emGB5dmrDclcA1aC2jQPwP6XT+yDNXt3wDWV0Lg0X2wGpFDkRUsQAt/X2dB
	TEdQ9VaiTm4FerMhAqhQG6WIfxchn7IufTQRulhdK1Pr7e+rPZA22DodKf9A7sQ3ykxiPYOh7QH
	n2GEqpOUC9bXq0Ci1WD38he6qHtOLs+6YqHNX0ynu7SEvifAiiKr5d7eBT5y8XGmwrAbcplPtZu
	HEriMAB6d/r+6tT8qUDn8Ago9ltGfB3l29r1zsLQLU8TzVhg3+j+MJ/z9wpaFy/QXGbqv57IzK0
	OKSQ3qJ33Mfx4MwF/xX+HPy60GJ8kSyDKPJcwpbFh5jrdvQkvnrRALgayCzuXlazH3VajwW/K2A
	==
X-Received: by 2002:a05:6a00:896:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-84826c0e40dmr1708184b3a.21.1783365196957;
        Mon, 06 Jul 2026 12:13:16 -0700 (PDT)
Received: from p1.. ([2607:fb91:1505:a069:3376:a42b:82ac:8903])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9b389sm4343231b3a.13.2026.07.06.12.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:13:16 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Bernd Schubert <bernd@bsbernd.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Luis Henriques <luis@igalia.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH 2/2] fuse: reject oversized payload_sz in fuse_uring_copy_from_ring()
Date: Mon,  6 Jul 2026 12:13:09 -0700
Message-ID: <20260706191309.2887515-2-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706191309.2887515-1-xmei5@asu.edu>
References: <20260706191309.2887515-1-xmei5@asu.edu>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_uring_copy_from_ring() imports the payload buffer with length
ring->max_payload_sz but passes the server-controlled payload_sz to
fuse_copy_out_args() unchecked.  A larger payload_sz drains the iterator
to exhaustion and fuse_copy_fill() hits BUG_ON(!err), panicking the
kernel.  Reject replies whose payload_sz exceeds the imported buffer.

  kernel BUG at fs/fuse/dev.c:1053!
  RIP: 0010:fuse_copy_fill+0x6c6/0x7e0
  Call Trace:
   fuse_copy_args
   fuse_uring_copy_from_ring     fs/fuse/dev_uring.c:686
   fuse_uring_cmd
   io_uring_cmd
   __io_issue_sqe
   io_submit_sqes
   __do_sys_io_uring_enter
   entry_SYSCALL_64_after_hwframe

Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
Reported-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 fs/fuse/dev_uring.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 0814681eb04b..f6127c230dd9 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -679,6 +679,9 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 	if (err)
 		return err;
 
+	if (ring_in_out.payload_sz > ring->max_payload_sz)
+		return -EINVAL;
+
 	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE, &iter);
 	if (err)
 		return err;
-- 
2.43.0

