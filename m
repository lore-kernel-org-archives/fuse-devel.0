Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52F1359A90
	for <fuse-devel@lists.linux.dev>; Tue, 14 Jul 2026 01:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783991625; cv=pass; b=LT6oW8NNipB5G85+SODUVnk6ocWgMGkPf0dzCVwVSrjKjoWxYCabb+LzIMT5ZTqMP9UZk82LfQIjYArGAyg/5l8IqTQRe2IXkuB7ECbM4n/CgBviFgDOfGr8uno+Sm/uXOx1aU7whBLpNEzwxnno47oec3DPsf0ZkYKwSBfCXpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783991625; c=relaxed/simple;
	bh=eRS3r3eqwvpl/2inXyOi1m/776FfLO1zFPPdxEGYq2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yv6pLaERSwSeqD5HiCKXrD1EkRDclKoey8/eEQDYp8/sYMQCayLSskV80tMgK5Ulc6gRkjAYRkYDzKIeFqIRbtuLYgAj1jHTZR7ealx/e79Hh/w8BPK4mnrtEy3Nh73olG9epzL0ultnpThV3PkdOgDMuwBcqosDKk9+G9JCQ8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKp1TBev; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKp1TBev"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso2295551f8f.2
        for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 18:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783991622; cv=none;
        d=google.com; s=arc-20260327;
        b=XugeY8iaV/kaaBxw6dbvs3A7AygbZKzrHn87eQ4AtlDjDuUpu12hdtEE4ZUPB1PJED
         xgxPVL7x+62bTgQ+HN3DdGnM56/sFxm0AX9bNtG38D7jI3Fpg83gxafyEn+u0VUg9nzi
         r1XvSWYMvt3s2vz0HPUIz6P8ZE8Fu9tUz84E371IBIc+E9pq5IOCCzUpT/cmgS3yB+IJ
         rJyjlPrhOrpmyWWcbPECxteJivVnaPmnMJdzWj5zeK1ILczp0mLzGdUkG02luG1hCoYg
         z9Tuv7tIwm3RGcw83RaoBUxyda5zg2CdhMdfJNl8uaKn7hmOwKCfXQBYPwdCuLCpPkg7
         mBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C9zvs/4Q9rFfF2Zxa+4Sity7+TLXzEBtCkYAA95hYUo=;
        fh=lUPZNPlJtg9CJDiJJPIc6YYD/elBCegyVJQwMEQj2og=;
        b=Tk+TnEGouABrFnNjnk8vocrVStDtwdWSASpV49MGKPTtrpU1GLGildn0TUaoV+ocTO
         PbNkDau8rx5Z4BVT17ZlZoP272NYCA63MoquTGwC4i7y/pdcJ/a9NaaXW4Dks65PqDy1
         RT235bAu7kSJBOoPsIFU8b+EgSnRHSnYk2eb0VOr8Uo9bR/8kYFM9MfYz4+DDvfJJeZ3
         IlVOqbLvW0qO7JTunQjy7v22KQ2d+n4jdhjoL2EVSHBaBhW0NTAk5p4zah3tRuR/jY7w
         Piv/Kme0OwnhslVP5IM3QYIGNahdRy+XP9dmf19Vdd7mbFFXBe++/PJEqpfb9mlATHOZ
         RLpA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783991622; x=1784596422; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C9zvs/4Q9rFfF2Zxa+4Sity7+TLXzEBtCkYAA95hYUo=;
        b=QKp1TBevRQdynaHr/N4oCA4Yls1eGVIh0TX+hxT4POVyt8ggm0TuqSmulVcicCmH53
         6N5RoVq660PXgvJEMYrW49qK/nQz/SbjLbp/cv4G2xPwy69utYEzgl72zvaumlAZy1PS
         Ome/XNjlBxSiEIr0BgsJ5oMIw29j7GAE1ve4xQU7PdgYHMpFWgTy7+gVHqJu+fJGJrvn
         q+Ws7r9Qk4I9GXqF3nxizM4luDXKr9fXJ2wi0NiqP3jDk8KvdaNNE4U21zbYTzIMSM5L
         2VhtHWpQpKo8O1/+ORh4fTdjdHuYdzhFLAh5lYTSXFTQlLCN4Emdukqs6M6xXC53j8FQ
         jXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783991622; x=1784596422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zvs/4Q9rFfF2Zxa+4Sity7+TLXzEBtCkYAA95hYUo=;
        b=LgHQ4pBgcf9zxqEVyHLCttQ7/0JW6uDneVgL0MFXCvsRPjrx6JfD8ZK5+e8j17FCOz
         CS/7RQNoG+xssU+7LD40PS9/pnpPvntgJxBlffjcMrQxdOa08TK+LS0dlsTdJisXOIu1
         TB7sR0zaqZpPZKf3ohqNuwMJhEbqlNNquA7zjDHppvKhdYz4PsYJIOyb45Qph4hdZsa7
         M0/zN4Wfx3baN60guk4b32TAfjzJ8XyMY8ztyghtsustuvpoJCKRwlcAIPFgevpAumLV
         uvkiG1NFaLuaoSpmAPvDVG7o/YDUbklWoGtzm5ohrhuYp6JFzMOEP42WE2T7AthVNKls
         lB9A==
