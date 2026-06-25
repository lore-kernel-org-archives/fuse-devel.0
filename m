Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8117A3546E3
	for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 00:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782347738; cv=pass; b=NnYO9Wdvsf3kVOjkrC9pxqgnB2ydKoxK/9ujJa1L5L1p8CSFr3htBodVxwFUMPB36lxxUJO22SBg1ZVN4XAAeNK0vNMY0ZzdoeDlk7NKA3yeMkgzyAWXCW2g/GPYoA941oda+a1zzM12tl/1QoesZo4+mezJQv1HarMzvziJSsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782347738; c=relaxed/simple;
	bh=jlY++uhbL9kzvh0wxgu1VtgxWqC79S8nsAlwo8Ixel4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNKG6GqmTkY3k3V2wTrMYHmtyCRRI5dB5xtbe+hfhPdUcUj2yghHumlSonNGnd/g/9BPdj/SdbE1krv4tZJ9VDIcBs7nRPBpz0AL4q08akrAAGzvHo3Z6u3Zf6GqTwv/EmViLjImkrY0nveX7vppDauh6nPLlAgmrnXsSJViESQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qdToM8Xp; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qdToM8Xp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so11758185e9.0
        for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 17:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782347726; cv=none;
        d=google.com; s=arc-20260327;
        b=CX6tNGXJHODpj91Z4xPaoyzKcoustqnESu1NAMwsUjPQQYCfQcrCemPL/21NbQZh7l
         PcS+a+Ph1uKetUD9WIowBI54ikUdowwfNCRn/VLbA9hhSpGVYCBLIdg9Y2AmZYLGXKuV
         qfj363fVVQBMgKzqlKLA5jH7+i2QygoBOAnt7hAofxvI6E7QQVEerUV8Iz/0KraJqfJr
         xcbHVauUWVz0Nd60KL+RDuAHDfhaTT017UsIypAORGnllxFQMaqs4QmWaRt+1iUYXFhF
         gCB6TpUQ9KzYXfZnHWKbzgXD3ANzBltvS4/Mxqs8Af55FpIKiI57mRlvadbAAMWg+Pmf
         vYjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5taJ+dyir9PzsaMGDhZgZm1otofqcGe3f75cf+Epyl8=;
        fh=2sLl85C0Zx5PoSrlPVaasCHts8/cEi4nWWLCqLOtz50=;
        b=aA5a2MtBXH5M1fDK0C9bRKdxiopHQRlYwPAHETf/ATxVZqiNR6iOQ13kmEUnjWbnf0
         0asV4/EtM/twIsjOz6W736wc5EhphpxbeKRtaWKknz323Ix/MtMTNWfjjxQf5RP1mt5u
         PwD73DsMjYSTCTYz6cKHjADNL/T9CO1XbDiBj+EvLA5fii7qKuTrHNZ6eZx5d70oLRjg
         /43+IFPOqcZCoci8jiU5d1i5O4dPvqYES0RASiiSuUEzBNiKMxtNLVn0Wod8gaM+VHdS
         l+i1cT0iR87nbDxxNV+/sNhLeF2urm/bB7sKf+lHmCV7iKwkr2v+AZtc/zUmeysLB76i
         jaWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782347726; x=1782952526; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5taJ+dyir9PzsaMGDhZgZm1otofqcGe3f75cf+Epyl8=;
        b=qdToM8XpESoUgDkqny6cQl7l+xn6LzGMdN0vuSaamNLplxootzitd6O6dLcGsCzoon
         fxy6DPplhfp0VBaB2wiRKc50D5tICR48Ekp3YfZf25Z+ZYzNCQMfH+fLna59lLKEaU1k
         td6tLzt1sIcgFaXNrAYfsdDVYgmXl84Dij1XPQsIx3oHionTnAEjHrJUFPpy5JaIQJ9j
         SNyJKKkxynBn64vUfIIkiSvEqvb+htIva2cmWu3AqoONPbmIAy1N+ZSEZa68ohlrPdUL
         m7g07VH6QfczwofcvCG4fm57JhQH2MEZjvBBctKL1kN1W/I0S6l92d/4njph3A9JeELp
         08Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782347726; x=1782952526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5taJ+dyir9PzsaMGDhZgZm1otofqcGe3f75cf+Epyl8=;
        b=AIJDHx5y8BYY/MScIERyn512SZAU9fSitKpoZ6TO9caNJnQn6amRVk5YymfwWug/bu
         22tu9ElfgBMCr1N5Xs8bg7wAV1+udR5OOlxvOI4ncl66oDn2BDqT8+nAic8rumaFLw/z
         yeGFT0C8jsf61Yw4YijLZlzWr4gTdpzz+XlAceMn6YBPlJV+fq80lb4F1KYF3ljDxdQT
         EOcOOPj1rQkARysC3KxOlxBLP2581psgZd5fMTV9OGAHfNiXxx5cYoSMt+rK/Lh9uO8M
         0dAYUHHH9MIpFS67VKoK4EGZhkfjqfgqoN1NXTUsqSe5HAvKvpEUpcvF1Qy2ogA2E7wU
         0BuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZCq1uh105dU3KIl95TU53dkJ3LO7SoXS2HutbMcpXixxH8WJoYBHe6eX+4hE7nd7hp0HjgUdIKToR@lists.linux.dev
