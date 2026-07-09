Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529E424BD03
	for <fuse-devel@lists.linux.dev>; Thu,  9 Jul 2026 21:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783631782; cv=pass; b=QN/MsAEvIwaOeQehKGwW5PA+MLS6+VLlFTfGeS/BAqsn2aIpCpyjrYEw2OsXOiT/xeJCkzLZA8X4htn+SY+s7MIOuM2RiogC7ovLiiB9BcK1ckb9McctWHUdFDWhOKdKYJKxlEE7wqwFq9WRtouD022GzoL7OEf+1nCvVLZL7NY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783631782; c=relaxed/simple;
	bh=jea2pkAA6ea7ThGIL5ZY5V0mW7MFcoJRXwU1VdT3S6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMPhTBoSeMe/vzpMHuJRoUR5g+jLGNhT7PQWaa/jolU5ioUmD+xBO9rb77J60/0Y3/hb6cga10dLPJEMb3sGhodATNi8ZZsoDt4yyMKwNsCj1dB4iVwRnGbGxfMB5AymYr6YuzPYn804LybtGRzNvMivXmROA3YMrjYscyeIEFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=iuvTxIYQ; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="iuvTxIYQ"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8eefd0c5f59so2608986d6.3
        for <fuse-devel@lists.linux.dev>; Thu, 09 Jul 2026 14:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783631779; cv=none;
        d=google.com; s=arc-20260327;
        b=jH+LEjouKl/+WAmipjSfOtN4ucVVJXCKhUV5cuSC1GjNQwmGKJwlD7lGR/xiOCzQjV
         m1AUyDGZiZoAgQctHFQ9LT4o8/JMfvYkuNNuLkot8CwSuDE4ANckfNOQYtBilZVwOdxn
         5drFJ1NJQrytGHHUaSvShE5dxO4yTtT6XZxz7pvT9O36+KTzIfywlmqCEjaXbu4rY4Ih
         z5p7ENywNERzqmBqXVnAJi4Gav+gpdp71O1jEQ+oMXMN+NHJ4ThBny/gL0jM4WPxTM6d
         CBHyIMFVnrl1oVMmstVZVp/Jm80T5lidKFXRzQvsvyJtwTGy4+nLk/zX6kIKR6FYiiBE
         aiHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f/eyQ3BGdkreyE1jriesgVUy/TQf36x8ArcgwmCBFp0=;
        fh=uETGu6BfGhIjtgiMH+JPaoRNr5Ct4LqP07gShgu9FgE=;
        b=ILKHmYhG3FQ/CXubrId9stZeY76pO0zZM2xEEyLCIJj7Q7EFWj9eQHKMzHXhYkUYV/
         A+HwtDSVFYmr3H2LtlR+uHuu/Yzcg0RaOOsddExjRrQOJ2jQB2+vytpypPmmkKcimylQ
         Mqz2AUUzA4UJ20BskIfZDv9T5Y/CR0w1ngbpKgkTf/BGOx/MBfGHXVNTDcL+ZeTATWL1
         g3A2s8ckxIbg8p05kR1gLIh9K64GVWmdqCLZ8YQKSFffBGXnlRb6+C0uVdL5vXIL+RHx
         zJEbRbDY3XnNuZpAiAvuUYklU36sa3DHxA8REjPUuQCjXpzdivBt8w6osZ72M+rZoBee
         MaUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1783631779; x=1784236579; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f/eyQ3BGdkreyE1jriesgVUy/TQf36x8ArcgwmCBFp0=;
        b=iuvTxIYQBLrKr7IEd+AELtAaClU63PKWO/drNClNJIaB77ic2INQ7PsxntEeQdSKFS
         j3PAPVoCGv2gphWU8qqskxiqymbhxMns3ZxdZcE/H8+1jNLhum4Qb/Hm8XOZEj+9HAXf
         mus6rSQusG6/Qmf2sLZ+wfw2xOnCmy4CJ9FjfoH4L8U5kILxMqxLdEZl89QFaYWRKiPZ
         H4uL543NmzNyCXjGfAKmd9T+eaHYv5fQTMkaxz9TOryVxxjBzl4paSfcc2ePXbNtMraM
         Dt/vpr/7doLx56ZThon5nCK4J3Pk+GGl3JOHG6TtVF51N9w0q/37lEMQT6nSWv9KKRsT
         XUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783631779; x=1784236579;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/eyQ3BGdkreyE1jriesgVUy/TQf36x8ArcgwmCBFp0=;
        b=V38wu4tq5Kvi2KYN9djB7J2PFtzKGQmEXw0bxHyjqIyG58dA11n7WB1PwZybWc41gf
         oNI7Gh1e14rFNFtdmz6+0t2cHkkgNK96x9fsNk86yxBFSHxF28b9TmN7ZDE7fpzn8F1r
         NI+O0OMH3K/QopwNIBkC8SwHqkxfNdk8kfy6vwGnjNKSAEUAAjg6QsfIOI7j+/dridBD
         VzH1+bjNdyQzPxgQ7f6hDgARfQiE4Kr435wdL0el+PehCPS70ScwONftIrxoyjZqnh9u
         12RxI2t1uwbNQ48eQStmVhuT6wxywKQXpPHvQMAVC6qlL9xL9gYl21uqXo/ltsbHpW5V
         RjBg==
