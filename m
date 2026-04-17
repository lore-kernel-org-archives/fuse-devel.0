Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFBA2857EE
	for <fuse-devel@lists.linux.dev>; Fri, 17 Apr 2026 21:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776459757; cv=pass; b=LWa4vqxkWWFfBbnwr5qQxkToLLaDCHtdvZsb1lWHqGZa/2NWUQM/zOdxeamRz5pAmnaSiszeQnHcPBHc8yhQLEzqHMli7VYHlsyeiRIuWQcEiEGRndOdUzfFzXWUP23BWYGZgoO0/Y3mX9LW52Wq4YBnPS/rrCX3IPO2e4Fzen4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776459757; c=relaxed/simple;
	bh=ldLskh1xFyY9LjS3JUCJCZqJWyAYipdzRp7+NJODLRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umwjWONUJoWYKcpeD4yXt7aB8oMw6fKLEoWMM45dhfwEVcDmeMk0+AGFY2ZO2guS/SF8NGERSe1jEvBXOXjy2KXRqeMe3waJxaRjWSriLjhi50yS1+OFPCwySjdEKc50GzJEzecOWXaT9vAC35l//RXJUZqAZJKqZUwJm3xcWyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=joMjrAK0; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joMjrAK0"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d7a5e77b1so775706f8f.1
        for <fuse-devel@lists.linux.dev>; Fri, 17 Apr 2026 14:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776459754; cv=none;
        d=google.com; s=arc-20240605;
        b=Y2HDF6AdreTvTA41e2OTFMpmjZg+uL67G0KMhRsrRnmMmSPTvenGigMKtkHtwp6spV
         UuKGGb+vKZqfnOpBP0vKe+9MrGCPYKaujoEnB/nwoaeKYDOBOD06IKaTa+jkYgWJ3Rym
         hVsLKo64WV6i26hsA0cmPVEKvgawPcg5LH9oAVJnHrkxofoMNO/s6r5vseTbeTaBmKAt
         FWUfLjMLO9/pZsy1hClQACmWQvmyuQf+P+Ch/+bwgyLNgcXQVjza/Cfv93kwQ6nwTTyF
         YFke57TovNEtKeU4wokyFT4M6lF+npcdCMWCVZbWBiBHoRyiw3oJDzmQn344e8Eb6dOY
         Z72A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=STzWu05WxWgbbMhX2ONEineRl8NEoNmuhfJo1fCqMWY=;
        fh=CVr347ZNl1fSzSnnXZOSelUJZXpHfF64Xp3Se7C6lmc=;
        b=dIdP/rqxWWkgFUOEiWh0B20mR4XDWefPGgtFNXQ9DLZvporYtkd7t6AwzSa7av8lqI
         TIS9yKb4OwTrPGpRkPG4Imis8/I6V0vce1b1aSjiU8eIa4DYRyyb2Jcrg7agLdP7dLzF
         15zuxNZHBuuy8XBBeIXB6VU8ATrdOZnopYF9pD5Ig1uFGW2CBrUWQe2HwmAspBCbXA1E
         1Wz7caNre5mIK2qwdGSs5E6s6e2eAcC0frxMNkb5o6TMSTbEqw8FQ5iX2hYTg7S1klzT
         gh8AxosIIbk7l+PWCOdTdkX1OAMvCX5xqLyQyAlYa04lFI1bwr5JvUvRsGZTVOhUyKBU
         S2Sg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776459754; x=1777064554; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STzWu05WxWgbbMhX2ONEineRl8NEoNmuhfJo1fCqMWY=;
        b=joMjrAK0yEJAgnq05BBL4x2hmOKyfag7mclbIoh/e61kFQFLkz/cYXVR+UQJ/cbSP9
         DXPjgZbe4pD8ng4ECMWi5yyKQ6piGXR2gniQiUHTYXLJ/lSJ73hpNaWnOKLLFoogKIVx
         gy2K51oyxV0q97zHFDW6iDwfxjC5ziqHMzQ6ktZeatlTu7tu02NQK/nhgG7oeCVlOCP5
         16ZIz1z60So17nkkhFxqR2DphgOxukpGPOm1ajpwd1DTWci+CNmmm8bbm5hxCWGqfhF7
         pEU1gjoxHCeyPQtDmUDGwNEdE/4LjfYH7ukkU5lzdJr2345Gmg92v9gzlnTxUxsPUT6K
         p0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776459754; x=1777064554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=STzWu05WxWgbbMhX2ONEineRl8NEoNmuhfJo1fCqMWY=;
        b=jlsaWnf4eRLvld0v7JdFN2uNqQyl/pB+hyyhth5P0oQreFTd/OtJqZc23m4qdgOVAA
         KZmTorSDsnM+lY4xx6NrAnoixh07jyvFYt9RONHX9vHCMZCla3XG/C6wzHturqD4IBnV
         AuwhU/UT7fw3PRj3YBBfQ+MyGpl/+3oVux5J4twAjsIMGtsqzAvUyWdGkHljjK2zVmdi
         D8fL7iL+CX+gs79B5N3U5XGoTPGF/rjRjpoGmkiZpfkqrT8AidRqjAHrl6SQ+e1jVxSl
         4VxrZG2dV+KrpAFBVvqnh6t56CI3K4OKlPUJZAuje4kcBP6ep7ru+1vgeAuS9m1TN/5a
         m5yw==
