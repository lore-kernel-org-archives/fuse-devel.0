Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923529;
	b=HQWdbjxa47zkAq0e88qYop54YrYmG5EQ6+h5PfEe3/6Qu5lYZJt9tzFBO1SPhstN/GBK
	 gzXGYxrwUmEMAPpuMduhaSjZHrKo62FUOVIJBY967r7ortE2vLLbgmHMX8BPL3MI1uDKq
	 25jPFXrVZAYK9Zxxc7iD3AUnq+vHu9RiQna7UNRU4xCvm6Wko8fo+OZFDlCd7/IscFA90
	 sHBs8WBL4NwES1V8P8mRgIOPs2k4NCD9hWq7x1uHaBoLF5rffOV1AWOVEcHy1rV1GEIF+
	 XNm7IrM2KvmAFe7r0FWBSb/rD8FHNHzYZl9X0wjPShmUVTILwxPzbNVgvxN9nulqfKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1CXHuD+7M4E0rte/HpFih0lklRzK6u8QUeFUsQ4kAjQ=;
	b=BJEgr20Kj0unx/IXNsg5ghxE/6PuW4EAC8LTkfF6oLK/PMy9yAn18RHPLlGFgEj4Gw+A
	 fFrK8ggOY8ERwdmRHe9PtQyuzRiKpQ5SU+1Nen+i5IoU29cX3NKpXMLfm0N4spbWIz6Z6
	 M9SpuqwdJaeMilsGsPEDayCBJcX1Ejn3moHgSQpUQYiEqf1Zcvt+64hujUV3+Me6ZL7o1
	 tT2S8y+ZIFlz+QTFxOddiSfyRaRynSGx2Jpm8VGtN0wonc1WmzOEqBrH6+Ugl1cOjozXL
	 JDti5XAwtEnJQJizqTDJ+y3VuD7Azq2rKpWQ29qbdedyJavObT1YHUvVfeoceW71V1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uX96Jj2H;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08DB606A32C
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 13:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D08DB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uX96Jj2H
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2efd659464aso5211345ad.3
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 05:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794923528; x=1795528328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CXHuD+7M4E0rte/HpFih0lklRzK6u8QUeFUsQ4kAjQ=;
        b=uX96Jj2HWxn6+0y55TJCYV6PXM+UtHMafaDdHleYFvZBQSvmSmmcsUMdSnnqyT8Hwa
         V61rlaKwilUUv6kJRCNGpuEtunBJppHAnx6xMHhguwfrjRqSLgpgR16ErBuJQor/Sx1s
         g23ow0WDjObMFH5y85JTlLZR6tc7mT2Psrc/r2nErAAXtRPonzWCxdj9SgYL1UYHP2pg
         ykDy/9pQndJOGEK8tz3cACCAH0kq/VTC3E1x+ngSS2gZOQ/aVOmrlagSI3HQFEo/YaHb
         ILkJmqqnpmKbLJAN/2S3vE/63ZDuyAp0xu6P4e9o78lo8xBaWD1jUShKssFC3SAPg2fe
         QjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923528; x=1795528328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1CXHuD+7M4E0rte/HpFih0lklRzK6u8QUeFUsQ4kAjQ=;
        b=z4ShBR677/XtYD040Z6PrBJteXrliPuJohSk9B4rMxhIFLHtiBPjM3rRALOLKDQnAJ
         Vo8A81CyJimhW/CfpDB+zthcvcwjoDrEshi/ZfSzvMT3NxNMiI7W8w6zL9e/649Q23yW
         VGP+GU/zoBvHa/o8mTb+gYRxZoT5AEIzaigCoJDOZKO9zJQY0fq+gB63brofTfYWfans
         SATvrWCOI2/3BNaYF2hVxJhiLuA5r5lOBMEGUyax/m4hIUFXHpY8mULd6u12Azzrroy/
         uclwJAHOd2qvbXgcosQN6E0ef2Cu+dZtQWLHcAziEZtuf0aiO7kDhL8zp/gJCdnkRdeA
         JhLw==
X-Forwarded-Encrypted: i=1; AL+hErG1gwfpEPqx8hJZtAfdPHnUofD42G74NpbLZfHoUSQ583S5u2GRYiWOyisbt+oFR7Cmcuhg+m6oiFYD@lists.linux.dev
X-Gm-Message-State: APuU4Z+t6a25mZBY9ANK838uw9radNzibiujpeQESsJNm9VXKKEyegAL
	Apq7PCQdxskqErFFiTaEUy3PG+T7vR6pZ3a6pZCW/FmLKLsWAW/Xi0VJ
