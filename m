Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D48049EC64
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593350; cv=none; b=cpuPOMQU9bJSzCdiyRcuPELuy81ztU6d2+7WXeo+57LyZPPM56EWhNcZbqvoPl0SohsxNzEh5mJ509FT6pC3dlYj1cAhwMpy9scCSCKbbW6KLZOtsJCxqCulxEhWw4+4ALy7HICcVVu629uu5fUpSZm0OiYnyLJMZ75J1oAUrA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593350; c=relaxed/simple;
	bh=RzmVmyGrWeTmw4MS0ag18rfWarKpOMJ9LVyjqMdtaHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NKrzc38Z6kNqvS+St2sXdKtGnhYKMshI1wFXvlLtoM4JbLMfQjZ8HQJnPSX77DJhSXvYt8h7SixOS2Enyv6umnIybYzGtY0QhEN53ZA2cv6WNJtns1OB5/XuQujU6UHIsDuUFnt8hMBFpY1UqhqPMePpmzamZW8VvKUltTyAYxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PB8RLuz5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PB8RLuz5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75A59C4AF16;
	Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790593350;
	bh=RzmVmyGrWeTmw4MS0ag18rfWarKpOMJ9LVyjqMdtaHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PB8RLuz5cB/TkDYwdCusbqA/gzT0VUUeHFwEiHd6fwUdGv6tzBsQeAoeXIaajCA+e
	 8WpreY+yZTyY949acEJH2S4oxRMRzIpPIMMdFPGPIHU8iVJ+6rz6n7/shrpXcG2KnP
	 L/ITGp2Jjy5dL0NM1V5H/cRy238mWt9Mhp3yGfONDARK57Yjdc2fogpPGq1iTPZHlF
	 Js33UyDiNCDKRUfc/S/Fzn1TWoZBKH0P1JJ1TmrqrkVROVtlThJf2LJJCzpn3VFVRk
	 QDJoMnwu4V3PHBNe5QywWkzt5F2jfpcB5gKFq74S2dwC3lzqnJ4tTfFl3F5hMXG8Uo
	 2BpYlm93QziEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6358BC9833F;
	Mon, 28 Sep 2026 11:02:30 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Mon, 28 Sep 2026 13:02:09 +0200
Subject: [PATCH v2 07/14] example/single_file: take no sector size from a
 regular backing file
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-mount-service-bound-open-v2-7-0f9f501d05ce@bsbernd.com>
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
In-Reply-To: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
To: fuse-devel@lists.linux.dev
Cc: "Darrick J. Wong" <djwong@kernel.org>, neal@gompa.dev, 
 Bernd Schubert <bernd@bsbernd.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=EaHgkvpPQR5rqjfDXehncXfjfUOjcvESPDPi9Xn4UQY=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJ2eTrO4LFUr+bP+rrRY9+5pl7Lq/PaEg6u6Hp4TuDz7
 tKYfbNPdJSyMIhxMMiKKbJ0SeyxnfKPT1bt6/rrMHNYmUCGMHBxCsBENqQy/OHwOuG7/3vphO3M
 XjfrbrnWfWrja+T5tI5r4uoHe35d7X3K8FcwweaVS0rPxFgx7raEhW4VKz+//lR0cOKFTVKubDs
 iOBkA
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


