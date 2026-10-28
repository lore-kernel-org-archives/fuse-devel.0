Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178773;
	b=JIFQ7y/gdXakpHBdvA+hN0ZpdQwE4QeBbzBxQv5tPogzTzdnYyerD+N/kggWZuW0l6sm
	 j+j8pCHYAA+xg7nrypeA9LBTPJlxz1llD80Bp+ermNuXSbHV+DjCJ0eON14t+fYkiGxPD
	 GQAwpn7xoTfNE0MEHAILvm/O7C1XG4KVycj3bg/c4iQaq8Ll3S2GOf1qLvdQ8I/iUm1TM
	 9qaxFoyzOnai2t7kTcH9P52g2RssaLYh/D/hKO/kciq4EzAwcyEaybz3PFLXOJ2kWLzSe
	 tPmvvOx8ZoJX0RFHzquPFjr6Lb3ihu4Kjk5Er4oLJLF1n96HIAQzdCgKTwOpVIwTeIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7XsxFj3mFHgUmEZbcd84Fk8EgzunNQAmvnY9/sm2nqE=;
	b=ryZwIoQBCt1fYMcli0YGM83X3wEw2qqrTly7Fat+2v2ut+Mpm1aTdRWprCLLHPadYza6
	 EthBseYv1PnIk7FtQwDR8gKb2JUzihUonsYka8FhIbnNsAY+PUBVgRNpa5z7Gu2swUYJO
	 1RoFs2VNI329y+PZPTXwe2L7w8bkmlRYAuPGHgJDLsbOJBQr9yMio9Gn/kq2MYsNdr7SY
	 UQkP9eQBeRr6S+XuLJzXJswRq8jeRGPvh1E4NFnP2S/LAOcnME4rQ9IhpEPZp2RKmQuGk
	 xe4B4gQL0nlYLAJ6HQoJFyXEzMgEQasvmrY4sD6ohPQun1gYvZYy244P+K2pAIWHIMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYnbNaEf;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1E2606A31A
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 09:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B1E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYnbNaEf
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so4037755e9.1
        for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178771; x=1793783571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XsxFj3mFHgUmEZbcd84Fk8EgzunNQAmvnY9/sm2nqE=;
        b=cYnbNaEffvmwHFOtd44Wy8fKfW6M6fa04nWs8rNgQZ4uxAwdwTxCadnA6ei1MzL+KR
         1aL8ZEHn1U+UnP2uG4Ibn+sP+y9tHdwqn07mGbOuvBinGu1VXe52gJUkHBsV8O6stiOj
         yLSParDu7jpg4YVIAlc6J6kLL5asQuiU+BuWVJrn5JB13w3grGzagOVCG40TS6FDUF1W
         rZzv1vqhhaN+4lGCS3qA/ac87YAaFaLTH0gHJozfTqoR42U7ybqqCGQpIL7PWsPvssWF
         PsaRoh0FSc78fOBFCbaagDZrK90A4jB7omMZRqKvWEqxqWtNSqfxGvwpomelvf0R9sSD
         JHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178771; x=1793783571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XsxFj3mFHgUmEZbcd84Fk8EgzunNQAmvnY9/sm2nqE=;
        b=IyVvsgTjggDy2CY8o6jxAQXxKwvqFloIZhZVO2ZgYtHdazxI7n2OkjJ/QyeGYmPVml
         ZxcdWedK92mPKe2DfDyJyxBW+2f0RFAM/QalovA8h91yz8AVLdzX+Tq+YTUfQ9Ksdp2i
         C0e/5TbUi+c1X6nokJ7JJGBjSvG03hHdAGGGNhPeNrtl0m7E1nUlksY10s22rs28oFLm
         OVWqZ/akKP2CrfnAi9FSp+u3v+Su8IWL3KKAuCHnSRItug3z1Hrko+uMt0MkQbyXnDzb
         KGQQT8ukEaCz7Ldut9ihk+CTE2FkPWlcaHfIp+dkWCIQJ4dqakRci61SxvU2xsh4F7Ps
         tTPA==
