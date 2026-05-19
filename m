Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64636334C05
	for <fuse-devel@lists.linux.dev>; Tue, 19 May 2026 11:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191276; cv=pass; b=Soyv7DyFf9PsBfHz7awzy5yRXckDTCkjOR/nkYnQax9V2STx4xOvRt0og4TG4yxBP62E68+IFEiIOJTe+eApdquxyUMhKhbWGh9ULO7iwRvBUZS8Icc+mVdEHvke+GvbNfT99eEBCEt76NVzRajxqjjBzrK/a7fFOodoqvhOEeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191276; c=relaxed/simple;
	bh=PeNNTUbxChRdVvLZjt65lvbSRv+y+xQXeN5Dp7nLS4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1AhYj5LHoBvAKL82FOpbpvmSf1+uRqIiTE3ADDpBkFgw3hxFamn1POMFQoGv1Di0unHP/feR2PRlvAzWqs2OBcgR5lHuVPJuW9DaMjThELhA0opJcWEr5qzwii73oWVjp2mS/c7AbJ6WSCu9k4bZktr5LctSqLxvSCa1U+Qtkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QARrK1+t; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QARrK1+t"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9d9971d059so491544666b.2
        for <fuse-devel@lists.linux.dev>; Tue, 19 May 2026 04:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779191274; cv=none;
        d=google.com; s=arc-20240605;
        b=QldoGOKUWpNSRXijFkp2w/i/4tpkykM8kLsm47moP2yvE9Oy8L7tbtWB1JlBY/pSNV
         LPXVXgJXFG7Qj93rA1JVS8myKDoGNUpEpEED5DyHYgUIg/h/QcTJ6ZO9Q0YGQmJpeyI2
         6gP2GHZKlVf/JpkP27wjDijjRqwLmRtTO8e5DR10HpGG/ujjpTH0xjk/EiSEbQ8Bo+4q
         3oAIbh6jKTUb4DX9reLGxYbD5cQms81sKGmbL2i/sPEnhLagPuZGbaZRhL8mMOL/EXjd
         QgDjD4ZAlGKjAu0yIGlOpIlWQEgCy5ezDgsAq3+haTfsRolK5v8um8Fn36+7huc+Lrb6
         YCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0B2nDA6dNMtvxDIcBHzai6u1Uy3WHBZdoSKhG6gDPfw=;
        fh=C8vmwGWmMAqm1fAsAiP5Kgr7gpWL+OSEu9JqOzhrv14=;
        b=eCk9Nb/tcvDSG59l/WHC0iA44JWVVXMjiAzp+1RtXYixtrHeLzIq3QQS9rmzNO+nzE
         P1citI7gFXYBHHwJVhUknnNuOvaa8EIB8JcztIZ1U1bh6lFUdVuZ64jlz3poQWg7kvU6
         nPvd+z8y5lMCCih4gAqIOscp/fteFqBIpl5snSnbo4hyhHAOZIJWBthXN2KFrcI2jrtK
         XnguzkPtRo8mExGfc/yLNGyNyXfth6frLcLnhS9S79L7YZJdSsv6W+1DZJSkOXh+JZCI
         SelWKIo8iM2UXn06+ohgvO8Ys0HrYpqWnD6Eai6Vnfmeh4LRjm/1JJOBcS0Y1JCs9ywv
         EIpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779191274; x=1779796074; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B2nDA6dNMtvxDIcBHzai6u1Uy3WHBZdoSKhG6gDPfw=;
        b=QARrK1+tgBF2TsYC7unn4JFFBVWIPHRGEhbVNRLLh12M4N5EOxkyafa+bl6QQtE3Sg
         l/uD4eCycYglx5ntRimdsr9mohPefDwXwMzrNN8LH8gMPeR5MC8FzrWSt2pXOpKzAH5M
         V2Q0YLowEqzQMgnrgAKK1ZoZh6DzUdnco1BDWyMT1surOkt/H7VsZ1Vyb676/EUyBFcK
         TBtyfwymgDI8jFZwKPvZ3HfSiBV1mDcveFO3CHkrz2GQFRPQCzyeA4w5dzZLiftij9bo
         G/SYKlviBH/kahrbf/9Ta+y/xNQwnO30IhXF7ZCs2yqYBJfBT5bC4G8PUf6LPv8pEMAw
         VpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191274; x=1779796074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0B2nDA6dNMtvxDIcBHzai6u1Uy3WHBZdoSKhG6gDPfw=;
        b=nWZY8TkjRp96rh1pyCryUEEOUakz8E5ayrn/QFjCCZAGEj+6KEwNy080ZEv/RMJEz+
         CXGTnBoNMwPzI9zX/stq1GejiC7pzB2SaUdiQeYM8NclIG09Pzygrp0dWOPVOic6Ogk7
         rh7MQt4rCM0F4z5ES8QjUtIQCtx9/kFXdao6vkhGCJmF7fihoKetHJ1J+uSTa7U45NzX
         NjzXLuxBMmaQpt3ezC94qx8tmCVLEtKDj1i5lNdGylnxMgOg6yc18C9KObTJ+f6CaNuc
         yKPNRIp87BKRbdo46Dk7jeAp/+sixuV8fuLCN26SLKa5eWlYLjUjS/heXXO8rPSDWNPX
         YtVg==
