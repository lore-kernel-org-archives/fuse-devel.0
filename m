Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AAD36A35A
	for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 02:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789007117; cv=none; b=J5zezWYjvzXprc9l90Z6TfImJ0k+0mCpU/e2z/sDdGOuCOKRyKP1ygFTi9JIZa6oaRldllhnk6/1PH57Gihn9kbuMzwUTvTAcAdD0Sf/Hc1NTEqe0xx0jGf943rns6G9eXUI1MD6gZ2TLJ2uHvp7qE9HpDpIOpEIegjzSRZlHOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789007117; c=relaxed/simple;
	bh=U+Me3C9+CP6ZrOYDdK5ENtjrkf4pAKYkEsgkRLmN7Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gs0oaNrZDxbcPx5rbeLR0M3GwhQt+gXBcE18tepRFDMiIZzHH4lNiFurFsr3uCgAey0CyIyX1qnpAyZl7Teyv3wHy4rfUjkNGiV5ox4QoISggTH67ZqBpjT7B3hfUeH483tAlxNPzhh7iI6vdV29jaDojhzcf8tswsvd7mMM00E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=izHZ7iCq; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="izHZ7iCq"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8686f46e4adso466984b3a.0
        for <fuse-devel@lists.linux.dev>; Wed, 09 Sep 2026 19:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789007114; x=1789611914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kwJ0wHKRMeWCO4z6Il8uP1M5MtMWeVs9uywjTGYzTi8=;
        b=izHZ7iCq8SkZ7xs7epTjfFue7LepzmJNbuufNXCb7mPy08NMhm0GJ1C31wsP1P9CcJ
         /pa2fGkChGINTuZIV0XMOyRZXafasNlkYy529LQObLwIbHQKZs77c4Pbient2JRr7rIk
         3mK08fwJfIAZsBBrTX3DXl1RHjGR/yhlQ9xXXvjMCjiN6s7WElSY3h0Lq6qHd4Zz9QqC
         DXj4EGwcQBmtZ2+cm0yZ8d++msbtqeckN5ydZQcFlaA+mQdotmn4LElO06zzrM0g6y5U
         FLB43UTWzDXtzcMtBd/hMr7AcdOxH/hyuFnjr6rNpDwnla/04vpttFZDg7Tp4U8XrUNn
         CUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789007114; x=1789611914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwJ0wHKRMeWCO4z6Il8uP1M5MtMWeVs9uywjTGYzTi8=;
        b=qJZl3viKAJHNk5SDw6/6lz2q5UUzJI8CKhDDOIUbMXBjuFgL4GvznmRH5A26SCOrW+
         9b2Aad90cnhzMSniEadGOgtpjSCCpB4/nTOc4cINOpP6xLtEAQ/8XkRjaTjrsnTPqM8S
         0slywcev1aijSUFRocbRWSLMvnKYe0nM2NMcUo/C2y4k/QIQFd1hvJ03/fYAdTwphutv
         vBTtHxEGUljVK4aoDxiPiGSbpmmRTW59C/LpFEQRoq5kTK4SpIJcBQuYh327IIYSPAUU
         hM/EhSMwRoQ8NfqfRqGwansrqTy51E0ohqWvxHOj7RhKOztKh8UT5g0NBeBgcS0gz4oo
         jsiA==
X-Gm-Message-State: AFuF++koNurZS+7bl9/yOMDxfAq7DdIOUhD03j+WYGDQbuq6PqU0seEn
	0fgrU8Fjh/S1g5DDtKsmv54zPvp1s7yoDjSK9zzik/j9zeq97sVd1h4jxXLiedRRAQ==
X-Gm-Gg: AYBFou00G7oB7Mq95IA00i7Tqsy3lLXd8QaAvjmWvbWgZGQVuKWMalDxFI49oetpcUH
	CkI7BY/eJlDdWB1KC4vERAWgi81oqwgAITd+uSYFNkdQ/eHPtuohzVm+5P0THv2HtOwZXX223vd
	YGTaiMuwVNFfBNauSWrH2b9ltmaRDulT7zeH3nGYx6Ihv5uhuP0ojde6M3rcJNqvMwrBl8dQMmQ
	jOS/YWNjIx7Vl0SlUk7g7qGsUvwdw3cfqPwBDlObVMuNXONnHCqGp5PDHwga4J7dfn9pPC1pVm+
	gEJ40RfBfqhMSkpSOU5lbNF3G0LxDJYm4tCwFz65u6q9TztwXQe7/79UA85sidP7KhVQB+9+b8r
	1wMT2TXOaffHky4vliliIpSa/nziRszrwzlzwvd4pCUvYXlrqC63CMu5X4MsbzIs0HyWcMRoWc5
	EMYhIbKVcCOww5DdQpUAoOMozC7L/fYm1lC2BCscjfPM7TbgH9j14QAtozfJJcMC50gsNI21D+x
	WWbBw8yMmk9s5QWYFOODdAUaSkWWEyGLSo=
X-Received: by 2002:a05:6a21:4ccc:b0:3d7:b90:acba with SMTP id adf61e73a8af0-3dacbd6d1a2mr7999128637.6.1789007113811;
        Wed, 09 Sep 2026 19:25:13 -0700 (PDT)
Received: from p1.. (129-219-8-31.nat.asu.edu. [129.219.8.31])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1435c2ae6b5sm2688847c88.1.2026.09.09.19.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 19:25:13 -0700 (PDT)
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
Subject: [PATCH v7 1/2] fuse: don't BUG when the copy buffer is exhausted
Date: Wed,  9 Sep 2026 19:24:41 -0700
Message-ID: <20260910022442.3594649-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_copy_fill() hits BUG_ON(!err) once the iterator backing the copy
runs out of pages.  Over io-uring the amount copied is not bounded by the
payload buffer the server registered, so an unprivileged user can drain
the iterator and panic the host - mount a FUSE filesystem with small
payload buffers, then setxattr() a larger value:

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

The reply path can drain it the same way, via the server-supplied
payload_sz in fuse_uring_copy_from_ring().

An exhausted iterator is recoverable, so return -EIO.  All three
fuse_copy_fill() callers already propagate the error.

Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
Cc: stable@vger.kernel.org
Reported-by: Weiming Shi <bestswngs@gmail.com>
Suggested-by: Joanne Koong <joannelkoong@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 fs/fuse/dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 4fec31fc0b84..4148e4488d77 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1061,7 +1061,8 @@ static int fuse_copy_fill(struct fuse_copy_state *cs)
 		err = iov_iter_get_pages2(cs->iter, &page, PAGE_SIZE, 1, &off);
 		if (err < 0)
 			return err;
-		BUG_ON(!err);
+		if (!err)
+			return -EIO;
 		cs->len = err;
 		cs->offset = off;
 		cs->pg = page;
-- 
2.43.0

