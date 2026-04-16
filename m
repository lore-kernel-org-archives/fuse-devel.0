Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6D03914F7
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 09:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331027; cv=none; b=PqD3+713hNfI+fCcazjomCFGqIaXg0Gsjvvh4SGO0II2TLulUVfrNKhxRPUjCxAtgTiuoLqxh5u9bYF9LyNdjDQ7lUoXT8OoJvpyw9XCLvSavEW3xinSsMBD1HT+f97yEyrnyxYga9CgmLI0SsN+HWibYBC9BKFrggDCfsFq6jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331027; c=relaxed/simple;
	bh=5lOOeS93Ex1//iVA+tkjACjRddJgY2SXMx3Driki+fI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:content-type; b=njZxD+J7tJu5mOOn8A8wcoGmhcSxsIcoOZ1EGYycK3A/y1HtXB3NDn7TjrPjSL9msaXe9h+2PBCMHiSR+B+RvMP5bE4InyYsR8D5vXZmQInwXEF5850EtkmGrpKq42Hmq484Qs8DKxcPRCL06OWEYiwEv+Kvc9Pu001/SO98TV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RxY7Vdi2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RxY7Vdi2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776331024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WkJltErQxX9gIhMzzhVZFKWgEdEnTbltAdkoFS13j7U=;
	b=RxY7Vdi2hWuxsNnLocCiRmqjvRTgKBt3QLhX07wyAJbe+S8l05ZTKYZ+oJXU/E5mQXYhy4
	ylct1qXb8AQTyp7E7N1q0zMyEmGqQ5eRdb2hi2mMRP53I1Q3SN6UVG2txmaGhtbb8LFPmS
	twXGFiHV53rj7Y+bnPouUkAJ9z0l0vs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-RKmzU0_PNBSlpsLm3qXKsA-1; Thu, 16 Apr 2026 05:17:03 -0400
X-MC-Unique: RKmzU0_PNBSlpsLm3qXKsA-1
X-Mimecast-MFC-AGG-ID: RKmzU0_PNBSlpsLm3qXKsA_1776331022
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-488c0120047so48977435e9.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 02:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331022; x=1776935822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkJltErQxX9gIhMzzhVZFKWgEdEnTbltAdkoFS13j7U=;
        b=TxHnc/0xYo0X3fvPfxJlVeq0vMZLCsK/gGPDohmeZl/V+1GKl6QYr+TqOGAJ8AabyE
         XJIxymbLHbUcGh0Mtjvlr5+3frMD8+4k5i5DMtQ9xs4GBSbvrlMhgxXg/nB8cx11imO6
         D6gKq2Vxb9lxE3R/lcdy+thamc6V0iEKZWSmmDNT+HXz4+v5tD/ZKfso6F6GBDRRFfNe
         TJCBeFhJ79orfVoJyUdXZbp4gWlnO2E4M5XtpH6Q0eyMWn8srOmpiZQs7W5P4zBohqfM
         D12E0k66m8PQ2PZSCT6XvJzkuSBouO3oJT3XJ/4vGhcCU9vRckQTgb9wEguAwlLPOTvp
         C3vA==
X-Gm-Message-State: AOJu0YymQKCLAREmHXlTuWPg879QBVK6TLyPEAd+KJkr8QtSaJmad7Kt
	HacKDND/n5/bfNznUOnfI7v5j5WyIhlprspydRpd6YAixmrl+PAEVJFlL6tS1UA/iUGfcY61eKw
	nwvMxmwRTkquDqMyDpVRfuzQTzY6Oof9kF+uGwSZ0eO8L+8rcIW8nEFlrrYmSvvgpV4y2iSK7qh
	m9JJSZMsqQz3LGVLujIbG7r1nS9NMRO44sY+BEkWxD7KYOgFw=
X-Gm-Gg: AeBDietMpZoZwrkUrSvQhAtaenI7hiEtaMplGY3KCz3DTOf7vud42kIOr0DUj3i+1y0
	uYgjmApjvPz6KIP0Tu1aJJXtezNvwiGLNHG/4OMcup4ZsdPRZIr8DZN81xzbonW9CZ3X40UL4Of
	i9EtgkB4DEoUQn7bvxW0MhUdyQ5DKQCglEqMcedj24ijYnZfriTbWel3qyah/xEfEoY2/cYimpM
	kE0+38yVtuUmIMScsAVMbPY5fLLFkFWcZTWZ7MwNUNh0ORT+puyv5x9L2hB/S5ZyO5SFn73T7dz
	f80kf7xZvK/gVDlRTvzK/Xgp3nMCSpKl3qHUCJ0n+nlZDhbDUE+0K/iyXW7aMsFVJNgSjrZsGx/
	hwFuZiJlZGDu4FdBfTbj9CmrY7jfzDFtImHDsxA4bKmdrWhD7utFZlhNn9szMP+UBXEfic/hEqB
	Vpb/cXiQ==
X-Received: by 2002:a05:600c:630d:b0:488:79a3:f04c with SMTP id 5b1f17b1804b1-488d687cfd0mr344058985e9.27.1776331021474;
        Thu, 16 Apr 2026 02:17:01 -0700 (PDT)
