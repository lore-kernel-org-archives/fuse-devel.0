Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF8B30568D
	for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 23:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779146475; cv=pass; b=fPLncAJWN+4m2aMlN4zJTZj2gW2H8lf8zsjO5/isQtVbj5xuizN2xNBWXGXdK1N+Sk9P91J1MtrSzTpcNDYtObeH7Gli0CxQv/zsf647BxGZHpyRY32KCuX4MymFUOKdbjtRyJJ6I52+IfHJiHmKJRsRdSgzFn2s7sjm7GqWltg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779146475; c=relaxed/simple;
	bh=4x3zQNmL9iHk74lRp0E3/wEsCAyJKC8fWM1/7YYLjCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lx96LSv/jKZGWfzvaR99igJTrCg1YKNU0YTvnuPbgZnA6ClSFh/tC1iB5/SzhF3taH54Np5uvzV5reiku/zh1iP9rhO1VRkQ8IxQ1gCdX2XmraQtmAbeYyUIfw2tWjH4p2WstazYL6HMJ8zF+BVHgdjyr7GdKm4KU9qVqb1h4Ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XuIzvGCC; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XuIzvGCC"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44e1860558fso1704370f8f.0
        for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 16:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779146472; cv=none;
        d=google.com; s=arc-20240605;
        b=C/Zh4d68mc18eBYbKUrfTPOvXJceCQa4jsL07iJkxAxfPsDRsrNjkgwiE66Apu9XNF
         I0TOQsdDPZGs7tyDt//Al5ZU7lEF98BDcreEwZznC7IMzvmGtX+6SWfQxpZtB4joHKt+
         uRoOPciXz5tzm2YxMkVci2wqv5JZ74Ff9JHvOnjzXxMrxPjGs+nAxBpqNGg1OP9lP3i6
         7spA8kkOHoUPPf9zy+C+FySNlBqr+okFnGIXjG6f0MQ4diWGFSTiurwMgPV8SM7KJNwn
         G2RGZPcKWltYsRyVjNmTa7CmOn1C9EeD02o6aSrDPLDsV08ypZEuNjSfEH433xzvIHSt
         ltDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qigLvnHqnvJ1q/CbxAtya5W8ES5fZ7EbWfFSlybCG8E=;
        fh=gkv9TVKgSC/v1XjSb+lC0RYH0hdCzWin2ZZ7emFg+Us=;
        b=dCR12rAJGJFdspR8FGbortZaWU2S8dqANYPIKDDjSNoNp9kOPZjq2H/gQWf3BMiP+E
         TPo0GQdbBsAoyWhMRsO+JJbZCLouGCpWoqOkkWRQNnQa+tpGWUoEDZl17a8uQxzSfuIB
         wP1kKLyZ0sKDvBIyqA72aVelig8FvqNCs7krnBT12apq+DNKvTGVDMxbVosffghbmKpE
         CZAahufQiXrMSccoo9WzGl/hJPWjipvAthU6ipIImCz24EMaCHSO81SoL4DKQdku0Twa
         cCNpU8u2j7bnDAGvqg+2kr/kZ1bD9YffqW7aUTkBoIP9/9AikOvhTUkKvT4m/T/XnwwG
         vU+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779146472; x=1779751272; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qigLvnHqnvJ1q/CbxAtya5W8ES5fZ7EbWfFSlybCG8E=;
        b=XuIzvGCC76VToiiFFxiuAQgLyZpfTLVRIPTsd1AF5QMd7ZfFXKtZ2aNsq0AqWRmuN8
         ksj+/k9PQKtvQuJGlEGgKdBgZqKYpcnKn1mmIGmYyAqB/Alwo7MH5pmbtyOVedO21HRO
         E0P2pXWFieHAkIG7GAsGxx3ew5yuRepJOx2e97ArDZElV0bS/knFhIflSIej5gSIXQ6z
         7cIuGtT8vLeskLcKoVV9IdVwBg2lcr7gD2POBKtGT0zcYXsn1muQRzSMzrPweSMwYu6+
         YxkZOaU+1iNMfcCBgQl3P3R/EgLOsyC3Gu8gFOhoB7sYxPdeQcv2Usz22jMSgxVVEuWW
         w4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779146472; x=1779751272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qigLvnHqnvJ1q/CbxAtya5W8ES5fZ7EbWfFSlybCG8E=;
        b=jcwvwxBz9lH6y/Mkslg30t6+bpeLdKzJeiENa5k5A9ymjzpDKCu5RS2zvcjlSstUoA
         qTExAUHIYhpozvJiacjfBLoue5bJZX7tO5E6sD7V4monlmC2nf2LyQdgeW64u24OlAzY
         tVztYpsh+JxkZ3hAK5auDzu7pcOhfbZIxJWGQATpgzrRI6PwHDKJBgNY4alti4W66xGf
         6TdtlBCgfOXu4dQmZhhPmqg9OEJi+K913Dzq4BXVhy5jlOaJlcCPnvlOgmc65duLwIDf
         SE0/AWfP1YXJig3dUSjbL6AfCsLtI0AWTR6ZKWQ4YR3Kwtc7e9/j7Ff+wMRlhWrFMprF
         0yjw==
