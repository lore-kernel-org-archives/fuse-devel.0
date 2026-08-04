Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D8943E07C
	for <fuse-devel@lists.linux.dev>; Tue,  4 Aug 2026 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785835107; cv=none; b=hR90nmBZXpXvFfkXhCJcm8jEOboyqZcNNRO5/RSrgH6GkHmfJ3T1FQnKdJrT0xTaXOJ57eCd5zqpYY5skX2psvckxCzY7OW/89jCKwAfrbkP19qloknJ7rvahu/5i0TiWlFObFztiicckSLXYm/fh9uYFIFJEJj3Eb5x9yQWMSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785835107; c=relaxed/simple;
	bh=RAB/MyUME2ucjjrxIXJWFmq6CahFTDgCw45WyA2sOc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gy1qfSjGR61Jk6Ghl4oLoJEPRHcRAOA4t4mhgCGxMzrpYWnkzxD9ygD9MKZTJybqtqkNORxbacjg15Q8JEQT8/YT1aInkXqW+HY7T3+WOTdqDk9bu9t8r+iq66HvTowzhjQNrQp3OXwKg9Yo5qvCXdec7LIqIvU9SlZocP45rsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6gnQVKH; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6gnQVKH"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc73e322dbso42914945ad.1
        for <fuse-devel@lists.linux.dev>; Tue, 04 Aug 2026 02:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785835102; x=1786439902; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GoaS38uzGP/FgfFST1kKMJA7M2vxyy+l5McECO9UQbc=;
        b=I6gnQVKH8e//+JdYOgOpBbVTzuHKzCptUG2AIspTwS3a+b4FtSfC79nijmPJayoMoN
         Z15hbLzr7J9LX25NdGq4BBh5L08895FInXlWQ71bRVeceu1WRIMQS06OwaefJiNOan0U
         i0nZAs8PhKGVgq1BEL6fiueWzxLqHFKNEqEfOo0zowfJkZsH76L5TweqyMVdQpgEjLbr
         g8pEKHVJ/YahKWnGXwzJXgIzaEG+owtWpkZTtNbuA/ghDXYqJHA0xL8qvOHTqJJyJAZW
         j6MeA/AmpGLqxgc0JBJtFrFoJxmAE8W7tRvf8mc6iDxPeJ4o6ZTgnQxATm4RwEr+IJyf
         iAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785835102; x=1786439902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GoaS38uzGP/FgfFST1kKMJA7M2vxyy+l5McECO9UQbc=;
        b=OzQBZ9WKd/ZUlsKvc56XRntuSAeQUKi2STDd9wCFM/IE4RrCVh4R1QDEugAD0Jmjtz
         7Hc5ENJeOGgKJBVKI1g4+JOT/t7gRcvE7rs0C9KgUfeHVWjW9afkALSTYvfwBUBWeizL
         n7VaV8WUnRrpu/6eafefwaRyjG4jI48fpSFwK+ARQ6dPNw0koDIQgNnw8tSFGo3XpEnv
         jMT6qt7UKCoaaFdvkA63//qQk6+zxrxiqM8FDvUU6OukFjnvR0RnzYRDUNUXNoDng3I5
         AiKNhmRm2m4Bxj6S+Kyx6rbaidq0HPHrLTArD6s25nJyA1Ky6kUb5FaAsC+6FPxfceRj
         U4TQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzLjxlNwQfY4mNeh+JjwhUh3J5ptmuKpgIz/muFUHq4p6dWPcGLqg/Wlv1HCtww/JT6xxWPtSIxEv8@lists.linux.dev
X-Gm-Message-State: AOJu0YzDdecOMi14o8BjAgKg0GyYOZkS/xhTtKTf8APJp4ThtrPcvUsO
	kDpA4uWzEad/D3lRhyWVIEd2VhVQERrsvtlSc2Dd91zz4CVQOvv5xvgOeNyMJTxyrQ7Vaw==
