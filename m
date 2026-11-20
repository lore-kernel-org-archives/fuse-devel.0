Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795187797;
	b=da6izF4D1vbBbiSFpsXHKDfwspET2a8xb9qzj0mVizZtUgOe08KQmgxo3OQOWR/z7H0v
	 WM3Qkr4YvwCs+tsgUSev0wWTZcKd2x5YzLBTthctBLNHefFND3CLbYiNNgMZ/Puhj4fHk
	 ApwZxvg7vaFqEOd+3BSa9Fi9RQ2DXJW+3Xl52r8dbPYiwadFRZn/Er4euFywiieBEtgu6
	 y18Dts5d1xgYalWkqT6eodKSgolCnKu6EhOZ3ZBJzhX5aMnMfF62P6H/eHr2DcUZvJ53c
	 Genp1pTLmgEdlc4NckcPXtalDIICY/jJSpDHGCp84pnBLjK07thOAACdf0XlOqocHVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=yW1EW3ndjX19ZMwxi5BjIBlhtxHPAFUThq+STsbmeB4=;
	b=SU26wWd8q7v8gbf9lZ2Wwav+X2tNDnp/it7jPYXIMVjLZDfYbhdD6Ery++/BeK/M+dzz
	 WEXM3MZ8Go/g0Ky9ja69bIXolW+1ZviPWyJupIMlNTocqYOy4MTb+Ayz37Y8uho3mmVU7
	 BkXeO984TwZyslN08p0Bm+Zl81RtyN8k4MO43E7sYVoi0iqOq9+N3RLsXhbSsdtYS7vEi
	 phBDRWw2AGZ7pPw71buRYfyqbHi56hDY67JLRCVTuNQbqQ2hXBEvtj1vSzPK3dJNbRIOb
	 PUaygLN4WlhWYHg4mPAqQzEs8ItX4K0rf9v3cZ8U52BEIMjIRhatKH1jqlqPOgdKglw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=W9GoTPEz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E0A606A320
	for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 15:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E0A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=W9GoTPEz
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5364648ae07so12335651cf.1
        for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 07:16:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795187795; cv=none;
        d=google.com; s=arc-20260327;
        b=qjBPLUbL92W+rHau3XO3Bbygob/PKZhFFXPw8FmFdeslm/d6ulVHF6ManuIFzDMkGN
         9JR40DGoGvT/c/56Z77+aWtXedOC/hEF2p4wuMhDf5bDWYImeUXQXWqWUNsRGHv2XY1D
         UjIE0ThNSI0OOySbHidMOwORr8pvXxTTxI0g4NMDmgb6Hh6TfAEWLDbYW/G6xXSdafgW
         lOtXDEo7SqmPIoBM5v1NlExlxfOPJQbHkPMfR9waZ2PveufutcUJj0/lHq6Ff2CQymW+
         pdtYj1eLVB3vrMITn4ySfCw078irO049P6zC6qetlR/zJzeSsWJWVbJdJWcjOTiEU5OS
         Dc9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=yW1EW3ndjX19ZMwxi5BjIBlhtxHPAFUThq+STsbmeB4=;
        fh=qEXaCcHbm7rQSclTjgZND43crpPJ9obOJty2J5U/1UU=;
        b=FuJEXu+np/S5NrvRYIs6/fhHu5yZpocz9UuDbxFh41i+D7xtxkYo5XH9OdyFXMNz3w
         RxUnwqsAR3uNWtBwYC/n3L2qVCrSnzKRKFI2cMa7XvoFyI9KVBK3nW11XmiPE6oJLSOa
         838hAznimWTkwfh5drjP7XtzrXQJVthIR0NqNB+/KY7fM5+Win/Spo04sdF6/PdfWcL1
         jB49ty5W0XFCkzImY6Tlj12XNJmPLtvCUhKj47vdTasEsIacWu1687+b3Y28vzlFBisR
         pXYlJeqcfYQgp0UWNHVzvmt8gU4hkShwodub6TG74pZXmkfACrrcy0ei2ZPR9m0So5hE
         mKOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1795187795; x=1795792595; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yW1EW3ndjX19ZMwxi5BjIBlhtxHPAFUThq+STsbmeB4=;
        b=W9GoTPEzUfKELXxqbtcX9NN5eF6rg+HAxg/xKL1HEL5kKXX84wPYP24TG+faYWEfKf
         kL5VOmQql+YdIgzCJqm9QM1+P7uxeJ3NMl8SxcinVELdMXc+8I52XL25fqM0r5vA79Y1
         f3NZVasyiCp+/SF08cGPSyB3M75zKIbLdeXa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187795; x=1795792595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yW1EW3ndjX19ZMwxi5BjIBlhtxHPAFUThq+STsbmeB4=;
        b=UEU1gqaQkEYW5O3Yfx8krqgeBwt4bsq8TlwiSqNwbO9Jqp5zU661xkNVdyLoN1LIIM
         6tM8TbGLWA6pccrFIS8m/BDYQMzXU1Fv/sKze9JEpTrVcfsOCd+r3AGDHGpV4NhaRYPZ
         +qdfyfZJdh4oIubw0Cwpyjq5JGciAaMxQhKM/TnILAMOgfSZJiGba8P/Ce94yFe467Ki
         bdCSdR1y4zwajadb18qpIP6A8CT1n+se3Ogo+0SqMDFgpgsTZ+h/jpvx02vjURU6XLtL
         vCqc4bMN31/cHL9Eb7flV4xj73ciMQzC4fvrdl6V9okz6bOz2jhiR+bA7lNz8KWYmg2L
         eD3A==
