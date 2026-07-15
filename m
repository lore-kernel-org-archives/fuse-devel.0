Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A18FFC0A
	for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 00:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073754; cv=pass; b=hy8yIimq7QfuoHiNaJcCyx6xrqQJnst4oZnLj8e4PPb6x1zsUB7TDbuDqsMfKFmEWdY+IdjxN3u81JwYBIRiUih191vKTFZF9njFGFff49jIrzZeCNSQQ0/Ov9Ivt16oSwuUMzPTEaimKHwuhLmiGumgoj82BXdtTy6TPzHm4rI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073754; c=relaxed/simple;
	bh=h+FfThwhAtsKLjTsiDbJn8yrjEOO6qbw5Lehz7z8BF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVMVN+CZ9SU1fkilxwW4azpXgu6N1VW5x23v/3CWb5zzjZkAPYX5R9nqSNhcqnnmBsIcj/DOB7oM4PVxj2TdocvN8fl/de3YKNz/VlCLd04TetLnV129CJeCnr2Nsna24AaWHuQD2V6ZhL2GdDJIPjuQCflRf33E3/jNyjp/XRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=fK3an7gr; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="fK3an7gr"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1675391a91.0
        for <fuse-devel@lists.linux.dev>; Tue, 14 Jul 2026 17:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784073752; cv=none;
        d=google.com; s=arc-20260327;
        b=kCwHPt5XiEXL9IZfZSgRZE6KLe7DpLR7ubJKoC49fWjuKklvnqhLiPhgBQTdvTyIcc
         3rnEeiBM0xk2aprG7kkheBmCdpnOto6y/4QUIAoYIUrD18dA7oRLCJV5D9wt54My8R4r
         8HNJbEguQzyNVMS8Sj5UWBCjZuL3b2y04KCim3dPuKxhvsXG7LT6OIRYxCzYi9bjc18G
         wILttefezmW4YPNL2WRIlwzX6k8ZuEAQe1YC/CgBHBWqRV7LQ4RChezlSoH8mrjAii4Z
         sjQ8XX2z2R+FTssA96KOmttaDRpbcvWlbo6s3N2XbBxnc4LIgH/vSOk43P9Tijme473z
         ginw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UnuTjnmFgMfuo6740K3Eupo1lRWLWkcBXrjIjKbCV6Y=;
        fh=9WtHb6pVr8e7frxnP8qm9Qb2LSN1aC9esIgck0HzdWw=;
        b=e/hg7GZ5yRDfcg/bL5XQanyTCDRq5PUDU4lDprvLYVwtDXLy+FbMuClxjDByNwh11o
         fvICSLdbmKpWDvEReiCY3wO5X0aNqYVAr4iO71k/3dWbf1kRFrBdrCdTpSgpKOAFxXzT
         Rkmddps+yjeUidRk/2/rbcHKauxOr5GgbjaiPiLNjTfE57AysE+EYR8uAqF2+s0KRzzX
         1pewLo+uI2YK+KWPCIU37DgHhPyUE7DhUjrWoFFNFyVfRIKCTVI69spRc2JWq9tDZ0tJ
         SQm3Y6Y0U+xCK8mw1/FpNDZMqWVhepwTmggp8q+qEyWoJPTs+UhSJwt66lUciFKoDKiG
         fa9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1784073752; x=1784678552; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UnuTjnmFgMfuo6740K3Eupo1lRWLWkcBXrjIjKbCV6Y=;
        b=fK3an7grdlgaxiZqBUcBN0jLK4YZQI/6PrFlVzzenpn0R99yMjQYVgHKJDFZlm7Lna
         rrD0MoG3SgbyWbf/aHcKb/vFJYTTvIFxiFSs/ezMHCj4AdrtPp3n7J9QazR3wYJ0MO7M
         kGN9IMnW8/rT1iLhQSbtSrEZz2H5g8/OsOJ4rXmBNZ/1MzN37vt3uouHCz3WcG04Wwkg
         8MV/yNcZVAFXV5w05tDCoxahEQSKi4vUitLnwEmLN7sexc6xbmFLipUh1pgUg1RPELvj
         wErahUu52eNeFwxKUwBUGSnXn6P4CBMsAWAKRX3/FmvZfFa4dP2gO0DElQapmT53gusK
         o6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784073752; x=1784678552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnuTjnmFgMfuo6740K3Eupo1lRWLWkcBXrjIjKbCV6Y=;
        b=ihAozs/yEqdQDqJwJ2tDdONYE9A054XnMpOGQhIxCGL8FhxITz4+cXpiHKfwAo7pZx
         dJOk33JxPoJt9E2dWNy/i4CUgDYqA5TfFzKWjdYJDfUqvSorXQR9TwaNNUot8ueZCe6k
         9VL+GrQyhex52CXBNHfVV0k1w2E87MEAWwEqkoaqr54r0+hynbkheKexwSpXRhweugJj
         /0MHCyjWPI+g1vqpxWuTT/Pw7+j5b971HEJwyLHhje7Tn3ngnOS/D+gZnyS3fSbdXH1M
         qb/r/Y88JGuNzOHaKV6hvvdrKeI7wMwdT7u8Mh9ks4A44epFN1rD6kejq9Z1ygVSJI5M
         +cRA==
