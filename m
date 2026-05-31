Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A7A13A258
	for <fuse-devel@lists.linux.dev>; Sun, 31 May 2026 17:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780250233; cv=pass; b=qbsXu7Ss8yxm4N0c6mhWDvcKw9bEEAdZpQe/ghyxp6vXmGnuD5OFQVuMvfdaHVn2bHRaDIlOfyi7i6+wKOpIDOKPhNysbWziopKb9ZZ3p0EHChcz89FYuNxWC0l9FSEER1nrvWFkRHCjG5z7iyE2Zh1qMbBafRhQraPbpIfJy+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780250233; c=relaxed/simple;
	bh=gHNiDoE1NUjMc9ayo6qMeVaVnPPTe52Xs5O2QIvvVCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUOuwgsmDdZyVD3naGZWepGWGER7fM3OluXN2DRnta8NWO9D/HuB3U18azmIK2dlfgd/lDg/Ul710dHoudXUO86RUo4Vz6Mo0FQ5q1kcEvvxeiQn7MBsKXwMopZCQq+SnmlmIv/PZdSOi0w/hCbpi5Gj602/nnLRm6bpNQ7Pil8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2AD6fzj; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2AD6fzj"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68be16c61d1so4404689a12.2
        for <fuse-devel@lists.linux.dev>; Sun, 31 May 2026 10:57:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780250230; cv=none;
        d=google.com; s=arc-20240605;
        b=SwKqkCVw0IXS1+WoIBKmYrIv5ZMw8uqXO33FU6Tp/ZvShimvPeg3mdPU9Xdh+PQ0fe
         X/ObMZ5lOUKvsulqOj0yrfja3oigdyhwTuGn8UVMqXO2RGKYVJz1DtWlz3UUa2+oLzMu
         TH6FjZca+iN6IwihkZnQsNvsAtS2jR4eTglgyEfXyygy885u3ZK5gSGPvxwlUeo6ExaH
         dzqNZjMeHRtX+nydBcwEpA3+Er/KLU+8/SFZTDtZKxxYrqnbNND1PtAPFXdcAwgqooaY
         UG2Pa21aakq1X1rMq3kqVvuXve/TCrLT6z0LvQgz87VVmPQjl+xlTsPmzJa5K5Z1BEeg
         s26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MbLhLN+djRO7Bjm9b5MrVTRvDkcLA93rbp+QmbcOlwg=;
        fh=IIUXzCCswgLLMNFvXNkpaovlOPkRuce5lqB8SNJYOlE=;
        b=Q8v3jGz1DXrlqmzo69AmPh5M/Jvn+o3GtNqjIt7T1yBg0TxClXTf/yMOJOYWP2atYG
         Ne11pR8So6qmAPs1M1pkPj3+G65kTJW5fDiYUm5z0vwM/Tr/bi4PmPtWQe1jWiF/c7Qv
         6bf0+u5I+c/zvt08QVlZVeTOBVHZGT6lxZqkKvpMDvtpEqtIiRZ0FB6AuVHTLl/wYBu/
         heWaEFEDPPonakz66PGwBmU1PjT9pLOFDuF1oddsZ/2uwy7egvjktuLRGUrXBFeIG14W
         LJ5M+hlcdZFi4BwJ/uA5Aas/aCpLktJTGz13CrsLkZc4pROk+QByXXMgBGuu5FedTM8S
         h3/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780250230; x=1780855030; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbLhLN+djRO7Bjm9b5MrVTRvDkcLA93rbp+QmbcOlwg=;
        b=m2AD6fzjw2ZR19V+OMPepEwj+yfVRmaN+JZKgGnu1qtRFhHxe37EIt5/l9vaTR41qD
         SKSyYVIaaZFkPafoRPCzZya6WdwHf+TXwczQ4RIs1H3/ndbPddtpUdfg72hE5hMWbW6m
         yD/PB+rtebWWW+riBtzpsLilJuDPG1YXwg4xjQlA4MZdhnIrN6IZaDcwsd0YdZCfeoQs
         3Ke0/9PEC4uFJn5WTdT/VJOxQAoF8OrCCU1hrW7LX2YczTd6M+ROHPBWAPKs4qewrYpk
         dzSgwRNqLmDSlwAEQZcfbyAQROhdw/3c0vcvfI9hyvSY8AnFRNt9btPT3cYppfDP51pe
         Jw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780250230; x=1780855030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MbLhLN+djRO7Bjm9b5MrVTRvDkcLA93rbp+QmbcOlwg=;
        b=FSKbewPEkXbeTIGRfZJhN4lvVL28sz3Y1B15HRF3Iwuis3pUR/Mf38NMGEipO2GWYR
         HBQ0Y4pVUzpnQxfHqMYBsWeS0kglTum8MeDX5oifnxEK2fsEPLceVob1KrwmuSOxuOxB
         1sJN9lRCvt3lovPneZfvvFRZb2ZLsXNcKPfeW1vrm4SOVfS/cuEx+yQOqywTa7epTMIP
         pv7Jkbu9kDPow+2zPrgOL+k186UPQ/X9OlMB5tdac2aBVG9CiuNui/zzlpTH4hmG8hIv
         wl8HuPGy3coTYvDzLcQ1Y9mIQwLjkIlXa94ttltEQnpmsF+F18IchSF5I9h1bejSf0+E
         bLyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hvnx4IBA+pSn+sf1ImXJIm7+1O4tfSPst/szCl4eTCrKLF+/qxNcpGtnbK0gyrFosdL+KlvABMBs4@lists.linux.dev
