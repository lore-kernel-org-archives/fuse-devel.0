Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E261637F721
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 19:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780947259; cv=pass; b=bEykTEJ0EfWR42kG1FBHYpdeoXIg9kXxt/8uTVmM4mbjIs4UYlZy8jELf41H6eTktV9E8ck1vKJ54lRS7DC23QnD8m4+qfAf8UIoRT2LB+otb6xOaiMR7hVfgiG/zS5dbE8H8zYl4oCwdMOrrCxDFAJtp+tRCBRXEcHvhP/LCRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780947259; c=relaxed/simple;
	bh=xruRPJzuoZR8H/ZmlKtMAI+/9vcVlDA2a0Fq+QSvyq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXiPVfMrKbhg0MEe+D1iRZRXqFVB9kVcCmKpbwKuOMlj4HNNrGhCsUAHe3PaKbq7IJ0dUOhgrZmM2y+HJu7RfptnYvIZVIYdWBeCIB7xbZLW7muvstnqVQ78Nzmd7idYogxONblqcVzwqAjwssoueB5RspdB/dxB1AClwn60H5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0lzaKi+; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0lzaKi+"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so3176161f8f.0
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 12:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780947256; cv=none;
        d=google.com; s=arc-20240605;
        b=ToyiNWCN5i0THmPZuyc7CDrb/vYFD0FUiQaKkr4zeBCc1uNPpJB18uWEY4Xi5PeNVj
         Dr+lnW3T0MwjgwmSMH5xi00+vDQv0muQfWCL9bNGTN1zXyUKU/SkdNgivyx8YSUfeuL8
         9SDa3M0pZUbCiA0D3SQtHxOBrPFFbgundtxag9oasLzbMWnYrOxVQ6c/+At9M/25MQaN
         SK9BdwUg32MPPskZVYNyphENmP2y2fOI3msqwmGGterL2fqQzldZBw9BK+fx8v8cTaaZ
         seL+ISHvJNcw0BRvfi6X32iNd0bP5kp0I5ua2kcA5STP5nFHiLYihf8XywQYiqwsFNFH
         cZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oT75tN62qupHZaJeG30lAlpPEoFC/9sFmx1pxJ1563I=;
        fh=AQ+Uv6AigoM680SrDK/oAUfRQqeqpHX0fVZSD2gFkkQ=;
        b=aWL7zub12djjSjJCyt07PDFcIiXTvvanaflI+jigMJah+bropqcQfiTnDy+31vBgyD
         CVC5ukwD0kSQMZzmbdMxP2yPwVPXix+/mukrqzTMfCrHL4DUpsPbw+gurhH8H1zkIGCd
         oiNanXMY4gJ7pBBMM7/Pwh/T7sbtk7D4Wyy3S+wJBFNPYSFi0dV2l7DnqrqjdY9fGqqB
         1+xv9A6xU0qvadpcfQKrxk0fFZO+zFKyodG8r8Oc1M9ax/NpKD8eBjSshD6YM/E2Dcx7
         hL5ENU2GNTYVaJNTw5iMyx8IjxWSPS+UwvKQEdClca3CNVo0v/uL6MqfAT9AfSbF80YU
         S1Sg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780947256; x=1781552056; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oT75tN62qupHZaJeG30lAlpPEoFC/9sFmx1pxJ1563I=;
        b=U0lzaKi++29lgkgtxmAZYWVrZGb2oLtw2U88g3j3jSB2zpzluD2SvRDJt/9yScSy/U
         Uy7FR3qgAhugaQftRWRadTwnhG04f99O0rIi+crFxn4WxdnkLKsEE8ELnf3xaIe9hs7m
         9ph/MI1w7AjlrlD7Ns7H9X6mVceAxDZ+QIST61XAvN7pQ8yBUzsYp9NLxaFygnWq/r41
         GYpRx0nowqkbmosK52BdkjBJjmR8ir3JpuA0KlkmDDTYqaQIPr838XU+DVSTCXu+0zQ9
         er1stCLo9Bht4hhzuyvJ7qM1jFml4o8ux4i6i8mJofjzyhFJeYa6vGApLCf996a6vp8O
         m3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780947256; x=1781552056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oT75tN62qupHZaJeG30lAlpPEoFC/9sFmx1pxJ1563I=;
        b=lDNkCX1ke+bkZaPI492QK7ql+/xwPAlNMPvNiX41qbrQrfOTtv+cOfJrtLVLBbqneO
         Wexs8HAzzEyV52p5YXCKqgwMvTp+gB4fCuRQqCJQZyYlnCqhkCpNkJk5mg3uSOzvMMuX
         9y+OmAY0u9recDtBNM4e7GTnQi4sqcgrVu8Hx2pOICDMM4KrbZ39GtCLapBaTaBedf6s
         a+e1L4fh+NTcxhw5qKjmtpuAAGl7JguO3cZmXRh32lUqiWjZZYTlBRxvv4HQ7yk6t3T4
         PxDQhQhUOVJH23YI7eq9Yo+hhTy0I48yhBGZLbgXFNE9pWYM7a5PHxBRtNMMU1QjKMes
         WR3g==
