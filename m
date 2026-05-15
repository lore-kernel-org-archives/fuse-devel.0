Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF54833F8A5
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 21:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778879514; cv=pass; b=Ruq+iDwZXQqNKrroqZcIzVWQPd7KIpLZDmnILT1rzKxHcIDHRZhFFrt/MAG4+Ld1cb1XPy3DKeh7PFFexcIeiSncrzY1N3lnscrq4EWq0vZPw5tJcBLuRCqL2pBFoVy0Zah6SSs17j14Dfa2minCVzZC83GwfZBBIuJQl5zVnoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778879514; c=relaxed/simple;
	bh=3TjuOpB2lyamMgV8Ic10Si9R+GxCvn+A/B0vEzNJ99I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AoaYShZRpdYSp5GA9xPhEPN9v2WRuY2vgZCrnVO2VTxIf7B8JGera/bZx/4kFD3TPCPdrq79YkUKNee8afM9rinJFUdZ5t3tL5PnmiuwwSSVWl9SpFJhG9OI8rVOvX+S6APR+f8LlO56tocJ0ySDLs+rh5EpywwSqhPXaD4xT9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETG8BxDU; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETG8BxDU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48909558b3aso2370065e9.0
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 14:11:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778879511; cv=none;
        d=google.com; s=arc-20240605;
        b=HlxyD6cLGPrfvzlEC/JCMw2rLyX2+z9w+Ru3A5KCGyFPgY84YmnW5gVhqwrFIBKnGh
         sH4HWu6qeg7MktY7lHpN8y7aqdzAIDA3wzWs10KlkuNzfsMwrcsue4myV6K3sCT5rxzw
         zMLC/CPJY+ywv/pqZQcpJRj0LiXnxIzBwu68jVUaHRhwEC7gvCwJsT2aI/CWFzLGYmIZ
         KutMyBjzXjYeDXbvzAMHM65yslNn0wPCLVQH5O8dalY5uuO25JJSRdieOcVypc7AGvwv
         5unXkDWIhNvE8dj2nA1l8tbr06F/xtKbKlQkVn+K4FowWj4/LLWrbDdYdJOhOZNn61E5
         dZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9dlhdpYH17+Qki5zJW4Mxe8q+cYkrVb0hBea1Jft3jA=;
        fh=1YQxL9I5070HayIsbNhm2W2AbhHM5o254MWEZmEGVKo=;
        b=UncqXncbIY4d/UVQTptvAp+X4Guo+JH09s3X42Anj4HDx+dz3iNvOOzKR30v+B2Mpf
         gJ+CitPsK/uAluVLLwN3ylah5IN3TDvGMZbR6Zg95fKhQ+GgOiZQAZaNZna8GadWSen+
         cNPx5NsMsujonWP2eVpg+I0x94rsne8yQXkgIQLnkTdiVv/Acdy0WBKpDNLMGWSm9Tgy
         0MpKp0vffSOdHZtBWZrNyQIWOyzpr7dfL4gl4TZnrELGbI+8SRc+mnGYq10KTl/13bA7
         UNC76Msnsvumyllp0pcWfD2CFRHpyhmtADWEWumbzQIbfJrtz62alO3BKzDS2RLl3xlk
         pt2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778879511; x=1779484311; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dlhdpYH17+Qki5zJW4Mxe8q+cYkrVb0hBea1Jft3jA=;
        b=ETG8BxDUnaePQFZKaOrSCeNZ4aNwBYQFAbu+nGXSAqJEi2oQaYMXdOHGsyi1TW0g4K
         QYTYtOsqKkJPRWic94HOotUy31ncg8IR9ya9djwfzbD98PTJ63ukxTiC1veC33TuXjgm
         60VXDR7wNm1jyJokSMgwUORY6rf8UBLriDlayQEBtqCqy4qf41Qkbyk8hpwcQ3Nw3wW6
         4NK/zGddGVU90F1a3QFkVvv/6sICVAGuw/2M0SmhoyT3eZHn3Uk18tGZ5IclOQvjoNPv
         ps7DKZu0EXMsaJ72VQU+ISPxkdZolSycT15Ev9Y6yajAVJvUK0K28gFxUzM0+bPb5sYx
         YmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778879511; x=1779484311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9dlhdpYH17+Qki5zJW4Mxe8q+cYkrVb0hBea1Jft3jA=;
        b=CiaaZvL6yLB4Rnt+tCiq09bzMEfSTq7fRLLVmy22J6c67qlBQRI+QjQMVrfu36dQ2L
         mKOXZY84LyAywtlOxXnUgEYHnjXEse2k6omjbo9oXMo5bf/6kSocgQL6/CLrCE2LgQVZ
         QHn1nZAYABlrjS/cK+rQtaLA7twtWdGiuCkLJeQlXnTnOSelyx/ddpqLpsrZCPc1HCWL
         QPp+1NNKGmGhUugOSQ9zbfJuy5YIPFD6+VWjHxMT97zDqQZ1uramCjvefGxS22bY3lUQ
         VjNVaZEjIlxRCIFi/xwAS2kub3YTEL9gSPUE9RLN3ca5Vbe5ipVqSHoHI85BmZPia2k+
         x3ng==
X-Forwarded-Encrypted: i=1; AFNElJ/Kh3AoZTlIVV2YbreEZJahyokFXAlSldla7egCB6Lca/Nx3sVK5f7dhycbwjSDFJntO6XA3gaBOBMw@lists.linux.dev
X-Gm-Message-State: AOJu0YzfOHSehfd1+q3pj5Up4m/yR+UqGJ5tLL9GEJ5wX/rKXyZ57Fw6
	3h7xFqttXMfu7Oo+1EqO6X5OTvEX59i+B1Z9IBmL0HOSOGKf0500HSZuTmnT5hC1W8EYYVfarlc
	yyb1wgBIYj1OKx/Tp9pUAx8A5sjAjMMw=
