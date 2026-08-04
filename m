Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63903E49CF
	for <fuse-devel@lists.linux.dev>; Tue,  4 Aug 2026 09:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785835102; cv=none; b=H4rQgHwBDPiLNHRR2Ri5o2ZHQucchmN4K8DYiG31ofGzil9S9zvHmT/oAAYpTm1PScMIGHGnFmQccppt03Vff14vmUBE9q3KD1qkVd7PFdzv6ZmB7uyOd9/ABAFxb/bdH9VjEgIQDEF+xTt6gjsVUhMUzTohFcKsob4iMXkiRYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785835102; c=relaxed/simple;
	bh=+JfP1gbbEZxAYpS9FbypkcJck3cynRxZRgE5Qr05GrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blnMW150njHZNVYe7F3bATSHuRSESrDriGIwmNikknVDHHhzM/0ceU3eZGlNFJymmOu9/YqX+h2MeJvTr4wKYIVssu0dv+Kufg1lSoOAcjkhBTYaBLVO5+NW3FOdVmVAfnm3s15xRyFu+9WDjJPNBq78Bb+Q+5he7NP4bAXPHHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpVl3frD; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpVl3frD"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caf228a910so32146825ad.2
        for <fuse-devel@lists.linux.dev>; Tue, 04 Aug 2026 02:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785835100; x=1786439900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6DADmIX820j0VkQtSmHS96HmvLl3nEhITSRy3Q0IpM=;
        b=LpVl3frDV916xR0/Nsqtrajps6vjwlDPTuMzSmqWFQx3D9EK7/CMclLPgzTGVhaYaz
         bOEVqUZe2m0Ric8DTod6YZ1Rs2UdJLGowzyTY+x1hAA7Cx9zBCLmyQX9YIWtBrkqd/va
         fezDja54t0WETMprtYlG9bijDXQTdyzdSy9QtxmFFfce/3HrY52dE1wWBF5GupG0uX56
         9k5SualAoHp0UX5vYtiTTvq+VIG+os6451qrQuZVjyDd0BLPIsWEusJ11abwzGYZmNTo
         fPSWpJRtZOGREtr/KH+l/D6Y05OeitXs914LBAq6E6vasNr/DMMv5n/eTlQpy8PvpEAV
         zfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785835100; x=1786439900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M6DADmIX820j0VkQtSmHS96HmvLl3nEhITSRy3Q0IpM=;
        b=qdv8sqSNTHGchBFieidA8JmTp+J3kObQvzBu86NKpnbjbjGIgkQnLOJy3AXY8e5P0J
         YRwhxh/WlIW7MrHErT9Pu+IPtdH+q+n0nX+dv1VahRa2Q6mPeqxjyR9zBxp1EOqHkRpW
         R/VH5A5QYh9QiRvK3UddQlqdvDuRqeoIzq2Knbe+wJZrVaG1Qay+oRJXlmbyCmbpQtmq
         AwdXJzYPx2A7J+/n8G76JMSZ35adOVHN+/jqUEQiHMN81Se0X859lfj/eeAP+cZTqu8d
         yL15x+JOFhvvqxTiDT9E6b4eEhjce5UaF59SRHiET2rbIpps0XsXDOsUSvQXdzFVrO2M
         MJzg==
X-Forwarded-Encrypted: i=1; AHgh+Rr02ixHZ4UtslO5nCk9z9Iu5OqGq3lPQ8P3X99d/u3I412h9AGK/0SZthzTIoRimls0btLhxPxjCKID@lists.linux.dev
X-Gm-Message-State: AOJu0YwUHD8/i+IfkMz5hFkbtQ2mQXNYzm6HlTXx2WwWPC3X9aNYlKE2
	81kCEQi/VycDlSoDQyKGEPBpf1ATXRy/9ntm37DL79S6lab8BdBcIRqu
X-Gm-Gg: AR+sD11olI3/QI+VNAFvGbbxKjEtrx3F/tOlvIMdzIVXtLcLDVaZNtXsuxn4LliVXJI
	VtjSSmy4JZ0ChR2vDCKhfW4bh53uFcIM/Cd2dFyVXweaIQzm4MARZDf0vtcROPnsqC8wQLR4rLI
	hZKJDcE4Ny9TJlv6WkjgZW7kE8Q3MYE1Xe6i9hVL1jmVpt31O5vqB4L/c7ALsi9qsI8NRgurvH/
	zRttzJ6EuDyN7BzlusTULRX98MG0goMq6D8qF8SEKZEnpYF7+XXhQ4RGGZZSHWmDoz3ac+wlFoa
	Ptf6NgC3agaeyE43gCLdGOd19d3cA+TQZJogCK8Oe0d1Kdfy1EFNo9dn8S8LaubSHkas/N7we3H
	1Jbqd4ECDuEIMMengi1RwoiAdgcZr8iZd9kqQWPWzPsclPqC4+DKCIi1HjqOrY5kl6P9FUqEeS8
	APd8A6JFRh6nkl7eFzRFqNRljBpFCLakaDN5FCT+jJVzPMIRAI9PUgaJ+XNRUcirQ=
