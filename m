Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7228649EC63
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593350; cv=none; b=MRTcj6dNt9mamYg9oMiWv5tf29Sw1knrlCOymCZDqW+kbmZ5p45oo3WNW9BORrCrFKVsEJeApQsoV/VVVDbt2hrVafZCWN3w0HHs0SAhmTu2S+6A9DI2YIHuFAXrZxuf8IVBc1doGzoB/jCO7Y/r1ezFNmyJ1txq5JTn1eW+A9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593350; c=relaxed/simple;
	bh=Yu9f7BPFAoKQAggyjoeKVzdVgdM3uX365KXKPq4J16I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6V11OPlb39+MiB7N4t3VmlMEVfMXyGhhipmo/a9WYHYDMLGB4FE4QEchur8qLJ5sWTF2iMzwAG+sE9xgYHOSy/wF4fEnmsi5vxvXljOs7FSk3MWMrJHiu7w96StUbjkbkbtapZ4jVRdhQGR6N5XucQpNeqS2A4Zd7foWhP2AXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBx+SYO9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBx+SYO9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B42AC4AF1B;
	Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790593350;
	bh=Yu9f7BPFAoKQAggyjoeKVzdVgdM3uX365KXKPq4J16I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BBx+SYO9jnu9qC0cLDKnrh4dJlCf8cIGqEtBMW21PkDfgUV17g6LFR6ZKgVuCdnjz
	 6VNSwuKHqZPBQlUjcmkVIwXYWVRXASf1pCH1aOFX2K0PM40QRcLkb2Tjfv4nKzKPoo
	 4JoNg3zQxKRURg93pO9WO/xO/5E+90qIjhR/hC/IqOAnVmsLreBpLkdOwRA8jHvM84
	 grbhM2wpR6z+aNlTPhPuy6bQmLx06Z8cnwHIOB4gP7+0xfx7xHHxoI+Uul/ux0JJG4
	 h2KGz4acxKziTrFsIxlFF9CqKmlBmgQIe+Lhv2XThJv3KKeOoZqAZhqLotT0V7m0Pm
	 aCuOmM+Fj3i9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28082CA5FA4;
	Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 28 Sep 2026 13:02:06 +0200
Subject: [PATCH v2 04/14] mount_service: use openat to OPEN paths
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-mount-service-bound-open-v2-4-0f9f501d05ce@bsbernd.com>
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
In-Reply-To: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2591; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=wu7YOjsVW5Ox1lmjjT5k8eH7+muWHc+AaUiuvoGi8o4=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJ2edq7z9M5+jhd5i1D75Opv9dPP2+9uXW+ySI7KZ1ph
 eylp46u7ChlYRDjYJAVU2TpkthjO+Ufn6za1/XXYeawMoEMYeDiFICJiJ1jZPi/PeX+V4eyW3P3
 J7VPDX/rbrjn/gr5v2G68/T531u3yNUwMvQsO356pSdTo9ULbfY1zv5h3quFhfsyutPr/1delPi
 5kgMA
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


