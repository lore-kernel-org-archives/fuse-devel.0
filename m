Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A94C3314B9
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664212; cv=pass; b=oGzH9nJZCSHwS/ioj4ia26G9TjN5OxHt/yHh4NuJMfSXVy2UECcCDLkwCDiwshHECvOtBX1FV97Vmm08ImN1rUE3JwzRQ42PEoXPpnPziXOn6hXHUqXaxP9XXxIPK70YUHeNQzXfNhl2rXHqtPGK9G6W/VNKFxGKduckfGTmx/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664212; c=relaxed/simple;
	bh=rsXLmPn0bzqQ+E3dJfcvgQPBjvd6GQoy+sI3S2Aixnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgWkcS8JUlTdi10U6wSoO4zN2vKx4NGD/A+/36LCGN/wV15oVscE7fo0CxGpYkaGgO6HdPhO/ZW1D5T6sENwJUFN+zYCfuHpAcAPZZQE202seg+Y5JKzS1UGa2D+06W2tJUnq5YXwAKwR3FjiojXNd1qc0zkhVZrqameAJTxN7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=H6bwU9q6; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="H6bwU9q6"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5174a3d9598so16928961cf.3
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 05:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780664210; cv=none;
        d=google.com; s=arc-20240605;
        b=KU5WhQLHgPY2hfNvfMIVoNLPTYWo9KdLCDNdNFtixsw5ctTh6ud8H9Bz6SorksyK6T
         ExBYRmJeDIglqM5JVrvG5p/KTKYZPjnVu4LjUG+WVlq9uBuTpf5X3pAKLoL7jLYQF+2h
         ivZwxL9kEPqkgEzj8LzS1I3IYz9jTHZ6JG/849fzlvycBllgNMMLXzXIcSQzOR51fTzn
         VbK9I4Z6v5Ye8Zk9vy5T42LK6ojyG3ZYiTKwjxboF089oAwzBGSIdVguWV/QGWH+UHT1
         7sId4hFrhgcHLmX6bWjKmIsL/SM4Y1BLLPF5mCfBTz0NBCuTP1oRIbkMtkKiNF8N8825
         n7Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rsXLmPn0bzqQ+E3dJfcvgQPBjvd6GQoy+sI3S2Aixnw=;
        fh=tNDEahxcYkKXc2HG938dknnJgaoMvcFuM4PHq3PNWbI=;
        b=UgkdeJGAf1JJfHXAmmguG/Sbnw7SZraQy3EPznSo9Dtc38ygFHRFd3WVBEdwisHXPK
         wzfYTCRxx8FMZB5fYQhQT5gMVSYHlRMbWyLTpf4coePWkegpuaK/Q4BKtUMVQdHtkqmE
         B/cSokg6zsPUWOHvT7JXIB6AaMYgiBbn+QzVXfFFCJ2lZo9nIT7RKM4hc9IbsCbpRQrE
         dSKUEySD3ND57XWJF7Tzihzir6JVtcyT03ffkAwnV69Y3zGPhMQUCA3ERR0eTlCPCypX
         u8cqh4cMkZS6T9J9cMGDv1Rvak8LL+qzmo/l8r4u0NRHR5Vm/lw0TOQNVhIBWYBmQC0h
         W0PA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780664210; x=1781269010; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsXLmPn0bzqQ+E3dJfcvgQPBjvd6GQoy+sI3S2Aixnw=;
        b=H6bwU9q6WbiITu/0YdBT5PE9TG64xR/WDRlQDuhTPJSObgiMPjp+6ugmFkZ9EKv9ms
         HXRnGLTjQW3WSBwvum/sjIxIDl9DR2w7TQepKmPZUM+6OO48c9CU/8Z/6ESfFsV3E76R
         ZMk4062NKhnMQZlwc6qdDFaQlR1SWjLXQLOCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780664210; x=1781269010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rsXLmPn0bzqQ+E3dJfcvgQPBjvd6GQoy+sI3S2Aixnw=;
        b=mPRyF98D+6O6HJK2Dq8SKSOau+b0jgMPkK1JG0gTRXKmWzNJZZhqfLzz2yuTb+uKF9
         bWpUvCtW0kiM3qeNlkghlfuwE22xX+leqXck0pI0EfA7HQvnYITOyyl4QbaFdmpoNVDn
         o8p+IrVVAPZIARs2m408Q4zHNhRjZvlJtvhtspipVF2eSGBfY+x4DH6G9j9s2iXlerQP
         CdiX2zwFo5FlX2lcNLyFPjGMuNkFSdIcWu4z3MmFf6fpKuCvriQpS6DsOCogiHsRXnPJ
         wBwrj1VpDWPkaSsuWtB4ZQoJAHPSLCf9t4HtP3PT5ZrRW2s5pHwaeMerrM2Y9sbi1hpR
         RsOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HXnvnAHNOd2/pVI0RvBZAe+tvC9OhpIJnN3KCnpgg463/tnxwt8paLM7FPeAl1luLfTjGLzUS4W5V@lists.linux.dev
