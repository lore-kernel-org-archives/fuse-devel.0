Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E77C3B0AD4
	for <fuse-devel@lists.linux.dev>; Mon, 27 Apr 2026 12:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292752; cv=pass; b=cB1gkH+FUZLqb3jDq33BStrwJFz40XVpwxM1HzZGNN7V6QhldIKOxpBc8ApceFB4hgfoWzEU6GUIUC6uJ/2eEeT8RRUVq7wr9zfkeqQmT+CXi/E+dDJpiVHs3PY9ie2oLhT/cgxpD0GEqdTnoSTqI+52K3JCStEvf2EYR9ShpaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292752; c=relaxed/simple;
	bh=iPkU5RuEL8Iy6q2f8Fs0pTAtTlHnZJ/9+nx794HDw9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROuOMMehy8m/9GYlHW6fuFwump/zw86eKzFdekKbM0elSq1495FKZmvyt3feb0zBAdazWA2lOuUm0jN1MatrCLyMsY9QJBEfrWjEyqFJg8Fq66heaHp3JES7+ja28Bc9/3/9w8UdOE6kfPjfXtkvfDCeT2TQLeXowaGT6b0UZdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fpz2tuUR; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fpz2tuUR"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43fe8bda8e9so5653674f8f.1
        for <fuse-devel@lists.linux.dev>; Mon, 27 Apr 2026 05:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777292749; cv=none;
        d=google.com; s=arc-20240605;
        b=J81L9tq4ELgEkht7lr2551bbNPRL8Gmt249Yzk5JbeKvaOlkYSfPii2xSFqQqeHQcp
         F5T/OkyTCs55Mm+DfzMguIai/KoFoeScvacXxADQHmFsUhvC2h3+diFRfnr4wwNGqLa7
         oVvhMvQiLBX9BRxBK2vBFgcuhiIS6/tF0+TsjFOZqV8YA5yi+L6fFHfW+rAEcaWjzBOL
         GQKgbV5i8Wmz41YX6deZ3i2GEK1xWah6JR212AIRt5qubya86V8LcYKYUR+fWT9KUDdM
         /ev8TKBNXzmFORRs4HSWb0D8mLKPuaQnFp0lKnCVRV6O56AmmDjBVWTqH2sIo3c+6LgD
         WqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BHgplsNg6bzhAd39uFIAQ0QQ4UvkzNmBSSVztLVGu7k=;
        fh=+yxp3v0X2tq/aiabeHQujOK7misvr85J4Y6CkGyxjUc=;
        b=Xp40flMbEYM9a2DJLuQrq0WDVGgi/2igqK7EEttH0GRDYME/ZQNJRLKRp+zwyvQ6/N
         P6JdhI03rDux2+3MFyDFZdJW5lhEpk+nUtLzUG/9L7lvz9WlYb72OUAOZysiWeWGOphk
         8CX1h+dkzped5QdUnD93zpd4MVy25+x27Q/gkv8+RFDhQ5yqVOIi+QsRyccK26gO0qsS
         Cy4fYlV0n0kRwuinJ8eKhL6VXo1KgUwG1rhhSp/MnRJgGMsovq7+fEd9z5y7KfmQHKLg
         vjSsyn1wxTaNz83GBmPkyuEvwK0XBCA+yMZSqNbBr+NmK+TX8lQ+rgbY28wRMU70bWh+
         jMWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777292749; x=1777897549; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHgplsNg6bzhAd39uFIAQ0QQ4UvkzNmBSSVztLVGu7k=;
        b=Fpz2tuURaExywOfGDFoBk73EXO3WeDagZMB6DAu8vWxqy50UHGZ/IbHMtggbBZRNR8
         uai/yNAprQuZX55CgSsHiUhZasiPQO4mk+wohijxQAfPVQHzWTTzGgEfT8R+N5S14KIR
         SfMVDcBoo3Yow/FQrEdqZXqylbIvsjT1WJVjRqV+kiogBVxULhC/5TPQBi5T6HuTfzXZ
         slZdPFeqkhC3Fw7DBloQYOwaAsismhUitcl294YTeUV+h9lMFXjasVh350JDChoWKgcV
         rJ9GKn5+hRZP8VZsWi8PGUh1OQW1menTRXq+5/I8ETz0FrxlaNIC/QqJtugWIoN70qoH
         PfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777292749; x=1777897549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BHgplsNg6bzhAd39uFIAQ0QQ4UvkzNmBSSVztLVGu7k=;
        b=qftTw8csPyzNJd1d0QnJKLPuKWkJvJFcW3m5o6jNMXI4zArEKY34ZTw1VDyQurVWnl
         3cKjkzZkX2usaUx6htR7Qtmwr45375iC8WJzkLcKl6axZSGEAts7qrPmWZbPKsJIWOLd
         /H6w0nsK9dNznaG41c7RSgiLdhFGMzsktifUJAx9zbZ3O4sSh1dSqz3bS4Mp8hBskrlw
         4EI6xMaSgdfByh7H6dc6/SBm85blkj+QVg6+zx7bVTRcYmhbfgpE7AhekRGNoO1QWYjG
         kx1S0QgtaX3586UxzMU0VXAaaAY1tHyua8DECGkyeMnZLXgUGpzeyV0pAs6jGyskxJ18
         +cSg==
