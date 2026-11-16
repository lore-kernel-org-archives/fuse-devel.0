Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870414;
	b=wufKJUDiLNQrkeUxgdo6IjeGZ5TjEAEPPJ+LyCMvECGqE9/iXn0A4whZ79J9sfpGluXI
	 Kjyaa2CcZ/d9T4IqVXi9QMDV96IlIk7Y5jOZu+iTM0I3Iy6UYUNRtwF0AJHPrsPyuJ6Jx
	 4F3JjQiB/b3ApW98WteOYJQXr8R/BsADeUtBSkHyXSZaE4KMiL2Wcgn4Uj1erBBs4VtgN
	 t+WZOJvKs3XJgoLQHJEtlfEy41JJCq4D6FoSpgBZhe7RQ9wMqU8HqB8FYYb7xeI6ZTkay
	 rcKrmhDyo6RRgP2kIMbR4JltuCbgyUS3+3wOmjdPR7pBSQN4IwDtrCGfDnQXZuh4axA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AjhVL/tzJIhPQa9pnWiA/Lzn5A7WcpHhkbmWbBd9Z/A=;
	b=ssifXYysifoh2IrlIKkA5ukTqN7u/0zAJqysPc4x7MOrjRL1HRhfaoQHSCe22OdNAboE
	 8N7aKr7wqc1bzFxzewBKuQgMl50pxbqzXXirZ6j3ZrZc2VXVkkrf22XB+xDgRWGbvpty8
	 +xIsyqd7xJ9R5zNRcZntBfJ/9iO+lVhrwBqAXmyAp3eL1JMpKZwfyEDfISS/6aDwqEk6e
	 kXKz+kQ/Ai594DhNIP0rP5ZUPV3e1R6garWikd5GxtOp0ofAQQXIjxPPD3kmB2E8a1uBo
	 reG/riOx4CFFRxoz9YPF4SmA8xJ3kxpjZPjtqPl7j1h0beKUWWCY2V3g5HUCLWtEp+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=d0R2RYZ5;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0128F606A89C
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 23:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0128F606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=d0R2RYZ5
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd5e295c8a6so251245a12.3
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 15:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870413; x=1795475213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjhVL/tzJIhPQa9pnWiA/Lzn5A7WcpHhkbmWbBd9Z/A=;
        b=d0R2RYZ5kfCk2TmlBEEDYp4K79DQe++r7UL8E/vom580JPxm46ksscUmVeFgrgaCsC
         9TBh2/WQbII7TiruEYCTMX0Nc+78W6z0KhfMlTjeRPQ6kxcmBy8HbFVEoHkobCgZeiah
         7WPftPM7OZ+jeP/jerhVrCPx7UN0lRiaPjCbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870413; x=1795475213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AjhVL/tzJIhPQa9pnWiA/Lzn5A7WcpHhkbmWbBd9Z/A=;
        b=N+X/Eh4w5+agEAizsUehSXcUFq6gN2WK4qGqOx9AtzTd5AJrlDWD3/RDVoyMOsnV/D
         aaY5jjzhTLlXm4ezTcPApPTvSpYuvUg1Q9mWh8F+kwsQtzbtSTLQYUKGTTZ5I7gvKq05
         WdWKtDJJRkOhfu6hwAuB3jD/irNkY09ij+JgJFW//ZjGi3gDGgQsik/I24NhedxQyfqk
         rDf56Edr/8QbxVfSVzFKbthEnFc42JBRla0DUEbRU7Udbfu9Y9gWO0shXNQ7g5JdrHYR
         YZS9pNopUYYVGp9PEdXuWR9zPwMaeBuZXpROmNYFUg84I3RG5ZstpUiiIOiidCbTk5Kk
         2aAg==
X-Forwarded-Encrypted: i=1; AL+hErEPdK9hyvIUFCX2CXGTIX35cV+6psd8DpXQAEqBL4iOD0nXjHmQLbgJkAN+z6byXk14TRqwxVzbBDv2@lists.linux.dev
X-Gm-Message-State: APuU4Z+NjnVR3n/h+Te9s8Sv9zbluJBzHclBzFSmyEeNaiYmETnIM5Cp
	yG6H6TrGghjS9fbLbcAFMYZR7wylB+2gqKyWw7e2J9vkUNZnOU8qcyx+wWqpR9Uemw==
X-Gm-Gg: AZFdTZd4rNb2g7CFeHJ/Z8UPakHtBs2ml/zRMPQwrGKGF36rIQiuYXCP/JN5BMLOLF9
	O8rtqr9eF+GzGbFTgjzlquIdTk/H8+Q1HofIiYxxc5hgblS2+xfeQCaOdTFOpXVb8tPBi+MTKN4
	mY8D3vstCTIRUE+TDeDfgpTHqG1jwYoKXkFE1LizQ4KuAcPW07UHSlFSbt9MEQAC3fwXfPFztJi
	VI7VwBgyxg/a9Hd4ThBCXI/gPFv7zAid8VzguDeSgkSYiwqwIOu8fNZ7fd9PUQd2lzd/xOrAt+F
	gtA+jZALHftN3wYjT4bSKYZmeg+6Hcky2DLG9vwmRkcPgNORjcsv3Fo1RmMfywZPVm2OfZWDV+j
	aVgHvygH+tveNjNvrp2FPrg2wCPdjwhPXPaNFvHKp8Z4lvM/02Mu/8swl3V1sAb+Gq3cJLMA65V
	aV0s/gpJjOwsiQyO+F05UZCrSLyWIZfU5GJkWuVdXPxtLH227Dr6g9JJO6Iwu5Hhs5lw+k7lVCM
	x9PEVJ87Yc8BposuvtB2bIP2WbYG4fduQ49BAixftBjtHic/d8/XqsB77JsBNRL069Fdlbo/koZ
	o/THYTmCw1/b7XpMsVPKHJ+ypFlZtqVb+/v2TFqDFJfP2LX3KMpfmzWJGZS9xLnfXCI+R04=
X-Received: by 2002:a17:90a:9f98:b0:3b3:b15f:eb89 with SMTP id 98e67ed59e1d1-3b3b15feeb1mr322004a91.1.1794870413060;
        Mon, 16 Nov 2026 15:06:53 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b3abe8b263sm1120450a91.13.2026.11.16.15.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:52 -0800 (PST)
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
Subject: [PATCH v1 3/7] kexec: use GFP_HIGHUSER_KASAN for segment pages
Date: Mon, 16 Nov 2026 15:06:23 -0800
Message-ID: <20261116230627.3537051-4-jeffxu@chromium.org>
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

kimage_load_normal_segment() allocates the pages that hold the segments
of the next kernel. The kernel clears and fills them through
kmap_local_page(), and they are never mapped into userspace.

Allocate them with GFP_HIGHUSER_KASAN, so that they keep their KASAN
tagging when GFP_HIGHUSER starts to skip it later in this series.

No functional change: GFP_HIGHUSER_KASAN has the same value as
GFP_HIGHUSER at this point. Build tested only.

Assisted-by: LLM
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 kernel/kexec_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index f4a31565c447..a3abbb6a2d75 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -839,7 +839,7 @@ static int kimage_load_normal_segment(struct kimage *image, int idx)
 		char *ptr;
 		size_t uchunk, mchunk;
 
-		page = kimage_alloc_page(image, GFP_HIGHUSER, maddr);
+		page = kimage_alloc_page(image, GFP_HIGHUSER_KASAN, maddr);
 		if (!page) {
 			result  = -ENOMEM;
 			goto out;
-- 
2.56.0.611.g1030f0b940-goog

