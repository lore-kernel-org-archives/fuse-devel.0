Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215136;
	b=2GExdBwoO/grY3yf/HW3Nr0AdhZdsteki0ROhuBv8OiVqBjQsjivC+ngl0tgmdsb6ZmU
	 4jFYaSjkeTu47UEDVtES55k6RZhH84UtwrFNeObI5a9k/hYNPRYhRKfrqov1r1Clx7w+t
	 VNqQmNAOtm3F4xYVAe0qYUGV1cnk3Blco3omZUbO9zYdCSoP8zYVRMZUObYd7NKeGBupU
	 zhuYw50TXJeT+onDzblTL/LB2k1jjG1Yc/+YDyshsm9gsYH9ybNU+LNr2gQJKo0Upixas
	 MjVvBPwiPv36gP/hck7pvpg/J6A555K4IUe3bCFxofg9W3jLwx5Cy1bh34gMZKQMK/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hgV0X4jY1dOn+LKwLYZEG/kajINoeEuxwPE9Ju7yIFg=;
	b=XFNNkyX3TyqP7UvOK0kgr7Dk49B8mLWmewpdzxfbJRWcOTg/tg39aLN42BrJlr9UvxNb
	 /dOPVBWm6AC4nU28urU7prg9TcPh8ZKS/jekzxlsGjWZL6/XCcHXJwxZUzH+wZ4mHmfbw
	 D/1jyneFeV68rQvMyKBTk2YvLL2YUMMD6DTZez0lDy3OUzTnOmp61hxpfnlbxWf+3kY8B
	 aMeS2yL+um+yYM3kHtf35Ub7tsooVCxof+aQNylpMluC/Zv80NZheSkkm52c/8FczEk5i
	 P4v+Aosq0cetG+SvrSOQAT9eHYzVz4f7ZLND9GKwcznn6xlW4bbsKNyfiX65DaZ0EUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZPRg0mLx;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A24606A325
	for <fuse-devel@lists.linux.dev>; Mon,  9 Nov 2026 09:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28A24606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZPRg0mLx
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso239799f8f.2
        for <fuse-devel@lists.linux.dev>; Mon, 09 Nov 2026 01:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794215134; x=1794819934; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hgV0X4jY1dOn+LKwLYZEG/kajINoeEuxwPE9Ju7yIFg=;
        b=ZPRg0mLxUZC6rIVYvRIqrvNAFc/F1DzR1NY9RFmsw892J8GG2gDDAu8NvkBHGhfq3P
         WZkdDvToJGUhi+6NULubshHJYjYcJQqHd9wGDYp1LvVIH2HSXNfFQjE70w5HEAS2+/+1
         QjQL9/vqDuIrXmpRBJy51Zq/S741Jvkg3jnSxKYfXYf68w6GvTlqpN3chl57WMK253oi
         7LOyO+ky8DnOLl5px0x/uhMdUFQxm9nLe9byWod412uckIBBafeIYcdzuXvImBtwy1OB
         FSVfYOl2h4JxEWIgDRXCqQuHXSBLmbrbMuX2HMlPssLEbIG0jOtNtgqwoTvFxJ7cSbEf
         Ocew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215134; x=1794819934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgV0X4jY1dOn+LKwLYZEG/kajINoeEuxwPE9Ju7yIFg=;
        b=q8xi7fUprBLiX1rH96VW+XhSXasxfky7pUjd5yRPgbGW/xa0wpO53vXMMDq0+Y6889
         co5uRgtVbQyFvz4Qzsj4XozJZNdewodsr1jo2Simanr8Q343464kjyk6K5V4IbyA7uN7
         peLqP8L3Fupb5cP+bfhMkQp1tO0p6SYhWp6yXZpzB57xdP08xkZqp5GAKkCpgIt/GkVr
         He8EMKuetIHriW0MOq9BHRIg80FvAIAP6tLio5bJjXgZAF1o1+RZxgxs7lb+A4Mywb6V
         SOnLqzWDGOAf07KgR5w4Rf+gQe8J8D4sKlrscrk/iN9Vlu49vZjeoVIIeMpSQ6lieXHT
         XGog==
