Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4000137F8D3
	for <fuse-devel@lists.linux.dev>; Mon, 13 Apr 2026 15:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776095831; cv=pass; b=odTYAGjXVYnA1uWbiN30SeK+oePyuYOL4kDmfy2cu0h8f5o0q62hxb9EPTozlf6uwqx+vKttoAASH1E2fQm01UXF3++hKrNQl4O7XScwKgRYpZNuthcM0fkFch0h6WSFmAguSWUUynz7K11YLSe/BDwE/o4axgkR4k884vAJvBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776095831; c=relaxed/simple;
	bh=uCKT3mDcBLIjf8+Wa0Yr7vV5tltP+TxZuHAJOqsVuZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HgzeJ/aGA1u3bDXmdw6vIFcR2UI21Ct1D8N4LoJEY4XvknJkVT5mEfEewaAOaeKqjyd2mZAsRN2i5OIBgGCiawCZWbnswz55VUWGqXOeSPgu13oo9Aa/aCfJaW9xgNamEMQF+IZLmpDN5FXHt+uWfggq1rvONb9l9jAovrcZWgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wo2uHvOX; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wo2uHvOX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so61795825e9.0
        for <fuse-devel@lists.linux.dev>; Mon, 13 Apr 2026 08:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776095828; cv=none;
        d=google.com; s=arc-20240605;
        b=V17ZvnsQDwNWigqBQeR4W4Q5pEcRhzDhiP/Ju8OtXlVmX8cbZcU0/X3whfZJl+ueOj
         qKtDa0Ha1FTIIVAi4ItPtKBjHhNDlBlDPRTesMfiydtK8b6Po8FNYVBOg67/iY3GjyEq
         oXXHTII6u7zb1AVzVbsGbd05acQ81Um/chWUavDLCb4eOOg2NcFg/MSyJzHxVd9m0wdY
         cdPSa6Ztm3R7W7BaGVBfv09mJ31M/zw+CaMOhi8H63ndNq8hnbj71IVY2lW3KCRKVJnc
         okjyI6hxpKtQ1vdXiAePK1QaTESXKkujfsMJASKYqJdQYEAnm5AQ1sfaUcBddEZCRY9S
         I0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lLY/V59tkdL3GjoxouNe5fdjlq2HK/DPMs0km7foI4M=;
        fh=KYmn46FQPov+MEagLUovNcyNApUxWwItN/bsXM6HtLU=;
        b=LekdxFEdaSJcA9tiWKK/xx/RFyUDsAISHpYCLqFQZLIYs/G5E3tzs3EMpu+wrPzQ5s
         XGnhyQxyTQpNhkwLvR/tUW6xUUBbMd3maJAryK8PicMNrgJHYPeQ3wOzsSJ0mMCeUK0t
         /TeUHnMDt53hn/b/lf97Sqi2YD8ATT+g4mQGyt89eiJy7QoKmLs5HL3/uw+iM+H188Mr
         wj1BFEG4u+05iV4MUXh2SU6W3uZeMvIuzkj8EQ3f4U1LnbDqF7Df86CY2/n8CltSCflw
         hNGNxrQkAm3gERsY76Tz3jeryvr9felycjOXz4Y4Dg5j+/Ow49prG0zXF6efcjmTbBca
         vxxA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776095828; x=1776700628; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLY/V59tkdL3GjoxouNe5fdjlq2HK/DPMs0km7foI4M=;
        b=Wo2uHvOXOH8I64OSslKWuvTu9S2CdFhu2oId0Y8YY+n2Vu3TdGI2uyIz8FmWCm72ow
         rloQTVy/BUm4mDewD2cTWs0oT1oj1S4nhJnZiR65VhnbIzblKn7SsMXNqV9h5tTbtiY1
         sgheZKS5jRy29/CwI1mWyJuM9scO6QBdmZAT434cWBxJKw79S7NsDWEQdaoL1it5Jn8X
         4nQsaOqRtHGw1sJj8KbRmRAJCA66TvIhKUPvSzR69HZmpIedjnIwy2eSYjHFDdNc/Zid
         gVSMf9FRc2F+1SMoGsB5gdhzWW2Pwd9E9kRjYTwKFBNGqDVzhJLAuzy6nY78bIsaKtUR
         jQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776095828; x=1776700628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lLY/V59tkdL3GjoxouNe5fdjlq2HK/DPMs0km7foI4M=;
        b=jUMb4rwExO5f4I2qHwGiLm4iTwU9A44XLv+XUaxk6M648qkzTt+/Uwk0qntXs34umb
         GZXzOhQV6rVESA6VCYUuAMTZ5O0/pFNou+0BxmVOi8D+V9oVcHzvTUmiHl3E8ldPjf0s
         aplTpWYMMuYeb9Rs+dGbC8IUiwfAISx9ExpFLe04Zrb6+6kztErdi39v3leedjiCEDuK
         lkE36u4EMxvTvz2TL6JEd9O8AE7lD1eVoHttTVz38WohfXtRW7noH7FtTIaEWoKAh/B9
         itUHDY97xT7dfEfdhNVDqFz4EQymYkWSxmXg4xcjQw4PAHeazCHRb69g8TkaBPmaODzh
         9S5w==