X-Forwarded-Encrypted: i=1; AFNElJ8K+lE8APbtq5kQei51/yYgvDQewG+MXeKqe1YaxOfz7/qyC1D9uKDToccJtwb+EEH/gYDF/6Ep6MM/@lists.linux.dev
X-Gm-Message-State: AOJu0YzcMV86j7wi+G/FFcRZUk+6363KheGZQsufm2IKEO0PGjTuBv/1
	qIo1HSaBJeLjQVpuWpvkq7yo9Ox+L9UskPB91hvgXIRwc93fTKZoIbMHCRB/Xkl85WbYP8fCUk6
	qThsNMVv/tvOgNGarZmedgjqJE5AumnI=
X-Gm-Gg: AeBDietMArGH/fHnxYdem/lXx87Rn6QubAp+Z/+ouEQbA5U3trnRuzk4BHq0JeNyVmd
	a1FRGbeUfF0FLwHiTdPrbgcQKWycIckfnIPOhHomjhlnN2wUuADAYnxJgp/IQZolvQGF1aR+R4f
	0r8QTQ5ri6VUL9WoARBwPHGFbzvSjrj68V5cKlO4a7Nw5lTI1e81oqlQ8KPimCahmK9YMNS7ILB
	laJPm4auKqhp79Tf+UtUA/PGf5vfFZVU6HV93dQ0z/hxzYUJJO5d5wZTb5dcYmhwtH1VXupcjEn
	RS0yK33kzwZNbbHN
X-Received: by 2002:a5d:6f13:0:b0:43e:a703:3675 with SMTP id
 ffacd0b85a97d-43fe40329ecmr6082677f8f.5.1776459753917; Fri, 17 Apr 2026
 14:02:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <18936160-308a-4817-a295-54eef43707a3@niova.io>
 <CAFj5m9LeM4S82QEsRQ0uQiXj1eWCFAW3v2fLTxUj1YM7UO-V9g@mail.gmail.com> <fcad39e2-37b5-46a9-a280-2315e0397985@niova.io>
In-Reply-To: <fcad39e2-37b5-46a9-a280-2315e0397985@niova.io>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 17 Apr 2026 14:02:22 -0700
X-Gm-Features: AQROBzDJomy37fRGlsjcaUyKE3fC4JNz7SjvTUIC4c85XEUUQ5LxX27GEuS9umY
Message-ID: <CAJnrk1Yw3=z7W_my4pLG6avBeDZkUp3j1LZk-RVpGv2vAsw-ZA@mail.gmail.com>
Subject: Re: fuse/io-uring: Proposal to support pBuf in additon to kBuf
To: Bernd Schubert <bernd@niova.io>
Cc: Ming Lei <ming.lei@redhat.com>, fuse-devel@lists.linux.dev, 
	io-uring <io-uring@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	"Lei, Ming" <tom.leiming@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 7:46=E2=80=AFAM Bernd Schubert <bernd@niova.io> wro=