X-Forwarded-Encrypted: i=1; AHgh+RpP1JcxlZnj/2G4E88aify1WXkKllKjuK/pAdbeSsdcV5TSOsVq/isjFzQx2RUVnaGn6Vo3vt8CDZRA@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd2SJ1Z4aES1lT312ukSUiWvNmufmI3vCbdDqDcmsYkeFlP0Uz
	bUvTgj3W+59yY17JWKL/4c1Hl5clfWKNKu1RAWdclBqYYwu5QOIqbh0nNk4nZH5OJVPko4LWWMT
	mxjwuJ7dgSzghtuLrzdn08wHJqhEkqL6+H7h/6vV6
X-Gm-Gg: AfdE7cmJ6+lXNQudj27LGtsVpTdiB8O921mKVRXtvoghQ9q18Mrgj2nbJdeLveTTzsl
	cR76bejtYcJZZt+1dEVlbDTQFXgn+qz06SDX8hDyG2QyaRRfYSbpyGutXpkwVVtm2AlDHh9a+I3
	Eq7lk8OVtM+Pbn8c9oWLzDd4F9xbUtx3wF2qjO9zijCf/ftQmsm6SlCWjSh/X9M1/Z7o5qa0u+b
	Ysn+Ec2UmKJF15LJG5kd2xqWGy/cEkJsfqGs2n2RSOg+F770RBZsFNQ/wznhZ0bCoN5/13a
X-Received: by 2002:a17:90a:d888:b0:38d:e442:901e with SMTP id
 98e67ed59e1d1-38de4429227mr11151009a91.27.1784073752604; Tue, 14 Jul 2026
 17:02:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709211130.543773-1-xmei5@asu.edu> <20260709211130.543773-2-xmei5@asu.edu>
 <CAJnrk1Zek9hHOehCjfmR42+Gc=K6vixmyn5977ZHv3J5fUUS_A@mail.gmail.com>
