Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870416;
	b=B9LZNlKq4G73pciBQJu8bwos+MdyuX0VlanMgZj1WWe51qEp9t5Ws0XX7lGw6YjYPbhc
	 14z4EcQwM4z7K2Nf8WQDxs1QAcpMxR9DPIVYoP+KZR+whykhpJ8TLFZgZVZOilH/8H29E
	 6XQXku8+dvoaVFjDV+LxIw6jgOsC/AvH7VMy+quKkT97FQC1qptD3YSgIr6e1M5Hciixr
	 UjUdbuWSOJth8WdoXYWieh1YXPp/nGV47F8nwAfRx8hGRwAxmsSInTJ4F6sdnToc5Y71w
	 0roCMM5Cf8jAulC2M+Mixk4c6214t9JhWcypXiEtNCCGTzsl1EiKLRETT7/wt01h1Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zVQdcEYHvCyjprjE26wtkXBdOfSzxTsxBRAupk9G74A=;
	b=LmtlOTnrrRa0+wdM0HF1JG8HVukHYNRmLNhywtYfk6evcj5FYiN19utUpzdztKMYCzhb
	 5AYeJG8HmtOjbi63AnRA7fYH4V5VBSz/7PQIpXxckYKWw7DGUvftbrGI7emk3UnP4lNeJ
	 MGuGotYhNFJP74rwVxV5FEldWjlO0DlV5f93AFDYVuEAecE8VcgMtsgQqfRRb15F102BR
	 vgFraCazcuuIflX9YXBPoAUIoyyN/WV7UnKbCaiEmcbKG8Hd8xgCm+cZh/90/JNZ4l+5e
	 O8MShfFJdyaNccqdjNAqkUIg6krYER5s7C3GKZQa28cyY/Vzpc/v8PudGOj0uJiMzqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Z6R0RH5o;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1BF60A3808
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 23:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A1BF60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Z6R0RH5o
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b5e147f101so405804b3a.3
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 15:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870415; x=1795475215; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVQdcEYHvCyjprjE26wtkXBdOfSzxTsxBRAupk9G74A=;
        b=Z6R0RH5oEMgmWc7e/6YglNrKUXp/dZfln4Ly6ynODs1o8K95qPYuwHygIQuP36bXFd
         4+hvqJbwMm88tUl4u0aTrpV1t7QboT3WF85QMrEdgKNsjb74JWeLAR5WigncKqlk7bzY
         gGGCztdpKaUzMrJ/dJ5AC/rUh7/UFKS1pFgO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870415; x=1795475215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVQdcEYHvCyjprjE26wtkXBdOfSzxTsxBRAupk9G74A=;
        b=r2+z652ZEChywjM5ZjJzXu37a+JEqI1y6nlKlOFBse7um02wx/pFTfeca9E9QC1vLy
         lri3I7qPHhKa5G551H3ZJM+K4CsiZ+lk439yWejUUug0Bdnr3JMM78Yb8ihza749k5TL
         OpPXJ9CVb5IrceHnGk/Gr0GXswRUA7SfYrp/9WAdwO+qEzXPbl18T6ehFRxn1RB0Us6Y
         H9TCJZovwUMuQhJGM87lI6gEbyY6T4vh9gt+TRdFFvPiyk9aMrpp0ohKks4jEQ+kPhDg
         CgFwIvI+hRs0H0qabi87RlI/hgwrCDZyqHUcwxyLp79ETc2go0ra/nmASNBcy9Yq5IWD
         Anfg==
X-Forwarded-Encrypted: i=1; AL+hErHilu+D4X4bT+lrO21QqUAWpxMHXOfQMEPNJN/O1K+mXYTx/l2QejLFQ1W04/PhSUZ7ZMwPNx8cVUjc@lists.linux.dev
X-Gm-Message-State: APuU4Z9T3r0DmMd1UvMHWlK60ontwa3d3xaY/zrJqnZc1qecR5Yb7JOr
	zDpsEfeFF5ipI7bOypoBHXNyiZ8MeMLnFUgfYtqllJcxDL5vmVhhxUHiGfOpbg4IWw==
