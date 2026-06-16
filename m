Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8306F3D4128
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 05:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781588322; cv=pass; b=Maz9i0FhtA9mZhxH+wWeoZ3+Bi6Jf4kuzuJijjgroKtY5oJkhfXOglPtE6iNVP8gqSNniemyj9xOyJ3fmKG3lcO9a41bfDQij4/ivzIRQFvosPUvgj3UZlSj6EyRM3UVJkYH44evZ+Hfji4hAP2QmRYQgpt/0l0lCYzV2x+ZDlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781588322; c=relaxed/simple;
	bh=7cSO6tNTnTJlByfzQ9/66UTtzIm17xzus+sNVQMymzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOxxLVJYZSVNWL+HFs2OgstC7ebwRhYF074tTeASf/ZZ+vxoF1I2T5QKOYsy2/PmXHTr3Tm7A0hKFydoDqCYL/Bb/z++kVUG1VozhDeaTG5pzvETfeRwrVVlTh7VeSvlgP5WJOK57/f4YbVkfxdXxI/YE2crgWIcLH4mhEKu1Z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkbrTG3H; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkbrTG3H"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4908b92904fso50439945e9.0
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 22:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781588309; cv=none;
        d=google.com; s=arc-20240605;
        b=IBV002E49xWPpdIJfLGXwjVxko2LuhnebCT8FQ/NCAx7z0v46hrnpd2Lp46AYnjnuo
         HZULj533tPZH0XhvNry0hFlHSFN8HYLoMC5orCGQvydP1Yi4KuOKw704EMAEQXMmBb95
         IbY0I3nHCNeh1zM9SuO9W/I4tL260y+P7C5jBXkrERaH2Kr3RXQwKLxNu7VwZCuSs8NE
         rpP2Kjq2HbAPeuUldbsXbbjPaNnfr7X99K7GZy9LfwSUzsXxA8FPNDcKxINJYns+deWN
         mT6wr2ezkPdb6T3Xh/2HH3Bx1Rtwntrf9HQIxFypJp6SsBLC8GrN6VlyjHQjXJHo+UDD
         RM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j+ikhYLvm8zuE9M8Cfj9HiI9l3CRHlGHq/53b7s4Bkk=;
        fh=8bUFTemOwDoWiOdOkdFFPfADoT45yqq3f7053C+zN1s=;
        b=XugGi1wtThrHgMo5rHafdmRJ1lVnL/txh4mXwf+LAlA6HYZUznhkIas2tMer5Ph+Qc
         aQe1VmQU7+NnEZHCSpfo3cnHKknYA/uddDAJYnnAOge+bzQsA4mE99jjT7f+OiNlBNqc
         BKGWIc8eMxec5nNfGGnyFt5SRlh/6S3UHIEqHBX06zlA4Jclat+zhDhZvE5oES65U7FM
         zNFmVysHzxnTriNwU5ZzE29ZkIKnXgfEzPx/oNx36aMg+q20eVfawqOOuN/fnc8PriS6
         mRCMOGkBXhmRCvwMnYRHokmrADCIqWF/LPa6sqey5pp0ciG1BTcjgec5JtpdxCGx7ZgY
         EU1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781588309; x=1782193109; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+ikhYLvm8zuE9M8Cfj9HiI9l3CRHlGHq/53b7s4Bkk=;
        b=mkbrTG3H887VXmv+VTXMDo91t/S9f3ak72lrcaZa75IWBSprNz9n5GduUwZmmENBNW
         aRDaGC9FiIza/DVugHmI5x9IctaUr/jhYtSX3lN+jcaeGP7PJHBBykOo/KHl5JKrK+A1
         tcmJGuIYuiW9wGq1SMiiCf/Ode+AaEoOz/p/x4+tyD4z5HHKw995sq3PMmEtJjMus6id
         CKVlXGR3XiK5KbNtgYIsNJn/I68HNlJ47iILMsqhAflDqor6VRb2m96NQPrI2LMREFiA
         p3mMFRObJ5TpSrF6vKe8aI/GcG31D3Dch+Tca/lQe/UaQhSfFYQHaXXVxi+QLF+iEM09
         ONLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781588309; x=1782193109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j+ikhYLvm8zuE9M8Cfj9HiI9l3CRHlGHq/53b7s4Bkk=;
        b=M6VwdiITeVRWi74m+smh1U4FmBEsh9923SDe5CZKBEb8PGjYK1xNe0v8pgi6zjKZuM
         vtSEKELIWexTS7e8alkB0Z0AKEIbh0Mc1K80y3acYWfYgLk0/ScCnybsC684E/akDMnC
         RvakeouER2uqzbcub80xv7d5f46TR/Rj1DQI30nEcpkiacGErEzAoWwOmeCTmONijrmM
         mhM0bXUSLJq2sIduescQX0cvmQ/MI4qmcQvIg2kfnSO0GOWJR+nhYTC8Er/ud1xztGMU
         KMQ5WQtbQw3pnptryuWoO1zEn7ITTnJLmnY2zB2iZ6aPv3TI89WrEBEzGCBjBv0neIWH
         ckoQ==