In-Reply-To: <CAJnrk1Zek9hHOehCjfmR42+Gc=K6vixmyn5977ZHv3J5fUUS_A@mail.gmail.com>
From: Xiang Mei <xmei5@asu.edu>
Date: Tue, 14 Jul 2026 17:02:21 -0700
X-Gm-Features: AUfX_mzd0bNUZ1WrqBewM4QFIpp6lYAazaXnydYq8-EXrZeSN8zxpdJ6-98A3gA
Message-ID: <CAPpSM+QQ0BRuVizUePYBj9+UJC0Sxsg1RpEa_u1woShg-TkRhg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] fuse: bound io-uring payload copies to the
 registered buffer size
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 10:24=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> On Thu, Jul 9, 2026 at 2:11=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
> >
> > The fuse-io-uring transport imports each ring entry's payload buffer at
> > ring->max_payload_sz and bounds both copy directions against that value=
,
> > ignoring the buffer length the server actually registered.  Both the
> > server-supplied reply payload_sz (fuse_uring_copy_from_ring) and an
> > oversized request payload such as a large FUSE_SETXATTR value
> > (fuse_uring_args_to_ring) can then overrun the imported iterator and hi=
t
> > fuse_copy_fill()'s BUG_ON(!err):
> >
> >   kernel BUG at fs/fuse/dev.c:1053!
> >   Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
> >   RIP: 0010:fuse_copy_fill (fs/fuse/dev.c:1022)
> >   Call Trace:
> >    fuse_copy_args (fs/fuse/dev.c:1329 fs/fuse/dev.c:1351)
> >    fuse_uring_copy_from_ring (fs/fuse/dev_uring.c:686)
> >    fuse_uring_cmd (fs/fuse/dev_uring.c:1226)
> >    io_uring_cmd (io_uring/uring_cmd.c:271)
> >    __io_issue_sqe (io_uring/io_uring.c:1395)
> >    io_issue_sqe (io_uring/io_uring.c:1418)
> >    io_submit_sqes (io_uring/io_uring.c:1649 io_uring/io_uring.c:1934 io=
_uring/io_uring.c:2057)
> >    __do_sys_io_uring_enter (io_uring/io_uring.c:2646)
> >    do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall=
_64.c:94)
> >    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
> >
> > The request path overruns the same way, via fuse_copy_args() ->
> > fuse_uring_args_to_ring().
> >
> > Store the registered payload length (payload->iov_len) in the ring entr=
y
> > and use it for the import and both bounds checks, so the buffer the
> > server provided is honoured and an oversized reply/request is rejected
> > (-EINVAL for a reply, and -E2BIG/-EIO for a request, matching
> > fuse_dev_do_read()) instead of panicking.
> >
> > Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> > Cc: stable@vger.kernel.org
> > Reported-by: Weiming Shi <bestswngs@gmail.com>
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Xiang Mei <xmei5@asu.edu>
> > ---
> > v3: propose the patch fixing another issue found by Bernd by Joanne sug=
gested way
> >
> >  fs/fuse/dev_uring.c   | 9 ++++++++-
> >  fs/fuse/dev_uring_i.h | 1 +
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index 0814681eb04b..248e5a3e340e 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -650,7 +650,7 @@ static int setup_fuse_copy_state(struct fuse_copy_s=
tate *cs,
> >  {
> >         int err;
> >
> > -       err =3D import_ubuf(dir, ent->payload, ring->max_payload_sz, it=
er);
> > +       err =3D import_ubuf(dir, ent->payload, ent->payload_sz, iter);
> >         if (err) {
> >                 pr_info_ratelimited("fuse: Import of user buffer failed=
\n");
> >                 return err;
> > @@ -679,6 +679,9 @@ static int fuse_uring_copy_from_ring(struct fuse_ri=
ng *ring,
> >         if (err)
> >                 return err;
> >
> > +       if (ring_in_out.payload_sz > ent->payload_sz)
> > +               return -EINVAL;
> > +
> >         err =3D setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE,=
 &iter);
> >         if (err)
> >                 return err;
> > @@ -725,6 +728,9 @@ static int fuse_uring_args_to_ring(struct fuse_ring=
 *ring, struct fuse_req *req,
> >                 num_args--;
> >         }
> >
> > +       if (fuse_len_args(num_args, (struct fuse_arg *)in_args) > ent->=
payload_sz)
> > +               return args->opcode =3D=3D FUSE_SETXATTR ? -E2BIG : -EI=
O;
>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
>
> Not saying you have to do this, but if you wanted to, I think it'd be
> nice to have a separate cleanup patch that deduplicates this setxattr
> special casing logic between the /dev/fuse path and here.
>
> Thanks,
> Joanne

Thanks for your review. I updated my 1/2 to make it an elegant patch
and added your suggested cleanup as 3/3.
1/3: drop previous tags; reserve the fields for user copy
https://lore.kernel.org/fuse-devel/20260714235408.1666063-1-xmei5@asu.edu/T=
/#t
2/3: no change
https://lore.kernel.org/fuse-devel/20260714235408.1666063-2-xmei5@asu.edu/T=
/#t
3/3: add a helper to return the correct error code
https://lore.kernel.org/fuse-devel/20260714235408.1666063-3-xmei5@asu.edu/T=
/#t

Xiang
