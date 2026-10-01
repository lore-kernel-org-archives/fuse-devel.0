Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F3E51C056
	for <fuse-devel@lists.linux.dev>; Thu,  1 Oct 2026 15:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867393; cv=none; b=nlCCVooFdRPEKja6hFBWsU+E84PrYDK1yhj2YlLl4DJS7YhG12pyx3GLkZm+4MZRQJm2i0hNIRk6Yzy3qooi0XWlmoPoPHvMbScSMttHMS8/zAuH0aCD+F6N+sVjZBh+4Y8/TDA1QETTbLyJQwbcashc7ZTkyBH8gI+xllBedhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867393; c=relaxed/simple;
	bh=9t1aAWmP4b4YG8k12sDVjav4RYFhEJqBqzzCt8PuK3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=KJ3U4F6uBJtlvP+cabC/sHfNMSTzZml6IIdWwmzXHnSkVYRUcrYjH9xX8SCUp0jX1pC6+l+FeqdYiyWwAmZXUHw+lt6+0JeyeGLU7EeIbeMx325WEKUfVpBG98aJH+pCyrtmKUVaOdjL+DMoHpWLxdhMt+GntEX+JgASoxr9a2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tr/cVn/J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tr/cVn/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790867390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qqtf/4r/JNjXdQHR8/rYcGVT30iqL+vSIact1bVLvZY=;
	b=Tr/cVn/JmgS9FFVe6o400nYXKuDnTxUk50f6qfQstBtDP8lI49+SnnCrkGfIrkUUDJeq2v
	ZNK8qS+ZB6rm5LBeNhDnVBdqFwMc0CXNhVZFuf0I0Aqte+BRZgni/mRPy3/BIIESN2EWQA
	bjTZSD/U3CFemzv/v4V2QkO5FGzm3EM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-pyHuC80pN8m0r2yz5OINqw-1; Thu, 01 Oct 2026 11:09:40 -0400
X-MC-Unique: pyHuC80pN8m0r2yz5OINqw-1
X-Mimecast-MFC-AGG-ID: pyHuC80pN8m0r2yz5OINqw_1790867379
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c293a65b577so592818966b.2
        for <fuse-devel@lists.linux.dev>; Thu, 01 Oct 2026 08:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867379; x=1791472179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqtf/4r/JNjXdQHR8/rYcGVT30iqL+vSIact1bVLvZY=;
        b=LC78KI6UrtNpmyqhy8FK8y8hrJhibj3DRlcivvA31UJEkuIVNnXAPbBbU0ZC5IlR+e
         I5dHDgglDga9ZtLMtQ/8KqEjvShxnxgyQM8SKf1ZXjXo9yqgYvFf2YBSDI9TO273ldda
         qEK0KSMtWjRMdNaZ0CuaS+Gtafjoh6SPL46PJu65dsxeEVbK34JvbtkzAxUZIbGMwZRh
         g9me740jSDlPZa8eJDGUlkdf+Sr6LRcTX1k6o78qWBx9yKgfX5RpYshhwoaNXt263D7t
         tgu25i4KFp3MNVBn//HD+GZNwdJgzRTnp4qqSVtSyEv9YizBI6jJfCIHOXbyHSzuwJhS
         hHNg==
X-Gm-Message-State: AFuF++mmtR/146BSWoipu19Xmvf6iW43iNnOHfS0/jopi/fc9u8LFlNU
	1F7GUk3KSgiC4a+6Qcqk6iJpwvh3CI4Y6qTTyBKxQ8cFU2OKnCkdImS+DDgGX+4xIKro72dwFI3
	kvgR2VXWmSrls8x073negC81upQykDlTLUDQOQFvBXYsAzy6S/Aa+KFuEOGJxKtLfw8v/+lQkI7
	uKw/1GpIeNT9PNLJrbtkrz3fo//Ze1Gg5gmVZm9v6OljB6WnI=
