Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699063;
	b=xl2gw4oTd+T/Zyfd+HWHQ1SyL2/047EB/ikcReaZ7LWeSSdqrSNfTFSlkqMiE0IAmNC6
	 5CRBIA8CN9ZQWy/iF97pBi/ipMGZ4z3Wnl+KG1b/WzhUvjLPOl9w0rHcO462T+6F+hLxh
	 wGa9IXSPho/BGOhInIe49NEsatTf8epEqmG9pKTg3S/0jtSPV29OcN89UkNVlt/4xO26Q
	 coyteGi8s8k4hq8VwJqNJ1kOrkXg64eK5v+hQLObGrO69dus94T3Pq4c4UL7EMyupXv2z
	 d0ciWtZ5/6i6muAsjxhvAujRj6op9+/1SzqTFFMJ2XkWIWug/mGAIoxyXPdqNKtGD/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eIolNKpjbc4RYfEkJstUlCqagpZzn46CDvq+iobq3B4=;
	b=ibhY49o7uaRvtpeNl0kxZbRr8yi/L/noa7P1RJdGAPs1BE9j5N0+k0FjIEGqb66GZVDN
	 oYTyC/ZG1bL/Cf7rQ1nu9awjc9le8WWjTkdHd26SXKDzSmlOoDXk4WpG00TCgztzxPT63
	 Gg1ExpCiujqLCccAe/WR9hrCK/OcLsLWkIJuQJ9bPWZKfbNx1fxFVtJdL3iQKG4i/RRKs
	 y7YoOG2NjF6RFg7E6emi8iTIMjvrYjmOTBdTTaOZcx7XBs+k1RLG7ckQT5wU4gwQ9JCbw
	 Jq/zpwBwW98PPr7pnDFaik1U8UwPZomw2VMLfsaZ0tRxbIyi3GKZKhyjxv1Crdy6cHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E1e/CUlH";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B14A606A32D
	for <fuse-devel@lists.linux.dev>; Tue,  3 Nov 2026 09:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B14A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E1e/CUlH
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcb1e5f9so577125f8f.2
        for <fuse-devel@lists.linux.dev>; Tue, 03 Nov 2026 01:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699061; x=1794303861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIolNKpjbc4RYfEkJstUlCqagpZzn46CDvq+iobq3B4=;
        b=E1e/CUlHWjbbSopvvkDKvQO+RhzS0g3b6h7YS4fTCwjQZlVFpvOQqpxpSWo3/zeQdw
         1eCyQBMcGAGQ/HTaPfbASFZqcSUzGLmpjMVtxnMd9OVEPG+6yO4d13B+wGrY8AbDZHa3
         7zS+a9pJHBKFvVEN3eGJj9Tk9sOoW2yM8M5wG1QBfUCmgTFe4mglyzHYa38R6qX9LiiW
         /3yz0sWmk911ZksFsiAWYfQ5pwr7YkQWoTu7+HMsS9v5A9dt7yDwazP4an4pbGuLdoLG
         fS2ZqEWrIQG5hGRngbwJX4fqPUbQuC6qZeZ2dnPCHYhtqYEPLE0OCEKpgpBHlT5VoGHL
         Qw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699061; x=1794303861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIolNKpjbc4RYfEkJstUlCqagpZzn46CDvq+iobq3B4=;
        b=cue2ZTmALgMnUCkM7CylZlK973q6wTs7ncuq1A2MP53hjaJUSO/+SAj+7vSIOtWluu
         JxAG4vBMWeK0cf0TKdS2/f1ACi2s1dBZwmHdknj/Uv4Ej1Y+BRhHYkLkHD6fqaMKAI6b
         /uEyu66+CRLnILlVCBbn8lx5zvr21+6ZMQYN/JIDTSVMWQMd2vd3iNb+lJycZLlALAqj
         EMLDJvNHR6q52tTJB7vEE/v3azVugW808/NPo7871KPS/mPKhfoJjgAtpYcJmyGRxVW/
         Ml6JLU8TEet+aaaJ6IZyVZhhTLUPppqNvPEnov6Ilq55S6cKVbcJnLRMHuji53lqtPTa
         Fa0g==
