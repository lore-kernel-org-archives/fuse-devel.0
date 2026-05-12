Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F1749250D
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 09:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579586; cv=pass; b=FxgPrKgw4iSmn/Lu/25XAvY/MNIVaIH+O+27lhoRAwiC9w9c9vpYrGRa5xAtkPUxsjZvde13yAEYZu3u79UdVHPxub5cXEuvXR6FLBM+8T7vU/0+WTLhjPnY9RQiZzp6ejutbX01CsU7a8BaPMfCLjc3o6l+yH6OR9O069FKF6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579586; c=relaxed/simple;
	bh=BopkGP6sR0jaJSDk33EwB++6pzeuw4tOdMU/tnlaGSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kiIlJPrMZpstRBy8ZsgX1X8hlAdW32HJL4wyYqFwPCdwc64PEs7krJtazpCM2AmLFYLwVxDEjXZpHMEivnqg6qFN+j1EoTdiVG/vFP9gFDdW6ogSxaz6ehfP3b17OHXvCG4QYNVzEV209zQnW9kJP59mvaxgWIn06cot9aQZqMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=HhocF0TA; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="HhocF0TA"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-899d6b7b073so51306756d6.2
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 02:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778579584; cv=none;
        d=google.com; s=arc-20240605;
        b=CYMcmFBgvOi14MoviM/i1+fOBGkw6ySrJza7CfFrbgzgcdzC0i5pU2ubT+sIwwEo/J
         wO7BBRy9S9VHn4dk1qhLjPhsoO3ii0T/jUTIVpG0clgV4pQ12Xw3IHeo/0wO1OLY+HB6
         eTsJG4vk+VSjSD9Sjp3rtZjvUH3jQ8ujcjvEvPaZSnDhFbcHF/B8fvR6tV6UHRPTBYyX
         aoaUs9E2zTL6S3Z+HcWqQxj3CV4DYaktiJv1/YJC9opNoMrA0Lzsfl6wrgPsok+v9zqg
         W+Z+H9TS6CYoibqUQWJrxYPp15X5IwXdgseYLPoJaJnyN9r3/TD1jhz4Tg2bK4768Hwt
         2l8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gyI430ATZEUVsPLqfTNBmTzX/MQNs93/RaGxRDZTt6c=;
        fh=vr2Bwfl1ucAaJx8s8K/F+4x5ajqOC3MKJ7UXa4A+wsw=;
        b=lN+b3dVnFCA/KG+bxUEAAvleTNjvQ+PjGuJMGHKJqCaTQn+tsV22uQ4hkWV8U4OpwP
         3mPreUZevx3WEzxyLszQ4LqJ7YvG3qb3I18gpvRUjMzmKatLxR5XH4Wm/kpvnV3QGUVv
         KAiMJ7rY0TEXM/qeuMFsAV9+qKRsA8zT8wu9XlMV+JUQ9hi+XqO9bRF6xDotG1+dC4gY
         Ipa/0Jj14Id+1SAwgryxRpZnffp4gnygNZ2Ls3iTyx6Q6pQJXI9hNsiczQLV2MKRlTvk
         pfWlvsKoylJgs+PvqYwWTtOGSWH5PM6Hbtk/hPI5OrWQm589zb3x9OH7FV/ohNf9KgEq
         3N1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1778579584; x=1779184384; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gyI430ATZEUVsPLqfTNBmTzX/MQNs93/RaGxRDZTt6c=;
        b=HhocF0TAc3+bgeDjFdGHwQm+xuQCI6WmH7V8N1QGVEC68scUQ34itqpBhWi/SorYHG
         li4cPdm+6EtKbiYaYyIcVT4k6UBu1p0FpnzfNRXWOwqKzg+3xPgs14+xafgkp/IWgwDm
         tSoXMNmPU/cfNcC4YpJVPATuwEBQtctUyWcKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778579584; x=1779184384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyI430ATZEUVsPLqfTNBmTzX/MQNs93/RaGxRDZTt6c=;
        b=spUm1zmGEpO7FXpjiHZpUgNRSDMV7O9VvZVS8rrS0I1rIvmKywKInT39mSxD09d3d3
         fEl4joH60K6HkHQliemwiReIC6/aGrOzdZ9fBf5tecI1WkkWAXG4PFH5lfKOmVVomKuT
         aFKTCcupDiMFSbsrw/qAM9FPZaoI12Ke8TCreaC5e/tx7l4XpT9ixKWw3KEixhGge/ec
         TSXXOXJR9Y0fp/KQLVGpvOsT/dooSGwOBNNLQl+mLoGGANTcRXzYROXkMMj1YSpXdk9a
         Jm0XxHfWJ7aSSeal/RmwRz+dFABTcwIoTVnXOnQ35R+J3UOWn8WxNrfWUBlzQJXgg+RT
         DB4Q==
