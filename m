Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF6B42378F
	for <fuse-devel@lists.linux.dev>; Mon, 27 Jul 2026 23:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785195446; cv=none; b=ViL5frCRjoZNUnDLV4JbntAu54QVU4GMNXh62M1DkKd409U6NCHasIR3pEmBSPkQlZXCX/ZuFI9BBqvH3qhUcl7bZz2PaebXmt+H5gwJDLi2g1ZbwR4AkpdBrRcjqOpCUm/C/tdUH/+jCYj2uDD46m4sAkDPEVy3pnBc0R1xF7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785195446; c=relaxed/simple;
	bh=Z7lGYXPr+Ieoj4KbET+knaZeKDI8pg1+JMKRLFkCx5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aICO99gJU15GUjdlSyOIPBcqZezva2epFNPlwrJXnraoiXOXJ4gv9vN2yheQCnWCN3W4VUFE7yoHwdBNS+DC9swj39ELbuYRUJYzpFvm/1LmrZ4FA4MzDk6Qv3brvdpPECu/ArG/5SaW+xcGSoJ+cAxLqkpeUdsS/aCFRdM7s6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=ACn106uG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="ACn106uG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceaf8a1265so39521665ad.2
        for <fuse-devel@lists.linux.dev>; Mon, 27 Jul 2026 16:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1785195442; x=1785800242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR8eRORT2I/hSmOLqM2RUxfZ+NIoC1Kt1RyV1TnFt9E=;
        b=ACn106uGmTkpYn0IjgKnDN3+xsGwD0GG0UiKk9MVi61qKI7vfq0Haj72t+gPd2YT0W
         lqPvaTh6wNLQX2x9+7w3pqvpcxH8Tc8WtQGY/XoIAX6lQKpsFdqabZwdKY2JYjG0qmdx
         XCay70fuohmyWZZKQia2kx7yQwrFKMTsDPwSLxND+MFp9lvCZzU4cQ1tgfu3fwex7VfB
         qoTzqHqOy611MIbhLZKCZghjldTpqsFixOtqzqiJJ7c5KBD4bRARBYQG3kL34vhYmshy
         buYqHva9yCUAV30NlknihODpYZ3oN1pXEZpcaMTXU3AeGJrtQm7ZLVZlTtAUcxMp1rHw
         VJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785195442; x=1785800242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR8eRORT2I/hSmOLqM2RUxfZ+NIoC1Kt1RyV1TnFt9E=;
        b=Tz/F8Rl8ahBM5TUAIt3E+jyv1IJtM4G48HvqcpspAklV6vMu2BsNjs0kgr2gFMX8JP
         gAzHw1rLVERxeUJ7c8xVUfz/HqviwPe2FO0Gi27P0cLVP9YOT60y9qJeapn/hiARsP7x
         qRM4YnUljhlTvZETbPqeHFD1Ywv/dIi9Ij4Qpnc2Lg9LHq/nXwpErSQ4wJg5Mvp53zZS
         oXI09qB5ZkDCQtNXMf/8QnZqIdP6I2ExIk1pJOCQt4k6OlTYaiiU+ymxFbVsY/zdW0Y7
         3G+VEO8DLfBFL6ZUUs7lFSa4tNz0IGHtBWAaftOduVihYBBlT4K9Xj41F4SXqLpofxnb
         m4Og==
X-Gm-Message-State: AOJu0YxFUhVu+RrC9MmdEQUx8yVzkgzqoRDMcq7YZmgwuJwMS8uhf2oo
	Lha5gANEpba6NJArK+oftFGAbJQT29DOWeCAbZgwQ6aI7KLTIo25PUkfzgG91BZqBIbcWC0z7R1
	XoJK4oQ==
X-Gm-Gg: AR+sD11F7ExCC2eF+dCEvIsCRPZe6/OesVk9W9gnsz05J0BzgQY2F6p+0M2BCAV2UFK
	9adfnEddvqWAGqqrrVSjFtJijx9Iie9L24UeXVjEgRRUZAMfU4RraATCJNLlU1SSPMs4UFO9bly
	ZSgsz/omWx/hIwW7k7+QZ5rTdqr9fgdxI6RNzsvzAbz7c+84qYdKU/BYwaQ9oX26jALHrYKrSLP
	eVAhd5XRCwHngGyUa66xXKF0YViUmmoo0pzCIG2t5TPb3MgXXfTsV4Lcd0o+GBshxzsONB651Df
	8O7bIcz+2sAHJZleEP83p9uH5ic+Gdpm9pyQYGMjp3BOVKT2UBNrZ7HR4u1i9dngzU1U+JWPb5X
	2dedQlQR/hRJnV4eycSDc12pVSIQ+ONVLiE7fHZ6ux7GIvlXbQXEe4Kf/RHdKCwzlbvNquddf/Q
	==
X-Received: by 2002:a17:902:f54b:b0:2ca:ea56:7a58 with SMTP id d9443c01a7336-2d00f3f5b3fmr12828175ad.37.1785195442568;
        Mon, 27 Jul 2026 16:37:22 -0700 (PDT)
Received: from p1.. ([2607:fb90:ec26:45a7:d22f:3f56:f9b2:423f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde4650a5sm42256915ad.0.2026.07.27.16.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 16:37:22 -0700 (PDT)
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
Subject: [PATCH v5 2/3] fuse: bound io-uring payload copies to the registered buffer size
Date: Mon, 27 Jul 2026 16:37:05 -0700
Message-ID: <20260727233706.218446-2-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727233706.218446-1-xmei5@asu.edu>
References: <20260727233706.218446-1-xmei5@asu.edu>
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
v2: add: Cc stable and Reviewed-by tags
v3: propose the patch fixing another issue found by Bernd by Joanne suggested way
v4: no context change as v3; add Reviewed-by: Joanne Koong ...
v5: no change

 fs/fuse/dev_uring.c   | 9 ++++++++-
 fs/fuse/dev_uring_i.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 0814681eb04b..248e5a3e340e 100644
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
@@ -1163,6 +1169,7 @@ fuse_uring_create_ring_ent(struct io_uring_cmd *cmd,
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

