Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D4E1A9FAF
	for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 02:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781144169; cv=pass; b=Htr1O3QbSefRs/4leXdqY3/HeTvRIb3L4dMGgJWbLLuAYnZHW9PtYkay6bAhtK048TwtznMcdt6e5hyHWko2rNp3ncEJuJCrO9+7F0s+yJ5VGTsEHCQpwHUZO6jeI1zl0MQo024SSMWajrgY1Gj6DFbmSLEYjznsNruLtcWF3PU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781144169; c=relaxed/simple;
	bh=63F6PrgBRUec6wNjNS8WUNKcRgR9W4wFP+MZ4lnDJPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhc57evVvxboQu0HQGKWiyv9g6eskW9aUBxycUjfht+qUWz7OtVIzz9sXsktY2oS4+3q2zRvY/m/+UA+IUQYrd1Kz32WqYcJpuU34uv/NAJwcyuccBZbbJgp4QT/h5WZbHggAtJN1w1G7VhSaIQVtf9swzIzNVI99x+rbd6zP/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrtSzmDM; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrtSzmDM"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso5069147f8f.3
        for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 19:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781144162; cv=none;
        d=google.com; s=arc-20240605;
        b=idhmaTWqrnMEsO+B2abM5Od8n6Qk8VtJcluK9qyD54wz+LgHksnG2ScxA1OtJWgnTu
         SK1YZkfNFG8XCjx3kgW9IXOF4LpNP4hUhGHYuvGtm7laooLJPuAoaTFxP+1wEcE83d9m
         oDSW4kM3TNEER5PblEoc2V9QtsQ2l9x30FC1hcr212sbLp70xilIEOxcVIDgiDS89SM4
         LwXqMzyqpcg9/vYpv3WOYnhuEcIxfzbmQZMSPtD7vrlJstPUme/Hk6Xqut1gYiwII1Mt
         6UZFYpku380vFReHfRQgS57Z3b/VzfxVItPmjyP2NfspgPCOiPAbsChUJD+l7NPtLnCJ
         Jj8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vH5MbWtGeRUeb8aMybVyst7q2nbEzZtwab2nc234t+E=;
        fh=LV1xFYA8B2umqNvfu4qeHPuoGb9EPOstZVu1FNl6EbA=;
        b=XekkJcTcuVL9tLvn63HjGULYKcL++EFi7Pmm3Y480ZRvpNGA+dktbVBO4azaLxAQv9
         JK0AwG5unfm/n4aYGFhnFPYhdbLNB5QkazYL73XLgRJKq1X/RrEXDKSb2JagtdvJZKrS
         b3ZzoTqcABnJ86BB0Zml6aYoBLkG9SqEiSe9PAe/N88Golj+wYJgJp8B7SYzsi1bc1Wp
         WKfLPQ1z3swPxaS5nKgBtaw52JSxm5LWTJr9kZx4AZ34zUz2FlsisMOWdQ1Nuxe+eSu0
         cpIaQFd9iog9YbbfYf8/fdgKW3CGbe9xBYfPnjz5YSdJ4jMDDxBUfoV5hj56azmxDDF0
         2/1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781144162; x=1781748962; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH5MbWtGeRUeb8aMybVyst7q2nbEzZtwab2nc234t+E=;
        b=BrtSzmDMlUVQ/Jzr56Fe58Iq0jvKQmVfzHCC7m7RfeMltqQJeUQWatQ/UZjDfQgoqk
         6+BlmSqf6ID31ObcASOrPEquoIubWPmAa/yTdGBUtU0lUZQnBMJbMs3vjqt6UhWUQ/+a
         uhRvkpjGnDzcLQ2AqFeh2nkbCeM/vW1pUQLLe46R1AMyONI9w584RRItc+e6xPU//CMu
         zJ2YxrO2ksjxjBkKCHyAV6T1vK04pP4bK4TE7vVdOhlBE+fDPHA1S3PRIoZZLRaeX5py
         IVXUniBTX2WG/hKafk0U3TTOHG7dW7LQa2fieG2iMf0bQOYxI16EriHRmBz9MDnwa8hY
         cqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781144162; x=1781748962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vH5MbWtGeRUeb8aMybVyst7q2nbEzZtwab2nc234t+E=;
        b=DiT9eifihVv6qznpZpKHceDLkHtEIB7OuDDN/s3IO3nw1EPlxTtdE87KekdiUbe6ti
         JtJ0TvKPVSCJOqBjr0w8heM0e7jez05NohPtaFnVWbajls3S4V5HHZHLgHgsxwZQz4Vq
         y1dFTPn3x4Ip1PuQT4zW1w7q/A5YHAe0DquvD3lU5aLaWh41JQ9W7ZGZCvhT+LugrImZ
         ndHvmUPhGpIQMiwP+WEKUtRSrELB7Df7jbTPC8TwXxbPJKSaXS4NU8cfr+cK41/WEyce
         0TuZk8dhQ2sest1H6Da/n0wCrPSJIBgNeNtlhTO4WL1fxfwzGjeB3/+0rb+MfrNtRNE9
         xkvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LLOXT1CTgH9a/7t/wpFcWDqzggejDHQfc2ZCczU2nb5bKNUS93zJfzEM5rLrpUCe5rCOBXjMiM+UN@lists.linux.dev
