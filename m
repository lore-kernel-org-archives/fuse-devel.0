Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DC037C926
	for <fuse-devel@lists.linux.dev>; Tue, 19 May 2026 22:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779228446; cv=pass; b=qyTVWIol1zh9Vc7+zXmevN9Iq0JQ38LRDh1qwEB3VOnvgo0ArZzgUkV7xbl0Hy3VlAj5+uwP9fvPWx95r5CAsLhwr8H+o8zlLGanKrzAAxr+HZJxp8/pqtia318AkGG3YXrWLBKivlY6wqf2CrkqwOmwAdv808gTm2v+C2ihAR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779228446; c=relaxed/simple;
	bh=piBDvQwyjk+bAfS1p9n7LLs3zJcyoa4Vky1yx0f3GWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7CNJdVjzcaAS2IdsWPokfL5/yxrAKicMxP0jbQRTuBywKzBAc4E/ip405oNesSSXcmLHVybeLPqcuWiAsuZ/ufWjHaMX1eL7aqR2/Zl8F3B/PENeleTsN+Krc32wfPl3oOL6/2idbI+xD3E84pB8J5eT99xIJLdz4+eIz1gyCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrwlnTqa; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrwlnTqa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso24953095e9.0
        for <fuse-devel@lists.linux.dev>; Tue, 19 May 2026 15:07:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779228443; cv=none;
        d=google.com; s=arc-20240605;
        b=lXsLL8BtbMI6vfDXm6orlZbO7Kl6t6/QAZcGrXLRM3E+OcMhFSDf7PEfpZ++ay8gUa
         vnfTpQxYmxmvghJsRfyJ5CGqzejQ92Yneby6DOpcsGQRnSiNdHew7/jwGa6+HrliO83E
         w9+Gqo5OiE8X3zqSb/QI3KIedKgl/8U0dzFG8lJcXOZhOxjeOJWVmR5ayHmApntC94jO
         ymgsGcJQ0JgcV25cFbUVscZZx5sFhuuq4JlC46EtjSAGuloKMadELehrSjzO5lJCTr2i
         fHuW2wzPS3so7UcWgd5AB3KeEsKhobd141d1Y1a5K8MZJNWBBVdO37KDU6b6t7uUyUFr
         Lpfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=syIH2X4lqZqn7fO1bqpamX7eCMAdo+GVXIdTu8K5pKs=;
        fh=mFOR+UyZ8MNlTBNSMxuHQJ0KZjG5a7L0P+Qx/IObRZ4=;
        b=FFB+bkzZOXedcucbTI85rq0dOPRKFqZwvmrrtZ9rNUAdaIYXfWWcGdxxl87BI1z49R
         bGIvLf5FaYJv6WUnnytoHes/yXXnEDM9ad5KGWvgAxfw/FVxWrfTlQ0+jIAPDuKdIZX1
         SEbwDABmwUeR50MLlLoj3OQxpvq/9STgFohFxNfyZWKaYoNwSSxcgmnKgdRQXC6HE3dg
         4Ooq7HnXr9yKPegfhWELf6JJ469ZJ16mI57PFDhjlOmgXC0jTDA/nOcfoRgZyclNQoQL
         zIX1gB6QxT1NwrIM5b2Qp5XdAjZD4OuJrnPUtkBUCVDO95aD09O0AGGYo3ufQ/3Y3kbJ
         2JpA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779228443; x=1779833243; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syIH2X4lqZqn7fO1bqpamX7eCMAdo+GVXIdTu8K5pKs=;
        b=jrwlnTqaPjiMg2YiZBbut+eghUz/VYmTJzfWAWrqPENPzWaixXosfkVurovulTzzB2
         PNbA+WXNs1+1RP1ClI91wKGZDLLHHqrwk1ah/5C1XrcwUv9/H756hjY8ei+M+sy9lZ0W
         VQ8LwYpEXaD12C91mAn7SD1UdLhxsUbH1DoS67UnPQ6yeWpbzw9wFPGlSYEF290zRCUN
         VNzAfqREimY/T+jzjdkL8nY+PKhVRvGJ7VdXipnnmfgu28hFUc+OyczXXojyxpyxKLZw
         XeVMx/flllbHGxsdI0K12rMwE8Q27rtYlc/oOSEM/8zXrUl0bXtePDmUv7LR2F2cl5Bt
         /C/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779228443; x=1779833243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=syIH2X4lqZqn7fO1bqpamX7eCMAdo+GVXIdTu8K5pKs=;
        b=oxMwSwak5uE5bsPoAzibgNDYo/JIU5cDN2j/nIx0toOldTecH0Km2VE1W4z6X9R1yo
         SRmgfMtt5aBu0HCXg2YYU6C87SOrRBoQ8C+JMvIym6u5zF3/2KTKB/LCOefwo49ecLzl
         KlF5OU4jHBOAMeLMcBmhRR6I917AlY9ZoQAeI7rd0pURwQ6MVRyJg/FfKrxWSluHP9DS
         EGs6wJLHe1PE1LMXubrhjIXJsB76ydgIMKKuXV+v9W4RzbhiisjCKf+YFKFaLKgLgDEg
         fby6nCkB7SROYgMfRLaI2CYVxnQBw8sYcI6FQK8ra+n+Vh7O17LaFyu5DaLzHGw3fjyS
         M+qA==
