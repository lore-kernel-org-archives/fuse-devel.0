Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F00A317161
	for <fuse-devel@lists.linux.dev>; Sat, 30 May 2026 02:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780107326; cv=pass; b=nLXmWjWgxYBrDL4YfCpzsPeaJsAXdRjESwkkCIuE6m3P6uAtjYCgJxaQJ8BuHcO2JCIOrOaiBOWeUXi9HXsEJ7rbg3W2O8sdUBhUtzsE95va86Md/eIg7y5A0SxKmZjbvf61BHJKUyp7fGGt4LIP3F6P2kIsaAseEx6e4S4Oedw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780107326; c=relaxed/simple;
	bh=hBo1mZpiq6R1gUudU4oyOhNNAJzH1gaJHQj5Dbqzyik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7Oo88khjozbioQ6DLPcFjU8f7bm2bTd4C14BSTEZ83t/nJE9tAhfUxKpz2ANuWF/A81K9E5BmDqthTMcQZR2HBRGxmdCWwYpw6+IZ4ETkd3ZsZnJcH/kK2FTaOUUMePrERbhxwvb1iH6TPCE2MkzbEvyCOhbDbvBpB16i0J0jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YV1RPVNl; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YV1RPVNl"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso354442f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 29 May 2026 19:15:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780107323; cv=none;
        d=google.com; s=arc-20240605;
        b=AINNCrZ0sL1RsfIXYzYC8lX6PUj4/gzSdWfga3abtRkKdHA330RvBvcRwOAAZYjO98
         m4CWYT8yjmBl8hSyO0VVBnTZfdusoEeGNUNVzlvX5xVxmyFu6u7OkRxzq3QxYKyG/9dN
         06V8lgNiYZ85B+fMXocEYVSD3/6gP+5AG7j6MYXHeMl+t6ZYfIw5J6pZXKSkgDf7pmrV
         H04Arb3NbMnWj5ubGsqnfA/mLR2SUXxzM3zxh1JXFDL2F8Ni/FREtGTOr+bAnqp2t0DR
         YPFjk/2QOOHUt2+PGdf3h9BAplUz9bR5iVAUfbfQ2CmdextDY1IVfcZS+UJcoNYMBWjD
         CQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gEqMOpP7mfSN7mBG1OQxgecdTpvWjr1mxFCqvGIWdFw=;
        fh=dIiHkR2EYf+xK8D4uyl7AQUEWKneT3gOWOQhys8Ogh8=;
        b=fXUpbKsjwTONn4CbAGZ8nGWvXQ9MvqjF2zEjzb1jhP/W1812yJ6xC9aOysxIw88ZBp
         SAGWRSn++Pm2vLz+FLmK1iTXKg/HFA+JGuA2t4AamtA2ZGEDDF/oHMtg8pgz39lxLqs5
         BIQpvdWwwr5s9pkhHpOIPLbUBnHHLB4UgzyTcCcKJbmTZAQ5+npy4Fgz8m9x7u71lA2O
         RJAj1sUjm+ABUfh73qQZ1iYmPb6oa9Uza4S4/M7jROLO8Yv3gP6TGN79rJ8XSvdna7Xu
         KSQcR8NgfR21uRYTnTNqBpxTheWX8VTJgprE9jiNqNA3PfPRWpyIeenQ6z0jSbiuQX99
         yrMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780107323; x=1780712123; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEqMOpP7mfSN7mBG1OQxgecdTpvWjr1mxFCqvGIWdFw=;
        b=YV1RPVNlnajAyqAKtfFXCgBJQ1mi/RCLGT3SGIGI/l5KXMh8x/n1jdTACRWWC0EC+g
         8CivgyVr9xSe8DbR25hpEsmnYy1z03Q/FGDgNSkvcF8lzpOvWmFX8/65SUE/MSabL4kM
         9xZm0fyOtQWPwkVkH6iXysL9OIbAW/mrWc2n1y//wo3sD8EJqL+swdpUZR0uS8c/2YuB
         mnj88Mc2xnPGWe6ffQbfwLrIovTmtEz9r1HDHb2iwEaeh8RopwFpQozV5um4GxeZqepv
         ayYR89ZSchtShC1W6yjxNwxCNfZtdQiLMmR/Z6Do+yspAc0wOBIKkttGp9mN/Ccx0MiJ
         cMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780107323; x=1780712123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gEqMOpP7mfSN7mBG1OQxgecdTpvWjr1mxFCqvGIWdFw=;
        b=ov7w+LH1keR8KG1cxMH66BFZI/ezcnL3mhbKRVBK6PeHkunlaQce+EUjbHhVgcEYb1
         ZoOixddFGGMccEaPKo2pVSCEATffujIWAVOSgu8ZMp/D5KpEj4w6Q0YteNzdzbNe2Dz0
         pTRwywqzX5XS78SAzWaEa8/T1b+EQFZxJsvAwt7UPAjBoHCSOmPmyjm4SzId5imwY3cQ
         XnXn5qT+KWPixMKjnM8vU/dEb/o33U+kXzO2xHxzZLzLK/FTQYd7Xlv05Zb/0zuiNZ6h
         kYC+U+Y4WKOe9PoZ5+odWDBWkPlFKElou3DG0W85hVkSxQImCeiu+fQvP/zCLIFsJjMX
         v8gw==
