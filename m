Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031794D4865
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773875; cv=none; b=A68NEBcvvWNKr4JC0SBSZ4BLgBNc/f50T0JSH1QCKGdUdW9Zbq+Mlj1V+Ne4WaqVFvCG170OIFga+A3QwmnPow25SnRoUGg3BwHFLqWTZxA5YawIYJlOpOlWev8uCxitePlgjBZA2Y7Rj+rvTvbbWoOQqMA6Mxg7fZnM1USlI/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773875; c=relaxed/simple;
	bh=G9mGiawP0KzBwGQsdqJC1zWBVPdWfq9IDfU1lkg1Sz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G7/CN1vMBlJhE/YU34qwaVRCtSWJpj9QF/dZsYaZzfbRSyh6x/OD5RYB8rweS92t2igMOY8gYxVgB9CfLTFopNuJViHVsjR4PIKg8Isdwz9uCEvx/wkhBVebL3vl20q/NNS7c/dE/EBGIWJN0qjFmtjqISJoQ30Lery4hzVegvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHj8FB6F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHj8FB6F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B604DC4AF0B;
	Wed, 30 Sep 2026 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790773873;
	bh=G9mGiawP0KzBwGQsdqJC1zWBVPdWfq9IDfU1lkg1Sz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iHj8FB6FSTSeBrWuqrsVuB4dtAD58RB/LT07fAHE/bByLdLKqUirdSSbKYG6yF+sU
	 SgtWHRoLC9dOgsQeUrd1q2F9R7ssm/Uc/4AdFBMsTC/7srIdIqGk2aPqSv2Q/WGPAU
	 IYTT+g6uA1fdyg5X1ELUmPiLcsArkZIxMsXPpd/ijcdSsI5cDed1eSZT2W4bIrsqse
	 DVtttdP6xgztQzraajoRz5Dhr9zTdZMWKkvQefxRLscwbOWuTENUz5Hf/UsqkDZ6Ft
	 GI/QPar9L328a7RUel+XSXKxpuLq1QuAsLCGqXbK6skcv1oyctuHS1djAWWssm6Zpp
	 5MiV98bJaPDrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9492FCA5FB1;
	Wed, 30 Sep 2026 13:11:13 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Wed, 30 Sep 2026 15:10:55 +0200
Subject: [PATCH v3 01/15] mount_service: move the command line check into
 arg_in_cmdline()
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mount-service-bound-open-v3-1-e26c5e4eca4c@bsbernd.com>
References: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
In-Reply-To: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=O/RxCQuoY0O5A1zN31WQ0hqU59Wsq0EeUlzrFOg765A=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLL2cmV2Ze3c99k15Zbcpy5BuYV1qy1OVRWk/pzZ8y/S7
 du5vg6WjlIWBjEOBlkxRZYuiT22U/7xyap9XX8dZg4rE8gQBi5OAZhIeAnD/7A/KeG/5T9eZVJ+
 I9g1/anV0+pFIa+0CgyvuOZctv2+bRIjw9Z3N8t5u/ge3nI/Us+a6CP30sv7bbL+wd0em1pkuoX
 UmAE=
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