X-Forwarded-Encrypted: i=1; AHgh+Rp70X4vtwdB6eew8mrEvpI9EC1rXif+Yy+PKqAfzRg8YEihf/Rk09in2c8qGRqAlIlzez635if9jlG5@lists.linux.dev
X-Gm-Message-State: AOJu0YzTR7/saaYF3rTqBM8GJx2eTqV13bceLYZeEsD8i3qC0V7hiUCp
	qiyKeVBLxw8FeXbwqv+z0yzVktvqix0B7F/PmV3h3SqvBx/ULb01/bxwX8I9OaKH9uGHKpV9nxb
	iQ3d8w0MhLt9/ePcxekReoIFathkZiXw=
X-Gm-Gg: AfdE7cnO7GsHehmkT7IODyaco64DYrCrPCGUKLkM6X2YUoWJwkJk1X4zNhpurX8466n
	91l6HbAWpuWp4FCr1b1JxF5AEnY5OELR65syzPb5K5sh9F4L4Env8cgH3E5Ka2Y0irzNmY6MjHK
	rTXXRbdBcVahoFNwLcdmoyKjzl9lw/xCszmRXmoY6MFsWRQ4OS+q2N4+BMkVgkzd5KLoLjTb1dm
	eyhSlls4kIFco5mt+D+uPqHe+jIJwzgqWTDulgV026MwP/fBv1lgCRfWpITSc0e0QXjwG5umDBA
	Y1vj1Dg6sTYFojaO9qVTsmEGxaRWqhjHhZoxpK3Vx3T8iqPYuaGNHUokXQAdpbw1L7/hDQ==
X-Received: by 2002:a05:6000:2906:b0:477:6da:1b8f with SMTP id
 ffacd0b85a97d-47f488b2454mr382374f8f.34.1783991622051; Mon, 13 Jul 2026
 18:13:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251008204133.2781356-1-joannelkoong@gmail.com>
 <CAJfpegsyHmSAYP04ot8neu_QtsCkTA2-qc2vvvLrsNLQt1aJCg@mail.gmail.com>
 <CAJnrk1anOVeNyzEe37p5H-z5UoKeccVMGBCUL_4pqzc=e2J7Ug@mail.gmail.com>
 <CAJnrk1bx+32Tq5DOk6=C+_smV2HgP3+RT6gpYLSNMEirFs_EkQ@mail.gmail.com>
 <CAJfpegsy2XRR6g1J4Mg0MXPckx3NVprW56XvYhEko0=7PcHiQQ@mail.gmail.com>
 <CAJnrk1bZX44HaXmNMxEeEwhuFHgEjxXLnjKy8a-6T6LFuf+K2A@mail.gmail.com>
 <CAJnrk1aJwdY+fphnhHjAXFwjGqWQgVB+sn2Ce0gReein3H8EWQ@mail.gmail.com>
 <s4kv7qep3jlncs67q72xfhserpd66hpbwzkoppiddc5raufyjd@ksuvlfqcrbk2>
 <CAJnrk1bG6ddP6-dgXpGBRGnCH49oTMPwkJmF--+gefmy+zBo-w@mail.gmail.com> <oocwnxqgd4klrem6hkya3sddqoxkosml4ysz23if4j7wj2qdwi@5skgc4ftu7io>
