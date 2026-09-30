Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BA14DD6DB
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773875; cv=none; b=uJaPZNBBLP/TSfXyJ1W4EqRACDDdGgTyZh7sibvKP+hiALxoTX6/1WeySnNqdTQncc7mqsWs01gaIENiF+BEeJn7lqxqv9sjWWwt25Gj2brKh6W77bqgNIMzy2jfxZfGp49xOokGTp4LSdimwuVvE7cFlfXXlqPk2Z7psR/KqsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773875; c=relaxed/simple;
	bh=FoXEEtMhDrRmY6HlpOqpQDGSeYoe5RzNo2MwXJ4eHMc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nf3P1uHuaA420Hu6tqTJ/MLpalIqGApHtogQnVQQSThXpijU3Qterzef8Tej3fzoZL0+LZsKYkutbu/TK+GHJYFSoFaI3Cl4vEFTXgldmpyQLxzZfuIEzAllNZQ9p1CYtAwQnDUg6icchylDULjyo8FUr1eIjK4IP8niCm3E69E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSslLqhQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSslLqhQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99824C2BCF4;
	Wed, 30 Sep 2026 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790773873;
	bh=FoXEEtMhDrRmY6HlpOqpQDGSeYoe5RzNo2MwXJ4eHMc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QSslLqhQPUfXk+O1wcAUnEn3VyVr9sMt6A9NI2Hjh8woNiNCZZvpf+YIVoYntM3JE
	 SB7MakrVN0MzbP9wnBWOHDWh2AckfAsgB3l4nx1c8YC9XscDNvWBRgudJ+LW6zVqGP
	 NsMhkqyBOovqlKF+pVFIu3mFTyoJL8pahdeSwIOH2H637pObQ5jtIjpp3KTG6heZDS
	 uZ60asWMMpyEIdGFVuxttDEUmJKKUJ8ibhM7mHkoMBGcw05AR/JKjtFVOXbzn+zM2G
	 9pq11zkrDeCAEr5ASAJO8rH1WNYhGKK8/jcpXEWbmfiFRSoncIjRvWJ6djAf+pe2bK
	 ll4s8Z8jNvWGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8536ECA5FBA;
	Wed, 30 Sep 2026 13:11:13 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Subject: [PATCH v3 00/15] libfuse: Add mount service safety checks and
 tests
Date: Wed, 30 Sep 2026 15:10:54 +0200
Message-Id: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32N0Q6CIBhGX6VxHQ1QVLrqPVoXgj9Jm+BAWc357
 oGtrS7q8mzfd86CAngDAR13C/IQTTDOJij2O6T61l4Bmy4xYoRVRLASD262E06vaBRgmajDbgS
 L60JIWrGikrpF6T560Oa+qc+XF4dZ3kBN2ZcXvQmT84+tHWnevTP8dyZSTLCUmrZNqWoh+EkGC
 d52B+UGlEORfaqaPyqWVEQLzQntCFfwrVrX9Qm40cf/HwEAAA==
X-Change-ID: 20260924-mount-service-bound-open-739b16236bfa
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>, 
 Keerthana KT <keerthana@labs.digiscrypt.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=4665; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=FoXEEtMhDrRmY6HlpOqpQDGSeYoe5RzNo2MwXJ4eHMc=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLL2ciXuM3fP4SlXs9hVFq9zYYrO3PK45ki/yanvfnZHs
 6QwXXrWUcrCIMbBICumyNIlscd2yj8+WbWv66/DzGFlAhnCwMUpABP5FMrI8H/PTnU3TvV9YR/N
 daReP7OxuLFAtHL/quOPPyR9nbZn93uGf/b+9U85NFu/HjyW2r2Zj++bmfJuWfHPwa/DE1IcjuR
 uZgQA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

That was noticed by AI on comparison to systemd storage provider
and fuse service mount tests were missing as well.

To: fuse-devel@lists.linux.dev
Cc: Darrick J. Wong <djwong@kernel.org>
Cc: neal@gompa.dev

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
Changes in v3:
- Address all Darricks review comments
	- Allow "*" as subtype for service_open_path config option
	- Use sysconf(_SC_ARG_MAX)
	- Also check that pos + len do not exceed memdfd file size
	- Slight documentation wording improvement
