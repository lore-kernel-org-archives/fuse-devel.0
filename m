Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9D9238C0A
	for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928806; cv=pass; b=dIAwerMmbThdAB9gWqsusFatDlNrRx/0ksA5BBPK5WvH5HkbieWFuxEd0Tp6PnS6D4B2XoaoCQZrlLKwvVA/MuoUbadisSCZOinsvOBbt6B+UdMotwtCH6wzAdC+LYeynRkb5z7sMY/Fzv82iTyP0R8DLE+ukHdqJ4W0tNvXuI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928806; c=relaxed/simple;
	bh=2spsZLopetD0AVjbS3xHfXfzVqbgmaAxnQzVgLMWgfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sm0Dhqq2fgriy8yn8+vS/k44/Z9GUQLuXqDbeSbiMVMZDlOW1pTHRNhxy3zIMrl5sVl+HYPuc8uHZxerevBU58U36PKUqs+3sW0zJUi1njpgxXgG1z2gHtoYoIzmIMPebkM2I310IcAcow2OO1FfJz22zn0t5R8pfHluQSm8kBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=plShV6pd; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="plShV6pd"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50e5b55062fso37847791cf.2
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 00:20:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776928804; cv=none;
        d=google.com; s=arc-20240605;
        b=aM4CY9dFdCjpEGvU85kWAv+LuRe38jX42aGhjqBablwMSEJqQUG+nNDV9uKaF1h2ok
         KEx20sOqD3B4S33Q6yire+Qygjtx/dYIrvTCmyTx3IUcXMQ5h7gmUkRIDwc/qG13Y//e
         6XKf3qUKS+aVz3IW5fLwafwIUAeEARlYYc6uIWZamfDZEwNU3NzT/BRNDzfNJvlYp8oR
         NmYK1h5Y4OJTy75KTZFET/wH4mo6ZBxXaZBCd7E5TLxWEs+CVP5wBDbzj+N23pVzhtyP
         j+shEbbxQBZxsn4ReQ+yA2GBDfoz88zh1M7+00OhKBU7cMh/WcHjfDv9qWIO/b9IbSsE
         BH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nn7TkZue/k7dxDzSXXMHz1GmsfN9RVY/OvzEMUDJhDE=;
        fh=yLcZd+ujCf4rVlBbFVKZc9c+OrDutM8l9ijKxKrvI9s=;
        b=hiRDSda9Dd/grS3q4izm5N4Px4m4ltQ7ysn8o8aSyOWrSrcdRLAGLJcIIE86RmWtnl
         0IR2BkSLJIBbnHB9/YcYtEl633BGYgfZKPdDE1/2aMzW6WmT+e+TF8j2+gQUrq5e+R3d
         zrH7Ka3LotSU4M/4kxDIY9qGfm6WRKvC8UIY1D0ONWoo5l+0wIuqro/7UOu4PWhi9ddg
         Aw/ir0pjwOpVIM2CUG7Ei4X/mqsXiaeaJ3wijk7a8WAzWHDxvSlQfKh1JXy1JlvM9PU0
         5ycgAutfa5NlhmfCnmzle95XvVtw031hF7BxLg6VdRfps50jmL4+1NmqrXGpsgWYXkTJ
         L2AA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1776928804; x=1777533604; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nn7TkZue/k7dxDzSXXMHz1GmsfN9RVY/OvzEMUDJhDE=;
        b=plShV6pdyo0BWDl1q6AdcwcHY74AvpAdbpSQuxmFZo5r/Gqsf9TAOl2xplNfViIJvA
         V7IgBdBkKD7sJyK2rXxEnAAGxaXrqk5jx4gZ3UagXmF5D2bf8fid+giS+/44TnpoBd49
         o6tNegIDQQVoObEfJNLKiQ896S67IItsbP3d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928804; x=1777533604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nn7TkZue/k7dxDzSXXMHz1GmsfN9RVY/OvzEMUDJhDE=;
        b=sGf9LVOcaMu8RDA4IIUfthCPO12Eu+COGA+LF4SgzKp/iieNoXa3CghI4ZEVcmMBu4
         zjs8YJQ17uF+JgPe4ktmq1Ly/YkxYFzZwbwWgDqgTVsrey84CV9pPKBsykrlkM7z+MZD
         hXv+FQ4aqdbtcQne7w73FAU+n9J9HOidVKwmfgAhKKxA74DAV8PkSium6QC+lSK4GUpt
         PzWDOlQ44H4HK1MpcbBHF6UUKjPHIeJ/jdjumNyZSZ8a1rKTc1d/LKSCretNlqljaDQS
         ss1z/FumDY8S2R3iIAk6bPgfg4eh2mS5fbQ1lr86tpdnS/gADm0sz9Ebc4ACFjjVK4MU
         BXjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DCJhrPvjoOEfZvx90dOtIImUODeYq/YzEv/DiAcLCr7QAh1Rj7FiKStlLs05T3tpHmb17nq/9JHb+@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3bEgiyx5PYUvcEV5RBz2nQIcDDCAMe2cp5TigW4sPXVd14LQe
	vPNMOfwTq6rN24DdhhlXdsPBPiQQBqLVK7J0c38gAdpxYXhFNhVIffeNFH/8BkTg8iprvooKvRZ
	P/VmqcXXENdP4brOuVUVOtRVmmwZGxdy2A/SbHyS5rQ==
