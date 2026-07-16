Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4E13033CC
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 22:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784241077; cv=pass; b=go94Wpk3w4QcoQlqP1AtaJSvEhC602YM4XMLwdzP37ZM3NIphb07j2xqoKv1UXdO+LgSBGtIdBLJ/CebW6TjIVhroYPloQHMar9bpt6K67Mh5LZbSAFIa1MZXh8qJ8ieGkGqijl0bR3q/g0906/ywqLHroewfmoUouD5SoOHPO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784241077; c=relaxed/simple;
	bh=gIQfHYFKIYhcRmZrVQS7MQRjxqQzOw/IKPFitKMU+ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ayQxoGcoavkDDu0HZ8om19GehM8Mam05wXkEop2Vf7xVAFDSa0Qx9UK176y7FQfGOf/bc1jpjUkgHsMDf72nI2C2wuXOXJ1WLEVU6xU99t9A13aKTQLdPZAmEYlneVrEVdd/zSRyktTGIj1BfEQLt5nDnFNEyE1PqrmiNM59FCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHyzizX4; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHyzizX4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso50826395e9.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 15:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784241074; cv=none;
        d=google.com; s=arc-20260327;
        b=Mbukpwx0owyfvsnSxXRBKuQKiqICLsOzJPHZekqXrvSW3uBV9yJYMJEzJPFTKMPnNC
         UF6JrxxHwuJKyN1DbGKQ4Jtq7Ow112Ux2ajrSIfxpu3AYJY/4xzxBHfiVfunN+FSmEY8
         B+jr0w2wnaeGuyxcy7GtT1tjeWq5s1Nneg4vvUat5vCncXd9N9yPr23giVisFtpEyBEz
         kyVLC3T6tKoXcGFzOU0xKAP5mS9YYQ8vwAyhwfCH8GXQl4RVurXuD+ItYM9ajXT3eVyT
         KADxFHtj+1pEnDqWARREnV7leihrbmkQKlPDZsI9OJpBEmzmmvhBG5/i3RH45pMuQzkP
         uyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fqfmx82T4OZSHvHWA2y1l/MVvqQz7gPH08zra4hsEis=;
        fh=9lb63J9J/G/WSbxPtDi9aGGFPPMWSMG1XmGo/kNhPr0=;
        b=EsB7+upKPvaTpOIY+OF/rCLaiSiFBurG70DQRSYZ/y4pgO+i8IzVoBXE/J0Vu65GQq
         GA+FZupZ5o86xzov96QO5EHTLTSrrJ9uJJ/FtVS7tNbSqOUNGAM+ypat6Dxt1KDLdD1A
         JIfWDWsLA9oidZ9SrIMCm77AdQla25MC9POkwPMMuTr5dqN8819Y5wZzm4WytTU84U8Y
         EAgWpI8pxXtn1ryLlJdb8PrJm38LQKzCuaKzYDOkDCRO9AAomi+nEUn8rAfIu5ebAGQJ
         ahXCqlDBPaNn4FW7hgjQMLMDEJM7s1MyXbzqIDg3Uo064RTBMaoxbdpwr096EIOYOe3R
         GQvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784241074; x=1784845874; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fqfmx82T4OZSHvHWA2y1l/MVvqQz7gPH08zra4hsEis=;
        b=LHyzizX48fr4pYm/q3KVMSgEUtV339UW2GTEwvg1sGbj/Km9lTyi1vmlJTd4LJUL12
         6tzjaeofSNNtbrJT4KCkkdgyRO8SzHQ7BJnt3LV4vQd7OJ0rKTvtw/dgoWrOcmzYKqWF
         nEffbhp+AlnwxEZ1do0uefsGxMAG9iryMgOLBTb8P1jPZUFFr3MRCZ+q7tR8scTfXY0U
         GH7elU0bQZTc8KiXl4abPJqqG8DAe4tMeCaJ3mLckTr4PmyN1LmHsRXLfMpxhYAJV0o0
         NHUyzwMdtVjbgH8OPGSeBEq/bXlO+AX68791imb6xQn9y2JENEXLCbPA4h66fH2pTFnB
         khvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784241074; x=1784845874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqfmx82T4OZSHvHWA2y1l/MVvqQz7gPH08zra4hsEis=;
        b=ai5Nsu4KcZk/Rrt/WAsZQQVlCCF/ge/VxCNE6nsQb7oAW2m6jKoiZgD/0FdhgZ0XZM
         RKNoy14ppPAYZvYw68vJ+6AIm5YvXegSvb2rZho8QmkUcqgURVDdVvI87qvZhpokqEBO
         Y3Kf35o8LL3m/Tz31U5SY48HrJLB9fjoMCyPitVvRWd730IpYo3+G5dlR1eMEcGNdFoW
         t8+U27Vd1GBH7fQgnvr4lJKDn0aA4yTHEe+6zjwa8cCJvUsWZ07gyBvCgxRIqLQppZgD
         HlXg7T00bskZW3cZcUjMKxUiEzHqRb+3kbwh/XE8ZfxKuicIa6KaDrQ8ooPD/gqyupLI
         Nsdg==
