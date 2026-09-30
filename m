Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23244EB879
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775888; cv=none; b=mpDtaX9yjPJkQneI68dZcyz1ddFGzgILELnnZ0gowdsRL6NvM0bNvQwmAiFK91IaA+vYECqnUWIDVXui8AQHbOa/0d2oaHME/zAoHK9cHkNyUp33w5DFyqnycKYc30jGDaCeEQRy2epvCB+UhqWcPBjVkf7oy0NIWUYK/CXqJAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775888; c=relaxed/simple;
	bh=TNSMJrU1G/yJHKD98KVP4AYmmvbI8f+DqKzWUNwzRPA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g6kfL2xwzcEU6vDq04WYTiCIp2qZJtZ4z4wirEOJi0qY+laGwBoErpmvV5RGXwKvTty0yYhpzqBZPmNkHeTrb70wVLuot3X13oE0P3LQ9wvEh2fagrbz3Q9hgQV6BCCLGy44L38z16QEvfRG1niHRoGLgOqB04ovnkgttS/eHaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNkRbREn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNkRbREn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59E97C2BCF4;
	Wed, 30 Sep 2026 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790775887;
	bh=TNSMJrU1G/yJHKD98KVP4AYmmvbI8f+DqKzWUNwzRPA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MNkRbREnArIMDKyHPWbN24K9W67XCL+vNkx9hr/Znd7bJPSJ5jXyeE11KMfFV5e45
	 sApE3RN5F2y28GQNv//o5Z5ceQly6OMxEVbWJHPymg2ZtIooxtZgR+MXuBLY/FCUlo
	 iwl7jH2J3SrU1vkOA5DVVvDRmX/M42vXqce7hThJRx+LnlZvQiih2i+6gNvMpCntDY
	 HLBXp6xlbq0fXRoRELHwSp3CcWiShZjadmjg3Vb8zk36ZPMA75iodcEGvNjKP/Ocy7
	 lmdYH0eEe9+W87QLV9Ko4iV9ygsFU52ogD9NGFDYiabhnQ4cQb0vne8lK9PECDRa+j
	 5l4nGXdaYNQeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3614BCA5FC7;
	Wed, 30 Sep 2026 13:44:47 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Subject: [PATCH 0/4] libfuse: Avoid mount API code dup between
 mount-service and libfuse
Date: Wed, 30 Sep 2026 15:44:32 +0200
Message-Id: <20260930-mount-service-use-mount-fsmount-v1-0-d585598896ee@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQqDMBREryJ/bSBVkbZXERcxGdtfMEq+EUG8u
 1G7Gt7AvNlIEBhC72yjgIWFR5/gkWdkv8Z/oNglpkIXtX6VWg1j9LNKq4UtVBT8m17u7FwNo6u
 nKZ2hZJkCel6vh6a9WWL3g51PLe37AZIx0hiDAAAA
X-Change-ID: 20260930-mount-service-use-mount-fsmount-bd6ea048a3da
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: neal@gompa.dev, fuse-devel@lists.linux.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=TNSMJrU1G/yJHKD98KVP4AYmmvbI8f+DqKzWUNwzRPA=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLL2Cnmk9e89MD9c+b90z4ZvfIz1ujt+zr3W3ibBHFzrV
 fnyUkhERykLgxgHg6yYIkuXxB7bKf/4ZNW+rr8OM4eVCWQIAxenAExEK4zhf3i/50XFv4tjTnHM
 u7j9eJe59Ls1RyIuM8r5pM98/eKNsycjw5XJ1eevb1q4bfYzj50fgj+6XTnn3nRY7MGLHfPZbPI
 Pb2EDAA==
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

fuse service mount was written in parallel to libfuse additions of
the new mount API. Service mounts support the new mount API as well,
which results in code dup. In the mean time libfuse also supports
the new mount API through syscalls without glibc wrappers, as some
distros have a sufficiently recent kernel, but a too old glibc.
Those wrappers were mssing for service mounts so far.
Easiest fix is to avoid the code and to redirect service mounts
to what libfuse already has.

To: Darrick J. Wong <djwong@kernel.org>
Cc: neal@gompa.dev
Cc: fuse-devel@lists.linux.dev

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
Bernd Schubert (4):
      mount_fsmount: split superblock creation and move_mount into a helper
      mount_service: mount via the shared fsmount helper
      mount_util: share the mtab flag-option builder
      mount/fuse_service: share the service socket helpers

 include/fuse_service_priv.h |  59 ++++++++++++++++++++++++
 lib/fuse_service.c          |  72 ++++++-----------------------
 lib/mount.c                 |  21 +--------
 lib/mount_fsmount.c         |  98 ++++++++++++++++++++++------------------
 lib/mount_i_linux.h         |  18 ++++++++
 lib/mount_util.c            |  33 ++++++++++++++
 lib/mount_util.h            |  20 ++++++++
 util/fusermount.c           |  33 ++------------
 util/mount_service.c        | 108 +++++++++-----------------------------------
 9 files changed, 223 insertions(+), 239 deletions(-)
---
base-commit: 5f8a64b0835620ab88afd8a59a713d5b6a9e99f4
change-id: 20260930-mount-service-use-mount-fsmount-bd6ea048a3da

Best regards,
--  
Bernd Schubert <bernd@bsbernd.com>