X-Forwarded-Encrypted: i=1; AHgh+RpZi2PC6zDtwOpjiA1Uf30L7SzKfMDqvPBsPwtVVVgmt65OdwB4F0EjngvYD3DWiQvxUceWdXckMK7c@lists.linux.dev
X-Gm-Message-State: AOJu0YxMTWF/6pLw0vf1xI/XpZeVRl8QqIeMnW+QIYQ3XG5c341b+rdH
	Uw6mzW+WaDrstrLB6Gw0ZTzLjq9MrGjVG1tzO4e4EBgdCE1MXJ2o7Y/JApL+2GYoVEMsNhgxJTJ
	zhR5NZu4edffylhMg9Ktw3YnUmA4bBcURU2/AN0oL
X-Gm-Gg: AfdE7ckq6KQoLDg8CDJzTmG0rmoBIv2TvDGvzNy1sYmvKvup2cLOZClZxsiRWVvXLLE
	6VouO0WF2FW/zovHXfiPQrLE+V8XeBhjTGh6hVoEQ56nk7KQp25pHW2TcUzXA/2vb0RagdVbeDX
	0gXZCJ60BMl96aUTQC/1F39TiCnIfPeWfv1CGjO8ZCc3n/hUJ1f9ECsxrxFNMaazPXfJcGpS4M1
	vvlLJekMiPF4/UPy65NaoAYXjj0KxBKz4E98s8mh30hMlkT4Y5p9PszE8dKxDKetIPverOfIZPV
	H9wa9M0Z5qCKEBEpDRf7aLTtsL4XRw==
X-Received: by 2002:a05:6214:5005:b0:8fd:6df3:b37b with SMTP id
 6a1803df08f44-8fec361d007mr104036666d6.63.1783631779176; Thu, 09 Jul 2026
 14:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707184417.3682270-1-xmei5@asu.edu> <20260707184417.3682270-2-xmei5@asu.edu>
 <cf0574fc-03d8-4b0b-b1f4-bbca59e31686@bsbernd.com> <CAJnrk1Y3bkDtztsXdF-3JL0tqxhaarriKCvO4-N3-QrL6X_4oQ@mail.gmail.com>
In-Reply-To: <CAJnrk1Y3bkDtztsXdF-3JL0tqxhaarriKCvO4-N3-QrL6X_4oQ@mail.gmail.com>
From: Xiang Mei <xmei5@asu.edu>
Date: Thu, 9 Jul 2026 14:16:07 -0700
X-Gm-Features: AUfX_mx0e1ETlf8p_BtjrszUwOqDI7hMyfYya_SnA8ZWgjMZgNXtAJ8aT5FjZN0
Message-ID: <CAPpSM+TXbaA0YfaxoKjNhxxA3V4oqY3KYJuJpqDr4rSo+z8W4g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] fuse: reject oversized payload_sz in fuse_uring_copy_from_ring()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, djwong@kernel.org, 
	Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, stable@vger.kernel.org, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>, 
	Luis Henriques <luis@igalia.com>, Weiming Shi <bestswngs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 4:08=E2=80=AFPM Joanne Koong <joannelkoong@gmail.com=