X-Forwarded-Encrypted: i=1; AFNElJ+vTuYdPkFRtzoO4s31uM2masH6EhoztHGkFUcxa8zASV81X6TF+YmQhsbVSkPNXa269PvsSYfQ1Bqm@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyahy1B66f3qQtGfFnousrjwleTH9rL2v7F/8sMJ0vUFXv3gcn
	dC4lYj25RiVtat0zEq9i9fDUcAdkPzi0Y7peVkoQFTcFHXNk3o1ckfLC1aXHyWHF0JpH4InhhNF
	goCwNIV3u4KYhmRsuw76Q67vG6uEiAic=
X-Gm-Gg: Acq92OHoqouSGt6EwQ+Q9BYPyAK/+1QcY+YAqBckx1XD+dU3jFdOBKhHAxO7uv01s5q
	xI/0YX7dLptMProSKecZ5rRWRuay2WzN/yfVKvm0rKOA08M2DOZIsz+c8IljnXDSxFaGFbLv20j
	ycX0RhI8Ol2+zAi3k54Q5L3AjQDGykwkjW2tI1+efVRPkFU79kbkQpahZsxveqKVA5yj+dw8Fsc
	vi3/RIJsou/3URx64ZDN9c5sTYSYbBHbd0qMxnuJruB4s8gqiTPnALWigXY4t4f9pFDBhO4mCdK
	ltlmrg==
X-Received: by 2002:a05:600c:a11c:b0:48a:5970:2003 with SMTP id
 5b1f17b1804b1-48fe5fd483amr203177845e9.3.1779146471937; Mon, 18 May 2026
 16:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-18-joannelkoong@gmail.com> <CAOQ4uxg9WT7WmJqQezgiCB1jOX_heW+=UJbbFntbfDUdm0H=tQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxg9WT7WmJqQezgiCB1jOX_heW+=UJbbFntbfDUdm0H=tQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 18 May 2026 16:21:00 -0700
X-Gm-Features: AVHnY4Ij6E14B25Js9mPctacU2JwfQZGAV8QNpi-IPpjZfOoDi-Gn3aZptVLHLo
Message-ID: <CAJnrk1bqfAczXnTxtb_rui2adksDpFKXOvJyj=zotGeWJoA5sw@mail.gmail.com>
Subject: Re: [PATCH v2 17/21] backing-inode: add backing_inode_copyattr()
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 2:33=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Sat, May 16, 2026 at 2:53=E2=80=AFAM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > Move logic in ovl_copyattr() to a generic backing_inode_copyattr()
> > function in a new fs/backing-inode.c, which other filesystems that use
> > backing inodes (eg fuse passthrough) will use.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  fs/Makefile                   |  2 +-
> >  fs/backing-inode.c            | 43 +++++++++++++++++++++++++++++++++++
> >  fs/overlayfs/util.c           | 33 +++------------------------
> >  include/linux/backing-inode.h | 14 ++++++++++++
>
>
> Nice!
>
> Please add these files to
> FILESYSTEMS [STACKABLE]
> section in MAINTAINERS.
>
> Otherwise, feel free to add:
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
>
> There is one more cleanup patch required, now or later, to get rid of
> some awkwardness in kernel fs code.
> If you don't want to deal with it, I can take this cleanup later.
>
> d_backing_inode() is a noop from the day it was added and has 177
> call sites. Those call sites should be converted to d_inode() and
> d_backing_inode() should go away.
>
> backing_inode_security{,_novalidate}() are likewise unneeded
> dups of inode_security{,_novalidate}() and should be removed.

Awesome! I'm happy to remove these.

You mentioned in v1 that fs/stack.c and the corresponding
include/linux/fs_stack.h are pretty much only used by ecryptfs. It
looks like there are only two pretty minimal functions in there. Do
you think it's also worth moving that logic into ecryptfs and
eliminating fs stack?

Thanks,
Joanne
>
> Thanks,
> Amir.
