Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890462;
	b=qTWpF4pIUnvc7PmnDRllbNEePGpJYbuZOr+rI5gEN+UZUjve1MUTncn8RrvL1HW8Hvpy
	 REVM3UOGQMFVgkw/C72Kbsa+yydlDKrbPe56cKD8jc0GsrBbfEG21/GiWKeIv1dCetH1L
	 kKJ7su7DRjQAEiwvSElt9C3dD1wauuJedxeFvDyQPX43nTJYYYk5QxhQKfMbRDYjUpm7A
	 /ydg1WiIuoHZtAkl6/GGHBZSTvwNnb7G1tIamcXlh/cztvZG6aflZZL2kOnRkydtkWuEu
	 MalMepTWf6wnB/3AiyIiDicagQRTD0nIqIVS+qmVaE9h1xnpQklDhsxuaN7MdoTQHWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890462;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=/tetdvrV/tX49PAB2yW3PjQQ+4/eTQMA0Y0xkbWX4Mg=;
	b=kwyujyI1w1wEPDu3rl8o0IZh3Zr3+TAtvTPsyp308L5HjIRLV8fFnEmg7uOdU3o3efQN
	 yc16ohBTflpWA9iaMIr+VfNXxcNTtwNxWqSs+mGgqwKibB4lwIDJ6YnX0iCjirixbrt52
	 IS/Yw3Nt31Gqa3GZ4Vw+rW/5zRWuaKaenDnzlSgSa7HnV+6GYexSA0dZ44T2YUr0JZ/35
	 Ff2OrppITg8L/gJBdEprfXoag0rrbWMXAgsQm+Bb13khLI0QJB9u09xB8o77XC+s/soNv
	 sNf7/qWyLCi2cxYx7qtCt381VmvXOmi9uD3/Tv6W75nQMBfHTJOc5yGa4QbkjgaGinw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HXH6krhK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16D3606A326
	for <fuse-devel@lists.linux.dev>; Thu,  5 Nov 2026 14:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C16D3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HXH6krhK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793890460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/tetdvrV/tX49PAB2yW3PjQQ+4/eTQMA0Y0xkbWX4Mg=;
	b=HXH6krhKyxmuQvQ53kJMwFCHhm0Ii7x9AQKsWOzPawUntCMEsexN6d/BtqA47+p/dlIfdN
	FThL6wOVwDL6A1FesHl4E6nu1ZUoP+InKvPeNpGJMsAhwpyCw5woEtSabcw4ZKIS+zM5M/
	gbqRKmaEhD9ZZ1PAql7vsyo99e+FCro=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-BiOAiyzzPHujugkQ2ehXJg-1; Thu, 05 Nov 2026 09:54:18 -0500
X-MC-Unique: BiOAiyzzPHujugkQ2ehXJg-1
X-Mimecast-MFC-AGG-ID: BiOAiyzzPHujugkQ2ehXJg_1793890456
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e00f3929bso504219f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 05 Nov 2026 06:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890456; x=1794495256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/tetdvrV/tX49PAB2yW3PjQQ+4/eTQMA0Y0xkbWX4Mg=;
        b=dzeh6Kv7z2SF2XDOKgAqthpS5InZMccjaDcBsS/gkMs66tbbcVVo0HgHAOaL1uM7Tq
         cF0SoNvK5OD98X35Bhc92TdA2/bsvyzdu1V17eToZ1+FIvFt60dD0BD7UGUyZJWges0Y
         T46I1pxsSynp/ifIEw+zn0fBUvuA7nKcX5+xlhgcY9YvI88eThVoE/GpTTfJzLY3+9xn
         eSPglVUucopqZfcE7NUsH71h1+DiM5oBLkJg4rAaSE7o/vnZRda6gKbj22JM5Y5tMVvi
         z2UTLAgQc0EintbLZ22rvfYy1fpjo50dN62nXVRzjrzYrIqtHt+fQh05duGmZU0INu9s
         gpEQ==
