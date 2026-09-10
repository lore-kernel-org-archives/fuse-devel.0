Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1321839E9CB
	for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 23:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084276; cv=none; b=bKADIGGavpZJzgSg0VUUzEgmvJI3HXrVbVB88MYzCCyw/YCM+AaRqBJAZPT6SuJGKp3E9k9xkDiA+qkWVlCMeD6zqMvp3FePHNHaXVvrkUR18eOtBD5ONgAY+wW9ewNRjRweiycj2BqfrkdeCcZpkKc/K0hJ0qPB9t+Y0BMp/hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084276; c=relaxed/simple;
	bh=+HaBGFIUyITYyskn9PZOlaHjJY051XZvXtogon38VX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=asFiUkj8Sa5xTyYMw0w1eoPtoeWntl2UwhqMY2B/A/N+ALKmZnh2vFFo11IayiBczIDYOzr9a4tupXlyLNP6V3MdfNk4dKy+BGTgK12zVjcdacwt+YuvY3U7xhEjbaLgZT2ftNwy1qVGf/Tmu+9kjdJmY1owxqmP9ZNHC99uTKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=idC2uNCD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="idC2uNCD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d560775ca2so2008225ad.1
        for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 16:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789084273; x=1789689073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJf7neT2i6yO923W0Lg09fbYqghzTKmlCOt7Ys5/ve0=;
        b=idC2uNCD9fdYg7ZaNk4EhLcGj7+jw56aneP/ykCly5Iw7hsmEKYAhvGWDANTiUZD0c
         7e2gy7lHhumJ+HEeMT/h207HjLzW8yK6J37p2V9O1g6IiAKyH/g/VfRZQXfY13HCs88T
         Bd7uxzTWuYcU1LTGReyF+CradphtvLR/3iSMVVOdiajsaa1TZgJaGqIz5khXZbSIywwH
         Kd0s6BIPWBlCF0p8x0IG8+uKHHJ6WNhp1abkI/qpgnZCiMNB+tYO2fxVJP6OflglbGeK
         qAPhLl7GZEHql6IsQ2jg4RVTE2c3l5eZv7ebsZbMnsFg7rsMHl1/qxKsIJ9kar7JnhNP
         Vh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789084273; x=1789689073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJf7neT2i6yO923W0Lg09fbYqghzTKmlCOt7Ys5/ve0=;
        b=GjEZYa3MVyVc6mv1eS+ZfxUK1gCPcJ+QJbkme15TbXJBtl14IE+7fWOub3CL03KJ5N
         gEZ4ASsX+qJzhLeF+1tOKaosvcKy9rx+hy8Q4HOnhHCbmkH9p+mmeFFlM3XO3dkH0r42
         Bx6koafyZjCFDUmpdfqDjHBh8Lbth91iub7MF1YoOh3wmGtapPKcSxOL1qYypl7DgqBn
         EKVSOK9CsKCzBbCbg/OQVoL3T+VFV6p1N0EMPZWE+vGm1HHj1F0kAeZ3s9BgRYfk/adt
         gEfpwl7JSuAYcmXMxaLvX3EAq909dj4Ne066m/q1lBULqanVodHXZOt6bm7gv8D14Kd0
         DVfQ==
X-Gm-Message-State: AFuF++lPTNzqFDX4dbgRd78a9IgEOzYr3RdRlhicaUnW4DeFECDkd8Fn
	OVBgA9q08TFCLmSYafPobQs5slSsLzh3c/l86mPzxsINKjhI+67kDEVqHJltRk1sDA==
X-Gm-Gg: AYBFou0dr4PskY0dy/rnigHUfA2iFficWhvBwk6NUrW3cGfGdv9D4avZ91p+MgpLU4Y
	M3dRScbUEwyg6rWWHzu3oGP6L7X+7PYO2Pdi1RRepc93UQf+dEuyP1QRRaDRtLUw69eep68KdD1
	8Jt0IfhxnZG5ELbU9qow9d6NxvQeJPImqrijiFWiaiddS8YSwZPH5F/R53cHCHiDQSgRIHaNVKq
	57DLHkVUlvyEd/+MjPcL/mHX5DLw4hAOkGjOmN1fxnZGO28u300KUxl4NK/bClEHWW+Y0ZvkQRo
	AJVDEdj6EgcEG2th9wB4yxsBYLznDpW51x74UIskg0p9U4XfgW41GuSAytmISbVP62E/zQ0sM5y
	S8YQmjlZSU2FxX3YJUVy5FzcOxqgapRZ2nSU6pz+y2eoKbsPROgCpQ4bFYWx8BTYX+CTjhhqz4l
	Ajm3IHUd31u1NRWb9yWkgR9R6+SF6kHSb5tG5RpXM4kmTyRvGk4XJnDRW7Pqeb5VbLekNHyXJt7
	Q0FSwd3DPJljZcd2zp7Oo6pk9itJ9knvc6qlA==
X-Received: by 2002:a17:90b:518f:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-39d9c1bef27mr2132199a91.13.1789084273337;
        Thu, 10 Sep 2026 16:51:13 -0700 (PDT)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm1680718c88.11.2026.09.10.16.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:51:12 -0700 (PDT)
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
Subject: [PATCH v8 1/2] fuse: don't BUG when the copy buffer is exhausted
Date: Thu, 10 Sep 2026 16:51:09 -0700
Message-ID: <20260910235110.3922068-1-xmei5@asu.edu>
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

The reply path can drain it the same way, via the server-supplied
payload_sz in fuse_uring_copy_from_ring().

Return -EIO instead.  All three fuse_copy_fill() callers already
propagate the error.

Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
Cc: stable@vger.kernel.org
Reported-by: Weiming Shi <bestswngs@gmail.com>
Suggested-by: Joanne Koong <joannelkoong@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
v7: fix the panic at its source, as Joanne suggested, instead of
    bounding the copies
v8: drop the "recoverable" claim from the changelog; add Reviewed-by

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

