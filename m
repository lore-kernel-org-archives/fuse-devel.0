Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923518;
	b=Simj2oyvc16T4KkhT3Hc+J4gVmGKbpTf6Tk6qOnus9VSe6SJMJ0obHLpkG752UQM4Y3G
	 2oX16ESIwYbHo7F9p3rv2UH2O4HAmsKMGbrtmLYdeqsr1w51qxkmblC2tqq+PU/j8y3xh
	 MJhJHW+jnW2SO2hqE0dHqb6mIJvncTIsUdgI27HtixVv/kWX8Um5gXTZZujGS2lcCVHTh
	 vtc44xCC0+UM/WJAB8RCL230pbCToDOyVslc7nO3UvFWRjDxr0EIIrY8Id+aPcY4YZiL6
	 7ZCYYYfqnC1AsF3uipck8k/5iJHlY9Q+Hz7OqiKN/VswjIfELuUbqEnIYhCfWwN+FkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eboZ8wd57YYSCKF+wtcZCIsW/kuWa0Q77BxDUZ5VNSo=;
	b=kEed3wcodl+c+GB6dqWOMOBNHLSIoBBO9/R+OafX4QBJ+t8g+mAFeD5+61gzS3GRwwug
	 Uph0WRkUtPLOzjLs7ajeDPx7T0O51kY4tOA2WrxLlsiZ+GNXkhab2ifKOlusSJcCpN7ap
	 9Xg00rnQ1FUvaCrBUIanPC2zWmPkZ5882uf2K3P+OsmRgwG7Lk1dWXBNtsZMra4DrmmBL
	 kdxVE4OnmzkJ7qhQAhPjwGixn7XVcVgQIHO+vWRu28Ia1fps4lF8FPJ5BDvEe1EkWFLzj
	 RUpVdLDXL2A3mnkm0HlLmzK8p20lIq8amgu06f3H2X1L9IXKAfypRuL/oEHZ9/4IaOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HGPjR6Wv;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A99606A31C
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 13:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5A99606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HGPjR6Wv
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e977109392so28274805ad.0
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 05:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794923517; x=1795528317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eboZ8wd57YYSCKF+wtcZCIsW/kuWa0Q77BxDUZ5VNSo=;
        b=HGPjR6WvvBA1a/hb6PR/RUmnA24cIYaYUAQBHX508bHw7J8Yiy+Lqzjb2YR3c2shrM
         AywdGeFrfkJK8murKfwpxyBEt/mRhsO+dYxWRgUjBY4RgK6wD40X/9CPa92rmh88Qd22
         MsVQAmxF9koSIzAAhuvPWEzslkQv0gDavaRllXiAXPihTJNN+KTYEbwYXeORd476pXoU
         Hgfx9V+yEU6TXliPDsR6TNfnoqrT6jYzxougF0+xRj+Li45EqitfvUuKJUVd3STbuNnM
         n3D8f4SoWCdHSrECAAKP2lEyXJ4bP2pMvZchgRJZhryGfE68Xmx/sA0sTooAf8iWHgC5
         1dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923517; x=1795528317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eboZ8wd57YYSCKF+wtcZCIsW/kuWa0Q77BxDUZ5VNSo=;
        b=quhsX17kGgaqKYn+hTeaunEWcOwmBs6viuDVmmMnkTR8b5lHFKer+ktqTPzJ6uAgKk
         Ax+0g1MC63/2nSw3sWqhJ+w3orggC25WdEsrYMztZpWlka/0WzeVLSuZPbRs5FaK63hv
         p6iEcmowZ99szT5Vh1ruSmJhvcuMgiGPqAITkN9NrA6bZ0C96DDBdsCR4FhOIcij3C71
         WiY3k4Y9D98w5Za+AUF4Gha4+3kcmmlj5tlegIeKo4/YQW0CeE2vQLfJK7jqwRZaNQhb
         QW13c0hboHO5GZRLdso7fxPxe0f8WNcwa1bvcsgcaKxHwObBgUR11c0bw8njDGnOvnzx
         k11A==
X-Forwarded-Encrypted: i=1; AL+hErGchBCDWi0TZELq9hCyX/gS8U9lpyyrvNYruIhi/0FktsFUT0qY6/xxNRr+Fs4uIBn+sZ4s2i2GkowW@lists.linux.dev
X-Gm-Message-State: APuU4Z94E6+qpBEUzi68A7SPoNtyM09KaaV/uD9BrMdhT+nkCebTuNgK
	yKfqJcWkkynmH1VCGZAVt429lyI02TdoqSdR4ZIRMX3wJKphfjsn1Qd0
