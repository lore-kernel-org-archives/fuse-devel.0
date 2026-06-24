Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413ED26CE39
	for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 18:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782327330; cv=pass; b=JzP0MCoECpHpOPl5oKP4RWxZAtfeYSNPcb2ArpxzPaVnfPa2q0xKoQLsWnn1h3GjVvqNooaP2C2Z2fZI4OOgrHBXyNscfVDrviW/FyOVVvUfjOon4DudANyXVRih2mhS2BB0e0jwynRMJY3L0ZImM0KFnT9Makbn2HOmRKGq7fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782327330; c=relaxed/simple;
	bh=s1vJ8mKBOUDI7dmycLNBcqgezjzNgpM8VRQz3CviYJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nljgzTf8ZdlAYXSwaTGVzO8F9NHhCegIwE2r17EbFni0IyqBaLJHuJ4FW5LOevHylj4JZydxMTrfchbYM1UOHJcEqYnAs6BziCxxjzuws+f960rRDmEsVCWEod7MFYl61XzyzOGcTWNoo2bt9WJ5f7qVo1oiVLa+ScWXRVnR4aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvWFx0LT; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvWFx0LT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-462bb734793so946642f8f.1
        for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 11:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782327328; cv=none;
        d=google.com; s=arc-20240605;
        b=TrwsrBArgXesKrKzl04zJtjVgSoaNWGt/yzNOhHWMvpKPbeK2F8BvOE3zSMb5kU8wT
         3BAA1a/x0Kx1En6JhOn2yR/yMCGHKzqXUmskOyW2Mdo2/suyo2F8zYpUT7qIyRxJX4Oe
         BGGpItdC078k3tTF8UxAofzTJdGURrXreu3BXRCOCNF5sGhXN+Tn6wDGT3tQjL7x70A8
         XHgA8alW/YWOWOLQpycdNmbySyxbk7zkd52mL44s70bdKSt4a/NNdysmQF9SLOz5kOA2
         1FBWso8FcGUrJU0vdHMBUmd2l55RJx2hbYHyvGXhfVPGdJ2qyNhsimiz6BM752PVmJSH
         Xaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dutkJQvZ88RyivrUq2VuUFVtInmTzbSSO0Nvd1JQYws=;
        fh=a6GkGpXLww2HoWEGsYIxMjijCsJp1/HZ5/w+8tpqBRA=;
        b=TW3WjLUzlBEGzan27dRHYd7OoeC6TgeNlqjUxsUAyWTvTjcX63vAfivnjiZ/3/ppXs
         CdANHpvSzcYui6Ui2ZMydXNfszqQo1jl94ekNpb3vQ6E2uhAYavN476Rb9KeAab5cJ39
         kkCKmrWp9nk44i4fFudqzpk3br75oSF3s5efJt2x4Au2LsDyWaIeZdpOBBT4Yt57NLfM
         /zbDh2WKkMpUZvSPV5O6tUpGNNtrp1OnxAxLpp4sEid1C3QfPlH10KiQQkQR6gEwyuAm
         bfUfLB9nRCAhFOfkiY3QZcCtQy4r60NxHqbQ+7pnz+gDXGxCvavjJNMlFIA1BnmMmZC1
         4X8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782327328; x=1782932128; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dutkJQvZ88RyivrUq2VuUFVtInmTzbSSO0Nvd1JQYws=;
        b=qvWFx0LT1GNkIkoOTUIFOSXuoZdQurfNK5kiTcZV5v1TlJt6lwaXjkWJz0qShHzNCy
         71lrLL3GIZZ1DTRXC9T0P+iULuC9DLdboP2Qj6hhnP7tNyDfJunkjBlvsd4KCvVib0Mm
         q4dz1afShEz+kjK7c9+oArAGgne5h1sgtVO6BaLarcCZEbiZy4r9DD59414R0K2Z+gA+
         O4hUgIN8QcIl7r+kvMPdU8OhFfPa9q+RjwTALLcSQOkTWtb3YoL/Zq1zZv1+vtf5y8+F
         PA/g77FEW6R4V5xlXRe3H/Zrg+3anYrLcaKNePGvpIHIS8kpyW6sVEcEInT3wbQru3Gt
         X/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782327328; x=1782932128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dutkJQvZ88RyivrUq2VuUFVtInmTzbSSO0Nvd1JQYws=;
        b=Sfltw58EgiAcLR/TfRxoPOpsqF/Sy5IFkWWZYsmOmniXOIN/fWcGnc6gRq5iYlRlkV
         Fj7b30I77C0xmG2xU10Urp/fHIFVeDHc+eStj9uGHGAZWFwPjY9a2ORxv9hAObgBqA7W
         XtPMECctjzFdw3zf5+fuCtSjki5lPTTs3irFfswXiBd3ITRHHMXvjVWYYskRKweWWq0Q
         LekTZPQJobw6paM3ILVDKf4pEuBzVJpkUvn35uwdJkiA/tOnZA6ruZH5rQ/8YhsW7Wb2
         GYf+V3jwM4OHEui8apmMIjXXHdNo9YAzSPY93aDpa6elXncZUV89F/aIqvjR+8OwH1C5
         VX8A==
