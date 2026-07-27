Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F91427A
	for <fuse-devel@lists.linux.dev>; Mon, 27 Jul 2026 23:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785195559; cv=pass; b=H/fencaKymMCuFeHlRgzrIbqcMeq+15ncJUkDijpRqlWil1VRSWigp9qIr+SwrNWp5EJPV/Q/zzMUGysxOyFbicp7QzIKbz6S2cZzU2+mYDtB1ho/PaKGh0xQsyVhssvWW3tN7Hs9wZEBNghTynDH+yfqvyP7c67N59Lr4ZAXlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785195559; c=relaxed/simple;
	bh=V5YWr3MKVMqaHPNkDI2H2wxmRrxgahysyRn4PvMMfLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cm1z8blXdxWyutqZcdDcrLRWWwk6vYjpHglQJJO3lIrlW2j+ZbVU/vbQwudAe+tGWGV30Kd5RhrPVa56dK7thBHBmQ6Mh3gTLWnxzcgC5YFUrqdDS6LCGBs42QI7d8WnxSYaNN5ePyTxUgFfrvZ6IwayX2cYnqX9rU1NZk9aYJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=WTnIqLp1; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="WTnIqLp1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ccf2360620so30592815ad.3
        for <fuse-devel@lists.linux.dev>; Mon, 27 Jul 2026 16:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785195556; cv=none;
        d=google.com; s=arc-20260327;
        b=BwJOXZ6Khtax7I8doqja1+5RnuikaVJ9haLAuuuAdt35Y5AyfJsKFhGLETL+A0CbB8
         f+bZkC6fS3YYrIRx+TBLB+VXqEtzyRg68Y6ZvE1XQhWNQH+o4iB/D/z8/uw5qAPj2UQx
         NPJb32CpP/A0l8t/mEF5/dvoBHGiwNoeMTN7DzJ5tLdx0CODNkcyLzW6DGfEV+jwJZ8F
         Ltr+6Z6+WI6ormc408Vp1DuGrzU/UQTaki8651AAQJD//F2UjBuWyi4MExWBjtcHzymd
         +YssN6bpZw4M/Oaxl9Uw/99N/gHAE2HW/0hDBDIs7sZ0rSQGphh7QM5z7natYDHSX5le
         jQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RqFceQZgdQjZo7xGdNfi40Q0nXWHUMZpsmINYgmFEmQ=;
        fh=mHY74mAudurMroBIJtyYAwddSN9djJi9t7sUsgXRE9M=;
        b=rppwkx3pKCdJaw8Gnjbqi5dw7ytDOSwBzMz4Oc7CWiZPyaOUkS35cmSmNMM05NN4R9
         nZtTeZInd5MmHpzhi/TIpo2VZmi9Y7yWP98Qep0XUF6xH6F3J34dmj6S3g4zD7ch7y+K
         IAAOx4paseCfIeOYKborujdZtWUxKyci6Aw2CLPZzBfwKu/hoYiLT3RNM7VjvdxwxmHi
         vCYRCpk0hvbUs+vtrf8GuOGkEjgys5DGvUzjLdQhosAYK3qfeH+TajeKv5F08rKOgj3G
         q0uzb+RzzgHmUrQ7mVnzGJLQygkv3n7HK5OzsQTCBX7cd89M3cGKsGssC1UtBXuz9S6x
         eyQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1785195556; x=1785800356; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RqFceQZgdQjZo7xGdNfi40Q0nXWHUMZpsmINYgmFEmQ=;
        b=WTnIqLp1A+36OYI5m7GGiRoMcy5tfFm6tbqoRtE+ERmIvwwhVTSTib2DgR2O2H2qVE
         A0epGh666OfGA4lNfDC3EruKO7HCNq0OlJEjtWpx0Vi/YSgupflul9Ahigxe7QomeY0U
         da0KjaoYKHGo3U/4FyPdhZqFwKRv9JTCyrgqwe3yaKamD6wnNOPdVSTjdBMrzCMtjvHb
         0tDXLxMAsigpS5rRlZ3SlyEeB2kTwUYvyLShV5HV97zqhNnwwnviCTW+WYm8n65y2KCb
         eYCXn9chVMHd14bp+GJrlFaSaWOlTCgn604MyOlu4A5WomDwlywF+MAB9V28xwcer+6A
         QIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785195556; x=1785800356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqFceQZgdQjZo7xGdNfi40Q0nXWHUMZpsmINYgmFEmQ=;
        b=stofQEqFokutjBJ5tNwBvK6IbTd9K1bMoVmqVBCvcn419bA6cHGuY4186F+0cp5VK7
         ouuHWacGlAJ1gjbZhgRjYx9svRFowkFNpvSTb5JVq4KbWTC35FoC5m357B2598vrba+q
         kTLK06pvbr1Oz0yPBVYPWACO0c9oVm3a3j2RPTSamZaUZJdzOSAP3oejun9TwIeuU8SI
         kHcRahAHC4TUkmNux+9H/JYDi4eBnH7qhTN4bpox9paWCKEZ+J5ENDpry2I5cRPWbcku
         ZADCnnyvO2lVrBYt2JqI5D28cSuthPHGMDjPB6eiv7omrfjOPSOSk6WCVzXRQMSC2tn1
         EanQ==