X-Forwarded-Encrypted: i=1; AHgh+RoPd2tVUE4lXhgQwxJb4e34XxlPJpCTMCFkAZmsA1fvB0ubNL3a69ImIc3zjBpJewkh3loe/RKO/HTW@lists.linux.dev
X-Gm-Message-State: AOJu0YxgJM94I3SHunHBzAd4vp/ihHbF8/FrKyiKJQMkJJBTqLtRUHyL
	4Jg3EL4JRczHUMgs+C0X9hxcAOqV42C/9PF2uehyz1IVqDl+EOFXe+m2dl9HG7vD19s+QlzTefG
	J0lgEWEr91mP1fng0LUAGIrvdbsw0DBY=
X-Gm-Gg: AfdE7cnPOh07OjskN/X76MCm0alR8D16yVhF4lvEKEYuSbTa0v+BMEyGVtXikWSsDCU
	+rxlLqAwNIQLVb1BdjNbD+y5aWizBIzmbfpXLnEcwRcUfBJvWlo/Xjffp/n8l+xyq7Gv6Ehu/MG
	hQeaVkmTIYOGGCsb4sAsM+XlrB8ZHGu7IxP4As2RCbmM2ksW1HkqL9sixLCOBW5R9UqSCRHdMsz
	FMyEkmmIHaMzkHfG7dIjWpZz/c7y/Z8gw6xPGOTGoM/DSa+P7dRggYAZjUxs142Xz1U4fANXWGr
	Yt8xh3VlgphcOZUKw2EgoifzksbL00jRc0gvRPTVEw==
X-Received: by 2002:a05:600c:c0d1:20b0:493:e983:806e with SMTP id
 5b1f17b1804b1-4953815a61dmr131794175e9.3.1784241073466; Thu, 16 Jul 2026
 15:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJnrk1aJwdY+fphnhHjAXFwjGqWQgVB+sn2Ce0gReein3H8EWQ@mail.gmail.com>
 <s4kv7qep3jlncs67q72xfhserpd66hpbwzkoppiddc5raufyjd@ksuvlfqcrbk2>
 <CAJnrk1bG6ddP6-dgXpGBRGnCH49oTMPwkJmF--+gefmy+zBo-w@mail.gmail.com>
 <oocwnxqgd4klrem6hkya3sddqoxkosml4ysz23if4j7wj2qdwi@5skgc4ftu7io>
 <CAJnrk1ZU40tRDq0z3yM0+yv=KhiZ-fNjUTO=ccv1tuc0xDx2Vg@mail.gmail.com>
 <4fsrafuhoqgoirlt2sy6vk2ljvb3tdps4hqbcrm5qc2pr6tlaf@tboejm2wdq2s>
 <CAJnrk1b65ypz4bdtd1rTQBYOpOEP+DcoZJUSL87jVDssW1A+pw@mail.gmail.com>
 <nv2h2dd2xoj4zjfvnhsxud2p5e2uw3og22ovqureik4pey72qb@i75tn5ttavfo>
 <ue5xd6f4nfggwodfhbqaispmr5aq2dyszezvy26bl4rtsk6xii@uceqazdioj3o>
 <CAJnrk1bwabyWY+rzzSKfKWp3rivcQm=zae3xzNSZc2hnLj6-Aw@mail.gmail.com> <aljxUvui60dm3yvj@linux.dev>
