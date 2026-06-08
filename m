Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20D03D1A82
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 16:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780937197; cv=pass; b=QqiGjjmDeVxUFkc7Anob0zgKs6UgNeJ4VZQfzu0kSxn6Rjt8V8MTy5K2nwMao9U4ACInBCnLFNy/CCm3iwAsfeTRZg4NjMQKFa43GiRMSgMkNY0o9TvyUp7E0LYKDa2SmcrAf4UwjcGOc3iWWQIFPl4hQjCHaOobxJ1xK1sm4IA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780937197; c=relaxed/simple;
	bh=Aei7+3M7OS2MalnvLV5efs8dT2ETEaZ+AJbk7E4XM8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDZTX0/5ymT/FXIUoWAHGAA6fbKcSZTQdz9IU3IakCp+uhsdv8PJHavZJzfoRIfUjWFj+nZvpBs7fEr+spbt32QqcXO/a4z6Vz/u5tWqExxOnnu0iXVR28mJsz9RrnFKJ+iX5DqV0LJF+B71ONuI8/U4wuXxzaWvFKuDTsBSJxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cASs7jIm; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cASs7jIm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490af320e2aso50942135e9.2
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 09:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780937191; cv=none;
        d=google.com; s=arc-20240605;
        b=T5Xk17m9Az92Fj+0tIx+0jm/SW3jbkWqyfnlxwjN0Heuz3KmNeOlJtgwEj1X/GNu42
         rcfh1H9FTySmXDuWl+a2AB0ZzYik0NZNmL8cLAHbqLV+OAJn9vAbDt0o2sQQDNOYM62z
         nJ9ZK2uU3ZEYmrzAt8ViuHkUWSgYnir1LoY7rJGgypz2GR20PACJdvFZ+8vrj+C6wiMy
         GnLr9ZiMA2SAmSaFIngNjdcW14Ph+1dDOeLLO7etdWB0L9na3VQO67jJzDJIYSdRrgxI
         bHcVXmwE+c5It2Yc8ew01Neg3UpGA+XCVJByzDJjUjq4LF8K7JqojR75KY/wt0SOyqTB
         6cLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+X3fJ+9WnGjPOr2VJBWEjvlIwpcfv/0FYoyWzfs6bb8=;
        fh=rjMx5FSqBTL4O+j/RKqKMH1LudtCrXCAhCbCtvb4W48=;
        b=JnmWo0uV/aiqyKe9xNnPWe3+MPZ5+foYjZeYbyj9YLK95ygHqYGz7+R9Axxn9ASZyA
         58osJT5pfhk40ud5iQNrOydZe3Pn09u8Xao+riLWa6rSFRnN8kddKE9wRqC0TUNO4TOF
         PuEkUOB1o+9Mgzkx3fJsin3cVQhElEQw8JQkcLec4H66aLbCuZpjtnBG9npuU9zVc3c7
         JTeITiJwFRvB7bP0VgjBuUUMqg7wMiJ63I+KgHMym/kI0zAcR0JER/znJKyiiuAU5ZfH
         HONyKdqFeNejE4gzGmLs4c8bdjpqsp3zAFWg5IVOk+FhykmS0u9iRpMWdVjxA62LThma
         4l8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780937191; x=1781541991; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+X3fJ+9WnGjPOr2VJBWEjvlIwpcfv/0FYoyWzfs6bb8=;
        b=cASs7jIm29dJL1iizHa5vFIaePUevHJ3jnl9RAK+6ixYJOHMWRfg4jbYAB68F8bcK8
         vfwIyVIhsboOsNmA6kuCTv7dAasnai3hbQiW0glsJu/GgKxGIdxr9ItSylYonsqPrRqZ
         XOL0Aw4CmDi1T/toH9SRlqjnb1agStMIHDXwxTCiSBmQrKOx/2Q0uDegL/rc1ESApp+Q
         aSwCrSsJ7NXGcOqjFlx+MIcP9CojYMIY3I8it5koxYAK55HHlH4o1XGYSRIEOvcumW9M
         HyEDYpRP2ycijSmRk0lYiZTYAgfBTiRa0DmQ9Lwae8kZFcPbwS920l4v0zMCNAMBMNhW
         aMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780937191; x=1781541991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+X3fJ+9WnGjPOr2VJBWEjvlIwpcfv/0FYoyWzfs6bb8=;
        b=d99s3w/6ZNWOyLi93dLp9VTVOCxg6tws1ogi9/9x/y4bJ1RD+7iQC+ZK/zPV0XwjdW
         gxaAnu4MWoVBU9UPJNpPVOXSuxTXmSqh+f+b/bYwuKxE4FmDSOLqIOWfSn5i4tXSK0aG
         Z7MYXSkKflercMWMizeTYHvtMOAsYxk0UzLB0TasjrRSENLG7Yeb609a0M6H19LPjVPB
         zf8XckP3w/mT7lUdsoLTofKDaBpGVIKN5OuClBb+g2l9BAZze9KRPweK0yOnJYlV9tbm
         WjQoRibGjzArhc/S9ORkCTuvnqLCN2PioNWfUsYRuUUIONnAJTGP16VJaxdowVl5X8X1
         RZOw==
