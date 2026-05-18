Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8340A282F08
	for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 15:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779118532; cv=pass; b=jRfpGWi3rQjRVb2tMB4xNhDB7BiwxqvqYARA6qnjhA0UfP3qiJTehqPeqCGsy9a3fsJU358/Ie8+9AkyPhKq13yoGPQNOY9DiO/RJz3r4xYI8fBsHEza2XwYStUlbIfHaAUHCH9e2OA7P1fHZ6+dsTYVoirSAA4BrGPtaoGXB6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779118532; c=relaxed/simple;
	bh=84ThP6pQAX0kQKJdEUw02F6ZsBBCn/2mySdLvp7NIlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQc7rW/eRylcLFgRMZgKdUOz1C+3qFU+El6XjQgNBAn1ijNzidJCfEGtZc7Yni5F3gH1NoE7kPbhZaxwXWQ3XdDyp/uf3Iy1vj31+p4y6Fh2arqWcgFhJXHu33fAefxtvstecKEiUER516pkffRt178NtB1XrrQEXeXfUmldwTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeOFrJ8U; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeOFrJ8U"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44a044cb827so1704644f8f.0
        for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 08:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779118528; cv=none;
        d=google.com; s=arc-20240605;
        b=dJu25OPZ/OJ7WD/8ghHTm5ZagiMUK9HQ6PSNLsu8SrUml49WJjpOvOrKiOPDH+Qx+0
         GXw4BZjhdVAhM4wdj/V0zOhE2UO73noUoTyL3DeLNz+56olwDF8vIEjgbLC4wPu7F39M
         Up/xcHi2a7dYMoMZxn1HXL+uqyIDePcOA5O+dXfN2dr8OJ5uM0X4oKlwJFXYm5sPQExB
         hdAZq5rWc+zLElhb/D+fIe5JzM5KTpSroUXUW/Ck3MwCJQAQW3OCJEayulIEgeBCwe5g
         V+9SLOzRRiVSpTbndZ3qZOfyrlVsM4Lc/6qY1gvsuPGpnVXtZ0U2OAXJeINJgNqdbuZi
         /3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PxUqZGIS6/bcymcwBqDjO10ViTvy5//AhLu9BV3RbqI=;
        fh=LV/ExFvaC1PWPiGVUiH7JyyC3HAK6eRNtvC9kcgQKK8=;
        b=XMYjyGW2NILt5XF2JAPs4ekszK77wrxMPhLDRlh8AmCJ76O01mYX0qYmstDUoBZAu9
         lrppQd4E/0ZYomQvp8YY6l+yJYRZS345WdF/uWEbx4qrIL0Ns/62lwgH0RKJTQJhiL6R
         /eL0k4rczmOaRgDb0rVAesiVUFGY+ddB38Y5P1A3G3FZysAGDGk6kFkwqCsJXeSRfXQV
         EeV/t0gKJ8e2sYyklq1XFhAqkwbXjZGl/fq2wBfAo1pNckDobPfCHHdILLrwQnQNAr6U
         hQrwJCE6sy4BsKaRXZgTtCOsMnGzRmh0g3HIr88IshvdC/XsTXZ00ENx1kTibvX87mjE
         QySw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779118528; x=1779723328; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxUqZGIS6/bcymcwBqDjO10ViTvy5//AhLu9BV3RbqI=;
        b=VeOFrJ8ULKrS2qSmyIDlaEGXf2xkh+E4PImmk73WZeMQSzZ7KroF/HGSnyPrFjbbRq
         i1cM1OSHau0zUehSwURWDuc94qRKS5QTqIbVHZKgU4wKz82dYwWQBGafPXBdehSjmLxi
         yV/bSny1k0LpNDM6T+PkFitfa95QZ6sc5wlQoS8KV+lidvTJ2lq7Vdd86+kNEo7aMWn3
         ZoStOleiq6n5dAvh4zdxbYU4uvisiCVxnOOfUkjJFS3FdjHnelLqApqrbmmUNxyzG3gg
         MIoECdvPJQL+fytcvVYdNaoyzleofYfgnUjkIwGAjQwyRvkDGthKmzo2eqIC5RJ81f5A
         azGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779118528; x=1779723328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PxUqZGIS6/bcymcwBqDjO10ViTvy5//AhLu9BV3RbqI=;
        b=RveZRfE19tQEW5noFl7FudejeRNhjgMzyUhczQG2Ni4TfUw+sx/tnt5PXdUTETmyrG
         kw7T0BC1MY5CdISz1uUmjA3fY7BYladjzZJ/WII58A9sRyeXojnwYrgxj/y78IGbDDuD
         U92xfrw7VRCDTWjynjxbvjKwTq11uQ9/htPVD/pFDSOxZ+s/f7NTfCH1NHlb4h2ZWkLE
         4ho+hJDp9ns6e0x8eucq5woqVbSMjocpizwc+yj6UoWda6qcT3seyCRV8fHEWZjkZB8Z
         uvwP20sQCLhwZUGmIDnIieRDDLybqp5T5jGPMfpTYDyL+ech0165LphNCTD8WjeNtkR4
         3taw==