X-Gm-Gg: AeBDiesIO9DYRSG58wHv0EiGHQpXgJtyh0LDKtPdz00JY89Pvf7rmwYuI7UQk0SspDa
	ahGns/Lh+7b6s/6TGPeecuuF9t55g2UZsAg2d7XfND30o9Kjd6Bo4NVeXk1EujB5uLO/QULrFvj
	lcgqYgrYYgyTbFpyUIzSM0xKouVXJRTPzj5fJpKI6vMHUmEqok3mFwKdRYFEOSWSY7szVVS+Iab
	fE7bspjV5yfbNRwadsrIQktvRmJ/LKQ4EPY55lgnFr6E0kZ44E/lpklxZElu6475J3WcGP26Bbu
	5qvmnIJ0Kl//nCFCrV9y2C1MEy/fd/vlj4LisLiapNdqZSgCWpM=
X-Received: by 2002:a05:622a:790b:b0:50e:6135:f27d with SMTP id
 d75a77b69052e-50e613609fdmr176019061cf.53.1776928804571; Thu, 23 Apr 2026
 00:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416091658.462783-1-mszeredi@redhat.com> <20260416091658.462783-28-mszeredi@redhat.com>
 <CAJnrk1YGJY3EwQi3DoRwYxpGA3y7EUh8KczV0XsDA8KcU7S4tg@mail.gmail.com>
In-Reply-To: <CAJnrk1YGJY3EwQi3DoRwYxpGA3y7EUh8KczV0XsDA8KcU7S4tg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 23 Apr 2026 09:19:52 +0200
X-Gm-Features: AQROBzCU6E4eTaZKcsGQ3R2cKLcCBvV2mAze12uzo2uAtN_K0dMvn87Cy-pJNxA
Message-ID: <CAJfpegtL0wZ5FCodbLCF7=W=_+MHNdSgCyOX6W5Q8iCmv9zSsQ@mail.gmail.com>
Subject: Re: [PATCH 27/32] fuse: set params in fuse_chan_set_initialized()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Apr 2026 at 19:42, Joanne Koong <joannelkoong@gmail.com> wrote:

> > -void fuse_chan_set_initialized(struct fuse_chan *fch)
> > +void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_param *param)
> >  {
> >         /* Make sure stores before this are seen on another CPU */
> >         smp_wmb();
> >         fch->initialized = 1;
> > +       if (param) {
> > +               fch->minor = param->minor;
> > +               fch->max_write = param->max_write;
> > +               fch->max_pages = param->max_pages;
> > +       }
>
> I don't think this actually matters in practice, but should this be
> moved to before the fch->initialized = 1, ideally before the smp_wmb()
> write barrier?

Makes sense, fixed.

Thanks,
Miklos
