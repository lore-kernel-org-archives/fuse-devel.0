Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B60374170
	for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 08:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376634; cv=none; b=AIbo88r1X0aif3KRTEbX026l8WfYGQpks9l/URnhou6oej+Omz4z7qc1ilBjl6X9kf+J3dszl2ZKl/3W5cRAAS1e32sOGv+3gt3BC2KyioLlk3/jhgcf6BDisHzgJ1DPop9JbYOJthsUpfELWmqzBfe9FNwWSVfizlWWQzg3K7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376634; c=relaxed/simple;
	bh=vfuzqAAI4Z7JfbLKu/I0egbH5sPpHBKYRHIHNaxeamI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gH2V9XLubOUg+nuO3F2zFAY7ah7/heLBmbRcr79Q19edh/Nyks+F1vyEkic8A+OXGpFk+1LEigoBNTgIGh1tdJVYdc8qRi1y7c+cIACRe38piOx8drngSe8obHywZN22f3lSrhICKVxLLt61iiKOCghv8el+m3eHjz6DtTjZ/84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jvf0NzIj; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jvf0NzIj"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-462342ac290so2364335f8f.2
        for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 01:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782376632; x=1782981432; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Vxs0grT+d4GM87KSfFWu+blunYqTUopWsPT4iLI/6Q=;
        b=Jvf0NzIjoEzgxkGAJHYowWVD45/rDR4HGAxnVmFciVgNHUPZBT8pFPmZGkWtnyIDMR
         vU6RPnfXfWnfQuNoIrXEehNTMRynwE3UhSkNSsNOjEEdeY0Itt0o2IdV1M5O/dSuIk+W
         9Os2Sm7qr3qd53fbXJlB41eb861D7r9MhYhaWMPsC53qDepjGfS6Q/J2izrn/6Vw7A2f
         OPnJL4xTaOIQ08NaQDertPPbtVysOp6iCOx5PWASXKB67O4jxeCtX2iBe+aK+JHfxOkB
         AEGgmpINW/mGtz2Mh7Qe4iNKTKGQAtfJfhQtpEKP77kLmL9YGC9whsN2qLQ6UcOndnqG
         px5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782376632; x=1782981432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Vxs0grT+d4GM87KSfFWu+blunYqTUopWsPT4iLI/6Q=;
        b=FWoEJWqz8e75expLClQR9DTwD4+ihicyj/XskQO1XlJAHcuNS2Sqm68udES24BnjCq
         /SsxjFWfltxj2F15tyk1Na68aKTus6+KnI8Haq+rble0K4zH81Rv5wo3i0JbdPXxCkQg
         D5MACPzKoOXcifLoXX9V3zgwpyXHHtqminIxMGM/LRwt9nL0NqRlrs7vhK9knJCOYTyV
         I7qj30+EpNDcJGpyk3GeuRctD4e0ytZqCP1esqPPi69WpeV9rdUl+0RqjuFL4WAZ/Rnu
         E/NaCg6OFAKmf0Fb+oFGrTNjThZTpLIcBGuR0t3iZvf+FKZGuahMdwL+Wc5OQSuhGnOS
         hnIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgwNnbe+Wzw/nSgBIPDF6OZ2YwnW3w6CDdl9Bog8Wo1kZftNPyQFa4W8JiHGwGDPk0gEeDIfhLLOEu@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1HR/ZR5fGYwqefLlAjHBSmDQt6yjnbO7vCZJYmXRKIohKZVlS
	OJNAbcRhGSymxfpqnqhDbB61brCivSdlqG0I97rj7mfgOrFsQJZpr8vE
X-Gm-Gg: AfdE7ck/f9OxjjOVSxIcZtWD0SK28WIF/0pshrEgVBr8yB2LG8fzX9MOPyRLEkyQxUT
	ucEzcql9bRIo3QcsW69oCK3e1HCjgnRfJdA2X/DaEROmA7hDf1doW8EEioOdrM3PVvRI8ipPY1Y
	ydqchm9evfWkJeOXVGU6yJ8WjaJ6ygoBFDcJKGo1NwjgxpCpLKhAeuCdnZhWZZ6kAz5w97xMJjT
	qZs+Nxvp+boD5xO9DPir/gBp07mAcppOSZ2PZ92emrmj2Sp2t3meb2pl7ptd9qInwdrKzPbOm6L
	Gh+tZ/r3MMEJTfWOZYZKbBaQSvAQN/OKWF3UPO/IHaS6JPwEG0Mu4IADrRZhiiHlsNDLjNqakNI
	uCrXcbZfwDfihVdVn2VO12iWdxRK676sOYtQyBOsHd1HyQjNcH3qPiEMSrzmnz6Tg1oeW76zuzz
	TSoYo0d+Sh
X-Received: by 2002:a5d:5e81:0:b0:468:4f81:5aa4 with SMTP id ffacd0b85a97d-46dc026de2bmr2181270f8f.10.1782376631864;
        Thu, 25 Jun 2026 01:37:11 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46c221d93eesm13786367f8f.20.2026.06.25.01.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:37:11 -0700 (PDT)
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
Subject: [PATCH v2 6/7] vmsplice: return -EINVAL for particular combination of flags
Date: Thu, 25 Jun 2026 08:34:08 +0000
Message-ID: <20260625083409.3769242-7-safinaskar@gmail.com>
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

See comment for details.

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 fs/read_write.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/read_write.c b/fs/read_write.c
index dbd0debc2..b1f71b142 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -1258,6 +1258,16 @@ SYSCALL_DEFINE4(vmsplice, int, fd, const struct iovec __user *, vec,
 		bool non_block = (flags & SPLICE_F_NONBLOCK) || (fd_file(f)->f_flags & O_NONBLOCK);
 		ssize_t ret;
 
+		/*
+		 * libfuse relies on sharing vmsplice behavior.
+		 * So we detect particular combination of flags to
+		 * pipe2(2) and vmsplice(2) and return -EINVAL.
+		 * This forces libfuse to fail back to non-vmsplice
+		 * code path.
+		 */
+		if ((flags == SPLICE_F_NONBLOCK) && (fd_file(f)->f_flags & O_NONBLOCK))
+			return -EINVAL;
+
 		do {
 			pipe_lock(pipe);
 			ret = pipe_wait_for_space(pipe, non_block);
-- 
2.47.3

