Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793536483;
	b=WKhgS+lQ7mkv6F6AaryjsYDCTGu4v9M+BPD8bPqoVlseAqopEJCVviju+uUnTOkQZdIj
	 jUyhzrq8wr87L1nX5kXGaJoaw/n/mVWRUpvq2kLye9tjhqWOUSCOzeYdWafQGAngWKqp3
	 Ph+jMY9ygfbA91itycC5oXSBGqMuG7ARHHZI8zuGF4AEPd9fvxjS+1Gstg5vCUg6kjaBE
	 fDLktcFwqQ45qBmvz/64oy4IEYhlwa5RFVjFhyqP9aeu9kaHu2BTg6n8+0z7HtgJbxZv5
	 FFwdJ5rvPyhpjFDW0H7Rmp/iBMUxcggcqLuZu1UU5mj7CiQLk1haW/4WwZp3oKBX3eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793536483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/D/A9T2EJRYZY/+rdAawlrNFx7uSdrcye6ffwoxRa54=;
	b=UsLlhOLXehj6Mlu9xhYxID54smJUz/L3mBOumOjQHMltfG5hWA3GoFOhT85aV9lNN/IP
	 k1V3SjR/sfUs92mYBrWRgdzxYt1iLgJCtMZt/a0kRQmxlOEEB35p6ngHjBnAPzBGK9lRS
	 pjFCB0DH7udUO8dVXfYlSgdQVimT67e1nUUmLomzwNcmf2oFlKcOIHG8MrptrCOkBbyrt
	 FG0RVaJBXxKzdU4k6eZ12Wp8nEkP5PiU6Xyq9jhN2IqJEC0cowzIowuwqXwVi35Q5RhOK
	 NeZd3mSgerzJv3TOqOxI3tE+V96YDT8GwshxbZMMgMJjSziFFtwQnYb07intUn/hLDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCP2M3ER;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFC9606A326
	for <fuse-devel@lists.linux.dev>; Sun,  1 Nov 2026 12:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FFC9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCP2M3ER
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c434376dbebso441711066b.1
        for <fuse-devel@lists.linux.dev>; Sun, 01 Nov 2026 04:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793536482; x=1794141282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/D/A9T2EJRYZY/+rdAawlrNFx7uSdrcye6ffwoxRa54=;
        b=GCP2M3ERpkq+AY5Qi+4pxQhs8GlFs5V/Lz9SHs68Hin498vgfMhUFmi//k1AxW1i7i
         XbRRSp51X/ztEHELCZwHR3mQSEskaAut5tUVplin+Rg8RP6r2wCAMt99uh+LHXUVk904
         FVSghvHtZ+DgXRJK+NZHFoNxatIRQJDU8ib/3xRx4eg6sp4tHQAFMRpr3TfN2+xgzGHr
         fdjoDH7T2gWObNopoW51mUYkYHfn5Or2hrX+drEqMIOgLocel4/e+XDZC4zEg8f+P/Ur
         GkZ0K3w/G9Lq4Mf1uIJjGEN0iZW/YM/EVgVLKtH9rjAWydCiRL3QZsD6SH9c/t5euBjb
         Eybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793536482; x=1794141282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/D/A9T2EJRYZY/+rdAawlrNFx7uSdrcye6ffwoxRa54=;
        b=K120y3rfYRdK1rF6SFxbMG/aic4ZiKBEMLCxmV2gGDE2jdfVSKpFFrLh5tCjc91MWz
         H35AbJu+G6W91hRr1EOgkSoa8hJW1MIh7xQovj/yE87+uPQ3IoFsZZHiRAbGr5Oathzz
         LM6FXWCC1IzwNeg/iusP7eWBvBdciP8JV/YgvcX9gPLXjU2m+/u5tYydNFnMsEq2r5/5
         b9GDcjTte8+oYyNl9bWHzEtC1aHXEjk0XaAFtQmFf5DDpUBEWhUG0eXpbZEpOaJwwo0g
         Ph7/DEHliQ5TIELh0dATbM1eZTRYQVeoqDnbsTSfp0P3nSTysEMcwS6dn6NX7ZDmGeCV
         q8mw==
X-Forwarded-Encrypted: i=1; AKwUvByjq/DcctjGL+DK2U74sP+BHqxWYDpS1elInuPJwNJM2D02AOmhayXsZ9/qP//RknLxAawvtZmTPhb5@lists.linux.dev
X-Gm-Message-State: AFq9FYL2GFwoG1Cme6f0u9jJqH6zOdN55nUZ5Phsi6mmm1ZvzWS532el
	d3raLVW7TEc+hvzgKvO6//27oPUtXts/qnbNyNcKpA1uK5e2mGyfC+pB
