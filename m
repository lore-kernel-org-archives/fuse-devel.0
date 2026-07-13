Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC662F360A
	for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 17:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965256; cv=none; b=QVUO8JARkFB0FR7H2OdCWMjXI091HmODsrVLHJN9Le9LrWXRfL4mrW3NrzRMwUEt5iVfVB2NvPqtgqwn8M98+JCoPZ78OYwJaIbBEnRM3/l+dyw4t7KDDL47i552rOTQBVA9liKoFV7uWpq/eXiLtA7rNsnzGYhSEA2FerL8Lnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965256; c=relaxed/simple;
	bh=fwwlYXwipnRJM74azo+rjLcKco1it7zPCL0/YQ8eHvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGVI5pkXDLQlPPx1rC3d++8tHdhl05PIL4wi6lH0m1Z0w5FSimZhR1awL5Hm1Vzx1UgE0L9sE6R1vV33SrNWyEIKaDRC2kZuaC35xH0+Oej1+L4VGoBdBlpGu71/n5pDDtkxbnL3pJKozDhvc3Rmf0DV361HQpWtWOdkN3Pe9JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPx+e71s; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPx+e71s"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7ea9c6ea7deso2459586a34.3
        for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 10:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783965254; x=1784570054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0oi7RBUONXGXfnURZsInlGh33PNi9ChYYlmF2YyoKqk=;
        b=NPx+e71sVQt+ahjB8XXH1cRNH0VCT7ErujFZVReg3Yq9tL9eVKqwhhtBwc2x0tIJY2
         ouQrG8NOLc9ZzZrBdCGL88RmzTuYTE8GcqMIczqNEjkCGfc82IY31+gxqjBmu8uqyPoc
         eRgc5hWUkv63m6khY0GaYgRDMUEYM/Yja4MDoLm0pHTljzdqBw5bp4vkqZs5QDKBk9tC
         CZzUtFKeBqBKLEBdAXFR9/rGUcHznl5amJJ2oInL0E48QiSyIVZmIMEJ8G/1fnOTmr0r
         GHPe/G3vcw3nPfSJDVp4TMB45qusNOf6du7KekUrwTAB14EaOCfMxukAkSSX5pFbrJsg
         0j2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965254; x=1784570054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oi7RBUONXGXfnURZsInlGh33PNi9ChYYlmF2YyoKqk=;
        b=TdSGt/D/9pjHhXqy6KOSgqOtX9EwTUuwirTF4829MvVTpX44O9EDcDLaaPLbZCHlHY
         AfUjuiMzfWp2cFDT/Ltp7FFuR0lWhezTNr8SptSQY9qi0ElxG00C7GCY+Fqdd/TTEc9f
         Fm1B8rjspnwA0Yebz2AkRZVYePbtrLU/QYSjqCDfSqYdvL2FbbRoWtAmnsIcWOA1wnN3
         Rc9dTQHceFeTDOSTJvF7n2R9HuVnoya8XlX75cVShh1HKfpH8SRQ42OoJwxfsUgYBCp9
         TsW9+WLbHN9iG6er5wQSuAoDAtHOzYfRKRATj9WZ03YjBjrCfVV5qY6Q7fsQ7876+RZF
         fFvw==
X-Gm-Message-State: AOJu0Yz2BET11x+ltr6DysWYGF4tigYyFkizhwnLtzPhcw8Bf8vlHzJe
	JKYbk9AcEVxzzyC7fTxOzPehIEU6bFUuVahqOa1BUPcoFWGSnczEXK96vQju6w==
X-Gm-Gg: AfdE7ckZ37NWfK88hQfEndGlXoNq/kdugLQo71UT9IU3x7j9MWIoH2u5mWRvaBQeZtV
	vaO0ORZYsKSLVB87M3/TcW+Uoy24hE05bQ+tQA82TKmDhL5oi0kHRQbzLkdbEpNOhaJDsHxGf6n
	IGBoRUaljN66htyc7RzceE8ZWAkNaJMW3VuP2jrx6KSWHz81vfbZ4jAoMw20LVXniM78WH2eU7A
	r7c0avU3x0RGP1wYjwThybAEfztEIVtqz1NiYgVFkIa13qsgbQ0aL51hRWTayUqdRRowkoxvcyL
	JGBaipA3kC1/gFntqu45qoLoBJ6AtqflhYT5aDhFfUJGxt+bowDRf5IHsS30quT0aY7/c03SdtX
	Kda0iOQNIOXIWGC/a/9dW0wQdQpIrRll2ZEqWob9gQWmvg2GCrbs3fPoeJ0c4qg384zV/ykCXUn
	NMPU8WxhsLa98gfufBum34IzjaQFLnFZdhdUe3VoQWhZ2c8vatmfiG6z5bncPJ71tyq2I74tZ1i
	6c=
X-Received: by 2002:a4a:e910:0:b0:6a3:7701:660c with SMTP id 006d021491bc7-6a3c607cbb7mr303794eaf.20.1783965253754;
        Mon, 13 Jul 2026 10:54:13 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:73::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ec2229b4bdsm4169384a34.1.2026.07.13.10.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:54:13 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v1 0/2] fuse: fix missing barriers in io-uring init
Date: Mon, 13 Jul 2026 10:53:43 -0700
Message-ID: <20260713175345.2542331-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are two pre-existing issues Sashiko reported [1] on the fuse zerocopy
series.

[1] https://sashiko.dev/#/patchset/20260630211436.2062816-1-joannelkoong%40gmail.com

Joanne Koong (2):
  fuse: fix missing barrier when checking io-uring readiness
  fuse: publish io-uring queues with release semantics

 fs/fuse/dev.c       |  8 +++++++-
 fs/fuse/dev_uring.c | 10 +++++++---
 2 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.52.0