> wrote:
>
> On Wed, Jul 8, 2026 at 12:22=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com=
> wrote:
> >
> > Hi Xiang,
> >
> > On 7/7/26 20:44, Xiang Mei wrote:
> > > fuse_uring_copy_from_ring() imports the payload buffer with length
> > > ring->max_payload_sz but passes the server-controlled payload_sz to
> > > fuse_copy_out_args() unchecked.  A larger payload_sz drains the itera=
tor
> > > to exhaustion and fuse_copy_fill() hits BUG_ON(!err), panicking the
> > > kernel.  Reject replies whose payload_sz exceeds the imported buffer.
> > >
> > >   kernel BUG at fs/fuse/dev.c:1053!
> > >   RIP: 0010:fuse_copy_fill+0x6c6/0x7e0
> > >   Call Trace:
> > >    fuse_copy_args
> > >    fuse_uring_copy_from_ring     fs/fuse/dev_uring.c:686
> > >    fuse_uring_cmd
> > >    io_uring_cmd
> > >    __io_issue_sqe
> > >    io_submit_sqes
> > >    __do_sys_io_uring_enter
> > >    entry_SYSCALL_64_after_hwframe
> > >
> > > Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support=
")
> > > Cc: stable@vger.kernel.org
> > > Reported-by: Weiming Shi <bestswngs@gmail.com>
> > > Assisted-by: Claude:claude-opus-4-8
> > > Signed-off-by: Xiang Mei <xmei5@asu.edu>
> > > Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> > > ---
> > > v2: add: Cc stable and Reviewed-by tags
> > >
> > >  fs/fuse/dev_uring.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > > index 0814681eb04b..f6127c230dd9 100644
> > > --- a/fs/fuse/dev_uring.c
> > > +++ b/fs/fuse/dev_uring.c
> > > @@ -679,6 +679,9 @@ static int fuse_uring_copy_from_ring(struct fuse_=
ring *ring,
> > >       if (err)
> > >               return err;
> > >
> > > +     if (ring_in_out.payload_sz > ring->max_payload_sz)
> > > +             return -EINVAL;
> > > +
> > >       err =3D setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE,=
 &iter);
