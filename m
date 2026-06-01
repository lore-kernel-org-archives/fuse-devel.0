Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A7D369D79
	for <fuse-devel@lists.linux.dev>; Mon,  1 Jun 2026 19:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341958; cv=none; b=F2xsPtPlz7koxZ8aX0gL7BP95cflzBiFJbVXmmzPg7lCYy+fBjDBFW0gpZCKm4KFqfMi7Dx+wFeDw2kwdk7Mo0vVHgE3zjTjP/y82PvCsQeWkkgHRdeYTi60nTW8P+V1Bv+MHPgF3OJHCfBjkn5LLVn0p7MbRN56zqRBLmA7WQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341958; c=relaxed/simple;
	bh=OWRuh/RR8NJ5UTF40FybsEdKJgrcmOFPEN3Dxz4VubM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=h6FaiqSEOSQJOBdh8WX4/M8nyF6gTEVpyaPkMb+bKySE7OhUdSlnLMUvga30/hlu1XwvPKOY51IpHPeZQAjUWvs3wm2QqtZFQAikBC7PUIlIm2ia1inM45OcVfIdbc5SL4j2SVbBLlQxi7ZrqzaNt4Jm0mESVO8P6lyrOKLmxRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0gxSKOL; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0gxSKOL"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4856128f670so7135912b6e.0
        for <fuse-devel@lists.linux.dev>; Mon, 01 Jun 2026 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780341956; x=1780946756; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUcR4pbJRw7eHCuwwMVNxCHcKa3q8+6m2Z16fn9DjGg=;
        b=K0gxSKOLoZG3Jc46AcYBCixddU10tziGTbpsW1vxIoQPX82bSoPprjRS1lX4ccmkE5
         A3eB4ZgPJ0ag5wkEHpT5KusKO/gObgrnFguj2PoA+JHzuK8f3cWiXmdbi9+Pgd3ZQWU+
         0kjpvDtZFPERAj1gFsLd33xtthbQ6JN+Sw4uts0uh/YbYP+er7hnwfQySvkBKRiEgDj4
         Oir/EYN3LqQtrBer8JVhUM4x5s/j+EKHz7V8N/hDT71EcsGDrCAyHO2UC+2HEgebCrYO
         bhX4jy0UacUkKRu9fCbzl92biqiyvO7huPwhPmYtSvFF1WXU641ryX6xFQkePq8SgjPH
         UxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780341956; x=1780946756;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUcR4pbJRw7eHCuwwMVNxCHcKa3q8+6m2Z16fn9DjGg=;
        b=RYvOL7cFB7hC8PXX1UEl06yXKhrsOzVCcKLu891XXsUqtVndLIDP8nnB5t4qF2Woru
         XUPs6beV7ckGkX/VJIfDHb4qyeWpJKVdDhf9JYsQvAGBrl6sxqDFezvy06H98OZ/mTQ9
         E0h5ip/grHW2Vv5br14bkOOWjNqRTCIH05d3orkxTCWDVHgnr42nHOB69Or6DrsgE/El
         DHBbWFybd8C27Hr5eYmvFwFYDntXgXzqtQdhbJD4525nA2dX/rfnCQ4ZQMiB/b8/lR20
         B6V8K5dTU3i4GbfM3nOdaYYEC4um+RYw4dvJhDXCrdnpOJ9/ZuK+B6T/vbefQRxaA/cb
         4mZQ==
X-Forwarded-Encrypted: i=1; AFNElJ90pSB8KTjTjkKq1q8u+K0RlQQVVjzxUWN3HaWzZ2uPupLM1Yyk5Iy/E4opfMU7igMnw+bf2HnbuYUg@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8HxJ4uDLQ31wAihZw/b/G39oKI+5vR1HHgZyCPx5ZdeRiSxhJ
	LSd9DsayOrnCLJU8X/Mk/OTNw52rcL8c7b7kQesDOO4FIqn3zn+o7Ttu
