Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315422E62B7
	for <fuse-devel@lists.linux.dev>; Sat, 17 Oct 2026 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230385; cv=none; b=SDbAFX/AEzCb01hFcAHJ5ptvSOAzh6xXXoHN2yuDHm/vtmuFmn80Xg1RlVZBmGFq6cap5SGTclqP+9vG4HYs0BBi0BDR+ooyP8bKI+o7I2IgDfI3Usz1bNNT4pagjIo6pKK5IJ0HP/9o9QlMuJr0+JcdQXx5VpaCa5TpOO5ZHq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230385; c=relaxed/simple;
	bh=TZz1crEg3zzxMgZGJ1WipSQN4v8kyBvYzp5XWcZlmU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TMPFJgCpWEoQgZhDGQMDWOSqxv2Lq8i9HURDsMe0FGz5ipm/jUg5NMXxezaEtD8zqw62by393F341i7P5oIKuJ/LY6u8VoMv9CKxpBBuJBugESGjHbWyO01VaRXrxIZ+UTGWvYHv54z25FhwwKre4z/SjuZ/easfHprdjOXu0go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=MCqafwRT; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="MCqafwRT"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-917ad52d7b6so8133596d6.2
        for <fuse-devel@lists.linux.dev>; Sat, 17 Oct 2026 02:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792230381; x=1792835181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P90bN1D4uqhQhb/kG3ARk5SrE0A+Bx6rHl7Bkm9kIqc=;
        b=MCqafwRT8zFBVTP+cPpGEUJSU6xeKPzG2v0spHvhMSCq8dKb35O6oVaPJ4eo/DRa80
         A8pk5BtNiKSfdb217vdpOgdJ9oCsv85Vg6xJCEOV5WwGyZgJcp2NfXtwaBBADtjWMp0f
         ymOw65vIa+r4QSdI+c1JKVTmKDOfQqHFXvIwpeI/1imtw9DHLYKsPtIkdWPBoOd4iV6b
         85VKltAuZTLIqFDo2swhhLcVNlL4nvwRcSk2PZOB2UcChjQf/2z68xUwCrcdoPXtpMtM
         aF0QSPgQ0hCOrqW1CzBkESThrd5C9tr/nSmXziz4+4pnZpO4zkVGpovJXinq8hsQUTNG
         KgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230381; x=1792835181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P90bN1D4uqhQhb/kG3ARk5SrE0A+Bx6rHl7Bkm9kIqc=;
        b=c2UNRMY66loC2FDD52iNJrxNTKpqzQeeWp1NwHlJNw4JW3uVaCOsDt013SDohvOkWR
         Q8RYicx1GwcWd7E62rnyzCvdjxeOy7dFSe306b9f2BHbjcyejixwdWVyhLBbZpjxln61
         6IjN4QlcYJuuOorg9uofRhOK8PeaZ/2jZZgzcAtImPhUDsWYa74WccOy6Paf6N5i/GkB
         5E1LVVNs1HIw+I04gp3IrC9rQQL7KFPSYEoM+Y4HaaJ3zmqL3OJB22IIeoLQNlWCUar7
         Zv1s3ZZcWMJUTS2uGkrVatNwYAvrIHd9xIb412avIBTpHTN+A0y/I+BldKKrC1i21dfU
         7IwQ==
X-Gm-Message-State: AFq9FYJfCI84GmttmBo7DNaGKGSVn2kNteelRoTHX0zohyHAu0nGnMKd
	Sd5N6cCiEQuMBef9qWOMsIPJZlRyIYgzEonDz9T3HxcmGQODwt2M4+jtMmHr0Gj3ZA==
X-Gm-Gg: AYBFou0bl5YLw6+4o+1XAT0NxqT4XYQrD8JV42DDk+R9w53RDECRSUi/AYlRAsDl543
	lsmiqbBnuZp8BGGUEmymYTzjQ2VH6kiFnysXHg4B1PyPl4Ozfcy3TYa8GB0wco/BLpUNYdePsNk
	Vr7HP3+UwsK7zDj3fqzxEwk8Y9Inw8vkbONq0Ye2kmoNx2MFQVxmEzVSH2uQrvHZ2GtrT31YCXC
	NGLpYexL9X5xYRnqZj3XBvnzaIZFP1jwcKyC5uKlFsxHkCr4XmGVJtC+fNeo5kl2blp84d/3WXu
	CRLPclX481WTf4K9Q85EzTNKHrto5IZdlR7qn3ioJPDFly4GD/MASqzSb3lR7Kk5mchNHfglSgg
	c9AuWQ2K2BssK2waUd9CQnzxY7xaWVEOGmq+BaiB4FzfS4vAIXzO2cqIxkK0PZOwCPLbt1ae2JZ
	D/sLhpLKblvMCbaO9Wy3rthauQ7FkhFcHM3dq4NW82DmxXofUMUDLOsAURWZrMD+rR8+OBGJ9hb
	94wu+Vz8d2EYeZfpPzs
