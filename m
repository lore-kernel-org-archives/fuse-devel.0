Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F754396579
	for <fuse-devel@lists.linux.dev>; Tue,  4 Aug 2026 09:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785835100; cv=none; b=gZplIsA1sE3DSzOOJGQ0UmNYeKEKAPNrWXmDmZahLhXtUvJ12+AQrveswK+kavuuEs+2DkS8V21UBcWhkTbzeT0+0eHWRht7pIosKEnhsq2xec9zE9X+fCzQfFUqSRfH463aNNLZgw0WgrSIn1Q1cdkDuIrMwsI+QERnXi2h6wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785835100; c=relaxed/simple;
	bh=WUQQSY6H5nJcSQifraCw4S12jimpulyl4w5ppW94kbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jF/81FljCPqdDRkNC0GxUQnUqa10nDW0BTyzalSIsMBw6hWdnlNdg4hF52CtRuNE7i/+NybwBh3bceKkrxRSbWlxKFtUvVhnlv/NFTE7qiKVg2qnsAdgVRy4XSTAMX7rS74oN490gnFgyBcglLNhqwKJ3VSj3EC0x1DMyMqxWO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fkl+OcwM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fkl+OcwM"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc97653887so47517995ad.1
        for <fuse-devel@lists.linux.dev>; Tue, 04 Aug 2026 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785835097; x=1786439897; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGZtXrUugdh2Qw+yVg+F+V/hXWeRO6AD+o+/wkdKhes=;
        b=Fkl+OcwMW+ol5vNpakYkDTrXBUVN+JbRFwiehahrKXjleQaPBC1zbg2JTndIoBdTIx
         po8jo+jPDbjAJr8xZMXomVS+XooGgLkzqn4+zwazU/yDKmC7+kNnwrLHrPpf3sukD+CK
         4BlI/ssg+xg5aq5A5NbGHJKacCg1JyglL49QYKSUw+AcJdpxd74Rd0j6DrOqDT8ztEr1
         rXe1icpbcGzIbAVVe97WNY24mX3jDmYbW4rOz+EVtx525OKOZtrdTyCtHZEap/0xcz1h
         oG04ikEmR16Vu4EFMkUpesc8fOdqCrA0md6AkdPTBNPpUFKmGLFlSUyRGSwGe9G9licm
         7UEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785835097; x=1786439897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGZtXrUugdh2Qw+yVg+F+V/hXWeRO6AD+o+/wkdKhes=;
        b=NhyZqW2vkkSFQUASF1/N9+tlMOQjFDgPehxpvw4gf9QBsGYtB/jXqs3sl44/VvaxXh
         inFzB7EQZau6EXPlWijZ/4cu4hG8vstgV1jMUdbve7hRR3FyrTBHNRItl4jFiYJtIKud
         HChXlUqVd5VcCc/Rvzf4giQo0aahwG+568E/+KYtLaJgwYoGS9qbmGCfa/JFTL/ufwhF
         AlttgIVQCkmJJkoDC3yG7KxiKn+t8zn1QzaTsCNK4nCKqAfU9CcFCObYC8EYbyyUkv/X
         IkGIOPzwfTXAMzNtojw4WdFnv+UocnvHYbtlFnVb6ah8DC5Y4TvQSvDizorHIGIty4eU
         ZI0A==
X-Forwarded-Encrypted: i=1; AHgh+RqOvNTiXquQYgwYcD9GQ6eRIELtot+GNtLV8WjwBiWSqlLqsPWpMEaiWicAYmUL0tmQadeSYUvXnq1u@lists.linux.dev
X-Gm-Message-State: AOJu0YzBcNv+YIX2gyKuxu6paS30GJbXWYOMn1PPkFqcvFKBoSn1NYzx
	Uga3PJHNFaW49Pelg+oMpsEN89CRFzYTp9kDJv5jCcEsxD/ZUH9tFXS/
