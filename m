Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891396;
	b=o7bHr4kQi2bpo1zHP7sLtirvldmfMJuXsduk9b675q6Zvd/Xzt/ChhiaFGUobGQvG/7Q
	 ZkH8JDXYP5XWbFnr/lGUlllU06SfgSNVAN8Ol8e3+lImGs+2Vf/qE5vkhdp9s0kd6tsD3
	 vc/Omzo6Scc+sJmIEQO0UL3QqTgpAWIik/HZNDCRyhKPBLsmm5/cuMAUJBWiLBYNHk1LO
	 OiREXMHmYa+FfkJKXbHLlAOQBL4iiBhbOHoJtMCcLAAOxrTiBtXk8o8rCn+HOgZg6m/Iw
	 h09DCG2pFaycXC6j7NZ/POXGYpEbn1jevsP6b6sPjRkx5x5YXks0HOOtAy0MlSQBHYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891396;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=KphLnH6Y7Gp74AYUkx+0gciVD76K0BIzunIfeqpjC3k=;
	b=NnEBCK5LYb4jEBE/TzYEZbcQKOr4zTzAZySEFgjjvsSuQr7CgeNQtjSrLU4PTED0AsbR
	 xOM+QfHJmyUorHqMfQ39+gVm7i+iNCpqvZWMge77MgTyjFl+pB+mFWjEaUqxvXroYaSTR
	 n1VzPh/z5xo0BTz8Mi3dk5NA0qk6RojeuqcecxwxH3H+2zU0VFMglSJx9yMDnBdDgGpmP
	 UBo5kmPG8P1ZLv9WQHd9D3zISW2SCYgh7WxgAtvW1pK1UkFNbwK2gLGw9YB9lu+NCqMrk
	 5XEXrK+LSV3xq7F9jZvGCv1Z765Nhy07I9SQqjg7eQZB6Cx3l0XuLgk1/HBBGFVVJww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MIDBNJGs;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF52606D82A
	for <fuse-devel@lists.linux.dev>; Thu,  5 Nov 2026 15:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF52606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MIDBNJGs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793891395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KphLnH6Y7Gp74AYUkx+0gciVD76K0BIzunIfeqpjC3k=;
	b=MIDBNJGsSMXTpEnEXbF/cqW8RidmhIwI5mEDOq2f2e/F0JxDJzIqGpxmzx/dQt43HUkwD1
	iDGCzz1leNulZANrBgVVdyWqa8Vt1pxnQz/OBOuuPt6dWFIa9sI+f2tSOhVf3UJzQ86nTV
	vcsYIGwo31Or1BsSA9p49+IJApIgN38=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-xhCFg18PPouflkvz47Vubg-1; Thu, 05 Nov 2026 10:09:53 -0500
X-MC-Unique: xhCFg18PPouflkvz47Vubg-1
X-Mimecast-MFC-AGG-ID: xhCFg18PPouflkvz47Vubg_1793891392
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a4654add56so18435085e9.2
        for <fuse-devel@lists.linux.dev>; Thu, 05 Nov 2026 07:09:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891392; x=1794496192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KphLnH6Y7Gp74AYUkx+0gciVD76K0BIzunIfeqpjC3k=;
        b=t8zHU0SbBFUH1Y8SXB62hgGRuavmI/Mu6tSJGk33mziA04Odr8HPJlXQC4f1/ifJ/j
         NLj+OK04r1R+YISRXlBG/vVbL3Xkuf2DbqgXoy/xV1R/fTv3fkj6ZUFdDBbzSeOAQ8Gw
         Bx8tYdcT4bs0RANnQkUHBSRod68MGBrtj/Q57AtgJJusTv6/Ui4qj+2SD/59sePS+KpW
         YV2ACT9B0o5O6kMRukcu8EtBd6SeZw9meDxEnoi9Z5OmhaYtNomnhU/fx1d0dySyUujh
         nD2r1epo7D4Bkvo3p48GHw7u+6soue9BReh992HGI8KyMwLKE9Pm9Jjf2lD+hYOri4qU
         FQLw==
X-Gm-Message-State: APuU4Z9B5C+h0lpaueUQTi1mW2HNcBKyzNYaSOTZn3M9p7aGyowCcTya
	2nAQq2Qi7dJVDM2ldO6Wm1xCg2OQP0ra3A7oE2rBlsC7yTlu+P5f7PkSadtj9RMT1nRczXHYMd5
	y4xlrQ3Dnvw8TBSuOTOmJCR+DQxa9MU0SPzWJayN0J/QrR5UowTi+Yl53/2BfvX0Ebve8enswsj
	6P0ksZB9iVTiXnmetohGZl9Ld8RmJEINC/BGCXj4a+LevM2WM=
