Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59A83D6489
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 20:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777063140; cv=pass; b=u2w1Mf6bOk2wfqem7skbxA4KB6h2ll4x4/z9Imm8uM4hRhmN8jRTSZZZszMRAAyIZ2JyQmajJLUW2w7VPzz7orpyHNFOvQodtz1dL1vskoO5WRfQ3qCrBmdaOB1xxU4Sb7NNMfnAeMgLONTH7BxlX38BEIV6dnE4ZpW1jgZaHzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777063140; c=relaxed/simple;
	bh=KmBuB8MIulAJMakc5vosnN5ndLHe+vSUa09xbsYuhXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJBgeAy3byeuq1Iv+tZl10QX1GhIh+HVwu/3zWy5upcXlXARXOE4E4UVAqCJKXtImkSILyPdli0b00gO7JVlrkLdsKA+PmQLDBqPqSuE9vAF7F1n2O+cbdlVu/8gVS896LdCGfWyJy2QhZpokVMsBN1f/9KqPmxxDEzM+teTTHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjJ+m5wW; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjJ+m5wW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso53950075e9.0
        for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 13:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777063137; cv=none;
        d=google.com; s=arc-20240605;
        b=eEWwYypUSYVSrn8ZUN/T588LMlc/LKaWNE/nhZ3hrFHhl5G0nJfpXc8m+VY8pNKw2p
         fcuiWXT4AQKXgo/1hYNNmLQSR7tHoO5ZytvXXOVDFOB9nJr8hHkriqWnc+o8girr1hsf
         IYo3N0O86OamJnbIPFdvZSR4oVYdkyskN/0WaBk+ro329EjVmLwMoqoptOTJAtoLltR7
         6jeWd8x+lnQ1dlR+vsofT5DI0h6yeEygkSL0OQBmDCp7fafqGlikXucOPEHHwxGeQvoV
         dG8s/5bPaLt6dS5RVtG2O7X76H3Rha13soryIn2Vhd8yXa0QXswwZvX6aGnb/hONfK8Y
         5Pqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=90/AaWsK84JF4RAxGyFXMf8dGYrGrq3WZ71pjIuxCD0=;
        fh=4nzLjfqXVw1pXGD5tY3NiBkFrQhnr5mCtyYY8wmHlJE=;
        b=MaUBEdJEqOc/s7efzIUtSA8u2gZ+/xNwHKr3VOU1v5zpy6UnQ4VZG2X+002Ucoihrs
         2+pblBlM8drNrG21V5+DfJKn5vpWml1x8dUEVxx89lLoIEuVZfmu9y8jU1SVOGFKUgjx
         sQBryVEv4+H+TzU1GcJWLKrphqlPnuwC2V+Avy1L4YZlkBs8WVP49n33MDp/6W/eFZuk
         R+LfePYxi7HQYlLlSi8CVL12MzRrMvaMhX284mrDT9jFGdb7qQeskkQ6kRDK0XjEWxOz
         ggrL05wVQNo+GgfeObzohLioMRsONZXBLEmJf4aojIM756/CLAXKURZNBIH4S7dJEPgO
         rlww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777063137; x=1777667937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90/AaWsK84JF4RAxGyFXMf8dGYrGrq3WZ71pjIuxCD0=;
        b=WjJ+m5wWX5/TMvmdrB0MAKz1KX8+bYoC0hsulG8Es8C9uwggDMureXQYbMVtfxgUJf
         cgkdK16LQIUq19t+iCK+YGBvoidcrnl3nay+0T1LcWXfEBj1YkQ81O/5ox1uzwUy8TKN
         aVUxE0U42aJ5ko4pBIHh2g0tdPVYDPw8Ccg4azAEX1Ei+MitWATdEpKO+Ve+Wwj8FPM4
         Iu0WFA8q90Z0tu5YtyuO0oYGhcNWOcfPRRmNEFcD09mJ7M6+MuX9JpIIiikfNiWvzVGV
         XLABioSNNNmI2RpjEItV/UdBNRzV+vnBB8F7evcJJUed1kxr/y01prs4GQHcQEjodqzC
         QHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777063137; x=1777667937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=90/AaWsK84JF4RAxGyFXMf8dGYrGrq3WZ71pjIuxCD0=;
        b=Pgmvuj801ELga51zEnw+ppG3qUIq9Pl8+N5NYKm/aEWxJ+VR/Ey44UVGBW0X4x8YqA
         1O8A3bxf3ZgGKRe6mVBtwU/MQwr1J2YBrLdOGovNoFGAbZIyhBHqhtUrNL7gUXRVoobQ
         NR9Rf6vOCPyD1E0A2cdFR0ChXE1tpjKTbOI+iqCabEFfdu3r+BcfYG2pBUEfVk8GrDHs
         Nl82eOVaBzASWT+Z30RGDutlNjgOVE76xnVdhVh6fa0BlKfYz7oI1b0BE5WycHnTJ+ep
         63JU/BlMTyZNFXmnk1E04evt9ItJvfxhrwdv8KcjrLKdrnBGXH8d24eCetNlSsZkg9fH
         YHxQ==
