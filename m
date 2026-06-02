Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79D53597B
	for <fuse-devel@lists.linux.dev>; Tue,  2 Jun 2026 13:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407149; cv=pass; b=IAMFAW5Hi6ZXuVcoSJVJZ6JTnw0EjTLOxBf3jnbX/C1PLSZaDlj8Pxbxd4iiJqlV0KLNkfBV+23+Sgnb/xQWKmZ3nfyyDtSGJorNku8dA3brH5MiCBM4wS9JMK5I+rTiETv4a2b5TWo4yiv5ykuzGa5ni60/vTDLgIcCevFCoLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407149; c=relaxed/simple;
	bh=jampCiJg85KZenA9vht1Q4OAZGejoITvrV18gVG4m8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AK2V0K29RU3mkedDqNJcSFZ1DmZTkDiRo67TlwmuItbcwTrb1cGIxqMDBwYHQECaZF4cHSmBldv6iCGRnbjglJFseJaM+ZRqolToxCtN0855UbIHC7jNkw0w8MsUMl+NKXwOXth/HvDYmpAW2fOyNsuyzaKJDvxN3nOsHPozST8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECiYugPX; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECiYugPX"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68c76fb8009so5229521a12.0
        for <fuse-devel@lists.linux.dev>; Tue, 02 Jun 2026 06:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780407146; cv=none;
        d=google.com; s=arc-20240605;
        b=EtTeud9gnFJ6FKcvOEOyAD5Q0rxFDSTz/r6gzHwRcqLCXtzk8OvyAjsNd25oBrz9fT
         sq0xoNWrWoqufVNd8IC6wNqJSpRHy/gYic1z8mSVq628Dj6S1c9KrLvh6jWP3X75sFLi
         xw7D7tDUBwaJvMC94LmKKNfoJFb1u8Tt7nhlv1uJfOk2SLh9V98nq1bXpV0Z/26ue5OP
         Abh+wz0yVpCb7F40S8QK6cj06l/HDhg2q3/WSSOKZEdvfvyizUM/58pHyxpzSw9m/H5D
         rbz3eoyv7CTJe7hEI5Yi8l/HO4Rl8pcQmClafHNzpWY0bStqFSLVgQgWMQh4/jsNifJ9
         bwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GCCJm5W8mDuRTSgUsZ/aw2TWgb2tu5NdeevkH7wmKMk=;
        fh=r3bNQMes0zhhTuNzFWSF2pbPPdrDCYopsBoYZLaRomo=;
        b=EuqwvVKcDWBt3WTDB3kOvA8OxV45iek9kf+LVgwp1AdAWn2ISAWKhORYCeAnDtulGr
         qApvHrrcIjVDVYPa9WkfNB89Bmgoef4pDhb9prbDAedFihVefLhc6ythG2VBQJVe3hBH
         przaDszKk4Mq2b5iYzVDaOjWazSYt+BmytEbZ533EZrd6je1ljdxisSGTWc2J+tH0t2s
         UhF0DPPqBSdPAI3segJc1fBmp4JfnOlmlM5KQ1sKcxws1MFiwRNy5UJ9q1lhlLA5knPy
         udxag34bgBjLeAso3EKtUmxdEtZ8V2w8xfmCDYw2xQZXOkiBrQPgyy1Ax7JLmgfKDY8T
         AxXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780407146; x=1781011946; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCCJm5W8mDuRTSgUsZ/aw2TWgb2tu5NdeevkH7wmKMk=;
        b=ECiYugPX0ohQJvAj0RiYw7983nKlFp0Qm5XASS2Zl9dfY+A9/7Y3Z9qaVPmzxRwnWa
         AvWEbEL3uLfr/yJglBzjxkkr15CpD8ynKd9GfoLozfHaRbxsWRKql2L+cxFheeW8zy1J
         UVyrQ6A0lkDqvO7hFWFSppFjUWa7KDrCBFeGoDwysjbANZ+YmajrOYEBmHjv+ouMSZMu
         VVkQ50A1lj73spQlLkPQvCGSr9B1j3xNVfyDCJc0bRF1/lndSf6fFrTneBZu5YiEyxAS
         Ei62j06HA4D9w+X0jDlyhzs69PoHtzGH+WofrNF3OaevgfJV6NGwFZBfRGwAIocMhQL4
         JiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780407146; x=1781011946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCCJm5W8mDuRTSgUsZ/aw2TWgb2tu5NdeevkH7wmKMk=;
        b=IWp6YWDkwMkRmavqSf3mQ+IQGwFVnfXnXS8olmbjIN29BvlopcR4x/hBmbxC4go0an
         S9eqYvB37O/fnRwMgdpSYDlUz1CB9/GTU6Jib8e8KCM5QVSc4SsRFEqLADY4cXnq3DTk
         9qFsAlhfAp4s+IgHLnkDmJ3P672MqoS6qIRGbWMAxjZ/k44tRlf7sPFhHSvX3nwfg8LO
         CzcdxEHTVvi7Yag19QuRjNLEzJL7tOUL5/JTb8NV4yGMy/H0LJo+dBQrGKXLZ/nfClzE
         J3Hj27TEIfRaJCTSQvvc6lKmZRdAc65DcfMJ/MPm3d8IX/weBKyLyl/+imgisgBj4ysi
         1lZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GSzIjgOl+RpPXzMI5AtJtmz6tM/ah7O/e1WC6Ml5RmzQMPErqczhX/Ci5Vm7xBithTRKkDI1UulY3@lists.linux.dev
