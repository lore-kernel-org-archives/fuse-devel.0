Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A533F86E0
	for <fuse-devel@lists.linux.dev>; Mon,  6 Jul 2026 21:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783372226; cv=pass; b=rqZmEmrPRhRX0nqhnSJ6QbsE40ua2bw7UOa+lU3P134BtvmrrevbHqjrjqjud+gWGHDFKi+erS3R+zNwggpyuVE1rOZJBNbsqrdRlPtnuxss95xX7FMrO0PxF1ybtTsh/vPtC2tc5fb/JdHqkP1yT1+2/eFwcrQVMC/LCyZn09o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783372226; c=relaxed/simple;
	bh=G1PsgoNk8ZRW3MpWx+p3EgHcNI5RrHxdJM7/y1Oj4XM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lgg2SrihWkUl6QJGIonf8DiG43/XLdm4klTQoquUWY0wbLK+Xz9sJ49om+FCep6M9Eu4UE2Yx52L77XasddgSLx1regvqb3K0yqemaHm+Fxb2yu+iTSrOV4+UQpD/96POy8yLQ8uPHyHraxB2vD1r8AN5wdvpHA8SAyfjdqFdUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGOx1HRk; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGOx1HRk"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-476a130c138so3619467f8f.0
        for <fuse-devel@lists.linux.dev>; Mon, 06 Jul 2026 14:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783372222; cv=none;
        d=google.com; s=arc-20260327;
        b=jV+69FOYW5/yub3dDvWJwyPwyS5F/jYGLzUyks12tMmOamuW9rzbwUDbAYEOxJvrrr
         s8OwWTer3G6znGxWStHXwnRK34kFqH/9TXxkiM/Ab1qbWdkIWj0ESrjANWkmoI7uF8Yk
         qunqVB/bKcrbJalDN4LiWrVFrOwRxx9M6HRshSUaVTh7jVn97FExrMWmaXKrAdlnWlSw
         TRR7opHqMVFwWrHAdbUjT9ydVSGnhmwL2+1clRljScOQNtNRi9OFExlq66jBktSXBb1/
         T1xkMDRKwVqjBn+yNJuDvldznOZUZkRQY6v3F6MwRNCediLMV6dTfVuGAtRcGTZujp7I
         yxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nTPTVUtdS4k47QUOBTcq39fwXmGTETu3cEn0VEiXrKk=;
        fh=aidGa3rI6AfBdqJ0rPMX4OG/DNebCvOpA2aH+htq6dw=;
        b=RyzUiYn2tzoFo4bcInJFRXu4+PZJeGhxIIG5Tcsjdx1Z7gyXceAk5d4ixE2f8XX4QT
         swIfKsjAQe4eqeRrkZWUABIV6Lve+NlHq6FcCB+LWBQ3EF13jgV+bn/hmvpEdHnxyqFr
         2aV7OrAu1r3kw7op0FkE1kCuE0yOPzA1lkjzj1PJydThhoX0u2yUHnYLxUfhfx+oNqWD
         ZhU0AsmW3d4s80Cxag1ASUtywLDGtXr+CqfURANROWsNsAX/GeG5yaq4ioPGb70Lmikg
         O5h1qo3aLDK3+C0UyqU5tTosCxFodPVtlAbuzQnSBj+DrxM10pRvJTY17I1G/e9dUT4F
         drFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783372222; x=1783977022; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nTPTVUtdS4k47QUOBTcq39fwXmGTETu3cEn0VEiXrKk=;
        b=PGOx1HRkAdsOmbUhMAkGHvFZ/AqzEgXNPx/uPeAKTaK9DVM+Je+gzN5RC1Y4XKovlr
         FT/FtsKHkGy71F2npf77Udy73pLKiU0J4twMMWrtZH0NnI94+WWIR7si8oxmGftkhI5N
         u5lS5CpfFKyqhQ/JcdsBaUGk9ZKAh0iabgUbU2bxqi7URc0u9dTln+W6C4vJ8LVnyobh
         1kXefggp0Of9iIz3BjpWAR4Ro5tM5uz7iLLE3IorpXkVNbJ7mxpiJOV4I/s7Viq+6sOG
         pwO9nTFn5EB5/6R9DBJ+Ap2VtWMzqnDbxZW12Slxyjha5AGy9r6ohA+3iEIxnJKoV2PV
         7ssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783372222; x=1783977022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nTPTVUtdS4k47QUOBTcq39fwXmGTETu3cEn0VEiXrKk=;
        b=OwoA+PUavMSwZaJVo6re2smrMez36Flrv6Zm+nKkpsQIySU+8O4Xw1vIhgY5SF4NMj
         DFi0AqznomfWPaWHF05mrQdQUriXVctS8+qsX+f7woBW3Ov9BGbbjAClLPAvXKo6gpto
         K418mJP//UzcZ4HmABP35+ljkhFYDOAW4cLbId3GpSNOmuWTQv/Wvtp6BhQtaOc2u53S
         SeofOF5zbv4iq7xIMAU9VxmbWVzOVjr11nJWx2E/HUOte/onUKlxxWCnpmf4ZivdOcA+
         1PK4BbhKtMc1jf9h0f40dIgp/Pm/SbnWYh0lrycchiTQUZgu+XdBxAMRSC1+sJjRvWxW
         ITPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9sS5UwwURyuPqInvrcWyiUvVZlV/Yf5Z7KlEIKVrZgCWrsOfQYwjXrHkdjL4RRRu24FghpKxh5mKG@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7aN1rZ9pm6V0hX0T1TTuJE5u+ltxs/PDUXVwxH6l4akAsNRBQ
	15YOLMRmZjvKeucDuyNuhctR0rcblh6pckHSoN7R6bng5AIcOW+HyRuV4quCIBppQ1NU8V9+EIR
	G6N6FJPk45BxYzZTocOfhrRNFj2fWpmQ=
