Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E1345731
	for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781094985; cv=pass; b=gxuKlpR6g1/OoVJb4tSq7p1faYm2B/THmsjAyqMdRHmkZ8FvTuiqmU8SZSVb2MpaC/0J2s4KI0GtfvlWhp2ObLe88anZBBZbiC4bjXeOHht7hDW8QN9rDUkHusFF3Vics32RVPI0PDwpSrNlodpi2inFCoMaQ9zZ07V6ovBbrcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781094985; c=relaxed/simple;
	bh=eYQTgSAJIduxJqr8HQKf0jhSy5kJGeilzn+gDMaPZJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tc9aSkUmVXEbyncUQUReUcGXoa8OH7dmVvMpqioKXahrN0OnWYh+4Wyrrr3Wsl1xEHd4g2MlZDYBI0DS/bcLqnxw/0IphYJA1d/3ac6G+2Uu9tplAa62FQWaDouH/EGhtYLaFssi4wouSdLswqyQZrZ60Oz7za010nPaZIro2nQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=H+o7b0zo; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="H+o7b0zo"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51790c0a692so69379761cf.2
        for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 05:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781094983; cv=none;
        d=google.com; s=arc-20240605;
        b=IQBnHZh7xErk0f5Qk1ls7YBgXnUlM/2dPFGl0Qw0b46IwTjdIL1PziHcon1AY1bCay
         mS/5tmlocHnBvvk1buu7YEee1QqT8CavU7khY5tMstn/oSbwrevSVY42cNApK5e0cRV/
         xeIRwtMrYntLvKMEdc0/uuxwgfQK9i9PmLwqPWSbONQ2iQjQRroKVtsk/BJbfq8tXH2U
         pzfi+yNQv93jdOS1eDkz1Y0hF6jVl1/fIDp1po7APYbotzqkNKJjczlAC0X/j5HN/41N
         6XgpJVMRzCB57tZ2NQ9HEqboL2cc/lYEE3NmuSsr5q3LsaP/8qA2WF1jV5jl6TIZahKJ
         h+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eYQTgSAJIduxJqr8HQKf0jhSy5kJGeilzn+gDMaPZJ4=;
        fh=Vrxw1m0LB93Zl2k9dpZrCCXPoZF01mC0swIfYv2fzEM=;
        b=PzMGjEO4nKFUrAyRLJDPPsKLl0wDFWkJV1/kdoedpRs66sCOsiZbVi/+6F42EDmmLl
         dkfAxgLbzZbAxqEXadWOeVvSc8LqfRw6kFyel7Ini98K18KJKtbn9B0CAquKHQUN47bQ
         Vdm+JVTnjL7entWPlx59GxAcm61WqhB6/6LVlSMy67RHAol2nbgo/32dv6auWVuUdHFr
         07qZ+lndnNhp+u+zu0KoXnWP0nZIVGlmES3d1gjj8rgL/XJzNAedVfjqONE42sWcFUS0
         le24mmy4Fq4PdE7a2cE5r1cHtyflX7sNuYuvPRmxyCZANhT9sZ/9EiVIguhDiEeIc8Cx
         FZaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781094983; x=1781699783; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eYQTgSAJIduxJqr8HQKf0jhSy5kJGeilzn+gDMaPZJ4=;
        b=H+o7b0zodyu/SdkF4HoHsc/M0Vg3fEz6D2vYQuwfKrHuIiTOxGHbmMRr+d4vmcxOZn
         Wo483VCBQ7P7wTjqvpNY+rY0wmBlCpr4fxGdPoqg6INArElXD/s/Fd3LPEzAZO0k1lXz
         zkDuvWW+pibGeU8Py1FrfMFwOmMaYWCM3c5II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781094983; x=1781699783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYQTgSAJIduxJqr8HQKf0jhSy5kJGeilzn+gDMaPZJ4=;
        b=CVss9bOVB3iSOU3vgXtNBZvmei2UoFV6lv65K3SM9Zkux0p8rp6oWDpflv7KtKf6ey
         +9OIFrPGd7EkxdisQzPFJJs3t5eJZ7Xaus3Me03aF+W2Yjhy4qRD2blox4bELTMmxlNO
         F4H2QkK9sJoMkfaNINnWiKSEdTA/wDrZAHmRnLnC7cPHeSRUWNGgvufzENhIHDt34Bfy
         Bpq7FhPI3t60eiYft8ugONbSvl0CNPDAoTzx/9/TRNzFMCVLbwHPvEBFXEh1niMYZIii
         D7AK+K5SrF2WFNA3Qk9Z+UIuRmXcWg5IgxxAtRMaMizmNHqdBdYdgo8sTqQCe2TN+kFq
         v87Q==
X-Forwarded-Encrypted: i=1; AFNElJ9W5AtQTBjh6YXQM/hOEBYmLJH77zUqH75I12KhXAE6h+v/k4QuCDXvjvvRHNQy89OHH2+LEt2CeZp1@lists.linux.dev
X-Gm-Message-State: AOJu0YzKeobdbE06p+XbCUILb9rxRHaLwl6PI6TEshtcr0SWqbiKkR3R
	/yl3A3AzeFVyOnO8sEEn6lNVN1RTBc43uh0hidfsHUBWfviDfU/LVzyuV4EO01v/pEVkhmUzbap
	F1hxdNNVQUo81HcC5n+m5YCzh0bPXtGGVr3n1y45bCg==
X-Gm-Gg: Acq92OHA1sr1kC8bQp5fPwVfJBBM/sgyRjmHAOW18BwKnzALj1lZoBgx+Gq+8f3PCFf
	GgyZsAG0s6eXs+n1NbHgvr+bn6CxoKxM1IlHlv27RfWxYq1lB3qObpinkqGzl9kxIP9714yeYnq
	hyqAzQr0K9UvkVT0x49olt+4E3Od23gberY1w0K3kAjuXQrYILxnZnZrz97k+ExLqr3HxAEgCFW
	ev2n9thvMBVyeh824VRs3kjZ2C70GKFBaQfo5N7omuli4TFlrFIX+9mMuH1RbYDgOjDKgbIVbms
	/ullXUw4QOkv6+b02RyZubSJ4pOf39qO32Gs16NP8UeJ2oYzpmU=
X-Received: by 2002:ac8:7e88:0:b0:50e:601a:2183 with SMTP id
 d75a77b69052e-51795b4ede1mr378685771cf.41.1781094983096; Wed, 10 Jun 2026
 05:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522065421.385129-1-liwang@kylinos.cn>
In-Reply-To: <20260522065421.385129-1-liwang@kylinos.cn>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 10 Jun 2026 14:36:12 +0200
X-Gm-Features: AVVi8CfQmsnN2yd2RJlQhQmmjx97VvqHUoLywSCRtX0NSUXPIjK8NUwTawS4j8k
Message-ID: <CAJfpegto2-86wyVVYB2iRz4ftG3R-5Do1kgg7CfHF-oxZu6=Fw@mail.gmail.com>
Subject: Re: [PATCH] fuse: drop redundant initializer in process_init_limits()
To: Li Wang <liwang@kylinos.cn>
Cc: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	Amir Goldstein <amir73il@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 May 2026 at 08:55, Li Wang <liwang@kylinos.cn> wrote:
>
> The local max_background variable was declared with a duplicated
> assignment (max_background = max_background = arg->max_background).
> Remove the redundant assignment.
>
> Signed-off-by: Li Wang <liwang@kylinos.cn>

Folded into original patch in for-next.

Thanks,
Miklos