X-Received: by 2002:a05:6214:4687:b0:91b:8afd:84d5 with SMTP id 6a1803df08f44-91bdf0f2d62mr37414346d6.21.1792230380915;
        Sat, 17 Oct 2026 02:46:20 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba4b9e1sm43701226d6.14.2026.10.17.02.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:20 -0700 (PDT)
From: hengyul@cs.unc.edu
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fuse: preserve ENOTCONN after failed initialization and disconnect
Date: Sat, 17 Oct 2026 05:46:01 -0400
Message-ID: <20261017094601.3434882-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hengyu Liang <hengyul@cs.unc.edu>

Commit 794e811d1443 ("fuse: split out filesystem part of request
sending") moved the INIT failure check into fuse_req_prep(), before
the channel checks whether it is still connected.

If a daemon closes /dev/fuse before replying to INIT, aborting the
channel completes INIT with an error. stat() and open() on the mount
then return ECONNREFUSED instead of the previous ENOTCONN. The same
change occurs when INIT is rejected before the daemon closes the fd.

Record INIT failure in the channel before publishing initialized, and
check it in fuse_get_req() after waiting for initialization and checking
for disconnection. This preserves ECONNREFUSED for failed INIT while
the device remains open, and restores ENOTCONN after disconnection.

Set the failure flag only while the channel is connected, since abort
also marks it initialized to wake waiters after a successful INIT.

Fixes: 794e811d1443 ("fuse: split out filesystem part of request sending")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Tested on x86-64 KVM with KASAN, comparing v7.1, unpatched v7.3-rc7
and patched v7.3-rc7. Checked stat/open before INIT replies, after INIT
refusal with the device open/closed, and after successful INIT and
disconnect. Also checked pending INIT requests, 400 concurrent
INIT-reply/abort iterations, normal FUSE directory operations and
CUSE open/read/write/close. Results match v7.1; no kernel diagnostics.

 fs/fuse/dev.c        |  8 ++++++++
 fs/fuse/fuse_dev_i.h |  3 +++
 fs/fuse/req.c        | 14 +++-----------
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 4fec31fc0b84..168ad7e00510 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -80,6 +80,10 @@ void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_param *pa
 			fuse_uring_conn_init(fch);
 	}
 
+	/* An aborted channel is also marked initialized to wake waiters. */
+	if (!param && READ_ONCE(fch->connected))
+		fch->conn_error = true;
+
 	/* Pairs with smp_load_acquire() readers of fch->initialized */
 	smp_store_release(&fch->initialized, 1);
 	wake_up_all(&fch->blocked_waitq);
@@ -130,6 +134,10 @@ static struct fuse_req *fuse_get_req(struct fuse_chan *fch, bool for_background)
 	if (!fch->connected)
 		goto out;
 
+	err = -ECONNREFUSED;
+	if (fch->conn_error)
+		goto out;
+
 	req = fuse_request_alloc(fch, GFP_KERNEL);
 	err = -ENOMEM;
 	if (!req) {
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 4b412a76225f..0ffdc7f57963 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -245,6 +245,9 @@ struct fuse_chan {
 	/** Is interrupt not implemented by fs? */
 	bool no_interrupt;
 
+	/** Initialization failed */
+	bool conn_error;
+
 	/* Use io_uring for communication */
 	unsigned int io_uring;
 
diff --git a/fs/fuse/req.c b/fs/fuse/req.c
index a01ee743d31e..eede265b06c1 100644
--- a/fs/fuse/req.c
+++ b/fs/fuse/req.c
@@ -49,19 +49,11 @@ static int fuse_fill_creds(struct fuse_mount *fm, struct fuse_args *args, struct
 	return 0;
 }
 
-static int fuse_req_prep(struct fuse_mount *fm, struct fuse_args *args, struct mnt_idmap *idmap)
-{
-	if (!args->force && fm->fc->conn_error)
-		return -ECONNREFUSED;
-
-	return fuse_fill_creds(fm, args, idmap);
-}
-
 ssize_t __fuse_simple_request(struct mnt_idmap *idmap, struct fuse_mount *fm,
 			      struct fuse_args *args)
 {
 	struct fuse_conn *fc = fm->fc;
-	int err = fuse_req_prep(fm, args, idmap);
+	int err = fuse_fill_creds(fm, args, idmap);
 
 	if (err)
 		return err;
@@ -76,7 +68,7 @@ int fuse_simple_background(struct fuse_mount *fm, struct fuse_args *args, gfp_t
 
 	WARN_ON(args->force && !args->nocreds);
 
-	err = fuse_req_prep(fm, args, &invalid_mnt_idmap);
+	err = fuse_fill_creds(fm, args, &invalid_mnt_idmap);
 	if (err)
 		return err;
 
@@ -91,7 +83,7 @@ int fuse_simple_notify_reply(struct fuse_mount *fm, struct fuse_args *args, u64
 
 	WARN_ON(args->force && !args->nocreds);
 
-	err = fuse_req_prep(fm, args, &invalid_mnt_idmap);
+	err = fuse_fill_creds(fm, args, &invalid_mnt_idmap);
 	if (err)
 		return err;
 
-- 
2.53.0

