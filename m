Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B463419306
	for <fuse-devel@lists.linux.dev>; Tue,  9 Jun 2026 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009707; cv=pass; b=U0MX6I0nPLVwS7uYT0bQu1oL+lhvlqE/sJts8h2znz64HUSL/RUNJQnL/uY9Ekip78G342fOVRN9qEFM5f0Lg0Cz2iaviVgp34Hu2wTpnuEWeNqwgTRhcfHqnWmDddl4x7Ud7sViQex6t5JVxu70ivIuBq3tPFMYFuAPEwp+/iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009707; c=relaxed/simple;
	bh=sEIMZUBdiwxscVUlD2dgOWCwhXFlDi66aACwYlIS5n4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZC+wdAnSov/0z6qWL70pgoOYCbGRp5BD+iP76NMoY/fMMIFrGdXdcLHL05pRJ3spy/Ldx4MOCZkom8qbklg32zbmfDgPKdW50YZRk8lQw7ySgFvHn9HevmaG0dGtXu/zGTRF3wqS+AIwdd2S7QwTOEExmFoiegkXjYf4JMkrzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=G2LyyDnF; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="G2LyyDnF"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-517a5cafc3dso34702621cf.3
        for <fuse-devel@lists.linux.dev>; Tue, 09 Jun 2026 05:55:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781009704; cv=none;
        d=google.com; s=arc-20240605;
        b=HXeUio4VTj+4qTuntwKc0+WK5thQFuI1msJET+zXtpR+UvVKWc1MOfmnc/rp6qzC2p
         +Bctc8pnzgAXOCwvAWHqflxMj8pjpubZw4QtM+Y54XJw8z7hL+Xv1RqvzY37KK907njb
         F0UlHKw3D7/SFanmMIw+tDwBmGMuiOpBDuyFLtsS5WFy6bcbSWZK7sx4ZVrLRWZy0IgY
         QhDXnPoW8TzUpKS93whRuBsGFFTCnqVOhUfbp1A4kNAcZXFhZc7dCmlOrkBDkSC/y1z3
         EFP/S5tkX2qRUSbsSl1iKGWpqoiWX1WFONFYHU7T7ncFMjaOoUTb/yLPu1YjCZ7BNgu+
         qGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sEIMZUBdiwxscVUlD2dgOWCwhXFlDi66aACwYlIS5n4=;
        fh=EsGygOiqNUzPC/uPAeNLavF9w+Dc/uUS9BCsEWCkjCs=;
        b=BvOUc9jGEE3yJHjI27gbHrb6oL/J6F2NB+WmKQutndSLMmT/H5qQPIeYz1pAOzu0y0
         vaejqNKQ71v0Txv/8xOh/SV3bNHAaUTncbhYN/BzIdCELUlg9949FDiL0vXbHUeMFfeV
         RsXnUy9gyM/5NPkOsJXe9olmtUHQcBWATMGjCdLHMnI5DAfxL3GK/iVcwEfmFLcac7i+
         g0y7xmeyBnu2XsjrPlCYPUxQ5tMYJ62tzXVjQLnLQiSAfruyNyq32Ht/VcIF/fc0543D
         tG0D8Ree7L6uG/MWj/vXiAa2i8L73Qt56fEvjAvpGfjpE0oJU69CeaK1aDkDNlI61ZxQ
         82Hw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781009704; x=1781614504; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sEIMZUBdiwxscVUlD2dgOWCwhXFlDi66aACwYlIS5n4=;
        b=G2LyyDnFsAa44zGqyWJIhPuUEfioad/RkqJPT5PxozsGJ5sYriVOsvwm4jZ2lBjcWA
         MEY/RLiCpVng+xlrH+6XVMyHcC9X+NbPOepkM8FAxDRzGkgupkjv+Op3cHk0TuEAYWZj
         7h155niWd5Cq7R5VWP+TvPq7XbNbTPT2ZZDj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009704; x=1781614504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEIMZUBdiwxscVUlD2dgOWCwhXFlDi66aACwYlIS5n4=;
        b=ICkRUIeUa+R07knstACrybABImMudFMKxkZlaRCjxUuI4GOwP5ILdIafEz/ZZsNkHt
         Phu5elXZ1cHfEaKVJ6kJxSlGPaSlg1iJmDCIQA7qJShUc+WcUk+rTSUnc5p/jnKSN5EM
         RG/VAqeL/WFY7bzoB/7CYmAj5hoA5OeEWJg6Iz9qFfYKOtv7OXjcD8aPCkstH+noeh4C
         5Pm+xaeyoYzd/n49ByoQufY0+sV/2x44UwmSX3GE3iRHQl2L8RV0U/B5PT56gLwVsjCw
         FPqO8dPYE8LcNny4hmsNqOTrk71+3EwWldkZ1sgzg2z/iVWH8DWh7VynGGCJ5WE1yVTp
         qolg==
