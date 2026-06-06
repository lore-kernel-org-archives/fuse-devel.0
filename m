Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B0F27AC48
	for <fuse-devel@lists.linux.dev>; Sat,  6 Jun 2026 06:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780726264; cv=none; b=juiu77Enl2KYwrMwkWCcvEJ5clCAI7XCpj9m+2A+qpbwCdB8FIvvoGlcxdIbjw8grwt4LcxLbW6j80CJZ41YdBsxwqFmG7oPHtvOpqiYbZFfcUY0F3HVBRShjICCXaZWt+8yuOSha0CdCXKWBxPcaqWDiP+75Ye4DlPeDRdvlLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780726264; c=relaxed/simple;
	bh=ve8FNUDJ+bfAlTYt1tyGpBHY0ZFpeP48sjRpO5hIorA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KXD9Gd7tPpJEDZ9kn8ljAx6ALAEZVlSiKTM+Qp6nl1B911Z4Fre4oZQOAsJCu0eY6b7/cVJHMN6nd3iocsQ72ntMbbPevXQ/2WaAIwBSqVshnyo2IgNT2K3w5qjgWVRopfxCp5QgMZmeHWKDxD96xeD0ZZvKmrS9RAEi+Sv761Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWd0tEj2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWd0tEj2"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef5146b56so2342346f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 23:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780726261; x=1781331061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8r8X8oylGshLaIHIAK1kgCpu4mjI5I9eQ7pptBpGukw=;
        b=EWd0tEj2Zlx/PSOJerN28qfnqncXKdIvo60deiezT/0qoC1MGq1j+oViB4XEgOSnUd
         FGRXOj7YIeB/K9xld62jNOc73PMAfmvwroE5qaOkX3F9RA+kaZpylqhMFQrNAqJbYaoT
         jUwiORGDZRITmKjQapVUWvjNUidhSLBXhq4Na4hmfa769o00aCxETfjjsrpldvvnlQoo
         hZngxeXiaIY4fQQZBCFBdg+FsfVXa9UrFi0NdpcMFhgVdMg7A3lBQfqz1HovCcdqhtnZ
         jp0ilDv0R2d3GB93wYye6B26JHaAKwtv8xzg2EAfnHeY+wWCTDp/wLvwkjReo6Qo1zPw
         77iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780726261; x=1781331061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8r8X8oylGshLaIHIAK1kgCpu4mjI5I9eQ7pptBpGukw=;
        b=Fs+uccDjbPcQu9ako2kZOG1GrULMp2K57xLeTWp5ncLW3nsiHQ+au/qreeovIjtmpb
         3llW6jfkBu7hf+rX1ltfqblIkCOz6Ps5Pj760QOvp5cowpdf+gQntnvKuB9foBi8AO4r
         HlkbpVQMHlUY6K28Wj80l9C3tNVHyZLji3gjZ1B79Aajp4JNU+EiuE4Pwu5X//86AkgI
         ITO+AsGnKCqSIUqDPqSG+r7uoeGGzqeLXm+f1xTNCILJUdpPFzGLmsqpGZyQY4wp/uaN
         H+op1meAfr6x9yvQaLYtcMYFW9gI1YtpBaSddh/hQtoWYNcppSQo3qXxwQk+tv8O7hnV
         8hVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GP8IiW/yvKW1mgtb9EyMKFUrAmms15wzzqzYMoIbJyT2VtoW3uYC7eMOzDoyHMTRU0bFfmPKwe6cm@lists.linux.dev
X-Gm-Message-State: AOJu0YxzuV0+LH52A7d78of2sHijC8XXKwdbiks7ppbz7uq0h24fbRLm
	zBrt7vplm6s6yJHab8G2e43nwa3ydEUMjBWPIzEgtVDQWBIdPILT/5FW
