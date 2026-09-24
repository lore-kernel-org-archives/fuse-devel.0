Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD443E3C4D
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288618; cv=none; b=ri2nQ+ES527YuMqVauHRB8vZ0OUEVIwKAuaM0tcW19WkVFHXq/QW/xomwNHMJ83rHe/HvXdCTPA6qkIfFt+RjSz58i15ijkGNur+VROBNFJkY++7P064qR87Er1zal8iQjcNKr0iPLoq6XBnKxAdJGdFmnbdEDe25fH2DD6s7sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288618; c=relaxed/simple;
	bh=b2R7VlvNjCM30MwhrN+rnnAfXHpZk6UyOxf+7EZLUlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nMNru4j9s4QD1DDC4AyRsJtTG7uIi2asMu/zTtyqaL1GCCc2HorUsLOHfAikCotJLVhXvOq2d40xz0o3Js+WxH3x0SLmBVOVWnD2iVO2D+r++6Xwvc9WIaQ5DHf4apU9CNPz1HB/RD0hFxlV/QaNfyo4j9mR/eCjH9Uwqv3HEpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDQFo2uN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDQFo2uN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D300CC2BCB8;
	Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790288617;
	bh=b2R7VlvNjCM30MwhrN+rnnAfXHpZk6UyOxf+7EZLUlo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sDQFo2uNw+Ng4uyRgpBc+j0q1W6fa6FKg4fIxiUTINkUIFvoHWM/tEjOg4eJBwudT
	 L46lykuvi8wICJCgTSKZs+o3mILtqO80XzJ6+QV51I/r3UnrC3qmhKcxPKjf5PDLUC
	 fQlvWb3dvuIo8ZMkx5TJEVNPx9f6zJFecQeiZfdzoKV0Upsg+68M0mtEekmHRYGi+6
	 k0N2nG6qvu6ZwairrgDPWqYKHvmb6gm1fb9ymM1/lK6r2zzzMR6FqU44ZTauAqshEA
	 IL8cE3Rlt8PH33Ho2TghQLeN2/Mr9mxjnkFGkbCgtLgVAWAIjhM8YCEKmwQAov4I9X
	 7+da+UTZWXK5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D99C98325;
	Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 25 Sep 2026 00:23:37 +0200
Subject: [PATCH 09/10] test: mount the service examples through
 fuservicemount3
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mount-service-bound-open-v1-9-bbf1a84c7995@bsbernd.com>
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
In-Reply-To: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=5702; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=ZjVhclM5VaRPOhRsLbvxcnJ4p7C2UM1NZ48bT+7OZ0s=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLK2LnrGof3sf7vFvQVfz/Ate67Mc9V4crhUDafwgbJ9c
 sePKr3v7ShlYRDjYJAVU2TpkthjO+Ufn6za1/XXYeawMoEMYeDiFICJBKYw/DMSb4i47H2iM+rx
 X7nPejPTP6rLZJ6SP7mFd1GL/bO9W3kZGXobIkTySi4v2KhqfO19o+iu+St8F75UXe3LzjrjaF1
 vJjcA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

No test ran service_ll, service_hl or null in service mode. No test
checked that mount.fuse3 mounts through a listening service socket, and
runs the filesystem program when the socket refuses the connection.

Assisted-by: LLM
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 test/cases/lib/service-example.sh      | 62 ++++++++++++++++++++++++++++++++++
 test/cases/mount/service-hl.sh         |  7 ++++
 test/cases/mount/service-ll.sh         |  7 ++++
 test/cases/mount/service-mount-fuse.sh | 31 +++++++++++++++++
 test/cases/mount/service-null.sh       | 33 ++++++++++++++++++
 5 files changed, 140 insertions(+)