X-Forwarded-Encrypted: i=1; AFNElJ89/5rsRry84ueBqKad6OhA/mPbFKA6aM7BMmorS3ksWRdogGSO/I1Bm40mLsOTUmxMd7P7sLZvnEV1@lists.linux.dev
X-Gm-Message-State: AOJu0YwEtXQqx2O/QjWma5fz5AHzu8LU2869qHX9HYwsk6ix1QzLXeTb
	Hi4JhBsn3ch5w//59jAylhDvOet1/s3qcbhg/PW2YsPnqa3vL0EjfPvBgivg8td/6o3mf2h55Wz
	/WM2u06ULNwmXsyxT1eFKZZSTkR6VIN8=
X-Gm-Gg: Acq92OGkHjMuFt8IdGrJwj2009atqxwxH7WoeyuiipPyG7OZzSOsnBHXTeqDOvO2/2+
	XAyxHBQyq6DFBW+vtmi4Bi27h+qexZa5mCUgu+xnmj06/D9Y6oMzFawybVGVSDVC2K3zYrtkQDN
	3xDEkcib68yYk+1tlTb76bmui/WsF1oz/8QaqZyBdTcB7c2/lP0QjowIh0LM1ujuQLZrtZ0CCEG
	NIo2WSEEPaW1ZZHX44K/vGhCWn03cL7w/CdTVTXE0svPQD0gOlgFTUi65crTA/qOixqwKgT+n/q
	8OVUPwe4D64IhvAY
X-Received: by 2002:adf:e444:0:b0:441:1cf8:ca00 with SMTP id
 ffacd0b85a97d-4603061ec02mr19303949f8f.26.1780947256200; Mon, 08 Jun 2026
 12:34:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <20260522205823.1597313-10-joannelkoong@gmail.com> <d1d588e9-5d4b-4e3f-8154-e769e9e69f12@linux.alibaba.com>
 <CAJnrk1bSr7B3kp3x8RdZWM+6F6H2h7r-pJhvqxoFpxaOtjF2mQ@mail.gmail.com>
 <CAJnrk1Y5AMZYz8cy9RJHFzYTK=H0we0b9uJiCHQz5EcZaMZzqg@mail.gmail.com>
 <6ae8fcca-2a48-4555-98cc-930c0dd3589a@linux.alibaba.com> <CAJnrk1ZgaKRhUg2Pwaqe3GD0-BXQWPR9iHzzSPgg3ygfby8gmA@mail.gmail.com>
 <62fc2403-4245-46ee-83e2-a8779d8b5280@linux.alibaba.com>