X-Gm-Message-State: AOJu0YzNbCN6A0rsPH4fxHqbTHnyNh7UFjpCTPzf/oPT+TL8eAXjxMeM
	ydPNv08InfKJe0tT59T4bKvR2OSe2irkmZXay4E3lcO9ilh9vCAK5gvIdX/nZdVJ4FCjjNZalfs
	vUrlgIAH5mQEKb18/422Xbva//kmF/gBz8JPTw1eRWg==
X-Gm-Gg: Acq92OEGg8pt2HbiH40LPjGoaqse74C7BQo4QARNxC670ziwvPcvhYEJ/mETcpgSlHa
	wOe2/8qxhqujUqFX5tSIhN4lO30+9Ng7Lfatl+E/tK1nRn5JOBgB81R0iq3TIjOVzB7ysPtEPkb
	r/cyIJEDb/SVIgebp8+CuDygC/8ciSlueCNc1UtzO/yPrKHEWqCa3LrpCNYADiZ6pKOXCCyreBV
	21SlOTgKcdGOcb7btlJrnfnilJeUWStGmvesb7e3bJryKxIelUI893aundwc76AMRT+3wEhi8t0
	jbFqr7pJpD9gWxLWWNCvcj1b3Xr5S50FnmPyVS/8aEOYxew=
X-Received: by 2002:a05:622a:620a:b0:517:7406:ccf7 with SMTP id
 d75a77b69052e-51795b6864bmr45976731cf.49.1780664210438; Fri, 05 Jun 2026
 05:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601152327.2069787-1-mszeredi@redhat.com> <CAOQ4uxjFg4rjwGjU2LvZT6AhC+gBk_6Ej5S4p4DKuk8=a71cRw@mail.gmail.com>
 <CAJfpegt5Q0nmK0JKAfa4Bp_SydR1qiqu7pB0JKkXSCFOYSVDDA@mail.gmail.com>
 <CAOQ4uxgc_pW57_xeHjm6xauB3Cfx3ZY3Y-NaXO_xvL==vKcFOQ@mail.gmail.com>
 <CAJfpegsiA9A8tc0w4JdQ52k2qMr9UrYFF3PRsxRTd1PAfhf4Wg@mail.gmail.com> <CAOQ4uxgQUvpp816ZNX5YZXm9pAzn5DyAwxX4npTfis=0FZOLKA@mail.gmail.com>
In-Reply-To: <CAOQ4uxgQUvpp816ZNX5YZXm9pAzn5DyAwxX4npTfis=0FZOLKA@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 5 Jun 2026 14:56:39 +0200
X-Gm-Features: AVHnY4JSw5QR_037DA-qDPTE8i1Jc4sk6y-PRRmXUo5gdeoS3PcX002rjYw2wFE
Message-ID: <CAJfpegve9GMTRwvoA5y7AzUSD4e_EDJFzsqhCVN8xQ+RjQ=+Sw@mail.gmail.com>
Subject: Re: [PATCH] famfs: FUSE_FAMFS_EXT_INTERLEAVE -> FUSE_DEV_IOC_STRIPE_OPEN
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, John Groves <jgroves@micron.com>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Jun 2026 at 11:06, Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Thu, Jun 4, 2026 at 4:09=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:

> > Or make backing ID 64 bit (same as node ID, can cast from/to pointer)
> > and ops_mask be part of flags?
>
> Feels wrong to mix them. I would rather extend fuse_backing_map for
> ops_mask in that case.

Both work.

> But note that if we support 64bit ids, we could not use the idr map

Idr map wasn't the best fit anyway, since it works best for dense
maps, but a 2^32 cyclic allocation could end up with a very sparse
one.

A hash map would be much better.

> and fuse_open_out and FUSE_DEV_IOC_BACKING_CLOSE
> would be incompatible with this id, so do we really need this widening?

Argh...

>
> I agree that it would have been useful to map a backing file directly to
> an inode on lookup, without having to go through a backing_id mapping,
> sort of a compound LOOKUP+STATX+GET_BACKING
> but there is this security risk of writing an fd using write() syscall.
>
> This risk is not relevant in io_uring AFAIK, so with io_uring we could
> map backing files without a temp id unless the same backing file needs
> to be shared among different inodes or referenced from backing stripes.

Yeah, we could allow using fd in place of a backing id in io_uring.

Someone was complaining about extra syscall overhead with the current
scheme, so it's probably a good idea.

> Anyway, if you think we should reserve the place for 64bit id just for
> extendability I have no problems with that.

I think we should bite the bullet now instead of having to modify the
interface yet again sometime in the future.

Thanks,
Miklos
