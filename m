Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00756353A66
	for <fuse-devel@lists.linux.dev>; Sat,  1 Aug 2026 19:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785613286; cv=pass; b=u0F1UctBIruTjEDgL3KurjL78DU3XTBdc8BoWlKQmpUmdeMdN+l0nYsdRWxVnS2R2R4V3sQuHR6heWkmBwi5EiQdW2kHohQ4U3lmzdr9pW2IQJu6fUFA+F7h3y8HtKLlo5yOu6l9Lpx/19zxYuSyPO87Pamu4XwTEvW7DmmpJR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785613286; c=relaxed/simple;
	bh=LNXGAw6Tz5+TiEf6Gi38jYu8BqJmNJm2XXZgBq9ghCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7VxVWfcGcNfbcsz+SUNYO4HD+ax9/tjc5rLOtz3VDT1DJJeKZbO6vgijxdfsIHsZqQJX/tfT2jQ4Gp9JqG7n1kp3caQnKdZ8tkHcp2yU8AobKNJThp6WcaPVy1wSsvZJXaYtDkaKcNbXrZ3xJx68WDvbcwzEYtd7Zxd7JUuH1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZA3IHxu; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZA3IHxu"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso3179829a12.0
        for <fuse-devel@lists.linux.dev>; Sat, 01 Aug 2026 12:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785613283; cv=none;
        d=google.com; s=arc-20260327;
        b=kR9yCX0wzviPNKmofvMvOj3M5KrlDTaNvmbj/4ubyNXc7oZ87p/3x1SNj3bIyPvW0P
         mqi3kTBm4zUrmhERYDJP8cGM6+7G+MWK328PGV3+Ikej3OGwn8r/xUdB75qlWafADVXo
         U0DKjXbNcCdP5vhSYNa2YygKH0QCVM3mRZ0HX760Z9tIxQoxfqQD5ES4CLOewev7K4hi
         wU3SvSsjZeNtj7821HgmHzQPucKszz6Vivx8YCZe/B2hJb/3QGQ6tcZ/ciBPyi8/NzIt
         9B3lttbufZqRdBu1vnSQKSVdmhPH/ZVTFme7Xw1e3E5b000L/IAHtB7Ftt7gascp4Spf
         5i0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jtnMDCYtuZDOB8PvPIKFhiVJNyKCM9rWJUcJ2niqMHY=;
        fh=HK84TmcOd4Nkn/9AKkl8pK4Gg44AhpNe6SPY4RN20cc=;
        b=fBKDLkbCRAa6ZQj1d9NNeW3XKBDaAkbMgzBKEF3Nd55V6GnEeEBaoC7KPrrPd1/m2I
         taG0cBet+bKdBYKOHYRi9mKeNZTegJyFf6EHZifboNXXbHx/TUsO7Eo12PIucS0B8LD0
         puHswXXuiHS1iCRX4PXbJZvEZq0x9rkX56NDFHXy4hZEEKGOex2RaBwGV5gq80dZvtGS
         7xj7PlaoyNm8RKKASuXEKrf2PpPgStiMWFq7WmolOIjUKSa494KT8ruo0Dx9qM1aH2kV
         XK1xxRyDHzaSp6Obr4qCAYtUr2RiPangwhWo3yVWp9XZZMyhI/Zaxn763TqeLlYdcC/l
         9eow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785613283; x=1786218083; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jtnMDCYtuZDOB8PvPIKFhiVJNyKCM9rWJUcJ2niqMHY=;
        b=pZA3IHxuECVop6kQijDKLGpcCowFo0Pf/3S9hO3S1o6VpjFi4fabIlKwD/XM5oAaX5
         Uexs2nlc3pf14oz7lq68scdUp4pUeU7Vyezot0xjHMD+hnyamQczxUK6TIKRsPfwLTIc
         Zlhpqg2J18UHofajx4vekFOO1oWxkkcuP3O3wsdNTQbCFhb5e2glVr5NdqC8DGGHDYjT
         YuGaITDHiYyun2Q1tOe1a/8h/SQ0cpd0ZYVVx7MJBZqKdNWX+ChbsPK1LSOLgkvblpBR
         VZU5L6trAqn6WI7QxNhvIQ+INoWuIDDeWp9/Vg64qdcqsfNv+mazYeBCAlMCHTxxMsar
         orVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785613283; x=1786218083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jtnMDCYtuZDOB8PvPIKFhiVJNyKCM9rWJUcJ2niqMHY=;
        b=mPh0lNPCiTQjJufb3Ic3uKjm6cexYnDe75Rh5FwMB/UDdkn/bgGGK3egj7SId4x+/w
         vOFagLf3ISevbP94I+IOoUior7GeenscVv9AdznPDFeQ7tIOaq6rvbDx7Afh9tbrCEjo
         iFLLdy+3rQi6oB8ydZm63SMl1tzSfUJjcAZXLOIo0HlmjdPuA5Ir6bo9DxQu7Jss7rpg
         Gv/XGlBa2aqUlQSj6rnPWvFB2o5PpkTN3tBQd73oc3ya4Ehk5xAqGrz2SCu7YCnBEBM2
         p3/kXoPGpD9tqnCmwOewtLJQRpVSP8iRwhBzXJmFpCTjnWP/KjpcaCqWojzI4sLooBHs
         aPUg==
