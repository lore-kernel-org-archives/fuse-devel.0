Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890461;
	b=AVxUP3thus2ghcU6FtlfPNka6qGMLRnnJJQnSYl6l6Tu6uqQTAlm3VRFLGphqUPlBpRd
	 joPvxadSoJUYtA1FDnAWqvsZuyuHkV9i2n2FlaZgYD+mt9CVoDdQZou+0pCCFR0T8xnd1
	 RN1JM30H3vZeV5h80//7gFoni2qSrd/aKdyolxl8cDgM4KnyKUjD8OVDCNFBinZTqMt3q
	 or4rHG8/JopLVJTUVcHyZeE6QBOLKbP+MipvSGYZYcfNf0JldNGGvFQQ/7lix0j1ubbXF
	 X/7hQAjsz5IBid41hxLI3Oi2h/kW8cv0hT/LZxH7rFWU61p+A4Ma2EZOQx4sVVHp0oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890461;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=BpLc4kjTNBHP2qvgRbwTt96j8T7FDfJofUtQxmJ23jo=;
	b=ELPLISHkgsnb7U+1QB7HDOk4bjM/9bzO0SGm/Rwc70jA2Y1PlRfbjeWU1HKxBUdxupuZ
	 nBs/Lapc1KHFvHdnCznZwGl6qjExcRbxY32TxccHk7nH3gvsXMtKZF6JWreWlRgAMqPtE
	 oAUdBPZ5xhemzuUguhyOfpmKMYPOkHwCeuiY8u249775g9bggWa1GTfcBQcBb+kbi2MQr
	 bEQm0rqTfiRZAaUZvAjrPRqpAHEr5+vZoRkZmKMYA3Ms06MNVFaBRSpuzob8Hvx6lK9Zb
	 jj0L6s20nR0lELp4XYncbh0sNFhzDt3QWKx9e+ItDRdi5eo73diHG6e2RyFPgPR5DOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ghzM6rux;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E43E606A31B
	for <fuse-devel@lists.linux.dev>; Thu,  5 Nov 2026 14:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E43E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ghzM6rux
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793890460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BpLc4kjTNBHP2qvgRbwTt96j8T7FDfJofUtQxmJ23jo=;
	b=ghzM6ruxpA/QMyVkCSJc/QbzDndVe22HjeZQ+Qyt/maUKoQhnwlPYtF2xP5uWxv9FuETxc
	5/d6qe4FbH5Q8dCzpzikhZw0JmiTlszthc/ILXX01kg6dyn64sxqNsi3oMGDOZ5VjJE1bs
	otInT3rG0d5KG3dhLIAuU5byMVshtvw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-CcdA-QtHPN6jiJJsL3kD-A-1; Thu, 05 Nov 2026 09:54:18 -0500
X-MC-Unique: CcdA-QtHPN6jiJJsL3kD-A-1
X-Mimecast-MFC-AGG-ID: CcdA-QtHPN6jiJJsL3kD-A_1793890457
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-490a0e72578so1287006f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 05 Nov 2026 06:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890457; x=1794495257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BpLc4kjTNBHP2qvgRbwTt96j8T7FDfJofUtQxmJ23jo=;
        b=Jyrg+a/8H9b0M8w4SI4TSOcVCbH8wxZkZiFxf7EbdhwV/2dM8KHi6hhI4zFDUuBqcS
         KFh+nux3RwzFzAShtlBUtkB23KLlG1SNgwcVWHVQnAByD2PbvN8UF9lpqI4NEngNKKxj
         GjRviTGmWFRm7plW7nT/c6h+OYTWRWeLNMKA398GWeWamII2sSI+XM04NFrEiX2scSSw
         tjErMzVVTA+EK294RIVUgQilOQBatw5NU/BODQkuhKoog2Hg7BYgqLU+4qotaV48zdTN
         QHyIBAmoa1Kmem+Blu3+Mm73Ly1R+ZDyu/h4eo2LREgnuheBXSmmKEzgd5PdVSvxtlG7
         ygAQ==
X-Gm-Message-State: APuU4Z+fQJd+h3I+oO+ygpFzOYBPWspCYhOCjPkehPYzyqn3xbgBbcyz
	9DcYPiB5oe0pwH5xiMSChpPO6XVeLHgWCphwsICRL9xMvMeShobnD8eCmzMrVgme6qqXpKv97N7
	qYiFKzKP1Qkf+2Cr3zyjU2IETDTyThO9aT2NHdDKb4KVOv5WWhn0XKPRX1mu6HUIbzCncxNsVVy
	cPIYa+x1Ito045gguD+Gx6vZaWJJZLTWXvlHFZ4YyuG+8G/rM=
