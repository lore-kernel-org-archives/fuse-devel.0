Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353920;
	b=JS1BzIyXsl0OFdH8OD1o86zinT6wVwevaeCkE0f5Ju6qyDjpOe9RpgWC2v7OxV17hjGU
	 yzUTV1aA5fnlYmbrEa5/NpyJ1kCKrwtn9YT0yEhZV4BtJXLD+xWmexEZJ8uFpxrW2BjbX
	 CCWB77GgOPDsKR8t4Dj+U6WlvTFgW4YCKVaZLQH72arIPSa5h3TsEphg8dEPXDDbIjVEU
	 SFRPUeKulvTZ4sRi46DU/iy/36/EgRKIw0tYzk5uJmy3ltIZM9iszRe4qQ7cfK6VkX3Xs
	 c/D2fozkgksFnDJcPi+q/6OB+dv5B1jF1yPhoiD73BBKN2od/0ounBREso3U0e+/Bxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zUOLUQcAqS6f+2AsIKWg+Aa5LYaApcbdBwZg1Hhsc0o=;
	b=ETtglC4nNzmVnlkE6DG83KAqKvhWCMULF+qPjUDsILUCMwX1DbF6Bx949oAQ1atQBb6W
	 I/+Fc42e4OcTCLnO2phZxJTx2KGn+QWUM40fsuHzvnBwgSFR36NWt/MgMpXmfDEg6CnE7
	 YNpKvnpHfUtFO4jLaTte9OmrzgIcUbBNw6Bh5tEin7Jyo+NfoMc1fwVARpdIl6eYEaGZ5
	 01GS9pUi3h3QjcoDBSKl52+oSTyGFa/+LQv1NobN8Bd9nNVpP2y1HCsXWmcNXF5oOtlRJ
	 2yrHnRloYqMc7juk3OE8UMMwOJCQo0qugn50F+LAyjsXURlq4SB460qiZvWANbuxrgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntekEo++;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F13606A320
	for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 13:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F13606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntekEo++
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1933689f8f.0
        for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 05:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353918; x=1795958718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zUOLUQcAqS6f+2AsIKWg+Aa5LYaApcbdBwZg1Hhsc0o=;
        b=ntekEo++htkzCNE5DQBwvlWSF3GNGwAuqAwRkG7kkXswQpNcbgQf5PiEwoYwjSYp40
         wAntw4ZUhv+rGg1aJ5NjMO3QJJtelzrfjHf+9uHnnMEcTwbt1P309rI5mcSx1A1d69DY
         dLTVIQF+PRj+uy7LP2IGvJwi5rUSTUA4EwxlXIVHjyaQyBMVFP2/Wu1HO6mDWrYIC4nS
         C2Gbz+m+5TsGg1j/wAcUWi55CvN8JcQ9CXzdXGNvGQyyzRcOItzD+TypjIdiEkZUyLvz
         YEY5DVaZ0XhEwEpKuqN3rO1dbuuXIDbnvDVm2jTJqx49xJBHs82u6p2x73aEviQ4JWFU
         VPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353918; x=1795958718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zUOLUQcAqS6f+2AsIKWg+Aa5LYaApcbdBwZg1Hhsc0o=;
        b=FQ6aviAzDa8Pucmqnb9bSVAJRFAPBPQXGbxaAOxK7jFCu1uT5sVg7ddMXR47c6XyCM
         bexTJleuonVd7TryHOuUrioKnhigOphhB8hJ1dNsCJ8OLvlHFmFp6YftomPeLkVBEI5k
         ltrs/Wx+4W8gC5UCYNvzXUu0gUkzvwKqv0uyw+U5alYLVSLKGBdx/V/7aOPr8xMfabCd
         encp1VW7HOZbhIn+T95fZMkYzPNBAsCbOW1cCA5lzXZuciXLUOnioJ4k72jSwUnjvrvi
         IbKe9X4MUw8gQDv23ni7jubF6i5uxMusNXIxQaUPundrmApqov7fOPVCSM9And9zte0N
         ERlg==
X-Gm-Message-State: APuU4Z/t5I8ErqhdSeyrJmiNMmKaWTbWhJnxNogvakJDpm47XXS/qL0R
	Eh35cOm55rv4JpixvQjlqHqRRxZhuC30+PSp+gbsbR/HxMlLZBol06Tq