X-Forwarded-Encrypted: i=1; AFNElJ9rA6sCLzqwwvOmzAk0XF1l3WmIHvEI9qYGLZOKJBQ+llt+u3bk9ob4wRGSPCL7e/xz/rOMx5ZoP1Ck@lists.linux.dev
X-Gm-Message-State: AOJu0YxBsj94JCNAueFSuuAIV+2l0SCYmRyjcTiXdhWvDVw6aQMlRPSK
	4el3tjmUAwlBLwe/MpgwEmhIY/yBoTBQ6KV132nqHHD7cgamrbhPs6yYjtJmwLtzZWC0mPT4o1N
	SP/E4dISKGwrQaPA7oew66VM1dHw3Yqo=
X-Gm-Gg: AeBDiesPILiOfhIXjNojinjRJ5EH52VXWvUmKVYBPDBdZGTgQBKZkexVOxm4+KBKdmE
	GwAIukYnvbzhVzlo1up0d+25F2Hd5RJfO1cKxS0PJTZgbH9drDOZ/aGrPKZGPTy1MP6EJDvYfFY
	CQ1En9TYuxWQ4MLkniH+hLe4g6RlvPBl4T/txeAbzPzFe7hmBcsfIv6gXmgWGYjZaVjvhMYN4O/
	UdbL31lRRipclmrxb7ZNJydxuR+gmwodlUWiPbkf4C/iUPkIoWwqgROuiAJFMf3YZaDuQjD+3Mj
	9sGxSS0/Vm5dV/NH
X-Received: by 2002:a05:600c:820a:b0:488:81b1:ae36 with SMTP id
 5b1f17b1804b1-488d688688fmr191294365e9.23.1776095827255; Mon, 13 Apr 2026
 08:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251021-io-uring-fixes-cancel-mem-leak-v1-0-26b78b2c973c@ddn.com>
 <4b5a8040-b62c-4d75-a474-70d0b4759461@bsbernd.com> <CAJnrk1ZohxcDERszbii8ZM0g1ZzTwk6+wEqRWpCoSwBXzgavkg@mail.gmail.com>
 <3eabbc7b-010f-4d4c-9145-30d69fe1aa79@bsbernd.com> <CAJnrk1aoxGMGNZi+OwdoET6ahhGHp_7dw__=dmOWW+PMxnsj2w@mail.gmail.com>
 <adlyjDaxLZyHcSun@fedora> <CAJnrk1Yb2ABBKFK=KMaU+W10FNazt+h93P445i1USXcN2W45Xw@mail.gmail.com>
 <f27651af-e5c0-4c3e-8baa-fa2d7232cb4d@bsbernd.com>
In-Reply-To: <f27651af-e5c0-4c3e-8baa-fa2d7232cb4d@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 13 Apr 2026 08:56:54 -0700
X-Gm-Features: AQROBzCQB5LUKidCfDKTOcAMORMn7yCvE_iIjd42P_3YuhwAl8rp2gTfh_3ajVM
Message-ID: <CAJnrk1YPrPXN74fgesg1dbqJJsmjPOJ_My_mYMUevJfSrmrECg@mail.gmail.com>
Subject: Re: [PATCH 0/2] fuse: Fix possible memleak at startup with immediate teardown
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Horst Birthelmer <horst@birthelmer.de>, Bernd Schubert <bschubert@ddn.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org, 
	Jian Huang Li <ali@ddn.com>, stable@vger.kernel.org, 
	Horst Birthelmer <hbirthelmer@ddn.com>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 12:22=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com>=
 wrote:
