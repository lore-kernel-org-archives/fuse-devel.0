Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346502;
	b=Od1ShrQSCFp4Trsvdq1T7sWXNKBX0tSSKSZ2n0KeTk3/4zQafRhZEsPwTRgNR48HpUoe
	 edgbSPxVE+sJFmX0O4QnQIPKWmREqL0jEMWtEHJbQw6ooP9+t5SlSbdPOVNl/B05uzaOV
	 R9QmETe72z1XMd6UJnO989CvJF/qmWvTa9bxPV2FIWTc4AOGx8D9JRF1YpS2ZTyfvk7Qd
	 wABIhsDjTO1jaQnbpmiXAniNJBLxahL6AlyTsstgRwCTw9duV4IpEdskT7Tzx68obb3p8
	 9LD46SzHAkw0p6BhPt8f1J/gICTbtcO12lFvqyKF8QdOxs+3ozsjBWtyFqdKdgGua/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mOqbf5f8IOrYsXobBY3T9L29gUMiYe3oysuU/ey3bJU=;
	b=YapiNOXS9XdSCJ9mnfvyPUn30NmGUMgX6+iyl4Frvdn7kyI5CcwzCA1sJ/ilgP9YpqCR
	 2MFRrbDuossRfZBMAX25dwLWZ/iDgIiYKBXYAEVkEKIwsyiqkuUVAJhEHOUq3tIyAszfk
	 U2QNEasxAVCtARhpCfa22y6960QRtUQzN2Nff1M7P50gfxOKWsIyIJM9McZVyTjqCEjDd
	 cF3bCwqcz2LirH+DNK97dWZdmgYjsSYOfqU8a5GgzhT1A0+bufDOGtKOI8lqfNLRDZ7ZB
	 tpmXYxqq2fHUqQEdBXAy+pGBSPlVXDZztIAygEE2o818wDvcVzTmhyhM1HOYgPDUeWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL8OKSjq;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D087606A327
	for <fuse-devel@lists.linux.dev>; Tue, 10 Nov 2026 21:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D087606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL8OKSjq
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4910b863b84so1664379f8f.0
        for <fuse-devel@lists.linux.dev>; Tue, 10 Nov 2026 13:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794346500; x=1794951300; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mOqbf5f8IOrYsXobBY3T9L29gUMiYe3oysuU/ey3bJU=;
        b=wL8OKSjqrT7e66TFZx381N2jUAvwAL6jqttipbAyiXSnC9cKfH/Byv+0htH5pVdOgi
         PW4wdtIv1YOhBPOPZua63fPAgGHSlMnWqQdXZsp2UbS8zJDX0ZI4q1+5Ki7qcl+G2d5O
         2NBnTGHTMAXh7HIshYHDQ8mURJeSFfHLTF7aUnYEHYJ6h1kF7vx0mh46DDCtR03wFJa9
         KeEM+hafG5dwwxHrsCRRQusSbu/pwzSOhIi7EsgF22wVU/U1UUNWEZ4Wct3Jk7SrGzfe
         uqiedFIHIkPHUxhGwuMq1R6R9sQiwKnGjco0O+BX15JnnOsi2wfSlujT6n0JvA7IFW44
         8Faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346500; x=1794951300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOqbf5f8IOrYsXobBY3T9L29gUMiYe3oysuU/ey3bJU=;
        b=s6a+tDO5U8pjsIkqfyhGm+w/4aD4iL1wN7mE7fvJ8FwZFr/EPBeTGpfB8NoaUmR2bC
         xVjrs/6IPX9sdgiZNk8SDVQkphPQUi2uWmePvtxfUSNudZdK5aOfu2GDio56E0K0iSC7
         dB3cjH+VmnrvTuegpq94OruOdPeutP91F2//EAXqzTDHB8kypOTMqMWXfz2OY4i5fHdt
         0Fi9MRjvJda4UDXdHlOSvBdRep4tbrIY8TnbBsvgk1TihxG61btETLg9v+LdTzCZx7hs
         +nbqpjfp1Va9xymrPraGjGKE7pNkLv2lYqzHUhs0dSOXNM1R8UkH1DB+qQRiRpchIdBg
         7ssw==
