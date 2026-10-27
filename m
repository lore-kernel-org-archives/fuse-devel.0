Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793138316;
	b=vvITeKGUtVK2tlMp7BNyRR6gJXHbGg5xL105HI/yBq5uGh6wkrvWCHi/2qP7ujzR/yCD
	 F38wxdigQiBSGNZxH3ARgzopV0L1JTYdsoH64ut2mD8ilYkmRX04WGRVwWUAsXqtKIjJi
	 Z73CpyNYjwxhPT/iMz/LWftuQJ3YAaImo+hnWfHAJysQMO38YrAhlS8iL7SErr5fbfT1S
	 bw8Ik4H46Y0/kRAo/lmyQ7+/qOk3tHktB+fGvAXMYtRSSyVu7CNSTiplIgNAEfwL54tPc
	 XZyYhka8idUjvDprV7FBhJswNbnGdIG1xPse6gV64z8G2wqxdMkqhuM41vLL2ixFRzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793138316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W9OJQx+TcWNp0m+XcidattXlpUlog8C9yogSLSSgROM=;
	b=J+H9KtXfJ+CGrnjrAKbXfz0V0q7Zcc0p8OSTVSTc3bDdnZReRFMwW3f7+RbHC0xbB0sA
	 z4Q+GgnA/PrVE4IlbrXPD0kKGoG/SXlGTqqW/Kupnjcp897RVopvF8BAOby6qRapomadS
	 R8Aw2prSFh18w1ZBLsLN7WD0w3nhBJJHKtSZsNdS6vkfM1iqlfSu2SAtOb+ycBdP1pPff
	 5pRBbd9bQ1GSyEIeFYyh6RqG9Fqk1K/HOT89crjn/cNHtj+IOraurD/i1TfuIVpZ4h/W1
	 BL/jJJ5QLmi5cd03io7AeaaPv/uGXRh4iGHmtVQZ2LlM6h/4XmaFBu5IiKFmHSskoEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKRtCMt9;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4429606A31D
	for <fuse-devel@lists.linux.dev>; Tue, 27 Oct 2026 21:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4429606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKRtCMt9
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ab3d3c5761so2941667b3.1
        for <fuse-devel@lists.linux.dev>; Tue, 27 Oct 2026 14:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793138315; x=1793743115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W9OJQx+TcWNp0m+XcidattXlpUlog8C9yogSLSSgROM=;
        b=IKRtCMt9ERO1ofHuCktzwaMYkhZyAzH8+8Qkp4ufrYm3HbME8qZB9BaHAZhncZ3hb5
         DISVulWMV8t6JsOJlrRAG4xa2UijIm9jR24BDLjShFzq1nrTUEmmMsjch9Rg4hGiouTr
         NKDoRsXRUH47H8akhoMfvkQ1YykxDOWOsK++utlB8vVykDTLF7uz3GWXZ+NxXGlUSY1c
         mosNnSGmWWVvDwc+cqp0DFuaROTijG6i+dncZGDM3dxjs4TPWdyQuWevk1lE9IimqtoY
         iyLbPbSzhWClwAPU2d7+qQgFX7DTbCkZczje7WleIpZNXT3reGyojG516uHcIzsCj5aw
         BCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793138315; x=1793743115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W9OJQx+TcWNp0m+XcidattXlpUlog8C9yogSLSSgROM=;
        b=BBNAB8s7SktQzUxzATdVdx3RlzYsh6r32xrAcHDyEOjQRMt0fyMrgac2fgtgHP/swV
         6tYmg1mCs4emcbzi6neCKFi//BvwLgIvh/S07u5etpSD4kKLTG+hFTzG2BlS/wOd0hmk
         7xa1Z+c+yA4eWWwFP2p6PCaW4RkOuLI3tpNM5DQza/C6d0HfepBpXrmzBSL+OXtFL77c
         EcD9HGEox5WDD2l05C0EILEN0gIQSUbC1PzgE5tO0Ie/21VNk9aArmkFU/myKc22sLl7
         l0C0MkHJguUs1aRdily/lOWRr34XYVbdJWiCHPA3Uu+1EsoNUf8QCIQSC+eddjqH6vY2
         wqIw==
