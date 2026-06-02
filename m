Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265423CF68B
	for <fuse-devel@lists.linux.dev>; Tue,  2 Jun 2026 17:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421264; cv=pass; b=W/heWbgPOzq7dPLmuk1jDwKP8wKVZht1DBk/tiCs3RNeOa+9moUkZdqRaNyrij5bcbxxlEs0j2jSQFXxckE5qX+i8rpyxflft7aLwKpWqcUnk6pAg2ezpy2iWz3QfWBj6DIjnmoOLljONVlINcW3Im8Tfa9lFl00MqejEJI6zrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421264; c=relaxed/simple;
	bh=I3w7BZ++sXpFMaAkmCnhXCxtPOFG9gVqBgFTYl1YNcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+g2MCao4nJHQZzOVWn6DlBDwQcUK/7Ed0rekPXqsR1EUg+SsDqP/liU+2zE5CzzubOciFy+gxGXCpyqsm/yviFCSyNgDQwWJ6vvCE7IiYm6jhzBJxEYqGoFgJoHRYWfvKUl9q0qC5Ck/3YfyyKkKeHGq3Y1/8XDyV7hHiZEOfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpUSnflr; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpUSnflr"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso3817976f8f.3
        for <fuse-devel@lists.linux.dev>; Tue, 02 Jun 2026 10:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780421261; cv=none;
        d=google.com; s=arc-20240605;
        b=J6V4fCuNMrUBBUH9elX4yXKp/2sXo9PM10bJx3eaaOTWmlEciniIgSy7AVkMWs02Qk
         5dTSy68Gan05e05S0f0rcyg4tdG7ThDEwxBcAtWd7mv+2mJZ3bIJVERIkfsnQOa4gbFr
         nY8dX6aOCy6+oYRoTAZKNQrJO7ltzi7b15RoEJCkRKOCG4Xxw6+26l4OukxAZ2IGeOwo
         laIblbr9OkADtz03BNQZxFUNV4iwVFXTsD1dntgDRVDT0zcREkcWqiq1FrpEpMSCyn+P
         ZdG3JOTdUBOIqz2GKDdIyPw/HxdTNwJ1OTcGEx3dF3X6UmRvT2AD5ti+ect8CqZosvzM
         Dl/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BG5zttOMZGyDpEsToKngaNIbEV2kV6i4m8XPAycWhi0=;
        fh=AUmoZASATzffOERAFCEqWoYNML7loqob7wOav7i6j+0=;
        b=ZUrZaIxoY4iKGbQMaI/YcHciN4z7qkYh5LEOZLP2Ue7iLGBTVUwVCcaU5Ql+ebNgVo
         zPE0sqLT4BkOazVwstooxvlfPz6KLfX9zZnjy8tCr+tePsvz9i+eWdUDVjmB39vhgRRK
         t/2eYG6ZhZ6exiRYxmBMijRgc/DAgsEhnUNuKSljz9SIbPlFqMu9+mTJw1s1/7oh/OXj
         dl3YWuEcnUYNx6WNwA9Bf/IwOqR7iYnOnwwsMbHcetVYYrjfoYm047l1Te7wKpIA4n22
         n4DAwdT0QBW3hjjoktRo5IVzXLgPgzxGEvcnfb9TBb8BFAvBbLn6CHWFJnnom7Dpzy2d
         ZwdA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780421261; x=1781026061; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BG5zttOMZGyDpEsToKngaNIbEV2kV6i4m8XPAycWhi0=;
        b=NpUSnflrquv1+7Tgc75U1iahw4n0W/PxyrwznHWMA5XJqYQ5FR9G5E/+iDu2ZvqF4x
         tyqSD6qDLRBgEBZz0I5yqNKAFbP3wQw9StvasNtdBnxasA7vMVmiUPIG4m8Ad8ZOVVLm
         /mBfEZZi+i4sAhVeHLDTcFz7N4I+pX/3ZWMt+903XymaFigVQsnxKMkFe8iyAaUFvDUG
         r++WXDQVqZaLQ2/sePP9Q0ATQOwydYtxsOZoFC7Kk7V/D3M1z1+X4pJ3x4L9GjJKBOBw
         GZIX0vlX9TDLuh4zAy3YP7lmqVLHMGn8XO28eYCIuKxs1088/3Lb8RU96odx6yNX//tn
         ahyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780421261; x=1781026061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BG5zttOMZGyDpEsToKngaNIbEV2kV6i4m8XPAycWhi0=;
        b=JhFuonN2Hnjf41mt+qxHc/4Yt5VJAO4gmXXCq5tO7l6KUnJaI7aCtGVtXh/4wS5irQ
         qoUo/63oJjkiQ/cO/3PD1aNN7lxiWxf6hqZmr4FaVqLTGdyzC48g+PxDA8oxTxJdLshx
         mjkCtXz7DFaUOeKAVlKuRq/IvZf2PYd5y6iyLk6hMDcf4vkgfaST2zXTFahjOF+3V6PI
         zqzmkFiaCQMLFvhIr1XnRLHUyYKnLGG5RhiPMnB3D0t5zQaYlNhcf4ITTm4UCNtGx4Il
         2fypSBAaqf9j5TppDuFWAq0H5XXRhZo/HTb9AkH0FkkDW/VcUieJMugofWirRZimw2+l
         k8zA==
