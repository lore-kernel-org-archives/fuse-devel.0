Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C5E374E64
	for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 01:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784078534; cv=pass; b=EJyJfK6tKEk5a4Dt5OBx9PPX+023PJIBdAITW80xfCnpSTRC68L+Txgc/M6XdnS0BUx4n+ezWm2uqlyGBWAeC2F7mA7jb+zabHPGA04OLh+NJAj93UPpjcRiDUnoTvrLDlt8CQ6YfbYVJ7Sq6k78b1rIJ2YweUvMPRTbJnUo36A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784078534; c=relaxed/simple;
	bh=1pb4/ShOD4H/a/WCdrBFgnx9Ta+lQSYYkvfaBh0hhDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4k8nTDeWqd1p0i8ZLEVEu2ugpewG1wgBlh3VSlc/KOBgolabm6GzcYbAPkBKQTj6sHHVVQMxHzqWFi2MWVUh+y6bxkUuk/yG73ruAg60J2kKeAmycTt/A0iGv+F9ZEO+d4rpkf40bnR/Nqti1cDVrCpHMhcjxnNsS5UbwA7GK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mY/5h24B; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mY/5h24B"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c7902f47so42482095e9.1
        for <fuse-devel@lists.linux.dev>; Tue, 14 Jul 2026 18:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784078530; cv=none;
        d=google.com; s=arc-20260327;
        b=YeR55XYRo9vGdrGjhTmuksDZYIvDsX2c2CRSyX8wGqsyO6PYY7vYgnej7QuE9LY7Ot
         iLZHMvE5N/5wXglPm/B5uoGpS0DLV0OedCmegqHfIaPb5fQqSv7YprMqZ8nySt5I/+4K
         TVyuflZVGiN6Ow+/XbcKZspnwCUMdRf2hSQZk34gu9oxE8MPcyvRtchTeENZKV+4mVnR
         IQEIl7JMs/voTuepWQr8jP2Qi8nBMqC8BpGH+riyyw99jZHpUpdnMQ/EEpiTvg+Jh/Th
         JtIoMFe8dMoj5HHdIwZLGJRQCXNw3A9Uo3TmLi5vi35yUaX6NFs9mO+J6HIdEu5u/zJs
         2O5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b5B7eSevc6kr7rcW3bry1pUQlaElM2duccX7O/EPhHQ=;
        fh=kgtimvvmr5o6WASUScuXLu2cDlQSrEFOQ/wW4DephI4=;
        b=sAQMccbBPFQSG6Iyc1vrxUsr0ANbDiUESHu/uXsxGBWhUxvs04ihvAaoSlg5bDP9eY
         taTXEuGArELloy+2krOmgQCYQ8WmCIDrlm3kqckTXBxXlVl01RoPazIQD4SNNa2wLwcP
         Ts1zyKGLP+Fnc3KLvUZBeTOGt1k2podcXAqCL8M9Rz1H0dAkF7c6FeTPNRm800KZoT1U
         15FpYefDBufmEZQjNEFO7xo32DRas/X3rgtnh7MuZkM5rNZcXYro7nrxzMQAnnVgFlDA
         cSPXd8LbNA/o9d0A38bxrmKXE/ZhNlyGZZy+PzG11hRzX3pfijOhdcJaKLb+2q/hxA8b
         vjDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784078530; x=1784683330; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b5B7eSevc6kr7rcW3bry1pUQlaElM2duccX7O/EPhHQ=;
        b=mY/5h24BfSERObgGIRWkXv2wrdEMBhhaLwwcIUr4m97/3BXrFPrOg5YiwdxyQ4keBP
         co2oMQ+SqiOFTe+LFTTUBmzDD24jh0/toDX9AEqeNDWPSxS4gWPG4ebSvqByc7QetGnZ
         b/togJokvT6ZRBgeXOpOmIdocSPvvTwA0+oLposUI8B9Gz1m4C1dc8YKPVn1s9yc04zy
         gaaG4aLzCApjU8FGdzNLLzH8sY0+UoTQQKTMizE8hXXIKLMyE+acdjuHwOiXz3ozrYa7
         Tzdbm2QkBTmzjl3cvRATr6ghRRLVYSoefs/F3LNIjiWqujr8MQPqmnW6b0BCTTGwQ+iI
         +urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078530; x=1784683330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5B7eSevc6kr7rcW3bry1pUQlaElM2duccX7O/EPhHQ=;
        b=Y4ePb2JIxsDl878RRj4SNZ1XDbHFcgV0eEIJgMVk2doKkOp9+nhn6WRE1sgg5hMJmE
         9NGZZeecHHOO9JatMg5gFEwVIXTILkZLYHOcbmNTecsd1Tt1I7Yzp9XLMT0Yg4L9mXyL
         yVSHWdjDqk2wPdiwQJrp8WRX70p2sZ3NO4iQmVYGHA2dVO1d8ppkEZPuAh/zHoT7JH9B
         69uahGMmUQF1odr+tboW5izX9OoSAAarYJ6BW/FOcEuZJ8G925+lBhCd8JVze+4NqsyT
         t0u45Qjq1HPOdneBaLYyo26C5sIr3KW5t7adeSX5pZ/5/YMyvVN2yfy0+XahOziHCRG+
         aaJA==
