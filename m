Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F65349EC62
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593350; cv=none; b=CZH9ypw4pI6jFQZaneN4AHaEBRKt/Bs8CU5LKVrahot0r9P0G5POGf2uPzdvcLH3nk+rd79zOvEnYddiz7W0hhXX1fyr2V4NZM585Pxii5dX/DigOEmMqRsONF9Nz6RrVgcMOEfLBHF+1ZU+Cc4YIQkm3VQZHymu/VHxaW9pEkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593350; c=relaxed/simple;
	bh=Ycis3HFVN5pmZNd47d8LQtWXOAq+FrLH9eNxsNNJEBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qxJbfllmmtIotivVSVGP8gsMcY5FboyELw1OLSBMbDgvT9CMBdWRP99mtezmC3aYM8gimzwW1AVvhob8h4rUev1PxpnYJU9U/XtKshRFrbavP34D/8BRdH9MbZI4hpOxKEKcl7R9STKdayUHXmzfXgYqq6AnQT4juLHgy3cQaQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdoIpErO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdoIpErO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18713C2BCF6;
	Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790593350;
	bh=Ycis3HFVN5pmZNd47d8LQtWXOAq+FrLH9eNxsNNJEBs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WdoIpErO6I8xdIKUNfNQfQKdP+u2s7jBWK4HQl7qdxb6pBMcAoD9LR+08xpuTrmtn
	 HNZcFEcHESLLK4ptv0kj6B8zxIXukhxt9SzrJxtqteY0rzrTawmvG5PVifTYDTIPkL
	 dvmXmYHE4csZAvonRA62dvvsRXEMqoZA6EFb1CT2IfrGc5obeIpE8NvXYX8yJhI2OB
	 +HH33R4Xs8zjEQfpjBpOEnp1rjIc1Xpqm9DwWJTNo9WvVzKk+qKkQpOtSPsErd17kk
	 1M8qxFIDgL6J8qqbxBoooMyEHDBOKGgvpR/EOE9pQi34S6Lhrr51TCAbfuqZzNNntg
	 zoJs2qGjp50lQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE695C9833F;
	Mon, 28 Sep 2026 11:02:29 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 28 Sep 2026 13:02:04 +0200
Subject: [PATCH v2 02/14] mount_service: warn about paths not named on the
 command line
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-mount-service-bound-open-v2-2-0f9f501d05ce@bsbernd.com>
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
In-Reply-To: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=5402; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=GqqLXwzR9kDtqkiYpW8WwbLRMGloe0EUatKe3mbzwjo=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJ2edprhS95EjVvmswVS5se02cv/jyNZWDMP/o1a82aX
 R+cSr9ndpSyMIhxMMiKKbJ0SeyxnfKPT1bt6/rrMHNYmUCGMHBxCsBEFjEw/Hf8GavJ2z9j5ied
 jW9q+BP597oWCnpdOXktetndlevWu75mZFinnHX2zVnr+akJ7/Y92K7LvPbioVlhGpoM8sySP2M
 qHvADAA==
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

In a service mount, the fuse server runs as a systemd service in a
sandbox that has no access to the user's files. The user runs mount,
which starts fuservicemount3, a setuid-root helper. The fuse server
sends requests to the helper over a socket. With an OPEN request, the
server asks the helper to open its backing file, for example the disk
image named on the mount command line. The helper opens the file with
the user's credentials and passes the file descriptor to the server.
fusermount3 opens nothing for the fuse server except /dev/fuse; the
server runs as the user and opens its own files.

The helper opens any path the server sends. An attacker who controlled
the server could use this to read every file the user can read, for
example ~/.ssh/id_ed25519, and the sandbox does not prevent it. The
helper now prints a warning if the user did not name the path when
mounting: as a whole argument, as the value of a name=value option, or
glued to a short option as in "-J/dev/sdb1". The helper splits the
options with fuse_opt_parse(), as the fuse server does, so both see the
same option values. The helper still opens the path, because a server
can take a path in a form that none of these checks recognizes.

Enforced permissions follow up in the next commit.

Assisted-by: LLM
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 util/mount_service.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 66 insertions(+), 7 deletions(-)

diff --git a/util/mount_service.c b/util/mount_service.c
index 7549e0b5024f..446f37f61916 100644
--- a/util/mount_service.c
+++ b/util/mount_service.c
@@ -770,9 +770,55 @@ static bool arg_in_cmdline(int argc, const char * const argv[],
 	return false;
 }
 
