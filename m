Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB540DFC2
	for <fuse-devel@lists.linux.dev>; Fri,  8 May 2026 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258353; cv=none; b=hSggbP4e8bXRsQZzLiKz+7Eem/jrfq1Zj1RN9UMYzZNyCGDQUfFeO0Yulq2rn/BF6CJXVY305V/Y0DduL073DjG7Mmq+GULEADdKq7osYeEH0LjiUBgu5p0tqGFrWOsMTcQYC/YDa5yzN/C2G1VE70oZwP1c9A5+HdT7KVTMkTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258353; c=relaxed/simple;
	bh=Hvw4Q+kI7jtczMYxAc3bLONjEtu4qMUbu5khNKjzaWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9UCwYjlTknLFg+24H/zgLdl8uOQmKPOUhy52Vh+a8tFpnpQuKpbjPWm+EyLGxR4SZ88o9KHiE7zdU+kbdOwUVJaTec7doY1JHRpPeQ0u9vrB5Vxyxkmt/U7KxMTdBJjrfDAmaqRRmdzjA/WVAL5uOmzfsklp5YHE/eUpJ7pkbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYKvdMgB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYKvdMgB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A47FC2BCF7;
	Fri,  8 May 2026 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778258353;
	bh=Hvw4Q+kI7jtczMYxAc3bLONjEtu4qMUbu5khNKjzaWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XYKvdMgBNOq/YdnblTDxBhCP4YX4up9bUwGTwgNQ3j5xg+lWDo2Y3kMKw6rbANqFF
	 eZd/3wT6rvaNv93UO0faErXKQ4wWjNunSGRZyU9YMslOvpWy8Z0yeqCXbLgLeIe/bZ
	 RB/EWq3/FYYSLIbcpeSsBp2HkgIAgB4KoeXfhrK+sN6AL7VjsgnNMqTdaS4KzaQNPd
	 HCqxev3KmqP8sBaPmKFFDJHauZwVzYGXpjoZvLo+xBYuUyhWZSe514IRDMgxOAo8TE
	 5Eak+aXv9b+QddH+UtOeMptTtEbiG/3qlwH/mLv2TuwOsgcpmkP0PGxMQc9fccHyjW
	 xiuXiL+NA0iqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D47CD37AF;
	Fri,  8 May 2026 16:39:13 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 08 May 2026 18:39:13 +0200
Subject: [PATCH 10/10] highlevel: Switch fuse_main_real_versioned() to
 fuse_daemonize_early()
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-new-mount-fixes-and-tests-v1-10-c67a0893ddbc@bsbernd.com>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
 Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2145; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=CwL4o77lSnyZfSeFpGCE3rBWhucH/pM1dNHMqvfex3g=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGDL/Ca6/ctAj08ajPL1mZlFw6pb7s+we1jKWhhYquz/1n
 JnRdf1qRykLgxgHg6yYIkuXxB7bKf/4ZNW+rr8OM4eVCWQIAxenAEzkgAjDX6Fm+S0i3UYbr08I
 9b++s2Sbz/uSe9Mm7HEvXNDrmffxzBVGhi3V8+bo+nvsO3TUs+L0wQP1//Z6vKtYdtaUrYRl0aO
 InYwA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

For high level we can switch directly in that function to the new daemonize
API. Additionally we need to check if the daemon has already acticated
daemonization to avoid warning messages.

Suggested-by: Miklos Szeredi <miklos@szeredi.hu>
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 lib/helper.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/lib/helper.c b/lib/helper.c
index 4d7c2b7f..15de3fbf 100644
--- a/lib/helper.c
+++ b/lib/helper.c
@@ -260,6 +260,7 @@ int fuse_main_real_versioned(int argc, char *argv[],
 	struct fuse_cmdline_opts opts;
 	int res;
 	struct fuse_loop_config *loop_config = NULL;
+	bool self_daemonize = false;
 
 	if (fuse_parse_cmdline(&args, &opts) != 0)
 		return 1;
@@ -289,6 +290,21 @@ int fuse_main_real_versioned(int argc, char *argv[],
 		goto out1;
 	}
 
+	/* The application might have already started daemonization itself */
+	if (!fuse_daemonize_early_is_active()) {
+		int daemonize_early_flags = 0;
+
+		if (opts.foreground)
+			daemonize_early_flags |= FUSE_DAEMONIZE_NO_BACKGROUND;
+
+		self_daemonize = true;
+		res = fuse_daemonize_early_start(daemonize_early_flags);
+		if (res != 0) {
+			fuse_log(FUSE_LOG_ERR, "fuse: daemonize_early_start failed\n");
+			goto out1;
+		}
+	}
+
 	struct fuse *_fuse_new_31(struct fuse_args *args,
 			       const struct fuse_operations *op, size_t op_size,
 			       struct libfuse_version *version,
@@ -305,22 +321,14 @@ int fuse_main_real_versioned(int argc, char *argv[],
 		goto out2;
 	}
 
-	/*
-	 * fuse_daemonize() already checks and fails then, but we need to
-	 * handle it gracefully here, as this is done libfuse internal
-	 * and caller didn't ask to daemonize with old API.
-	 */
-	if (!fuse_daemonize_early_is_active()) {
-		if (fuse_daemonize(opts.foreground) != 0) {
-			res = 5;
-			goto out3;
-		}
-	}
 	if (fuse_set_signal_handlers(se) != 0) {
 		res = 6;
 		goto out3;
 	}
 
+	if (self_daemonize)
+		fuse_daemonize_early_success();
+
 	if (opts.singlethread)
 		res = fuse_loop(fuse);
 	else {

-- 
2.53.0


