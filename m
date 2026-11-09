Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247651;
	b=Rebx8QMcM30iJBdaKNc8H/pDZZ8UJyekTzYh3bCyYPxCfjbsE8sgZg+MIMUq/4LphMaL
	 DazciJ1gqK+QpBfjPL5k05Lon65GVdh9U144U8ORoKl//YhSpdoIu/A4M2YyJlA/ARh/E
	 LsI3Wg1/DfTYWUAqqxxDkyeaV3dfhQaJSENZobr85DYZ22A0nTAMRFOONwCoD5H6OcTXE
	 pH/lbNutuL0aQMhF9nH5YUeHQPrNVU6kmV90vzAPp3N6RnuWmyaeKa2NVlGBa7AhFDPb6
	 WBDv4xtCtyYfUxHGZ+i3R95g1ar7IXLavLW9eV/DuT4PAKK3piHrCA3/8DMMslJkw9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Gt4VMnvmrWa2nAQLESYVbnrfaPMYEizAsDM6TBhtRVk=;
	b=qi69NCvkoud6nCBUkcRIMdsD6hOLUxzCNkiyStClhgLhJCXhEnOf4KpUMgD41LMC5qO/
	 9/zDM7G7EJ4sjSpEUPnpEN+GSyQxP/CL+YoivUUE6WBXqSebuuGLz7hgG9yoGOc1KEFrH
	 4dbuWJ35lL2zKN1OpbRo+g0B2mzVAshCb5AKiXyqR9DPNN9qnQD7AR+Zia08i57Vfi+7f
	 H8MsNW43RR5KJ3gAR8PrKlXxVMRzfPHnut9NWJAS9JHVRkgCp79F/je1M+XxFYWVZQTF0
	 4Zt822uTD+zoHIy7b/iQj9ATAmUyfbOXqMXjmz4JjKiXlVzKIKMufKtChEuVcwfwBTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b="gvVlx/vT";
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162B1606A332
	for <fuse-devel@lists.linux.dev>; Mon,  9 Nov 2026 18:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 162B1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gvVlx/vT
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5049f267c9so3564366b.2
        for <fuse-devel@lists.linux.dev>; Mon, 09 Nov 2026 10:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794247648; x=1794852448; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gt4VMnvmrWa2nAQLESYVbnrfaPMYEizAsDM6TBhtRVk=;
        b=gvVlx/vTVwMcKKXMUOmx2fAcRomvzEsJzL0iz5Zf4oQjmioq8HqzyNbBvoA4dfIhWT
         MzQdiiEgdjEO9Me+CDSiOHamOYiA2w9ZtTvGv8WyfraY9Wgqh7rKtEa+uY8uosxg1OZC
         qb82ds0yBmS70FIHHEP9J5rcDqbhSH/hFMxg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794247648; x=1794852448;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gt4VMnvmrWa2nAQLESYVbnrfaPMYEizAsDM6TBhtRVk=;
        b=BsJu5DoiNP/Q254o8KjQKkZeMr/591x4oYzUKEsP9L/0tSo4qS9WvLA/beeOzpTHw2
         139bnx8o6x1tbR/jzM9O+bfM+YawnmpQxPWEpN6XluXKZK4wIahDcSW7AUUy5DNcEXCQ
         p+OIgUaQhhqW/lo4Yv5Mda6/Ov7p+lQj59XWzD45fjORu9g0cwhLUPDpaow4cbxUhPCr
         Mrifl8PumQU3jjPXWDa8o7/uRQlIfNDGdD0wQWWkzZHN63qfzabzOejJf9rtcZo3IJqH
         v6zAm0FiKYJ4K70cOp4IwGuO3n1gbL2fczbdqsSg1q6hxoDwdXGqoqjUTDvbE35O2zny
         UgNw==
X-Forwarded-Encrypted: i=1; AL+hErGhj2zMaIBGz0/OWB6dsWzQQLlJ8GjGKHYb5jMAE/pvspnGki7cM6TpJxrblOOfmHl3WlQR9Hl9AlaO@lists.linux.dev
X-Gm-Message-State: APuU4Z8iukHAWMTBDcjiGhrorbY82r3MplRdCl7P1G8oZeSHOBpNLN37
	fi/lINQMXiLD55Bf8b4BM/LYg7UXZJaCxuZdt9ou4UIjc9U+NqE/St9RsEgAOLJFqo2iaboQ99y
	5dbpO07HxZw==
X-Gm-Gg: AYBFou2zNjkyeI4PVR/7U1j5waU3IT4j/4zk9CEuQJGmU/QwxkCreuVdUvf5a1asv71
	mpXl/5Z6lGZzUzgke85BrE7ms4Kbu6/g9POWmPHVx4FMInxZDqcHvFq9zmAmSY5G05pJCsYDssb
	c5x/g1M7vxjuE8hVefVXjigKik/z/HXqY+nEGKDfUUxBApBmjN1HJg7TcSZm+jSfhc1aAnR3yqv
	T2lhDVMeLWNZ0Kdi2NmfCYo6KGzwc5vo74BBl7juBkmtGtMB66j5YIgcZ3Uo0nHFngUj6+AWjXa
	dVRoiYW/dixWs4C95kMGgKsLKbSm+fXwzRXmun3QHXB9CSLZSXmWZDNX8ciNQvl/JrM6hQg63Rc
	8v+FoF4aK5cyyKMFV2OvJ9CPMVTs0ZxgiWg88nKJfUkyD4cBLjQnk5Rq1lyFW7sG2AdfSiUN7Ga
	SbgIzFtjIfTWPJyAI+V7gusaSqTWOLrMuHc5cP097pCeH7rXtnetgRCrCtsruVOigOmXXgipypx
	XNyNu35QaDDvM5AilAM7mxepmS+Og3PfDAWEMm90FjqG8Ty4FO9Kg5d2IULRmwxvI2ZnGAA/hJ4
	SuK/kbn8AdClNiiZL5aFLzjUBxBJuI/HowdG5ph61fOnqTyiP2tTOha2bmezie3PkEF6pHHAIyP
	q/Q==