X-Forwarded-Encrypted: i=1; AHgh+RqEKwInlN346P01DeyGMhbp3rNkQYDJB3ajcOOZKYfFFmox0BSzlQPTzt0VCSTs0YM+oeeUKrQL20WA@lists.linux.dev
X-Gm-Message-State: AOJu0YzIQ1o+iwfDpHaWmow0Fb1qJfC2kVHpoH/wSzSncmR4VLd9DBqm
	aBd9EowBIlcVfInw30CJcBVBO+WWI7Q8aOZjjEe8aFSrzYUoiJY9zkGtgfuuN76U3ESxoY2IYPG
	e1pmb0l4Mxlt6oueIMsAW64DaOHRc0xQ=
X-Gm-Gg: AR+sD1080u2HS30OVZax+wE8J1XQ6dCp+JmAfqFkTnvkW/p3Cgtm9L2MoaSi9d/GuhJ
	ceXJgOF/jB8pl8maF+vd3svKOEgZ2piP2XLfgKAsEccmP3wqPOkTBtp1xgKGWBWn280XAokAFOz
	vQKBHKKSbIR6YG5WqQqbh40zOTRopfktlZeXXh9sJc3yO9+P73WLDBzbAD+wRVCrpUhT6bQqnMM
	WfSGh2zyi8MYxGSu7KuDdgCBn9cyWFdTY9jUL/BtPILsmOk4VMggtNUVfGHj399yAvnCcovXdiT
	sYaIrrbIXMaeFbMZyIVo8FatCG3T1qJZ45Zq5W84iK/XnA==
X-Received: by 2002:a05:6402:4541:b0:698:ad7f:9383 with SMTP id
 4fb4d7f45d1cf-6a0a7ca26camr2513308a12.14.1785613283186; Sat, 01 Aug 2026
 12:41:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616231325.16788-1-russ.fellows@gmail.com> <20260726015955.319132-1-russ.fellows@gmail.com>
In-Reply-To: <20260726015955.319132-1-russ.fellows@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 1 Aug 2026 21:41:11 +0200
X-Gm-Features: AUfX_mzQD4_GlZXDQI6JfCQpKnGigqG8DsmxHVr6ulogZ1XWG4BG2zyaNWasR7Y
Message-ID: <CAOQ4uxhHx5kHT0PfyZ+yb1Y2s0LS6ph-jQ3n66w9Zw13v-5L9Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] fuse: allow parallel direct writes for passthrough
To: Russ Fellows <russ.fellows@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2026 at 3:59=E2=80=AFAM Russ Fellows <russ.fellows@gmail.co=
m> wrote:
>
> This is v4, about six weeks after v3 [1] -- apologies for the delay.
> Thanks to Amir Goldstein for the detailed review of v3 and for the
> suggested patches; this revision implements that feedback.  The v3
> thread [1] has the full context and Amir's comments.
>
> The series is also available at:
>   https://github.com/russfellows/linux-fuse-passthrough-patches
>
> FUSE passthrough writes are fully serialised on the inode lock, even when
> the server advertises FOPEN_PARALLEL_DIRECT_WRITES and the write is a
> direct, non-append, within-EOF overwrite.  Native FUSE direct-IO writes
> already take a shared lock in that case; there is no reason passthrough
> cannot do the same.  With a passthrough backing file on XFS, this is the
> difference between serialised and fully parallel 4K random-write O_DIRECT
> throughput.
>
> Patch 1 stops fuse_file_io_open() from stripping
> FOPEN_PARALLEL_DIRECT_WRITES on passthrough opens (which bypass the page
> cache without FOPEN_DIRECT_IO).  Patch 2 lets fuse_passthrough_write_iter=
()
> take the shared lock for eligible writes by sharing the existing direct-I=
O
> write-lock helper rather than duplicating it.
>
> Rebased onto v6.18.39 (LTS).

