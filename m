Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F213C43BDBC
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043215; cv=pass; b=t33n3HdfW30xkkHTUnwQTMN6hBPNYN3Nd2M7Y+oq3G4deI+7lbj6UeblM0sp6bcNpFWkNL2gR5EYxbjDzRstPiw3aWWKou6v/85keUO9m/luPwSQrfQ4ACHSeIGhNqrSPsCYNRzNNu2KD9uWUheKPl5evoQmRYXzM/wXDXRfTvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043215; c=relaxed/simple;
	bh=z7P5vLy1Liag+O5I4QhdCGs4G86xHcF/8g1tn6clRQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QW5ffHFO/ASPoRHV8TMFK4rzv4Elfv3sbH6pp5bJe7NLZbtucdUdWo8gqkGb8dnx/X2Ts8Jt+CnA8dBh/EEEn6pVXyUHAFsqYbX7Rg1lNxtWbet9o5TxaXgFTgRXaoVtUb/EnMe4H3A+ttuZYUhAhD0XQuyHf0S2rKQKU/W8ZKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=QSZpjr0v; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="QSZpjr0v"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92e65e18969so67970185a.1
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 01:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787043213; cv=none;
        d=google.com; s=arc-20260327;
        b=YJglt+A63Nnvc5plAVJinodkGGFVdMNR+AVcZyqNZpA2QONfV6FpUa/IigOVaSSNNq
         kB4+TzFnAeQy73tzTJPwH/igKa1qLnlX1U90LrjZb82KLFvS18BZiwdh9UF3DSoNmx/a
         bb2oOcT1kwj5QoWfD2u+SbfZpfFciUnX2Qag4Ipd78Rsk2aj8BYe1BpjpcPzR1/2ij80
         nV4dZXA/41KQTKxkAiLcq3X+RTcOTDfxu/sTLEgUT6gE6ojJ5Bii3XFoyfqPPrr5MMqp
         iVPY9IzHdWiprYZEN1gAzu3bIhZ0IFrwHDT+FrBwOBigcgDqH451eFnk0NpkGxfeJ72C
         RiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5iE91qVvMMZV/GIldl06qFPZLmj5uC43TcjmhLUpYHY=;
        fh=VmofVl0u9vih9bQxmL88cA7rHGQx6rPDmlrrsijJodI=;
        b=nvWulhfREiWT+stIz+IQSQuOPsgGjef37QoCh/T5Jip6afdRznAqXtz2GxySqhWpN5
         QQxVLfD3fnDzbbKQ4fXWag872MD5oWKv8JEQ19XfWfligLiBnoJUD6KJ/5gINwEBejwI
         8oPVkLNb6pF6+9SkYAzHkvuxP4HQNg4/yQXNbK2Dfmc2tYVzHF6axk36je7f6CzCzPbK
         USdUN1Omix0UuP9iXpc1BJ0HUtoEFxbpWodBW8ihUuboJSUaOx3eqyXlRkHrADu0+BR/
         O0v9a0rjkPhDmM6aC2Ozf2Sh4J5yP3/vuzQrojTcpY4a8k+l/dGMTKAKhj+//XJj4a4e
         HU3g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787043213; x=1787648013; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5iE91qVvMMZV/GIldl06qFPZLmj5uC43TcjmhLUpYHY=;
        b=QSZpjr0vHmFuSNyBE/RGXN6+/r1dzjTk7ipQl8HXyNJ4LyjjW0M/iiZzDLTnX24LPK
         Unr93Z0ky6HONi0yiSrv2mRA5kwHuWTAhLyTRcTo+O4qoetCO0+Qo0PE2dy3W3ZZPyOJ
         22xi/ZDlrTl5jRModLBR6CHi0oD4cnqOQkNas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043213; x=1787648013;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5iE91qVvMMZV/GIldl06qFPZLmj5uC43TcjmhLUpYHY=;
        b=tTXwqvLj6LJ2PcvnJEikXVI+UCJsAICPrEAEi80jxjw8RuGbDhBcAiBzBc1CsMxeOz
         wSugh8fBq3xR73v3e9Z79+W2KivZI5vUUMOpUMhKRGBPnw4cm48+iL+Pta+6EPURN0dX
         QYfzvEIeNTJx28WYXceIwVDpyUhS76vfmkgpuJMo/epZNADYp229HkD8hsBqzsXvibt4
         BomDkhKl2ToLGdaOyVL5HiMcOx3zAqKyrN7ssZcU0v0ntBcp6Dh8qqUISD+T+7Uk/P6J
         tR4TeG+I3jR8c2L1r7PcC5V7uEpWCpNPYw6evPfzCNeD6zMpNlvL7u3PlyMPCidwsnqw
         Ugzw==
X-Gm-Message-State: AOJu0YxSYLDrBmwvF3gxPXpdJJoNwOw51ko/MjM4QkA/pb5Nj2RSbUqJ
	SKx3uBm0uiHzASa9Ra4q1fOtKGjsgcrcWZiyEvSv5rBfIR+oMSiAQFr6x6tzNjH/G8ArzQ+H10c
	pswaj94paGsKDV0ebNxdkdldTgX9jl/eFH5meZluhDA==
X-Gm-Gg: AR+sD10B4xOp2nqw1TzsDlYD9fQaAG/xY+S8tl7BVDh+/EoTauUv9ArXszhQ8tVc9zy
	Qrsjcn9FsXclKEDgImpYyGu/zuzgIi23yJOL8xHq2x1ZKUqP2DFw7BjWCcO38cN3zfDlq2S9zho
	7pm8AcnwUcA2UNeKkQ0e+rmHFW6eKnxGL7BNI2/TbXxgKwaYi0LBXXsOErmJUNRWd6UTfDUySxm
	yyPQzbK8ny43AzaRigBaUt2zb3hkDrHLEvSxKZmdogdU5iLNTLi18uPljF8YJ5PdIq0PFu2iShH
	zJnJ9KcZt0hJZ+q+IB0qJLhZ1iBEQC87o7ogv9f3aQC82x7oMv88ZRJ4Nh4dy84QRACTsaaP3LB
	fcl+ia4gSGbQ=
X-Received: by 2002:a05:620a:4090:b0:934:a1e4:cfee with SMTP id
 af79cd13be357-937065c97admr462098485a.11.1787043212794; Tue, 18 Aug 2026
 01:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813070629.248821-1-A.Nasrolahi01@gmail.com>
In-Reply-To: <20260813070629.248821-1-A.Nasrolahi01@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Aug 2026 10:53:19 +0200
X-Gm-Features: AcwNN1VskD9LXMveDm1cUISVfVjK38mRUPy7sTcpngIiTjW7SJ9jpzy_YobM23g
Message-ID: <CAJfpegv19MoYVsvGP4S4k1n5u5u=za3yNrY4Z7wULHwLcPJ42g@mail.gmail.com>
Subject: Re: [PATCH] fuse: ioctl: fix comparison in fuse_setup_measure_verity()
To: Ali Nasrollahi <a.nasrolahi01@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Aug 2026 at 09:07, Ali Nasrollahi <a.nasrolahi01@gmail.com> wrote:
>
> Clang reports a warning in fuse_setup_measure_verity() in
> fs/fuse/ioctl.c when comparing the `__u16 digest_size` with SIZE_MAX
> minus the size of `struct fsverity_digest`:
>
>         warning: result of comparison of constant 18446744073709551611
>         with expression of type '__u16' (aka 'unsigned short') is always
>         false [-Wtautological-constant-out-of-range-compare]

The warning is right: that condition is never going to succeed.  So
just remove it?

Thanks,
Miklos
