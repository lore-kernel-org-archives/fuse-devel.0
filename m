Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270361;
	b=BTQ4+x4Z5N7uvOlXU2F+arGbtqj6DndMjwZmQgW2czdt20weab69KXj3YqSMbNPdNmLV
	 wimgXvigjfwS5GwCxJ6E8Ri91otqxtnDIzjyg7UBAM225xQrxO62mv8+uoQU2HLZO2NX/
	 fQXIWiryNyRgn6882fxlOk7jlVvA3YTZKKxFJ4PTahZctRvTCy4EsgjSQ2mJJlerwif4L
	 oEUOaZG3EkoBDqddZcZX9RGwVJhpkrG7B5HexAQvOw1cVFbbOTn+rMxirGLlLZb1E1ZyP
	 PwxbLg7vI2FpDU9z8fSIwktWzaTVI+mWnFZ/wAr9fiPzn9Vpfp4xd1OL30Ss5CQh9dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8WMI3X3PoRyAlOMTKdphRDblFY375paDpMOGs5Gmny8=;
	b=nBgsKIjGAY1EILQ16aHXle9SsMqAwDVTY3SoJcxG+RivIVkFhyBNo2JoO04CHsV7ZhB7
	 lAlpWmArVbk+H9wczsDm7L83MKS5TCs9lByjDxUsPEvKyyIDspUPgCWHroWQ7U69mAkLc
	 YX+8L9oXyZ/17xc5pY5cPOsa7Ugjz5TfAs6l69e6Klwa7esQN18IpsbcD8M2SaSOOpJtA
	 jRjtCmMstEQD/B+56238lMhVgv8ny3CtDjWhRI2MgjfBnHBXU9udBBFy+0HOZ3qI13Zvz
	 T6VKGg2xNAQYMOXODH/g/wfeM2nAFXWHLpsY/JR9/AmkLJTQGj/vrAXlp/2SMDFST8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jlRBc+EZ;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188CD606A320
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 188CD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jlRBc+EZ
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b488586facso2547214a12.2
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270359; x=1793875159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8WMI3X3PoRyAlOMTKdphRDblFY375paDpMOGs5Gmny8=;
        b=jlRBc+EZ/PRr8eeTMOlNZZQO4VhJJBrIDiR36is74JlMD90n97/ymje7EvlyfK+7z0
         6jS6z8uN/pu8MqdchVWvX8Kt2AbcRlcKUQnOzXFYiE2xLsvTWiCE4WRX3J0CPtcuLACO
         OPX5Ye+NbOMP+o/1+YdAQekO+ZZgn51w+jaLSPvXhJrVCSUP5xipBGcc3fp84oOgd1QS
         vvvxvOufO0PKqkk2i38Yn8UOTEdEdUXA0Oys2liP+G634P4PepF9DR6qMsZzVZAo76ha
         SYKc/EY1L/Afp+8uIrlHnw7NwPQulDi3H62zrW/t6cM5XQNY+6H1Q24MsSxrh258vEEU
         SoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270359; x=1793875159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8WMI3X3PoRyAlOMTKdphRDblFY375paDpMOGs5Gmny8=;
        b=u1W4Ce2a+E5tckd8BFnF+I0gg+wZXrmlxejU+5F9uZdGGZYC2GVt93Vwg9W2HOe4ld
         sOKQpDXDio0nMvBxn+89iQjVTWeNCHNa1enZE2Qgxd6X6RB7//Xdh8aicNfw5MNAc3kg
         dA+HR17rrFvJtUCEjqoI272Y9sSKDtPAjjHLxa0WpbmfERhHHIw2aONqLvhdtZcc+nnY
         /X5UKKpY+uniJAt8npT/cRVc7TD7RA5+rOa5N9dK7DIUzTQWbeeykwPuS1Gv7r4ADxM2
         xvW8kseyqYBTvBcL+4PlRmEuYBtf8FxUSr3BPLwNSa68G8PqcaHt87EwXFh7vKA6rh0K
         glew==
X-Forwarded-Encrypted: i=1; AKwUvBwMtiuqNydKSgtUGBTQjxUHqS+ppPu5ryxWaWKPio7BggkvTS96eIVYr/rS3IkGPR9nSiR8d4X569el@lists.linux.dev
X-Gm-Message-State: AFq9FYI4jvG203yeqYcInCSh5MzJEDCftUZGDBPult6es3lH+0Ibw06e
	W78aKzILKQlvp4o57M23o63jxpQ+3r5WrxL0BXRsvS8tVjt75zRtR6xw
