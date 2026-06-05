Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A653D3D18
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 23:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780703579; cv=pass; b=AWHAs185fbdFNuXG4C9UTwiiTptvevStut86vPMEzT9l/yA7G0iQDh8GVMv8P6CUMy74LYhC22m8EzhvsWaJNA9VDFLILH+yXixoObnNxzFdLmLzM/aO7qXERf70tbTHp396dNRgORmEzd83VjZ/gwFb3ZLkvFBHG3AwLWqiANg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780703579; c=relaxed/simple;
	bh=h7jQ/799MnzhF7pM7CmcHPw4JikTnVVFN7Ea/1Ax3Wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t512wBJviHv4elgDRPQ0CMm731WMOtbR8dTDHl/S5qNOwaoGGHJaeSe4OUe/XnWOAj12TUni82RzZRlowbbJZCHP1Ki2QlQVjJhJe6X293Z+/wWjeU7Zcrs6ErC+RuwIpLCF+qbPgjBsLrFfm4BlHcsy3WAOLfTR3EXTMJRmD6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiQsNFi0; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiQsNFi0"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490a765d410so25517085e9.1
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 16:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780703574; cv=none;
        d=google.com; s=arc-20240605;
        b=RqhhGy18Z9gprDIYBN38zJjJwfYm0m4TARE0k9PqguHeNy0LkD+b76qyqmeng8eko3
         YseFFOpthJj0uUuMU+bJHeb14gAsokOVSjewhMCuxMD2SoV/KjJUOfZBdhzJJ67dlznu
         uW4bBLX5xgBk2Bzkjd8wyfh726ZU3bhUIf09g4JntgLycaIVWvjHVwJ5eUjf+RPfZ65I
         gukydMsz8tsNU9CuFB+rpykGVS82qsFybdfKd63zJZLPdVZJwUn5SLKEyCAUX7uiIch6
         rNtFkF6MA8KL2AcNbkjsy2X+DWZoHkok+Rfbc53JC0IMtrjWElfo63HJGNRv6MQw9/02
         w6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QQ2aesgpMBNeafFS9klaQL11vgjs6VizkXGycGBMi8M=;
        fh=svk8/P0Ng+bxvrDxCDt+0cd2BeLz6scUtwsJiTwFa64=;
        b=gHXrqTaRnKAQyU29w9gGi6/nNqROCLkPSJJ4HuwvL7Mg663qfSn97ikyzZyU5rGPrV
         +Wu9xBpSHdVDslGLazcs7oPYogobQ5E9+EevEemhmNs/E/AmHSZMfs5fjr8uhg/PRDaj
         RlXK+Fcs7EXjAIJOMvYGR8DZ+zBOmGriTkJCQKP4yHSGb9z4eHu0Kf5TlWoRzdzAQA5X
         DLBU+D/n4G35Rwxy2pLVpTlw3/roO+UD60YLyJ0U7GFUR6ySy79nmrtWdezqfuAUxBlv
         idZP0ctUZDiGvOnfnmjsMk3TJhKcBdqrSK1QyKtOitv47pkdN9Fg0+wgX2Bw/k6lWmeF
         0IRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780703574; x=1781308374; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQ2aesgpMBNeafFS9klaQL11vgjs6VizkXGycGBMi8M=;
        b=WiQsNFi021UvSKT7VPA8Sd9LfAhReb/mfDsc+BMnny1jaJvGJ8vFgHXmUzqmeClBDE
         bXpUecFhY97+VnC71JjYEa659eAvL1+V1h7DrNBBxqmKJi9fsM/+qOZLYC8h1RWbGMRc
         lWrUeKPGpZezCJsS/r+bzXbrcYMJB2Di5LlzR63X/QRzUl4pK8wPu7ofV3+CidzqDYY9
         CqbXwmi4MtfqXOMC4ELUB9R2xDzCTCWb9ZU+ZZeBhdrj+cMKdYSbNb978Xt3boFetHvn
         RmOwUqxz1XVa7T7mXc7McCJVQM6PWxnNW4eI2PEk3ZXAKK4CXF6PA+lFqYmhj02ui9Q0
         MoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780703574; x=1781308374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QQ2aesgpMBNeafFS9klaQL11vgjs6VizkXGycGBMi8M=;
        b=cE48diUyJF10VHWg260v/A9OvLTvoTi3+GwjBwA4+6Grn0j5NXALCZf3zfmpVzGSRf
         2Vc+fKxKYpTp1dxIfG9UnrxAzqV4DzHa3Gm4KfFYBwf70It3ECbq3lK3cqQpv+KIQANk
         Uqon5XLsIa8aWKvy57NbnQdMBOPncg4ocOTbLvQZwcI/DwH3wov7oUUtRMWemW7DCxsl
         Or+DghgekxcMrRnm6UVgVDjvV22wPihX3az/4R8iYPhouq2rlZm4+ohf46lIerk8lza9
         cAmxsP9O03wGehuEuGWwmq+PDIS0im5cE41VWJnE4l2uxlkULehNz4Vkfy8QVtAI8tMR
         1svA==
X-Forwarded-Encrypted: i=1; AFNElJ9c0VLzysbi8zIjhsFqIGsVstW35wCXBpSMqLwm4XNALZimrnKEyMqh8x1QtCaH1p+1auYnn0En84WF@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt3ytcmsVGzmhIp7aNp4p+TMhGvfDjDZEUrX91Qwyse4jtxvBa
	SmIPiTnTpceRom91YVSyKbSMmAJcV3IHI01hDuzOe0iNn329+9sQHxU9aaLHqf2AYWUDqyoFo1t
	Un3nC7T7iUV7rk3CHOVC4kDmrTvv0h3I=