X-Forwarded-Encrypted: i=1; AFNElJ89pUwbrnJddcYka5Z6rUUFKZStNWJCJQmhjk4ipH6qn8OMymI7IxFlfDiTp2TsaVzOc/ZwK9mEcZHj@lists.linux.dev
X-Gm-Message-State: AOJu0YwsIH3v+RcYou/4gsHglsIjBA8E9yeGzT17FoCbxXUSoOsN63AF
	IKZsATK39yEM/McdX+yuYstAwoSVfvN2+bPWDPz5MjZG6lp8IDKoVY8LNcMfdYXuhY998RBS/0h
	GexwYDZ0Hinaj1vPVtN11QASVu1L5OLQ=
X-Gm-Gg: AeBDietSS3qOhtOUq0L+zQqZG/W3Ceuo80UoiK7pRT7CGcZh52sdfqRsI+COijIgcT3
	I5xe0nzwA53WN0fmD5DgMfIHEYpHLjMEwJxSebfH5Az2/HBVAXF0XGMBYpa/e4PLla2CE1Yvaly
	tfEHLRUDj7hYZUzJX0K/C8wmHHrWOcFN5vU849Tn5KszHdNrtDIQfCDYXUjQu/5rO5uxmdSFBcK
	9qyeoyFP9d4gY0r/iL7/B36aK3KBK3XywkicMAYFtEE3MAcZsnnMQgXnjM7+3m/tgIk2upw8JL+
	Vpi3vZjNFqbBjfWzdmqG5fiDFCjg0QRfu8zuyMXnUtGw
X-Received: by 2002:a05:6000:610:b0:43d:7a97:78c0 with SMTP id
 ffacd0b85a97d-43fe3e0c65dmr49146085f8f.36.1777063137031; Fri, 24 Apr 2026
 13:38:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403035752.20206-1-liwang@kylinos.cn> <20260423110954.2676-1-liwang@kylinos.cn>
In-Reply-To: <20260423110954.2676-1-liwang@kylinos.cn>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 24 Apr 2026 13:38:44 -0700
X-Gm-Features: AQROBzBsneter9kG69FavOfuB50o0T5qzVMpoATbkO_Hrxt0YjSek5nk_VPJc_I
Message-ID: <CAJnrk1Zb=+syR_aOLVs4aXMTOUO7BRBi=MU-20xQOcDpf2iQ5g@mail.gmail.com>
Subject: Re: [PATCH v3] fuse: optional FORGET delivery over io_uring
To: Li Wang <liwang@kylinos.cn>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 4:11=E2=80=AFAM Li Wang <liwang@kylinos.cn> wrote:
>
> Deliver FUSE_FORGET through fuse_uring_queue_fuse_req() when the io_uring
> is ready and userspace has opted in by setting
> FUSE_IO_URING_REGISTER_FORGET_COMMIT in fuse_uring_cmd_req.flags on
> FUSE_IO_URING_CMD_REGISTER. Until any REGISTER
> carries that bit, FORGET continues to use the legacy
> fuse_dev_queue_forget() path even while io_uring is active, so unmodified
> userspace (e.g. libfuse that does not issue a completion SQE for FORGET)
> does not wedge ring entries.
>
> Benefits:
> - FORGET can share the same commit/fetch loop as other opcodes.
> - Reduces split transport for high-volume forgets when the ring is primar=
y.
> - Reuses existing per-queue io-uring machinery and noreply/force
>   request setup.
>
> Signed-off-by: Li Wang <liwang@kylinos.cn>

Hi Li,

Thanks for sending this. To be completely honest, I'm not convinced
delivering forget over io-uring is worth the added complexity/cost. In
the /dev/fuse path we rely on forget batching/amoritizing and explicit
scheduling/fairness logic so forget processing makes progress and
doesn't get drowned out by regular requests; I think we'd likely need
something comparable for the io-uring path as well. Additionally,
routing it through io-uring makes forget behave more like a "real"
request on the ring (it needs per-request state to live until
userspace completes and the entry can be recyycled) which introduces
extra allocation/lifetime management on this path and it requires a
uapi change and corresponding libfuse changes.

Forgets would consume ring entries but they're tiny one-way
notifications and imo I don't think they benefit much from io-uring's
main advantages (eg data-path/zero-copy). I worry theyy could contend
with read-write heavy traffic where ring capacity is more valuable.

Given that, my preference would be to keep forget/interrupts on the
legacy /dev/fuse path even when io-uring is enabled. Sorry for not
bringing this up earlier in v2. Bernd, I=E2=80=99d also be curious to hear
your perspective on this.

Thanks,
Joanne
