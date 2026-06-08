Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D2E384CD8
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 18:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780945166; cv=pass; b=iS5eQksAU9wIaiLokvZpPbRcZNhuzfMZgm+lXYOICKMhv5u+08pYiUpmtSBn1GYiggmLZD7bm76UWTLuLhOByjOUp6mKOSM0OB8UWiukIXb22NHUFfoMPL+vvzSYZCecLTsJ2aYzqXfVN2eLn3ZUi1/w0e8LZeOmDYJrGz7VUD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780945166; c=relaxed/simple;
	bh=yBJFqXmRzaKdzw96fX2rukiJ4HnKelLlRI4gR0TmbCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tE8hCzMFyQywifEDPvmLOsJz0kCFuTGBssPzEvEdq5UtCxEQ3TZZ5tjIdu64YeiFAtKQk8lfPBMbtEEEWSSIQ4Z96pXr3JR+OTdKmxFd6W7SP2fEAVDVyBe4a1+S3kmAk7NOTxVrRMFKtdO7257QMjDSTe0LrUt7kypo77Y0dLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oczQpHVz; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oczQpHVz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so26492275e9.3
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 11:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780945163; cv=none;
        d=google.com; s=arc-20240605;
        b=lZUoVCXWk9A1tg2494SR6R5AYS01uk1/G37/cDuPwXM3B9Fcs/Jz6CDs0CGlROvu/X
         seOwjEgU23lD6VnQa5X6qhGsenZ0D0UTOqouTXP1GeeqeYcsN9FbWtzE4vCpFbq/RKIx
         tV6G2I5GnGDN9iK3rQQ23slMCAL5n39t1dDRGQBZKmvEFA80PIBxhpIiZ02L9vsX/hHe
         I78Mn/zn866QH5NYGnysP9yqFtqIIWSflTE+LexkOU2I0FsFiWzEUH1vzzqmBczNXWMk
         ujjnaeKh4/lauZ8tbD2HH2LATm6mvgrP++BEZByli1CtZkDeAnK0oVlmBHgrTY7mxWia
         3hug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O/5pQNMaPJqr0ufRp1ogIfZe7v/+zI1ZvqEwfPYmE0c=;
        fh=KC0MfVPloTgM71tAmzfhf/JASX8t3FLSglkvDOQsRnU=;
        b=LgOFn9IAfR6fhu2HOVKbHzbjwVzTdxBhTL+6v4Er8k1irPMDyEc+DOGgNeHFqxuPiZ
         SLfMNPrwCXHVfGuSUmV7Stnsqr2RVTsMD+97qLQKfYTbsneUKhgJnyoD4MIWU1qRsn61
         g4xgfx11uMM82kTNZ6H6mGxIP4pIKWl2s0S3k2MZ8J9jPFsV+4ML+brh/9iUNGoPm8iC
         nIcXq4RdsX54ZgloPonZXwNwvGwOZjpXCCWToG/UDTE7S0mFFN3cVm7u8pLGmLXLq/vx
         65ef4VFc+6nqlNDENtG0S03za8a4q8rNugJhMvC0IjojN2sNciPjq/banVSo5snzMLC9
         FsFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780945163; x=1781549963; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/5pQNMaPJqr0ufRp1ogIfZe7v/+zI1ZvqEwfPYmE0c=;
        b=oczQpHVzTAgQilYncvQPyN6BvTVOn1/r2Yw4uJHSNwb2/U/yQojCgqyBfIbwezp6bL
         xbfKuLm28Ti+FfG/RDTkYQvZJuBcUrsWChtX1oXNAnniAMPIqgECjxC1FXVMlUwfKiIQ
         l64N4iym2jUup//eiYNSaERksg7MHOvihOO2xIElNbUFoAkf1IG04LR+1gZUnGELsxSe
         qvKzp5kDghU8Y4h4d4HkmcZQmBHKwyHDHNWQ4qB1/FUJb69EoU6g0SKESP41FvYE3Uks
         N83CV8kFjaLAFcX15VbtZv465BshDoFCEgLRsHvcvHHgZoLnXwktIEAi2dxYv085HxDc
         KKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780945163; x=1781549963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O/5pQNMaPJqr0ufRp1ogIfZe7v/+zI1ZvqEwfPYmE0c=;
        b=kIIIbeq1TlBSgBLzIlkgs2Utqm41A+u5DNvE1Kxtt7QUxRos/IqwyoU50s7O6QS8gS
         zjPbqJXlWR3urA1W4js7uwqv8EkHztSBfbJ/RCbXWhOc4tP3Hu5kqbG5q8XSM4OghdBh
         eJquND20SQFWAjz6mevUR/0A9O6gkfQC4LdCX9lhx2cHKRRbbMkVc2sRbwEnAoGUkbLd
         0jLpRq9pfv4WpwIUlvF8Jp0T8Pg5222BmIZnGacdIttqE4bIRZLgXWQoedMBvb4FS7gr
         bg5WYHwmq8ZimgQa1ZMulQ3TJYBgrYMHmBm/G9ZHAVwAT7GyklbJGMZ1tASGH74vhZTC
         KeZQ==
X-Gm-Message-State: AOJu0YyWsgMz8rdldVeDLoQDdJsWi5cbueMEvNgPBw6PKeRz2N91SUfM
	M4GlSt1FixORA9djyquZdShyP2Cm6+4bXokUtxyOQDKoRDsEei4I46NcGNL+SQeIvrsqAo2Ks24
	INKoVlO8PbPi5f9k3PhfcivrV4N2TiwQ=
