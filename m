Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC13140BCBB
	for <fuse-devel@lists.linux.dev>; Tue,  9 Jun 2026 12:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006601; cv=pass; b=lq6UcbSXCtQ/QzzFXZCJBer3wN8ghLEEFPf8Fv75+72wGWRqpe5DnmaB0/jkFCh9L5GLc5//JAwIpTAxxj5sRLu/iBeem5JEsYqhZXjQCwrR6+UAYu/6r7n8AwDvOoVLG3KIwj9+6VUy3KK782IX14sGx9mBmTgR6wxuuFacErM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006601; c=relaxed/simple;
	bh=m2ENqrLTQ5IdEAuJSi+B8MWoSDZy87MKUAMX4zP2SZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nq0NJB/MZ+pWL61Qhu6YkWYQ2lkVRrgiEcbc5u7AHt2r3GuY0T4zFC0IOGH2PCiFHg5yXp3iyqw68KPUuG9tG1rSJUxE4O/T8d9F59rmt3vBMxGjzQ5ZIy7gXgcCitTowxq84K/HLBx8gFInjFbLda3c9uotFxrOYCoU4dTW7oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=YxCgUsKF; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="YxCgUsKF"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ce9ddeddefso59899466d6.0
        for <fuse-devel@lists.linux.dev>; Tue, 09 Jun 2026 05:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781006598; cv=none;
        d=google.com; s=arc-20240605;
        b=SJ82Eaq+IyUAGIehFXXfonRmDqg0NemC/VO1bnt6aAuFWcIfY3VaOzJrU3sMZkS4hk
         AF4NEWraWfPsBdYfUruX0uTIEPXzpQtyFLFisfcWceKa3eV88AYHGwP7vn2gw7Xb0gBZ
         sUEkIJC5iepeIZL++4bgowEdyWHUaYWrvadrcCQ9bYCPu1Rc03iBQRlwD+Z0JWLikqeN
         IK5XWoya3s+mzEELFreN8zjSYHAHdUMlJCOxXvkBfowp5+yQAjXcrS8On/TG9gxWjtsK
         jwV8GDSWToFQFEPE390nwTkI+oRPTIqCok/s4JLnLfbAqGiY80ylFd8pnGqsemZynaso
         lfiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0G322zLbmhzGcNTOTMN8kEKZVqBAftmzwAOfA9vNpvc=;
        fh=5HB6elpA6uPyfW7l1rIQRV2A/5bWPgcDwsrrJpvW87w=;
        b=NshmMWTIjk0Vn7vQhfgDp7oYhPlAeaWVa34j96xt2g6Yv35ThJLRbH6bt1krrMZXJR
         rLACr3HS65KmeT9JF5GS2xV7ZvoABYz0quG4eSkjO9yL3xeX5jGVh4Wtf6i9yFz+jovW
         QsHK0QwGrYDtpGGsJTEeb0qi5/u/rpWLt9D5zgrLOXlAM92stNgDAqeO63XW59iw058N
         CF3YINKXtwMNSsWJDDUPg8a2hCTH9OD0uJ2Beeih3ue3Mo13y6Hyk0JrKAArss32Fsqs
         9Mxcyx8oJGfke3mrc8CGe7qnn7/dSQBrsGnLNyS2Hk+kM80HDFtAhhjKrhF0F3HVwb/E
         r37w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781006598; x=1781611398; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0G322zLbmhzGcNTOTMN8kEKZVqBAftmzwAOfA9vNpvc=;
        b=YxCgUsKF9s6PL+gDRiapUbPw0hePRF4hySlP+QLJtwVj2tZB6VTMGdbC8zsoYpWkAI
         x2bgwbpGtIccFltIj1JiiZUHIAEBgmnhkq1rfgMQNYb1uS9+zElOTar5WW0zaxu0QLPv
         rlOJbtTErkuy5ZWDneevxg06ym0AuWa/+Jco4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781006598; x=1781611398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0G322zLbmhzGcNTOTMN8kEKZVqBAftmzwAOfA9vNpvc=;
        b=Whdzlks99TfSWJ0M7iBrcWMX4uMMX4EA6Ie/T8pD7qUSyEBVSbn/hhKXjqO+GGk23u
         QTK9z7ia/Anv9SiqmMQVXbiQaAasaB3jULY+5ybG+C3VBKGqFXZG91jh7pUT016CWuRo
         ISa6RLTSx47Gak+uYTgrR6JUWHcseQEvafuTRbV+hS/v7/vxj2NP1ir8s9ijYm4A6sx0
         oA9TkNeNhXY/57wL0gKQKZO9PfzZYGPZ421+0FBfwT6jALzsV6StFDyBNP/7J7EswXyU
         UqgmgEqBjyHCWjggpjqfS4ulIldwvWBfi0IkY60OQvqmQYv8ZpcW1+XGTYT7Cm9QJXNu
         8ZiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PKdWN/i72GfaA+FqBvCbBiwx6oepwy+l7LdNdJVU2Il0aHYK0FBGXTyocOBROK1aImBUPKjD3levl@lists.linux.dev