X-Forwarded-Encrypted: i=1; AKwUvBxx6HMsRws7PqIrdo24hhaSJ/Oe4r45iTtLy7f7rdF3pCNM/OG1frvXGh7tDIMwXvL7tFPclMrLrd1G@lists.linux.dev
X-Gm-Message-State: AFq9FYJQGaCsfdcWgSRI0BQy4RHCKj7P4e8DjylLUIVBT8y3/VR+IEtP
	zNeeZ1XZHHNYChTgKUdaDjq5vUty39F/DALuk9zVG36zjWpBTmdFRFxr
X-Gm-Gg: AYBFou3P0zHurHtlBjyJ/RIm8UdC6OSDaOU1Zz0H4uP5fBKda1jguKpapODL8CaxRnD
	c8JP7ihNd3lakicfbeAw0Mxo7yWuwnUHR3CA96F6BgfDB69+Uu6u9AFA/DEEQtyDvidis8YLZ9P
	lw8YFOS2ZHXiiy/qJvBwQWhJZudmrpCTh3PVjj2AQE0g8rqFO3qTSr1lPI2x9sUeV51CfLpTA+i
	iNgzwFIU/klW6OODiEHm1l93VkjSihguGq3TVUO34kL0FSyzwYQrcRHSHTVVlesZRajI1TZJZJY
	cduYoFbj+aC7wx2B62MJKiT94KFFD520qQHaLMfViWAe+3b7SZN4onY6x5Df9a5G41NMxrI4Drg
	mpNAhM2+95HmMLiKcXQumAVcwLkUu0NUKVg4zHUPHZIBLpNhiv5tmWjQXw90Vl10fJxdEb3zCjU
	0hfi4ZxgFAAxDnbYSOiSNqhygZPigop+6uNfDlLRh9/s977MqPmd2AMcI/qZy328Li/nMWqsfWQ
	eTjSyKl8jEwD6nT41C/lfzO1eIkWBAH3otQ0VrhTXlWA1+NDpd8OKyiE6UxSnqX2Dci0P7gE8eO
	w05lGuzDqp44Hy6GA7CzuBufhQEMRbg5
X-Received: by 2002:a05:690c:e194:20b0:8b1:7346:f1b0 with SMTP id 00721157ae682-8b1b5bbd517mr2470267b3.18.1793138314743;
        Tue, 27 Oct 2026 14:58:34 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5b::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e67cbf1sm18555897b3.33.2026.10.27.14.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:58:34 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	"Darrick J . Wong" <djwong@kernel.org>,
	changfengnan@bytedance.com,
	kbusch@kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	David Sterba <dsterba@suse.com>,
	Gao Xiang <xiang@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Carlos Maiolino <cem@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	libaokun@linux.alibaba.com,
	bfoster@redhat.com,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	linux-nilfs@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH 1/5] nilfs2: convert iomap ops to ->iomap_next()
Date: Tue, 27 Oct 2026 14:53:22 -0700
Message-ID: <20261027215326.2693300-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261027215326.2693300-1-joannelkoong@gmail.com>
References: <20261027215326.2693300-1-joannelkoong@gmail.com>
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

Convert nilfs2 iomap_ops to the new ->iomap_next() callback. The callback
is generated with the DEFINE_IOMAP_ITER_NEXT() macro, which wraps the
iomap_iter_next() helper to finish the previous mapping if needed and
produce the next one. No functional changes are intended.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/nilfs2/iomap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/nilfs2/iomap.c b/fs/nilfs2/iomap.c
index e130ed63abd9..359786c97f2b 100644
--- a/fs/nilfs2/iomap.c
+++ b/fs/nilfs2/iomap.c
@@ -67,6 +67,8 @@ static int nilfs_iomap_begin(struct inode *inode, loff_t offset,
 	return 0;
 }
 
+static DEFINE_IOMAP_ITER_NEXT(nilfs_iomap_next, nilfs_iomap_begin);
+
 const struct iomap_ops nilfs_iomap_ops = {
-	.iomap_begin = nilfs_iomap_begin,
+	.iomap_next = nilfs_iomap_next,
 };
-- 
2.52.0

