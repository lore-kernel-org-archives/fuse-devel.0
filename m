Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693458;
	b=iImWDs3EpW66M+jsCqHCEa5aNHhVujEYg+KEPw739rjAmo+0biMkv/RleSxogr9qIkLg
	 peUDcasCo0Mlec8z+/y7UmGmmnma71gdH6PD5Y11DBGkyCuOL43iyTvEk1mERVFNeItYX
	 wKtxljvlQ3jOwgz9pQ7wVSUSxyK7CDL9cTX8IqTtMazTM+uc9NLKySfsOOGNfLAbuQ80W
	 qrfPwxZyNceQon9DM8mxu1gBBDYyuDZwzGL23+HkaC7H3VUO8stm4RUoFXEvk1FipZ2q/
	 g2CsPqId34/tRsHcj04LHKEcYKiAy8JiY3t+9FzpVPE3wGL6deoud1FyXL8hURI2v1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=OCBEogtd4WQ6NFtESpTyBkJzNayzM85qVHDRTKTymcA=;
	b=NSAF1ZtP7dDqiwx85Nh5z8PE8khIyIgeKq1B0ScK+s4TJO1VyzFnvmtXboBFGs1LZx7r
	 menDso3X3C63SBfbQMhHCXY/hA+7PjW5nVVJqCc25Y/9RnYu/vwSUTdl3FPrA1x2iSJSa
	 v5UG2Kha69oo/QUdtdLfazwqNEyo9IotWEqCoF5t5pOuOg7nWplGxtc97pki5nkpf9UpL
	 7kVbTiLuE6qiHR0CzqJeWlQrJBV98pt0Hq0e/ONSbpz4y5QWpnrYAY5/44hHfC8hWuS6s
	 n38uZs2iEGsuJ0wlYhfYQXqpZnXGhTQwuKEKnuPeudIPDSwuZRj7ABfVfawUSIgp/GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRiqx8Gl;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF96606A324
	for <fuse-devel@lists.linux.dev>; Tue,  3 Nov 2026 08:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF96606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRiqx8Gl
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-369f126a526so4655738eec.0
        for <fuse-devel@lists.linux.dev>; Tue, 03 Nov 2026 00:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693457; x=1794298257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCBEogtd4WQ6NFtESpTyBkJzNayzM85qVHDRTKTymcA=;
        b=gRiqx8Gl9S1DIHQp2FbytrFa6j7FG8L9VZUZxBPvF6s0tX/OyE6TFZ+ei5eLy6dYHC
         55+SBjcshQmGytrfSWTIFDvaf/BwhU3eL0TdqgC21UIvgeRi6XS0MPka8Uj1fmLlgmTE
         OzJ/geg3Me9xdzZ84HmoybEqgU7dVE4KfLWY1j6JxPTVyC0M5vCjjzajRnKh56/hnFRr
         P6z5a6Vox/oNaJLZ0/ZnbdcrYkxnIV7dTwmlDQaamO1K1B1znlfoDrdrqkcZ0AAA9A5a
         lZ4F/t3vBdri9wLNLV6l7/jw7H7YcDR1JqJ5UHaosB2BioTzcdsIbWIknMuQe2kVn7Xx
         idOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693457; x=1794298257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OCBEogtd4WQ6NFtESpTyBkJzNayzM85qVHDRTKTymcA=;
        b=j2NZJEvuIUwHk8PtMvijkVobF3ZhBn7U9p4SDQHc9ThHw11pnaEmExefPIug0BPCPL
         6lNOJq/BYFVWQTk0IrjQGNP3fimORFd5oBIovGH+EbeiK2CbUjIMj0KTlIQZUWw3EeM9
         HA8FdW2B59Jlm1KgGePzeso0R2zue5yxoVmM+q6OhmG8mnDXWC1UGHutrd12cGZ59VpQ
         0LnaORhRN+Y3t2UWGlJJ/YqnMD6xsE6gQXF+vOHdI7u7IHSnT258RGVNOsiN+BrbyLk7
         QYYW+FNvQZE3CASm/7nUkLzbaH6aSsbGjfOZkEbC59AoJ9+2Ib4OU1L3kopsILDjjXao
         esng==
