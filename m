Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354169;
	b=OzayTTdaBITpkXRp/6wMcA8fhOhEVL6NSHwgIvZtfKLwsaIUx0JEDbCdYR2iGEEbmgA2
	 DaaejBqGhq9Lycu1yYZ7f7W/MJleKKk8muY6TWEUQMn3YyTsire1BvdPwJrVTl/Q357SQ
	 jJMEqO2CnOdkPjUVflDInm5cnw6wd7i08kDfXrMF2HA+SQVbM/t8F5cNS7DbC8nD/wzoM
	 Jef7FZVpRNU+miuCP2lIJSEs+2jnKqaKjPbMcrboGhD+Zh21bJIq5LyvVvOQAnw46N6R0
	 f4d1kXSe+zmCx8yIYx9c3VVnLbtL6SVfJJH4E+dtJYvpYh3xrdM9a5uQYYqveFbpEoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/7tQDG3mv3YyelkQzohk0HCjYcLLxVo1zJAelVyi/0g=;
	b=2uAZJA/U7boUm8DIeoqF/bkk2ln/EX0DqN8emyRKq7GeAX2sbMmNqpE69ni0CnPo80iU
	 YFdEQ9q/8XZIKHBKI3ylC1IqE3mE4IcB8rBTilNrB+v1NaT82BCzAK40ZmOJFN5YJ6slX
	 mwoRREIwVxLsGoUW7X+dw0TJ5gepskN2o95uQ9ov8GZK3LvWReCuPDNdsH5QckiMbPDFy
	 iMrwkm18t+tG8Q20pfUqNuQJR6AiC9kDq2BkJS5a/9znmm3OGhc+WmvCIDJ8LpalNWpDF
	 ZKYuq/1+QrWImdhZdfql0rOHGEAFMxxDpFC/fbHkwELCq2XdcN7K2HUUQ0F8/f7/B/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MMCUFIw8;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD306606A320
	for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 13:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD306606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MMCUFIw8
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490f38e9688so1677092f8f.0
        for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 05:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795354167; x=1795958967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7tQDG3mv3YyelkQzohk0HCjYcLLxVo1zJAelVyi/0g=;
        b=MMCUFIw8YD0juowbzSchNROzQSt0y8f1KZsiVMOsD1odTJofJySsf3mnwvtY0x8KYR
         IpzBzIGoAmEiNzPbaupFrNTCCuqQU/z+pYemklhi5Bj4UQZ5ZFEKR2PfuSwURi7FlRrz
         1Pa/Vh5+gDQL+LXbjEjR/fz6xybwHM4PWN+rH57u6NsfWl2o/s1YvHaUN26S/ch+Y+3C
         H1gz2J8Kfh0MTgMBL52Dfciq1g3irwk7WH1W7MxUDM2otZAlUJM1nPBV4s5MLiNoVtAp
         jbZngWclNyS+vi7OWSIwzbTq8c3EBKVg8pRNkSREAbPylKeRWdgI3bCFSwk5Tm+0uRH7
         79KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354167; x=1795958967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/7tQDG3mv3YyelkQzohk0HCjYcLLxVo1zJAelVyi/0g=;
        b=OdqpFpvxqnKzjq6Mq051aEn2PXGDoqbiMEArvrJ/IhtWJeBJEnnTr9fDkih8Ju6Hlk
         kch8kkRTXeKh1ciTK97FDOBqmO/wPU+CXLW9ijHWbfoYWK8PlCd38mPdAHP9bECRIhH4
         JFUCEgshdQK3PTnv0Z+RjwdTKFPAa7yxKo9Fparst56HPUl8h172QjBpieD0lgYSlMai
         8HJqCd0lcwC5PW3Q87YxH8Zp0XqJaCPC7OsDp3QnMN5mJkxGDdppRg/PgaI0y9ypm/cL
         6lKp1r0D3c+JPuyVpAklD87QRQLxRvHo8KeAzD1kLoFISa1XVctOJSmwFqNZ0BDm026F
         T4+Q==
X-Gm-Message-State: APuU4Z/FNquIkdHmUO8gqdb0rBcHTobTzJP6S/zWUpsHTnUUjzIHwOYt
	QUFdgkDaRW1JHHO88J3FYxkC+tu7ngvpDoa/kA/mOaIWal6uFm8cGd4U