X-Gm-Message-State: AOJu0YwA/t8VEs8uDEmTn/7q1bugWclGwJB3PefF8WQpTZMinMnE/cwS
	7AlDygV/M1lFQ/9M7rsLBjvc2np5xm89bJsGQaDIsO2ygt/Y8qpSvHL6U1vTEMoDvauxntv95RU
	aWaXN8g2acUMwPUo60BbGUfJmOBrtx2an9/Ij2/U=
X-Gm-Gg: Acq92OE8aKP17PvIRb8cggdotgTapn/pjiw+OmBOVQFXnHs8O8QovjN8f9QKAQj4BBi
	T4Lq4VYZLCpY+RsukUWmdpfk7eRsUYIuMExys7qS9aCZCgsn4qxVpKkfKSU0o75qZgupkv/cPEx
	eHbAXp8JRnhnYFqSC2LGzdmiuH8PcPJyZtWQHZXIbe+LWPThU7HQvtV1MkERue5YG5RbntduGGn
	wni/CSQyNYBjhiRa5xiiFvu6hfdhyRfYMkN23xeg91GpXrP/Hra6LzWWSMp1hggBgt0VimQJaP7
	ZmbiUZxU1Z6lFmmMvHnsyvwnBkW6B8koQbMngQM/dfshvbdMNKM6
X-Received: by 2002:a05:6402:4510:b0:687:74de:985b with SMTP id
 4fb4d7f45d1cf-68c8c561c0fmr8171231a12.14.1780407145849; Tue, 02 Jun 2026
 06:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601212414.1154139-1-amir73il@gmail.com> <CAJnrk1YGSrEkP2O-JPpie1zqc_5tBH9uHFvMry18TBdCMytNKA@mail.gmail.com>