diff --git a/test/cases/lib/service-example.sh b/test/cases/lib/service-example.sh
new file mode 100644
index 000000000000..878b379b8b16
--- /dev/null
+++ b/test/cases/lib/service-example.sh
@@ -0,0 +1,62 @@
+# lib/service-example.sh - body for the service_ll / service_hl cases.
+#
+# Caller sets FS_NAME and LAUNCH before sourcing:
+#   FS_NAME   service_ll | service_hl
+#   LAUNCH    fuservicemount3 | mount_fuse
+#
+# The file the example serves has to read back as the image, and what is
+# written through the mount has to reach the image.
+
+_fuse_no_mount_needed=1
+. "$TEST_LIB/common.sh"
+
+# Before the gates: a misspelled FS_NAME would otherwise skip as "not built"
+case ${FS_NAME:-} in
+service_ll | service_hl) ;;
+*) _fail "unknown FS_NAME '${FS_NAME:-}'" ;;
+esac
+case ${LAUNCH:-} in
+fuservicemount3 | mount_fuse) ;;
+*) _fail "unknown LAUNCH '${LAUNCH:-}'" ;;
+esac
+
+_require_linux "fuservicemount3"
+_require_root
+_require_fuse_device
+_require_binary util/fuservicemount3
+_require_binary "example/$FS_NAME"
+[ "$LAUNCH" != mount_fuse ] || _require_binary util/mount.fuse3
+
+. "$TEST_LIB/service.sh"
+
+service_setup "test-$FS_NAME-$$"
+img=$TEST_SRC/img
+old=$TEST_TMP/old
+new=$TEST_TMP/new
+
+# The size has to be a multiple of the page size
+head -c 1048576 /dev/urandom >"$old"
+head -c 1048576 /dev/urandom >"$new"
+cp "$old" "$img"
+
+service_start "$TEST_LOGDIR/fs-$FS_NAME.out" "$FUSE_EXAMPLE_DIR/$FS_NAME"
+case $LAUNCH in
+fuservicemount3)
+	"$FUSE_UTIL_DIR/fuservicemount3" "$img" "$TEST_MNT" \
+		-t "fuse.$service_subtype" ||
+		_fail "fuservicemount3 did not mount $FS_NAME"
+	;;
+mount_fuse)
+	"$FUSE_UTIL_DIR/mount.fuse3" "$service_subtype#$img" "$TEST_MNT" ||
+		_fail "mount.fuse3 did not mount $FS_NAME"
+	;;
+esac
+
+_assert_fstype "$TEST_MNT" "fuse.$service_subtype" fuse
+_assert_file_eq "$TEST_MNT/single_file" "$old"
+dd if="$new" of="$TEST_MNT/single_file" bs=64k conv=notrunc,fsync status=none
+
+umount "$TEST_MNT"
+service_wait_exit
+_assert_eq "$service_rc" 0 "$FS_NAME exit status"
+_assert_file_eq "$img" "$new"
diff --git a/test/cases/mount/service-hl.sh b/test/cases/mount/service-hl.sh
new file mode 100755
index 000000000000..6db3add3a5d1
--- /dev/null
+++ b/test/cases/mount/service-hl.sh
@@ -0,0 +1,7 @@
+#!/usr/bin/env bash
+# GROUP: mount
+
+FS_NAME=service_hl
+LAUNCH=fuservicemount3
+
+. "$TEST_LIB/service-example.sh"
diff --git a/test/cases/mount/service-ll.sh b/test/cases/mount/service-ll.sh
new file mode 100755
index 000000000000..036553889f7a
--- /dev/null
+++ b/test/cases/mount/service-ll.sh
@@ -0,0 +1,7 @@
+#!/usr/bin/env bash
+# GROUP: mount
+
+FS_NAME=service_ll
+LAUNCH=fuservicemount3
+
+. "$TEST_LIB/service-example.sh"
diff --git a/test/cases/mount/service-mount-fuse.sh b/test/cases/mount/service-mount-fuse.sh
new file mode 100755
index 000000000000..6bc95240c772
--- /dev/null
+++ b/test/cases/mount/service-mount-fuse.sh
@@ -0,0 +1,31 @@
+#!/usr/bin/env bash
+# GROUP: mount
+#
+# mount.fuse3 mounts through the service when its socket listens, and execs a
+# program named after the type when the socket refuses the connection.
+
+_fuse_no_mount_needed=1
+. "$TEST_LIB/common.sh"
+
+_require_binary example/hello
+
+FS_NAME=service_ll
+LAUNCH=mount_fuse
+
+. "$TEST_LIB/service-example.sh"
+
+fallback=test-fallback-$$
+service_setup "$fallback"
+
+# Bound but never listening, so connect() gets ECONNREFUSED
+python3 -c 'import socket, sys
+socket.socket(socket.AF_UNIX, socket.SOCK_SEQPACKET).bind(sys.argv[1])' \
+	"$service_sock"
+
+mkdir "$TEST_TMP/bin"
+ln -s "$FUSE_EXAMPLE_DIR/hello" "$TEST_TMP/bin/$fallback"
+export PATH="$TEST_TMP/bin:$PATH"
+
+fuse_mount_helper "$fallback" >/dev/null
+_assert_listdir "$TEST_MNT" hello
+fuse_umount
diff --git a/test/cases/mount/service-null.sh b/test/cases/mount/service-null.sh
new file mode 100755
index 000000000000..b89107ae3a40
--- /dev/null
+++ b/test/cases/mount/service-null.sh
@@ -0,0 +1,33 @@
+#!/usr/bin/env bash
+# GROUP: mount
+#
+# The null example mounts through fuservicemount3 on a regular file.
+# null has no backing file and mounts on a regular file, so it does not use
+# lib/service-example.sh.
+
+_fuse_no_mount_needed=1
+. "$TEST_LIB/common.sh"
+
+_require_linux "fuservicemount3"
+_require_root
+_require_fuse_device
+_require_binary util/fuservicemount3
+_require_binary example/null
+
+. "$TEST_LIB/service.sh"
+
+service_setup "test-null-$$"
+mnt_file=$TEST_TMP/file
+_at_exit "umount -l '$mnt_file' 2>/dev/null"
+printf 'dummy' >"$mnt_file"
+
+service_start "$TEST_LOGDIR/fs-null.out" "$FUSE_EXAMPLE_DIR/null"
+# null takes no source, only the mount point
+"$FUSE_UTIL_DIR/fuservicemount3" "$mnt_file" -t "fuse.$service_subtype" ||
+	_fail "fuservicemount3 did not mount null"
+
+_check fuse_test_null_roundtrip "$mnt_file"
+
+umount "$mnt_file"
+service_wait_exit
+_assert_eq "$service_rc" 0 "null exit status"

-- 
2.53.0


