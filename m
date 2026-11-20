Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186819;
	b=KWoXdHBZWP130Isu12sPE5EpBgt2thUsuBqFywAaJ9a9V2BHALamMdvmXG7eolAU4rlG
	 tasx2OG+yfx+3pDKXyFfg46QWiE8RWjJ8Jz1I3z7U1nNVTpw4n1NbmlUz3ISzx9S6GnU/
	 DShGMguGn+lUwBA2qfZQtBjaAgMNclvXK6Ol3MDsb/zW1DxdtdePTCl2UHUbeh1aJ7+fq
	 LpEIae7XZ1y1G6kBQRhSwCz+PvL9peQp0hJzR4fJYe67o2W7lTFPFzLtWLQFEJ9WyEn3J
	 w5z14TbzQ5d7trHlWcGqrAydJzClFh0UFo5FzRV1CXd78FiZazBKZCVZxacX5fd7Uag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MXzkIorMiPWbDKQso2cn/JUFxw2wDbcQUfodK2nAGqk=;
	b=xnAFHYJyXpeXlVH/XsS7fyPNpPRghxwxmDKU/0Pmz13lsm6yEgOMzcRdTzE0j9v6CJIN
	 eCHu3mESk1x28aFFgPiKbQWf9MdxzKO4gihW4J/KhMyGzfyjpOLIteXHqVytf7t8K8Ona
	 9vUu3rmiS3Da+CJm+0VnUqsdobIVskf3pPWHM/bZtbTfo21GffsMv8KjOPmh3+Imq7ouM
	 NVMr/oC+p4ulmhOBRButT/vHXcPQJ+ZV5O/mWYzhIEDynz7uz3JXZqx8aAV4n51bzjY2O
	 XD5ppTQuVveHo7U/GyGsEZDNrqUb8/rGsmxivtkXH8l1fChHACyX8vVs8CowCShGCgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OTL/vmn9";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C3760A6F50
	for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 15:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C3760A6F50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTL/vmn9
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso6443795ad.0
        for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 07:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186817; x=1795791617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXzkIorMiPWbDKQso2cn/JUFxw2wDbcQUfodK2nAGqk=;
        b=OTL/vmn9e6E389SQcph5/cjijht01lgu48k/Ve9lDK83N6jjG30ksrfJmYFPA4/s9g
         7K7/IoGdI3K6Ol8hERs/pR3TcrxfGss6ChhhCXjIDc8CAWaGbJztrqXG4Ic2deRl+sL6
         CA/dx1zeO0niF21GXDCYhMxfKFK/0A6OYblYlXVk52W6+7e0tuEfgmYHYoJhJA95y9Uy
         9Eerq1ei8I7GwGKcz5zjuoC6u3Fn356QEa8G6VcLev0urGZZigacP/Nvnvwj17sssr4r
         0yg50RObo6yIIPOl04rBAybxnbOLc9zVO4TBX+fTK92vKGJP6neH+ggCJMWSBCEExT41
         Ra5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186817; x=1795791617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MXzkIorMiPWbDKQso2cn/JUFxw2wDbcQUfodK2nAGqk=;
        b=1bBgjtdmyy/esKyQ/XWFgyS/dtizFXN4WuPX1L7WYYMlwfCvx+W5Arc2/q6/PMVh8T
         gH+2U9nLx93DmWdQP5CqS3DQug0ZHYyvJ3mJuBa7fx8wMONLgSdv7J4E6jasZjAcGtc+
         d2YLD5/XtbuKNLMEX03+4g7F0CM7Mq0xOd72lnOpO1JzOjxLZc1fBcRfROULvdZ9MamS
         Lt47M8nD3YxrW/cLnE4jkY/cqgdmuZ0s4oCs5KA2B7U64A9AdEhnB+cCxEehdciMTaDM
         ggMZg+sYpQVBtVMhEZyoSS/EpVCz4VA73G8o8Xu6zCtPkvSdZxuKKcqRi+w7GDnL8Cij
         yknQ==
