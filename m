Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A21432E84
	for <fuse-devel@lists.linux.dev>; Tue, 14 Jul 2026 23:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073256; cv=none; b=YpWGXxjPQP706o70oU1f5/q9WH3oWYF6euMpYfyP1NYfoIPGBlmQ1j+2N5ejht3bvhnnq7K0wqL8+VG8aB7/TQxK5fsW5bnzmn/hycXguruR55Yaxfrs0SgcKJDhosHOi6DRj7GVcPUhkkSFfjZECWipgOEqx2BPQV8EWGuLuXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073256; c=relaxed/simple;
	bh=iWC3dwTVFS0On/b+U1UVC9eFIiIpL6Q6Bi+esX7/UyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jAln+4wW9d8k/AB3iy623s9oUPDekTjreDOHgF0TDIeos8v3rNpStJqfNVAox7tY7A2+Pgj7qUyKOVcQJl6Ow4R0V/FWagFVd3ceh7Wtelyp4pO6z+wyIMkOmH+EQ+XPtDA4FaMuD1sPyAq1HJCpmbToB2LzhejdPQy32Lc/Q7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=kffRQf2Z; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="kffRQf2Z"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cea3004256so49211495ad.0
        for <fuse-devel@lists.linux.dev>; Tue, 14 Jul 2026 16:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1784073254; x=1784678054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yNKCuh3wjjGZi+YwPUxJXNIOv8IEH+SL77HN2XtO6I=;
        b=kffRQf2ZBc9qRC9dwAZ3iZvMrF6tcqHaD67XTccAyqsktRHwy5OD65zWddv+Gee47/
         erRpGJ6njqOf+3jNuLQhu95TgyBAkNIW7sn0yU+5bjw8aijiim7WWPDGxwyEN5oPlz+F
         GSRk4VOcWGI5XBOKW3gSB2z7bcPQ0wcfUe3XriRXiL1DJAvHPELLCIAymbEGv6PNINm8
         RMOs+pflX6m/qGbbE9bORVG93EkVSbmD9HlZ27L37QpPVbZLtclkMtdYvK4YccqTagRX
         A600MNIKVf8PPln2PxL+6J7j7crerwycWBEO5kzTsKybiuvD15ALzkUg/8oiKn/iKB0/
         J7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784073254; x=1784678054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yNKCuh3wjjGZi+YwPUxJXNIOv8IEH+SL77HN2XtO6I=;
        b=WKrrEJ0W8Ycc1LAJ5bqdlrrhv3Gzonp/wrIM6OkhQnkdJsQXPZRWeJdEKXviWAbciA
         /Xrn9Ouz2tl5sm0ScOtlttI+fejhuQunfW1lv0/w7B8svwo5CIFLGJx6i1/EdZga0jjc
         nBNKnLYRwRT6cDKP7GR/FwU6/Nwc1xSKSKElXszr/lCVLIFAGyVvTmVq3t92tPhMe27s
         dvwESXwU/BFa52oHM8MbQrk8FcmX/2MCx+kysVe+KX7gAjw3Hz9fedly+2QgPgGyCYye
         UefP37afkEd3OwRWIGWe0PuyNTTvUCD+HKUePVHx2BwFArCs1WlteltnA1925YpoFiFn
         8tpw==
X-Gm-Message-State: AOJu0Yyqu3KSek7UG90jkUWcaRYu9CleSBNkGbh2hH/sak0FmEuVNZuO
	76bIv1zxSVL+wAUxFbcWegI2x9RvbMYhV1XVA5m2jBpiynJwcLLK+oPTb1ZcvGK1WQ==
X-Gm-Gg: AfdE7cmsvCbMf0TsCMhTCGF+KkwNJ3jfrsX0Sgh7abXYafiUqD4yzEEm4tz6av9l4Ue
	ofl4KraKIPDdCtfTcXbJ7rjF8zsirahMepC63+JOpS67b/kWv3ZiV6d8Ce2mD8KdGUN3t0n59gh
	3xUNbYA0ICs1N/R0XLnLHEuV1VPgqX+u7SlzTrWFvMpGg3gnpNdZczS5Zaih8xSeCeJmASgx7FJ
	nz09DJh5N5qGvJ/nkypBg2Ogf/yPPL/OtExDiS/srukm0X81LSp5j1nnMecHGJ9ygw32nGk3NeH
	IAu17sZEv7R5/o1db/33GF6ScnGsRKGGSjOS9w8WWUXr6UT5ZVs2vyQA3Xi9c9txh4jUd6Wgwh7
	BShT4KCmjHrcs1t79G7mgSVMCoh/xa8devlaeSOUSpK1zvXxvSP946m9YrIPdyssVDYLY71SiPg
	==
