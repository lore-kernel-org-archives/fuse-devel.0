Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CF2361670
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 20:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320418; cv=pass; b=ZNZc7wA8PSvuZOdVx0O1MiS5i5gRXsIvUNoH6i3iQOYoqPyIMm8/MchUHIIDNBSnR6uYcRG+1LYHG4HaOcxYxyeFDM/xLmv+e7JpvE+MW02LfV70xpa/ZQl7isAQFM7UtrJOW8gq1mGLD01825ZchCchdBOkMNo6iK/DSSDqwxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320418; c=relaxed/simple;
	bh=uRMV94/3PmL4MXdN86JZitFJ1jRWdi2MyDPEdU1Y+do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5am2uZLspmCNYa7t2uDLQsQ5iz53c+I1D/70Oc3VRZGczF1UQmDQ+l8eNkte7A9GGtXvNeF73Zp7xuKNmrdbeYzlW+lvgcvAFxYbbvUZ6Ot3pgZNC26+q5OiDRLrc4uDW7nR29YFaFLcWkpnzOA6bNQPMBd9qW6l2G6A7zcOwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMU5/S/z; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMU5/S/z"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-474560436c3so3590685f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 13:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784320415; cv=none;
        d=google.com; s=arc-20260327;
        b=TOawPJa1EYXBKUOw6bQI29ByApwzKgRIqAqxqFuqGfvEeAzHnuatXKkP4vmTswHcNj
         cYAINfKjDGan/5JlAzJOBtJSaULOjLtjK3sLQO+Nt8iiNFZlQ1MmfsDG5vvKtlD6m6Md
         4MSwOoeAAWp/nqpPhy+SzjsubVBd1DRxrr9jObkhGJMYJKye2xbsbVt9kmxvogRFc3Ce
         e3dcKaDKGGGjNHZ32OmeN/V13Lj4wxLSzqjOPHz/KdVziP9Ie65/J5I0AIAd6MSO8V+Q
         xZOtzD8AC9y2EsIM+BDht/haS92lUVf5Ff5FtRZniy2pwPCzRaE9C2JerUH/+8lZ77S2
         WqSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yj3qRQkkpUk8cdC5x77h/0l80YrpnGv6PMimrjdTmjs=;
        fh=5UoxiFBeLXKJpDsz+x+N6IOAeTdYrwYROmxmnOROOXg=;
        b=rDCPjDyV5pvKjB73svEZ90JXoIb+O1NVxkUtGM6uMBsKBomCgg6ygUMaOY1CdyHvki
         oSlUmd2ooJrNdSDJIbCQObqBLd8duP2Y0Lug3cioVu2mbD15BQv+LxvwQAin1bZmdam1
         2OzkiWNTMlAv5HixMkoTMxKpls31tVQO2eVda25lMFqUYh5sttdMJBTYEqpd4GmKtv1G
         iFJZT6cp0XGGOkTLgYCZKSO4qR0IgOzxdRK8PfOw7LnN8mC1Jm+e52zQA9DXb0gSVBnD
         DjV8QxRErmD6Ek36cqi+N26yW9BcH1YdlcjeUGwijn6/AcyOemkwmOO4sn7hqU8z5D/g
         dJLA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784320415; x=1784925215; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yj3qRQkkpUk8cdC5x77h/0l80YrpnGv6PMimrjdTmjs=;
        b=cMU5/S/z6n9C/DZPnMWgRE9VSrrXbbTA7spAZ95ws+8gLczSTpMPUyeXId1v/7Z6ye
         3xPrNNHEr0vNEZNWS4tHni1dSMf03NJ/miihSJ14fgRwGGTGSz0HB5ThU3xNfewemzyP
         8kjB+s6jEERpup2FiPyebdG9O/SfJbMrV7fEs4lUKRrYFkdfX693lVpeJmSgwz0uUxUY
         VJ9r5qXU6GNC7ox87T7YZfvriuKJJ2audGxFta9m97IEfg3Yzbk4pSkeXWF0x0i7LJj8
         0z5P4lgIGBkwTbbiGo2dSCdt6uTmsi1bpqlA8p+gOVjLTccL6w7TqLfLqu91b26LoYK9
         jiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320415; x=1784925215;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yj3qRQkkpUk8cdC5x77h/0l80YrpnGv6PMimrjdTmjs=;
        b=htyFgGcOcqb95pBXei5advHPWvIIs8Fp5Doj4ey1KDHSoKweb9FK+4eGVYT8Nwazn/
         F3tXKngGYW4J6pk1eTBZEu8xO3Xt9LgP0GM3S8B+zBQuIlnAl2VUjVRcD+vnF4vWkYP4
         cqzUmBgJ9+VF6amN1oOKs9kJiJtY4NtlKsxDBlH241DF5SSJtZp7GZ70ZT3UqKu+AKHd
         jImT1/yvjA8jvNgIqqXXirBxC8srODH5bfqan+VLBd53DjelXDJi/lKaynQb5kAbn7ZW
         p+p3k8S7EDLJHBFZBhn6QVrccWC6XZeA7EJ6AWmFAgZ/v+e8uMpRtkNSwxkvvnYY60l2
         m7vA==