X-Gm-Gg: AYBFou1b6Jmwo4CdnBQYU0o+ctRBXUonuaSeyBki6UTr2ea/+4Vo+xQXcVccqsrcp2T
	xsZ9LomQOSvDUdxIP4kyHhX+uHijlf7eu1Se3HFycDaP+wjR7KNdHqQQrVGhnx1usTlUBX+q8lo
	6CSU+LbSPUcJ0E4MrRrmPIk1gk0HzKIJV3yndNQ+EYbyI9dRMYHjPlpNgPcXgZ8+HdzlQ7Wh7+1
	TO4I08+ywsBLCXCV/UV8vJpLV9xyMBO+tjNYxivKrJz7Js/s6kQ2KKzzZMDzXiWiVrcrjYgCVXb
	UyYwEJqWRXuv0YkyfTNK6R88sl3rmsfJpFJsPZ0xvyCyRLrbIMwIGjkMcfLMWrmJGf6u/2kHJbe
	EbQmJMNLbLV9uZPEpHhWYc8NuY1chPKzY6dhveh6pkBTdfc2VQ9FGo61I0lK7wypXF/5hMMkFB2
	h28LIY+WLizf/ZzxKkqUhurkE+zmsP8cffURcx+6UPFH+OZS/hAGzLkORZKZs2fX8/Q9lenYTXI
	Ut3zteLgHYxbciKfbd05zp1zo3lIpn93QpTQ3nyDGGaqKRIyq33L/e/0K3umk+gTW/ahcjQGQs2
	Y4IRarvGujudNFVrvJlXGTb/u2qju10sJWUh6Eo1WCQiURhiDfKxpSts4Yey6qDqWAr6O/S/cph
	PPvZKd2BfA+E=
X-Received: by 2002:a17:907:3f9c:b0:c42:fc8b:6c6a with SMTP id a640c23a62f3a-c4ca7a9ef71mr660488666b.14.1793536481629;
        Sun, 01 Nov 2026 04:34:41 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18ec5sm275298666b.12.2026.11.01.04.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 04:34:41 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org,
	Chris Mason <mason@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] backing-file: pass RWF_NOAPPEND to synchronous writes
Date: Sun,  1 Nov 2026 13:34:40 +0100
Message-ID: <20261101123440.3184069-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Chris Mason <mason@kernel.org>

pwritev2() with RWF_NOAPPEND ignores the offset and appends the data on
an overlayfs or FUSE passthrough file that was opened with O_APPEND, and
the call still returns success. The flag must make the write go to the
given offset even though the file is in append mode. Any user who can
write to the file is affected, with the default mount options.

overlayfs and FUSE passthrough forward the reads and writes on their
files to a backing file on an underlying filesystem, through the helpers
in fs/backing-file.c.

The flag works for the file that the user opened: kiocb_set_rw_flags()
clears IOCB_APPEND in the write's kiocb. It also copies RWF_NOAPPEND
into ki_flags, as it does with every RWF_ flag.

overlayfs and FUSE passthrough then pass the write on to the backing
file. They opened it with the open flags of the user's file, so it is in
append mode too.

For a synchronous write, do_backing_file_write_iter() calls
vfs_iter_write(), which sets up a new kiocb for the backing file. That
kiocb starts out with IOCB_APPEND set. vfs_iter_write() is only given
the flags of the user's kiocb that are in BACKING_IOCB_MASK, and
RWF_NOAPPEND is not one of them. So nothing clears IOCB_APPEND again,
and the data goes to the end of the file while the call returns success.

An asynchronous write reuses the flags of the user's kiocb and is not
affected.

Reproduced by calling pwritev2() with RWF_NOAPPEND at offset 0, on an
overlayfs file and on a FUSE passthrough file opened with O_APPEND: the
data was at the end of the file afterwards.

Fix this by adding RWF_NOAPPEND to BACKING_IOCB_MASK.

Fixes: 73fa7547c70b ("vfs: add RWF_NOAPPEND flag for pwritev2")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---

Christian,

This is a followup to commit 19b18e01d0361 ("backing-file: enforce
append-only and immutable backing inodes").

It is NOT a security fix, but a correctness fix for both overlayfs and
FUSE passthrough. It fixes RWF_NOAPPEND being ignored by sync writes.

It had to go after "enforce append-only", otherwise sync writes could
also overwrite append-only FUSE backing files, as async writes could.

Thanks,
Amir.

 fs/backing-file.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/backing-file.c b/fs/backing-file.c
index 5780f60662d07..c601b27f0fd35 100644
--- a/fs/backing-file.c
+++ b/fs/backing-file.c
@@ -115,8 +115,13 @@ struct backing_aio {
 
 static struct kmem_cache *backing_aio_cachep;
 
+/*
+ * RWF_NOAPPEND stays set in ki_flags.  Pass it on, because the backing file is
+ * in append mode as well and a new kiocb for it starts with IOCB_APPEND.
+ */
 #define BACKING_IOCB_MASK \
-	(IOCB_NOWAIT | IOCB_HIPRI | IOCB_DSYNC | IOCB_SYNC | IOCB_APPEND)
+	(IOCB_NOWAIT | IOCB_HIPRI | IOCB_DSYNC | IOCB_SYNC | IOCB_APPEND | \
+	 (__force int) RWF_NOAPPEND)
 
 static rwf_t iocb_to_rw_flags(int flags)
 {
-- 
2.55.0

