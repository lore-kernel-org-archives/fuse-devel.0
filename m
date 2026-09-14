Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FFA3C0A1A
	for <fuse-devel@lists.linux.dev>; Mon, 14 Sep 2026 19:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412499; cv=pass; b=bdwqMinTSC4qxBPK0x4T5/vUr+p2xR8WkJJqzJFvngHIgSoUwYdJxEb1qDgbTCPQ6dU4HV+kL2VgdXg0Z6C4ofrfK+hGF2r+3dGa1yg9dJHwxbM1m8ff63W3KIR8/GarOM/wbbtBQrDSm7cebVXpS1dslSODAWapdbW8Moizqtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412499; c=relaxed/simple;
	bh=tEqRa+DsXLUgwM55dRsOm8XIccM+IQ7pzEYsSC9u7A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lxFGFDfnllnCSfydGIbedwZ2XTWTm7ED7A7Yetr+s61X4YUvPmYDznpwkka5mNzHH+3dwnIuHEWJCW4NtOXi2BCYLIkhE4DFf6GxxlgzNehBdVR4o/iAA3ONcu/BW5sxo5FO+zMpRrF8RByrjg2eNrxutvOLMQ0Q7iMmm/Blq3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mV4Tqvyn; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mV4Tqvyn"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so802794f8f.1
        for <fuse-devel@lists.linux.dev>; Mon, 14 Sep 2026 12:01:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789412482; cv=none;
        d=google.com; s=arc-20260327;
        b=kR3KDbqfSE2RuW/aX3yrKbLKQEfMtoPR6inG1HScr+jQXVsr74Ccoy7iER85bG0V51
         ZZ+k1v+IUr9zeNyNf+sr4BIktcUWCQis28U49Net6YBkyC0g01u8ym0sMtHybJEC/FZX
         84vBrm0mqIO8Fo4mktmgeMTIMBeyJMGStfXAG1gaXXcL6EaV9bMBInzK00pDzbjx1BM5
         uJx2n53fWoX0BRO99ryhkyQtJi9706/ZvrNtuttE+2xXe4YhyUVNxYWG1j/0vLcN8nd2
         GS7IbuEtTVzhU3CEu6F40nd8fABxAZHAUTjkyAaYDqWww4PJhWt6N37cFpvvu741Xvtb
         oisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kcWr29ciRXo/Ssy/W3GMAIMRBylURTjvxgSXaybDMn0=;
        fh=ixeq4gEd5xljSCHlhchik+oYk5rl5ubbhlz0v8A6De8=;
        b=MWfb9CMiIobK35JWFFHPlLwRXxsnyFjvBiWyGKYKRxrdd+8YJNDEnbLJEwNAAVeqev
         Y1Hg5zCow6ipzidyvOmoPBZNXAhQ8xwTrzmwTVkCLpx/21NX9ij8gmEDOYx7YSL/Pyn6
         gpyjBE+Rgwsa8OfRDFhJ24vzI+LKiSeen2kvxviqQ1TicVDhtbE257TtYDVHdaHIi8/X
         kbQSJW35vq7yyVoDARmKIqisEJQ4mA8rD8TWjD5jI8JacNRPsqbnV66al8d/LtRBvLAg
         xkCFVA98Hvq5o7SEy1cZPNdq7TstNE5W9tn3/ucZjpJFjCLE7fE6auB4zoACW3HYorCh
         kmQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789412482; x=1790017282; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kcWr29ciRXo/Ssy/W3GMAIMRBylURTjvxgSXaybDMn0=;
        b=mV4TqvynF9i9jaJL5mllJfOTTfi3KOtBlAi1knuvUnF8xY6ajuJzlRua1rhOYVtZ8X
         WkiymY4rTKsgs0VyZt7X8XprZvUrI6NL3V7Lfzu3Q52xdte0kI0L1F8kZWSfJ4N/ZKmO
         +4eWC2TqTi+TiseLOwXhll9I+dlyjJO11QqAHIYfEBArmSNLUeUls/CANB9dQ4PZzTuk
         FShAC+YWaIT0KZ5TkcqkMm2mAeoyo3Jn5QukLiIgJGUDRouCa9BES0MUQVUN5sbW1t/8
         w3+klcYfV7S/6EazmB+MZCE5tYTJAFObWwCTmBlTOs9g/zO9pV3f5iC81ueSpohf33CO
         nkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789412482; x=1790017282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcWr29ciRXo/Ssy/W3GMAIMRBylURTjvxgSXaybDMn0=;
        b=nxUfzur1RAXTfcLG6PWj9hf75lZV1IY57Y2YSQBOhvVhp+ZpgJScZPo6huc99J/Fze
         qcGuT2Zz7+6WWehuQINxoA8Ss3otDLvlX5Za6rCpukJj1a+8dG0wTohnN94WeeO6Q1xW
         ZGOObHzpTYYxba4iPYN1qNU1A8uytP+PiYqAfyI56qTXq/65yLYBrwaFtbdqEkOeg2uD
         AI9r8SCmb78fE6uORhd9jiATeC2GB5RG68RiA3z2T7DHDSqYUPG2DFSohcLQjt2T7qtX
         NeF5S5U0V8ZflTbzTL3tZ3BgW8iQWFTWig45NzC+aSqn77TVZmVE27dgRw4W0XIcFAZP
         RQVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVtpiYOCXX2j0qsU+ler+Z9h6mM8LpUf+sa2wWswsGXzcE+GfXVh/5jfH/bKWvv9ZdwqavomAaIf+0@lists.linux.dev