X-Gm-Message-State: AOJu0YwgoeCVqJEOGH9YcfzDUAxqz76/hKYUjDf1Q9ma1Qm/NPL1W6uH
	1/DxiWf3s5jxB6to6uWg2tCRBmWfbPcMqs8GfABokIE/00DzvQ1eE49ai0hGnB1eqMVcQySp92Z
	OdN4sgv+wWeZ1oN96WJK2YwJrMFUSpw3Ugv+/LFY=
X-Gm-Gg: Acq92OFpz108/INVmgM7Cxqpq8ggjl+y55UblYJA7BEQwqoDK67sma/lSySaFedRtLB
	2Hy6qe2yvsEbf/tRgakgb5/4E9hKiL1SbBLKJZuBud3vTPGkCIPfScjp6xSE/j2gshVZm3qKGFw
	Oey4Sc71PdNzD8ki5l7aRVn879CdKgUbfBTRltuLg9zcl7kOJMkwmS5ktFteBhQQVMqQvrsqMot
	2Ej4H0nXK6GHXL0ZYN5gygedhHYEszyRry3ULUzA8YVl5Iwfecv9oNuSZrIwC7jZrTXnQe1Iiri
	p1tcnJzZ/hBecFH6+QN9CwTVddvIAHvY5n87FIS4cqFokPR/kzrRcfHKJ/RmOQg=
X-Received: by 2002:a05:6402:305c:20b0:670:1417:2132 with SMTP id
 4fb4d7f45d1cf-68c8ab2ced4mr2814612a12.18.1780250230246; Sun, 31 May 2026
 10:57:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527171808.828637-1-amir73il@gmail.com> <92906aae-a3eb-4ea4-adad-7289045fdbff@fastmail.fm>
 <CAOQ4uxiNZPA7SiCf_nkJFa_9HZetJGDn_REoihRTX9ePYpqMmg@mail.gmail.com> <cc8d9d33-444d-4c5e-9def-428794d87f3d@fastmail.fm>
