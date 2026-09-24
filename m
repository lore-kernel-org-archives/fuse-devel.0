Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08CA3FCB37
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288617; cv=none; b=iRby4tGIdg+JrWpF1FKtA2GmsGEpo42B4SwCHGOEBXowVigj11OGjmw74AUfrsmicmSH/H8LXHnF3OQ13S04vuCkKUhNBx4EqSj/k4/E4YvQbMbWi7qF1vKTveE/9pfEyoxHsdHEz8bfGKHx5VLLf1OUiO2yJLIxYRS2+jMDHG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288617; c=relaxed/simple;
	bh=OCv99N6fW5OAFcSce3p7GzV/UzMo7coTFSMa/0Fm0v8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VfRcozjMlg1mJxhF8Ipp2iT20b7K/kiwC727zJ8ZwzgFcDqBGK+6VmkZ6GfQiP4uKMI0H3G+27s59sJPWANpZpCwJp0dQOcI1toQnIB6INNndOU72U7HVcFEAqjZw8wsXuaqBtByjn97+qhy6tGFZvRHYmyCba+WyyZ+7XBfJjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2w2x7e2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2w2x7e2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7007AC2BCFD;
	Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790288617;
	bh=OCv99N6fW5OAFcSce3p7GzV/UzMo7coTFSMa/0Fm0v8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u2w2x7e29K+zvbHCsoTo9CJyoIBtwoiX3SuDB9a3Zd6h1hfg8It/Rrvcp9DKg5WR4
	 GfIgrOy8Stf62OcXmGbWeHGQ0xFVaIhVL1lbiKd1Sa7DLs9IYbO8wL3poAthtTwUEP
	 wF5SipJ3o0cDmLuzhTNa0+y5GyMzU6B4+jFl60e84d2c3+EFHZb7hQLkCc6uKa2qr0
	 ObhxHlAUdnr1yIWYOxh/PMa9eAOqFThSuqSvlAry8aA8eldEyNzTHvw+Oj30o4tHTZ
	 6JX0TJkoWmjbnE/i3Is8shk4+C8swEZPTjPw0fD2QGzWxC2SYUZXoif4P/P75RwzO5
	 yfn6XeZZxM+5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E56EC98326;
	Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 25 Sep 2026 00:23:32 +0200
Subject: [PATCH 04/10] util: give fuservicemount3 an absolute build-tree
 runpath
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mount-service-bound-open-v1-4-bbf1a84c7995@bsbernd.com>
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
In-Reply-To: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=XfD+boLVG/D+FGEAXvpaP6P60A7/HPfCNzWzNGHAgaI=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLK2LnpS/HvCRCu2RW9SbmyWkS6UlExovN7/9dSPGXPbD
 q8L/B/9qKOUhUGMg0FWTJGlS2KP7ZR/fLJqX9dfh5nDygQyhIGLUwAmIr6W4b+XsOX176eLDk/a
 MruLd1pL1cPJP1wKG3dYqUzpe5Ryl9GK4Z+29bH3LB5q/lHzKln3Rz79fKdVm3GW2YH3dRVyb27
 0N/IAAA==
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

The dynamic loader ignores $ORIGIN runpaths and LD_LIBRARY_PATH for a
setuid program. A build-tree fuservicemount3 made setuid, for example by
"run-tests.py --setuid-helpers", then failed with "libfuse3.so.4: cannot
open shared object file", or loaded the libfuse3.so.4 of the system.
meson removes build_rpath on install, so installed binaries do not change.

Assisted-by: LLM
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 util/meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/util/meson.build b/util/meson.build
index 28052a65536f..bc266776e153 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -22,6 +22,8 @@ if private_cfg.get('HAVE_SERVICEMOUNT', false)
              link_with: [ libfuse ],
              install: true,
              install_dir: get_option('sbindir'),
+             # A setuid run ignores the $ORIGIN runpath meson sets
+             build_rpath: join_paths(meson.project_build_root(), 'lib'),
              c_args: ['-DFUSE_USE_VERSION=319'] + mount_service_cflags)
 endif
 

-- 
2.53.0


