Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6754A204F
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 06:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057430; cv=none; b=rvfb9ur0Al5BeAdmMfhlhnpTVhOG9T/0mg9jYE/oLNDBUtJPtfmv8XVRnTVbNO6l3fJ3dDTApcINZzCBJtDWfADHDBpSP7NUSYqqCqjZQz6bJy4tgrgI7EwQkzl16BG3uU2brg1B2pVn3NtyF+vDyfe8T3mO4nUcLT+mMT7IlYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057430; c=relaxed/simple;
	bh=rQRqWRVqzReq4tw4qd4U0+PYRiHLJUgZ8L7av/J6Yvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=qs0DrANaPBbsz6Qs/Pv8nwsMgnGbbJZt/kjZZBPHKglMiynmkOUECVOfM4/IAxGvTlzZpeRsiaLxRtMUeGj+Y1eMVP6TDsY5dRdv7Jt81PAv0vfRWeMZCb9t3pElFjbyXIarfHOPzIXds8R6Nh1rWulN4ST6Uugdbrob/jlUsxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DTsSnIwE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DTsSnIwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790057426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Sqqqr0++Is0YbjZ0mSjor3AEOREDnH3S2hx2nC56sZA=;
	b=DTsSnIwE9DhSLNGEJzfHKJC6fQLtfrWuazyKdiK2UQ+dSZj6UuXWrifThIfSH41mCESVTJ
	YvKHuUeoXv0Qgk0LIaoj9b4byUrIYeyDfQJyJBlZ135BPdoaR8vP+QLRDudJQH3BFmmJni
	4nhTxRNPpAO6fAHBGSKPHA5+YnLbvlQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-vY_iEL7bMTeqt6MRAW8E8g-1; Tue, 22 Sep 2026 02:10:24 -0400
X-MC-Unique: vY_iEL7bMTeqt6MRAW8E8g-1
X-Mimecast-MFC-AGG-ID: vY_iEL7bMTeqt6MRAW8E8g_1790057423
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6aa5d0921fcso4372939a12.3
        for <fuse-devel@lists.linux.dev>; Mon, 21 Sep 2026 23:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057423; x=1790662223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sqqqr0++Is0YbjZ0mSjor3AEOREDnH3S2hx2nC56sZA=;
        b=KCDzx+B9RVX/G//GCYPliTBxitT1/gX312G7bpT7H29jpxA/6vTvUXQuaL2g8QaxoZ
         56JKg5Wkju9OfJ7Vt3uVrEhuoLcesLhaVj0itUe5McQFCTdHus0zEta+W/WPsKOThy+q
         TAylioKySZUpBv5L8JDszC6MxcnwnUSEYtFB2lPPGtpwCp3PTN5KzMKn6sSBdYCu1VcS
         XqK1oI6mKp9IT3EvokMxBehGaugg9+SGjhnYNSzPIG6QRfXaYou6EQckdoEBJMm1FMYa
         XeXBuSdpnpozFujEDvlLhVFNxtNVcBXdfY18Pif+v74SueCwNKqof4gXZeGkXvfrvmSh
         JlBA==
X-Gm-Message-State: AFuF++nwIqdEF2onnchyMPCdNpKwLjUMt86G3/eBPwfr4TIBnWj9r2Bt
	aiowCGXUJUoIo/+p/taygWq70kKDthNYBMkb2d4EM2cRjDkjfTTurDNmBaklFpzPZmVxtOggB/u
	geVRV30+FnrSNs5Y8YLc3+bbzti8prPqidgkAyC/+wd7fIaz1tRa3MvvLbOrggGbqpEDvqXJc4O
	JOht20D83Taf2UeE6sJVMuu8RVRyQjmzawkaQHzWUgbj+INbk=