X-Gm-Message-State: AFuF++lJ6uXVJw0z0kozxqr1nb4UBIMIqELTVpnnaXNu9DpeRjUD+PC5
	uPf14Dr+StI+QIDKUKLW8XIk6pmSyGVAc/Z9SHOxqxnc3InoNZoxf1FtkHU9IqNgxtQsKPlWOGp
	KsTt0gYmLCAzbWX/8qSCdNKMExSmFjFY=
X-Gm-Gg: AYBFou03y3ZLeTJneyUlkKkMlQ7+7MMY0iYwD12WCmbtm1TJ/iu7L+Igj54r0YhcBPf
	GVQddlEWPm9aIP+6DwDukinM6nKBLHXZlwnyEowK9zlTt5R2WbGHS7G27uxDS0Mlr69zUZRnS/c
	Jz2iNHoAb8IBlo+bESNv55gMFw4OJ3A2iWdqUGZjh4k47FPrQwJFbT0DzgKGUzXBk2oWCSEi9TC
	kXLB3Z9xyYFTEs0oXG6B2np5JQWLMpjWcD1vvhSX2ty9qM70nD4ND2j5nijPpq+vmkx0upI6+qh
	0dMtxYGP0wYo72ixmwxOfkt3kQciXKMBpDNYterpcdcnHJPlGH6ENGClY/AhfZ5bTiyFR+s3kOr
	SfVf/8e477Qenlhu3p3vtVbS5CLVqgsCZQiGKiGbUxpzo3OXj
X-Received: by 2002:a05:6000:4803:b0:485:7d6d:e0e0 with SMTP id
 ffacd0b85a97d-48705a39405mr1037299f8f.3.1789412481801; Mon, 14 Sep 2026
 12:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJnrk1bk66ZhRAS7mojSnD5RBfFS+0ChAPymE3ObRWr0C_udWg@mail.gmail.com>
 <CAO9r8zPpe6fWOSXtRUjFB8WNMroeBqvLT+2QtAU4E27AtLUXMQ@mail.gmail.com>
 <CAJnrk1YifN22mA5PFRVrh3m_ygxax6x4_8nraG2hPqCzyzBj7A@mail.gmail.com>
 <anpsLy_pCanocgS1@google.com> <CAJnrk1Yoj7fqbzurmHkbA-vegpQu3cf-_dfvKor_VxuNhPR-AA@mail.gmail.com>
 <CAO9r8zPLipVW6bvyDK1ypSawbo=LHKvmLqWH0xA6WMR9GYNJpg@mail.gmail.com>
 <CAJnrk1ai-TqcudPoK-qFRYAJnUjBmg1kVa6Vxg3eDm5w5ivqSA@mail.gmail.com>
 <CAO9r8zNJ=Fpc0pZExrttVTDCM3yzSmLPCAU=+RS0k5Pm+hY96w@mail.gmail.com> <CADrL8HV7_f68qfd6hG=xCTqzupPqr77ynbwdz8jm0hzjdgDVeg@mail.gmail.com>
In-Reply-To: <CADrL8HV7_f68qfd6hG=xCTqzupPqr77ynbwdz8jm0hzjdgDVeg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 14 Sep 2026 12:01:09 -0700
X-Gm-Features: AcwNN1VFoc_2eKOenFa2PrLINBfqq7xz_q3LPSvn75t1DU2-aSfT1Pyeo05pSnY
Message-ID: <CAJnrk1aHdBm4CofvKfx7B3H-uF2xRXZUQs47J_4xeRmRZ4hcZg@mail.gmail.com>
Subject: Re: memcg stats flushing (WAS "Re: [PATCH] fuse: disable default bdi strictlimiting")
To: James Houghton <jthoughton@google.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Jan Kara <jack@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, kernel-team@meta.com, 
	fuse-devel <fuse-devel@lists.linux.dev>, Jingbo Xu <jefflexu@linux.alibaba.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	linux-mm <linux-mm@kvack.org>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Yunzhao Li <yunzhao@cloudflare.com>, Song Hu <husong@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 6:39=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