In-Reply-To: <aljxUvui60dm3yvj@linux.dev>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 16 Jul 2026 15:31:00 -0700
X-Gm-Features: AUfX_mxw9s21tzaoZ8MloLN1Sodk-woxNWSHt-Ar5lFWZOx6EkT_b96DXGrJoxo
Message-ID: <CAJnrk1aTx44=jy0ODHY2sHh16bKsYkwBKj_O-MsnZYjXGW2cCA@mail.gmail.com>
Subject: Re: [PATCH] fuse: disable default bdi strictlimiting
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Jan Kara <jack@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org, 
	kernel-team@meta.com, fuse-devel <fuse-devel@lists.linux.dev>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, yosry@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 8:12=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> Hi Jan & Joanne,
>
> On Wed, Jul 15, 2026 at 06:28:16PM -0700, Joanne Koong wrote:
> > On Wed, Jul 15, 2026 at 3:32=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> > >
> > > [resending once more, this time with correct Shakeel's address]
> > >
> > > On Tue 14-07-26 18:21:57, Joanne Koong wrote:
> > > > On Tue, Jul 14, 2026 at 10:10=E2=80=AFAM Jan Kara <jack@suse.cz> wr=
ote:
> > > > > On Mon 13-07-26 18:13:29, Joanne Koong wrote:
> > > > > > On Sat, May 30, 2026 at 4:04=E2=80=AFAM Jan Kara <jack@suse.cz>=
 wrote:
> > > > > > > On Thu 28-05-26 15:11:18, Joanne Koong wrote:
> > > > > > > > On Thu, May 28, 2026 at 5:34=E2=80=AFAM Jan Kara <jack@suse=
.cz> wrote:
> > > > > > > > > > I think this is also going to be a problem for cgroups =
with large
> > > > > > > > > > folios since they also, as I understand it, are constra=
ined with a
> > > > > > > > > > limited / tight dirty budget. I ran some initial benchm=
arks with
> > > > > > > > > > cgroup memory constraints on NVMe and saw similar insta=
bility (a
> > > > > > > > > > single writer in a 8 GB cgroup had max write latencies =
of 6 seconds vs
> > > > > > > > > > 15 ms without the cgroup, with the balance_dirty_pages(=
) throttling
> > > > > > > > > > oscillating rather than settling near the set point).
> > > > > > > > >
> > > > > > > > > Ok, so this is more folios (819) than my 512 gut feeling =
estimate :) What
> > > > > > > > > was the write throughput of the NVMe drive? The high driv=
e throughput also
> > > > > > > > > requires more dirty data to keep the drive saturated so t=
hat writeback
> > > > > > > > > throughput doesn't oscilate too much.
> > > > > > > >
> > > > > > > > The write throughput of the NVMe drive I was using was arou=
nd ~1.1
> > > > > > > > Gb/s (measured by running direct I/O). I think with the 1.6=
GB dirty
> > > > > > > > budget, the math for that ends up being that the device dra=
ins it in
> > > > > > > > ~1.5 secs. The performance I was seeing with the initial cg=
roup
> > > > > > > > benchmarks was with 4k pages (no large folios enabled) on b=
trfs.
> > > > > > >
> > > > > > > OK, you might want to experiment with some other filesystem (=
I suggest xfs
> > > > > > > or ext4) as well. Btrfs writeback behavior is a bit special w=
ith its data
> > > > > > > checksum computations etc. and thus latency of starting write=
back. It could
> > > > > > > contribute to the erratic behavior with the relatively low di=
rty limits.
> > > > > >
> > > > > > I reran the benchmarks on xfs and ext4 and saw similiar results=
. The
> > > > > > max write latency under the memcg were
> > > > > > xfs        5.1s
> > > > > > ext4      5.2 s
> > > > > > btrfs      6.2 s
> > > > > >
> > > > > > compared to the non-memcg case (0.4 to 2.0 ms). This didn't aff=
ect
> > > > > > throughput though, just the tail latency. When I ran xfs with l=
arge
> > > > > > folios disabled, I still saw ~4.1s.
> > > > >
> > > > > OK, interesting. Thanks for running these tests! Also it is good =
to know
> > > > > this is not really related to large folios, that somewhat simplif=
ies
> > > > > matters.
> > > > >
> > > > > > From the balance_dirty_pages() ftrace tracepoints, the dirty_ra=
telimit
> > > > > > value is consistently stable / accurate but it looks like what'=
s
> > > > > > happening is that during freerun, the writer essentially dirtie=
s at
> > > > > > memcpy speed until the freerun ceiling, and then the soft/propo=
rtional
> > > > > > throttling kicks in but doesn't kick in fast or hard enough, wh=
ich
> > > > > > allows the number of dirty pages to exceed the hard limit by ~2=
x, and
> > > > > > then at that point the writer is forced into the loop where it =
sleeps
> > > > > > max_pause (200ms) each iteration until writeback has drained th=
e
> > > > > > number of dirty pages back under the limit.
> > > > >
> > > > > OK, above you mentioned that the dirty limit for the memcgs is se=
t at
> > > > > 1.6GB. Does that mean that dirty throttling allows memcg to dirty=
 up to
