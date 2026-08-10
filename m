Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8242042C511
	for <fuse-devel@lists.linux.dev>; Mon, 10 Aug 2026 16:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380590; cv=pass; b=s4wf3teMK1NQosWHcqJ1R0TE4PDp2UyEKitgwbASytQxBN+09DjUgfkHv32QfW6L7cNshK39cvNinWhd/8wTVI14nkiwNi472XNq9sOlogdWc0QNuv9UYnZVjNOblo34p6Q0jqb8QtX05waKld2h2B2S77GmAw8TAgsq0R1vfX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380590; c=relaxed/simple;
	bh=opQteIDfNDFGbe327v0N4D1kt+GGRQG5/oQ05zdVIEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z9s+uen8D1JFfVlyHACKRYGynu/nf49LaPBxqdDS9SSrJAaS0KNIMfsC+WrclVUHh9mdpg5A05qajqGwT3wFA7DqhlqoWvGEi4yoipijdpmHs7sPNh92/i/kwbrbNpyAzRdGs0FAemQ6pVNtmgPUKKOziL3jHbq+O/o6Fl0veHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThsWfLpa; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThsWfLpa"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4957eefd361so15468415e9.1
        for <fuse-devel@lists.linux.dev>; Mon, 10 Aug 2026 09:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786380585; cv=none;
        d=google.com; s=arc-20260327;
        b=r6PJG2x10KbOeVR0pOadFoxoo+olsNxLi2ceZLuIGlh181a5/Q2az3tiF2gU/KuD90
         +PxZWpbqi5b6ktg1k3hcZuAH8j3ty+a2+bBYYFun41VTuElK2onkS4RvZ9wADAa5ahPg
         q3wZSSR8iqTFoxZ27LynLjc10n/gLa6FQqwiHhDf6DWYFHs4oPkmcphv4UgqL2L8VcHE
         QGQxYVhjDBpcWOzxL/GmW43zownydywmIUCZgtMKVM8rPy5aupcyV67YTAo7rjueyBdk
         7n+KrULAV24SGiwLlmfqdRQb2qBixVQWQyU7hKwvx1PM4PLwTjdbPba7TktiIxFGaV8Z
         K+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=opQteIDfNDFGbe327v0N4D1kt+GGRQG5/oQ05zdVIEY=;
        fh=3OjUp4gNxrdSWch/+lW0SDiBMSm1NTzfsqJs4+WxwHg=;
        b=UavRx91Lax6BlE8weav0G6l3+Wk0pmiKJT420HcvDMA2MFrwCG1u5P1PLofRxTW4q/
         v2AGzu4smRwx6wcPEXwN97PUmh0cs73fSf+9hf7uU2+D0E2lzSUcqOhMqnqy4qirufEN
         3SAJ1cpbLVG3pWrbm38x6OOSsHzIAIa9i2tA1JNrls1VRRUzycoR0bKgwnCwaMPgkn7R
         jPzbra6v0wt3t605k/aLB4ft5bzGmR6Yx5pGzev0iA9bj5Ctc2h9M76AbVcp/r+cl9fU
         jzoqI6NXeFj+u792pAC+L23iw6VLJjbK3rC7mhPxJ9z9t1JlXaQMOwLKyACwD57/3Hmj
         8d3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786380585; x=1786985385; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=opQteIDfNDFGbe327v0N4D1kt+GGRQG5/oQ05zdVIEY=;
        b=ThsWfLpa7Qk2zOebVukYekKJnw0f0sENHK0o3uByXFK31Jq/teh7KvclGWb7GE1hds
         I3EfsKMyf5e3WjYWaWZ+V0zh3QvJSnR/A9+jlV3bLIhTlWor8LYLm3OKRkidNUT11cwb
         dgUX9ZmSDOpP07GB+bBEPLUIxaDtLBcTxkia0Qe/eFa6ryNzEKZY71I27gzMfeYo+fNT
         WKRbp0Z6ZNV+/qAQIKXWZw81aCpyBCMZK84XqmLxQLpJuQ7OTl97Q3imLgnFtwQHOX28
         wp6sY887xh3ktJWoLlsFzzXqtHjLrNaHxWWHUJLtUyyeTgBgJ2EFbETLLmi8XKS/HXaP
         YtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380585; x=1786985385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opQteIDfNDFGbe327v0N4D1kt+GGRQG5/oQ05zdVIEY=;
        b=RdC0IJ2xa0JoXzmwxo/3esCK6KoQ3bdlMFL+LkGDZRDvWgh5p+jCm+C/nbiUpDUEFQ
         RzbXYHjwhXQFsxGUFI2HWYwjy8Rm4K7kuOtVM9X4/9vQDjUPbBCqfE76sqY1ettgDKiL
         JpXrZtDGwXRWL3BpUnbxjEpiJfgG3PoFbjakf/RzkhzYhZLLDIjnc7RD+yi2FLQ6UpZR
         mcJ5GlXbmeHks8Xo52MDDseRl6R6DpYMc/a97TAQia2Kzq4puK49iMZfWSpkkh0hi6VP
         D/JphwCf4VtNs+7iObx3Yv1uX1KBE25rz5ETt/L93ZMTGMthAz4VnCO1Pb8TXsjDG2/8
         1WfA==
X-Forwarded-Encrypted: i=1; AHgh+RojTY+s/OrQn0gsDkCjV+9JY0jOFnp6Feje9xEhYI5WRJ9a3GoryXIKH5FxxsJ+wo+EY8BvlUGyXiTP@lists.linux.dev
X-Gm-Message-State: AOJu0YzSots24JpAgNx62wVz4JM2IMlIOkkM8H3nls3XTC/4/nE6/7E6
	F2MTv0iumMa6Kfp6MK2myj9JyH4/qNvp5a5KAzHJ1E9IKYvacw8Y7yBGujolphj/UGSpcPFXtPr
	/TQxd2PX1/bwWhNnaq+jzvG2gclDiGIw=