X-Gm-Gg: AZFdTZfV53jFNZ7nO0ZAhT/EX/8g9SsrYd22wRHC+TMeD99qQYctCt7tptcQLqt258c
	HKgbyp19N5JWLOBiF8DmH9dHwYr1KNY0efNMNshc0SmqwShxHJ1SxuUdWeuVoJTywHmvRpybe6c
	epjhiu+OoKWPWNUJ0wgIPgTNvcV0pWDCKxQ/Z4RS2/QaW53It2asH+Ma771ANenLGGQdEEk4cAF
	W56tpJdHm/QF2qQlWtLO9FOMKJF3jYGKUK5QgWD6i1cokFlR3aCLRtH8/jvifyXgvWV4cY0l4rT
	2VdopJgiGFx+eBVKaLsiMcqHKlSlLELEcwYLOEeZr3sNv5Wm03Xl9MOwJwbyuL8t9ShWxr1Ih7b
	LUWcDeYizD+h2MqKJM7W+WOgYmXX5yZaq2MS0QAWnX6bSrkZPUYwRiz/57kmo1i3nOxl6jjKN7F
	5alhA6PSUcgB2anpF0MHsNWiNOAhqCGGDDwMHoyXWsLgNFghqxlFufveFOViR8YkpC5ojQU/BNZ
	C6pZz++7jTLUQZKBmg87sN3QxHlZyfkbjTpE2XOnJ6ayY6S/gyjsO7c+wX2wX9W1erTXem4h/HG
	v70TojIRZ4SSiZ7J8IEtExU2o45TmDF/+2doY3oRWvRLFKyseg==
X-Received: by 2002:a17:902:fc84:b0:2ef:eaa8:9b59 with SMTP id d9443c01a7336-2efeaa89dc6mr10152485ad.48.1794923516856;
        Tue, 17 Nov 2026 05:51:56 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a586c1sm15937035ad.43.2026.11.17.05.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:51:55 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jan Kara <jack@suse.cz>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Matt Bobrowski <matt@bobrowski.net>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] fuse, fsnotify: handle embedded NUL names safely
Date: Tue, 17 Nov 2026 22:51:34 +0900
Message-ID: <20261117135146.3174252-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
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

FUSE READDIRPLUS can instantiate a dentry whose length-bearing name
contains an embedded NUL.  The fsnotify name-copy paths then stop at
that NUL while retaining the original qstr length, allowing event-name
buffers to expose uninitialized bytes.

Patch 1 skips dcache instantiation for these READDIRPLUS entries while
preserving getdents() behavior.  Patches 2 and 3 copy the full qstr name
into inotify and fanotify events.  Each patch applies independently to
the base commit.

Link: https://lore.kernel.org/linux-fsdevel/20261115210952.2140036-1-graypanda.inzag@gmail.com/

A custom LLM agent assisted with initial discovery and reproducer
setup; all root-cause analysis, patches, and runtime tests were
manually reviewed and verified by the authors.

---
Changes in v2:
- Follow Amir Goldstein's review: preserve FUSE readdir output and skip
  dcache instantiation only for invalid READDIRPLUS names.
- Replace the event-name strscpy_pad() calls with length-based memcpy()
  and explicit terminators in inotify and fanotify.

Tests on 23c62304dde2 in QEMU:
- Patch 1 alone: READDIR and READDIRPLUS getdents64() returned normally;
  the embedded-NUL entry was not instantiated, and FUSE_FORGET returned
  its unused lookup reference.
- Patch 2 alone: the FUSE READDIRPLUS/inotify reproducer returned the
  original qstr bytes after the NUL, with no stale slab bytes detected.
- Patch 3 alone: tmpfs FAN_REPORT_DFID_NAME creation and FAN_RENAME
  reported the expected names, NUL terminators, and zeroed alignment.
- All three together: the above FUSE and tmpfs regression probes passed.

Junyoung Jang (3):
  fuse: skip dcache instantiation for readdirplus names with embedded
    NUL
  inotify: copy full qstr length for event names
  fanotify: copy full qstr length for copied event names

 fs/fuse/readdir.c                    |  2 ++
 fs/notify/fanotify/fanotify.h        | 12 ++++++++++--
 fs/notify/inotify/inotify_fsnotify.c |  6 ++++--
 3 files changed, 16 insertions(+), 4 deletions(-)


base-commit: 23c62304dde29abe92013d85910d03a77dada35d