X-Gm-Gg: AYBFou0cVNpFpuaJXpVuyiCVasvc2BI7K5iA83NAO4/x2AvT/TMZq9uuetq6RZGy/KS
	336zgm0DoI45KchGgpoHAVNB/2C0m38YroNe65/xgyUrH6KDX/glECjncYu64RMfGlRHVeqI5rR
	9crKqDnOcXqY3LZAxLBVWCxuedyJ9Tpaln8mxbibWi1Kpb787ykYlkIUT5boR0OIO/oPBH0LFSm
	ss42YYKjsxBESjpeObOOEFrlPyctWCaGfBrq69OjFY+7zXhUUuBDI+AfVRlPDjx1opb3vg6xvAq
	tkOz2PZAUDuIPqER6jmWiEjyfN47AcESohqoD9B8Kxa62b51rTh3jiAQTCqN7yz+m3kN5/nbEnn
	9oeolQmrrKRb9cPWH0v79qEHw8x2htM+ezPjphtPn+eeGAMjDuLFbt1rDjHe8ZTv1u5dEiDmemO
	ztMsVpfut5KGzRwdHez3/qVN3niXve3UI5ytVVkQ02Rt8=
X-Received: by 2002:a5d:4d82:0:b0:48b:a21:87f7 with SMTP id ffacd0b85a97d-48e6e4f4ff5mr31999991f8f.44.1793890457341;
        Thu, 05 Nov 2026 06:54:17 -0800 (PST)
