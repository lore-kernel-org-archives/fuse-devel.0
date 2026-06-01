Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D3C2D12F3
	for <fuse-devel@lists.linux.dev>; Mon,  1 Jun 2026 20:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345423; cv=pass; b=lHlpYxo1LvfCr3Wt8rlwWaruBgL3he1TNxFxWnqRPajknGOaZop6LDBVb0V2rbklBhA/j5hA5x+4R6zMo18p8q/3DTOljrBUL6XfUFr2EEpGqnctpGzd3wseIGOwqxz+Wk3yl1xZsquI/CN9dYU3z/ZJ6JdTXQdm8m7n6yJp/e0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345423; c=relaxed/simple;
	bh=Fm6M4um3jz58vuU2E3v6tA2UqFpTs4jPcRpeOwF8r8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dgj6AJjm+MUZoQSYDgsO/cv7GOVBJH7uFmFNhbe+nzDxQXe6YLknd/vdfTxV+MX6vMAZrrwmDTkjsgxO9cQKszL3OCGXSFVOfO945uyGDCTtHLzFcnUUwkAlxC/rnlzE8s5VZE+5MqVUP4yNq6nJXgMAdR3fRRPISHzUQnf7p0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZezqOBMQ; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZezqOBMQ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68cec9f4c6cso3119408a12.0
        for <fuse-devel@lists.linux.dev>; Mon, 01 Jun 2026 13:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780345421; cv=none;
        d=google.com; s=arc-20240605;
        b=OBTELOeMBbTlXcP3N/veq260ihliDhjk+s6qK3QLdl/wKSWmbOmj54h7LD9vV94a0H
         4LKDeLda3AbcVlAWA0foQshnO+QxgCvTiYTD6ZkIGVFKv1uoK8sods+r+k9jb9whVaSY
         QaxPBko2cbnrX+ffUAB3XsWNyQ4DhsrGI4PVjthxuY5uv/MEeY0YhxnhPEqsQiQYKD7V
         V0GBhPVLImhQufVD67d2iPigHpSXDl7FyK+wegtrllbg1mMkwciGs9Y/IV/ngQJh0AV2
         NSoGJpUFY6bmpKkLkgvMsJ0VPsaiJRrQWfYy7UK6ScbJVAYSUIuF4JVFjvhTb6gVFzzi
         d1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3vdy/9lfk10jFlI5MPXTZTsaeG+vblB7sm0FDgjlwKE=;
        fh=bE9eAi0lFSu1pyvReswhsmY9yRY367WMudejjV1LeSY=;
        b=TPagIy8hDE0owIHxgWaUMfAKu+S+0NlRshJqhW5Sc4keSNQh9UIlwEO5Wheqay0v0w
         /3is39+9eNfiQyMuDPg25qAiF9CIURzbW+aMgCnN5oK9rdJKNk/q+tY2xolwgM9VJ5rU
         C73/nhm0hFnYLZNeIs6NUpcRCqRMPXykx3b6pZZu5ph5yWeESCdTt81gNLu4YcFLt96J
         UhTETKOr0qdjg7itlHS6ogFr41Gc+GpiAePemTaTc+YnntkEzdz7jXXpX0Bn+9gTQU4k
         H6NBhG5G2ARVpmN5BW8VPna3xqePwOSMFrNGouNZuBxUiXrFHVt9EBgYBHsFvgq5fDQz
         d0Sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780345421; x=1780950221; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vdy/9lfk10jFlI5MPXTZTsaeG+vblB7sm0FDgjlwKE=;
        b=ZezqOBMQe5ksRMwN2tOw321bsjPxDb85gSCDP+ImhB7qSb4IZTGNlDucvb/R1r84m9
         qBCF8MH8y5IH7wqgz2HaoVtGhUq9DD3MVMwc1kojSPsEZF/Cha7Cya20jzOENephKtso
         Ek7q0oPAz04e8owf8SUroXh732JMbAHwnEws+DkdKfMhqYEVQ27fDFv9CH0tfmcAEFF4
         EeM99Fmy3eS21bxA5JhnWGDQ1I0d+kYKmd+KrGsNsCd8LZMc1Vh/7aJsihBLcKolKOF2
         Jo/8u3AL6Ym08PogDde1EM7jmU+xR3amHZuoClHYNHXW3t65V49LYU8C6Xvm5vDFpj/u
         FJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780345421; x=1780950221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3vdy/9lfk10jFlI5MPXTZTsaeG+vblB7sm0FDgjlwKE=;
        b=aqK/kOjY3/1JJWSqJsELVgK5LtYL+ANWfd34m3kP8209tsPhlmp/u7AF+ElgTCIlvI
         2ULpuP7/NxacunBljEO6WlYWWeUPFx6mzwdjcWe01YQ4RLdy2ktrV8AMb+u8WKG0kEbK
         t5doY3HRzUS57KZxuSNY1JG1LNNPEwxslobRmejSndengZr8FT6dHc7yW7IJwgpBOEQx
         6wicQxr4/+lTCebGVstkXuhOyp787Kkd8N2ahYPZxvRbXGMoLp8dFL5akvgcmI910cFX
         Prb2dA+KTus1vPBO6fUMNIEHZpTcIrcL/nF7H8QGTO5Quhk/zF0sH2IEjz7gfJxRhFa1
         VUzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VdCeo9kdiWm2KTCSHwUFp3jqQ4h+0GupwrRnbWw2WxakwDO9/LRkAnayRurbU6IhNRS4ecw3ot/Lb@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3WBNUflPA09svO1eeAhz+uqFDux9Gzvo3rmbadBheizW++s3x
	UdLTN6T6r6UlUncgjRxic6tYIT3Z+4ITNrzD1DhpVFRvQE0rxGDvI3iAcaW9OMwWdcsljoVSIJm
	v871Ouc051YwuRRxaxwwBfW8AUvSsWCc=
