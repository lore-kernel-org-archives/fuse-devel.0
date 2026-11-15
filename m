Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777003;
	b=dYUSRf6q94rFmx7BBO5fU66rBSWQVxsZczh0aaXWyWqKhaoqc1QYb0D8b3t6DsQz4WaZ
	 VZv1EU31Rort93mBwB+8Vhq97Vc9iRvZZrOj9g9+BkbQamXoHCwCS524v/ovfdpeOTYgX
	 NC1V5knBZ30c7XHPS769bCNXpW/PqCj8HRLiA6RpaXqPuOY52sTGbEtrASrGpVm2CVmfx
	 fgypqUn2dIVyhbbz8A9TR4wiKTVPBYasBXngOO8rh81wGDkI6oO00IaWpcjazNwzHwmEN
	 hWbVBYyjBlfHzjaXuUluenllNmVuBShLcQ2zn1Ie5TAiMZDGyi3IcuCYcfQN5Ze5bDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+9JW7J5HjIZOKB44W/FdWPu4us9PkTChnS047FJOEoI=;
	b=hflZzT1Rr7lzr/zjrH3/JdjqzX/i/0gtME8EccS24qtokfQLODLXkWYl7UrLPQ8vvESD
	 1odJ8Ps7KedesIOjwo/J2CLlBBvkNaM/Eeli/uyxNdyfezFdnpwJ3oGHkcwpC/ep7yCBa
	 IolOK2kXxEuHqIvETDv0QoN+C7ECas6WiEC6hr9S9WPzSZQ52qEpgpH5vHiysLGQyM1uF
	 zHrXbeUNjBEX/dr/LEUnbkDUGmnDqoos93EfLvtBKH4K2FbLd/hGESWzqC7ht5/xxb+CU
	 xwzAsy5bpVeaJK3S+6ktYRfwl0M/ykfG9tqJ/rMbEFd0mHzfzni7CTkJG7dirA8u6pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GIB6NyCA;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E309606A329
	for <fuse-devel@lists.linux.dev>; Sun, 15 Nov 2026 21:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E309606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GIB6NyCA
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-89d6bd67045so1228197b3a.0
        for <fuse-devel@lists.linux.dev>; Sun, 15 Nov 2026 13:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794777003; x=1795381803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+9JW7J5HjIZOKB44W/FdWPu4us9PkTChnS047FJOEoI=;
        b=GIB6NyCAR2V0meXD9ps8+mTIpfebr21K4rFlehNIbaSr65FRJL6q/hHx1ZQiD1Miy1
         dwgVbH8Iw6i7rXjHGU+5ICJFODOk2Ml0vsqzO6IalT8agmXI8VxAYrfsHgTqGdioYWwo
         QYxhf/KovMYYXXI6AaFJsSg8ivjTwYnmXJ+T4UKvvf6PNLzkHeLZkhMoTjjBU/31f4Tv
         0rK6/g3mgbrZRFaUVR0voTghrFDEkx9YufXI3NzYpDuHTg5jPugMu5sWS8FMFm4OzbLY
         WOUnn0N1UfPUhPAoUTPIHBq+gcXSt59qGZxXp9gRoXFOrmraq/VCur0E23FGIEY2yKq0
         3Lbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794777003; x=1795381803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9JW7J5HjIZOKB44W/FdWPu4us9PkTChnS047FJOEoI=;
        b=gfTaFfe2fDsrsqj81Grv9x1yGHT6fFSKgkHD9/zzu7TiAZK83qbwlKA9WRt0xP6APB
         eHOxn/2SH32LFa8taB/jygODJjUt+9NVTyu+KSe9Wr8LnMvz5n7gdOZJFljXljqYvtKg
         +YgFt5WiY7T0WjE64vKvObX57sRADQom4+tuic99S5lgYYChzm8UPy5R/MA3IGySfrgM
         b9T9W6l5NRrBQzFN2QlGdzPBPrWjQav4BggPVXclyHaXT0FSSCMIfjLeEbG9mS8O5MMZ
         arERLfVpdVmM19ZhgrAeFOu+7eafC/c8z7M0u3S+jt6+Y7MDshAqsJm61CUeRDu6C6ac
         EPXQ==
X-Forwarded-Encrypted: i=1; AL+hErHhFyhVLQ3StH5dCYddRgK6s0Xz/2Dv0psvLTUY3Dt3El/u2CvTfAunzYrzJZdM81KUZxK9rMB/SuDl@lists.linux.dev
X-Gm-Message-State: APuU4Z+Bwa340zC+FK42Cd7ZvUJ9lymMxBq47AWwyaHBHJFcDW8eccUx
	6RHMKU4N9ShFYxyWxX+OmoLet8jBj+RrUzT0X7MoRnMfo49mWTPCbvbg
