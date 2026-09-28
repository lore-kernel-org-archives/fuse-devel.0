Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36C149EC63
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593351; cv=none; b=BTkoGGw/wPoZJq2M1WGuWsA1pAXvZvbmRq3M7fr84EniMpmq9xWrOQQm6gjIQqFWxmJ5BPoHGNwBVlIIsKfa+vqzoi7ecM5vD5X7Hh7QxWuoeTGp61y3bHSi0lSNI8qDkxgOy2nx5pYGhYAFqwIUhBPSBj0Ra1Wfld2wKJgcIe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593351; c=relaxed/simple;
	bh=rjevgJ/h/cyjgKleeo7cLrfBUklZzst5YrwaxBHr0HQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S11/VlesFROfDF4tkXjqMFjQsdvIkXWNETniRNeP//t88qOhi1Xq1G/IO12qLx0+7cUL4fw2Jt5n/ORcBJlt44K94ieF9zwVFSRG0jXGGdpkrXbhM6Ig8DoHzzxWAcxXsVp/FXVKQ3hmNODwZNzjOgKICSMF49zxKd908MoMpq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVEO6Lno; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVEO6Lno"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8498C4AF16;
	Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790593350;
	bh=rjevgJ/h/cyjgKleeo7cLrfBUklZzst5YrwaxBHr0HQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eVEO6Lno1I6og5KcTRGw69JMgoFKdlX6CsAOwMgQD00aNy3/YNv1zdUwMWLp3D82o
	 FJgzj+cJcAUezRQtlDATnu0P+hboimymR+FkkmsZav07awxwYcK4/ZwTKAiEETLbfe
	 gMBpOhWgtW9pirQwG/+jV1uRBHkvWR2VlJpcFI6NFOUYLx9sNVI0TTN5uUbJBXyN5K
	 CG/1J1Lqa3Tx6vAGtre+Sst78O+zRwQTTznc8v4PfZ/IheiTQH0T/zwZlOw9cfIp0k
	 jV0SjqYQbxCAAJ/p2gHCVn2jdHIWOpeb75QEJWUd1dkWT5MBSxIKQFzAHyzz2yi3gq
	 vqceGLZR1H93g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72E2C9833F;
	Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 28 Sep 2026 13:02:13 +0200
Subject: [PATCH v2 11/14] test: run mkfs.ext4 through the service examples
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-mount-service-bound-open-v2-11-0f9f501d05ce@bsbernd.com>
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
In-Reply-To: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=5522; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=c2pP9xuM/Ddoz+3tXD3ARDn8QDCIT3tA+o4idGir2CU=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJ2eTrVCsnyyYuF/4j6bGsZrcTqLmgfwS279WPhVc0zG
 RqKBz06SlkYxDgYZMUUWbok9thO+ccnq/Z1/XWYOaxMIEMYuDgFYCKRnxgZekr0TI6EVhT+uytt
 uOLEwQnNxhOXZQU8WrtYoy9RoejoNUaGPdLiV8oWrlA/euP8zHdJh8Q25whlXKnSsdxZPT9Tp3Q
 BAwA=
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

The byte comparison in the service example tests does not show that a
real filesystem tool works on the file service_ll and service_hl serve.
mkfs.ext4 -d writes a filesystem through the mount and copies in files
of different sizes. After umount, e2fsck checks the image and debugfs
reads the files back for comparison.

Assisted-by: LLM
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 example/service_ll.c                |  5 +++
 test/cases/lib/service-example.sh   | 68 ++++++++++++++++++++++++++++++++-----
 test/cases/mount/service-hl-mkfs.sh |  8 +++++
 test/cases/mount/service-ll-mkfs.sh |  8 +++++
 4 files changed, 80 insertions(+), 9 deletions(-)

diff --git a/example/service_ll.c b/example/service_ll.c
index fd43c40fc15b..7baf47905a33 100644
--- a/example/service_ll.c
+++ b/example/service_ll.c
@@ -43,6 +43,11 @@
  *
  *     mount -t fuse.service_ll /dev/sda /mnt
  *
+ * /mnt/single_file then holds the bytes of /dev/sda, so a filesystem can be
+ * created on it:
+ *
+ *     mkfs.ext4 /mnt/single_file
+ *
  * ## Source code ##
  * \include service_ll.c
  * \include service_ll.socket
diff --git a/test/cases/lib/service-example.sh b/test/cases/lib/service-example.sh
index 878b379b8b16..c45718aeef20 100644
--- a/test/cases/lib/service-example.sh
+++ b/test/cases/lib/service-example.sh
@@ -1,15 +1,20 @@
 # lib/service-example.sh - body for the service_ll / service_hl cases.
 #
-# Caller sets FS_NAME and LAUNCH before sourcing:
+# Caller sets FS_NAME and LAUNCH, and optionally CHECK, before sourcing:
 #   FS_NAME   service_ll | service_hl
 #   LAUNCH    fuservicemount3 | mount_fuse
+#   CHECK     bytes (default) | mkfs
 #
