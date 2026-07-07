Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B930D41F
	for <fuse-devel@lists.linux.dev>; Tue,  7 Jul 2026 22:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461916; cv=none; b=uFrXn7ZOIAvFywvRFkKJ3PerJaBmumUEPQu0oLIPFdWxp5fmFoifcS4Wrnz3r9Hma09lXwKbYim1XkRWOB0gvn3TA8nRHR4qaKAJ3x7hmVMcOCDT15Sb5j9fE9c/GN7wrowwI6V8t8jl1TAJky9bIp9YYyjfmnnzzPziT65h0rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461916; c=relaxed/simple;
	bh=uSMZyhpWb3Lewk10aGyLoJhwKy1RPso0pdHWRzUeHRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XSC3g8dwRwuUOb6MvLVXbVlsOTxmrYW0skt5VWLNtKiXiN84RMxpwmIg+du/6mrhH6jOnKWbuguFPyRfWG/6vHMQ1pgSQ+ntMjmkEtwkmSS3BbkGNIswMyrfq5eT7Z5StqeAJCYG+tK/oWDkYdFwak4ZO0WXUjE83G19+CorMgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFeO5j7C; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFeO5j7C"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-44ae264a785so20956fac.3
        for <fuse-devel@lists.linux.dev>; Tue, 07 Jul 2026 15:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783461914; x=1784066714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AFuyHyO9x9zi/vB/Fo3WcH6RsLoMos07zpCuStd3IHg=;
        b=HFeO5j7CatoJg+6dCy65WeiaEC3DAR5aSvipX0gKEvhXim9avBmeQdNuQqaPObVcFm
         48vlX48Pua/daRvyojLOTmtnbOQF3/HUmXudf0fXDJjFv9j9rOiOHAEt0zvBcS01DwDG
         YKgX/EbPYN+fEkT2h3bWXiD4Rd8BYW5wCO6ZidB2VMqB1kVWXSuHL4RGlzmXpQeFrB0G
         Y/FHU1S1jEc6QxLsWzu3E3CfDWESuw5mqFPRXRjHRig/An0UNQskhePTEgmkzdL1gwqH
         YnN1zK8RfYPyiwl3CL7l7nhAjaP5dmKiZA1l+i+xebOHnF236+s7hgEI8MmbZlMG3Wnv
         sFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783461914; x=1784066714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFuyHyO9x9zi/vB/Fo3WcH6RsLoMos07zpCuStd3IHg=;
        b=rnCxVu+mUU61edUQtt8xAhq1dm3fPpO+T6TKUr7hKSQE11ANeefbbLraH3UF7zsrT/
         eu+h5GEPVYaNrqqBBLjL6ezI8GpeHeNEE4mcH4rWZ7LfJuBWAbv4B6od6+k06frdiRnn
         AaGw2a1YNheibn/VQJE8TNi53szriIYtwhzSjcjyt7HYjBsw0ISENhUJDQ5FylpBkG8g
         K0i/WpoAK+A1FgBigdCfPwm86ZDIoYud/2IhOz4QLtlGj8owQFnQLH/uqoNryF+yS09I
         ZlhKD4IgEXoofH/FpaiXLsD3qED9POq0Nga+PTJg/C4QH5bXzUWRZKnzjFo3MX1eUWnj
         brsw==
X-Forwarded-Encrypted: i=1; AFNElJ+oNfg8NQm+dRGXjLgkazzXHEYy2S7SPSjywxj2zwAbknuBJK1z2BsqzYzvvr90xK3iTrWoarHIsCnE@lists.linux.dev
X-Gm-Message-State: AOJu0YwPu4/NDjg4BIEdZiYCUw5hRM2JbB5DcOF3nbjZmCA8bDIYY8Lr
	SQ+LJcAwWTkNhVdIkh9lpSsU9j4xvH9I9+4gdUYmnEFrBSVvOvQMU2pR
