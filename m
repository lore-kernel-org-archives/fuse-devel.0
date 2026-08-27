Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DA6352F86
	for <fuse-devel@lists.linux.dev>; Thu, 27 Aug 2026 08:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817727; cv=none; b=EInjjSJUN51LrhKer2dwJeRvuWOtZyQSKL4yKKgArlrmTcYycBUtU5TXyMR983Cz+iUe+Iz9wikQzBMy5Fplckxf00/vBX7TDhVdYK5z7MshRiVJlIah0GOQimthUQJzzPTM6v8Gg/Ie49B/BTXUDjCClbd2ys7jTlnlrQFxg48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817727; c=relaxed/simple;
	bh=uqHAQV7EETwazy+Xw/+c7ZzgkrF/jvLFvkyfQ0hQQi4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=jOz9LGZ/3qp2ZE9O//Lquh8Tzo0zKn2UOKf1quuTue+GMKRn0UhtORMTopLTj7n/LaDdoKE5bT2+w2w9kWT5v2RWRBKQN+mD5Oxkh8JRqMpYuVua9CJdi62WOhuhbXq6SQ1auI+xqBWlX27QvM+RcjglIab8DmR/TnE107T9B+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HArN/UyL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HArN/UyL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787817722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zbBLx8hEyuOm0im7JZMqXQKaQHy0YO7p4l7Jcaywfws=;
	b=HArN/UyLDrT8rzluMmOaBUI2IqpJlAHP1LCnJOZbfV6so6fwe63kRFaiTQsJ9h5j2Vo1Ui
	1+cp+JzTwUcB3yIjQV5XbbvXbC+mm2MudFZwJKhy4zt+N3Lj7wCFzVHbVhxWoI5RpY2H8I
	f7yfXyme6f8TGBKwRLrb644xGj6OTtM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-VUxusWjiPkuLKqD1j1uzaA-1; Thu, 27 Aug 2026 04:02:01 -0400
X-MC-Unique: VUxusWjiPkuLKqD1j1uzaA-1
X-Mimecast-MFC-AGG-ID: VUxusWjiPkuLKqD1j1uzaA_1787817720
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c25148e933eso137920966b.0
        for <fuse-devel@lists.linux.dev>; Thu, 27 Aug 2026 01:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817720; x=1788422520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbBLx8hEyuOm0im7JZMqXQKaQHy0YO7p4l7Jcaywfws=;
        b=J5DVbzjdi3yWHKjpKhOQAhv2ntDU7EolLFgj0ol8EXBKMDgyN1bGIscsjAh63X7XsG
         j6+ZSSmC0rcmsI1klchJ0/YY3oIqssBcH7dRrwjlsqFtgoNYlHFkkmitB5c5xADuwoSI
         QOdJnUf28XB9gALgKtooUs1iX0XJuk59g8ehdFByZQ3oec2aepMJi2XECD9NPB1+/vTW
         jywV8yp53N8Ps+Gimx5YqQWjuKug4CMjpw76jjmNBY9iCRYPkxdhJBEf0siAw6OMlVTP
         yNpv53/X0Xu8N6g3kgSq/T7338rnhDUYoBZwN+0gMPZl55uepu6cgMnbfJshQkIPozOP
         g/nA==
X-Gm-Message-State: AFuF++nFflKWUXWVlcV+zj+fYV4GeJfPt2/waoU/FsRpEWU0w9E8YGqS
	pZVUJCPv7R3GwtecqB1MSu71n5JdWvAIbSd361ZZuYb4FczZzFo1dlagxoqg9AgLtUDW6ELsdnG
	8oIViETMaVSXMVMc9hoGLsa/8cfSZ4QwOdqnAuhXFrbI9gAOl96TEGIXF8zb9pocT80x+lrZ9jw
	ZMcjpTDVn+Yq2BsgItcTbGzGm4M54f0GkJ6MzYnx1+euqOAvY=
