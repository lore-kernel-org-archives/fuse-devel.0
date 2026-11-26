Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703121;
	b=k67nkf+ySsHPfCALUYN19ziOwajE9zEKMIkNV6S15mBGVTtql0c13YVL7Sg6z0yF5vnx
	 uC/Sn5Mg0ApEkhjT847gT4qXUz8UGXoLP6OqLNhSkAWEouNd+yb9lDuPG2ZhbrR1runwV
	 pd5W2659/xcVJOxWu5AcS98Rp5o85n5el836PCX3qBwffSHxZKrSpqRfG3oVpRNKoQu/B
	 zwcASnFYCc/tiw8Lp990O7Lz9QIJezM3mmpyPYQ07BY5L9fNRCHP3Sl40e3dTKjjijkVS
	 OkNJHG78Z84/e9I5yxSM5Jl7V1U5Xo81t2aDZ2LjP1n8Y5KNGIdw2nuu98RSqO8PHrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703121;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=A99IbHAmjGrj6/xzun6xFP2hXNEpxLSTrp57df4oj1U=;
	b=hRkHldgqmYSjURPmD9FpjQ9XESEqZ8KNpweohkArR8B1o5jKWp6JXtQnpphSDXjTzi2d
	 YcZ76FaeBDvBopBCNwKvOh2cLQIYNGXkZIcKa/6rjgSPGK45jGjiu3uqoEkV0lHA0VWk+
	 nsdWn3uFcLJjkkcotz2xpmJeOMwFHPZk2AaHFHitTd53XNmNEkGa1eF7XAfbFo4GnDePg
	 HlkbRvdKTNyBUEIS3MZKjn+LmjfS5BPMJIfJG3OL9k+wiP15sX9WVuL5bmrVi9qf76v6G
	 /Y3jVNkN7yG+96PQYVFxamaZcAajGVXSiIsEI1C7B1VGOLfETpf8ZqBr0GaIkIclMig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DDRgmea4;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6A1606A31C
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 14:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B6A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DDRgmea4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795703120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A99IbHAmjGrj6/xzun6xFP2hXNEpxLSTrp57df4oj1U=;
	b=DDRgmea42oMyo1op2cw5KYqIcGeiw/y5nGgc/ZIief7myQAhIkS5Doa2H+SS6BUOs9g33t
	ix3ddOAO2CT+AO+nKZHp6i8z07cMUarAsLVbpcvuM9wmlimbSrkEp0d5RLkaUohb+FIQCa
	0TeyzQSVz4YIAAXn4BqDGI0MyLVV4Pg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-dNIml39mMwqTua2EI9JoUQ-1; Thu, 26 Nov 2026 14:25:17 +0000
X-MC-Unique: dNIml39mMwqTua2EI9JoUQ-1
X-Mimecast-MFC-AGG-ID: dNIml39mMwqTua2EI9JoUQ_1795703116
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-499ca65ae87so3265497f8f.1
        for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 06:25:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703116; x=1796307916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A99IbHAmjGrj6/xzun6xFP2hXNEpxLSTrp57df4oj1U=;
        b=LgAF6VBag/Td75iEAkp+Lg0d5FA2ofp7HRU/QoiUSPnsKujkfGMCgq7ExwLJLKcNCE
         3cQ5rf/prX0MYU5F7WOyQlT2lt5xKnJ5sssNLpUuPaLSGfk5Y24XNmaHzHjUxV6qRwnh
         P8oWmpw5+CCUQzuRb+c+ZHsgEp5fKlLxEs9PrM6rGOgyrr7PbGlz/EOEj3OgC2NOoElk
         nSgbgKui1ZwodVJngxDhCxH/rolYZw7AWshSWBJ72R9BrZ20g91HigjzIilJNrn4FZpg
         nATq7llzFGIyXBV3sDldL1Qn4ashuqQuYMuxg8+o+84exrX44sTrhb1Z6OOEw6+IRo29
         dMMg==
X-Gm-Message-State: APuU4Z8bNyDCRzEJzFprb8G91p4/8ouObKvxqZZJ90NEdtpqh3UqPKk5
	RKn53Uc2zxAUjcDFAYfF5rtoevQFkEKrBmkQRqiyGcOM616vLhV6CeQV9X7F/WKbL70IfTz/Kv/
	p6it5B4QUgqjlXde8sauMZpY025U53vGJebxqCeehx0zumrzB1BggMl+6DL3Qxw3DVOzs0tgg0d
	b20HG7ujGIvyJcU0q6FA5n4jXwjMbrOQkYhz2YvZxC3n/f3cY=
X-Gm-Gg: AZFdTZejIHissTbMam3TicNfwecSL7TEnniX4t9f3t3XXPKi+yi3nIsfqG5CeTIoIij
	MvPYZso9kwMuMOn2E1iAlx+DAwWpCGrBQBLiiKjkd/GwzulNYWGNdmcnMTj9MKPY3r9XLyt0XDI
	LagVl+Fn/1AA6ODH7nugA6Ch6nsMNu180lholxD40RCjltVLJtZJGjJycfFty37fUNOf2Y+b5iJ
	TxHWGkgWMRqI8WQIbtkyAmFt2bqq4zoDSQAj7XIugxlzioeJcsl5N0Y7TFKaKbn96XMrxefiLJR
	DVf0bvCwq+kLhxT+csFndwRk/86aJI3cS9hSptScqWYT9JN/XlOnASg0fM4EXafqFmGmEsEgTgp
	fW+vu9wqdmbezqlH01v9/vMStRVVrEyPdJOSTinQJHKPcyjZ2Fja5P8heDCHUDUBXABdPEJRDLx
	zo+UqTbtTI6BkzGPXWgqBlPwun7SWxZ5dqcR3Cn4MI
X-Received: by 2002:a05:6000:2085:b0:49b:f7e8:6f3d with SMTP id ffacd0b85a97d-4aa579a93b8mr47975268f8f.18.1795703116293;
        Thu, 26 Nov 2026 06:25:16 -0800 (PST)
X-Received: by 2002:a05:6000:2085:b0:49b:f7e8:6f3d with SMTP id ffacd0b85a97d-4aa579a93b8mr47975210f8f.18.1795703115901;
        Thu, 26 Nov 2026 06:25:15 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (193-226-214-34.pool.digikabel.hu. [193.226.214.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm40768370f8f.42.2026.11.26.06.25.15
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:25:15 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Subject: [PATCH 3/6] fuse: don't invalidate page cache of dax inodes on create
Date: Thu, 26 Nov 2026 15:25:03 +0100
Message-ID: <20261126142512.219535-3-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: M33NQZsWqlovDiRrNK4hbT1uokirc_P2om-C8nK3yw4_1795703116
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Commit 2fbe4586cff3 ("fuse: add support for opening dax device as
backing") added an !IS_DAX() check to the cache invalidation in
fuse_open(), but the identical invalidation in fuse_create_open() was
left untouched.

Add the missing !IS_DAX() check for symmetry with fuse_open().

Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index af1d91c7a181..8cbaec16497d 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -934,7 +934,7 @@ static int fuse_create_open(const struct mnt_idmap *idmap, struct inode *dir,
 	} else {
 		if (fm->fc->atomic_o_trunc && trunc)
 			truncate_pagecache(inode, 0);
-		else if (!(ff->open_flags & FOPEN_KEEP_CACHE))
+		else if (!(ff->open_flags & FOPEN_KEEP_CACHE) && !IS_DAX(inode))
 			invalidate_inode_pages2(inode->i_mapping);
 	}
 	return err;
-- 
2.56.1