X-Forwarded-Encrypted: i=1; AHgh+RoWpmojbrHtc1PHBgupvsPFuRg840sPZwZLNMn8OTDm9dqwQtc3X43mo1AOmRJ8m0v29KyKnEthQyub@lists.linux.dev
X-Gm-Message-State: AOJu0YxIslOEdgIaK5BV6BnWwqp/q5/RngC12fdoISNbq05DF/BDSd5N
	8ne4nA8GvAKV4y8In/S0LMOOZpaxKpgK2kGtYIv6ENsqVhrNGvThg4GDwPp2njnd7KEOQI/ho9I
	r6NNy2z95nHJaw3hLuUs6VkeOadvjr9OG4Gd2
X-Gm-Gg: AfdE7cnhycbVJfup1wyKHcyF4g2nm9PaW4x6nT5OG/bx6bzGIawQK9Hi/TTXQlVmZgR
	mQwK4yTqwehjYrCVf6psoHo+KLUUc+XF9uQjCYEnCTPUiEO0jJIws25ZCYoAKiJ0vTnzIh1bcHI
	aMIk4fTUAv1iPu6XiQ6sh41tf89JVn4plgVO42d+9Y+yXx2lt8v0IMX+4TvDjfe4RRgbdG7mZ2w
	0bNwIXKlwxQpHOp57Ic2quuORuetVbsiVMO3ce7Uuy7ImA1RcB367+A/YwhJ7hbYGErSGpheJ/y
	4MzERpTLNjs5iCCK83b/TkMUt2MSwtm/92k2Eltd1g==
X-Received: by 2002:a05:6000:4284:b0:473:f4c3:4d51 with SMTP id
 ffacd0b85a97d-47f623226aemr5074789f8f.43.1784320414976; Fri, 17 Jul 2026
 13:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJnrk1ZDc=f1XvRU6j6WsqiSAy75wd1-X2fNRhcK3j-OGDkqcw@mail.gmail.com>
 <20260717032835.922433-1-lihaofeng@kylinos.cn> <CAJfpegv=akLW1qzq=B=F11Qfx5Gg8qoRiV4Z-pty-0Og+sU4GQ@mail.gmail.com>
 <aln_xvOTDN_xIHFD@fedora.fritz.box>
In-Reply-To: <aln_xvOTDN_xIHFD@fedora.fritz.box>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 17 Jul 2026 13:33:23 -0700
X-Gm-Features: AUfX_mzOyVzO5cO2_m0t31ZUL9XLaNyCChwgkEeWlkGqVy5ddmVQ2maTXHeayKs
Message-ID: <CAJnrk1bDnAf5NMkjiAPB6OJFwPuR=rKo4T0nTqe17M9o1X7Ytg@mail.gmail.com>
Subject: Re: Re: [PATCH v2] fuse: honor desc offset in readahead reads
To: Horst Birthelmer <horst@birthelmer.de>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Haofeng Li <lihaofeng@kylinos.cn>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, djwong@kernel.org, brauner@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 3:17=E2=80=AFAM Horst Birthelmer <horst@birthelmer.=
de> wrote:
>
> On Fri, Jul 17, 2026 at 10:56:20AM +0200, Miklos Szeredi wrote:
> > On Fri, 17 Jul 2026 at 05:28, Haofeng Li <lihaofeng@kylinos.cn> wrote:
> > >
> > > fuse_handle_readahead records non-zero descs[].offset when
> > > iomap skips leading uptodate blocks in a folio, but
> > > fuse_send_readpages built FUSE_READ from folio_pos() alone.
> > > The reply was still copied at descs[0].offset, so wrong
> > > file data was placed into the page cache.
> > >
> > > Add descs[0].offset to the request position. Apply the
> > > same correction in fuse_short_read for EOF size updates.
> > >
> > > Fixes: 4ea907108a5c ("fuse: use iomap for readahead")
> > > Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> > > Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> >
> > Sashiko founds some more cases:
> > https://sashiko.dev/#/patchset/20260717032835.922433-1-lihaofeng%40kyli=
nos.cn
> >
> > This is a large folio issue, right?  I do wonder why fsx-linux missed

What is fsx-linux?

> > these with the large folios enabled.
>
> I think it probably never occured since fuse_readahead() only fills in fo=
lio boundaries?
> This could be coincidence or readahead controls 'job'. I'm not that famil=
iar with that code.
>
> I just got suspicious on your question, since I have large folios enabled=
 in testing, too, and
> have not seen the case.
>

Looking more at this, I don't think this problem is actually
reachable. Haofeng, can you describe how you hit this issue?

This situation is only reached if there are prior uptodate blocks in
the folio. But looking at the filemap_get_pages() code in
mm/filemap.c, readahead is only called when handling first time reads
or speculatively prefetching new folios. afaict, there's no situation
where readahead gets called on a folio already in the page cache.

Thanks,
Joanne
