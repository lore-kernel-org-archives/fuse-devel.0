Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E09E45BE3
	for <fuse-devel@lists.linux.dev>; Tue,  6 Oct 2026 18:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791309687; cv=none; b=onlsLEtEuG2gUeLjBBxYOpituUPg7z3C/zV5LrkJNpL/KBA2m4voQ26AEy+reQ90uV+tE/v/S/IANHE4hAIuJrnf1nCmpFHWoIdWCnW6qExLbrT43We6BOJ9lJhjMH8nYADPPNn8vBYWkDp+7D+AGpFwOH08tS1aoZ/jPbVKSIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791309687; c=relaxed/simple;
	bh=khjQoA76ImVEwNZsVeK3BoShKiZnAqrp47XzOo+pGQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=dmJtCmO2YV3InQPmril5hwVQq4gKDUuuFe38wWeCRWuzx+O848rlXDxxQkBGknUOmTGw6oZXpSyBknfHU1NrgMTDz+W8oWXVpB+dOOtlWt37a97BJvSLCRPwbZdrvBEd04vboKKbgnJeWxAdNo4K6NMvHk1cK8Uk0kZy7l2Msb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jRvRsNY/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jRvRsNY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791309685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7MTZcSt4JfCHhin1MairClvPsblFEaazbyiSbWW2Ywg=;
	b=jRvRsNY/pVLexsu/q4dU8qPyyaq7JS1PcAl1gb2ijWefaKNn4OWaIsLNLgonIB563TdAmN
	2VCjnhFubFfdMKDkN/oqeaCqCWHxFf7MSwy5Pt8sE7g1TiAKyf7Bu542rBRGYMplKKOFSf
	95nCoY1fvDiN6lZET/ND4dNmDV9Pogo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-J8uvRmf1P-q8pAVlrvSBdw-1; Tue, 06 Oct 2026 14:01:21 -0400
X-MC-Unique: J8uvRmf1P-q8pAVlrvSBdw-1
X-Mimecast-MFC-AGG-ID: J8uvRmf1P-q8pAVlrvSBdw_1791309681
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6ab0162426fso3604003a12.3
        for <fuse-devel@lists.linux.dev>; Tue, 06 Oct 2026 11:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791309680; x=1791914480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MTZcSt4JfCHhin1MairClvPsblFEaazbyiSbWW2Ywg=;
        b=PXKfNCXPeB1Ggc9keMxucnxCrR1Os9Vnz53MnlnPp/Yb0uMnJuYjGxUcivl6WLqLo2
         AB92/UWt+q0cqIQe1EwyeqPvYES73SUCTQVF6lHB8FGLRk/9AGZPJHkO9N31WgE65T/8
         YKvdhA1QX4uNlxwRJe96UcThEv4UgGR2E0dMXEU75VmI58OGMg9K+mJEEN85Iel4j8K7
         8QTJhB/GzN20wdvfHl+2dGgVXzV3Ih/0r5tC0uUzLpTsHqeRRZ8G4bOC4RYR/smyDhNn
         kN45DviH+HnzrseICvMvqbTZ8LhfWq9J3V102Gm9XbP3hJ+KDV1Xy1rGzr6stto9+0Pg
         tlpA==
X-Gm-Message-State: AFq9FYIerIJFcfsrtM5DkKBFkwPBFncFpn79EY+iH3+oRaNe9YQKC/Dm
	583nrfZjpQ1VNg8k8hWYEAStI/+psLJGmrP7XTsV7Lo7VHFTUWm0Ezd3XIMDr9BsQUHAz9uz17L
	IWphzS6xaN7HWbbIZxmeF3hFy+sgeGFmhnOKrTjtziScvzlBicO3p6RKbJktkIww0UJCMRUH1Ta
	uwRiYowlHa+vOiKu+Rr5XI77KTGWAIGid+pP1nCsgJhixwGcE=