X-Gm-Gg: AYBFou1gYNimZTgSiBglZF0qbFJLWwxpBhWQT/wn/aSyGJ24A2nJkRC9zdeXUFTwOh4
	pf8PUByMa/U29zg+Zs1mMSYpUePk7u0pDGiCow1uVBv/wpNh8K5/FJN9n519PRo9H9ROp4QQOir
	F648wIXcDVO3ss2fEUepCaPvHHhxnMVsIyCdrF+b2+4v5hMW4aQNhPzAHSU8uSGFM0wy5ivyUSt
	KyvuYfXMnACOcgP+g2ltShC7XoyIFiPpPqAgTXmp/KZPa704t9uH7jLuVMMliDNVeVyr/buNEcZ
	m8BCxvpCKy3DoU3qgLbg3pWgtm3lGMfQWXNnmwS6UFbUlF8UFtlFAVxFAPcgAFanyApyKOoJs+e
	zaXyoEKxxLRi0dSVlv9zmzppK9Q/Sv18lyaWJ1NGR72YlH1YzghOD
X-Received: by 2002:a05:6402:4018:b0:6a9:9cab:ff16 with SMTP id 4fb4d7f45d1cf-6aa54ca6052mr10924034a12.0.1790057422917;
        Mon, 21 Sep 2026 23:10:22 -0700 (PDT)
X-Received: by 2002:a05:6402:4018:b0:6a9:9cab:ff16 with SMTP id 4fb4d7f45d1cf-6aa54ca6052mr10924012a12.0.1790057422481;
        Mon, 21 Sep 2026 23:10:22 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (85-66-37-111.pool.digikabel.hu. [85.66.37.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440df9asm449826a12.4.2026.09.21.23.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:10:21 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>
Subject: [PATCH 00/11] fuse: DAX device based extent maps (famfs)
Date: Tue, 22 Sep 2026 08:10:00 +0200
Message-ID: <20260922061019.3320196-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EmGZNUL1fBQqYHscVAnUfIFny_O8eJ-67hChQfXvP4E_1790057423
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

 https://github.com/szmi/libfuse.git#extent-map
 https://github.com/szmi/famfs.git#extent-map

Passes famfs smoke test on emulated dax device.

Comments are welcome.

Thanks,
Miklos

---
John Groves (1):
  dax: replace exported dax_dev_get() with non-allocating dax_dev_find()

Miklos Szeredi (10):
  fuse: use "vdax" naming for virtiofs DAX
  fuse: don't assume ff->passthrough is set for FOPEN_PASSTHROUGH
  fuse: make fuse_backing_get() static
  fuse: add helpers for EIO return value with kernel message
  fuse: support 64 bit, server allocated backing ID
  fuse: support opening 64 bit backing ID
  fuse: add support for opening dax device as backing
  fuse: add extent map data structure
  fuse: add extent map I/O support
  fuse: add support for striped backing

 drivers/dax/super.c       |  38 ++++-
 fs/fuse/Makefile          |   2 +-
 fs/fuse/backing.c         | 270 +++++++++++++++++++++++++----------
 fs/fuse/dax.c             | 214 ++++++++++++++--------------
 fs/fuse/dev.c             |   2 +-
 fs/fuse/dev.h             |   2 +-
 fs/fuse/dir.c             |   7 +-
 fs/fuse/ext_map.c         | 288 ++++++++++++++++++++++++++++++++++++++
 fs/fuse/file.c            |  56 ++++----
 fs/fuse/fuse_i.h          | 145 +++++++++++--------
 fs/fuse/inode.c           |  47 ++++---
 fs/fuse/iomode.c          |  41 +++---
 fs/fuse/notify.c          |  64 +++++++++
 fs/fuse/passthrough.c     |  70 ++++++---
 fs/fuse/virtio_fs.c       |  18 +--
 include/linux/dax.h       |   6 +-
 include/uapi/linux/fuse.h |  56 +++++++-
 17 files changed, 984 insertions(+), 342 deletions(-)
 create mode 100644 fs/fuse/ext_map.c

-- 
2.54.0

