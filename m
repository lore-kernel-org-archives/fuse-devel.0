Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E740B34FF5D
	for <fuse-devel@lists.linux.dev>; Fri,  9 Oct 2026 08:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532859; cv=none; b=ax5ATu1Hc2zJqIhUKafIwuxgtpn5kVxvcmKQpF4ou87PadftxCj5kzseUfHIQ3BNq8YTYpZj07vocew2/AvATx1PE7W+l6NyTG+FCCB8UV+hQ06TpmJGUrKJBwMSFpVKu5txSl6iphWnXeZRvMSL6+CIKTumFu9AOEUsruiv/m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532859; c=relaxed/simple;
	bh=FqhFDSHc2Qmi/slkU3MnnKEmDp3rS2wvaVFOs8Wy15o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIPVxCI997P3aqPJRVXkmnTBZTKNodLJUP59ILUin9BOgOKR4ZGbGiqBeuB5rCjVBy/+Y2eAI8sZtOO7t3Qi7NKRaECjR6zSeECO3JBTnLu8c7cG+UENxdd9Jf6S3mW/Rwjg9w5SJNclaUNbhcw8U8ryDbJBhkDCjef64q4cr88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=JX4cDdsS; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="JX4cDdsS"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791532846; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=JmIzrwoLOh3h1wngmFJMDBtv0b5eXExDn6pPPQU0ceI=;
	b=JX4cDdsSE+X/uoYtQCVtfzOIAg2wzJ5ign3exNLkW457Ku79iL/QGIJiiNkkIGsenlA4O+M1qaIV6p9RPUfRHUIHkqonoAKH6Eg+PkaMs+KRNc5Prjxwks2hpZ6qB+V9E1XRo1sOPJOtQ+FxgmOt5mkNI+a7TDlTzS7QIuW4bdg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0XCSmJ9-_1791532527;