X-Gm-Message-State: AOJu0YwPV7dU2EFc2XOs3TeapaFi8CrrmbCqHQA9t2k3b0E2GHpoCx5U
	jKoEYWlbrLzXevZj3qO5K0XA+z98Z+nf945nuVErQzFIVclIYf0EI8OxVtDgyC1D7/5gbXg4B6B
	JwgjvpBL5IFl3oUN3uLes+0VX4OabHjCA4oxCi15qKg==
X-Gm-Gg: Acq92OGJbHchoMq9USL36O4vCcp2n5A7iYUUbVlbVcmtphfqn1tjMRkzvFBkbRwSoKD
	tkrJ9+Fh9OIg5ULx1qpyAu6t6YQAgmbhG1+x8ieStM23nx25hLSFEvgHeoAipBDRSw6tmVVhDxT
	el61j4HbcaaBaf7pZANqVuFaMgVV55OWPJae0Xlyb2m8uQg2CRBJLPYjpOrdpPhVzA0lf5BonxS
	Aj7j2vgCcdARSfrKsUq6OmYRiqPQWuS8Y8FIb6hVILYctev7SM09RXcz1HAxfE6MfeIKGTYZXtW
	OCpWU4YWrcao33UvFoyEJnB/RGAmQWYb9p4qPKQ=
X-Received: by 2002:a05:622a:a0c:b0:509:39b5:a97f with SMTP id
 d75a77b69052e-514d20ea85dmr29104771cf.29.1778579584613; Tue, 12 May 2026
 02:53:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJfpegvXnA1QpmfM9V+3VB470xYDNWH8FV0mBV1R1-HqvjfJ8A@mail.gmail.com>
 <CAOQ4uxhnOEkX4qnn0wHMCqWhEeAGTR9rxcw5u_oqGUovuszo0w@mail.gmail.com>
In-Reply-To: <CAOQ4uxhnOEkX4qnn0wHMCqWhEeAGTR9rxcw5u_oqGUovuszo0w@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 12 May 2026 11:52:53 +0200
X-Gm-Features: AVHnY4ImmLfRayTFq-7XJcPELnNu6qXF4ycVL2F7gsipXLlyh56_8XOIK6AZ1_k
Message-ID: <CAJfpegt=eWS_6ZfRsL_P79COKJKoLGNOsJ9g6TkrAhvhSbb7nw@mail.gmail.com>
Subject: Re: [post LSFMM summary] where is fuse going?
To: Amir Goldstein <amir73il@gmail.com>
Cc: fuse-devel <fuse-devel@lists.linux.dev>, linux-fsdevel@vger.kernel.org, 
	John Groves <John@groves.net>, Joanne Koong <joannelkoong@gmail.com>, 
	"Darrick J . Wong" <djwong@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, 
	Horst Birthelmer <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 19:18, Amir Goldstein <amir73il@gmail.com> wrote:

> IMO, FAMFS sits somewhere between PASSTHROUGH and IOMAP.
> The simple nature of the maps, the fact that famfs maps are const and
> queried at file open time makes me think that famfs is much closer to
> PASSTHROUGH than it is to IOMAP (in its full capacity).
>
> I think Joanne has mentioned that her customers have a use case for
> multi backing ids per passthrough file and I assume this would be a pretty
> simple map, so that sounds pretty darn close to famfs already.

TBH, I thought that fuse-iomap is just going to be a generalization of
the passthrough interface.  At this point it seems like it's trying to
do quite a bit more.

> If we are being honest, then we need to develop features that users need
> and if users need features, there are usually employers willing to pay for the
> feature development and maintenance, if we let employers know that this is
> what it takes to get their users what they need.

I fell that this is a "politically charged" topic.

Let's just say that maintainability is very important in big features
like this.  Even deep pocketed employers can go broke or change their
priorities, so we need code that can be understood by at least one
additional person with a different background.  I think that would be
a good enough guarantee that the code is not going to be a nightmare
to maintain.

Thanks,
Miklos
