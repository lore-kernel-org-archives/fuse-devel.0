Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891395;
	b=t0fIWaAgYAmDl2QhR7C0KGGVk3mBMP/Xe5qQHed6rNtBUMyYUWLliA61Pk+nPzMu88lK
	 P2Br4HvQE4Vjw2/1dWbniBHiMDdVdhLIyrpAsphO88JAITYwJH06FaLA6e53gm0gx3y3/
	 ts6oScMpChnJTnBwpnqN/ejYuF8V/STYRzRt6oaDI7bTnRy4dRR8WzMg1Ei417AKWqWFp
	 Xi6ginK6vnTyr51JgEdkN236xB79ILCNQi8SUcZL79DM96blvkwCb1jWrzWUtoumAvEVm
	 4eSb7aE84yjW3DmHJovdGd0qTWSrduJUxwHmib0Jl77nZ9pTgF7UXGkfm09bIQfoxNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891395;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=LOGmXt5dkQ9qYZQNInukOa3xIUze1p69S3CHfPjI8CI=;
	b=YYNO72kT3tUUot2Fc5VvSF8hZ+UmwS1zh1GfZedATKz7cwZ0Kd0LVcxv5aIMtuF5AkZ0
	 MIAxcAi7GgZIN7gx44XOq8xSge6r4R7LPEHCGwuFTS+9/ELYLJVpemPktnYla8PIQqYlr
	 TdVGJ9D7FOsDg2I9k46ihUIGB/81AY2Toi3D0FGMbPpJRUEzAuOIWtbLEgJe9THVs7MTZ
	 WYNvBDTz4TXdXzEVpoxop0BqZBG6kUI4MJE9/s2o1wGwCasIPrpT66/x4/UwL5ob3Ev6l
	 NdVOQ0zKzEvySftQNrCyPcymgb3jzVFUSHoIN4bOKgOyEhfyHIFSO+hEbbSiWy0FHNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f+0WVLO0;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1DB606D814
	for <fuse-devel@lists.linux.dev>; Thu,  5 Nov 2026 15:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B1DB606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f+0WVLO0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793891394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LOGmXt5dkQ9qYZQNInukOa3xIUze1p69S3CHfPjI8CI=;
	b=f+0WVLO06vyfT2EsKXhvgS8+mN0vOk8rWJKCVkVi2/Z04EBfnKe3+JXnaYpKSjCO0mOkLk
	flKVEnDe4IhmNX0nHOzz3222Ex2HH5ZtQPIwTI1szq49QXRJDc3T0PHdgc6vUt3MtPj4Rg
	/ziRLcK3vnMLpaHfylDzHzra64OoJ8o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-4ZuKWao2P3K8gMwye1g_8w-1; Thu, 05 Nov 2026 10:09:51 -0500
X-MC-Unique: 4ZuKWao2P3K8gMwye1g_8w-1
X-Mimecast-MFC-AGG-ID: 4ZuKWao2P3K8gMwye1g_8w_1793891390
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a204ac318aso12076485e9.2
        for <fuse-devel@lists.linux.dev>; Thu, 05 Nov 2026 07:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891390; x=1794496190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOGmXt5dkQ9qYZQNInukOa3xIUze1p69S3CHfPjI8CI=;
        b=zZskZcq+TYQWjMKJx8geyudYu1+jjwCg6Tg91QG0Ib5G2qC/nhq6kv1uhceMqzvX8Q
         ggGi0f9IHx/Kn1o+s1JgvEDBBXGtL/rpzxA383Kgu1UldZfpX3oIFn6TBN546K07WXto
         oXBa0P2c+F+SwZqzqAJpX2hsQQhDsnJyRIbSqJZAB7039LFZZBjR0KB1fi9kkNjYnsh1
         pDaAtK44ek+TnpNK9qexCK5oISWh/ZWpcYEJii28hsckymWX9p0t7XBMCsPTgQkK0VwG
         Da/S7rWS0lv/hbigsDx/PdfpdDfPOGqmAZgJggD6hdwt8ggRllVvXt7GHXxkYo0vJiGU
         MAsg==
