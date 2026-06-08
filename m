Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D370345CAB
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 19:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780946028; cv=pass; b=dBPJ+hv8s+cZyzSzXA17CNQUFtKejH7qVsyXynOx1dublgoubnjAaCcbUGMn9uOt9DdCJ4UxR/SkIitiDxv2nbuLVb37Fu/yTfPF7Oe8qaZTfjd9jNw6vqyPWPdSGN6vStuTg4+CKTu7YmniLuhy9tZ70HGBT1BZmd5uT1FJkOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780946028; c=relaxed/simple;
	bh=hvoofYd4pRxmIJvE1bKqeI7nD4JKAaK8FOXtejNsQXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IlHklI/sN3l4m+5PTV1f5WlalVjdQwSPUmSW+GQV8LzaY1Zj29UDnaeFTWmpLuzKixxXstMeNLytSn4wuuah1T2miL6wS5KiHp7Evkn+7U5KB+5oeapZFCoc9m9HGcGPz1gSLdKU5anb9K63ojEbKAwXz6jCMd5dc0inzg36G3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFb8hktK; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFb8hktK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so31191785e9.0
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 12:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780946025; cv=none;
        d=google.com; s=arc-20240605;
        b=aLv8JfmgCIherZuQgs59t83/Qs58/nooJKtOGmqAvo36ljdOROeyGXaQ7vZyoqC/mn
         ydtszzkUKOC3kToPRa5b9pXinYJKpleub7T5q+UgyZG8RORfOzp445P2fD4m6OrNBQWu
         ZrIzRL55oE/3YcwDCpW9kXuJufevUUh/L5NjHAfRPA0A5OirktrYJ5GIrR6PZwF9gYqu
         B9Sap7ALVFHsm5wyTUwobIMXzx2790AZAbe+QySy4sfZQlNgn9xtmvwxK+AErvfyNwNj
         r1UUQUGhw3yRgQCIiTcGpDy7TFQ7Et2EIfygFhnPHt5GAgeGuCggcKaliViqKDmBvtmA
         oO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=whHnTBaTjZ9uRWQ64SUm9BvN/A4zwEJrOExu2aqDlTs=;
        fh=KC0MfVPloTgM71tAmzfhf/JASX8t3FLSglkvDOQsRnU=;
        b=LPnnlkLyTLiP2Ty/5e63qb3sAQmSpGVFpWhPOLXPDsp5BdtiMEgOmJSkUww5yI4vXV
         vZyUn8XKMRRZSKbABke+xJmGxvrwxE2zIcHru1uwR2ngonITfGm4JA/U1qCWOX2pOPOf
         c5c3ZohHnDtylZl9ocZqO/uZEz7KP4W8t2CgHQYeSpIDUrPmTTJaPya+Z/mBv0BhxXhG
         LEhglL46v1CAzBe1tB3CzNeB08iCrqIwCLbBQ7cCT0QIMg7xrvk7Ngtu1Qj/5WgmK9I6
         H1ejZ+NsLyPB7Lg3d284KtQiwoVrW6nsIKmp+W4dQACa/NMkmtAiLS2ial9WAcGY6htu
         HIKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780946025; x=1781550825; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whHnTBaTjZ9uRWQ64SUm9BvN/A4zwEJrOExu2aqDlTs=;
        b=jFb8hktK3ydMfTtXBOR0nSRVk6OaLVzafMr/wQBVKuouXuweVBK7QpJnHOi/6Stl3y
         AHOOaSNi0z5fWJ/RJk/OQ9p2/w2vOadyvzbWQXSpALAiGBpGbtrAMJpmOstveC0f3aZP
         P9n2aFbek7aJbeiHbMAXUQrvZzrIfXnaoJsVu3oAL0dyT8y+bJtrkPIJ2RR1z+keCVM6
         W7vn/wkLyTYbZv/Gt/Iuz8nTcDyI7HVsRLUUZdF1DPfXfi+AEu4IF+V1ahtuuuUC6KN7
         PUHbCgixD1XCSfuGWPl1D5wzfFQMya/JCFSnr+ChIXZXmDgbv6cVABBO5ChcXYpo4T82
         0Ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780946025; x=1781550825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=whHnTBaTjZ9uRWQ64SUm9BvN/A4zwEJrOExu2aqDlTs=;
        b=GKU0LKWJUX5gpB7bkQ8BFf34kb+XQplSGgC15HesuqS72xLffTX9dkSu4YVmpvvK33
         BzkEduZ004xTOR9SmHtc12E5mzVhRvpq+9sKXSPHjnQBb5ReYzvuQAY/JeYyJc5cBugo
         clWrU/3feGI22jUhObhVxEqAOwA1kfvz99FD+glxqz1WIejBRCACbZneJX5D1loboEqf
         8urZMAKY/WqV49zFiOiFEJDplzVtOvqrw0iC3ggY4W59mO7EVwrRGsTtbWEyqZQCrpOC
         Y5ldkacA+NmoiLxaCqGzV+YzHlqsORucIkvULv6MGJ9pRkTRwpd241EIVg0Qea43wgCo
         cmVw==