>
> On Fri, Aug 21, 2026 at 12:41=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> w=
rote:
> >
> > On Thu, Aug 20, 2026 at 4:39=E2=80=AFPM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> > > Would you be able to share the test you're using? I've been trying to
> > > repro it locally without much luck.
> >
> > The exact test uses some internal testing libraries, we're looking
> > into whether we can translate it to a standalone C repro.
> >
> > From a high-level, the test:
> > - Creates a VM with 260 MB (256 MB for testing + 4 MB margin) in a
> > cgroup, backed by shmem THPs. The VM is not a fully fledged VM, just a
> > KVM VM running bare metal code (so 4 MB is enough margin).
> > - Enables zswap in the cgroup.
> > - Tells the VM to write to 256 MB of its memory.
> > - Checks the cgroup shmem usage and that no swap occurred (no limit).
> > - Sets the cgroup limit to half the VM memory.
> > - Checks the cgroup shmem usage and swap again, usage should be ~half
> > and so is swap.
> > - Tells the VM to read the 256 MB of memory again. This should cause a
> > lot of thrashing and reclaim, but no OOM kills as all guest memory is
> > reclaimable.
> >
> > With the ratelimited flushing, the test started flaking 5-10% of the
> > time due to OOM kills.
>
> Hi Joanne, Yosry,
>
> I've attached a reproducer for you (as a patch that should apply to
> Linus's tree).
>
> In tools/testing/selftests/kvm, `make` should build it. Instructions
> for running it (like setting up swap/etc.) are in the comment at the
> top of the file.
>
> As part of the patch, I've also included a sysctl to dynamically tune
> whether or not the memcg stats flush is rate-limited. You should find
> that when it is rate-limited, OOMs occur, and when it is not, OOMs do
> not occur.
>
> This reproducer behaves slightly differently than our internal
> version. This version, when run with `-b 512M` anyway, seems to OOM
> simply by setting memory.max, whereas our internal version would OOM
> upon re-accessing the memory. Not really a meaningful difference, but
> just wanted to point it out.

Thanks again for the repro, James.

I added some instrumentation to prepare_scan_control() and have been
seeing that the OOM gets triggered in this pathway:
a) the memcg is created with memory.max set to unlimited. 512 M gets
faulted in. The new anon folios get put on the inactive list. Nothing
reclaims them yet
b) userspace then sets memory.max to half of memory.current (~271M
from ~542 M currently used). This causes memory_max_write() to trigger
reclaim logic
c) the folios have already moved to the active list (my
instrumentation shows 122684 active vs. 179 inactive) when reclaim
does the scanning, which means the only way for pages to be reclaimed
is for pages to get deactivated from the active list back to the
inactive list.
d) prepare_scan_control() (which decides if the pages get deactivated)
reads the LRU sizes from rstat. This memcg hasn't been flushed yet
(the 2s flusher hasn't yet triggered since when the memcg was
created), so the NR_INACTIVE_ANON and NR_ACTIVE_ANON stats are all
still zero. The real values are all still sitting in per-cpu buffers
that haven't yet been flushed. My instrumentation shows:
        inactive_anon       rstat: 0    actual: 179
        active_anon          rstat: 0    actual: 122684  (~479 MB)
e) the deactivation logic in prepare_scan_control() is:

                refaults =3D lruvec_page_state(target_lruvec,
                                WORKINGSET_ACTIVATE_ANON);
                if (refaults !=3D target_lruvec->refaults[WORKINGSET_ANON] =
||
                        inactive_is_low(target_lruvec, LRU_INACTIVE_ANON))
                        sc->may_deactivate |=3D DEACTIVATE_ANON;
                else
                        sc->may_deactivate &=3D ~DEACTIVATE_ANON;

The if check fails:
     refaults !=3D prev refaults: 0 !=3D 0      (false)
     inactive_is_low(): both LRU inactive and active values are 0: 0 *
inactive_ratio < 0     ( false)

DEACTIVATE_ANON gets cleared