X-Forwarded-Encrypted: i=1; AHgh+Rqn8mZMZ5ysjZbsrkgbwMCc6FFVMMqIAS1CrSDRghv3P4kFRxQM9AXEJr3OtjQe7ALQSUISMaRctE/I@lists.linux.dev
X-Gm-Message-State: AOJu0YyqWe39yh73gE0iey0pWJHKvmZ8qChewfVRNa1Nst7Du2fixKJX
	l5mvq00M8+igZUEn63F7p8bQwL9IEGN9UVW/SFm1/ZJpPNVopMWELK0sf+HWYSO7P53cX+Fw1TT
	z4p32vz2nDHC/hCjJzXl0vq0/sbUC9R1kCDJCFu4=
X-Gm-Gg: AfdE7cn3nwjQNE3RyCpoan44HC3qHwAc4+CV8rHr+x7rgEVWnM/3fq010J77qPWxQDB
	lH0a5crk1ginrK2MjUhJZKQHdsaO2mAyrJxsefNg1+Qf+COOpfMeGQr+qYDIrHnmo3uewZzQKC7
	/r3GQOP4XR01wQQWyKfQzo86JeGEPSe13M0uUIxpjhGL/Ogvgtk6Aj2r+8HRI2huIxJm7B++C+i
	Sy8+ImimKgTYAbyQ/DBL7LLLrjh98BeQxHN3CBZH2aLCk28oqgPLd2OZyY7+xfRU5i49LdjlgA8
	76ADXbXA2GaPnzEYzCEGmesmKKrUpBTk1XMReLdjAICDvDUMTTbWXhHUeD8QjxF7t0M3sA==
X-Received: by 2002:a05:600c:1e0f:b0:493:b03c:5650 with SMTP id
 5b1f17b1804b1-4953c280b8amr7639735e9.19.1784078530452; Tue, 14 Jul 2026
 18:22:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJfpegsyHmSAYP04ot8neu_QtsCkTA2-qc2vvvLrsNLQt1aJCg@mail.gmail.com>
 <CAJnrk1anOVeNyzEe37p5H-z5UoKeccVMGBCUL_4pqzc=e2J7Ug@mail.gmail.com>
 <CAJnrk1bx+32Tq5DOk6=C+_smV2HgP3+RT6gpYLSNMEirFs_EkQ@mail.gmail.com>
 <CAJfpegsy2XRR6g1J4Mg0MXPckx3NVprW56XvYhEko0=7PcHiQQ@mail.gmail.com>
 <CAJnrk1bZX44HaXmNMxEeEwhuFHgEjxXLnjKy8a-6T6LFuf+K2A@mail.gmail.com>
 <CAJnrk1aJwdY+fphnhHjAXFwjGqWQgVB+sn2Ce0gReein3H8EWQ@mail.gmail.com>
 <s4kv7qep3jlncs67q72xfhserpd66hpbwzkoppiddc5raufyjd@ksuvlfqcrbk2>
 <CAJnrk1bG6ddP6-dgXpGBRGnCH49oTMPwkJmF--+gefmy+zBo-w@mail.gmail.com>
 <oocwnxqgd4klrem6hkya3sddqoxkosml4ysz23if4j7wj2qdwi@5skgc4ftu7io>
 <CAJnrk1ZU40tRDq0z3yM0+yv=KhiZ-fNjUTO=ccv1tuc0xDx2Vg@mail.gmail.com> <4fsrafuhoqgoirlt2sy6vk2ljvb3tdps4hqbcrm5qc2pr6tlaf@tboejm2wdq2s>