X-Gm-Gg: Acq92OG2GBatW1s/pgHRew+bxJp1eG9dnmhsg9XyWWH9Fqtu0IJBnTJulOXuO8N+F9v
	Gb5pPe5wzWw9rRpwuCuW6OGtQtyZq0hNkaz3k5hqmsK6/RoS/3Wf3NoVpIsk4HU4vZ2B8nHHpqZ
	qBelYVHRmH/hGNYdRFcNlkK2Zij0T7eMSsSVH385+mXNH2k9r47SDJEpLmW5SoCxovZW9gjvhlf
	WNtGy/qnYPJqiJQy89ZESs0sApYri0dbL2F2EiVtGVHPLZJ+4oknbhb2JsQTnRl0YQSC3L889O5
	IEigYaGplTL0xrUJ
X-Received: by 2002:a05:600c:81c9:b0:490:b724:507d with SMTP id
 5b1f17b1804b1-490c259f6e2mr237393135e9.11.1780945163426; Mon, 08 Jun 2026
 11:59:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516021138.2759874-1-joannelkoong@gmail.com> <20260516021138.2759874-4-joannelkoong@gmail.com>
In-Reply-To: <20260516021138.2759874-4-joannelkoong@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 8 Jun 2026 11:59:11 -0700
X-Gm-Features: AVVi8CceSKxQPUcEdfuHmSg_2xCefzXjumilBU8h8X_tuH8z485L4Aep2A-hRG8
Message-ID: <CAJnrk1bPQczAmaKkGOKAnKBb-FDb1Exmn1r_=HLPkJnKqd3T+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fuse: fix moving cancelled entry to
 ent_in_userspace list
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev, bernd@bsbernd.com, ali@ddn.com, 
	horst@birthelmer.de, Heechan Kang <gganji11@naver.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 7:12=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> fuse_uring_cancel() moves entries that are available (these have no reqs
> attached) to the ent_in_userspace list. ent_list_request_expired()
> checks the first entry on ent_in_userspace and dereferences
> ent->fuse_req unconditionally, which will crash on a cancelled entry
> that was moved to this list.
>
> Fix this by freeing the entry and dropping queue_refs directly in
> fuse_uring_cancel(). This is safe because cancel is the cancel handler
> itself - after io_uring_cmd_done(), no more cancels will be dispatched
> for this command, and teardown serializes with cancel via queue->lock.
>
> Since cancel now decrements queue_refs, fuse_uring_abort() must no
> longer gate fuse_uring_abort_end_requests() on queue_refs > 0, as
> cancelled entries may have already dropped queue_refs while requests are
> still queued. Remove the gate so abort always flushes requests and stops
> queues.
>
> Reported-by: Heechan Kang <gganji11@naver.com>
> Tested-by: Heechan Kang <gganji11@naver.com>
> Fixes: 4fea593e625c ("fuse: optimize over-io-uring request expiration che=
ck")
> Cc: stable@vger.kernel.org
> Co-developed-by: Jian Huang Li <ali@ddn.com>
> Co-developed-by: Horst Birthelmer <horst@birthelmer.de>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Bernd added his Reviewed-by to this as well [1], but had accidentally
added it to v1 instead of this v2 series, but this patch is identical
for both series.

Thanks,
Joanne

[1] https://lore.kernel.org/all/e55945b3-99a1-40b3-a145-b4867053930e@bsbern=
d.com/

> ---
>  fs/fuse/dev_uring.c   | 6 ++++--
>  fs/fuse/dev_uring_i.h | 6 +++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index d9108b5b5db8..f4ba64a1796a 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -511,8 +511,7 @@ static void fuse_uring_cancel(struct io_uring_cmd *cm=
d,
>         queue =3D ent->queue;
>         spin_lock(&queue->lock);
>         if (ent->state =3D=3D FRRS_AVAILABLE) {
> -               ent->state =3D FRRS_USERSPACE;
> -               list_move_tail(&ent->list, &queue->ent_in_userspace);
> +               list_del_init(&ent->list);
>                 need_cmd_done =3D true;
>                 ent->cmd =3D NULL;
>         }
> @@ -521,6 +520,9 @@ static void fuse_uring_cancel(struct io_uring_cmd *cm=
d,
>         if (need_cmd_done) {
>                 /* no queue lock to avoid lock order issues */
>                 io_uring_cmd_done(cmd, -ENOTCONN, issue_flags);
> +               kfree(ent);
> +               if (atomic_dec_and_test(&queue->ring->queue_refs))
> +                       wake_up_all(&queue->ring->stop_waitq);
>         }
>  }
>
> diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
> index 368f4d0790eb..22ec67e39ee0 100644
> --- a/fs/fuse/dev_uring_i.h
> +++ b/fs/fuse/dev_uring_i.h
> @@ -150,10 +150,10 @@ static inline void fuse_uring_abort(struct fuse_cha=
n *fch)
>         if (ring =3D=3D NULL)
>                 return;
>
> -       if (atomic_read(&ring->queue_refs) > 0) {
> -               fuse_uring_abort_end_requests(ring);
> +       fuse_uring_abort_end_requests(ring);
> +
> +       if (atomic_read(&ring->queue_refs) > 0)
>                 fuse_uring_stop_queues(ring);
> -       }
>  }
>
>  static inline void fuse_uring_wait_stopped_queues(struct fuse_chan *fch)
> --
> 2.52.0
>