>
>
>
> On 4/11/26 20:11, Joanne Koong wrote:
> > On Fri, Apr 10, 2026 at 3:08=E2=80=AFPM Horst Birthelmer <horst@birthel=
mer.de> wrote:
> >>
> >> On Fri, Apr 10, 2026 at 02:24:08PM -0700, Joanne Koong wrote:
> >>> On Fri, Apr 10, 2026 at 4:26=E2=80=AFAM Bernd Schubert <bernd@bsbernd=
.com> wrote:
> >>>>
> >>> Hi Bernd,
> >>>
> >>>> Hi Joanne,
> >>>>
> >>>> On 4/10/26 01:09, Joanne Koong wrote:
> >>>>> On Thu, Apr 9, 2026 at 4:02=E2=80=AFAM Bernd Schubert <bernd@bsbern=
d.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 10/21/25 23:33, Bernd Schubert wrote:
> >>>>>>> Do not merge yet, the current series has not been tested yet.
> >>>>>>
> >>>>>> I'm glad that that I was hesitating to apply it, the DDN branch ha=
d it
> >>>>>> for ages and this patch actually introduced a possible fc->num_wai=
ting
> >>>>>> issue, because fc->uring->queue_refs might go down to 0 though
> >>>>>> fuse_uring_cancel() and then fuse_uring_abort() would never stop a=
nd
> >>>>>> flush the queues without another addition.
> >>>>>>
> >>>>>
> >>>>> Hi Bernd and Jian,
> >>>>>
> >>>>> For some reason the "[PATCH 2/2] fs/fuse: fix potential memory leak
> >>>>> from fuse_uring_cancel" email was never delivered to my inbox, so I=
 am
> >>>>> just going to write my reply to that patch here instead, hope that'=
s
> >>>>> ok.
> >>>>>
> >>>>> Just to summarize, the race is that during unmount, fuse_abort() ->
> >>>>> fuse_uring_abort() -> ... -> fuse_uring_teardown_entries() -> ... -=
>
> >>>>> fuse_uring_entry_teardown() gets run but there may still be sqes th=
at
> >>>>> are being registered, which results in new ents that are created (a=
nd
> >>>>> leaked) after the teardown logic has finished and the queues are
> >>>>> stopped/dead. The async teardown work (fuse_uring_async_stop_queues=
())
> >>>>> never gets scheduled because at the time of teardown, queue->refs i=
s 0
> >>>>> as those sqes have not fully created the ents and grabbed refs yet.
> >>>>> fuse_uring_destruct() runs during unmount, but this doesn't clean u=
p
> >>>>> the created ents because those registered ents got put on the
> >>>>> ent_in_userspace list which fuse_uring_destruct() doesn't go throug=
h
> >>>>> to free, resulting in those ents being leaked.
> >>>>>
> >>>>> The root cause of the race is that ents are being registered even w=
hen
> >>>>> the queue is already stopped/dead. I think if we at registration ti=
me
> >>>>> check the queue state before calling fuse_uring_prepare_cancel(), w=
e
> >>>>> eliminate the race altogether. If we see that the abort path has
> >>>>> already triggered (eg queue->stopped =3D=3D true), we manually free=
 the
