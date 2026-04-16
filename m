Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1388B39B4AE
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331063; cv=none; b=cLuMOMORfYm+R/e9Bgg4thg++3E7k/T2UT6TnmR+TIR26r45g7eCGliNWAR4nHC3otaDz+2jYKKsJokbYxJrpdW4sAt1n1uF4nCNwvWDiFxTlEwW7Ji2Q3OPB7hutyTtY7EmYDRG7zMTGgB3oxFMI9s1gzfLxVpi9HNIcguvPm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331063; c=relaxed/simple;
	bh=K/TaEfWt9Uf5VpvRSWMgT3Z+1hNM1hrA1FsVv3vLJ+g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=rKRNQn1Z3QtgnxxzUl0+4ehELn2jyoM8yh/YUb4GRfNOIxFfg5tw8LPLWtzMiGuBfxbqBhbUGC8bzcRyLLV8NjPHY1PdJLmqi47UpnuuJht0h6yWZtpYT/b6m2/6ogcxS5JnCyQDxAtXtjnTV3J/PpPZAiqKAgs7+o5wKpxV6SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EWoAmEy3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EWoAmEy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9XKLEilXUNzkgU63Y1kxVb2OFYW6G21+TJccAbz/tT0=;
	b=EWoAmEy32tnHYfQTMhbJoU2bKpV1qtXotpZBVB5dIJ5Qo1e21wwRZYC5IdiLhtUudkQQZI
	1lTOXDImMOfwdV7aOHd7TNQpsTVh+6GAKHBTll1ldphIJFV0V8DOXa42+hT/tKO9WBe1yp
	nD3c/ZYMOAqCH1P9DB+CeKXdum2WrOk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-KMYlyj-CPviN1Muvu2_xvw-1; Thu, 16 Apr 2026 05:17:33 -0400
X-MC-Unique: KMYlyj-CPviN1Muvu2_xvw-1
X-Mimecast-MFC-AGG-ID: KMYlyj-CPviN1Muvu2_xvw_1776331052
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488d6ebe9cfso52593145e9.2
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331052; x=1776935852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9XKLEilXUNzkgU63Y1kxVb2OFYW6G21+TJccAbz/tT0=;
        b=FlZlKkf00mAUHzVCZg5ub7MMiefe3ZBkkiTriuowvcCJx0+uUL1+Lge+MQQ6b6O+pu
         QHMn1Fnl4DfL7p0q67bPc3xpTG5yfG6Mb+5jVDsWZbckBVKtX3RJi7z2STDtIZUHD4q8
         DgNxkKqAEklEnwcNuXNtRq/2Dy75Ws547yCM15/m2m6BxiCF3OkJbZckncH8w5Duo64L
         SHhNbwZ4IK1G6TK2ImbKbEVyIgodeXOgRUOQ4SBCKltRHxRJR95mac5eLcmkNZcQkEBL
         WcWsiQZLho23xSdBmdgkIssjIFwQ0dRhd3NzsQK9pusLuXtUFuS4a48Ls8WNCQ0T4kx5
         7T6g==
X-Gm-Message-State: AOJu0Yyzd8uHZK3vp9Fm++sCyzLhRa2oJ/TiW3FlWLr0HZarH/gk02fj
	hTAGQIy9JOxD6SJKslyVKaK5uytWXBpiF0OwCRBNxh+n1eK+fJ9Wfqn5kEgRdyRE2/Ej3hm/52/
	8FilLRZQTmOX93n9u1vulviDj70siZ0QLcV9iIVUdid3xgNdmGqc7B7CnavmRAS7S8jCKS7lMzb
	dNTWMc5FtrfwMNG+hq/OoPXi9Z3/xPek/cVkvqdd94HK9lQbk=
X-Gm-Gg: AeBDieuU4Zrce6OH4GvnPbLKGE5ZzvWcmGM5C6AdkOxmGPkCbkKX+4KJpoPocNhmEWT
	3nmA41cH/zoQf5y/zwDvTMJaGapIJUl3hFWIQU0+mWxsqrcs4ynPuVQUsYRHmqNFfG4DPAFSj2T
	UD5fsoLzMER0FF9O2QvE/NIzawz9+GncZcHdq3TjenSgNuDtzeVcheXCUJCOSdCgcDKvPAme1Mf
	XmVTZb8+PFofG4ZeG+zQNhYU1KMcXUWfu09RJ7W3doaVgJqp1ShIdTUJ9v4pd0JV59zShivjahT
	juQQW5XMo4n53UTZpX7yRHdD/BYELRqSe+0hJ5qHncmF0pu8/OeWlxVsuio20Rg51Wx9r8LTvF6
	lCuBR+Ramm2Gc/j1uGN7Kd9ECNvDzWh8sH2f356nGjR422KcE2B/pukk7NXeYZJi7F37vbYecH3
	HrSQQMkA==
