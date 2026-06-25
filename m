Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8D737D132
	for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376565; cv=none; b=obTB59KcgctqEaplS9B5hQUnoiCsRHs/7L6jzrirtUMmQJAXnwNlEhMiJIhUh38GqLCKV96Nc9JnQ8AfeGrRxRdf7n1S+Hl6c/xWmgJskbIUGiC7uRjHiSYL62M59CRWFgTtCnMobaL/fmwPh8vBryYRMLm+KLqRwQZRloM/1P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376565; c=relaxed/simple;
	bh=cFehA3I9prjpPS9MpvxHw5vuJaTELUrjhx5IPWyT2q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWeG4rmwKMwAMOnl1ejYvf/u1uM7UOFkG/ma9bBaGzzCcbobR8N/2Xo0zDjoNeTi8K7Fi5fUpbu435g0v9SywfyWQbD6FSLUaTuQWljQ+8CKzBzGo5RBIluG7av1jdsIrPikt0gvZjEOud5l2tFLum7pKAGVZHrX+OyHlWXJoz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oh1UcePl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oh1UcePl"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so17509425e9.0
        for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782376561; x=1782981361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybLyqkJC8PpxOPGtytqXN1jytQgb2AKCO5QalzHljcA=;
        b=oh1UcePlr+jYIlHKO/ZQKdymNnQgfw56lHEX5NU3nwCmA9ZGWLEwgEPhZim+RNv8sk
         GvoL5c9xJUvRiHRph3gLtZy+N1LaFXbtwI/nXtVZJZkQbK9QifWTjkgAL4+gyxFyrvoW
         yD+R6ssxQr3DmK0CFHagf8eHSXhKL7/i2ODBX6jwY18YgqA2tQgtZ+gijm4+eqBB3s+F
         khLTvA9G2SQBcwoobq80h22A4jgaMJONzopH43QBVbJ8ql+4vgI7t7tWu+0rEuSlOvT6
         ZcrzPPQ26pi3ULAeslh0HBM1fPA7thKq2F8yCQPdfbiyVkJaly0frrMkVKO59yh3zEGT
         F3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782376561; x=1782981361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ybLyqkJC8PpxOPGtytqXN1jytQgb2AKCO5QalzHljcA=;
        b=hoy2gZdNwmMDh3A/3U9hhKkDa9SC3oZG/ZUG3dOOUivhYpoC0HTHrslozWN0rsupaU
         VEw8dgIlxUrmMu64rFzQSbAhgd8wGIjCkH8pgcYAz6tVgi8S1upviA7QKuWLAzjz28A9
         0R5QKHCbLUbGcN59v9BsvxL9GHhvopd2PHPccksjncG67UoTBfbVQRJfOOL4hLGUqGkR
         s9/7FngG+Wg9YP2+LLsr/HSQBIAttV0ebNcEyQFDBQCAWWw4JiD1ePwSMKmL4xLQcPMM
         X+ohFxkU6IF4Jq519BznxKIixUKdn/ynBVMj5JQA8IOqaFuxM01snJBHwcx+vHNzfvlV
         P4eQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vZsu5t24l/Nu1akMIxkePCGAifcEvwHSc7jUPgBGcufLYVIMmdIUtjlNZRU7SmI3mx6/6O8WqKVg/@lists.linux.dev
X-Gm-Message-State: AOJu0YyZr9CRsvnDL1qq5oZQQ0+2RwtUo5pKWQ2EOlFF/bHCqHZlyzBo
	VjVvySJnONF8N5otgolBHyVJYVM1A98Va9CrsA9i2/N/l08Ii2mMatjR
X-Gm-Gg: AfdE7clPnKDiImj0V7BQka/4banqRlOmnvRuAEaDKfzKKdYbDjfo6mP4Q3/8QJgo10y
	FOs4ZE3bDbKSZdaN+tupI11mOAPwKgbn0DfanG1fklZuLbUfGbMi6/lM0BqlQPSMdLzkC7N/s25
	JiwDreoMbEVD0aF50F0zEclGMvY/SKLXGoOWQQKwjcJVRoofVG8DL2CRFBjZ72tIiof8UfpOBma
	hbWZ7CbTxfTM4RRG96Mhm8eHeEG/27qAhfS92UHXOmCvGlDf3WBXJC2oZVxwwnjxKxBSpkGei/p
	BAtA7qjGTo94HbuHOG8Tkg9hVhervXQwl6XALigoSpfJBbEobasFv0lpeAU5lHkkrtonY9C4vq/
	5puhJLe3tWQJ2eeu5vitHvdHWHOpa5VC3tMQAdrJWbUft438PFlHdiIbvmS9bjDUMB+Qdc2GluO
	4Dhkw23nKx
X-Received: by 2002:a05:600c:c0d2:20b0:492:41c9:886b with SMTP id 5b1f17b1804b1-4926684c948mr14881805e9.14.1782376560755;
        Thu, 25 Jun 2026 01:36:00 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926401a2e7sm80070205e9.3.2026.06.25.01.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:36:00 -0700 (PDT)
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
	The 8472 <kernel@infinite-source.de>,
	Willy Tarreau <w@1wt.eu>,
	Joanne Koong <joannelkoong@gmail.com>,
	Val Packett <val@packett.cool>,
	Andrei Vagin <avagin@gmail.com>,
	patches@lists.linux.dev
Subject: [PATCH v2 3/7] splice: turn wait_for_space flags argument into bool
Date: Thu, 25 Jun 2026 08:34:05 +0000
Message-ID: <20260625083409.3769242-4-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260625083409.3769242-1-safinaskar@gmail.com>
References: <20260625083409.3769242-1-safinaskar@gmail.com>
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