X-Received: by 2002:a05:600c:630d:b0:488:79a3:f04c with SMTP id 5b1f17b1804b1-488d687cfd0mr344058355e9.27.1776331020797;
        Thu, 16 Apr 2026 02:17:00 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-19.pool.digikabel.hu. [85.66.37.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57d80d3sm38597975e9.0.2026.04.16.02.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:17:00 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 00/32] fuse: improve transport and fs layer separation
Date: Thu, 16 Apr 2026 11:16:24 +0200
Message-ID: <20260416091658.462783-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VKqqGpqhIHZW3eCgRTIcDuZH2Os1w8wBuwace0SCQbE_1776331022
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This series is based on fuse-update-7.1 in
git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#for-next

The transport layer encompasses:

 - request queuing
 - request timeout
 - data marshaling
 - device I/O

The filesystem layer handles the rest:

 - VFS <-> fuse API translation
 - caching
 - notifications

There are misc functionalities, like tracing and control filesystem, that
don't belong to either layer.  Also cuse.c and virtio_fs.c still have both
transport layer and fs layer parts.

To aid separation, the fields used by the transport layer are split out
from struct fuse_conn and added to a new fuse_chan structure.

Transport layer internal headers:

 - fuse_dev_i.h
 - dev_uring_i.h

Filesystem layer internal header:

 - fuse_i.h

Headers describing the API between the layers:

 - dev.h
 - args.h

Next up: impelement a stripped-down local-only fusex (experimental/
extended) client that can be the base of further work without risking
stability of the main one.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>

---
Miklos Szeredi (32):
  fuse: move request timeout code to a new source file
  fuse: add struct fuse_chan
  fuse: move fuse_iqueue to fuse_chan
  fuse: move fuse_dev and fuse_pqueue to dev.c
  fuse: move 'devices' member from fuse_conn to fuse_chan
  fuse: move background queuing related members to fuse_chan
  fuse: move request blocking related members to fuse_chan
  fuse: move io_uring related members to fuse_chan
  fuse: move interrupt related members to fuse_chan
  fuse: split off fch->lock from fc->lock
  fuse: add back pointer from fuse_chan to fuse_conn
  fuse: move request timeout to fuse_chan
  fuse: move struct fuse_req and related to fuse_dev_i.h
  fuse: don't access transport layer structs directly from the fs layer
  fuse: move forget related struct and helpers
  fuse: move fuse_dev_waitq to dev.c
  fuse: remove #include "fuse_i.h" from "dev_uring_i.h"
  fuse: remove #include "fuse_i.h" from "req_timeout.c"
  fuse: abort related layering cleanup
  fuse: split off fuse_args and related definitions into a separate
    header
  fuse: remove fm arg of args->end callback
  fuse: change req->fm to req->chan
  fuse: split out filesystem part of request sending
  fuse: change fud->fc to fud->chan
  fuse: create poll.c
  fuse: create notify.c
  fuse: set params in fuse_chan_set_initialized()
  fuse: remove fuse_mutex protection from fuse_dev_ioctl_sync_init()
  fuse: change ring->fc to ring->chan
  fuse: remove #include "fuse_i.h" from dev.c and dev_uring.c
  fuse: alloc pqueue before installing fch in fuse_dev
  fuse: simplify fuse_dev_ioctl_clone()

 fs/fuse/Makefile      |    3 +-
 fs/fuse/args.h        |   65 +++
 fs/fuse/backing.c     |    1 +
 fs/fuse/control.c     |   16 +-
 fs/fuse/cuse.c        |   28 +-
 fs/fuse/dev.c         | 1239 +++++++++++++++--------------------------
 fs/fuse/dev.h         |  110 ++++
 fs/fuse/dev_uring.c   |  139 +++--
 fs/fuse/dev_uring_i.h |   37 +-
 fs/fuse/dir.c         |    9 +-
 fs/fuse/file.c        |  146 +----
 fs/fuse/fuse_dev_i.h  |  342 +++++++++++-
 fs/fuse/fuse_i.h      |  412 +-------------
 fs/fuse/fuse_trace.h  |    4 +-
 fs/fuse/inode.c       |  255 ++-------
 fs/fuse/notify.c      |  434 +++++++++++++++
 fs/fuse/poll.c        |  141 +++++
 fs/fuse/req.c         |   99 ++++
 fs/fuse/req_timeout.c |  148 +++++
 fs/fuse/sysctl.c      |    1 +
 fs/fuse/sysctl.h      |    9 +
 fs/fuse/virtio_fs.c   |   21 +-
 22 files changed, 1995 insertions(+), 1664 deletions(-)
 create mode 100644 fs/fuse/args.h
 create mode 100644 fs/fuse/dev.h
 create mode 100644 fs/fuse/notify.c
 create mode 100644 fs/fuse/poll.c
 create mode 100644 fs/fuse/req.c
 create mode 100644 fs/fuse/req_timeout.c
 create mode 100644 fs/fuse/sysctl.h

-- 
2.53.0

