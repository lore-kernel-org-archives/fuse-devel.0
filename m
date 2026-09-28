Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F47849E130
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593350; cv=none; b=ZEXWUbF48BEqwP7JGK+NBgEwL7W6e3Z/AgXa76mFOgy+Uz76pUhNxs6sFl8yzRokiRxJZunKPmvrhkbFeAD6MGBGlUBua80adAqmLJzlRnlKArGzHjF42oNoVFg3AsXAEYIZ3/lUoKWIzt+vyP7/U44OzO3mteW/i/imBoSfkYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593350; c=relaxed/simple;
	bh=G9mGiawP0KzBwGQsdqJC1zWBVPdWfq9IDfU1lkg1Sz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kDlSebtVwDlPG8vxmQfLv1OsM0hkM+P4BIp6t2x5hntmrt/NUVpD1u6qOczskDL+NSErme5TSmtwvrX75pM7QDwtX/PPMirEyL2d8ZC761YcQQI+IMXYa3go7utB1ED0IHzF5SY97phyPwwNuPY2dnoVOB+Y2YuYhK6QHthxq8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtlgN2sZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtlgN2sZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0766BC4AF12;
	Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790593350;
	bh=G9mGiawP0KzBwGQsdqJC1zWBVPdWfq9IDfU1lkg1Sz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dtlgN2sZoskKm/TcKQFnPH461/LIeTdH2GRbtpFmms7cXUEjsRFg+INGDZ6Fd7JOL
	 g5Gz6P2jA+z99N/IDycj8B4nvfEvXkE2Ej59TVgepDkAr8G8VaCJyR8ijFH8pXmoOW
	 qyhY3VV/XVuxgDoML/FOIPJUqNJqnwSRbvY5znsDdT2V8QYIvWtARUEFRPWTuFrzd3
	 rKkC0A8qX6qL6V13LyoYalp0fEpYfv3G07D7Qt6p3JTQNTWdCIRAgxuSGuDFKMjFRi
	 fFzwPJ+uRrbp4wtBGKTstb6PNPSM/Mkmv1DnLzby2lr7b6eZqgPlP+fg7gdlHMHHZk
	 7kLzUffjIiUBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD611CA5FA2;
	Mon, 28 Sep 2026 11:02:29 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 28 Sep 2026 13:02:03 +0200
Subject: [PATCH v2 01/14] mount_service: move the command line check into
 arg_in_cmdline()
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-mount-service-bound-open-v2-1-0f9f501d05ce@bsbernd.com>
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
In-Reply-To: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=O/RxCQuoY0O5A1zN31WQ0hqU59Wsq0EeUlzrFOg765A=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJ2edop/JV7Yyi0Kt6LiV9utcqXW3t3f16Z8vjIF+nZD
 I+1NQJbO0pZGMQ4GGTFFFm6JPbYTvnHJ6v2df11mDmsTCBDGLg4BWAizAEMf6V+8qYpLfu/q4qZ
 oYXHqVMo5OPa4ykOLxdPFqx5k+itz8zI8P9F/7NrPQ9Zfa3sPhvnfZZ6/DW+W47F5NPqKh6Fxyr
 5XAA=
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
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
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