Received: from x31h02109.sqa.na131.tbsite.net(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0XCSmJ9-_1791532527 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 15:55:27 +0800
From: Baokun Li <libaokun@linux.alibaba.com>
To: fuse-devel@lists.linux.dev
Cc: bernd@bsbernd.com,
	miklos@szeredi.hu
Subject: [PATCH 1/2] fuse_lowlevel: add support for FUSE_NOTIFY_RESEND
Date: Fri,  9 Oct 2026 15:54:15 +0800
Message-ID: <20261009075417.2521879-2-libaokun@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261009075417.2521879-1-libaokun@linux.alibaba.com>
References: <20261009075417.2521879-1-libaokun@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel supports resending pending requests since protocol 7.40
(FUSE_NOTIFY_RESEND / FUSE_HAS_RESEND), added in Linux 6.9 by commits
760eac73f9f6 ("fuse: Introduce a new notification type for resend
pending requests") and 9e7f5296f475 ("fuse: Use the high bit of request
ID for indicating resend requests"). A daemon can ask the kernel to
requeue requests that were already sent to the daemon but never
answered, e.g. to recover in-flight requests after a daemon takeover.

Add fuse_lowlevel_notify_resend() to send the notification, expose
kernel support through the new FUSE_CAP_HAS_RESEND capability, and add
fuse_req_is_resend() so file systems can detect resent requests via the
FUSE_UNIQUE_RESEND bit in the request ID and handle them idempotently.

Signed-off-by: Baokun Li <libaokun@linux.alibaba.com>
---
 ChangeLog.rst            |  7 +++++++
 doc/README.notifications |  2 +-
 include/fuse_common.h    | 13 +++++++++++++
 include/fuse_lowlevel.h  | 28 ++++++++++++++++++++++++++++
 lib/fuse_cap_names_i.h   |  1 +
 lib/fuse_lowlevel.c      | 23 +++++++++++++++++++++++
 lib/fuse_versionscript   |  2 ++
 7 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/ChangeLog.rst b/ChangeLog.rst
index d5392b251929..ec8cbc3dd1d5 100644
--- a/ChangeLog.rst
+++ b/ChangeLog.rst
@@ -1,6 +1,13 @@
 Unreleased Changes
 ==================
 
+* ``fuse_lowlevel_notify_resend()`` lets a filesystem ask the kernel to
+  re-queue requests that were already sent to the daemon but never
+  answered, for example to recover in-flight requests after a daemon
+  takeover. Support is reported through the new ``FUSE_CAP_HAS_RESEND``
+  capability, and ``fuse_req_is_resend()`` tells whether a request was
+  redelivered this way. Requires protocol 7.40 (Linux 6.9) or newer.
+
 * ``fuse_session_custom_io()`` is disabled unless libfuse is built with
   ``-Denable-custom-io=true``, and returns ``-ENOTSUP`` otherwise. The
   ``hello_ll_uds`` example is built only with that option, and enabling it
diff --git a/doc/README.notifications b/doc/README.notifications
index 149e47e19c9f..30051ed87b51 100644
--- a/doc/README.notifications
+++ b/doc/README.notifications
@@ -26,7 +26,7 @@ notifications:
 | STORE       | fuse_lowlevel_notify_store       |
 | RETRIEVE    | fuse_lowlevel_notify_retrieve    |
 | DELETE      | fuse_lowlevel_notify_delete      |
-| RESEND      | -                                |
+| RESEND      | fuse_lowlevel_notify_resend      |
 | PRUNE       | fuse_lowlevel_notify_prune       |
 |-------------+----------------------------------|
 
diff --git a/include/fuse_common.h b/include/fuse_common.h
index 7533626175db..c2a7211e2f53 100644
--- a/include/fuse_common.h
+++ b/include/fuse_common.h
@@ -551,6 +551,19 @@ struct fuse_loop_config_v1 {
  */
 #define FUSE_CAP_IO_URING_BUFPOOL (1ULL << 34)
 
+/**
+ * Indicates that the kernel supports resending pending requests
+ *
+ * The file system can ask the kernel to re-queue requests that were
+ * already sent to the daemon but never answered, by sending the
+ * FUSE_NOTIFY_RESEND notification (see fuse_lowlevel_notify_resend()).
+ * Resent requests carry the FUSE_UNIQUE_RESEND bit in the request ID,
+ * which can be queried with fuse_req_is_resend().
+ *
+ * This feature is enabled by default when supported by the kernel.
+ */
+#define FUSE_CAP_HAS_RESEND (1ULL << 35)
+
 /**
  * Ioctl flags
  *
diff --git a/include/fuse_lowlevel.h b/include/fuse_lowlevel.h
index f228bdfd951f..a6313e24a5a8 100644
--- a/include/fuse_lowlevel.h
+++ b/include/fuse_lowlevel.h
@@ -1977,6 +1977,23 @@ int fuse_lowlevel_notify_retrieve(struct fuse_session *se, fuse_ino_t ino,
 int fuse_lowlevel_notify_prune(struct fuse_session *se,
 			       fuse_ino_t *nodeids, uint32_t count);
 
+/**
+ * Notify the kernel to resend pending requests
+ *
+ * Ask the kernel to re-queue requests that were already sent to the file
+ * system but not yet answered, e.g. to recover in-flight requests after
+ * a daemon takeover.
+ *
+ * Resent requests carry the FUSE_UNIQUE_RESEND bit in the request ID; use
+ * fuse_req_is_resend() to detect them. Since they may have been partially
+ * processed before, they should be handled idempotently or duplicates
+ * should be detected.
+ *
+ * @param se the session object
+ * @return zero for success, -errno for failure
+ */
+int fuse_lowlevel_notify_resend(struct fuse_session *se);
+
 /* ----------------------------------------------------------- *
  * Utility functions					       *
  * ----------------------------------------------------------- */
@@ -2100,6 +2117,17 @@ void fuse_req_interrupt_func(fuse_req_t req, fuse_interrupt_func_t func,
  */
 int fuse_req_interrupted(fuse_req_t req);
 
+/**
+ * Check if a request is a resent request
+ *
+ * A resent request was already sent to the file system, but was never
+ * answered (see fuse_lowlevel_notify_resend()).
+ *
+ * @param req request handle
+ * @return 1 if the request is a resend request, 0 otherwise
+ */
+int fuse_req_is_resend(fuse_req_t req);
+
 
 /* ----------------------------------------------------------- *
  * Inquiry functions                                           *
diff --git a/lib/fuse_cap_names_i.h b/lib/fuse_cap_names_i.h
index aa85b910200d..36e99147dd89 100644
--- a/lib/fuse_cap_names_i.h
+++ b/lib/fuse_cap_names_i.h
@@ -63,6 +63,7 @@ static const struct fuse_cap_name fuse_cap_names[] = {
 	{ FUSE_CAP_ALLOW_IDMAP,			"FUSE_CAP_ALLOW_IDMAP"},
 	{ FUSE_CAP_SECURITY_CTX,		"FUSE_CAP_SECURITY_CTX"},
 	{ FUSE_CAP_IO_URING_BUFPOOL,		"FUSE_CAP_IO_URING_BUFPOOL"},
+	{ FUSE_CAP_HAS_RESEND,			"FUSE_CAP_HAS_RESEND"},
 	// Add any new capabilities here
 	{ 0, NULL} // Sentinel to mark the end of the array
 };
diff --git a/lib/fuse_lowlevel.c b/lib/fuse_lowlevel.c
index 3951bbb6dd09..bbc58523b033 100644
--- a/lib/fuse_lowlevel.c
+++ b/lib/fuse_lowlevel.c
@@ -2960,6 +2960,8 @@ _do_init(fuse_req_t req, const fuse_ino_t nodeid, const void *op_in,
 			se->conn.capable_ext |= FUSE_CAP_ALLOW_IDMAP;
 		if (inargflags & FUSE_SECURITY_CTX)
 			se->conn.capable_ext |= FUSE_CAP_SECURITY_CTX;
+		if (inargflags & FUSE_HAS_RESEND)
+			se->conn.capable_ext |= FUSE_CAP_HAS_RESEND;
 	} else {
 		se->conn.max_readahead = 0;
 	}
@@ -3005,6 +3007,7 @@ _do_init(fuse_req_t req, const fuse_ino_t nodeid, const void *op_in,
 		       FUSE_CAP_READDIRPLUS_AUTO);
 	LL_SET_DEFAULT(1, FUSE_CAP_OVER_IO_URING);
 	LL_SET_DEFAULT(se->uring.bufpool, FUSE_CAP_IO_URING_BUFPOOL);
+	LL_SET_DEFAULT(1, FUSE_CAP_HAS_RESEND);
 
 	/* This could safely become default, but libfuse needs an API extension
 	 * to support it
@@ -3133,6 +3136,8 @@ _do_init(fuse_req_t req, const fuse_ino_t nodeid, const void *op_in,
 		outargflags |= FUSE_SECURITY_CTX;
 	if (se->conn.want_ext & FUSE_CAP_ALLOW_IDMAP)
 		outargflags |= FUSE_ALLOW_IDMAP;
+	if (se->conn.want_ext & FUSE_CAP_HAS_RESEND)
+		outargflags |= FUSE_HAS_RESEND;
 
 	if ((inargflags & FUSE_REQUEST_TIMEOUT) && se->conn.request_timeout) {
 		outargflags |= FUSE_REQUEST_TIMEOUT;
@@ -3644,6 +3649,19 @@ int fuse_lowlevel_notify_prune(struct fuse_session *se,
 	return send_notify_iov(se, FUSE_NOTIFY_PRUNE, iov, 3);
 }
 
+int fuse_lowlevel_notify_resend(struct fuse_session *se)
+{
+	struct iovec iov[1];
+
+	if (!se)
+		return -EINVAL;
+
+	if (!(se->conn.capable_ext & FUSE_CAP_HAS_RESEND))
+		return -ENOSYS;
+
+	return send_notify_iov(se, FUSE_NOTIFY_RESEND, iov, 1);
+}
+
 void *fuse_req_userdata(fuse_req_t req)
 {
 	return req->se->userdata;
@@ -3768,6 +3786,11 @@ int fuse_req_interrupted(fuse_req_t req)
 	return interrupted;
 }
 
+int fuse_req_is_resend(fuse_req_t req)
+{
+	return !!(req->unique & FUSE_UNIQUE_RESEND);
+}
+
 bool fuse_req_is_uring(fuse_req_t req)
 {
 	return req->flags.is_uring;
diff --git a/lib/fuse_versionscript b/lib/fuse_versionscript
index b40f141f7eb9..e074cd4a0831 100644
--- a/lib/fuse_versionscript
+++ b/lib/fuse_versionscript
@@ -228,6 +228,8 @@ FUSE_3.19 {
 		fuse_session_start_teardown_watchdog;
 		fuse_session_stop_teardown_watchdog;
 		fuse_lowlevel_notify_prune;
+		fuse_lowlevel_notify_resend;
+		fuse_req_is_resend;
 		fuse_daemonize_early_start;
 		fuse_daemonize_early_success;
 		fuse_daemonize_early_fail;
-- 
2.43.7