X-Gm-Message-State: APuU4Z8aQQVjRAL1WCtaxqjSB0vfKHUfCPi29CvDD20CsTBqnkXvRkEL
	PxoML49Qw6+9agd0/x5pikyuSpO6t29NyX1ufwZG8H+VcrCdQp4mozI2MW1kF9U3nDBvnMx/YKT
	SkEwzrb+ul3TcyhkNjJojDBpGLwvlj7kj1Ge7rxo3J8FhAPZpy+kwEp1Ckx1oed1J4dWMdK0/Vw
	eix/EaZ0YnsZ1etJSxpt/CCj/KROpAL388ircA9k83SQTnYas=
X-Gm-Gg: AYBFou3deUlwgebFs0drJMBDzna4SR9rYBYnvXiVABjOALtzJqU83ASRXCIgncsjJcj
	O//0yQ7xY0zvyV++viBchKHlmizQaA/oi7PHxuE2F1v0ymesAZzsE1CtdoSCCPBDo/hFav9YzxL
	wQgY0pWqyB3Ul7VqIMPVdsb+H6htoVl8Cii6afMwDnVqyZ2OQ1jG6uuHV2qmp9XvQdyNAkynIIe
	8cDE/F15ayfxfSg1K5FtalO8fz/8b1MwndcysV0q+1/vEhQ9+NIQc2yUV2ljNDYEZ5GmKuWQ4CW
	EI+VdJ7K4kTWbZ61KImdvaqFT5UAg5GgOyW3mgPvq1h+2jb4FgM9RALstVQ/hivxCdUh1hvPcon
	/NujGdAu7SZwftwNRHJL5wng2eBlWAUHg+OSIPOW3ooACPXLD3NDHtcfbBMnw4JGkk7dUR9Q+/q
	xAy9o7p3/I8pKTozeagMj9EK5VFdA/os2N2SzWqBMK4bI=
X-Received: by 2002:a05:600c:541:b0:4b0:9803:dc8a with SMTP id 5b1f17b1804b1-4b09803dd63mr180693315e9.26.1793891389734;
        Thu, 05 Nov 2026 07:09:49 -0800 (PST)
