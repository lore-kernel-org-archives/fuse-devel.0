Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8523AFB0E
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 21:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955652; cv=pass; b=SeGrUryBv4vX6EU1zNYVZIa81TN/8Tf1r3d1Px+zk4DudHdlcfkt6A1/oRke0V9IlnXSVleJMKhyRf7QMg3M7WmwISb6fxDcMXsZ7wbrRjx/1NrT8TzBH098joI6Y+jDw6eCMqdoktQQrPmSbyt4qfamPJVoKG0T0TRIBl4wnKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955652; c=relaxed/simple;
	bh=Ee9Xn7IhMjzgRlzNdLn1t0m2wRUlZCl0tmQY9Dwz1fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpNrBSPsITL9HeVw2hp1Rpi/uHA/C9ox6sNYVWDcUrjmOj80G5xt4E2Yx+keOd8tP5xJO1op3iXzBR8TjK8wOgFWVDqPSMYrdoasbTprIJ25Yu/Gr9GR+SGS2CqzzSwhkHUrdLO6ff92Uax1XLc/fUUn/hvKSn5cP5hUmUcLKfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxgeosMC; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxgeosMC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-460166910e6so2458476f8f.2
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 14:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780955649; cv=none;
        d=google.com; s=arc-20240605;
        b=EKEbkEU76PwPKwgn2ioyOynek91kGHafYSdCn7JeTtkjJcQjvuMOWY/YvJ6A+Q5Pp8
         qasgt5pwC83pzB9HulhGnrn5pqu5xcLftGLRnbhnYdW6u0ZfdhaBTCLecASc5pod1Rey
         6pESuNykgj3Rs4n2dcV1WWMpYWVmkzmTRHZcXMggOPzl5n2ONEJR+Jszs7zuZ2u0iE/k
         wh5W0zXJxpLAWQ0UyhS/8EUIsI1IBSxT2Y0qqLUTQTYVRLwlMH3dtPsOGfe+ZBym5fKR
         LeNt/9Bex7WZQzht4tRHSkIzt+1QQTgfF1p5nv00JUrEpCJNopBIPivpTmlcD+cXVPHM
         gVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hwTesbXU/7kP9E8+n1WAPudvCCHPRs08k9RHR6A0gzM=;
        fh=ob+yJray2+9lSTdHFh83D6iUw29pCCLJmtaUVpdIZxo=;
        b=PlAOLNX9GeHE68sCxek46Gj8UNsx4l5d+tWOdnimtCxIgLEJmhDqX4ThSLEkOPARU1
         Xhit5LnNTi/Ij8GGTKQmuYpBTGsIf8xMiDsVoUY4Pi2RZhozLT20H1UnhWVTt1FEs4rv
         14QbLHl80/WOBxkQSPZhTtlg77fmf6bgGpQu+tdoiW9tyU+R2f+w0pGLH3bAfwe0keEd
         9ggTxcx3UYixzpLUFBnoFq153aEboDs24MNbSGUBzKn6e5X+Jo+8WQdThvdIpDhcMSP+
         zZS/ELog+kT58U7u9HBUZu50jOx5d4N5v90dv7rY2MUXPaoxhNyAl+8b0hNSdpGA5sx+
         HHMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780955649; x=1781560449; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwTesbXU/7kP9E8+n1WAPudvCCHPRs08k9RHR6A0gzM=;
        b=lxgeosMCYAdC5ThuSdUzibg+d1668EBKEdGsNut1XpFffEpPBipRHqAYUs74QMRqTe
         jkRFhSR90MVU3QKdPpLYPjnM5FZRo7UVS8z9/xVb2NFaPBhNMfE10TBlj/eIPlOCbZTV
         hyAQvYbEvAaNh55/VN7b6wpijc28+uexClIWDErhy5hpp1q06ZPfOsfHIRG08pUpdwpp
         4fltGf39XQh1d5Q+O4PH1DebdBN0+7QQxOYlQUKayeLiBDg7RvaISAnNsJWXoYdhcwVF
         FEP092+OIbSgtFr229JyDfmSN+t4y5AIV2NafNopwAlRfeS1QVJUT0ZGt6+uy9gT/ND7
         NPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955649; x=1781560449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hwTesbXU/7kP9E8+n1WAPudvCCHPRs08k9RHR6A0gzM=;
        b=Ml5Ng0YT+wpvFU2208oVrLWkuTS5LNtin/lZUbHpERir0jVV/QPomq6gVCnFOhC5bY
         j9OfQxdcmy3l92VfBTZZGG1D4ZlrRnQPq3vEFkmrF+aOgsfH0Zu2SH28nTMIDlRupmyH
         upORBUpIPeLw5N4LA3lYspzW42LK81BdHZeRMcytR5i7fsi2fqar9paItxeLFHHxC0qe
         rR95wa3+xNDQKM8kGLiJ1/yjUlhkb8H3g57jhjY9sw3ebe2zlo/ORDDNQxraBkKZE9XQ
         i5B70UuGJkGM02XjcyIMIBEfxLDGm1055lLga/R0Ld+EKveCQGNUvjxQZIsrcfRHnBrK
         fUzw==
