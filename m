Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870411;
	b=jh28uV/lDVGdQNRLvcO4SHMUwx7MF5arAfnAsXO8qD6b4XEBnw6C/0loXVNK7+vcMmEZ
	 syuyXn8WZNs4XImtm0fr8uBxTDEZBFNAWsTVL/XOuU8spN+qspUiVMCjAo2EId+dGy3KD
	 vBUMx8h8fFTHFKuY3VsivMwHVeVQ0BZ3ljlSKSsaXHmpn/UvwQTqM62NAj8AIJau1f6y3
	 GFzT6oiU1VcXY21UoPewNyehKyqAkpCewJUKxnSokVvo2x0xzBsXjbKl7KKxmtzFUaiNG
	 SDX09qeVvHrmkIb1FaE48ER4Ot/MYpzt1ljgeIRDagIx6K01Jp9MiZEI7fqD7jEeTMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=04YMYN0F09iXpQbtyDGXKPSGIzq5fh/Gsn7Dty8ViAw=;
	b=K5owJknjMbRWkLJ59jViVDYIZiwyK2WOtuwtsgAVrvmzRuBO8GJJ6EosmAOnhmUJY4q/
	 KL9pfv1L1L9i1HRUYlG8JANKChlJWz5iR8vpc2YCFu+WesUUhUhq4vy9Jwbb0+NshqSRC
	 ooLlrqAOv86D/z8+FH27Hi+TpadG/L9fkbD7SnDDLCUhY4CMLvQghwZ6BuPGQ28fqHHjX
	 sArIPJvEuWHRhbDcR490dYqLXLNQ6ZleTmwfT4my9mhpF7gF1ktB9om7aXyJMdDeSrXRL
	 aT3bAfST3LboaRL8aoufjd7F6znP7dRifaiRM+J/mt2z+ByEnwoXdoVWRHS91JNGMmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bKC9fON5;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7EF60A2614
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 23:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E7EF60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bKC9fON5
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b083afebe4so728127a91.0
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 15:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870410; x=1795475210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04YMYN0F09iXpQbtyDGXKPSGIzq5fh/Gsn7Dty8ViAw=;
        b=bKC9fON5npLCpGs0YwPmCpdqDIDvr0hmHLYcy6Z5DG84j3Rg27hby51xo1aMBUzQTD
         PpoHTm87jkbD9ujjJv7AIR5n7BXni9MK6PpTH+twJmZ90ibDDxuBOqiZPiOquAr4lo1V
         FaGVqA08EZcxuhzyhUl+61lYtJk1jA7OKbJHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870410; x=1795475210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=04YMYN0F09iXpQbtyDGXKPSGIzq5fh/Gsn7Dty8ViAw=;
        b=fe2t69wcHS1bazNZ+eVFpdpngaTT9Vd46uowlW4kxLZjcJiTQAp0NQKl9S7Z51ZNld
         +QULNMP8+Qv4BioKA9F0KgE7b1SfSm1sDj6qeuqilUHKMA3lq5bibCVe+m+rl00jJRm7
         z5i3LGNXFouLINXFXPc0dWQY3RJZX4+7L/oQBY+kq8OOlXTIe9hxgDxxtSzE8Kr2qvAP
         XG1nW5tRm2ep3WRgh2aEVxotyNX78+U88qYT+8my3KkZjgCMIlue+mdkFHsF+DUJJqtW
         saaBr9q5dA6unv9uZeGy+g96p5by197XJyFl4hK+mMbAy09+pcpGCPlphEiUzCx5GPDB
         pWTQ==
X-Forwarded-Encrypted: i=1; AL+hErGnIF5kbmwFzGfochPKxBWugQKg0TcHkD6aA2Mp+ui8AS1GmDdr+0o3JvavVRNl0aDRMgTHrgeas8TR@lists.linux.dev
X-Gm-Message-State: APuU4Z+YdyiElVuQjCWVgfjx8p+e8RoeKT7a0zzd9wwogXGl9HlC7uBn
	e4xL4QF9RF0VtJE360G8X48HqPZWL7rbxNWL/fnJxrG7sOF4hLbeHpV7Zi7B2PAxJw==