X-Gm-Message-State: AFq9FYIZW7A5K2211f52P12DdLS34HcI/0Y2egsY2yVcDSquIj2oQaEU
	QHihxd//q9Vdl4JEfSRp2G3EQbEDWmgEp8Y3eYA7G9u9wlPBC5Gi85EN
X-Gm-Gg: AYBFou0wJ4eJeG7MBMkZppVtsr01rh/UfvPbXcVZ6onn64PDa5yNmyjssfBMFDOaJ6C
	7vejTDor+8VozKpkh79HGFMtw16cTm2DiED3rpqFLuO9oyvHTSzr+ulKxeLRE5+zS7DZLAPHQRE
	IjHboXmQ9P51rntUUXpH5InR1+ZmxNDm12rDauH3tnGLWxfFTLC4MZ5eRhS2odOlUF8sPps1IAL
	bmEoD4xMVxHHyuL6+XERamvESPRit6vjrIF0tlNO6ObvJkM3a5kc1TP7P7YqSfheoXB84v4ZK0D
	+GnOwJF9quPkDYzrCCk1s6mBuxYNdAgrFeezKFICwXs5xS1k0xqhGon5UWfF2X/uopkZSSh3Zwb
	oYA9rvtp2vuyS786BaLzPG34qHR7oRHWI19ephpvAebKxS2VYyKjpQFQlKnkzfqsE6HIPo1D00W
	JkJTG90ASJ831hrovwN2fZ5oXGNk70ndo3R0LJtkBxSlCx38uXyVwc6bsO2pmAOXOo3FCoPvq84
	RDEmjTNagwf6XTDHqih6DeATgJJIPF4+Igf3yTpipIxTz17Mx4WqBd/vYOgc2xs/nZk8nClh3a8
	J0ItkHes/jqDUtkIg9vtfvse5PgcJTyfhFsH84+CBqzMAygsDvVYtFTBcka63wQ=
X-Received: by 2002:a05:600c:8114:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a997cf5091mr26051375e9.17.1793178771460;
        Wed, 28 Oct 2026 02:12:51 -0700 (PDT)
Received: from t480.fritz.box ([2001:a61:3a4e:c601:fc75:724e:6b78:3649])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c42b3c1sm33507215e9.6.2026.10.28.02.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:12:50 -0700 (PDT)
From: Han-Wen Nienhuys <hanwenn@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	Han-Wen Nienhuys <hanwenn@gmail.com>
Subject: [PATCH 6/7] fuse: open and release files for the kernel itself
Date: Wed, 28 Oct 2026 10:12:14 +0100
Message-ID: <20261028091215.914885-7-hanwenn@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028091215.914885-1-hanwenn@gmail.com>
References: <20261028091215.914885-1-hanwenn@gmail.com>
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

A following change reads a directory from a work item, on behalf of no
process. Add __fuse_file_open(), which can mark the OPEN or OPENDIR
request with args->no_caller, and __fuse_file_release(), which takes
whether to wait for the server to process the release, rather than
deriving it from the connection.

No functional change.

Signed-off-by: Han-Wen Nienhuys <hanwenn@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 fs/fuse/file.c   | 33 ++++++++++++++++++++++++++-------
 fs/fuse/fuse_i.h |  6 ++++++
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 9d979deb6cf8..41d8a03909da 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -23,7 +23,7 @@
 #include <linux/iomap.h>
 
 static int fuse_send_open(struct fuse_mount *fm, u64 nodeid,
-			  unsigned int open_flags, int opcode,
+			  unsigned int open_flags, int opcode, bool no_caller,
 			  struct fuse_open_out *outargp)
 {
 	struct fuse_open_in inarg;
@@ -49,6 +49,7 @@ static int fuse_send_open(struct fuse_mount *fm, u64 nodeid,
 	args.out_argvar = true; /* compat */
 	args.out_args[0].size = sizeof(*outargp);
 	args.out_args[0].value = outargp;
+	args.no_caller = no_caller;
 
 	res = fuse_simple_request(fm, &args);
 
@@ -134,8 +135,10 @@ static void fuse_file_put(struct fuse_file *ff, bool sync)
 	}
 }
 
-struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
-				 unsigned int open_flags, bool isdir)
+/* Open @nodeid.  If @no_caller, the request is made on behalf of no process. */
+struct fuse_file *__fuse_file_open(struct fuse_mount *fm, u64 nodeid,
+				   unsigned int open_flags, bool isdir,
+				   bool no_caller)
 {
 	struct fuse_conn *fc = fm->fc;
 	struct fuse_file *ff;
@@ -163,7 +166,8 @@ struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
 		struct fuse_open_out *outargp = &ff->args->open_outarg;
 		int err;
 
-		err = fuse_send_open(fm, nodeid, open_flags, opcode, outargp);
+		err = fuse_send_open(fm, nodeid, open_flags, opcode, no_caller,
+				     outargp);
 		if (!err) {
 			ff->fh = outargp->fh;
 			ff->open_flags = outargp->open_flags;
@@ -190,6 +194,12 @@ struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
 	return ff;
 }
 
+struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
+				 unsigned int open_flags, bool isdir)
+{
+	return __fuse_file_open(fm, nodeid, open_flags, isdir, false);
+}
+
 int fuse_do_open(struct fuse_mount *fm, u64 nodeid, struct file *file,
 		 bool isdir)
 {
@@ -358,8 +368,10 @@ static void fuse_prepare_release(struct fuse_inode *fi, struct fuse_file *ff,
 	ra->inode = sync ? NULL : igrab(&fi->inode);
 }
 
-void fuse_file_release(struct inode *inode, struct fuse_file *ff,
-		       unsigned int open_flags, fl_owner_t id, bool isdir)
+/* Release @ff.  If @sync, wait for the server to process the release. */
+void __fuse_file_release(struct inode *inode, struct fuse_file *ff,
+			 unsigned int open_flags, fl_owner_t id, bool isdir,
+			 bool sync)
 {
 	struct fuse_inode *fi = get_fuse_inode(inode);
 	struct fuse_release_args *ra = &ff->args->release_args;
@@ -372,6 +384,12 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 		ra->inarg.lock_owner = fuse_lock_owner_id(ff->fm->fc, id);
 	}
 
+	fuse_file_put(ff, sync);
+}
+
+void fuse_file_release(struct inode *inode, struct fuse_file *ff,
+		       unsigned int open_flags, fl_owner_t id, bool isdir)
+{
 	/*
 	 * Normally this will send the RELEASE request, however if
 	 * some asynchronous READ or WRITE requests are outstanding,
@@ -393,7 +411,8 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 	 * before commencing with fs shutdown doesn't work if submounts are
 	 * used.
 	 */
-	fuse_file_put(ff, ff->fm->fc->auto_submounts);
+	__fuse_file_release(inode, ff, open_flags, id, isdir,
+			    ff->fm->fc->auto_submounts);
 }
 
 void fuse_release_common(struct file *file, bool isdir)
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 8cde95834570..8e1117d45276 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1352,8 +1352,14 @@ int fuse_file_io_open(struct file *file, struct inode *inode);
 void fuse_file_io_release(struct fuse_file *ff, struct inode *inode);
 
 /* file.c */
+struct fuse_file *__fuse_file_open(struct fuse_mount *fm, u64 nodeid,
+				   unsigned int open_flags, bool isdir,
+				   bool no_caller);
 struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
 				 unsigned int open_flags, bool isdir);
+void __fuse_file_release(struct inode *inode, struct fuse_file *ff,
+			 unsigned int open_flags, fl_owner_t id, bool isdir,
+			 bool sync);
 void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 		       unsigned int open_flags, fl_owner_t id, bool isdir);
 
-- 
2.56.0