X-Gm-Message-State: AOJu0YwBcwslofIynlK6sVb6XqpLbc9QtN3i/7/bobHR+YLwrs1eRyN6
	sOJKt+tcz8PtOgWZvIokk47/X6CyAgiLseVX3E4cqE76o81PYHeZ1/54keN+jAJZaWy1uNcT1cf
	/5Y+fbNjlodGejU4j0DhRUSTlaNaS24R98KR1pws=
X-Gm-Gg: Acq92OHtki54D/mCFEvBeW/PrFkYk4edltMcoqmmCal0DHEULYBZ/vGUa+o9s6iF0/7
	uRV+tIzSe/3vSEZM5P6t2fGTvqbyfo9MSdDhKN3DqVJcMwyyY+3AdUZsWGq4O4dbpI78U7cyEtk
	1EiMCW94QgHljEvrUyg1CJEbrkasqSVBQ1g/hfw4gRfyQjF3gSdi/TCP9/vfBJ5Z96nXNV7gwjS
	qMbtvU2mCtV1nR9AfMDwpEV0JcdzLUg8MfwigQ+T0cZD9y5xJWiQuI+yMK4ILhl2d8YZe1/ikKs
	6D52mZfO31SqG1JngxwR7QZhx/olqxqJ6e5lT2nrgXMZ94hkiZedAHfNq+uY1ebchYP92h3zEA=
	=
X-Received: by 2002:a05:6000:29c9:b0:45e:891c:648e with SMTP id
 ffacd0b85a97d-46067478056mr611414f8f.8.1781144161978; Wed, 10 Jun 2026
 19:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
 <CAJfpegty63HGGNR7Vm0mpfs+PW0-r-hJDSASsRMk3JwsHTyrvw@mail.gmail.com> <CAOQ4uxi-PLeDmc12Wu8Jmzrc4iXSFa+PSFXGETc9pT0T5WAVhA@mail.gmail.com>
In-Reply-To: <CAOQ4uxi-PLeDmc12Wu8Jmzrc4iXSFa+PSFXGETc9pT0T5WAVhA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 10 Jun 2026 19:15:50 -0700
X-Gm-Features: AVVi8CeUZjsCeP8IpzblLiHrQmuokuB6LBCuABMnjQ0EBwcWfJggXhfS-wZ5wyQ
Message-ID: <CAJnrk1ZSCkHQfcMP7SQJm2BNKMSge6s4d_rGNO33rtmjMG5Aew@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] fuse: {io-uring} Allow to reduce the number of
 queues and request distribution
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, bernd@bsbernd.com, Luis Henriques <luis@igalia.com>, 
	Gang He <dchg2000@gmail.com>, fuse-devel@lists.linux.dev, 
	Bernd Schubert <bschubert@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 9:33=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Wed, Jun 10, 2026 at 12:51=E2=80=AFPM Miklos Szeredi <miklos@szeredi.h=
u> wrote:
> >
> > On Fri, 29 May 2026 at 00:55, Bernd Schubert via B4 Relay
> > <devnull+bernd.bsbernd.com@kernel.org> wrote:
> > >
> > > This adds bitmaps that track which queues are registered and which qu=
eues
> > > do not have queued requests.
> > > These bitmaps are then used to map from request core to queue
> > > and also allow load distribution. NUMA affinity is handled and
> > > fuse client/server protocol does not need changes, all is handled
> > > in fuse client internally.
> > >
> > > Signed-off-by: Bernd Schubert <bschubert@ddn.com>
> >
> > Joanne, your RvB is on the first few patches but not the rest.
> >
> > I'd be more happy with a fully reviewed patchset, since this falls
> > outside my current expertise.
> >
> > Related question: do we want to request automatic reviews by sashiko
> > on fuse-devel?  I do see dangers in relying too much on AI reviews
> > since it makes us lazy
>
> Don't know about you, but I am lazy also without the help of AI :-P
>
> > and complacent, otoh sashiko does seem to
> > provide useful feedback.
> >
> > What do you all think?
> >
>
> Count me in favor.
>
> Joanne,
>
> I saw the io-uring fix series from Chris's AI.
>
> Does it mean that hs bot is scanning fs/fuse/* or reviewing fuse patches?=
 both?

Chris is an AI mastermind. He created an AI program to find bugs in
the linux kernel across all the different subsystems. He also wrote an
AI program that can review linux kernel code (it reviewed some of
Darrick's iomap patches in [1]). I'm not sure how different or similar
it is to Sashiko.

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/176169810144.1424854.114393554000=
09006946.stgit@frogsfrogsfrogs/T/#t

>
> Thanks,
> Amir.
