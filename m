Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AC637DEB6
	for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 02:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789007388; cv=pass; b=RwjesJQA6KcTFk4wtizHBdy0bMYQB722FaK8o7OxtQXjaJgrRycPVwgfmkyjFqFXzJMYmXd145utiz2KebE9eIJ+Cnj3likZebAJ0kj1RVK16ttbS/a5XGr677c6mwFJxfStkqtiMrF4kjnq9lmdg/W6z5HuSTb1YLHrgNy/v5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789007388; c=relaxed/simple;
	bh=3Q+8nuxGqPVQSZj1oFD9maUUSRsIHN/XrLNvu+6zoS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2db1IDYFce5oxJkp/4Pyz2MsurlMIFlpGto2tTquRV7V+bJkg1PQC1sS+RSU9qoPrtBYmdlHF8Tpq01XVfsTXbkDhgc9dxBTlr7JXVtd+EumbLgjfDuIchVtvEMUg+cH7H5Egi5Bckm+zXTWizgnNygc4MQOrxp5V3pMU5BAZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=VOPWfcTw; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="VOPWfcTw"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6f9e2f681so74534145ad.3
        for <fuse-devel@lists.linux.dev>; Wed, 09 Sep 2026 19:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789007386; cv=none;
        d=google.com; s=arc-20260327;
        b=gt2tV4/xCRGGAMLG8gQqnoab1RYDGVVwF8o7Esj3y+AK2c+ZaiULAKYuFhx34mYMEP
         NSgYJLJTtdVCiG4z2C4CblLLuy4a8d/w2ovAICA0fFwQMK6e+SfD+CmYRZN/dKkT6yZw
         GyPttmELdj6RvC73Vn/X7QXaq4JikywHAgjPRvcSVN3zJd+nAt7dcyMDDYUFfvApglfV
         nGN/N6+63uEY9gPv9SZAOThwVfUvAFY7bIJaRXZrmXxOIvFaqsNc+SisJH43Y+ETqiPK
         2As3NWJRJbrxWlPU1UDdkzQrhQvBG4FvZigveMpnv80NmrYSNt+WEFJxXzfwBRkMTlS4
         bTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wv1FNI/9qgEGS0u+wWB98TjriXkQzGjxeqk0TCTlFWg=;
        fh=IMunCjryLVcYp8j/3ABIu5F5e1ycN8eH4fNfvtLtZ44=;
        b=dTgWcuJeAIvNvoiYTBej9UQxxZn4dbPSWdpd5RVyXFTq66m8G4H0t79c+koQhyXA90
         ipy2PGyov6WQ7u3N7juVETxniYTZSMVs8PE7SAxuCCQxgf3KBNzjY2Z+y2FUR3QEezJd
         1+toqq2L4sbZ1iYWZaMMOpYGjKHK5OnlmM352zOlFg0w08B9xQDX2nwsi8dqEGm5Fuiu
         K0eEQZCe6ZTsB1s5pXKOpU2YFnKF7KIV/DSbqiFqGrUb5aZvQziaxnhW4VO60r+b+U0j
         Smhj/HzxPML23yAqyLt0hhpjJ/rmYPjcHsIVLayOzDWK1SDtcYirP49dbqcQg5cy4cmO
         egyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789007386; x=1789612186; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wv1FNI/9qgEGS0u+wWB98TjriXkQzGjxeqk0TCTlFWg=;
        b=VOPWfcTwkJRcTxLtyafGZt0LEzXAA3fS3EQvlgpiuGA6gRW+KroE7OcbS9Ljy1uv7R
         qrpUXOdReC/JbJPgkSuccrsR/wgCD8KHGsz3r9Xm5bdd5CXeAOY7V8K7VZNZyeugPS2t
         2awaL8NbDkGn6fRRBRgsSHEvgDH6LHk0tQeHibjRgpQbB2BvJtmH4ownDdr+vKGeD94w
         LeM/Jym2Skz/uBiuydBG0R4bXyFcB0hFHsBFjFlQGXm/FJBhqgVJQ7X1Q23KzqNV73DI
         f8ceRnKc0e9Rc/LnZ+3tXgRsKIPh0HIZ4LBfqLe38Lnla/CW6viBQmk1p0uGAv+QaIVZ
         2y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789007386; x=1789612186;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wv1FNI/9qgEGS0u+wWB98TjriXkQzGjxeqk0TCTlFWg=;
        b=QEaUx6ZAZ6dLdGoSGMU95S0iQsAw/XBZBH3taykE6QGVV3h2QU9QAGvp8Ri6NLMYYp
         L6a218h/JB4g5Z8ZCShO/MAwxC/srZOdH2SHXF/htshCZnd9bWd3mYtQ+689nUZN/xiN
         OrLJC4Px4Tnc+cxL0ywMHeAgEDDyUfQNHHFJIRxvsFzGYvQaPzD9t7ars2chHVDJDpkc
         Hp28xbv21anEjMaJpkA/JK3x05gmqy+bs0ddodeeurlTzduo7ksUlVtInQDZhokQCr1w
         Q26vkTNoBJtIGCsD2nc/BC3JTMqBwnLXJAriFGlWKRdo+6LS6RHqfVYDS2xOZcqUgCIf
         /ISg==
