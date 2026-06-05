Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB47C37B003
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 19:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780687677; cv=none; b=LzsoUqXYzXKRnTbonpS96zdBwn5GPywWFNG/+dM/AdQ6Oh9t8Ht8HczA8uSrvLnrM1KwYck7J6MqImmfQAUrEgEFDNZsS0gLN/fiKDRGvCPeRkPPvW/g/UIs+sqDBCXsaDIm/hBzas3HevjLL5yRWnxYNh2rreViKzlboNtU4Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780687677; c=relaxed/simple;
	bh=1f9vhyvrCdjommO8e+Pf2/I63QM9ENxWmHFXdNcb+3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=npx5shuJfCuDZKGuYbsm/GxBa/JNHbydFQV0Nf93EI50eo+T7IS/bjjupOfltvtNRY/2ZURWqVsgHB2aNb/VyqdiSK4zmzMY+zq0VyS5qc3CjRI7KN8drhxH0HP/5v6+CySk8SBYLQydhqj5xMZ4nga6kRdFAXCpI8PLwYrvf3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mK/MqEMC; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mK/MqEMC"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8423f236418so1330587b3a.1
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 12:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780687675; x=1781292475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IBG9rdlQryA3/YVME2f5LNj0hfA5RYuHNzIVbO8zBg=;
        b=mK/MqEMCVkE/f4NmEgAhkJR4MQu8VqICQ9q/k2GYRj5gSdLXURVsZyX7RxBhW5vS/a
         DRVYp0yvCSPKOf8dlkq7AAIFuRnDY3YnSO+K05xdkXuHECMRnNr7b3E/tI9Cz4PYiz3Z
         CxxjoDSOim2rLjgivgx+HkfDn7RNB0ZhpajG0FvFMeM2J6HDdpiMqdzNixKpw9rmnr+q
         OtRjpCVbDwWTvf9Qn6FN71v2KpD+/Zu1o94pmUL2i+Y1ZWnuB2C17w0y3m88Wz3tSHh9
         mKxGFhyRy8L6yuPSMmXaHBdPpuhYbWYc4ksAe+a6ua7hEkWchRcZnu4M1iXOIDA0F33h
         cNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780687675; x=1781292475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+IBG9rdlQryA3/YVME2f5LNj0hfA5RYuHNzIVbO8zBg=;
        b=ZU7wtN5SlRzb12GSndNvaP5HrMH3PmQP81Bzb/Jjr+2k2RgYjuzM9Bg2GOUDgeKMZ0
         74D2AIvXb5DMBDto6lJ192UbqvMs7KsYQ/C0V0s0VJVDYJnfEdaFGSycxQ0lgVD8KR1x
         bcaQWyXklNoSsXwmoFiQASUdrknIN62WIVWUwctkjbYikKU22y7p//qyPt+HGZGJbu5L
         fQmgS3N6vIJ87KzfvG2atOQEJl6WDeh7NVxWPnGb8NleoXjwapyooXxunre4reuTrIpX
         +eHXTn7gyUJDpVv9VcZNhK/AaYTODeZwZCcP1LnhRTIqT0coQ6ST22Fq4H1URlhzUp+1
         44VA==
X-Forwarded-Encrypted: i=1; AFNElJ/2HNhd6HRuVpMnIBtp1yWn0+khiQVDJPPUUxx485iv9KyFMV/1JKvJ7Y/NntNmtSGBt3bgYyQC/QGE@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2vBH9ZwI32BB9i8FDQRLSK+KjgCdJPMTPsQ5pMpleyG0K1NJ+
	VMbhOTKHgNtnlbdrOp7gcE37QbgpZOadh4Azn1pG/b/u43+XBR1gC5JX
X-Gm-Gg: Acq92OHgTs6uPnQXdEPTsHYK/R+Xap0xKFOyVbD4z9lpz2A4sSjypCwTxHify78QyTZ
	KbcO7m7sKPek61MmjlzLZuLaPYC8QSjUSig+TyOIz0oP9bgncEVn3cABRlLLmNGX6N0Ocm6eygs
	mGRCWvy8QIZl3hd6cvpx9G5Cg+WMptspgcuDZp5MEyZigajC6gtPbwgT6/2inLl+Fde5J6EbNnd
	A6yDL7DWiotGV8aw7lsC02QmwZUj4Ysmduph7pdcc91pucffbXmF2VVuKAUMBjpPUB/jisv8sqS
	WmFfLlrlIVnM9dqslT9BB4TQ+Ms3/NI5E/rxr5GBYfFMAXj7a90uPiR8fJhWbyEa93K6EG3B/7U
	2CIQp3MKU5eKRoYGVpSniNXhfihLMjLjufphr/PKGePnR/N/YmffQlJ/QLzCwlPvdnCvM2k6fHP
	guDxXaTVykcOOcvqVjC4lhCL0eRH55
X-Received: by 2002:a05:6a00:cce:b0:842:2f3d:dff2 with SMTP id d2e1a72fcca58-842b0fb53admr4887192b3a.34.1780687674695;
        Fri, 05 Jun 2026 12:27:54 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:73::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221671sm10829933b3a.4.2026.06.05.12.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 12:27:53 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	fuse-devel@lists.linux.dev,
	Chris Mason <clm@meta.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] fuse: fix EFAULT clobber in fuse_uring_commit
Date: Fri,  5 Jun 2026 12:27:06 -0700
Message-ID: <20260605192708.141921-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260605192708.141921-1-joannelkoong@gmail.com>
References: <20260605192708.141921-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Mason <clm@meta.com>

copy_from_user() returns the number of bytes not copied as an unsigned
residual on failure (1..sizeof(struct fuse_out_header)). fuse_uring_commit
stores that residual in ssize_t err, sets req->out.h.error to -EFAULT,
then jumps to out: with err still holding the positive residual.

    err = copy_from_user(&req->out.h, &ent->headers->in_out,
                         sizeof(req->out.h));
    if (err) {
        req->out.h.error = -EFAULT;
        goto out;          /* err is the positive residual */
    }
    ...
    out:
        fuse_uring_req_end(ent, req, err);

fuse_uring_req_end() then runs

    if (error)
        req->out.h.error = error;

which overwrites the just-assigned -EFAULT with the positive residual.
FUSE callers such as fuse_simple_request() test err < 0 to detect
failure, so the positive value is interpreted as success and the
caller proceeds with an uninitialised or partial req->out.args.

Fix by assigning err = -EFAULT in the failure branch before jumping
to out, so fuse_uring_req_end() receives a negative errno and sets
req->out.h.error to -EFAULT.

Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
Cc: stable@vger.kernel.org
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Assisted-by: kres (claude-opus-4-7)
Signed-off-by: Chris Mason <clm@meta.com>
---
 fs/fuse/dev_uring.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index e467b23e6895..e33847436693 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -811,14 +811,11 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 			      unsigned int issue_flags)
 {
 	struct fuse_ring *ring = ent->queue->ring;
-	ssize_t err = 0;
+	ssize_t err = -EFAULT;
 
-	err = copy_from_user(&req->out.h, &ent->headers->in_out,
-			     sizeof(req->out.h));
-	if (err) {
-		req->out.h.error = -EFAULT;
+	if (copy_from_user(&req->out.h, &ent->headers->in_out,
+			   sizeof(req->out.h)))
 		goto out;
-	}
 
 	err = fuse_uring_out_header_has_err(&req->out.h, req);
 	if (err) {
-- 
2.52.0

