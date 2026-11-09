Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213330;
	b=iFvJzaRGlqPTpcNvAHQ3MqQ6K2sYJfjbTNClG/XJf5Y2Rv1aE4f2aGDWOBFM11qTptK9
	 50SeXYc73KjbuBTSZU6Zig8HlHWN3Z4HqTdSxUlgRDcwHwFutbCNcLKUFNVGY1s5nQyTD
	 Yk4sjSwlkLHN6OxDa2C2nacJ8js9qBOlu4PeeuZ/uhumGbTte0Fxz+xs5M+cW4AoXkHWY
	 R4HbBG4GtzLuQlzwRWoA6rMQ0LZWKEIRcXB1aBm2MAwKGjZDLndZvapsdlv96r7cmICeS
	 l279KYyH7i4DCbMRwk5fON/OTMXoNBC5IXFLs8KwaJcK20uEEUIglHhtwSfxeofPcpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6v/EUAzIuUZtunuZ0TzsEXeSSrt8us4QeYlPDnXiIyE=;
	b=pKkebeIEhNOwg8U6NYVoH9Eq2rTTVcD5tRPX7LSWodhGqeJcBGA0P++lmh8EwOj6lKYj
	 sNo3vtXND0urrH5eflVHlttt9jKTsNf6N7ZLi0mjeWkkhkKiOaG4PVjNHJv8eTl2/t7Rm
	 XP+bKT0HCFdu7cifIyE/rEE7ju7fmSVr0YVu/O1yMJUOICUb2E4TH18hlz57ycKpL9oZv
	 9a66xdKfc29RNN3ilOA+UPtBGnsvuJCu2xHc25xamX7GrD+SaChuK8nVuiWK0BcO9MRME
	 Df8Nx2n45l8GtvbVcLLL5M0S21sLB8aRW3J5srXw8DQ+lRxQ8FeITYX7FjkLx9L0KxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+0kvxz9;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0870B606A31C
	for <fuse-devel@lists.linux.dev>; Mon,  9 Nov 2026 08:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0870B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+0kvxz9
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so6475125e9.1
        for <fuse-devel@lists.linux.dev>; Mon, 09 Nov 2026 00:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794213328; x=1794818128; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6v/EUAzIuUZtunuZ0TzsEXeSSrt8us4QeYlPDnXiIyE=;
        b=y+0kvxz9x46Bcqoz2uSg6mZS/8/+orJB6qaEw2HHdg2sn3ATqP5EPIaaD1ItDQ/Lov
         ARWrfV957mbSfHNrlxx5F9b+8PO5Jk86XkuXzIzq4i+z5Zvf7xplKhPmarMUwOAcSY92
         ebY676lvBg6UVmqOYbQvP4p2ja990ZdjcatyUyLYiYda2lU7Id3WvH2e2FHvMsA6pag9
         V8SAawLkRqTakv5ciksSP+bnVDvaHvwJ887n9+YXd9eIqU3lSyvh4wYk16NHcUsZjZJ1
         pJC9s6awlLbVIVtGHRJaRrMhpvfr8uVuWU8UQiDAZCjMsefZ/hyyNTg+/N9tI9e8E0CF
         5YZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213328; x=1794818128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6v/EUAzIuUZtunuZ0TzsEXeSSrt8us4QeYlPDnXiIyE=;
        b=hVZj4fJZs+/olAX25QzyosT6JLIdXjEM4wPnux8nSoBIe3rdC0k3eTMZi93dQMZ0xZ
         aIzJoQtJMNU5rTuUi4nX8+ZO7Cd3KKnmqyo7d4U77QhrcH3zuO4RqSCSTzZOOvVTtEAH
         yiYZDCinA9gFzlLHaaB4kuN6INKV3qEBEMp8W3CmalIhuwfFsQ5jSszErnWpw75jADf+
         PATXWP/tAb+HldRl2XhIh563uBTKcqDW80doi6YF/6BJ8EBeSSPiv+X/bO2MffhtXp+f
         8ob8ngDz/g1ZQKWr9gMm/PSO7ijMmurslETb0M1rpae71rnlPhcckwAl9FT0lHGty77O
         Ycjg==
X-Forwarded-Encrypted: i=1; AL+hErEp9NKSbujFy4Qz1XO/grXbjxvf6uzdjNy/M9CEsUBjWn8wqpOFXqvft1+WQV/ThFG3oP8W01+SzvOE@lists.linux.dev
X-Gm-Message-State: APuU4Z9MB3ITo+72LrHH6yMKc0Pj0yaue+gKM8W/ET6oajiIDFHXySEI
	M/ZSN3XnYeudDP/4WN3Br+OBuM8t+tysFqfFPecAl72Z+mUHJ7mCFIfk
