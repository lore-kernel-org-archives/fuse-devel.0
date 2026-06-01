Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDF9282F10
	for <fuse-devel@lists.linux.dev>; Mon,  1 Jun 2026 21:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780350917; cv=pass; b=VovM1ac0tOuYH9uwRzHEtAvQHIskKAC3LsRAitq3wq6cRQSyYnztwWp5cc9jxg0A7eIkmJWtgClSUezWnbHmQmb1qlJ8k251gK3PD0Z/a3V1G2D94HY++W74Qci+uIQJI5rlSNXWdDZUtEt/p8Rc/3kUBdei2jUQVQc6WTilHa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780350917; c=relaxed/simple;
	bh=87ngzNcY5FRJKvd4o4eBAwb0IHAsLzTMQMEM2oVfqo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=efxiEmpVhhZ7heURxwZMgG//zDrsSjbd+MwNiIocpn23ar9AmfZEeGO7VJc4K2AnepdPEQv4hADkQPmIOWHjSozW0JDvkBE3vkiR55S4wipEimkA7+qs4eOX7HXSif2kBAx9AfKfMLvjG2vIlkb5XLDklVHVGelDUdxaWiDrMRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhcxCwTj; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhcxCwTj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so7110765e9.0
        for <fuse-devel@lists.linux.dev>; Mon, 01 Jun 2026 14:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780350915; cv=none;
        d=google.com; s=arc-20240605;
        b=gGM/DXDPqQcH8zDY9CN8IerXjO0GD+OadzmwGugUQGmj6SLZtXoeu4b79ZjG4iTSbn
         rurAgb+SQqq9knRNrOG/tfTzfYmjVzhwVCYami9Xxo/rT+XJh8y/lzl8GjuDtIASe+Gc
         t5fckEhkh+9Z5ys0D2tIKYHWslawPzqSIKNTHos/dCsjr9ufrM8itclxM8yIvduN9zxR
         xR+IUMnemcAIccJmeOtxdAGfXrR2w7Pg2I027uTAXV8+u9txCWfuceNM3xh0X3LDSemw
         o1uo/j7VvBWcOVK0i6XqrZ2wpCe+MW2Cev1QfuRzf9hd0ktwIU/wYxM5Ch8BUICTDg+Y
         rppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wmbHPGgmMMkpEGQ8T/RHxUDYcoS3Vs1P78r0MvyCHFY=;
        fh=Cl7h1SfuJ19skxs4kE3YUz1LRf5lwmGNNODwE00KY7A=;
        b=kSmPOsC53nkTQ+2NVPSd1E/lkMf8VCjSEdaEK+f0NSMvKze6Iop269Q3vDtEhbqKtm
         K//CMzeTgwxtSss6mYgMocCyPyyOoBBIvpFEs7Ovm8cf3OJWL73salMB8F/6vpfWanQ6
         /OhmF/n3wydTdznmFXFfXVPA834b/CjmCjuAHzjin3rRXL/moEj0IeTU28Vo4AwMzVqL
         uuAxnE0kctI86ZZOmP++jzSI/t5RtjEplpObzoLokbJpHZ3yLxzHB7nx+vf76KUavd+6
         lqN5ii34LV0RXqzi/hwNPoj/Ty1rUQ5rw/ltP+QT+DX2G3o4zExypuPUTUW29Iyto3LX
         B4zw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780350915; x=1780955715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmbHPGgmMMkpEGQ8T/RHxUDYcoS3Vs1P78r0MvyCHFY=;
        b=HhcxCwTjTHzPU1+18dYn2B8BQ9PVT5/WCEeOoCHF0DYDOyM0Ruc1Ee7vdmYoYdFSYD
         TLSmP5olKaxOjljRjYvUVlNqVexf94rKRiE1vpYPbT2S12ThmFinyI4rHoyUS+zm2Haw
         AYDZVjZ1qffioS55DOLm1+HKH318W3qIOlecKpe3vjC4o5i7sIWPAPqMV0uM/Ze6b0xG
         2krYXer1+oq0RUbIkteygG6lmAkc6cNK5MwGEERrX3QO/r+y9MxnM8WEbiMu/a3w9pDD
         4Dc9ioQK/flRB6Qp0wr2FS7TK1Pg/V7lbNqykoUV0NsJCRY/MHKNFma/GvyWwyUuBuCn
         IAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780350915; x=1780955715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wmbHPGgmMMkpEGQ8T/RHxUDYcoS3Vs1P78r0MvyCHFY=;
        b=TmJog1wIBj/4PJqks3LNlP+eGZJ//y+s78srzEKJ0fSYOgP5UjJUjAs9ggNhiiXvlR
         6cO38BlFabOCCf7k+YDLAOowMQcl6NtlEAmDn9nCjby/cyI6wjqWJKVpLzLBK643BqtT
         qlhtMzh2DS7t7ek+Z8MtQv9rXlDoHqH8XX8gGXx7FKRKY6xbXPxCeSZUuf+8MmSfIo47
         N2WZ34cuHGEh5kBIeSNBqoIvEZLFlruaxGtWgzHgaJ4Y+cI/qlibfw1dXxPw4Vcm9ots
         zx8mKwVG68qGi+Pt6w7GSeRfsNDlCyI0QdZJewRufrtpAbKJKWGim0CbxYEFkWZ2D2Cy
         fQCA==