In-Reply-To: <cc8d9d33-444d-4c5e-9def-428794d87f3d@fastmail.fm>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 31 May 2026 19:56:58 +0200
X-Gm-Features: AVHnY4LCZO9RR_snbgp_PCKxNBDWkgV_S6W0HSaPVOvOfUPHj87KqRbtyjuL3W0
Message-ID: <CAOQ4uxhUEG71XbrGyvCDoA=6yi271f48LDD1r4peec8uMAWaPg@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fuse_request_recv tracepoint
To: Bernd Schubert <bernd.schubert@fastmail.fm>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 1:22=E2=80=AFPM Bernd Schubert
<bernd.schubert@fastmail.fm> wrote:
>
>
>
> On 5/29/26 12:37, Amir Goldstein wrote:
> > On Fri, May 29, 2026 at 1:01=E2=80=AFAM Bernd Schubert
> > <bernd.schubert@fastmail.fm> wrote:
> >>
> >>
> >>
> >> On 5/27/26 19:18, Amir Goldstein wrote:
> >>> This new tracepoint complements the existing fuse_request_send (enque=
ue)
> >>> and fuse_request_end (completion) with a tracepoint at the transition
> >>> from "pending" to "in-progress" at the moment a daemon thread dequeue=
s
> >>> a request from fiq->pending.
> >>>
> >>> This is needed for tools tracking the in-flight state of fuse request=
s.
> >>>
> >>> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> >>> ---
> >>>
> >>> Miklos,
> >>>
> >>> This patch is not technically a fix patch, but it complements the
> >>> tracepoints that were added in 6.12 by commit 396b209e405a5 ("fuse: a=
dd
> >>> simple request tracepoints"), so it is my intention to backport it up=
 to
> >>> 6.12.y for use on production kernels.
> >>>
> >>> I came across the need for this tracepoint when working on fuse queue
> >>> monitoring tools [1] for our production env.
> >>>
> >>> The fuse_request_send tracepoint is broken on 6.12.y, so I also plan =
to
> >>> post a backport patch for 0d375a1385ed8 ("fuse: capture the unique id=
 of
> >>> fuse commands being sent").  Not sure why it was not tagged as Fixes.
> >>> The existence of fuse_request_recv
> >>>
> >>> This patch is intentionally based on upstream fuse (v7.1-rc2) and not
> >>> on for-next branch, with ease of backport in mind.
> >>>
> >>> Specifically, commit 80cea98b648ba ("fuse: change req->fm to req->cha=
n")
> >>> on for-next needs to apply the same change to the new tracepoint as w=
ell.
> >>>
> >>> Would you consider applying this patch at the bottom of for-next and
> >>> make this adjustment to your refactoring commit?
> >>>
> >>> Thanks,
> >>> Amir.
> >>>
> >>> [1] https://github.com/amir73il/bcc/commits/fuseq/
> >>>
> >>>  fs/fuse/dev.c        |  1 +
> >>>  fs/fuse/fuse_trace.h | 22 ++++++++++++++++++++++
> >>>  2 files changed, 23 insertions(+)
> >>>
> >>> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> >>> index 5dda7080f4a90..583155157d117 100644
> >>> --- a/fs/fuse/dev.c
> >>> +++ b/fs/fuse/dev.c
> >>> @@ -1475,6 +1475,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev=
 *fud, struct file *file,
> >>>       req =3D list_entry(fiq->pending.next, struct fuse_req, list);
> >>>       clear_bit(FR_PENDING, &req->flags);
> >>>       list_del_init(&req->list);
> >>> +     trace_fuse_request_recv(req);
> >>>       spin_unlock(&fiq->lock);
> >>>
> >>>       args =3D req->args;
> >>> diff --git a/fs/fuse/fuse_trace.h b/fs/fuse/fuse_trace.h
> >>> index bbe9ddd8c7169..289a279b3c312 100644
> >>> --- a/fs/fuse/fuse_trace.h
> >>> +++ b/fs/fuse/fuse_trace.h
> >>> @@ -101,6 +101,28 @@ TRACE_EVENT(fuse_request_send,
> >>>                 __print_symbolic(__entry->opcode, OPCODES), __entry->=
len)
> >>>  );
> >>>
> >>> +TRACE_EVENT(fuse_request_recv,
> >>> +     TP_PROTO(const struct fuse_req *req),
> >>> +
> >>> +     TP_ARGS(req),
> >>> +
> >>> +     TP_STRUCT__entry(
> >>> +             __field(dev_t,                  connection)
> >>> +             __field(uint64_t,               unique)
> >>> +             __field(enum fuse_opcode,       opcode)
> >>> +     ),
> >>> +
> >>> +     TP_fast_assign(
> >>> +             __entry->connection     =3D       req->fm->fc->dev;
> >>> +             __entry->unique         =3D       req->in.h.unique;
> >>> +             __entry->opcode         =3D       req->in.h.opcode;
> >>> +     ),
> >>> +
> >>> +     TP_printk("connection %u req %llu opcode %u (%s)",
> >>> +               __entry->connection, __entry->unique, __entry->opcode=
,
> >>> +               __print_symbolic(__entry->opcode, OPCODES))
> >>> +);
> >>> +
> >>>  TRACE_EVENT(fuse_request_end,
> >>>       TP_PROTO(const struct fuse_req *req),
> >>>
> >>
> >> I find the name 'fuse_request_recv' a bit confusing. Why not
> >> 'fuse_request_read'?
> >
> > Well, to balance fuse_request_send of course ;)
>
> Reading my own patch:
>
> Rename trace_fuse_request_send to trace_fuse_request_enqueue

IDGI. I don't see the value of this name change
Darick already fixed the _send() tracepoints in 6.18
and I see to reason to change them and break existing tracing scripts
unless there is a really good reason to do so.

> Add trace_fuse_request_send
> Add trace_fuse_request_bg_enqueue
> Add trace_fuse_request_enqueue
>
> with
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index
> 1ccf5a9c61ae2b11bc1d0b799c08e6da908a9782..8e1a95f80e5454d1351ecb90beacbb3=
5779731bb
> 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -281,7 +281,9 @@ static void fuse_send_one(struct fuse_iqueue *fiq,
> struct fuse_req *req)
>         req->in.h.len =3D sizeof(struct fuse_in_header) +
>                 fuse_len_args(req->args->in_numargs,
>                               (struct fuse_arg *) req->args->in_args);
> -       trace_fuse_request_send(req);
> +
> +       /* enqueue, as it is send to "fiq->ops queue" */
> +       trace_fuse_request_enqueue(req);

Looks like this patch is based on old code?

>         fiq->ops->send_req(fiq, req);
>  }
>
> @@ -580,6 +582,8 @@ static int fuse_request_queue_background(struct
> fuse_req *req)
>         }
>         __set_bit(FR_ISREPLY, &req->flags);
>
> +       trace_fuse_request_bg_enqueue(req);
> +

Is this path not handled in current upstream code?

>
> @@ -1314,6 +1318,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev
> *fud, struct file *file,
>         clear_bit(FR_PENDING, &req->flags);
>         list_del_init(&req->list);
>         spin_unlock(&fiq->lock);
> +       trace_fuse_request_send(req);
>
>         args =3D req->args;
>         reqsize =3D req->in.h.len;
>
>
> IMHO, trace_fuse_request_enqueue / trace_fuse_request_bg_enqueue for
> adding to the queue and trace_fuse_request_send for reading/handling the
> request is less confusing.

Potato potato
enqueue->send / send->recv
There will be arguments for and against any names we pick
I don't think that the name matters a lot here as long as the
required information is provided to tracing tools

My question was, regarding fuse_uring_prepare_send(),
do we need a _recv()/_send()/_fetch()/_whatnot()
tracepoint in this code point and whether the pid reported in this
tracepoint is useful. Is it the libfuse worker thread or something else?

Thanks,
Amir.
