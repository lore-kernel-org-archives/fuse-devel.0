Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793049659;
	b=tng0eHD5yGqjPwY1fS1/2e/4S565bZ/CYj98haA2cbjo2aVoOcsp7OyEFBH1QBQe/mSw
	 4yLEld3Wciks0BafkLKwhAGcQc1eqdgNfcpt2mPQK8JqL8TMRZnDZyh7WgpiYnT8Nc8GA
	 vhCFVa9uy0Wq1Vs+Bz1U0o/o61TK407QbanwUbMcT46/7ef2dLzWIDQrw/DQNiy+7IV/2
	 /Hak01BX2VzKvjrHpx2iRqohMJ9G8HLLhSMY8la317YveuNLZkYcMiUOSLVloh26bXsXg
	 O08aVRyJ6/vuYorar6z1Utyt3wz4Rm6fyldyTGqF16jzL6n6F7ODBlCI+xxroe012ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=0kaGKxyFPdaHjlAaA4peoPLioREVK5egwb8TsrDox98=;
	b=petujq+b+9pEx7IuqmE4SsnUJAbXUjpzZooTRCf7FJ1nXChAqCDbWCVfriYfU6rHYmVh
	 2HuSAMw4OZbZcyrkndmoDnbSlsHEYqMtN7XHZ+OYH8xkgVtVDqiGXv35DbzXeYtQz2MvU
	 eBKS4zM2HatvmqC15Mv53Tz/O9zZy1fgD0N91Lrc7SGCRg1K6XxGq1tOEMDXVcnFdlbXX
	 /4xnVBFitXkboSHTMMLfF/03CJcsgpIHXB5ZAMoX0xmJh6OwcrE4rWxisC4vktzfdbfNm
	 nZkou5qH4S4gPfyrMvQtH/rutela3f2FlCSfO6cIPXALgoE95PJ096jpANOsN6jbALg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=SrPU8wgm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30396606A31A
	for <fuse-devel@lists.linux.dev>; Mon, 26 Oct 2026 21:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30396606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=SrPU8wgm
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53634b8328eso23939451cf.0
        for <fuse-devel@lists.linux.dev>; Mon, 26 Oct 2026 14:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793049656; cv=none;
        d=google.com; s=arc-20260327;
        b=FrOElF8tbzAaLcNalwWhco/Z76Osd6ZiF36IJ+57VOxeoqIx+YOokSXATQUV1BLVnR
         3bbpRYB5/MXqWEnlmoCX3ZAgrqzE+ZzOQK9RwOsfBORuCJOkogFoH6laXfEgPgWMxNiV
         AB9Qtw05if6eNhst8c9P9p6CH8ZsrvNTRz/JwFdKufFdpBqlsFHXOHcBJGOs3ZmEhwAx
         YAb6Cd7uzySnQ+2APLhMEBwzUNkTDQMQRkJiBukuB5plBLQwLJl0gbGBZwdWk01NTgfP
         BDySXV5L44ZD6DDvC7lW1gId314Ii/I0rwCla6saUBjY0ek1nbyeOoVCYjzRQsSgxS09
         nBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0kaGKxyFPdaHjlAaA4peoPLioREVK5egwb8TsrDox98=;
        fh=CbSqCTvSmcSq9E43Y+/MRltmio3cPCEusSJjNnohkGM=;
        b=p/6KIJ15kqq5L+PWeDpGTI9/ifCjy7KZpHxuV1Bj7yIQ9L38mvDfJZWGHBl9Gr9U92
         XbWa5V2/S4HUSykaNaI8WqstsMquaGJMRFdBJlsXkfg0ubS0NnonBR0M31ZoUEwtdYlO
         L5dac2dMxx55DoAo7bEMUMwlrGia8rMfZjGd/WldKVwrWYXbEFSL1ksccJIZfOCBs2ZL
         +G5lFrM7vveHfETmlmYPL9e9aGmbxa49AavTJDfweuZKr6M7nNbeIHYq6Xa3pXYJXlmJ
         nfASTe1ZdLTCz2ldR5H31rsDjU/CkrD4FVl27mNsMGztyf3Y9WQo2A79OJEL7MtLVLd2
         a1AA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1793049656; x=1793654456; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kaGKxyFPdaHjlAaA4peoPLioREVK5egwb8TsrDox98=;
        b=SrPU8wgmCWKK30qYD+G7X3DkZ/NXuwbxHh3A2cvvmUuf2qEIR59g4pt+UuWmx78+LL
         zIuFj0eypLbLu+pwnn6AigC0xvLs0XvHHDgjkrCfi480VsJWzw8xKQk/Rv5mEOoIURfs
         JZTMcGZ5ldGDRBDnDvPpc22A6B31+msl3EGDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049656; x=1793654456;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0kaGKxyFPdaHjlAaA4peoPLioREVK5egwb8TsrDox98=;
        b=IgPI7IoEtyjHT8+KsrL1uJBplJZadWwINDRgXBkPNI+4OTN5akGH+2g/Pa6atSMyzK
         2lo+QnOiwJ5LiyGEI4ytZwUMEBF42fiUA9clQ0J2wQpW9ak5oB/7CdKXyD0qoY14If4f
         0AaaPemsVZTgtZJ60TDWbgD1Niy8Ye4Vu5ZMQ4U+2U30jkJvq4Xpa8/i0R2LIdbm0DIO
         PbAVJf72PgiBYK875PllbUzWzX+nNnsuL82euosUrY6brPsluXDTMpn9VWdBwh+HqtuK
         1DS5Rn3wHqfO3bLPr5BONIvYkuskRSGpw9q6vx4T7fXANPFQ7yR1Z8/vHDUe7Wh40LOv
         SAIw==