X-Gm-Gg: AZFdTZcm4BMabOAeFF2HjJcvtWfKldIzQrHA4bIjeTEwLzXfqHoxtCvczrr/B4n+mX/
	Lc+voIZt65CGWcoyfm8PcF0ga6ictgDMmJYZ8y//22tj0IWfQDYGI3jJlv8IX5jwvV+H1DGfaZh
	wE4RhkjNOQyeFzaQzNP1/kvah6RGLiHQ4U+a/kRaMnM73oh1hzy+2OB7Vzvj3gUL9yEvH2yL3vZ
	o9+TFul/CCHG5L1CYYiyigB3k6+XC3jbyDujJh250+mF5aLCEiFSwMbDetkjBlPoWl5JfZYAv8a
	KvZUuylFIVnMegqP2cXD2ZIXAeUtlBC3nP960DdcA24LmaxWfIPcVmrBR4GfZVj5j7YSMrjtalw
	Ik22CZ9igLXZJg1a/HOaMP2UHqPQzPGs7WfFNBPdQ/DnFYtma9TZ945vctDlHdUdSc2lEi9Z1eZ
	ZqRiA2WFvn9Sunz3qrQAHYbRN0sEvDUBsywAv0QNVkXkL+/5TAtTOBE1aF/1guGoyvVwYkpTmK6
	6T7fIpMR6Vx08EcETx0xd05Kv7pHtg1Zqay9ldyFfgLIOLcHy/FMRixSZdK+DecSmmSKdSVvh+G
	i/LRDUmRas8hDZ+TkITrKNBkFLayRRlcX0jF13qAT8e/pOl4Lg==
X-Received: by 2002:a17:903:38c7:b0:2e7:ff72:203f with SMTP id d9443c01a7336-2ee0dd9cbfdmr134501055ad.61.1794923528140;
        Tue, 17 Nov 2026 05:52:08 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a586c1sm15937035ad.43.2026.11.17.05.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:52:07 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jan Kara <jack@suse.cz>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Matt Bobrowski <matt@bobrowski.net>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] fuse: skip dcache instantiation for readdirplus names with embedded NUL
Date: Tue, 17 Nov 2026 22:51:35 +0900
Message-ID: <20261117135146.3174252-2-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117135146.3174252-1-graypanda.inzag@gmail.com>
References: <20261117135146.3174252-1-graypanda.inzag@gmail.com>
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

FUSE READDIRPLUS can pass a length-bearing qstr with an embedded NUL to
d_splice_alias().  Unlike verify_dirent_name() in fs/readdir.c, this
path can create a dentry whose d_name.len extends past the NUL.

For such a name, strscpy() in inotify_handle_inode_event() and the
fanotify name-copy helpers stop early.  The kmalloc() and kvmalloc()
event-name buffers retain uninitialized bytes within the recorded name
length, which copy_event_to_user() and copy_fid_info_to_user() can expose.

Some FUSE servers include a terminating NUL in namelen.  Follow
nfs_prime_dcache() in commit 78d04af4995a1 ("NFS: nfs_prime_dcache must
validate the filename") by skipping dcache instantiation without
failing getdents().  Return -EIO from fuse_direntplus_link() so
parse_dirplusfile() sends FUSE_FORGET for the unused lookup reference
and continues readdir.

Fixes: 0b05b18381ee ("fuse: implement NFS-like readdirplus support")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Changes in v2:
- Keep FUSE READDIR and READDIRPLUS getdents() behavior unchanged.
- Skip dcache instantiation only in fuse_direntplus_link(), following
  Amir Goldstein's NFS precedent; forget the unused lookup reference.

 fs/fuse/readdir.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 1f6cf565477f..6b2468b575d9 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -191,6 +191,8 @@ static int fuse_direntplus_link(struct file *file,
 		return -EIO;
 	if (fuse_invalid_attr(&o->attr))
 		return -EIO;
+	if (memchr(name.name, '\0', name.len))
+		return -EIO;
 
 	fc = get_fuse_conn(dir);
 	epoch = atomic_read(&fc->epoch);
