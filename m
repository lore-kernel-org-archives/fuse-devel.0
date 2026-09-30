Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CC94FD788
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773876; cv=none; b=HZAvu35pxbQ1I1RZZin0jNL1F5Pjk1HAPfF7ihVbj75nS8gm/OX9E2q4OORu/e+5TuQBMboVT+L0gCS5eswcv7Xaa/PlHCoBeDz+XHbXAUrVn4wl0bd9ENRJe6FNFYIBgNh7YR6dCP5h4e753uVkAWFrZfJQpe/VzpVO1skmeqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773876; c=relaxed/simple;
	bh=AxZDOlF2kLbxZ3gKpK0wyk6AJhCJLoi4OyqmOvqDsss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LF+2HeLcUeEcluJFPmaj9Xyljq8/mdTBrjUpyYEpeHUdE/OFTDtQHadsytrMI84OWUYOuKn6mZfivjB5Dy80WOsJZrhvU4sS4lnWjCpItJ00Tr7X7DxWOLYYpez/8GFzU6vhqFP09vVYm03hFcNNjzS74CkbgGhTPFosAJnSf98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rHoeHFf7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rHoeHFf7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C672C4AF50;
	Wed, 30 Sep 2026 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790773874;
	bh=AxZDOlF2kLbxZ3gKpK0wyk6AJhCJLoi4OyqmOvqDsss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rHoeHFf7oPv2qZ5zfPzYu+PoyX5J3w7wAn4k+FwGLFQ+hPDmC9qUhdctC46nGo1dp
	 TaCaV1WoMFn0lI1AwpQdNdUcDlvmml07Q0CCv8g3MbkJ8RibF34q8b+C2C/ADk9qlT
	 lhncm6mw785u6MyDxj5hZh39ozbv21GjpAHamxzfpTvZj8kb+4yPEZrPvdu0NZoqyQ
	 JF4Okx8zKsZZ95zMFL3/Komr/cA0+Gbq8jb4OnKtNQJYEuOROXcqKFJOrecXrpTpka
	 zCYd6fzokGmYlm4J+tOhYJ8fpMoHcmMg6ycVIIz6D7bM1f5cLbyzJ/vljzq1JXFpJi
	 iDbcjGm1nIHjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2F2CA5FC5;
	Wed, 30 Sep 2026 13:11:14 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Wed, 30 Sep 2026 15:11:07 +0200
Subject: [PATCH v3 13/15] build: move the default service socket directory
 to /run/fuse
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mount-service-bound-open-v3-13-e26c5e4eca4c@bsbernd.com>
References: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
In-Reply-To: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=/fLLZKFK2/8mQY9ouzzqLpP8wdTcB+LhDagp3DmmdeQ=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLL2cuVpbdrtH3bZl4c//f0N3lDvYr7IU6x864KWfrxdw
 F1ZePF4RykLgxgHg6yYIkuXxB7bKf/4ZNW+rr8OM4eVCWQIAxenAExEX43hn7H+/zUBuXOnn4q4
 t6hE5ulrgXe+L/i3fJf8wnXrt0M10wtGhh93mi/3SZdcES8o/3Mw+KR1WNNOpeYIgbu5mx+/OJA
 izgoA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

/run/fuse sounds better for fuse and then it is also shorter
a few bytes and might reduce 108-byte AF_UNIX path issues, compared
to /run/filesystems.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 meson.build       | 2 +-
 meson_options.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index c22cc2c1dbf4..eb365ff66552 100644
--- a/meson.build
+++ b/meson.build
@@ -72,7 +72,7 @@ private_cfg.set_quoted('PACKAGE_VERSION', meson.project_version())
 service_socket_dir = get_option('service-socket-dir')
 service_socket_perms = get_option('service-socket-perms')
 if service_socket_dir == ''
-  service_socket_dir = '/run/filesystems'
+  service_socket_dir = '/run/fuse'
 endif
 if service_socket_perms == ''
   service_socket_perms = '0220'
diff --git a/meson_options.txt b/meson_options.txt
index 43104290f8b5..e12177fcea30 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -35,7 +35,7 @@ option('sync-init', type: 'combo', choices: ['auto', 'always', 'never'], value:
        description: 'Synchronous FUSE_INIT: auto follows fuse_daemonize_early_start(), always and never override it')
 
 option('service-socket-dir', type : 'string', value : '',
-       description: 'Where to install fuse server sockets (if empty, /run/filesystems)')
+       description: 'Where to install fuse server sockets (if empty, /run/fuse)')
 
 option('service-socket-perms', type : 'string', value : '',
        description: 'Default fuse server socket permissions (if empty, 0220)')

-- 
2.53.0