X-Forwarded-Encrypted: i=1; AHgh+RrU1eg37QhJTQ1KoI6faMotQTRNH1LkPqajnYpU88onl7igrImkDmtt3k+iyD7xbqYoHlwc2mF1YhxF@lists.linux.dev
X-Gm-Message-State: AOJu0YxeZddxgnKx9QvMr7l2g35ZSFzXiqNjodKS/hWUhOnIWvQHkJWL
	7IpVIZaKqobylKomBKapJLAfahVHKNYTwaolKYfffEvzRHsOjdG6+DrqGUFcd45aBG/5WWtoNhz
	BWAHf1mCai4Tth99Cp0vSPdIwebMMFIsV2G6omVVy
X-Gm-Gg: AR+sD12mO2V+6FmYy7Efbkom4KldEUawAUM1lfww8MJ7mn7iB4tDJOJxb6A+jC95G61
	WhEdZr9bvXtiatKBqZ7A1Rmn0w1qeqTO/pqnOeRUOoYigOjdW0vHHAslwEYKGPT2zFrIPAH+L21
	7PTDXnngxc+JRp4cRW0lfe6PZPg2tltKFPDYo9l8zU1h513hTBUkBkMssRnuWJ4BUJyCYDcxfmj
	LGvqGSqUVQxi8LFqTLA+U9YL+uQk5btqveb6FURxdlHIe+8M7CQgtEDWCdOf1HtZhhnMOfRzyrj
	zXAuJ5k7hPt5QkyX4RuT
X-Received: by 2002:a17:902:b701:b0:2cf:8131:75f3 with SMTP id
 d9443c01a7336-2d015a8940bmr115955ad.7.1785195556400; Mon, 27 Jul 2026
 16:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714235408.1666063-1-xmei5@asu.edu> <CAJnrk1b4VAsyEMx7obFTBgP8M3dBcD1+QnKVQK-r881MBySDOg@mail.gmail.com>
 <c48c4541-c62a-45cc-aa3d-1c78a48d0676@bsbernd.com>