X-Forwarded-Encrypted: i=1; AFNElJ9fy2KFABqPwz2op7Ii7SGsrn4ZPc5gKy7J90HJt0iSTE83iLWqA2Jrzt73C+pb+WpiLz2bCJOA0/al@lists.linux.dev
X-Gm-Message-State: AOJu0YzlA9eePhxBfMqQNqKdZk1PZ4lja4pSmjTMzsZZWA5Gb01f5DNV
	KfHXzw0Z1AfShm+GCp/pFyvqxlHc4iCTnw2PaMMlbT0QO3mGy64zBvOQI78JLoYsbq/4a72YRuE
	NfvtYt2GC2ggxOVwU3nZzGGU8+AINYcg=
X-Gm-Gg: Acq92OFxWS31F8Ju11SvkM9XmpeIrPEIXPiahwoT+OlaPfh/1cRPz1Gr2MqwjzKOYCh
	LLob0G4y5jqjO7PLmpZnKu1eIBubP6kL4Zr73vBd99NvXzEEge6oAnbGo8aOfsvVLR55wKknHsu
	VzCb3byhNqUNA9GukmES/GXEw4TL5QkbYgfGz6xfjyp4f+IDTf8FevLic7by5o5DVbQElHfr0aH
	2i2WAgQmT+wgm7fiY0U1wTBKd1P2RvEovBi3MOKV1kwr7Yd0ksiHsAWb2woa/uIdwLBoTd4E/rM
	tKUf7XWwyrJF+cBr
X-Received: by 2002:a05:600c:3552:b0:490:958c:46dc with SMTP id
 5b1f17b1804b1-490b50928e4mr11089935e9.17.1780421261414; Tue, 02 Jun 2026
 10:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601212414.1154139-1-amir73il@gmail.com> <CAJnrk1YGSrEkP2O-JPpie1zqc_5tBH9uHFvMry18TBdCMytNKA@mail.gmail.com>
 <CAOQ4uxjCTCo2SQcuVWt+E-BapjrHWBcqES2PQOcwDFZ+2KgXFw@mail.gmail.com>
In-Reply-To: <CAOQ4uxjCTCo2SQcuVWt+E-BapjrHWBcqES2PQOcwDFZ+2KgXFw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 2 Jun 2026 10:27:29 -0700
X-Gm-Features: AVHnY4IJK4ULSLTEiqeQfko7VlAfJ1Sy6Har1ehgfOvT9vkUqj7J3WcehnMlaFk
Message-ID: <CAJnrk1auhoGN729ptGN4aF0akoMd+oKebBcK_2QNaaoyu8vbzA@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add fuse_request_sent tracepoint
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd.schubert@fastmail.fm>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 6:32=E2=80=AFAM Amir Goldstein <amir73il@gmail.com> =
wrote:
>
> On Mon, Jun 1, 2026 at 11:55=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > On Mon, Jun 1, 2026 at 2:24=E2=80=AFPM Amir Goldstein <amir73il@gmail.c=
om> wrote:
> > >
> > > This new tracepoint complements the existing fuse_request_send (enque=
ue)
> > > and fuse_request_end (completion) with a tracepoint at the transition
> > > of the request from the fiq->pending queue to the FR_SENT state.

nit: the io-uring path doesn't have a fiq->pending queue, so maybe
better to just not mention fiq->pending here. perhaps the wording
below for "when a daemon thread reads the request" could be made more
generalized as well

> > >
> > > The fuse_request_sent fires when a daemon thread reads the request.
> > > The fuse_request_sent does not fire if daemon fails to read the reque=
st.
> > > It also does not fire for forgets and NOTIFY_REPLY, which also do not
> > > trigger the _send and _end tracepoints.

btw, from what I see, the _send and _end tracepoints do get triggered
by NOTIFY_REPLY

