Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA55A3E7630
	for <fuse-devel@lists.linux.dev>; Wed,  7 Oct 2026 23:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791414894; cv=none; b=XKGT5gLW/hKdrMT0iHfUUNrfZv3BBCVezTjuAC7IEyMxZjo/ckZlDijL1w5ii1SCTeJ20uTVd9ZsN3CE2jLbdjVaCJL7/J83MyZCuloygINVbna6SaM4ur8rUGBIt01FdMJ2GZ5iVePAWOKj0rtVRCM6fHMyIzQWxnlMpCPhcbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791414894; c=relaxed/simple;
	bh=5114g4GwAMLsvBYWWh4v6Uv/o65R2Ivnng+bjyX/hb0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XomFF7ZMCLwK0f1/jRGdaWltuAiKCgmmxo0sKD4J2Y+YJ1F/yiAhyooaZJG+GIXRwfYQcPOdhIoIrzAn9JwWMFq0cqVAHROBPR5NESoLroK7fsJzHYhf0H8f3ZMAlKKe8OLSurszRh6Rbv0D5ut28mMna24n9t8KI5+kO7pqCE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mK5TBGz2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mK5TBGz2"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db18e5cb56so20153755ad.0
        for <fuse-devel@lists.linux.dev>; Wed, 07 Oct 2026 16:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791414892; x=1792019692; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3X41AIkS/dsp/EHn6K3Ci0TU6cqt5IO83pSbJ3jRHLw=;
        b=mK5TBGz2Y3lfnxuPI+6tD9n12ZXbeQ/xcfQIIDzGlIsz0r/7nNs3e7A3BvRr4nQn3P
         ct5c8B31MxgkRa4tJZXGvkykSVY4oW71HKp/Ce1k0Fjy+jGnrVRA3qknkR8dnB4BxM+2
         a4jTiXkACkqcy81zzdI1u59gvyD++VHfrQcMbICjeViLX04euzHWGGZTX7qKROTx65oa
         ez01B0FEk93Al5Oh9xqbY983lKD8F3cGwYD1T0r4p1424RcuIlk71/tZ93fx7awqvXN4
         zOU0CSuWPLlnkHLELILVU4Rc3hbaeXVRuZhldljjfRov77bmca3cwdBJK0K5gPPIr6lB
         O7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791414892; x=1792019692;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3X41AIkS/dsp/EHn6K3Ci0TU6cqt5IO83pSbJ3jRHLw=;
        b=JlHJLUFYFmVWoivbNxBsjBoGsh3kVpZ6DOQd+3eYLqhBGVMR4PFGhPi7oo0+O3p2F2
         PabaGhQhAsZexk3icIeCTmpztScnUGzwhz30sef3hu/C4k2KFlpWsSQ+9pqICXfTNgFx
         g74GQuEU6KpAdrLiH4Gw5RZyipnZAgO2TW23jJ4m8cvAfeAyMj5vd8H/NPdoKKLwBOYj
         t5TmUDkIniItIkn2vz032Px+niD8tPLPhnIdGIBIpZc2mnIOENcJy/DjRmkxTCMGRLAg
         IR3oaI89Q+GLZlhLyRhP4z6bOfW4V50bWRjlagbu2vpFuNEk23k5v8GVlGI8JLkh4TZZ
         5B+g==
X-Forwarded-Encrypted: i=1; AKwUvBx4CF5TSQCk5TcC+Jc48Wdp8oK+PAyk+DIEMhMLmaE8MzwM1K8FTJvrSqVzeJad6kiROTA6J468cmyx@lists.linux.dev
X-Gm-Message-State: AFq9FYKz5kLMr3eSzyNnnuWPPIP4zVi2qZi8i7Ky2VhHgkZxqYoMpI3i
	AEEH/ZGEYsHBAElKXkNQsKsCYzLV4CXbRFJZFRbPzpFjfw74Bw5rj4m0
