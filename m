Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A8140626E
	for <fuse-devel@lists.linux.dev>; Fri,  8 May 2026 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258353; cv=none; b=b0r9p+tpcPhADzH1yvSyoVQMXmiNwZXAYXXzSVkq8NpuXvlXu6TdR+2KlBEKejChmEZZbXqEvLdk19odMHkHGWOTte5SvF+l7OUd4G4vCs4qw1kzhXD99Pc/TbcM7jYz94bJhYp6mRkBpuY0vFwrxKVXAwvPjyFKnYAKDOfbjv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258353; c=relaxed/simple;
	bh=T44q8fAgMDVu/h6i8qsg0354DuXFMos7GeWjhTQ8AwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rXCPQZdlAJk3hsd2It/pwOEKjpjWvirfvAHItD50jIRoIEFWIKZ/OZg+ZyRPz54SwngrkMfXQ2bDZNPrGMVNtWn4KOOfXB7GHkhl1LcwP6ZB6r9Xmqx350voYs/+Pjh8RfZjMALhSAa+Oggdt8CBpU58l5t3M4MgD8tkJy2H/ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnDBOON7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnDBOON7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36DFEC2BCF6;
	Fri,  8 May 2026 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778258353;
	bh=T44q8fAgMDVu/h6i8qsg0354DuXFMos7GeWjhTQ8AwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TnDBOON7exgSU87K3rsFLdLwGFhCLx5/tSWUq780QK2y98Eto4Iz1Gv4kLwnL+QQQ
	 Ghkv4Dafy9rJuZzgNaZJcnIz2k/K5Pb/trUX293YfRg010WlK+I5u2tDl3AWiEuvbW
	 YmpVV0cnYwaJYcJ+qfc0p6lJ8zKAFCHqGoBQJSOhp+yiOw9sGr8AE83VlwOBRoYn/Y
	 4wJwldEs5rJzCaKvOa7HxQxjXjZPPluhIpmWzUjwm6vhf86HID6EyPYHsNkxht4srE
	 jyDQ1D2r5tZQkhlmqG+04LIzNSacbEsdDFVdQ+zFqf8mPy+lve5ExKPv3QgERUHDHn
	 bEIBoy2b7Bzsg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309F0CD37A7;
	Fri,  8 May 2026 16:39:13 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 08 May 2026 18:39:09 +0200
Subject: [PATCH 06/10] example: silence add_languages warning by setting
 'native: false'
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-new-mount-fixes-and-tests-v1-6-c67a0893ddbc@bsbernd.com>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=835; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=2T00swt99g8sLBC7Xl3XVQfaKOApIVe39HlqufcWIVE=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGDL/Ca4V4k0LUPy4Va197XHh6RJzIxRb+1L2/vOf1Wi67
 ubFHzcedJSyMIhxMMiKKbJ0SeyxnfKPT1bt6/rrMHNYmUCGMHBxCsBEShYy/DMQ0qo+1KDV7Z12
 x7jh6tzb+9cfYj9WcPEHoySzwLzpIesY/oeo9l2PDfthEnHM95ftDo0FK48IlBz7mP+G6U96QfX
 vR3wA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

The C++ examples (passthrough_hp, memfs_ll) link against libfuse,
i.e. there is no cross compilation from example/ point of view.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 example/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/example/meson.build b/example/meson.build
index 76cf2d96..31e69187 100644
--- a/example/meson.build
+++ b/example/meson.build
@@ -32,7 +32,7 @@ foreach ex : threaded_examples
                install: false)
 endforeach
 
-if platform != 'dragonfly' and add_languages('cpp', required : false)
+if platform != 'dragonfly' and add_languages('cpp', native : false, required : false)
     executable('passthrough_hp', 'passthrough_hp.cc',
                dependencies: [ thread_dep, libfuse_dep ],
                install: false)

-- 
2.53.0


