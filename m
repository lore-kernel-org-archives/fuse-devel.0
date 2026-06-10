Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703AB32A3C8
	for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 16:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109212; cv=pass; b=LfMttoTJN9LSlpnPE2+maQuiESwv2udNVOtBCegp8BA/ZA+gCp+POP7k+aZkx44uzK2AsgFdlJIE+n7yX4ZN0SLlgyrggMZwvLx0+90K9pM0GOBdnkyru/WVnSwgC4Z1SMfLkrMj7gy/sIuE8edDexHaMUKYACBIZaeqU3bqA5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109212; c=relaxed/simple;
	bh=e1Bl5+FlLrcukouWFhbbZDbszwGGai4RcrXdP33t1hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JkCxbnXATTPU0N2x2K7VeDBOvNKgmm72m46JNR72PRZrQmh5PHrMFdrCbr9PXxF3HMHRFA/89S7tfqO5oP27mSZ9lvduzJQ4N4sluJIj2kGQFgbyI79DvX0mZqzruRgbwgXfg7nXyag2vYe9RVPNmtxLLa3QCwPtblZRdaVEyMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nus6APlg; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nus6APlg"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso122730a12.0
        for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 09:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781109210; cv=none;
        d=google.com; s=arc-20240605;
        b=cFXRRI8JxYlQzUtGWeXW/x4mCqVwdN0p482fC3VWx/xaDHPuZjT/7aO14a/ZjU1tsh
         WuDZMbtHBNOHDkZT8RKtFQCMK6WGANJWW9qvgPLbWgYkYAGA6x5FXvoWeBzuJUdLaumW
         UeUjzH0ZfUakmkEGUJRan9CibJoZwsKF5QF5mmK/YBi8ZirTzkpYSTOYTrtMIytl+dht
         H6vC9A/OUWOW1iZdTrJeUTiYI429pfBLh+aSaKVw9CYeqI5XqXcPZJ5eBw0QaiGYWvbJ
         OBELLRYsiUAocfWno5IqpYjsUu8nU0Sb56aWJXZrWHmCyKgrQYndp0YLEAOu4SyKCD0J
         Rvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NLIXbNGhWLVjZBKt1DBQ0sCCM45z6rQbn+vn55/pipA=;
        fh=VzWGlyb7u6mcPCFMOfgBZxGSZ3oLRK7dzk4vQoknadY=;
        b=lnQYG1StNVOY6Yupc4rOYvSa5fxMhQ0ZDqU4bVd88eOKFw9UthXXhlmUusIwVL+Y+C
         2JMUGY3usIP7NOu1JJrjOXhniEGBF0C1/N6oMWSY8tcqqmwY71MSeUbc3yODJl1nvoOD
         vOzviYBc6Au2s7Qfn0zy/Fs/JYwzCVStq5DUZK/8e7pj2ymMiFfGadZkh2C/eoyHXhLX
         DkDuDXahevgRDqzjj28v/dGiEV+DI4376NsRyPkZ8/pSuuZDJkMr0AXkiR4GUEezBvHh
         xb07Aawks2vYcFWnw1AJLCLdyFa43malkMSZGytT8Fqz7xHgz8V6H8xm46PzlJPNOpfM
         0BSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781109210; x=1781714010; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLIXbNGhWLVjZBKt1DBQ0sCCM45z6rQbn+vn55/pipA=;
        b=nus6APlgy4cNgUrXnE8vA2Z0IlcRUKSfPc4yvvR+n9Rt8mLeQ6XW9VLHvx1yCvnTzt
         dNVao7egXv9rpLtz3ynVNSGvZjumVmpkpdYNMfbMMFYyDCjAiTVNATE6Gzu5Iu1O0IYR
         NjnnaKRnupDkIt54rOWDWBWF9KkLkzQ7dbKFTOknNQeUaYqqyajLaVnBiJa/gMcJmLRz
         KiNA8c+PqKQcddsMOTHW8mL6oTcvE7ousmAoSgZ8LiJvi9FpMT6eGibUvN7mvhBMnrxl
         6oZpeGOxkSXqm9ZniPluuGMy46Rrtmx4buHJgcdPG4Imn59XBeRcf/v6O0yfX48eMn+S
         uAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781109210; x=1781714010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NLIXbNGhWLVjZBKt1DBQ0sCCM45z6rQbn+vn55/pipA=;
        b=N4ipKSG2hqdrzsBNVgvnGV2CWmqTa+MdBzCezE6aJKu8bjcFYwoydEBLbdkOEZMZop
         ee6kmUk4UdhuGj3K24+TLlNyU02RbG+gBbAl7JkKR8ja9tth+ytNOlg2R6B8m1pIKzFG
         HKEJAgWqBNt+/k6v9Q8rd+2YzVFWy3/xGoNv6ay/gcCKSQ2r1yTpx50A91CbznwhJp8/
         IMYIjZXqXR/kGyF9rO6ghgF+8zuG/TfrSkGt0VqPL4QnXO5l6/x7E7Hn6J4FqBkC5iSC
         Afhzyi4s6Wc3M3hHZkgh/etOSQc4vF8UzxQf6oUeraRbsqY7/8bvj1mS8t73d1i2PWYq
         1Y+w==
