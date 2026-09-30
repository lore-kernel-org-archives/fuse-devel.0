Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28C54F3923
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775888; cv=none; b=d86jHbSRAnRMq9I4jgVj5BOPUjmesBjEeBw0eVoqxHHW+cIwXFS95I+LHLrwujvY0AzcrREi88yCmD7isk5PoSK9IZmzUcd0yATZBu9PJwK7s8mVKsgXKRWG6YbKXomxNFZN/r/2gVVo7o17MtriEC5qJdr8XkW4ON4PZRSqU7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775888; c=relaxed/simple;
	bh=P9RC4PMsdxtELej1bpbBAZ9X5LlnXNmloGOGPLJyv+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Go6QXEYynvFvGclSJA3lDkCq+sThAch3pp8M/Et6SwIvaHCcfg8iJ5DIy0Xvr4JacRaQaqlgHA5v/2ZjgZ3WC0GwV4HvjzN+rE3KoU78OeQsYsxzoIiaZIRDzeXgY9Lpxjd4ZCGvEJndmD9TxMDHjhSUkosisb68eav++YvDuRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EidfvkFO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EidfvkFO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68AC4C4AF14;
	Wed, 30 Sep 2026 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790775887;
	bh=P9RC4PMsdxtELej1bpbBAZ9X5LlnXNmloGOGPLJyv+s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EidfvkFOvlXVEwspSmuXtcy/pqtwHuHmto9r+r88l1lQWz/u6KTO7lO29473rbnhy
	 Fwfvp7+F7vEgIGSnfZrhLSygu+DDtxzvsjdE73HuDLCa3o7MoSH76iS49w7u/kKzUQ
	 N38D2SAdBgHRPKKP+GBiluYEvD/wpNPsAcXwweox3yBDDBYwMgxiMd73c9wNHxL1iJ
	 2CHqfZHQTimHge3Phwzy4g7yw9OlbVtDYk7ewpekDNJbYfJ3d4/grHqt0W9BXe1GPZ
	 lK1grbXULD5lTYSCsRrimiN1m3VKrzrLYuBLzId2cbs3TzYLja7lBqOLFmkwAIo4O5
	 /r5fnUJyIPD6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491EECA5FC5;
	Wed, 30 Sep 2026 13:44:47 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Wed, 30 Sep 2026 15:44:33 +0200
Subject: [PATCH 1/4] mount_fsmount: split superblock creation and
 move_mount into a helper
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mount-service-use-mount-fsmount-v1-1-d585598896ee@bsbernd.com>
References: <20260930-mount-service-use-mount-fsmount-v1-0-d585598896ee@bsbernd.com>
In-Reply-To: <20260930-mount-service-use-mount-fsmount-v1-0-d585598896ee@bsbernd.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: neal@gompa.dev, fuse-devel@lists.linux.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=5634; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=xzRxuwa63Vh0hWGAVlL/J9Afa2FZo54hNpLnXTUqna0=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLL2Cvnw/1Ps434x0aYkw/iARm5WYZLw8qWFMeZ/Nb6k/
 Qsp2xPfUcrCIMbBICumyNIlscd2yj8+WbWv66/DzGFlAhnCwMUpABNRM2T4p7PF75REwgvpp3H5
 D+8/YshneikcK9+X7hYmz3jxUnvhG4a/cvfkNWNkLV8qzFp91aD14ZV0RXcRhi9Keqr8T1XzvJL
 ZAQ==
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

This is a preparation patch. fuse_kern_fsmount() ran fsconfig
CREATE, fsmount() and move_mount() inline. A later commit will make
mount_service.c call the same three calls after it has run FSOPEN,
SOURCE and MNTOPTS itself, so this moves them into
fuse_fsmount_create_and_move(). The fsopen fd stays owned by the
caller, because mount_service.c will close mo->fsopenfd itself
later.

fuse_kern_fsmount() now converts MS_* flags before calling the
helper, so unsupported flags are caught before the superblock is
created, not after.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 lib/mount_fsmount.c | 86 +++++++++++++++++++++++++++++++----------------------
 lib/mount_i_linux.h | 18 +++++++++++
 2 files changed, 69 insertions(+), 35 deletions(-)

diff --git a/lib/mount_fsmount.c b/lib/mount_fsmount.c
index b2d0453e5c93..0b1fd4300d2d 100644
--- a/lib/mount_fsmount.c
+++ b/lib/mount_fsmount.c
@@ -489,6 +489,53 @@ void fuse_kern_umount_mountfd(int mountfd)
 	}
 }
 