X-Forwarded-Encrypted: i=1; AFNElJ96DkDRPWAQmhz+iSgCMg2W/ZQ3hgTAd83V2i4Bs18skNHybR1C2cAWLIFPIc43YP46RJO2Uhx3XTRz@lists.linux.dev
X-Gm-Message-State: AOJu0YysqhOasLZHdL0GIneQCyvkQ+abTjC/UEWz5YVN1tpYPARS1e5a
	nuCpHa53bo8kuq7W2awVBcIuNoV3z3Lm9ZFjJQgLbWRI4K+W//FPHV7W76BvJ8Gix+v+CHDZeSt
	JKrTp/podjyieu2VelLp+Im25FgSSRZM=
X-Gm-Gg: Acq92OGSmn+cP5UC59I0txrImV1o2K7oKRGzwL0Lnrpaw60hs/cOTRNUNqNOR5qaFKt
	UIcgv2jTtLjOOFVhSeE48aw5HJ1N5JgiCOt7ZCL4nAqL8inhnWuUgl8Sebmi2sS3QFp1y3iIgtH
	vlNNdtnv6ccPmOB9C1ookCYqRPAZovspEtRNvDaQuKHRw8FafDrtvh/O5KaQnmkZfMPbnUYFTFd
	NZeismkYWpd+1vGZXv/9qpyQa9rgrAomzu7XsTpsd8K8y9tCd7AGmNfgAH32NB/Y2JsJoVGHfZV
	xn7AyYBHKIK1nzO2
X-Received: by 2002:a5d:4745:0:b0:45e:9366:94c1 with SMTP id
 ffacd0b85a97d-45ef6b4f79bmr2726468f8f.18.1780107322695; Fri, 29 May 2026
 19:15:22 -0700 (PDT)
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
 <CAJnrk1bZX44HaXmNMxEeEwhuFHgEjxXLnjKy8a-6T6LFuf+K2A@mail.gmail.com> <CAJnrk1aJwdY+fphnhHjAXFwjGqWQgVB+sn2Ce0gReein3H8EWQ@mail.gmail.com>
In-Reply-To: <CAJnrk1aJwdY+fphnhHjAXFwjGqWQgVB+sn2Ce0gReein3H8EWQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 29 May 2026 19:15:10 -0700
X-Gm-Features: AVHnY4Jg-QA5wTBdWB9XzXD9Vhbv_0XU_TUz4CrBYf78TUDU44-Us2FtmwrXQbY
Message-ID: <CAJnrk1ZSaNRr-HWw-hbo2=LmbZiNGZveb0MwxZbPtBDFgg2icQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: disable default bdi strictlimiting
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	fuse-devel <fuse-devel@lists.linux.dev>, Jan Kara <jack@suse.cz>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 6:42=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> I read through the writeback throttling code and re-read Jan's very
> helpful comments from this thread last year [1]. So for unprivileged
> servers, I think we definitely cannot remove strictlimiting. If the
> fuse server is slow or unresponsive with writing back the pages, it
> will take up too much of the global dirty budget which will degrade
> write throughput for other filesystems (their throttling will be
> computed against the global dirty page count, eg the freerunning check
> in balance_dirty_pages() and the pos_ratio calculation "pos_ratio =3D
> pos_ratio_polynom(setpoint, dtc->dirty, limit)" (dtc->dirty is the
> global dirty page count)) and any fuse stuck dirty pages are
> essentially unreclaimable. Without strictlimiting, there will be no
> hard cap on how many dirty pages a misbehaving server can accumulate.
>
> With strictlimiting on and large folios enabled, the problem is that
> the large folio size can potentially dwarf the server's dirty budget,
> which can lead to excessive throttling. When I ran my benchmarks last
> year, I and independently Jingbo saw severe performance regressions
> for buffered writes with large folios (eg 2 GB/s BW w/o, and 200 MB/s
> BW w/) [2] but I think that might have been because the machines had
> limited RAM, resulting in a very small dirty budget.
>

Update: this is no longer a problem. The large folio buffered write
performance regressions I saw last year was fixed by commit
494d2f508883 ('fuse: use default writeback accounting') [1], which
landed last August.

Prior to that commit, on a 2 GB VM, I was seeing for buffered writes:
No large folios:  840 MB/s
Large folios: 270 MB/s

After that commit, I now see around a 30% improvement compared to baseline:
Large folios: 1130 MB/s

Prior to commit 494d2f508883, fuse was doing its own custom writeback
accounting but the accounting wasn't updating wb->writeback_inodes
(which tracks when fuse inodes enter/finish writeback) or
wb->avg_write_bandwidth (which estimates the device write bandwidth).
As a result, this caused the balance_dirty_pages() throttling logic to
think the device is super slow since it's using stale underestimated
values for how fast the device can drain dirty pages. This caused
overthrottling based on the wrong estimated calcualtions.With large
folios this became a noticeably big issue because each folio charges
more dirty pages, where the balance_dirty_pages() logic thinks it will
take a super long time to drain those amount of dirty pages.

commit 494d2f508883 switched fuse to use the mm-internal writeback
accounting, which properly updated wb->writeback_inodes and
wb->avg_write_bandwidth, which fixed the incorrect bandwidth
estimations, which in turn fixed the overthrottling.

Overall, what I'm seeing is that enabling large folios improves
performance across the board for fuse, even with strictlimiting
enabled on memory-constrained systems. I'm going to do a closer audit
of the fuse code to see if we're missing any gaps that will be needed
for turning on large folios, and then will do some more testing. I'll
also rerun benchmarks on NVMe to make sure large folios don't lead to
any performance regressions on fast storage. After that, I think we
are good to go for turning on large folios.

I'm still planning to look into the cgroup dirty throttling
instability on NVMe I was seeing earlier and do some benchmarking /
experimentation with the folio order cap. I'll post updates on that
when I have them.

Thanks,
Joanne

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/fs/fuse/file.c?id=3D494d2f508883a6e5c4530e5c6b3c8b2bbfb7318d
