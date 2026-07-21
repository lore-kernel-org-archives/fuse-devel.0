Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4D53AEF58
	for <fuse-devel@lists.linux.dev>; Tue, 21 Jul 2026 23:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675453; cv=pass; b=S3PtuNq3vCWQ6xZ1yR1BSriCoGQaAwdwzbotGttZ/dlxub7AglypVw00/VvvZZge4hdKG24/80lrkHnPvpXrhBBh2aVP2LWIRUa4wArqClwneFBn1nJlL5O04ssVGYNyGMvWVIEfDHidwUQu81PnzR09XDJezG2dznyrkY5bkZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675453; c=relaxed/simple;
	bh=MRbjWT22PIzwFOiJto4ZeF9L6vJEEFfi47cZdOq3nIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdy08ElhtX74ukevD205fhRZBJpaLh8nysJ0di+kogCW6h040HMMpzvQuQVvAaIjRoTr3ThjjP5wAxC5n/pu7QuofZIOXAxIUFscz4/YEAU407BE5GE3EfRjG48J/MlezujTZ7OgDU9nuqY8xkS+27HEuUJM6IqaehS5NaQIFeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIXxfTHj; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIXxfTHj"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47de008b020so4106825f8f.1
        for <fuse-devel@lists.linux.dev>; Tue, 21 Jul 2026 16:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784675450; cv=none;
        d=google.com; s=arc-20260327;
        b=Ml+b4WXojstFyNhy8W3xvXYeVvDymM3lmR65ecy1bE4Zx1S6hz2UtuEvqVerS7nEOl
         QAtfSKFGR9RbVCcjrchLjxRJkKov/PK1aivSbe2zYTMacCmO5gn0upZwv8iOkW20wkRL
         VuFbzJPMYQzIrbHz/va5tQ82BqkzhQcw7z+4gGH4yVXEXQIw9Wrq75SBEM5qo3eNCCWW
         2lGA7afGrDuEG1U+en+OWM0X3ZBJpudtRS5q5sTlSPpReyqhFFkTYETtXDxnxOdqTcsu
         X7xKSxsuMPElSfqLFDU7flwIrOrkrSquwAmkHmZcFbDNG8m6H+n6+sz3a5/Rin21egOf
         aUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qyYzpLcXnJ68OYY/4qWO9PG1H6KngVBPvYKsxTOdj8A=;
        fh=Q8O9YYkmBgdFmB7lpGxOuA4sl0mP9jR4ijm1QAlA0tg=;
        b=ic76zp7XvVnj7L/EzgSx7n+jYV8N0XzcwFU3Yht88hiJhpfbzG0T48rStLrQzca4ZO
         OKlltZr+YAyNsMw/kT0pFXLXsg1WdcBq9rxRu5fwAfZjPY/ZNDAs+bEw5RrzeFvkvQkh
         JejOW/JGV6lsPRvfCHSXukl2i8shd7spM80rPiCU29wAie8LYPCc1zhxN89XdH4s+2AA
         MsnJlsLKNtkcnNL6QwcdJlD/jjD8EVJnWhNKcpayMcVlYMKft2UQPmvxqC+/VB16ZbRy
         bxOTZpISVF79/ZC1NZMOMuq7b2XFrEv+N7oO4SQD1219M3+Pc4yKslkps9YwykTAlimw
         Txwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784675450; x=1785280250; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qyYzpLcXnJ68OYY/4qWO9PG1H6KngVBPvYKsxTOdj8A=;
        b=GIXxfTHjvwY9eotbGK8XHrAmv3I6lAqxgG5Y9IsSqiH8bQV1RCkl8S9uXLPUoUtKPT
         hCd3vyW5i4w6tqFAVYXturE8jzh4z6HWFQykf0HQ2tLvS5SiTHpRhmbn8F2CXRzpbpVI
         eBNzEFPzXYBL6QqOtjKlBgIOT+0RGGVC6jBHSFj0egfB9xUuargNZzYL/4vLR1DUXcpj
         3nn+Z+grMHGiIz+X94P9rxYi8S6hfV8MAiEKWz6VMwvT2aBExEDCsI5P5dw7V7UF317c
         QgNLuRuh4NVeCP9nkfiNpbkw8RctyreSLTOwqSCj7Jh7rFlthffW8irEZ3g47II34YC8
         eM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675450; x=1785280250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qyYzpLcXnJ68OYY/4qWO9PG1H6KngVBPvYKsxTOdj8A=;
        b=XBsg4tyUHVObdLmaMf+fxKzbahvtV/1P/WFSRhWZsaFU7SLZM0j+iz8+gScsluDeVR
         95dteAlctL5ZpfrlvoHK+9KfzIP5bhhX+/RwEJzXAptPtNz3waPoqucrlBxHMtcwBO/l
         ArXwIekCTToogrJ0EkgLp8e4gGOsVsWbhXPhEHaim9A9G2e6hOU1pw6uRJID5k3JKFXn
         pn8zFFBtUmvBnYGya8M7eAnvFsROMf+R3h/mSY2Wdd+m6TX+Jp1C2DWMobsNvDEOUnCW
         x4xO+T+ep0L6VYyQ/Ccef1jllfc+1/O/EIm28tdZKr9Ik7dXjM13Ta+WbhQPQSEVmC1J
         rT8g==
