Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1953B4D98F9
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775890; cv=none; b=TM+cf4DHCRPvi3zbLcTm/TnBq4o46VIwmDPpuGxxqOaPkKyHYuj9OZuTJoKv9lIHJ1S4qYG+F/0lrljdH+ceiYOxqeYlBemTtRWItuixhjEz1XSNXAihZxtu3Spett0lBGQycnuJlyYF5rlr6Fbo3oTcwx2lXZFWP/SA2Zf18BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775890; c=relaxed/simple;
	bh=5zgItYW4e0eFCaaAxO0NVI4FxV76ehRMY2n90IdFoG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ecHwacihj6lxCCuBnuKVmT5NCA2Q48g7lpSIVmUtAVsHCt6V35b+8KTBT6D7sFtIp01Yf5p7hWEtji1I8uMmpKxC0TPFR+0wL/zmeVgh26Ppim0FzdLftS23dlwDIhTmnZcLNO3oNb8T1rh79EL97Fzs3nTIfx60soN8/9rfdxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgY+ZIF3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgY+ZIF3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79794C4AF0B;
	Wed, 30 Sep 2026 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790775887;
	bh=5zgItYW4e0eFCaaAxO0NVI4FxV76ehRMY2n90IdFoG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GgY+ZIF32B8EeWe3Yutur9cjeDM9+KyK2MVmL7qaYFZboHQMPJj53EOh49O7bve+a
	 aCSdf4PkYkb8VY5gUMM/kCv4bfahoebj3aO6PRv+mcUeTHINtFVIb2kpX6TZWkSSqa
	 ziBk0WdQmjMoqg0Wox7P38CJMsZOq2pTTYCPdfmp66MJxRj61X/AzKunXK2QkQro3t
	 N39Kebqr/vV4hdAIRF3Nbq+DCpxpm1M6pwtlvtW6likyafet42wm1X4GfCFdcB4dKR
	 j2nkfxUkzAZKik11Bhya51sA1eTTFIArWiiAYEukbOEaV6aLeUToPOYKKymMrX5dDH
	 DVOMcUVBmV85Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A65FCA5FAC;
	Wed, 30 Sep 2026 13:44:47 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Wed, 30 Sep 2026 15:44:34 +0200
Subject: [PATCH 2/4] mount_service: mount via the shared fsmount helper
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mount-service-use-mount-fsmount-v1-2-d585598896ee@bsbernd.com>
References: <20260930-mount-service-use-mount-fsmount-v1-0-d585598896ee@bsbernd.com>
In-Reply-To: <20260930-mount-service-use-mount-fsmount-v1-0-d585598896ee@bsbernd.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: neal@gompa.dev, fuse-devel@lists.linux.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=3629; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=gfyNbXvKRw52UA8okVviA6cTtinT36ncLu1xhr7uXT0=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLL2CvlsZ/j0fD6j+OtS3lYp8Tcuv//vXbTMdV3Q5stxD
 KLfRXuTOkpZGMQ4GGTFFFm6JPbYTvnHJ6v2df11mDmsTCBDGLg4BWAi7wUYGe4UrsheJuRppa9q
 qM3drT5lyn7r3L2s39cWeKwJPsHCV8LwP+7KrVOnL92Tkw9V2pWamDQ9ZV1srNPWdfWXmLdc3Za
 XzwQA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

util/mount_service.c issued FSCONFIG_CMD_CREATE, fsmount() and
move_mount() itself, with the same FSMOUNT_CLOEXEC and
MOVE_MOUNT_*_EMPTY_PATH flags as lib/mount_fsmount.c. Both mount the
same filesystem, so a flag changed in one copy silently diverges.

mount_service.c also called the libc names fsconfig(), fsmount() and
move_mount() directly. HAVE_NEW_MOUNT_API only checks that the headers
declare these functions, not that libc exports them. On a system where
NEED_NEW_MOUNT_API_SYSCALL_WRAPPERS is also set (glibc older than
2.36), lib/mount_fsmount.c works around the missing symbols through
its fuse_-prefixed static inline wrappers, which mount_service.c had
no access to; calling the bare libc names left it with a declaration
to compile against but no symbol to link against.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 util/mount_service.c | 49 ++++++++++++-------------------------------------
 1 file changed, 12 insertions(+), 37 deletions(-)

