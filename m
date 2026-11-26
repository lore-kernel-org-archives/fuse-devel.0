Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704450;
	b=mJXPfri+5zXvN4l46kcoUmKDfjK6VNj0+om8lS1hz0WJ/1X3pfJG4expq8w+b2Lqkewg
	 4wDYQrmI3ReIlmPWynAIdPsYXCbV0JBJYuFYgJIRIvXI8v8I0SZ2MPBKYDicYlNqwEfpB
	 96K09zfdSskB/8aHwt0PedsVjhcRp7qDsLGUBlehxcxTYkB+vVZ9bJzCyE7dMXsFjDvOc
	 UnDsrV/emSkWS5lsL9GpgB2CGwiTDMryu9kzsU1iGItHBRqhw6DAUq/MNN9JUGFqbN5J0
	 JBHa6vXzeICpYQ8NB4vOq1lB63Fw5rEyQn1pRUBApepVDelaWe9kH2Oh3QedJDWbc0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704450;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=YMtn23cPSjwohaR+qdTwIVB0MrBuoBWTZnklOfs8KQw=;
	b=H3bKk1K9aoBhSJwPgY2JSG8F7EzMWBcFX97Fubp1fT5mhVk3eoGyEjWZRbEWqY6RGyuQ
	 S6HvZ50LIsU7mwCqr56e9eLbb9MqAt+o35oSUFc+nwlFi+vtldO9Kcl2GhbFJN9ExYvT7
	 k1mSZTPAYRxl/c27mAsrryDKTRGOcXEA37nZgfp/WSeO30d5Mes5Ixhsc4fN2FpnHcD87
	 HGvfMtS7OCobfiatINHFYYa+cycw/dR+L3uskqFSjwmgEUzIIh2d82n0W58QbtPJPq3Rj
	 dae6TMOPicrRUgkeGVnG1FyQBG/CTDosJ1ATl9E6rFEHzNH16FdJVh0mAIxCcEZ64qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yyj9hibV;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FB0606A32D
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 14:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3FB0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yyj9hibV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795704449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMtn23cPSjwohaR+qdTwIVB0MrBuoBWTZnklOfs8KQw=;
	b=Yyj9hibV5/FxtHP0zPP8EoicH7UMRsb7XySl3mpqNq6ev4tHOZAivq04Yts2D37+VaUMzS
	Pumn3l3UdrJWHOs4UqXulXCWhEW6OKUTl0rCgWRdLs7cSq3SpslCaCshVRobugbMMFAni5
	jbx0giFz72cFf2q2U+I54HxFMVia+qE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-qMlYH-0_P1-54oT-RT3Syw-1; Thu, 26 Nov 2026 14:47:27 +0000
X-MC-Unique: qMlYH-0_P1-54oT-RT3Syw-1
X-Mimecast-MFC-AGG-ID: qMlYH-0_P1-54oT-RT3Syw_1795704446
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a4654add56so48666875e9.2
        for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 06:47:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704446; x=1796309246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YMtn23cPSjwohaR+qdTwIVB0MrBuoBWTZnklOfs8KQw=;
        b=totSX6qx1GUR86k8ZA5G16kxPaCHKEUDZfHwZ1cmV4s+zwur6/SZHhZiYZQLStqYfF
         +S39NafbslHqg2FQc+6T2iWDJl9SLXEyHC7MBVp7OqoNXQkTZhP/IU9igzn48XZeH++c
         IzH4s0l/O1WwlX4v0N17qdV7+85E5VqQaaQvvit+rG9ChSc7S8foYYh6nnui+YXN3583
         R3ViEVYztb2ZQhP2uKPEYoVxhDQ0Ff/m8vSSVSF5kASKVEtkxN2M7GwRO2ASoK62Khtv
         ta2mpZ4sJuStcWoKCnA8JepmUc4wJMHvG6uOmwaP6cklT+n2gPsTynWn3GZ2CzlretCT
         k+/A==
X-Gm-Message-State: APuU4Z8NasD1VCWDCvyo1GgprCuxZA52hIcaCLHM3Y0fSTTtXcB2gT54
	cT0ADFdLHBANdfZQaoO3ZeLzcGGneTgX9Qr4vmqOL3mtnwc2vVo4q7pw/uQXY+nr8DRfE0hWoGN
	iR1pwgo07apdkLbrOb+6+zRzsUp4127H4gc7yzXyBucxlSbt5zl6xsd76Japmez/oH/2KK5173X
	Fl04ti2zTtvDOljMrg1gu1lXycAL/Bz5JC2qdh9nAWTcTkACU=
