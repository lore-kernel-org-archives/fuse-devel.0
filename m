Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65173451A6
	for <fuse-devel@lists.linux.dev>; Sun, 26 Jul 2026 01:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785031199; cv=none; b=c/Xh+zPUv0QbgPC+rWui3EQTGW1KinnTKk050KKM8xmVbmP1VawddhIbH89M6n1/f0LIQCT4yHt+3KlS8nhF+8CmtVFZLM1fg4KRVoL6d10Uf4ZoAgO7AP69VssZv2bX9pN4W4gjQZdqaXaB/GzrWVGWZ1sMXny7PqdwAT4aiKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785031199; c=relaxed/simple;
	bh=2V+3m0fgntJtbg8ymQ5J7H5s4f+81WfW9BhXC4k8GHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=auZ+1jQkiBQIiZnYw2xhbP9IIlWG1lnOGyCZ1X73/bNpjlnTOyft8hCrt4ceCots+1DjB3vtdXaYQcWhUL4MMuMNG3forNYB0xAthRgd9oGMHoykVF5d3/fUY2pXug/VHZ+5eF29OGpUbH34WW1abr1xy5Siw0oj6MhtT8fo+og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COQztw98; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COQztw98"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so1434263a34.2
        for <fuse-devel@lists.linux.dev>; Sat, 25 Jul 2026 18:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785031197; x=1785635997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DsHLlh0udDqVC+emmPBCCltHi5t5SZsNobdjX3Jo96c=;
        b=COQztw98lPi+ugjbA8fH2ZBKtHbwH9IDPqsJ0t9FiP4PjyK9NH5ajiJH2uUA57gQQ/
         +g3dHEbV6NWDTHtkUxFiCrlS9wVBzW70KKbEnHuu3RqULRVYML1454ioufNhbDyp2U27
         R8cBtCwRgkJDFrNslbALamh6VInx6ZYx/JHrdwS+ss9UKB4K2iVeJQQ498V6vx9D8MQv
         /X+zmc/M05DODkChO1fPf1ZK8dbeTeiSfbJhkIXR0LBxGdRdN4iDAFFwRKQQmQuqn/yr
         2rT3fzTOk6GfH6HGg3jLDJmTF180zkETHyBbbXR3ta/LXXfoiRbLqxv9P5xxvuQ4DN45
         eZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785031197; x=1785635997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DsHLlh0udDqVC+emmPBCCltHi5t5SZsNobdjX3Jo96c=;
        b=KWaIC2eAM9TLGklGZyIJY4tiaT7MQqVoV9AF2tugo2OVOyTqtcwKZ+BfgZItrLsvUx
         rDiFp4so/lz3BE3nlqItzJU+ngnm3fFTqw8CNYdZDSSIE3jzAyvFphG2ek9OsprMG/Om
         2AnUFj0H6g1e6+DdKfSEeeejyZ0U5YnC/1NER4dpRK8u4p5rdV1e46bflKIa8ye0Pd8C
         o6n1U7+l4iYm4V12/dvAEF06KvEUZQJ+CyACw2UAtg28FFVoXlnatgD7JYuC76oXQwGK
         xqaoHiy1pnRj60k4ivd3QWviPHba8Nl77vFvbeSX8IkRZ8mON1K4QJwiaJwc+Y3DR5+9
         pScg==
X-Forwarded-Encrypted: i=1; AHgh+RojF1GfnfYIIqq55voEFKySc6eGX8ifvXI+Efn6yFXjk/XrMZKRFwudOUgsMVfgwVnsVixHHXUAC026@lists.linux.dev
X-Gm-Message-State: AOJu0YxUj45QfswfxLG8s3aZ0GeiSD0R05AEJRrhebjNM9aSMmQtW/Oo
	NWY3RlD1p5w5kt2b6JSA6Wf8el3wC8xTqv0hPel062ye+OxEW5yTVm6t
X-Gm-Gg: AR+sD10iDr2mxQl5M8b8c02gArrqoPKnQtVH4u6KX8GtqwVdsxMwHb9TNP9t81rX8CQ
	TzGDDFAo4xZU6LXRPsVbRLCJfsBoAPiVwOKJTeWUfeL9djTcYCb7vWaNXMnPoM9SOlYdJ7pN4U7
	x1FaA4Vc9FVqtyx584NgZN9BZaLa1/tvLOI6ovwXs0Eth56JMWIqkG1jlRMXZaYg7eTrptcfeYp
	5x5Rc1nW5XPHe0ei6g48Ap3fwZtuu3h1LgwNAzE0HpSfwWzNuJAfjm3OEWmiAJVRId6H+hQKTl/
	MNZRGPWhaLQo/i+f5UtbGA2GpaOe7ISvdldq5piA5blJFEOdXESotpglfijVVQGjxC935cNwDKv
	XkZH8/ufYECe3oTekGubU8Pnua3xBC4AbJ8K8tfPGLjQc8Eb8WhWn0KvOYePMJRd4L57vCbeSuM
	GWQP6CGO27/LcN+ore5wsUIiGxnLADrHd71C34V17H3AdF+WqV16p/ZNbpCkvrG2I2GRMAN6vBC
	kN4v/H6BgU7wVNmtUTchonPv/1GM3TNgd7JkAvvASay
