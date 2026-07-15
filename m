Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4058C3B47C6
	for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 17:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137398; cv=none; b=b7gqH+GDopNwJ56utMgQ3Hbytwdwcsj2A9ROmK5JqDojPnVmd6QoGm+t44FmpNoaFBjPHmRwKH9+cefeWxzVjcbtRAdaY20e79MIfxFArHQALGU6WD4NvYqd/e7NW7tOW7rqfOL6lU4BbHt7gO3P9/FYS6429afHHpykB1F526c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137398; c=relaxed/simple;
	bh=Pyp6IZaNUPaajrcTMDRAnu5qGvWVnfwKrGVkd9Gfb8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vb8tnj1UDssPs7SuB681+a/QGH5R/BhPIbjMT71/Qee8enUSWURH3xBf3ewyK74gciCYU6PpNi67EKD8XR2spCw1kRxHe0C9o0jI5MkUxTTrwoJoUUkMZbq9zj+L7gxxklqvkOA26LcUaMFwSxKohtK41jEbNx9zHJnIJFsYcgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9GeZpFO; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9GeZpFO"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-456395f4e7bso426586fac.0
        for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 10:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784137396; x=1784742196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hRBNiFSreGlDVUPegkEyrFR73F4XfXdZnVymBwozya8=;
        b=K9GeZpFOhv/DVVnwJd8FgZ0RYhMu6S1bpdGx13TAJLbiZlIjBTtwxb7F0y7AZW4q4E
         JeLLJ4vkcRsfiNywDovksT8eHg6G/lBf9rPau1q6jOcEvKLzM4XVtmxnWDsvIl5ld1bI
         NhW23WIlw9Qhu2oxqjoGe/SQ+lYDZxrKjtMKZWyW/pM1ReC70hi6JaqXuLN+zgRNmMtm
         HiWlxfN83qu6rsdcQGd8W8VsclsKkQUP/AdDMFOvCQ7s2fe/OI8RALXnZ0I2gPlAfRYN
         YU6w8PVRZ1IJf1cOQMvyCYtgcSLcAQLH9Dj0BDiR89RDOQnY18idbxhza8Txnm/LIImD
         p5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784137396; x=1784742196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRBNiFSreGlDVUPegkEyrFR73F4XfXdZnVymBwozya8=;
        b=SnIqJ3FoGoeO0VgBAMGNtXw9LAJg/Nn0rwiDSDxxIOFAZq6qArC3jFkq3jJ1FTVqhd
         2rBe6DTdBQm6z/YNXLajkO0VLUOaFmlThOAxq3Gvb/YgHA2LAzQ+pCaNFxLIbOgpip7/
         4ZANzEr5HGJhvniotn8v/0IS7GVDhuqUkjG/p2kQgOuod9m/mkQh+u3u7xZBZ0tsYU82
         G7ZlyHdwyIXNUMT8Y0gxNUidUk0t3UaKKkG7rRhV2PcQTWTwQL1j41nZM8ab+bfqoEi7
         9/r3f6EK7uzOI+2SVgbjuDZE/L1fPFRvEA0HI7xkIHA51wr0NCrRJzFeIVJ8sGeKsFqD
         3D0Q==
X-Gm-Message-State: AOJu0YwQC6JlI9JXcg3BIdaZT81/lC5Uj9fKNsMy+72VbzASd3LfuLtZ
	DXmLCFGRTii2TfiODcEx8yhhaA3I5ef0myA9od/cJiJ1EijZSM+ENkzZRmGy5Q==
X-Gm-Gg: AfdE7cmdlxmBUHJik+8tevvG+E0cPCq/ThQsuXenfpObcWAIZxOFwnOJ0KpD4wh1IeE
	K5I1Aaty/ehpyaVNX/v2yBajzL4fBSsMTzg8nc2PS8kB8lMwXy5ZsLpVvyn4wS8dpOrw7HkUrmL
	RCiSpdPFvhgemJW10SDwhN5C7SZA2tKdy0PmM80/ME8/JsqqUSoL9iMmw5K0XMgwsQsDAckpNMv
	28wEOfjWTmUgmtEETZc/El+PcH+Zj6tGvU6UcIK+yu2B4oTaExpgU2fxNCHLV6UerzFV2jnJB29
	ILHWQimEYks2IPvP1r5oWoBvg9LQZWlLVpPqHg/7WLaWQQP9JPCe1/lxllxZEVkL8DzqO/v+COj
	oxwVxR+4j7eHeL7vmKDyYSN3JdzAsojeHvhgbu1Lsh5D9RaEiiqvwcXuOxIs9gE6D0NPE9SjzVJ
	Y/Vq35bx9GZ8yM9ynYZxMP+YRYfpQECrpQt8Ra0dfNkcJEEpQyvlqf4btRS2bqTlqaBYFgPSkZ/
	PM=
X-Received: by 2002:a05:6870:940b:b0:455:e2d8:1c5d with SMTP id 586e51a60fabf-4562b4a993bmr2313045fac.18.1784137395958;
        Wed, 15 Jul 2026 10:43:15 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:45::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519124d07dsm20027077fac.2.2026.07.15.10.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:43:15 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: [PATCH v2 0/3] fuse: fix missing barriers in io-uring init
Date: Wed, 15 Jul 2026 10:43:02 -0700
Message-ID: <20260715174305.336261-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are pre-existing issues Sashiko reported [1] on the fuse zerocopy
series.

[1] https://sashiko.dev/#/patchset/20260630211436.2062816-1-joannelkoong%40gmail.com

Changelog
---------
v1: https://lore.kernel.org/fuse-devel/20260713175345.2542331-1-joannelkoong@gmail.com/
* Fix some other pre-existing issues Sashiko found in response to v1
* Add patch for using releasing/acquire for fch->initialized to make things
  simpler

Joanne Koong (3):
  fuse: fix missing barrier when checking io-uring readiness
  fuse: use release/acquire for fch->initialized
  fuse: publish io-uring queues with release semantics

 fs/fuse/cuse.c      |  3 ++-
 fs/fuse/dev.c       | 17 +++++++++--------
 fs/fuse/dev_uring.c | 18 +++++++++++-------
 3 files changed, 22 insertions(+), 16 deletions(-)

-- 
2.52.0

