Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725363;
	b=lT1dTw1IC8fUFDwiZLDsATqLcC24phVC3Kz2kUjoKfyA1M+lxJ6q2xuBwsS9yrPAcJbP
	 q+ElU1tHUnM375fUcQCBiP9PL0k5jq9J2Mphfk99sIzedVPqKB82NsvFG19swqgh5T9d6
	 3SagZq1DI3mO89SolZdaU3b4ENGt+QDaqYm3jiKeifoiTY/QrR1FhDRh5AbEhRnb3jshp
	 eiogwyfZkgqZ5wURGGwS45oTIhgUh0KW8c2q1+gef2EEGXOofV9WDD0oaTmlVmfNb3bWy
	 cdCfi6pTvcc9RBIDteg5EZvNZqjxhiUh3b28kQRdnxyMn0I7U9Hqcp2YMt7nMxySoew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WIZAEgnBwMpqlYT+9Xa4DAWnPrz+dUZjemGDsnG2tlY=;
	b=na28XpsrvFLQqv2boxY8smlHHgRYBO/3pmlWF2s6cT+E2EfuFmAYxG5+bWa7wwRvjysH
	 K2huCFNiRqx7un9IMJ7t2+Q3VYF3WbIW223/LlWu//K1qa2HKKNf/CRtGtqWpF/ynZzal
	 0wxClh3HxrXF8Gdjmk0449OnQxWJFirrt1gm7BTOwWL7sPLj+RG7BF/LBjkECgZ1vRFaG
	 czovqWv53bwYY1d4LX8v4W0panLKIE1TPJy1vJLhjDWsT1ifr8Q4bLbsKFNvO8JRjJqXU
	 J7AxudoWCvsp0Ps2JidKA6iYbaPdI3/rHrWXchiiUXi9LNVcx/Y5g2OBIhvdBEjyR/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7Ft1wZO;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA083606A324
	for <fuse-devel@lists.linux.dev>; Tue,  3 Nov 2026 17:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA083606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7Ft1wZO
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36c9a93a1abso617578eec.1
        for <fuse-devel@lists.linux.dev>; Tue, 03 Nov 2026 09:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793725362; x=1794330162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WIZAEgnBwMpqlYT+9Xa4DAWnPrz+dUZjemGDsnG2tlY=;
        b=Z7Ft1wZOtEELZs1RqCnkkTxBDKUadMxmGdPj3L3RD8UUEQKZN5N1hur91ouIDXYBmD
         rkq0F1b9c+rrnmjNsGOsQdH/yxmaAPrzzpEFgmUQbR62sxqraMiy/bEvR28rnEOG1L7s
         hWXt1Q4mPvEIGaC7XV+WhS6b1Na0Bqa71bJkGM04kzvdQe09ui/1bvlFW3cKn1G473cc
         01St8Fw8ioZqW4lOpF0jOU3sNSWwnJoOWFcBKFUIcWZOtIcTcDqQcRdzh/NsaRuAZ6Vn
         vqQKnHBtWJh4zNJDDLzLG/KUP4zZ6BfImYeuGe+POu8uXWz0k7NeKRstYgxxO2H9Z27g
         bKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725362; x=1794330162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIZAEgnBwMpqlYT+9Xa4DAWnPrz+dUZjemGDsnG2tlY=;
        b=f8OqSR6pdP1Zvjaj5TyIuKrEFyuMI4L0cBj1MeVhmEuHLHZmFLK1FXY493tLtDJxtw
         zIubORL3eNfbPy7BlZj+IUQjHbcmGKl0bJNrPuKPrCBKNr1DCg1L9KCvIv20KvT4AEeE
         MNcqNz0F0Fi6WZWttyHPVPEbtC/mJ1kOpJD+DByFg2rKI6HLlR1ZHpeiR9slKVuc4ZMe
         mG5JfL+6+fJTNVEkHZwGclysm86QrSX2cRbWcIcKh1Nv1jU0fNiWRjXonJfRaNN2KCtR
         pdNe9IudHHiROPv1WaL43gTUYpCs3uYQrp02B3c1ZaXRlFZbWW4RaNjcspFGwHZ6uOvt
         Yojw==
X-Gm-Message-State: APuU4Z/HwLRzJJ/a2ceOocLXVB6pm81DI0cdqkp/aYsP/VVJ4uqJ9snt
	OvQoD0xl0/ZOvtrhsFD1JdzYg3jXe28jRr78IOXGmMnIebVdhbd7dovF