X-Forwarded-Encrypted: i=1; AKwUvByUWMZ1uGf/osMfzzOgpuqSPEn/69MCQrbIW8hzvTAarAQ5NogKt+yjkaQ30RMd3dmS5/8zIQrS20t3@lists.linux.dev
X-Gm-Message-State: AFuF++lOxz8Q7ke5b7eUyjqeEm+iiKXVGwESo0gr66uapwpXq1LGefMf
	h+AUI96kwtwXgx5JKH+1WRCSr6BA7dc6V+kJ1b+2Y9GR2bGEKaY4s9nRagHMYzgrayFMNxez8K4
	MRBiOVpCc9hjPbycPMKEtmysqD8KzTrtEQliAaQiW
X-Gm-Gg: AYBFou3qZjstp9Hm52N/IiGQ4bMJw/tnL7L9QiGBij7jMCRb0RQmqHvbbS+szJhFQrY
	913LcIN609MJy0Sk1m2nZSvlHn+uFd4CCbDzDD5enQxG6strPV2NM+ZPO5OY53q7iOdM1KbZGcI
	VDWmzbOpLBq67LbDjC8BgRq7DQlxnt3gXqUXlts8Xh7Nue5+P0lQKPYQw6PJf0fAnZ3D6LIP7YI
	BQe96z2io4LC9GpAtNAx0v2yywUsremZjjaDxAGTAWuWeiNWLz2gJmnbpUoPTUANDTTl0M/MDx4
	cL4gB5xreuzRX+59qE2/gCF/j0SVzrAy9GaV5MrMdhD6YMx1x+vnuGKTutHAJBQ7Y1hAHvJE7Xs
	8Tvll2ZnBqHBhwknDMy6e
X-Received: by 2002:a17:903:19d0:b0:2d9:2688:8be6 with SMTP id
 d9443c01a7336-2db126346b3mr512034685ad.19.1789007385629; Wed, 09 Sep 2026
 19:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260906012924.1928316-1-xmei5@asu.edu> <CAJnrk1aXL9QuW+USSbx2La9qgNYU8jybqqpoSSRo6wEAAZqxAw@mail.gmail.com>