In-Reply-To: <CAJnrk1YGSrEkP2O-JPpie1zqc_5tBH9uHFvMry18TBdCMytNKA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 2 Jun 2026 15:32:14 +0200
X-Gm-Features: AVHnY4JCj5er1NPDFOCt5CZDMoxd04ciq5ucQqGoDMUfX7T_AdY9hL23VxPKNMs
Message-ID: <CAOQ4uxjCTCo2SQcuVWt+E-BapjrHWBcqES2PQOcwDFZ+2KgXFw@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add fuse_request_sent tracepoint
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd.schubert@fastmail.fm>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 11:55=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Mon, Jun 1, 2026 at 2:24=E2=80=AFPM Amir Goldstein <amir73il@gmail.com=
> wrote:
> >
> > This new tracepoint complements the existing fuse_request_send (enqueue=
)
> > and fuse_request_end (completion) with a tracepoint at the transition
> > of the request from the fiq->pending queue to the FR_SENT state.
> >
> > The fuse_request_sent fires when a daemon thread reads the request.
> > The fuse_request_sent does not fire if daemon fails to read the request=
.
> > It also does not fire for forgets and NOTIFY_REPLY, which also do not
> > trigger the _send and _end tracepoints.
> >
> > This is needed for tools tracking the in-flight state of user initiated
> > fuse requests.
> >
> > Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> > ---
> >
> > Miklos,
> >
> > On v1 patch review Bernd did not like the name _recv [1]
> > and I did not like his _enqueue/_dequeue suggestion,
> > so I picked a new name (_sent) which nicely aligns with the
> > request state flag.
> >
> > It also made me realize that the tracepoint in do_read was
> > premature in some error conditions.
> >
> > Thanks,
> > Amir.
> >
> > Changes from v1:
> > - Rename tracepoint s/_recv/_sent
> > - Fire in ioruing
> > - Fire consistently along with setting FR_SENT, which...
> > - Avoids firing when request is not sent sue to failure
> >
> > [1] https://lore.kernel.org/fuse-devel/cc8d9d33-444d-4c5e-9def-428794d8=
7f3d@fastmail.fm/
> >
> >  fs/fuse/dev.c        |  1 +
> >  fs/fuse/dev_uring.c  |  6 ++++--
> >  fs/fuse/fuse_trace.h | 22 ++++++++++++++++++++++
> >  3 files changed, 27 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> > index 5dda7080f4a90..2ad9aedc6237b 100644
> > --- a/fs/fuse/dev.c
> > +++ b/fs/fuse/dev.c
> > @@ -1525,6 +1525,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *=
fud, struct file *file,
> >         list_move_tail(&req->list, &fpq->processing[hash]);
> >         __fuse_get_request(req);
> >         set_bit(FR_SENT, &req->flags);
> > +       trace_fuse_request_sent(req);
> >         spin_unlock(&fpq->lock);
> >         /* matches barrier in request_wait_answer() */
> >         smp_mb__after_atomic();
>
> What information are you trying to ascertain with the tracing? I think

Here is a gist of the output of the tool fuseqtop [1]:

FUSE in-flight requests [sorted by total time, 3s interval] =E2=80=94 Ctrl-=
C to stop
CONN   OPCODE           UNIQUE               ST  PID     COMM
     WAIT(ms)   SERV(ms)
45     GETXATTR         14                   D   3096727 getfattr
     1189.673 129593.636
45     GETXATTR         18                   D   3096730 getfattr
        0.002 129593.636
45     GETXATTR         20                   D   3096746 getfattr
      650.664 128186.420
45     GETXATTR         24                   D   3096762 getfattr
        0.064 128186.420
45     GETXATTR         28                   D   3097736 getfattr
     2255.352  46739.455
45     GETXATTR         30                   D   3097753 getfattr
     1463.358  46739.455
45     GETXATTR         34                   D   3097773 getfattr
      730.723  46739.455
45     GETXATTR         36                   D   3097790 getfattr
        0.016  46739.455
45     GETXATTR         40                   D   3097812 getfattr
      785.307  42250.883
45     GETXATTR         42                   D   3097835 getfattr
        0.014  42250.883
45     GETATTR          44                   Q   3097852 getfattr
    41411.019          -
45     GETATTR          46                   Q   3098339 df
     9951.074          -
45     GETATTR          48                   Q   3098368 df
     8556.918          -

[1] https://github.com/amir73il/bcc/commits/fuseq/

This is a depiction of a saturated fuse requests queue.
Without the trace_fuse_request_sent() tracepoints the tool can guess but no=
t
reliably ascertain the dequeue time.

> in v1, the placement gave information on how long a request sits on
> fiq->pending before it gets selected for processing by the kernel (eg
> the pure queue wait time), whereas now it is bundled together with the
> time spent doing all the copying to the daemon's buffer. I think
> having the placement in v1 also gives a clearer estimate of just the
> copy latency, as on the daemon side you could compare that timestamp
> with the timestamp of when the read() returns. Is this placement here
> more useful for your use case than where you originally had it in v1?

I had not considered measuring the copy time at all.
My workloads are dealing with other orders of magnitude for serving
time when serving non-passthrough files from the cloud.

So for my purpose the placing of the tracepoint _sent at this location
is a good fit.

If others feel that a "start sending" (or whatever we call this) is also
valuable then I think we can add it later if needed.

Thanks,
Amir.