X-Gm-Message-State: AOJu0YyuOeRbKuF2C2qjG9qAoaGfKlnvMc0Qfs5d6LmhWefDNaPxswgx
	LkeamquPjszfh+n60YeErIlQh1IvvWXuc8Gsq+HG3zWk5mBkQIeg0jvchE1UQQlIrVGGRI0hZOr
	nM6DccECk+Oqt6Ce/zlBm0CBH9+o8SyU=
X-Gm-Gg: Acq92OH8SWlyghUfClUU17w7ECweSGt+BTwhR8Qk8SHAn4EeC2SXj9Zbld2r554RTPn
	roY+yjLWH7PVY9UOA55az+0GcOero5vaboy7Y8uzfAnxnJ+WRg8SwxsvflmrsCP3IWab5Ttf55q
	nfzpkYpZFTn+f7GduxSfg493bLlIGxkeGWAawpueeYXtFHND9u8zM/ZepXiC0oWA7K263/kEL3R
	KgsphM+R7aKPkH5d5h+A+mMlDV3A/6F88Xeo6EXbhwSy49RLVxDKO4IVryN/XP8jIUVnujOnY1c
	vmyIe1x7GJkB8dkZZmH9EhiyHtU=
X-Received: by 2002:a05:600c:818c:b0:490:6237:521d with SMTP id
 5b1f17b1804b1-490c25b3ca5mr296981505e9.13.1780946025518; Mon, 08 Jun 2026
 12:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516021138.2759874-1-joannelkoong@gmail.com>
 <20260516021138.2759874-4-joannelkoong@gmail.com> <CAJnrk1bPQczAmaKkGOKAnKBb-FDb1Exmn1r_=HLPkJnKqd3T+w@mail.gmail.com>
