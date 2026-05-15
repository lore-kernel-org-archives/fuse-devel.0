Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427DD366820
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 20:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778878203; cv=pass; b=Qgoxb8tdSgNsvzrVx7I7DME+wnsi8KD8LNecyBCzVE2eDbL3QMaZ+zm+qAhjY3sVSdIe9QiMjX2FNMKVXgaJgTzXeValqxTGSmMrBguvsnAxD/BK3EWEWfQbirnd5qpOmRPIeyBJWoBuMcnd74ca+6sdgMm/Y6uxBbn/CIBJkck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778878203; c=relaxed/simple;
	bh=twKFMm3fnXpbB27v6g9MCxMEqzROBKrV8kJXpuF6zrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XkHSYAcWFnzAcugv3xvS16bzYeZT5VzGA3ZvuAu2RZAmggc4lI/srYWpFA+bkPFnLs0/e9PenkMprifELecoGRpBtHcQZSpdUNpAYEDuF8QeEmXXnCY0noRhVgDMjLUw3vjQ/sC1Xj4pHlVHt/191HLB9nJZiGUMsasI5mdNBjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjH8EZPj; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjH8EZPj"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45d96d21e82so93835f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 13:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778878201; cv=none;
        d=google.com; s=arc-20240605;
        b=Ib9FWUkka8UYZrvl8U+tWYgvjA5AB34mrT6mCNTRHNsS7H40W8eYXRDC4QE4COPOlc
         RAb6lk5odpcClZD/efSHHjtil9NNy2sY8PdxaE1K+5/WcvSDee5G5rTlTBOr+7SIp335
         VuPBl7xFrUyPw+Dfome7idl5wQp0PAKi7s2knoICedSrFDMFfFb0TZF2gd9K6tUd0U9d
         2YmU4/O8PyGvAre9bKpivNsTFv4PTYvcickvW6zws8lgEord43uZOoBEB/t4TUBLqpn4
         H03NbROcEvsTcrmfmE8eGSP+Klckj89LD60HcCPWiPgNeb9SihuFJsk2gepNgh7peoFz
         +tTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ij3w2CjfgNV2o6HdX3r2I2TaWMvjfbeVIPwDmb0njk=;
        fh=w0pLANuAkXnYx2sYj1+t3pJIAPSN840MnIQbPEQJdpw=;
        b=T09N2ps0wyX80M7x88stYeVVThtZ2I4FVy0ktLZu5x0lH3sGXF2QzeeYnPEY8EnHhE
         WF3zlquDuvbQm0VOVZER5JclcYKoCMuQmto2LRUTK8RcYo6HzAtRp0X9xUb+D2tmL8ch
         IzPOU6eDtE1B0knd/+GyiUbjSuemjF7gpo+36Fj17ykg8c3o+1+/Qq1tuKwYvm8ZFp85
         19VBYWghA+4pRUH6BPFxY01md2hh3kGEx9M1So04wqK8FNVaIBzi+dKLbdFmKOBUjSNW
         RENxuJrXQpoQfRysFkBVokb5tfZ/cAhIG7RqpSj/MsNVi25KbW/s9KTZfx4IaFfflPOl
         5fAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778878201; x=1779483001; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ij3w2CjfgNV2o6HdX3r2I2TaWMvjfbeVIPwDmb0njk=;
        b=kjH8EZPjLjUmMwaNpBWDK++A4quu2/Hr++0AY/1raihRJoJPOC6pGFPU4GS63dly97
         RALlTO0dk+Zb77ZhwjcNUaYZFhfKTEsv4TCI4m1LIj27+lRn1JVIqlvAdNIAmeHKps2U
         k0lEcLUGn8JqL9qZnRPZnem8pOxMocWfKYXdZ4wHcYVG3gIjPXhLtmWxQtIbMiJ/JNfa
         y2NLGEJIOYQoru7IjrzVa43HTA/JluoG+93qYUSxL8aIxZVRSQCrmS8l/BMYU+DD3o7p
         SYYQKv2HHTBrnMOpDo7OlJ9I303gSWhOQ9ufeaTDjthKc1qcNV2OrNv5KGvrCDPNuP+d
         GUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778878201; x=1779483001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ij3w2CjfgNV2o6HdX3r2I2TaWMvjfbeVIPwDmb0njk=;
        b=CRz4F5anKSaLGVvW9Bz/ShiUBGf0mNcgX4ghOgXT96iV3XruwKjWUhRsMolQmas3jU
         XoS0Pi6qTOMKgBae+v0I+vzMlalrEMbht+NyurThFAS5rsns6FCTskSxpsn9L3ydYQyR
         Yssrgzradpa7PdPt73FdmN0IPz8SeBe6Y7/CJ/E9pMq2P3ICwfeyZVwXOpT1nJiiHmYY
         xQdbLxvZET5XPDt69aTu+4Tw0DV/kXeP2ChCDFk++7sCskIy+A74/Y2+AFlIR4neBiei
         +rXA7ynloC+QuZUxnIblFwvJbcDIBx1hSjD54S7351fB9UAt/L15OK7Nv6jN6saaLqIq
         mFmw==
