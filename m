Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9833346EF8A
	for <fuse-devel@lists.linux.dev>; Fri,  9 Oct 2026 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532540; cv=none; b=fmZiBriih2fkt2jQ7UbcaKdZ+vBs74EK5mhaDzuT6DPrhvI8wOfGPCOd+7ecPwR9R3siUQouYhTllMoMLwDpiFzwWR31x0FuF3WrL8BMZleSPnDpH2PeabgRZWy3gxPUy1nYymlhG9usG+f60/Bk59Gy1jbEwVIotamk1FqPzUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532540; c=relaxed/simple;
	bh=LRRNMvNS4xKEQCT1/Z8b01m4zPYJPJdT0kwjiGyqGgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOSNwcSf2D0gdqWodwrVRFHJ4hZaYMSADBZTmkDn4HoPH55CbCrlnIVrrX+nwQBdRYETYkp5WW6qlTr5Lpt5yTBYvddjcKTHQRaRGmIhB3OsuazEmqgryJeqIbKsd2wyKog1jmbG7j3YaZ01QHmsb66K+tSnUNR5Bv2TmAyNOMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=GOJcBh3Z; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="GOJcBh3Z"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791532528; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=MjUN7xo2R41vyif7pMeVZ0fs070P9TSB/KGlaeWQ9/Y=;
	b=GOJcBh3ZNtgIbdOq5AHW1zQxg4bcnGWLEh2D/F/yX0HpaUO8hHppHUDxUAU+1E1wufu2l415yssyIRhyr442hA1vpEqeTusVS1BRqCa5LFt5cW1wNdwIyq8FCbo7sVDqXcDqlBDxYk/byt7FOEt6v0IHR/hZEBEK7bkqMXgbHHc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0XCSmJ96_1791532527;
