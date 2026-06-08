Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265C530DD3C
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 19:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780946149; cv=pass; b=EN7pnhJKQW2L3PN4wxnNFhMooJhM+lhM2cjFQq7r1BJ9iAmUTUYLY0JxMX1fFjzf46ivT7FyMwJJ3j5+kn/pwy9fSXqC6zsa8HXIoupG9zjff2kf/thzTrCgFY+2RF7lJfBn5MWKTqxjsvgwKkdzBhxw7+8MWVg5k2a6LO6rqMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780946149; c=relaxed/simple;
	bh=TZkhSAXrUt0n75Mt6fWWjRy+l6BTCEJ4BYkaFNLDoyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GGKahdAQZJJI9NIdyl1LGtD4xtqcxryuBDPMLRz75qYtiDpBlq6lEqn1Lnn4tGUTORH1iKcn0KQXnkInFM8ArTIL6EUvo1olfaJ9eCE0QnlkwTBEpPDnEwnFe23hh9YDKwbBdA9NefOKyqb1WyzrM0hgNHSafdh9+rfnlVba8/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLhbNw3/; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLhbNw3/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso39076715e9.1
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 12:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780946146; cv=none;
        d=google.com; s=arc-20240605;
        b=OP+jmW7dRrz5314B4e5G3FZVquFI+fFcnSfFCKjlWESrqMkrMlQD8msKTTb+kXIrVl
         wz6pfqd80yQXnJWFmk+bYe2ghF/nGnOP9TNliNbi9rCYwMf2jy8TL2EB1TC5DwL0XC7+
         ZtUit6o6f/V/999wuyDoiBvpgVe3aqy2gFED5JAw7dtnQ2RwSmEieHmPBieRuTldycw2
         R/niww4yIfyMnf7/mH3GZeHRUCUIAF2zqdifqdHkdrlYI4EvZmuqioOTHVy6mqHOBCnA
         wPMjvdutfgWG5xNdFb4x9HrM5xyoK9v+7XxDR7tr6qUDApCPJ7iz1XsWCdXaFKB8MO62
         Qbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5X4u1/jJousiHdncaZj2AGMjuTraeYIu+/3h7dWf510=;
        fh=++lnd9pQsc14ujLpcVzt+eVHi94P7AOXnexG7NK72fs=;
        b=dvlqH0vZJE1v5kGFCTMOA2vMVnwZpfIDm3N8HcKANB+wXo0kxtAi3qt9G1TDtEG5wS
         VFbeSQIhBSGRg2TlgtTyvB1cD9IuMQFT39gTko8roZiJqHGrTuQklCYo8Hgyp7vU7ddb
         RkMrJQ9mXWsECts917LknFz7wrnz37Cj8rM93PDEJ1k9ToxaUEACwZhZ73jKEnoxxn5a
         fVG6qNu0vr2DTQOZoRko94246iDhfSs91OP+yJ3l75XcPQwOCrTFINr0m3hJv+RKY61I
         SUsZt4p0S+MvAVL/w2vW4RB1u1SQSUU7q7un1e2cFMolCGimHu6LCxMXTgJT6Tyb1QkE
         InPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780946146; x=1781550946; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5X4u1/jJousiHdncaZj2AGMjuTraeYIu+/3h7dWf510=;
        b=aLhbNw3/soPyLPq7QToJIVGXJAEAUMgQsx2xbmgQCoB0b1bUaUlpAlx4hTU8kyq+r6
         JqrB4cGxxMFuGXOffAdCxVe2EmRDSjh0g8+5b0ggWjKaXXYERzkVNuJ0LjIsHgVtJ4fI
         yf1cZzDCkQAPixl62LTrXEHA6zHfoFDv5nOhVkN1y2jibpOFB5HtP3xdXlV+71BDF+LQ
         g0jZZ0CmZ3RrooNunt+Wh6skqFSjMr+7Cm66MNayL3kGylrw/HO83m6xaHXepn/zXMPS
         tQ7hhATcNT8O009KHrfSZD8t8raX7HXjJb21r/Tl8H5liNIaRS5YScsN+0YOhRmwMBig
         Pxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780946146; x=1781550946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5X4u1/jJousiHdncaZj2AGMjuTraeYIu+/3h7dWf510=;
        b=Ezw2d/0Mh6l4JNBHeU+wgMjsJoetPGTkDQPNC8WX72qtRqbYRYi3YSag7vVFPxfzIh
         20ya7lei/akPGVSfVZfoS0r05hRdfZmVPQXzQsN5Rai2aHTaxKlGTrYWgVEJEbpTOuHT
         gy7osclEfUcfnhqbTX5lFdu1J8CqPfKU+S5T+cLJDOqm6DcjZWXtcw3RLvusE4TMs+ll
         s2BUhRINH8N5be3h4JhjmsLQzJ2Nds0/BztuqDMDx7GT2nd+ukfxIOiifX4oesAHVcr7
         /rm7dMW5CwH5c/5y46K+xMggmw9kN5JdWk4AUdIMffdC9RNNYsAf4A5CU+Bsfv7FFiQ5
         70iQ==