X-Gm-Gg: Acq92OERNJcuyaioDHS0YyY1eQTnqMhSvz4ZdO2V3INIBo81ryR6fRch9atp+SO/RRO
	0GDG4UliAZdL0JJeK67ufdoKS/VW8D5ZEIyEO8LSKoY+oioFWgePeXOM092hp2gcx8Hb+OGeHNS
	jflo14t8Aekm5361cYEiBcSWU3u7n7RVoU7y5Y+pTTNFLzANkD6URtVHXxDRqXY4a2nvldMvTFo
	Ct2aZYrovI1UPwQHdNgTHyzD8pWF2RbOLao36N+AJ6bhmR8W4ZLxqogUtHGV958neMzKNfs/9Vo
	1D1hCmNsjkT9g3zZ
X-Received: by 2002:a05:600c:c087:b0:48d:c0a:3813 with SMTP id
 5b1f17b1804b1-48fe60de6a7mr66320875e9.3.1778879511207; Fri, 15 May 2026
 14:11:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515045541.1171335-1-joannelkoong@gmail.com>
 <20260515045541.1171335-4-joannelkoong@gmail.com> <5c010e24-b4f7-481a-97e8-00da0aec6f3c@bsbernd.com>
In-Reply-To: <5c010e24-b4f7-481a-97e8-00da0aec6f3c@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 15 May 2026 14:11:39 -0700
X-Gm-Features: AVHnY4L72wtPYsCQW0YZXK928lTcN9ns6pnXhedctWR6HgruyXhZFORt2QwcYKw
Message-ID: <CAJnrk1bY-2_6biL2dzsu8CLW_daYfpBM=sGxGRXOxj5qvOTFGw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] fuse: fix moving cancelled entry to
 ent_in_userspace list
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, ali@ddn.com, 
	horst@birthelmer.de, Heechan Kang <gganji11@naver.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 4:10=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
> On 5/15/26 06:55, Joanne Koong wrote:
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
> > Fixes: 4fea593e625c ("fuse: optimize over-io-uring request expiration c=
heck")
> > Cc: stable@vger.kernel.org
> > Co-developed-by: Jian Huang Li <ali@ddn.com>
> > Co-developed-by: Horst Birthelmer <horst@birthelmer.de>
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
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
> >       queue =3D ent->queue;
> >       spin_lock(&queue->lock);
> >       if (ent->state =3D=3D FRRS_AVAILABLE) {
> > -             ent->state =3D FRRS_USERSPACE;
> > -             list_move_tail(&ent->list, &queue->ent_in_userspace);
> > +             list_del_init(&ent->list);
> >               need_cmd_done =3D true;
> >               ent->cmd =3D NULL;
> >       }
> > @@ -521,6 +520,9 @@ static void fuse_uring_cancel(struct io_uring_cmd *=
cmd,
> >       if (need_cmd_done) {
> >               /* no queue lock to avoid lock order issues */
> >               io_uring_cmd_done(cmd, -ENOTCONN, issue_flags);
> > +             kfree(ent);
> > +             if (atomic_dec_and_test(&queue->ring->queue_refs))
> > +                     wake_up_all(&queue->ring->stop_waitq);
> >       }
> >  }
>
> Hmm, ok, I had done that via fuse_uring_entry_teardown(), but this way
> is also fine.
>
> While thinking about it over night, I wonder if we should abort the
> connection here. Calls for fuse_uring_cancel() / IO_URING_F_CANCEL
> happen when
>
> a) The daemon dies - that is what I had written the function for
> b) When one calls
>
> With reduced rings queues we would actually need to have per queue refs
> and if a single queue reaches 0, it would need to re-calculate the
> queue. In general this gets complex and from my point of view, if
> fuse-server wants to re-initialize queues, fuse-server should:
>
> a) wake up the ring thread with an eventfd (libfuse already has that)
> b) we need a reconfig SQE (like FUSE_IO_URING_CMD_RECONFIG) that
> requests to re-configure things
>
> Right now that is all not supported, from my point of view we should
> call fuse_abort_conn() when we call into fuse_uring_cancel()
>

From what I see, I don't think it's safe to call the abort in
fuse_uring_cancel() since the cancel runs in the io_uring submitter's
task context and the uring lock is held when it gets called. The abort
logic can trigger calls to io_uring_cmd_done(cmd, -ENOTCONN,
IO_URING_F_UNLOCKED) (through fuse_uring_stop_queues() ->
fuse_uring_entry_teardown()) which will lead to a deadlock in trying
to acquire the lock that's already held. I like the idea of keeping
things simple with just aborting, but I think in actuality it might
lead to more trouble.

Thanks,
Joanne
>
> Thanks,
> Bernd
>
> >
> > diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
> > index 368f4d0790eb..22ec67e39ee0 100644
> > --- a/fs/fuse/dev_uring_i.h
> > +++ b/fs/fuse/dev_uring_i.h
> > @@ -150,10 +150,10 @@ static inline void fuse_uring_abort(struct fuse_c=
han *fch)
> >       if (ring =3D=3D NULL)
> >               return;
> >
> > -     if (atomic_read(&ring->queue_refs) > 0) {
> > -             fuse_uring_abort_end_requests(ring);
> > +     fuse_uring_abort_end_requests(ring);
> > +
> > +     if (atomic_read(&ring->queue_refs) > 0)
> >               fuse_uring_stop_queues(ring);
> > -     }
> >  }
> >
> >  static inline void fuse_uring_wait_stopped_queues(struct fuse_chan *fc=
h)
>