Received: from x31h02109.sqa.na131.tbsite.net(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0XCSmJ96_1791532527 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 15:55:28 +0800
From: Baokun Li <libaokun@linux.alibaba.com>
To: fuse-devel@lists.linux.dev
Cc: bernd@bsbernd.com,
	miklos@szeredi.hu
Subject: [PATCH 2/2] test: exercise FUSE_NOTIFY_RESEND
Date: Fri,  9 Oct 2026 15:54:16 +0800
Message-ID: <20261009075417.2521879-3-libaokun@linux.alibaba.com>
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

test_notify_resend drops the first GETATTR of a file and asks the
kernel to resend pending requests via fuse_lowlevel_notify_resend().
The kernel redelivers the request with the FUSE_UNIQUE_RESEND bit set;
the daemon detects it with fuse_req_is_resend(), answers it, and the
client's stat() completes.

The case skips on kernels without FUSE_HAS_RESEND support and over the
io-uring transport, which recovers requests on its own.

Signed-off-by: Baokun Li <libaokun@linux.alibaba.com>
---
 test/cases/ctests/notify-resend.sh |  18 +++
 test/meson.build                   |   3 +
 test/test_notify_resend.c          | 216 +++++++++++++++++++++++++++++
 3 files changed, 237 insertions(+)
 create mode 100755 test/cases/ctests/notify-resend.sh
 create mode 100644 test/test_notify_resend.c

diff --git a/test/cases/ctests/notify-resend.sh b/test/cases/ctests/notify-resend.sh
new file mode 100755
index 000000000000..c64d930dadb5
--- /dev/null
+++ b/test/cases/ctests/notify-resend.sh
@@ -0,0 +1,18 @@
+#!/usr/bin/env bash
+# GROUP: ctests
+# A request the daemon never answers comes back with the resend bit set in
+# the request ID after FUSE_NOTIFY_RESEND.
+
+. "$TEST_LIB/common.sh"
+
+# FUSE_NOTIFY_RESEND requeues the pending requests of the char-device
+# channel; the io-uring transport has its own recovery path.
+[ "${FUSE_URING_ENABLE:-0}" = 0 ] || _notrun "needs the standard transport"
+
+_require_cap FUSE_CAP_HAS_RESEND
+
+status=0
+"$FUSE_TEST_BIN_DIR/test_notify_resend" "$TEST_MNT" || status=$?
+
+[ "$status" -ne 77 ] || _notrun "the kernel did not report FUSE_HAS_RESEND"
+[ "$status" -eq 0 ] || _fail "test_notify_resend exited $status"
diff --git a/test/meson.build b/test/meson.build
index a8518c314804..022a3aea93f0 100644
--- a/test/meson.build
+++ b/test/meson.build
@@ -35,6 +35,9 @@ td += executable('test_abi', 'test_abi.c',
 td += executable('test_secctx_splice', 'test_secctx_splice.c',
                  dependencies: [ libfuse_dep, thread_dep ],
                  install: false)
+td += executable('test_notify_resend', 'test_notify_resend.c',
+                 dependencies: [ libfuse_dep ],
+                 install: false)
 td += executable('test_loop_config', 'test_loop_config.c',
                  include_directories: include_dirs,
                  link_with: [ libfuse ],
diff --git a/test/test_notify_resend.c b/test/test_notify_resend.c
new file mode 100644
index 000000000000..a1671514bcb9
--- /dev/null
+++ b/test/test_notify_resend.c
@@ -0,0 +1,216 @@
+/*
+ * FUSE: Filesystem in Userspace
+ * Copyright (C) 2026  Baokun Li <libaokun@linux.alibaba.com>
+ *
+ * Test FUSE_NOTIFY_RESEND: recovery of an in-flight request that the
+ * daemon received but never answered.
+ *
+ * The daemon (parent process) drops the first FUSE_GETATTR of the test
+ * file and immediately asks the kernel to resend pending requests via
+ * fuse_lowlevel_notify_resend(). The kernel re-queues the dropped
+ * request with the FUSE_UNIQUE_RESEND bit set in the request ID; the
+ * daemon detects it with fuse_req_is_resend(), answers it and exits the
+ * session loop. The client (child process) issues the stat() that
+ * drives the whole sequence and must see it complete successfully.
+ *
+ * Kernels without FUSE_HAS_RESEND support and the io-uring transport
+ * (whose pending requests are recovered by its own path, not by
+ * FUSE_NOTIFY_RESEND) are reported as a skip.
+ *
+ * This program can be distributed under the terms of the GNU LGPLv2.
+ * See the file GPL2.txt
+ */
+#define FUSE_USE_VERSION FUSE_MAKE_VERSION(3, 19)
+
+#include "fuse_config.h"
+#include "fuse_lowlevel.h"
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <errno.h>
+#include <limits.h>
+#include <signal.h>
+#include <sys/stat.h>
+#include <sys/wait.h>
+
+/* automake convention: the runner reports this as SKIP. */
+#define TEST_SKIP_EXIT 77
+#define TEST_INO 2
+#define TEST_NAME "testfile"
+
+static struct fuse_session *g_se;
+static int g_cap_has_resend;
+static int g_dropped;		/* first GETATTR was left unanswered */
+static int g_notify_rc = -1;	/* fuse_lowlevel_notify_resend() result */
+static int g_resend_seen;	/* second delivery carried the resend bit */
+static int g_uring;		/* requests reached the daemon over io-uring */
+
+/*
+ * The loop may be waiting for a request that never comes (the resend was
+ * never queued). Exit it on the alarm so the cause gets reported instead
+ * of the default disposition ending the process.
+ */
+static void t_alarm(int signo)
+{
+	(void)signo;
+	fuse_session_exit(g_se);
+}
+
+static void t_init(void *userdata, struct fuse_conn_info *conn)
+{
+	(void)userdata;
+	g_cap_has_resend = fuse_get_feature_flag(conn, FUSE_CAP_HAS_RESEND);
+	if (!g_cap_has_resend) {
+		fprintf(stderr, "test_notify_resend: kernel lacks "
+			"FUSE_HAS_RESEND, skipping\n");
+		fuse_session_exit(g_se);
+	}
+}
+
+static void t_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
+{
+	struct fuse_entry_param e;
+
+	if (parent != FUSE_ROOT_ID || strcmp(name, TEST_NAME) != 0) {
+		fuse_reply_err(req, ENOENT);
+		return;
+	}
+
+	memset(&e, 0, sizeof(e));
+	e.ino = TEST_INO;
+	/* Force the kernel to issue a separate GETATTR */
+	e.attr_timeout = 0;
+	e.entry_timeout = 3600;
+	e.attr.st_ino = TEST_INO;
+	e.attr.st_mode = S_IFREG | 0644;
+	e.attr.st_nlink = 1;
+	fuse_reply_entry(req, &e);
+}
+
+static void t_getattr(fuse_req_t req, fuse_ino_t ino,
+		      struct fuse_file_info *fi)
+{
+	struct stat stbuf;
+	int is_resend = fuse_req_is_resend(req);
+
+	(void)fi;
+
+	/* FUSE_NOTIFY_RESEND only requeues the requests of the /dev/fuse
+	 * channel; over io-uring there is nothing to resend. Serve the
+	 * request and let the caller report the skip. */
+	if (fuse_req_is_uring(req))
+		g_uring = 1;
+
+	if (ino == TEST_INO && !is_resend && !g_dropped && !g_uring) {
+		g_dropped = 1;
+		/* Simulate a lost request: answer never, ask for resend */
+		g_notify_rc = fuse_lowlevel_notify_resend(g_se);
+		return;
+	}
+
+	if (ino == TEST_INO && is_resend)
+		g_resend_seen = 1;
+
+	memset(&stbuf, 0, sizeof(stbuf));
+	stbuf.st_ino = ino;
+	stbuf.st_mode = (ino == FUSE_ROOT_ID) ?
+		(S_IFDIR | 0755) : (S_IFREG | 0644);
+	stbuf.st_nlink = 1;
+	fuse_reply_attr(req, &stbuf, 3600);
+
+	if (ino == TEST_INO)
+		fuse_session_exit(g_se);
+}
+
+static const struct fuse_lowlevel_ops t_ops = {
+	.init	 = t_init,
+	.lookup	 = t_lookup,
+	.getattr = t_getattr,
+};
+
+int main(int argc, char *argv[])
+{
+	struct fuse_args args = FUSE_ARGS_INIT(1, argv);
+	struct fuse_session *se;
+	pid_t pid;
+	int status = 0, ret = EXIT_FAILURE;
+
+	if (argc != 2) {
+		fprintf(stderr, "usage: %s <mountpoint>\n", argv[0]);
+		return 1;
+	}
+
+	printf("Testing FUSE_NOTIFY_RESEND\n");
+	fflush(stdout); /* avoid the child inheriting an unflushed buffer */
+
+	se = fuse_session_new(&args, &t_ops, sizeof(t_ops), NULL);
+	if (!se)
+		return EXIT_FAILURE;
+	g_se = se;
+
+	if (fuse_session_mount(se, argv[1]) != 0)
+		return EXIT_FAILURE;
+
+	pid = fork();
+	if (pid == -1)
+		goto out_unmount;
+
+	if (pid == 0) {
+		struct stat st;
+		char path[PATH_MAX];
+
+		/* Child: the client driving the test */
+		alarm(20);
+		snprintf(path, sizeof(path), "%s/" TEST_NAME, argv[1]);
+		_exit(stat(path, &st) == 0 ? 0 : 4);
+	}
+
+	/* Parent: the daemon; guard against unexpected hangs */
+	signal(SIGALRM, t_alarm);
+	alarm(30);
+	fuse_session_loop(se);
+
+	if (g_cap_has_resend && !g_uring && g_dropped &&
+	    g_notify_rc == 0 && g_resend_seen) {
+		/* The resend was answered; the client must complete now */
+		if (waitpid(pid, &status, 0) != -1 && WIFEXITED(status) &&
+		    WEXITSTATUS(status) == 0) {
+			printf("test_notify_resend: PASS\n");
+			ret = EXIT_SUCCESS;
+		} else {
+			fprintf(stderr, "test_notify_resend: client stat "
+				"failed (status=%d)\n", status);
+		}
+		goto out_unmount;
+	}
+
+	/*
+	 * Skip or failure: the client is blocked in the kernel on a request
+	 * nobody will answer, and a signal that is not fatal does not wake
+	 * it (the kernel waits for the daemon to abort the request), so
+	 * reap it with SIGKILL instead of waiting it out.
+	 */
+	kill(pid, SIGKILL);
+	waitpid(pid, &status, 0);
+
+	if (!g_cap_has_resend) {
+		/* Kernel without support: report skip (the runner gates on it) */
+		ret = TEST_SKIP_EXIT;
+	} else if (g_uring) {
+		fprintf(stderr, "test_notify_resend: requests came in over "
+			"io-uring, which has its own recovery path; skipping\n");
+		ret = TEST_SKIP_EXIT;
+	} else if (!g_dropped || g_notify_rc != 0) {
+		fprintf(stderr, "test_notify_resend: notify failed "
+			"(dropped=%d rc=%d)\n", g_dropped, g_notify_rc);
+	} else {
+		fprintf(stderr, "test_notify_resend: request was not "
+			"redelivered with the resend bit\n");
+	}
+
+out_unmount:
+	fuse_session_unmount(se);
+	fuse_session_destroy(se);
+	return ret;
+}
-- 
2.43.7

