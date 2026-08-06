Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E51447F765
	for <fuse-devel@lists.linux.dev>; Thu,  6 Aug 2026 21:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786050263; cv=pass; b=dZFthfsUwqsY8aHfHP/IIpHXaZp+LOdKxXqjgpxas8IsHOH5fB+SFiAYKJ6S+8o+Pxw8LcCogkb8mWD62wF/Y0m27yauefY/LcZ8vXFb1QlLvJkHJv6Pzf27inQkZZn0ttDpxhcv2Fyx1iF6cZSYfzY+BrmzQdeHJwTmERej704=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786050263; c=relaxed/simple;
	bh=8ilisN6b9rsvSV7tujnE8pXGbGA5qhlw1JHj7X5z5Dg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PILETp9cPP5trnSNWg8/cuIXRXevfOGP6Iz5PD/uZNpm86LQVFiG4riDhcOBMpzxakPWfKmjdBtUTiSL4kZIpRBQ1aAtk6eEJNgjnpZy8Gq/NYBu5IIocYzzIM8Ow08M7GppiAmVPrGn2Eyg6kWRJe+/Z4aLIIy351YWrCKQBNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4GqklpI; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4GqklpI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4957eefd361so19837675e9.1
        for <fuse-devel@lists.linux.dev>; Thu, 06 Aug 2026 14:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786050260; cv=none;
        d=google.com; s=arc-20260327;
        b=gjDcQUPd/fxqHhSQLkvJxCtwlip9diuH9xyF6F6ioLny9j463iEQyRkcO3i/KbZ66h
         kKZv2Sm+llYTLwi2FWYjwp2GFfwn4KW2bmTO5CGom9qeBiwBa3dt4QDqTL50r8Se/hGK
         szgUZQVP9TXGbZ7s9Pm+66nNIV4zUssIEFm6HkkY52aDU4MYPt0BiBZZm58yuwU/ZreQ
         Mv/4d4UoPYEq6gTvLjLFnyBuN/F5til3hNbZzgdVro4u6UDE30x0Q66670fPQdSgQo9B
         4v78b3/r6gP9vAlGDi5/Ews5iRdaKe0dpDy17OK95fUbt0AOSNn/mc5qx4wUsvvwiXNV
         Tmpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=8ilisN6b9rsvSV7tujnE8pXGbGA5qhlw1JHj7X5z5Dg=;
        fh=dRK/oHwaYU4CCxMcQvwKDpPQW2o3BQgPKdBEJrkIiDg=;
        b=d06GSLtopT5UIOmw+G7czB0uf9cZ6qNZiaoqioOnDK0bAPugFrBbsVUQphYCtTgSo8
         +aXOUcZGyO0YyY1zmxIL+o0LBa+pgyvy9iV2IYbRwMAZGQ21hb2E29ypTIVdCmpAsGOl
         mW8A0JRsAX7OzixD4CXUGZ3/dvJNwnuYCn7lAAQhT0BJDBhY3lpR/AGEOc/P5HBieZB9
         h4RPgoKOkRlFOoZslOLl0TNU8X8MVj5Jx/OTwyXfhCZmicyPVsEZ5N14jZlyD7keLnoG
         Iwb8VSqVmq2N721XlcxaLHwgrC7VxXdb1OyBbIB1qJkj9zgzO7PorNnX0LfjTIPPcwCJ
         2PRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786050260; x=1786655060; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ilisN6b9rsvSV7tujnE8pXGbGA5qhlw1JHj7X5z5Dg=;
        b=Z4GqklpI1iNFgvbnXHpG6t3Youmc/d0H4A7dSQQKyFYzuWCplkbWDKuCj7xTPPxld/
         bbqGeKwVc+oqIhuISt5oqfx6P8x1FeyN8S0jbpJOJVa7+KO27EepseIHhCLUvOI6v3q3
         Rss/lk6sixKxVw0cA4KOL4uOtxbqGEOGdP21sjCd6FNiohBFOwotsYp84AcgtO5q0ngU
         LFUjqfd2ffNcHgFXmU6LJAad4YIs3AC+E8xUsYtJ77nUGIf0GxS583ZpnoRT7iv44c0i
         OhzAr5j2M+2mt71rjXGMnoRpTQMVQb7GlG7Mlf8znqy2DEo6yFOyRKVBL71ivWnZqqcC
         fWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786050260; x=1786655060;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8ilisN6b9rsvSV7tujnE8pXGbGA5qhlw1JHj7X5z5Dg=;
        b=I3Tb1LLoQuZBPJRqiUA7ydMApjvXbf2rYThr23XyCu5wYXHaQd7EQsahU5TjidTH3k
         4ibU9QapjSZtL0XIR6lGYdjoq/qvgo7K6+cLY/ojbftQCrTk8IN1o+lxJOq5cDaAciGa
         pWlFvDnn6JPUZiZAk5ZMV9jZXXwNl7asK+vkDDYz7l7EYB3Q8dNYiju/0wGsvYs/dzPC
         NRsfOQZtssC7jUjp2cFUpTdSpXE445TRfC8OqLtRv1ZtaU2SR6tVv96TFmSCSQh/lKq0
         +ERlnDUQ6zAwiJIWew8VL4++3yUQZkvxwUhZsTxDTVg3K9W5whioQtbePs2ZozH9H2u9
         D4pw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1ypusn85WIoZkdWVlLhWshtLSWdXvsGxmmJTbniZ2RubuGbDE8/JveFl8/YuWpDVQzwopCqVgNhh1@lists.linux.dev
