Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDA62494D8
	for <fuse-devel@lists.linux.dev>; Fri,  8 May 2026 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258353; cv=none; b=dO36L0OWfTI3bgy5BLtr7/JDd00Sjf7C5nTVWk/lBF27YsK3MsbZyBpOxhSMXtCcivbkgOCrd6g9YHMab+6SMzioGgl0koLiBLf8dl2QEcKVqRf71bNtEl15TdUzG6hcbfvi+d8khZDIsyxBqdA1VlrMLXHM0a7e9RuVTCJh4oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258353; c=relaxed/simple;
	bh=u0arJkcsz3DBuUjXMFJ4tf5T4MyZ/9c+ZqgPKoAfMNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ii3Zxuf45foeDRNTEkZgu1tG5DJAJLUICgADiOozGoCiOf6Wp1hHsYCTu89/V+tyAB+A+O3/8EuzO9DDLILDUohYcvTJtIo+jnJv9hyTUaDTSiZTsq1BCRw5PUW8kKE5CQ/j6SMKlS58aFUZNwA2Fpm6Sw2Nq/IRl2Ehr4KU2Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ukqxdEyW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ukqxdEyW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CEF8C2BCF7;
	Fri,  8 May 2026 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778258353;
	bh=u0arJkcsz3DBuUjXMFJ4tf5T4MyZ/9c+ZqgPKoAfMNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ukqxdEyWSVwM6oDfdRJSVpM8JHWT/F0oG3agZ9MGYvm7Q7L7BKfRbsZ2DOX7H9d3W
	 d5ikHRY75zhYT0EBECwV62YyGbStKKjSoj4Stn2K3+UkR1BLHSaL+C28MIfka2oizg
	 MlfMNa8gKL3cMHMsA9LBO7tMBzlPhVxjbVYytSCSGFET7vR86QVYmrqSs49GHNbz+0
	 rfRCkr/8949eDtZdEXkzRNWoM40BFrBpeuBP9COXH3cyGvBMs1lt/4R8GgpYCAbK68
	 n+IySUYGcZQ6aUUX4nKpljM+R2FKR3DBTmsZplFSKVfjovTn4rPjeoQKmWWWYd0RA2
	 rRuoyCjLx5mOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F02CD37AF;
	Fri,  8 May 2026 16:39:13 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 08 May 2026 18:39:06 +0200
Subject: [PATCH 03/10] test: assert ro/rw, nosuid/suid, nodev/dev
 round-trip via fsmount
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-new-mount-fixes-and-tests-v1-3-c67a0893ddbc@bsbernd.com>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4045; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=eYayxcooayUQkqjXTb586tNpfXL9uNgcP9rvIcKKd8A=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGDL/Ca65EXUt2r8jf4lP87ebG322b1He77FNsq4v+Jf+F
 mZ1b/M1HaUsDGIcDLJiiixdEntsp/zjk1X7uv46zBxWJpAhDFycAjCRpF5Ghk8PYpPnN0Zluitt
 Ygs6sbmv4GRpaZEUu0SKW9scLs1eNkaG2/JrYw6/ELx92uTJhjkR745+zkx7J87xLd8+2ZvlTaI
 5MwA=
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

Assisted by ClaudeOpus 4.7
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 test/test_mount_state.py | 70 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/test/test_mount_state.py b/test/test_mount_state.py
index eacb7326..a7949ec3 100644
--- a/test/test_mount_state.py
+++ b/test/test_mount_state.py
@@ -105,12 +105,66 @@ def test_mountinfo_subtype_fsname(tmpdir, output_checker, name):
         'unexpected source: %r' % info['source']
 
 
-@pytest.mark.parametrize('name', ('hello', 'hello_ll'))
-def test_mountinfo_unprivileged_attrs(tmpdir, output_checker, name):
-    if os.getuid() == 0:
-        pytest.skip('only meaningful for unprivileged mounts via fusermount3')
-    with hello_mount(tmpdir, output_checker, name) as mnt:
-        info = parse_mountinfo(mnt)
+# (label, options, must-be-in mount_options, must-NOT-be-in mount_options)
+#
+# Library defaults are MS_NOSUID|MS_NODEV (lib/mount.c:771,
+# util/fusermount.c:988), so a no-options mount is expected to land
+# with both attrs set. The negation forms (suid/dev) clear the default
+# flags via lib/mount.c:set_mount_flag(), which on the new mount API
+# path means MOUNT_ATTR_NOSUID/MOUNT_ATTR_NODEV are not set in the
+# fsmount() call. Asserting their absence catches a routing bug where
+# the negation wasn't honored.
+ATTR_CASES = [
+    ('default',  (),          ('rw', 'nosuid', 'nodev'), ('ro',)),
+    ('ro',       ('ro',),     ('ro',),                   ('rw',)),
+    ('nosuid',   ('nosuid',), ('nosuid',),               ()),
+    ('nodev',    ('nodev',),  ('nodev',),                ()),
+]
+
+# suid/dev are root-only: the kernel rejects MS_NOSUID/MS_NODEV being
+# cleared for unprivileged mounts, and fusermount3 hard-codes them on
+# anyway (util/fusermount.c:988).
+ATTR_CASES_ROOT = [
+    ('suid',     ('suid',),   (),                        ('nosuid',)),
+    ('dev',      ('dev',),    (),                        ('nodev',)),
+]
+
+
+def _check_attrs(info, must_have, must_not_have):
     assert info is not None
-    assert 'nosuid' in info['mount_options']
-    assert 'nodev'  in info['mount_options']
+    for opt in must_have:
+        assert opt in info['mount_options'], \
+            '%r missing from mount_options=%r' % (opt, info['mount_options'])
+    for opt in must_not_have:
+        assert opt not in info['mount_options'], \
+            'unexpected %r in mount_options=%r' % (opt, info['mount_options'])
+
+
+@pytest.mark.parametrize('name', ('hello', 'hello_ll'))
+@pytest.mark.parametrize('label,opts,must_have,must_not_have', ATTR_CASES,
+                         ids=[c[0] for c in ATTR_CASES])
+def test_mountinfo_attrs(tmpdir, output_checker, name,
+                         label, opts, must_have, must_not_have):
+    with hello_mount(tmpdir, output_checker, name, opts) as mnt:
+        info = parse_mountinfo(mnt)
+    _check_attrs(info, must_have, must_not_have)
+    # ro/rw also surface in super_options; if we asked for ro the
+    # superblock must agree. Catches a path that sets MOUNT_ATTR_RDONLY
+    # but forgets the FSCONFIG-side MS_RDONLY (or vice versa).
+    if 'ro' in must_have:
+        assert 'ro' in info['super_options'], \
+            'ro on mount but rw on superblock: super_options=%r' % \
+                info['super_options']
+
+
+@pytest.mark.parametrize('name', ('hello', 'hello_ll'))
+@pytest.mark.parametrize('label,opts,must_have,must_not_have',
+                         ATTR_CASES_ROOT,
+                         ids=[c[0] for c in ATTR_CASES_ROOT])
+def test_mountinfo_attrs_root(tmpdir, output_checker, name,
+                              label, opts, must_have, must_not_have):
+    if os.getuid() != 0:
+        pytest.skip('clearing nosuid/nodev requires root')
+    with hello_mount(tmpdir, output_checker, name, opts) as mnt:
+        info = parse_mountinfo(mnt)
+    _check_attrs(info, must_have, must_not_have)

-- 
2.53.0