X-Gm-Gg: AYBFou0bmSHCk40OMYVkSOCtbt+d5MUAsDpR3d3247FDzM76YfeVg/ICuBRHqoTavSy
	giibN0V945IEnvBsvZOqjfvgYwuat2VpTM8dYbp3NvRMb6R/BiWP7WLE2S+pc+7bHFqlBmr+D0o
	GYy2u0FAh+5gdeKVySZRpdHfyWiBF3WHupyOvE5htnfsmtOc14WDO40RhkUCB3PtjPj0wN3MnAS
	mBGY2XjeQ1TzB6JvPznjCc/ITRGWiiNWhfJSIs2n63L0749UAENV2UcbZV9rNgH103mOvkYxHbP
	C5eyP7jZe9+LNcw2CzcsOnnxvHwLsNuwjdilc5peemKvLQ0gFqRmbkGYjoUW9dRXtlNzh0r6RXF
	zkMDIoMxcbgM0k/pjTkBP4HsnZ4Tmf4BgeNw9Ngsw+gUXru1bKo56gyUtSH+7q7BVYZvABaynJh
	RoY2ps95k4nV7Ze8unLCJE7bHGJJ5I6TgVCrg9h2QlrtxbnnFRG+ouQJ2VpctUQckNfdi6MprBM
	WWygM6t1om7G4UExjHnsxPEt2yS/PdbKTlaXV7g0Pk1N+AH4PlfQKI6OR/letfn/9VCgsQTzFMj
	Mi9lUqZVvr2/dvzZUHpsVd+oEuoSuFByTCBg9HQo5sHa
X-Received: by 2002:a05:600c:37c3:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4b963c87b5cmr58185485e9.16.1794213328165;
        Mon, 09 Nov 2026 00:35:28 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1ddc7sm170118285e9.4.2026.11.09.00.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:35:27 -0800 (PST)
Message-ID: <4bae9936-02ca-480f-b754-c7048702c667@gmail.com>
Date: Mon, 9 Nov 2026 09:35:24 +0100
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
Subject: Re: [PATCH v2 1/5] mm: limit pagecache folio refcount when mapping
 pages
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
 linux-arch@vger.kernel.org, iommu@lists.linux.dev,
 Chris Mason <mason@kernel.org>, stable@vger.kernel.org
References: <20261107-refcount_overflow_stable-v2-0-c38f6809b106@kernel.org>
 <20261107-refcount_overflow_stable-v2-1-c38f6809b106@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261107-refcount_overflow_stable-v2-1-c38f6809b106@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/26 11:23 PM, David Hildenbrand (Arm) wrote:
> With large file folios, overflowing the folio mapcount and refcount
> became possible. For anon folios it is currently not really an issue:
> each large anon folio can only be mapped once into a process; on 4k
> kernels it would be more processes than usually allowed on a system, and
> on 16k or 64k kernels the processes alone would consume hundreds of GiB.
> Something to be sorted out at some point, but it's not as urgent.
> 
> Being able to overflow the refcount is not really big news, but it's about
> time that we do something about it because some modern technology might
> find ways to abuse it :)
> 
> One of the enablers for that was commit ddc58f27f9ee ("mm: drop tail page
> refcounting"), however, file thp support was added later.
> 
> File folios can be mapped multiple times into the same process, allowing
> for processes to hold many references to the same folio.
> 
> As a short-term solution, let's introduce two folio refcount limits:
> one for ordinary consumers and one for admins. Leave some headroom
> before the refcount goes negative, which we really don't want (having
> the mapcount go negative is also not expected).
> 
> Start reporting SIGBUS if we run into limits. When restoring mappings
> from migration entries, instead zap the pte/pmd entry. We allow for
> slightly exceeding the limit to keep things simpler.
> 
> During fork(), prefer not copying page table entries over failing fork.
> Export __folio_ref_count_over_limit() right away as that will be needed
> from fuse code next. Use has_capability_noaudit(current, CAP_SYS_RESOURCE),
> so filesystem credential overrides do not affect access to the admin
> reserve, and to not generate auditing messages simply because we access
> optional reserves.
> 
> This is far from ideal, but better than all easy alternatives we can
> backport comfortably. For now it fixes the big problem: letting
> the refcount (+mapcount) go negative and cause trouble.
> 
> This is only a temporary fix, we'll follow up with something better.
> 
> Check order 0 folios as well for consistency: each
> folio_add_file_rmap*() and folio_dup_file_rmap*() needs a prior check.
> 
> Also, just document -EHWPOISON for copy_present_ptes() while at it.
> 
> Note: When zapping file migration entries, uffd-wp is preserved using PTE
> markers, but uffd-rwp protection is lost because there is no corresponding
> marker. try_to_unmap() already has the same problem when unmapping file
> folios, so we'll happily ignore it.
> 
> Note2: For now we don't let migration or PTE table collapse exceed any
> limits. Admins can always refault, and if we are already operating in
> admin reserves, something is already off.
> 
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM.

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
