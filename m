Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486420;
	b=CivpEut66N4ugh3D6AGEmdKdnFP4h8qQLhYMqGygLbUsHTEKh3ZopQ9nQbI2vSQmtJA7
	 94Qdvi9V1Ntpp8IuFn27YW8oC/r4grzQa57KQAhMBwIQHZUgODLQq3vqKw9FOVOSQOcde
	 5YgCdSR4roNH85O3GBBDrYvaDVKD1Q9x8zqkX6n83KGlTjiF5rXmnKtnx3w9UvzSp1VFT
	 4OOWGPxHQja1GFI8jlW8HqR9fX6fBpYy/jLFJJ0AsWHj7x59rUOcOLu788m98i3c0QMqA
	 AXYj8vogvIIwGBX57EecOrTQjOwWXhvY4HHv7UjtM6VW1vCY+4JQdRzaueyiOtDL26w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486420;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=cJhPJ9QxlCMYKnJHbj5QGEB8cls6tku/kkim/ICGTdM=;
	b=UaXxjVtbEvMA4rcmZCebrwq7+SMwg3yxCG2zHygG92qpDqfjjzg455xQJnsxiz/Fnucp
	 XV/Nso6RVtKx6NU7BbZgZdgT2lUOgOf4/m5YPtaqDNpGm928X55IWJvDRrNqPL73e9IQl
	 5Mc7KyDhudNaezhmX0WwZcn0ePNb5e7uvcgZNIrmxYbBmNM/QAaavtQmGaE32ml9S1P8g
	 XM66g6gG39UiYP5Lom/6zUcaFDee/lqv8Q6Xn3zGB8m2HFQ2RqRyn8wBVvwwKrMn0ox0K
	 Kqs+Z+BiHjfooW1B1dNQpbVBokevUMFbs69wuMZWrJrQcOvdXpl5r3o2DkyIpmwT2bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFSokoY+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB585606A332;
	Thu, 12 Nov 2026 12:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFSokoY+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D219B1F00A07;
	Thu, 12 Nov 2026 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794486420;
	bh=cJhPJ9QxlCMYKnJHbj5QGEB8cls6tku/kkim/ICGTdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FFSokoY+PCHwq2T6TPLD38qEoj9BuXh0jTMx2auBlU/FYHz82/Kr7aKGZ57OCe1Rv
	 G/bXRh6X8eqpK6gL65ferZjpmmpZ/2x4vB8du24YZVoDbhSLoRaJZLdpQn+PFajeUR
	 nY+KBkeGgosXVO/cQQmQ/k6LyAlA0DkBqR36gcJCLg5vCpriiKisc3OV8q7R7z2nEu
	 WHvjHOOL36ChSr9FQyW8Pyd/lw9YdJt4jNUdYT+NrE0rH8D99ckpaMIJnqAqScDpXL
	 rhcIOW0JAaxhiFChYlg38EQp9TdKM5Hr32Do4vjD1shJxpUr6MZs98JfRy9WrAdxb/
	 VlSNs56w645Bw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id 091A4198003A;
	Thu, 12 Nov 2026 07:26:47 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 12 Nov 2026 07:26:55 -0500
X-ME-Sender: <xms:h7D1ammO0rKMCciio5QD56XBjmBAkxCiBo5C3j2sA3mRlG9XgaOMNA>
    <xme:h7D1anoZ0ho_z4Tyt6M2DpHMwTxVgfT0VtSfMENH9XF7BgkXNFIzypBlgVjlkKGUK
    giR6uayFz1TRV2QL20a8ToDSeOz-hvHkqcORz2wzD-8xVLsG1Ef3Mpl>