X-Gm-Message-State: AOJu0YxRh1AoxQuJ497/5K5u+Hw3Qa/LJ/c6QWGZMLyR8/3DQwqPUnVp
	ZiWECMDWhpX/nLJEi50UVbDp34ZprKgOMq7OlI+HMASCsY4YkP4mF0wEpsscymKeSTiow07HHwU
	mrGMhlG53myt8BKi9rENdE970SCeYlLXmoZuWmKi9Sg==
X-Gm-Gg: Acq92OGg7NTsjOxNEXOX74+hda+PiEGnPy+fdi46YIiGBzrxB8EvyCy92PgS566d3Bi
	zLpx/GUw7otYRPhSmYGhmg5Cmiek84qgK/MWg5nmqsBaIB7g5dGeXyGYuYQj2kuPjfTMUi0ffnv
	0ljGbqGCcJ9s7tYzz/ddFnEh60Psz9JdWLS6yHYj0e5LFJkG00ESpChbKrjMf2uZbL72IujdAWr
	1R1fnDg18pSx+9z1vm5zF1z9B5n07POF0Q+KZqgAy5fVqbsPbDxdSEPHrZ0iuUO5U5JjIJaOcaL
	M7Bv425rEDrMyd/LDtBQv34wiGtbF6VNcXAOWS8KGakBHX++sWk=
X-Received: by 2002:a05:622a:93:b0:517:895f:1935 with SMTP id
 d75a77b69052e-51795a96a45mr277877691cf.13.1781009703842; Tue, 09 Jun 2026
 05:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608-fuse-io-uring-race-fixes-v4-0-fa410089a0a1@bsbernd.com> <20260608-fuse-io-uring-race-fixes-v4-1-fa410089a0a1@bsbernd.com>
In-Reply-To: <20260608-fuse-io-uring-race-fixes-v4-1-fa410089a0a1@bsbernd.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 9 Jun 2026 14:54:52 +0200
X-Gm-Features: AVVi8Cc-q5LQ6UC6EHaalYgFQDjfCGlvOPZktQhpXDXeb1mKf14gtIDRNHBDGH8
Message-ID: <CAJfpegsc=TamZa3tzeqNwMAwT3LbgYzKkgR_YuPR0GauXDaesw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] fuse: Avoid use-after-free in fuse_uring_async_stop_queues
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>, 
	Luis Henriques <luis@igalia.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, Zhenghang Xiao <kipreyyy@gmail.com>, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jun 2026 at 23:06, Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> From: Bernd Schubert <bernd@bsbernd.com>
>
> fuse_uring_async_stop_queues() might run when the last reference
> on ring->queue_refs was already dropped.
>
> In order to avoid an early destruction a reference on struct fuse_conn
> is now taken before starting fuse_uring_async_stop_queues() and that
> reference is only released when that delayed work queue terminates.
>
> Fixes: 4a9bfb9b6850 ("fuse: {io-uring} Handle teardown of ring entries")
> Cc: stable@kernel.org # 6.14
> Reported-by: Berkant Koc <me@berkoc.com>
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

Applied, thanks.

Miklos
