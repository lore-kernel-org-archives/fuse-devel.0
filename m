Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270366;
	b=eWETUCveevPC4NjLOnFUxuiZ2AxGQFOByj9NyYhPDIo/gUXDX7n64TfzZXz6/HQKfPX7
	 Hfo375GEl5MsVLUg9n7FNXAXmxN3pP4o0wm60LjiLc0t49j9f1f2rAxsZ4Hz/K2/zuiEt
	 Rg8JIFxqnUJf4UFIBIitO+81MpqdZD9MD9Gv9tMlYmf/0zhNGTL0OpncF24jwV7mZp/vo
	 UAIxJb46NCIQdCzI1GY3wSY1tAYUbZ3mUwQx6cGOflsd/Ma5Zg00/jSiXgjtrek2wzgUn
	 gwg+uvJUQdAkeh5uv+VMMmCsHiGYJ167Hecf0kg3UVno8f8KFVMAsezoD5DLJpYhgng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xgI79fkxqFLajK7iDGLVXmUc9XmvD6di/dY1FwycFRk=;
	b=DrWXznA78sFSvrJoifeaN52x6/CFFNptHoI+bxnk/11mRx035OyTSLqiy46EWsRHnP+C
	 Ib27/FaP1t6woHE238wqQUdmW7Xp5qAvOsQD+qnkr/npe3eqG+vb4gljis4yQ0Y7zx1Vf
	 HkSvQH1emtM4hdsx/kdXP1Yo4ETXhW6YykQltxirsUXpVMRrG6czZiGbSVuhoT8bKD8tm
	 kUfNrZx/4r0OxHowEL+XqjVR6an8whFrrvEqzXnXbBmvjp4V1xSi/LN8cb4dLLiNYEfgM
	 wzeovNXlVJxIcGdreIXdb8XTtioZzFZVBcbCv7/VZp9uy3FlzV5FpTb802Qsx88qzMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qcazk3yD;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E886C60A2611
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E886C60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qcazk3yD
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4550d8ab15so265012466b.2
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270364; x=1793875164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgI79fkxqFLajK7iDGLVXmUc9XmvD6di/dY1FwycFRk=;
        b=qcazk3yDyZnC2Y6a17Jcbu/aB6eeCM5n+twdZpP8AwT1wfUKDDzKyBtzqnDP+u8OAu
         aXyBBKs92cYACK0izoLzOZoHq/Yy0THkP22jVubrqzB4lhZw6rZQ6OmwkCLsbO/2hfmg
         jL7lEc5G0SI+Vb3MYyPj3gQ4VTnPFIF39ArULmbc5EQiZS/4V94rT1xEACoB3mExzi5A
         ajkbChhsWf2RSv5806uC5m7Zw1gAz3X/9yhhCqwCt0hOkx8sz+g6wjhtSn5dybS/a3K4
         3hoDlaIh3okI7DuBDG10uJEdEB9DLcclZ7rIKS48J/0cXnYya45FnPv9Ru7GIvTz7y8h
         5R3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270364; x=1793875164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xgI79fkxqFLajK7iDGLVXmUc9XmvD6di/dY1FwycFRk=;
        b=u3lXMZofyO/058TmOiGz4B04Jzii6JfU/oVXyGZ3M+9VH14G3h7yVhFNsTEUE9OJd5
         eNwH+H5JNUb9i5CQbQwzxQfPTEqjUhPJkn/AZGTZ7gieQNAzgB6QzZ/eHwLdE0O3tcPH
         c10kIcqz73hirLAw8t/MyLm1tjTObL6T7t7b5qhSBPWyNGv/G0nNhck6pPnzAq7fbnto
         b3a2jKWr5Ep18+ro5G0c10X8zEMWSYRH3xjyk1dtCIN4E7LKPqgS3Xx+Oz5CKdeMeR56
         NA1+EzaLE6NB0oZTq/tR17bJr3dfdlquzq3zmjCv9UqmmkzRNLgdYQ/EU8daUREzUQYY
         sncQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLW/57tsXx8k5DSZBlXNytJ3VcXa140zgHkZdZ2Lf0hphKsRhD02k9zbaBTb3dJ1/MdzGGAFwDFrBY@lists.linux.dev