X-Gm-Gg: AfdE7clkq9p7P1gwzApNOlToH23Fd3Fb9Y+Fn7RrECOo3JyXaBeCVu6rXJOydTfXWwd
	wyA01OjIRUcOkZhwcWYd1xUH0UGz460KtLzut7s6PSYIt1/McOS4G6dk/vFR+EoZNm8fI8/oqoV
	2IdSm5x+NdN3dzREbBEiNJL3U1GlazAJwt5E8tGMCcqXTKgXWBuws0VgsUvvpUXDWCV/+8TvRLI
	qtjpoxlcmOeGO/BWVdxqyF+ENH+AU7ag19QjG0f5K4VPC2gXsRQfA4AHJxkfU6uH2Tk07kPjk4A
	H7aj5lvO8JQgGORoLQNc2F9TGF4jq+Q+2/d05ZI76V4MER3nGxu4dwQeC/qHjcM=
X-Received: by 2002:a5d:6608:0:b0:472:55a:ef90 with SMTP id
 ffacd0b85a97d-47de6697c81mr1703222f8f.8.1783372221848; Mon, 06 Jul 2026
 14:10:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703092815.4602-1-swethav0411@gmail.com>
In-Reply-To: <20260703092815.4602-1-swethav0411@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 6 Jul 2026 14:10:09 -0700
X-Gm-Features: AVVi8Cd-dyt7Ii0P9xpbxtCjFtS5iCPO5yJeLQKlWwBTmbKjagmt7tI5wcFyw0M
Message-ID: <CAJnrk1bxAfK0QJQtQ213T0ZKhXu4Pi=2wfRfZ5u0_frC8bucDw@mail.gmail.com>
Subject: Re: [PATCH] fuse: add folio_max_order and folio_min_order controls in fusectl
To: Vadlakonda Swetha <swethav0411@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 2:31=E2=80=AFAM Vadlakonda Swetha <swethav0411@gmail=
.com> wrote:
>
> Expose `folio_max_order` and `folio_min_order` entries under the FUSE
> control filesystem (`/sys/fs/fuse/connections/<connection_id>/`).
>
> Motivation:
> For fuse based systems like GCSFuse (Google Cloud Storage Fuse), large
> folios gives a significant boost to the read performance.
> - Without large folios, single file read perf is capped at 3GiB/s
> - With large folios, we are able to achieve 12GiB/s, 1MB blocksize
> - Writes:2GiB/s with large folios vs 1.6GiB/s without folios for 1MB bs
>
> We understand that subfolio dirty page tracking is not available for
> writeback cache with large folios. However this is not a blocker for

The buffered write and writeback paths in fuse go through iomap which
tracks subfolio dirty state.

> GCSFuse and similar cloud/network-based filesystems for the following
> reasons:
>
> 1. We generally recommend applications to use larger io sizes (>1MB)
>    for writes because of the latency involved with the network calls.
> 2. Random writes & small overwrites are also not recommended for cloud
>    based filesystems.
> 3. Beneficial when write back cache is explicitly disabled. Incase of
>    GCSFuse, write back cache is disabled for different other reasons.
>
> Providing these controls allow individual filesystems to explicitly opt
> into large folios once they evaluate their specific workload patterns.

Could you explain the use case of this granularity? The page cache
already adjusts folio size adaptively (eg small/random i/o still has
small orders, high-order allocations fall back gracefully to
lower-order allocations under memory pressure, etc) so it's a bit
unclear to me why a tunable would be needed. It also won't enforce the
order for any inodes that are already in the cache.

There's a patch to enable large folios by default [1] and the
benchmark numbers showed improvements all around, so I don't think
this would be something individual filesystems would have to
explicitly opt into. Does the change in [1] suffice for your use case?

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/20260624012132.1719941-1-joannelkoon=
g@gmail.com/