In-Reply-To: <CAJnrk1bPQczAmaKkGOKAnKBb-FDb1Exmn1r_=HLPkJnKqd3T+w@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 8 Jun 2026 12:13:34 -0700
X-Gm-Features: AVVi8Cd0a2Q5GI2g-h6iKrtTSw_EFc0PI4RXNNwZ67PCmX0jhpiqZ9nMSkMZWP8
Message-ID: <CAJnrk1Ywp2rP-q7y1rmw2qCtAtJT7Un=weZXa15LtNtRSMuf_A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fuse: fix moving cancelled entry to
 ent_in_userspace list
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev, bernd@bsbernd.com, ali@ddn.com, 
	horst@birthelmer.de, Heechan Kang <gganji11@naver.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 11:59=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Fri, May 15, 2026 at 7:12=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > fuse_uring_cancel() moves entries that are available (these have no req=
s
> > attached) to the ent_in_userspace list. ent_list_request_expired()
> > checks the first entry on ent_in_userspace and dereferences
> > ent->fuse_req unconditionally, which will crash on a cancelled entry
> > that was moved to this list.
> >
> > Fix this by freeing the entry and dropping queue_refs directly in
> > fuse_uring_cancel(). This is safe because cancel is the cancel handler
> > itself - after io_uring_cmd_done(), no more cancels will be dispatched
> > for this command, and teardown serializes with cancel via queue->lock.
> >
> > Since cancel now decrements queue_refs, fuse_uring_abort() must no
> > longer gate fuse_uring_abort_end_requests() on queue_refs > 0, as
> > cancelled entries may have already dropped queue_refs while requests ar=
e
> > still queued. Remove the gate so abort always flushes requests and stop=
s
> > queues.
> >
> > Reported-by: Heechan Kang <gganji11@naver.com>
> > Tested-by: Heechan Kang <gganji11@naver.com>
> > Fixes: 4fea593e625c ("fuse: optimize over-io-uring request expiration c=
heck")
> > Cc: stable@vger.kernel.org
> > Co-developed-by: Jian Huang Li <ali@ddn.com>
> > Co-developed-by: Horst Birthelmer <horst@birthelmer.de>
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

I added co-developed-by tags because I wanted to give attribution to
the discussion we had in [1] but checkpatch flags this for not having
signed-off-bys. I'll submit a v3 that changes these to Suggested-by.

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/adiiTGjP1tqZfIrI@fedora/

>
> Bernd added his Reviewed-by to this as well [1], but had accidentally
> added it to v1 instead of this v2 series, but this patch is identical
> for both series.
>
> Thanks,
> Joanne
>
> [1] https://lore.kernel.org/all/e55945b3-99a1-40b3-a145-b4867053930e@bsbe=
rnd.com/
>
> > ---
> >  fs/fuse/dev_uring.c   | 6 ++++--
> >  fs/fuse/dev_uring_i.h | 6 +++---
> >  2 files changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index d9108b5b5db8..f4ba64a1796a 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -511,8 +511,7 @@ static void fuse_uring_cancel(struct io_uring_cmd *=
cmd,
> >         queue =3D ent->queue;
> >         spin_lock(&queue->lock);
> >         if (ent->state =3D=3D FRRS_AVAILABLE) {
> > -               ent->state =3D FRRS_USERSPACE;
> > -               list_move_tail(&ent->list, &queue->ent_in_userspace);
> > +               list_del_init(&ent->list);
> >                 need_cmd_done =3D true;
> >                 ent->cmd =3D NULL;
> >         }
> > @@ -521,6 +520,9 @@ static void fuse_uring_cancel(struct io_uring_cmd *=
cmd,
> >         if (need_cmd_done) {
> >                 /* no queue lock to avoid lock order issues */
> >                 io_uring_cmd_done(cmd, -ENOTCONN, issue_flags);
> > +               kfree(ent);
> > +               if (atomic_dec_and_test(&queue->ring->queue_refs))
> > +                       wake_up_all(&queue->ring->stop_waitq);
> >         }
> >  }
> >
> > diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
> > index 368f4d0790eb..22ec67e39ee0 100644
> > --- a/fs/fuse/dev_uring_i.h
> > +++ b/fs/fuse/dev_uring_i.h
> > @@ -150,10 +150,10 @@ static inline void fuse_uring_abort(struct fuse_c=
han *fch)
> >         if (ring =3D=3D NULL)
> >                 return;
> >
> > -       if (atomic_read(&ring->queue_refs) > 0) {
> > -               fuse_uring_abort_end_requests(ring);
> > +       fuse_uring_abort_end_requests(ring);
> > +
> > +       if (atomic_read(&ring->queue_refs) > 0)
> >                 fuse_uring_stop_queues(ring);
> > -       }
> >  }
> >
> >  static inline void fuse_uring_wait_stopped_queues(struct fuse_chan *fc=
h)
> > --
> > 2.52.0
> >