X-Forwarded-Encrypted: i=1; AKwUvBx54O8wy3g9SHpxwfXLvE4kxHUwT6PpAxRq1b++nU6srtD1wFSuqgNTDFWOXCHjN++tioYoTJzoWk4+@lists.linux.dev
X-Gm-Message-State: AFq9FYKNpty6VOuQT4iSGEx57xPLMPoWzyGbPF+RlYa4vahOzuqovPmp
	65ZNNFtJM24yw5eCJvoGm5xpeHj+1xTlRu5Q3dPwmmQFzv65KyLOt/Kx+uvXHmDg8FXo7QbTvn7
	68dyXM33cJaoda2NgvHzdmN5z7RzFAraqdBu+ePAt1g==
X-Gm-Gg: AYBFou1M+88KYRt+IEGkO18Wo+X8zstrv01o3eWf/2hdfUUNon4wfcOc2OQ9mdS3QnN
	NE32/8A4rWmr5ry8bJeRXzYgAGDQEpI8J+WeSV709zA5Y0SA2I2jia6Up4wSWUnTFctoJcoQnyx
	EfHTixys9tTfmAaNMDZyDThxWkkAjfUU5AxCBSW/+fQPw+p/v84g/Cpwn6gqDmQtONOilrr6QBl
	FzzcNs96BU4e5zS7LobYogHNr4TehWYm7z3z2M9JWN74oneG8oKIEvdLCj81GzQ+8i3uvX+Qvkz
	o2eTD0zo5DJJ3dLh3O/6QueGWX6c8cdfm05ooGBr8UDnq3gsapTB+YVpQJDrd5ta0vEjd6XeaGt
	I3pkPs6qP9/+x6RvheANhKsgEO7Kd8yLeVq+cIFO6BVDMglT6wiK5WnPnl3nNo5Jfy38NEO4=
X-Received: by 2002:a05:622a:4814:b0:536:6f16:d923 with SMTP id
 d75a77b69052e-5383b529e0amr131165761cf.40.1793049655915; Mon, 26 Oct 2026
 14:20:55 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 26 Oct 2026 22:20:44 +0100
X-Gm-Features: AclHuK_o-lunJ57CXW4yVmdLlEp357dyXWlAawErz46SB_3NkJUx3Q5tGeTod0Q
Message-ID: <CAJfpeguS78Y_ZB=fNbYqFPcpo_mznJBR=5KTqifMzCm7c3O+8g@mail.gmail.com>
Subject: [GIT PULL] fuse update for 7.4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org, fuse-devel <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull from:

git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
tags/fuse-update-7.4

- Add dax backing and  extent map support for famfs (John Groves, Miklos)

- Support large folios (Joanne)

- Add selftests and documentation of caching behavior (Luis Henriques)

- Add  FUSE_SYNCFS request (Jimmy Zuber)

- Convert readdir cache to use folios (Tal Zussman)

- Lots of bug fixes

External files touched:

1) fs/file.c: added EXPORT_SYMBOL(fdget_raw); should be okay, since
fget_raw() is already exported.

2) drivers/dax: changes acked by maintainers.

Thanks,
Miklos

---
Ali Nasrollahi (1):
      fuse: ioctl: remove unnecessary comparison in fuse_setup_measure_verity()

Chengfeng Ye (1):
      fuse: fix copy_file_range reply handling race

Fan Wu (1):
      virtio_fs: read the vring size under virtio_fs_mutex in ->get_tree

Hui Peng (1):
      fuse: validate folio state before pipe_buf_try_steal() in
fuse_try_move_folio()

Jimmy Zuber (2):
      fuse: allow FUSE_SYNCFS for privileged userspace servers
      selftests/fuse: add test for FUSE_HAS_SYNCFS privilege gating

Jingbo Xu (1):
      fuse: don't bump attr_version for async direct read completion

Joanne Koong (8):
      fuse: don't shorten the folio descriptor at LLONG_MAX
      fuse: zero the correct range on a short read reply
      fuse: don't drop destination page cache on a zero byte copy reply
      virtio_fs: zero the correct range on a short read reply
      fuse: drop rather than zero the copied range in copy_file_range()
      fuse: replace folio_test_highmem() with folio_test_partial_kmap()
      fuse: enable large folios
      fuse: don't launder folios of a bad inode

John Groves (2):
      fuse: resolve extent maps in O(1) when possible
      fuse: handle extent map files in fuse_passthrough_fadvise()