X-Forwarded-Encrypted: i=1; AFNElJ8nEbFTjq1uJbbdFccZUwJsrO86XSljoD5JVYIgh7w3TuhOZf3rLgiwE4nknF9+YJnn565UlDN+OyB3@lists.linux.dev
X-Gm-Message-State: AOJu0YzmJVHQpoMgskg7OCqGwXrxoutxbpcOWEd5X1rUux+GLG5spGs+
	cxfc53gFe1w834iuP/U8qyZxS8R8IKtLxmoUeV090MqSA9t9Rcd3QhwvtUZyNM8W8lbM0AOzIsH
	2tIFmb7O57W0R+slfsET1uvfw0Jzpaq3TilgJJzOQbQ==
X-Gm-Gg: AeBDieuczfC/ZasyrkZ2wx1LH/ujj/W2y1svMJLF1tIXv2xW2ILtNnfNKeHD5ox0vdJ
	2WN04oLYyfFbBVRjN4hHKvyskswdUrFhkZXeUdmAzaFVKSbGhX3KAniYMScoDfMHUC03FqscyDR
	rXuBxhhoJJKFpyys7+9+o6EUWjxLF+hjM8S8lJCMyoZ6gRZdx7Rwgxtrk6yW428JX52dUMmAo4P
	NMHNBEhGFFbkg7bC/rl1TEe3CetZxocanGBug7XndW1Yg7B1trgGss+6xWW4V2OZ1usRIwW+WMS
	PEN1/XOTxdceMpo02/68xNsRWbeIHK8sfw==
X-Received: by 2002:a5d:584c:0:b0:43d:7403:4b57 with SMTP id
 ffacd0b85a97d-43fe3db3ca7mr63378813f8f.10.1777292748623; Mon, 27 Apr 2026
 05:25:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403035752.20206-1-liwang@kylinos.cn> <20260423110954.2676-1-liwang@kylinos.cn>
 <CAJnrk1Zb=+syR_aOLVs4aXMTOUO7BRBi=MU-20xQOcDpf2iQ5g@mail.gmail.com> <1a25fd7d-f122-42b0-91e2-487235263af5@bsbernd.com>
In-Reply-To: <1a25fd7d-f122-42b0-91e2-487235263af5@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 27 Apr 2026 13:25:34 +0100
X-Gm-Features: AVHnY4I9K_5cEt71SBZmqbWqe61axndnexoDDSQnFGq1mtWGqmUKRI3sf_8p-Og
Message-ID: <CAJnrk1bgpVyzE2++BpPxK6RAhXHxFsQw=Jamf3OYmSvURDBj2g@mail.gmail.com>
Subject: Re: [PATCH v3] fuse: optional FORGET delivery over io_uring
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Li Wang <liwang@kylinos.cn>, Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 4:48=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
> On 4/24/26 22:38, Joanne Koong wrote:
> > On Thu, Apr 23, 2026 at 4:11=E2=80=AFAM Li Wang <liwang@kylinos.cn> wro=
te:
> >>
> >> Deliver FUSE_FORGET through fuse_uring_queue_fuse_req() when the io_ur=
ing
> >> is ready and userspace has opted in by setting
> >> FUSE_IO_URING_REGISTER_FORGET_COMMIT in fuse_uring_cmd_req.flags on
> >> FUSE_IO_URING_CMD_REGISTER. Until any REGISTER
> >> carries that bit, FORGET continues to use the legacy
> >> fuse_dev_queue_forget() path even while io_uring is active, so unmodif=
ied
> >> userspace (e.g. libfuse that does not issue a completion SQE for FORGE=
T)
> >> does not wedge ring entries.
> >>
> >> Benefits:
> >> - FORGET can share the same commit/fetch loop as other opcodes.
> >> - Reduces split transport for high-volume forgets when the ring is pri=
mary.
> >> - Reuses existing per-queue io-uring machinery and noreply/force
> >>   request setup.
> >>
> >> Signed-off-by: Li Wang <liwang@kylinos.cn>
> >
> > Hi Li,
> >
> > Thanks for sending this. To be completely honest, I'm not convinced
> > delivering forget over io-uring is worth the added complexity/cost. In
> > the /dev/fuse path we rely on forget batching/amoritizing and explicit
> > scheduling/fairness logic so forget processing makes progress and
> > doesn't get drowned out by regular requests; I think we'd likely need
> > something comparable for the io-uring path as well. Additionally,
> > routing it through io-uring makes forget behave more like a "real"
> > request on the ring (it needs per-request state to live until
> > userspace completes and the entry can be recyycled) which introduces
> > extra allocation/lifetime management on this path and it requires a
> > uapi change and corresponding libfuse changes.
> >
> > Forgets would consume ring entries but they're tiny one-way
> > notifications and imo I don't think they benefit much from io-uring's
> > main advantages (eg data-path/zero-copy). I worry theyy could contend
> > with read-write heavy traffic where ring capacity is more valuable.
>
> I think when FORGET starts to disturb writes or reads, there also must
> be some metadata load that causes many of these requests. Going via
> /dev/fuse also includes another two syscalls and cpu task switch to the
> libfuse thread handling them - that is not for free either.

I think the /dev/fuse cost is already amortized by batching forgets
and the io-uring path would have its own per-forget overhead (eg
needing to reply back to the forget request which would be a syscall,
needing fuse_req and fuse_forget_uring_data allocations). I agree
benchmarks would be useful to make a conclusion about performance.

>
> However, this currently might disturb reads/writes, if the queue depth
> is limited and memory optimized to carry reads/writes. The missing
> feature here is to have a multiple request sizes on the same queue.
>
> Btw, syscall overhead is basically the reason why I wouldn't like to
> have multiple rings per request size, but one ring with entries of
> different sizes. Will try to respond to the other mail later today.

I'll keep an eye out for your response to that email. I think we
disagree on this but maybe we can discuss this at the fuse BoF next
week .

Thanks,
Joanne
>