> > >
> > > This is needed for tools tracking the in-flight state of user initiat=
ed
> > > fuse requests.
> > >
> > > Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> > > ---
> > >
> > > Miklos,
> > >
> > > On v1 patch review Bernd did not like the name _recv [1]
> > > and I did not like his _enqueue/_dequeue suggestion,
> > > so I picked a new name (_sent) which nicely aligns with the
> > > request state flag.
> > >
> > > It also made me realize that the tracepoint in do_read was
> > > premature in some error conditions.
> > >
> > > Thanks,
> > > Amir.
> > >
> > > Changes from v1:
> > > - Rename tracepoint s/_recv/_sent
> > > - Fire in ioruing
> > > - Fire consistently along with setting FR_SENT, which...
> > > - Avoids firing when request is not sent sue to failure
> > >
> > > [1] https://lore.kernel.org/fuse-devel/cc8d9d33-444d-4c5e-9def-428794=
d87f3d@fastmail.fm/
> > >
> > >  fs/fuse/dev.c        |  1 +
> > >  fs/fuse/dev_uring.c  |  6 ++++--
> > >  fs/fuse/fuse_trace.h | 22 ++++++++++++++++++++++
> > >  3 files changed, 27 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> > > index 5dda7080f4a90..2ad9aedc6237b 100644
> > > --- a/fs/fuse/dev.c
> > > +++ b/fs/fuse/dev.c
> > > @@ -1525,6 +1525,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev=
 *fud, struct file *file,
> > >         list_move_tail(&req->list, &fpq->processing[hash]);
> > >         __fuse_get_request(req);
> > >         set_bit(FR_SENT, &req->flags);
> > > +       trace_fuse_request_sent(req);
> > >         spin_unlock(&fpq->lock);
> > >         /* matches barrier in request_wait_answer() */
> > >         smp_mb__after_atomic();
> >
> > What information are you trying to ascertain with the tracing? I think
>
> Here is a gist of the output of the tool fuseqtop [1]:
>
> FUSE in-flight requests [sorted by total time, 3s interval] =E2=80=94 Ctr=
l-C to stop
> CONN   OPCODE           UNIQUE               ST  PID     COMM
>      WAIT(ms)   SERV(ms)
> 45     GETXATTR         14                   D   3096727 getfattr
>      1189.673 129593.636
> 45     GETXATTR         18                   D   3096730 getfattr
>         0.002 129593.636
> 45     GETXATTR         20                   D   3096746 getfattr
>       650.664 128186.420
> 45     GETXATTR         24                   D   3096762 getfattr
>         0.064 128186.420
> 45     GETXATTR         28                   D   3097736 getfattr
>      2255.352  46739.455
> 45     GETXATTR         30                   D   3097753 getfattr
>      1463.358  46739.455
> 45     GETXATTR         34                   D   3097773 getfattr
>       730.723  46739.455
> 45     GETXATTR         36                   D   3097790 getfattr
>         0.016  46739.455
> 45     GETXATTR         40                   D   3097812 getfattr
>       785.307  42250.883
> 45     GETXATTR         42                   D   3097835 getfattr
>         0.014  42250.883
> 45     GETATTR          44                   Q   3097852 getfattr
>     41411.019          -
> 45     GETATTR          46                   Q   3098339 df
>      9951.074          -
> 45     GETATTR          48                   Q   3098368 df
>      8556.918          -
>
> [1] https://github.com/amir73il/bcc/commits/fuseq/
>
> This is a depiction of a saturated fuse requests queue.
> Without the trace_fuse_request_sent() tracepoints the tool can guess but =
not
> reliably ascertain the dequeue time.
>
> > in v1, the placement gave information on how long a request sits on
> > fiq->pending before it gets selected for processing by the kernel (eg
> > the pure queue wait time), whereas now it is bundled together with the
> > time spent doing all the copying to the daemon's buffer. I think
> > having the placement in v1 also gives a clearer estimate of just the
> > copy latency, as on the daemon side you could compare that timestamp
> > with the timestamp of when the read() returns. Is this placement here
> > more useful for your use case than where you originally had it in v1?
>
> I had not considered measuring the copy time at all.
> My workloads are dealing with other orders of magnitude for serving
> time when serving non-passthrough files from the cloud.
>
> So for my purpose the placing of the tracepoint _sent at this location
> is a good fit.

Gotcha, that makes sense to me, thanks for the details.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

>
> If others feel that a "start sending" (or whatever we call this) is also
> valuable then I think we can add it later if needed.
>
> Thanks,
> Amir.