X-Received: by 2002:a05:600c:528f:b0:488:a82f:bbb4 with SMTP id 5b1f17b1804b1-488d689d0b8mr333952455e9.26.1776331052027;
        Thu, 16 Apr 2026 02:17:32 -0700 (PDT)
X-Received: by 2002:a05:600c:528f:b0:488:a82f:bbb4 with SMTP id 5b1f17b1804b1-488d689d0b8mr333951635e9.26.1776331051394;
        Thu, 16 Apr 2026 02:17:31 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:30 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 21/32] fuse: remove fm arg of args->end callback
Date: Thu, 16 Apr 2026 11:16:45 +0200
Message-ID: <20260416091658.462783-22-mszeredi@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416091658.462783-1-mszeredi@redhat.com>
References: <20260416091658.462783-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dd4P_yt1EL_54O7bCiKnlr9UIlfOdsUrIZrL2Jv2nUk_1776331052
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Only used by FUSE_INIT and CUSE_INIT, these can store the relevant pointer
in their structs derived from fuse_args.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/cuse.c  |  7 ++++---
 fs/fuse/dev.c   |  7 +++----
 fs/fuse/file.c  | 22 +++++++++-------------
 fs/fuse/inode.c | 10 ++++++----
 4 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/fs/fuse/cuse.c b/fs/fuse/cuse.c
index 9341bb5a88cb..bf5724415b04 100644
--- a/fs/fuse/cuse.c
+++ b/fs/fuse/cuse.c
@@ -307,6 +307,7 @@ struct cuse_init_args {
 	struct cuse_init_out out;
 	struct folio *folio;
 	struct fuse_folio_desc desc;
+	struct fuse_conn *fc;
 };
 
 /**
@@ -320,11 +321,10 @@ struct cuse_init_args {
  * required data structures for it.  Please read the comment at the
  * top of this file for high level overview.
  */
-static void cuse_process_init_reply(struct fuse_mount *fm,
-				    struct fuse_args *args, int error)
+static void cuse_process_init_reply(struct fuse_args *args, int error)
 {
-	struct fuse_conn *fc = fm->fc;
 	struct cuse_init_args *ia = container_of(args, typeof(*ia), ap.args);
+	struct fuse_conn *fc = ia->fc;
 	struct fuse_args_pages *ap = &ia->ap;
 	struct cuse_conn *cc = fc_to_cc(fc), *pos;
 	struct cuse_init_out *arg = &ia->out;
@@ -467,6 +467,7 @@ static int cuse_send_init(struct cuse_conn *cc)
 	ap->descs = &ia->desc;
 	ia->folio = folio;
 	ia->desc.length = ap->args.out_args[1].size;
+	ia->fc = &cc->fc;
 	ap->args.end = cuse_process_init_reply;
 
 	rc = fuse_simple_background(fm, &ap->args, GFP_KERNEL);
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index cbf8f086536c..f1e7e67912a3 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -641,7 +641,7 @@ void fuse_request_end(struct fuse_req *req)
 	}
 
 	if (test_bit(FR_ASYNC, &req->flags))
-		req->args->end(fm, req->args, req->out.h.error);
+		req->args->end(req->args, req->out.h.error);
 put_request:
 	fuse_put_request(req);
 }
@@ -1983,8 +1983,7 @@ struct fuse_retrieve_args {
 	struct fuse_notify_retrieve_in inarg;
 };
 
-static void fuse_retrieve_end(struct fuse_mount *fm, struct fuse_args *args,
-			      int error)
+static void fuse_retrieve_end(struct fuse_args *args, int error)
 {
 	struct fuse_retrieve_args *ra =
 		container_of(args, typeof(*ra), ap.args);
@@ -2071,7 +2070,7 @@ static int fuse_retrieve(struct fuse_mount *fm, struct inode *inode,
 
 	err = fuse_simple_notify_reply(fm, args, outarg->notify_unique);
 	if (err)
-		fuse_retrieve_end(fm, args, err);
+		fuse_retrieve_end(args, err);
 
 	return err;
 }
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 11d3797ad26b..d549f47170d6 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -92,8 +92,7 @@ static struct fuse_file *fuse_file_get(struct fuse_file *ff)
 	return ff;
 }
 
