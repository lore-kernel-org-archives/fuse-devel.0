Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C43D435535
	for <fuse-devel@lists.linux.dev>; Thu,  8 Oct 2026 11:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458414; cv=none; b=m/Ue0JOvYtBLZQzmpmkv+1x+mksrZVCz0AwCVU0e9jtN64sN3C5S1UNSIQjR2Mznf01anzKNm2z9v9h7Fzaa+fDd6WI/vppD8EyDSn33k+xfi1gLOU/zYAMibdWaTj/UAjZwoxQvTM/lRrSwCORpWlN0vKKmziyTDCh9GD6/K/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458414; c=relaxed/simple;
	bh=eKqk5TpASnodNyqjN7Xpdbgw/li/RvFAwZ7jMFr5HYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=A8RzffYfsYuRk+Vy/8sSKGpwCFtmqw2zkPZtGG97+0OXUgcnk0j4/Jc2xfUz/eh5tW6TZ5RbZl8orDOWapZbWhkOvP5Jyiwqx5sbS9YORWyh2+mznTtKSUWeuuzEnWY4h0JjVU6lWfHmIxlUYIx0Aj9yda2AwA++Mnx0INN/iyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQ5bTMQD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQ5bTMQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791458410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o5M+l3eYF5+1BrspbqKZlSFj3dX2QU6FqGOUNjFSg00=;
	b=eQ5bTMQDkbDQk6hEFdpiDUaT1pOrXGA6t1Er/lHmHRGF8zFlrcSSqIqt3td0PQBvUF1k1W
	g91U54KRT7LhqjOPA8h8cdrFKTN3pZ5Mgf9tuFJ7S4zvw0Jn1kwfLzCyfKuhIbrH4vYciK
	ylPgoNoTYS6OnrO0p9YL3OiF4DLpX+k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-MOUchZE5PgGNgPNl-88hcw-1; Thu, 8 Oct 2026 11:20:09 +0000
X-MC-Unique: MOUchZE5PgGNgPNl-88hcw-1
X-Mimecast-MFC-AGG-ID: MOUchZE5PgGNgPNl-88hcw_1791458408
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c2dd399f761so559803966b.3
        for <fuse-devel@lists.linux.dev>; Thu, 08 Oct 2026 04:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458408; x=1792063208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5M+l3eYF5+1BrspbqKZlSFj3dX2QU6FqGOUNjFSg00=;
        b=BTODc0AfYtn0UDE9IaQjdlzl/K79HXFB5zYP3os6AHNYpo4tWW7Hez2QyIzbHaA+by
         qjxFNdqzeMYJDofkkfnxqTYAJVChPZDIdUtyZY/9tdVivXQaS/CRpYxYjSLTwDoTax7u
         gcM2wa8khaSp3/XaECxMCOgme1KZxuivKm2vuSvNdQGCp8ShyzQUVvmFSjUCJ8g4WRx0
         Mu9KcqLkiaWV6SPLVGHd1u0yQHYgxBzAYa0n+wMX55MXH5yPzCjJYiC2R5lKaPxl4fWt
         f+jWTg4igzCixc1i0l6/fbRXNPD3uTE0JGq83VS8oGmRRt5IqDHsBl0Qac6yFrfzo2d3
         n3tA==
X-Gm-Message-State: AFuF++kslN7NQ5wxJ/WNQOUrMGrTvtbiRg4ODsRDoVa0U8VXuToYvV1D
	4E4L8Y6acecAWChBv/FUJqLx62KTBdL5bZ3mgKZ/nuPhPeSZdZ91WNaoKZGISXlioUTbOblB1wA
	Bw3F4fLHlh6IpISYtHKqTRt2Zty+pgiWc6lnadlFCP2wuFQxnnAdCIqOaMN6Z2ePw3mUghQLoXk
	OEPGh6R3I5nUvw7nyPQwkZB6CECsv0QJ1ZIS5bNjg862peSw0=