X-Gm-Message-State: APuU4Z/ffj9ua4kJb4ZeAlrxtnTnd5NvLsT6h1tsa5nEBgmzfe6ohsX+
	BtKYLA+ALRTpIEq2z/PxrhmLcwkUTaHK434fXM79asFop8v5aUPEG8idQ4pfdw==
X-Gm-Gg: AZFdTZefhs2s4698t7y09X4LMJFMBsCQWJXvRXoL6VQh8ZFFtYh4FCot5cgCIeFU7vl
	qTv9Yl8j0XOsOfoy/HVlxCJQ622VEyXSqB5LL476NEIUPkvVQii0ks7BhDfTFzqwRFcraXImZ6P
	mWpmDsJVDGSmaNPp+36Ehrpazwh4iv74xOmxq6x+6e6wZvkNQGo9kDx2pXVnradD7qLk9i5iUvx
	wjAw5bdKPWXjQdk+bWFvS4QgO3VfbJ8xuPmcMNf4/c5MvIh1XxkO91I2w3OQIVLqiNup8FgjIq+
	SByZQGNgaesglTNGRyFZvQMVn8crT3qv8vuA98hmbPBcalvtA5tgENFqe9RF1+s/PI0QVUFHjv7
	18nlw2vST74pJGJCiCY1umWA9TTHJ+nbY3844cdAleQgTUUY2wqJx2SAjq96Dzo8rwBqYC9Htb9
	RKIFn9nfFD/J4xR+Wvco+MykgeO7wMfQqmw+wrQKT0i7DC33EevCxxBQdV76Skb4vB9wY3cNUd1
	niBLetionrZo6fuR0JjTcEjLF46nFNMhXTopc0yRZgeWGpP7MULTW2bRtmYv9exKArjLc9ajdP1
	Tmvk10mDvmQ9LF3xia4rB02hZj+aZ7mDFHqUWdD9L8DA05Ub4GeX
X-Received: by 2002:a17:902:f544:b0:2e9:4f49:111c with SMTP id d9443c01a7336-2f031fbdaddmr40856255ad.27.1795186817118;
        Fri, 20 Nov 2026 07:00:17 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm15213005ad.59.2026.11.20.07.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:16 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Miklos Szeredi <mszeredi@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] fuse: do not schedule dentry_tree_work after fuse_dentry_tree_cleanup()
Date: Sat, 21 Nov 2026 00:00:06 +0900
Message-ID: <20261120150008.1144420-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120150008.1144420-1-ekffu200098@gmail.com>
References: <20261120150008.1144420-1-ekffu200098@gmail.com>
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

fuse_dentry_tree_cleanup() cancels dentry_tree_work at module unload.

But a sysfs write can call inval_wq_set() after that and schedule the
work again, leading to use-after-free.

So do not schedule the work in inval_wq_set() after
fuse_dentry_tree_cleanup() cancels it. Also hold kernel_param_lock()
in fuse_dentry_tree_cleanup(), because a sysfs write can call
inval_wq_set() at the same time.

Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidate expired dentries")
Cc: stable@vger.kernel.org
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 fs/fuse/dir.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 0d5d04df477b..04ca6c9be2bf 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -63,7 +63,10 @@ static int inval_wq_set(const char *val, const struct kernel_param *kp)
 
 	*((unsigned int *)kp->arg) = num;
 
-	/* Defer the work until fuse_dentry_tree_init() sets it up. */
+	/*
+	 * Do not touch the work before fuse_dentry_tree_init() or after
+	 * fuse_dentry_tree_cleanup().
+	 */
 	if (!inval_wq_ready)
 		return 0;
 
@@ -243,8 +246,11 @@ void fuse_dentry_tree_cleanup(void)
 {
 	int i;
 
+	kernel_param_lock(THIS_MODULE);
+	inval_wq_ready = false;
 	inval_wq = 0;
 	cancel_delayed_work_sync(&dentry_tree_work);
+	kernel_param_unlock(THIS_MODULE);
 
 	for (i = 0; i < FUSE_HASH_SIZE; i++)
 		WARN_ON_ONCE(!RB_EMPTY_ROOT(&dentry_hash[i].tree));
-- 
2.53.0

