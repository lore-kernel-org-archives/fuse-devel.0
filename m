Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A0A2F1FEA
	for <fuse-devel@lists.linux.dev>; Sat,  6 Jun 2026 06:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780726288; cv=none; b=lcGXVnOuUehwoAJzDt1UEVtdSS+TFwtU96qg4SNkyjjTAVuTBpkfl6c+l06kve04k4FIx4BxPZ1p+2IwoflyNOzw7WZRINxOCsJiXv/9hiwmRWvYlFbw060FpWR6RPn6flrxUjR8pj9Qr6bU2RIqSkmtYC3qTdCTnKXY1aUrVGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780726288; c=relaxed/simple;
	bh=QtIkhOcb4XuSPNMSHsQTam2xRok/IOw4SC1HUoDCl24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZzL/nc6l2i6uKh89bkcnFSXoXsUPJ3Obw69MqV0VsLiLeA8Zw2vAxSYO+p0Vk6bytthUvD/3AOExI/KFfZdh3zmY3cvaCBWUj19LWqq/PfQvKrC2neUV5YYSN66DULm30XUZVUPWzo5Ew0H0fwzJU11kBeW4JN6BiK0HlgH8B34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJ0wvE8K; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJ0wvE8K"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b12270b3so15737245e9.1
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 23:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780726285; x=1781331085; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2cQgCHbxQom2kVIv1Cvt6Y9CPEs8rn7euaXGTL0+j8=;
        b=YJ0wvE8KauJ9WtQ5RTe4z2B7Icx7YYgOHUHWE7J01NrqVYA9F1H4wIrHtVDWIPUzuf
         EGU0a3+x9TMjvTOmfNP5wYjPdtwWa+rK8gpskqsH9aAo0aUwukCSLrRCHdCYHruUxgUv
         gmVeiBla4KCygIBdkZa7CLOJtd8+CrhSCphgRv9hZjjpJmGQbHfa+yi8vzkpmE6/RTIQ
         gL0TyTxZpvj3xfCwYZXR6ZQTZ5xyGtS4ziOJCdE2Xb/zl8Hd1GD1AjQ7YJfklh+KGQiW
         xKDMHKgPt+C8xGJE2a3pRBOpRQPuHLXayBPo4yjhIxk5TFqZtRUlOdevBP0vJjU7ObL5
         1wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780726285; x=1781331085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T2cQgCHbxQom2kVIv1Cvt6Y9CPEs8rn7euaXGTL0+j8=;
        b=fzFzcVEShW7th9NS6StQ7FwmHA9E6EKTLE8sKrigSfE5KOM8GSCunt3ySD6mTzsc/x
         5qEieBTvCI9X8R5VgH9Xtk5lnm7lp6Fr8lsTZPJ8deT/Qz1Cx9XQC/Lfw28Vw6n6nn74
         4NDdbsJ23mfeUtwekhV8w0T9ZezWl+YQfQ4A+iG2galMkcIzlCD+76BfRXTk6T9Cduej
         nww14JuqR9nJbQLtuTO2vT1QFCRrIWw4KeYKnHm3aJiFmul7KSImQY6/+H37e/CiP1oo
         //TOUqO16p3L4+29FJSEhNTX79u4/NdqTjIWBZy729z35Ll11x0QbWZxdw91Z82OKQVP
         L82g==
X-Forwarded-Encrypted: i=1; AFNElJ8I2ihfmXjtQ3qnc9mfYZ29zqFP2aK06/sLw5LWcMq3Ql+dvwvdO63qzpRURHezbI5g/hEzdiBE5UvB@lists.linux.dev
X-Gm-Message-State: AOJu0YyIAgwUUqfDrXZ6PFGx96mBqz+wweqDV3ZpJudqpGto7RwijS8K
	fIQTJnlSXrm85RtwgZ7wHBrGwj2dPThhkZEgPFjbnypeHoYnvXUxW61a
X-Gm-Gg: Acq92OF9BX/VIDQZZaNybj71jzcNsG4uYi3BV1MeniAoBbeFzwxHVyZyFrWyflNAOfA
	mD7NlgQh7YO2g355DVm1MoslX9rXJJxtrtb7ijP6bwfD9Y+Rz3XLk6k/LuRUpvEqJ8Rjj1MexT3
	qvoCCVfSLFKP9wYOWv9U5kQIUPx8boVwuZX+3+KHuWALezqKR6cI9lkn0qHIK80vCH6hV7WT618
	GZSHVtnEjkNJls22OFGD5qWw18sBSrjklhm9SouJ8RT95Ys507zyXxgpO8R5fjIVeMIsbMOV64f
	b4DQFmgTvHX1xcDqUXZuSX/x+fEvvx+RYRFQZBl8CmmPHI+8sYyy+M1ps43lnyRJkZixbD1XiP7
	/ExPFRQhyIOwIzYzw1qQZFUHzyOekSUibdOe3zNEev8N9VJ10WC7RRTG2E3q6z9QUljaxfk7At9
	FbwD11O30I04EnrzpNADvync5xiiMRgKkZGCyncE5I