X-ME-Received: <xmr:h7D1aoWrixkc6hliMPT2GEmykw8XA4EBFs0DDJJP40AuzYSECxKlUiyfjGk>
X-ME-Proxy-Cause: dmFkZTFE5a305T5AvmRmPUwWLwOgcXGbZ3P1c12I/woA7+e8YrvsknZPdP8WZpfw246QMq
    OTRU3+6Lvu/IAHI1shixRO9xTgIeSA8hf3hHWj1aHcL/j21Z+Cf7LwC7MrmMwSloB+cGlY
    8kKb05M4kGFDS1NVc/2QFUdwZf0agaAkZqqCeJPWZUdDGCkfPa4iUGV+eITEfuDdPT9o8c
    zuxGx92elDCuS1bPus21iDiuOU4YvAibcPgzCNQOyJQ/lEFzr5NvdEPzh2TVRuq/OiRhha
    LitCVwW41aas+CwKg1ef6W8ju0frrYJPvhBk22yQcZ85VaCK5ToTFTj/G/h+SS7rvZSYNs
    2tZgICNFvMNjuLr2msd8kRuJmvkyM8cVV0Un7d6TH1S0wdcha4qugi1ngQSBZnjer2FIWa
    RwDcf8iUE3rGrOAADB7ESLBIzoFFMvbO/IyaQI+aJj/QKdOFgdJLEJ4+bn6QfDurcsBoP8
    YXDsFP8TNMsTqBSp0zlcVGiZCmGbTUXRT/aXQGB63xlQ4lpsKVN74izURY7qcRFHYFEBzH
    GXyW5yVDNrbEe3Dm2H+wwXNNL+stMUneebE6H5Y3yvPGbPDOJgRzpTe0h81zjrz+1B+Var
    x3C9grCqv/+LAGkUoVBDVu+ES6xk96eannkxPCTUtgDrZZVTvmos/Kjhz3AQ
X-ME-Proxy: <xmx:h7D1aliRs30a-qe-0fFG6wq2VW7atkq33GvtUcb2ejmKJ2NcQNy3_w>
    <xmx:h7D1agzCMdeNLM5uFldG051iOpjuZXde5PO6R9gH-BmCwJ8ERFsvxg>
    <xmx:h7D1asnAZ3Lt0b-U9GrTBQfCPqlvIzSr0gDd0FypANxxBebpccaiTA>
    <xmx:h7D1aodPkF9xSqKMRo_jTT3u4AYmed8jknd9OktHFPsV7K6q1RtJ5g>
    <xmx:h7D1arpQqZt55lDjcqN6QqIqOLUYWBmnduE9xi0TZ2xLeyiEF9aTgjU4>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Nov 2026 07:26:46 -0500 (EST)
Date: Thu, 12 Nov 2026 12:26:45 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Jan Kara <jack@suse.cz>, 
	Hugh Dickins <hughd@google.com>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Harry Yoo <harry@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, "Liam R. Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Pedro Falcato <pfalcato@suse.de>, 
	Luis Chamberlain <mcgrof@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, kernel-team@meta.com
Subject: Re: [RFC PATCH v2 01/18] mm: free PG_rcu_free folios only after an
 RCU grace period
Message-ID: <avWv-0LafPyo90ln@thinkstation>
References: <20261104130118.2507513-1-kas@kernel.org>
 <20261104130118.2507513-2-kas@kernel.org>
 <ecad7b3c-7244-425a-9413-04d49f221057@kernel.org>
 <au2lsbDkyWt-To0C@thinkstation>
 <aa2a1e32-9b1d-4545-b2e0-03d213593023@kernel.org>
 <CAHk-=whnH5qLJH3Wd3bOxv--Ei6674Jo4iifGD_MqzyJg2Jm4g@mail.gmail.com>
 <8504e28f-faeb-41e3-842e-0cb74d1a25ad@kernel.org>
 <CAHk-=wihE=ioLKrwzz=WQSJg6HhB-syu4hqZ2QFwgnwYmmLEgg@mail.gmail.com>
 <f39a0ec3-be81-43f0-91e8-145ec139b1bc@kernel.org>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f39a0ec3-be81-43f0-91e8-145ec139b1bc@kernel.org>

On Wed, Nov 11, 2026 at 11:03:38AM +0100, David Hildenbrand (Arm) wrote:
> So I might be completely off, but what I imagine is that the memdescs will get
> RCU-freed (these are not pages), and once they are then getting freed, they will
> probably take the physical page with them.
> 
> And freeing memdescs through RCU will likely be memdesc specific.
> 
> I really don't know, Willy might know more about these plans.

Right: once the folio is allocated separately, the lockless read
dereferences it too, so it has to wait for the grace period along with
its pages.  The per-CPU batching and the waits in the allocator later
in the series do not depend on where the check sits.

Until then the folio is the struct page, and __free_pages_prepare() is
the one place every page cache folio passes, so v3 keeps the check
there.  That function already takes page_folio() for the mlock and anon
checks, so making page_folio() fail for non-folios has to handle it
anyway.

Willy, is there a plan for how a folio memdesc gets freed after a grace
period?

The rest of v3 for this patch: CONFIG_FOLIO_RCU_FREE with help text for
what it adds, and FOLIO_SPLIT_FLAGS as a #define in a preparatory patch,
on top of Zi's PG_waiters fix.

I will not post v3 for a while: mm has enough traffic right now.
Unless you say I should.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