X-Forwarded-Encrypted: i=1; AL+hErFY68/y0k5Qn6JaNy7Fqqg4Qxf2sOKmu04noq2CqYyrVg1M51WrNXBXR9yrEj48w56fVZwy/ssRZPv0@lists.linux.dev
X-Gm-Message-State: APuU4Z8QvwIC6KWZqZhdaEuDeaStB12cLwuCj9vM6kWxo6tVp9TXvE09
	1dx8Li31t9r3Zq5NaQj5A2/+KcrCy5YVfVzejbUSBkzNOV9zurKPX3pk
X-Gm-Gg: AYBFou07w5qra19aNd0DTlpog39WcifIcFD7OX2Db2uD/ug2Z2cDJ+zc+QCMbBZRIzW
	6zabfvqkMZSB9mS/cYKxVuSdQnt0HBynEJZG8I87btVzzrDi8i7p/zrFasD8TLVNKxObFZmtIu9
	aezfSW/OdMtox/lcejAAqHWP6/yR1OPGYbXhAZ1myd7OeRXXvI2BAa34M/odPzJHOPSP1xN8Tkx
	JhnSLC4s/EvTgV0MVufyXSoe44LgGB7L4kI3VaEqpfMWhqzOnYxODKJsvDrFmBG+2YJmbOmozKC
	psIQGTRETL4galNVpfYZzewZFrNh0rfhRrGz8tc2gf3sKXJiEB3n94rAu6pWVSBIY5d6kWMEKlT
	KHh5SMXHUju7wkifI0qpc1zutqzNxvF4b6rkoOLOFNwmaMtkg91JYFdnz9pgLdUOwMq1KQJISW9
	mWkxAnXT2zLPcUA5eVHAyv2FHGnhhfeYJX2QBF3CqBdOW/f5oNbicVZzaiM032sEP4t/JE95udV
	iN96bjLN+SlugWgenCA40qqmAE72pESgq4suCL2130beBuJmwDclCpwlEvEfB5QJS6HXd/YD55/
	6Pdpu39ErSR3xC2yH3ueMGg=
X-Received: by 2002:a05:6000:2210:b0:48b:a7:6396 with SMTP id ffacd0b85a97d-495844a3a48mr6683329f8f.41.1794215134134;
        Mon, 09 Nov 2026 01:05:34 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596ea51cbsm9541323f8f.27.2026.11.09.01.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:05:33 -0800 (PST)
Message-ID: <8ff83fbf-2ecb-4f9b-ac8f-ee88fece67cb@gmail.com>
Date: Mon, 9 Nov 2026 10:05:30 +0100
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] mm/gup: limit pagecache folio refcount when
 grabbing references
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Song Liu <songliubraving@fb.com>, Rik van Riel <riel@surriel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin
 <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Steve Sistare <steven.sistare@oracle.com>, John Hubbard
 <jhubbard@nvidia.com>, Josef Bacik <josef@toxicpanda.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev,
 linux-arch@vger.kernel.org, iommu@lists.linux.dev, stable@vger.kernel.org
References: <20261107-refcount_overflow_stable-v2-0-c38f6809b106@kernel.org>
 <20261107-refcount_overflow_stable-v2-5-c38f6809b106@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261107-refcount_overflow_stable-v2-5-c38f6809b106@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/26 11:23 PM, David Hildenbrand (Arm) wrote:
> Let's add a folio_ref_count_over_limit() check in fast and slow GUP
> before acquiring additional references or pins.
> 
> Keep it simple and use the check for all folio types.
> 
> Don't check capabilities with IRQs disabled, as even unaudited capability
> checks can take locks. Refuse access to the admin reserve, so GUP-fast will
> fail and fall back to GUP-slow if possible.
> 
> Also propagate try_grab_folio() errors when grabbing additional
> references in __get_user_pages() and in memfd_pin_folios(), so hitting
> the limit returns -ENOMEM instead of -EFAULT and -EINVAL, respectively.

nice!

> Keep the existing invalid-refcount warnings.
> 
> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