X-Gm-Message-State: AOJu0YzVIvRoGsQ39Ouemp9JpsNQCbtNTwMaE1s/M89t11TnPswf1ezF
	5iS9BIjaDcxKJ2SeHREEsdeBw410adY9RdOmOtltVE55FeBQ2v2tMlLZjed32NrS9Ifch3k8gVk
	gJqJLiWfhhAQyhvsTQnSyFTL7ALK3zHM=
X-Gm-Gg: AR+sD138C8dNAkWpK+NqU48C3AximJcO6ZxPOzt1Gqvrzk7xgbzXj8mS/eEDAg0Oero
	eafaQl3gz7OgBzOGtdMsKB5oTW9MSmA2krHQWFaWLRhxXij8KUlvIjrqsVPGfQLcnrFs5hlu4Dj
	0mv50UP9UZeZegj65r2g7yMyRfP8PRWprfa4ZES7aW8jtGGTJ5eYWZACOxCU/uly+G/N706TE7J
	y+YQKBGi34jfL077Sk8xbZYhYBth6gJvwgCoTzA79VUstoQz116yBb5H6qMKzllAQPBAbQX+GBP
	oxHZ3/I0gE0+RwH8NBVs6hay4+IpuAdAosyJIG8bTI+cdMH4o+518N7q9auNm6ECtS+7VrdeHH/
	ejyz6h1eXVHeiluktKX1CuALaglaA8Et6++1M2zjN+iAPxiI=
X-Received: by 2002:a05:600c:8b55:b0:495:3de8:33a6 with SMTP id
 5b1f17b1804b1-4994e7cdd39mr269199205e9.16.1786050259636; Thu, 06 Aug 2026
 14:04:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 6 Aug 2026 14:04:06 -0700
X-Gm-Features: AUfX_mxaCgp8oYES6RNp3g9or9e5V5Tk3wVFme00shwxNtlto6HFGbmfyuWHQps
Message-ID: <CAJnrk1bk66ZhRAS7mojSnD5RBfFS+0ChAPymE3ObRWr0C_udWg@mail.gmail.com>
Subject: memcg stats flushing (WAS "Re: [PATCH] fuse: disable default bdi strictlimiting")
To: Yosry Ahmed <yosry@kernel.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>, Jan Kara <jack@suse.cz>, 
	Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, kernel-team@meta.com, 
	fuse-devel <fuse-devel@lists.linux.dev>, Jingbo Xu <jefflexu@linux.alibaba.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	linux-mm <linux-mm@kvack.org>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Yunzhao Li <yunzhao@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yosry,

On Wed, Jul 22, 2026 at 1:38=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> > > > First let's see if the general solution is doable and simple otherw=
ise we can
> > > > explore use-case specific solutions. In extreme case revert is an o=
ptions as
> > > > well but I would prefer a more sophisticated ratelimiting (that Jan=
 suggested)