X-Forwarded-Encrypted: i=1; AHgh+RqrqwdhQfTnPVZlwiO65LStkgsldrP/7n2abyYttsLcEUAQBegMKznV+n2w5z0HXRT8702DqtzcXm0i@lists.linux.dev
X-Gm-Message-State: AOJu0YyYorLTf+qoBtWVfXid5Oojh/0IOVB8JMfc7DBaJ9vzzkL34iHK
	EyKOgBbgut1DXigtf//PQ1ty1Sh+J4/ksY/azTVEVe+d+dO5KJVt/Gu+l2vg//MnpAuOHqYaSUS
	1QnDyWpnpGah/aZRUvkqS1Wn1CtTJ49U=
X-Gm-Gg: AR+sD107XxTY9X74jCuY73GfqSzJ5DdRmIsi5Zn4Wv9md53QhlvhkE2FVclXjECBbr4
	D78I9Tymrh89mrnPQs026iur10DDIDpvy1PvXU3JULgtf3sd2xFKfP3K/TglwQTDr+umEphv4d8
	yW7MyL9iRsCthNJ1HEZWgYJ8r2HaBS4hHf8XuDacPPZkzMcf+m6C/TFzSyiOVn5HKXSyaS8bGPV
	47ovPNHFOGlkKCTMPgch1g2r7hoKZFdzgFZptiIzxJIPa+ZP+36fL5GmPQ1g2hUosVD7anhcSnH
	FxVDW+fmkiN/Uxhc43ae3HvDLBS0fMQS+TavH9/4jg==
X-Received: by 2002:a05:6000:38f:b0:47d:f6a5:1fbb with SMTP id
 ffacd0b85a97d-47f840b5648mr1932933f8f.13.1784675449525; Tue, 21 Jul 2026
 16:10:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-2-joannelkoong@gmail.com> <CAJfpegsNb=1P7Vh+DVfg3Ve9T8ggHxi1Y-ZhqiQ6R1bbnCTHGA@mail.gmail.com>
 <CAJnrk1Y8mwyeqqL=CaW-=Qn+kRghZNbJqSMqCSW_8DDCVyKKgg@mail.gmail.com>
 <CAJfpegucmqTZan0rLL8YoKy6h8UCzKuZQAsvasFpHgy64Nh4JA@mail.gmail.com> <CAJnrk1YMO2FgReO0Uc8Axx+D2C3WWGgU2YF6R0XSk72AvULXEw@mail.gmail.com>
In-Reply-To: <CAJnrk1YMO2FgReO0Uc8Axx+D2C3WWGgU2YF6R0XSk72AvULXEw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Jul 2026 16:10:35 -0700
X-Gm-Features: AUfX_myMkJabfvVNyUw1ptriyNdddXOIzizJ6XLeTapGHYcfglUn6fJoM8VHQ78
Message-ID: <CAJnrk1ZUUk=Emu1AfGtZ+GBHd7pH_9h1u-0kUstPVJ2cT38N2w@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] fuse: decouple fuse_ring creation from ent registration
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk, 
	bernd@bsbernd.com, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 10:53=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> On Fri, Jul 17, 2026 at 9:41=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu=
> wrote:
> >
> > On Fri, 17 Jul 2026 at 18:28, Joanne Koong <joannelkoong@gmail.com> wro=
te:
> > >
> > > On Fri, Jul 17, 2026 at 2:32=E2=80=AFAM Miklos Szeredi <miklos@szered=
i.hu> wrote:
> > > >
> > > > On Thu, 16 Jul 2026 at 19:59, Joanne Koong <joannelkoong@gmail.com>=
 wrote:
> > > > >
> > > > > Currently, the connection's fuse_ring is created lazily on the fi=
rst
> > > > > FUSE_IO_URING_CMD_REGISTER command. A server registers entries fr=
om one
> > > > > thread per queue (one per CPU) and those threads issue their firs=
t
> > > > > REGISTER command concurrently. They then race to create the singl=
e
> > > > > per-connection fuse_ring, which required open-coded handling in
> > > > > fuse_uring_create() to detect and protect against concurrent crea=
tions.
> > > > >
> > > > > Decouple fuse_ring creation from ent registration and move it to
> > > > > FUSE_INIT reply processing after a server has negotiated and set
> > > > > FUSE_OVER_IO_URING. The ring is published before the connection i=
s
> > > > > marked initialized. fuse_uring_register() no longer creates the r=
ing and
> > > > > it instead uses the ring set up at init time.
> > > >
> > > > What about if the fuse ring is not yet set up?  Should
> > > > fuse_uring_register() wait in that case?
> > >
> > > The fuse ring is set up when the kernel processes the FUSE_INIT reply=
.
> > > If userspace races ahead and issues a REGISTER before the FUSE_INIT
> > > reply is processed, they get back -EAGAIN and will need to retry,
> > > which is the same as the pre-existing behavior. The ring gets
> > > published before fch->initialized gets set.
> > >
> > > Not sure if this answers your question or if I'm misreading what you'=
re asking.
> >
> > That was my question, yes.
> >
> > Retrying in a loop doesn't sound like good behavior.
> >
> > I was thinking that with sync INIT the completing the write() with the
> > INIT reply does not mean that the connection gets initialized.
> >
> > Shouldn't the REGISTER op block until initialization is complete?
>
> Yes, this would be more ideal for the sync case. libfuse currently
> works around this with the retry loop.
>
> This is a pre-existing issue that's not introduced by this series
> though, so I'll send a patch out for this separately.

We can fix up libfuse [1] to no longer send REGISTER before the
connection is initialized, so I don't think a kernel fix is strictly
needed here, but if you still prefer kernel code to coordinate this, I
can send that out.

Thanks,
Joanne

[1] https://github.com/libfuse/libfuse/pull/1561