> >>>>> ent and return an error instead of adding it to a list, eg
> >>>>>
> >>>>> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> >>>>> index d88a0c05434a..351c19150aae 100644
> >>>>> --- a/fs/fuse/dev_uring.c
> >>>>> +++ b/fs/fuse/dev_uring.c
> >>>>> @@ -969,7 +969,7 @@ static bool is_ring_ready(struct fuse_ring *rin=
g,
> >>>>> int current_qid)
> >>>>>  /*
> >>>>>   * fuse_uring_req_fetch command handling
> >>>>>   */
> >>>>> -static void fuse_uring_do_register(struct fuse_ring_ent *ent,
> >>>>> +static int fuse_uring_do_register(struct fuse_ring_ent *ent,
> >>>>>                                    struct io_uring_cmd *cmd,
> >>>>>                                    unsigned int issue_flags)
> >>>>>  {
> >>>>> @@ -978,6 +978,16 @@ static void fuse_uring_do_register(struct
> >>>>> fuse_ring_ent *ent,
> >>>>>         struct fuse_conn *fc =3D ring->fc;
> >>>>>         struct fuse_iqueue *fiq =3D &fc->iq;
> >>>>>
> >>>>> +       spin_lock(&queue->lock);
> >>>>> +       /* abort teardown path is running or has run */
> >>>>> +       if (queue->stopped) {
> >>>>> +               spin_unlock(&queue->lock);
> >>>>> +               atomic_dec(&ring->queue_refs);
> >>>>> +               kfree(ent);
> >>>>> +               return -ECONNABORTED;
> >>>>> +       }
> >>>>> +       spin_unlock(&queue->lock);
> >>>>> +
> >>>>>         fuse_uring_prepare_cancel(cmd, issue_flags, ent);
> >>>>>
> >>>>>         spin_lock(&queue->lock);
> >>>>> @@ -994,6 +1004,7 @@ static void fuse_uring_do_register(struct
> >>>>> fuse_ring_ent *ent,
> >>>>>                         wake_up_all(&fc->blocked_waitq);
> >>>>>                 }
> >>>>>         }
> >>>>> +       return 0;
> >>>>>  }
> >>>>>
> >>>>>  /*
> >>>>> @@ -1109,9 +1120,7 @@ static int fuse_uring_register(struct io_urin=
g_cmd *cmd,
> >>>>>         if (IS_ERR(ent))
> >>>>>                 return PTR_ERR(ent);
> >>>>>
> >>>>> -       fuse_uring_do_register(ent, cmd, issue_flags);
> >>>>> -
> >>>>> -       return 0;
> >>>>> +       return fuse_uring_do_register(ent, cmd, issue_flags);
> >>>>>  }
> >>>>>
> >>>>> There's the scenario where the abort path's "queue->stopped =3D tru=
e"
> >>>>> gets set right between when we drop the queue lock and before we ca=
ll
> >>>>> fuse_uring_prepare_cancel(), but the fuse_uring_create_ring_ent()
> >>>>> logic that was called before fuse_uring_do_register() has already
> >>>>> grabbed the ref on ring->queue_refs, which means in the abort path,
> >>>>> the async teardown (fuse_uring_async_stop_queues()) work is guarant=
eed
> >>>>> to run and clean up / free the entry.
> >>>>
> >>>>
> >>>> I don't think your changes are needed, it should be handled by
> >>>> IO_URING_F_CANCEL -> fuse_uring_cancel(). That is exactly where the
> >>>> initial leak was - these commands came after abort and
> >>>> fuse_uring_cancel() in linux upstream then puts the entries onto the
> >>>> &queue->ent_in_userspace list.
> >>>
> >>> I think there are still races if we handle it in fuse_uring_cancel()
> >>> that still leak the ent, eg even with the fuse_uring_abort()
> >>> queue_refs gating taken out in the original (jian's) patch:
> >>> * thread A: fuse_uring_register() ->fuse_uring_create_ring_ent() ->
> >>> kzalloc, sets up the entry but hasn't called
> >>> atomic_inc(&ring->queue_refs) yet
> >>>   concurrently on another thread, thread B: fuse_uring_cancel()
> >>> ->fuse_uring_entry_teardown() ->
> >>> atomic_dec_return(&queue->ring->queue_refs) -> brings queue_refs down
> >>> to 0
> >>>   At this instant, queue_Refs =3D=3D 0. fuse_uring_stop_queues() ->
> >>> teardown entries (nothing left) -> checks "if
> >>> atomic_read(&ring->queue_refs) > 0", sees this is false, and skips
> >>> scheduling any async teardown work
> >>>   thread A calls atomic_inc(&ring->queue_refs) for the new ent,
> >>> queue_refs is now 1, the ent is now placed on the ent_avail_queue, bu=
t
> >>> it's never torn down.
> >>>   the ent is leaked and there's also a hang now when we hit
> >>> fuse_uring_wait_stopped_queues() -> fuse_uring_wait_stopped_queues()
> >>> where it sleeps and is never woken since it's waiting for queue refs
> >>> to drop to 0
> >>>
> >>> imo, the change proposed in my last message is more robust and handle=
s
> >>> this case since it guarantees the async teardown worker will be
> >>> running (since it does the queue state check after the ent has grabbe=
d
> >>> the queue ref).
> >>
> >> Ok so you rely on the fact that fuse_abort_conn() will call
> >> fuse_uring_abort() and that sets queue->stopped.
> >> This could work, but I would still remove the check for
> >> queue_refs > 0 in fuse_uring_abort(), since it just complicates things
> >> for no real reason.
> >>
> >>>
> >>> btw, there's also another (separate) race, which neither of our
> >>> approaches solve lol. This is the situation where fuse_uring_cancel()
> >>> runs right after we call fuse_uring_prepare_cancel() in
> >>> fuse_uring_do_register() but before we have set the ent state to
> >>> FRRS_AVAILABLE. The ent gets leaked and continues to be used even
> >>> though it's canceled, which may lead to use-after-frees. This probabl=
y
> >>> requires a separate fix, I haven't had time to look much at it yet.
> >>> Maybe Horst or Jian has looked at this?
> >>>
> >> Interesting scenario ... haven't seen that one so far.
> >
> > Looking at the io-uring code for how cancels are handled
> > (io_uring_try_cancel_uring_cmd()), I was wrong in my prevoius message
> > about these two races. io-uring already serializes this for us, the
> > io-uring code unconditionally grabs the uring lock before invoking
> > file->f_op->uring_cmd() in the cancel path, which means there's no
> > interweaving between the fuse registration logic and the cancel logic.
> >
> > But I still think the more robust/resilient fix for the memleak is to
> > do the preemptive checking at registration time. I think this fixes
> > races in the force unmount case between registration and abort that is
> > unresolved with the original patch. With the original patch w/
> > fuse_uring_abort()'s queue_refs check removed, I think we can still
> > hit this:
>
> I need to go through the other messages, but I still do not see any
> registration time leak. At least not with the additional patch we have
> here to tear down entries through IO_URING_F_CANCEL

The issue is the hang, not the leak.

>
>
> Sorry, besides also looking into ublk now (for main work), also in
> progress to fix an issue with reduced queues and also still on the
> libfuse part of sync-init....
>
> >
> > registration vs abort:
> >   - thread a: io_uring_enter -> register sqe ->
> > fuse_uring_create_ring_ent -> allocate ent but doesn't grab queue_ref
> > yet
> >   - thread b: fuse_conn_destroy() -> fuse_abort_conn() ->
> > fuse_uring_abort() -> fuse_uring_stop_queues() ->
> > fuse_uring_teardown_entries(), skips scheduling async teardown work
> > since queue_refs =3D=3D 0, returns
> >   - thread a: grabs the queue_ref, queue_ref is now 1, rest of
> > fuse_uring_do_register() logic executes, ent is now marked cancelable,
> > ent state is now available, ent is placed on available queue
> >   - thread b: fuse_abort_conn() returns, fuse_wait_aborted() now runs
> > and does a "wait_event(ring->stop_waitq,
> > atomic_read(&ring->queue_refs) =3D=3D 0);" which hangs since the waiter
> > never gets woken
> >
> > whereas if we check preemptively at registration time, we explicjtly
> > free the ent and release the queue_ref. I think the preemptive check
> > needs to check ring->fc->connected though instead of queue->stopped,
> > because there's the race where abort and stop_queues() may have been
> > triggered before the register sqe path does queue creation. I'm hoping
> > there's a better solution than having to grab the fc lock and checking
> > fc->connected though, will try to look more at this next week.
> >
> > I think we can hit this hang on a ring creation vs abort race as well:
> > * thread a: fuse_uring_cmd() gets called, passes fc->aborted check (not=
 set yet)
> > * thread b: abort is called, calls fuse_uring_abort(),
> > fuse_uring_abort() is a no-op since ring =3D=3D NULL right now
> > * thread a: creates ring, creates queue, creates entry
> > - if thread a takes the queue_ref count before the rest of the abort
> > logic, we end up with the same hang as the situation above.
>
> IO-uring sends IO_URING_F_CANCEL for every registred command. We never
> had a leak you describe. Upstream has a leak because it does not free
> 'queue->ent_in_userspace' in fuse_uring_destruct. I'm fine with the
> addition in fuse_uring_cancel() (although the just freeing the entries
> in the list is much simpler and race free).
>
> Please let's not make it anymore complex.

The issue is the hang, not the ent leak. What I'm trying to say is
that the original patch submitted fixes one issue (kfreeing the ents)
but doesn't fix the registration vs abort race, whereas the preemptive
registration check fixes the leaked ents and the race.

With the original patch, the umount thread still gets stuck
permanently in TASK_UNINTERRUPTIBLE during the race. Even if the admin
kills the daemon, the umount thread still holds the mount ref, which
means delayed_release -> fuse_uring_destruct() will never get called
and the entire ring gets leaked. If the original patch adds a
wake_up_all() when queue_refs hits 0 in teardown, then killing the
daemon does resolve it (as it'll wake up the umount thread), but the
force-unmount still blocks in TASK_UNINTERRUPTIBLE state until the
admin kills the server. The preemptive registration check is the more
robust fix imo.

Thanks,
Joanne

>
>
> Thanks,
> Bernd
