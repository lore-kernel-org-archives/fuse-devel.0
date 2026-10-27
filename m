Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793138313;
	b=rsfromfUxhPFf76HqQzQRfODp1/SGmEEca9AAS+ZYwqL9xjFx310NBSrUHBLIlgPA34O
	 vwBzJwZiP/NHHSLswyHhOAh0LKEnj/PdmNsKNDA7UH1ibQX/Ny4SKWdwrtj+fiNcm1Rkg
	 NFrsz3CIpYyOOdfIkLWzXbjX1ozKGe1mI68lOLhx/ch7eWMzvDBzcsD6GBhnC2VRm1j4B
	 0vch9WdRtmjeaCdfXnbqvsvDBtwbzSq5LEJ0ldaVH53WKELTC7GvOYyOBjc6E13/RIa4N
	 KX9daminVFHeSGi29W0Faom/Ra2B/FnRdGU6h0jUu6iXtPzQxJicVR7vylBsCGGn9iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793138313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fKH8lEROlToWUaFVk6HBGi+a3bbRsRUnkhgJ3/v+Ess=;
	b=ix2JLpeT6fvwOYbCWB8kOnvpgKUkR4bjK1rnOsbXPQfQo7vqOLZXFwYc7C5/893Kj6m5
	 C3+2PTvD0z8aX7QfU0stRzYTXj/xK8US0CMmYmbHLzVNEW+WLd/3FaK7AJJw/dkEv5rxc
	 I9CkVTmqeRhPex8fG4tWdkuvb+rkmuInp+4oka7xKAmQN90EN8eLtTfulWjRHhc9i5EFV
	 1YHzI3H0dLNTafaOEDnIKx35negRm0tIwbDwH9KlmDqJ63XH7yIBWb8qUiOvKsVkOfM7h
	 X+w3poYHrvi4FT+BYMn0PXKkEF2CVUKq56s+TC6jdhCYHGn8kvKqyCtxR57gKCwPUYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hX587oqS;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7985606A31E
	for <fuse-devel@lists.linux.dev>; Tue, 27 Oct 2026 21:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7985606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hX587oqS
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ac525c1f05so3337347b3.1
        for <fuse-devel@lists.linux.dev>; Tue, 27 Oct 2026 14:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793138312; x=1793743112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKH8lEROlToWUaFVk6HBGi+a3bbRsRUnkhgJ3/v+Ess=;
        b=hX587oqSTLqSUZjfCI7vmna6D//cpLJiOHDjqa6uaOPVe8Yv8lNtq6l9SsiWKo9SBm
         ZM9OFFbXs6Am1vjDvTXXS1Yy1HcOCdIBh4RCAPyT0e6hFxt0qXhISs4oWLaXW362K9cS
         MbsQRc3EYxM+6e7o//oSfiENgh2H6o8/9c0Wi3FVqgE/hiaPAtGLVQoJz7vtyrdWuf4W
         Iayv8XYww3imQIOLba7vw5wRkD0CQz6dV+hH6wGHYZ0t0+bjrrme6XDX3S5RrLCjaRMM
         t9V+4zudSjYzPrqTCLl4XyD1S7UiyuLy/chFCio1JAXCpDKXlOM7riWxLHMFma4wMcfb
         fmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793138312; x=1793743112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKH8lEROlToWUaFVk6HBGi+a3bbRsRUnkhgJ3/v+Ess=;
        b=vt74Evf/xIKE5gao0cLnUsZwdQLFsB0qDzzNV/7P1W4jGQSPkG81bgLyXeAXk+pz0+
         Yqum7DHdBsE3YfOhP7a9R/2YcBwLtfcx6biiSdhgiTO7/loLoqwtfgJ8lofQ18Vd9YKl
         qAkUBg6oiR9VdCpuhEyFImY7HJVYlxJLu5BmucSb1dAOY4I+JT8OhZf8dOpumao8I55D
         elAqJ10/kchbIJBlVKH205G+9Zd7UDUlKVncw66Greer/WWCfZbPCXyPysFnY64Zj9PF
         /c+Io/C7y2U+zdVMOln1zft4BRfkxYp8F9E/e/OccXva/C/Y2JDf4w9lZCibuzmrwYGy
         C2mg==