-static void fuse_release_end(struct fuse_mount *fm, struct fuse_args *args,
-			     int error)
+static void fuse_release_end(struct fuse_args *args, int error)
 {
 	struct fuse_release_args *ra = container_of(args, typeof(*ra), args);
 
@@ -113,10 +112,10 @@ static void fuse_file_put(struct fuse_file *ff, bool sync)
 		if (!args) {
 			/* Do nothing when server does not implement 'opendir' */
 		} else if (args->opcode == FUSE_RELEASE && ff->fm->fc->no_open) {
-			fuse_release_end(ff->fm, args, 0);
+			fuse_release_end(args, 0);
 		} else if (sync) {
 			fuse_simple_request(ff->fm, args);
-			fuse_release_end(ff->fm, args, 0);
+			fuse_release_end(args, 0);
 		} else {
 			/*
 			 * DAX inodes may need to issue a number of synchronous
@@ -127,7 +126,7 @@ static void fuse_file_put(struct fuse_file *ff, bool sync)
 			args->end = fuse_release_end;
 			if (fuse_simple_background(ff->fm, args,
 						   GFP_KERNEL | __GFP_NOFAIL))
-				fuse_release_end(ff->fm, args, -ENOTCONN);
+				fuse_release_end(args, -ENOTCONN);
 		}
 		kfree(ff);
 	}
@@ -710,8 +709,7 @@ static void fuse_io_free(struct fuse_io_args *ia)
 	kfree(ia);
 }
 
-static void fuse_aio_complete_req(struct fuse_mount *fm, struct fuse_args *args,
-				  int err)
+static void fuse_aio_complete_req(struct fuse_args *args, int err)
 {
 	struct fuse_io_args *ia = container_of(args, typeof(*ia), ap.args);
 	struct fuse_io_priv *io = ia->io;
@@ -759,7 +757,7 @@ static ssize_t fuse_async_req_send(struct fuse_mount *fm,
 	ia->ap.args.may_block = io->should_dirty;
 	err = fuse_simple_background(fm, &ia->ap.args, GFP_KERNEL);
 	if (err)
-		fuse_aio_complete_req(fm, &ia->ap.args, err);
+		fuse_aio_complete_req(&ia->ap.args, err);
 
 	return num_bytes;
 }
@@ -1001,8 +999,7 @@ static int fuse_iomap_read_folio_range(const struct iomap_iter *iter,
 	return fuse_do_readfolio(file, folio, off, len);
 }
 
-static void fuse_readpages_end(struct fuse_mount *fm, struct fuse_args *args,
-			       int err)
+static void fuse_readpages_end(struct fuse_args *args, int err)
 {
 	int i;
 	struct fuse_io_args *ia = container_of(args, typeof(*ia), ap.args);
@@ -1068,7 +1065,7 @@ static void fuse_send_readpages(struct fuse_io_args *ia, struct file *file,
 		res = fuse_simple_request(fm, &ap->args);
 		err = res < 0 ? res : 0;
 	}
-	fuse_readpages_end(fm, &ap->args, err);
+	fuse_readpages_end(&ap->args, err);
 }
 
 static void fuse_readahead(struct readahead_control *rac)
@@ -1985,8 +1982,7 @@ __acquires(fi->lock)
 	}
 }
 
-static void fuse_writepage_end(struct fuse_mount *fm, struct fuse_args *args,
-			       int error)
+static void fuse_writepage_end(struct fuse_args *args, int error)
 {
 	struct fuse_writepage_args *wpa =
 		container_of(args, typeof(*wpa), ia.ap.args);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 5cb0cc9b365e..b7dfe8338988 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1263,13 +1263,14 @@ struct fuse_init_args {
 	struct fuse_args args;
 	struct fuse_init_in in;
 	struct fuse_init_out out;
+	struct fuse_mount *fm;
 };
 
-static void process_init_reply(struct fuse_mount *fm, struct fuse_args *args,
-			       int error)
+static void process_init_reply(struct fuse_args *args, int error)
 {
-	struct fuse_conn *fc = fm->fc;
 	struct fuse_init_args *ia = container_of(args, typeof(*ia), args);
+	struct fuse_mount *fm = ia->fm;
+	struct fuse_conn *fc = fm->fc;
 	struct fuse_init_out *arg = &ia->out;
 	bool ok = true;
 
@@ -1437,6 +1438,7 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 
 	ia = kzalloc_obj(*ia, GFP_KERNEL | __GFP_NOFAIL);
 
+	ia->fm = fm;
 	ia->in.major = FUSE_KERNEL_VERSION;
 	ia->in.minor = FUSE_KERNEL_MINOR_VERSION;
 	ia->in.max_readahead = fm->sb->s_bdi->ra_pages * PAGE_SIZE;
@@ -1510,7 +1512,7 @@ int fuse_send_init(struct fuse_mount *fm)
 		if (!err)
 			return 0;
 	}
-	process_init_reply(fm, &ia->args, err);
+	process_init_reply(&ia->args, err);
 	if (fm->fc->conn_error)
 		return -ENOTCONN;
 	return 0;
-- 
2.53.0

