Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21D5408031
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288617; cv=none; b=vEquLQCh0cHs4ZB8y5a/tNcUyzUtTjKu45XV4yAmm2KiuTDmHKVN9u5E0m93Q0EhJgna6kgxogkVneH0qIeuHQdS7cKBQJUNISBJ3z9k5Aflo1XzYip0lhH5a0hBC9qJD9I+SNCm+zJG0t2FKXltESkjPgl62ZRXlWzXJVOQBUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288617; c=relaxed/simple;
	bh=69D5HHiLWx8ZlXix9mzGsxZwLICaU/8zQC4CUtS0ROY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lMFY0lbXArtFRDJZGvDJ1yQ3y+7ZH48oCBZmERGkY8MQsUmzY2hWEUaloC+Wy77dqUtq/cnXguzsk/pXFumDtVsW+BwpxJ8uNf8+eWedkFZPZcDHpvjJnHPCm4r217MQ9+HKfcbgmDcqFtOatSAJcqDEg0esg4ux8WQnbThV+qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZze2kvc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZze2kvc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 963BFC2BCFF;
	Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790288617;
	bh=69D5HHiLWx8ZlXix9mzGsxZwLICaU/8zQC4CUtS0ROY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eZze2kvclEH8grhAqunuALV5wyZDauz/m21QBgWXdSHj89GsNrD/4qVQy9hKS7Hz+
	 swZ2VEx43psZYoSwOYaTKFLPMMdC27KrOrNpLGhb7HnRyxe3OvU/DR0O+4SrccHWn4
	 kKtdkUA/afCXAcjcVoqYfFcO3TGj6XCot2qES4MMv01H1ScP8nDmpnvCUhtXtVqq5P
	 bXgXbhF2UBt05USXR0JUHCeqArOhYdq2L/MWa2dElOj6otEbniN/ZE8YX2t/+GO0I+
	 WLQEUMsFvjPwR9zxuUENHK+H4l8Df1dSe79DdYxSxeCBOQqzy4rf91YmQwdbVvMuJa
	 z/OR/ZFI+IuXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8515CC9830E;
	Thu, 24 Sep 2026 22:23:37 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 25 Sep 2026 00:23:34 +0200
Subject: [PATCH 06/10] example/single_file: take no sector size from a
 regular backing file
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mount-service-bound-open-v1-6-bbf1a84c7995@bsbernd.com>
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
In-Reply-To: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=iQGI5XBpYIw9sZ1fmYdLA8tHv9gJ9aAV1u8DgxBr5lg=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLK2LnqqsH/O+lfO6vfa652jTqzjVuNSnajlHBSklqtbk
 HnhUnZ0RykLgxgHg6yYIkuXxB7bKf/4ZNW+rr8OM4eVCWQIAxenAExE7y7Df69090nhRxzjG+wf
 /FYPMGh+0b3Ph3ti3IJHqw3N+wRXnGVkuGrQ/7X10cM3i2dsEtnlXfhvw7HIIMYdnBXT1dad+zr
 1KzsA
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