X-Forwarded-Encrypted: i=1; AFNElJ/W3fl729WoyliZpJ6HuBjdQ6s3g/Ylk4U3pTE6JIlim5R0nKRpk0888rT9CZSWmD079KaXScAtHBmD@lists.linux.dev
X-Gm-Message-State: AOJu0YxC1C/mBmT05zzWCDCo2JL0CUzmQXHJe7TvPCOwMHHcfD281zYs
	GXzo9cWMscfMvmLklxS3k1LVbBjdrEFp02Zlu56EeYunTlt2sOlMLmbbyMacOKSw1DjnZ5ydhEP
	8ByIszWkzOPOhnRo5HqGlSIyDTDU5UVs=
X-Gm-Gg: Acq92OFXtI1EHVA5Dn7uk4QN8FxXS/yCrby9aHvgPQy11emvPTkn/wwrbSyJdJnvS9N
	odVSA28rM5aYq1t81iYP+4ws8KAqG/JTJCBhRC3pAvpqTCWJCS+9minIKm323oZuwsObxZvxCva
	HcNyLW9NqOyxCbqaY1oPn3tlOAAAZ2NFzRFsXRmoKE/ke7NHPjteHJZlbaPJx0JMIlOtUrsBQpQ
	lptIZ0xOghOmtlMYLME2p3k/B2ztTBop6z2OIRn8h9QjOc1qpBXOP868ZwLdyJTh8khdRxq8fRB
	jF+YTHPFflWlNVoE9Gjy9+otV0E=
X-Received: by 2002:a05:600c:35d4:b0:490:b8d3:5dcc with SMTP id
 5b1f17b1804b1-490c25e4634mr278897665e9.19.1780937190891; Mon, 08 Jun 2026
 09:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260605192708.141921-1-joannelkoong@gmail.com>
 <20260605192708.141921-4-joannelkoong@gmail.com> <058fd2d4-3ba4-46e5-9107-3a7e0ab66653@bsbernd.com>
 <CAJnrk1YHQEtpwA-ForFWXsLntc950ekqAHg=L9VExVfJ2WF1Rw@mail.gmail.com> <742e68e6-c456-4655-a441-aaa8267f1a48@bsbernd.com>
