Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1034A3859
	for <fuse-devel@lists.linux.dev>; Wed,  2 Sep 2026 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359927; cv=none; b=iGB/mWc/07OvhNPB/767UUGF/UE02V5dUI3bUHy/sfm0Ljj+WZTIghSM/3I5rWuwyf0zsQXhbyvgMu4q904kC4Nk7g+LVkls+S57pFNePFNBGa/z3SCX9OaBI0ZydVCraZc/wyrrcPEP0qo97QQ3sKLDSKf60VltqcAcjMqlfsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359927; c=relaxed/simple;
	bh=RK3yTsVbpTpGmjQxbDsPfYC9S9e7jNkCY8VTXlXXv54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aYOtais5w2MwuGL+GlHl9bpoamS2y5YkXxtWjvvz4pZAxqXRuUqUgc2cZwgceskjZwFep4EjMMFSTkOT43tSS8HKIh8h1TRhtz+/OtPtWRRKGKjw0hOE5tBwuzKk9Kd2HL9SMqEjOOhqdUSTvoajS8GAEwqrV/IVHr+nuPp5mKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mk9CTKDn; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AkB+P3p9; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mk9CTKDn";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AkB+P3p9"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hZlhz1lQ9zMlKv;
	Wed, 02 Sep 2026 16:38:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788359923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w4peotbQEwHadIewQox10dHHSEQxCl7rvHTB9JDglaI=;
	b=mk9CTKDnh5zbpM6+lZO/nrhdlpcMICtSYaeTVOsrfl7JMqKVZu4ePTyj0aTA3XmiBB/ULv
	De9KXrVh8azBiGuxH7qi43Wc0uWjHkrORFMOuDgloVT2ec3WyK7o3RzGi+77FBR7RmyMzj
	KFl7Sdjv07ZVv8MYKKdDtkTswjaw7pRvNwLMzZVldsC6+pzCO9NJIpEeSt25Md1YQmh8Rd
	uDgzMfsIN9GnePZfGnkHnXgvkqDLu1Ho3S5Zr05z8XcSvpiSp4e6xXulysBzCHxlukG5Ia
	lGVUY3A8rKE4b+pMRxe4Ot3rdvdV3FNiAujAq2nikq+MGcJQ6SG1KJ815e1E6w==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788359921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w4peotbQEwHadIewQox10dHHSEQxCl7rvHTB9JDglaI=;
	b=AkB+P3p9CfXuaO2IJdg0yD+/YY1dwvIxkxSkEzXP10jE+b8KONoYwoB4bW02KSiPHFPSBE
	XLrS+MKv5Ot7n4SdFsHNS4NxE3ix8r7SvI8Qlf96kN+5nHXjml17O83h2AGXP5mifdzmV7
	iVOaOmonLiXmRJKRpity8R+WgpR66PevRgwTAYsIcdOzIxFyRAY0dYpklYVcw0J7v2ht8w
	3d6uWdQMfzrXUFxewg3zUTRSOxprjTE9L6cQpV9MwKlnl58QO2aS4YCJSSqdqTRz3UuqEV
	+d7SBxD+lJfrX0XOvrSju2dk+n5EnfNz2oJ+UhmEe4B8zQ16Pf5pOJMGz6G/IQ==
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	fuse-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: fuse: harmonize numeration
Date: Wed,  2 Sep 2026 16:35:41 +0200
Message-ID: <20260902143541.703277-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 4a6961093df6044dc61
X-MBO-RS-META: 16hek974oy1js1twkfb3juqcryekx94y

Replace with '1.', '2.' with '1)', '2)' to harmonize file.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/filesystems/fuse/fuse.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/fuse/fuse.rst b/Documentation/filesystems/fuse/fuse.rst
index 0fbd5a03f..063d99959 100644
--- a/Documentation/filesystems/fuse/fuse.rst
+++ b/Documentation/filesystems/fuse/fuse.rst
@@ -173,10 +173,10 @@ the error set to EINTR.
 It is also possible that there's a race between processing the
 original request and its INTERRUPT request.  There are two possibilities:
 
-  1. The INTERRUPT request is processed before the original request is
+  1) The INTERRUPT request is processed before the original request is
      processed
 
-  2. The INTERRUPT request is processed after the original request has
+  2) The INTERRUPT request is processed after the original request has
      been answered
 
 If the filesystem cannot find the original request, it should wait for
@@ -239,9 +239,9 @@ How are requirements fulfilled?
 
  A) The mount owner could gain elevated privileges by either:
 
-    1. creating a filesystem containing a device file, then opening this device
+    1) creating a filesystem containing a device file, then opening this device
 
-    2. creating a filesystem containing a suid or sgid application, then executing this application
+    2) creating a filesystem containing a suid or sgid application, then executing this application
 
     The solution is not to allow opening device files and ignore
     setuid and setgid bits when executing programs.  To ensure this
-- 
2.54.0

