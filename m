Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096971;
	b=TnqlVnq5URkUBjlfBkvXm/zGX3JiHF9Wb5thOccaQv0eFPAw7QzDb6+0ZS51niaNNhGx
	 ksF2Uh88T0xeO/28v7v75iN5ffq9n6jq0Fd/Je0WeQIImvH9q0jN+RzFhA1iPSBM9um/b
	 ppZDkHHbUSwSCXxkreTIKuFOFjcXxn5CCMHU9hEHfkueHQzAMALnXXaAj1XSvqfYRTS5U
	 hQyqgYrMn72aSvtFB+Mmi9Ec79Ij6xPtYhGBwdPgsIN98Uw3xNpMgk4cBMOqbZBosZct8
	 cPnUIbWpLltUsHyjT5QZ1ITP98jZguCU7/7gffIlEmIV1OohoDWxTx6QSs0jYtSNYkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096971;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=iFiTy8SvU4f3m9EIRWPCkIao5/K816QhmT2FH1HPQGo=;
	b=Sci9HRqFk7l28FYODP/6j2Q7Xax/683ZdEm1cRuW4BOpVhvywUXJcpyDgucXO2B4rz4I
	 +9DBj8Rwm5sI0BV5a2gty+ZLMhZl5BbjBWoFAtPg2+ZJYX/jjisPW0t9O4TqyMCg98uxn
	 7fOkpSfAbQ6ynynJ5RYf+sMzr0uxoayGCfCqVfPJ9JIHaYPq+6Y1qRBOBA88eHyA3AZxc
	 1LjvFiIfjR/I2olao4OsbG1wgt1Hwh6VsX+niyonkGF7cwDntlF6J6BFYtgBwS6nVHSIH
	 tG48cTJW85Lrs1MQu20fXz/XoUk3TeyhXT6ZCCmLJ2QMNypZh7d9z+ADHVyztvCcTIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CWTa4fJk;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C7F606A33F
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 14:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C7F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CWTa4fJk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795096969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFiTy8SvU4f3m9EIRWPCkIao5/K816QhmT2FH1HPQGo=;
	b=CWTa4fJkFVwXsFwqxhhW+2NIsB76hWRd0qzxzNrIx5hEDfTsIBhuSS4w0xWR8wOFcvvspF
	xW8kF3MEehe/WotDuIHnGj6t66AfzZWLwrRT8iKzBVJ3v7yOnSzsAJbyZ2htsUqYsd1q/O
	AjLUDtbKkBuihqyqY5YWM20+h/EP3Tk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-gct0Kub7P7iLBtJfTBcIoQ-1; Thu, 19 Nov 2026 09:02:48 -0500
X-MC-Unique: gct0Kub7P7iLBtJfTBcIoQ-1
X-Mimecast-MFC-AGG-ID: gct0Kub7P7iLBtJfTBcIoQ_1795096966
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a799d93bc3so882457f8f.1
        for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 06:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096966; x=1795701766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iFiTy8SvU4f3m9EIRWPCkIao5/K816QhmT2FH1HPQGo=;
        b=GFii0+tZBEhxv3Rl7f0zMqpO0q52MhiZ4TdvISaoM2bJKKrye93n88tQWe/2Lyk4Xb
         5KXGMuMQX0gc13ag0TH2WSsIK0mqPMaCFENrOGdNeDME6sike5FQjpV8QfOaVfD0gEaq
         XcQLHJY3JGNowcWRjxzZ1bG/ilznkd4Qoq45oX0SP4qxTDiYV+PsabJF2nw5z+e9SuHS
         OpvL1pJGT1dsHtk9col5TTmAFvGKfcg5WIdzCJqGxtgB8+sd6xxWmPWO6u0OqvOcsUSq
         STT1mk1f3kFXzJRsWaz4HQEov7F9HX2S5RaBqGumy053wJKSOI1rir79fIOoYsP06Vm0
         Z/1A==
