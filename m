Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D6B382F03
	for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 23:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084356; cv=pass; b=sTaq629g3oXMk2aIPwHZUxRcaECxUsmIFf+CMiNsSyh3h6DjRVnhegNzdF7mc2W0U36UNzG/Mdr7uERwqNONygZawklUuhl9ofssrDUQImu/VOoz9qqgwjfOlbETXh77BCnH0rrDzsAG3LuiTYQBEqoutgcF2KyIDkTKyj7Wv8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084356; c=relaxed/simple;
	bh=gxd9FXzpjEE7MvIjrTJWMqmaXboQI1HI9LnM+PCmHvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ea0Ll2MCW06XE9Q6OVC98fuMsFjkJiYyT3fjfYXakWIZWTgnCxPv3po+E7RP/rKUlShZlNNa983acnV1uCSgCKvNH84PfOMfXJBTW+Ny2ntUA6WWhPBfWKzxjJjBVUObppKeNCDAWMrOU9kYuuFidQZOpxhBMmc/nVGdmo9cQCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=WD+8OxEj; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="WD+8OxEj"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-86a31708876so243290b3a.2
        for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 16:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789084352; cv=none;
        d=google.com; s=arc-20260327;
        b=gRlzuwQjbAPMaJu0Hac07mqcY1DUornyilo7ceEe6aAsfmbsrkAyHmD0Hjw4cXTwfY
         GEZfvoVlZ3IT9JJMGG/hv2QbIcwj0z6+JKt4qKE6DNTzainE3hTy0wd4UpFBdb8y6g5v
         EZbiDgPlHbtg9UF6gPEA7+rgy5ZwLjeheQz6iagnh3CsaqhBowuupUW5GSDxIbVFetF4
         oTNoNMmZaBAzRHxzatca5rYTeAwYvIZbJtglsMmDYdUklgtMSjf2/WgHpOXPqU8uOair
         V/WBPTC/V0m+nK0v8eEenFoT2pvK2DwcKaz0wPepsZMPp1lS9rMjWUP8+WNBvAZWm2nJ
         SkZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NdnRvtVpKeaWT0ZN4s5Z5A0W0nAd0cRp7qQ/CRHsFmE=;
        fh=FhgkQB2tTTm5epeF7LNZOE8ah4fWo4AMe8TEYjaC3MI=;
        b=N5n5kQcif9QtOSMyER0Zq1FYDeJ4Ebmxc9GBMGrryM3bSmYwm4zKFSChnV8G4Ckgg6
         9zHAbOQe+ZyT+yQkkiKjNEAVXB/2dI/fc4M+9wCPFPoM6LSLs5tvszTIOVeJHIcw7wHL
         qCa9/Jhwgfjuy1/xsugc5OlIYFZ5cQMMCFt5fuh0/kkBzdn3uTQDZPJ4OBqLb2bnj2cj
         g07ZMF0K0rpSUO75DTxvztz6fbA3cK2OVAioD4Th/NDSt8pAU4xkwFXuXfou6FNsUiIY
         y6ndhlghCKHUNTsS1uGT0sbcwpFS6P3GnTdC2/DBLPVgDFqkQsIqM+bLF5I1flLeb/Bd
         oj8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789084352; x=1789689152; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NdnRvtVpKeaWT0ZN4s5Z5A0W0nAd0cRp7qQ/CRHsFmE=;
        b=WD+8OxEjb7eVNErpr/0hQQrvHuikfU/NOEyEAbssN4c/oGFwwNc4A1NYaW7S+z3Ybp
         dx9DTcWmWtVZ7jqF22rnj3zDzEwOj9B4emtxp1eNZOeAvi+PYs4KT6gAHjbcEWtsWFf3
         IFbvy5kAga2tl6AuJWGQAlxdqn2bE1NQ/4/B9DormoPgyCEKJV5NNVoDlHBxrbbtUTH6
         JbyL40nJ30207x//f81hLeBvqiYgjS1idHTIXs3VgWxxkr4wKv0rVm0giOqp7k7yUzWR
         lyQ8DQHuXf9rAABqzPdCaEe1fGtbeuFpv4Bqh4uS9QTnHRfRsj8Z8bSGzSDv9euRPuP+
         Xp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789084352; x=1789689152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdnRvtVpKeaWT0ZN4s5Z5A0W0nAd0cRp7qQ/CRHsFmE=;
        b=P838jWwNeQisHBVjlsoLGeG9vLsoCFvg/ZcaQ3HbGn1LFsGrCMUTUZ7KvMxfqPtjBx
         tqXNrih+4NC96hL8cnYVKC5t8zzMVi8JiSAxyJg9yc8J1U5AGRsLy7/DOKAW0IRwhPAt
         9eEhyStJ1IgzS9TwEnmQrdvRPY7gRL13kuXAOii2kk/WHo/+rtP6B1+fs0k0UbFsRbLZ
         FkFd2lLv8Dl717DA1i4p2AAke/lmqig7kEahb3sAIA/WwcQD+D2uBuJzNLgIk0dWmCFk
         Dap9KWAv/AffKdDM5SwLKqyaCejq8+9qItgd9/2FZMXGuHUMfy+iuiTrkM99KdoSbQnl
         DyTg==
X-Forwarded-Encrypted: i=1; AKwUvBwuTzXZiEMbm8AhgRVRVgLODxcXj5LYBY7l8xt7Xsi8SXLF4gfN7ERMm2U8ynqrnkCglibmHDRL7/Ff@lists.linux.dev
X-Gm-Message-State: AFuF++nf0d6fwj25czfNtyA+qurfJKjY1C2nNRlKqcI+Z1My9MdJSqGt
	gsld9JSImNYHwWf8SX0LW/hgPYkzdT0b3YP7EaTUJqVvxeIHkY+EkbDIUCGWAR8qvc0uBP5mC3n
	/Ww4aWyD/qe4JsatHmnPZ/g1dDGIrhPiD5tv4FmKF