> > >       if (err)
> > >               return err;
> >
> > Good catch and sorry for lare review! Hrmm, it just gives me a bit head=
ache,
> > because idea for max_payload_size in fuse_uring_create() that it preven=
ts
> > exactly that.
>
> I don't think this is related to fuse_uring_create()'s
> max_payload_size. The problem this fix addresses is that the
> ring_ent_in_out.payload_sz header value returned by userspace can be
> whatever arbitrary big value userspace wants to set.
>
> Maybe I'm misunderstanding what you're saying, but i think this fix is
> orthogonal to the setxattr issue you mention below? afaict, that one
> has a different root cause (unbounded in_args copy coming from the
> kernel side when sending requests vs. trying to copy in an unbounded
> server-set payload size when handling a server's reply).
>
> >
> > After tracing through the code, I think we have two cases where max_pay=
load calculation
> > in fuse_uring_create() is not enough for xattr and ioctl
> >
> > For xattr we have an additional in addition to the patch above - it sen=
ds unchecked
> > against max_pages and  fuse_dev_do_read() has an additional op code pro=
tection
> > that I had missed
>
> Nice find, I didn't realize setxattr had a special error value either
>
Good catch, that's a real issue, and we triggered that by modifying our PoC=
.
> >
> >        /* If request is too large, reply with an error and restart the =
read */
> >         if (nbytes < reqsize) {
> >                 req->out.h.error =3D -EIO;
> >                 /* SETXATTR is special, since it may contain too large =
data */
> >                 if (args->opcode =3D=3D FUSE_SETXATTR)
> >                         req->out.h.error =3D -E2BIG;
> >                 fuse_request_end(req);
> >                 goto restart;
> >         }
> >
> >
> >
> > And I think with the current patch is incomplete and missing something =
like this
> >
> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index 77c8cec43d9c..449b84ac24e7 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -725,6 +725,14 @@ static int fuse_uring_args_to_ring(struct fuse_rin=
g *ring, struct fuse_req *req,
> >                 num_args--;
> >         }
> >
> > +       /*
> > +        * A FUSE_SETXATTR value may exceed the ring buffer; match
> > +        * fuse_dev_do_read() instead of overrunning the payload iterat=
or.
> > +        */
> > +       if (fuse_len_args(num_args, (struct fuse_arg *)in_args) >
> > +           ring->max_payload_sz)
> > +               return args->opcode =3D=3D FUSE_SETXATTR ? -E2BIG : -EI=
O;
> > +
> >         /* copy the payload */
> >         err =3D fuse_copy_args(&cs, num_args, args->in_pages,
> >                              (struct fuse_arg *)in_args, 0);
> >
> >
> >
> > And a generic patch, but that has the potential to break existing users=
pace is
> >
> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index 449b84ac24e7..d25d7922bbdd 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -251,7 +251,14 @@ static struct fuse_ring *fuse_uring_create(struct =
fuse_chan *fch)
> >                 goto out_err;
> >
> >         max_payload_size =3D max(FUSE_MIN_READ_BUFFER, fch->max_write);
> > -       max_payload_size =3D max(max_payload_size, fch->max_pages * PAG=
E_SIZE);
> > +       /*
> > +        * A max_pages-sized paged reply may be preceded by a fixed op =
reply
> > +        * header (e.g. FUSE_IOCTL); reserve a page of header room gene=
rically.
> > +        */
> > +       max_payload_size =3D max(max_payload_size,
> > +                              fch->max_pages * PAGE_SIZE + PAGE_SIZE);
>
> I hope we don't have to do this because imo even with a feature flag,
> it gets confusing/cluttered. What about just having it be the
> responsibility of userspace/libfuse to allocate a big enough buffer to
> hold ioctl reply headers if they want to handle ioctls that have
> max_payload_size amount of data? On the kernel side we'd just need to
> store the buf_size value the user already passes in at registration
> time and use that value for the import and payload-size bounds check
> instead of max_payload_size which seems like a pretty minimal change.
> If the kernel insists on the + PAGE_SIZE headroom, across lots of
> queues that have lots of buffers each, I think that memory waste may
> add up as well :(
>
> I think with bufferpools being the primary interface going forward
> (not sure if you agree with this, but with zero-copy and other
> optimizations being gated on it, I view it as that in my mind), the
> ioctl issue won't be a problem since the kernel can allocate more
> memory than max_payload_size to that particular request from the pool.
>
> Since they have alternative solutions (libfuse or buffer pools), maybe
> we don't need to bake this in here?
>
>
> > +       /* getxattr/listxattr values are bounded only by XATTR_SIZE_MAX=
 */
> > +       max_payload_size =3D max(max_payload_size, (size_t)XATTR_SIZE_M=
AX);
>
> afaict XATTR_SIZE_MAX is 64k, so if a server deliberately sets max
> pages to a very small value because they don't have enough memory, it
> seems counter-intuitive to force all their buffers to be >=3D 64k. As I
> understand it, the vast majority of xattrs are small (tens of bytes),
> so maybe better to just let them proceed and return an error on an
> oversized xattr than pay 64k/entry in every queue? If they really want
> to support 64k xattrs, then imo it should be their responsibility to
> allocate a big enough buffer size for that.
>
> Thanks,
> Joanne

This seems a good way to patch both paths. We have sent a v3 based on this.

v3-0001 keeps the same as v2.
v3-0002 patches both paths based on your proposal.

Please check, and we'd like to hear your feedback:
https://lore.kernel.org/fuse-devel/20260709211130.543773-2-xmei5@asu.edu/T/=
#u

Thanks,
Xiang
>
> >
> >         spin_lock(&fch->lock);
> >         if (!fch->connected) {
> >
> >
> > Question is how we could add it in, maybe with a feature flag?
> >
> >
> > Thanks,
> > Bernd