X-Gm-Gg: AZFdTZfL0+oWixOz97kyZjzHiqGU2dwrcQDI+6O4HTCNoyUry6x8GeFBexVPgsAu9Xs
	3+r2HBU7TneHwCJwv61JTAYWSQHZxMjuV29KO9R5QOX5MNB0GyaYeSGipzFEVJ71y55/KH0jwH2
	613lc0hM9Rrh7x86joVnXSmNfunoHrs6gjC/peiy0fuxgrYCEZ0WhKordHCvzkxtfau1aA3jgcK
	efjyyfGji4cfSNG80N1FMibGrrk9a/QtopcVqrm5SYiZy2tKrWoXIMDG4C0NGYp4mkbJ1g4JO9+
	9V3mpXBHjMC+cBs5jeEBWgUEnhaIhGiVRv1ln6MQOo3QkJVi2waY1ur7iO+MEtxio6BvXywCea4
	m5AvhSXLpi/9+MITH1IQgRzaj1OMpBSZDC8Wfoxe0+9O9olsDzjPP4YAd8MEnFPLPpZVHsiKWVL
	B2wiqvuqTdch3Kea8W6rz3MxZSRzEL5AxMnX3PqP1v6rU2V5D7bp7iSHejfvuRu3JNbubYuc+Qo
	1XjG0cAI1M9mZeOXlXt3SbnhpfSxU920BxEPbTACVIE+GiciBmWaLYudzQw6xofgDLUWYPIFLSK
	LGW5a11hl7roBSk+aRHnMQeeZcQW81bfl69Fc0NpW4b7lbcKXyQjaeiLfZZcTD4=
X-Received: by 2002:a5d:588f:0:b0:4a8:f1a5:efb7 with SMTP id ffacd0b85a97d-4aa545e25b5mr21717408f8f.9.1795354166844;
        Sun, 22 Nov 2026 05:29:26 -0800 (PST)
Received: from t480.fritz.box ([2001:a61:3a4e:c601:fc75:724e:6b78:3649])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm17286017f8f.16.2026.11.22.05.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:29:26 -0800 (PST)
From: Han-Wen Nienhuys <hanwenn@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-fsdevel@lists.linux.dev,
	mmitar@gmail.com,
	bernd@bsbernd.com,
	Han-Wen Nienhuys <hanwenn@gmail.com>
Subject: [PATCH 3/3] selftests/fuse: test FATTR_KILL_SUIDGID from file_remove_privs()
Date: Sun, 22 Nov 2026 14:29:16 +0100
Message-ID: <20261122132916.19066-4-hanwenn@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122132916.19066-1-hanwenn@gmail.com>
References: <20261122132916.19066-1-hanwenn@gmail.com>
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

Add tests for commit "fuse: kill suid/sgid on fallocate and
copy_file_range with KILLPRIV_V2".

With FUSE_HANDLE_KILLPRIV_V2, when a caller without CAP_FSETID calls
fallocate() or copy_file_range(), the kernel must ask the server to
clear suid/sgid. These calls send no FUSE_WRITE, so the request comes
as FATTR_KILL_SUIDGID on the FUSE_SETATTR from file_remove_privs().

The tests also check that sgid stays if the file is not
group-executable, that a caller with CAP_FSETID keeps both bits, and
that only the first of two writes sends the kill in a SETATTR.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Han-Wen Nienhuys <hanwenn@gmail.com>
---
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   2 +
 .../filesystems/fuse/killpriv_v2_test.c       | 359 ++++++++++++++++++
 3 files changed, 362 insertions(+)
 create mode 100644 tools/testing/selftests/filesystems/fuse/killpriv_v2_test.c

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/testing/selftests/filesystems/fuse/.gitignore
index 7c787313e69b..02ff7a1cbc16 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -6,3 +6,4 @@ write_extend_eof_test
 fuse_acl_cache_test
 fuse_symlink_cache_test
 fuse_readdir_cache_test
+killpriv_v2_test
diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index e3ae3acff113..89560f1ad12d 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -7,11 +7,13 @@ TEST_GEN_PROGS += write_extend_eof_test
 TEST_GEN_PROGS += fuse_acl_cache_test
 TEST_GEN_PROGS += fuse_symlink_cache_test
 TEST_GEN_PROGS += fuse_readdir_cache_test