X-Gm-Gg: AZFdTZczhlCnFf6iLUkndhTn91UajvlM/aOoSt+zYfm7hUiRfz0hnlBhgsOCnwraw8k
	3tHOHSenrQfBYNehS22oR7tIvgL7rTh3vzc6C239Va2NN2LGPcwpJ49HcK9cvGSXzerVHSj0k7n
	UeZFOhLKcRKa/Bx5UWVTQXFWLgaVnqYAiwYKUc58DjgCTkvs3FDcTdl8LeNqO123kmzCKQxjmC1
	DH2R0W9smVu74Nco8MeKzvtHLh9wedRVbTSSnYN8x9yymcEjxpw53emVyfv3yjzNfJYKsYx7HqJ
	tyxmaONgUZgeu0j5qV1fygYF6LnzIFpsyhhhUK0GvhGyQgn/ULljp1gpTOB4VCJ7sv/AQY1vq1J
	a+Aneov6uv51fXjOcBaXrDaT6fRTY871+risbRM7S4OGCn/1CubJxzoVnPr3zX+d+nJ5JfJ8IqC
	0S/csGfFgIhongTHnFbRJvUNHI6rBEXKXFHinX1Goh6RWtsoiiUiAt9YPvWHjrkDwsXwmEYMXtA
	KoXa8uqKR0kMLjwRgMrEmJUNhbyCUC+Vd+AmOOP5o55sBfbyADX4pBSoZ8QFPPh6F5OUBb26pDP
	hh/wHhApaWN5zcAYuc5FjJGX22gNGIGFcv/HzuwN3EhU9ba/UjxYiNhLmVMhy/9Auj0dMM4=
X-Received: by 2002:a17:90b:1650:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3b1b05fccc2mr17699416a91.0.1794870410469;
        Mon, 16 Nov 2026 15:06:50 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b3abe8b263sm1120355a91.13.2026.11.16.15.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:50 -0800 (PST)
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
Subject: [PATCH v1 2/7] pipe, fuse: use GFP_HIGHUSER_KASAN for pipe buffer pages
Date: Mon, 16 Nov 2026 15:06:22 -0800
Message-ID: <20261116230627.3537051-3-jeffxu@chromium.org>
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

Pipe buffer pages hold data in transit. Pipe writes allocate them, and
the kernel fills and drains them through kmap_local_page(). The same
holds for the page fuse_copy_fill() allocates when a request is spliced
from /dev/fuse into a pipe.

Allocate them with GFP_HIGHUSER_KASAN, so that they keep their KASAN
tagging when GFP_HIGHUSER starts to skip it later in this series.

No functional change: GFP_HIGHUSER_KASAN has the same value as
GFP_HIGHUSER at this point.

Assisted-by: LLM
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org
Cc: fuse-devel@lists.linux.dev
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 fs/fuse/dev.c | 2 +-
 fs/pipe.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 3641abb90d6b..fdcb11679dbb 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1044,7 +1044,7 @@ static int fuse_copy_fill(struct fuse_copy_state *cs)
 			if (cs->nr_segs >= cs->pipe->max_usage)
 				return -EIO;
 
-			page = alloc_page(GFP_HIGHUSER);
+			page = alloc_page(GFP_HIGHUSER_KASAN);
 			if (!page)
 				return -ENOMEM;
 
diff --git a/fs/pipe.c b/fs/pipe.c
index 4fa69192e6fb..87792ef63564 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -155,7 +155,7 @@ static void anon_pipe_prefill_and_lock(struct pipe_inode_info *pipe, size_t tota
 	}
 
 	while (n < need) {
-		struct page *page = alloc_page(GFP_HIGHUSER | __GFP_ACCOUNT);
+		struct page *page = alloc_page(GFP_HIGHUSER_KASAN | __GFP_ACCOUNT);
 
 		if (!page)
 			break;
@@ -201,7 +201,7 @@ static struct page *anon_pipe_get_page(struct pipe_inode_info *pipe)
 		return page;
 
 	/* FWIW: This is called with pipe->mutex held */
-	return alloc_page(GFP_HIGHUSER | __GFP_ACCOUNT);
+	return alloc_page(GFP_HIGHUSER_KASAN | __GFP_ACCOUNT);
 }
 
 static void anon_pipe_put_page(struct pipe_inode_info *pipe,
-- 
2.56.0.611.g1030f0b940-goog