X-Gm-Message-State: APuU4Z/05MIXVovfdOGw5tDsS+mHXlLanSodO735an0jjQr00I97yWCx
	FReqvl/Z/R5l9Oyvblk/5KUDNL3SW+aN6dM25NhmdmacPFrIccRio1/CMTFj3d/xTyjqmEI/oYu
	DuQZcZmFANws+NzTYF4PJa77KYfxpjG39qYh40HKIdxvGkg6G6MYk8rVeI+kb0c7NEZXutciWbo
	8orkfsDyyo68NYqII3sMqB0aNSZaX69MweprIBtETjee/J03Q=
X-Gm-Gg: AZFdTZe4FXeCCBIIhMUgGf8FpzGWX9lCq96mjyRBcvLZ8BqRSy8X9CWBGr1yNSifzwa
	uP/A++jBJ0ljk+AFGGsd8AgikjZUMxX1X6tHfxWQqipuAi2HZCkadjBqVxD6SDH0YKosh78/G0M
	z7ZCGfhM1rrxhgXQ0pVSgiiR2UMO39xxc6HbgDWhYJ4myTxuhPOtfpBokAMWoEuamDxFRlkU1ri
	WGEMTTVeyNFlmurWe7GGYgg/pdjGKOGBZt7sNTWYgKPFmoKyuftDlPomdNgz9eCsMkd6pUCXcXs
	ZxcRseEMtZ0sFnBr8pYvS3dVijizv/OmV7wH6w0jhnZUEPKOcdfaRz2a3u/noTNEAIuylsO06hh
	YuvzbAXmd3zRAOIP8Rndc2QXgxT56Kqa0SasxIxdQr8Kcq3mwI6CeVlaNau5w3WWF9Bd151L8yp
	UQ+Aq5L06mCCV3Lygxhmm5Ed4casV6jfB3
X-Received: by 2002:a05:6000:3109:b0:4a8:8e3f:92b1 with SMTP id ffacd0b85a97d-4a88e3f9553mr8215232f8f.55.1795096964844;
        Thu, 19 Nov 2026 06:02:44 -0800 (PST)
