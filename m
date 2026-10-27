Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793138321;
	b=4wpv8L7udkZrFMhPQk0LKdIlQUxZSyRGW6YTJg188pMN5AoseUGHzTUOyRsk/nORt+Ql
	 ANnuy2MnZ80ewNUcXf8LinLGs63MLowTk/gtHJUhFc1/f46B4ZU1+XOa/sD5nq62bR90A
	 gRcTKBB4Ze9T50uNjC3PKI4QhEyb+j5FcVhVjLkIOWRYEgIJLYE+hMK9j9lS8YxJsbxX2
	 yxh6iH5AAa05ppHUgw89sHX+8QQT486SDo6awHELlXA97sY+jaK0zEa7EctMJpu8KO3rt
	 gZwdQE4mQzp8+K+QAVpi5sY5bnWsMXcfWJcm14tAlAhTUWDMEyxIdOknCf9AjI959gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793138321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=43G9CXaG7qSF4UFTj5k8Ql+kaR9Fc0A0Kgr5LG/j+HQ=;
	b=tXdJ+8WhaYAhRLDSyun8+PMcwkNSjtkg/GoifDWO253mPKASmnoxHn1jr4UlfGo04047
	 w0rsOgFNyHlLoNTYGyLHYL3+SR5FjwGfmA64dxNUXkCLUOBAnrwxW9Mc7gm8E7EYLYV8t
	 EMK0C6QnuyV+ye/9erJ1r9pBJgUvzYn2vXbx/GmeR4MFtOo1iwC334RjiWuE+0lNknVui
	 1M5lbXDaB9ay9sC/l3cj+RSn/12jqW0EZLE+pt/dJi1kPueU29o9ngzGDFIOeTRl5b9tG
	 gB0D96ykVnnNOt+lkEyRLUnKVp7fa/qSmzMdw4EP3ooYnFN0YBjnO9DpkTmPMsChrQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EY3EILdW;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB3A606A32C
	for <fuse-devel@lists.linux.dev>; Tue, 27 Oct 2026 21:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB3A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EY3EILdW
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0a28a720aso3401367b3.2
        for <fuse-devel@lists.linux.dev>; Tue, 27 Oct 2026 14:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793138319; x=1793743119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43G9CXaG7qSF4UFTj5k8Ql+kaR9Fc0A0Kgr5LG/j+HQ=;
        b=EY3EILdWgc98M8IstGSVG21DKFGqktxdga0QI5CoDd3dZ29e7rfzGPi54aSD9aUqof
         bv9au7vw3+8mLjFpYqEf0YsC16+ujPoNeOht2hUjrIh/s5LUPOEg+68TGmOlt451SfqJ
         1BDlHFoi8KCgB4HzXSEj2Yg9iC+NGZhYpac+3lP+dpoZixlMkzIHwrr72LgWWIX0KQF4
         vSXaei1XgiJCQ4StPPQ3S+8T2v4ELscO+X9AZL8AnuFFZWTySPu6wiY+ZjAAJ1W1Tnt+
         JHoiIHNNGfYUwMsALwe8quJsZpnqpFH2KlsiYU/rFlIUv/QPV7BSWiiOLiD1QDwFevSy
         ql5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793138319; x=1793743119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43G9CXaG7qSF4UFTj5k8Ql+kaR9Fc0A0Kgr5LG/j+HQ=;
        b=f+mNkZedHeoLi6gfatqYmlqbMBA0kVJcxFnMNaHzmgSdH+508Bh1w7+KaRdYk04aOw
         vCiLpPh4cPY3hRalOi36h1vJPoNwnXet01yWxriFmn1fne5XOt8cFJhqH3DiuwO04NaI
         q1o9EBk0HndTEQd0EpTS4kWp9iNNZl0SeG3jCwc1HqfzNmOKLB0CNc1114MuHozZoiEt
         C760nagclnkcqwwSlXdde+sP7bT9F8rHnMRZ1rpHDyQ1s0cABPBmcl9vAT6Oi1mw/5Cw
         9KHRwbydqfw1wKo/o+TfJRbx01k5GR2pwjdFwDZXjNlghwJbdNrz6+YU25Rv+HVGXgFW
         ADhA==
X-Forwarded-Encrypted: i=1; AKwUvBygASelzpcBmcXRzqm/+4ZW78nLahjpWpUfQyvV5D7fp6Xr1svW4atfZgiMwlMkoQXCDIW5oBlWbnD0@lists.linux.dev
X-Gm-Message-State: AFq9FYJ30WGWni5CUPPpXkS/Evjv7V96qtXKCT6xcHKOzJXQVu0AFkgv
	wriA4zkxANGupwIJqHU+rpTjk6pwlcCJuPvK2MhfdqkG/w061ah4dgip