X-Gm-Gg: AZFdTZehqVpz0YofN3CgLp21armSY+xdthx2hrrc58e5F+yekO6E0cIMuVkOoep26C4
	rF3cwSFcoRoFRlDy0pBZBdfjv6VO3AU2Yy+abNnXxfIHPuvZ2d9X/zbsxT+OJsk1tLEbR0cgiwX
	gdOChepXFNmpxtR/nwYqv9zomrFaf+UM8QtrRw+iMelRUFN1kAzgR8OlR8WzeNYrU0biwigQ7wJ
	BhWtgjmVKT3Fga4tc21fAnz6AWvInKcHoLl0xFaUOq5CkBOJN4nSJ2SAiMc2VAFULC1m12lwt0Q
	7dH9pmLuyUwMncvSt9k+V3g6ZDSK5HfQXKKAxD+K2LFG9gTRwRlK7MN3b+l+tRo2pWDGd87iaiZ
	y5t7tj9y988p6mx0WbuVik/Ko5rF9qF+ivSYHMnc60WYePY01yQWqLt9QVL6nTygLVqgt23GViP
	l34GUOsQaGk2JHYduAcLiv4h0ASmwpGCjVL4ldf93v
X-Received: by 2002:a05:600c:848d:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4bb88811da9mr444341835e9.13.1795704446414;
        Thu, 26 Nov 2026 06:47:26 -0800 (PST)
X-Received: by 2002:a05:600c:848d:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4bb88811da9mr444341335e9.13.1795704445882;
        Thu, 26 Nov 2026 06:47:25 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (193-226-214-34.pool.digikabel.hu. [193.226.214.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm388114905e9.0.2026.11.26.06.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:47:25 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	virtualization@lists.linux.dev
Cc: Li Wang <liwang@kylinos.cn>,
	German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 5/5] virtiofs: fix forget leak on submount unmount
Date: Thu, 26 Nov 2026 15:47:18 +0100
Message-ID: <20261126144719.232329-5-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126144719.232329-1-mszeredi@redhat.com>
References: <20261126144719.232329-1-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: a0EkSbWq6b3FHUorS_gUfZGzZ-EZkdKA8wdZfIDraM8_1795704446
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

generic_shutdown_super() clears SB_ACTIVE before calling evict_inodes(),
so fuse_evict_inode() skipped both the FUSE_FORGET for fi->nlookup and
fuse_cleanup_submount_lookup() for every remaining inode.

For a full unmount that is mostly fine: FUSE_DESTROY has already told the
server to drop everything.  But a submount unmount takes the same path
with the connection still alive: fuse_mount_remove() returns false, so
fuse_conn_destroy() is not called and no FUSE_DESTROY is sent.  The
server then keeps the lookup count of every inode of the submount for the
lifetime of the connection, which can be arbitrarily long if the parent
mount stays around and submounts come and go.

fuse_submount_lookup is worse, because it is freed nowhere else: the
object and its embedded forget are leaked on any unmount, including a
full one, for every inode that has one.

Queue both regardless of SB_ACTIVE.  This is safe on the paths where the
connection is already gone: both fuse_dev_queue_forget() and
virtio_fs_send_forget() just free the link when the queue is
disconnected, and fc->chan stays valid until fuse_free_conn(), well after
evict_inodes().

Fixes: c4d361f66ac9 ("fuse: share lookup state between submount and its parent")
Cc: <stable@vger.kernel.org>
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/inode.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 344fcb55a64b..81ee6c96203c 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -141,6 +141,7 @@ static void fuse_cleanup_submount_lookup(struct fuse_conn *fc,
 static void fuse_evict_inode(struct inode *inode)
 {
 	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct fuse_conn *fc = get_fuse_conn(inode);
 
 	/* Will write inode on close/munmap and in all other dirtiers */
 	WARN_ON(inode_state_read_once(inode) & I_DIRTY_INODE);
@@ -157,19 +158,27 @@ static void fuse_evict_inode(struct inode *inode)
 	 */
 	if (FUSE_IS_VDAX(inode))
 		fuse_vdax_inode_cleanup(inode);
-	if (inode->i_sb->s_flags & SB_ACTIVE) {
-		struct fuse_conn *fc = get_fuse_conn(inode);
+	/*
+	 * Must be done unconditionally as well: on a submount unmount the
+	 * connection stays alive and no FUSE_DESTROY is sent, so without
+	 * this the server keeps the lookup counts of every inode in the
+	 * submount for the lifetime of the connection.  The
+	 * fuse_submount_lookup object is freed nowhere else, so skipping it
+	 * leaks that too.  If the connection is already gone (full unmount,
+	 * failed mount) fuse_chan_queue_forget() just frees the forget.
+	 */
+	if (fi->nlookup) {
+		fuse_chan_queue_forget(fc->chan, fi->forget, fi->nodeid,
+				       fi->nlookup);
+		fi->forget = NULL;
+	}
 
-		if (fi->nlookup) {
-			fuse_chan_queue_forget(fc->chan, fi->forget, fi->nodeid,
-					       fi->nlookup);
-			fi->forget = NULL;
-		}
+	if (fi->submount_lookup) {
+		fuse_cleanup_submount_lookup(fc, fi->submount_lookup);
+		fi->submount_lookup = NULL;
+	}
 
-		if (fi->submount_lookup) {
-			fuse_cleanup_submount_lookup(fc, fi->submount_lookup);
-			fi->submount_lookup = NULL;
-		}
+	if (inode->i_sb->s_flags & SB_ACTIVE) {
 		/*
 		 * Evict of non-deleted inode may race with outstanding
 		 * LOOKUP/READDIRPLUS requests and result in inconsistency when
-- 
2.56.1