diff --git a/util/mount_service.c b/util/mount_service.c
index 0b3266309a8a..dcdc26df1db4 100644
--- a/util/mount_service.c
+++ b/util/mount_service.c
@@ -28,11 +28,6 @@
 #include <sys/ioctl.h>
 #include <linux/fs.h>
 
-#ifdef HAVE_NEW_MOUNT_API
-#include <sys/mount.h>
-#include <linux/mount.h>
-#endif
-
 #include "mount_util.h"
 #include "util.h"
 #include "fuse_i.h"
@@ -1439,63 +1434,45 @@ static int mount_service_fsopen_mount(struct mount_service *mo,
 			return FUSE_MOUNT_FALLBACK_NEEDED;
 
 		error = -ret;
-		goto fail_fsconfig;
+		goto fail_mount;
 	}
 
 	snprintf(tmp, sizeof(tmp), "%i", mo->fusedevfd);
 	ret = apply_fsconfig_opt_fd(mo->fsopenfd, tmp);
 	if (ret < 0) {
 		error = -ret;
-		goto fail_fsconfig;
+		goto fail_mount;
 	}
 
 	snprintf(tmp, sizeof(tmp), "%o", stbuf->st_mode & S_IFMT);
 	ret = apply_fsconfig_opt_string(mo->fsopenfd, "rootmode", tmp);
 	if (ret < 0) {
 		error = -ret;
-		goto fail_fsconfig;
+		goto fail_mount;
 	}
 
 	snprintf(tmp, sizeof(tmp), "%u", getuid());
 	ret = apply_fsconfig_opt_string(mo->fsopenfd, "user_id", tmp);
 	if (ret < 0) {
 		error = -ret;
-		goto fail_fsconfig;
+		goto fail_mount;
 	}
 
 	snprintf(tmp, sizeof(tmp), "%u", getgid());
 	ret = apply_fsconfig_opt_string(mo->fsopenfd, "group_id", tmp);
 	if (ret < 0) {
 		error = -ret;
-		goto fail_fsconfig;
-	}
-
-	ret = fsconfig(mo->fsopenfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0);
-	if (ret) {
-		error = errno;
-		fprintf(stderr, "%s: creating filesystem: %s\n",
-			mo->msgtag, strerror(error));
-		goto fail_fsconfig;
-	}
-
-	mfd = fsmount(mo->fsopenfd, FSMOUNT_CLOEXEC, attr_flags);
-	if (mfd < 0) {
-		error = errno;
-		fprintf(stderr, "%s: fsmount: %s\n",
-			mo->msgtag, strerror(error));
-		goto fail_fsconfig;
-	}
-
-	ret = move_mount(mfd, "", mo->mountfd, "",
-			 MOVE_MOUNT_F_EMPTY_PATH | MOVE_MOUNT_T_EMPTY_PATH);
-	close(mfd);
-	if (ret) {
-		error = errno;
-		fprintf(stderr, "%s: move_mount: %s\n",
-			mo->msgtag, strerror(error));
 		goto fail_mount;
 	}
 
+	ret = fuse_fsmount_create_and_move(mo->fsopenfd, attr_flags,
+					   mo->mountfd, NULL, &mfd);
+	if (ret < 0) {
+		error = -ret;
+		goto fail_mount;
+	}
+	close(mfd);
+
 	/*
 	 * The mount succeeded, so we send a positive reply even if the mtab
 	 * update fails.
@@ -1515,8 +1492,6 @@ static int mount_service_fsopen_mount(struct mount_service *mo,
 	mo->mounted = true;
 	return mount_service_send_reply(mo, 0);
 
-fail_fsconfig:
-	log_fsconfig_kmsg(mo->fsopenfd);
 fail_mount:
 	return mount_service_send_reply(mo, error);
 }

-- 
2.53.0


