Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244F538D3F1
	for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 20:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782334340; cv=none; b=R6SKEiOsZKzxDQ0xmA3GrIs1gTAXw36RE9gdnlxE3EoC9kSGo1qZp5TRIl1RVxbaUAMdhanFlDVg2L+klQD2RqIovUWO+jlfOpr0w0dPTYm6OKfvUcoemien1GQAkJ5gUi65vBwcXYpcdDfHXbs3YUaV88bgCRZ/y1xlpN41pz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782334340; c=relaxed/simple;
	bh=fOk2uLz0kp+du9hIijEy96gF+mn97snUxPEaHV9jQ3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A0FzCScClNlgtnTfnnjjd4kxdji45g5dKQSUjMKMaNkXdd3ZZHY9s85gSmJVi2la7e89V7QeZeAiOUuIvTaRYGgX1nDf1O+mRO7RkKma/8sPNIdc8GFA9+QMlCo7fQ+S8WmNyZUqmBYQVo+Ba5cPhcK1FAN4GOzMkchhxR21VRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGRXG7vO; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGRXG7vO"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-44747d96185so867929fac.1
        for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 13:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782334335; x=1782939135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cT8XyovIujOpRgJEtF3RzCkx+q1q0m2DrqWUvg8EN24=;
        b=GGRXG7vOoxs2z4JScvhoTamPprKVP3MnoPef9sluwG1ubPOgIOJrM8C6wrYFMNQW1j
         G2AAwT2KvwUHoazkREfa+zm+LiX1nQQeFoZpoQrFVrb/5uwArlOUwIWeXZ4u/Dvh+B9X
         fOpf6/jObqnfEEYd6mFcqRKWGVNfelo0VhCBhqArSrZvAP3v1eRA2CmISYSeGDWpMX/m
         Yrx2ZBuzFtYYaUTGPnItawEQl4DkANBKeECbBd8cIrG7uO34gaFk0HoBWwSCguXt2UsL
         9S4ItQ0r9GLmoVJA45dn6LmnFPvvBh7MigsjEDz6OxDUtuPk+Xd31klDvBtj/iWe4yG3
         nYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782334335; x=1782939135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cT8XyovIujOpRgJEtF3RzCkx+q1q0m2DrqWUvg8EN24=;
        b=dNaXfqxDPMvdeA2UNioZLWQmWJOOKrHTsRBMAk9FrwJorHp3yQaQn6W+vyHx782dhe
         nwhyhDBFHFmRHNERK8jRqoKdtDIwIUWemWPT/fBeipwg+cHyRTZGEwBLH/+nPJpJIr84
         kyje+CChthVtwbkMTaH4GYYv4J9wpFMQEknPON5AplMhzT1ukb/nnEE3EBYrm/CXJ73R
         Pxe7iEv+xXxrKS0pTywom8Rpqi0pxZ9xfbu8/DDGIElbwE2tooM8EJa8jIiSAkFEW7aZ
         s/kXImC7m5aLP6txCCyL0AGlCj00s89BU8+BCbe6bAFErMEO/cWO1NcweunszdR01ng6
         vSoA==
X-Gm-Message-State: AOJu0YwbyCD3E6k1uPtnRRl1vm+CuJrquNA1ay8e8BQ2ldYggg+1zZm+
	AXAPYpDlr7nyjqWO5ytyxT32MR35zQS2y+W1djU8etgvtJcCY+f8pDM2hKubnw==
X-Gm-Gg: AfdE7ck36GozLdvYapEVcacHSWL1Bb55X+xfRkKUqPDPG6Lhs1BrsX8vXuw3iIpJzcC
	4sUXV7KjQaPTh4q8CGAMxQX3uLW7AUMZrVMnDJZBnXSLtQzay3vGAkM//W338Hvn9znv2/UhCo3
	D3rq6TTJbDrQu1FdDoRFlsjB45QrmiLrStaupWqEVfM1r1XcGCykYsBmLTHjizLx/Z0RCvHEsJM
	t0Eb+WbjVEzBLexwOkiPUzWHSPg0TYNBFSt6oiksb10enIE7WGxZWfZdny1emgNKEhCYJgfsLmI
	+H1BeHQGBTXz8AGoJodQZDhcu5rrGyd+ZZT1aJhyZD/w9WhtIgTlQ8MWcl8K5gP98FhNmHg24KV
	3iO1LAZygG67Mohl4wLDfMmmq8aAg6DbkPs7DzUIdBHmqXcD/Xa1jOwgtwt5hl0ritQujgXEBio
	0eVYPqFrMNMLWI9N4vep13D3berJoYNSQ6tOw2K0IURBtif4mzVZ3ixoPykzkjNJtd
X-Received: by 2002:a05:6871:890:b0:43d:7b24:95 with SMTP id 586e51a60fabf-447dc653ffbmr3634916fac.0.1782334334934;
        Wed, 24 Jun 2026 13:52:14 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5d::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44778b6159fsm7756695fac.11.2026.06.24.13.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 13:52:14 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	willy@infradead.org,
	hch@lst.de,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v1] fuse: don't clear folio uptodate on writethrough errors
Date: Wed, 24 Jun 2026 13:52:01 -0700
Message-ID: <20260624205201.842714-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the writethrough path (fuse_send_write_pages()), if the write to the
server failed or was a short write, the uptodate flag on the folios are
cleared.

As explained by Matthew in [1], this is dangerous because the folio may
be mapped into userspace. The mm code has the invariant that a
non-uptodate folio must never be visible to userspace (to avoid
potentially leaking confidental information to userspace) and has checks
in place for this that if violated can bring down the whole machine.

Practically speaking, the effect of this change for the fuse
writethrough error path is that if an application does a write and then
the server fails to persist the data or only services a short write, the
page cache folio keeps the data the application wrote instead of being
reverted to the server's contents on the next read. The failure is still
reported to the application synchronously through the short count /
error return of the write() syscall. Folios that were only partially
written are unaffected since they were never marked uptodate in the
first place (fuse_fill_write_page() only marks a folio as uptodate if
the whole folio was written to).

[1] https://lore.kernel.org/linux-fsdevel/ajtPMgO65FA1TXhi@casper.infradead.org/

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/file.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index cb8da4c06d17..c4ae4009a423 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1227,8 +1227,7 @@ static ssize_t fuse_send_write_pages(struct fuse_io_args *ia,
 	struct file *file = iocb->ki_filp;
 	struct fuse_file *ff = file->private_data;
 	struct fuse_mount *fm = ff->fm;
-	unsigned int offset, i;
-	bool short_write;
+	unsigned int i;
 	int err;
 
 	for (i = 0; i < ap->num_folios; i++)
@@ -1243,24 +1242,9 @@ static ssize_t fuse_send_write_pages(struct fuse_io_args *ia,
 	if (!err && ia->write.out.size > count)
 		err = -EIO;
 
-	short_write = ia->write.out.size < count;
-	offset = ap->descs[0].offset;
-	count = ia->write.out.size;
 	for (i = 0; i < ap->num_folios; i++) {
 		struct folio *folio = ap->folios[i];
 
-		if (err) {
-			folio_clear_uptodate(folio);
-		} else {
-			if (count >= folio_size(folio) - offset)
-				count -= folio_size(folio) - offset;
-			else {
-				if (short_write)
-					folio_clear_uptodate(folio);
-				count = 0;
-			}
-			offset = 0;
-		}
 		if (ia->write.folio_locked && (i == ap->num_folios - 1))
 			folio_unlock(folio);
 		folio_put(folio);
-- 
2.52.0

