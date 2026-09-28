Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1681C49EC7A
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 11:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593351; cv=none; b=QznmLcNKePXTZ/YpfwrSjS9VrRB5FsoBQVtGZ7eYMG9P5le7Jg2BHEW+cjxREGu1ejlD/LOYwkKX03Va2f1wdMQOb+SQsRNnqxMXW4MG5eJlfD6G57OBLI8c52XS0SkTC3mIw6q2HnwTSgZKvOzHWMH17ipJix1apiVUim0iGnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593351; c=relaxed/simple;
	bh=r5eQx2OMISpcRKq9WzlTldGPgagouwbFqkf/AlQHxuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XFE2MKf5z+oOg5USDl0u0Q34PKVALR4Ey4YfiAYCBnLDqt/4Z+pnKhwxKLazixk/hVogujJo0lioM0znK/tJjg90ifoj6UJMzrsVr838m2ZzZW/HZW6lkxAMTeGo8TGHhI6bLBtrysfSOsmF7+3lReyNnlWjeSmxY7HoxGrBrss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tt/D2eyX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tt/D2eyX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE165C4AF12;
	Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790593351;
	bh=r5eQx2OMISpcRKq9WzlTldGPgagouwbFqkf/AlQHxuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tt/D2eyXpMuCk5GlsxtkB4SHgVTyj6N5vrRbqDzsLlFwMxmVgHz2TOrcKcIZlOF3m
	 gCFsKqgQwsuXZ9PpQ7CtTnq+K4uivhpILtGkLMaD4aeJ0YTnkuAVKv1uZkuwLnoDNc
	 bTYl4ESysnDwsYdOndrxFBcck6b0oYsKE9tDlDT33DDa5pZ3yHts/Wly63MJ14nVkH
	 F1Zre8fm6NWWF6OzDxkHLWbE78V480kJXjyLZCPGejgdprsGTwPzPM6Mxs3yzKFGDY
	 Q/Hi+jv6IkxKwm8pJv27yusaUoJneO0YG8S9TTp2dyJDhGUad8NjYwTMVchYMMWA5x
	 OC54USOBMNPDQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0C7CA5FA7;
	Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 28 Sep 2026 13:02:15 +0200
Subject: [PATCH v2 13/14] build: move the default service socket directory
 to /run/fuse
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-mount-service-bound-open-v2-13-0f9f501d05ce@bsbernd.com>
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
In-Reply-To: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=tQryJefQwU31BGF36lLS3Yeu+12nkeqk6UvLI4AI88I=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJ2eTofFN1TICztH76X3X4P063EHMPLVl/mWilNY3afk
 hSw09ino5SFQYyDQVZMkaVLYo/tlH98smpf11+HmcPKBDKEgYtTACYy/SAjw0EProKnKjp6dcz3
 5LeJi31wKedZc0/q7AMjrRbj3+06RxgZbsp8cDl4Mb206l/MUvlbr5fe7NuhuJFT9nGfVNBn37p
 lDAA=
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
index 06e6056ecf21..5e9628b521e7 100644
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


