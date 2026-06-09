Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95BE399351
	for <fuse-devel@lists.linux.dev>; Tue,  9 Jun 2026 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009738; cv=pass; b=hzimDAkqz0uFDc31TrUQRk39h/heSaNEoUtK8QREKLtdCxp3wNjH/OIu2N5Tn28BzJHL2JllDG1ASdQ4wH0ShnMJxZw78szoeVjflt9ScrdvAiDHmfIFo51Igd/CRs7RZbEzzAHUoS+WQXpBQX/Vq0r7Kgmg8z0gfyJSIaT5nSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009738; c=relaxed/simple;
	bh=tMU3P4Ph1XVQkRsl3n96NuuO/gaqdj4T67wpG8Vzc0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uH4zhok3FcLOfxidm6tUJHZbG8HDtEximIGiKsT6j8mAxlqQVOObcp8tCqmHXWAVlQl648Y2kRMLoFcFwnbd3WsciRrby3zKGcd1Zfad1FEKhYtocc+we109XGRNEkCFsjb1VFxNT+zMzx4xrzJtdy+j2lkP9CS6S5QNPk3EvUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=BSlmT6h7; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="BSlmT6h7"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-517b1f2c6adso24825201cf.2
        for <fuse-devel@lists.linux.dev>; Tue, 09 Jun 2026 05:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781009735; cv=none;
        d=google.com; s=arc-20240605;
        b=bHv7JSe7EyGvUQXtU/n3OiaqXbj0ngYQcCRoNBF1Id16x1veURE8rbTZT2tMX3ioGf
         //LqQZ2Z93qL8O/wcsfKineeU95aSPZGx+X47fnK6L9baZUbjuNFwn9VFWHxpn/7LLjz
         mdjfOclMJGI4hgjeGQzC30AxS3OmoJy0vDKkepFLPkAETg7BBM8AUeHQAVZ8DxLFTsW3
         kgmyEBidBRt6abYt0ItkefnhXDlRqSVWQNK5ra/TThbaCItTDw96tGLOPkoxP1c784p6
         kLMjqmn/qLOlyeDJxnKq62TZeFPlfdGmH9aNp3SQg0mplTXIOD3dbwTE6KU1wrJGrSNe
         BN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tMU3P4Ph1XVQkRsl3n96NuuO/gaqdj4T67wpG8Vzc0U=;
        fh=RQvDuH36Qu3AmBdx+Q2Y2UmmUXnM+tDttQnv9ho8ro8=;
        b=db9vCz4UFrS9aX8avsHA3sFy3CsTSRlQX/wdatYpcIoMbrt4e7FsEox7Q1rBf0nqBz
         YiLkqKKxdevooIkqcKQ+fddJS6i7sVhRbTKE2e1t9IqY8aL56G/gCxbc45aAKV8U0Z0C
         9K+7IRpblKskdBSEfbEGuMg0hOG8DQzPAj6YaRXumw/6Sw0cK6LngI8H0J7AamsZFgtm
         UITSJBnwQiqIoeNJvU6c9zAknxJn+H/rfj77hLpVafPqhZ7vVoa427Gzrb1wuHOF2MBb
         CZGXZnyttQ2B2FP7XD5TGhKqoTK+kLVqo9Eh1K5XEn9QlRfIEy8aL5oIPKuYNWANNYcA
         ZPJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781009735; x=1781614535; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tMU3P4Ph1XVQkRsl3n96NuuO/gaqdj4T67wpG8Vzc0U=;
        b=BSlmT6h7wa1s0gsqmCrYEuD18g91TDHincbyOKd6ml4vDd/JeqUFdSVuoxBcL2k/kD
         v2KogWxIZXnTxDfw59qCXgS/iV3kNHbxOrPlaJEXenbCWOwN1001330uwA6C+cFR7/ao
         wN4VlXVCZscMEakjs9U7s1l9RZWhS/wqr2Kbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009735; x=1781614535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMU3P4Ph1XVQkRsl3n96NuuO/gaqdj4T67wpG8Vzc0U=;
        b=HG9EFbMeg6gNE5Mfb978WPiktpFVXSjGa84Pba9jNA/yB7IlDal3dmm0ysggL1qIx/
         9zrCJu40xu3CK8i6dVdbSZL+DFiUtIFR9Jpqf/3UT5aU10Mt61GldfH6/schj/6/dXfF
         l0SLL0iUo+GInbr+wt/0krdwAJJGusYqRL0cSMezz0xVG1OewHeyxO+mRKMggOZ9Dvg9
         7DF4SfmJ6XuM1QQLBBTpWtSQt17b4NTahVP5epFROZWLYxuwUdddzqAdcuxNzZUVe+zi
         uFYtN+x2OEkfaZcxdsbbT1RJwOJ9vxJIyv003WFJ91CpZbAse9wOUFloN/oNa420Tmpq
         ABrg==
