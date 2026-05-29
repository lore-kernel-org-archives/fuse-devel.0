Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449A2348C48
	for <fuse-devel@lists.linux.dev>; Fri, 29 May 2026 10:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051081; cv=pass; b=KgRjeNLuepGvsr3ksTuxWGZ00AZ7SNcRvxzk3HujrKsbzdPb6HhqfBum5W04gMI8ONqRsYoKnvOD2vmomZamCR1ye9AoAIWnWqbUa/07k0TZw2+tqsGrBMnBppMw6cs6qV1EXfG0QZa/Hz6xAYEMj4ZBRsPHuvBM6eWj963oD60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051081; c=relaxed/simple;
	bh=tS4uI0mMcUc2MF7uKysybFyvYLV2CgM5/oz4eOwJhXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ulxKdfMEPPJNYWuemiiGd+mxKPsFD3LNGZ0z3IMRnKrqCmSP76wLqGSKG6AqWuerxx6pyq8v/Wx8/ijC0M3y/bpT62BqFvcGZkz2gDdW9Qei3DRKQ4bvHiXYT2OhxxOi8rzn9VsL8mLECpme9E8O0z38gMKM59IBRJEBzoR+i78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6cLP1ao; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6cLP1ao"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68c08bfe5afso994850a12.2
        for <fuse-devel@lists.linux.dev>; Fri, 29 May 2026 03:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780051079; cv=none;
        d=google.com; s=arc-20240605;
        b=f2A/5D3FlGzP0aIXzSh6ol9OQTizwg9hx4SFbn5bnJMxflqkmjh/fqo6akISA1Lg6H
         cPrmCKA6v4P5S009Y+k0bSqpFcHgozouDGNJmVL8yxoqB3YRPbCDdoq54wUtPgE+4VTN
         XQs5yX1HX4FnxhPM8e8PxmLmdnCJNNEBfvkqZkOwslKgRWWuiK1L50+0e51skh92Q8Fl
         i7wkIsnF20RWA/jiqKvcr8Lla/yaYQo29XgwJzOk5uXVeEaM/11l32kbutb5G/ILCzRj
         IqavJEXp351+XWthRM55kGCHWHaNqsdpN4XFmmXRcZPyF8XdwrMttsazS2MDtAyulVYl
         mJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GZeRKoRAQ58Ikse+ibjbxgcZcg7J/BCRu8Mvsg/PLXA=;
        fh=gODrctjzd1CmwDDexfFBrSPQb8Lp08udLNpc2lVhzA4=;
        b=OcK+iY+jJ0H86dMIJFye//Z8H8elu3EZYdS98jv+94Ir3g5hpSdBtLwOqRJPlmA64K
         SU7QQus3maBPxPIP8Q9TtC7F3nNbHI4Bf0BMwbqwfn/1qXJfAW0xYqW8u4KB2cHMq1UZ
         sZMCzZLVNu7ZiEX9hiW09INwHMGkR7IfHESCwE1oLKpsozXobU/zIwAvNgUWkjCjIl9a
         WJ+nV4cMi/Kv/Y1Ae4ABG5DXWOMjyZFGLV3eowfIol7RVWMYKttPhF7spSwZ+j4tiyHg
         rKmYSpczhqVBE22a0cYUixUy/bO/M+zrshEDl6CqYB0rZHyE61p/zNsC5VVbn2RHrgQo
         9TIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051079; x=1780655879; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZeRKoRAQ58Ikse+ibjbxgcZcg7J/BCRu8Mvsg/PLXA=;
        b=i6cLP1aodDNAgd2kl8d1pWnh72CocFnfdKw/mX8m4OSE+tdWdYHImJrPH681u0Qntz
         z52B704HYnAzg/jeQ/mQutx8r9wsmvOiYMmhaQHGkjvRmF+Adm8wS9WCyagR4R48UlL0
         kux6Us7sVU3ZSUkyAiTVALeDzpctxa+yzUDrOPpuFZVW34jPk5+892E8SNAMI8W80dlX
         TqtAqJUFpkAYRuSCsi6AL5A+xloXikWiGTte6Otcrn7Gwq+c2Z7BjF3dnWDpo0AFHfql
         cTXVd+VsfuK2ljUUa4QGB8HUC5AhHDlNaTSgReyl1GZXanyQdRtAASaUfhSA2XqSDsif
         6oNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051079; x=1780655879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GZeRKoRAQ58Ikse+ibjbxgcZcg7J/BCRu8Mvsg/PLXA=;
        b=KtDR+HP+huD3puyoW2hzIbuNU8rb3PtjSfrvtF2YFERsYE4P8LEZbafOMdCEAgl6nO
         ZXZpfQtZbsneegCLq0ePla3QN/a+X2qff1XX4H1yJXBVdlP1EtcGF/wFMiL/SOb/A5xq
         FxqIhDx8HQ7tNHRkB9O3syTy2ayn/yoyjutI1rqSLVrHaQaEGSPOyt63Bau/gELQJF/S
         b8eOLPsg0nftRBirjSVO4MAzktcYgbZJVbDEOEY35kW1dWeu5Z6DEPf/j8khhi6tHX62
         tbxCfDsO08LMuM6+GycYUsap8XP8CIKdyLcbwizpONNDutvOOKBuB0NPYuIaWU6BbZwD
         eh5g==