In-Reply-To: <4fsrafuhoqgoirlt2sy6vk2ljvb3tdps4hqbcrm5qc2pr6tlaf@tboejm2wdq2s>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 14 Jul 2026 18:21:57 -0700
X-Gm-Features: AUfX_mxmZ586dXH5OCDXIsC76lbWem2IRb1lRdFZqD_ECtbnN_MGbFd6xd6fyNc
Message-ID: <CAJnrk1b65ypz4bdtd1rTQBYOpOEP+DcoZJUSL87jVDssW1A+pw@mail.gmail.com>
Subject: Re: [PATCH] fuse: disable default bdi strictlimiting
To: Jan Kara <jack@suse.cz>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	fuse-devel <fuse-devel@lists.linux.dev>, Jingbo Xu <jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 10:10=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Mon 13-07-26 18:13:29, Joanne Koong wrote:
> > On Sat, May 30, 2026 at 4:04=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> > >
> > > On Thu 28-05-26 15:11:18, Joanne Koong wrote:
> > > > On Thu, May 28, 2026 at 5:34=E2=80=AFAM Jan Kara <jack@suse.cz> wro=
te:
> > > > > > I think this is also going to be a problem for cgroups with lar=
ge
> > > > > > folios since they also, as I understand it, are constrained wit=
h a
> > > > > > limited / tight dirty budget. I ran some initial benchmarks wit=
h
> > > > > > cgroup memory constraints on NVMe and saw similar instability (=
a
> > > > > > single writer in a 8 GB cgroup had max write latencies of 6 sec=
onds vs
> > > > > > 15 ms without the cgroup, with the balance_dirty_pages() thrott=
ling
> > > > > > oscillating rather than settling near the set point).
> > > > >
> > > > > Ok, so this is more folios (819) than my 512 gut feeling estimate=
 :) What
> > > > > was the write throughput of the NVMe drive? The high drive throug=
hput also
> > > > > requires more dirty data to keep the drive saturated so that writ=
eback
> > > > > throughput doesn't oscilate too much.
> > > >
> > > > The write throughput of the NVMe drive I was using was around ~1.1
> > > > Gb/s (measured by running direct I/O). I think with the 1.6GB dirty
> > > > budget, the math for that ends up being that the device drains it i=
n
> > > > ~1.5 secs. The performance I was seeing with the initial cgroup
> > > > benchmarks was with 4k pages (no large folios enabled) on btrfs.
> > >
> > > OK, you might want to experiment with some other filesystem (I sugges=
t xfs
> > > or ext4) as well. Btrfs writeback behavior is a bit special with its =
data
> > > checksum computations etc. and thus latency of starting writeback. It=
 could
> > > contribute to the erratic behavior with the relatively low dirty limi=
ts.
> >
> > I reran the benchmarks on xfs and ext4 and saw similiar results. The
> > max write latency under the memcg were
> > xfs        5.1s
> > ext4      5.2 s
> > btrfs      6.2 s
> >
> > compared to the non-memcg case (0.4 to 2.0 ms). This didn't affect
> > throughput though, just the tail latency. When I ran xfs with large
> > folios disabled, I still saw ~4.1s.
>
> OK, interesting. Thanks for running these tests! Also it is good to know
> this is not really related to large folios, that somewhat simplifies
> matters.
>
> > From the balance_dirty_pages() ftrace tracepoints, the dirty_ratelimit
> > value is consistently stable / accurate but it looks like what's
> > happening is that during freerun, the writer essentially dirties at
> > memcpy speed until the freerun ceiling, and then the soft/proportional
> > throttling kicks in but doesn't kick in fast or hard enough, which
> > allows the number of dirty pages to exceed the hard limit by ~2x, and
> > then at that point the writer is forced into the loop where it sleeps
> > max_pause (200ms) each iteration until writeback has drained the
> > number of dirty pages back under the limit.
>
> OK, above you mentioned that the dirty limit for the memcgs is set at
> 1.6GB. Does that mean that dirty throttling allows memcg to dirty up to
> ~3.2GB of pages? I wouldn't have expected that...

On a couple of the runs, I saw it get as high as up to 5GB.

I think this is because the balance_dirty_pages() code uses the memcg
stats (NR_FILE_DIRTY) but these stats are only periodically
flushed/refreshed when reading it, so the balance dirty code is
seeing/using lagging/non-uptodate values.

I'm seeing this in
  balance_dirty_pages()
      balance_domain_limits(mdtc,...)
          domain_dirty_avail()
                mem_cgroup_wb_stats()
                       mem_cgroup_flush_stats_ratelimited()

