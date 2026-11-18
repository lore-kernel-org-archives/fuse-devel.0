Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965374;
	b=iZH92lopk8zkhO6Fc4kFw3e/IX608BFL1TfwJMEimj8XL9irsq1lXz9yMLd6rL6kg36g
	 8rer5wvd/iQXJaxc3+SlvxqvvHGlzHra8HIwmMxQ7Ybw/B8Z0ipwwucnxq5sfg4HvOLD0
	 /Kg+N5DIKTVUz71hc3Sm0wAxu1zQY+8gphiD5WrH7jGjPCGCFKD2wiwbPaEKaI426uwim
	 /gneyr2XJTPMZReEHEALeB2ERGjX/sCnmBb34zKTpd677MpeHNSxdOJv3mCXuoyx2K3Fv
	 14CZtDtJwc+RGmyiFCNs0VQ0z5JHZd3QDX7wVa7QbktmNAF7AETFHtfumM/NmOdRjxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=w3JSCXNwcogBu1PJnd6LhkuPj4w6tsB9fs1YwGA31yI=;
	b=AsMAGb1Hii5Y4TjdGg5e2HeptDUSVASHR3uEf6craiQJ5ROLdlNWKbGW9dwDNFX5P5fb
	 TTrBeTgg3vDd+JSk0Sl6FPi2i66kyPa13plCSoocdKr+LGGt3MR6NPfXVVyCxVvWdyX8k
	 l9x6OJIoWmo4vcZNN+1OpOhkNSSa/mM9QZ+vnmvGvwAbi8IYZQTC/TNurqVGpmMWLqEob
	 Hlji+ePxFP+08CY+DE1OpkXo1dWE552US0RdDq0EbKNgBAXTDvJyHI8stGiLvnhtfdZED
	 oeS9NORcmBAotXSGtVXoaecRzH0WBiV4OitrwPsXYnQmeERRNFoJjpu0bCzwdDLwf9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iOVjhCcy;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DB1606A32F
	for <fuse-devel@lists.linux.dev>; Wed, 18 Nov 2026 01:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63DB1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iOVjhCcy
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb86da313cso9317a12.1
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 17:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794965374; x=1795570174; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w3JSCXNwcogBu1PJnd6LhkuPj4w6tsB9fs1YwGA31yI=;
        b=iOVjhCcyrDLwEFfFpb00Fx6VX4nQNIxbMfhB7/36EeEn3EzuIzboP+CpCVhHxIbzF1
         +zwJ2Y/tgriXNb7ATF1lRNR6BTM4dfDXP1dD3Puv9fqXeWX0zI7AJnxkz4ho/2+PaVZN
         xWutdk1dvWqzXoK6TVr7twr3lfSvQQYjBOzxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965374; x=1795570174;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w3JSCXNwcogBu1PJnd6LhkuPj4w6tsB9fs1YwGA31yI=;
        b=1DFRX70pbk6p3KyP0MX1s3N08mlZzIkssTi29WQHn1IYovIwLy9euFjxoZiiJroP7m
         5pCG3B2/bUA3nBsFU+ZYEB8H653I4gr8He6Z09a8y1HcQrq92s6BOt7vHZKUMBUStz0S
         8Nev0CjLXELySx4n6DGcwCHCPBx0JFBnTZLg/bYA5kp16soqp579v7laYLS081z0XpF0
         lM5NfbX5KkmKE6wKzkQKAEaaT9iUga06bw4TBW13admH7GLpsGkkKnvJBv63e1Av0luK
         pg2JfGPL+Oqlys0Q8Mbv4ZDv8vYwqgbvT0FWjmbeU2UnCeTjKh70s6QvzRcxNeG2pNbL
         MUqg==
X-Forwarded-Encrypted: i=1; AL+hErEqgZ8uHah0pS4qS9i1ibunP1QRW8LocdavBKKi1K0M2Bj51TnAX7CAcYPpA8Vq0+KogaQbd3ujfDud@lists.linux.dev
X-Gm-Message-State: APuU4Z8eoRolJa5Dz1iS0k9BVqCBQVOd3v5JYJ2i10uLbYYZktsAEkLk
	egtEeC6A1QB1BXQQWK3AaUQhlv5AYbV3cZtWosSTjX/uOQJ8z51bGKQBkxgw8HK8DA==
X-Gm-Gg: AZFdTZfffSc9aRRoYWiS2D/KvTY168npGSswuoV19PLbLpVknBcz2ray4yXVl5YxXo6
	6/4m162MQyGz8vX7wOnwiWJiicPq2wjE4MjF9uOfjk+UYt8QQe2koLcbRGLlILvoCeJDyI+tewu
	bs1sRc6CfL3SwMRfd/MMjZYFbL61h7QPVgIjgAMN6teFmCMYfKWmHPUR1PLFr1HQhqlDcGnv57i
	0QFJ4IGQKdE2YQc1MhRl8gCNsCvqigygVODr79I6Oe7QEO8CXOBSCH9TA5rv8BtqIxJoSYFmOKs
	cuzL4+8bTa70hCh0mo3RcYh7TgL6ua+xZhXja7qELfztOu9saEdiRry00NBrX+gflP2yVX9zcoa
	o6V3meMnrefMCfAdGrxKyB2L+I82j0oO9E1zeVxD/zzOjCFepHTbsov27ww4dKXh2AQsZpK0+LX
	VVb0BcU40vVyfBg480IKNh3hNNYyMHJJUOyOb8dPUhPjgLM1Ljs2MlnfRAnaVE6MP5zHRk0Qqil
	nTo7yUbfiJSbmlTuvHUaHEwo5cfZgUKFgSPjyt4Am+f0JOZ2tkg+ZH+0AtLJBZT5J2pH5GVA4Ok
	IYH30SkZZd04hieTQjB9ttylrQIj912Gu3ZUG/7D4bbRvWO/8lfHiWO/cgoEPxrnoz2xBTVNujJ
	8/+vMq6Iy9olkJCHt
X-Received: by 2002:a17:903:3bd0:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2eff6f86b0emr15976975ad.0.1794965373725;
        Tue, 17 Nov 2026 17:29:33 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2eff5ed09b4sm4409835ad.9.2026.11.17.17.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 17:29:33 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
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
Subject: Re: [PATCH v1 5/7] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Tue, 17 Nov 2026 17:29:29 -0800
Message-ID: <20261118012929.290499-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
In-Reply-To: <avwp1ZpVudiT1Gux@gremlin>
References: <20261116230627.3537051-1-jeffxu@chromium.org> <20261116230627.3537051-6-jeffxu@chromium.org> <avwp1ZpVudiT1Gux@gremlin>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 10:21 AM Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> This commit message is just inscrutable. It's like reading Finnegan's Wake :)
> LLMs are obscenely terrible at this stuff unfortunately.
>
> You seem to have rewritten commit messages for the other patches, could you do
> the same for this one? Thanks.
>
> > Link: https://lore.kernel.org/r/20260519-panthor-kasan-v2-1-b7384458f076@gmail.com/ [1]
> > Link: https://lore.kernel.org/r/20260521105148.5497c281@fedora/ [2]
> > Assisted-by: LLM
>
> This tag isn't used any longer! Thanks for acking LLM usage though, we prefer
> you disclose it but in the commit message or the cover letter etc.

Fair point -- looking at patch 5 again, it is way too wordy. I will
rewrite it concisely from scratch for v2, and drop the Assisted-by:
tags (keeping the note in the cover letter).

Thanks for the review!
Jeff