X-Gm-Gg: AYBFou3uB1FOJj7tBZvUpeSMxhIG+17uXvwQ6K2cRmYEL5YrjwKp6PlpPPC4tJrTlS3
	xIEacklqqsC5UJs7iiWNFUW4n8AWhh9jh+4GtQt5/c7/c8Fg9w2w0fUctL5dhNcnRfNRBEkDm4S
	mxUSSMP5wzFK4vvpK/bzEQsF3hco5NBLJxBJdAdAzqlRMkRELKxESYGAyXM+DOFPyzQwoXCNLNy
	MGj6mSlSn5wnWGehiD0YUCPXr7+owgyJ9srcs8s587o13tV+yJkK408Xn9H6iIeAHNA5pBOK/8C
	0exLiXXCNKRwZNNxycPBIUDk7e+gcDj+qzhU8y+QyblIgZx1EBzFwdmTWQ53RqzweKgh+IcR5tX
	bF1NM7Jp1Q8LMQIoHUBqEHqWVRLMgD9Mz3mvwGM3afhSwpDycL9gzKmyFiAfhcjK2oUjL9Zk2pD
	iOVulGL0nJajatbQ79FBCvjvvT7a5ongFrneQjbFRqNwUjDdcqWRiwWJqmbmZ8p7IILc4Rz8fDX
	d2NImrcjkazMxhA3qy0W0Koo+XRn4aDIMwjitwxmCFZJxWmTU4+VA48X4VPwJpi2evOCCoNj9Sx
	OU0JP2YoDJpmsnbEr9PujwpnQ4hdUjh79MESZWH4GBvxL2qELYlZkzg3q40EuhqrECGLYPU4DJr
	b7chV
X-Received: by 2002:a05:693c:80c5:b0:36c:a165:4d27 with SMTP id 5a478bee46e88-36ca165569cmr229531eec.18.1793725361698;
        Tue, 03 Nov 2026 09:02:41 -0800 (PST)
Received: from localhost ([59.176.91.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm47809829eec.8.2026.11.03.09.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:02:40 -0800 (PST)
From: Amal Rockz <amalrockz669@gmail.com>
X-Google-Original-From: Amal Rockz <amalrockz568@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Amal Rockz <amalrockz568@gmail.com>
Subject: [PATCH] fuse: don't install DAX state when CONFIG_FS_DAX is disabled
Date: Tue,  3 Nov 2026 22:32:36 +0530
Message-ID: <20261103170236.2100236-1-amalrockz568@gmail.com>
X-Mailer: git-send-email 2.56.0
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

fuse_init_inode() installs fuse_dax_aops whenever the server sets
FUSE_ATTR_DAX in a LOOKUP reply:

	if ((attr->flags & FUSE_ATTR_DAX) && !fuse_inode_vdax(inode)) {
		inode->i_flags |= S_DAX;
		inode->i_data.a_ops = &fuse_dax_aops;
	}

fuse_dax_aops only provides ->dirty_folio().  The rest of the workflow
relies on IS_DAX() to keep such inodes away from the page cache:
fuse_file_io_open() refuses to open a DAX inode unless it is opened in
passthrough mode with a DAX backing, and the truncate, fallocate and
fsync paths reject DAX inodes explicitly.

Without CONFIG_FS_DAX both S_DAX and IS_DAX() are 0, so the assignment
above still replaces the address space operations but the inode is never
marked.  Every IS_DAX() check is then dead code, a DAX inode can be
opened and read through the page cache, and the first read reaches

	filemap_read() -> filemap_get_pages() -> do_page_cache_ra()
	-> page_cache_ra_unbounded() -> read_pages()

which calls the missing ->read_folio() and jumps to NULL:

	BUG: kernel NULL pointer dereference, address: 0000000000000000
	#PF: supervisor instruction fetch in kernel mode
	RIP: 0010:0x0
	Call Trace:
	 read_pages
	 page_cache_ra_unbounded
	 do_page_cache_ra
	 filemap_get_pages
	 filemap_read
	 vfs_read
	 ksys_read

FUSE_ATTR_DAX is a server-controlled protocol field that is not
validated against any capability the kernel advertised, so an
unprivileged FUSE mount can crash a kernel built without CONFIG_FS_DAX,
such as x86_64 defconfig.  Reproduced as uid 1000 inside an unprivileged
user namespace.

Do not install the DAX state when DAX support is not compiled in.  The
flag is then ignored and the inode keeps the regular address space
operations.

The bug was found and the fix prepared with the help of an AI coding
assistant.  The reproducer was written and run against both the
unpatched and patched kernels, with CONFIG_FS_DAX=n and with
CONFIG_FS_DAX=y.

Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
Signed-off-by: Amal Rockz <amalrockz568@gmail.com>
---
 fs/fuse/inode.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 1341b681d0ed..cf5fefb83e20 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -418,7 +418,13 @@ static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
 		fuse_init_common(inode);
 		fuse_init_file_inode(inode, attr->flags);
 
-		if ((attr->flags & FUSE_ATTR_DAX) && !fuse_inode_vdax(inode)) {
+		/*
+		 * S_DAX and IS_DAX() compile to 0 without CONFIG_FS_DAX, so
+		 * installing fuse_dax_aops there would only strip the regular
+		 * address space operations without marking the inode.
+		 */
+		if (IS_ENABLED(CONFIG_FS_DAX) &&
+		    (attr->flags & FUSE_ATTR_DAX) && !fuse_inode_vdax(inode)) {
 			inode->i_flags |= S_DAX;
 			inode->i_data.a_ops = &fuse_dax_aops;
 		}
-- 
2.56.0