X-Received: by 2002:a5d:4d82:0:b0:48b:a21:87f7 with SMTP id ffacd0b85a97d-48e6e4f4ff5mr31999952f8f.44.1793890456785;
        Thu, 05 Nov 2026 06:54:16 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (188-142-154-142.pool.digikabel.hu. [188.142.154.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed08536dsm9296429f8f.32.2026.11.05.06.54.15
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:54:16 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Subject: [PATCH 4/6] selftests/fuse: test post-EOF page zeroing on copy_file_range()
Date: Thu,  5 Nov 2026 15:54:08 +0100
Message-ID: <20261105145412.83058-4-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105145412.83058-1-mszeredi@redhat.com>
References: <20261105145412.83058-1-mszeredi@redhat.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rH8KzYicXAYMBDYxFVPJkutvLS_oVvVz1nvHJtMNKBc_1793890457
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Extend the test for the case of copy_file_range() extending the file over a
hole.

Fixes: 60dbcce1567f ("selftests/fuse: test post-EOF page zeroing when a file is extended")
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 .../filesystems/fuse/write_extend_eof_test.c  | 143 +++++++++++++++---
 1 file changed, 125 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/filesystems/fuse/write_extend_eof_test.c b/tools/testing/selftests/filesystems/fuse/write_extend_eof_test.c
index ca6ce6eca382..d6d5de8dac27 100644
--- a/tools/testing/selftests/filesystems/fuse/write_extend_eof_test.c
+++ b/tools/testing/selftests/filesystems/fuse/write_extend_eof_test.c
@@ -25,24 +25,46 @@
 #include <sys/mman.h>
 #include <sys/mount.h>
 #include <sys/stat.h>
+#include <sys/syscall.h>
 #include <sys/uio.h>
 #include <linux/fuse.h>
 
 #include "../../kselftest_harness.h"
 
 #define FUSE_ROOT_ID	1
-#define FILE_INO	2
+#define FILE_INO	2	/* "file", the file being extended */
+#define SRC_INO		3	/* "src", copy_file_range() source */
 #define MAX_WRITE	(128 * 1024)
 #define BACKING_SIZE	(4 * 1024 * 1024)
 #define POLLUTE		0xee
 
+/* Called directly: the libc wrapper needs off64_t and a recent enough glibc. */
+static ssize_t sys_copy_file_range(int fd_in, int64_t *off_in, int fd_out,
+				   int64_t *off_out, size_t len,
+				   unsigned int flags)
+{
+	return syscall(__NR_copy_file_range, fd_in, off_in, fd_out, off_out,
+		       len, flags);
+}
+
+/* Per-file server state. */
+struct backing_file {
+	unsigned char data[BACKING_SIZE];	/* authoritative bytes */
+	uint64_t size;
+};
+
 /* Server-side state, shared with the responder thread. */
 struct server {
 	int fd;
-	unsigned char backing[BACKING_SIZE];	/* authoritative bytes */
-	uint64_t size;
+	unsigned int copy_ops;			/* FUSE_COPY_FILE_RANGE* seen */
+	struct backing_file file[2];		/* FILE_INO, SRC_INO */
 };
 
+static struct backing_file *lookup_file(struct server *s, uint64_t nodeid)
+{
+	return &s->file[nodeid == SRC_INO];
+}
+
 static void reply(int fd, uint64_t unique, int error, void *data, size_t len)
 {
 	struct fuse_out_header oh = {
@@ -109,17 +131,22 @@ static void *server_thread(void *arg)
 			out.attr_valid = 3600;
 			fill_attr(&out.attr, ih->nodeid,
 				  root ? (S_IFDIR | 0755) : (S_IFREG | 0644),
-				  root ? 0 : s->size);
+				  root ? 0 : lookup_file(s, ih->nodeid)->size);
 			reply(s->fd, ih->unique, 0, &out, sizeof(out));
 			break;
 		}
 		case FUSE_LOOKUP: {
+			const char *name = (const char *)(ih + 1);
 			struct fuse_entry_out out = {0};
+			uint64_t nodeid;
 
-			out.nodeid = FILE_INO;
+			/* Every name exists; "src" is the second file. */
+			nodeid = strcmp(name, "src") ? FILE_INO : SRC_INO;
+			out.nodeid = nodeid;
 			out.attr_valid = 3600;
 			out.entry_valid = 3600;
-			fill_attr(&out.attr, FILE_INO, S_IFREG | 0644, s->size);
+			fill_attr(&out.attr, nodeid, S_IFREG | 0644,
+				  lookup_file(s, nodeid)->size);
 			reply(s->fd, ih->unique, 0, &out, sizeof(out));
 			break;
 		}
@@ -134,6 +161,7 @@ static void *server_thread(void *arg)
 		}
 		case FUSE_READ: {
 			struct fuse_read_in *in = (void *)(ih + 1);
+			struct backing_file *f = lookup_file(s, ih->nodeid);
 			uint64_t off = in->offset;
 			uint32_t size = in->size;
 
@@ -141,11 +169,12 @@ static void *server_thread(void *arg)
 				size = 0;
 			else if (off + size > BACKING_SIZE)
 				size = BACKING_SIZE - off;
-			reply(s->fd, ih->unique, 0, s->backing + off, size);
+			reply(s->fd, ih->unique, 0, f->data + off, size);
 			break;
 		}
 		case FUSE_WRITE: {
 			struct fuse_write_in *in = (void *)(ih + 1);
+			struct backing_file *f = lookup_file(s, ih->nodeid);
 			struct fuse_write_out out = {0};
 			uint64_t off = in->offset;
 			uint32_t size = in->size;
@@ -155,9 +184,9 @@ static void *server_thread(void *arg)
 
 				if (off + c > BACKING_SIZE)
 					c = BACKING_SIZE - off;
-				memcpy(s->backing + off, in + 1, c);
-				if (off + c > s->size)
-					s->size = off + c;
+				memcpy(f->data + off, in + 1, c);
+				if (off + c > f->size)
+					f->size = off + c;
 			}
 			out.size = size;
 			reply(s->fd, ih->unique, 0, &out, sizeof(out));
@@ -165,32 +194,70 @@ static void *server_thread(void *arg)
 		}
 		case FUSE_SETATTR: {
 			struct fuse_setattr_in *in = (void *)(ih + 1);
+			struct backing_file *f = lookup_file(s, ih->nodeid);
 			struct fuse_attr_out out = {0};
 
 			if ((in->valid & FATTR_SIZE) && in->size <= BACKING_SIZE) {
-				if (in->size > s->size)
-					memset(s->backing + s->size, 0,
-					       in->size - s->size);
-				s->size = in->size;
+				if (in->size > f->size)
+					memset(f->data + f->size, 0,
+					       in->size - f->size);
+				f->size = in->size;
 			}
 			out.attr_valid = 3600;
-			fill_attr(&out.attr, ih->nodeid, S_IFREG | 0644, s->size);
+			fill_attr(&out.attr, ih->nodeid, S_IFREG | 0644, f->size);
 			reply(s->fd, ih->unique, 0, &out, sizeof(out));
 			break;
 		}
 		case FUSE_FALLOCATE: {
 			struct fuse_fallocate_in *in = (void *)(ih + 1);
+			struct backing_file *f = lookup_file(s, ih->nodeid);
 			uint64_t end = in->offset + in->length;
 
 			/* Only plain (size-extending) fallocate is used here. */
 			if (!(in->mode & FALLOC_FL_KEEP_SIZE) &&
-			    end <= BACKING_SIZE && end > s->size) {
-				memset(s->backing + s->size, 0, end - s->size);
-				s->size = end;
+			    end <= BACKING_SIZE && end > f->size) {
+				memset(f->data + f->size, 0, end - f->size);
+				f->size = end;
 			}
 			reply(s->fd, ih->unique, 0, NULL, 0);
 			break;
 		}