X-Gm-Gg: AYBFou02BMtitl7aKx4brVkYsLunkNFx6KsNWbmsdK+rHc11idijzFndzcrXpuZqadP
	bgcMjGykEAnahZGFJvPP5kfx8zYv/nBnCnFYfnfQhR362ZURZ0anqZCszLc/KQCROneKNRtj6Li
	PEqj0LMD7Dr2IcZey09tzra3//7KTxv4ZEZt3kqHApXATmPu1GsT5WmGbXYgCPkWGHasax64x1D
	GHWGcr3crmYmPELlZ26RfPkKIXHl63n0Lz+Om1S8paFVM6pox6pt1/M9dHwBryPk8l+XEhBCQvz
	a1PyxHvc7iIcT3+dzwmfWnNpg283wBQhmutUt1sTVcqBMKfIdHLF8hu71jeX/cXOJUIc/0O6lws
	sYYzipa4QxhLFPSuEO42NjA==
X-Received: by 2002:a05:6a00:aa07:b0:85f:b00b:8760 with SMTP id
 d2e1a72fcca58-86b30f13aecmr2172804b3a.5.1789084351986; Thu, 10 Sep 2026
 16:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910022442.3594649-1-xmei5@asu.edu> <CAJnrk1bVwezZwMFmOE-4T6KTa5SzQFapkATS2LVeo7+bMcjdbg@mail.gmail.com>
In-Reply-To: <CAJnrk1bVwezZwMFmOE-4T6KTa5SzQFapkATS2LVeo7+bMcjdbg@mail.gmail.com>
From: Xiang Mei <xmei5@asu.edu>
Date: Thu, 10 Sep 2026 16:52:20 -0700
X-Gm-Features: AcwNN1Wt4X8PS2HRrjI9CWe-1228S10-2EjcXULM81Hw8G_R71GCSrBJ2wPt8_A
Message-ID: <CAPpSM+Qd=yEc=NsuK_fE12KHH+qnYvvHLFUs6fvcw0SsfP8tcQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] fuse: don't BUG when the copy buffer is exhausted
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, Baokun Li <libaokun@linux.alibaba.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 10:22=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> On Wed, Sep 9, 2026 at 7:25=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
> >
> > fuse_copy_fill() hits BUG_ON(!err) once the iterator backing the copy
> > runs out of pages.  Over io-uring the amount copied is not bounded by t=
he
> > payload buffer the server registered, so an unprivileged user can drain
> > the iterator and panic the host - mount a FUSE filesystem with small
> > payload buffers, then setxattr() a larger value:
> >
> >   kernel BUG at fs/fuse/dev.c:1064!
> >   Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
> >   CPU: 1 UID: 0 PID: 148 Comm: exploit Not tainted 7.3.0-rc1 #2
> >   RIP: 0010:fuse_copy_fill (fs/fuse/dev.c:1033)
> >   Call Trace:
> >    <TASK>
> >    fuse_copy_args (fs/fuse/dev.c:1354 fs/fuse/dev.c:1380)
> >    fuse_uring_args_to_ring (fs/fuse/dev_uring.c:891)
> >    fuse_uring_prepare_send (fs/fuse/dev_uring.c:940 fs/fuse/dev_uring.c=
:1057)
> >    fuse_uring_send_in_task (fs/fuse/dev_uring.c:1745)
> >    tctx_task_work_run (io_uring/tw.c:96)
> >    tctx_task_work (io_uring/tw.c:133)
> >    task_work_run (kernel/task_work.c:233)
> >    io_run_task_work (io_uring/tw.h:84)
> >    io_cqring_wait (io_uring/wait.c:278)
> >    __do_sys_io_uring_enter (io_uring/io_uring.c:2676)
> >    do_syscall_64 (arch/x86/entry/syscall_64.c:61)
> >    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
> >    </TASK>
> >
> > The reply path can drain it the same way, via the server-supplied
> > payload_sz in fuse_uring_copy_from_ring().
> >
> > An exhausted iterator is recoverable, so return -EIO.  All three
>
> super nit: imo, the reason for returning -EIO is unrelated to an
> iterator being recoverable.

You are right.  Also added the comment you suggested on the -EIO mapping.
Both Reviewed-by tags are kept in v8:

https://lore.kernel.org/fuse-devel/20260910235110.3922068-1-xmei5@asu.edu/T=
/#t

Thanks for the reviews, and for steering this to a much simpler fix.
Xiang

>
> > fuse_copy_fill() callers already propagate the error.
> >
> > Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> > Cc: stable@vger.kernel.org
> > Reported-by: Weiming Shi <bestswngs@gmail.com>
> > Suggested-by: Joanne Koong <joannelkoong@gmail.com>
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Xiang Mei <xmei5@asu.edu>
>
> Thanks for your patience with iterating on this fix!
>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
>
> Thanks,
> Joanne
>
> > ---
> >  fs/fuse/dev.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> > index 4fec31fc0b84..4148e4488d77 100644
> > --- a/fs/fuse/dev.c
> > +++ b/fs/fuse/dev.c
> > @@ -1061,7 +1061,8 @@ static int fuse_copy_fill(struct fuse_copy_state =
*cs)
> >                 err =3D iov_iter_get_pages2(cs->iter, &page, PAGE_SIZE,=
 1, &off);
> >                 if (err < 0)
> >                         return err;
> > -               BUG_ON(!err);
> > +               if (!err)
> > +                       return -EIO;
> >                 cs->len =3D err;
> >                 cs->offset =3D off;
> >                 cs->pg =3D page;
> > --
> > 2.43.0
> >