X-Gm-Gg: AYBFou0D2flop1pDNeCCAYsqs+EvMX12bFciglJpsynRuxNAbhZyJm4S5eu5DTCWJV5
	ogdX7RAIjzKfqEz4LVfCXgNdZuk2G1NyEH2wiqrN7cPHmKDngnTZQ0Jd40IlxgemI9Q2fIjWXMI
	zrsvgAE8MdlM531/ZA98sF3QxmH6QWKEfJ+TzGKSb/S6oqD9Uc2j4CvV+IAGzc37EM9psUgSzgI
	JPp+0BUb6QY1sO2fr14dG3Wo46645ixigX9FRxC2WmN9UZhn6zWP4RWxDU36bRH9uJ4TvV1DmoI
	T0s2JvyRhD/kobZDAHYuMAAMVgVVHgea2SKs1urPz7W4f9HNfeKGUb2EQqQmPrFnDaZYgOtegGu
	tDQUpgR14bq6ppNcbsA6OgRt/uF4An/0Whoi0P/K1szDts8wogg8QMOnK+3/Lx8Z4yMK6JFznrx
	zloRvbVKPTLZzX6wY4SV3oCXqmG6qMdNnTid1tgBmlwLD7XFyIUHJOh98zeZcNSa//k2YwrxM27
	DTPHRa0RNJXtfF/YiUz4hT2IQTCAynMg2uEY/6mH1+lqn4V4wCQKohTu1Qxj6j8f3KGsyUEs0Zb
	iSECVOtSSO4uZ6fZ8jbOtW8mYZ66gFXN/CYxM1eMjP0Wpv+FqBZzciFWbVvqht0sCxuhAOxgy08
	+1syiifcSJKCtY4Fud9KB6ScggDOUuhmHdg==
X-Received: by 2002:aa7:d0c5:0:b0:6b1:b611:a2af with SMTP id 4fb4d7f45d1cf-6b49cbe2658mr2513298a12.20.1793270359169;
        Thu, 29 Oct 2026 03:39:19 -0700 (PDT)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435babsm2437817a12.28.2026.10.29.03.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:39:18 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	Chris Mason <mason@kernel.org>,
	stable@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 03/16] ovl: set OVL_WHITEOUTS before publishing the upper dir
Date: Thu, 29 Oct 2026 11:39:07 +0100
Message-ID: <20261029103913.2785828-4-amir73il@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029103913.2785828-1-amir73il@gmail.com>
References: <20261029103913.2785828-1-amir73il@gmail.com>
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

From: Chris Mason <mason@kernel.org>

Listing a directory while it is copied up causes a use-after-free of
the readdir cache.

A merge directory must never be iterated as a real upper directory:
that mode frees the cache in OVL_I(inode)->cache without looking at
its refcount, while files opened in merged mode still use it.
ovl_copy_up_workdir() publishes the upper dentry before it sets
OVL_WHITEOUTS, and ovl_dir_open() samples both without a lock, so an
open between the two stores finds the upper directory and takes it
for a real one.

With a delay between the two stores, an unprivileged process that
listed a directory during its copy-up saw only "." and "..", and its
next getdents freed the readdir cache of another descriptor.

Fix this by setting OVL_WHITEOUTS before ovl_inode_update(), so that
ovl_dir_reset() agrees with ovl_dir_open(), and by testing
OVL_TYPE_MERGE() of the path type in ovl_dir_open(), so that an open
that observes the upper dentry never iterates a merge dir as a real
dir, regardless of the order in which it observes the flag.

Fixes: b79e05aaa166 ("ovl: no direct iteration for dir with origin xattr")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
[amir: test OVL_TYPE_MERGE() instead of smp_rmb() in ovl_dir_open()]
Link: https://lore.kernel.org/linux-unionfs/CAOQ4uxh-1J2OBjnDVbrrrjy1puSOW0kABvghN85ih6dtKUBTyA@mail.gmail.com/
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/overlayfs/copy_up.c | 2 +-
 fs/overlayfs/readdir.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/overlayfs/copy_up.c b/fs/overlayfs/copy_up.c
index eee22581b14f1..92b3d08a02349 100644
--- a/fs/overlayfs/copy_up.c
+++ b/fs/overlayfs/copy_up.c
@@ -819,9 +819,9 @@ static int ovl_copy_up_workdir(struct ovl_copy_up_ctx *c)
 
 	if (!c->metacopy)
 		ovl_set_upperdata(inode);
-	ovl_inode_update(inode, temp);
 	if (S_ISDIR(inode->i_mode))
 		ovl_set_flag(OVL_WHITEOUTS, inode);
+	ovl_inode_update(inode, temp);
 out:
 	ovl_end_write(c->dentry);
 
diff --git a/fs/overlayfs/readdir.c b/fs/overlayfs/readdir.c
index 7d6f7f6022ebe..ba542a1920127 100644
--- a/fs/overlayfs/readdir.c
+++ b/fs/overlayfs/readdir.c
@@ -1055,7 +1055,8 @@ static int ovl_dir_open(struct inode *inode, struct file *file)
 		return PTR_ERR(realfile);
 	}
 	od->realfile = realfile;
-	od->is_real = ovl_dir_is_real(inode);
+	od->is_real = !OVL_TYPE_MERGE(type) &&
+		      !ovl_test_flag(OVL_WHITEOUTS, inode);
 	od->is_upper = OVL_TYPE_UPPER(type);
 	file->private_data = od;
 
-- 
2.55.0

