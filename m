Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461466;
	b=PNd6bDbrLY1QjCn3/Ppwgi9/5W+1rNRiWQ3Z0v3VQJPrzIzEn3DVYsFuuMk7QyVH82ow
	 Z++dhtMKWBA1AwaaaWsTbcEJX/j+p5nfSP+FpFOed4yQzdvph10l58xqeFk4C+70Zzs4x
	 7SYP5yAW//LnVf9xN/QGci/++xbeZ29GiSnpQbvIb1Fk0Aw6L+82cOiYSLkPTBWIqZK7B
	 Y6EFWAoga08IP7eD+mMi9N15jDyfgt8sPBBZYCC1Bt0mJbqGSEGauZ/Dr/01HwaU7HisK
	 Iv2a1bLmtG6vOnGbtZZnl5ct9/lBdO7NGOzPLzQQ2fS6aAo8VJrPqTUBSBpbmWMUBog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=56Jp62HZwbl/bs25PK+pXtbwrUN07Joj+4AgiDDMgHU=;
	b=gfcOfaX7HKxXHwrQBV0vBBG8cap2irkCInStjjoRp4nuaaFTAo1o0f+71kQaAX7FD3P/
	 rl4yGbaXl5U2nxkS+n+laKVCDiVSIEIobUvHNNGVOEDoApv29HI32kc5QwYTRGsTnaktM
	 8d8J4gYr0P7YYfAYGUyveGYfMlDibKdZ8ZcfaB5UBbHD4NVfsri7wbTvtV8b/kViBXcm7
	 YWtYJWjwElFT9gZGRuECP0Y87EZTfp1fmET7SkMF6gLjF9fHS7gr56VYeacpfpvR9AXRt
	 OcF0fBqSw2Mv4GBnnDtRicbkTQID/yHOl78tZYLfhpctmUVeCRuWSlfF91zSmgQmHFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cj2ytKCQ;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FF8606A31C
	for <fuse-devel@lists.linux.dev>; Sat, 31 Oct 2026 15:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0FF8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cj2ytKCQ
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eae1276409so537174e0c.3
        for <fuse-devel@lists.linux.dev>; Sat, 31 Oct 2026 08:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793461465; x=1794066265; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56Jp62HZwbl/bs25PK+pXtbwrUN07Joj+4AgiDDMgHU=;
        b=Cj2ytKCQT/f1TaO8D8WM+8bv6WPv3R1b4i7F1TdWNBgMlDltlvNTNd+hRGV2Eer2ZP
         bzzEsVUeaUjlyr3gtNFTu9BbpIA06pHOF78BNLRg+cPf3FtUDRSX55TSPWGde/nfuolI
         nhxAOrrbYDyBOq2GVcjfow/Iz0WNnoN9+pNY0xh6mCd8NdMoE7VMwaEStcL/nsqkdZ8o
         L6bg04lL7jH5H5jKME4B05EYKVASM+PezFzMGK+yWL4JuOxRqJnlqiLFfWqiDu+eJMPr
         PPuDCq4sTWJBy+brRR6a954HX93XGUbAyl99Gnj0Ql+EtuQBLt6Ham73YVJzuuHhfR6q
         ZVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793461465; x=1794066265;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=56Jp62HZwbl/bs25PK+pXtbwrUN07Joj+4AgiDDMgHU=;
        b=ITTupGoBLsFDPKWWPY4fvanTQEy2n/JDKx8K7h+g4D8lMC3JZAlYSKBTPgi0Zvr/Ds
         GgyVZAQKMhf714f8ejEXDAdZzUKDtGFbAZd5NGJyZlfN48Jr7lYUn6Or3eOWl7w0oTgm
         1eN2UPBrK30UcF3+KwNAfduopYiP6aiVkWorENsNnh3xVoudF3Rxk/Vmc7WE7xiPLKPo
         rd5HCEQcFnN+YhDpwZpntvaww4z5TE1KXP3Aw+eRcZ8KvIFGZ0LVN9vBY+5FqukON1DU
         Q4UVpC733ESDslAmuiSiUnTC48ub0/hKYfeyQhphbCZ4w3i8oa+Jti907A1F9PhbFPGs
         Wiww==
X-Forwarded-Encrypted: i=1; AKwUvBwPrI777O6qaLGQ7mvxTDcP76WRaimVzwGJOZTU1uQuDkPU0uBzwKY5Q+XhNmyJ/ZVqyHLAxtAzR5pW@lists.linux.dev
X-Gm-Message-State: AFq9FYKbWysxlx30QwSloemWyXpcinjNmAm3kkNBVf+TDB72Lwd1XRu5
	lnUMWEZm7ChFD+V0U8aI+gPv8fgzkosBmdpbCIqSTrDr2Zoj0TXCprvp