X-Received: by 2002:a05:600c:a117:b0:490:c2a3:3302 with SMTP id 5b1f17b1804b1-490c2a3336dmr71973635e9.35.1780726285175;
        Fri, 05 Jun 2026 23:11:25 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490bc39e024sm273433555e9.4.2026.06.05.23.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 23:11:24 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-api@vger.kernel.org,
	netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	ltp@lists.linux.it,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@infradead.org>,
	David Howells <dhowells@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Andy Lutomirski <luto@amacapital.net>,
	Collin Funk <collin.funk1@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	Stefan Metzmacher <metze@samba.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	The 8472 <kernel@infinite-source.de>,
	Willy Tarreau <w@1wt.eu>,
	Joanne Koong <joannelkoong@gmail.com>,
	patches@lists.linux.dev
Subject: [PATCH 1/5] vmsplice: open-code do_writev and do_readv
Date: Sat,  6 Jun 2026 06:10:27 +0000
Message-ID: <20260606061031.3744880-2-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260606061031.3744880-1-safinaskar@gmail.com>
References: <20260606061031.3744880-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My previous vmsplice patch did the following mistake: I did
"CLASS(fd, f)(fd)", then did some checks on resulting "struct file",
then passed numeric (!) file descriptor to a function.

This is somewhat okay in this particular case, but I still think
this is code smell, so I fix this by open-coding do_writev and do_readv.

Also I insert a comment to warn other developers to keep
do_writev and do_readv in sync with vmsplice(2).

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 fs/read_write.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index 1e5444f4d..e224e7cb8 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -1070,6 +1070,7 @@ static ssize_t vfs_writev(struct file *file, const struct iovec __user *vec,
 static ssize_t do_readv(unsigned long fd, const struct iovec __user *vec,
 			unsigned long vlen, rwf_t flags)
 {
+	/* All future changes to this function should be kept in sync with vmsplice(2). */
 	CLASS(fd_pos, f)(fd);
 	ssize_t ret = -EBADF;
 
@@ -1093,6 +1094,7 @@ static ssize_t do_readv(unsigned long fd, const struct iovec __user *vec,
 static ssize_t do_writev(unsigned long fd, const struct iovec __user *vec,
 			 unsigned long vlen, rwf_t flags)
 {
+	/* All future changes to this function should be kept in sync with vmsplice(2). */
 	CLASS(fd_pos, f)(fd);
 	ssize_t ret = -EBADF;
 
@@ -1226,14 +1228,24 @@ SYSCALL_DEFINE4(vmsplice, unsigned long, fd, const struct iovec __user *, vec,
 	if (fd_empty(f))
 		return -EBADF;
 
-	/* We do do_writev/do_readv, so it is okay to pass "false" here */
+	/* We do vfs_writev/vfs_readv, so it is okay to pass "false" here */
 	if (!get_pipe_info(fd_file(f), /* for_splice = */ false))
 		return -EBADF;
 
-	if (fd_file(f)->f_mode & FMODE_WRITE)
-		return do_writev(fd, vec, vlen, (flags & SPLICE_F_NONBLOCK) ? RWF_NOWAIT : 0);
-	else
-		return do_readv(fd, vec, vlen, (flags & SPLICE_F_NONBLOCK) ? RWF_NOWAIT : 0);
+	if (fd_file(f)->f_mode & FMODE_WRITE) {
+		ssize_t ret = vfs_writev(fd_file(f), vec, vlen, NULL, (flags & SPLICE_F_NONBLOCK) ? RWF_NOWAIT : 0);
+		if (ret > 0)
+			add_wchar(current, ret);
+		inc_syscw(current);
+		return ret;
+	} else {
+		ssize_t ret = vfs_readv(fd_file(f), vec, vlen, NULL, (flags & SPLICE_F_NONBLOCK) ? RWF_NOWAIT : 0);
+
+		if (ret > 0)
+			add_rchar(current, ret);
+		inc_syscr(current);
+		return ret;
+	}
 }
 
 /*
-- 
2.47.3