In-Reply-To: <CAJnrk1aXL9QuW+USSbx2La9qgNYU8jybqqpoSSRo6wEAAZqxAw@mail.gmail.com>
From: Xiang Mei <xmei5@asu.edu>
Date: Wed, 9 Sep 2026 19:29:33 -0700
X-Gm-Features: AcwNN1U6zE_X4bJd6QR0EAJdGCnUmeNIAvwSwRgyIUMzXD9aLMi9DOMScOAVzOo
Message-ID: <CAPpSM+TySLViMxRPcN2zjXhcdTouwuYYYiQzqqLQEC-W4YZnjw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] fuse: bound io-uring payload copies to the
 registered buffer size
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, Baokun Li <libaokun@linux.alibaba.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 12:20=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Sat, Sep 5, 2026 at 6:29=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
> >
> > The fuse-io-uring copy paths do not check that the data they copy fits
> > in the ring entry's payload buffer.  fuse_uring_copy_from_ring() passes
> > the server-supplied payload_sz straight to fuse_copy_out_args(), and
> > fuse_uring_args_to_ring() copies the request in-args without comparing
> > them against the buffer.  Either can exhaust the imported iterator and
> > hit fuse_copy_fill()'s BUG_ON(!err).
> >
> > An unprivileged user can trigger the request side by mounting a FUSE
> > filesystem that registers small payload buffers and then issuing a
> > setxattr() whose value exceeds them:
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
> > Bound both directions against ent->payload.iov_len, the length the
> > server registered, so an oversized reply is rejected with -EINVAL and a=
n
> > oversized request with -E2BIG/-EIO, matching fuse_dev_do_read().
> >
> > On a zero-copied request the last page-backed argument is handed to the
> > server as registered pages rather than copied into the payload buffer,
> > so exclude it from the request-side sum to avoid rejecting valid
> > zero-copy reads and writes.
> >
> > Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> > Cc: stable@vger.kernel.org
> > Reported-by: Weiming Shi <bestswngs@gmail.com>
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Xiang Mei <xmei5@asu.edu>
> > ---
> > v2: add: Cc stable and Reviewed-by tags
> > v3: propose the patch fixing another issue found by Bernd by Joanne sug=
gested way
> > v4: no context change as v3; add Reviewed-by: Joanne Koong ...
> > v5: no change
> > v6: rebase on fuse.git#for-next.  The ring entry already keeps the payl=
oad
> >     iovec and imports it at iov_len, so only the two bounds checks are =
left.
> >     Skip the page-backed arg on a zero-copied request, it does not cons=
ume
> >     the payload buffer.
> >
> >  fs/fuse/dev_uring.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index c6dd420c4034..981b7c295e5e 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -775,6 +775,9 @@ static int fuse_uring_copy_from_ring(struct fuse_re=
q *req,
> >         if (err)
> >                 return err;
> >
> > +       if (ring_in_out.payload_sz > ent->payload.iov_len)
> > +               return -EINVAL;
> > +
>
> This logic will break fuse zero-copy reads (ent->payload.iov_len is zero)=
.
>

You're right. This check wrongly rejects every zero-copy read reply.

> imo I think the cleanest fix for this bug in general would be to just
> remove the BUG_ON in fuse_copy_fill() and return back the error, eg
>
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ static int fuse_copy_fill(struct fuse_copy_state *cs)
>               err =3D iov_iter_get_pages2(cs->iter, &page, PAGE_SIZE, 1, =
&off);
>               if (err < 0)
>                       return err;
> -             BUG_ON(!err);
> +             if (!err)
> +                     return -EIO;
>               cs->len =3D err;
>

Agreed, and it's a much better fix than bounding the copies.

> This would cover both the request and reply side and get rid of the
> special logic here and below. It'd also make backporting to stable a
> lot easier. I think it would still be worth having the FUSE_SETXATTR
> errno fix (eg returning -E2BIG instead of -EIO)
>
>     if (fuse_len_args(num_args, (struct fuse_arg *)in_args) >
>           ent->payload.iov_len)
>               return args->opcode =3D=3D FUSE_SETXATTR ? -E2BIG : -EIO;
>
> as its own patch, where that check is only about picking the right
> errno, not about preventing the BUG.
>
> WDYT?
>
Thanks for your suggestions; this patch is better, and I have sent and
tested v7:

https://lore.kernel.org/fuse-devel/20260910022442.3594649-1-xmei5@asu.edu/T=
/#t

Xiang

> Thanks,
> Joanne
>
> >         err =3D setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter=
,
> >                                     issue_flags);
> >         if (err)
> > @@ -854,6 +857,7 @@ static int fuse_uring_args_to_ring(struct fuse_req =
*req,
> >         int num_args =3D args->in_numargs;
> >         int err;
> >         struct iov_iter iter;
> > +       size_t copy_size;
> >         struct fuse_uring_ent_in_out ent_in_out =3D {
> >                 .flags =3D 0,
> >                 .commit_id =3D req->in.h.unique,
> > @@ -887,6 +891,16 @@ static int fuse_uring_args_to_ring(struct fuse_req=
 *req,
> >                 num_args--;
> >         }
> >
> > +       copy_size =3D fuse_len_args(num_args, (struct fuse_arg *)in_arg=
s);
> > +       /* a zero-copied page arg does not consume the payload buffer *=
/
> > +       if (cs.skip_folio_copy && args->in_pages && num_args)
> > +               copy_size -=3D in_args[num_args - 1].size;
> > +
> > +       if (copy_size > ent->payload.iov_len) {
> > +               fuse_copy_finish(&cs);
> > +               return args->opcode =3D=3D FUSE_SETXATTR ? -E2BIG : -EI=
O;
> > +       }
> > +
> >         /* copy the payload */
> >         err =3D fuse_copy_args(&cs, num_args, args->in_pages,
> >                              (struct fuse_arg *)in_args, 0);
> > --
> > 2.43.0
> >