In-Reply-To: <c48c4541-c62a-45cc-aa3d-1c78a48d0676@bsbernd.com>
From: Xiang Mei <xmei5@asu.edu>
Date: Mon, 27 Jul 2026 16:39:05 -0700
X-Gm-Features: AUfX_mw5Vb7r-H4GegBkxIrI4-ULi3jkJQ4MMMUyOB-n1gwlaWOaUgAxYZC8Qr8
Message-ID: <CAPpSM+RbHh6toxSR00HCA_+R5Cj+yBwVXDw0ruiMbrVhnMX-6g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] fuse: whitelist the request headers for usercopy
To: Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>
Cc: Baokun Li <libaokun@linux.alibaba.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Kees Cook <kees@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 2:59=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
>
> On 7/15/26 20:13, Joanne Koong wrote:
> > On Tue, Jul 14, 2026 at 4:54=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote=
:
> >>
> >> The fuse-io-uring transport copies req->in.h out to the ring in
> >> fuse_uring_copy_to_ring() and req->out.h back in fuse_uring_commit().
> >> Both headers live inside the fuse_request slab object, whose cache
> >> (fuse_req_cachep) is created without a usercopy whitelist, so copying
> >> them directly to/from userspace trips CONFIG_HARDENED_USERCOPY and
> >> panics:
> >>
> >>   usercopy: Kernel memory exposure attempt detected from SLUB object
> >>   'fuse_request' (offset 56, size 40)!
> >>   kernel BUG at mm/usercopy.c:102!
> >>   Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
> >>   RIP: 0010:usercopy_abort (mm/usercopy.c:90)
> >>   Call Trace:
> >>    __check_heap_object (mm/slub.c:8268)
> >>    __check_object_size (mm/usercopy.c:197 mm/usercopy.c:258 mm/usercop=
y.c:223)
> >>    copy_header_to_ring (fs/fuse/dev_uring.c:618)
> >>    fuse_uring_prepare_send (fs/fuse/dev_uring.c:776 fs/fuse/dev_uring.=
c:785)
> >>    fuse_uring_send_in_task (fs/fuse/dev_uring.c:1306)
> >>    tctx_task_work_run (io_uring/tw.c:96)
> >>    task_work_run (kernel/task_work.c:233)
> >>    io_run_task_work (io_uring/tw.h:84)
> >>    io_cqring_wait (io_uring/wait.c:278)
> >>    __do_sys_io_uring_enter (io_uring/io_uring.c:2685)
> >>    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
> >>
> >> in.h and out.h are adjacent in struct fuse_req, so a single usercopy
> >> region starting at in.h covers both and nothing else.  Create the cach=
e
> >> with that region whitelisted.
> >>
> >> Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support"=
)
> >> Cc: stable@vger.kernel.org
> >> Reported-by: Weiming Shi <bestswngs@gmail.com>
> >> Suggested-by: Baokun Li <libaokun@linux.alibaba.com>
> >> Assisted-by: Claude:claude-opus-4-8
> >> Signed-off-by: Xiang Mei <xmei5@asu.edu>
> >> ---
> >> v3: no context change; add Bernd's Reviewed-by
> >> v4: drop previous tags; use kmem_cache_args to reserve usercopy area
> >>
> >>  fs/fuse/dev.c        | 9 +++++++--
> >>  fs/fuse/fuse_dev_i.h | 5 +++++
> >>  2 files changed, 12 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> >> index 5763a7cd3b37..b8e43e374b35 100644
> >> --- a/fs/fuse/dev.c
> >> +++ b/fs/fuse/dev.c
> >> @@ -2404,10 +2404,15 @@ static struct miscdevice fuse_miscdevice =3D {
> >>
> >>  int __init fuse_dev_init(void)
> >>  {
> >> +       struct kmem_cache_args args =3D {
> >> +               .useroffset =3D offsetof(struct fuse_req, in.h),
> >> +               .usersize =3D sizeof_field(struct fuse_req, in.h) +
> >> +                           sizeof_field(struct fuse_req, out.h),
> >> +       };
> >>         int err =3D -ENOMEM;
> >> +
> >>         fuse_req_cachep =3D kmem_cache_create("fuse_request",
> >> -                                           sizeof(struct fuse_req),
> >> -                                           0, 0, NULL);
> >> +                                           sizeof(struct fuse_req), &=
args, 0);
> >>         if (!fuse_req_cachep)
> >>                 goto out;
> >>
> >> diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
> >> index 668c8391d61c..b511aaab6bfc 100644
> >> --- a/fs/fuse/fuse_dev_i.h
> >> +++ b/fs/fuse/fuse_dev_i.h
> >> @@ -81,6 +81,11 @@ struct fuse_req {
> >>         /** @flags: Request flags, updated with test/set/clear_bit() *=
/
> >>         unsigned long flags;
> >>
> >> +       /*
> >> +        * @in and @out are the usercopy region of this cache (see
> >> +        * fuse_dev_init()); keep them adjacent.
> >> +        */
> >> +
> >>         /** @in: The request input header */
> >>         struct {
> >>                 /** @in.h: The request input header */
> >> --
> >> 2.43.0
> >>
> >
> > I think this is more a matter of preference as they're both
> > functionally correct but imo the previous approach seemed cleaner,
> > given that only the io-uring path needs this. The extra hop goes
> > through a tmp stack variable whose memory is already in the L1 cache
> > and the memcpys are small (~40 bytes), so I think the cost is
> > essentially negligible. Not sure if Bernd or Miklos or Amir have a
> > preference here.
>
> Sorry for late replies, currently on vacation and reviews only when
> everyone else is asleep.
>
> I don't have a strong opinion, I wondered the same if the stack copy was
> avoidable, but then came to the same conclusion as Joanne - negligible
> overhead.
>
>
> Thanks,
> Bernd


Sorry for the late reply. I just got some free time to continue the
patch. Thanks for all of your review and advice. I'll keep the code
simple and just use the stack var to fix it for 1/3 and add Joanne's
suggested comment to 3/3.


The v5 has been sent:

https://lore.kernel.org/fuse-devel/20260727233706.218446-1-xmei5@asu.edu/T/=
#t

Thanks so much!
Xiang


Xiang