X-Gm-Gg: AfdE7cn+QPR/5Jo9vQcBXsuBAIfxmDzCQ5DduBVGCpYPu5eeBhCL1hxLusvW41r/t9s
	HzWsbFicltwt9/8RDXwfIePSAIMy15pVlPEtBKi0Mw4e0Nsp115KwCL8FqW43YI4fBJt4QeDrD/
	d7oRWTz5eUfipxomlAgGLU3XLxesgz+VPlRX2PijPILcFKZjZtuunt9Zo6OrHT0AKjEqt0bVbNk
	7pkvWlaHyj+Bx2oIUzWuE1GSwgNvh0CISzwo6rUQ/5lcNYvej61eYbvPZP5xMo01eVVf9/T2c8n
	bvYfTqSKB3M0LMsRu7EOzo0FZy7pGr3OjjfN6BOjhcLDZV6jr/BMAyUxPVP48oxeHqQ1HWWDIZx
	CSEIpKkyLPweDsq2YO4bW9LKsU/ioFdGTqEA00QGftTNS+WdG0wkcknr4JOe0ItsMqLd01aJnmf
	0Iyga6f0bChDJyLiPfzQeQU2PhQ+Gccu9PqKl1x1LcDBjYJm6B79udS3B7EuA5fu4W
X-Received: by 2002:a05:6870:9d8f:b0:43d:31dc:a6e2 with SMTP id 586e51a60fabf-45105cd2026mr4752593fac.24.1783461914313;
        Tue, 07 Jul 2026 15:05:14 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4f::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb559559sm15139599fac.9.2026.07.07.15.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:05:13 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org
Cc: djwong@kernel.org,
	hch@lst.de,
	miklos@szeredi.hu,
	willy@infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: [PATCH v3 0/3] iomap/fuse: add helper to keep uptodate bitmap in sync
Date: Tue,  7 Jul 2026 15:04:47 -0700
Message-ID: <20260707220450.1200943-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Filesystems that use iomap normally mark folios uptodate through the iomap
read/write paths, which keep iomap's internal uptodate bitmap in sync.
However, some filesystems need to write data directly into the page cache
outside of those paths (eg fuse, which may need to write server-pushed data
straight into the page cache for servicing notify stores). These filesystems
need a way to mark a folio uptodate that also updates the iomap bitmap so
they're kept in sync.

This series adds iomap_folio_mark_uptodate() for filesystems to do that and
updates the relevant fuse call paths to use this. This is needed before fuse
can enable large folios.

Patch 1 ("fuse: don't clear folio uptodate on writethrough errors") was
originally submitted to the fuse tree [1] but patch 3 ("fuse: use iomap helper
to mark folio uptodate") has a dependency on it, so to make cross-coordination
between trees easier, patch 1 is now part of this series and submitted to the
vfs tree. This series is based on top of the vfs-7.3.iomap branch (head commit
e1b77fb85836e ("Merge patch series "iomap: add simple dio path...")).

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/20260624205201.842714-1-joannelkoong@gmail.com/

Changelog
---------
v2: https://lore.kernel.org/linux-fsdevel/20260624212925.1668662-1-joannelkoong@gmail.com/
* add Reviewed-by tags and rebase onto the vfs-7.3.iomap branch 
* include patch 1 from [1], to ensure ordering between patches for bisectability

v1: https://lore.kernel.org/linux-fsdevel/20260623202843.2064992-1-joannelkoong@gmail.com/
v1 -> v2:
* drop helper for clearing uptodate state, as per Matthew and Christoph's
  comments

Joanne Koong (3):
  fuse: don't clear folio uptodate on writethrough errors
  iomap: add helper to mark folio uptodate
  fuse: use iomap helper to mark folio uptodate

 fs/fuse/file.c         | 20 ++------------------
 fs/fuse/notify.c       |  4 +++-
 fs/iomap/buffered-io.c |  6 ++++++
 include/linux/iomap.h  |  1 +
 4 files changed, 12 insertions(+), 19 deletions(-)

-- 
2.52.0

