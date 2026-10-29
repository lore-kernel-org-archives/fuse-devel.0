Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270366;
	b=M0t4yyrRRTWCTfMjQqCJrDQkNr3rf7BlGlSPSkjzHPIynXFrai4Hsbods67VPjEc//b3
	 m6sCIaOJ3qTpzCfXqc1099H3XRqMKnN3vjKKIHDAY92tL3UKYoqOHtO0Uhy1lFpNF6kDT
	 XOS0gt5QJDsfnm2NqMBa2uQ4kE2RsSwmGGOqngyuLsKzBPhK5vsqMaH3Hsk9vfLKrfmzK
	 wg5Ldt65b0rzpXT0sdBJOtVxaqB66f+MmTyrFRy/dt4FaKau90IcYO9/tmIsiPxD2+KGD
	 xFjNO6P+y1xGQ147oFPhJMzLQ33h6bIzwRLVbVR8Bu9PUuZ5e5sc0SHJYoTrVnyss9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IOabLZqit7N24WihDjnsU07Wy6C2IdsvojlsD2HIpZ0=;
	b=SswxNppK00MULPCAl3CWp/Le66HyBuq0fHi7MaRC9ryWZt7hJ8RTH2JTZnf7bWc9swzV
	 aQwcEXylogkHXGPbSDMknGt1PABDvyWLCqCf/LKDxEanZde4VgmaHDfh2mjq8XKl9zXZx
	 04QH0hnQYdxcb7RmiYZkn4XEat35BY0XrIxVi/xrAy/A57vGlKVChdJSLYqYlKf7YcO5o
	 tSCeVge3oGylA35aq5Yx5hvec+gUDyrArJkXtGPOecYme0ESOb4PU5usFIzh6t2GpxRkI
	 TyIeUL80KoOkNfo0T+FvU+eIBmyAgWbwH4bltWNMT/Hx0vP65alBFF3YOZB60gtPZrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pqP0/bK1";
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5CC60A2618
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A5CC60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqP0/bK1
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so303965866b.3
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270363; x=1793875163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOabLZqit7N24WihDjnsU07Wy6C2IdsvojlsD2HIpZ0=;
        b=pqP0/bK1SNHB8mz0h5X0slPyg9MSy59l/xOUe78zFI7IEdm19ow6J8grPY2bF4aIQB
         ZIoNRUJF6FAk9vLn2hC5tjH2+gGLIU2KagxpITHJV1E4tnJqRatQT1OzKTt/vGRfAv98
         4VDr3fpJWp7lHk1WpHgJn8n7PtnVQ5KE+Yq4C8NSHBuHbr2WkWX887M71wRR2FEKMDZP
         Zl3X5A/vmJXwn6Zc1wMjYT1CnAk0n+rzLuY63jrIiJcHoB5JI/4+gWe9BqgWqXyThUvK
         TEmkSJeY3/aSyvbhhweGZO+BhBvjFR58yO8LJZtHFuMwehHGvRunlf6Lw/zEX8EQ23JO
         7s6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270363; x=1793875163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOabLZqit7N24WihDjnsU07Wy6C2IdsvojlsD2HIpZ0=;
        b=jqnYnOX5bISGU8haoYcxXV7cnO8irR/u2LiUeyrqVnL2HQk8FoZTuSfsKGk6O7jRR7
         5TRIH2uEnREoHR7GpwpaOY15raJxm5sA9eMsSZ6FaEH9kjNN60Bc0XbDBIXlyi1a8c0G
         Fin1g02W2K81cQUO3YatVaPUOf8cd0ndJrE+1mvBE7XBEFjmBFh6hfbLqh6xMWIZbqp8
         a6+zs/DuGbqf0We0il+V5k09haWU18+YNNG+L0J/MQIfzbanyiEkWcbtHwu7H9ttTQ71
         UI59MKbXGw2eSWsjeL7ZEBGHQx6+goXwh6PZrOUTxDxbfM4usxg8Lri83GPsBZ3Loy44
         WbeQ==
X-Forwarded-Encrypted: i=1; AKwUvBww0FUaobXEXoNsW07gnEPZkf0y7qt9UgCoP7NLSn8R9lUCDRZ3G5Tcdc/nPV1li1vYBoVhSWJyOJoA@lists.linux.dev
X-Gm-Message-State: AFq9FYIOPceb96KFZvQ86fSg/LRBrvWQkg/yXkfOVD3PI/uwGOkGUles
	Gu5dUkbRO0WTHA7lFzOgiSyjUAtxGBlZScO2yCdOMf973X4RncJH/KT/