X-Gm-Message-State: APuU4Z+iSMvkWcPeu7FD1Lt7ZqsM90Z6UpDw/Aflf658oRekh4aOeA7g
	KKKD9oBa1Ocq4DavO+qZFCKXUukb+o1rY3x9m0/4ETSP92FOApOExW9DxDjobgRns5JXGUeNB45
	zSVW1ESgTrJfM7Clg1Ye3aqy01eBQ9ZXa68nwSAQiZQ==
X-Gm-Gg: AZFdTZcXJeVVmGlAFXK3Edz7AZ/7MhoiNOtkCk/A5ML95y4tOyUijjEzG4aAJKUH7NT
	kmPzrYN6CWolvfGK1LRwD5wQZRaHmbatwpxWQcEH37TMhlNkOJOKKVeUS0Wu6/pn/deKag4NNRM
	BtUn3eOguhXn17Ka5yBnMRck7oYxLHxAJWn3CZsUEPfUtLsNDa/l/iPaC4ZUiTL9b3Zx6SUwMjn
	3NAtIsWI/UwR4BU3YMYIjw2Sj8SdUV52NNYTWte6baZ1vP1mcL7lrXYj+2l4khR4fqY3NhYTvhk
	HSRjQOMJEjwRipfhROwxFpJ/IRzVZbCjHlIbHu98ZTsqZPP9SjEuAU+Xq66PPmz8syL5trsAFAl
	rLmYF+0mH8cL7T1Gld0/9XQaasJ2SlrqEXKWeiwDJLs4wqtdfj+ITHjopmcm6xFSapw==
X-Received: by 2002:ac8:5706:0:b0:536:3760:e6cb with SMTP id
 d75a77b69052e-55d769e9387mr59850611cf.14.1795187794951; Fri, 20 Nov 2026
 07:16:34 -0800 (PST)
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
Date: Fri, 20 Nov 2026 16:16:23 +0100
X-Gm-Features: AclHuK9Kz6D2bchO88XWWEcVzCFfoEy0keHk3Nyv8Ec-0oQZb2LLMT7EFrmIXNc
Message-ID: <CAJfpegvzVm6hTTNp7BgkFMs1DziFvmNoHUXjdTPz=9nC5ccUjQ@mail.gmail.com>
Subject: [GIT PULL] fuse fixes for 7.4-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: fuse-devel <fuse-devel@lists.linux.dev>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please pull from:

git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
tags/fuse-fixes-7.4-rc4

- Fix  bugs reported by Sashiko

- Fix a couple of issues introduced in this cycle

- Misc bug fixes

Thanks,
Miklos

---
Hengyu Liang (1):
      fuse: preserve ENOTCONN after failed initialization and disconnect

Hungyu Lin (1):
      fuse: clear the old EOF tail before writeback-cache writes

Junyoung Jang (1):
      fuse: skip dcache instantiation for readdirplus names with embedded N=
UL

Leon Ming (1):
      fuse: set dentry epoch before making the dentry visible

Miklos Szeredi (10):
      fuse: fix possible UAF in fuse_direntplus_link()
      fuse: zero the partial EOF page in copy_file_range()
      selftests/fuse: test post-EOF page zeroing on copy_file_range()
      fuse: derive short read EOF from the request offset
      virtiofs: fix use-after-free of fs->tag on device removal
      virtiofs: disable request timeout
      virtiofs: zero the reply region of the argument buffer
      fuse: don't mark inode DAX without CONFIG_FS_DAX
      fuse: advertise support for DAX mappings
      fuse: limit name size in listxattr

NeilBrown (1):
      fuse: Use d_alloc_trylock() in fuse_direntplus_link()

Orkun Emin Sar=C4=B1 (1):
      fuse: don't pass a NULL inode to fuse_inode_backing() on release

Shunbo Shi (1):
      fuse: fix UBSAN warning in fuse_iomap_writeback_range()

---
 fs/fuse/dev.c                                      |   8 ++
 fs/fuse/dir.c                                      |  12 +-
 fs/fuse/file.c                                     |  53 ++++++--
 fs/fuse/fuse_dev_i.h                               |   3 +
 fs/fuse/fuse_i.h                                   |  23 ++++
 fs/fuse/inode.c                                    |  46 +++++--
 fs/fuse/readdir.c                                  |  39 +++---
 fs/fuse/req.c                                      |  15 +--
 fs/fuse/virtio_fs.c                                |  34 ++++-
 fs/fuse/xattr.c                                    |   2 +-
 include/uapi/linux/fuse.h                          |  10 +-
 .../filesystems/fuse/write_extend_eof_test.c       | 143 +++++++++++++++++=
+---
 12 files changed, 308 insertions(+), 80 deletions(-)