X-Gm-Gg: AYBFou0WKQ2IS9oj1EzZXrQegSDUa4aLZDqDlafKvXTVOUdAEmUscvIK5ILmYvHaWD6
	e2sVoYo+lsDmRQ2+dJGHQkXMmwKSaFl2v681ikfRlu3RkMq8BdLHmfmpgEkd9sd1tbIZ20XR+WD
	J6lkIJh5hD1kccR1fGEFfk15Lxwa2wWogVaLBgScgIprmgSBy848rlhVUzYnnc9hrmrykAJk+EU
	iKJlDVfUgmpB2Bhm0AZZaxTqGMMf5Qbe+Iyj/63QYjhJ7VQptkZHe9qgzdzBKaS6bieW9KMEFgv
	T+lj+zPqdyyMVeY6EMKlyojwAHER//fOzHFBpNYWWEZNhesp09KKT6gH75B4d/KnXD5GHkg0g+v
	HKEj6CdR/UZiLee9IW5hvqqBXbgMHXhA/AZUweacIcP4CFIRrCSelG83VK4c8/lvwYLT3JIWLRe
	n4xL6hvVxenHtLAVh8arMrdmo+e4iFJx0S+nljVm16akmwGIWmn702UqlM6TtZqShadBNVy3qTU
	iyAZFkRJhVwLFGffqR4XVavKNQiI+TWkky3r1msLa+umC8Q4VDBk9eY6bdTAxNriAm8lPGVv5TB
	bw+dwpZ7qnGfgtNmlHZwmTevBd3I4k5q8TrdtDMT7W1n0Ee5zTgqhhYzbInq0S2WlZ3q8CA=
X-Received: by 2002:a05:6a20:3247:b0:3ed:b9c5:df15 with SMTP id adf61e73a8af0-3f7a6aa5facmr12150421637.1.1794870415604;
        Mon, 16 Nov 2026 15:06:55 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8bed1a6dbbdsm4310921b3a.24.2026.11.16.15.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:55 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Will Deacon <will@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kexec@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/7] net/rds: use GFP_HIGHUSER_KASAN for message pages
Date: Mon, 16 Nov 2026 15:06:24 -0800
Message-ID: <20261116230627.3537051-5-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116230627.3537051-1-jeffxu@chromium.org>
References: <20261116230627.3537051-1-jeffxu@chromium.org>
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

RDS allocates the pages that carry message payload with GFP_HIGHUSER:
the receive fragments in rds_ib_recv_refill_one() and the send payload
in rds_message_copy_from_user(). The kernel fills and drains them
through copy_page_from_iter(), copy_page_to_iter() and kmap_atomic(),
and they are not mapped into userspace.

Allocate them with GFP_HIGHUSER_KASAN, so that they keep their KASAN
tagging when GFP_HIGHUSER starts to skip it later in this series.

No functional change: GFP_HIGHUSER_KASAN has the same value as
GFP_HIGHUSER at this point. Build tested only.

Assisted-by: LLM
Cc: Allison Henderson <achender@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-rdma@vger.kernel.org
Cc: rds-devel@oss.oracle.com
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 net/rds/ib_recv.c | 2 +-
 net/rds/message.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/rds/ib_recv.c b/net/rds/ib_recv.c
index aa50b85b0f99..907bf2977583 100644
--- a/net/rds/ib_recv.c
+++ b/net/rds/ib_recv.c
@@ -316,7 +316,7 @@ static int rds_ib_recv_refill_one(struct rds_connection *conn,
 
 	if (gfp & __GFP_DIRECT_RECLAIM) {
 		slab_mask = GFP_KERNEL;
-		page_mask = GFP_HIGHUSER;
+		page_mask = GFP_HIGHUSER_KASAN;
 	}
 
 	if (!ic->i_cache_incs.ready)
diff --git a/net/rds/message.c b/net/rds/message.c
index 47d5e9ab9b10..80171ae2f40e 100644
--- a/net/rds/message.c
+++ b/net/rds/message.c
@@ -515,7 +515,7 @@ int rds_message_copy_from_user(struct rds_message *rm, struct iov_iter *from,
 	while (iov_iter_count(from)) {
 		if (!sg_page(sg)) {
 			ret = rds_page_remainder_alloc(sg, iov_iter_count(from),
-						       GFP_HIGHUSER);
+						       GFP_HIGHUSER_KASAN);
 			if (ret)
 				return ret;
 			rm->data.op_nents++;
-- 
2.56.0.611.g1030f0b940-goog