X-Received: by 2002:a05:6830:314d:b0:7e9:cf5d:b7c3 with SMTP id 46e09a7af769-7ee78db7dd2mr3701023a34.23.1785031196730;
        Sat, 25 Jul 2026 18:59:56 -0700 (PDT)
Received: from rdf-gcp2.us-central1-b.c.storage-xlrait-66065.internal (163.80.112.136.bc.googleusercontent.com. [136.112.80.163])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee29e0ec5bsm9335656a34.10.2026.07.25.18.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 18:59:56 -0700 (PDT)
From: Russ Fellows <russ.fellows@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russ Fellows <russ.fellows@gmail.com>
Subject: [PATCH v4 1/2] fuse: preserve FOPEN_PARALLEL_DIRECT_WRITES for passthrough opens
Date: Sun, 26 Jul 2026 01:59:54 +0000
Message-ID: <20260726015955.319132-2-russ.fellows@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260726015955.319132-1-russ.fellows@gmail.com>
References: <20260616231325.16788-1-russ.fellows@gmail.com>
 <20260726015955.319132-1-russ.fellows@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_file_io_open() clears FOPEN_PARALLEL_DIRECT_WRITES for any open
that lacks FOPEN_DIRECT_IO.  That rule is too strict for passthrough
opens, which already bypass the page cache through the backing file
and do not need FOPEN_DIRECT_IO to guarantee direct-I/O semantics.
Clearing the flag before the passthrough write path sees it prevents
the kernel from ever taking the shared-lock path for passthrough writes.

Introduce FOPEN_IOMODE_CACHED() to test for cached (page-cache) iomode
-- neither FOPEN_DIRECT_IO nor FOPEN_PASSTHROUGH set -- and use it to
guard the FOPEN_PARALLEL_DIRECT_WRITES stripping.  Passthrough and
direct-IO opens both bypass the page cache, so both are now eligible to
enable parallel direct writes.

While here, simplify fuse_file_io_open(): drop the early return for the
pure direct-IO case and dispatch the caching open through the same
FOPEN_IOMODE_CACHED() test, so a pure direct-IO open simply performs no
iomode setup instead of returning early.

This is a prerequisite for passthrough write parallelism; without it the
shared-lock path in the subsequent patch never activates.

Suggested-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Russ Fellows <russ.fellows@gmail.com>
---
 fs/fuse/iomode.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
index 3728933..937d9e6 100644
--- a/fs/fuse/iomode.c
+++ b/fs/fuse/iomode.c
@@ -192,12 +192,18 @@ static int fuse_file_passthrough_open(struct inode *inode, struct file *file)
 	return err;
 }
 
+/* Fuse uses page cache if no passthrough nor direct_io open specified */
+#define FOPEN_IOMODE(oflags) \
+	((oflags) & (FOPEN_DIRECT_IO | FOPEN_PASSTHROUGH))
+#define FOPEN_IOMODE_CACHED(oflags) \
+	(FOPEN_IOMODE(oflags) == 0)
+
 /* Request access to submit new io to inode via open file */
 int fuse_file_io_open(struct file *file, struct inode *inode)
 {
 	struct fuse_file *ff = file->private_data;
 	struct fuse_inode *fi = get_fuse_inode(inode);
-	int err;
+	int err = 0;
 
 	/*
 	 * io modes are not relevant with DAX and with server that does not
@@ -216,25 +222,20 @@ int fuse_file_io_open(struct file *file, struct inode *inode)
 
 	/*
 	 * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO.
+	 * Note that if user opens a file open with O_DIRECT, but server did
+	 * not specify FOPEN_DIRECT_IO, a later fcntl() could remove O_DIRECT,
+	 * so we put the inode in caching mode to prevent parallel dio.
 	 */
-	if (!(ff->open_flags & FOPEN_DIRECT_IO))
+	if (FOPEN_IOMODE_CACHED(ff->open_flags))
 		ff->open_flags &= ~FOPEN_PARALLEL_DIRECT_WRITES;
 
 	/*
 	 * First passthrough file open denies caching inode io mode.
 	 * First caching file open enters caching inode io mode.
-	 *
-	 * Note that if user opens a file open with O_DIRECT, but server did
-	 * not specify FOPEN_DIRECT_IO, a later fcntl() could remove O_DIRECT,
-	 * so we put the inode in caching mode to prevent parallel dio.
 	 */
-	if ((ff->open_flags & FOPEN_DIRECT_IO) &&
-	    !(ff->open_flags & FOPEN_PASSTHROUGH))
-		return 0;
-
 	if (ff->open_flags & FOPEN_PASSTHROUGH)
 		err = fuse_file_passthrough_open(inode, file);
-	else
+	else if (FOPEN_IOMODE_CACHED(ff->open_flags))
 		err = fuse_file_cached_io_open(inode, ff);
 	if (err)
 		goto fail;
-- 
2.51.0

