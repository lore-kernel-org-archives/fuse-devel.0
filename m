Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703119;
	b=sMHG8x8UoVn1/Kkl5f5sC8QiBw5A7EdB+589qQu9dZw3HHsRnSwXmR73FEUZmNPmv7H2
	 frlqDhVVPr2ds5FFf0dKBdXJ3XPJLE+ewaOtKSyp0TeZX7ndcfdDMBSqED0FBRfgABYgP
	 YRL2jb1u6UZwZy2ljIydvroqHU69OWnAjc0+UIzwPr1VSWsJwo7y+xiTP7tpsQiEW2C4N
	 pYIac4OG+1Nb1UtwXVIJf+mlCBnV1PasKQiTMUgMzv3KAuVRIrjqYzevk7M2HE5YO2Rgt
	 YK2EIBcsTHim5YglVpc7vdTAZEupOVRMSMin/lLKItnw6iVWN3/K89CDSARQivQ5lWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703119;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=5z7mUcsi2T90a60jOWHlHzKb6BIrXjBvNynJ5pMqL/U=;
	b=NLBHRZnd9W8LYzXcTK7qaHlPWSpuK9+FQFB9T6IVemK1hJnOF+r3fpzz7oT1a8r1GePJ
	 cUo9fAX5Td6t1FuaCXsk3eG34d67m/0xQYaAHBA3cIV+56qmY3o4bhiDeKLBqd05hZDr8
	 rZkU3qjAWk4rzdqVPCzbdR9yu10c02dOuxvi5RUuS0c2jPM8+cyxE7IwEL8ldIutOSqGt
	 x170jBSI6/sWEvbi7N6kuI82WicETqnKi1Cz1dlK+2m/K+I251KTwoE7ce23edUza044V
	 DR3Hz1arVAjM+3WRUhSRIzlzStILsThlczzgQ7M0Ig97mEvJW01MZX+Llmh3fDtWJ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RYXIh2rF;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540AC606A31C
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 14:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 540AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RYXIh2rF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795703118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5z7mUcsi2T90a60jOWHlHzKb6BIrXjBvNynJ5pMqL/U=;
	b=RYXIh2rFFca01QZHPkljMdRTfWC1c84ohpdHxaDjzQCJuqWKYu6F2/XQHptMNds2Qxj2P5
	vOA/lNfDXILFeDO/G9G6uoHEg5WZ8HwGBswBFgcPKPMVvbCeo13pg7ugoaankFTOwrFQGF
	2EtJkL/3X6B75qcOnTfhquEOcD/V5EQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-CjKTrhh2Nbqt0boBxGJKUw-1; Thu, 26 Nov 2026 14:25:16 +0000
X-MC-Unique: CjKTrhh2Nbqt0boBxGJKUw-1
X-Mimecast-MFC-AGG-ID: CjKTrhh2Nbqt0boBxGJKUw_1795703116
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4ab855a8c21so5609082f8f.1
        for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 06:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703115; x=1796307915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5z7mUcsi2T90a60jOWHlHzKb6BIrXjBvNynJ5pMqL/U=;
        b=hR4eDjrHnkT0ivI6TmpuSHeasYBEbMyFhGkdbIiJIyZbaRQgOoLk4G3nz82hO7QoCg
         uJ8HWoKff9h9HSjsES74YHLQUCOBhZvqXpZrYt7gtT2KfRSLbxai58zD74kZ2/OpYtm9
         /3rwTzleG06JvEi8nvftF3bbEE0LT8eNuvZBHML4zmQLBoJctur+pOzv01wHIM8LCIV7
         JEYZ2LFuIHZKgfRNQxlp2j4UFsxAYQg/yhknshvG1p5BTKmELN2kiMCqpZvkKdIwSz18
         qCWqSwLI/3gbqoGsRKfkEwiNq8qpFlXdcwyS7oaxJTjBNU6AFRsZY8wX/dG/VWut1jAS
         Qu9A==