X-Forwarded-Encrypted: i=1; AKwUvBz+0tIL19MFSAhjsELZ/L9VWaFHU9uNgYbNm948PARekuIMq0BdEOZnyjXIfu+M+c9tpRqo1/MGb0Od@lists.linux.dev
X-Gm-Message-State: APuU4Z/Smw40CLQEiBSFX8Pvc9UmqAjX6N5csPDqv/8o7PgLamG5vWam
	beTYwwXQO8t2tmo7gYcQKxMeVLZFzPkEiS2MqiEhOFKnbGiFlcuKqdnx
X-Gm-Gg: AYBFou243kRqnCRwVvPjZLxJF+HsRl5y0b04csfq+YY/vyJzE1jMlDRL7IRDulCMJQ8
	gGO1aA0hwD/5oFUB0u2mv/Xfs/1v/NYPVuIXUl2qa8VgwL/UyUSMk1CJf0BDqLTiRm2smde1hH/
	p/uINt7wBHXic+mvPvbZjRI5d0aTuh94efjNqIcf5Ual7jWFoCYtp788Jxw1obQ6jZjGfBMt+N2
	wjvLWdkfZ55zpFXZRHceGDO6RGI6sAvmddsZOD2glGQ4FFxVHNTGiPTj74b1JlefRJArJj3NZLT
	9twdKINLPCdJu7BQYVRbIg/VeCZa0KPQzxME7MGSg7xClmfiTnD/BB870oUMKnPr0pfhn0VCmq3
	ikppCOu+uIyLvSy4EM0Kq+1JCaUH1gflznGk5V3um29kt+4SC1EZSqge239UKfOxqi6Kj8aKg7o
	pfd3vl54FMo0yD1g50kcjn2Ynj5+1/oAhoPTho8CrHhMVtIplnPt/kbpkUgKQ3cY1heqCBy2ifQ
	71ZlDvVVbDERvv2EA/HAoNM4KeKjEmV06vZoFR0GLdLXE1qaJtd4DSLQu3Ur6oFEXmDaXAA1NzD
	SJfo8GcRgb9PNQ7NrYBKL7WZqO1tynDbYO2Ip998FMgCkKL/5yTlBjq6fRxIuwVauASzUA==
X-Received: by 2002:a05:6000:4006:b0:48e:28f2:64ea with SMTP id ffacd0b85a97d-48e6e30088amr33275987f8f.4.1793699060575;
        Tue, 03 Nov 2026 01:44:20 -0800 (PST)
Received: from HIT (92-247-231-33.spectrumnet.bg. [92.247.231.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e88876946sm5226314f8f.5.2026.11.03.01.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:44:19 -0800 (PST)
From: Viacheslav Shevchuk <slavik.a.shevchuk@gmail.com>
To: miklos@szeredi.hu
Cc: corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	fuse-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Viacheslav Shevchuk <slavik.a.shevchuk@gmail.com>
Subject: [PATCH] docs: fuse: fix typos in fuse-caches.rst
Date: Tue,  3 Nov 2026 11:44:07 +0200
Message-ID: <20261103094407.912-1-slavik.a.shevchuk@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.1
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two misspellings of "successfully" and change "then next time"
to "the next time".

The misspellings were found with the help of an AI coding assistant
(Claude Opus 5.5) by grepping Documentation/ for the entries in
scripts/spelling.txt.

Signed-off-by: Viacheslav Shevchuk <slavik.a.shevchuk@gmail.com>
---
 Documentation/filesystems/fuse/fuse-caches.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentation/filesystems/fuse/fuse-caches.rst
index 0778dd3d..d19592c6 100644
--- a/Documentation/filesystems/fuse/fuse-caches.rst
+++ b/Documentation/filesystems/fuse/fuse-caches.rst
@@ -156,11 +156,11 @@ in several occasions:
 
 - When a new file system object is created (e.g. ``FUSE_CREATE``,
   ``FUSE_MKDIR``, etc).
-- When a lookup is sucessfully performed.
-- When a dentry is sucessfully revalidated (``->d_revalidate()``).
+- When a lookup is successfully performed.
+- When a dentry is successfully revalidated (``->d_revalidate()``).
 
 A dentry expiry time can be set to 0, indicating that it is stale. This means
-that a ``FUSE_LOOKUP`` will be sent to user-space then next time it needs to be
+that a ``FUSE_LOOKUP`` will be sent to user-space the next time it needs to be
 looked up. It can be set to 0 in several occasions:
 
 - When the user-space FUSE server explicitly requests a dentry to be invalidated
-- 
2.56.0.windows.1