X-Gm-Gg: AR+sD10Wrt0yt7bxpB9Ft6BhecanviIqChXjlnaLU520lBUAjqk2uGe85+aMOsLQv/G
	NG8/1aC+de3GQMwVlIyWFhe0/HlgD4ZGCkFlAkvqqkSFgV4+qWwYKWo69fYySY+E6JsUvSa3dUd
	tJsy514PUeig41fd+FS0Tu3BtLQvE66Bs5iPx5VWSrGI/S09pszl+HDmZP6ktmrDjF+O6YmwSWJ
	6p34XA+AnzmmwV3l5sqzx7LFChmT4gZFV+uZAQ6MarmowkUa2uw8Asx8L46v4EYuIRE8/Rdpq24
	gb2DwbfRhyEyWTmb03VXJXnLOEvrb9034eq79RZzqpIFD/+8LsI738HzdjEHA3uQpLWXMZp/VTZ
	UDljiGTMtlElTMxzf/WciKHzNOVSBVXJJDbp4/GiN541dmQx4aY5FPMYJ/ICEHJxnh30XuGj661
	X/raMlmos5Mzy+thVBk3Yf6aox0DB7T/ik3qoZp0NIwhICymBk8lHKth8P27xfRtc=
X-Received: by 2002:a17:902:d2c9:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2d0524b5269mr129321495ad.35.1785835097533;
        Tue, 04 Aug 2026 02:18:17 -0700 (PDT)
Received: from TENCENT64.site ([103.7.29.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f8fee7sm3681065ad.16.2026.08.04.02.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 02:18:17 -0700 (PDT)
From: Jun Yang <littleddfu@gmail.com>
X-Google-Original-From: Jun Yang <junvyyang@tencent.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	fuse-devel@lists.linux.dev
Cc: Zhao Chen <winters.zc@antgroup.com>,
	linux-kernel@vger.kernel.org,
	Jun Yang <junvyyang@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: [PATCH 0/2] fuse: fix request lifetime races in the resend path
Date: Tue,  4 Aug 2026 17:17:07 +0800
Message-ID: <20260804091757.503476-1-junvyyang@tencent.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for races introduced together with FUSE_NOTIFY_RESEND
(760eac73f9f6, v6.9), where fuse_chan_resend() moves in-flight requests
from fpq->processing back onto fiq->pending.

Both concern the same invariant. FR_PENDING means "queued on fiq->pending,
protected by fiq->lock", and it is what fuse_remove_pending_req() relies on
to unlink a request and drop the queue's reference. A request on
fiq->pending can therefore be released without going through
fuse_request_end(), so anything that sets FR_PENDING, or that leaves a
request linked elsewhere while FR_PENDING is set, has to be done under
fiq->lock.

Patch 1 sets FR_PENDING under fiq->lock. fuse_chan_resend() currently
publishes the bit while the requests are reachable only through a
stack-local list, so a concurrent waiter can unlink and release a request
that fuse_chan_resend() is still iterating over.

Patch 2 re-checks FR_SENT under fiq->lock in fuse_dev_queue_interrupt().
Its callers sample FR_SENT unlocked and fuse_chan_resend() clears it under
fiq->lock, so a request can end up queued on fiq->pending and linked on
fiq->interrupts at the same time.

Dependency between the two patches
==================================

They are independent and neither supersedes the other, so please apply them
together rather than picking one. Patch 2 does not affect the unlocked
FR_PENDING publish that patch 1 fixes. Patch 1 cannot catch an intr_entry
that is linked after its locked walk has already run, because that link
happens once fuse_chan_resend() has released fiq->lock. Patch 1 on its own
also makes the condition patch 2 fixes easier to hit, since requests that
would previously have been torn out of the resend list now survive to be
re-queued.

Both were found by code audit and confirmed on v7.2-rc6 (075b74841bd0),
where the series was built and tested; the resend and interrupt paths were
verified to still be exercised with the series applied.

A KASAN reproducer for this issue is available if requested.

Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Signed-off-by: Jun Yang <junvyyang@tencent.com>

Jun Yang (2):
  fuse: set FR_PENDING under fiq->lock in fuse_chan_resend()
  fuse: don't queue an interrupt for a request that is back on
    fiq->pending

 fs/fuse/dev.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

-- 
2.43.7