X-Gm-Gg: AYBFou2zihGPkKfIXAnzyYoYcZ4pE17whgJeq0zPd+KPAvUssmmwFE5C0r5yU08ANdI
	RvYlyzyugyR1NfOWO6NrI9n7HX9V+yE6ASSWHHU4o17oDKeAS764UBXKZovVulEYL7GzJnm8SIG
	TCgI/+IsoZn+pcNrjonceE0SSgT897pqCtmOi5xE5NcqQggf4fdulQcF1Q6J2ipfo8RGUXwRHTi
	CRF5Xy8IfZYG8DTvzk/u+3X9b9e2FT73OZHyWXTxj/5YJQcWxc0Y9TMHS1y7Z1FRyAciloDmZTf
	5JXkIFP7wn0WJR/42nt8G0oicfFglVLLUEkTcPchmyJrt7h3GyviLeSnm1RywlwFYpMqn1PAWoo
	j4384FVyC2whtjz7oxXO/5vhGI8ukMWmYRr2r5xTjbo58xRz+56sWaVMU
X-Received: by 2002:a05:6402:13ce:b0:6aa:f7f4:24b3 with SMTP id 4fb4d7f45d1cf-6afe29de45cmr2370966a12.35.1791309680586;
        Tue, 06 Oct 2026 11:01:20 -0700 (PDT)
X-Received: by 2002:a05:6402:13ce:b0:6aa:f7f4:24b3 with SMTP id 4fb4d7f45d1cf-6afe29de45cmr2370926a12.35.1791309680029;
        Tue, 06 Oct 2026 11:01:20 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (188-142-152-55.pool.digikabel.hu. [188.142.152.55])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e5942sm5056684a12.9.2026.10.06.11.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:01:17 -0700 (PDT)
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
Subject: [PATCH v3 0/9] fuse: DAX device based extent maps (famfs)
Date: Tue,  6 Oct 2026 20:01:05 +0200
Message-ID: <20261006180115.1425232-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aWi6LDXIH7gL7RlTYIMWy0SUdopuEayeTUT1srEvtQg_1791309681
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

 git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#extent-map-v3

Passes famfs smoke test on emulated dax device.

Comments are welcome.

Thanks,
Miklos

---
Changes since v2:

 - add a trivial prep patch modifying drivers/dax/super.c
 - reserve zero value for 64 bit backing ID (Amir)
 - add Originally-by: tag to acknowledge John's work 
 - more fixes and cleanups (Amir, Sashiko)

Changes since v1:

 - moved 3 prep patches to fuse.git#for-next
 - introduce FUSE_PASSTHROUGH_V2 (Amir)
 - lots of small fixes and cleanups (Amir, Sashiko)


John Groves (1):
  dax: replace exported dax_dev_get() with non-allocating dax_dev_find()

Miklos Szeredi (8):
  dax: use READ_ONCE() in dax_holder()
  fuse: add helpers for EIO return value with kernel message
  fuse: support 64 bit, server allocated backing ID
  fuse: support opening 64 bit backing ID
  fuse: add support for opening dax device as backing
  fuse: add extent map data structure
  fuse: add extent map I/O support
  fuse: add support for striped backing

 drivers/dax/super.c       |  40 ++++-
 fs/fuse/Makefile          |   2 +-
 fs/fuse/backing.c         | 305 +++++++++++++++++++++++++++++-------
 fs/fuse/dev.c             |  24 +++
 fs/fuse/dev.h             |   3 +
 fs/fuse/dir.c             |   3 +-
 fs/fuse/ext_map.c         | 316 ++++++++++++++++++++++++++++++++++++++
 fs/fuse/file.c            |  18 ++-
 fs/fuse/fuse_i.h          |  78 ++++++++--
 fs/fuse/inode.c           |  26 +++-
 fs/fuse/iomode.c          | 116 ++++++++------
 fs/fuse/notify.c          |  75 +++++++++
 fs/fuse/passthrough.c     |  63 ++++----
 include/linux/dax.h       |   6 +-
 include/uapi/linux/fuse.h |  53 ++++++-
 15 files changed, 965 insertions(+), 163 deletions(-)
 create mode 100644 fs/fuse/ext_map.c

-- 
2.54.0

