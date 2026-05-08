Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A45E402BBE
	for <fuse-devel@lists.linux.dev>; Fri,  8 May 2026 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258353; cv=none; b=rGr29YDsOtvn//MAttjbqteShwR4F+ytlMMD7QvBJIk1Ms2NV9umAr470dtimxTrecQ09ZComYPuT87a4sfAHJ9oDvxBv+gQX5BlqHUBdVvFkpITn+5r+m1MF8jIDZXGSa6wigw0yxsWgYpx+0S7Z1UmzkSuOj7vymPONqvpmCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258353; c=relaxed/simple;
	bh=2v1r4XDh5tkgXXWCZRwKyNwDkZGMrV74yU/deZwKn/s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mrI/m2NJ1/WlqM7C8odwzHgaH6HMbYxrNqRSuoVD2vJmDveOxRhXQ5+D5IosJZPRLPcvmwxEcLpU4DsKvfqfzdDL1iXxWy1209ZI9w16CDTWdRRKOTjFVqZcHfexXjBj5HTbzcPrRW2kGyYN+514sQBHCW8F0G6kK0KUgwHHCzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYGMf4FB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYGMf4FB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D10A2C2BCC7;
	Fri,  8 May 2026 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778258352;
	bh=2v1r4XDh5tkgXXWCZRwKyNwDkZGMrV74yU/deZwKn/s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UYGMf4FBJYEsohFU92OYqeYv2hhYjDG3FtalP/uUyQ1kYrpl4HSCMhPcTbjfVAYfr
	 QApnulW7w9Wy1jPh25ClVSjHjLI+1Jg0QT96TBEuDP6j0Mn/wf38JQ1hPJDV0/uqBS
	 BOGpWj0lVYWNOORuYo4crYmh4pCgAYkRR7QLsdG6FCJNLSAoVLOp0mJkTWT5N2gup+
	 cy/s1JOEzERUkCZGmELRjx2/xrGgU30KqnfhX+m/5dlT9rty8D4uQmkpSDHbmkDglX
	 CJzuLMHM2Bt/QTIcHwjXYpdXWUHIgbQ7qptkjoN6ntCSI/KldCX0VyT73A8T8TSyW+
	 hrgxzaJnRrbKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99AFCD342F;
	Fri,  8 May 2026 16:39:12 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Subject: [PATCH 00/10] libfuse: new mount API and SYNC_INIT fixes and tests
Date: Fri, 08 May 2026 18:39:03 +0200
Message-Id: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LywqDQAxG4VeRrBuYKg7aVyldaOZvm4WxTKYXE
 N/docsPztnIkRVOl2ajjI+6rlZxPjUkz8keYE3V1IY2hj4MbPjysr6t8F1/cJ4scYEXZxEZk8z
 diBip/q+Mf1L3623fD79W3+5rAAAA
X-Change-ID: 20260508-new-mount-fixes-and-tests-ccc9dcb39e66
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
 Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=2v1r4XDh5tkgXXWCZRwKyNwDkZGMrV74yU/deZwKn/s=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGDL/Ca4WWzZ5oWxGt755OM8Plzyt7OgvWlZnu9w4Cw2/v
 ZuhU7Kko5SFQYyDQVZMkaVLYo/tlH98smpf11+HmcPKBDKEgYtTACYid5bhf+w9Ca0lqwQ+7X7R
 KakvaDjFYyrTq4KDmQtbpkz+J5Pyv53hn0qfwcpAl9f/zqar/Q9kEDF7kCr4ztA3vJTRovlB7z1
 eVgA=
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

Several new tests and fixes for the new mount API.

To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
Bernd Schubert (8):
      test: register pytest run as a meson test
      Add tests to verify that mountinfo matches requested options
      test: assert ro/rw, nosuid/suid, nodev/dev round-trip via fsmount
      example: silence add_languages warning by setting 'native: false'
      mount: clarify kernel_opts vs mnt_opts vs flags in fuse_kern_fsmount
      fuse_daemonize_early_start: Disallow daemonization when already active.
      fuse mount: Do not set sync_init when sync_init was not used
      highlevel: Switch fuse_main_real_versioned() to fuse_daemonize_early()

Darrick J. Wong (2):
      New mount API: read-only option is for fsmount() and fsconfig()
      libfuse: don't use SYNC_INIT unless asked for

 example/meson.build      |   2 +-
 lib/fuse_daemonize.c     |   8 ++-
 lib/fuse_lowlevel.c      |  29 +++++---
 lib/helper.c             |  30 ++++++---
 lib/mount_fsmount.c      |  21 ++++--
 lib/mount_i_linux.h      |  13 +++-
 lib/mount_util.c         |  44 ++++++------
 lib/mount_util.h         |   3 +-
 test/ci-build.sh         |   9 ++-
 test/meson.build         |  26 ++++++--
 test/test_mount_state.py | 170 +++++++++++++++++++++++++++++++++++++++++++++++
 test/util.py             |  45 +++++++++++++
 12 files changed, 341 insertions(+), 59 deletions(-)
---
base-commit: e99b3d200c04464e0dc03f1e7fce8a7f3b95503d
change-id: 20260508-new-mount-fixes-and-tests-ccc9dcb39e66

Best regards,
-- 
Bernd Schubert <bernd@bsbernd.com>