X-Forwarded-Encrypted: i=1; AFNElJ/z8fZ7aKELdVrH5dhSGHiqFl+NBPrav47nDu7DV+n0aRbexkO0edhgtWAIUgbW/hoUjRAUjxvRCkeD@lists.linux.dev
X-Gm-Message-State: AOJu0YxYV08myvbq6NCqDr4w9M258erYhrBHbtURV73wxG6GxW7hdMLC
	Tj9rrFR5AN4w4D4/r4xUJ1MYGwmcTPs5jVo5GKqJjnSJXLf1NJYsyHg2iCErBKlUNSOuzMEYBoP
	spFU63WgIj08VNoUKAkaLZ70Tj2UBZtA=
X-Gm-Gg: Acq92OF/lKPYVp1PrBlvdJnMKLJsHxFZRuFtQpX2/ZyUCly7hcH+CgpnLoTX7CMt4pu
	cuAmdmSld0D+b6lf8usc4Y43fhTypXXDk6TpgxpCPgMV33unNzli5iIBWCmBhUqzt3kubXhQEk/
	mt///2hwc+F9nTjkRj64qDu0K0kvtWnpHXB4u+cCGvKw5TCAoWC3M0zsgbJi86cbw/PgUSgEsuo
	8aTOHQvLCHZva8kW68O27rMJehQt5KADVsEpus49nLyYV0ATl2HzFFKvURbZqCNNKmA0/kgqIgi
	UXSU1Q==
X-Received: by 2002:a05:6000:230b:b0:452:8772:b36a with SMTP id
 ffacd0b85a97d-45e5c58fd1cmr7309071f8f.2.1778878200619; Fri, 15 May 2026
 13:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515045541.1171335-1-joannelkoong@gmail.com>
 <20260515045541.1171335-2-joannelkoong@gmail.com> <f5ce0e4e-bd77-49f7-82eb-7429242e3c12@bsbernd.com>
In-Reply-To: <f5ce0e4e-bd77-49f7-82eb-7429242e3c12@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 15 May 2026 13:49:49 -0700
X-Gm-Features: AVHnY4KIx6110b-6gW_wIcikfkqAYxppkvuMyi_MB3_gOmxEta5DWqCohkZvjUk
Message-ID: <CAJnrk1bWUR7cz_rTK5XNvBO=T8XgX9L5z2JQ3kuXO5iMHXDqTw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] fuse: fix race between ring creation and
 connection abortion
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, ali@ddn.com, 
	horst@birthelmer.de, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 4:57=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
>
> On 5/15/26 06:55, Joanne Koong wrote:
> > This fixes this race:
> > - thread a: fuse_uring_cmd() gets called, passes fch->connected check
> >   (connection abortion not yet triggered)
> > - thread b: abort is called, calls fuse_uring_abort(),
> > fuse_uring_abort() is a no-op since ring =3D=3D NULL right now
> > - thread a: creates ring, creates queue, creates entry
> >
> > which results in
> > - leaked ring, queue, ent
> > - if thread a increments queue_refs before thread b calls
> >   fuse_chan_wait_aborted(), then fuse_chan_wait_aborted() calls
> >   "wait_event(ring->stop_waitq, atomic_read(&ring->queue_refs) =3D=3D 0=
);"
> >   which will hang the abort/unmount thread indefinitely in unkillable
> >   state, as nothing will decrement queue_refs or wake stop_waitq.
> >
> > Fix this by checking fch->connected under fch->lock in
> > fuse_uring_create() before publishing the ring via
> > smp_store_release(&fch->ring, ring) under the same lock scope.
>
> We had this discussion before, I still think it is covered by 2nd patch
> "fuse: fix race between registration and connection abortion", because
>
> fuse_uring_destruct() is called by delayed_release() in inode.c and that
> is only called when there is nothing accessing /dev/fuse anymore.
>
> The follow-up patch also handles ring->queue_refs going to 0.
>
> From my point of view, what this patch really does is to avoid ring and
> queue creation overhead when the connection is going down anyway, so
> just the commit message is a bit confusing.

Good point, when I looked at this last month, i had split it into this
patch first before the registration one. I'll reorder it so the
registration one goes first and update the commit message for this
one. Thanks for reviewing the patches!

Thanks,
Joanne

>
> >
> > Fixes: 24fe962c86f5 ("fuse: {io-uring} Handle SQEs - register commands"=
)
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/fuse/dev_uring.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index e467b23e6895..cd75f61018ec 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -244,6 +244,10 @@ static struct fuse_ring *fuse_uring_create(struct =
fuse_chan *fch)
> >       max_payload_size =3D max(max_payload_size, fch->max_pages * PAGE_=
SIZE);
> >
> >       spin_lock(&fch->lock);
> > +     if (!fch->connected) {
> > +             spin_unlock(&fch->lock);
> > +             goto out_err;
> > +     }
> >       if (fch->ring) {
> >               /* race, another thread created the ring in the meantime =
*/
> >               spin_unlock(&fch->lock);
>
>
> Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
>
>
