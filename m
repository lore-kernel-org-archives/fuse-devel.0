Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805684FD780
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773876; cv=none; b=rrwKXeCRzv8s1QP58pg8rvn9DodKMeWDYsxUoYyKf2G0PSnb+SlPEd2ftkSxNGa/eZffxa9EK4PA2Ge0R0tU+Aiaj4yPvdM+MC2ak98GsY8WgtBoqO8Z1ONPuDeNTN8MDsKZz5n3TRi3KWbhAKVFBzZN1xGWFRgOqOt49RmKMbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773876; c=relaxed/simple;
	bh=552PXf1JP/Ta6CMKVmodeggjz71ob9KBpNaAkWC7xs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PfrY97VCIcJANrbfEr2S9ojO//5QTjbYAHH4/W82WytlksURsjXp6OWOtS0pGLaa6njZ+RW7b3wzkTiSeotkc4kkJyIqYz83txKQAg2iRp9FSNjYJiFvBFNwB5lOF+dxX2XQ30ua6L271uu9MSS6b6wVhOr3XJusahWWQ2m0yDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=puZscgrl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="puZscgrl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7FB8C4AF18;
	Wed, 30 Sep 2026 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790773873;
	bh=552PXf1JP/Ta6CMKVmodeggjz71ob9KBpNaAkWC7xs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=puZscgrl+n17bJ3NKTSWsPfJtPTmF2O9hyajxTzyPeOG9t4wnYcv/Ui6odaatzuBI
	 bWbia8vWZHVwpPnYoR5C4oC1FXVMMFd2df1avaRVRaUC4DZB8cmtxiRE1EPOcYDDlJ
	 ynHAVIWze8gWHsmXw3tizuXKVuBbwI5fcpQJG5jqDHpN9yPJm2VdnZ8vq0AsYMwRz1
	 7o+IU+Ks888fSfmEzaIo0QwkO9DkbwKq8ZFrvv59VphBXiclPm8cBojFw5eHK4W3JN
	 JfaoeaZ/qdp6IDcVPgNQUOChtqoa9byz7JIvrSlK2GWwpMa5DUbJtiSBd4VJkRJoSu
	 hbQSXnn4qLtPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC85CA5FC6;
	Wed, 30 Sep 2026 13:11:13 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Wed, 30 Sep 2026 15:10:58 +0200
Subject: [PATCH v3 04/15] mount_service: use openat to OPEN paths
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mount-service-bound-open-v3-4-e26c5e4eca4c@bsbernd.com>
References: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
In-Reply-To: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2643; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=t2IzH5vYnlchJ/E2OwTN4Ut5dkTmRzg3t2i6gFROXFs=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLL2cmXf7lz1bofhq/1JGa4zNEoZDC8YTYgU0/kyzX7H8
 0meB/3DOkpZGMQ4GGTFFFm6JPbYTvnHJ6v2df11mDmsTCBDGLg4BWAiZ1YzMmw6fM77d/W+M/u1
 Ha4WygkIXwvSvlfj+ayPf16X0joPyS0M/11qGHlXKfFMz/71UGTyPFWbjAQFy9Wbw/7oh2evban
 1YwUA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

The fuse server sends fuservicemount3 a series of requests: OPEN for
its backing file, MNTPT to name the mount point, then MOUNT. The server
chooses the order. For a directory mount point, attach_to_mountpoint()
changes the working directory of the helper to the mount point. The
helper then mounts on ".", so a rename of the path cannot redirect the
mount.

A relative path in an OPEN request after MNTPT resolved inside the
mount point. For "fuservicemount3 disk.img /mnt -t fuse.service_ll",
an OPEN of "disk.img" matched the command line argument, but the helper
opened /mnt/disk.img, not disk.img in the user's working directory. The
helper now opens OPEN paths with openat() on the working directory it
started in.

Assisted-by: LLM
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 util/mount_service.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/util/mount_service.c b/util/mount_service.c
index b4081d53273e..84e9d831ce03 100644
--- a/util/mount_service.c
+++ b/util/mount_service.c
@@ -84,6 +84,9 @@ struct mount_service {
 	/* fd for fsopen */
 	int fsopenfd;
 
+	/* fd for the initial working directory */
+	int cwdfd;
+
 	/* did we actually mount successfully? */
 	bool mounted;
 
@@ -247,6 +250,18 @@ static int mount_service_init(struct mount_service *mo, int argc, char *argv[])
 		return -1;
 	}
 
+	drop_privs();
+	mo->cwdfd = open(".", O_PATH | O_CLOEXEC);
+	if (mo->cwdfd < 0) {
+		int error = errno;
+
+		restore_privs();
+		fprintf(stderr, "%s: cannot open working directory: %s\n",
+			mo->msgtag, strerror(error));
+		return -1;
+	}
+	restore_privs();
+
 	return 0;
 }
 
@@ -859,8 +874,9 @@ static int mount_service_open_path(const struct mount_service *mo,
 	}
 
 	open_flags = ntohl(oc->open_flags) | O_CLOEXEC;
+	/* After fchdir to the mountpoint, a relative path would resolve there */
 	drop_privs();
-	fd = open(oc->path, open_flags, ntohl(oc->create_mode));
+	fd = openat(mo->cwdfd, oc->path, open_flags, ntohl(oc->create_mode));
 	if (fd < 0) {
 		int error = errno;
 
@@ -1807,6 +1823,7 @@ static void mount_service_destroy(struct mount_service *mo)
 	close(mo->fusedevfd);
 	close(mo->argvfd);
 	close(mo->fsopenfd);
+	close(mo->cwdfd);
 	shutdown(mo->sockfd, SHUT_RDWR);
 	close(mo->sockfd);
 
@@ -1824,6 +1841,7 @@ static void mount_service_destroy(struct mount_service *mo)
 	mo->fusedevfd = -1;
 	mo->mountfd = -1;
 	mo->fsopenfd = -1;
+	mo->cwdfd = -1;
 }
 
 int mount_service_main(int argc, char *argv[])

-- 
2.53.0