X-Gm-Message-State: AOJu0Yx1nyIe/HENeR8X8XHgmL3haWbk1EaBg3HiYvpyvblNa5H8QBen
	lfmV9CCz1KRCHwfdFrffYzzY5Hk49+WAXQeVMRJSN5YSE05WmNeDQ8Z1G8xyvO0rBWc6eahdwUR
	Z/pRWNVpU7tkJKIdCm6nnaLNPFklLKi4=
X-Gm-Gg: Acq92OE7SQHDXL/I88se8CktBVzIeM75a31g2deKaDTYnoBQa8y+A1ke3JHlsEICi50
	f9aGjma2Q2vfRg7VVQ/JYjfzO/+ODo/2mA10ceBAb/4LOzN2CV+eArW6FPohTv1XerVB0hPT2FX
	NRnZpboA1Nrknp9GyrHhzhoKiVGQiE4ZnsT/MTlGI3CHt1XJEovMc9ImsMNB3Y6v+/pFnRYTsWo
	0RO141KL8vKmVhGAmaDM58czinrXQ1SZ9sMWUAND7fh3zHy0O4GH4reJ7DMfo6KRWVE/R7o8BIN
	desKYB4VLOG6nPq0lasuEe9BLMk=
X-Received: by 2002:a05:600c:81c9:b0:490:bd66:db49 with SMTP id
 5b1f17b1804b1-490c25a1e20mr239764585e9.12.1780946146526; Mon, 08 Jun 2026
 12:15:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516021138.2759874-1-joannelkoong@gmail.com> <CAJnrk1bhWbvEirAM-ePgU=qCUJpHZCoU+ekP9yY7p-uSyk7j0g@mail.gmail.com>
In-Reply-To: <CAJnrk1bhWbvEirAM-ePgU=qCUJpHZCoU+ekP9yY7p-uSyk7j0g@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 8 Jun 2026 12:15:33 -0700
X-Gm-Features: AVVi8CfC04n1UZSW0QgdMtvZJKB0ImGxUnuUzWh5a6Sd-48cKMEb3C4p65Zb5XA
Message-ID: <CAJnrk1axtbVi7z8Ph_=wYALf=M88jyntAz4oVL_dtDex4ZvunA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] fuse: fix io-uring abort races and cancel null deref
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev, bernd@bsbernd.com, ali@ddn.com, 
	horst@birthelmer.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 12:03=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Fri, May 15, 2026 at 7:12=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > Patch 1 and 2 address races between abort and fuse uring ring creation =
/
> > registration. Patch 3 fixes fuse_uring_cancel() moving cancelled entrie=
s
> > (which have no fuse_req) to ent_in_userspace, which can crash
> > ent_list_request_expired(). It also removes the queue_refs > 0 gate in
> > fuse_uring_abort() so that request flushing always happens, since cance=
l
> > now decrements queue_refs directly.
> >
> > For some more context, please see the discussions in [1].
> >
> > [1] https://lore.kernel.org/linux-fsdevel/20251021-io-uring-fixes-cance=
l-mem-leak-v1-0-26b78b2c973c@ddn.com/
> >
> > Changelog
> > --------
> > v1: https://lore.kernel.org/fuse-devel/20260515045541.1171335-1-joannel=
koong@gmail.com/
> > v1 -> v2:
> > * Reorder commits 1 and 2 and edit commit 1 message (Bernd)
> >
> > Joanne Koong (3):
> >   fuse: fix race between registration and connection abortion
> >   fuse: check connection abort during ring creation
> >   fuse: fix moving cancelled entry to ent_in_userspace list
> >
> >  fs/fuse/dev_uring.c   | 32 ++++++++++++++++++++++++--------
> >  fs/fuse/dev_uring_i.h |  6 +++---
> >  2 files changed, 27 insertions(+), 11 deletions(-)
> >
> > --
> > 2.52.0
> >
>
> Miklos, this series is ready from my side - could you pick it up for your=
 tree?

Nvm, I'll submit a v3 that fixes up the tagging for the 3rd patch and
adds Bernd's reviewed-by.

Thanks,
Joanne
>
> Thanks,
> Joanne
