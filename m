Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE8A49EC6E
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593350; cv=none; b=EwTdOcxYIetlJke7r0C2I7sL4qXVfV0tZiKR/hFDjCMWhl87PwDZSY8Gv/49Yhs/78VDXFdchHZ1jHDVfsHjbtkZL5ouQV26nuXk36o87w7ZtQy8tXttKLAGRjfOZp1bZ+uTUNBsEnpWenvJuFVrN+E1DQdVGmcHoVROrpfyPBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593350; c=relaxed/simple;
	bh=zHppEWtsSpLN3mmu9QdTVfahNm3w9zAdWFwYr9e1TFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qsfL64Aoo3WSGeRVwi5SnhV4s7w35FbK19WsVQ9F9g9ACznEUbslj3Pzn69tt5xJAssv61Q40cSjVFtV2tCaa+PkhZZdRmmeCxE7kdEeojNgxEWFRFkST/CME2urGOyq4qXfxqsDJiwBb8xm3lz+w+tMcyiWwMspx579i5JqyXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTaSe3i5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTaSe3i5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60CA7C4AF1C;
	Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790593350;
	bh=zHppEWtsSpLN3mmu9QdTVfahNm3w9zAdWFwYr9e1TFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pTaSe3i5JQvvLRBXHrq0yeL/vKHEco1ehPKZMbW3+X4JFuYHqwTQo7yv/TNTxpvtn
	 eEesjZMlt5fgixA3VvqWyPSLCSYKg+PkKAQYxEWIIc96ni/TuwixlFG+z9N31LTRkQ
	 VHzGyNX+LeUthZSclsefY5CXFiTOIyyBYnhq+v4wFbIpJguD4n+jWjVkyPA0s9m2sq
	 MKGh18LnOMIYCgmTHADRON6m8zSxRuxpGmx2lUu+VmpTVuaqHub5izSI9QdmQ805AN
	 HdASl65e4X/+ECw73GXwO+ECvotTxtXkW0/Xls1AzxvOVqe9ds7Cw+l5RMCMxCtANS
	 afCz1vdKulnNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE91CA5FA2;
	Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 28 Sep 2026 13:02:08 +0200
Subject: [PATCH v2 06/14] mount.fuse: free the options on the service mount
 return path
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-mount-service-bound-open-v2-6-0f9f501d05ce@bsbernd.com>
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
In-Reply-To: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2562; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=gDoDSgMI9gAOrS8CuaxP8AOtiQE/Nkp1TOfH7s24Z0I=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJ2eTp8zFar2qoXdIdZYHNO1rWqdcZaJWefT9yf8Ha3y
 gR1TtHkjlIWBjEOBlkxRZYuiT22U/7xyap9XX8dZg4rE8gQBi5OAZiI4H+G/1FXIg94G76P3eA1
 O/p/0IxTjfNS0nJVt/dW5Ez+vVKTKZjhn9X3tskNfy5OXrCU64syi4GuR801/U+XXhTfUBJsCl1
 rxwIA
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
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
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