X-Gm-Gg: AR+sD12a9c5dHucjL1KyyVW+gZp/GTJHJj16+vh8wZU1OO1Rv4cnfSSH4h0GNi6rErP
	TdhPp40lMTC23P37G8QHDNwNNWKae55HCL+lb17prg3A051LwUfskqNo0djWUu94G3O6zprl+aG
	SfANv4UVne4cbhbPRb15OG+FfL/KXdvdTQoqa7T8lioNf9WyiTw7T7zmcYB1JG3g21QJE9Y+PSt
	M1a5k+lyvRGY+pw9gNdWUkRqIOvBDFAGti0yCR9sHfPHHJu0HfM/gln3bF7N7JF+ZzGTkZ06SFq
	4aUa5tFONjxdO89PoxEr5NucrVCvAG0IwWPzUQwruHntdgowKhZ+zjbpdQacQv+GDX+I2K/DCgE
	BS12d80WhoFBSnAdwHYM7ej6xFiogtqYNlpFcRYvJP1KPeWUK7R/XJFm2oJhyO6GgLPv/IlREKy
	eeK21som/ZyowNe6B884lsUr+MAO5Y9WwCDGLyIUlGGIzqYdHOhL3y/gaIGLmDMDE=
X-Received: by 2002:a17:903:1a67:b0:2cf:7e56:22c4 with SMTP id d9443c01a7336-2d0523e1c85mr138995385ad.30.1785835102279;
        Tue, 04 Aug 2026 02:18:22 -0700 (PDT)
Received: from TENCENT64.site ([103.7.29.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f8fee7sm3681065ad.16.2026.08.04.02.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 02:18:21 -0700 (PDT)
From: Jun Yang <littleddfu@gmail.com>
X-Google-Original-From: Jun Yang <junvyyang@tencent.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	fuse-devel@lists.linux.dev
Cc: Zhao Chen <winters.zc@antgroup.com>,
	linux-kernel@vger.kernel.org,
	Jun Yang <junvyyang@tencent.com>,
	stable@kernel.org,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: [PATCH 2/2] fuse: don't queue an interrupt for a request that is back on fiq->pending
Date: Tue,  4 Aug 2026 17:17:09 +0800
Message-ID: <20260804091757.503476-3-junvyyang@tencent.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260804091757.503476-1-junvyyang@tencent.com>
References: <20260804091757.503476-1-junvyyang@tencent.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_dev_queue_interrupt() links a request onto fiq->interrupts based on
an FR_SENT observation its callers make without fiq->lock: in
request_wait_answer(), in fuse_dev_do_read() after setting FR_SENT, and in
fuse_dev_do_write() on an interrupt reply with -EAGAIN.

fuse_chan_resend() invalidates that observation: under fiq->lock it clears
FR_SENT, sets FR_PENDING and splices the request back onto fiq->pending. A
caller that sampled FR_SENT just before that happens links the request onto
fiq->interrupts just after, so the request ends up queued on fiq->pending
*and* on fiq->interrupts.

That combination is a problem, because a request on fiq->pending can be
released without ever going through fuse_request_end(). A waiter whose wait
is interrupted calls fuse_remove_pending_req(), which sees FR_PENDING,
unlinks the request from fiq->pending and drops the queue's reference;
fuse_chan_send() then drops the last one. Unlike fuse_request_end(), that
path has no FR_INTERRUPTED cleanup, so the request can be released while
still linked on fiq->interrupts, and the next fuse_dev_do_read() walks it
in fuse_read_interrupt().

Re-check FR_SENT in fuse_dev_queue_interrupt() under fiq->lock, which is
the lock fuse_chan_resend() holds when it clears it. This restores the
invariant "FR_PENDING set => intr_entry not linked", both sides of it now
being taken under fiq->lock. No interrupt is lost: the request is going
back to the daemon, and fuse_dev_do_read() re-queues the interrupt once it
has set FR_SENT again.

Confirmed on v7.2-rc6 (075b74841bd0).

Fixes: 760eac73f9f6 ("fuse: Introduce a new notification type for resend pending requests")
Cc: stable@kernel.org
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Assisted-by: tencentos-corvus-ai:kimi-k3
Signed-off-by: Jun Yang <junvyyang@tencent.com>
---
A KASAN reproducer for this issue is available if requested.

 fs/fuse/dev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index e62c7ed8bcf4..c4df1d4abd33 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -240,6 +240,11 @@ void fuse_dev_queue_forget(struct fuse_iqueue *fiq,
 void fuse_dev_queue_interrupt(struct fuse_iqueue *fiq, struct fuse_req *req)
 {
 	spin_lock(&fiq->lock);
+	/* fuse_chan_resend() may have put the request back on fiq->pending */
+	if (!test_bit(FR_SENT, &req->flags)) {
+		spin_unlock(&fiq->lock);
+		return;
+	}
 	if (list_empty(&req->intr_entry)) {
 		list_add_tail(&req->intr_entry, &fiq->interrupts);
 		/*
-- 
2.43.7