X-Forwarded-Encrypted: i=1; AFNElJ/o7MWEdr3HJP68YW036T6dU249XwoPU/pu2aeva8LetRomkkJkyTcy7DaPvwYXAUffl5w3ET7PFGMa@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8StG4kzpQu/LObH52SC2UeBkLPii7TWT8UJ7xb19o/Iqnr+5E
	rsVkPOpAXTMMHY3Ge3Fk0W7ru/jDe0qy9R/r4e/fVzMxBkjDPhRDUGvEnjGX2+lWK3TBXR35QG5
	ua8siy7HzdjOgniHfv53gmjfFgxLlchQJBQYSk7E=
X-Gm-Gg: Acq92OFmCHS0qe+y1CxzQFneloX9BvKVXS8yTcmWk/L62BULbB+z8bOTOoEykherRK8
	DnBpy6xWHe4BfUa7IDKaH4AWQDJO7upEdDxBQdFr0L9rfVA/I1cyOvVZOuGK6vX7I0FTYihOZl7
	eiPfzxQDoQXFdPfHd9aKB0jSH77x+Ayk/IguEKrCn9eMVxArWu+c3aO1t6iWhfmui6Yqukldf6z
	Bqq+leKmB7am42Tqhqn3KjirOlo3bKk1zu9HqyvgZ4MKbX4uc/pHiREfqSXhK2BGXP7u2bu0wuU
	GSowDTlibtTfjf6pL++WznEoorJFT1YrYCXSfGilBYvUQ6FYXvnn
X-Received: by 2002:a05:6402:5191:b0:68b:9eaa:e6c with SMTP id
 4fb4d7f45d1cf-68c10d6ea60mr1220379a12.3.1780051078278; Fri, 29 May 2026
 03:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527171808.828637-1-amir73il@gmail.com> <92906aae-a3eb-4ea4-adad-7289045fdbff@fastmail.fm>