X-Gm-Gg: AYBFou0I7wD3KlW7I19qbfjUxwHlUthsRix2HtrUGR+l5lTV8tehNkM2IUmd+PROUCt
	ZODIBZ9G2ikws2mh+YC1hR+ZVJcVtbFSZ3jcguJCW/ZmIZT2lLQcrjTmXgBveUCPRRALREd6tAi
	FFyMtIS7zespJ2gJQms5DYT4sn/Sr2/3nL0Ed6ACYuFPwLbRxSjc/DuwIOgKnEsfH5DI5k/0CJW
	Pt6VV7hQ/FMkqIabNjklLo1CBIIhNrpZ+cDHRb3iiQvOMZlFW7iTECP3D/B5sQPVbHHG5fSCNUQ
	Ur914Rv4Q6U+WscC90OWQ8/iVkb4zpOcRkMaNzg1BPVwehH4wuij2hiNEGnL7dwPwTuO5XzZnNa
	awejTs3Rgdo8Yn0lxvGI0G++IPw+AkvGbwYz9Y/Ce/v1rCsRuLPmZvvV0LSMDgGGs+lGibOvX68
	qVmqHlJzzogQfa3eOxgs8TVJOq8WJSnnequssJ7nZ1WsPUUQdyK7W08xfDu+ykOGR7MUuOLQFAh
	ArUyrXHZosKrnpsevW230InFS59EEkiWKDXgbzFu0lXL+wp5KINw+b+boV4pU5oWJaOdbqkwuCZ
	Gq7PH4XM8xz22+m2JU/w0KynR73Wxt2CZdDs01TO/bsn+ZPD1LBgt5yz6RUgZvlbhECbW1+Xzg=
	=
X-Received: by 2002:a17:907:980c:b0:c2e:2baa:a642 with SMTP id a640c23a62f3a-c49bdfb1ecemr433472266b.30.1793270363333;
        Thu, 29 Oct 2026 03:39:23 -0700 (PDT)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89e6sm719465866b.20.2026.10.29.03.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:39:23 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: [PATCH 07/16] vfs: add try_take_dentry_name_snapshot()
Date: Thu, 29 Oct 2026 11:39:11 +0100
Message-ID: <20261029103913.2785828-8-amir73il@gmail.com>
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

take_dentry_name_snapshot() requires the caller to keep the dentry
alive. The external name of a dead dentry has a zero refcount that
never changes, so atomic_inc_not_zero() fails on every retry and the
function never returns.

A caller in RCU walk holds no reference on the dentry. Add a variant
that fails instead of retrying when it cannot get a reference on the
external name, so such a caller can return -ECHILD.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/dcache.c            | 29 ++++++++++++++++++++++++++---
 include/linux/dcache.h |  1 +
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/fs/dcache.c b/fs/dcache.c
index f44c7b39c3b38..21ac036b31675 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -358,7 +358,8 @@ static inline int dname_external(const struct dentry *dentry)
 	return dentry->d_name.name != dentry->d_shortname.string;
 }
 
-void take_dentry_name_snapshot(struct name_snapshot *name, struct dentry *dentry)
+static bool __take_dentry_name_snapshot(struct name_snapshot *name,
+					struct dentry *dentry, bool retry)
 {
 	unsigned seq;
 	const unsigned char *s;
@@ -375,8 +376,12 @@ void take_dentry_name_snapshot(struct name_snapshot *name, struct dentry *dentry
 		struct external_name *p;
 		p = container_of(s, struct external_name, name[0]);
 		// get a valid reference
-		if (unlikely(!atomic_inc_not_zero(&p->count)))
-			goto retry;
+		if (unlikely(!atomic_inc_not_zero(&p->count))) {
+			if (retry)
+				goto retry;
+			rcu_read_unlock();
+			return false;
+		}
 		name->name.name = s;
 	}
 	if (read_seqcount_retry(&dentry->d_seq, seq)) {
@@ -384,9 +389,27 @@ void take_dentry_name_snapshot(struct name_snapshot *name, struct dentry *dentry
 		goto retry;
 	}
 	rcu_read_unlock();
+	return true;
+}
+
+void take_dentry_name_snapshot(struct name_snapshot *name, struct dentry *dentry)
+{
+	__take_dentry_name_snapshot(name, dentry, true);
 }
 EXPORT_SYMBOL(take_dentry_name_snapshot);
 
+/*
+ * For a caller that holds no reference on @dentry, e.g. in RCU walk.
+ * The external name of a dead dentry has a zero refcount forever, so
+ * take_dentry_name_snapshot() would retry without end.  Fail instead.
+ */
+bool try_take_dentry_name_snapshot(struct name_snapshot *name,
+				   struct dentry *dentry)
+{
+	return __take_dentry_name_snapshot(name, dentry, false);
+}
+EXPORT_SYMBOL(try_take_dentry_name_snapshot);
+
 void release_dentry_name_snapshot(struct name_snapshot *name)
 {
 	if (unlikely(name->name.name != name->inline_name.string)) {
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index 4b1ff99608e01..a4be11ca2df18 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -629,6 +629,7 @@ struct name_snapshot {
 	union shortname_store inline_name;
 };
 void take_dentry_name_snapshot(struct name_snapshot *, struct dentry *);
+bool try_take_dentry_name_snapshot(struct name_snapshot *, struct dentry *);
 void release_dentry_name_snapshot(struct name_snapshot *);
 
 static inline struct dentry *d_first_child(const struct dentry *dentry)
-- 
2.55.0