X-Gm-Message-State: AOJu0YyItDg98jr0zLYwZfMgeQHKo1ZVmwrU2unxj0w+HbtrBYeVS/Yo
	E3skh7X5yQInFuStz+ByyRGoO146mi4yVLU9hlQkdlHLm/iHEPSt2NTs+YAshQhqq1XulnYJfej
	W8SJrp2VZmsV6j8/biT9FndFVjLBggGs=
X-Gm-Gg: Acq92OEByxCFRzF2ClOUAlCakjkknvGDRHMfnhZpKQg9kytITn7afMypkDozlm3cTcd
	8w7KV8zJVCuRif4wkGlxWzFJ95fL7OX7rzOZvkdnrUM2wQzie7niggkZg3XB7i/z7UXit/PVtKO
	d1zy3d2VtUxzwjuGmI4x/FEC6P8YDPv3ucucjVXQc1Kz081AW1dCYL4FmtF4ff9HaxfZXEgfIaQ
	ROSvnzM/eZzbAW/GTiGTcy+nCZ4gUzKvGN5oTOEpQErwtoOgWfaElRnwu8hMCBEkmZkXPhG0r3H
	rnW89UNyT8zqo3jpg/4Dgj4yfuiKf6l7ZtJ6wPMppQY4/rvsIwhFpRdr5x+bUGdxKw20zCIVaAI
	t265t0koE
X-Received: by 2002:a05:6000:1864:b0:460:5022:8a76 with SMTP id
 ffacd0b85a97d-46050228bd7mr5095144f8f.31.1780955649125; Mon, 08 Jun 2026
 14:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608-fuse-io-uring-race-fixes-v4-0-fa410089a0a1@bsbernd.com> <20260608-fuse-io-uring-race-fixes-v4-2-fa410089a0a1@bsbernd.com>
In-Reply-To: <20260608-fuse-io-uring-race-fixes-v4-2-fa410089a0a1@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 8 Jun 2026 14:53:57 -0700
X-Gm-Features: AVVi8CeysiIvgDFkKeyCZAH7HfHXkTk8CQFXnpQxzPoRU525poSTIg8BsTNRvnY
Message-ID: <CAJnrk1YZim4WoKikoMzZ6jMkfh1H6DOFOzh4yT-wo=wOjXbTcA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] fuse: Avoid queue->stopped races and set/read that
 value under lock
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>, 
	Luis Henriques <luis@igalia.com>, Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, 
	Zhenghang Xiao <kipreyyy@gmail.com>, stable@kernel.org, xlabai <xlabai@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 2:03=E2=80=AFPM Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> From: Bernd Schubert <bernd@bsbernd.com>
>
> There are several readers of queue->stopped that check the value
> under lock, but fuse_uring_commit_fetch() did not and actually
> the value was not set under the lock in fuse_uring_abort_end_requests()
> either. Especially in fuse_uring_commit_fetch it is important
> to check under a lock, because due to races 'struct fuse_req'
> might be freed with fuse_request_end, but another thread/cpu
> might already do teardown work.
>
> Cc: stable@kernel.org # 6.14
> Fixes: 4a9bfb9b6850fec ("fuse: {io-uring} Handle teardown of ring entries=
")
> Reported-by: Berkant Koc <me@berkoc.com>
> Reported-by: xlabai <xlabai@tencent.com>
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  fs/fuse/dev_uring.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index d658ef6877a4..c31240967932 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -130,10 +130,9 @@ void fuse_uring_abort_end_requests(struct fuse_ring =
*ring)
>                 if (!queue)
>                         continue;
>
> -               queue->stopped =3D true;
> -
>                 WARN_ON_ONCE(fch->max_background !=3D UINT_MAX);
>                 spin_lock(&queue->lock);
> +               queue->stopped =3D true;
>                 spin_lock(&fch->bg_lock);
>                 fuse_uring_flush_bg(queue);
>                 spin_unlock(&fch->bg_lock);
> @@ -898,10 +897,15 @@ static int fuse_uring_commit_fetch(struct io_uring_=
cmd *cmd, int issue_flags,
>                 return err;
>         fpq =3D &queue->fpq;
>
> -       if (!READ_ONCE(fch->connected) || READ_ONCE(queue->stopped))
> +       if (!READ_ONCE(fch->connected))
>                 return err;
>
>         spin_lock(&queue->lock);
> +       if (unlikely(queue->stopped)) {
> +               spin_unlock(&queue->lock);
> +               return err;
> +       }
> +
>         /* Find a request based on the unique ID of the fuse request
>          * This should get revised, as it needs a hash calculation and li=
st
>          * search. And full struct fuse_pqueue is needed (memory overhead=
).
>
> --
> 2.53.0
>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