X-Gm-Gg: AYBFou3BjaHldbWKrD4sO15PRZdS0kAzbps6g0dwyOdDw1z+xo9eK3DgZssX7Etii6y
	1wIntOuorztjRYQuVRLnnRWCJVa4DgBahvicz+7i9tQ608z7Bv+yJWKF6KyAzwca7DmPmu0BHIn
	10KLjhuBA2m21bwbREeMfHV9Z1sgch501Nuzl+zdlT0HUqBSQm3DcRjgIxy1P4KanioFLfl7FUd
	G8iua7n2fcFHPMSk9M9gAT5AMXyn31fxLDaJ/NQIkxMjyZmJw7A54r2uavLaoCbiaEoC9KU5O/y
	mvr/3vIK36oTAqqZOn2KMtJrnK7NSMIsObqro8KrnvQUgredDvx5zPedqW+B7tz0CHWhYwOf8Yg
	1A7BcyQYN1ZvTnzjeYPaGgpm6jMiSaCuKx0/JbzeDonAGPFk5Ccx0YdXIyLSd3mQgPdgK94LBJe
	JDB2M2e938mebkNyrhKo69w01fm2OC30rd6LX8Id/taTupU6h1SvY9j+U0aCcN9uSIiBW3GOt69
	EL2wWRg8de8mvZ3uJfuHylZd7eAAqvXQ6vpCuEXRi/4/H2Rzylbof3DEiz13VqWL41917dSuk8m
	/aZDZI8Q+aeT7ASvlIB6sab7KfcnzkZP668gaBZf/syNF0wVynMmyU9n0EfU8rhsfkFxxytxCM2
	vqUCRcJ82r0Aex5TncjC6ckE+Syb9gzEhZc5mr+it+xiT8Bd+meRCVQ5uVR9+r2fsjXBeO+ozPs
	KLiuEXWhLbkUf8Pxw=
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id ada2fe7eead31-7d072baa484mr2303904137.9.1793461464434;
        Sat, 31 Oct 2026 08:44:24 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2804:7f0:b101:c5e8:f804:4efd:32bc:71d3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d077606b7asm5730837137.8.2026.10.31.08.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 08:44:24 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Miklos Szeredi <mszeredi@redhat.com>, John Groves <john@groves.net>,
 fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fuse: refuse FUSE_NOTIFY_STORE for DAX inodes
Date: Sat, 31 Oct 2026 12:44:19 -0300
Message-ID: <179346145958.61208.701521796030924197@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Since commit 2fbe4586cff3 ("fuse: add support for opening dax device as
backing"), a regular file is marked S_DAX whenever the server sets
FUSE_ATTR_DAX in the attributes. This does not depend on any INIT flag,
so any FUSE server can do it, including an unprivileged one.

fuse_notify_store() does not check for this. It adds ordinary page cache
folios to the mapping of such an inode with filemap_grab_folio(), while
the DAX code expects that mapping to hold only DAX entries. When the
inode is evicted, fuse_evict_inode() calls dax_break_layout_final(), and
dax_layout_busy_page_range() hits WARN_ON_ONCE(!xa_is_value(entry)):

  WARNING: fs/dax.c:825 at dax_layout_busy_page_range+0x394/0x4dc
  CPU: 0 UID: 65534 PID: 93 Comm: fusedax
  Call trace:
   dax_layout_busy_page_range+0x394/0x4dc (P)
   dax_break_layout_final+0x104/0x278
   fuse_evict_inode+0x2cc/0x57c
   evict+0x2b4/0x748
   iput.part.0+0x51c/0x964
   ...
   fuse_kill_sb_anon+0x170/0x268
   deactivate_locked_super+0x98/0x11c

With panic_on_warn set, this lets an unprivileged FUSE server panic the
machine.

DAX mappings do not hold page cache folios, so storing data into one has
no use. Return -EINVAL, as is already done for files that are not
regular. This also covers virtiofs DAX inodes.

Reproduced on current mainline (arm64, CONFIG_FS_DAX=y) with a FUSE
server running as uid 65534 in a new user and mount namespace, answering
INIT with no flags, LOOKUP with FUSE_ATTR_DAX on a regular file, then
sending FUSE_NOTIFY_STORE for it and unmounting. Before: the WARN above,
and a panic with panic_on_warn=1. After: FUSE_NOTIFY_STORE fails with
EINVAL and nothing is logged. FUSE_NOTIFY_STORE on a regular inode
without FUSE_ATTR_DAX still works.

Found by code review of the DAX backing changes and confirmed with the
reproducer above.

Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
---
Tool-use note: the code review that found this and the reproducer were
prepared with help from an LLM-based assistant; I reviewed the change
and built and ran the tests myself. Reproducer available on request.

 fs/fuse/notify.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
index 984e4945e..938440474 100644
--- a/fs/fuse/notify.c
+++ b/fs/fuse/notify.c
@@ -167,6 +167,11 @@ static int fuse_notify_store(struct fuse_conn *fc, unsigned int size,
 		err = -EINVAL;
 		goto out_iput;
 	}
+	/* DAX mappings do not hold page cache folios */
+	if (IS_DAX(inode)) {
+		err = -EINVAL;
+		goto out_iput;
+	}
 
 	mapping = inode->i_mapping;
 	file_size = i_size_read(inode);
-- 
2.43.0