X-Forwarded-Encrypted: i=1; AFNElJ8rCvk84kjsL1/RDPdC4l90Az0ZKLIBMvCDvMOrP5LJAW2huAA/+n1NEcMtTN/tLwb0uSPWfW1eReod@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/JA4pdfzY1ZvOU1qoRwTHqq2W9i6cDul3jcQX/IwBXuj9HyHY
	jjStNKHTFaOnZ/DGHJ3zBJ7JJu6482W55Q3VIZUc8Hf9gRHn55PPTDG3RpjJlHuD99dGfhuO5yu
	JPzgGLFnqy6jO0HLBhFnKZT06YUOXGKw=
X-Gm-Gg: Acq92OH5sjh6ZNxWjhUaIij78J1TXruscrj9qauchGJRy14xRxQI/wtiLFCugjRygEC
	6Z3TnKK5jbOCs8SoxOAG3bj7C870i8tapvSkzJtPUAl+cwDu72oXLoufqEiBzs3y38HL8d0u91k
	uCWm5nT0ZtbH5JkQjxDTr2JNp7SZttL540Qkqgb4AIYdtGTOk3ulmSilpBCRecPEjOKO5hyi9LF
	MMxOPzGSojmmJv1tTCWJQPLanMqdX7xDJ62HNSpCswRxIYjtLo1q/W2zGeT8gtVew/AQzFUY76T
	SLkc0x5xhy9uQbZ5
X-Received: by 2002:a05:600c:35d1:b0:490:af90:f9c2 with SMTP id
 5b1f17b1804b1-490af90f9e4mr42067685e9.12.1780350914513; Mon, 01 Jun 2026
 14:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601212414.1154139-1-amir73il@gmail.com>
In-Reply-To: <20260601212414.1154139-1-amir73il@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 1 Jun 2026 14:55:02 -0700
X-Gm-Features: AVHnY4IjIxaOi3DoHjmolNucZSVA0n50R5-Q7KhPAXy_QqL7HSpORV2envAJR8o
Message-ID: <CAJnrk1YGSrEkP2O-JPpie1zqc_5tBH9uHFvMry18TBdCMytNKA@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add fuse_request_sent tracepoint
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd.schubert@fastmail.fm>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 2:24=E2=80=AFPM Amir Goldstein <amir73il@gmail.com> =
wrote:
>
> This new tracepoint complements the existing fuse_request_send (enqueue)
> and fuse_request_end (completion) with a tracepoint at the transition
> of the request from the fiq->pending queue to the FR_SENT state.
>
> The fuse_request_sent fires when a daemon thread reads the request.
> The fuse_request_sent does not fire if daemon fails to read the request.
> It also does not fire for forgets and NOTIFY_REPLY, which also do not
> trigger the _send and _end tracepoints.
>
> This is needed for tools tracking the in-flight state of user initiated
> fuse requests.
>
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> ---
>
> Miklos,
>
> On v1 patch review Bernd did not like the name _recv [1]
> and I did not like his _enqueue/_dequeue suggestion,
> so I picked a new name (_sent) which nicely aligns with the
> request state flag.
>
> It also made me realize that the tracepoint in do_read was
> premature in some error conditions.
>
> Thanks,
> Amir.
>
> Changes from v1:
> - Rename tracepoint s/_recv/_sent
> - Fire in ioruing
> - Fire consistently along with setting FR_SENT, which...
> - Avoids firing when request is not sent sue to failure
>
> [1] https://lore.kernel.org/fuse-devel/cc8d9d33-444d-4c5e-9def-428794d87f=
3d@fastmail.fm/
>
>  fs/fuse/dev.c        |  1 +
>  fs/fuse/dev_uring.c  |  6 ++++--
>  fs/fuse/fuse_trace.h | 22 ++++++++++++++++++++++
>  3 files changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 5dda7080f4a90..2ad9aedc6237b 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1525,6 +1525,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fu=
d, struct file *file,
>         list_move_tail(&req->list, &fpq->processing[hash]);
>         __fuse_get_request(req);
>         set_bit(FR_SENT, &req->flags);
> +       trace_fuse_request_sent(req);
>         spin_unlock(&fpq->lock);
>         /* matches barrier in request_wait_answer() */
>         smp_mb__after_atomic();

What information are you trying to ascertain with the tracing? I think
in v1, the placement gave information on how long a request sits on
fiq->pending before it gets selected for processing by the kernel (eg
the pure queue wait time), whereas now it is bundled together with the
time spent doing all the copying to the daemon's buffer. I think
having the placement in v1 also gives a clearer estimate of just the
copy latency, as on the daemon side you could compare that timestamp
with the timestamp of when the read() returns. Is this placement here
more useful for your use case than where you originally had it in v1?

Thanks,
Joanne