In-Reply-To: <oocwnxqgd4klrem6hkya3sddqoxkosml4ysz23if4j7wj2qdwi@5skgc4ftu7io>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 13 Jul 2026 18:13:29 -0700
X-Gm-Features: AUfX_mxGYLyqGVRnxuiEgq-1unfq_iO1Y9aI3_BjCE6WoNVbw-1i77CB6bGHJSY
Message-ID: <CAJnrk1ZU40tRDq0z3yM0+yv=KhiZ-fNjUTO=ccv1tuc0xDx2Vg@mail.gmail.com>
Subject: Re: [PATCH] fuse: disable default bdi strictlimiting
To: Jan Kara <jack@suse.cz>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	fuse-devel <fuse-devel@lists.linux.dev>, Jingbo Xu <jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 4:04=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Thu 28-05-26 15:11:18, Joanne Koong wrote:
> > On Thu, May 28, 2026 at 5:34=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> > > > I think this is also going to be a problem for cgroups with large
> > > > folios since they also, as I understand it, are constrained with a
> > > > limited / tight dirty budget. I ran some initial benchmarks with
> > > > cgroup memory constraints on NVMe and saw similar instability (a
> > > > single writer in a 8 GB cgroup had max write latencies of 6 seconds=
 vs
> > > > 15 ms without the cgroup, with the balance_dirty_pages() throttling
> > > > oscillating rather than settling near the set point).
> > >
> > > Ok, so this is more folios (819) than my 512 gut feeling estimate :) =
What
> > > was the write throughput of the NVMe drive? The high drive throughput=
 also
> > > requires more dirty data to keep the drive saturated so that writebac=
k
> > > throughput doesn't oscilate too much.
> >
> > The write throughput of the NVMe drive I was using was around ~1.1
> > Gb/s (measured by running direct I/O). I think with the 1.6GB dirty
> > budget, the math for that ends up being that the device drains it in
> > ~1.5 secs. The performance I was seeing with the initial cgroup
> > benchmarks was with 4k pages (no large folios enabled) on btrfs.
>
> OK, you might want to experiment with some other filesystem (I suggest xf=
s
> or ext4) as well. Btrfs writeback behavior is a bit special with its data
> checksum computations etc. and thus latency of starting writeback. It cou=
ld
> contribute to the erratic behavior with the relatively low dirty limits.

I reran the benchmarks on xfs and ext4 and saw similiar results. The
max write latency under the memcg were
xfs        5.1s
ext4      5.2 s
btrfs      6.2 s

compared to the non-memcg case (0.4 to 2.0 ms). This didn't affect
throughput though, just the tail latency. When I ran xfs with large
folios disabled, I still saw ~4.1s.

From the balance_dirty_pages() ftrace tracepoints, the dirty_ratelimit
value is consistently stable / accurate but it looks like what's
happening is that during freerun, the writer essentially dirties at
memcpy speed until the freerun ceiling, and then the soft/proportional
throttling kicks in but doesn't kick in fast or hard enough, which
allows the number of dirty pages to exceed the hard limit by ~2x, and
then at that point the writer is forced into the loop where it sleeps
max_pause (200ms) each iteration until writeback has drained the
number of dirty pages back under the limit.

If we wanted to fix this, it seems like we could for
memory-constrained memcgs either start soft/proportional throttling
earlier or make it throttle more aggressively as dirty approaches the
limit, or start writeback sooner so it finishes draining the dirty
pages faster. When I experimented with lowering
dirty_background_ratio, the worst-case latency dropped around 2-3x
(~6s to 2s) but there was still multi-second tail latencies. Maybe
this indicates more that the throttling needs to happen earlier/harder
than that writeback needs to happen earlier.

I'm not sure how much this matters in practice though, given that no
one has complained about it.

Ironically, for fuse there is not this problem because with
strictlimiting, it makes the dirty budget so small that even with
exceeding the hard limit by ~2x, there's not that many bytes to write
back so there's not that much latency waiting for it to finish, and
strictlimiting also inherently starts the soft/proportional throttling
more early/aggressively, which prevents too much overrun exceeding the
limit.

Thanks,
Joanne