X-Gm-Message-State: APuU4Z8iTmdh6tjACLe6uzBYvfFHuDVwRKGyTCJMsKWvNuBRZB0XkFyJ
	/Ue4wOz4ENECigNMJ9CC3fdutlFCJ9fZORUwVMZ0xNc6H1m6mQzhqDD53Hrg466zEiDnGJnui7d
	JDc0/RLJSWeetIMQAnRDIqZZFB8QxsTOd7mwbneuxei2IzSMC+tKBuBUe7gsVWgtWYKnnokIAn+
	a9Xw8Ft0a4DKdo8swD9b449VXXzJvqXKki998SRls9znlK2oQ=
X-Gm-Gg: AYBFou3L+YdvR419ZyI79qqNNO7STNEKBzgukwlvzb6eZ+e8YWgk/5Th6+UL2yAEKKV
	pS/ViT3XBX+y4ZZ0KX1QqxfcJE0IP5dfrIChqz3k8fQKom6fVNNWU5NP830+mE3AToK5MxRSYw+
	EA7HU3CDWmfbjDAR4VJaedMcVRTrto/VOpBMKbVA8pjBhr1NJt3v9z5FSI876AhmzYdSwzhCvtz
	0lZ0uEdc6G3QGAEWzw5r1+Mh//WG2VQl409AysxEOGUuv5ZWHjDYSUNCE0I2xB/5heCWGUgDRcC
	deV+Mc+19sLLKx0O5uax7b+yiBB3KolYPPaRIuUJ4ZFp2/nJrSkIqWUN0HFvm498b9G4BgPs0iM
	gxaUMsCdRT2fB+0qP9KHzo1FiKNVoCwwkMZgf7P1wu5VJDn25afN5zMp1jano6PNZn8Odf+YZro
	SyPwG8qu2ra8uTyRPspvyawDEjGEREGdqe3JMIFekIpoI=
X-Received: by 2002:a05:6000:4618:b0:48e:884:affb with SMTP id ffacd0b85a97d-4911a7758f6mr4950250f8f.24.1793890456341;
        Thu, 05 Nov 2026 06:54:16 -0800 (PST)
X-Received: by 2002:a05:6000:4618:b0:48e:884:affb with SMTP id ffacd0b85a97d-4911a7758f6mr4950217f8f.24.1793890455902;
        Thu, 05 Nov 2026 06:54:15 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (188-142-154-142.pool.digikabel.hu. [188.142.154.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed08536dsm9296429f8f.32.2026.11.05.06.54.15
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:54:15 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Subject: [PATCH 3/6] fuse: zero the partial EOF page in copy_file_range()
Date: Thu,  5 Nov 2026 15:54:07 +0100
Message-ID: <20261105145412.83058-3-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105145412.83058-1-mszeredi@redhat.com>
References: <20261105145412.83058-1-mszeredi@redhat.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kSnzPSckIHpVB5w8qm99i3FWanPk9mQ_ibu6k7qwPd8_1793890456
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

In __fuse_copy_file_range() extending a destination file across a hole via
copy_file_range() fails to zero the tail of a partial EOF folio when the
destination offset starts on a page beyond the old i_size.

Commit 34b5c4a6e4fb ("fuse: zero the partial EOF page when extending a
file") already fixed several cases of this bug but missed the
copy_file_range() case.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/file.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index d5e1cb53d86a..f09a0a348a1f 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -2999,6 +2999,7 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 	struct fuse_write_out outarg;
 	struct fuse_copy_file_range_out outarg_64;
 	u64 bytes_copied;
+	loff_t old_size;
 	ssize_t err;
 	/* mark unstable when write-back is not used, and file_out gets
 	 * extended */
@@ -3023,6 +3024,14 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 	if (err)
 		goto out;
 
+	/*
+	 * Copying to an offset past EOF extends the file over a hole.  Drop the
+	 * cache over the newly exposed range before the new size is published.
+	 */
+	old_size = i_size_read(inode_out);
+	if (pos_out > old_size)
+		truncate_pagecache_range(inode_out, old_size, pos_out - 1);
+
 	/*
 	 * Write out dirty pages in the destination file before sending the COPY
 	 * request to userspace.  After the request is completed, drop the
-- 
2.56.0

