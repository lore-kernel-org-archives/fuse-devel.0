Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4EC40626E
	for <fuse-devel@lists.linux.dev>; Fri,  8 May 2026 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258353; cv=none; b=nwHp1RyGQ6vu1+yCfbxBYfN6giRfkMDzsMmplSW3qLwqGaVzwiw8cYqRAGAf5gY3ytCVIgBp9SzcYHZZL48RIUHKmL1vbEWatBMXOK5SsLqSJlqmfkg2AFN9Qz7lqQtN6tIwrB+N6p+I3cxrltG4aEiSKpSOQ66i7p+Sa1GireY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258353; c=relaxed/simple;
	bh=RY4KII8Ia0vrDy9DRS6ZihZ9C/hXFfdi3rFmEIAXDgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LP0KR3Z66BvMPyHoX/Z9fEUSzh6xQAqasodsRdT8fsMiGqPhm5WtJOm+skYY7nbV8AFeJDrh0kevf7p5EbBUmc+6Htj4ZqDlfxMxLXc6Ycl2dm6YyaTa6QwqyTOgChnuW2JdjpZLOIi1gW1GSPS48ZZMIqcj6oUQyx7uVkO3W6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=urh8/jlx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="urh8/jlx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2FC5C2BCC9;
	Fri,  8 May 2026 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778258352;
	bh=RY4KII8Ia0vrDy9DRS6ZihZ9C/hXFfdi3rFmEIAXDgo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=urh8/jlxBm0gd7ek4F0qFc0qFOacJY4c73h8A5wsc3k9gXQdJOFTDrbPzSiLrlJIL
	 QxPHGjEJxh8dzNnAMm2gp8JwES3PdS6qR7YfbLU1zszGaFzYk/I7nKd+5iOh5Z0HAo
	 65/E/HxviD3eWIWTUHlUWpj79EFV21VCjQkyWyTkX6PKS6k3f898K8bU7FdDPdX9dz
	 pgePHgwQoDR7x20EE78yuKyxCwU2+g9diPcH+BiurbaqqY/uy43IAFWCtkga8Mdpdj
	 DinmthxHg50iFNtYRTfBtAqQTCb4XCzfFbZawzvewaRxt49AAiL1iMwLYlth0xDNUL
	 o5CceCNCNl0AA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1F1CD37A7;
	Fri,  8 May 2026 16:39:12 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 08 May 2026 18:39:04 +0200
Subject: [PATCH 01/10] test: register pytest run as a meson test
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-new-mount-fixes-and-tests-v1-1-c67a0893ddbc@bsbernd.com>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=Ip+BNFKW42d7N2EI7LkMBi/+hAajKEWWU4YejbhBw/8=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGDL/Ca6WOCaQF1Uq3CcU/LI618Vrru7NXLOP+pYnzRpC5
 pdFu3/rKGVhEONgkBVTZOmS2GM75R+frNrX9ddh5rAygQxh4OIUgIksmcrI0OT83CLo1CE+gUAN
 n1cdVT17P27f31woaMvxNvLMvp+F0xkZDl9+f/zC7gb/ewqrf0bOsFXZsCTLReFd7YyE/W8sG1K
 W8QAA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

Wire the pytest suite into meson as a single test() so it can be run
via 'meson test -C build' (or 'meson test -C build pytest -v') instead
of having to invoke pytest directly. The same definition works for
both unprivileged and root runs -- invoke 'meson test' as your user,
or 'sudo -E meson test' to exercise the tests that need root (these
detect the uid at runtime via os.geteuid()).

Assisted by Claude/Opus 4.7
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 test/ci-build.sh |  9 ++++++---
 test/meson.build | 23 +++++++++++++++++++----
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/test/ci-build.sh b/test/ci-build.sh
index 799f13b2..727cc8c9 100755
--- a/test/ci-build.sh
+++ b/test/ci-build.sh
@@ -2,7 +2,7 @@
 
 set -e
 
-TEST_CMD="pytest -vv --tb=short --maxfail=1 --log-level=INFO --log-cli-level=INFO test/"
+TEST_CMD="meson test -C . --print-errorlogs"
 SAN="-Db_sanitize=address,undefined"
 
 # not default
@@ -122,8 +122,11 @@ sanitized_build()
     sudo chown root:root util/fusermount3
     sudo chmod 4755 util/fusermount3
 
-    # Test as root and regular user
-    sudo env PATH=$PATH ${TEST_CMD}
+    # Test as root and regular user. Give the root run a distinct
+    # meson log basename so its meson-logs/testlog.* files don't end
+    # up owned by root and block the subsequent user run from writing
+    # them.
+    sudo env PATH=$PATH ${TEST_CMD} --logbase=testlog-root
     # Cleanup temporary files (since they are now owned by root)
     sudo rm -rf test/.pytest_cache/ test/__pycache__
 
diff --git a/test/meson.build b/test/meson.build
index 84333f96..87668d61 100644
--- a/test/meson.build
+++ b/test/meson.build
@@ -41,13 +41,28 @@ td += custom_target('test_scripts', input: test_scripts,
                       command: ['cp', '-fPp',
                                 '@INPUT@', meson.current_build_dir() ])
 
-# Provide something helpful when running 'ninja test'
-
 if meson.is_subproject()
 	test('libfuse is a subproject, skipping tests', executable('wrong_command',
                       'wrong_command.c', install: false,
                        c_args: [ '-DMESON_IS_SUBPROJECT' ]))
 else
-	test('wrong_command', executable('wrong_command', 'wrong_command.c',
-                      install: false))
+	# Run the pytest suite via 'meson test'. The same definition works
+	# both as a regular user and under sudo: invoke 'meson test -C build'
+	# for the unprivileged subset, or 'sudo -E meson test -C build' to
+	# also exercise the tests that require root (they pick the uid up at
+	# runtime via os.geteuid()).
+	pytest = find_program('pytest', required: false)
+	if pytest.found()
+		test('pytest', pytest,
+		     args: ['-vv', '--tb=short', '--maxfail=1',
+		            '--log-level=INFO', '--log-cli-level=INFO',
+		            meson.current_build_dir()],
+		     depends: td,
+		     workdir: meson.project_build_root(),
+		     timeout: 600,
+		     is_parallel: false)
+	else
+		test('pytest not found', executable('wrong_command',
+                              'wrong_command.c', install: false))
+	endif
 endif

-- 
2.53.0