In-Reply-To: <62fc2403-4245-46ee-83e2-a8779d8b5280@linux.alibaba.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 8 Jun 2026 12:34:02 -0700
X-Gm-Features: AVVi8CcsT9Y5TDZuJriMljh9VjQ96qRu95dx6lK0wkjmaCDSxuWlG_p4dDN4hOE
Message-ID: <CAJnrk1baVtgxokG5PjHeq8Xfkgg+66BG428i3x8aW2+V7VcyeA@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] fuse: add zero-copy over io-uring
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: miklos@szeredi.hu, bernd@bsbernd.com, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 9:15=E2=80=AFAM Baokun Li <libaokun@linux.alibaba.co=
m> wrote:
>
> On 2026/6/8 23:59, Joanne Koong wrote:
> > On Mon, Jun 8, 2026 at 5:14=E2=80=AFAM Baokun Li <libaokun@linux.alibab=
a.com> wrote:
> >> On 2026/6/5 05:42, Joanne Koong wrote:
> >>>>> Hi Joanne,
> >>>>>
> >>>>> If a connection abort happens while a zero-copy request is in-fligh=
t,
> >>>>> io_buffer_unregister() is never called. The buf_table slot remains
> >>>>> occupied and folios stay pinned until the io_uring ring is destroye=
d.
> >>>>>
> >>>>> So perhaps we need to add the corresponding cleanup in
> >>>>> fuse_uring_entry_teardown(). Otherwise looks good to me:
> >>>>>
> >>>>> Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
> >>>> Hi Baokun,
> >>>>
> >>>> Thanks for reviewing this series.  That's a good point - the io buff=
er
> >>>> is unregistered in fuse_uring_req_end() when a request is ended, but
> >>>> the abort code calls fuse_uring_stop_fuse_req_end(), not
> >>>> fuse_uring_req_end(). I'll add this in.
> >>> Revisiting this... I had this cleanup in the series I sent out last
> >>> December [1] but in order to accommodate unregistration on teardown
> >>> during the abort race, it requires nontrivial changes to io-uring, as
> >>> it requires operating on a ring ctx handle but it's tricky to
> >>> ascertain if the handle is valid or not. I had discussed it with Jens
> >>> at LPC last year, and we came to the conclusion that it's not worth
> >>> introducing the complexity to accommodate this specific scenario and
> >>> it's fine to leave the buffer table slot occupied with pinned folios
> >>> until the io-uring ring is destroyed.
> >> Hi Joanne,
> >>
> >> Thanks for explaining the background.
> >>
> >> I think we can handle this with a simple change in
> >> fuse_uring_entry_teardown(), without any io-uring side modifications:
> >>
> >> --- a/fs/fuse/dev_uring.c
> >> +++ b/fs/fuse/dev_uring.c
> >> @@ -514,8 +514,14 @@ static void fuse_uring_entry_teardown(struct
> >> fuse_ring_ent *ent)
> >>         ent->state =3D FRRS_RELEASED;
> >>         spin_unlock(&queue->lock);
> >>
> >> -       if (cmd)
> >> +       if (cmd) {
> >> +               if (ent->zero_copied) {
> >> +                       io_buffer_unregister(cmd, ent->zero_copy_index=
,
> >> +                                            IO_URING_F_UNLOCKED);
> >> +                       ent->zero_copied =3D false;
> > Hi Baokun,
> >
> > Unfortunately, I don't think this fires. For ents in userspace, there
> > is no cmd associated with the ent. cmds are only valid for an ent when
> > the kernel hasn't yet "returned" the cmd to userspace (this is
> > enforced in fuse_uring_send() where ent->cmd gets set to NULL). For
> > the scenario you're describing (a zero-copy request in-flight in
> > userspace when the abort hits), the ent is in FRRS_USERSPACE with
> > ent->cmd =3D=3D NULL, which means the if (cmd) guard above will skip th=
is
> > logic.
> >
> >
> Hi Joanne,
>
> You're right, I missed that. fuse_uring_send() completes the cmd
> and sets ent->cmd =3D NULL before the entry enters FRRS_USERSPACE.
> So when abort hits a zero-copied entry, cmd is already gone =E2=80=94 the
> if (cmd) guard skips the unregister entirely.
>
> The timeline is:
>
>   1. Request dispatched =E2=86=92 io_buffer_register_bvec(), zero_copied =
=3D true
>   2. fuse_uring_send() =E2=86=92 ent->cmd =3D NULL, io_uring_cmd_done()
>   3. Server doing zero-copy IO, ent in FRRS_USERSPACE, no cmd
>   4. umount -f =E2=86=92 teardown =E2=86=92 cmd =3D=3D NULL =E2=86=92 unr=
egister never fires
>
> I now understand the problem you described =E2=80=94 to unregister withou=
t
> cmd, we'd need an independent handle to the ring ctx, and ensuring
> its validity is where the complexity lies. I agree that it's not
> worth introducing that complexity for this scenario, and leaving the
> buffer table slot occupied until the ring is destroyed is a
> reasonable tradeoff.
>
> Thanks for taking the time to walk me through this.
>

No worries at all, I think this is very subtle so I will add something
about this to the commit message in v4 to make this more clear.

Thanks,
Joanne

>
> Thanks,
> Baokun
>