X-Gm-Gg: AYBFou0El75iShTkWUlqJ//NRAFCJqmQ+YQ5Pe9mi7qPiq+0B4Wi0W48TbwVE1RkCU6
	lXC8Us0BiGvy74/XdNcF2PmQp5z9M73yI3lsCLD3IEnyJrh+Rnumpxo/4yoEWOcg//U0S2l/8mw
	ZgWufZ9JdgtEvn7TO4oRZ/JlE7kFU8gnrR3gtqYIe/HjLayD7UvJwF3Buhd70wwEi72qC9O90cR
	EzMy2FlHvtnZ/Vh4l8T7AIzMkMl0xVUisBPChPehLgTAOGmJaxgVcXXoh5Powkq/KpaooA81bmm
	VuAE3bHbiphwf9u/2oSiTCka259SDx5UgJu62JGy9oRGY9hLxqvYoP2t556ffbxR1x7/a73VAWD
	jCperBFVlKhirDcB0AQWCdd40WDYH0u1i+1NGDzyaWl2gt4IXTB8+cPlwh1SZUhKfcrLoJvwjGS
	CPpCk/CFRV6jkl4YeupfmS3NqdBepDXMzt+CzmnsWs1OOtMqVWsUnf06njxfbv8WT9w3HEI4wfr
	2M/UxP4SYepACCWxsQmyEp7VHUVb/ZP1fFW2pXACocGYMddsmja5qJvlUr2IgtzF6Jxx5OMHR8u
	cPq7kVyuiI9XjUQCMqQj9Da1G5IyPNDR
X-Received: by 2002:a05:690c:f89:b0:8ab:485b:9bc8 with SMTP id 00721157ae682-8b1b5a8ceffmr2994117b3.24.1793138319600;
        Tue, 27 Oct 2026 14:58:39 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:73::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e5b83b9sm18877967b3.27.2026.10.27.14.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:58:39 -0700 (PDT)
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
Subject: [PATCH 3/5] iomap: remove ->iomap_begin()/->iomap_end() legacy path
Date: Tue, 27 Oct 2026 14:53:24 -0700
Message-ID: <20261027215326.2693300-4-joannelkoong@gmail.com>
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

With all in-tree filesystems implementing ->iomap_next(), drop the
->iomap_begin()/->iomap_end() path.

Reviewed-by: Fengnan Chang <changfengnan@bytedance.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/iomap/iter.c       | 6 +-----
 include/linux/iomap.h | 6 ++----
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/fs/iomap/iter.c b/fs/iomap/iter.c
index fd8791c4963b..8b6da9750a93 100644
--- a/fs/iomap/iter.c
+++ b/fs/iomap/iter.c
@@ -119,11 +119,7 @@ int iomap_iter(struct iomap_iter *iter, const struct iomap_ops *ops)
 
 	trace_iomap_iter(iter, ops, _RET_IP_);
 
-	if (ops->iomap_next)
-		ret = ops->iomap_next(iter, &iter->iomap, &iter->srcmap);
-	else
-		ret = iomap_iter_next(iter, &iter->iomap, &iter->srcmap,
-				ops->iomap_begin, ops->iomap_end);
+	ret = ops->iomap_next(iter, &iter->iomap, &iter->srcmap);
 
 	iter->status = 0;
 	if (ret > 0)
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 59718f73c15a..95d4995a49ca 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -195,7 +195,7 @@ struct iomap_write_ops {
 };
 
 /*
- * Flags for iomap_begin / iomap_end.  No flag implies a read.
+ * Flags for iomap_next.  No flag implies a read.
  */
 #define IOMAP_WRITE		(1 << 0) /* writing, must allocate blocks */
 #define IOMAP_ZERO		(1 << 1) /* zeroing operation, may skip holes */
@@ -240,8 +240,6 @@ typedef int (*iomap_iter_next_fn)(const struct iomap_iter *iter,
 		struct iomap *iomap, struct iomap *srcmap);
 
 struct iomap_ops {
-	iomap_iter_begin_fn iomap_begin;
-	iomap_iter_end_fn iomap_end;
 	iomap_iter_next_fn iomap_next;
 };
 
@@ -256,7 +254,7 @@ struct iomap_ops {
  *	incremental iter advance.
  * @status: Status of the most recent iteration. Zero on success or a negative
  *	errno on error.
- * @flags: Zero or more of the iomap_begin flags above.
+ * @flags: Zero or more of the iomap_next flags above.
  * @iomap: Map describing the I/O iteration
  * @srcmap: Source map for COW operations
  */
-- 
2.52.0