X-Forwarded-Encrypted: i=1; AHgh+RoRYij+zDAcJAh/JhcAAPsTx3tRlyYQHtNOtNVFDnmmuEhfpER2QJr8+xRqf//LBk4IkwNJ7zEE5QB8@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt7NzNLqz3d461uU2gxmejvEdHxEtaCLQKevZ3L4RFvDtRkgCD
	PubZ8qcc1gvJWVXIE1R5fRFFQziLwagaI7dBhvAWZSnbKl19i6ugSRU1Ymfns2vKWgAY3Y8hlv5
	tSrogYegk/lzQdurM9UE05aK0XQJzg8k=
X-Gm-Gg: AfdE7clv9DQo30VOunK+RYLJNXEzFb+mzlRNlf7slTis9Yv5qj4AEgJmUC4zIC7h5Jk
	huUHyS5DrDEnAPk9PLVo4KsEb0u5RaQd6QNsREvUVGiYhI2MEMhpJzivzFes586Pr/ypG3fvY3S
	6A4wnGKqy0WEqua13FD+MVxjh9Dkmk9taW/GDkxJ4DRFn6h9DYFWslRqKu9qyERh1GdYLn1tlyp
	yNdvbiHOLWm4J9HztW6b059PFpgTk9Hl0bVFgukeoyz1OZCvR3h0JQsHBBhzYZsJhEVhuLuonZO
	us+1NfAZ2ivjgKuVi8Bcwa6ZRpFURuLH3yy6pIdjV//PKGSYdvvW
X-Received: by 2002:a05:6000:1ace:b0:460:71e6:e3b with SMTP id
 ffacd0b85a97d-46662334928mr32467994f8f.27.1782327327620; Wed, 24 Jun 2026
 11:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623202843.2064992-1-joannelkoong@gmail.com>
 <20260623202843.2064992-3-joannelkoong@gmail.com> <ajtPMgO65FA1TXhi@casper.infradead.org>
 <20260624073625.GB12359@lst.de>
In-Reply-To: <20260624073625.GB12359@lst.de>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 24 Jun 2026 11:55:16 -0700
X-Gm-Features: AVVi8Cf_rkFidIUX6JYWCVRDA5nByM1ZWpGheMNA_h_5f27vsvoibl7LK2mr9uw
Message-ID: <CAJnrk1aDt4o3hVLfnW0wEZrGE6xw5XXspB5vAg001gv=Ntu+1A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] fuse: use iomap helpers to update folio uptodate state
To: Christoph Hellwig <hch@lst.de>
Cc: Matthew Wilcox <willy@infradead.org>, brauner@kernel.org, djwong@kernel.org, 
	miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 12:36=E2=80=AFAM Christoph Hellwig <hch@lst.de> wro=
te:
>
> On Wed, Jun 24, 2026 at 04:29:54AM +0100, Matthew Wilcox wrote:
> > I believe this to be a bug.  I talked about this a bit as LSFMM, but th=
e
> > fundamental problem is that the folio uptodate flag DOES NOT BELONG TO =
THE
> > FILESYSTEM (unlike the buffer_head uptodate flag, which definitely does=
).
> >
> > The MM has a number of sanity checks that make sure we haven't
> > done something awful like mapping a !uptodate folio into userspace.
> > That would potentially leak confidential information to userspace.
> > So when a filesystem clears the uptodate flag, the MM can come along
> > and bring down the whole machine because the mapped folio is now !uptod=
ate.
> >
> > I know we have a terrible writeback error handling story.  But I think
> > the right thing to do is just take out the calls to clear uptodate.
> > In all filesystems.  Darrick took it out of iomap in e9c3a8e820ed but
> > it's time to purge it everywhere.

Sounds good, thanks for looking at this. I'll send a patch to remove
this in fuse.

Thanks,
Joanne