X-Gm-Gg: AYBFou05Za7puEFIESyg9mOZMeCN2K1mju4FqEv07cBdChDVbtfq4e425xWRZYtbZ7e
	Unt6W+Rei3n1ZRCgtbdk9007upYt4zSZfKbjKMGUDSniLyVWL970MeHROIREitbFDx2z8OK9uim
	H9vTKhxRk3PQbTEIn7C7yDYsYBQFZFy9fvqE2K5tWQYt5qXhDlDw47th74e1G+PNRHBYPRyjVyP
	K71PA4U0dEhPSycHSh5nT/WxezBkhNcrJWYolq7sSWIq3x4EYktuKJKJo7HKY7oKK0IgmocD5gC
	+HsWj0Ic3dvRy5Y+mCF4loqogGqpxdc+bWBRwap07RRNDddK/HlA7qqlpeGGfh7vMVAeiWiozVQ
	tfDUJwcrpcpCjqhg4y+g/fFMUo3T3aeUDWN73Xr6gnWxaQIqPvpaQkEff
X-Received: by 2002:a17:906:c14c:b0:c2a:8d00:f8d0 with SMTP id a640c23a62f3a-c317bb373a6mr550083766b.4.1791458407918;
        Thu, 08 Oct 2026 04:20:07 -0700 (PDT)
X-Received: by 2002:a17:906:c14c:b0:c2a:8d00:f8d0 with SMTP id a640c23a62f3a-c317bb373a6mr550080066b.4.1791458407407;
        Thu, 08 Oct 2026 04:20:07 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (188-142-152-55.pool.digikabel.hu. [188.142.152.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c2fae53sm204251866b.49.2026.10.08.04.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:20:06 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org
Subject: [PATCH v4 0/9] fuse: DAX device based extent maps (famfs)
Date: Thu,  8 Oct 2026 13:19:51 +0200
Message-ID: <20261008112004.1899560-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ATdiA-NutsqigNrnoEhi34Dd9eZ443OXl5UmOA9rj2o_1791458408
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This is the FUSIfication of the famfs-fuse patchset.

 - extent maps are assigned to a backing ID

 - 64 bit backing ID's managed by server

 - maps can be linear or cyclic (striped)

 - API supports nesting, but not implemented yet (i.e. multiple striped
   extents per inode, a-la famfs)

libfuse/famfs trees for testing:

 https://github.com/szmi/libfuse.git#extent-map-v3
 https://github.com/szmi/famfs.git#extent-map-v3

This patchset:

 git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#extent-map-v4

Passes famfs smoke test on emulated dax device.

Comments are welcome.

Thanks,
Miklos

---
Changes since v3:

 - redid the first patch (prompted by sashiko: passing dev_t is racy)
 - more fixes (John, Amir Sashiko)

Changes since v2:

 - add a trivial prep patch modifying drivers/dax/super.c
 - reserve zero value for 64 bit backing ID (Amir)
 - add Originally-by: tag to acknowledge John's work 
 - more fixes and cleanups (Amir, Sashiko)

Changes since v1:

 - moved 3 prep patches to fuse.git#for-next
 - introduce FUSE_PASSTHROUGH_V2 (Amir)
 - lots of small fixes and cleanups (Amir, Sashiko)

---
John Groves (1):
  dax: add fsdev_dax_from_file()

Miklos Szeredi (8):
  dax: use READ_ONCE() in dax_holder()
  fuse: add helpers for EIO return value with kernel message
  fuse: support 64 bit, server allocated backing ID
  fuse: support opening 64 bit backing ID
  fuse: add support for opening dax device as backing
  fuse: add extent map data structure
  fuse: add extent map I/O support
  fuse: add support for striped backing

 drivers/dax/fsdev.c       |  24 +++
 drivers/dax/super.c       |   5 +-
 fs/file.c                 |   1 +
 fs/fuse/Makefile          |   2 +-
 fs/fuse/backing.c         | 303 +++++++++++++++++++++++++++++-------
 fs/fuse/dev.c             |  54 +++++--
 fs/fuse/dev.h             |   3 +
 fs/fuse/dir.c             |   3 +-
 fs/fuse/ext_map.c         | 319 ++++++++++++++++++++++++++++++++++++++
 fs/fuse/file.c            |  25 ++-
 fs/fuse/fuse_i.h          |  75 +++++++--
 fs/fuse/inode.c           |  25 ++-
 fs/fuse/iomode.c          | 116 ++++++++------
 fs/fuse/notify.c          |  75 +++++++++
 fs/fuse/passthrough.c     |  63 ++++----
 include/linux/dax.h       |   3 +-
 include/uapi/linux/fuse.h |  53 ++++++-
 17 files changed, 971 insertions(+), 178 deletions(-)
 create mode 100644 fs/fuse/ext_map.c

-- 
2.54.0

