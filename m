Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7027840B6E0
	for <fuse-devel@lists.linux.dev>; Fri,  8 May 2026 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258353; cv=none; b=bRulf9YQAWY8oF2ecW31BnAShj96qSlDWsojF2qy+eV0K5NqgAeG9qTPVnN0ZGPG8unS7edz2Nf4H8qE6OZpgCHprnIg3Y0mqcS72+w6b9fnATeNvx5zIhUILp/oUknCzRlJE3Zr3bYMMj9h+/A7Y/GTvNO8SkpzUfRPIwD3510=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258353; c=relaxed/simple;
	bh=eAM+BmKFAuqntWvMT/giax6umAZbBeKPtiY1zEMs58U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aQjl5uhQrGzcUvgsozUh5HIZ59U+ybOGDOC+2c0+hwxTt8MncfiEJKfN/LO21IcKcK1uh8NPf0v1HK0RUyKrS+Qt7aR3V4gTQYd+LX52lMOUHL4hjOXGXOlztohb4bo/9qQ3qBNKB+ajJKk1Ou7kPU7QKXythsMTDQI8Rkxm2m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvB2l5y8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvB2l5y8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5752AC4AF09;
	Fri,  8 May 2026 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778258353;
	bh=eAM+BmKFAuqntWvMT/giax6umAZbBeKPtiY1zEMs58U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZvB2l5y89WHwmWgFk6iTDLuEqv1xa+ONrWUhEaybpJ9r/wV+jV9Q+6PzRoyLx3ODU
	 Rd6JOc47cyfcXZWofLkASkCHw78EI1pZ7qPemzlZfaRIJ0yO82Toa7agES32KZpboH
	 42lY6crGkHfP8PqYieHilH7eSO9cSQO60oQ5J9b2RfH3tjs8HSNyhdHRpT/KCnT5v2
	 mCyqJ7JEYHFKkMqH8RSXSJClJUNMrejRRjh/XAG4zX8IQ+j49AcyihloaDerXFjKRi
	 gZ78Mg1ZKVc9Cww9l79a0KW78XCl+PCLc/HU2Nd4tKF93edVtNnzCznJubTEm2Qbp6
	 DA1F+zsU371NQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5057FCD37AD;
	Fri,  8 May 2026 16:39:13 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 08 May 2026 18:39:11 +0200
Subject: [PATCH 08/10] fuse_daemonize_early_start: Disallow daemonization
 when already active.
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-new-mount-fixes-and-tests-v1-8-c67a0893ddbc@bsbernd.com>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=tESQ5ySLyP1XllHdf502CtmW7LSgAeb26aOrfK5xI9Q=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGDL/Ca4LKj7sYKhisdPpi4PJaybL1Ccs/BMPWF363Kn5h
 7u7ivdnRykLgxgHg6yYIkuXxB7bKf/4ZNW+rr8OM4eVCWQIAxenAEykaQ4jw+87DHX6ntJzbHQ+
 JLL/7e/9lfHsspSNyLM/svPLF9wJcmBkeMpbVd7wpUZSmSXTxjuy9qL9hJT5NXvMc2+zL33mdqW
 fGQA=
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

A coding error could run fuse_daemonize_early_start() two times
and so far the code was not handling/failing that.

Also do not set "active" when it actually does not do daemonization.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 lib/fuse_daemonize.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/fuse_daemonize.c b/lib/fuse_daemonize.c
index c9a91748..8afe4b0d 100644
--- a/lib/fuse_daemonize.c
+++ b/lib/fuse_daemonize.c
@@ -211,18 +211,22 @@ int fuse_daemonize_early_start(unsigned int flags)
 	struct fuse_daemonize *dm = &daemonize;
 	int err = 0;
 
+	if (dm->active)
+		return -EALREADY;
+
 	dm->flags = flags;
 	dm->signal_pipe_wr = -1;
 	dm->death_pipe_rd = -1;
 	dm->stop_pipe_rd = -1;
 	dm->stop_pipe_wr = -1;
-	dm->active = true;
 
 	if (!(flags & FUSE_DAEMONIZE_NO_CHDIR))
 		(void)chdir("/");
 
-	if (!(flags & FUSE_DAEMONIZE_NO_BACKGROUND))
+	if (!(flags & FUSE_DAEMONIZE_NO_BACKGROUND)) {
+		dm->active = true;
 		err = do_daemonize(dm);
+	}
 
 	return err;
 }

-- 
2.53.0


