Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3BC4B5CD2
	for <fuse-devel@lists.linux.dev>; Thu,  8 Oct 2026 18:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791482845; cv=none; b=OW7lNkZ4Rhzjf8E4FTzIWfJrGDqS81D4UYzo2za5jSjmyAYILrhrR6NwgFyptsk3TxOJUhGxLKj979UV6ynKLcgRDwiP5dwNwHWkltQmkyaQNgF6RzcUB0YCzcv6HhRdb50TvN+uoDHCaFpUKvacPXaWVmCUJVHIAWsgoZzUhvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791482845; c=relaxed/simple;
	bh=VRTrMnRCtIFbD2EyB6N5w6LrzMeEzaYWJ1e5rAtXRnk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lkcROFEV4Uor67P2xlb8swjQ2Ysfu5vcV0xIvkE9+M7aG0nbg5i6G8DVU/azJsJHWmyxYfDSVTgH+IZeLanYyQLpHosPciL1Rz48jxnh/ehM8E1vtNJViHndhqSgWkLz0G1tRWKYn5pWM+MMBo41m2RxO+35wl3c+lP0YNYnjng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mACFr505; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mACFr505"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so1563845a12.3
        for <fuse-devel@lists.linux.dev>; Thu, 08 Oct 2026 11:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791482843; x=1792087643; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vx1hsDBsieq23jav84qc39RHrlNeTK4K/qIOXf26Ahg=;
        b=mACFr505E6aYvS1ndNZAwbWlpXoGQVaH8BAYVEiEdKLUUOjyW/fZxI3tQr9um0j37i
         yWCmvGWqXjDZ0GOZsBT3PNmoc8jXjQExsCKOrcQAZv5gMMWbdE6RHXx+UUXRVN+TWA4G
         UXNTuHtkhKTcUtsNAtZjuOO6vFRYjXOgmrm3ueEtMkFhdwW/CoyEsTHUZ8D2Daw5Cc2M
         kKcmLVDEITG94BQ7yAibuxbAndiA/vteecmUWgtlbRtXkEQ1rvjczacwMp3hVKiExa1Z
         gUzG1Gj208j4JteeuBs+vQlfJ4MDPSzsIGW6XZ7Vy3slsA78rY5XPPb4j7kvwqLuqlA4
         aTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791482843; x=1792087643;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vx1hsDBsieq23jav84qc39RHrlNeTK4K/qIOXf26Ahg=;
        b=BEBZC5YKjM34ykC2D3YnH7t4j5BLWMYPuuoDgSqWVq1huIZpAB9etBLk+8bE3cMpa/
         Hnuc8VnMtHwz1o5CkfS24TkwmDvto4OlXbNZHGSNiZ6awpXFYNIWF2nvBHH6IylQousr
         3H1z+BixI/FDATEW9LoGpLabTcQTKYR3Ls7GcKmVWZsLkK2vsnSjItpDd+gjLnl0y3YL
         azgrJQ82qlMR2mhEDOfa0Ikj2ADToyewKRvTalOt0N3PRk3NZL9bqsE0hWb02Csze1PQ
         I4y/25P2LCtxdixllB5FjWfzSR7bU/x0+ouBcIXKrmsDW+Vv+icMxiT28EbLk1V7zc8Y
         /YJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxX9tc314djvNFZP2XPG+oQQUArcqb4Xae8itrXViqWURb6bgvdNcHVvxA3aW0F6tbLW03UBLs7Mq9o@lists.linux.dev
X-Gm-Message-State: AFq9FYKBJuwP3CUYBDzX02P36tJc8Bjm18MJZXaeh6sED2L+d87Lh/SB
	AtSlQEkTXV8owCIdHM297gSb0er2yYqcN3xL4+AXgtYKJVgl9nA/sNJF
X-Gm-Gg: AYBFou20ADQ6GoIFZr1+H3JlHA+VhC+sq7CSmyijEqw1yq6LSiH8b0WFn86kJNzeqsw
	lBOAGmvcYAokYx16/DyTNBEgs3Bs4G2qKwMtMj7h2gl9ZsvGyZuT+NFIH2R432aimGrzh13cZck
	EENlfLQt9F3CaOiSSQIBQ1t+Dh5zOZdOwCG/tEK55wV2WKyJQBcU++mcMx5qhb241/h24OBq0CP
	zwu0EGjddN8e9htMs1juVVv+doN7dLQ/7xJVKvyDl+M5jjaUXDZj3UEB6R4UAAe+ulzh5OdyUf7
	bHSQPFfBHg69nGuB8jSrNBO27DXXMuck7hiOpOEGvXsKXur2DyRN+8QJazvOANYK2fpSo3Nj2mU
	47DxD9hPm23LH0zplctEt3rwrs1QHifbKKJksVqoTGkdErQk1r0ob5rKbB2dS3oAAoHNHKucOHy
	8e1j9aVvJ+2ks04w59cQWR+VTrRLBZ4zKoqqGY5rVXx1pMf+MZT+u1TOKvGygoRsjMT1Fa/A91t
	LoymuYl/IxI3Xej
X-Received: by 2002:a17:90b:2243:b0:39e:6c69:34da with SMTP id 98e67ed59e1d1-3a8a1cea2c5mr5582516a91.62.1791482842628;
        Thu, 08 Oct 2026 11:07:22 -0700 (PDT)
Received: from [192.168.0.160] ([76.135.114.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab31fccd1dsm268530a91.2.2026.10.08.11.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:07:21 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: [PATCH v2 0/2] fuse: support per-inode open and release
 suppression
Date: Thu, 08 Oct 2026 11:06:43 -0700
Message-Id: <20261008-fuse-per-inode-no-open-v2-0-39c60fe97728@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALPbx2oC/4WNQQ6CMBBFr0Jm7ZjSgIIr7mFYtHQKk0jbtEo0p
 He3cgGX7yX//R0SRaYEt2qHSBsn9q6APFUwLcrNhGwKgxTyUgtxRftKhIEisvOG0Hn0gRyaRpD
 UjdK6U1DGIZLl9xG+j4UXTk8fP8fPVv/s3+RWo0BNrZS9pa637TCvih/nya8w5py/lZaIQ7wAA
 AA=
To: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: Robert Byrnes <byrnes@wildpumpkin.net>, fuse-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Stanislav Kinsburskii <skinsburskii@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791482840; l=3230;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=VRTrMnRCtIFbD2EyB6N5w6LrzMeEzaYWJ1e5rAtXRnk=;
 b=4xlDZOqYR1DmUGgZwSQ7y/+HVBLKUTM/oO7OPIm1JRzOuAmiQzYTKCrh2oAARzLuSEoBW4sN4
 NuVzaOuGKGYBhcyA57F1mp4GqOnJ+RqxRAR03KPNMfZE4W2vhMcuESB
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
 .../selftests/filesystems/fuse/no_open_test.c      | 859 +++++++++++++++++++++
 10 files changed, 972 insertions(+), 8 deletions(-)
---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20261007-fuse-per-inode-no-open-d40e2b4abb8a

Best regards,
-- 
Stanislav Kinsburskii <skinsburskii@gmail.com>