where mem_cgroup_flush_stats_ratelimted() has this logic:

void mem_cgroup_flush_stats_ratelimited(struct mem_cgroup *memcg)
{
        /* Only flush if the periodic flusher is one full cycle late */
        if (time_after64(jiffies_64, READ_ONCE(flush_last_time) + 2*FLUSH_T=
IME))
                mem_cgroup_flush_stats(memcg);
}

where FLUSH_TIME is defined as 2UL * HZ, which afaict means the
flushing can be around 2 seconds stale (accounting for the periodic
flusher in flush_memcg_stats_dwork() that flushes every FLUSH_TIME
interval).

From what I see, the freerun and hard limit checks use this stale
under-reported value (in domain_dirty_freerun() and
wb_position_ratio()), which means the writer gets to keep dirtying and
blow past the limit for up to 2 extra seconds before the throttling
limits it.

Maybe one idea is to in the memcg throttle path do the flush based on
how many pages are getting dirtied instead of on how much time has
elapsed? It looks like flushing grabs the rstat lock though, so maybe
only doing it in the throttled case where it's past freerun would be
best. It looks like the logic in the regular non-ratelimited
mem_cgroup_flush_stats() call does something similar. I can run some
experiments this week with this if you think it could be promising.

>
> Also you mentioned that the disk you are using has writeback throughput o=
f
> ~1.1GB/s. Even with 3.2GB of pages we should get below the dirty limit in
> 2s and not 5. So there's something going on I don't understand yet :)

I'm not sure how the 5 got there either :) I reran it a couple of
times today and saw some variance, with the average of the runs
landing closer to around ~4s for xfs. From the traces, the writeback
throughput looks fine, so I don't think it's that the device is
writing back too slowly. I saw a trace where dirty went from ~4.7GB to
1.3 GB over 2.42 seconds which is about ~1.4 GB/s, which matches the
device's direct-io speed I saw. I think it's more that the number of
dirty pages is exceeding the limit by more than 2x and then it writes
back even below the hard limit (eg it keeps writing back for the
entire 200 ms hard throttle pause)

>
> BTW how much memory does the machine have in total?

The machine has 250 GB in total.

>
> > If we wanted to fix this, it seems like we could for
> > memory-constrained memcgs either start soft/proportional throttling
> > earlier or make it throttle more aggressively as dirty approaches the
> > limit, or start writeback sooner so it finishes draining the dirty
> > pages faster. When I experimented with lowering
> > dirty_background_ratio, the worst-case latency dropped around 2-3x
> > (~6s to 2s) but there was still multi-second tail latencies. Maybe
> > this indicates more that the throttling needs to happen earlier/harder
> > than that writeback needs to happen earlier.
>
> Hum, can you share the script you are using for the benchmark? I can try
> running in on my machine and see what happens. If I'm able to reproduce
> these long waits, I want to do a bit of tracing to understand what's
> happening with various writeback statistics. Because these large tail
> latencies aren't really expected. The original design goal was to keep
> maximum write latency (for fast enough disks) around 0.2s.

This is how I am running the benchmarks:

DEV=3D/dev/nvme5n1
# get device bandwidth (for reference)
fio --name=3Draw --filename=3D$DEV --rw=3Dwrite --bs=3D1M --direct=3D1 --si=
ze=3D4G
--runtime=3D15 --time_based
mkfs.xfs -f $DEV && mount $DEV /mnt

mkdir -p /sys/fs/cgroup/balancedirtytest
echo 8G > /sys/fs/cgroup/balancedirtytest/memory.max

cd /sys/kernel/tracing
echo 131072 > buffer_size_kb
echo 1 > events/writeback/balance_dirty_pages/enable
echo 1 > events/writeback/global_dirty_state/enable
echo 1 > events/memcg/memcg_flush_stats/enable
echo > trace
echo 1 > tracing_on

echo 3 > /proc/sys/vm/drop_caches
( echo $BASHPID > /sys/fs/cgroup/balancedirtytest/cgroup.procs
fio --name=3Dw --directory=3D/mnt --rw=3Dwrite --bs=3D1M --ioengine=3Dpsync
--numjobs=3D1 --size=3D16G --time_based --runtime=3D60 --end_fsync=3D1 )

echo 0 > tracing_on
cp trace /tmp/xfs-data.trace

Thanks,
Joanne
