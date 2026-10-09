Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F9247C107
	for <fuse-devel@lists.linux.dev>; Fri,  9 Oct 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532536; cv=none; b=u1X2STkB8muIv1BG9s9zvPSgrja/goiMdnhMSnfirZmuJNCTcYnS2diNx6zLEYrq/+ohZ3MexHlD23gmsvvdVh4fZyenqHxt2daNX778RAM0dWmM3DRSg5nejWvoc1dbmn4i4FTXx2gUSx6RPJsTfKQO3xVhxZi+mP8w18zdiZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532536; c=relaxed/simple;
	bh=PGnXbkWnqgiSvUPXvLuvw04ujDR77ppnXsgjwMpNud0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L0TekX7eIg1m9q0uUh4YYQz5onBXWc2wKAeFhAy3dmLft21GNdo63ZKnIyDSVKUkut5RcsP09TykLuGnG2tSfMMZWtOyfolY6bWt5yK3QI1UFNnwn9l2ly6pUoia/uGZdPVJOtIFW8uY98/sHk4sWjCBtWsYvgoEI8qOEK9O4gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=RIonWdgz; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="RIonWdgz"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791532527; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=FlL+KZiK40wut8JLPaAVO6fRQ3vm2gUy0mBBVHvZQDc=;
	b=RIonWdgzNnGUTAUOaPey1pD6G9B9zBKy33lXQwoVRds2JWM3KALQuqsXhhuL7sF3AxTizETm0mn3CcIR+PslzVcGlNcBGdjIdfbPVA9alNW6+vf2dO93In0iX7qd6NiS+PlA6vos34keXhdzwrGB6JSoZjPmZbs4C5I6Tuv8YLE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R711e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0XCSmIly_1791532457;
Received: from x31h02109.sqa.na131.tbsite.net(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0XCSmIly_1791532457 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 15:55:26 +0800
From: Baokun Li <libaokun@linux.alibaba.com>
To: fuse-devel@lists.linux.dev
Cc: bernd@bsbernd.com,
	miklos@szeredi.hu
Subject: [PATCH 0/2] libfuse: add support for FUSE_NOTIFY_RESEND
Date: Fri,  9 Oct 2026 15:54:14 +0800
Message-ID: <20261009075417.2521879-1-libaokun@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

The FUSE kernel driver supports re-queuing requests that were already
sent to a daemon but never answered, e.g. to recover in-flight requests
after a daemon takeover.  The kernel side was added in Linux 6.9,
protocol 7.40 (FUSE_NOTIFY_RESEND / FUSE_HAS_RESEND), but libfuse has
no way to use it yet.

Patch 1 adds fuse_lowlevel_notify_resend() to send the notification,
exposes kernel support through the new FUSE_CAP_HAS_RESEND capability
and adds fuse_req_is_resend() so that file systems can detect resent
requests via the FUSE_UNIQUE_RESEND bit in the request ID and handle
them idempotently.

Patch 2 adds a self-contained regression test: the daemon drops the
first GETATTR of a file, triggers a resend and expects the request to
come back with FUSE_UNIQUE_RESEND set before answering it.

Testing
=======

The new test passes on Linux 7.3-rc3 (protocol 7.46).  It skips on
kernels without FUSE_HAS_RESEND support and over the io-uring
transport, which recovers requests on its own.

Comments and questions are, as always, welcome.

Thanks,
Baokun

Baokun Li (2):
  fuse_lowlevel: add support for FUSE_NOTIFY_RESEND
  test: exercise FUSE_NOTIFY_RESEND

 ChangeLog.rst                      |   7 +
 doc/README.notifications           |   2 +-
 include/fuse_common.h              |  13 ++
 include/fuse_lowlevel.h            |  28 ++++
 lib/fuse_cap_names_i.h             |   1 +
 lib/fuse_lowlevel.c                |  23 +++
 lib/fuse_versionscript             |   2 +
 test/cases/ctests/notify-resend.sh |  18 +++
 test/meson.build                   |   3 +
 test/test_notify_resend.c          | 216 +++++++++++++++++++++++++++++
 10 files changed, 312 insertions(+), 1 deletion(-)
 create mode 100755 test/cases/ctests/notify-resend.sh
 create mode 100644 test/test_notify_resend.c


base-commit: cb2e761c763559f40e41090aabf008f665f27889
-- 
2.43.7