> > > > > ~3.2GB of pages? I wouldn't have expected that...
> > > >
> > > > On a couple of the runs, I saw it get as high as up to 5GB.
> > > >
> > > > I think this is because the balance_dirty_pages() code uses the mem=
cg
> > > > stats (NR_FILE_DIRTY) but these stats are only periodically
> > > > flushed/refreshed when reading it, so the balance dirty code is
> > > > seeing/using lagging/non-uptodate values.
> > > >
> > > > I'm seeing this in
> > > >   balance_dirty_pages()
> > > >       balance_domain_limits(mdtc,...)
> > > >           domain_dirty_avail()
> > > >                 mem_cgroup_wb_stats()
> > > >                        mem_cgroup_flush_stats_ratelimited()
> > > >
> > > > where mem_cgroup_flush_stats_ratelimted() has this logic:
> > > >
> > > > void mem_cgroup_flush_stats_ratelimited(struct mem_cgroup *memcg)
> > > > {
> > > >         /* Only flush if the periodic flusher is one full cycle lat=
e */
> > > >         if (time_after64(jiffies_64, READ_ONCE(flush_last_time) + 2=
*FLUSH_TIME))
> > > >                 mem_cgroup_flush_stats(memcg);
> > > > }
> > > >
> > > > where FLUSH_TIME is defined as 2UL * HZ, which afaict means the
> > > > flushing can be around 2 seconds stale (accounting for the periodic
> > > > flusher in flush_memcg_stats_dwork() that flushes every FLUSH_TIME
> > > > interval).
> > > >
> > > > From what I see, the freerun and hard limit checks use this stale
> > > > under-reported value (in domain_dirty_freerun() and
> > > > wb_position_ratio()), which means the writer gets to keep dirtying =
and
> > > > blow past the limit for up to 2 extra seconds before the throttling
> > > > limits it.
> > >
> > > I see. That would indeed explain why we can overrun the dirty limit s=
o
> > > much.
> > >
> > > > Maybe one idea is to in the memcg throttle path do the flush based =
on
> > > > how many pages are getting dirtied instead of on how much time has
> > > > elapsed? It looks like flushing grabs the rstat lock though, so may=
be
> > > > only doing it in the throttled case where it's past freerun would b=
e
> > > > best. It looks like the logic in the regular non-ratelimited
> > > > mem_cgroup_flush_stats() call does something similar. I can run som=
e
> > > > experiments this week with this if you think it could be promising.
> > >
> > > Checking some git history, this actually seems to be a relatively rec=
ent
> > > change from Shakeel (added to CC) - d9b3ce8769e3 ("mm: writeback: rat=
elimit
> > > stat flush from mem_cgroup_wb_stats"). So you can check whether rever=
ting
> > > that change makes dirty throttling not overshoot so much.
> > >
> >
> > Reverting d9b3ce8769e3 fixes the issue. On xfs, I'm now seeing the
> > number of dirty pages stays bounded by the limit instead of going 2x+
> > over, and the max latency is now around ~0.33s instead of ~4s.
> >
> > > Shakeel, your change to use mem_cgroup_flush_stats_ratelimited() in
> > > mem_cgroup_wb_stats() results in applications overshooting memcg dirt=
y
> > > limits by several gigabytes which for small memcgs (with 8GB memory i=
n this
> > > case, which means a dirty limit of ~1.5GB) is a considerable issue. I=
 guess
> > > the ratelimiting should take into account the size of memcg (or ideal=
ly the
> > > dirty limit in the case of mem_cgroup_wb_stats()) as well. Using
> > > somewhat outdated numbers for dirty throttling is fine but when we ca=
n
> > > overshoot the dirty limit more than three times, it leads to rather l=
ong
> > > stalls in dirty throttling and similar issues...
>
> Yeah I agree this is an issue.
>
> >
> > It looks like commit d9b3ce8769e3 was landed in Feb 2024 when rstat
> > was still using the single global lock. I see commit 748922dcfabd
> > ("cgroup: use subsystem-specific rstat locks to avoid contention")
> > later in the tree, which was landed around May 2025 and reduces that
> > global lock contention. That might make the cost of the flush a lot
> > lower than what it was when the ratelimit was needed in d9b3ce8769e3,
> > so maybe reverting d9b3ce8769e3 wouldn't make much of a difference for
> > write-heavy workloads and would be the simplest fix?
>
> Unfortunetely global lock was just part of the cost and even per-subsyste=
m
> lock reduces contention across subsystems but flushing is still expensive=
 as the
> kernel may have to traverse the cgroup update tree for each cpu on the sy=
stem.

Ah I see, thanks for the context.

>
> CCing Yosry who is looking into similar issue but for zswap stats. Maybe =
a
> general solution for such specific stats is to move them from rstat to a
> separate mechanism where update can be a bit more expensive but the read =
side
> can be cheap.
>
> > If it does still
> > regress, I'd be happy to look into making the flush based on how many
> > pages have been dirtied and scaled to the dirty limit, if that sounds
> > like the best way forward.
>
> First let's see if the general solution is doable and simple otherwise we=
 can
> explore use-case specific solutions. In extreme case revert is an options=
 as
> well but I would prefer a more sophisticated ratelimiting (that Jan sugge=
sted)
> than a revert.
>

Sounds good. I'll keep an eye out for the work Yosry's doing on this
and look into hooking it up to writeback if/when his general solution
becomes available.

Thanks,
Joanne

> > I tried running the sysbench
> > oltp_write_only benchmark mentioned in d9b3ce8769e3 on my setup but
> > couldn't get the database to dirty pages fast enough to trigger the
> > balance dirty pages logic to see how it performs without the
> > ratelimiting. If you still have the script for how you ran the test
> > back in 2024, I'm happy to give it a go on my local machine.
>
> Unfortunately I don't have those scripts or setup.