+TEST_GEN_PROGS += killpriv_v2_test
 TEST_GEN_FILES := fuse_mnt
 
 include ../../lib.mk
 
 $(OUTPUT)/write_extend_eof_test: LDLIBS += -lpthread
+$(OUTPUT)/killpriv_v2_test: LDLIBS += -lpthread
 
 VAR_CFLAGS := $(shell pkg-config fuse3 --cflags 2>/dev/null)
 ifeq ($(VAR_CFLAGS),)
diff --git a/tools/testing/selftests/filesystems/fuse/killpriv_v2_test.c b/tools/testing/selftests/filesystems/fuse/killpriv_v2_test.c
new file mode 100644
index 000000000000..41d65ff64e22
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/killpriv_v2_test.c
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * With FUSE_HANDLE_KILLPRIV_V2 the server clears suid/sgid when the kernel
+ * asks it to.  Paths that modify data without sending FUSE_WRITE (fallocate,
+ * copy_file_range, passthrough writes) go through file_remove_privs(), which
+ * must result in a FUSE_SETATTR carrying FATTR_KILL_SUIDGID.
+ *
+ * This is a raw /dev/fuse server holding a single file; its mode is the
+ * server's, so the test checks what the server was asked to do.
+ *
+ * Requires root to mount fuse.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <pthread.h>
+#include <stdint.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+#include <sys/syscall.h>
+#include <sys/uio.h>
+#include <linux/capability.h>
+#include <linux/fuse.h>
+
+#include "../../kselftest_harness.h"
+
+#define FUSE_ROOT_ID	1
+#define FILE_INO	2
+#define MAX_WRITE	(128 * 1024)
+
+struct server {
+	int fd;
+	int killpriv_v2;	/* negotiated */
+	uint32_t mode;		/* the file's mode, S_IFREG included */
+	uint64_t size;
+	int kill_setattr;	/* SETATTRs with FATTR_KILL_SUIDGID */
+	int kill_write;		/* WRITEs with FUSE_WRITE_KILL_SUIDGID */
+};
+
+static void reply(int fd, uint64_t unique, int error, void *data, size_t len)
+{
+	struct fuse_out_header oh = {
+		.len = sizeof(oh) + (data ? len : 0),
+		.error = error,
+		.unique = unique,
+	};
+	struct iovec iov[2] = { { &oh, sizeof(oh) }, { data, len } };
+
+	/* Errors here are teardown races (device closed on unmount); ignore. */
+	(void)writev(fd, iov, data ? 2 : 1);
+}
+
+static void fill_attr(struct fuse_attr *a, uint64_t ino, uint32_t mode,
+		      uint64_t size)
+{
+	memset(a, 0, sizeof(*a));
+	a->ino = ino;
+	a->mode = mode;
+	a->nlink = 1;
+	a->size = size;
+	a->blksize = sysconf(_SC_PAGESIZE);
+}
+
+/* The VFS rule the server must follow: suid always, sgid if group-exec. */
+static void kill_suidgid(struct server *s)
+{
+	s->mode &= ~S_ISUID;
+	if (s->mode & 0010)
+		s->mode &= ~S_ISGID;
+}
+
+static void *server_thread(void *arg)
+{
+	struct server *s = arg;
+	static char buf[MAX_WRITE + 4096];
+
+	for (;;) {
+		ssize_t n = read(s->fd, buf, sizeof(buf));
+		struct fuse_in_header *ih = (void *)buf;
+		int root;
+
+		if (n < 0) {
+			if (errno == EINTR || errno == EAGAIN)
+				continue;
+			return NULL;	/* device closed on unmount */
+		}
+		if (n < (ssize_t)sizeof(*ih))
+			continue;
+		root = ih->nodeid == FUSE_ROOT_ID;
+
+		switch (ih->opcode) {
+		case FUSE_INIT: {
+			struct fuse_init_in *in = (void *)(ih + 1);
+			struct fuse_init_out out = {0};
+
+			out.major = FUSE_KERNEL_VERSION;
+			out.minor = FUSE_KERNEL_MINOR_VERSION;
+			out.max_readahead = in->max_readahead;
+			out.max_write = MAX_WRITE;
+			out.max_background = 16;
+			out.congestion_threshold = 12;
+			out.flags = in->flags & FUSE_HANDLE_KILLPRIV_V2;
+			s->killpriv_v2 = !!out.flags;
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_GETATTR: {
+			struct fuse_attr_out out = {0};
+
+			fill_attr(&out.attr, ih->nodeid,
+				  root ? (S_IFDIR | 0755) : s->mode,
+				  root ? 0 : s->size);
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_LOOKUP: {
+			struct fuse_entry_out out = {0};
+
+			out.nodeid = FILE_INO;
+			fill_attr(&out.attr, FILE_INO, s->mode, s->size);
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_OPEN:
+		case FUSE_OPENDIR: {
+			struct fuse_open_out out = {0};
+
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_WRITE: {
+			struct fuse_write_in *in = (void *)(ih + 1);
+			struct fuse_write_out out = {0};
+
+			if (in->write_flags & FUSE_WRITE_KILL_SUIDGID) {
+				s->kill_write++;
+				kill_suidgid(s);
+			}
+			if (in->offset + in->size > s->size)
+				s->size = in->offset + in->size;
+			out.size = in->size;
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_SETATTR: {
+			struct fuse_setattr_in *in = (void *)(ih + 1);
+			struct fuse_attr_out out = {0};
+
+			if (in->valid & FATTR_MODE)
+				s->mode = (s->mode & S_IFMT) |
+					  (in->mode & 07777);
+			if (in->valid & FATTR_SIZE)
+				s->size = in->size;
+			if (in->valid & FATTR_KILL_SUIDGID) {
+				s->kill_setattr++;
+				kill_suidgid(s);
+			}
+			fill_attr(&out.attr, ih->nodeid, s->mode, s->size);
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_FALLOCATE: {
+			struct fuse_fallocate_in *in = (void *)(ih + 1);
+
+			if (in->offset + in->length > s->size)
+				s->size = in->offset + in->length;
+			reply(s->fd, ih->unique, 0, NULL, 0);
+			break;
+		}
+		case FUSE_COPY_FILE_RANGE_64: {
+			/*
+			 * Succeed without copying: an error would make the
+			 * kernel fall back to splice, which sends WRITEs.
+			 */
+			struct fuse_copy_file_range_in *in = (void *)(ih + 1);
+			struct fuse_copy_file_range_out out = {
+				.bytes_copied = in->len,
+			};
+
+			if (in->off_out + in->len > s->size)
+				s->size = in->off_out + in->len;
+			reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			break;
+		}
+		case FUSE_GETXATTR:
+			reply(s->fd, ih->unique, -ENODATA, NULL, 0);
+			break;
+		case FUSE_FLUSH:
+		case FUSE_RELEASE:
+		case FUSE_RELEASEDIR:
+		case FUSE_FSYNC:
+		case FUSE_ACCESS:
+			reply(s->fd, ih->unique, 0, NULL, 0);
+			break;
+		case FUSE_FORGET:
+			break;
+		default:
+			reply(s->fd, ih->unique, -EOPNOTSUPP, NULL, 0);
+			break;
+		}
+	}
+}
+
+/* Drop CAP_FSETID from this thread's effective set; the server keeps it. */
+static int drop_fsetid(void)
+{
+	struct __user_cap_header_struct hdr = {
+		.version = _LINUX_CAPABILITY_VERSION_3,
+	};
+	struct __user_cap_data_struct data[2];
+
+	if (syscall(SYS_capget, &hdr, data))
+		return -1;
+	data[CAP_TO_INDEX(CAP_FSETID)].effective &= ~CAP_TO_MASK(CAP_FSETID);
+	return syscall(SYS_capset, &hdr, data);
+}
+
+FIXTURE(fuse)
+{
+	struct server srv;
+	char dir[64];
+	char path[128];
+	int mounted;
+};
+
+FIXTURE_SETUP(fuse)
+{
+	char opts[128];
+	pthread_t t;
+	int fd;
+
+	self->srv.fd = -1;
+	if (geteuid() != 0)
+		SKIP(return, "need root to mount fuse");
+
+	self->srv.mode = S_IFREG | 06775;
+	self->srv.fd = open("/dev/fuse", O_RDWR);
+	ASSERT_GE(self->srv.fd, 0);
+
+	strcpy(self->dir, "/tmp/fuse_killpriv_XXXXXX");
+	ASSERT_NE(NULL, mkdtemp(self->dir));
+	snprintf(self->path, sizeof(self->path), "%s/file", self->dir);
+
+	snprintf(opts, sizeof(opts),
+		 "fd=%d,rootmode=40000,user_id=0,group_id=0",
+		 self->srv.fd);
+	ASSERT_EQ(0, mount("fuse", self->dir, "fuse", 0, opts));
+	self->mounted = 1;
+
+	ASSERT_EQ(0, pthread_create(&t, NULL, server_thread, &self->srv));
+	pthread_detach(t);
+
+	/* The first request completes INIT. */
+	fd = open(self->dir, O_RDONLY | O_DIRECTORY);
+	ASSERT_GE(fd, 0);
+	close(fd);
+	if (!self->srv.killpriv_v2)
+		SKIP(return, "kernel does not offer FUSE_HANDLE_KILLPRIV_V2");
+}
+
+FIXTURE_TEARDOWN(fuse)
+{
+	if (self->mounted)
+		umount2(self->dir, MNT_DETACH);
+	if (self->srv.fd >= 0)
+		close(self->srv.fd);
+	if (self->dir[0])
+		rmdir(self->dir);
+}
+
+/* fallocate() sends no FUSE_WRITE; the kill must come with SETATTR. */
+TEST_F(fuse, fallocate_unprivileged)
+{
+	int fd;
+
+	ASSERT_EQ(0, drop_fsetid());
+	fd = open(self->path, O_RDWR);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(0, fallocate(fd, 0, 0, 4096));
+	close(fd);
+
+	EXPECT_EQ(1, self->srv.kill_setattr);
+	EXPECT_EQ(S_IFREG | 0775, self->srv.mode);
+}
+
+/* Without group exec, sgid stays; the kernel still asks for suid. */
+TEST_F(fuse, fallocate_unprivileged_sgid_no_group_exec)
+{
+	int fd;
+
+	self->srv.mode = S_IFREG | 06765;
+	ASSERT_EQ(0, drop_fsetid());
+	fd = open(self->path, O_RDWR);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(0, fallocate(fd, 0, 0, 4096));
+	close(fd);
+
+	EXPECT_EQ(1, self->srv.kill_setattr);
+	EXPECT_EQ(S_IFREG | 02765, self->srv.mode);
+}
+
+/* With CAP_FSETID nothing is killed. */
+TEST_F(fuse, fallocate_privileged)
+{
+	int fd;
+
+	fd = open(self->path, O_RDWR);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(0, fallocate(fd, 0, 0, 4096));
+	close(fd);
+
+	EXPECT_EQ(0, self->srv.kill_setattr);
+	EXPECT_EQ(S_IFREG | 06775, self->srv.mode);
+}
+
+/* copy_file_range() sends no FUSE_WRITE either. */
+TEST_F(fuse, copy_file_range_unprivileged)
+{
+	loff_t in = 0, out = 4096;
+	int fd;
+
+	self->srv.size = 4096;
+	ASSERT_EQ(0, drop_fsetid());
+	fd = open(self->path, O_RDWR);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(4096, copy_file_range(fd, &in, fd, &out, 4096, 0));
+	close(fd);
+
+	EXPECT_EQ(1, self->srv.kill_setattr);
+	EXPECT_EQ(S_IFREG | 0775, self->srv.mode);
+}
+
+/*
+ * A write asks twice: in the SETATTR from file_remove_privs(), and with
+ * FUSE_WRITE_KILL_SUIDGID on the WRITE.  The SETATTR reply updates the cached
+ * mode, so a second write sends no SETATTR; the WRITE flag depends only on
+ * CAP_FSETID and comes every time.
+ */
+TEST_F(fuse, write_unprivileged)
+{
+	int fd;
+
+	ASSERT_EQ(0, drop_fsetid());
+	fd = open(self->path, O_RDWR);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(1, pwrite(fd, "x", 1, 0));
+	EXPECT_EQ(1, self->srv.kill_setattr);
+	EXPECT_EQ(1, self->srv.kill_write);
+	EXPECT_EQ(S_IFREG | 0775, self->srv.mode);
+
+	ASSERT_EQ(1, pwrite(fd, "y", 1, 1));
+	close(fd);
+	EXPECT_EQ(1, self->srv.kill_setattr);
+	EXPECT_EQ(2, self->srv.kill_write);
+}
+
+TEST_HARNESS_MAIN
-- 
2.56.1

