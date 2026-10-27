Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793138319;
	b=DGGTIFiVhuJP0B6x+oTufKIzsS3GLOseoKHbl4fMthvnGqhR+opfn0cSvro0GQZ/r1/u
	 qdTdGHS13PaQZkU7O5ybfJDi5fg4FX89Np/YTYpioZtb5iQt+y7HpNqWUtQ6zHdL9Yo50
	 yrNgKLYPU/gIcWi42nyWhKjqlS2VxyfRewEYGtaxTUds51iZBNuhdg+X6xuvkCdpr9+4b
	 iVT7r7STitBQaNqxcK+4ORQ1ef64456MCP/PeKc1ZX/qXiODfAkgvY+yP6A/y41s5gItM
	 6JWUQRLj93g9eXX/AXfO2pbxRFjTew3R0dUA8A/oWmIK7bCbrhH79JfNnWxfOHl7SgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793138319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iqfPoWTkUvjEoiyLTnmr5mj5KovsR6sHRhbPRdxo4UA=;
	b=l2iPbrEAsdsiMkaY39a81X1DS/7KKF+Efu05z6hXyKwZgnovDgFycq4Sjml4PQiiniWu
	 ehHZbRgxpTJn5ECECZrMA5yi/Qtbpg/pW83fZ/RlBdhG2WFUcaYBzB3wSFLSLB9LQpiUH
	 kdsnR6utrcv30FHRQiFZVt91F0zPYVlOD1MBlUNmlf5R6IDKPQ2LBDGsGeMku8IrCDMzN
	 NMaiVZNi9eSpRg01vDv4QePpTSLLbCRKhaVen49XpRxGNMm9jDmOiirL2U2/nJpxqnflh
	 cdokTtNiZs5vNbl5Rqsbmpo/qMwvr5fZQoM3t9nTMHE/JC1c86vMyAHwhH1rlRAjU6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ftLaQ9cT;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF09606A324
	for <fuse-devel@lists.linux.dev>; Tue, 27 Oct 2026 21:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF09606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ftLaQ9cT
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-679aeeddc6bso412352d50.2
        for <fuse-devel@lists.linux.dev>; Tue, 27 Oct 2026 14:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793138317; x=1793743117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqfPoWTkUvjEoiyLTnmr5mj5KovsR6sHRhbPRdxo4UA=;
        b=ftLaQ9cTSff1iTlIq1iFCVAxxqC2rwvkSjjAklpYPSsOviidskJsItt7nzCg0I4nNH
         3lYGgni8n2cnYgkJmtDKvClLdNnIXQ2Y8/wUnGM4iMdaSVbqRJ4AG9W17VKhKDyhJxC4
         ZvSoRcBfDb05AiDopSU4zbBgSjqqO1APK+egE32nF+aqw8RuA9s4m+5NmH/KTF4HIbC1
         y/oMs44x59wW2753sfHVX3Ocy+Nb2DrcTvI5lyB/SDKEYybFclq4gBNPnznZKq2pRGbX
         Z7MC0qTpVbdZxEjMdC102R0TPxduz7q+1tVDcg1Ljrq2n0rTAul9/X/7PwWwq6WRXmU+
         8eQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793138317; x=1793743117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iqfPoWTkUvjEoiyLTnmr5mj5KovsR6sHRhbPRdxo4UA=;
        b=DHZ7ktEeNOxcQ8qdymStDNIDDMB8uwIHzGuUp6g9zu4369vVXJaLmM+o1yx5+TCoCZ
         jS0iluU2v6HOLusWdGNIGRpa3Q4wg3b3ZlULgbOQ0qXn+mJuqJwMdJ61mCxhykUmhlWu
         PbKYVG6HJnDzNadtYMSvz1AcYRW+Su0Kx7xOFly7I61QFGa8v/YFGcJKkNAI16O9PXZL
         He46/eX89cCX5WvhVq5qDzWLpEp6YazHPj7lP56Ge4A2QZtGab8NnhlG0vAyxMW5TKOz
         uvTiDfRZniWsIaOc4NzLktvJLpgX5Uri05jX1LmjfEGbcEf91Bv5TCwDPXpj0OlRw3q5
         R+hQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAr6iNkAJwvcvxP6DsbZRP3jmxR9uLYZ82xfmG/4FkX3BFdO8oTkqZJxABRJSg9+EZPjS8rcxXf1aO@lists.linux.dev