X-Forwarded-Encrypted: i=1; AFNElJ/DYGpznQEFUrPQ01wvE9RySYxWYoS2E+n+1iYhzhX8pVwSw/FfIkWjAPy2K7IQr99/hqTT9oDNEGcC@lists.linux.dev
X-Gm-Message-State: AOJu0YwzSeeFywtOKD/sN6kgiXfYXC8FVmxrpLVas4b+RobQaWSuz7vL
	VzL5ZS4yIldVMjm4CdTCqCiBvzmuBbKHsXel69ivB7k65PgEatToKxlzHg3Gg2XS/7H0wGlzXSr
	7IITOFW4TaJxkapDukA8VgSzHFQtMWtg=
X-Gm-Gg: Acq92OGr6wTWjnKhuLVSy9NNMMy36Hus0S9TV67CjoWS/zyS/3xs0eOUe5QglYQdx3y
	/dfBjnTP1yVYiwwWHCqv5yDahe09j86/SK+IOm8AYS51J89nVDOx2CyN8eTHnp7paDcwrwX4ZW9
	LA6J+Q5AR2IFMBaiY3E3BNrQhrnKYKzrvTPa3/4m364XXtnTH1Qzkzdiy+KvAQMpdemXRLfwLn5
	j29vrJ/JIda51lMP7rap3o8EH9/ZGbrig/QxNhUb4An20Vujt0Rg0YeQ0rYvdA0YKEIVXNrjlpQ
	gDgV4w==
X-Received: by 2002:a05:600c:310f:b0:48f:d346:e646 with SMTP id
 5b1f17b1804b1-48fe60d5693mr309554015e9.10.1779228443454; Tue, 19 May 2026
 15:07:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-13-joannelkoong@gmail.com> <CAOQ4uxjMPPp-R37yKoOs1kGUdAOmnp3keVWvfuxi1r8jrxAcTA@mail.gmail.com>
 <agjDGBQPG2WpDTWO@fedora.fritz.box> <CAJnrk1b_55hMTRxtV8QKBqdfEhT_LQK2byat+x-a8Xrj4nicnw@mail.gmail.com>
 <CAOQ4uxj+ss82jZV6yq=LXag2s_ax9rVdtH9uc8W+RnRD+U5qpg@mail.gmail.com> <87tss3ifob.fsf@igalia.com>
In-Reply-To: <87tss3ifob.fsf@igalia.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 19 May 2026 15:07:11 -0700
X-Gm-Features: AVHnY4KL6G7lDeu40R_EpbeFkCrgOhHUtUCFqEflHhtz-Ub85W9UjnDv-jTrKTk
Message-ID: <CAJnrk1b2KfRUTg10+Q6P7GsOYSur=hPFrh_uahmuKWZ3UHjDcQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/21] fuse: add struct fuse_entry2_out and helpers for
 extended entry replies
To: Luis Henriques <luis@igalia.com>
Cc: Amir Goldstein <amir73il@gmail.com>, Horst Birthelmer <horst@birthelmer.de>, miklos@szeredi.hu, 
	fuse-devel@lists.linux.dev, linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 8:26=E2=80=AFAM Luis Henriques <luis@igalia.com> wr=
ote:
>
>
> (Sorry, I'm slow catching-up with email :-) )
>
> On Tue, May 19 2026, Amir Goldstein wrote:
>
> > On Tue, May 19, 2026 at 1:12=E2=80=AFAM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> >>
> >> On Sat, May 16, 2026 at 12:29=E2=80=AFPM Horst Birthelmer <horst@birth=
elmer.de> wrote:
> > ...
> >> > Hi Amir,
> >> >
> >> > I see there is a lot of talk about using the compounds in a couple o=
f different contexts.
> >> > I really have to apologize for not having the latest patch ready by =
now, but I'm
> >> > a bit unsure how to do it.
> >> >
> >> > I'm not entirely sure if compounds will only be a thing for fusex or=
 if it will ever
> >> > be accepted for the classic FUSE.
> >>
> >> I'm not sure what the plan is either. I think this will get clarified
> >> on Thursday hopefully.
>
> From Miklos' email "[post LSFMM summary] where is fuse going?"[1] I
> thought the plan was clear: both compound and file handles are going to b=
e
> in fusex.  Quoting:
>
> > COMPOUND REQS: let's add this to fusex.  uAPI is simple, kAPI needs ref=
ining.
> >
> > FILE HANDLES: same: let's add to fusex.
>

I think the part we're unclear about is whether the plan is to also
have this in fuse or just fusex.

>
> [1] https://lore.kernel.org/all/CAJfpegvXnA1QpmfM9V+3VB470xYDNWH8FV0mBV1R=
1-HqvjfJ8A@mail.gmail.com
>
> > Wait, is there a FUSE call? I did not get an invite :-D
>
> Don't worry, I think no one has yet received an invite ;-)

I haven't either. I think the only thing we nailed down was the time
(Thursday at 20:30 CEDT) but I think John is still setting up the
logistics for it.

Thanks,
Joanne
>
> Cheers,
> --
> Lu=C3=ADs