In-Reply-To: <92906aae-a3eb-4ea4-adad-7289045fdbff@fastmail.fm>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 29 May 2026 12:37:44 +0200
X-Gm-Features: AVHnY4IkAL7tk7pSpWFzYFZTGtdkRY5OTgq4Rai9CwAyt7wVlRc926MdB06-kFo
Message-ID: <CAOQ4uxiNZPA7SiCf_nkJFa_9HZetJGDn_REoihRTX9ePYpqMmg@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fuse_request_recv tracepoint
To: Bernd Schubert <bernd.schubert@fastmail.fm>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 1:01=E2=80=AFAM Bernd Schubert
<bernd.schubert@fastmail.fm> wrote:
>
>
>
> On 5/27/26 19:18, Amir Goldstein wrote:
> > This new tracepoint complements the existing fuse_request_send (enqueue=
)
> > and fuse_request_end (completion) with a tracepoint at the transition
> > from "pending" to "in-progress" at the moment a daemon thread dequeues
> > a request from fiq->pending.
> >
> > This is needed for tools tracking the in-flight state of fuse requests.
> >
> > Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> > ---
> >
> > Miklos,
> >
> > This patch is not technically a fix patch, but it complements the
> > tracepoints that were added in 6.12 by commit 396b209e405a5 ("fuse: add
> > simple request tracepoints"), so it is my intention to backport it up t=
o
> > 6.12.y for use on production kernels.
> >
> > I came across the need for this tracepoint when working on fuse queue
> > monitoring tools [1] for our production env.
> >
> > The fuse_request_send tracepoint is broken on 6.12.y, so I also plan to
> > post a backport patch for 0d375a1385ed8 ("fuse: capture the unique id o=
f
> > fuse commands being sent").  Not sure why it was not tagged as Fixes.
> > The existence of fuse_request_recv
> >
> > This patch is intentionally based on upstream fuse (v7.1-rc2) and not
> > on for-next branch, with ease of backport in mind.
> >
> > Specifically, commit 80cea98b648ba ("fuse: change req->fm to req->chan"=
)
> > on for-next needs to apply the same change to the new tracepoint as wel=
l.
> >
> > Would you consider applying this patch at the bottom of for-next and
> > make this adjustment to your refactoring commit?
> >
> > Thanks,
> > Amir.
> >
> > [1] https://github.com/amir73il/bcc/commits/fuseq/
> >
> >  fs/fuse/dev.c        |  1 +
> >  fs/fuse/fuse_trace.h | 22 ++++++++++++++++++++++
> >  2 files changed, 23 insertions(+)
> >
> > diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> > index 5dda7080f4a90..583155157d117 100644
> > --- a/fs/fuse/dev.c
> > +++ b/fs/fuse/dev.c
> > @@ -1475,6 +1475,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *=
fud, struct file *file,
> >       req =3D list_entry(fiq->pending.next, struct fuse_req, list);
> >       clear_bit(FR_PENDING, &req->flags);
> >       list_del_init(&req->list);
> > +     trace_fuse_request_recv(req);
> >       spin_unlock(&fiq->lock);
> >
> >       args =3D req->args;
> > diff --git a/fs/fuse/fuse_trace.h b/fs/fuse/fuse_trace.h
> > index bbe9ddd8c7169..289a279b3c312 100644
> > --- a/fs/fuse/fuse_trace.h
> > +++ b/fs/fuse/fuse_trace.h
> > @@ -101,6 +101,28 @@ TRACE_EVENT(fuse_request_send,
> >                 __print_symbolic(__entry->opcode, OPCODES), __entry->le=
n)
> >  );
> >
> > +TRACE_EVENT(fuse_request_recv,
> > +     TP_PROTO(const struct fuse_req *req),
> > +
> > +     TP_ARGS(req),
> > +
> > +     TP_STRUCT__entry(
> > +             __field(dev_t,                  connection)
> > +             __field(uint64_t,               unique)
> > +             __field(enum fuse_opcode,       opcode)
> > +     ),
> > +
> > +     TP_fast_assign(
> > +             __entry->connection     =3D       req->fm->fc->dev;
> > +             __entry->unique         =3D       req->in.h.unique;
> > +             __entry->opcode         =3D       req->in.h.opcode;
> > +     ),
> > +
> > +     TP_printk("connection %u req %llu opcode %u (%s)",
> > +               __entry->connection, __entry->unique, __entry->opcode,
> > +               __print_symbolic(__entry->opcode, OPCODES))
> > +);
> > +
> >  TRACE_EVENT(fuse_request_end,
> >       TP_PROTO(const struct fuse_req *req),
> >
>
> I find the name 'fuse_request_recv' a bit confusing. Why not
> 'fuse_request_read'?

Well, to balance fuse_request_send of course ;)

I'll note that _read() is not adequate for iouring, which bares the questio=
n,
should we also add a tracepoint at iouring dispatch:

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 7b9822e8837bc..97cb990bf9de3 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -702,10 +702,12 @@ static int fuse_uring_prepare_send(struct
fuse_ring_ent *ent,
        int err;

        err =3D fuse_uring_copy_to_ring(ent, req);
-       if (!err)
+       if (!err) {
                set_bit(FR_SENT, &req->flags);
-       else
+               trace_fuse_request_recv(req);
+       } else {
                fuse_uring_req_end(ent, req, err);
+       }

        return err;
 }

Not sure which pid will be traced here? the libfuse queue worker thread pid=
?
Is that meaningful to someone?

Another option for a tracepoint name, looking at the above would be
trace_fuse_request_sent()

But I would not change the name until anyone insists.

Thanks,
Amir.