X-Gm-Message-State: AFq9FYKFWUxXsQz8Ze8JTV1QQPda+iHBIcQw3oUL7IQzpK7Q49jMRDvh
	lrR2bFyFFQwr8K25J0sxGHxLPersq22WuVBfDfaKV0N9gj5elpYTHD1F
X-Gm-Gg: AYBFou2V1kEPPQX3+dl3PVP8dqS5WPmRmb9EZlAdQRyt1EX9PrjRhDi+jsmlXwjLlHd
	NMs05+WjhEIDqFcV1EpCTLJ3g+no8BY2K1sdDTnB6cUDGGi7Vyhny/9vBfjwMr3m03GKxS8zlKN
	IgHHUej7ziM0UfjixTtq61elf3TFvThgQyrXbknXXjSqvCjbYA+az9LZgCMp5BRpJJPbk4R9azt
	pX6uDFGa5xlWC0yGxFiBSz3LXNNeGhQi+v3ptXHFYTEof9jmQyN5QwCTezGdr4cc6KTEK3yRHCg
	QDwt6HdJAJrysQm0rdjGYHGLwUMD58zMIS0rMCOReyfH1gbEvZUhI4buaZByE1xt+SS2DVbpAKg
	PpoQVRK89fegiQCyJYBHYvpbzlzdtQZoKwDEvzlNk4oKRwURwoKww2oqNGD/Mlo9igi1TF/JIgw
	Ii979sndmt4stjH3Sc06Rjvj+nO+V9k7JOclsLlwlCCQJZLPL0U+R7yWSpVgBY5z2jZjd3BWwM8
	O0v/9bh1LZSmi53pk7pTJAclYK2UI+oZhm9t7DAGICosRVPGRthKChpoov3iLel5ZdMSN0AFVPe
	GZy7oPBMwRg4NYhmROOFiqQq4Iq+h98T
X-Received: by 2002:a05:690c:a418:20b0:8b1:691f:ab4d with SMTP id 00721157ae682-8b1b5ba3a5emr1705147b3.35.1793138317281;
        Tue, 27 Oct 2026 14:58:37 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4e::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e43e1d2sm18903937b3.5.2026.10.27.14.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:58:36 -0700 (PDT)
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
Subject: [PATCH 2/5] fuse: convert ext_map iomap ops to ->iomap_next()
Date: Tue, 27 Oct 2026 14:53:23 -0700
Message-ID: <20261027215326.2693300-3-joannelkoong@gmail.com>
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

Convert the fuse ext_map iomap_ops to the new ->iomap_next() callback.
The callback is generated with the DEFINE_IOMAP_ITER_NEXT() macro, which
wraps the iomap_iter_next() helper to finish the previous mapping if
needed and produce the next one. No functional changes are intended.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/ext_map.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/ext_map.c b/fs/fuse/ext_map.c
index 7f04edc33fe3..edb19498d496 100644
--- a/fs/fuse/ext_map.c
+++ b/fs/fuse/ext_map.c
@@ -210,8 +210,11 @@ static int fuse_ext_map_iomap_begin(struct inode *inode, loff_t offset, loff_t l
 	return 0;
 }
 
+static DEFINE_IOMAP_ITER_NEXT(fuse_ext_map_iomap_next,
+			      fuse_ext_map_iomap_begin);
+
 static const struct iomap_ops fuse_ext_map_iomap_ops = {
-	.iomap_begin		= fuse_ext_map_iomap_begin,
+	.iomap_next		= fuse_ext_map_iomap_next,
 };
 
 static vm_fault_t fuse_ext_map_huge_fault(struct vm_fault *vmf, unsigned int order)
-- 
2.52.0