X-Gm-Gg: AR+sD10AR45dctThQZJ9taHIjuTEcyL3T11+1xjs9nWBmpn6y+F4Gs+Gng1ocEyXwrP
	qx+ypbR39V2bEP9io7Ct2++OsfcPZ3qR4wZ9x05PpEFpevipvGYlNFcwRYT8+gH3fKf53HMnNjS
	C6w4SfXeFzjbDLxXxuOfQmctVmEcm8tajwqA+kC55G+QIAQhGbl9tursEkC1wcLpcazh4sut/u2
	cXqQQYYrMDFtdpanEnv9FvTgm6JCgBIj20EzOjzh2KDUBMQro7rvSOtmtOCIgj1gG4hLIrGqD68
	vAMvu2oMY1rcRLD2EHiOPD8XBWjbQK7iY7EhSkyt/vgDvW3eZp4VpXNqKt2bVfF2t68A0Pr3Fok
	VdW12CN91jBX1CGLi7REVHQiwaq6M7qRr+MfJTgZ1DgY07vTBo+TLDGlYx0A=
X-Received: by 2002:a17:907:7203:b0:c20:fda7:1856 with SMTP id a640c23a62f3a-c250bb76be9mr1278459266b.8.1787817719973;
        Thu, 27 Aug 2026 01:01:59 -0700 (PDT)
X-Received: by 2002:a17:907:7203:b0:c20:fda7:1856 with SMTP id a640c23a62f3a-c250bb76be9mr1278443966b.8.1787817719283;
        Thu, 27 Aug 2026 01:01:59 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (193-226-213-226.pool.digikabel.hu. [193.226.213.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a72d6dbsm625485366b.24.2026.08.27.01.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:01:58 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH] fuse: fall back to copy_splice_read() on FOPEN_DIRECT_IO
Date: Thu, 27 Aug 2026 10:01:56 +0200
Message-ID: <20260827080157.1000857-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mrbv2uvNPjEj2O2iwJ9973-ZfWhcw8-VLT4tIgfJHEc_1787817720
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Yafang Shao reports:

  "After upgrading the kernel from 6.1.y to 6.18.y on production servers,
  some containers failed to read lxcfs data. The root cause is that our
  lxcfs is still at the old v3.0.4, which does not include commit 25982f5
  ("Set the file size to 4k") [0].

  Between 6.1.y and 6.18.y, the FUSE splice_read path was converted from
  generic_file_splice_read() to filemap_splice_read() by commit
  2cb1e08985e3 ("splice: Use filemap_splice_read() instead of
  generic_file_splice_read()"). Unlike generic_file_splice_read(),
  filemap_splice_read() strictly checks i_size and refuses to read from
  zero-size files, which breaks virtual FUSE filesystems like the old
  lxcfs."

Fix by using copy_splice_read() for the FOPEN_DIRECT_IO case, just like the
VFS does for DAX and O_DIRECT files.

Reported-by: Yafang Shao <laoar.shao@gmail.com>
Closes: https://lore.kernel.org/all/20260706025705.58301-1-laoar.shao@gmail.com/
Fixes: 2cb1e08985e3 ("splice: Use filemap_splice_read() instead of generic_file_splice_read()")
Tested-and-acked-by: Yafang Shao <laoar.shao@gmail.com>
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index fb5ec00dab33..c6b6da395cbe 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1874,7 +1874,10 @@ static ssize_t fuse_splice_read(struct file *in, loff_t *ppos,
 	struct fuse_file *ff = in->private_data;
 
 	/* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
-	if (fuse_file_passthrough(ff) && !(ff->open_flags & FOPEN_DIRECT_IO))
+
+	if (ff->open_flags & FOPEN_DIRECT_IO)
+		return copy_splice_read(in, ppos, pipe, len, flags);
+	else if (fuse_file_passthrough(ff))
 		return fuse_passthrough_splice_read(in, ppos, pipe, len, flags);
 	else
 		return filemap_splice_read(in, ppos, pipe, len, flags);
-- 
2.54.0