X-Forwarded-Encrypted: i=1; AFNElJ+id6CJBqa+a0qyZTCbwER8HS1/ohT48tWVNZjhq60ZziBUH3L9SQ4IrRWB4c1OVa2QgUuji4BhbZju@lists.linux.dev
X-Gm-Message-State: AOJu0YzkkTCPHMZhpgaYrtPNduUTXG0LzXI+sCpEIlhG7Lbtl0d+Fpv0
	RDw0TVsg678/1USsCZ1Y/IlPj0s97RABcTsVAkMO928c+a6t6PIHA7X9peNK7y/+BPftkeXlu8B
	s5IsV7gwcIwhRt0PqLmG6zoyMPfAplQA=
X-Gm-Gg: Acq92OF3kJI97E9l4ug1yxdPvu0pHbHATp77PwEP5utnfhH5U7JiS8i2g98pQ7BKqg5
	CO6ulqu6CXz2jUgOE2ZZ5QFSq6B+UlQ+jWF5c+icfoW3YYgL36Wx0NKERHWpVBN+w9V6bEelAsH
	eQa/zzY/0huKWNSLZxmhLU+kAnwUSZWLPYjCkgHGjuHZED28E7y9n2Y4jLjjNTXKrsrn703KA1B
	oEDUUw+BaWP4ioA0036dZVt70vZJz4AbC7Pa0Ec+fKTi7X+X7K/crxDc79AX+yg3T9KRQ6Tx5r+
	k2fOI9lG1OjOJ+cS1pxpaC+fku9laZB01age3aDjfg==
X-Received: by 2002:a17:906:5189:20b0:bba:3cf3:2ba6 with SMTP id
 a640c23a62f3a-bd51792d9a8mr795746566b.29.1779191273476; Tue, 19 May 2026
 04:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-18-joannelkoong@gmail.com> <CAOQ4uxg9WT7WmJqQezgiCB1jOX_heW+=UJbbFntbfDUdm0H=tQ@mail.gmail.com>
 <CAJnrk1bqfAczXnTxtb_rui2adksDpFKXOvJyj=zotGeWJoA5sw@mail.gmail.com>
In-Reply-To: <CAJnrk1bqfAczXnTxtb_rui2adksDpFKXOvJyj=zotGeWJoA5sw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 19 May 2026 13:47:40 +0200
X-Gm-Features: AVHnY4JCSAmM3oKClqSQO-mMHaJl2Mw25FZtaTf6mqtF1R_x-QV4G-cAKl5EvD8
Message-ID: <CAOQ4uxiXYmi+LUcETe_ftYzUN_KhPz9aNAe_yiX+kCBYt+zDXw@mail.gmail.com>
Subject: Re: [PATCH v2 17/21] backing-inode: add backing_inode_copyattr()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 1:21=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Sat, May 16, 2026 at 2:33=E2=80=AFPM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Sat, May 16, 2026 at 2:53=E2=80=AFAM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> > >
> > > Move logic in ovl_copyattr() to a generic backing_inode_copyattr()
> > > function in a new fs/backing-inode.c, which other filesystems that us=
e
> > > backing inodes (eg fuse passthrough) will use.
> > >
> > > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > > ---
> > >  fs/Makefile                   |  2 +-
> > >  fs/backing-inode.c            | 43 +++++++++++++++++++++++++++++++++=
++
> > >  fs/overlayfs/util.c           | 33 +++------------------------
> > >  include/linux/backing-inode.h | 14 ++++++++++++
> >
> >
> > Nice!
> >
> > Please add these files to
> > FILESYSTEMS [STACKABLE]
> > section in MAINTAINERS.
> >
> > Otherwise, feel free to add:
> > Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> >
> > There is one more cleanup patch required, now or later, to get rid of
> > some awkwardness in kernel fs code.
> > If you don't want to deal with it, I can take this cleanup later.
> >
> > d_backing_inode() is a noop from the day it was added and has 177
> > call sites. Those call sites should be converted to d_inode() and
> > d_backing_inode() should go away.
> >
> > backing_inode_security{,_novalidate}() are likewise unneeded
> > dups of inode_security{,_novalidate}() and should be removed.
>
> Awesome! I'm happy to remove these.
>
> You mentioned in v1 that fs/stack.c and the corresponding
> include/linux/fs_stack.h are pretty much only used by ecryptfs. It
> looks like there are only two pretty minimal functions in there. Do
> you think it's also worth moving that logic into ecryptfs and
> eliminating fs stack?

I wanted to do this once, but ecryptfs is not actively maintained
(odd fixes only), so the maintainer did not want to take any changes.
Let's leave it.

Thanks,
Amir.
