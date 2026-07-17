Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77EB331A61
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 10:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283540; cv=pass; b=c23Fb3i1osF5sXI/tXaTHCLrExkV99qZCkBflGKn/FUG7XcNDKVJomql9bYWqHT5+1cJAXRAX9SPOeEox/FYWqVBTPsWpmJia7/W2bQywcDzEIPzkKULPEI8ewBWrz+TNV3RZTqnEaFaAeXayfU5YqwVytmulNoslAiuVKEwkRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283540; c=relaxed/simple;
	bh=Fzv68QM6nV2osTwfz79HsIHAckvrEYqlb5+3hWjr8r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srV9h2cA3GO+wTStw4pkUWhSX2D5VCec9OeGbi+hwGSnNdJcS646QwfuuHFifbA3SgLxFtjAZy0tnLvlJ95B4rvkAXyKhtvRJPV27aSdl4c2INl61NcV9yHMfijVea9fEvg6YFbI454t+U8WUn2srjjS6UUb/uVCzPLDJu6Artg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=B8oSz4Y0; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="B8oSz4Y0"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c1372f84dso40859661cf.2
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 03:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784283536; cv=none;
        d=google.com; s=arc-20260327;
        b=ZdCuav9W2W6g5BqnwOZ+3AppwpUmCqjhl4iSzJDJ+YjHPnnheI8+zDpTDr0z+J+oOj
         wNbw6t6Vg1IrR0H1zSM7POu+RFZe6rI7aQjPXyuCw4JNWxSfiet7JnyJRf8SWuZ4PE/G
         smVkeZcMwytS21jRQjsFOGyNkWmOnYrI9p2N7t4wQGPqgV1BUdHrv/rowTqcnxWgBIfJ
         Dz4KQzw22IkZJYU7ABU5KcypskRkarHV2tuGHFzctyksRblPGcSricnk0zvawougyVxn
         N87VvRuXV/vnqjKn0HPWdPm2svkvGgp0CV5ucuTEdIL8COyUgKXrncPVEPup+b98Isih
         2Ufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WztEFrcoKw5uOPN5G0iiXMrCuae4JGCJl60OMmKuepo=;
        fh=K4aOzPlqf+mF7D+BcbH9wIkLCrwdBKiQxJqXTgBbFs4=;
        b=UCsGCYixCuMK3A/EjWylsrVtqHrZWBh7bIGwLIo5c+23ryLhOGwFzR+rQQGy0YcX0s
         kiKlCySrsDUMxCc3Rzd00frktEdshStxANSp4ewiUD27Y4AMSLRk34by8RV9nYkX6nPz
         5ogqFy6FYPN4HUF8LC++InjzPRORxKDIhSfgfsshXFMoVjPuCGXHQdm82uzbnJq178ka
         rmDqlcu6gRfbahZEnwWIyPzEYVKwEqIRcvvR3BlJPrgcSxttKEBMarAaXXpfShFaZc7o
         CZuPjTUqIzPPicE5OtaKNVHHxcabJbNsjLhYBYZQYVxwUTCiETgtfjnUMqcCNkt0w0az
         XJcQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784283536; x=1784888336; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WztEFrcoKw5uOPN5G0iiXMrCuae4JGCJl60OMmKuepo=;
        b=B8oSz4Y0Kx8KjW6do4qPVZGKbxyvcics715FuJHmv0dP+0bRibGzTg+nzRu2/EYmME
         GUNfFXwx5ITN4vlpuJWC5bMTpsX4coWiOMiFPGKGqw3p0oCFO6jzLG4p/5uZ+2arep09
         MptXsHIWfVnQQugBHOfFe1EJCf9zYJJ3xbimA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784283536; x=1784888336;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WztEFrcoKw5uOPN5G0iiXMrCuae4JGCJl60OMmKuepo=;
        b=laUiyAoQdI7IIDV4q9ifsamjkWXJUCKB80s6hGma2R9Xc77kOOn8eG5ezTgRzJApde
         tPp3oRisOs6+g1iVjKjsfWltm4Ag1gNwjE4FDM4LA7FxGJ3KeXwbZEwvgf41qZVQj+wg
         LX0HLM77gAg6aYPnKoR3/CyY23ajCfQn52A550E22cXbEZUuNdtvNl/w6M93EZfj69r2
         DY6y3ys+Ky1ykv5JESa+KhwBIwPoBw1oCw5fzHF52ER3iwKFX0vazGVqm5OI0Urb0Lm7
         69VaugfuLIp4RxEN+jYy6ZIScjzZ0VJGIqUYKknfP/2YsTBWeTZ+mBK6s2XpPb3pCntn
         MbUg==
X-Forwarded-Encrypted: i=1; AHgh+Rq84kjx+vz193rGRBG2ZeZ8CNa+KYuNhzD5k+0gdeIJ3VMHInW0Ti+e8vUEbyD6m6L3glHEjn7W9PD4@lists.linux.dev
X-Gm-Message-State: AOJu0YwrNpwmzHrNopnnSXwxou2yEXm3dILjcRuOPQsnrvqlLm9/eOhy
	sGg6wfUpnxFlsIHrmrTG9CrmZ+Uh9b0PfhvWxf6jePgJs2QO1zQYxoBHFnHIUV//g13F8rcFbyo
	h7gt/nLk99SMukLP4r4pdbClCgC7P468dnQbtrRyOJQ==