X-Gm-Gg: Acq92OESoLkHm1sIBLzcbQBhy64seDyoJJ1m+X7FpdLFS5Lmss1jAoB4WjuSzkbJ7dX
	gYGU3ibChd01yvJ0UlMIlY6XeyFebRln0HVW2rJ5AULdPtjsj5V0WfhMN74dYmag6reuxaZmghz
	MJ4ESQLbH4qwOFWsAEO0Dwmtqx/30j2lgj3POWZojeGbP06xH+v6Syd9JvC3QLKCrWtqupbnUs0
	I709OgYd87wsxKuS9hv/eiYewn9Cs1R6VnTq/slG0Moo1eWVpdynDtLWXpBijc2Jls40LWQdafN
	GY2S5kA3BBbBkGAeCxlM1BloFciPlPvUwSr8ZWUCuD4DgSNjOgR1VpOiP0kXmYysLFVG0QxjlRQ
	NUPm5DVmTcUSr3JTXvIYfAOkrhpoDTHhE1mI7OxHsDjtT1aQBz38g515gMs6eNuDN6eYOvnd3zG
	demQz2w/TQ1jm8WQnIoq8LyK7yy7mkY/eY+mpdo3K+v9LTY1syKVA+bA==
X-Received: by 2002:a05:6808:318f:b0:47b:d07b:ec9b with SMTP id 5614622812f47-485fb3a1033mr7732122b6e.24.1780341955751;
        Mon, 01 Jun 2026 12:25:55 -0700 (PDT)
Received: from smtpclient.apple ([38.175.164.190])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4863f0c9848sm374903b6e.14.2026.06.01.12.25.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jun 2026 12:25:55 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.7\))
Subject: Re: [PATCH 1/2] fuse: fix FOPEN_PARALLEL_DIRECT_WRITES being ignored
 for passthrough writes
From: Russ Fellows <russ.fellows@gmail.com>
In-Reply-To: <ah3VCxciXhS0CFdP@amir-ThinkPad-T480>
Date: Mon, 1 Jun 2026 13:25:44 -0600
Cc: linux-fsdevel@vger.kernel.org,
 miklos@szeredi.hu,
 linux-kernel@vger.kernel.org,
 fuse-devel@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <02AD69BF-A91D-4798-A90D-7692D3C1ABD0@gmail.com>
References: <20260529031918.7361-1-russ.fellows@gmail.com>
 <20260529031918.7361-2-russ.fellows@gmail.com>
 <ah3VCxciXhS0CFdP@amir-ThinkPad-T480>
To: Amir Goldstein <amir73il@gmail.com>
X-Mailer: Apple Mail (2.3776.700.51.11.7)

Amir,

I appreciate your feedback.  I will review and revise my proposed =
changes. =20

I will also remove the =E2=80=9Cfix=E2=80=9D tag and mark this as an =
enhancement to FUSE parallel I/O.

As an aside, I have tested the kernel changes quite a bit and have had =
no crashes or corruption, and the write performance is 3x.  But, I will =
use your input to focus these changes more appropriately and eliminate  =
their unintended consequences.

Regards,
=E2=80=94Russ

> On Jun 1, 2026, at 12:52=E2=80=AFPM, Amir Goldstein =
<amir73il@gmail.com> wrote:
>=20
> Removing stable list - this is definetly NOT a bug fix
> Please CC fuse-devel@lists.linux.dev for future fuse patches
>=20
>=20
> Not a fix, because this was very intentional.
> It is a new feature that you are proposing to support parallel
> passthrough dio.
>=20
> Anyway, this patch has many problems
>=20
>>=20
>=20
> You can't just use fuse_dio_lock() like this
> it plays nasty games with the iomode.
> It does not even check for O_DIRECT mode, so this would do
> parallel buffered write (at least until it meets the filesystem lock
> but its not something we would want.
> You should study this code better.
>=20
>> 	ret =3D backing_file_write_iter(backing_file, iter, iocb, =
iocb->ki_flags,
>> 				      &ctx);
>=20
> The problem is that while backing_file_write_iter() does not seem to
> directly require an exclusive lock (apart from maybe =
file_remove_privs)
> the fuse_passthrough_end_write() callback does I think rely on this
> exclusive lock.
>=20
> So proving that this can work will require more research and more =
effort
> and I am not really sure how that is going to work out.
>=20
> Thanks,
> Amir.