X-Gm-Gg: AYBFou0dtfwPd7Xzjt1bHNgjFPMWlqd7CyGLVBdH0xl05zoDqzpasjSabPyI7x/s8gE
	Zr+8XSwSadLB2hCIJGnjDrQGrWrjvmbVDMJfyns6ohliCtnhRLA0DU8Pjiex1OsG/0yIswDZ4TJ
	hRwyTmJzHnPiHApO59vgvUIapxfDbhmCRCtJ6JOILh+vEKGx5e03C29Eq6nhk5LBQugNHIHofk1
	cwRhJ7KIgbnKRPyaOEg9dVOl2M1yy8WjbKVc5a3ZlbtuNw5kgOSZz8BV6KZtWdnPALF9GkZ6Lnw
	sVDRqfp6pjqczPIcCkj+8XczGp1xovIy/+Dra/cKJN4EyNolBXQLZxopORjF/uHZhkDHeUxZX4o
	fUSKcrN7Vbmf0KB3t7PvnQPVpFFyWVp/2n3AcRw21Sn21uFqUTt8yaQ0bhRO5/ZIjd0rpaSYkyN
	rvmUWsE7Fy5JCLKzoUByT+94aiEpX/y65EQZtCggJiFx0cFDJ9h+tvA0GVCvPrb/waOgzuCVXmV
	d+NmSZTmEMwFAMcCA==
X-Received: by 2002:a17:90b:3ec9:b0:3a2:b4bb:91ca with SMTP id 98e67ed59e1d1-3a8a072a99cmr3054120a91.1.1791414892110;
        Wed, 07 Oct 2026 16:14:52 -0700 (PDT)
Received: from [192.168.0.160] ([76.135.114.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ff13esm1356270a91.7.2026.10.07.16.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 16:14:51 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: [PATCH 0/2] fuse: support per-inode open and release suppression
Date: Wed, 07 Oct 2026 16:14:33 -0700
Message-Id: <20261007-fuse-per-inode-no-open-v1-0-be5229fe89f5@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFnSxmoC/x3MMQqFMBBF0a3I1A7EICpu5WORmKdOMwkJXwRx7
 wbLU9x7U0EWFJqbmzJOKRK1omsbWg+nO1hCNVljh86Ykbd/ASdkFo0BrJFjgnLoDazvnfeToxq
 njE2ub/xbnucFOvqUbmgAAAA=
To: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: Robert Byrnes <byrnes@wildpumpkin.net>, fuse-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Stanislav Kinsburskii <skinsburskii@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791414890; l=2541;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=5114g4GwAMLsvBYWWh4v6Uv/o65R2Ivnng+bjyX/hb0=;
 b=n05G5uQcf4QRi9Y5MPe2UuJul9ToeFOPrxf6HhNrLuiiBDsT85iYVRHQq4oZwrzVkgMGPWViP
 KcIj0Mvlx9mAv88eV+oqCwhzN/z4xKkgIo6zas3O5Llrp7e6TX8+vRc
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
Stanislav Kinsburskii (2):
      fuse: add negotiated per-inode open and release suppression
      selftests: fuse: test per-inode open suppression

 Documentation/filesystems/fuse/fuse-no-open.rst    |  39 ++
 Documentation/filesystems/fuse/index.rst           |   1 +
 fs/fuse/file.c                                     |  26 +-
 fs/fuse/fuse_i.h                                   |  17 +-
 fs/fuse/inode.c                                    |   9 +
 fs/fuse/ioctl.c                                    |   3 +-
 include/uapi/linux/fuse.h                          |  11 +-
 .../testing/selftests/filesystems/fuse/.gitignore  |   1 +
 tools/testing/selftests/filesystems/fuse/Makefile  |   2 +
 .../selftests/filesystems/fuse/no_open_test.c      | 511 +++++++++++++++++++++
 10 files changed, 612 insertions(+), 8 deletions(-)
---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20261007-fuse-per-inode-no-open-d40e2b4abb8a

Best regards,
-- 
Stanislav Kinsburskii <skinsburskii@gmail.com>

