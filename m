Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793457653;
	b=2sctdyGqniybp4/pM0cKJZ11af98md9++vPIaHvEpKtOfbdw6H5eHfUzAitonyRSYSp7
	 0Enu9Hs014VAdts6whwUFR00gtTS0ZKVAQTLr1CWJyUeqjjlXGLEq5oNHWUiy8WPoccRR
	 C/EPIPFuTmZrZK/0DOqT/hg97NRmZJxemBBaPpGD2QVxPm9RPbAh5cA5nZ1v30MWXR+qO
	 dS4iCh49tuQZme2ntEOoDQ/nhay7C0J60qT3lXSQTjPQ3mpaY+8iP6UHcj3hhSE0x3QSk
	 oFDgLUOxnhqQLSJbzAVDkBO1Z6oFAO/1DqDBWMxp23j6VsotxV9abjrFg623/Y2WBcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793457653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YJ9qW9t1xQBiVaYVvO0c+cru51d6nXoaWQfa1b/mglo=;
	b=WzvJNkqxzOBOGXB4eI50m03f/RgyDT26yL0+gZTMjQoZ19ihyjI8rEpPcEon40gsgfCg
	 pMoiBxI6EMjKhBPFtGDkZk/Nvii9uxX1MNYMNPvhrxUiXicYqh79g2qnofRiEX6FWuPBq
	 7Cdg09guU1Ij+EbDFKQ4z4TStDxif/0svt1dKz2z6DWTc5X+VpW3Wqnx7+ok3qlwf042t
	 XKczMNxQ9olsDBgeOpaZ6PQ6xIKrUIaa7V7SmBqvTR05VK5TMUg4FGPjjhKqZFfs/Rnxq
	 4RnfuAWK/DBl4ykwTEILhSFLRsQ7UDDFqMcO36iddfshEQNH+LdGgpw+urj5AiGKegQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GDzxJmVM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8410E606A31A
	for <fuse-devel@lists.linux.dev>; Sat, 31 Oct 2026 14:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8410E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GDzxJmVM
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso286113266b.2
        for <fuse-devel@lists.linux.dev>; Sat, 31 Oct 2026 07:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793457652; cv=none;
        d=google.com; s=arc-20260327;
        b=TwDIDoUQazCjn2WJ7e6vkw1LO/67G+Hl4zWbPnriom4hzWU9ghL3gt9cwp7G4blOlk
         cQ8CNUlYvf2SP7bl/rkVxdCOHdAw2zuMGvx9Pg0Op0dK6FEZ/d9wZciAoqkD7YpDnesp
         erktXpRe/Jqlvy7gtXvPeXA9fYqTB2pvrVuSStUuPUAjx1EDmfsnPgbAajlHW/ZgCxdX
         F9yWZjJ098OeoqdSnIIj7NLUTBTSONs/IVrPdIJmab4ng3imvPDSer1KA69z5eX1WJ40
         W0hmIKhlAEIZ1IOUN5P+0S/Nuz0XirvFOZCdno4FGcNs+mtcFAfqcUhNaM9D2yRDbtDV
         oSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YJ9qW9t1xQBiVaYVvO0c+cru51d6nXoaWQfa1b/mglo=;
        fh=i2wX4/Ud7fvPTQKpHeZCmYwQIO7t6mzcAZF2sRwoX3k=;
        b=CKfFk29tom97vVrIjtCcsyLva0qimQGoMUFZ3Oxnta3QmxZHjqV/gDqA4F3Q4dw81G
         Uza6M2svS7zzGboCioDx9/+409vpvRgFzETB7zWzBmg+rhRt9wvlXcCYzgcpokHqQ6S7
         VGiXOeEX54jmLmN/VHyMzJlO4BR47/ovZOUGNmxv8CtH0jU8zhtEfJmI58K+Ugk5vMtz
         ml4wmeBTS64GaYU8gbB6nmpdKthzgwokc858fkW0Osox2aUjxAtu1hp8b2YuYoMpwl6M
         ZXvhilg2MEhQB+7nZLSb66rHSnJx4XMqVSg2C873Yc77tlMVvidKnLdyYpG15ftQBYEg
         kJHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793457652; x=1794062452; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJ9qW9t1xQBiVaYVvO0c+cru51d6nXoaWQfa1b/mglo=;
        b=GDzxJmVMwtGlTHMVeowasuio8zFbzVnhdqlGmUAczhLVSub+UladCvENG+J/yZ9vgu
         /v8t2FLyVBRFSBH34+d7rVn5zxLwita+FTzbAiUS34gwhrnIbUJ3JC/Py4hJJGtNJbAm
         84d5gWSra/wkAf2f5iBL2LE635RYelAMr37sNr7uoLInhuVbUG3VzcML0x0YfpP7NDGB
         VfuUdDwtvE2osP2QJVMNhG74syOJ9wyyjVDLQjNM00Nfd7hGuaT4IwT/UUcSEUtZDGpM
         YffM2c3JiJRNly9Y9xWVmntIOvsFnVqGmB5Qfcm+7wRcsfXSOxc0EX3j4l4Vw2o30SC0
         MawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793457652; x=1794062452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJ9qW9t1xQBiVaYVvO0c+cru51d6nXoaWQfa1b/mglo=;
        b=IHsh7s4/HZf8gMcaj7IkeZuD17x/mCaDR/WH/5SMS153BTgwyNuTfSLdoEPVpnIJFg
         oIQCnxvQYkOl6udvlV8GF3o2huIXnVDxdNoC5+AHmcpWYFGPgiYIBVTFCsqiaMzapXdG
         6ljc/yXKODB4uw9ngU4B8vP5BNhknSzN4fS3ftepMJIrXBAfDs1U3w9Wh72FYFZzfgJp
         sfMuC2HvSBLWGwvrH9Te64O1BzAuRkOO39EIKnFhQpTqjJpF0+F3qz0svWimp9j76A31
         bowYtUxkEPdos0NgRmuV3OqWxq799tsN55Oo+7TQY6EeMXj9C9PHWp4DwOnCOpdy/FRX
         XycA==
