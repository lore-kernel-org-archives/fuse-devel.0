Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ABB3F3278
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288617; cv=none; b=uSPXX+ieoxDaF8KMRdT/4eytu+eZL8P1HKXFxYL+sxQuSLhSwzLJ4pllpkCgHyOx2Ugj5xBiRKW24A7suN2M6V2f64VOM0aZhkpvPv0qKfL5zpEgDQ6kLBNj3ykwe9fm04YRq1AZxhtibdmc96Bg/o4k/TKQbo7P6RcwdmVL4iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288617; c=relaxed/simple;
	bh=HxLfJVsDcaETHbijsIcpmvFnlStf7pWg3qjFl3RoiBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=owgIxrbP/9D+bwUL4IFeDlCnfJuE8XgQiXQfWpr4LFe8ayfZumQ2xuXZ9wgrlxOO8zHI3hKy64ARjIAPjQ5KPVx2NN0PbPor6A91ExGDPoDwmMQd6ZpaB6KVZmqlFBLuTgR3JfhV+FpkJDtRDiCh/+aiDRCMyuzAiRfXJ0o48HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8izZCMU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8izZCMU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48B37C2BCB8;
	Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790288617;
	bh=HxLfJVsDcaETHbijsIcpmvFnlStf7pWg3qjFl3RoiBE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J8izZCMUZl8InR1OJP3OEhFqat0GOPxsFrbFZg+g2jVdzB0PYrV8eHxYZZVgjWLSG
	 aEGEE1dEWs94i8pTtVWywkjEFNBptuvYNBtBcGFdQg16fNdBpSKdorTlS6KG1o/4be
	 PB9n38VJSApPdyewD+TiFK//cXgL1nSDeoxryx7BLGZxSMGO94vfizZzm1Tsl5Td0n
	 DTVLkV4CwqvmCeNq4qTlkflFsV07WppBSZ8nPR8O1TUOngS+kQL9pSQrb+hm+yMi/G
	 Hm1rS4bHxD6Unrq7oZg6dqVjoNBGVvzWTZ8YiLcTQXQid9dUQE8Q3TZ1LHfWYbrADi
	 B3KwtFVLsiZVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2873AC9830E;
	Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 25 Sep 2026 00:23:29 +0200
Subject: [PATCH 01/10] mount_service: move the command line check into
 arg_in_cmdline()
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mount-service-bound-open-v1-1-bbf1a84c7995@bsbernd.com>
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
In-Reply-To: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1922; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=wuQi+/gnpOxzYsO4UTEWLR5x15IeF2nd5B2RO4Na2EM=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLK2Lnqclvq0Y+OnHdlRUw89qOWVX1C1wax37r7HD5W0c
 28cuagq2VHKwiDGwSArpsjSJbHHdso/Plm1r+uvw8xhZQIZwsDFKQAT4Wtg+F+nZNkitbbdyIzR
 4aJyqKjdxfkPjn2YFXtypu+fizdO/vjB8M+iLfmSzbfJiZ5HfdNsq3/Ja1TbrWUQNLvN1yPV2PH
 /CCcA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

mount_service_handle_mountpoint_cmd() compared the mount point with
each argument of fuservicemount3 in its own loop. The next patch makes
the same check for OPEN requests, so the loop moves into
arg_in_cmdline(). There is no change in behaviour.

Assisted-by: LLM
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 util/mount_service.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/util/mount_service.c b/util/mount_service.c
index 0b3266309a8a..7549e0b5024f 100644
--- a/util/mount_service.c
+++ b/util/mount_service.c
@@ -758,6 +758,18 @@ static int prepare_bdev(const struct mount_service *mo,
 	return 0;
 }
 
+static bool arg_in_cmdline(int argc, const char * const argv[],
+			   const char *value)
+{
+	int i;
+
+	for (i = 0; i < argc; i++)
+		if (!strcmp(argv[i], value))
+			return true;
+
+	return false;
+}
+
 static int mount_service_open_path(const struct mount_service *mo,
 				   mode_t expected_fmt,
 				   struct fuse_service_packet *p, size_t psz)
@@ -1248,8 +1260,6 @@ static int mount_service_handle_mountpoint_cmd(struct mount_service *mo,
 			container_of(p, struct fuse_service_mountpoint_command, p);
 	char *mntpt;
 	mode_t expected_fmt;
-	bool foundit = false;
-	int i;
 
 	if (psz < sizeof_fuse_service_mountpoint_command(1)) {
 		fprintf(stderr, "%s: mount point command too small\n",
@@ -1289,13 +1299,7 @@ static int mount_service_handle_mountpoint_cmd(struct mount_service *mo,
 	}
 
 	/* Mountpoint must be mentioned in the caller's argument list */
-	for (i = 0; i < argc; i++) {
-		if (!strcmp(argv[i], oc->value)) {
-			foundit = true;
-			break;
-		}
-	}
-	if (!foundit) {
+	if (!arg_in_cmdline(argc, argv, oc->value)) {
 		fprintf(stderr, "%s: mount point must be in command line arguments\n",
 			mo->msgtag);
 		return mount_service_send_reply(mo, EINVAL);

-- 
2.53.0