X-Gm-Gg: Acq92OHeLb0kfsfBNM45i/A/d2MN6JSXTwRqBV+HI7wcnoZEL9tBIpX/qhWTOCZpF7r
	7YnhbWpIvRtiNv44iifrHgXxj0o8EnEDvr5U+0ThKz0+7t4WfdN+fOmyX+GiafyE6LWvA1SDZpK
	s8pZBD2L7lJnybASms4srxhH4n29R+hTjed4cVOfwsCMmI24JCn1JgPIoxrO0wiAzVR5e6y3Q/J
	jjjSP/dnkJSYuuaKh6VXnLdxMjWg0Ls3uUVMZ3LyzdQOrmedOujCD9REnathaZ5D8Vbl3BxkmIZ
	QBYiBzBeXh14khBKwYmt500n5ZA=
X-Received: by 2002:a05:600c:458a:b0:490:b2f2:9aac with SMTP id
 5b1f17b1804b1-490c24f56d2mr107170215e9.0.1780703574033; Fri, 05 Jun 2026
 16:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260605192708.141921-1-joannelkoong@gmail.com>
 <20260605192708.141921-4-joannelkoong@gmail.com> <058fd2d4-3ba4-46e5-9107-3a7e0ab66653@bsbernd.com>
In-Reply-To: <058fd2d4-3ba4-46e5-9107-3a7e0ab66653@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 5 Jun 2026 16:52:41 -0700
X-Gm-Features: AVVi8CeLJ75-2pKBCW7TL3OuVJRSkV7jfiZNNENXXNsOs4uK8aFbUIF90TpqkgI
Message-ID: <CAJnrk1YHQEtpwA-ForFWXsLntc950ekqAHg=L9VExVfJ2WF1Rw@mail.gmail.com>
Subject: Re: [PATCH 3/3] fuse: end fuse_req on io-uring cancel task work
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, Chris Mason <clm@meta.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 3:09=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> w=
rote:
>
>
>
> On 6/5/26 21:27, Joanne Koong wrote:
> > From: Chris Mason <clm@meta.com>
> >
> > When io_uring delivers task work with tw.cancel set (PF_EXITING,
> > PF_KTHREAD fallback, or percpu_ref_is_dying on the ring context),
> > fuse_uring_send_in_task() takes the cancel branch, assigns
> > -ECANCELED, and falls through to fuse_uring_send(). That path only
> > flips the entry to FRRS_USERSPACE and completes the io_uring cmd;
> > it never discharges the ring entry's owning reference to the
> > fuse_req that fuse_uring_add_req_to_ring_ent() handed it at
> > dispatch time.
> >
> >     fuse_uring_send_in_task()
> >       tw.cancel =3D=3D true
> >         err =3D -ECANCELED
> >       fuse_uring_send(ent, cmd, err, issue_flags)
> >         ent->state =3D FRRS_USERSPACE
> >         list_move(&ent->list, &queue->ent_in_userspace)
> >         ent->cmd =3D NULL
> >         io_uring_cmd_done(-ECANCELED)
> >         /* ent->fuse_req still set, req still hashed */
> >
> > The fuse_req stays linked on fpq->processing[hash] and
> > fuse_request_end() is never invoked. The originating syscall
> > thread blocks in D-state in request_wait_answer() until
> > fuse_abort_conn() runs, which can be the entire connection
> > lifetime. For FR_BACKGROUND requests fc->num_background is never
> > decremented either, so repeated cancels inflate the counter until
> > max_background is hit and all later background ops stall.
> >
> > The non-cancel error branch already handles this correctly: when
> > fuse_uring_prepare_send() fails it calls fuse_uring_req_end()
> > before fuse_uring_send(). The cancel branch must do the same.
> >
> > Fix by calling fuse_uring_req_end(ent, req, err) in the cancel
> > branch before falling through to fuse_uring_send().
> >
> > Fixes: c2c9af9a0b13 ("fuse: Allow to queue fg requests through io-uring=
")
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> > Assisted-by: kres:claude-opus-4-7
> > Signed-off-by: Chris Mason <clm@meta.com>
> > ---
> >  fs/fuse/dev_uring.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index 7cd50990b097..b5cc700575ca 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -1222,6 +1222,7 @@ static void fuse_uring_send_in_task(struct io_tw_=
req tw_req, io_tw_token_t tw)
> >               }
> >       } else {
> >               err =3D -ECANCELED;
> > +             fuse_uring_req_end(ent, ent->fuse_req, err);
> >       }
> >
> >       fuse_uring_send(ent, cmd, err, issue_flags);
>
> I think that can race with fuse_uring_stop_queues(), which leaves us two

Hmm, I don't think this races with fuse_uring_stop_queues() as
ent->state here is still FRRS_FUSE_REQ and fuse_uring_send_in_task()
can only be called for a registered fuse ent, which means the ent has
already grabbed the queue refcount which will trigger the async
teardown worker to run in the background during abort until the ent is
reclaimed. I think this adds a race though with the request expiration
checking logic which (a) fixed, so I think you're right that we'll
probably need the same cleanup here. I'll look at this early next week
and send a v2.

Thanks for taking a look at this series.

Thanks,
Joanne

> choices
>
>
> a) Same logic as fuse_uring_cancel()
> https://lore.kernel.org/r/20260515045541.1171335-4-joannelkoong@gmail.com
>
> (also introduces slight code dup)
>
> b) avoid the code dup and send it through fuse_uring_entry_teardown()
> with a bit refactoring. I thought I had send an updated patch version
> for that, but don't find it myself anymore. Explains why I never got
> reply. The old patch from October had bug, but I'm rather that I
> posted an mail with updated inline patch, not as separate series,
> though.
>
>
> Thanks,
> Bernd
>
>