X-Gm-Message-State: APuU4Z/wWQoo5IgCPR0/TBY7v8hgGLhi06rtRDB8/RsgbljgwPChpYMh
	lQSCLDtpUQTRyVbwTpG6mUIQvBd4ea2SdrWrCfsjCHMV9RXuglq6/QV7
X-Gm-Gg: AYBFou3hTLWsRFudZt6tNpxSu6GGpOha5kdOs9q2kIUby8/yzCZZlNWiNS4NS1YWAsU
	NBuGMa+ukDYxpFSXmHVmoVgzpva/FmiNVU5q4Y2gbmsjDrJtY4q5OdxfXrqg1CDj+5SCm9xw33B
	03fTsD7Tzhsl7tNxXkRlUIGVfhjWeXVv4nw+DPSjyzltJld6oZYb4Keo25epcx38ZvvGUQQ8QoJ
	PB4jzltA9nZr7bAwfT48A/WeQJq6klmvcm/cOceG/JwmV+nVok8jSoPRPVkBw0uDddG2foc+4wi
	dB1FkAiZ+UCTlM77luruIkxvLoXBTU0+uSNsAuxIoxI4h04u9dmDuT57PG8VujnURSx76Mqe497
	mGkWE0QYgLSwQ/xUpvJbfIzaPgrfMy1j282vVbsouklrZ/UQOh25aPUhRPk1rp9IRtxeFBX2tK0
	LnO9aukfM/7VgwKZQQgU9AOM8XWi5aRUM2f6MEt3cj7p5M/208CS1SjM8138vaAYZzjZtOBs6rf
	BRQxV5LJVnYyATF04Hw0sVm4RGce6gzv6+iIrTqJNcLlnOXK3pFWolpTJEg+PwfASL9teGPCKCM
	EpHJ+ftYYEvofYpAmiPzMU2/7bxKd4XyJP0hcuKj4DvRAsNXI8SVNFrx
X-Received: by 2002:a05:7300:c39f:b0:366:6644:2839 with SMTP id 5a478bee46e88-36a42203e90mr19153100eec.3.1793693457451;
        Tue, 03 Nov 2026 00:10:57 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36b13bd87b2sm4621906eec.28.2026.11.03.00.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:10:56 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	shawnq1@163.com,
	jamz@amazon.com,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] fuse: clear the old EOF tail when copying past EOF
Date: Tue,  3 Nov 2026 08:08:46 +0000
Message-ID: <20261103080846.55656-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

__fuse_copy_file_range() invalidates the copied range before updating the
destination size, but does not clear the tail of the old EOF page. If that
tail was modified through a shared mapping and the copy starts in a later
page, the newly exposed gap can contain stale data instead of zeros. A
subsequent writeback can also send those stale bytes to the server.

Remember the destination size before sending the COPY request. After a
positive copy result, clear the gap from the old EOF to the copy start
before publishing the new size. Keep the existing invalidation of the
copied range. Apply the page-cache cleanup to non-DAX inodes and cover
both write-through and writeback-cache connections.

Fixes: 88bc7d5097a1 ("fuse: add support for copy_file_range()")
Reported-by: shaos <shawnq1@163.com>
Link: https://lore.kernel.org/r/20261020003429.1009226-1-shawnq1@163.com
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/fuse/file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index d5e1cb53d86a6b35e63ca31b1065068ea5bdb6be..d3fa2bac9903acbd15cdbe9483fe3605f7ab5da5 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -3000,6 +3000,7 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 	struct fuse_copy_file_range_out outarg_64;
 	u64 bytes_copied;
 	ssize_t err;
+	loff_t oldsize;
 	/* mark unstable when write-back is not used, and file_out gets
 	 * extended */
 	bool is_unstable = (!fc->writeback_cache) &&
@@ -3047,6 +3048,8 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 	if (err)
 		goto out;
 
+	oldsize = i_size_read(inode_out);
+
 	if (is_unstable)
 		set_bit(FUSE_I_SIZE_UNSTABLE, &fi_out->state);
 
@@ -3087,6 +3090,9 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 		goto out;
 	}
 
+	if (bytes_copied && !IS_DAX(inode_out) && pos_out > oldsize)
+		truncate_pagecache_range(inode_out, oldsize, pos_out - 1);
+
 	if (bytes_copied)
 		invalidate_inode_pages2_range(inode_out->i_mapping,
 					      pos_out >> PAGE_SHIFT,

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0
