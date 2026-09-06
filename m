Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DE4313E0D
	for <fuse-devel@lists.linux.dev>; Sun,  6 Sep 2026 01:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788658168; cv=none; b=owyR4DVfsHKOkOh3SvRLmxnbCyO17nF2xXhr2ZWPSjggYgmSqfxVg/0xLWEQ2f6HczCas6BUxijlomt02OmyVkkNVML9OglRhx0UIwqT3Wi20kzBBJHKRc2b2BQAv5I/eMZwO7axtngqw+8lZBO1/IaiYcJVOjbIRByk60Gm7tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788658168; c=relaxed/simple;
	bh=Mc7C7vEd+geTmXBQsqBzXuNVgESWzoaEEie4c5Cym1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JxI3kxwXE6Gh4v3oWp7l82he9/+frnVvcuvWt5OuAvrbBLIWVAAiy3nHDYxTNf4MRs9LWm7uapDvaqpZFJU4EZL/X0zMj+6pFBT7rjR4HTIG+HamB3nzNlDpu1NQWugav8McIWfk7915goHoNGm84GqN4cBEBkubd0yMfB7CNXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=TP5ZaF+B; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="TP5ZaF+B"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso23091225ad.2
        for <fuse-devel@lists.linux.dev>; Sat, 05 Sep 2026 18:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1788658167; x=1789262967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fINQR5Ssvu+nKJR1KqypgzqxRtq2wGfTV7dTHptCiTk=;
        b=TP5ZaF+ByFXPiRsP93g91CDO/4ey5orGFxRHXgKeSWiV/CczmgqVyJYZwGGrd44J4u
         3UUlqqUhiUvoh1bbN2ldchue6rOFHHxNMvvmDnLmaSKyYhC7qg124SBqAPf17xYza4M5
         udBX+EO3oZyRK2EbvY44MZ+J7khif65c4qx9w0jqQy85hSLNf982S3h/2zBZHRQzoCIx
         8xiX69k4YG7ElsmoPzUJBa9Y2TjDJYK0GhOfnmfl0wtqAMgoRRwJsv1Pvr625p3e11Om
         gwSjPqeyKSLQgEHAFSiueJys6ZzEsrUcDsz0OyaExj9mbZZfq/gzX7111kS+d/SOQQO+
         3I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788658167; x=1789262967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fINQR5Ssvu+nKJR1KqypgzqxRtq2wGfTV7dTHptCiTk=;
        b=So9HoSm7Jw7Hp0IqXG3nnK5wKXJPzqXIztqrxjUZOSh5sN6+R6+3i5ebX37OdLp0PA
         lrTnpBs0in0JbjU3THtouKc6teYq2fHdvk84t2GcstcWwVmNhlVJHKwW0BJxQ/4UR2ng
         oYAX7E9HO0QUcgpaMYedeFjCkHNnKvGHcKBaqgtHgv8FcRPZiBoc1+TrexxECAcPCJSt
         pRDzNdoLVLomwmZA5eLY+JE9kbgXndo5ERsrTMEcMNEIdFxUA2AGi1h2R6vbEcoswtAl
         pzc50ilvb35p1RxsuyiB4NZ/1ebGYPQa7bXcgeHxiPzxK5/QW9HU15pfnhyhT9dt7m9h
         y1pw==
X-Gm-Message-State: AFuF++nnmIxO9wBhvJ7NRf71thnSpdBedqc5yxxmWIFfoFOCfk0OiCnC
	QScTSysL/Ieeec32KMY7TW+55E9rJFYgOzBSkhtX6o+rxakb/uSEptxQiT7zVbX00g==
X-Gm-Gg: AYBFou0KiN169nsvCg/xEwlm09u496CoKMCIHWcdpl8+tzDaEhMMk6e2x7g+KS9qQJU
	e8cyzCYGEnMnwn5kXZGOCNwdf2BTISBuf//hfu33N9IEsXHWywM7PxuIFPhKckswJYZnIYN+QYL
	TxDJT9UNnjSywS1o231RB8T9M+hEUjQgCQngkjvkcaelz+cd78nVK6o5vab9OKsLnGrXsSJ/kz3
	yjJ7FlxIW+wuzx3yrIf+JgT/C2phD7mXSfE7jxOJRdYsd83VOujUDV5otYeWB1mJZ62d7hD/9hS
	7VEmsHBCpolabZ5N6+fZEP0RAW0pKIcVSjcloox+uwn2ZpZLFDLMIuqGAa6VKqTMfcVnSmS5Lfs
	D8N+GsvUI2Reio+r3ufTD7GQZzQkBDgejvtFePY64e7NV0oVyxhqLISxZvDmcWnMoq5Sk40Sdgp
	RLLKeIiwJ8ejIqqyqcGPHqheE4zS+ptSFkQPgXdMkul2XqvlGJEEjnMao2Ik5VJjkU5sCd8LYas
	omh4uhT/LnhSXpQMnC/Z8XSOus/p+0SKjc=