X-Forwarded-Encrypted: i=1; AKwUvBwYqQsf5nUTYhhTdIWJ0wH/Wkybj50XzHnFRkhEHHkIWiknD/rcoOrZ4eIENlCiaqbcBhADKV5u/yZ/@lists.linux.dev
X-Gm-Message-State: AFq9FYJj/VIKVz6jWpnGPix5LGXuYrPX/S3aSrGXls7SPhxsQikxcLh2
	ZsF/1s1cVjCYdsuYee7drAOfQKN+Mz5339LgitDSdYKFIlI+LzXMxNm6FL4RmnJpdUDjHF0CrET
	Yr4wqCOqxJ5oeiFr466dvgcWb7I0Hn9w=
X-Gm-Gg: AYBFou19RcoCUEpfHIAAmqN1cONmQP/cmLeisUJCpA6d1rOo16IT+kWq26ZjEenmZYP
	hJmNS61+ViFaGjt432P7GT9MK0SeS8xjBugci2A6OVpm6y5gm2r8yaFHrp9SRkkTxbMZqMr/P+Z
	Som2jP0UL2WQZjMriga2da/AwG6vaEKXcYTt45Aml5K/r5ENbecDl36G+pzw25V7X4oa1/qkFUr
	+B7BTp1EY/zU49YqM6NoNuLZ6RlmEmS/CGykScds76lh2Cxalg8wvLIy+gBD2Ae429V11Oy45Ho
	ZKZAMdpEnmAqLYhwvn8TW8NL5IHfN5M/Z3FP0hiKUdHwC7K3CfA+CkoUrgZkI2n5RT5DHa2KACD
	YrAiUEE+L1cM6+bSyhkL6ylbjkPbBzJjF2QhSGICBja9X8yb02qNbEGj2ZACFbY2nIict/w==
X-Received: by 2002:a17:907:3f95:b0:c26:1648:a06b with SMTP id
 a640c23a62f3a-c4ca7a96a37mr442170066b.38.1793457651868; Sat, 31 Oct 2026
 07:40:51 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028091215.914885-1-hanwenn@gmail.com> <CAOQ4uxiQcyZv8B50MKM+Gn==JcoAVbgbCGBneXJhXUwR5X8ppA@mail.gmail.com>
 <CAOw_e7ari1kQTz+qKKg9wZ5dCsv5sZY-KNM-bwkietEmrjHZ-g@mail.gmail.com>
In-Reply-To: <CAOw_e7ari1kQTz+qKKg9wZ5dCsv5sZY-KNM-bwkietEmrjHZ-g@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 31 Oct 2026 15:40:39 +0100
X-Gm-Features: AclHuK9GZKsttphyKFmA8nlQz72JGV4nqC_qUfbOUHG52H3Jnk5zp--rjDiWmx4
Message-ID: <CAOQ4uxhPZi2vutSgwe3d0xUH23A7ydkDsG0CGs=_LCS3X6_eFw@mail.gmail.com>
Subject: Re: [PATCH 0/7] fuse: use readdir result to shortcut negative lookups
To: Han-Wen Nienhuys <hanwenn@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 6:36=E2=80=AFPM Han-Wen Nienhuys <hanwenn@gmail.com=
> wrote:
>
> On Fri, Oct 30, 2026 at 4:27=E2=80=AFPM Amir Goldstein <amir73il@gmail.co=
m> wrote:
>
> > Thinking out loud.
> >
> > Is  it really important to support FOPEN_COMPLETE_DIR without
> > FOPEN_CACHE_DIR? The two feature seems to have correlated
> > use cases.
> >
> > Bloom filter is built at EOF, so it could be built at the end offset of=
 the
> > readdir cache buffer.
>
> Isn't the readdir cache dropped as soon as there is a namespace
> operation in the directory? That would severely limit the usefulness
> of the bloom filter in writable directories.

Good point.

Thanks,
Amir.
