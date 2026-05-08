Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE4E40B6C0
	for <fuse-devel@lists.linux.dev>; Fri,  8 May 2026 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258353; cv=none; b=Z+23O/LdvRrMU9hlPKxhP80awNcbVoEivBepo82yjTqyKik7If6BEzfWp5bCVjfBEEi4pOvqMlMONzt8BPeXIFS4vFzMTWqSlvRq8h/oNFVH7RcKlBKJephp9EI9GObVUv7Pecz1z4x8TXRhWFpx4sZ8kXdi4Yz1X9C3mW8qy5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258353; c=relaxed/simple;
	bh=2IWrwV29sG+RAflVR/phzfSN46RdefPRfwcLdx6Iouk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHwwmqpcSpzsUSTB3FKpHQtQ7l4v79jeNbO5D6aEdQSg/FWqboS+U6YB6J+Te5nh8semfA3pMGIJLM4MrnSWHUZPeZyL0vtVyc2EzmTpRHxAXZtHbxWE97UYFHdrHZMTi9InCdvWPHGz6Ur+dn/PXi/RwpHg0rkZEFvJUkjbqIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moLSj+No; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moLSj+No"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A658C2BCFB;
	Fri,  8 May 2026 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778258353;
	bh=2IWrwV29sG+RAflVR/phzfSN46RdefPRfwcLdx6Iouk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=moLSj+NoDE9F2I3OtjoGsbgp3ilmdgayeLut7vUKq1OlrdgBvt1jlVDJfcO0Dpkgf
	 INM6p+iPiGSFX6BpkpOY5eF9HT/N2Dmgdb0mG5316LjFIcVImGzD08uu8Ncg9Igz+A
	 +M+RAv01v+9gUT6mQbexF85V4Tqc/yUf3lBI/4F1gECeYriiVHMclMc7sgm8Ih0aQ0
	 HJgb/8Ksse068z2to28j3ZbtvWXM8HWZPy39sgW+dTZ1N7TYpiD05ryWFH/glxOG1D
	 yuNASQ4razZ31aOr1GpuAfb1JS4MVLbLQ3XklyOS7wbbRgKazhWKyzCE2WnfPhtEbX
	 W3vIBpl/K8t+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B05CD342F;
	Fri,  8 May 2026 16:39:13 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 08 May 2026 18:39:08 +0200
Subject: [PATCH 05/10] libfuse: don't use SYNC_INIT unless asked for
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-new-mount-fixes-and-tests-v1-5-c67a0893ddbc@bsbernd.com>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=toUVvJzkYr/8qFA1a0x89f91HXWkg5D4vmy4M5PaS6I=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGDL/Ca5NLdQVL1RsU9r0PyTOalL1xjlWrZt5e/Ymnef6f
 FTsa0ZPRykLgxgHg6yYIkuXxB7bKf/4ZNW+rr8OM4eVCWQIAxenAEzEYwkjwzOZPZyzDhrc+bco
 t/UIt7GBwhc3zQMHDoaI6rTPUzt3cx7D/9gqyWRL766Ua9denXe9eK1b2+Vh/CrTUws9XKaUXf1
 2hB0A
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: "Darrick J. Wong" <djwong@kernel.org>

fuse2fs calls fuse_main, then starts threads from ->init.  It doesn't
call fuse_daemonize_early_start because I haven't ported it to use any
of the new APIs.  I don't have io_uring enabled for fuse on my dev box.

fuse_main calls fuse_session_mount calls fuse_session_mount_new_api
calls session_start_sync_init.  At the start of the function,
se->want_sync_init, se->uring.enable, and daemonize.active are all
false.  The first branch is not taken, so we call FUSE_DEV_IOC_SYNC_INIT
and enable sync_init even though the user didn't ask for that and didn't
prepare for it either.

FUSE_DEV_IOC_SYNC_INIT succeeds, so we send the synchronous FUSE_INIT
from mount, which calls fuse2fs' init() method.  That starts the
background threads and returns.  Upon return to the kernel, the mount()
now succeeds, and the next thing that fuse_main does is call
fuse_daemonize().  Since we didn't call fuse_daemonize_early_start, the
daemonize forks the process and the threads die with the parent.

If we didn't ask for SYNC_INIT, don't enable it.  This is needed to
maintain compatibility with older fuse servers that only support
asynchronous FUSE_INIT.

--

Fixes: 3e1101057aea ("fuse mount: Support synchronous FUSE_INIT (privileged daemon)")
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
v1.2: simplify the logic even more
v1.1: improve commit message, refine logging logic
---
 lib/fuse_lowlevel.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/fuse_lowlevel.c b/lib/fuse_lowlevel.c
index 0e16845d..6e078e82 100644
--- a/lib/fuse_lowlevel.c
+++ b/lib/fuse_lowlevel.c
@@ -4475,8 +4475,11 @@ static int session_start_sync_init(struct fuse_session *se, int fd)
 {
 	int err, res;
 
-	if (!se->want_sync_init &&
-		(se->uring.enable && !fuse_daemonize_is_used())) {
+	/*
+	 * Older fuse servers do not set want_sync_init or start the new
+	 * daemonize code, so they get async init.
+	 */
+	if (!fuse_daemonize_is_used() || !se->want_sync_init) {
 		if (se->debug)
 			fuse_log(FUSE_LOG_DEBUG,
 					"fuse: sync init not enabled\n");

-- 
2.53.0