-# The file the example serves has to read back as the image, and what is
-# written through the mount has to reach the image.
+# bytes: the file the example serves has to read back as the image, and what
+# is written through the mount has to reach the image.
+# mkfs: mkfs.ext4 -d on that file has to leave an image e2fsck accepts. The
+# files it copied in have to read back unchanged from the image.
 
 _fuse_no_mount_needed=1
 . "$TEST_LIB/common.sh"
 
+CHECK=${CHECK:-bytes}
+
 # Before the gates: a misspelled FS_NAME would otherwise skip as "not built"
 case ${FS_NAME:-} in
 service_ll | service_hl) ;;
@@ -19,6 +24,10 @@ case ${LAUNCH:-} in
 fuservicemount3 | mount_fuse) ;;
 *) _fail "unknown LAUNCH '${LAUNCH:-}'" ;;
 esac
+case $CHECK in
+bytes | mkfs) ;;
+*) _fail "unknown CHECK '$CHECK'" ;;
+esac
 
 _require_linux "fuservicemount3"
 _require_root
@@ -26,6 +35,11 @@ _require_fuse_device
 _require_binary util/fuservicemount3
 _require_binary "example/$FS_NAME"
 [ "$LAUNCH" != mount_fuse ] || _require_binary util/mount.fuse3
+if [ "$CHECK" = mkfs ]; then
+	_require_prog mkfs.ext4
+	_require_prog e2fsck
+	_require_prog debugfs
+fi
 
 . "$TEST_LIB/service.sh"
 
@@ -33,11 +47,25 @@ service_setup "test-$FS_NAME-$$"
 img=$TEST_SRC/img
 old=$TEST_TMP/old
 new=$TEST_TMP/new
+files=$TEST_TMP/files
+dump=$TEST_TMP/dump
 
 # The size has to be a multiple of the page size
-head -c 1048576 /dev/urandom >"$old"
-head -c 1048576 /dev/urandom >"$new"
-cp "$old" "$img"
+case $CHECK in
+bytes)
+	head -c 1048576 /dev/urandom >"$old"
+	head -c 1048576 /dev/urandom >"$new"
+	cp "$old" "$img"
+	;;
+mkfs)
+	truncate -s 64M "$img"
+	mkdir -p "$files/sub"
+	for size in 0 1 4095 4096 4097 65537 1048576; do
+		head -c "$size" /dev/urandom >"$files/f$size"
+	done
+	echo hello >"$files/sub/small"
+	;;
+esac
 
 service_start "$TEST_LOGDIR/fs-$FS_NAME.out" "$FUSE_EXAMPLE_DIR/$FS_NAME"
 case $LAUNCH in
@@ -53,10 +81,32 @@ mount_fuse)
 esac
 
 _assert_fstype "$TEST_MNT" "fuse.$service_subtype" fuse
-_assert_file_eq "$TEST_MNT/single_file" "$old"
-dd if="$new" of="$TEST_MNT/single_file" bs=64k conv=notrunc,fsync status=none
+case $CHECK in
+bytes)
+	_assert_file_eq "$TEST_MNT/single_file" "$old"
+	dd if="$new" of="$TEST_MNT/single_file" bs=64k conv=notrunc,fsync \
+		status=none
+	;;
+mkfs)
+	# -F: single_file is a regular file, not a block device
+	mkfs.ext4 -F -q -d "$files" "$TEST_MNT/single_file" ||
+		_fail "mkfs.ext4 through $FS_NAME failed"
+	;;
+esac
 
 umount "$TEST_MNT"
 service_wait_exit
 _assert_eq "$service_rc" 0 "$FS_NAME exit status"
-_assert_file_eq "$img" "$new"
+case $CHECK in
+bytes)
+	_assert_file_eq "$img" "$new"
+	;;
+mkfs)
+	e2fsck -fn "$img" || _fail "e2fsck found errors in $img"
+	# debugfs exits 0 even when rdump fails, so diff is the check
+	mkdir "$dump"
+	debugfs -R "rdump / $dump" "$img"
+	diff -r -x lost+found "$files" "$dump" ||
+		_fail "files in $img differ from $files"
+	;;
+esac
diff --git a/test/cases/mount/service-hl-mkfs.sh b/test/cases/mount/service-hl-mkfs.sh
new file mode 100755
index 000000000000..af552818cd90
--- /dev/null
+++ b/test/cases/mount/service-hl-mkfs.sh
@@ -0,0 +1,8 @@
+#!/usr/bin/env bash
+# GROUP: mount
+
+FS_NAME=service_hl
+LAUNCH=fuservicemount3
+CHECK=mkfs
+
+. "$TEST_LIB/service-example.sh"
diff --git a/test/cases/mount/service-ll-mkfs.sh b/test/cases/mount/service-ll-mkfs.sh
new file mode 100755
index 000000000000..9908937010de
--- /dev/null
+++ b/test/cases/mount/service-ll-mkfs.sh
@@ -0,0 +1,8 @@
+#!/usr/bin/env bash
+# GROUP: mount
+
+FS_NAME=service_ll
+LAUNCH=fuservicemount3
+CHECK=mkfs
+
+. "$TEST_LIB/service-example.sh"

-- 
2.53.0