f) pages don't get moved from the active list to the inactive list, so
reclaim ends up freeing nothing. memory_max_write() goes through all
MAX_RECLAIM_RETRIES and OOMs, even though there's 479 MB reclaimable
(but it's all on the active list).

I saw that the skipped_deactivate retry did fire (on 858 of 4264
scans), but not enough to get the memory.current back under the halved
memory.max, so memory_max_write() still exhausted MAX_RECLAIM_RETRIES
and OOMed.


imo I think the best fix would be
a) for non-root memcgs, revert back to the non-ratelimited version
(mem_cgroup_flush_stats())
b) for root-memcgs (which if flushed will flush every cgroup on the
machine), don't use rstat at all and use the existing node counters
instead (which is what the non-memcg case already uses).
mod_lruvec_state() always updates the node vmstat and the memcg lruvec
stat in the same call. For the root lruvec, the node counter reflects
the same value and doesn't need any flushing. It has an error bound of
125 pages/cpu at most, but this is tighter than what we currently have
with the ratelimited version.

commit 90a6f2a8f442 ("memcg: use ratelimited stats flush in the
reclaim") was what switched vmscan to using ratelimited flushing. The
reason for this was to fix the stalls from concurrent reclaimers
contending on the rstat lock. For the Cloudflare case, kswapd threads
were contending on the rstat lock on 8 numa-node machines. That's the
global path (eg sc->target_mem_cgroup is NULL,
mem_cgroup_flush_stats() turns it into root, so this flush essentially
ends up flushing every cgroup on the machine), which gets addressed by
adding the fix in b), which takes kswapd and global direct reclaim off
rstat entirely. For the non-root memcg case, the flushing is bounded
by the MEMCG_CHARGE_BATCH * num_online_cpus() threshold (a non-root
memcg's stats_updates only accumulates its own subtree's updates, so
it takes a lot longer for it to be exceeded than the root's does).

I ran some benchmarks to get a rough idea of what a) costs. I set up a
workload that allocates 512M of anon memory in a memcg with memory.max
set to half of that to trigger reclaim continuously. I varied the
number of threads touching the memory, so that N of them hit
memory.max and enter direct reclaim on the same memcg at once. I used
bpftrace to measure the time spent inside css_rstat_flush() and
shrink_node() and used those two numbers to get a percentage for how
much of reclaim is spent in flushing. These are the numbers I saw:

# threads      flush as % of shrink_node()
1                ratelimited: 1.10%       non-ratelimited: 2.22%
16              ratelimited: 0.36%       non-ratelimited: 2.87%
64              ratelimited: 0.16%       non-ratelimited: 2.52%

Between the ratelimited and the non-ratelimited runs, walltime and
pgsteal were pretty much indistinguishable (42.7s vs 43.6s at 16
threads and 41.7 s vs 42.4s at 64, with the ranges overlapping, and
pgsteal within 0.2%).

I also measured the lock contention. At 16 and 64 threads, 15-20% of
__css_rstat_lock() acquisitions hit a contended trylock with the
non-ratelimited version. At 16 threads, the mean flush time rises
about 8% and at 64 it roughly triples from the single-thread case
(26us at 1 thread, 42 us at 16, 87us at 64)  but I didn't see any
effect of this on wall time or pgsteal between the non-ratelimited and
the ratelimited version, and the percentage of reclaim time spent
flushing stayed at 2-3%. I think that's because css_rstat_flush()
takes and drops the lock once per cpu rather than holding it across
the walk.

I also ran it with 32 actively churning sub-cgroups under the reclaim
target, since css_rstat_flush() walks the descendants that have
pending updates. I saw that per-flush cost rises slightly (~24 us to
27 us) but the share of reclaim time spent flushing went down rather
than up (4.1% to 3.2%), because reclaim gets more expensive faster
than flushing does. I don't have a ratelimited baseline at 32 children
though, because with the ratelimited version, all the runs I tried
OOMed. I think this is an alternative repro to the OOM issue but
doesn't need/have KVM dependencies, so if this would be useful to
clean up and send as a standalone C repro, please let me know.

(Also btw (this is a bit tangential to this OOM issue, but somewhat
semi-related), I don't think the WORKINGSET_ACTIVATE_{ANON,FILE} stats
checking really does anything in practice. On my benchmark runs, the
"refaults !=3D prev_refaults" check evaluates to false in pretty much
every scan. Even with flushing working properly, it didn't trigger on
1673718 of 1674912 samples, even though the cgroup was thrashing the
whole time (a separate run of the same workload counted 6371860 anon
refaults vs 6523 activations). I think it's because reclaim is
scanning faster than the refaults counter advances, so it'll almost
always see no change. I'm not sure how much this matters in practice,
but I think effectively in that check above in prepare_scan_control(),
deactivation relies entirely on the inactive_is_low() check.)

What do you all think about adding a) and b) as the fix for this issue?

Thanks,
Joanne