+		case FUSE_COPY_FILE_RANGE:
+		case FUSE_COPY_FILE_RANGE_64: {
+			struct fuse_copy_file_range_in *in = (void *)(ih + 1);
+			struct backing_file *src = lookup_file(s, ih->nodeid);
+			struct backing_file *dst;
+			struct fuse_copy_file_range_out out64 = {0};
+			struct fuse_write_out out = {0};
+			uint64_t off_in = in->off_in;
+			uint64_t off_out = in->off_out;
+			uint64_t len = in->len;
+
+			dst = lookup_file(s, in->nodeid_out);
+			s->copy_ops++;
+			if (off_in >= BACKING_SIZE || off_out >= BACKING_SIZE) {
+				len = 0;
+			} else {
+				if (off_in + len > BACKING_SIZE)
+					len = BACKING_SIZE - off_in;
+				if (off_out + len > BACKING_SIZE)
+					len = BACKING_SIZE - off_out;
+				/* The hole left behind stays zero. */
+				memmove(dst->data + off_out, src->data + off_in,
+					len);
+				if (off_out + len > dst->size)
+					dst->size = off_out + len;
+			}
+			if (ih->opcode == FUSE_COPY_FILE_RANGE) {
+				out.size = len;
+				reply(s->fd, ih->unique, 0, &out, sizeof(out));
+			} else {
+				out64.bytes_copied = len;
+				reply(s->fd, ih->unique, 0, &out64,
+				      sizeof(out64));
+			}
+			break;
+		}
 		case FUSE_FLUSH:
 		case FUSE_RELEASE:
 		case FUSE_RELEASEDIR:
@@ -337,6 +404,46 @@ TEST_F(fuse, fallocate_extend)
 	assert_tail_zeroed(_metadata, self);
 }
 
+/*
+ * Extend via copy_file_range() landing on a page strictly past the old EOF
+ * page, so neither the copied range nor the flush of either file touches the
+ * old EOF folio.  The source has to be a separate file: copying within one
+ * file would flush it from the source offset on, and writeback zeroes the
+ * post-EOF tail on the way out, hiding the bug.
+ */
+TEST_F(fuse, copy_file_range_extend)
+{
+	int64_t off_in = 0;
+	int64_t off_out;
+	char path[128];
+	char *buf;
+	ssize_t ret;
+	int src;
+
+	pollute_eof_tail(_metadata, self);
+	off_out = 5 * self->page;
+
+	snprintf(path, sizeof(path), "%s/src", self->dir);
+	src = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
+	ASSERT_GE(src, 0);
+
+	buf = malloc(self->page);
+	ASSERT_NE(NULL, buf);
+	memset(buf, 'C', self->page);
+	ASSERT_EQ(self->page, pwrite(src, buf, self->page, 0));
+	free(buf);
+
+	ret = sys_copy_file_range(src, &off_in, self->fd, &off_out,
+				  self->page, 0);
+	ASSERT_EQ(self->page, ret);
+	close(src);
+
+	/* A splice fallback would extend via the write path instead. */
+	ASSERT_NE(0u, self->srv->copy_ops);
+
+	assert_tail_zeroed(_metadata, self);
+}
+
 /* A write landing inside the old EOF page must not clobber its own data. */
 TEST_F(fuse, extend_into_eof_page_preserves_data)
 {
-- 
2.56.0

