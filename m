Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2E43CB557
	for <fuse-devel@lists.linux.dev>; Thu,  8 Oct 2026 19:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487276; cv=none; b=Gqvidqwmcsfo2fXuIogbfWfdTMqL6yYEMkAxi5NNT0TlEd85dl8kwjdlCesDd+k5E6UqeONm0BzlVNSb7YVcxkpCiDOz3qEOvqyg3soFktly9mBSeE9pF0Ay/ssRjkL5d/F6OCihoITTRXkgPIyyp9Ty9pV69RtET6LBeoBcVfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487276; c=relaxed/simple;
	bh=VxmSFzIxYys9Dm1293JQJmz3MIscVEUKeKEhzEOVOCg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W4XwUTXdoWzSNht1uzdLt+QRGR83ofB4NonkcPuvhRW44ULaeM8n89qVOk7pDnzsI6DXueZ8E8ncg3cyerly/YGUBchrZfgkYnA5i8V+SNSVYzRe4HWHUyOb5b+PR1vSe59KIf5LZzNNOkWCEXt9b9B2WQ5hcoUJ6TpiK72SQ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/lP+ZY2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/lP+ZY2"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e618db81c0so16412245ad.2
        for <fuse-devel@lists.linux.dev>; Thu, 08 Oct 2026 12:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791487274; x=1792092074; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qs5VklPvlwa8l6/efMoovQycx5WH3qUl2t0CUPqJwk0=;
        b=f/lP+ZY2NopmOF6pdRSgkTiakJYnAcoZwpVqtRTZ3DeAPY9cgtu4lLR11lbe96dTtk
         0nWhbatx5qZVNS+Eb29x6PQFAFZiY0Uq/cHu/VAsM4Zgzhx/a3fg1U4+wIpRhYEakNfv
         FYQWbhB4eataojjaiBM1B3iO148mpU+KGhd2pWn6j0Z+qSd2yCx/cDcDiJMsUXNg46qt
         R3s33q9MCFvVcdH8PdQqdNq6J84PKpy5GPI38ZChBfpzp8LafGyxI3SHilbcRDvWmqte
         6ZikAJjIOmE3SnB+yQXcxuDpjKeT8EdaYdgIL6PvlQXqXGbwSiDPI9tS/pHPDZ4Q7AjJ
         vcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487274; x=1792092074;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qs5VklPvlwa8l6/efMoovQycx5WH3qUl2t0CUPqJwk0=;
        b=Hi9701/nFpeJpENyHx8R70YRW9Vli8z+weVgAap/dtMWX13E8p1YSAeVg6bI82URKY
         mYk0L+lIynMVTPmzXfXJ2081n7stKN1Yyh719WvPX27iuXdhAsBS87e6iq3HlIVhPX05
         BqoUkQXHy7Ia3UF6S7+qDKTmFnY5H0saI2YE2Xdse6VLdRr+amZcYF8qq0wrarD2e++k
         uYTt8BzCXZtNCVlAP2ULHh/jGulgxESXWxr8XIwimXkA00xcl872fmU5kRIhvE9ITjeA
         nh0yp8JMG2CvtUoREUNJE2E4+BWvBo+xZSTQdwJPUb73tPBODRCwMKFgK0f2qBrjpgGf
         PjGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxp5GA4zZ7XbDc/fl4LciK992cuAjtRANtpyOPJDj3MHr46jjt/5IVbsvdzvJA77wPgEo/RnhprP0R2@lists.linux.dev
X-Gm-Message-State: AFq9FYJsz5h5ZDK+XETb0m23uUYKP9SJJ8s9zBR4ldAVj7SrTfzkrDb2
	b0WsCwzisQpxJHhMG5eIK33piMF7KVvqSVxkViWoUnmeqlBaeqEfUgUy
X-Gm-Gg: AYBFou2fs5s6H4tKvXpxKIOET5psmyzEn/7R/0ehj724VyYhL71A/j3B1atGP8L5Tmc
	XFPak/JUf0NOnYs1FiwLxjryp80GuNkZSHYIIBA4i9mul8+u2HssGfJ0yNJTZn86VscL51D4a0p
	oyVKD4tuZ15P5CieXgVm1FrPKy8/R1u6N35qpXEnYDq8CVtCQYqc2h0heX5CrmCIfvgF+aVFUf0
	3nOyM4zhKMFgtmti1PlxdeUM3mk5YsjWSvCqs6o4/zYhP32bS8RWbcBsI8/MqCJ7nHAs3nHF4C8
	+W5YUGuQsvlvejRLevoL1BFNDU3ps3DMfXJUpp3Yij+pFXObKkybo2Mqy22pns6+JwL+tPyJ/d2
	4jsofaFK/+NE4nyWr3gvCQELPyqp66pYIPb+QOLUbN/r3QLkyBo8noAs3/oay4fv76PjEycOOHM
	coKujW6OL46wWmq9gXhx3Fjcr5br0lYbhIHk5kpleJchk9Ol7rpq8rU7VdOFZQuxBR5f/6CLdPo
	BTpMw==
