Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C227F408614
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288617; cv=none; b=AOHMQ59v902SrR1T23ZwRM3Pzc7UuK72D45hxs5Swfm5L2B7Yx0Uy201m2184vBFxjHcuF5MJrWQplp+R2EzNHFe6x4LI/t9Lh5v4aATkGMPa4OYOqfpzacrKcBTVKlTZrMBShhVWqDd5ShoTm65tVyNmexgm+xmtHGWMy2SlU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288617; c=relaxed/simple;
	bh=Y5Bt9VuNqjccItd4eIsv5I5gKtOTisJ/GqFX7gtDzjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7hUCfmmFSZ4TfQq7BQh+wgCptJsmqO8Px/FvaxMFr9jzlPdDUtiOQytA6iLJmLioddlGV5myzUD2ZL4CZSjppdjFJkArBVhl8Jsw9K//NVqa2ScWyU46RPfseWSZ4TJ8z09Z/Y7q3Qk+vaAobXJfF21zNlm/i0Ig/9f3w5xFJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWmTQEdU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWmTQEdU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82FB2C2BD01;
	Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790288617;
	bh=Y5Bt9VuNqjccItd4eIsv5I5gKtOTisJ/GqFX7gtDzjQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OWmTQEdUs1/JwXn+8aQkTbBvGKMJhDiRI1jN6pdiv8Cj02N52hlOUouNCOOH/4foi
	 KSgUFC1e789LH1GW8KP9oAAj/KokLz3cEBTzsv2SX9eBsVXPBFi+kHWNp46NCPoLPa
	 wxNH1ZYCzAoNSZCxTu7xNnOoJ51c6Cip8JGp/bkp94Ganv5OE3Sqzqdjn7l7kEZv3d
	 hwMzvWdi/+3YedO36zBxLnzZV7brkHFcjemUVkZe7ALPVHLJY5eEdApZaHRv4Y3AIk
	 Q3pxEP8UmC0sEybI5+XyPh0ckIegYHgnmdt89Ew/v8C7d50MQdmAtiRGpl0kVq0+iI
	 TzRUZ0vGD0S1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EAAC9831E;
	Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 25 Sep 2026 00:23:33 +0200
Subject: [PATCH 05/10] mount.fuse: free the options on the service mount
 return path
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mount-service-bound-open-v1-5-bbf1a84c7995@bsbernd.com>
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
In-Reply-To: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2510; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=Kiroubsoa2m5uKq+sF2uPCYEtf9sYbG3cFTMK0eWPxA=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLK2Lnoqvk2g+kt8QNoKzwd1BU2HbRrUmt5d3xyk5ex9N
 +g2F/vMjlIWBjEOBlkxRZYuiT22U/7xyap9XX8dZg4rE8gQBi5OAZgI23KG/zWswpI5WQd7qvkf
 TI9mX815c7HpmhfRdp2nTklsOVrMvZHhn+2i476pgkuLFgWm/WZ7+fT/r53iol9bz9zYuzvP7a6
 fPz8A
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

These leaks were detected by the new tests.

Assisted-by: LLM
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 util/mount.fuse.c | 42 ++++++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/util/mount.fuse.c b/util/mount.fuse.c
index c67a0c2b7f2f..1414265fd274 100644
--- a/util/mount.fuse.c
+++ b/util/mount.fuse.c
@@ -56,9 +56,7 @@
 #endif
 
 #include "fuse.h"
-#ifdef HAVE_SERVICEMOUNT
-# include "mount_service.h"
-#endif
+#include "mount_service.h"
 
 static char *progname;
 
@@ -396,6 +394,18 @@ out:
 	fuse_opt_free_args(&args);
 	return ret;
 }
+#else
+static int try_service_main(const char *argv0, const char *fstype,
+			    const char *source, const char *mountpoint,
+			    const char *options)
+{
+	(void)argv0;
+	(void)fstype;
+	(void)source;
+	(void)mountpoint;
+	(void)options;
+	return MOUNT_SERVICE_FALLBACK_NEEDED;
+}
 #endif
 
 int main(int argc, char *argv[])
@@ -415,6 +425,7 @@ int main(int argc, char *argv[])
 	int fuse_fd = 0;
 	int drop_privileges = 0;
 	char *dev_fd_mountpoint = NULL;
+	int ret;
 
 	progname = argv[0];
 	basename = strrchr(argv[0], '/');
@@ -608,19 +619,17 @@ int main(int argc, char *argv[])
 	}
 #endif
 
-#ifdef HAVE_SERVICEMOUNT
 	/*
 	 * Now that we know the desired filesystem type, see if we can find
 	 * a socket service implementing that, if we haven't selected any weird
 	 * options that would prevent that.
 	 */
 	if (!pass_fuse_fd && !(setuid_name && setuid_name[0])) {
-		int ret = try_service_main(argv[0], type, source, mountpoint,
-					   options);
+		ret = try_service_main(argv[0], type, source, mountpoint,
+				       options);
 		if (ret != MOUNT_SERVICE_FALLBACK_NEEDED)
-			return ret;
+			goto out;
 	}
-#endif
 
 	add_arg(&command, type);
 	if (source)
@@ -631,17 +640,18 @@ int main(int argc, char *argv[])
 		add_arg(&command, options);
 	}
 
+	execl("/bin/sh", "/bin/sh", "-c", command, NULL);
+	fprintf(stderr, "%s: failed to execute /bin/sh: %s\n", progname,
+		strerror(errno));
+	ret = 1;
+
+out:
+	if (pass_fuse_fd)
+		close(fuse_fd);
 	free(options);
 	free(dev_fd_mountpoint);
 	free(dup_source);
 	free(setuid_name);
-
-	execl("/bin/sh", "/bin/sh", "-c", command, NULL);
-	fprintf(stderr, "%s: failed to execute /bin/sh: %s\n", progname,
-		strerror(errno));
-	
-	if (pass_fuse_fd)
-		close(fuse_fd);
 	free(command);
-	return 1;
+	return ret;
 }

-- 
2.53.0