X-Received: by 2002:a05:600c:541:b0:4b0:9803:dc8a with SMTP id 5b1f17b1804b1-4b09803dd63mr180692765e9.26.1793891389253;
        Thu, 05 Nov 2026 07:09:49 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (188-142-154-142.pool.digikabel.hu. [188.142.154.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm9961340f8f.52.2026.11.05.07.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:09:48 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/3] virtiofs: disable request timeout
Date: Thu,  5 Nov 2026 16:09:41 +0100
Message-ID: <20261105150943.86650-3-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105150943.86650-1-mszeredi@redhat.com>
References: <20261105150943.86650-1-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Le947AZJjmHaP9zO90vnfh4Rno5IsGxQultzRI96PHE_1793891390
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The request timeout is implemented by aborting the connection:
fuse_check_timeout() calls fuse_chan_abort(), which splices
fpq->processing onto a local list and ends those requests.  Ending a
request wakes the waiting caller, which then drops the last reference and
frees it.

That is safe for /dev/fuse, where the request has already been copied out
to userspace and nothing outside the kernel retains a pointer to it.  It
is not safe for virtiofs.  virtio_fs_enqueue_req() passes the bare req as
the virtqueue token, and the scatterlists point at req->in.h, req->out.h,
req->argbuf and the request's folios; the device still owns all of that
after the abort.  When the device eventually completes the request,
virtio_fs_requests_done_work() gets the freed req back from
virtqueue_get_buf() and passes it to virtio_fs_verify_response() and
virtio_fs_request_complete(), which dereference req->args - the caller's
stack frame, long gone - and kfree() whatever req->argbuf now reads as.
The device may also have written the reply into the freed request or into
folios that have since been reused.

This is precisely why virtio_fs_conn_destroy() drains all queues down to
in_flight == 0 before calling fuse_conn_destroy(): once buffers are in a
virtqueue, the only ways to reclaim them are to wait for completion or to
reset the device.  virtiofs already disables the other two paths that
could abort a live connection, via ctx->no_control and
ctx->no_force_umount; the timeout is the one that was left.

Timeouts make little sense for virtiofs in the first place.  A timeout is
a guest-side reaction to a wedged host, and the guest has no recourse: it
can neither take the buffers back nor make the host answer.

So add fuse_conn::no_req_timeout for transports that cannot revoke a
request once it has been handed to the server, set it from virtiofs, and
use it to skip both fuse_init_server_timeout() and the
FUSE_REQUEST_TIMEOUT negotiation flag.  Skipping the former matters on its
own: without it the fs/fuse/default_request_timeout sysctl would arm the
timer even though FUSE_REQUEST_TIMEOUT was never offered to the server.

Note that this is not a security issue.  virtiofs inverts the usual fuse
trust relationship - the server is the privileged, trusted side and the
guest kernel is the untrusted one - so a server intent on corrupting guest
memory has far more direct means at its disposal.

Fixes: 0f6439f61a6e ("fuse: add kernel-enforced timeout option for requests")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-8171ebf0-ef01-4ccd-943e-8633a8d54239
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/fuse_i.h    | 10 ++++++++++
 fs/fuse/inode.c     |  9 ++++++---
 fs/fuse/virtio_fs.c |  7 +++++++
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index ec5ccdf18a25..a033b0bc4576 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -418,6 +418,7 @@ struct fuse_fs_context {
 	bool destroy:1;
 	bool no_control:1;
 	bool no_force_umount:1;
+	bool no_req_timeout:1;
 	bool legacy_opts_show:1;
 	bool syncfs_capable:1;
 	enum fuse_vdax_mode vdax_mode;
@@ -698,6 +699,15 @@ struct fuse_conn {
 	/** @no_force_umount: Do not allow MNT_FORCE umount */
 	unsigned int no_force_umount:1;
 
+	/**
+	 * @no_req_timeout: Do not enforce a request timeout
+	 *
+	 * Set by transports that cannot revoke a request once it has been
+	 * handed to the server, since the timeout is implemented by aborting
+	 * the connection.
+	 */
+	unsigned int no_req_timeout:1;
+
 	/** @auto_submounts: Auto-mount submounts announced by the server */
 	unsigned int auto_submounts:1;
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 1341b681d0ed..3c0a629cc2fe 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1451,7 +1451,8 @@ static void process_init_reply(struct fuse_args *args, int error)
 			fc->no_flock = 1;
 		}
 
-		fuse_init_server_timeout(fc->chan, timeout);
+		if (!fc->no_req_timeout)
+			fuse_init_server_timeout(fc->chan, timeout);
 
 		fm->sb->s_bdi->ra_pages =
 				min(fm->sb->s_bdi->ra_pages, ra_pages);
@@ -1502,8 +1503,9 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 		FUSE_HANDLE_KILLPRIV_V2 | FUSE_SETXATTR_EXT | FUSE_INIT_EXT |
 		FUSE_SECURITY_CTX | FUSE_CREATE_SUPP_GROUP |
 		FUSE_HAS_EXPIRE_ONLY | FUSE_DIRECT_IO_ALLOW_MMAP |
-		FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_ALLOW_IDMAP |
-		FUSE_REQUEST_TIMEOUT;
+		FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_ALLOW_IDMAP;
+	if (!fm->fc->no_req_timeout)
+		flags |= FUSE_REQUEST_TIMEOUT;
 #ifdef CONFIG_FUSE_VDAX
 	if (fm->fc->vdax)
 		flags |= FUSE_MAP_ALIGNMENT;
@@ -1820,6 +1822,7 @@ int fuse_fill_super_common(struct super_block *sb, struct fuse_fs_context *ctx)
 	fc->destroy = ctx->destroy;
 	fc->no_control = ctx->no_control;
 	fc->no_force_umount = ctx->no_force_umount;
+	fc->no_req_timeout = ctx->no_req_timeout;
 
 	err = -ENOMEM;
 	root = fuse_get_root_inode(sb, ctx->rootmode);
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index ef58bedc3941..c824916f0a9b 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -1592,6 +1592,13 @@ static inline void virtio_fs_ctx_set_defaults(struct fuse_fs_context *ctx)
 	ctx->destroy = true;
 	ctx->no_control = true;
 	ctx->no_force_umount = true;
+	/*
+	 * A request handed to the device stays referenced by the virtqueue
+	 * until the device completes it.  The request timeout works by
+	 * aborting the connection, which ends and frees such requests behind
+	 * the device's back, so it must not be enabled here.
+	 */
+	ctx->no_req_timeout = true;
 }
 
 static int virtio_fs_fill_super(struct super_block *sb, struct fs_context *fsc)
-- 
2.56.0

