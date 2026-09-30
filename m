Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087AE4EDCB2
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773875; cv=none; b=he/2tMYcWS5B08T3GLKBHZOKpOiR2zD0o7VnCrNISwPmUH/7K5Vb8c5rbun0/KmXsxBnbyAsvYRxKqb6JshJWR3hd/CtD28HrJlS9ep44ZGS9W9OnaP8RiLFV3PLEA+rLig2XMUNEIZNcCdAl2d8jNVgytsmHB0cBKT4MUYZMCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773875; c=relaxed/simple;
	bh=5qJlYzoijrcAZ4+Lvlza+pdbsRw5TzeLqsh6wmZJZoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=imRdyHpTP0C22NldygfMYtTwx2ruQ2yGx4QhR+sTbRTWsIQHWFliHPWQWkNSr8ZVe1FV7otJxtMRMubSPy8QKpx8tqlpTdAY0kSjbeYftW94afS5vd0m/T9VvY0KZKXOFgLgt00F29RSXF4XNg+lgJZ1EfKMQu1cgu4YHkX8cLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsGClgIV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsGClgIV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFC9CC4AF17;
	Wed, 30 Sep 2026 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790773873;
	bh=5qJlYzoijrcAZ4+Lvlza+pdbsRw5TzeLqsh6wmZJZoU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LsGClgIVfSUVmSBPDhqw2ECZvqa0AoC9/Wt1ZHMZHIL1baHDwBJPUJrkgOON2Smsd
	 l5/3tRRa6jOBm57ac6wlU3/+Qc1MRP4LIFuGa22AgUn1p9c7ZxSLVyPJuQK60kIYDa
	 uLtCCHq0+jdKsJJ4I4WwD0Or4X3kc6/6ptHieohvI23AkZ5NNbOV7Pm4tJd9Nlaxb0
	 23Iq17c7Mlop1OHiG4f8zvDjGrp+K04cbq/WQFO2nRtV2ZU6DA/0A6BMRPOSANLZxS
	 BCiJED7gSXHlQGJ6BOvDTATiRoQLmkaWLOb0Tl8stE40J1+J3ob8xFiKMxWv9wMkO2
	 S7ckfrRBVFFBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC42CA5FC5;
	Wed, 30 Sep 2026 13:11:13 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Wed, 30 Sep 2026 15:10:59 +0200
Subject: [PATCH v3 05/15] util: give fuservicemount3 an absolute build-tree
 runpath
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mount-service-bound-open-v3-5-e26c5e4eca4c@bsbernd.com>
References: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
In-Reply-To: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=cHv54HitSu2anlu/930tbqWeXtXeZVKdqR+lf4lHv5k=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLL2cmXfreZeeTbuHm9QY20J+xvJIBcvY5F25fofJTppy
 078eba2o5SFQYyDQVZMkaVLYo/tlH98smpf11+HmcPKBDKEgYtTACbSNZXhf1o6Q9Oc9Xsjtz9s
 kd4swDxNcPEp0zXx/j7mFVH9VhW7FRn+x8xces6r+IZPxG6uZ+vzw7qC783RXadmP29xzBJzrZe
 +fAA=
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