X-Forwarded-Encrypted: i=1; AKwUvBxpWIkDRxUrVs9d+/d/NRmGSVwkr1U0pExQTOOdnAbwvRcUCly6XQBfaR7jMUvtL/Hxz6wZCxjTlyhl@lists.linux.dev
X-Gm-Message-State: AFq9FYItWiSnNiieOVMHvqy/4OL2oEX4VUAHHOWGxbUDeyh9+RpfQ8Cm
	9EcejfdVC+1xacuSSV5ku9t2ClbZIRiYQdwO1XWozU2G84+lRYCBu5oP
X-Gm-Gg: AYBFou2KlHZc7WE+BdXfnbOcrb2dM00b3QXMMmQwRhq7iR3o2BpFOXfTS5Kppdp1cC3
	ZXuJ9VsWKVGEpHx7Tq8kfUmDFoDqKEgH/oUqNxuwrAp3gCsN49oXMy5JXuUsrWFjuIFPK3g5VRi
	JHOXbIaMpxiU5vwbOhBEjmN0bB7FMA8JwDcRz9RYc8g/uxS3FCZQpbDmg5QbekFB9GTUetSaIY8
	s/pnMG4iIaE8IDgEk/wnx+7SO3np5EWXR/JNH1csN2mLu9wJXCAr1abcTmusQ6hHGq8AxijBN8Z
	L1CQaT0WXPD+xjhnjTBSojt4q/7wzvqbT9ByFN2Wkd2YDIqIo8ARslEJ/QCu2wMNSz8B9xPoZ12
	SqlN73DxwLlfl44qJw0+gE5vvwjG9vzOrgN5/jfFouGvTOZElT4aZBbDoPI7NqQ7pv1gILp6Slh
	Yd1W9ocr6K78ptcGP42tAtcTbhSko6FlgS+blnjWbIabYMPLyVkI1Yl5QMVOIvL+aUvsMq/yOCW
	D6gt8yCAcjt4OqPAMLcQ0O/PwHLDf23/THSB9A/MFg8BzJXPEb/IOY7bhGygIdBOfE7/zWPp0Wu
	W6guf3eKesZ5eGl4fcVnvzjm4qMJQYni
X-Received: by 2002:a05:690c:7108:b0:8b0:7c36:4afc with SMTP id 00721157ae682-8b1b5e81826mr2719877b3.58.1793138311531;
        Tue, 27 Oct 2026 14:58:31 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:71::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e59400csm19360677b3.22.2026.10.27.14.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:58:30 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	"Darrick J . Wong" <djwong@kernel.org>,
	changfengnan@bytedance.com,
	kbusch@kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	David Sterba <dsterba@suse.com>,
	Gao Xiang <xiang@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Carlos Maiolino <cem@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	libaokun@linux.alibaba.com,
	bfoster@redhat.com,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	linux-nilfs@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH 0/5] iomap: remaining patches for iomap_iter_next conversion
Date: Tue, 27 Oct 2026 14:53:21 -0700
Message-ID: <20261027215326.2693300-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christian,

This is a resend of the last 3 patches from the "iomap: convert to in-iter
iomap_next() model" patch series [1].

Those 3 patches are rebased on top of current mainline (commit 83f32c773255
("Merge tag 'erofs-for-7.4-rc1-2' ...")) in Linus's tree. They require two new
preparatory patches (patches 1 and 2 in this series), which are trivial
->iomap_next() conversions of the nilfs2 and fuse iomap code that was added
during this merge window. There were conflicts with "iomap: pass
iomap_iter_next_fn directly instead of struct iomap_ops" (patch 4 in this
series) during the rebase. These are resolved in the patch, which now also
converts the iomap users added this merge window (ext4 iomap buffered I/O,
exfat swap activation, nilfs2, and fuse ext_map). Jan's Acked-by and
Christoph's Reviewed-by on it predate these changes.

These patches are being sent out now in case anyone wants to look at the
preparatory patches or patch 4. This series applies cleanly to both current
mainline and next-20261027. If anything conflicts by the time you pick it up
at the end of the merge window, I'll rebase and resend.

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/20260729192737.3190206-1-joannelkoong@gmail.com/