X-Gm-Message-State: AOJu0YwW22pAkKw4TpbBLlb2w+lORtAK1BN+7c2AdYpg0/PO3MckRNH5
	xDaPBUcoPBBCeaJ9xp8fa2xOTYhVQAzkl1mwkjXUGxEGr8zmr8j2NqXQTUdnlzeOy84pUUDmMIw
	oj4QriyJflYn2HLn5/GVmthE3p01gczXBz9pJlRbAlg==
X-Gm-Gg: Acq92OH/ZBvCEhnn28gUwOeLFGlIBh56IHOKmnJk0GJ+ambSmr4saQDoPifQySpFHFH
	iYYJ/Poe89dOvSbowB90oiC25BlKpZ4ZedRxIGE3Miz06fYxcXLsMlUmIlk46EnVeBg8OTUuEuF
	eH/xM5m3xq4DsXtt1g4FDbkSR7CbzQngAWGnvZ7Lo7E6+ll7f+EM0DgPsnPnaRStCSfs8gLvqJD
	6/ylwtzAWuJ1TpBWMl+LIgAB1l+o7O9EuABfDAOXy30/mscrrh8bYn6bFz3Us9D8HVFLSg3eqe+
	ntfkKrrh5GDndHFeWpjuhoQ8B5Ig7htm/LXxmiJ3UmFBQffmyF8=
X-Received: by 2002:a05:6214:170c:b0:8cc:ea95:2261 with SMTP id
 6a1803df08f44-8cee639fe21mr271022016d6.36.1781006598353; Tue, 09 Jun 2026
 05:03:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260606-fuse-io-uring-race-fixes-v3-0-6fdf5e5b3437@bsbernd.com>
 <20260606-fuse-io-uring-race-fixes-v3-3-6fdf5e5b3437@bsbernd.com> <CAJnrk1Zjn5FK8gj=a5gxJbYzQMC0rQ-FPcy1Nj-r9N7ho=PnhA@mail.gmail.com>
In-Reply-To: <CAJnrk1Zjn5FK8gj=a5gxJbYzQMC0rQ-FPcy1Nj-r9N7ho=PnhA@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 9 Jun 2026 14:03:07 +0200
X-Gm-Features: AVVi8Cf-_-ykcJ49uSqIOCc3DyfVDO21mx9xSyGnig2D1kipXEjEbAqEQoenMmQ
Message-ID: <CAJfpeguBGfUBBWrBUVgjUtA=6U4pAHaMfAOmmLNwYVF0=yotRQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 3/4] fuse: {io-uring} Make a fuse_req on SQE
 commit only findable after memcpy
To: Joanne Koong <joannelkoong@gmail.com>
Cc: bernd@bsbernd.com, Pavel Begunkov <asml.silence@gmail.com>, 
	Luis Henriques <luis@igalia.com>, fuse-devel@lists.linux.dev, 
	Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>, Zhenghang Xiao <kipreyyy@gmail.com>, 
	xlabai <xlabai@tencent.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Jun 2026 at 04:08, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> On Fri, Jun 5, 2026 at 3:13=E2=80=AFPM Bernd Schubert via B4 Relay
> <devnull+bernd.bsbernd.com@kernel.org> wrote:
> >
> > From: Bernd Schubert <bernd@bsbernd.com>
> >
> > Bad userspace might try to trick us and send commit SQEs request
> > unique / commit-id of requests that are not even send to
> > fuse-server (io_uring_cmd_done() not called) yet.
> >
> > fuse_uring_commit_fetch() ends the fuse request when the ring entry
> > has a wrong state, but that could have caused a use-after-free
> > with the memcpy operations in fuse_uring_send_in_task().
> > In order to avoid such races the call of fuse_uring_add_to_pq()
> > is moved after the copy operations and just before completing
> > the io-uring request - malicious userspace cannot find the request
> > anymore until all prepration work in fuse-client/kernel is completed.
> >
> > This also moves fuse_uring_add_to_pq() a bit up in the code to
> > avoid a forward declaration. Also not with a preparation commit,
> > to make it easier to back port to older kernels.
> >
> > Reported-by: xlabai <xlabai@tencent.com>
> > Reported-by: Berkant Koc <me@berkoc.com>
> > Fixes: c090c8abae4b6b ("fuse: Add io-uring sqe commit and fetch support=
")
> > Cc: stable@kernel.org # 6.14
> > Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> > ---
> >  fs/fuse/dev_uring.c | 33 +++++++++++++++++++--------------
> >  1 file changed, 19 insertions(+), 14 deletions(-)
>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

Is this the same as v4?

Thanks,
Miklos