X-Forwarded-Encrypted: i=1; AFNElJ+VrhRea0Ph5R6dx+PHHnLWrRFCbHIzqz1vvgFXMUTRYKXjrsgholeUXO1/fmiyztz4ZTnAuPX5vAbs@lists.linux.dev
X-Gm-Message-State: AOJu0YyVGIfeCh+z2DrxPHQDhvmLrKqaHMDdVb/LqpoP9DB8QX/c/BdP
	olpZKh4Z6ETDUgDWu6HW891xM9C+craMdDKSchdkbmeHkspl7ec/s1ywMqsVYagACHG0CIMUS5/
	KY3h37HsoMRmZtmGoeQtUq2am2EXcgI8=
X-Gm-Gg: Acq92OHFq8J3snyTBtQlKvpK4UjwWh/blJ0Lb0Ox0GhG/proPO6TjXzi394AAk+nhrQ
	xbxDyouzH+SvaKElsxWlKfkcZFMYnBPHADhOtqMOIMI1mI12rF7ViHgwnIVlFPpDkj+gt0/EpS2
	EJjS0EC1Hn5UkITBNa6IFQtajYQTB72xkzdiyAcvUBrzRggiK808YD7C9xxaDhKfau/eqDTjEnP
	X5P/T+LOGI8dblwnqLiZdqFs9WekYUM5SJLdJFsh2fRFJHtQLqpsst/+TP5BqSmeYTDmLTTMbad
	LSQaXELcp1MVdDhVEc1bbrizft7uEegmJc1y4d5HGaHu6/8ms1vg
X-Received: by 2002:a05:6402:278f:b0:68f:cd4c:7296 with SMTP id
 4fb4d7f45d1cf-68ff22839a1mr10851394a12.13.1781109209658; Wed, 10 Jun 2026
 09:33:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com> <CAJfpegty63HGGNR7Vm0mpfs+PW0-r-hJDSASsRMk3JwsHTyrvw@mail.gmail.com>
In-Reply-To: <CAJfpegty63HGGNR7Vm0mpfs+PW0-r-hJDSASsRMk3JwsHTyrvw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 10 Jun 2026 18:33:18 +0200
X-Gm-Features: AVVi8CfkOs3ZY7S9pp3VzBKsG1EFkr93mLDOGW_5JjUeeaFm32a6eBtPtBtyr88
Message-ID: <CAOQ4uxi-PLeDmc12Wu8Jmzrc4iXSFa+PSFXGETc9pT0T5WAVhA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] fuse: {io-uring} Allow to reduce the number of
 queues and request distribution
To: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>
Cc: bernd@bsbernd.com, Luis Henriques <luis@igalia.com>, Gang He <dchg2000@gmail.com>, 
	fuse-devel@lists.linux.dev, Bernd Schubert <bschubert@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 12:51=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
>
> On Fri, 29 May 2026 at 00:55, Bernd Schubert via B4 Relay
> <devnull+bernd.bsbernd.com@kernel.org> wrote:
> >
> > This adds bitmaps that track which queues are registered and which queu=
es
> > do not have queued requests.
> > These bitmaps are then used to map from request core to queue
> > and also allow load distribution. NUMA affinity is handled and
> > fuse client/server protocol does not need changes, all is handled
> > in fuse client internally.
> >
> > Signed-off-by: Bernd Schubert <bschubert@ddn.com>
>
> Joanne, your RvB is on the first few patches but not the rest.
>
> I'd be more happy with a fully reviewed patchset, since this falls
> outside my current expertise.
>
> Related question: do we want to request automatic reviews by sashiko
> on fuse-devel?  I do see dangers in relying too much on AI reviews
> since it makes us lazy

Don't know about you, but I am lazy also without the help of AI :-P

> and complacent, otoh sashiko does seem to
> provide useful feedback.
>
> What do you all think?
>

Count me in favor.

Joanne,

I saw the io-uring fix series from Chris's AI.

Does it mean that hs bot is scanning fs/fuse/* or reviewing fuse patches? b=
oth?

Thanks,
Amir.