X-Received: by 2002:a17:903:380f:b0:2c9:c18f:7446 with SMTP id d9443c01a7336-2cef143b0aemr46392065ad.27.1784073253712;
        Tue, 14 Jul 2026 16:54:13 -0700 (PDT)
Received: from p1.. ([2607:fb91:1513:463e:34c6:f6a3:8e91:2983])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm123236075ad.65.2026.07.14.16.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 16:54:13 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: fuse-devel@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	bestswngs@gmail.com,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH v4 2/3] fuse: bound io-uring payload copies to the registered buffer size
Date: Tue, 14 Jul 2026 16:54:07 -0700
Message-ID: <20260714235408.1666063-2-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714235408.1666063-1-xmei5@asu.edu>
References: <20260714235408.1666063-1-xmei5@asu.edu>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fuse-io-uring transport imports each ring entry's payload buffer at
ring->max_payload_sz and bounds both copy directions against that value,
ignoring the buffer length the server actually registered.  Both the
server-supplied reply payload_sz (fuse_uring_copy_from_ring) and an
oversized request payload such as a large FUSE_SETXATTR value
(fuse_uring_args_to_ring) can then overrun the imported iterator and hit
fuse_copy_fill()'s BUG_ON(!err):

  kernel BUG at fs/fuse/dev.c:1053!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:fuse_copy_fill (fs/fuse/dev.c:1022)
  Call Trace:
   fuse_copy_args (fs/fuse/dev.c:1329 fs/fuse/dev.c:1351)
   fuse_uring_copy_from_ring (fs/fuse/dev_uring.c:686)
   fuse_uring_cmd (fs/fuse/dev_uring.c:1226)
   io_uring_cmd (io_uring/uring_cmd.c:271)
   __io_issue_sqe (io_uring/io_uring.c:1395)
   io_issue_sqe (io_uring/io_uring.c:1418)
   io_submit_sqes (io_uring/io_uring.c:1649 io_uring/io_uring.c:1934 io_uring/io_uring.c:2057)
   __do_sys_io_uring_enter (io_uring/io_uring.c:2646)
   do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

The request path overruns the same way, via fuse_copy_args() ->
fuse_uring_args_to_ring().

Store the registered payload length (payload->iov_len) in the ring entry
and use it for the import and both bounds checks, so the buffer the
server provided is honoured and an oversized reply/request is rejected
(-EINVAL for a reply, and -E2BIG/-EIO for a request, matching
fuse_dev_do_read()) instead of panicking.

Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
Cc: stable@vger.kernel.org
Reported-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
---
v3: propose the patch fixing another issue found by Bernd by Joanne suggested way
v4: no context change as v3; add Reviewed-by: Joanne Koong ...

 fs/fuse/dev_uring.c   | 9 ++++++++-
 fs/fuse/dev_uring_i.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 77c8cec43d9c..4529505b2bca 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -650,7 +650,7 @@ static int setup_fuse_copy_state(struct fuse_copy_state *cs,
 {
 	int err;
 
-	err = import_ubuf(dir, ent->payload, ring->max_payload_sz, iter);
+	err = import_ubuf(dir, ent->payload, ent->payload_sz, iter);
 	if (err) {
 		pr_info_ratelimited("fuse: Import of user buffer failed\n");
 		return err;
@@ -679,6 +679,9 @@ static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
 	if (err)
 		return err;
 
+	if (ring_in_out.payload_sz > ent->payload_sz)
+		return -EINVAL;
+
 	err = setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE, &iter);
 	if (err)
 		return err;
@@ -725,6 +728,9 @@ static int fuse_uring_args_to_ring(struct fuse_ring *ring, struct fuse_req *req,
 		num_args--;
 	}
 
+	if (fuse_len_args(num_args, (struct fuse_arg *)in_args) > ent->payload_sz)
+		return args->opcode == FUSE_SETXATTR ? -E2BIG : -EIO;
+
 	/* copy the payload */
 	err = fuse_copy_args(&cs, num_args, args->in_pages,
 			     (struct fuse_arg *)in_args, 0);
@@ -1159,6 +1165,7 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
 	ent->queue = queue;
 	ent->headers = headers->iov_base;
 	ent->payload = payload->iov_base;
+	ent->payload_sz = payload->iov_len;
 
 	atomic_inc(&ring->queue_refs);
 	return ent;
diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
index 55f8d04e4b0b..efa7f034496a 100644
--- a/fs/fuse/dev_uring_i.h
+++ b/fs/fuse/dev_uring_i.h
@@ -41,6 +41,7 @@ struct fuse_ring_ent {
 	/* userspace buffer */
 	struct fuse_uring_req_header __user *headers;
 	void __user *payload;
+	size_t payload_sz;
 
 	/* the ring queue that owns the request */
 	struct fuse_ring_queue *queue;
-- 
2.43.0