X-Gm-Gg: AR+sD12BxQ0Puss+Yvvjb5TJ4jW+HcN8Ud77GrixArUjfgqSb5+3W01ZzpMyW7nEvXD
	97QBb5pa0lz/Q94xMBKqSdoYUlu2GIMefk2079lcz0fAmiizmYfmXBa48zD00db9IKFQiAV2s/o
	RuE3FVTHSo2GdZzM8kSJaUxAUCvyhXNuZDMXQEz348wzxZZq/+DkPZ9FP6/7MbMOJ7gvIfTSAyA
	2tLj39l1np8AFJoSf4qSOnF/GlBeD+4x2f1yV+SmXwVHGBiRjIjBFcjpW7ERnDThwka+IT2EAST
	36li5e6V+H1Gt7MbvDuFVHQX04WggL4KJ2yydK4/63fq8KTsLdQC9+ttib5R3NpS6l6hiii2SY3
	CWi7FqWqhNcaU3957+Vfelu3V
X-Received: by 2002:a05:600c:8b4b:b0:495:5fdf:2075 with SMTP id
 5b1f17b1804b1-4995e0254cemr315174035e9.0.1786380585382; Mon, 10 Aug 2026
 09:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJnrk1bk66ZhRAS7mojSnD5RBfFS+0ChAPymE3ObRWr0C_udWg@mail.gmail.com>
 <CAO9r8zPpe6fWOSXtRUjFB8WNMroeBqvLT+2QtAU4E27AtLUXMQ@mail.gmail.com>
In-Reply-To: <CAO9r8zPpe6fWOSXtRUjFB8WNMroeBqvLT+2QtAU4E27AtLUXMQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 10 Aug 2026 09:49:31 -0700
X-Gm-Features: AUfX_mxLee7dpyylWKON8KDAzBJgmBm61mwBeQMBp_ggGZ_j5xRcyxsvPI5PLAk
Message-ID: <CAJnrk1YifN22mA5PFRVrh3m_ygxax6x4_8nraG2hPqCzyzBj7A@mail.gmail.com>
Subject: Re: memcg stats flushing (WAS "Re: [PATCH] fuse: disable default bdi strictlimiting")
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

On Thu, Aug 6, 2026 at 2:31=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrote=
:
>
> On Thu, Aug 6, 2026 at 2:04=E2=80=AFPM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
> >
> > I'm not too familiar with memcg or vmstat so apologies if this is a
> > naive question, but does it make sense for memcg to just do a similar
> > approach to what vmstat does? As I understand it, mod_lruvec_state()
> > updates the node counter and the memcg counter (if memcg applies),
> > where for updating the node counter, mod_node_state() does some
> > batching where it updates the global counter for that stat only once
> > it crosses some threshold (pcp->stat_threshold). Could memcg keep its
> > per-CPU counter as the accumulator but once it reaches some threshold,
> > it then propagates it up the parent/ancestors into a per-memcg atomic
> > global counter? The atomic would then only have to be touched once per
> > batch than on every update, which might eliminate the overhead of the
> > per-memcg atomic you saw previously? It seems like this would get rid
> > of needing to do any flushing altogether, as we could just read that
> > global counter directly.
>
> The memcg stats perform similar per-CPU counting and thresholding. The
> main difference from vmstat AFAICT is the cgroup hierarchy. In vmstat
> we have per-CPU counters and a global atomic counter for each stat.
> For memcg, we have the same for each cgroup, then we also have a
> cgroup tree. When we read the stats of a cgroup, we usually want the
> hierarchical stats including all of its children, so we can't just
> read the global counter.
>
> We use rstat, a cgroup framework that keeps track of which cgroups
> have updates on which CPUs, and then memcg has thresholding logic on
> top to only flush if the number of pending updates exceeds a
> threshold. Essentially, if the magnitude updates on a CPU exceeds
> MEMCG_CHARGE_BATCH, we add it to a global per-memcg counter. We only
> flush if that global per-memcg counter has > NR_CPUS *
> MEMCG_CHARGE_BATCH updates. So in theory I think we tolerate up to 2 *
> NR_CPUS * MEMCG_CHARGE_BATCH of stale stats (combined for all the
> stats).
>
> See memcg_rstat_updated() and memcg_vmstats_needs_flush() for this logic.
>
> Looking at this code again, it made me realize that we already iterate
> the per-CPU stats_updates on every update to increment the number of
> pending stats on this CPU. I wonder if we can replace this with
> actually updating the stat on each parent, then the flush path only
> needs to accumulate CPU counters. Or maybe as you mention, we update
> the global per-memcg counter when updates on a CPU exceed a threshold,
> and forgo the rstat flushing logic completely.
>

I can run some experiments and see if updating the global per-memcg
counter per batch and forgoing flushing could be a viable solution. I
can use my setup to test it for writeback, but for the zswap use case,
what's the best way to test if the changes are too expensive? Is there
a benchmark program you're running?

For updating the stat on each parent and having the flush path only
accumulate CPU counters, I think this means we would have to
unconditionally walk the ancestors + update its counters on every
update, as we wouldn't be able to early break if the flushable
threshold was already exceeded. I don't think we could replace the
stats_update update, as it seems like readers still need some way of
knowing when to flush. It seems like this could be a nontrivial
performance hit, but maybe it's a non-factor in reality. If you think
this would be useful to get benchmark numbers on, I can run some
experiments on this too.

Thanks,
Joanne