te:
>
> Hi Ming,
>
> On 4/16/26 15:49, Ming Lei wrote:
> > Hi Bernd,
> >
> > On Tue, Apr 14, 2026 at 5:33=E2=80=AFAM Bernd Schubert <bernd@niova.io>=
 wrote:
> >>
> >> And my current primary goal is to let ublk to support multiple buffer
> >> sizes - ublk would also need to get support for kBuf/pBuf and I'm
> >
> > Ublk server is just one liburing application, and it supports all gener=
ic
> > io_uring buffer types, so kbuf/pbuf should be fine for your ublk server
> > in theory.
> >
> > It really depends on how your ublk server is implemented.
> >
> > Maybe you can share your motivation first before discussing kbuf/pbuf s=
upport.
> > If it is for DMA,  there are other candidates too, such as hugepage,
> > recent added
> > UBLK_U_CMD_REG_BUF, ...
> Joanne had actually removed kBuf and switched to pBuf alone and that
> simiplifies things a bit.

Hi Bernd,

>
> Motivation is to reduce memory usage. Let's say you need 4 IOs of 1MB to
> saturate streaming bandwidth, but still want to get smaller IOs through,
> for these smaller IOs you don't want to assign the 1MB buffer for each
> queue entry / tag.

Have you considered having separate rings take separate payload sizes
instead of having each ring support multiple different payload sizes?
I think this gives a few non-trivial benefits over per-ring
multi-buffer-size support:

* less head-of-line blocking - with a single ring, the large io
requests can block smaller metadata requests until the io completes,
since fuse processes cqes sequentially from a single ring. Separate
rings would allow smaller requests to proceed independently of io
* makes kernel-side request dispatching more efficient + simpler  - if
for example there's 10 different rings and each of them supports 4
categories of buffer sizes, imo it gets non-trivially complicated to
find an available ring that supports the payload size that needs to be
sent, if there's lots of parallel requests going on. In the worst
case, we would have to check each of the 10 rings' various categories
of buffer sizes to see if there's a slot that's big enough.
* simpler kernel-side buffer management - keeping track of the payload
buffers in the ring becomes a lot simpler, since there's just one
buffer size the ring supports
* more dynamic / deterministic scalability - I think you mentioned on
another thread you were interested in dynamically adding ents to
rings. Having separate rings for separate payload sizes would make
independently scaling queues based on workload characteristics a lot
easier. for example if there were 10 rings that each support 4
different buffer sizes, one question I would have is which ring would
the extra entry be added to? It kind of seems like at request dispatch
time, it would have to do that non-trivial ent searching logic across
all rings mentioned earlier to find that extra ent?

These are just my 2 cents, but it kind of seems t o me that having
separate rings take separate payload sizes could be more scalable for
your use case?

Thanks,
Joanne

> Zero copy is currently still out of question for us, although I will
> look into your recent work for integration of eBPF and if erasure
> coding, compression and checksums could be done with that (I guess
> checksums is the easy part).
>
> Ublk already has UBLK_F_NEED_GET_DATA, but that has two issues
> - needs another round trip (testing on my laptop shows a perf loss of 10
> to 15% per queue)
> - It does not release the application buffer on read. I have an idea how
> to fix that, but here at Niova we would like to go the dynamic memory
> appraoch with pBufs to avoid additional round trip overhead.
>
> Idea with pBufs: Several pBufs registered per queue at registration
> time. Every pBuf represents a different IO size. Optionally as with
> Joannes patches [1] the buffers can get pinned to avoid mapping to pages
> for every access.
> I'm currently working on a patch series with some luck will sent an RFC
> tomorrow. The harder part compared to fuse is that ublk_drv does not
> have its own queues/lists so far. This is my first work on block layer -
> I'm not sure if internal struct request queuing is allowed at all.
> Testing will show in a bit :)
>
>
> Thanks,
> Bernd
>
>
> [1]
> https://lore.kernel.org/linux-fsdevel/20260402162840.2989717-1-joannelkoo=
ng@gmail.com/T/#mb8f96895aa2773424005ee06bb62ae980e95e604
>
>