X-Gm-Message-State: AOJu0YwZUJ0E7rgIYu6nUNXeFlByMg672phZpNGvRDEve+d2zrjHgPBu
	U6Go8xYTyvxUpmEoFMOwKSF8dOyuU6rlZ/j1PdVWctuXgO1Z6ueMpgIrZUxwv/Y+AbBmE2Fx3xc
	wAMxufigTmJdfzftVtle+ymEUJ6X2gOstsynug1Ksdg==
X-Gm-Gg: Acq92OFbJlDNwmr2DMfoY3efjWeQ6+4s+tlc/97/BYWIlRSEVq+TX/jEXcwQkw7xb1f
	cf1pu8TBN+ihynUD/69axIDvfi8aWlBo5H+9YwLLpSlUgyVoUGP9J2iU8Pj86PiI24SO0NN5A5a
	vjLEC9iWnj08FR7R2JqV/HPMXFdSvG1FBViX8LWM8vdRKgRJ2TX2Kb7sYf5b+dzyY5HnnnUX80/
	cAuspEKTixjs4u1KqPuzdL9sH8wi85x9JgBAm42Gv8lQGjPhxbFvUeK4UOWmdLFQCRmSUV6E+fV
	RFK0gs2ikQb2lFFsu+Ut84OnDxU/Pfl++mMAE9Tqh3lVBBka4JZhvbfJdXz96Q==
X-Received: by 2002:a05:622a:58e:b0:517:626b:786 with SMTP id
 d75a77b69052e-51795a2bc8fmr300859671cf.15.1781009735054; Tue, 09 Jun 2026
 05:55:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608-fuse-io-uring-race-fixes-v4-0-fa410089a0a1@bsbernd.com> <20260608-fuse-io-uring-race-fixes-v4-2-fa410089a0a1@bsbernd.com>
In-Reply-To: <20260608-fuse-io-uring-race-fixes-v4-2-fa410089a0a1@bsbernd.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 9 Jun 2026 14:55:23 +0200
X-Gm-Features: AVVi8CfCQIBVhAdSjmgWY4QaSHK5WUVBv0415Y4YjoUKWGKwWUoEalW___Yh5eI
Message-ID: <CAJfpegs15h-r1Ng7LOKadXem7EhuYOV8+o8_vmAn0CUFwrh0HQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] fuse: Avoid queue->stopped races and set/read that
 value under lock
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>, 
	Luis Henriques <luis@igalia.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, Zhenghang Xiao <kipreyyy@gmail.com>, 
	stable@kernel.org, xlabai <xlabai@tencent.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jun 2026 at 23:06, Bernd Schubert via B4 Relay
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
> Fixes: 4a9bfb9b6850fec ("fuse: {io-uring} Handle teardown of ring entries")
> Reported-by: Berkant Koc <me@berkoc.com>
> Reported-by: xlabai <xlabai@tencent.com>
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

Applied, thanks.

Miklos
