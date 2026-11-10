Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312022;
	b=C0QH3ihj/l7c1r0Sl+FPI1sxa6tjKEBedEMaqWlNJXX7+MEG2v4dgSjRaGdT/nhcpXOd
	 wr+hirV6vRL5Lsh6EmXzvmYkvSGofLdW0s5dgdB6vG5lSpIJ7d6v2cI++1BibwApHhXSp
	 5vTlFi12KINqkQ5Iy6Z5hqb0YTIYFbkwBNtshCKhpT5iP+LcjLhugmQD/Xu+zp+q/xjT3
	 5frSrivCYize4mUUHF7qHWzkxWTrCyUuO4IQLJXj8cpAiX1uq/UD6wLefKLRvEcvGcLFt
	 Qw1uYTT/R9kK2V7Vn2UtLnwuRDPD+/rFpzs6u+x0yxvEjLu3terBUq5QOI+oITBEd6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5X3zb3VH4w0Ie2RKn7QlDBjKtcvMvn58SYuQeOEmpyc=;
	b=iS3Oh9jLviTrf69zurUFYpqYnE0wBqtReehUjQ8QLZKQTKxj39qjszAeGp3oEDDWu0Ie
	 iAcB6PqRWh2/ZvoVyI8tvkR+CGDN5EC6bb+YofhP01FK2fG9FkzrBmMPbGH97wVVZfMbi
	 +tonFM/W64SQXvRilAAAsfk9CA8ixMgP6kdKUsTFdO8xoOE+rhN0Li3IdgNWhGIMolTgN
	 GVxk5aGfkPYBuyzdDc1HTareTFjXPnIRcLv2uLfgJ/edXIff9Bd01UgCJAxkC0VdlXzpd
	 5v//Fp0PJ8P8XxC6eZtn8THktUIEzfykVJjsgJ+TupI69RteWpBHL9QcOTrEZgdb5BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xupZvciD;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFB7606A32E
	for <fuse-devel@lists.linux.dev>; Tue, 10 Nov 2026 12:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BFB7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xupZvciD
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so22035705e9.1
        for <fuse-devel@lists.linux.dev>; Tue, 10 Nov 2026 04:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794312020; x=1794916820; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5X3zb3VH4w0Ie2RKn7QlDBjKtcvMvn58SYuQeOEmpyc=;
        b=xupZvciD983KeVpDKTiSJVc4wYaOAS3D4FKcbvF4M3bVxSHuXzvHQgjbS1MyAR10Q0
         Frb1tNT3ZPNyQi/4xAlzC2D2djgLiNzYSm/UP62PYtq4gmToMcj+Cr2Oop5XYwJ7KeBE
         xA9QZH9svRgF9N62OVI1EsswI6tKbU2zq9tXimzRrjLI1JnRrR+wkE04L7zLWzOI9vo/
         Lba/yVGHhrOUNCmyLYmmOzgiZuSF5mzxsbDE8wy6GLPjZp/ztVXT6dAeiiitum6ZiLq7
         NZlWy3xEuHXAcu2sSwRzIemAaTgnzX/JUplpuB30anKlAcsoYqN6ChP7E0eBNm1as6Z6
         zQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312020; x=1794916820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5X3zb3VH4w0Ie2RKn7QlDBjKtcvMvn58SYuQeOEmpyc=;
        b=QZWvIzev8t1FaRmIIaikYpf1x7sk+cJqQR35J2zEvPjDdNVGMDqM7SC1XrZG1U4HXk
         VE8rvjvRDa1RdBoQ2z9YTS2nlDUsG/61biRT0uBDACfEYWL/qJLBHgVqiv04qEUTlBYr
         sL6xGZoAMrNCFRyFrONhwhBad7IZ8moHqdFS4YOhqu9BIPZZyGusSCYC2QPzvKhIHmCn
         ZXLgtwHuehcqi36MktbG+VTsEUfJMrNn/9QFnEzv2+OdjBNFeM9FN4JEm/GgpC87+mQG
         IIUHZnZGHUX/2ywK5YnLwrCUpu6vT6ug02L0oPYQz58uYfdqCwG+Yiop/rCmGWfAaFFY
         ZFnA==
X-Forwarded-Encrypted: i=1; AL+hErHPpBqXvw/j7PnXDlaaNovVLWPoszO4GXzCu9HSl6G6AiTzu/SMFxn4imqZMgjcO2WihnzetKemLTwX@lists.linux.dev
X-Gm-Message-State: APuU4Z9sOn5hSMYtqwrwEK+XXcCOyZUT4IDDy//UT5uu4fKr7hR3Pb1o
	A1fm1Ish/oOufbPF4Vrz4y4oWDu7oE4hxyE+/0IIBSKFQQjRaXnhee1Z