X-Gm-Gg: AYBFou3FSq3mtrXaCI5yVOWQZ6zDO2+1jOpT3uHID6is1tAmpcwkfp14Sn6/RRgfXnP
	ogThwRQaESFe5es5DM+9FS9728oZVdu9y/CClJf40EAtLM+GQlOR29Bp/uD1hRjDvJxPQx9/pU7
	2VS9LJsvB+o3h5wTYucshMbHMXv03g6lhIwNc3b8B01Te0PmBldreiXFcaZ6OCgbYkaDmOcp4nb
	L9auAcpL75PaAUNbt+mbAIxDq8iAXIi/NR+BQAnil6rU507mXkGTIYzwM9BHOy3mwOMR7II4z6b
	8yE/2IAH11WrAzf1GgJM7WsJ9n0ihS/13jX+YQQO1YYLZW2ctJbE97h0DyV/g3jzGFKBVEPrr+p
	w/LHICV/rrd2vLrY0EwB2O59WD1KR8wNnvAioQORAXp0ywqjFQ3KctyQk8v0=
X-Received: by 2002:a17:907:3e1a:b0:c25:2d27:5652 with SMTP id a640c23a62f3a-c2e23cae407mr400305066b.11.1790867379371;
        Thu, 01 Oct 2026 08:09:39 -0700 (PDT)
X-Received: by 2002:a17:907:3e1a:b0:c25:2d27:5652 with SMTP id a640c23a62f3a-c2e23cae407mr400302066b.11.1790867378822;
        Thu, 01 Oct 2026 08:09:38 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (193-226-245-188.pool.digikabel.hu. [193.226.245.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d86372sm177735166b.56.2026.10.01.08.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:09:36 -0700 (PDT)
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
Subject: [PATCH v2 0/8] fuse: DAX device based extent maps (famfs)
Date: Thu,  1 Oct 2026 17:07:18 +0200
Message-ID: <20261001150935.655979-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LIkO5ZnfRX3E7VqU95tBnX7JP_ApyXj-yQ8s0xq4J9Q_1790867379
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

 https://github.com/szmi/libfuse.git#extent-map-v2
 https://github.com/szmi/famfs.git#extent-map-v2

This patchset:

 git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#extent-map-v2

Passes famfs smoke test on emulated dax device.

Comments are welcome.

Thanks,
Miklos

---
Changes since v1:

 - moved 3 prep patches to fuse.git#for-next
 - introduce FUSE_PASSTHROUGH_V2 (Amir)
 - lots of small fixes and cleanups (Amir, Sashiko)

---
John Groves (1):
  dax: replace exported dax_dev_get() with non-allocating dax_dev_find()

Miklos Szeredi (7):
  fuse: add helpers for EIO return value with kernel message
  fuse: support 64 bit, server allocated backing ID
  fuse: support opening 64 bit backing ID
  fuse: add support for opening dax device as backing
  fuse: add extent map data structure
  fuse: add extent map I/O support
  fuse: add support for striped backing

 drivers/dax/super.c       |  38 ++++-
 fs/fuse/Makefile          |   2 +-
 fs/fuse/backing.c         | 292 ++++++++++++++++++++++++++++++-------
 fs/fuse/dev.c             |  21 +++
 fs/fuse/dev.h             |   3 +
 fs/fuse/dir.c             |   3 +-
 fs/fuse/ext_map.c         | 299 ++++++++++++++++++++++++++++++++++++++
 fs/fuse/file.c            |  16 +-
 fs/fuse/fuse_i.h          |  72 +++++++--
 fs/fuse/inode.c           |  17 ++-
 fs/fuse/iomode.c          | 108 +++++++-------
 fs/fuse/notify.c          |  75 ++++++++++
 fs/fuse/passthrough.c     |  63 ++++----
 include/linux/dax.h       |   6 +-
 include/uapi/linux/fuse.h |  53 ++++++-
 15 files changed, 904 insertions(+), 164 deletions(-)
 create mode 100644 fs/fuse/ext_map.c

-- 
2.54.0

