Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA5526ED37
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 02:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778897534; cv=none; b=YmkqOr8NmMc/YW53SEKi7wT+2RPDeF5uZ2AUmrraWnd/qDwPkwdAHIHcDxiSqCxgM0eV/U+tzDMx3HObj8NP8HRN10ni7BogWezK4OGxJM/qG94h4f+k7Nishn4gSN4VE0W5H4nRahrChKVNskR6Wja0kxVyg0mfNQPApxvVsTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778897534; c=relaxed/simple;
	bh=YEo89KBqWk1vImYTDhP6x8tubAAneywxfTY/O0vkpLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eqxWfcEqM6bmtKiDpehYRdHoa0L4a2LTHCyCW+/BwXONtdIE5Vy0uSC2bOC6DhYfVdtmH9iawGYZT3FWPDdY45tPECqfs/fFk+RISGyMbVQDZ4KUmrMvglIq2I3lDNipGrhdg2t/UShDC0UQdKs2n5/5y+v6O5G1PVPUILkMwwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSLqSJ4l; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSLqSJ4l"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7bdaa68cf81so773277b3.3
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 19:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778897532; x=1779502332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A2NYv/RdLDReYa8Xb82NPkv21y5z3clBiWrIM+76oJo=;
        b=fSLqSJ4l5I0uC6Ai5hh9cFSpkVIBD7BnTuJiLz2eiUQg8aUUkjNCMiE/JWN9wYNbsu
         NbuInPzNySKywB9FXTs7UjrWP59XPH2U/rYcstF9NV3aEfSnIGeH5EoBaHe7xYptasqL
         6RL3GGui8ine9wRl5/As9HfgaNHVqw+8hVImTkG+N20DM4ndd0HFMX0707EI1TDHjcKs
         VCxGu84dShitl6FX/fe+Sd9ovKfjgUKJemn5OvhEZ4RxlJUck+5JfrdsCjWbtLYkjRWV
         QWlZgMMa97diUpx3CuIg5daYM0rXzVT9NWqoYqSge0jh50tRYFtvOSnkSEjOaDnV0r2k
         4Uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778897532; x=1779502332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2NYv/RdLDReYa8Xb82NPkv21y5z3clBiWrIM+76oJo=;
        b=Iv93hy+5d5bj2piuD3bsPoDjGVa/hGVYNvnVRdOT87CfFIyj6K6x0wxURCQaXX+5Gt
         ot7WYVKiVU6mwsj2eGzbFvtSSWl5EMtx2SlXhY00CCPdaOm5mfUlo4biG3CB+oj6gAeT
         4KCOoVt/KAkiIPFVO/M+/8zCCnIJSEaa6jhWJDW31OSm9MwU8NmdGTUuyq17E8OJdafc
         0ukwI+poUUxhKUWkZShuzBmZlPc+nJG8ut9/WWsZ/zVmOonmXvnJZC/+IUMiqWyWy9mj
         9cg20RMOwKuIwFmNEaFhwYAfQANb4UcbX7te4vgHg6Ra0N68lbOUBt9DtujK9SyuQxWF
         FdyQ==
X-Gm-Message-State: AOJu0YwxazW1F8vIAgH7gjg66sxZlT54zkIFNPUMofR5eqxIJp1R8ltQ
	Ol02OZUCskB504Lvv6+tcUOA0qLda0/KYO4FDLmbJJx/hXIgtYrK8ga0
X-Gm-Gg: Acq92OHP3hBIrJ97LMyQ471BJlttbvGSnw6V67itZy+171Z+Z3qH8hxvbjj2XDsgcrc
	IpuUP7nLBIwwdAcrIUSv/cnOMrDXbBN4iIiI28dh4HeR9/WjgzNcdbxnwfX2nE8e6qpriokL49C
	hBkFbp+mXgTuZp0BK21G+5OG5othYJImty65eTTp3T0NyWn8Tse3hGB5q8Gp3VNEmgTuqdIAkN5
	yzcgxKNkBVxHV9BWAoysIkOL4glawFdg9fXdbkUt1z5Rzlavq2HHbeJXosqwhNQjr7emjh6TUWi
	pr/qrmuVLPObqQ1aWOcy8m/CdbhHysE7q59OsDEwgkjI7cx/1B3Zq9ZquiTMavzz2AmHXqnGcxv
	lQunis4T6+bQfAuHO39Kkl2gKlOOte8xFuF5828NYjxYFfrHexI0DHCM9SzSeYdoFeU+Tzd8GWn
	aijLkLMwH5WPDZsZC8wV6HMTQ+K5wKVKs=
X-Received: by 2002:a05:690c:e3c4:b0:7b2:9347:7bdf with SMTP id 00721157ae682-7c95c202cf2mr81432837b3.37.1778897532299;
        Fri, 15 May 2026 19:12:12 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:3d::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f4ee7dd0sm39325987b3.23.2026.05.15.19.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 19:12:11 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	bernd@bsbernd.com,
	ali@ddn.com,
	horst@birthelmer.de
Subject: [PATCH v2 0/3] fuse: fix io-uring abort races and cancel null deref
Date: Fri, 15 May 2026 19:11:35 -0700
Message-ID: <20260516021138.2759874-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 and 2 address races between abort and fuse uring ring creation /
registration. Patch 3 fixes fuse_uring_cancel() moving cancelled entries
(which have no fuse_req) to ent_in_userspace, which can crash
ent_list_request_expired(). It also removes the queue_refs > 0 gate in
fuse_uring_abort() so that request flushing always happens, since cancel
now decrements queue_refs directly.

For some more context, please see the discussions in [1].

[1] https://lore.kernel.org/linux-fsdevel/20251021-io-uring-fixes-cancel-mem-leak-v1-0-26b78b2c973c@ddn.com/

Changelog
--------
v1: https://lore.kernel.org/fuse-devel/20260515045541.1171335-1-joannelkoong@gmail.com/
v1 -> v2:
* Reorder commits 1 and 2 and edit commit 1 message (Bernd)

Joanne Koong (3):
  fuse: fix race between registration and connection abortion
  fuse: check connection abort during ring creation
  fuse: fix moving cancelled entry to ent_in_userspace list

 fs/fuse/dev_uring.c   | 32 ++++++++++++++++++++++++--------
 fs/fuse/dev_uring_i.h |  6 +++---
 2 files changed, 27 insertions(+), 11 deletions(-)

-- 
2.52.0