X-Gm-Gg: AfdE7cm6+LmYwNi2U7SVB+65mm9pF9C1C/lDgLUJaDysJ02TcSPdKgHutYIK32MBycA
	tdRUFsBd+IwOezYI0l5IeqIsBJBz6d9C0HPaei+U/5IDfr/yP9r7ikWFB+CL95lmr1fn5jy20zO
	U+XgC8RFbFiOZhEjqQHx4/iKmnH7z18ikOxEXPRanZ6n/jbCyAUBmtSDJnYpaHM9TIA5OVWjGZM
	VjmZ5PMFrLmxrgUUWEgln1dtGbJEvjy5UmZOgnhCdHJJol313Wovc5DiKSuK79t6mMVnRNdmcJQ
	wl4SC7Uaz/gdrlQ=
X-Received: by 2002:ac8:5f87:0:b0:51c:1291:e68c with SMTP id
 d75a77b69052e-5213b148393mr13489631cf.30.1784283536529; Fri, 17 Jul 2026
 03:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
In-Reply-To: <20260716175908.2339738-1-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 17 Jul 2026 12:18:44 +0200
X-Gm-Features: AUfX_mzZUMDQIVrZltxVOLdimtZuvH_f_4eA8OGO9Jlb3Ind8Nk1Z9BWW86GwJw
Message-ID: <CAJfpegv-Yiokb3YNkCNXf8f7YTSxsEVSD8YmrAt=y+1mg2oJ2Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] fuse: add io-uring buffer pools and zero-copy
To: Joanne Koong <joannelkoong@gmail.com>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk, 
	bernd@bsbernd.com, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2026 at 19:59, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> This series adds fuse io-uring buffer pools and zero-copy.
>
> Prior to this series, ents and buffers are tightly coupled where each entry
> has its own dedicated payload buffer, requiring N buffers for N entries where
> each buffer must be large enough to accomodate the maximum payload size. This
> is suboptimal as most request types require vastly less bytes than the maximum
> payload size and some requests do not require payload buffers at all.
>
> This series allows servers to pass in a buffer pool (a contiguous chunk of
> memory) that the kernel will use as it wishes for servicing ents/requests.
> This decoupling reduces the memory usage requirements needed to use
> fuse-io-uring and lets the kernel do any optimizations for assigning payload
> memory to requests.
>
> This series additionally adds zero copy to fuse io-uring. The server can
> directly access client pages or page cache folios without copying data through
> an intermediary buffer. This requires CAP_SYS_ADMIN privileges and using
> buffer pools. The zero copy patch has a dependency on io-uring registered
> bvec changes in [1].
>
> This series is on top of commit 7d87a5a284bb and on top of the io-uring bvec
> changes and the changes from the series in [2] applied.
>
> The throughput improvements from registered buffers and zero-copy depends on
> how much of the server's per-request latency is spent on data copying vs
> backing I/O. When backing I/O dominates, the saved memcpy is a negligible
> fraction of overall latency. Please also note that for the server to
> read/write into the zero-copied pages, the read/write must go through io-uring
> as an IORING_OP_READ_FIXED / IORING_OP_WRITE_FIXED operation.
>
> The throughput improvement from zero-copy depends on how much of the
> per-request latency is spent on data copying vs backing I/O. The gain
> comes from eliminating the payload-buffer memcpy,  but accessing the
> zero-copied pages requires the server to issue the read/write as an
> IORING_OP_READ/WRITE_FIXED operation. The benefit is largest when the
> mempcy is a meaningful fraction of per-request latency while backing i/o
> is still noticable enough that the extra io-uring op's overhead doesn't
> dominate.
>
> Benchmarked with passthrough_hp (--nopassthrough, q_depth=8) on a
> 2-socket Intel Xeon Gold 6138 (40 cores / 80 threads), using fio (sync
> engine, bs=1M, O_DIRECT, numjobs=2, 30s run + 10s ramp, 3 runs) where
> direct-I/O throughput is against a RAM-backed (tmpfs) source (backing
> I/O is not the bottleneck):
>
>                 baseline   registered-buf   zero-copy   (zc vs base)
> direct read     ~5.1 GB/s  ~5.4 GB/s        ~8.9 GB/s   (+75%)
> direct write    ~3.4 GB/s  ~4.8 GB/s        ~5.1 GB/s   (+50%)

The interface changes make sense and the benchmark results look impressive.

I think if the synchronization between INIT is sorted out then this is
good to go.  Sashiko can't apply the series, I guess because of the
non-standard base.   Not sure if we can help that.

Also because Bernd and you are co-maintainers of fuse-uring, I'd hope
for an ack from Bernd (when he returns from vacation).

Thanks,
Miklos
