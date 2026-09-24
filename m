Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF413FC5C3
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288617; cv=none; b=Wv3iiHg5GKY2CEQI9E/htA+DMX9RJPzJxJlYNFnoej8rNaAY4Q1z6a8dl6UspYZDZEaj5Dp5pv3lcFD/jRR/Ue1vWJRxG3hFAxDVOakavV1YrwiRxIoolVlOtEEWFWoBXpUJYSWUgJ0R6bzmq0/bchmZDjKwnZIGeHZ5wCaCA94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288617; c=relaxed/simple;
	bh=6DCF4IvnOu6NQc2EXXWoCfHEpBtGorsij2QSCKLQB6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nj6BkwSwLga5xIh5nNsk2iTeP02xlA3fgJn9NUxzWPPqwZa5zthTHUmi1LwDDjIIg1kFiHps+RFoS+9PAiELIqCbvjPl8dC84mMuJDaa49XeqxKOP/0dCJu5nb0F1ovaKo04wrXQ5jM4M3m229zzqhGwXu+qBGTDZSES54g90fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvrREVTk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvrREVTk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65181C2BCF7;
	Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790288617;
	bh=6DCF4IvnOu6NQc2EXXWoCfHEpBtGorsij2QSCKLQB6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bvrREVTknbFUtF44XrNUc+/evbTsFE1CPyFQqB1ORba5M77t5Sh8q70ak2kIXTxf2
	 e8Y/ovV9GI0ygCDUWZP+MPfcshYZaf0i1mWq8sj7JBpwtXsIV4+8PJ4oCzzNv5sMDb
	 OE3xju4Ln1N6m32dfXyIbzlXN4bRtT3oVxm2oYrpdDYzuOlEVuHJjma7m7DtrbqFGS
	 wa9rcgsRolb7hxZnJQEuGBHa6zE0ICuCvncMEFReZWhr0mLZHm0jLTFtvg9kyRdOOU
	 6CrbowkoW09UmQ3xZB7nYsmcHpb5sHXcM5wK3DWvVynysd6/Bd31sgAob4y5PZv6F9
	 narKKcUPgqWTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C528C98318;
	Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 25 Sep 2026 00:23:31 +0200
Subject: [PATCH 03/10] mount_service: refuse OPEN after the MNTPT request
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mount-service-bound-open-v1-3-bbf1a84c7995@bsbernd.com>
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
In-Reply-To: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2878; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=7wcBx8/lW0cSYcKLbObPecvT5B5w3XTIogJlhwwIxeY=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLK2LnqSOOdkgtmixknZ8/6k65wRF49TuBi8aeKT9IZZE
 y070r5u6ShlYRDjYJAVU2TpkthjO+Ufn6za1/XXYeawMoEMYeDiFICJmD5k+Gf9Q9puRZTRh/SP
 lfHMSl+N34VLfrbZHHmn0UWs1dCwgo+R4e+bXdeSTDfKLWmJdkia1N0fOv0gw3LDwiTWa6veLEm
 fxgQA
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
helper now refuses OPEN once the mount point is set. No in-tree server
sends OPEN after MNTPT.

Assisted-by: LLM
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 doc/fuservicemount3.8  | 1 +
 include/fuse_service.h | 3 ++-
 util/mount_service.c   | 7 +++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/doc/fuservicemount3.8 b/doc/fuservicemount3.8
index 06755d7c3c4e..9b8c752b3bb9 100644
--- a/doc/fuservicemount3.8
+++ b/doc/fuservicemount3.8
@@ -22,6 +22,7 @@ framework.
 The FUSE server may ask fuservicemount3 to open files on its behalf.
 fuservicemount3 opens only paths that appear verbatim on its command line
 and refuses any other request with EPERM.
+Requests after the server has sent the mount point are refused as well.
 
 The second form checks if there is a FUSE service available for the given
 filesystem type.
diff --git a/include/fuse_service.h b/include/fuse_service.h
index 3954f62aa2b8..56f40a44b670 100644
--- a/include/fuse_service.h
+++ b/include/fuse_service.h
@@ -139,7 +139,8 @@ int fuse_service_parse_cmdline_opts(struct fuse_args *args,
 
 /**
  * Ask the mount.service helper to open a file on behalf of the fuse server.
- * The helper refuses a path that is not verbatim on the mount command line;
+ * The helper refuses a path that is not verbatim on the mount command line,
+ * and any request made after the mount point was sent;
  * fuse_service_receive_file() then reports -EPERM.
  *
  * @param sf service context
diff --git a/util/mount_service.c b/util/mount_service.c
index 835d3d94aa4a..1f25dcde0349 100644
--- a/util/mount_service.c
+++ b/util/mount_service.c
@@ -801,6 +801,13 @@ static int mount_service_open_path(const struct mount_service *mo,
 		return mount_service_send_file_error(mo, EINVAL, oc->path);
 	}
 
+	/* After fchdir to the mountpoint, a relative path resolves there */
+	if (mo->mountpoint) {
+		fprintf(stderr, "%s: %s: files must be requested before the mount point\n",
+			mo->msgtag, oc->path);
+		return mount_service_send_file_error(mo, EPERM, oc->path);
+	}
+
 	/*
 	 * The file is opened outside the service sandbox, so only hand out
 	 * what the user named.

-- 
2.53.0