X-Received: by 2002:a05:6000:3109:b0:4a8:8e3f:92b1 with SMTP id ffacd0b85a97d-4a88e3f9553mr8215156f8f.55.1795096964233;
        Thu, 19 Nov 2026 06:02:44 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (85-66-37-29.pool.digikabel.hu. [85.66.37.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab552a1a4asm6409f8f.34.2026.11.19.06.02.43
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:02:43 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Subject: [PATCH 2/2] fuse: advertise support for DAX mappings
Date: Thu, 19 Nov 2026 15:02:38 +0100
Message-ID: <20261119140240.1798841-2-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119140240.1798841-1-mszeredi@redhat.com>
References: <20261119140240.1798841-1-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: cioRkQ8Ww7LOpW22XyT2T-BW3fPFR4enbwYmjO2VTDc_1795096966
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Reuse the FUSE_HAS_INODE_DAX flag, which previously was only used for the
virtiofs case.

The two uses are unrelated: for virtiofs the flag means that host memory
can be mapped directly into the guest, while here it means that the server
may back an inode with a dax device opened via FUSE_DEV_IOC_BACKING_OPEN.

Gate the advertisement on IS_REACHABLE(CONFIG_DEV_DAX_FSDEV), which is
what fuse_backing_open_file() requires before it accepts a dax device as
backing; CONFIG_FS_DAX alone is not sufficient.

Plain fuse servers should check both FUSE_HAS_INODE_DAX and
FUSE_PASSTHROUGH_V2 before enabling passthrough dax support.

Stop advertising FUSE_PASSTHROUGH(_V2) in the virtiofs case, which doesn't
support passthrough mode.

Note: FUSE_HAS_INODE_DAX flag in the INIT reply is ignored, so it's handled
slightly differently from the virtiofs case.  This is deliberate.  The
server needs to check both FUSE_PASSTHROUGH_V2 and FUSE_HAS_INODE_DAX
before enabling DAX based extent map if it wants to bail or fall back to
plain I/O mode on kernels not supporting this feature.  A broken server
that does not check the features yet sets FUSE_ATTR_DAX will result in an
error on open.  This is not backward compatible, since this flag was
silently ignored previously, but unlikely to be an issue in real life.

Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/fuse_i.h          | 13 +++++++++++++
 fs/fuse/inode.c           | 32 +++++++++++++++++++++++++-------
 fs/fuse/virtio_fs.c       |  1 +
 include/uapi/linux/fuse.h | 10 ++++++++--
 4 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index a033b0bc4576..e0992fcbcc55 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -421,6 +421,7 @@ struct fuse_fs_context {
 	bool no_req_timeout:1;
 	bool legacy_opts_show:1;
 	bool syncfs_capable:1;
+	bool is_virtiofs:1;
 	enum fuse_vdax_mode vdax_mode;
 	unsigned int max_read;
 	unsigned int blksize;
@@ -761,6 +762,9 @@ struct fuse_conn {
 	/** @sync_init: Is synchronous FUSE_INIT allowed? */
 	unsigned int sync_init:1;
 
+	/** @is_virtiofs: Is this a virtio-fs connection? */
+	unsigned int is_virtiofs:1;
+
 	/** @max_stack_depth: Maximum stack depth for passthrough backing files */
 	int max_stack_depth;
 
@@ -1273,6 +1277,15 @@ void fuse_free_conn(struct fuse_conn *fc);
 
 /* dax.c */
 
+static inline bool fuse_conn_vdax(struct fuse_conn *fc)
+{
+#ifdef CONFIG_FUSE_VDAX
+	return fc->vdax;
+#else
+	return false;
+#endif
+}
+
 static inline bool fuse_inode_vdax(struct inode *inode)
 {
 #ifdef CONFIG_FUSE_VDAX
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index c6bfc66317ad..af6d9e0af190 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -385,7 +385,7 @@ static void fuse_change_attributes_i(struct inode *inode, struct fuse_attr *attr
 			invalidate_inode_pages2(inode->i_mapping);
 	}
 
-	if (IS_ENABLED(CONFIG_FUSE_VDAX))
+	if (fuse_conn_vdax(fc))
 		fuse_vdax_dontcache(inode, attr->flags);
 }
 
@@ -419,13 +419,18 @@ static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
 		fuse_init_file_inode(inode, attr->flags);
 
 		/*
+		 * FUSE_ATTR_DAX means a passthrough extent map on a dax
+		 * device, which only exists on a plain fuse connection.  On
+		 * virtiofs the same bit means per inode virtiofs DAX, which
+		 * is handled by fuse_vdax_inode_init() instead.
+		 *
 		 * Without CONFIG_FS_DAX, S_DAX is zero and IS_DAX() is
 		 * constant false, so all the checks that keep DAX inodes away
 		 * from the page cache are compiled out.  Don't install address
 		 * space operations that have no ->read_folio in that case.
 		 */
-		if (IS_ENABLED(CONFIG_FS_DAX) && (attr->flags & FUSE_ATTR_DAX) &&
-		    !fuse_inode_vdax(inode)) {
+		if (IS_ENABLED(CONFIG_FS_DAX) && !fc->is_virtiofs &&
+		    (attr->flags & FUSE_ATTR_DAX)) {
 			inode->i_flags |= S_DAX;
 			inode->i_data.a_ops = &fuse_dax_aops;
 		}
@@ -1394,7 +1399,7 @@ static void process_init_reply(struct fuse_args *args, int error)
 				    !fuse_vdax_check_alignment(fc, arg->map_alignment)) {
 					ok = false;
 				}
-				if (flags & FUSE_HAS_INODE_DAX)
+				if (fuse_conn_vdax(fc) && (flags & FUSE_HAS_INODE_DAX))
 					fc->inode_vdax = 1;
 			}
 			if (flags & FUSE_HANDLE_KILLPRIV_V2) {
@@ -1423,7 +1428,7 @@ static void process_init_reply(struct fuse_args *args, int error)
 			 * and FUSE_WRITEBACK_CACHE, current design doesn't handle
 			 * them together.
 			 */
-			if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) &&
+			if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) && !fm->fc->is_virtiofs &&
 			    (flags & (FUSE_PASSTHROUGH | FUSE_PASSTHROUGH_V2)) &&
 			    arg->max_stack_depth > 0 &&
 			    arg->max_stack_depth <= FILESYSTEM_MAX_STACK_DEPTH &&
@@ -1516,13 +1521,25 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 #ifdef CONFIG_FUSE_VDAX
 	if (fm->fc->vdax)
 		flags |= FUSE_MAP_ALIGNMENT;
-	if (fuse_is_inode_vdax_mode(fm->fc->vdax_mode))
+	if (fm->fc->vdax && fuse_is_inode_vdax_mode(fm->fc->vdax_mode))
 		flags |= FUSE_HAS_INODE_DAX;
 #endif
 	if (fm->fc->auto_submounts)
 		flags |= FUSE_SUBMOUNTS;
-	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH))
+	/*
+	 * Passthrough requires a backing file registered with
+	 * FUSE_DEV_IOC_BACKING_OPEN on the fuse device, which a virtiofs
+	 * server has no way to do.
+	 */
+	if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) && !fm->fc->is_virtiofs) {
 		flags |= FUSE_PASSTHROUGH | FUSE_PASSTHROUGH_V2;
+		/*
+		 * Per inode DAX needs a dax device opened as backing, which
+		 * is unrelated to how virtiofs uses the same flag above.
+		 */
+		if (IS_REACHABLE(CONFIG_DEV_DAX_FSDEV))
+			flags |= FUSE_HAS_INODE_DAX;
+	}
 	/* Only offered to sufficiently privileged servers; see
 	 * fuse_syncfs_enable().
 	 */