X-Gm-Gg: Acq92OGbPBYyWnTmb4km+LBxNYf9wa8eqqYbxE6KscYn8Hc2GNXRg4Zbyh1WvJbfU3j
	83kp+7A3dAacOUXGFmJbalDkYotB/nL+A7JfpDMW1Wo45YHtg9MIV5DdGbBrqSkO0OxhY4AKMMa
	KWjqGb2W8xVmHvydRIsm2XkFgL0sO5VjAo0H3lM2jsNzN0YZ/1mWtWf0B1mD2CjI2b7CHR1e0IO
	wIKPl2aLS6vqSBTUCnELkrPEIHdu5ryORN0FKAprgzMV1Dqu4jZkt80LJPfw88QX8SDhyUWW1MO
	+ThVVkmYnAr6iGQpgI/0Z13Sj3fTPkXd8q/IhpoDk4FHIUYeIIIo
X-Received: by 2002:a05:6402:11c6:b0:68c:342f:239e with SMTP id
 4fb4d7f45d1cf-68c88b3c34bmr5981654a12.7.1780345420716; Mon, 01 Jun 2026
 13:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529031918.7361-1-russ.fellows@gmail.com> <20260529031918.7361-2-russ.fellows@gmail.com>
 <ah3VCxciXhS0CFdP@amir-ThinkPad-T480> <02AD69BF-A91D-4798-A90D-7692D3C1ABD0@gmail.com>
In-Reply-To: <02AD69BF-A91D-4798-A90D-7692D3C1ABD0@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 1 Jun 2026 22:23:28 +0200
X-Gm-Features: AVHnY4LctJJobQSLiO3WLovKObSNVtqbvrH95fVZEYwelIN2yUK74a1NSIrwKII
Message-ID: <CAOQ4uxha6Z8ZH0jT5PB6iujQmLjmpEXBCVLkCFgzegcg+2g=JQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] fuse: fix FOPEN_PARALLEL_DIRECT_WRITES being ignored
 for passthrough writes
To: Russ Fellows <russ.fellows@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, miklos@szeredi.hu, 
	linux-kernel@vger.kernel.org, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 9:25=E2=80=AFPM Russ Fellows <russ.fellows@gmail.com=
> wrote:

> > On Jun 1, 2026, at 12:52=E2=80=AFPM, Amir Goldstein <amir73il@gmail.com=
> wrote:
> >
> > Removing stable list - this is definetly NOT a bug fix
> > Please CC fuse-devel@lists.linux.dev for future fuse patches
> >
> >
> > Not a fix, because this was very intentional.
> > It is a new feature that you are proposing to support parallel
> > passthrough dio.
> >
> > Anyway, this patch has many problems
> >
> >>
> >
> > You can't just use fuse_dio_lock() like this
> > it plays nasty games with the iomode.
> > It does not even check for O_DIRECT mode, so this would do
> > parallel buffered write (at least until it meets the filesystem lock
> > but its not something we would want.
> > You should study this code better.
> >
> >>      ret =3D backing_file_write_iter(backing_file, iter, iocb, iocb->k=
i_flags,
> >>                                    &ctx);
> >
> > The problem is that while backing_file_write_iter() does not seem to
> > directly require an exclusive lock (apart from maybe file_remove_privs)
> > the fuse_passthrough_end_write() callback does I think rely on this
> > exclusive lock.
> >
> > So proving that this can work will require more research and more effor=
t
> > and I am not really sure how that is going to work out.
> >
> > Thanks,
> > Amir.
>

No "top posting" in the mailing list please :)

>
> Amir,
>
> I appreciate your feedback.  I will review and revise my proposed changes=
.
>
> I will also remove the =E2=80=9Cfix=E2=80=9D tag and mark this as an enha=
ncement to FUSE parallel I/O.
>
> As an aside, I have tested the kernel changes quite a bit and have had no=
 crashes or corruption,

I believe that but the corner cases of parallel dio with extending
writes are the
devil in the details and its unlikely that you covered those without
very deliberate testing
I am not saying there is a race but takes a lot of proof to remove a
lock and this
proof is on the one trying to remove it.

> and the write performance is 3x.

I believe that but can't just remove the lock and show the performance

>  But, I will use your input to focus these changes more appropriately and=
 eliminate  their unintended consequences.
>

My instinct is that it might be easier to do this with PASSTHROUGH_INO [1]
where the attributes are always read from the backing inode, so less
races to worry about.

Good luck,
Amir.

[1] https://lore.kernel.org/fuse-devel/20260516004004.1455526-2-joannelkoon=
g@gmail.com/