X-Gm-Gg: AYBFou1/6/YjNJo59RHOucTbiA1IzyD9SmXMP3kiTxFgtZM3Iyn5kdNNobbgY5qKHl1
	HqgGeofJmTTKz98QKTTE5YelUIkIUaPAe2ex8V0TPl44kk9I64A7+Vd6epOK8MtbtgDtyf68Myg
	b+SM06B1B/mqS1t7U6HyEWyPw/l71SMAyQKDDN9A1QEuJptUPj+Qti33DinJ57pUsmrzLctZnHg
	U6OpIBfNwajw3zK5cZV9VLXWtjO2JokcK0jHj3j1u23vYnzkhSby7C0Mn5I0ClsX4eosvM8v5zS
	+CTLUcCRZLxlflk5h5LAdDTack35Wd7+X5qBbWfNbXUKh9f0q3yOcIpLkf8HtWjC9smzmnKrNVS
	cxOboj0GA1Iw24MPM9n9Wyw9uQFecCAnt6aDIEARqBzA3qZ7m2sV6hydqgy9Dure5b8g100+1vY
	/TPj4PmTnPCM7xkNZv5S/Y7EENy3tyfeGFOWtaDAFe5Ow=
X-Received: by 2002:a05:600c:4e02:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4ac1228b10amr437949985e9.0.1793891392469;
        Thu, 05 Nov 2026 07:09:52 -0800 (PST)
X-Received: by 2002:a05:600c:4e02:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4ac1228b10amr437949535e9.0.1793891391973;
        Thu, 05 Nov 2026 07:09:51 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (188-142-154-142.pool.digikabel.hu. [188.142.154.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm9961340f8f.52.2026.11.05.07.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:09:50 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 3/3] virtiofs: zero the reply region of the argument buffer
Date: Thu,  5 Nov 2026 16:09:42 +0100
Message-ID: <20261105150943.86650-4-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105150943.86650-1-mszeredi@redhat.com>
References: <20261105150943.86650-1-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: _vjcWORMYntvPvyhkehgz2mN71rWVsNjkPwtHcDScCU_1793891392
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

copy_args_to_argbuf() allocates one buffer for the fixed in- and out-args
and fills only the in-arg part.  The remainder is handed to the server as
a device-writable buffer, and the server is under no obligation to write
it: the used length it reports is its own claim and
virtio_fs_verify_response() has nothing to cross-check it against.

A reply that declares its full length without filling the buffer makes
copy_args_from_argbuf() copy the uninitialized remainder to the caller,
so a server that fails partway through writing a reply returns stale heap
contents from e.g. fuse_statfs() or fuse_getxattr() instead of an error.

Commit 5364d081125a ("virtiofs: validate fixed-output response length")
covers the case where the declared length is short.  Zero the reply
region so that the remaining case yields zeroes rather than whatever the
allocator last held.  Only that region is zeroed; the in-arg part is
overwritten by the copy below and the buffer can be as large as
XATTR_SIZE_MAX.

Fixes: a62a8ef9d97d ("virtio-fs: add virtiofs filesystem")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-f0d6d4a3-f5df-4f72-ab09-802e5aab49a6
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/virtio_fs.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index c824916f0a9b..cdd6f5c50d6d 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -701,15 +701,16 @@ static int copy_args_to_argbuf(struct fuse_req *req, gfp_t gfp)
 	unsigned int offset = 0;
 	unsigned int num_in;
 	unsigned int num_out;
-	unsigned int len;
+	unsigned int in_len;
+	unsigned int out_len;
 	unsigned int i;
 
 	num_in = args->in_numargs - args->in_pages;
 	num_out = args->out_numargs - args->out_pages;
-	len = fuse_len_args(num_in, (struct fuse_arg *) args->in_args) +
-	      fuse_len_args(num_out, args->out_args);
+	in_len = fuse_len_args(num_in, (struct fuse_arg *) args->in_args);
+	out_len = fuse_len_args(num_out, args->out_args);
 
-	req->argbuf = kmalloc(len, gfp);
+	req->argbuf = kmalloc(in_len + out_len, gfp);
 	if (!req->argbuf)
 		return -ENOMEM;
 
@@ -720,6 +721,14 @@ static int copy_args_to_argbuf(struct fuse_req *req, gfp_t gfp)
 		offset += args->in_args[i].size;
 	}
 
+	/*
+	 * The server is not required to fill the reply region and the length
+	 * it reports in the used ring cannot confirm that it did.  Zero the
+	 * region so that an unwritten reply yields zeroes rather than stale
+	 * heap contents.
+	 */
+	memset(req->argbuf + in_len, 0, out_len);
+
 	return 0;
 }
 
-- 
2.56.0