+int fuse_fsmount_create_and_move(int fsfd, unsigned int mount_attrs,
+				 int dest_mnt_fd, const char *dest_path,
+				 int *mountfd_out)
+{
+	int mountfd;
+	int res;
+
+	res = fuse_fsconfig(fsfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0);
+	if (res == -1) {
+		int save_errno = errno;
+
+		log_fsconfig_kmsg(fsfd);
+		fuse_log(FUSE_LOG_ERR, "fuse: fsconfig CREATE failed: %s\n",
+			 strerror(save_errno));
+		return -save_errno;
+	}
+
+	mountfd = fuse_fsmount(fsfd, FSMOUNT_CLOEXEC, mount_attrs);
+	if (mountfd == -1) {
+		int save_errno = errno;
+
+		log_fsconfig_kmsg(fsfd);
+		fuse_log(FUSE_LOG_ERR, "fuse: fsmount failed: %s\n",
+			 strerror(save_errno));
+		return -save_errno;
+	}
+
+	if (dest_mnt_fd >= 0)
+		res = fuse_move_mount(mountfd, "", dest_mnt_fd, "",
+				      MOVE_MOUNT_F_EMPTY_PATH |
+					      MOVE_MOUNT_T_EMPTY_PATH);
+	else
+		res = fuse_move_mount(mountfd, "", AT_FDCWD, dest_path,
+				      MOVE_MOUNT_F_EMPTY_PATH);
+	if (res == -1) {
+		int save_errno = errno;
+
+		fuse_log(FUSE_LOG_ERR, "fuse: move_mount failed: %s\n",
+			 strerror(save_errno));
+		close(mountfd);
+		return -save_errno;
+	}
+
+	*mountfd_out = mountfd;
+	return 0;
+}
+
 int fuse_kern_fsmount(const char *mnt, int dest_mnt_fd, unsigned long flags,
 		      int blkdev, const char *fsname, const char *subtype,
 		      const char *source_dev, const char *kernel_opts,
@@ -584,16 +631,6 @@ int fuse_kern_fsmount(const char *mnt, int dest_mnt_fd, unsigned long flags,
 		goto out_free;
 	}
 
-	/* Create the filesystem instance */
-	res = fuse_fsconfig(fsfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0);
-	if (res == -1) {
-		err = -errno;
-		log_fsconfig_kmsg(fsfd);
-		fuse_log(FUSE_LOG_ERR, "fuse: fsconfig CREATE failed: %s\n",
-			 strerror(errno));
-		goto out_free;
-	}
-
 	/* Convert MS_* flags to MOUNT_ATTR_* for fsmount() */
 	flags = ms_flags_to_mount_attrs(flags, &mount_attrs);
 	if (flags != 0) {
@@ -602,33 +639,14 @@ int fuse_kern_fsmount(const char *mnt, int dest_mnt_fd, unsigned long flags,
 		goto out_free;
 	}
 
-	/* Create mount object with mount attributes */
-	mountfd = fuse_fsmount(fsfd, FSMOUNT_CLOEXEC, mount_attrs);
-	if (mountfd == -1) {
-		err = -errno;
-		log_fsconfig_kmsg(fsfd);
-		fuse_log(FUSE_LOG_ERR, "fuse: fsmount failed: %s\n",
-			 strerror(errno));
+	err = fuse_fsmount_create_and_move(fsfd, mount_attrs, dest_mnt_fd, mnt,
+					   &mountfd);
+	if (err)
 		goto out_free;
-	}
 
 	close(fsfd);
 	fsfd = -1;
 
-	if (dest_mnt_fd >= 0)
-		res = fuse_move_mount(mountfd, "", dest_mnt_fd, "",
-				 MOVE_MOUNT_F_EMPTY_PATH |
-					 MOVE_MOUNT_T_EMPTY_PATH);
-	else
-		res = fuse_move_mount(mountfd, "", AT_FDCWD, mnt,
-				 MOVE_MOUNT_F_EMPTY_PATH);
-	if (res == -1) {
-		err = -errno;
-		fuse_log(FUSE_LOG_ERR, "fuse: move_mount failed: %s\n",
-			 strerror(errno));
-		goto out_close_mntfd;
-	}
-
 	res = fuse_mnt_add_mount_helper(mnt, source, type, mtab_opts);
 	if (res == -1) {
 		err = -EIO;
@@ -645,9 +663,7 @@ int fuse_kern_fsmount(const char *mnt, int dest_mnt_fd, unsigned long flags,
 
 out_umount:
 	fuse_kern_umount_mountfd(mountfd);
-out_close_mntfd:
-	if (mountfd != -1)
-		close(mountfd);
+	close(mountfd);
 out_free:
 	free(source);
 	free(type);
diff --git a/lib/mount_i_linux.h b/lib/mount_i_linux.h
index 8cf7ff4532c6..35bb54c82236 100644
--- a/lib/mount_i_linux.h
+++ b/lib/mount_i_linux.h
@@ -86,6 +86,24 @@ int fuse_kern_fsmount(const char *mnt, int mnt_fd, unsigned long flags,
 int fuse_kern_fsmount_mo(const char *mnt, const struct mount_opts *mo,
 			 const char *mtab_opts, int *mountfd_out);
 
+/**
+ * Create the superblock and attach the resulting mount to a destination.
+ *
+ * The fsopen fd stays owned by the caller - a caller that keeps it in
+ * long-lived state must not be left with a descriptor closed behind its back.
+ *
+ * @fsfd fsopen fd, fully configured
+ * @mount_attrs MOUNT_ATTR_* flags, from ms_flags_to_mount_attrs()
+ * @dest_mnt_fd pre-resolved destination fd, or -1 to use @dest_path
+ * @dest_path destination path, used only when @dest_mnt_fd is -1
+ * @mountfd_out on success receives the fsmount() fd, to be closed by the
+ *              caller and usable for fuse_kern_umount_mountfd()
+ * @return 0 on success, negative error code on failure
+ */
+int fuse_fsmount_create_and_move(int fsfd, unsigned int mount_attrs,
+				 int dest_mnt_fd, const char *dest_path,
+				 int *mountfd_out);
+
 /**
  * Unmount (lazily) the mount @mountfd was created for, without a path lookup.
  *

-- 
2.53.0