X-Received: by 2002:a17:903:2f03:b0:2cc:f7c6:8320 with SMTP id d9443c01a7336-2d052416431mr133850745ad.46.1785835099883;
        Tue, 04 Aug 2026 02:18:19 -0700 (PDT)
Received: from TENCENT64.site ([103.7.29.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f8fee7sm3681065ad.16.2026.08.04.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 02:18:19 -0700 (PDT)
From: Jun Yang <littleddfu@gmail.com>
X-Google-Original-From: Jun Yang <junvyyang@tencent.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	fuse-devel@lists.linux.dev
Cc: Zhao Chen <winters.zc@antgroup.com>,
	linux-kernel@vger.kernel.org,
	Jun Yang <junvyyang@tencent.com>,
	stable@kernel.org,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: [PATCH 1/2] fuse: set FR_PENDING under fiq->lock in fuse_chan_resend()
Date: Tue,  4 Aug 2026 17:17:08 +0800
Message-ID: <20260804091757.503476-2-junvyyang@tencent.com>
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

FR_PENDING means "queued on fiq->pending, protected by fiq->lock". It is
the sole predicate fuse_remove_pending_req() uses to unlink a request and
drop the queue's reference.

fuse_chan_resend() breaks that invariant. It splices every fpq->processing
list onto a stack-local to_queue and drops fch->lock, then sets FR_PENDING
on each request while holding no lock at all. From that moment the request
advertises "I am on fiq->pending" while it is in fact reachable only
through the caller's stack. A waiter whose wait is interrupted takes
fiq->lock, sees FR_PENDING, unlinks the request from to_queue and drops its
reference, and fuse_chan_send() then drops the last one -- so the request
can be released while fuse_chan_resend() is still iterating over it.
fiq->lock serialises nothing here, because the request is not on an
fiq-protected list.

fuse_chan_resend() then walks that same list, and on the !fiq->connected
path it drops fiq->lock and walks it with a non-safe list_for_each_entry().

Publish FR_PENDING under fiq->lock, immediately before the splice that
actually puts the requests on fiq->pending, and fold the intr_entry cleanup
into the same locked walk. A waiter that arrives while the requests are
still on the stack now sees FR_PENDING clear, so fuse_remove_pending_req()
returns false and it falls through to wait_event(FR_FINISHED) -- the same
handling a request already handed to userspace gets. The !fiq->connected
path no longer needs to clear the bit, because it was never set.

Confirmed on v7.2-rc6 (075b74841bd0).

Fixes: 760eac73f9f6 ("fuse: Introduce a new notification type for resend pending requests")
Cc: stable@kernel.org
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Assisted-by: tencentos-corvus-ai:kimi-k3
Signed-off-by: Jun Yang <junvyyang@tencent.com>
---
A KASAN reproducer for this issue is available if requested.

 fs/fuse/dev.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5763a7cd3b37..e62c7ed8bcf4 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1781,26 +1781,22 @@ void fuse_chan_resend(struct fuse_chan *fch)
 	}
 	spin_unlock(&fch->lock);
 
-	list_for_each_entry_safe(req, next, &to_queue, list) {
-		set_bit(FR_PENDING, &req->flags);
-		clear_bit(FR_SENT, &req->flags);
-		/* mark the request as resend request */
-		req->in.h.unique |= FUSE_UNIQUE_RESEND;
-	}
-
 	spin_lock(&fiq->lock);
 	if (!fiq->connected) {
 		spin_unlock(&fiq->lock);
-		list_for_each_entry(req, &to_queue, list)
-			clear_bit(FR_PENDING, &req->flags);
 		fuse_dev_end_requests(&to_queue);
 		return;
 	}
-	/*
-	 * Remove interrupt entries for resent requests to prevent stale
-	 * intr_entry on fiq->interrupts after the request is re-queued.
-	 */
-	list_for_each_entry(req, &to_queue, list) {
+	list_for_each_entry_safe(req, next, &to_queue, list) {
+		/* must be set under fiq->lock, see fuse_remove_pending_req() */
+		set_bit(FR_PENDING, &req->flags);
+		clear_bit(FR_SENT, &req->flags);
+		/* mark the request as resend request */
+		req->in.h.unique |= FUSE_UNIQUE_RESEND;
+		/*
+		 * Remove interrupt entries for resent requests to prevent stale
+		 * intr_entry on fiq->interrupts after the request is re-queued.
+		 */
 		if (test_bit(FR_INTERRUPTED, &req->flags))
 			list_del_init(&req->intr_entry);
 	}
-- 
2.43.7