- Move fuse_service_priv.h from include/ to lib/
- Link to v2: https://patch.msgid.link/20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com

Changes in v2:
- Add more parsing logic to detect files to open from the command
  line and add admin overrides if the logic failed
- Allow open after mount, but use openat(), which avoids that
  files from the mount point are taken
- Add in '-d path' for mkfs.ext4 to copy in files for improved
  testing
- Add another sanity commit to limit max arg comand size
  (previously https://github.com/libfuse/libfuse/pull/1552)
- Change path to /run/fuse
- Add the documention patch
  (previously https://github.com/libfuse/libfuse/pull/1530)
- libfuse PR: https://github.com/libfuse/libfuse/pull/1638
- Link to v1: https://patch.msgid.link/20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com

---
Bernd Schubert (14):
      mount_service: move the command line check into arg_in_cmdline()
      mount_service: warn about paths not named on the command line
      mount_service: refuse paths the user did not name
      mount_service: use openat to OPEN paths
      util: give fuservicemount3 an absolute build-tree runpath
      mount.fuse: free the options on the service mount return path
      example/single_file: take no sector size from a regular backing file
      test: check which files fuservicemount3 opens for the server
      test: check what fuservicemount3 refuses
      test: mount the service examples through fuservicemount3
      test: run mkfs.ext4 through the service examples
      build: move the default service socket directory to /run/fuse
      Improve documentation for fuse service mount
      move fuse_service_priv.h from include/ to lib/

Keerthana KT (1):
      fuse_service: bound argc and arg len read from the args memfd

 .gitignore                              |   1 +
 doc/README.service-mount                | 312 ++++++++++++++++++++++
 doc/README.service-mount-dev            | 456 ++++++++++++++++++++++++++++++++
 doc/README.service-mount-flow           | 201 ++++++++++++++
 doc/fuservicemount3.8                   | 164 +++++++++++-
 doc/mainpage.dox                        |  13 +
 doc/mount.fuse3.8                       |  25 ++
 example/service_ll.c                    |   5 +
 example/single_file.c                   |   3 +-
 include/fuse_service.h                  |   4 +-
 lib/fuse_service.c                      |  40 +++
 {include => lib}/fuse_service_priv.h    |  10 +
 meson.build                             |   2 +-
 meson_options.txt                       |   2 +-
 test/cases/lib/service-example.sh       | 112 ++++++++
 test/cases/lib/service.sh               |  95 +++++++
 test/cases/lib/socket_activate.py       |  42 +++
 test/cases/mount/service-caps.sh        |  20 ++
 test/cases/mount/service-check.sh       |  38 +++
 test/cases/mount/service-hl-mkfs.sh     |   8 +
 test/cases/mount/service-hl.sh          |   7 +
 test/cases/mount/service-ll-mkfs.sh     |   8 +
 test/cases/mount/service-ll.sh          |   7 +
 test/cases/mount/service-mount-fuse.sh  |  31 +++
 test/cases/mount/service-mountpoint.sh  |  36 +++
 test/cases/mount/service-nonroot.sh     |  54 ++++
 test/cases/mount/service-null.sh        |  33 +++
 test/cases/mount/service-open-bound.sh  |  61 +++++
 test/cases/mount/service-server-exit.sh |  22 ++
 test/meson.build                        |   6 +
 test/test_fuser_conf.c                  |  59 +++++
 test/test_service.c                     | 232 ++++++++++++++++
 util/fuse.conf                          |  12 +
 util/fuser_conf.c                       | 106 ++++++++
 util/fuser_conf.h                       |   3 +
 util/meson.build                        |   2 +
 util/mount.fuse.c                       |  42 +--
 util/mount_service.c                    | 128 +++++++--
 38 files changed, 2360 insertions(+), 42 deletions(-)
---
base-commit: bf4fdf9df8e2d33393894d0789f89e17520944f0
change-id: 20260924-mount-service-bound-open-739b16236bfa

Best regards,
--  
Bernd Schubert <bernd@bsbernd.com>


