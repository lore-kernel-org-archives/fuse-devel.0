Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DAC4A0C
	for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 22:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783980576; cv=none; b=fMgvZRRGhjANUJdYZSwLR59suYbDgPTd+Fc6r+iFILMhtRLBaN86E609dnZpySiuC4hHA2Dl9VFLLT3EyBg0vIRJWELiJg2tuVN3sHeza9SDs02z98nPoKtSR+i1yfueSNTKLc7Yoam+vQirJ3KAV4DOjLVthU2hKt1tVQcg7SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783980576; c=relaxed/simple;
	bh=SGRRJwDD4OBlImv3MsEy/eNBNzSnuz36aV850QQKpZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pwp6P/wPq4nDN/yzhTCMmpR6znya+XW78gKz+rtUZhXTpoeiKMJqhesQaAPt5YtasuThRmBOmi42gj7ZZVpeeFyKai6UiHpSOnmuK139YnB7i/aIyOXAGD0/3MZi49Yx9MEYVMz+N8Li/guhesmn8BEt0Ye3bTRsR7tnH1LjvqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIZNy/Zq; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIZNy/Zq"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15c42a45adso52568066b.0
        for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 15:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783980574; x=1784585374; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vlB2md8CTyZJ02d9wN4dJDH3+O4ynRSJBU9awyUCPRU=;
        b=IIZNy/ZqO5SYDzjwDUERODA76D/cyETUdSXt4Rf9TeGvFIVNAesxD/nyFEACNBYG8j
         LF/JzVsiQ/MYw1kfdRMgstNBgYnGWthfsLxOYlbqrU34A86MhFcpLfxo2p+G439bOYnE
         1x4ZTqFpWQttBWgrsoGYyqfpPHYw9VGYJ2cNxrKk25bCQMzzUSxq7h4iwVhXJUEgwurm
         cHAQmUfn3RywMiYEuoPEtev3rx9+Kwfxl7WRoYFQnElLla5VZnyAWWz5AixQo6vq6vpK
         jOtWvGwAIMrbTZG4sLlTZGSP7Dgu5umLdc4C1pw7jj1nHXSVIiXLrh//XdIdhRmZTrwv
         v/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783980574; x=1784585374;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vlB2md8CTyZJ02d9wN4dJDH3+O4ynRSJBU9awyUCPRU=;
        b=fEPz/+AzfSXPbmzWURk8cqm08gDmU5C76bPHahg2K+hUEOD+fAgjF2DJ/JfVFby8EA
         diE35rKzxgNJh5WCvjg2uuZG2rdDR39UQcMcFhQkubP/J+znvtfe8NAm5xfzYKVQs3eY
         B1VgFAovUJ9WNX+LQYyrtdI9Ya2wnr3M8gf24WHuvGXeK/z1IQZi6Tli2xxzRvmZ/RX7
         hQe8gy5od5IdDtFtPeETPlpxFMKtaX3B0sXGrdJmS6qPmYBzJhA0/kIs7G0/8squ9tLI
         kc/uIV6v+bmc648OZEtKn6Ub/4Sc+S0P393+9xg0rq+SWsDoOiCRVmLSSuGOPGMqW+vr
         1QpA==
X-Forwarded-Encrypted: i=1; AHgh+RooCsz6RAGMXuIvcQzHmFsKH64mYxLqsYilmmZFvpaxX6ToF904iSS80Hmqox3+1zE2NK8/wqBuFiyA@lists.linux.dev
X-Gm-Message-State: AOJu0YzEBdw3zARL1d5q0+DxAm32/6KE76Wy5TWbR3ixrOJzwchN+7xf
	dBeThs+oRRNeB/dhtuaaf6J6oqBjv5hrlvmcWsBTHIEcKFGoIETiGFHp
X-Gm-Gg: AfdE7cnuvYa+P8qgGLm7I8LcUjO3Zgu6tQ/dKLDZyHTjvTHUm7z8otaz2X5uoRomaXZ
	cF2WoqiVbIJpuC2NjfmV1Pw1D1OtHFfam0ucsebWuR+DsvurAqqZRiUHCSXia7MX2MyL6KvKqD7
	WuHkWf/d3vVi9vyh3jdKSU7zPFHrM+JWfWCUWthYMrFMck9lTVRnptvbg4t89rK8nqcVgvlsaov
	gxqAWujeBUa/GdPVIuD6XxNxR4czIb6074/3CyuTCpFx75VkLo+TxyRSJncxCVf2EjTe+8fC+Fc
	N4oF1aVBBeYai3aYnHtC10m2C0s5xxo+aJ0qosMNcljTopnFgZu6OXdUq+FN4WElTELYKDxKIFv
	QR7kzaxYdGRKEsahcCtrMVcTMFrYr5YT5LNy6kb815kMHldwIB3cNJjwWUYjzYYi9Qfi4z5L+1g
	uz3oJcHyOcVAd3+kOUioxByv1LIima+MSJQBW0JQ==
X-Received: by 2002:a17:907:1c19:b0:c12:cb91:58aa with SMTP id a640c23a62f3a-c161ea1c466mr496690466b.24.1783980573348;
        Mon, 13 Jul 2026 15:09:33 -0700 (PDT)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15cd42b336sm883801566b.38.2026.07.13.15.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 15:09:32 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: [PATCH 0/2] Fix for unintended FUSE ACL cache
Date: Tue, 14 Jul 2026 00:09:30 +0200
Message-ID: <20260713220932.413004-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Christian,

I bet you did not miss fuse acls...
Ghosts from the past have come back to haunt me now.

Let me know what you think of this fix and whether you prefer a fuse
gate to forget_all_cached_acls() instead of the suggested vfs fix.

Thanks,
Amir.

Amir Goldstein (2):
  fs: preserve ACL_DONT_CACHE state in forget_cached_acl()
  selftests/fuse: add ACL_DONT_CACHE regression test

 fs/posix_acl.c                                |   7 +
 .../selftests/filesystems/fuse/Makefile       |  10 +
 .../filesystems/fuse/fuse_acl_cache_test.c    | 348 ++++++++++++++++++
 3 files changed, 365 insertions(+)
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c

-- 
2.54.0