X-Gm-Message-State: APuU4Z9vPXdubVzEV8CzoxwL+N5yKTwvbO7tMBSdHOETiQ/l7I9nlcX5
	4MNyZCqL8v4qK9APXnQCzIn/aAK1USf/It6pt5y8yUNaMM0qPfI3DtThOEcu9aGEIGUtoIvqFMI
	T8pdlIjcJHPjkze/pJVM3PlUjku3XZapasVb1xGe9NqqYq76b8K9C55DmkhmUBXHBYkFbRXtIYF
	P30KLAGM2DqZlCIE7+Ucoj2iSnHdd1vNjomiD33ACq/Ekf4Zo=
X-Gm-Gg: AZFdTZeN3KzmDhzVn9HnD50hpmyHhxw+pWof0u/OB9YV/6xy5D7Cnm4Md7rumBDPpsz
	98iSQZEwEjjAmaijbKWoRLO4uG6AzGprgWlZWXDBU3OD4XMZstyPMJhjV2NOgMWjW3SM3BA1pL4
	SlejUapcSolRzBjVCahMj2GxKCANyciQvaakMUFCQbzXqqw8zdN7QzREBSEyLDgITjyicsI6mDG
	Q9UayJTvRkng9UQ1xUvZ6CJwaK926pJHTfFoqWaj0MCTUyAgjNUOdnWmnMkabz5zLjrK8lL1brE
	+dlE4H+zWnA1dPACqIAWCPfLqYEYAO3oNliSj5SPbhllhTzbpqgGgyhXfYs3EKPjSoJv2ioO6VS
	5cFddoEibzmM1t3CjeWdoTmRjqTI2tzP5hyg1ZVcvC/1rIVcGFSoIaLFxv0+oq796Xodgmm+h5u
	scU7sb+u9WNpon/yA6ElRzLcnN/iTSacliEwqKI9DH
X-Received: by 2002:a5d:6f07:0:b0:4af:7577:65c0 with SMTP id ffacd0b85a97d-4af75776767mr31200516f8f.5.1795703115620;
        Thu, 26 Nov 2026 06:25:15 -0800 (PST)
X-Received: by 2002:a5d:6f07:0:b0:4af:7577:65c0 with SMTP id ffacd0b85a97d-4af75776767mr31200460f8f.5.1795703115060;
        Thu, 26 Nov 2026 06:25:15 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (193-226-214-34.pool.digikabel.hu. [193.226.214.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm40768370f8f.42.2026.11.26.06.25.14
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:25:14 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Subject: [PATCH 2/6] fuse: allow O_DIRECT opens of dax inodes
Date: Thu, 26 Nov 2026 15:25:02 +0100
Message-ID: <20261126142512.219535-2-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126142512.219535-1-mszeredi@redhat.com>
References: <20261126142512.219535-1-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: iI4nUAPAHMIu_VfHEgYWMrymi1ZvB9yKfeBrGA88Mtk_1795703116
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Set ->direct_IO to noop_direct_IO, as other filesystems do whose
->read_iter/->write_iter handle IOCB_DIRECT themselves.  Beyond the
gating this has no runtime effect: FOPEN_PASSTHROUGH is mandatory for a
dax inode, so reads and writes are served by fuse_direct_*_iter() or
fuse_passthrough_*_iter(), neither of which consults the address space
operations, and the noop_direct_IO body cannot be reached.

Document why these operations look the way they do while at it.

Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/inode.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index af6d9e0af190..20fbc99f3590 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -403,8 +403,20 @@ static void fuse_init_submount_lookup(struct fuse_submount_lookup *sl,
 	refcount_set(&sl->count, 1);
 }
 
+/*
+ * Address space operations for an inode backed by a passthrough extent map on
+ * a dax device.  Such an inode never uses the page cache: FOPEN_PASSTHROUGH is
+ * mandatory for a dax inode (see fuse_file_io_open()), so all I/O goes through
+ * the passthrough handlers and none of the generic page cache helpers can be
+ * reached.  That is why there's no ->read_folio here.
+ *
+ * ->direct_IO is never called for the same reason, but the pointer still needs
+ * to be non-NULL, because that's what do_dentry_open() and fcntl() look at to
+ * decide whether O_DIRECT is allowed on the file.
+ */
 static const struct address_space_operations fuse_dax_aops = {
 	.dirty_folio	= noop_dirty_folio,
+	.direct_IO	= noop_direct_IO,
 };
 
 static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
-- 
2.56.1

