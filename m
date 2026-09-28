Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C9949EC7A
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593350; cv=none; b=qs64GGboiSgL1cfrZjGOwtrrVot/eTHId+ELjQJeaqqvfukxxh0FblW9IFa7iXQz6dfGU//PfqzpCIbkPh6PFAzgrQQghwVx5tbt8xf3qntS+yC38rVyOtag3Th6UpfvxTxqsEnd3S+w0mXLAES8YFjVCwUIDMwtReII0WLxl/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593350; c=relaxed/simple;
	bh=5qJlYzoijrcAZ4+Lvlza+pdbsRw5TzeLqsh6wmZJZoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mG48SKILS7zqKbz23aflUx1haf8nOTFoi3BhNs2nXM8l+QJ7P3HVK9KAmKznQ1V2ZxYLbCLPT5yGCNeBDzDpjjfTR2k4BloI/fmpCgb3DUj4/T/JEZZSJ7shRK78wJ0jxoJ6AKQIZnsLsAN6Qq057Rtc+PUiUX3baPa8rV0SnJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiB4UB3V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiB4UB3V"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D41EC4AF1D;
	Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790593350;
	bh=5qJlYzoijrcAZ4+Lvlza+pdbsRw5TzeLqsh6wmZJZoU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jiB4UB3VtWHS9jP3jYbPE5fGnlSlzNmx3Fba5qA/IuIu1laB8dVGAxsWlnMPjbDtS
	 ZZhbSOHDmLbpQgG31NKxYlR5rT7mJyKreljRI1ffmq4ViHxKYcVQ3hrkMp33Lhv6rQ
	 6wFFJltylRVtmniesVD9zMhZ/bNtVkNB+mmyDkqTok06A9Rbh8KcnqUmMM7jS6o4c3
	 RNpP1CUqmieFIi0ggOdWxsybenMQmvyY4SJM1XrNWm0yEAY6wGzaeNakyV9JhbwNRa
	 AqWIFyC3jgTcgS1fyT0q1Ee8+i48H7/QyUZ1Xiu0R5919oBdYj53fQ1rBLxVlwYhp0
	 031KNjxsgBHNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2BDCA5FA7;
	Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 28 Sep 2026 13:02:07 +0200
Subject: [PATCH v2 05/14] util: give fuservicemount3 an absolute build-tree
 runpath
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-mount-service-bound-open-v2-5-0f9f501d05ce@bsbernd.com>
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
In-Reply-To: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=cHv54HitSu2anlu/930tbqWeXtXeZVKdqR+lf4lHv5k=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJ2eTpUsdUpaP87nbriK/cD3bMqOv/ZNk3kNjUPu54+4
 0rUoklPOkpZGMQ4GGTFFFm6JPbYTvnHJ6v2df11mDmsTCBDGLg4BWAiqV8ZGR5b/98yoenpjg0n
 diYfqfTli551qniXLLuTWHakcor01RJGhlk/mM86PApgFZfYquN7/JMpM8uWpD1f84xXPqp4XVV
 qwwIA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

The dynamic loader ignores $ORIGIN runpaths and LD_LIBRARY_PATH for a
setuid program. A build-tree fuservicemount3 made setuid, for example by
"run-tests.py --setuid-helpers", then failed with "libfuse3.so.4: cannot
open shared object file", or loaded the libfuse3.so.4 of the system.
meson removes build_rpath on install, so installed binaries do not change.

Assisted-by: LLM
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 util/meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/util/meson.build b/util/meson.build
index 28052a65536f..bc266776e153 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -22,6 +22,8 @@ if private_cfg.get('HAVE_SERVICEMOUNT', false)
              link_with: [ libfuse ],
              install: true,
              install_dir: get_option('sbindir'),
+             # A setuid run ignores the $ORIGIN runpath meson sets
+             build_rpath: join_paths(meson.project_build_root(), 'lib'),
              c_args: ['-DFUSE_USE_VERSION=319'] + mount_service_cflags)
 endif
 

-- 
2.53.0