X-Gm-Gg: AZFdTZf945asqmDvjcgWDz9faFa1KeOclm0HD66V+sTe16MHEYEjuiWU3h4YgaPnKxh
	jQYvHnNTHyaxXdpQnZyzlnhDdbg5604TXU7MD1I/sGsFlUnJZIxA+MjJ52K2p5u6lHoZBOwsuZC
	DgQGHQ+MkrW6Whw3DZd28Ggatm9dncyn3tRwe1xWcVHoxUnGaH7qZ1jUknLt7Jn23AKN9HdKpYZ
	DS9lF/ChthV6u06EsmnijJwDSXGhIfWqPZMWUjRa/KTouAcbKMFvfnljs/b5YPllR03VvwCTnFx
	XyNHlxb/6vM+WFc2YzX/ECjL63VSmt0fHLwS1+HJJjntsanhos72SrfYU1ZefBDUmXBsyZuyelx
	EcJGs+bJg2g7YhEIS6UtO05vdl0RQcny8D8Y2cKQ0GZyZ824g2biL00JZ1EmlGIk+NRQPzHOBIt
	xGi7kdZcW/Ex4c3ukVccKquLmaB148mR7dFhe8Obc1zAt2h1BXIK0aKZxRyIWnQ5oIq1TBMMPFn
	lZ9/mhoOQVYON4O0G9Oxha7ujyWAE1qQv/UBqQdkOiHE01/LFqSvEawqdw8ce1AM0z6Vv5yg9TU
	6YmX9xtm42YDPSNtKKSjdPbWCi9Z/zmGxr5T/4pueSnbX+geCEBXC86xFtE3B82gfDvBztw7rw0
	JDcISMfPo
X-Received: by 2002:adf:e19e:0:b0:4a2:dae8:ca5f with SMTP id ffacd0b85a97d-4abb2ece9cbmr17209274f8f.36.1795353918027;
        Sun, 22 Nov 2026 05:25:18 -0800 (PST)
Received: from t480.fritz.box ([2001:a61:3a4e:c601:fc75:724e:6b78:3649])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b205443sm17174948f8f.39.2026.11.22.05.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:25:17 -0800 (PST)
From: Han-Wen Nienhuys <hanwenn@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-fsdevel@lists.linux.dev,
	mmitar@gmail.com,
	bernd@bsbernd.com,
	Han-Wen Nienhuys <hanwenn@gmail.com>
Subject: [PATCH 0/2] Subject: [PATCH 0/3] fuse: kill suid/sgid on fallocate, copy_file_range and passthrough writes with KILLPRIV_V2
Date: Sun, 22 Nov 2026 14:24:52 +0100
Message-ID: <20261122132454.18764-1-hanwenn@gmail.com>
X-Mailer: git-send-email 2.56.1
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

With FUSE_HANDLE_KILLPRIV_V2, an unprivileged fallocate(),
copy_file_range() or passthrough write leaves the suid/sgid bits set,
because the kernel never asks the server to clear them. Mitar reported
this in [1], and Bernd posted a fix in [2].

Patch 1 is Bernd's fix, rebased on the most recent pull of FUSE
fixes[3] in Linus' tree, otherwise unchanged.

Patch 2 bumps the FUSE protocol minor version to 48, so a server can
tell whether the kernel has the fix before it asks for
FUSE_HANDLE_KILLPRIV_V2.

Patch 3 adds a selftest. It runs a raw /dev/fuse server and checks
which kill requests reach it.

[1] https://lore.kernel.org/fuse-devel/CAKLmikMhOYpGEw6uCqX_Bm0JPEg-4FhdJMNa9+tgtw3-Kf+eZg@mail.gmail.com/
[2] https://lore.kernel.org/fuse-devel/e75cf549-07a6-4095-bbf8-8caff7a3338b@bsbernd.com/
[3] https://lore.kernel.org/fuse-devel/179520930874.792202.7768867709024262369.pr-tracker-bot@kernel.org/

Bernd Schubert (1):
  fuse: kill suid/sgid on fallocate and copy_file_range with KILLPRIV_V2

Han-Wen Nienhuys (1):
  fuse: bump protocol minor version to 48

 fs/fuse/dir.c             | 13 +++++++++++--
 fs/fuse/file.c            |  3 ++-
 fs/fuse/fuse_i.h          |  2 +-
 include/uapi/linux/fuse.h |  6 +++++-
 4 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.56.1