+struct option_value_match {
+	const char *path;
+	bool found;
+};
+
+/* fuse_opt_parse() callback: set match->found if the path is this option's value */
+static int match_option_value(void *data, const char *arg, int key,
+			      struct fuse_args *outargs)
+{
+	struct option_value_match *match = data;
+	const char *value = strchr(arg, '=');
+
+	(void) outargs;
+
+	if (key != FUSE_OPT_KEY_OPT)
+		return 0;
+
+	if (value && !strcmp(value + 1, match->path))
+		match->found = true;
+
+	/* Short option with its value glued on, as in "-J/dev/sdb1" */
+	if (arg[0] == '-' && arg[1] && arg[1] != '-' &&
+	    !strcmp(arg + 2, match->path))
+		match->found = true;
+
+	return 0;
+}
+
+/* @return true for the path in "-o name=path", "--name=path" or "-Xpath" */
+static bool option_value_in_cmdline(int argc, const char * const argv[],
+				    const char *path)
+{
+	struct option_value_match match = {
+		.path = path,
+	};
+	struct fuse_args args = FUSE_ARGS_INIT(argc, (char **)argv);
+	int ret;
+
+	/* Parse like the fuse server does, so both see the same values */
+	ret = fuse_opt_parse(&args, &match, NULL, match_option_value);
+	fuse_opt_free_args(&args);
+
+	return !ret && match.found;
+}
+
 static int mount_service_open_path(const struct mount_service *mo,
 				   mode_t expected_fmt,
-				   struct fuse_service_packet *p, size_t psz)
+				   struct fuse_service_packet *p, size_t psz,
+				   int argc, const char * const argv[])
 {
 	const struct fuse_service_open_command *oc =
 			container_of(p, struct fuse_service_open_command, p);
@@ -800,6 +846,15 @@ static int mount_service_open_path(const struct mount_service *mo,
 		return mount_service_send_file_error(mo, EINVAL, oc->path);
 	}
 
+	/*
+	 * The file is opened outside the service sandbox, so report a path
+	 * the user did not name.
+	 */
+	if (!arg_in_cmdline(argc, argv, oc->path) &&
+	    !option_value_in_cmdline(argc, argv, oc->path))
+		fprintf(stderr, "%s: %s: warning: file not in command line arguments\n",
+			mo->msgtag, oc->path);
+
 	open_flags = ntohl(oc->open_flags) | O_CLOEXEC;
 	drop_privs();
 	fd = open(oc->path, open_flags, ntohl(oc->create_mode));
@@ -834,16 +889,18 @@ static int mount_service_open_path(const struct mount_service *mo,
 
 static int mount_service_handle_open_cmd(const struct mount_service *mo,
 					 struct fuse_service_packet *p,
-					 size_t psz)
+					 size_t psz, int argc,
+					 const char * const argv[])
 {
-	return mount_service_open_path(mo, 0, p, psz);
+	return mount_service_open_path(mo, 0, p, psz, argc, argv);
 }
 
 static int mount_service_handle_open_bdev_cmd(const struct mount_service *mo,
 					      struct fuse_service_packet *p,
-					      size_t psz)
+					      size_t psz, int argc,
+					      const char * const argv[])
 {
-	return mount_service_open_path(mo, S_IFBLK, p, psz);
+	return mount_service_open_path(mo, S_IFBLK, p, psz, argc, argv);
 }
 
 #ifdef HAVE_NEW_MOUNT_API
@@ -1838,10 +1895,12 @@ int mount_service_main(int argc, char *argv[])
 
 		switch (ntohl(p->magic)) {
 		case FUSE_SERVICE_OPEN_CMD:
-			ret = mount_service_handle_open_cmd(&mo, p, sz);
+			ret = mount_service_handle_open_cmd(&mo, p, sz,
+					argc, (const char * const *)argv);
 			break;
 		case FUSE_SERVICE_OPEN_BDEV_CMD:
-			ret = mount_service_handle_open_bdev_cmd(&mo, p, sz);
+			ret = mount_service_handle_open_bdev_cmd(&mo, p, sz,
+					argc, (const char * const *)argv);
 			break;
 		case FUSE_SERVICE_FSOPEN_CMD:
 			ret = mount_service_handle_fsopen_cmd(&mo, p, sz);

-- 
2.53.0