X-Gm-Gg: Acq92OHnVCb0tAWMvxawS0GdEVj9OOtV6qNT34VI+hDm3f4UOOKERmAFlVOzmq+yXiS
	5F00GWqoBCBKYTHE6p0n3s4nU9xXTpq/Qpv5ZspRi2J/rQkvG3s0szAJzqAOOJtJuK8KGO4kN7j
	5nMhXIHRLATdYyCmNDpcIJJKxjvSKBMUEKbmsp5VvXtvTWsMuNROYVLUZPXLDfpNdBvVNdp9f9L
	fsF2x6xdLSTOY7OaPJi++ajrQGNj4kKKsul/vsMk73uvHR1RYWZqCIRSXgNUoz/OvyY+0LSv3Md
	oe2j6a9Go6K/l3jS2XKZoFUX+szMhEtp5tIuvtrI86KCI6+KYOgBcQeUyN5OeWybXH12BX6FWNu
	9NzhHgQZyDInOsDwcl5bYpDFl5nKQVNMXNmnfLEGdl6rTQdHHpHbj2bwniKgd+rLrPb2tp+r8Vq
	YYur6LwjJqpjJaZ2GMLNVQSXPo4szPzg==
X-Received: by 2002:a05:6000:41c4:b0:45e:f5b5:885 with SMTP id ffacd0b85a97d-46032b610d1mr8361361f8f.2.1780726261254;
        Fri, 05 Jun 2026 23:11:01 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f360bd6sm34254711f8f.36.2026.06.05.23.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 23:11:00 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-api@vger.kernel.org,
	netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	ltp@lists.linux.it,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@infradead.org>,
	David Howells <dhowells@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Andy Lutomirski <luto@amacapital.net>,
	Collin Funk <collin.funk1@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	Stefan Metzmacher <metze@samba.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	The 8472 <kernel@infinite-source.de>,
	Willy Tarreau <w@1wt.eu>,
	Joanne Koong <joannelkoong@gmail.com>,
	patches@lists.linux.dev
Subject: [PATCH 0/5] vmsplice: fix some problems in my previous vmsplice patchset
Date: Sat,  6 Jun 2026 06:10:26 +0000
Message-ID: <20260606061031.3744880-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset is for VFS. Of course, it depends on my previous vmsplice
patchset.

I fix some problems in my previous patchset.

1. Fix problem with CLASS(fd, f)(fd). See first patch for details.
This is probably not so important, but I fix it anyway.

2. Change "unsigned long" back to "int". See second patch for details.
Again, this is probably not important, but I want to fix this anyway.

3. Fix that LTP vmsplice01 bug.

See patches for details.

Please, run that LTP vmsplice01 test again.

Notes:

- I want to repeat: I change behavior around SPLICE_F_NONBLOCK.
Previously, vmsplice ignored whether pipe itself was opened as
non-blocking file. Now it is not ignored. And in my opinion
new behavior is better.
- vmsplice(2) now is in fs/read_write.c . It is very similar to
preadv2 and pwritev2 now, so I think it belongs to fs/read_write.c now.

Please, review this patchset carefully. I'm still new contributor.
In particular, please, review that do-while loop, I'm not sure I did
everything right.

Tested in Qemu.

Askar Safin (5):
  vmsplice: open-code do_writev and do_readv
  vmsplice: change argument type back to "int"
  splice: turn wait_for_space flags argument into bool
  pipe: move wait_for_space to fs/pipe.c and rename it
  vmsplice: make sure we don't wait after writing some data

 fs/pipe.c                 | 17 +++++++++++
 fs/read_write.c           | 61 ++++++++++++++++++++++++++++++++++-----
 fs/splice.c               | 19 +-----------
 include/linux/pipe_fs_i.h |  2 ++
 include/linux/syscalls.h  |  2 +-
 5 files changed, 75 insertions(+), 26 deletions(-)


base-commit: 8d86fcfc2857d64af85f5c87c193c25655c970af (vfs-7.2.vmsplice)
-- 
2.47.3