X-Received: by 2002:a17:903:37c7:b0:2d1:134:b86e with SMTP id d9443c01a7336-2db122ed6femr226702135ad.2.1788658166513;
        Sat, 05 Sep 2026 18:29:26 -0700 (PDT)
Received: from p1.. (129-219-8-31.nat.asu.edu. [129.219.8.31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm17456853eec.19.2026.09.05.18.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 18:29:26 -0700 (PDT)
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
Subject: [PATCH v6 1/2] fuse: bound io-uring payload copies to the registered buffer size
Date: Sat,  5 Sep 2026 18:29:22 -0700
Message-ID: <20260906012924.1928316-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fuse-io-uring copy paths do not check that the data they copy fits
in the ring entry's payload buffer.  fuse_uring_copy_from_ring() passes
the server-supplied payload_sz straight to fuse_copy_out_args(), and
fuse_uring_args_to_ring() copies the request in-args without comparing
them against the buffer.  Either can exhaust the imported iterator and
hit fuse_copy_fill()'s BUG_ON(!err).

An unprivileged user can trigger the request side by mounting a FUSE
filesystem that registers small payload buffers and then issuing a
setxattr() whose value exceeds them:

  kernel BUG at fs/fuse/dev.c:1064!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  CPU: 1 UID: 0 PID: 148 Comm: exploit Not tainted 7.3.0-rc1 #2
  RIP: 0010:fuse_copy_fill (fs/fuse/dev.c:1033)
  Call Trace:
   <TASK>
   fuse_copy_args (fs/fuse/dev.c:1354 fs/fuse/dev.c:1380)
   fuse_uring_args_to_ring (fs/fuse/dev_uring.c:891)
   fuse_uring_prepare_send (fs/fuse/dev_uring.c:940 fs/fuse/dev_uring.c:1057)
   fuse_uring_send_in_task (fs/fuse/dev_uring.c:1745)
   tctx_task_work_run (io_uring/tw.c:96)
   tctx_task_work (io_uring/tw.c:133)
   task_work_run (kernel/task_work.c:233)
   io_run_task_work (io_uring/tw.h:84)
   io_cqring_wait (io_uring/wait.c:278)
   __do_sys_io_uring_enter (io_uring/io_uring.c:2676)
   do_syscall_64 (arch/x86/entry/syscall_64.c:61)
   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
   </TASK>

Bound both directions against ent->payload.iov_len, the length the
server registered, so an oversized reply is rejected with -EINVAL and an
oversized request with -E2BIG/-EIO, matching fuse_dev_do_read().

On a zero-copied request the last page-backed argument is handed to the
server as registered pages rather than copied into the payload buffer,
so exclude it from the request-side sum to avoid rejecting valid
zero-copy reads and writes.

Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
Cc: stable@vger.kernel.org
Reported-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
v2: add: Cc stable and Reviewed-by tags
v3: propose the patch fixing another issue found by Bernd by Joanne suggested way
v4: no context change as v3; add Reviewed-by: Joanne Koong ...
v5: no change
v6: rebase on fuse.git#for-next.  The ring entry already keeps the payload
    iovec and imports it at iov_len, so only the two bounds checks are left.
    Skip the page-backed arg on a zero-copied request, it does not consume
    the payload buffer. 

 fs/fuse/dev_uring.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index c6dd420c4034..981b7c295e5e 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -775,6 +775,9 @@ static int fuse_uring_copy_from_ring(struct fuse_req *req,
 	if (err)
 		return err;
 
+	if (ring_in_out.payload_sz > ent->payload.iov_len)
+		return -EINVAL;
+
 	err = setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter,
 				    issue_flags);
 	if (err)
@@ -854,6 +857,7 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 	int num_args = args->in_numargs;
 	int err;
 	struct iov_iter iter;
+	size_t copy_size;
 	struct fuse_uring_ent_in_out ent_in_out = {
 		.flags = 0,
 		.commit_id = req->in.h.unique,
@@ -887,6 +891,16 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 		num_args--;
 	}
 
+	copy_size = fuse_len_args(num_args, (struct fuse_arg *)in_args);
+	/* a zero-copied page arg does not consume the payload buffer */
+	if (cs.skip_folio_copy && args->in_pages && num_args)
+		copy_size -= in_args[num_args - 1].size;
+
+	if (copy_size > ent->payload.iov_len) {
+		fuse_copy_finish(&cs);
+		return args->opcode == FUSE_SETXATTR ? -E2BIG : -EIO;
+	}
+
 	/* copy the payload */
 	err = fuse_copy_args(&cs, num_args, args->in_pages,
 			     (struct fuse_arg *)in_args, 0);
-- 
2.43.0