Joanne Koong (5):
  nilfs2: convert iomap ops to ->iomap_next()
  fuse: convert ext_map iomap ops to ->iomap_next()
  iomap: remove ->iomap_begin()/->iomap_end() legacy path
  iomap: pass iomap_iter_next_fn directly instead of struct iomap_ops
  Documentation: iomap: update docs to reflect iomap_iter_next model

 Documentation/filesystems/iomap/design.rst    | 140 +++++++++++++-----
 .../filesystems/iomap/operations.rst          |  68 ++++-----
 Documentation/filesystems/iomap/porting.rst   |  16 +-
 block/fops.c                                  |  10 +-
 fs/btrfs/direct-io.c                          |   8 +-
 fs/dax.c                                      |  48 +++---
 fs/erofs/data.c                               |  28 ++--
 fs/erofs/internal.h                           |   3 +-
 fs/erofs/zmap.c                               |   7 +-
 fs/exfat/file.c                               |  14 +-
 fs/exfat/inode.c                              |   6 +-
 fs/exfat/iomap.c                              |  22 +--
 fs/exfat/iomap.h                              |   6 +-
 fs/ext2/ext2.h                                |   3 +-
 fs/ext2/file.c                                |   4 +-
 fs/ext2/inode.c                               |   9 +-
 fs/ext4/ext4.h                                |  10 +-
 fs/ext4/extents.c                             |   8 +-
 fs/ext4/file.c                                |  22 +--
 fs/ext4/inode.c                               |  58 +++-----
 fs/f2fs/data.c                                |   6 +-
 fs/f2fs/f2fs.h                                |   3 +-
 fs/f2fs/file.c                                |   4 +-
 fs/fuse/dax.c                                 |  10 +-
 fs/fuse/ext_map.c                             |  11 +-
 fs/fuse/file.c                                |  10 +-
 fs/fuse/virtio_fs.c                           |   3 +-
 fs/gfs2/aops.c                                |   6 +-
 fs/gfs2/bmap.c                                |   9 +-
 fs/gfs2/bmap.h                                |   2 +-
 fs/gfs2/file.c                                |   6 +-
 fs/gfs2/inode.c                               |   6 +-
 fs/hpfs/file.c                                |   6 +-
 fs/internal.h                                 |   1 -
 fs/iomap/buffered-io.c                        |  40 ++---
 fs/iomap/direct-io.c                          |   8 +-
 fs/iomap/fiemap.c                             |   8 +-
 fs/iomap/iter.c                               |  13 +-
 fs/iomap/seek.c                               |   8 +-
 fs/iomap/swapfile.c                           |   4 +-
 fs/iomap/trace.h                              |  12 +-
 fs/nilfs2/file.c                              |   2 +-
 fs/nilfs2/iomap.c                             |   4 +-
 fs/nilfs2/iomap.h                             |   4 +-
 fs/ntfs/aops.c                                |   6 +-
 fs/ntfs/file.c                                |  20 +--
 fs/ntfs/inode.c                               |   2 +-
 fs/ntfs/iomap.c                               |  42 ++----
 fs/ntfs/iomap.h                               |  10 +-
 fs/ntfs3/file.c                               |  16 +-
 fs/ntfs3/inode.c                              |  13 +-
 fs/ntfs3/ntfs_fs.h                            |   3 +-
 fs/remap_range.c                              |   6 +-
 fs/xfs/xfs_aops.c                             |   8 +-
 fs/xfs/xfs_file.c                             |  53 +++----
 fs/xfs/xfs_iomap.c                            |  55 ++-----
 fs/xfs/xfs_iomap.h                            |  16 +-
 fs/xfs/xfs_iops.c                             |   4 +-
 fs/xfs/xfs_reflink.c                          |   6 +-
 fs/zonefs/file.c                              |  22 +--
 include/linux/dax.h                           |  18 +--
 include/linux/fs.h                            |   7 +-
 include/linux/iomap.h                         |  66 +++++----
 63 files changed, 492 insertions(+), 557 deletions(-)

-- 
2.52.0