X-Forwarded-Encrypted: i=1; AFNElJ/WIBZCTwMDucNuYcRIb3us/IAkaunT3KpBIg27/18M9zC1IEftUr/Uo9MrE0kPImijuQ+UEFlk4Mrx@lists.linux.dev
X-Gm-Message-State: AOJu0YxHjyvl+ZNP3LNH1eNN5HTv1NO/sROsBb+kxsjJ1D/kU7+ixMPZ
	t68B9HKjIb05STHDAJwKGditXf2aHSk5nC4CqHTXfnZ8ebFxv44mHQM9DX6DYzRjnQ/WxQsUTxc
	7kYlBKztPQea7UlQzxbHmLixzc8Os+68=
X-Gm-Gg: Acq92OFv0uwWkcM70Z4ks0mk0HEufXgUu1nO6f/5Q2OkEjROiBGUYhvFi6pz34oZKQe
	H7r9tqWYVAakiQxtlmE31qF01a2Gfy+8DuN5XlS4QJjtFsrv+Ei15RV1myBpQAuCgFkpVw8KCLA
	W04hsG+arqv6Z2xyAUaT0uYQbWMcDmMwGFy2LPR5ZyfP7HIAhxLuScIbZrhFGY27xaP1baHG2iZ
	W0DenyWxdhlyaYlJpceT9jUxcd7FTXspGr+e/qtD+26CukbSkvNjN7KAdj737c9qEe3ICCSvm4d
	Kn1Mug==
X-Received: by 2002:adf:f1c4:0:b0:45e:73b4:85cc with SMTP id
 ffacd0b85a97d-45e73b48628mr9335860f8f.35.1779118527784; Mon, 18 May 2026
 08:35:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260517-fuse-uaf-patch2@berkoc.com> <2889c98c-21e8-47eb-903a-ea40bf5c8c04@ddn.com>
 <20260518143218.7c7c1689.clarification@berkoc.com> <0e4f0d30-7ed0-431d-ac9a-874b046337cf@bsbernd.com>
In-Reply-To: <0e4f0d30-7ed0-431d-ac9a-874b046337cf@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 18 May 2026 08:35:16 -0700
X-Gm-Features: AVHnY4KAMmETSI5TPKWYBXHvLjigj-93k6Q8fB0H-L6LEsFNLzxq0oIO4iRR1ls
Message-ID: <CAJnrk1YjShKKKgTox9QQ86Y7zzRWUVscvWRCuetHEqv55bdh6A@mail.gmail.com>
Subject: Re: [PATCH 2/2] fuse: wait for aborted connection before releasing
 last fuse_dev
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Berkant Koc <me@berkoc.com>, Bernd Schubert <bschubert@ddn.com>, 
	Greg KH <gregkh@linuxfoundation.org>, Miklos Szeredi <miklos@szeredi.hu>, security@kernel.org, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, 
	fuse-devel <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 7:46=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
>
> On 5/18/26 16:32, Berkant Koc wrote:
> > On Mon, 18 May 2026 11:47:00 +0000, Bernd Schubert <bschubert@ddn.com> =
wrote:
> >> Would it be possible for you to test the attached patch?

The fix looks right to me.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

> >
> > Reproducer and KASAN harness from the PATCH 2/2 series are staged.
> > Two-arm plan: revert vs apply, race-widening debug hunk kept in both
> > arms, 2x50 iterations each against torvalds/master tip, KASAN + lockdep
> > + kmemleak enabled. Results back within the day once the base resolves.
> >
> > Blocker before I build. The patch references ring->chan and chan->conn.
> > On mainline fs/fuse/dev_uring_i.h declares struct fuse_ring with
> > struct fuse_conn *fc at line 110, no chan member; grep fuse_chan
> > across fs/fuse/ returns zero hits. As-is the patch fails to compile
> > with "struct fuse_ring has no member named chan".
> >
> > Is this based on a DDN topic branch that introduces a fuse_chan
> > abstraction not yet upstream? If so, point me at the base tree or
> > branch URL and I will rebase the test against that. If the references
> > were meant to be ring->fc and fc against current mainline, confirm and
> > I will adjust before the run.

Yes, on mainline the references are meant to be ring->fc, eg

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 5c00fd047c8b..27c417fd9451 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -570,6 +570,7 @@ static void fuse_uring_async_stop_queues(struct
work_struct *work)
                                      FUSE_URING_TEARDOWN_INTERVAL);
        } else {
                wake_up_all(&ring->stop_waitq);
+               fuse_conn_put(ring->fc);
        }
 }

@@ -599,6 +600,7 @@ void fuse_uring_stop_queues(struct fuse_ring *ring)

        if (atomic_read(&ring->queue_refs) > 0) {
                ring->teardown_time =3D jiffies;
+               fuse_conn_get(ring->fc);
                INIT_DELAYED_WORK(&ring->async_teardown_work,
                                  fuse_uring_async_stop_queues);
                schedule_delayed_work(&ring->async_teardown_work,

Thanks,
Joanne

> >
> > Assisted-by: Claude:claude-opus-4-7 berkoc-pipeline
> >
>
> Ah, it is based on Miklos' for-next branch, which is also in linux-next
> (I think). Yeah, we have a bit back port headache here.
>
>
> Thanks,
> Bernd