Hi Russ,

This version looks good and very well tested.
Please add
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
to both patches.

The only thing is that your patches need to apply to the current
upstream master branch
not to an LTS kernel.

Kernel patches always need to be merged upstream and only then
backported to LTS kernels.

The merge conflicts with master are minor, but please rebase and test on ma=
ster.
With that done, I hope that Miklos will be able to include v5 in 7.3 PR aft=
er he
gets back from vacation.

Thanks,
Amir.

>
> Changes since v3:
>  - Patch 1: keep only the FOPEN_IOMODE_CACHED() helper (drop the
>    IS_DIRECT / IS_PASSTHROUGH macros, which described how I/O is performe=
d
>    rather than the ff->iomode state and were misleading); fold the
>    O_DIRECT/fcntl note into the FOPEN_PARALLEL_DIRECT_WRITES comment; and
>    simplify fuse_file_io_open() so a pure direct-IO open needs no early
>    return.  (Per Amir's review and suggested diff.)
>  - Patch 2: instead of duplicating fuse_dio_lock() into passthrough.c,
>    generalise it: fuse_io_wr_exclusive_lock() now also handles passthroug=
h,
>    the uncached-io refcount is factored into fuse_parallel_dio_start/end(=
)
>    (no-ops for passthrough's permanent uncached iomode), and
>    fuse_dio_lock()/fuse_dio_unlock() are renamed fuse_io_wr_lock()/
>    fuse_io_wr_unlock() and shared by both write paths.  (Per Amir's revie=
w
>    and suggested diff.)
>
> Testing (fstests / xfstests)
> ----------------------------
> Run with the libfuse passthrough_hp server under xfstests (FSTYP=3Dfuse),
> './check -fuse -g quick' (642 tests), on v6.18.39, backing XFS on a
> RAM-backed null_blk device.  An unpatched v6.18.39 baseline was captured
> first, then the same tree with this series applied; results were diffed t=
o
> isolate any patch-induced change.  Two server configs were exercised, as
> suggested by Amir:
>
>   passthrough (default):    unpatched 25 failed / patched 25 failed
>   passthrough --direct-io:  unpatched 27 failed / patched 27 failed
>
> In both configs the failing set is identical with and without the series
> (the --direct-io set is the default set plus generic/355 and generic/362)=
.
> Every failure is pre-existing on the unpatched kernel and is a known
> passthrough_hp / fuse limitation (permission/ACL/atime/mmap-coherency
> tests), unrelated to this change:
>
>   =3D> zero regressions introduced by the series in either config.
>
> No kernel warnings, lockdep reports, or splats were observed in any run.
>
> Performance
> -----------
> Custom FUSE passthrough daemon advertising FOPEN_PASSTHROUGH |
> FOPEN_PARALLEL_DIRECT_WRITES, XFS on a RAM-backed null_blk device, kernel
> v6.18.39.  fio 4K random write, O_DIRECT, libaio, iodepth=3D64, single sh=
ared
> file:
>
>   numjobs | unpatched (IOPS) | patched (IOPS)
>   --------|------------------|---------------
>         1 |         352,000  |       352,000
>         2 |         440,000  |       648,000
>         3 |         429,000  |       951,000
>         4 |         423,000  |       987,000
>
> Unpatched write throughput is flat regardless of job count (the exclusive
> inode lock serialises all writers to the file); with the series it scales
> with concurrency, ~2.3x at 4 jobs, up to the backing device ceiling.
> Single-job is unchanged (no lock contention), and 4K random *read*
> throughput is unchanged (~1.37M IOPS with and without the series), since
> reads never took the exclusive lock.
>
> [1] v3: https://lore.kernel.org/all/20260616231325.16788-1-russ.fellows@g=
mail.com/
>
> Russ Fellows (2):
>   fuse: preserve FOPEN_PARALLEL_DIRECT_WRITES for passthrough opens
>   fuse: allow parallel direct writes in passthrough write_iter
>
>  fs/fuse/file.c        | 53 ++++++++++++++++++++++++++++++++++---------
>  fs/fuse/fuse_i.h      |  2 ++
>  fs/fuse/iomode.c      | 23 ++++++++++---------
>  fs/fuse/passthrough.c |  6 ++---
>  4 files changed, 59 insertions(+), 25 deletions(-)
>
> --
> 2.51.0