X-Gm-Message-State: AFq9FYIlCHD+yy7nAQ2rhlOcTZwyqHW8ZrL1GdOVTQJfauncWhPwnYtg
	yGviHF7yC5I1737jeLjHeIoRpb9UUHOPx/tMZNzPSjwexUjHw9CppvPAW8JI3ux2
X-Gm-Gg: AYBFou1Q7GkZjXcB6JDqhnf6K1f37LCCibCUW4CrosZp52uFriU88yYB4ELya9bLihx
	/3dedyQ8SmfM21b8/POB6xPvCDjUjLItT0nm8eOfHUNTK60BdtmZpVElw0EZ+lOxghRbHEAuD1Q
	oKLy4uQFz0+8OyuBw38upC88fc6o9DxX5jT6mfCj8ehPCjqx/1qucm21nWC7wHqSI6hn0+WRDIb
	Yp4p0DpQ2qnLhaqNlloojAg0mL6AXKkNaWv1gjA7/ls9p6eBEhphv0ov5yqJkbws8flJL4bZjEK
	uHkZTb0K5jvi8ydQu/cvpuluxEIbHXmKl2s8unpL6U4ktvv1Quyjv3zVa/1SaiV5LVj7D8h5NWn
	9aqTqOO6qRsVvxY7/tPzXncHFv+Sm6H7LMYcjAcfjEqCwDYU6oJpb0+dY7StCLN8P0jGe4H0Okw
	yAya/nm5i0FGf3iKZ7GvOILWWUTT5ZEcc3X7BQqI6wLtC80fe++4kBltoZSQq4U6zgs3LuB/b8s
	TGpGJlBD1xKaDdqoaukjSbwmlj29WIgueWWxA5gfxfSyAO4BrKHwLfAcpDY25JRtlCB3qWL5FRj
	GgXpB6RJuKv92v3SI6OvYnNMQbEmrZcyzE6XhALSfBN/P3aocfvOIQQmUk1lwrY/FAZebbp0KTg
	NghFECb5H7VTbeLRjYSqyxw2IghELOVObQg==
X-Received: by 2002:a17:907:86a0:b0:c41:b94c:4538 with SMTP id a640c23a62f3a-c49bdf84407mr432048766b.47.1793270364216;
        Thu, 29 Oct 2026 03:39:24 -0700 (PDT)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e995dsm711863366b.25.2026.10.29.03.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:39:23 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	Chris Mason <mason@kernel.org>,
	stable@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 08/16] ovl: do not take a name snapshot in RCU walk
Date: Thu, 29 Oct 2026 11:39:12 +0100
Message-ID: <20261029103913.2785828-9-amir73il@gmail.com>
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

A path lookup on an overlay over FUSE loops in the kernel for ever and
stalls RCU.

take_dentry_name_snapshot() needs a dentry that the caller keeps alive,
because for a dead dentry the refcount of an external name stays at
zero and the function retries without end. In RCU walk
ovl_revalidate_real() holds no reference on the real dentry, and the
eviction of the overlay inode on another CPU can drop the last one.

With a delay in ovl_revalidate_real(), a stat() loop on a 48 byte name
in an overlay over FUSE, raced with drop_caches, spun for ever in
take_dentry_name_snapshot() and stalled RCU.

Fix this by using try_take_dentry_name_snapshot() in RCU walk, and by
returning -ECHILD when it fails.

Fixes: 5be1fa8abd7b ("Pass parent directory inode and expected name to ->d_revalidate()")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
[amir: use try_take_dentry_name_snapshot() instead of open coded snapshot]
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/overlayfs/super.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 18f56d463572a..cc4b0959faf61 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -100,11 +100,17 @@ static int ovl_revalidate_real(struct dentry *d, unsigned int flags, bool weak)
 			dir = d_inode_rcu(parent);
 			if (!dir)
 				return -ECHILD;
+			/*
+			 * Nothing pins d in RCU walk: eviction of the overlay
+			 * inode may drop the last reference at any time.
+			 */
+			if (!try_take_dentry_name_snapshot(&n, d))
+				return -ECHILD;
 		} else {
 			parent = dget_parent(d);
 			dir = d_inode(parent);
+			take_dentry_name_snapshot(&n, d);
 		}
-		take_dentry_name_snapshot(&n, d);
 		ret = d->d_op->d_revalidate(dir, &n.name, d, flags);
 		release_dentry_name_snapshot(&n);
 		if (!(flags & LOOKUP_RCU))
-- 
2.55.0