> > > > than a revert.
> > > >
> > >
> > > Sounds good. I'll keep an eye out for the work Yosry's doing on this
> > > and look into hooking it up to writeback if/when his general solution
> > > becomes available.
> >
> > I am not sure if I had in mind would generalize well. For zswap, I was
> > just going to replace rstat with per-memcg atomic counters, and simply
> > walk the cgroup parents in the update path, as the zswap load/store pat=
h
> > shouldn't be too hot.
> >
> > However, looking at other in-kernel flushers (including
> > mem_cgroup_wb_stats()), I see they consume other stats like
> > NR_INACTIVE_FILE/NR_ACTIVE_FILE, which are updated in the page
> > allocation path. I am not sure if a cgroup parent walk with atomic
> > updates would fly there.
> >
> > A more problematic one is count_shadow_nodes(), which consumes slab
> > object stats. I think we definitely cannot do atomic updates in the sla=
b
> > allocation path. Although it seems like count_shadow_nodes() is a rough
> > estimate and perhaps we can forgoe using the stats there.
> >
> > If we want a generic solution for in-kernel flushers to improve stats
> > accuracy without killing performance, I think we need a heavier lift to
> > rework rstat or move away from it completely.
>
> (Adding a few more people and mailing lists)
>
> So I experimented with a per-memcg atomics in zswap (see [1] for
> context), and it appears to be too expensive even for updating the
> zswap stats during reclaim / swap faults. So I think zswap will need a
> similar approach to writeback and other in-kernel users.

Thanks for running the experiment.

In a previous thread [1], you mentioned your team was investigating
some premature OOM kills that might be attributed to this same stale
stats issue in the vmscan path. Did that turn out to be the case?
Asking because if so, that might be something we'd hit at Meta too.

>
> One idea is to keep per-CPU per-cgroup counters, but on the update
> side we update all the parents' counters, instead of just updating the
> current cgroup's counters. Flushing the stats then only needs to
> iterate the per-CPU counters and doesn't need to walk the cgroup tree
> at all. There is added work on the update side, but hopefully it's
> cheap enough to update per-CPU counters, and cgroup hierarchies aren't
> usually too deep.

I'm not sure about the zswap case, but for the writeback case there
are significantly more updates than reads. There are four stat updates
for every folio that gets dirtied / written back, so four per page
with 4k folios, while the read happens around every few hundred pages
dirtied. In the scenario I was testing with memory.max set to 8 GB and
using the default 20% dirty ratio, during freerun the stat gets read
once every 256 to 512 pages (with flushes happening less frequently
than reads).

I'm not too familiar with memcg or vmstat so apologies if this is a
naive question, but does it make sense for memcg to just do a similar
approach to what vmstat does? As I understand it, mod_lruvec_state()
updates the node counter and the memcg counter (if memcg applies),
where for updating the node counter, mod_node_state() does some
batching where it updates the global counter for that stat only once
it crosses some threshold (pcp->stat_threshold). Could memcg keep its
per-CPU counter as the accumulator but once it reaches some threshold,
it then propagates it up the parent/ancestors into a per-memcg atomic
global counter? The atomic would then only have to be touched once per
batch than on every update, which might eliminate the overhead of the
per-memcg atomic you saw previously? It seems like this would get rid
of needing to do any flushing altogether, as we could just read that
global counter directly.

>
> A more radical approach is to completely drop the per-CPU rstat trees.
> So instead of walking the parents to add them to the per-CPU tree, we
> just walk the parents and directly update the stat. The flush side
> will then always iterate the per-CPU counters to accumulate them. With
> this approach, the update cost roughly remains the same, but the flush
> cost changes. Instead of walking the trees and flushing all cgroups,
> but only doing it on CPUs/cgroups that actually have updates, we
> always iterate and sum the per-CPU counters. The average flush cost
> may become more expensive, but it should be more consistent and won't
> scale with the cgroup tree size. I am not sure if this would be a net
> win or not.

I wonder if this scales for machines that have a significant number of
cores? Onsomething like the 96-core / 192-thread machine Yunzhao
mentioned in the zswap case, it seems like the flush now would have to
touch multiple additional cachelines per CPU when it seems like for
the majority of the stats, only a small fraction of those hardware
threads would have any updates on them?

>
> We can also choose to do the above for all the stats or only the ones
> used by in-kernel flushers, the latter would probably perform better
> but at the cost of more complexity.

I agree. For the writeback case, afaict I think we really only need to
do this for NR_FILE_DIRTY and NR_WRITEBACK, neither of which are
updated from the page allocation path.

>
> I honestly don't have any time to pursue any of these approaches, so
> this is mostly just a brain dump. But I do think we should try to more
> systematically solve the stats flushing problem as it has given us a
> lot of pain over the years.
>

Thanks for writing up your thoughts on this - I found it helpful!

Thanks,
Joanne

[1] https://lore.kernel.org/linux-mm/CAO9r8zOiwgG80EjqdZFgWQvODUe1RzecLemxc=
B7xXNm_f3XfbA@mail.gmail.com/
