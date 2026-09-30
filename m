Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5786B4EE86F
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773876; cv=none; b=JRCvLgWIT+2oT4u5QCh78kq//bxfigFtpgzD/J68k/oZ3+CYFuMcF86Z/qyf3Kelg5jtS42sxVwQ1mLcujiSJPSZsDzzLxq8p7TvjR8voNccqNd+FgvxgUaHv/Rtzi0ERMBp5jRmhCbMdzVrgDd7LSQyF+iubrdlxhlrt/SBzMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773876; c=relaxed/simple;
	bh=RzmVmyGrWeTmw4MS0ag18rfWarKpOMJ9LVyjqMdtaHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=opPyfL82tUQte7U6rescdmeYVbShPjZY2uSkZx98Lkz/ZrgUh4gj/OomAUBW57//7Tlite1vKbvOGQN8/d4vhHb1Ub+dRJQ0lfca1vkAC0yC8LCiv3oJEtNMjnQmiIlc0PWS2g7Zz+yq4y/HfHavClHrgrZ3Es0JWi8MHczGn00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vOP7agQ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vOP7agQ1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 072C7C4AF48;
	Wed, 30 Sep 2026 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790773874;
	bh=RzmVmyGrWeTmw4MS0ag18rfWarKpOMJ9LVyjqMdtaHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vOP7agQ1QcoNm3I8e2o011Choz4LkqjciRDvoA/EeBmw9EldUr4GVmxTwP0G0XfpF
	 ANQOag/D82Wa1s10hyrSqu38Afm2AcgjKlExHyws5O2yX3rsksQsZlWZdDAcuKV13W
	 edy02eqPRRFd4zz924bDRIeUZEQmrq3LRAnBEuVRBuad3jV2MTBRSl65wu15kZ/3dq
	 J9R2Rn2qfcOU+xcnwuiaIGleOFhR/2BkpSlRLyTBDmQd94WvELZFPuDwgBGZtveD16
	 nbA17EALCPBZOwFXzskYn9HLf2NwZESSH6i5y670bj4vEf/6eKXaaOf2hGXUP1h/Fd
	 gLu0Ve9biwtzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB677CA5FC7;
	Wed, 30 Sep 2026 13:11:13 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Wed, 30 Sep 2026 15:11:01 +0200
Subject: [PATCH v3 07/15] example/single_file: take no sector size from a
 regular backing file
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mount-service-bound-open-v3-7-e26c5e4eca4c@bsbernd.com>
References: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
In-Reply-To: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=EaHgkvpPQR5rqjfDXehncXfjfUOjcvESPDPi9Xn4UQY=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLL2cuXcqG8Tzg7rPLfs7rdkdtbJayvef+G/d7/BP26za
 onzuVPhHaUsDGIcDLJiiixdEntsp/zjk1X7uv46zBxWJpAhDFycAjARgTmMDJffHvu4afncaxqF
 oRYBC+f0mbxj/xO+Nkzh5loP3Z7zd24y/C9oyfjBtP+Jx81r+nMOXS0zNl4201/jstQ1e/+rDoE
 5m5kA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

From: Bernd Schubert <bernd@bsbernd.com>

single_file_configure() took the sector size of a regular backing file
from st_blksize, and refused to start when it was larger than the page
size. For a regular file st_blksize is only a preferred I/O size, and
the file is not opened with O_DIRECT, so any offset works. NFS reports
1 MiB there, so service_ll and service_hl failed on an image on NFS
with "lba size 1048576 smaller than blocksize 4096".

Assisted-by: LLM
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 example/single_file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/example/single_file.c b/example/single_file.c
index 59dbc6bbac5e..4260ecf3c5f5 100644
--- a/example/single_file.c
+++ b/example/single_file.c
@@ -887,7 +887,8 @@ int single_file_configure(const char *device, const char *filename)
 		perror(device);
 		return -1;
 	}
-	lbasize = stbuf.st_blksize;
+	/* A regular file takes any offset; its st_blksize is only an I/O hint */
+	lbasize = S_ISBLK(stbuf.st_mode) ? stbuf.st_blksize : 1;
 	backing_size = stbuf.st_size;
 
 	if (S_ISBLK(stbuf.st_mode)) {

-- 
2.53.0