X-Gm-Gg: AYBFou3KyGkB3AW9wwIHBgyOupaZogN4xdRY0obyRTEfc6Grgb2lz0K9DzXY8aQ96IS
	C1UMyWgtOfRuw8bB5ir2/dEPky64CVyh0whtyqosx5SfMZSR5eD02f9u40fMquMmXPIcrDcC/i4
	9h+5lzGPaUYZCD3bMdIUifilDzo5yrJzabvSKXdJDYO4j4l/isChUXGUF8P+JQvsFWkNcM624N+
	attfYdonfvOrOf/UDYBXAJ2QY6Gg/+E2gPF4SbLNOts/W2YNjWQacAQhGVR5SALzVJt2FyXcox6
	XJDszpf0C4wlbk6b+J9pBGDgDnoMR/Kp2ory8d7rSyD2Iv0g+7+meyYh5eGh0sGztxXjxWl1zIT
	/eb5ILv02mWXpHtX447GauMWGtmFPel8saTXbG8GiMK6oVzFfoSGYgBRlZQMAO8di5BEYBCijdT
	wzkopA+pjGJsAVDj6mcj8pV2tBlcv34A0f0ktmAHKzn0LpPAaNHRtRLaGH5zmA0X3J9+xTF2AJa
	vqnCsU8ZMph+D/ywN8W3j/nW72lwPBfIn8nQxg9cOPSmLJiRUb51bcql/I6QNClMFVH4DtGt05a
	MJ36aiQO9SJt5Hb9c+S2jCeg
X-Received: by 2002:a05:600c:3e07:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ba0234a8f3mr43245435e9.22.1794312020086;
        Tue, 10 Nov 2026 04:00:20 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm97526925e9.11.2026.11.10.04.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:00:19 -0800 (PST)
Message-ID: <d4bb71af-cd1f-4d42-b724-916064f4cf0f@gmail.com>
Date: Tue, 10 Nov 2026 13:00:16 +0100
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
Subject: Re: [PATCH v2 2/5] mm: limit pagecache folio refcount when splicing
 into pipes
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
 <jhubbard@nvidia.com>, Josef Bacik <josef@toxicpanda.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev,
 linux-arch@vger.kernel.org, iommu@lists.linux.dev, stable@vger.kernel.org
References: <20261107-refcount_overflow_stable-v2-0-c38f6809b106@kernel.org>
 <20261107-refcount_overflow_stable-v2-2-c38f6809b106@kernel.org>
 <c8dd3102-38f8-4972-ad2d-97545fd8c8d4@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <c8dd3102-38f8-4972-ad2d-97545fd8c8d4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 11:38 AM, David Hildenbrand (Arm) wrote:
> On 11/7/26 23:23, David Hildenbrand (Arm) wrote:
>> Similar to mapping pagecache folios into page tables, let's reject
>> additional references when splicing folios into a pipe if the refcount
>> is at its limit, similar to how we handle it during GUP.
>>
>> This will prevent more cases of possible folio refcount overflows with
>> large pagecache folios.
>>
>> Let's keep it simple and check in the two callers of
>> splice_folio_into_pipe(). Return -EOVERFLOW if the limit prevents any
>> progress, so do_splice_read() can fall back to copy_splice_read() when
>> read_iter is available. This keeps sendfile() and other splice users
>> working when ordinary reads would still succeed.
>>
>> Also fall back to copying in FUSE when taking another reference through
>> fuse_ref_folio() would exceed the limit.
>>
>> Also check in try_get_page() to cover pipe-buffer duplication by tee()
>> and partial pipe-to-pipe splicing.
>>
>> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
>> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
>> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>> ---
>>  fs/fuse/dev.c      |  5 +++--
>>  fs/splice.c        |  8 +++++++-
>>  include/linux/mm.h |  9 ++++++---
>>  mm/filemap.c       | 11 ++++++++---
>>  mm/shmem.c         |  4 ++++
>>  5 files changed, 28 insertions(+), 9 deletions(-)
>>
>> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
>> index 3641abb90d6bb..4f6b7b42bfd3e 100644
>> --- a/fs/fuse/dev.c
>> +++ b/fs/fuse/dev.c
>> @@ -1265,9 +1265,10 @@ int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
>>  		if (cs->write && cs->pipebufs && folio) {
>>  			/*
>>  			 * Can't control lifetime of pipe buffers, so always
>> -			 * copy user pages.
>> +			 * copy user pages. Also copy folios at their refcount limit.
>>  			 */
>> -			if (cs->req->args->user_pages) {
>> +			if (cs->req->args->user_pages ||
>> +			    unlikely(folio_ref_count_over_limit(folio))) {
> 
> Linus points out off-list (thanks!), that fuse_ref_folio() should have
> really used try_get_page() right from the start.
> 
> And that we should just not fallback to a copy, in particular,
> if the refcount is invalid (<= 0).

now that is said out loud, makes sense.

> So the following is what I have for now. Once we remove the limit
> handling again, that code won't change, which is good.
> 
> I went back and forth with folio_get_checked() naming, but decided to
> not mix in the "try" as that just reminds of our speculative refcount
> handling. (folio_try_get_checked / folio_try_get_referenced)

agreed with that.

[snip]

> -			if (pipe_is_full(pipe))
> +			if (pipe_is_full(pipe) || *ppos < folio_next_pos(folio))
>  				goto out;

nice!

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