X-Forwarded-Encrypted: i=1; AL+hErFEUcjPWHCUfpcwPsRTlxfeTbnM7tIX9DMbuOBhmVZINA9t/yRJRIQ4wzVRYW7ZdHJrUe7ekPQ1DngT@lists.linux.dev
X-Gm-Message-State: APuU4Z/7iKcsmTDredqMbeJJ/QYAe8SwXI/NCCvQYznxUpAgM92/FUWO
	fmsmRiHIrY+hVHeW8ouwNgS8LmpMN5v1RnWmiTrkeaoKhu08PZ7XdOCi
X-Gm-Gg: AYBFou3bfX2mrBiGX4saPR9IN2tRmUfVtvdimE+aWpfwfFG+hKubLFwFKKFrZUlDNkA
	zmpp26CGhxfwh2UQESWUztb07F5oLgZsAifSX28TicaZT8zl+P/SZTj6kksuu/wzAlMU3i3+7u/
	6UPBTP8VUH/2v5bOYoU0ZZcJsHKt0QU863aeEb+xCFVtJq8pZUG+LJbL/FNwXNeQcg6nto9QrgN
	a8Ct5PIwD9q9z8/3neLiBIPmwPFYHSGFILcVpoBrErcUKEEpKtQU75AFf9+p5TWG/r/qKFItqSb
	IbBrJyWdqYviVwxCoLLgqUacfT4IieKaX6CyZXD/fT3IvEZfDnISC/ZaVjO2VXVktGluX8yAGS2
	S6WbTLbyGM1/hbwVzzc2gSghnxIkHU2cYrhCXmyIDQzEBvZBM2qIIEsCy5ukjD6wDCliWcAbWVA
	DMTgEoa0tigRjpygmkSf5oOVz3YmPmvNzneG3VxOMI7RQoVbZwr9XKtpfOXJeNYyWRcJ1zz4p3L
	ySU536/VCuAKC1a7D5d5IwpTeoSL54eBloDoMonFLTVnlo4xb80wdLNSHVOyvtAb/0iTVQxeIiv
	PupFI/Io2D9+vaeMRp0HUSLo
X-Received: by 2002:a05:600c:364b:b0:4a1:d766:758 with SMTP id 5b1f17b1804b1-4ba08e1f572mr8423245e9.16.1794346500171;
        Tue, 10 Nov 2026 13:35:00 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3fd2sm7670526f8f.52.2026.11.10.13.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 13:34:59 -0800 (PST)
Message-ID: <cbcd04e6-b0c6-4a8b-9f89-4f57a4c50864@gmail.com>
Date: Tue, 10 Nov 2026 22:34:55 +0100
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
Subject: Re: [PATCH v3 2/9] mm: limit pagecache folio refcount when splicing
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
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev,
 linux-arch@vger.kernel.org, iommu@lists.linux.dev, netdev@vger.kernel.org,
 stable@vger.kernel.org
References: <20261110-refcount_overflow_stable-v3-0-318625d63a98@kernel.org>
 <20261110-refcount_overflow_stable-v3-2-318625d63a98@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261110-refcount_overflow_stable-v3-2-318625d63a98@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 9:35 PM, David Hildenbrand (Arm) wrote:
> Similar to mapping pagecache folios into page tables, let's reject
> additional references when splicing folios into a pipe if the refcount
> is at its limit, similar to how we handle it during GUP.
> 
> This will prevent more cases of possible folio refcount overflows with
> large pagecache folios.
> 
> Introduce folio_get_checked() for checked reference acquisition when
> the caller already holds a reference. It warns and fails on a non-positive
> refcount and rejects additional references at the limit.
> 
> Use folio_get_checked() in splice_folio_into_pipe() and
> fuse_ref_folio(), returning -EFAULT on failure, like we already do for
> pipe-buffer duplication. Similarly, make try_get_page() use it instead.
> 
> Likely try_get_page() should be renamed (or removed) later, as it doesn't
> match the folio_try_get() semantics and is confusing.
> 
> If we hit the limit after splicing some data, return the number of bytes
> already spliced. Teach the callers to handle errors, and stop
> filemap_splice_read() if we only spliced part of a folio, so we don't
> skip ahead to the next folio.
> 
> The check in try_get_page() also covers pipe-buffer duplication by tee()
> and partial pipe-to-pipe splicing.
> 
> Note that we deliberately will not fall back to the slow path of copying
> the folio, particularly as the folio might have an invalid refcount. If
> it is ever really required, we can revisit.
> 
> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM :)

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