In-Reply-To: <742e68e6-c456-4655-a441-aaa8267f1a48@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 8 Jun 2026 09:46:19 -0700
X-Gm-Features: AVVi8CcHW1wKDIqiTm2CslN6JixDpNiU105hbDeu8QQXU2KJUws3g1EbCoD1ldk
Message-ID: <CAJnrk1bz=BHryaWkZ0uBCpzLoVM-FSsb4mhA8F7+fnMQ4Tt_YQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] fuse: end fuse_req on io-uring cancel task work
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, Chris Mason <clm@meta.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 12:41=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
> On 6/6/26 01:52, Joanne Koong wrote:
> > On Fri, Jun 5, 2026 at 3:09=E2=80=AFPM Bernd Schubert <bernd@bsbernd.co=
m> wrote:
> >>
> >>
> >>
> >> On 6/5/26 21:27, Joanne Koong wrote:
> >>> From: Chris Mason <clm@meta.com>
> >>>
> >>> When io_uring delivers task work with tw.cancel set (PF_EXITING,
> >>> PF_KTHREAD fallback, or percpu_ref_is_dying on the ring context),
> >>> fuse_uring_send_in_task() takes the cancel branch, assigns
> >>> -ECANCELED, and falls through to fuse_uring_send(). That path only
> >>> flips the entry to FRRS_USERSPACE and completes the io_uring cmd;
> >>> it never discharges the ring entry's owning reference to the
> >>> fuse_req that fuse_uring_add_req_to_ring_ent() handed it at
> >>> dispatch time.
> >>>
> >>>     fuse_uring_send_in_task()
> >>>       tw.cancel =3D=3D true
> >>>         err =3D -ECANCELED
> >>>       fuse_uring_send(ent, cmd, err, issue_flags)
> >>>         ent->state =3D FRRS_USERSPACE
> >>>         list_move(&ent->list, &queue->ent_in_userspace)
> >>>         ent->cmd =3D NULL
> >>>         io_uring_cmd_done(-ECANCELED)
> >>>         /* ent->fuse_req still set, req still hashed */
> >>>
> >>> The fuse_req stays linked on fpq->processing[hash] and
> >>> fuse_request_end() is never invoked. The originating syscall
> >>> thread blocks in D-state in request_wait_answer() until
> >>> fuse_abort_conn() runs, which can be the entire connection
> >>> lifetime. For FR_BACKGROUND requests fc->num_background is never
> >>> decremented either, so repeated cancels inflate the counter until
> >>> max_background is hit and all later background ops stall.
> >>>
> >>> The non-cancel error branch already handles this correctly: when
> >>> fuse_uring_prepare_send() fails it calls fuse_uring_req_end()
> >>> before fuse_uring_send(). The cancel branch must do the same.
> >>>
> >>> Fix by calling fuse_uring_req_end(ent, req, err) in the cancel
> >>> branch before falling through to fuse_uring_send().
> >>>
> >>> Fixes: c2c9af9a0b13 ("fuse: Allow to queue fg requests through io-uri=
ng")
> >>> Cc: stable@vger.kernel.org
> >>> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> >>> Assisted-by: kres:claude-opus-4-7
> >>> Signed-off-by: Chris Mason <clm@meta.com>
> >>> ---
> >>>  fs/fuse/dev_uring.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> >>> index 7cd50990b097..b5cc700575ca 100644
> >>> --- a/fs/fuse/dev_uring.c
> >>> +++ b/fs/fuse/dev_uring.c
> >>> @@ -1222,6 +1222,7 @@ static void fuse_uring_send_in_task(struct io_t=
w_req tw_req, io_tw_token_t tw)
> >>>               }
> >>>       } else {
> >>>               err =3D -ECANCELED;
> >>> +             fuse_uring_req_end(ent, ent->fuse_req, err);
> >>>       }
> >>>
> >>>       fuse_uring_send(ent, cmd, err, issue_flags);
> >>
> >> I think that can race with fuse_uring_stop_queues(), which leaves us t=
wo
> >
> > Hmm, I don't think this races with fuse_uring_stop_queues() as
> > ent->state here is still FRRS_FUSE_REQ and fuse_uring_send_in_task()
> > can only be called for a registered fuse ent, which means the ent has
> > already grabbed the queue refcount which will trigger the async
> > teardown worker to run in the background during abort until the ent is
> > reclaimed. I think this adds a race though with the request expiration
> > checking logic which (a) fixed, so I think you're right that we'll
> > probably need the same cleanup here. I'll look at this early next week
> > and send a v2.
> >
>
> Right, actually no race at all, just a plain use-after-free, because the
> entry is set to FRRS_USERSPACE and then cleaned up during connection
> abort and then released again through fuse_uring_queues or
> fuse_uring_async_stop_queues.
>
> I actually do not get this part of the commit message
>
> > When io_uring delivers task work with tw.cancel set (PF_EXITING,
> > PF_KTHREAD fallback, or percpu_ref_is_dying on the ring context),
> > fuse_uring_send_in_task() takes the cancel branch, assigns
> > -ECANCELED, and falls through to fuse_uring_send(). That path only
> > flips the entry to FRRS_USERSPACE and completes the io_uring cmd;
> > it never discharges the ring entry's owning reference to the
> > fuse_req that fuse_uring_add_req_to_ring_ent() handed it at
>
> A mean exit does not trigger fuse_dev_release() with a fuse_abort_conn()
> from that function?

I don't think tw.cancel implies a connection abort. tw.cancel gets set
on io_uring task death or ring death which is different from fuse
connection death (eg a single worker thread of a multithreaded daemon
exiting doesn't drop any ref on /dev/fuse fd, but that thread's
in-flight task work still drains with tw.cancel)

>
> I do not think we need 3/3 at all.

I think this is needed for the cases where tw.cancel occurs without a
subsequent fuse abort, else the application syscall thread is stuck
uninterruptibly in D-state in request_wait_answer() for the
connection's lifetime. tw.cancel with a fuse abort is the common case,
but I think unfortunately we also need to handle the case where this
doesn't occur.

Thanks,
Joanne
>
>
> Thanks,
> Bernd
