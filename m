Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1DF3033DF
	for <fuse-devel@lists.linux.dev>; Sat,  6 Jun 2026 06:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780726335; cv=none; b=lxJQJg1KRyaeFfLuhbwZcl92SHCXLGjFu3N9v5AdzAO1ryiAIhvaWiOsqVfBtMqJ1cx5GUi/ZkDEHTcn/nnmhnkXu7M/pdTpQ9gw1iwPui0MG4uvKeyyAF0PX5bgt1xdPAroafP6ywvWAJcfCZAdaL/bgV/9traCV3ZJrUnbwB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780726335; c=relaxed/simple;
	bh=cFehA3I9prjpPS9MpvxHw5vuJaTELUrjhx5IPWyT2q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMKkPZOFPblZs84pOTwndT4W07P7UHS4pOwxZ94lIaHyYm98Mlkm/UZ9nwNMhhH2qJL4+UQwhgOtMwIxwErRWqhyB/en+w35tYKBVyCr1tdZ9JqDu7geql5cwulAsb5mdB9mP7ec1GUorC7IuUGOJrJPFfIrHMjUCettXPu3G/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9LYy9+8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9LYy9+8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so31789815e9.2
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 23:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780726333; x=1781331133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybLyqkJC8PpxOPGtytqXN1jytQgb2AKCO5QalzHljcA=;
        b=C9LYy9+8nBZA5B6AR+QIhsUGtjnbHs2JHr7PsTzRdsZXpFqOavVVZ4+gnrjyZGZoNG
         vbGzZY/rhH9gjvzWYRt+JaWsJyEgLsz7lbc9kKqLh3b6Y8HOSL/23fzvs63EIMzKtqKg
         UIdRGz5OaIOjAr1JbZ8GbT+S2CJ487CabWSMvKkLVCD1Lq7z41Uc1vFnW/vKft7WnB+V
         0NbhX552O14B20i2bU/AROZkZa5RGBimLr1LBFt+f8mso+DUu7QnnNGBW1ywG3gO7wzV
         ByA3fiHs7qjVMqojoIwUL3+/QdnbJP21bpQMMb8BwhwHCOFT0vU6XgJsV/7vJO7huUpJ
         y4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780726333; x=1781331133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ybLyqkJC8PpxOPGtytqXN1jytQgb2AKCO5QalzHljcA=;
        b=elxc11D611xtjmWz+sWH4I0AXn5oJvq1VH8kFCyE8yYmRrlnr5vasML/A4+pFKY9/T
         9MbzEcE4fgQsTX6/5VeTXe4huMLxHGFEfagpeR1RiYmUo7H/Nt0crU+Q48lEYGkX2YOv
         +iJmEvIhYwnGriBcnHElIR3imQGd3fqEpkQA0kfp0ckqqpArCXroVTC9wEsHVo75FG/P
         lpgfu+oKfuNYBxcVdrAUT5zwYxSBH6STGDM3XOYpKLLJU5Cx5kJn7lDT0rPHih9yHVm8
         6UphZlq/Dg5hFZRppZAo+eBKkvRD7xeStXXIPcLKKFHS7sdTENoRh58ZczIGi3P6oqcu
         gShg==
X-Forwarded-Encrypted: i=1; AFNElJ8IunK6gONxcRXrC1/PaaXEMCucFW6cCyyTuORYLOfSZI2GejYDWt+p0rme75sIChgj/CkZavaixorx@lists.linux.dev
X-Gm-Message-State: AOJu0YyDz8OMrgvBIZCrej3GG1M+fRQz4/fVNW4KkthuZkORShyFwQji
	y/5uTTmZYEegh2ksl8J1f7H/wqtESEumPNVcioVBZbhMKqqTXV2SuT2H
X-Gm-Gg: Acq92OH5lvg7lVg/qI90jUsW+nq731QopH+a9PJ3ThREc4ceYUHfZx23Xf9Tipg4fuz
	j9KuhEsEcJTs/JM+GWR7XZduQk8iRUWitOINAex2KA2jc3l2sRAMcUsR+J2LMP4akQjTuxKD9dK
	Gm6R8JhwLKPJSKHAtIJX1OKur+g1GyH6ZRkcNJz3UCg9FQrjNqUkPpYPo00sPCJmnu1eXNo73DB
	8e37ImU79eP44dDJfhIXhRAol+DJ5wLGcZJuYqHfsC1aXL9Rt68A5XMmxQVyY8ujcFtm6SMxCqi
	rkG0Qjrdnu3EX5g8pUIncq8OPiZYKde6bUb7v9balfGKmN+A//agDTiQpx48Zs/NBKhh06eflDA
	KPmMW/sWEn1CjxQwTbd4DXsuIvnpubEk1RtdaZ3A4iw2Z6wixH04F8g5N3HskMnKiVHYSrSMuaC
	XZcuTwp1NR/xwZId97kVtl+wJXFQW1J2f7dFOi5zBh
X-Received: by 2002:a05:600c:8b0c:b0:490:ba61:7981 with SMTP id 5b1f17b1804b1-490c25c1e4amr103918225e9.23.1780726332629;
        Fri, 05 Jun 2026 23:12:12 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490c2c9ea37sm178712255e9.0.2026.06.05.23.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 23:12:12 -0700 (PDT)
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
Subject: [PATCH 3/5] splice: turn wait_for_space flags argument into bool
Date: Sat,  6 Jun 2026 06:10:29 +0000
Message-ID: <20260606061031.3744880-4-safinaskar@gmail.com>
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

I want to do this, because I will move this function to fs/pipe.c.

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 fs/splice.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/splice.c b/fs/splice.c
index 6ddf7dd72..707db2c2c 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -1239,7 +1239,7 @@ ssize_t splice_file_range(struct file *in, loff_t *ppos, struct file *out,
 }
 EXPORT_SYMBOL(splice_file_range);
 
-static int wait_for_space(struct pipe_inode_info *pipe, unsigned flags)
+static int wait_for_space(struct pipe_inode_info *pipe, bool non_block)
 {
 	for (;;) {
 		if (unlikely(!pipe->readers)) {
@@ -1248,7 +1248,7 @@ static int wait_for_space(struct pipe_inode_info *pipe, unsigned flags)
 		}
 		if (!pipe_is_full(pipe))
 			return 0;
-		if (flags & SPLICE_F_NONBLOCK)
+		if (non_block)
 			return -EAGAIN;
 		if (signal_pending(current))
 			return -ERESTARTSYS;
@@ -1268,7 +1268,7 @@ ssize_t splice_file_to_pipe(struct file *in,
 	ssize_t ret;
 
 	pipe_lock(opipe);
-	ret = wait_for_space(opipe, flags);
+	ret = wait_for_space(opipe, flags & SPLICE_F_NONBLOCK);
 	if (!ret)
 		ret = do_splice_read(in, offset, opipe, len, flags);
 	pipe_unlock(opipe);
-- 
2.47.3