X-Gm-Message-State: AOJu0Yzcg7qNKK1DuS0F3tlQyel4mPnTce/5rGHOZnHBYd0QRYdvIs3m
	CT7Ex9szQTZgV4C00/RI8DLO/aOcgwFzad2gXbxjFsK0HGhzD1sFO4VB4DpsPuab4uhNG9fyy1/
	G9Syz+A3PGs/ZyCAzblWiK438JlA/opc=
X-Gm-Gg: AfdE7ck/MDTB47BxuaFbdtEhJiKhQajmAkayq/GoOfb4BM3QBlNu9yu5fVTBEJGQeFk
	9AYRVdRSOEZ7WM6CH3hJRlqR81VF/XK4a1m3gYVBfd+KEXumrPYxjEFWSAnTs/wrpDzkYEtWw+I
	xEDD7ovfSYDjDeP6SeiJR1Qre7Kxpk+xIBTxx6OMnKKM0za8zhbjh93RY4QKb1hJQmRMFmcluS6
	SqdwChbsyYJhvHkpdgkKFB+s83W+aWjS17hNI3oARDxHbFnxJcRcqzGuskB8VZj3zo2xocmGEz1
	OMqOqlQDbjrJZnaObGZxZ9JEz6eeNqhKOGgBOyI9jDePgNBGTyAn
X-Received: by 2002:a05:600c:1392:b0:492:488c:f630 with SMTP id
 5b1f17b1804b1-492668b6847mr1380885e9.34.1782347725536; Wed, 24 Jun 2026
 17:35:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624212925.1668662-1-joannelkoong@gmail.com>
 <20260624212925.1668662-3-joannelkoong@gmail.com> <20260624221820.GB6095@frogsfrogsfrogs>
In-Reply-To: <20260624221820.GB6095@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 24 Jun 2026 17:35:13 -0700
X-Gm-Features: AVVi8CfaPQLl0Wy1529H3PRCoe5W_eUxx7v0m8vqdxBIlCqjJBZAJ3GkB5EvT9Y
Message-ID: <CAJnrk1aMe09bYZ_MiR-tr=umZ1nJxDx0B7DCs751zhxEyCL-7A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] fuse: use iomap helper to mark folio uptodate
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: brauner@kernel.org, willy@infradead.org, hch@lst.de, miklos@szeredi.hu, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 3:18=E2=80=AFPM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> > --- a/fs/fuse/notify.c
> > +++ b/fs/fuse/notify.c
> > @@ -192,7 +194,7 @@ static int fuse_notify_store(struct fuse_conn *fc, =
unsigned int size,
> >               if (!folio_test_uptodate(folio) && !err && folio_offset =
=3D=3D 0 &&
> >                   (nr_bytes =3D=3D folio_size(folio) || file_size =3D=
=3D end)) {
> >                       folio_zero_segment(folio, nr_bytes, folio_size(fo=
lio));
> > -                     folio_mark_uptodate(folio);
> > +                     iomap_folio_mark_uptodate(folio);
>
> I wonder, if a fuse server stores to a range of dirty pagecache and
> completely over-stores the dirty range, can that folio still get
> scheduled for writeback?  I guess it's no big deal if that writeback
> happens since the fuse server already knew about that content.
>
Yes I agree, I believe it still gets scheduled for writeback since it
still has the dirty bit set.

Thanks,
Joanne