X-Received: by 2002:a17:902:ccd0:b0:2e2:dc50:16a8 with SMTP id d9443c01a7336-2e60024ae90mr58909075ad.27.1791487273549;
        Thu, 08 Oct 2026 12:21:13 -0700 (PDT)
Received: from [192.168.0.160] ([76.135.114.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e83cd9757fsm811965ad.63.2026.10.08.12.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:21:12 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: [PATCH v3 0/2] fuse: support per-inode open and release
 suppression
Date: Thu, 08 Oct 2026 12:20:22 -0700
Message-Id: <20261008-fuse-per-inode-no-open-v3-0-99cfd3dbc06b@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPbsx2oC/4XNTQ6CMBCG4auQrh1Thr/iynsYFy1MoYm0pNVGQ
 7i7hRUb4/L9knlmYYG8ocAu2cI8RROMsymKU8a6UdqBwPSpGXKsc84b0K9AMJMHY11PYB24mSz
 0JSdUpVRKSJaOZ0/avHf4dk89mvB0/rP/ifm2/iVjDhwUVYitJtHq6jpM0jzOnZvYRkY8MuIng
 4kp2q7mmtqmQXFk1nX9Alhu4TADAQAA
To: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: Robert Byrnes <byrnes@wildpumpkin.net>, fuse-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Stanislav Kinsburskii <skinsburskii@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791487272; l=3691;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=VxmSFzIxYys9Dm1293JQJmz3MIscVEUKeKEhzEOVOCg=;
 b=EbP2lDWkXPuvZpwXtmt2f67xqW1dt9F0VQ83jCAVS74HnVJzG7UBssuhzkMXYMpIKtqbanjqQ
 QrteFM1lkHeDE+/Fqq84AfTFvPOs5J5M/bjo3UPxmNDN9gBuctZStd0
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

For FUSE filesystems serving immutable data, warm-cache workloads can
still spend much of their time sending OPEN/OPENDIR and RELEASE/RELEASEDIR
requests. Data, attributes, lookups and directory entries may already be
cached, but opening each object still requires a userspace round trip.

The existing connection-wide no-open support cannot distinguish these
objects from control files that need the server's open and release
callbacks.

This series adds negotiated per-inode suppression. A server negotiates
FUSE_PER_INODE_NO_OPEN during INIT and marks eligible inodes with
FUSE_ATTR_NO_OPEN in their attribute replies. The kernel then handles
opens locally for those inodes, using a zero file handle and the existing
no-open cache defaults. Subsequent requests identify the object by nodeid.

Release suppression follows how each handle was opened, so changing the
inode's hint does not create an unmatched release or lose the release of
a server-opened handle. Atomic O_TRUNC still sends OPEN to the server,
and CREATE retains its existing open and release lifecycle.

The second patch adds a raw /dev/fuse selftest without requiring libfuse
support for the new protocol flags. It covers capability negotiation,
files and directories, LOOKUP and READDIRPLUS attributes, hint changes
through GETATTR, hint preservation across STATX, atomic truncation and
CREATE. The cases also run with writeback caching enabled.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
Changes in v3:
 
- Fix the title underline in the FUSE documentation.

- Make selftest cleanup idempotent and clarify harness teardown and assertion behavior.

- Skip STATX-specific tests on kernels without FUSE_STATX support.

- Return the mount owner’s UID/GID in attribute and STATX replies so mount-capable non-root users can run the tests.

- Link to v2: https://lore.kernel.org/r/20261008-fuse-per-inode-no-open-v2-0-39c60fe97728@gmail.com

Changes in v2:

- Preserve RELEASE after successful remote flock operations, including when
  OPEN was suppressed, to retain server-side lock cleanup.

- Document the flock exception and the requirement to accept RELEASE with
  a zero file handle and no preceding OPEN.

- Synchronize test-server requests before unmount to avoid racing with
  asynchronous RELEASE replies.

- Extend selftest coverage to 68 tests, including flock cleanup after
  SIGKILL, duplicated descriptors, hint updates, CREATE reopen, ioctl
  handles, and connection-wide ENOSYS precedence.

- Link to v1: https://lore.kernel.org/r/20261007-fuse-per-inode-no-open-v1-0-be5229fe89f5@gmail.com

---
Stanislav Kinsburskii (2):
      fuse: add negotiated per-inode open and release suppression
      selftests: fuse: test per-inode open suppression

 Documentation/filesystems/fuse/fuse-no-open.rst    |  49 ++
 Documentation/filesystems/fuse/index.rst           |   1 +
 fs/fuse/file.c                                     |  26 +-
 fs/fuse/fuse_i.h                                   |  17 +-
 fs/fuse/inode.c                                    |   9 +
 fs/fuse/ioctl.c                                    |   3 +-
 include/uapi/linux/fuse.h                          |  13 +-
 .../testing/selftests/filesystems/fuse/.gitignore  |   1 +
 tools/testing/selftests/filesystems/fuse/Makefile  |   2 +
 .../selftests/filesystems/fuse/no_open_test.c      | 886 +++++++++++++++++++++
 10 files changed, 999 insertions(+), 8 deletions(-)
---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20261007-fuse-per-inode-no-open-d40e2b4abb8a

Best regards,
-- 
Stanislav Kinsburskii <skinsburskii@gmail.com>