Karl Mehltretter (1):
      fuse: fix GCC 8 build with CONFIG_PROFILE_ALL_BRANCHES

Luis Henriques (9):
      Documentation: fuse: add document on caches being used by FUSE
      selftests/fuse: convert fusectl test to fuse3
      selftests/fuse: check that fusectlfs is mounted
      selftests/fuse: factor-out test fixture setup/teardown
      selftests/fuse: use dynamically allocated memory to store ACLs
      selftests/fuse: add some extra ACL caching tests
      selftests/fuse: add fuse symlink caching test
      selftests/fuse: add fuse readdir caching test
      fuse: rename fuse_direct_io() to fuse_do_direct_io()

Miklos Szeredi (15):
      fuse: don't fill in.h.pid in case args->nocreds is set
      fuse: fall back to copy_splice_read() on FOPEN_DIRECT_IO
      fuse: use "vdax" naming for virtiofs DAX
      fuse: don't assume ff->passthrough is set for FOPEN_PASSTHROUGH
      fuse: make fuse_backing_get() static
      fuse: fix NULL pointer dereference in fuse_request_find
      dax: add fsdev_dax_from_file()
      dax: use READ_ONCE() in dax_holder()
      fuse: add helpers for EIO return value with kernel message
      fuse: support 64 bit, server allocated backing ID
      fuse: support opening 64 bit backing ID
      fuse: add support for opening dax device as backing
      fuse: add extent map data structure
      fuse: add extent map I/O support
      fuse: add support for striped backing

NeilBrown (1):
      fuse: don't d_drop() before d_splice_alias()

Punit Salian (1):
      fuse: mark DAX VMA page protections as decrypted

Randy Dunlap (1):
      fuse: repair lots of uapi kernel-doc

Sasha Levin (1):
      selftests/fuse: add the missing FUSE_HAS_SYNCFS privilege test

Shai Barack (1):
      fuse: Forward vfs_fadvise to backing_file in passthrough mode

Sung Byeongchan (1):
      virtiofs: validate fixed-output response length

Tal Zussman (2):
      fuse: convert fuse_add_dirent_to_cache() to use folios
      fuse: convert fuse_readdir_cached() to use folios

Tarun Khandelwal (1):
      fuse: propagate SB_POSIXACL to submounts

Xiang Mei (2):
      fuse: don't BUG when the copy buffer is exhausted
      fuse: return -E2BIG for an oversized SETXATTR over io-uring

---
 Documentation/filesystems/fuse/fuse-caches.rst     | 198 +++++++++++
 Documentation/filesystems/fuse/index.rst           |   1 +
 drivers/dax/fsdev.c                                |  23 ++
 drivers/dax/super.c                                |   5 +-
 fs/file.c                                          |   1 +
 fs/fuse/Kconfig                                    |   8 +-
 fs/fuse/Makefile                                   |   4 +-
 fs/fuse/backing.c                                  | 304 ++++++++++++++---
 fs/fuse/cuse.c                                     |   6 +-
 fs/fuse/dax.c                                      | 217 ++++++------
 fs/fuse/dev.c                                      | 165 +++++----
 fs/fuse/dev.h                                      |   5 +-
 fs/fuse/dev_uring.c                                |   6 +
 fs/fuse/dir.c                                      |  11 +-
 fs/fuse/ext_map.c                                  | 376 +++++++++++++++++++++
 fs/fuse/file.c                                     | 194 +++++++----
 fs/fuse/fuse_i.h                                   | 184 ++++++----
 fs/fuse/inode.c                                    | 107 ++++--
 fs/fuse/ioctl.c                                    |   3 -
 fs/fuse/iomode.c                                   | 120 ++++---
 fs/fuse/notify.c                                   |  79 ++++-
 fs/fuse/passthrough.c                              |  96 ++++--
 fs/fuse/readdir.c                                  |  70 ++--
 fs/fuse/req.c                                      |   7 +-
 fs/fuse/virtio_fs.c                                |  79 +++--
 include/linux/dax.h                                |   3 +-
 include/uapi/linux/fuse.h                          | 147 ++++++--
 .../testing/selftests/filesystems/fuse/.gitignore  |   4 +
 tools/testing/selftests/filesystems/fuse/Makefile  |  30 +-
 .../filesystems/fuse/fuse_acl_cache_test.c         | 299 ++++++++++++----
 .../selftests/filesystems/fuse/fuse_common.c       |  58 ++++
 .../selftests/filesystems/fuse/fuse_common.h       |  33 ++
 .../testing/selftests/filesystems/fuse/fuse_mnt.c  |  17 +-
 .../filesystems/fuse/fuse_readdir_cache_test.c     | 273 +++++++++++++++
 .../selftests/filesystems/fuse/fusectl_test.c      |   9 +-
 .../selftests/filesystems/fuse/test_syncfs.c       | 309 +++++++++++++++++
 36 files changed, 2777 insertions(+), 674 deletions(-)
 create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
 create mode 100644 fs/fuse/ext_map.c
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common.c
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common.h
 create mode 100644
tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
 create mode 100644 tools/testing/selftests/filesystems/fuse/test_syncfs.c