X-Gm-Message-State: AOJu0YxRH6x8jD/So21b36eQ1swWm6s6EX0m3L/znOzQZYkI/K4e5sqU
	bH7VfjvfUbY//ASDf6oso6Rf9MJadKJesbjeoPBH/RApkvsKukAEG9ZG5xqr4/cYUYK2qAHzhK7
	fps60HIzdSyGBgX8CGnOG2YxGtke86dA=
X-Gm-Gg: Acq92OG25nXjAnq16JyF0iB7x5TnFWKwayBKTX/vHZt4rS/MasHGlKavHpVkafBpOZR
	G8PYS7Vk08cA90IO5DNWEHqXl+XFh5uu3GntUfg62PHrmZF61DvXaI3ovjWw2pDkPTBXibF6+eL
	eGXDKQRHNQx//PSfnfwV4aw3ZSPBNdwBToYAG6plnk7iNcibBNnuLpDiHINx6eelVG3hgUKm2mc
	eNxkVGMOQBNWk4f6dnrMPAVIuBKQjr01uON180t75cYtcK6ZKZdi8UyQ8GZeKMnOdcUc7TqXIaK
	6cNgg+zBXfJu4cIAWmDnxiC1tNdQnsMT9Y8Dku9ZhIS8B7vtdGpx5wRTsC9bj+xqoPY=
X-Received: by 2002:a05:600c:314a:b0:490:33b3:4be0 with SMTP id
 5b1f17b1804b1-490ec504d2bmr210522905e9.20.1781588308464; Mon, 15 Jun 2026
 22:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com> <CAJfpegt8sfO681aoixfCc2XvUP-OH50GVHG-vmF8Q3oGqxF9MA@mail.gmail.com>
In-Reply-To: <CAJfpegt8sfO681aoixfCc2XvUP-OH50GVHG-vmF8Q3oGqxF9MA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 16 Jun 2026 01:38:16 -0400
X-Gm-Features: AVVi8CcUfkx7gizch2_iouubuW6Q05ysukIlA4q3aqVXbtmXbp31UubcOPyC2yc
Message-ID: <CAJnrk1b=Mxy0N+QKjFZwb92arUVDRzz9PJVXvsZSmPq65bsbAQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 5:33=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> wrote=
:
>
> > Buffer ring request flow
> > ------------------------
> > |  Kernel                                  |  FUSE daemon
> > |                                          |
> > |  [client request arrives]                |
> > |  >fuse_uring_send()                      |
> > |    [select payload buf from pool]        |
> > |    >fuse_uring_select_buffer()           |
> > |    [copy headers to ent]                 |
> > |    >copy_header_to_ring()                |
> > |    [copy payload to selected buf]        |
> > |    >fuse_uring_copy_to_ring()            |
> > |    [set buf_id in ent_in_out header]     |
> > |    >io_uring_cmd_done()                  |
> > |                                          |  [CQE received]
> > |                                          |  [read headers]
> > |                                          |  [read payload from buf_id=
]
>
> How does buf_id map to a buffer address?

The server knows the starting address of the bufpool (since it
allocated it) and it knows the size of each buffer in the pool. It can
compute from the buf_id the address corresponding to the buffer.

>
> Wouldn't it be simpler to provide the buffer address directly?

This would have to be returned as part of the struct
fuse_uring_ent_in_out. There's currently 12 bytes that are free to
use. Returning buf_id takes up 2 bytes and I think is better than
using 8 bytes to provide the buffer address. However, returning the
buf id makes adding incremental buffer consumption in the future a bit
trickier (eg the server would need to keep track of the offset into
the previously used buffer and do any alignment rounding up). Maybe a
good compromise is returning a uint32_t offset that corresponds to the
offset in the bufpool? The buf size is a uint32_t, so I think this
would work just as well as providing the buffer address directly.

>
> We also need some uAPI documentation (generally not just for this
> patchset).  What about a new directory:
> Documentation/filesystems/fuse/uapi?

That sounds good. I'll write some uAPI documentation for this and add
it to that new directory.

Thanks,
Joanne