X-Gm-Gg: AYBFou38iIf5sVCUEiaXvL/Pgpe7D3mI3ikwxOWAg8ZBTxhoyM7Nv8Y2xP87ZN8MQlS
	O8n4OBD2nuRyYfyMySCwFAW6LJm1Fs6bBfRmlE9oe7J35JLEniPRAV3FQO6oRLRL7fBHKS/kqvc
	l9fEqt+ESbPHW5u2vtVhWEw7dlWZk/WfZa235bEfsXtFdIubzV66FXRguD2KDSDxP5PeBChWo9o
	2lno1Vj0ew3Pk+AAvXJNE+D2XtExdsDr0xUpDs023gk+tch/5EUQ+/KNBpi1vziuF3hd84ZKHrA
	F0ZeNd4DUjPdSnGEMvxLB3EGq4q039TP9BhTNJZttlV3SJtW/kD+NPCXEIfgd2MjI6eix8Ki8yU
	Nh0CfnyiUbVvxZ9+jqY6ewBT/5g30fMO8X6rljUfj39A8g6k3BiLD+R6sz4L0FbxoEkt6aTAES6
	FrVK150P4rTz1p5ND5MccKfiLxWTsQ+3CCB57brNJQysOuIa+X5bxQiLV37VT66U/c95s20nY8F
	UutnG7yUEAj8iD2JvTQ8w4EmxB8sOAYBZMiU3yGt1jmz7oJN+KN2w08vu5XPLwjtxLQPf1jFlS7
	q8Luq0kDgvYYRLMgWY+JMQGmuDx3BN0XZSM10gYLbuAlH9t6ng==
X-Received: by 2002:aa7:888a:0:b0:888:cf3:e4b6 with SMTP id d2e1a72fcca58-8beb7f0b151mr5424463b3a.30.1794777002725;
        Sun, 15 Nov 2026 13:10:02 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6e7f5sm2892615b3a.25.2026.11.15.13.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:10:00 -0800 (PST)
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
Subject: [PATCH 0/3] fuse, fsnotify: handle embedded NUL names safely
Date: Mon, 16 Nov 2026 06:09:47 +0900
Message-ID: <20261115210952.2140036-1-graypanda.inzag@gmail.com>
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

FUSE readdir and readdirplus parse dirent->namelen without checking for
embedded NUL bytes. Through READDIRPLUS (fuse_direntplus_link()), such a
name can instantiate or alias a dentry in dcache whose qstr length
extends past the first NUL.

When fsnotify records that dentry name, both inotify and fanotify size
the event buffer from qstr->len and copy that full length to userspace,
but populate the buffer with strscpy(). Because strscpy() stops at the
embedded NUL, the trailing heap bytes remain uninitialized.

Patch 1 rejects dirent names containing embedded NULs in FUSE.
Patch 2 zero-pads inotify event names through their recorded length.
Patch 3 zero-pads fanotify event names through their recorded lengths.

Each patch applies and builds independently on mainline commit
23c62304dde2, so the FUSE and fsnotify changes can go through their
respective trees separately.

Testing on x86_64 QEMU:
  - 1/3: Crafted FUSE READDIR and READDIRPLUS entries with embedded NUL
         names were accepted before the patch and rejected with -EIO
         afterward.
  - 2/3: With Patch 1 omitted, FUSE READDIRPLUS + inotify leaked stale
         slab bytes past the embedded NUL to userspace before the patch,
         and returned zeroes afterward.
  - 3/3: Default FUSE mounts report a zero fsid, so fanotify_mark() with
         FAN_REPORT_DFID_NAME returns -ENODEV on the FUSE setup;
         regression-tested FAN_REPORT_DFID_NAME create and FAN_RENAME
         events on tmpfs.

A custom LLM agent assisted with initial discovery and reproducer
setup; all root-cause analysis, patches, and runtime tests were
manually reviewed and verified by the authors.

Junyoung Jang (3):
  fuse: reject embedded NULs in readdir entry names
  inotify: zero-pad event names after an embedded NUL
  fanotify: zero-pad copied event names after an embedded NUL

 fs/fuse/readdir.c                    | 12 +++++++++---
 fs/notify/fanotify/fanotify.h        |  4 ++--
 fs/notify/inotify/inotify_fsnotify.c |  2 +-
 3 files changed, 12 insertions(+), 6 deletions(-)
