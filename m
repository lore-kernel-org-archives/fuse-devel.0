Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CFA276049
	for <fuse-devel@lists.linux.dev>; Sun, 19 Apr 2026 11:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776598533; cv=none; b=Xgada0yilHUh92vd8RI3QGJmgjdw26SlOfGnoYa4gM8hiTdby5kDoj/eRnVUG0O823WqtqA+Y5w/ZZV+XQVUCCpafMNRrmCuxTshx3t0NA7w37IqdrDBQ8dKJzjAAQfQc+Mn9uNb4sx4/0lulYv+SIU7edYoHBQeMoMpVyo9J0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776598533; c=relaxed/simple;
	bh=YjSAVFoqKbqk3zEosTjzb2YAPvvD5eA8kSaaosTWivA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U2RDK75jjY5YqXLceTGHeIrPjail70iId2ErL6Dw1Lgcfxb5YdyM0NH0WW++SqIpdbIqgx5e3dAJuDJ7bFhqd4ntsS3ux+b6agJKV0O6WnQPJhrbgMmet4uSsr1sidnFGX9fHK5eg0NQx/19JWRpqCcwNkiX2T/N4jukf/ivGq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXIPEWag; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXIPEWag"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8f97c626aaso334811366b.2
        for <fuse-devel@lists.linux.dev>; Sun, 19 Apr 2026 04:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776598530; x=1777203330; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S5BsTegZtnPZR/6cyTsMFlmqxBr/74+elJxomXLIbmY=;
        b=dXIPEWagUrTLxBpD2tEShgAY0BlZ31VvGrxXJbZ437ofPF165y8PpPCDn2nFZdTxnl
         JnzUABcSMG2PzAwbqWfVY+RRLcxJ3Jl5fa2/90FP2C/eyNBpL//u6bvXENR1Nrp5x2oS
         OWX5p/jDvpt1Wcg40JOWUt/mM04xD/XnlFY2WFDjLIubLgrwiGfNp8gfmowLzDwQWSxp
         lt36aMSO+ZYAx5FiwoX+Ev+e0RbGMUQMjxHZ1xKfb1wP88SPrGzrsnavYSGmbGZeWfn8
         xHLvnWlgd3XPVLMTxXf97pr4FPaY5IOYbL5Vfzzu/zEtkcEkxYdklBd3UlpjcQx46Gcz
         p80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776598530; x=1777203330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5BsTegZtnPZR/6cyTsMFlmqxBr/74+elJxomXLIbmY=;
        b=hidFGgH2my3A3hd6CXAGRpq6x230JOGUsSU9LbJ8cc9e4aWuGT1Sl/cup4/uYGCBoa
         X848Y6LykPlEzlL/oHoc0TGtLm9xy6Td4KjQ2iiGFjF+d1+08rZ7+I0NiPd+TDlprfwc
         E2A1u9d7BP3/OimzvYRZjfQDoqJ00kAr20LhPpIEqkv/25VBMjvNpQl5anu1W3+yxpmw
         fOotr/pvcw2+vbscqNXMaU2rprMxty9gVlCmIKlOHJ0hVMnNOgubmyBa+FERVRhlAxEE
         6Y6BG8qeV9bBeJ7rmHdQy2An7ePXgIhw1H6gUgijxGYvm2dT2i+pY9PMjenDhu9sAt5L
         9HVA==
X-Forwarded-Encrypted: i=1; AFNElJ9jDXtVkrp69wubWOpZ6zc0+m0GoMsparHRQJLSFno2VphrObBBPcxmYWIcx56qG890EtaXxTPm7g5q@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+iTlhWp9kEKMt+kuhLmTacik3kmwjGMR+dQ1jUo/Hx6ncQaCK
	3idvO1/VjM2k5V0kTtu1+IGXUiObKxm3KPQ0yaU4S2752EzBF1CfITfl
X-Gm-Gg: AeBDietqKAkzLw1gR+0xJDCQNaIKA/NRSMuTs15QkKLom1HjNCQ3c2AIqhVS0GviCBr
	UNbDGZL3mpgMx/c3I3A/kS9FbqdyeZsfHMY5lHI3GNgZi03C2bxpSkPS5hr0852gR5xCkExch7A
	Y02A1UzLH2YUvUEmOmc9S+99+4yWpZ/aIDPiWCPnrpV1KJ7RysQjXCcZvqiEOsKk/4TqrMdMcwL
	B7iXIj9tQ2VGyr0uUe77ZcbGisr39ioEJ4imezWjMNMR1lJ+GK/qwA8Nn0ihnjEbYYi5HwdtlXk
	WucTfPZNBliWNEaIJCCSQwEIixun+eZV8simG8OtLwIlxeHcB/0hrUZrxVnPUe6X9SnMv3EJgdQ
	6RQJKlj+0KwbM52u+jwx6YfKMXEsgDnpkAcCS88PjjgSo8moCcF/GoydYA15oK7nRULqtU3Sxtc
	KFmLT+86RIFO1hvrsGUP/iLKALgsVmRLz35A8/JEGwuVptGfEy+HNA0ccrs5mSbiIRafCZeSZ2R
	wjqzQOZPQsQbpJkBnSjsat5Wqdu3fTAXvvm2afA2f2bL672
X-Received: by 2002:a17:907:3da9:b0:ba3:3091:e56c with SMTP id a640c23a62f3a-ba41c1b68eemr414787566b.14.1776598530012;
        Sun, 19 Apr 2026 04:35:30 -0700 (PDT)
Received: from localhost (2001-1c00-570d-ee00-ef3e-0116-378f-2ef9.cable.dynamic.v6.ziggo.nl. [2001:1c00:570d:ee00:ef3e:116:378f:2ef9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121042esm245634866b.13.2026.04.19.04.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 04:35:29 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd.schubert@fastmail.fm>,
	Joanne Koong <joannelkoong@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add new fuse-devel list
Date: Sun, 19 Apr 2026 13:35:28 +0200
Message-ID: <20260419113529.1523179-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new fuse-devel list in FUSE entry.
For now, we are not removing fsdevel list, but we can consider that
after wider adoption of fuse-devel list.

Link: https://lore.kernel.org/r/CAOQ4uxg+DhWoKtHFOt4eEgYYqAAmcJG_q3nJcQ2ZVOFCWRN0bw@mail.gmail.com/
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e7dc9e6fad2ea..83f2edcd22769 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10519,6 +10519,7 @@ F:	drivers/net/ethernet/fungible/
 FUSE: FILESYSTEM IN USERSPACE
 M:	Miklos Szeredi <miklos@szeredi.hu>
 L:	linux-fsdevel@vger.kernel.org
+L:	fuse-devel@lists.linux.dev
 S:	Maintained
 W:	https://github.com/libfuse/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
-- 
2.53.0