@@ -1830,6 +1847,7 @@ int fuse_fill_super_common(struct super_block *sb, struct fuse_fs_context *ctx)
 	fc->no_control = ctx->no_control;
 	fc->no_force_umount = ctx->no_force_umount;
 	fc->no_req_timeout = ctx->no_req_timeout;
+	fc->is_virtiofs = ctx->is_virtiofs;
 
 	err = -ENOMEM;
 	root = fuse_get_root_inode(sb, ctx->rootmode);
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index cdd6f5c50d6d..e17c96fa876e 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -1827,6 +1827,7 @@ static int virtio_fs_init_fs_context(struct fs_context *fsc)
 	ctx = kzalloc_obj(struct fuse_fs_context);
 	if (!ctx)
 		return -ENOMEM;
+	ctx->is_virtiofs = true;
 	fsc->fs_private = ctx;
 	fsc->ops = &virtio_fs_context_ops;
 	return 0;
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 616430a2973c..cb9e9554f0ef 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -257,6 +257,7 @@
  *  - add backing_id_64 to fuse_open_out
  *  - add FUSE_NOTIFY_BACKING_MAP, fuse_notify_backing_map_out, fuse_extent
  *  - add FUSE_BACKING_MAP_CREATE, FUSE_BACKING_MAP_CYCLIC
+ *  - extend the meaning of FUSE_HAS_INODE_DAX and FUSE_ATTR_DAX
  */
 
 #ifndef _LINUX_FUSE_H
@@ -460,7 +461,11 @@ struct fuse_file_lock {
  * FUSE_INIT_RESERVED: reserved, do not use
  * FUSE_SECURITY_CTX:	add security context to create, mkdir, symlink, and
  *			mknod
- * FUSE_HAS_INODE_DAX:  use per inode DAX
+ * FUSE_HAS_INODE_DAX:  use per inode DAX.  The meaning depends on the
+ *			transport: on virtio-fs it indicates per-inode DAX
+ *			support, while on /dev/fuse (where FUSE_PASSTHROUGH_V2
+ *			is also offered) it indicates support for passthrough
+ *			extent maps on a DAX device.
  * FUSE_CREATE_SUPP_GROUP: add supplementary group info to create, mkdir,
  *			symlink and mknod (single group that matches parent)
  * FUSE_HAS_EXPIRE_ONLY: kernel supports expiry-only entry invalidation
@@ -612,7 +617,8 @@ struct fuse_file_lock {
  * fuse_attr flags
  *
  * FUSE_ATTR_SUBMOUNT: Object is a submount root
- * FUSE_ATTR_DAX: Enable DAX for this file in per inode DAX mode
+ * FUSE_ATTR_DAX: Enable DAX for this file in per inode DAX mode and in
+ *		  extent mapping passthrough mode
  */
 #define FUSE_ATTR_SUBMOUNT      (1 << 0)
 #define FUSE_ATTR_DAX		(1 << 1)
-- 
2.56.1

