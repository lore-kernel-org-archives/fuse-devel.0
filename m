Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961573E5570
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 19:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780946545; cv=none; b=Sqhs649v/qBvi/1htrnpWT1Rv8YY1NYnMjyspadbWv6YOC7gdWMr095O2p9CFUdV6wkU7/POr2nrnF1GiAIziXpKuPxP2wPNaDE6S/dp3hxA/wtAlkXmLRAu7ej2B61ll9jOE4xRgFRPseb0+vNQ4CulWMsrm/SKPsSbYtlybrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780946545; c=relaxed/simple;
	bh=kV+WTtWM8rcCYFbD2eJQqGSUCgR/aDL/ep1rPmDxOcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=blQpZ0dn5nhflixJFsY6Iuk74mkWuQdpXa+mmkAebaUkfotwDvN8GIE5g4TcS9aQVNu0ztdw2CLQES2WPrebCQpbJMctDZORX/+Rr1nmC+bMDe0AOeNcK08ZVeGIlXYGjtRt2dOPLyt5E95rmbNTwA0TNb8nYU8ElbMocgwJrGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCw0Fs5H; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCw0Fs5H"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c86215c4122so660815a12.3
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 12:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780946544; x=1781551344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMK+bmQN4bHQBc9eZZJ5FM9aft/Cj23bPAJEHz13K64=;
        b=TCw0Fs5Hy5EKygWcpN60TVbZLVufJJe4KhL8rsu1n3n0m5qVDS657flZ8IqeAEvl9i
         sjfeJu2wa9wznntE31pXzbdCU4bKx5u018BPI7PYxywnMMfiycV+LL0DN/4KCHcMEB9C
         du6ZYpYdKBuXU4DmK6fSFZ5y+sq/IS9UxopltO52YI8Jn7N6sHwH75rS+9HCctl91dQ8
         0eJx06MGFaeJnmevjUjw/UqBFUlLtYlS6iO1cv0dRcfZkrQQET2SXrSxBsTGSxfF/3Tl
         Dk8G5cbjfKjyoCKPsBpay2ENKbA0e5rgArrKB8WIL0lxLarfT1VZXggybhXYAYbgje5m
         a+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780946544; x=1781551344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMK+bmQN4bHQBc9eZZJ5FM9aft/Cj23bPAJEHz13K64=;
        b=nWSXYl7EKJt4dvUCegy0mf3oaZlDtzWiIyMvawFZRkSVbQQuQM4zY2/+gStejGrnjk
         cR1pYo9K2IoAuusOPSv1wniZ7Gnrf7kb2OoyXgkZNkshSbGoLndDXqxUCqimx+zvlBq0
         c9PCFSjkBmv0OGXuUEF1YIjxh9nuL1exaTxOusMLZZlOCaTxp9jzknm0v6YdPe9AkE4j
         x57hQ+sDPWhoNuOSheh74sGuyc6qOGLoljmCnEQozv0LKnNvacE8TUl0Dpt2/Iu46zwF
         RSYMOQ9uCGDoJaey8S6zduUY+W9F1l4dTO2omJi7IUNOgdTtL4HsgLs3okUiR+mluYN8
         3vuw==
X-Gm-Message-State: AOJu0YzrAHNSH8OAMiUGLyCqUp6iuFYkXJTj/admq/5jPv8msynIh2qt
	87kyPIKKWuyCNzD3v3DmIJu1OlmqbF9+yLHsdZGwBhYlw0RsLqcnRhrJ0AAFkQ==
X-Gm-Gg: Acq92OHj4/mOd7DWL0+FFpU9qosmPtJMBunShYI/BBwczznU4qD5Jz4YJbyyKgkaZ5w
	yn32qckcI/3yBjoOiL1V1cb8CfJKwuuW4aE5XYJt9786lz95bIb0EPbt8JlM5wT11aFnDI8StuY
	Y8UCezgKOVcu1gfvCI0xPbsIwpdDNVEzYhd9xWfiH6kivXOpyO0f2Smkh8KLzwg+c3C2njE5D92
	SvbwNtowSHmxIqI21wzgKHwxlgxcEWkofwzbsky87Db43wDFct/NzszXAOPACj5WthJmPEUuNP9
	OhuXK4PjGW3tkGQcrbOaZgwDSK2aYWP99Cr7ETl7pJJZG60HkDgIOpn3HSPDsEj5b1JYJopKBDa
	rbA28YLac3dqr4QjP4Ll3+5JOooWHfOw6Iqb5zo9p0DZNThCTdb8nRxCtpaJ/UCPbbFj3qNAi5S
	EcVSjz0Bd9ROK5C1NsLisVBRszFo4=
X-Received: by 2002:a17:902:c949:b0:2c0:cb90:1e08 with SMTP id d9443c01a7336-2c1e77754d7mr197784655ad.0.1780946543731;
        Mon, 08 Jun 2026 12:22:23 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:a::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm192688665ad.80.2026.06.08.12.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 12:22:23 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	bernd@bsbernd.com,
	ali@ddn.com,
	horst@birthelmer.de
Subject: [PATCH v3 0/3] fuse: fix io-uring abort races and cancel null deref
Date: Mon,  8 Jun 2026 12:21:46 -0700
Message-ID: <20260608192149.23294-1-joannelkoong@gmail.com>
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
v2: https://lore.kernel.org/fuse-devel/20260516021138.2759874-1-joannelkoong@gmail.com/
v2 -> v3:
* Add Bernd's Reviewed-by
* Change co-developed-bys to suggested-bys

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