X-Received: by 2002:a17:907:3f10:b0:c27:420b:7c79 with SMTP id a640c23a62f3a-c50497432ffmr8725766b.48.1794247648359;
        Mon, 09 Nov 2026 10:07:28 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999358sm195941066b.78.2026.11.09.10.07.28
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 10:07:28 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c445c95d553so159402566b.1
        for <fuse-devel@lists.linux.dev>; Mon, 09 Nov 2026 10:07:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH+07tdz0QTJPW339hQZqEc6ONpLVNert2v13G+AuGiwTbGEJtq7xnfYXHBqaxYlJjvNYLMWg907uMf@lists.linux.dev
X-Received: by 2002:a17:906:478c:b0:c41:b94c:4538 with SMTP id
 a640c23a62f3a-c504973c481mr7202666b.47.1794247278274; Mon, 09 Nov 2026
 10:01:18 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104130118.2507513-1-kas@kernel.org> <20261104130118.2507513-2-kas@kernel.org>
 <ecad7b3c-7244-425a-9413-04d49f221057@kernel.org> <au2lsbDkyWt-To0C@thinkstation>
 <aa2a1e32-9b1d-4545-b2e0-03d213593023@kernel.org> <CAHk-=whnH5qLJH3Wd3bOxv--Ei6674Jo4iifGD_MqzyJg2Jm4g@mail.gmail.com>
 <8504e28f-faeb-41e3-842e-0cb74d1a25ad@kernel.org>
In-Reply-To: <8504e28f-faeb-41e3-842e-0cb74d1a25ad@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 10:01:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wihE=ioLKrwzz=WQSJg6HhB-syu4hqZ2QFwgnwYmmLEgg@mail.gmail.com>
X-Gm-Features: AclHuK-A_qW69_o6tagKDJ1G6Q8E_NGG5rYMm4wqMXtGYWO1MbLxTJtWgkQTGLI
Message-ID: <CAHk-=wihE=ioLKrwzz=WQSJg6HhB-syu4hqZ2QFwgnwYmmLEgg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/18] mm: free PG_rcu_free folios only after an
 RCU grace period
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jan Kara <jack@suse.cz>, Hugh Dickins <hughd@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Harry Yoo <harry@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 09:24, David Hildenbrand (Arm) <david@kernel.org> wrote:
> >
> > I think trying to corral it into some special case is the last thing
> > we want to do. It only makes things less potentially useful and more
> > fragile.
> Let me wrap my head around how this would look when we decouple pages from
> folios, where pages might not have a ->lru anymore, or not even a refcount.

So for an example of a place that already does RCU freeing of pages -
*not* folios - look at the TLB shootdown.

It's very round-about and hard to tell, but it's using

  tlb_remove_table_free
    call_rcu(&batch->rcu, tlb_remove_table_rcu);

and that then does

  tlb_remove_table_rcu ->
    __tlb_remove_table_free ->
      __tlb_remove_table ->
        pagetable_dtor_free ->
          pagetable_free ->
            __pagetable_free ->
               __free_pages(page, compound_order(page))

(and I might have messed this up - this really is a rats nest of
nested inline functions).

And in order to do this all, it sets up *another* page just to contain
the batching (which is also RCU-free'd)

Now, the batching is probably a very good thing in that context, so
I'm not actually suggesting this should be converted to some common
RCU-freeing thing.

Rather, I'm pointing out that we have existing hacks in this area that
have grown up over time and would have been a *lot* less hacky if we
had had a proper RCU-freeing page allocator back when that whole TLB
freeing code was written.

So I'm not saying "we should unify this". But I *am* saying "look, RCU
freeing of pages is _already_ a thing, and we have complicated hacky
things in place for it".

And they are complicated not because they necessarily should be
complicated, but because we solved the TLB shootdown after we already
had tons of complex architecture-specific code in place, and we
basically ended up adding that RCU phase on top of that existing
per-architecture complexity and abstraction.

*NOW* it would be actually fairly painful to try to convert the TLB
shootdown to a new order. But originally, it would have been very nice
if we had just had a "Oh, mark this page for RCU freeing".

(In all fairness, we also did it that way because some architectures
don't need the RCU delay simply because they have some other hardware
page walking infrastructure than the actual page tables the kernel
builds up. Not that those architectures *matter* today, but some of
that per-architecture inline function stuff is required to basically
isolate these kinds of decisions from the MM code - that deep inline
function indirection has a reason that is entirely independent of the
freeing side).

                    Linus
