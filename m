Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5634917557E
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993488; cv=none; b=jCUMyyoHcvz1YaszkhQm8KJpv9Is13sXeXt3Gk5zXNPU1bpyIl8Mt8oLNgYC1vOfK0cu9U6pXRGVIVDLpDfDIrlXjiGqPb+73b4eyFUsDQRMq3Ec6jW0maq5WhLLNZiethfUPmy9yzHADnGJb8I6iVSMdCZXutPfXmNWFPcVuVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993488; c=relaxed/simple;
	bh=UUPw4Mgj4qH3aKcIyv8SLFVLcAX2CheKxjv98Dz2WuI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKs0re6wSQPYEOI6OXmNEjvBDs0RKMA4+v7W3UN3n9bEFnu+5DkKVwDkbP/jgK9vaWs+0u/xu1YDBUcRSJFQ3XkQ0cBL51UM/t/U8roOAj9qwlmLg7QFt+YrpMBYaiKLZJTne+l1pcb+40xe5MRy2/Ll9EQ+mjusAc8lF4DV+3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e15MH0YD; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e15MH0YD"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f33d28c1dso3986911b3a.3
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 18:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776993487; x=1777598287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rP/wzGMm7UWjdf6UM0vWqsxvdm3+Q0aOcRtHLk3mRQ=;
        b=e15MH0YDjMdO2TQm8+u/10G/l7C+LYZihQ4yb8rB8+8x2/zLMsg5/z2bnr85h0rM94
         REqqAEVaA5+L6EskLkGdUqmI3QUbvjzSaJc2R+SRMmCM/b9r+o2jvpniADxdJnruo79e
         6llKQ8fzZkuokSDXRNUcgGcadS9+Bf5rQ1M3fb26Hn1+y7BTWoVjwiJYzea95eISA48F
         jWhEPLZGE4m38ma49lBSuaclgYcA/pQqpOU/6dyKo4U5u3kJuJOFVopNRRGK3uq43C+B
         35h8a/zmPxDfrSENx5TcC6GO05VK1v+QKx+O4gnN/8n+pJJ1c+QjHh6Auyi2Jifdp4mz
         zY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776993487; x=1777598287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4rP/wzGMm7UWjdf6UM0vWqsxvdm3+Q0aOcRtHLk3mRQ=;
        b=ow1utdTPXMEy32mjJo5dLK2FSjcFec9UHdplDTCzD9/LCSDe9nizXyooS221DJXZib
         rKQsM3Na3tCdGHmY85yJB4DSTh+F9lq/4MM5IgNtEUPFAyjKc9AX9qGtU87/GxEtYo1x
         SWrzbXvM48/I99htMVYEoc0ETzAbdHxloFLSlmGNgobd4M41SgEc98pGSB/cfh/iHXMG
         zrgOQBn/O8jKh2TlhsMK9MCc+hJ7kme4rNlBi4Icn/26F7/pMUdOton/z8paL1GAx6TD
         N2NIZ+OsLFTjFsbhKnN7LN9jwkjfe9U2ilGTZzL5Xpoi1VB3JIzjcp8URTDHwfT5Aq1J
         qo8A==
X-Forwarded-Encrypted: i=1; AFNElJ+KtnGTALChwAOP6C0stNMiMmWEru4jLCPh74jOc6Mua4h7Z09nUNt15F+nGn0GbNYJVmNliQyO3kjN@lists.linux.dev
X-Gm-Message-State: AOJu0YzaIa8bSkKjrQjpsnpwuLFfz742Ez2aZ1tN4QhfSd1CWh6DNZto
	xGtch9xlXzyD9tuy8Vxa0MWPliDnJ3CweGDFV05qfxH1ynzUhvtwRhc2
X-Gm-Gg: AeBDiesyanIQitWOEIrGKltDxrI26gJYgQu/yHG+rOLJFQrYcSOfuCe/fX3ojBvVaGc
	QLBTE4G2bwnF9WrFgzWj0Cu0373EFCi6SiGv0ZjUJjaJUyprRpaf6V0nVB9j4kluKoJ/vIOhcjA
	N3N8uYf/rLW7RrlvU15xbag9REPoNTpfJPD2FTdWOebvCb4HOPlAKUiCvuBsft7ohwDhFOX5Ah+
	J7dTwqNSGOL6VN3AqFX3qVP3hzaTt39yABI/4CPU2aZIPS0NsltzmnafGFfq18VdN6Qn6Zm+KrV
	mLgy/ptE/FIDAPUzR6vGHheSPsS3YzK9rpklddrEHAzwBb7xFgtoDfxHm4xLKpBkhwJA2Orw1cJ
	hyL4BnGP5PiSugZ6+ogGEtR45KmHocMIfOweTVZsHeJqmyKG+1ysHzkLbdg2v1y4xUyp1Dm/Q0Y
	tbVYCvg4XUdRYgH+gVDEBN2wePcCIV
X-Received: by 2002:a05:6a00:845:b0:82c:e816:4135 with SMTP id d2e1a72fcca58-82f8c997ba3mr31706882b3a.47.1776993486605;
        Thu, 23 Apr 2026 18:18:06 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:43::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f932dabd4sm21673714b3a.51.2026.04.23.18.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:18:06 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 07/13] fuse: clean up fuse_time_to_jiffies()
Date: Thu, 23 Apr 2026 18:16:40 -0700
Message-ID: <20260424011646.457682-8-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260424011646.457682-1-joannelkoong@gmail.com>
References: <20260424011646.457682-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary else statement. No functional changes.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index b87236af4bf7..45bbbac8477d 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -288,8 +288,8 @@ u64 fuse_time_to_jiffies(u64 sec, u32 nsec)
 		};
 
 		return get_jiffies_64() + timespec64_to_jiffies(&ts);
-	} else
-		return 0;
+	}
+	return 0;
 }
 
 /*
-- 
2.52.0

