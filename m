Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794831927;
	b=0xSNTY4kb68rV94z+RI3/qd6OaBD/53PA+YcTi7RJtxXfNebjB8eF+tdvS3oeZ9kuBIO
	 tDMmzRZX3hHacyzWHxNCYg1Yy7qmwSKPye+paZe7E9hcBahIkzzPiT812J/gacsVw/Hkg
	 01XKppXtUU+TSRFyxEx1NOLmylNSH6gGoLugxPjYkWd7iorc+LhDE8YNrZUipD6DcRlvn
	 TDYyaT0m+pjg94ZzWFaFZ/sLv2SAt4NQWL0OtXmb+UxwlU0DjxfgxJueV6BBp1wRYClGk
	 Rq18LYF7i5PU9MYXgi0LLJzVBqERbrJm+FdaHbJcg8ex1nTY39ZOpfUWx2QOi7qEgCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/PiMcjQOkt2ak1BLcowjZuDxANqjoy7CFeucPyIKk0k=;
	b=1ZiPvnyAGUDeK1fdGjLe/wK2SnNZ6xL/KVNcOyswFOaivg0m+x2lZow/4znpTpInafp7
	 ZnRiZ09AITbOpSkRo9bPoNyLKJcz1/zrXO9lqkWCefSoqr3evuqEcpTDR3r5cTaG4HrNk
	 F82byRrXnTKYT3K0UXh14TOFAEc7UC4Cxu/eFbZ2i/Mp72ROnDpWGUxFZvt/js8yFT8Wk
	 Li5xseF+HPld9Jr9FDr+NXwEMEE2IWgb490E/Mdoh3SL64sUihRv9oPkMdD9Agla/SeVq
	 rxZX1NCSzDZ4Aa2eGrJZr5n9cQX2DulbI6VGbnx6czS5YQpMZ601KiTAIvbD51ELd7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pUFKH7HB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41474606A8A6
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 12:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41474606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pUFKH7HB
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab46699a09so32947341fa.0
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 04:25:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794831920; cv=none;
        d=google.com; s=arc-20260327;
        b=UYZJFQw+ln6HUY15BxTmBb+yw5rjn8dwMteHFKTxjVqFtrkxi37QAY0HajKa++mqSc
         Sg0OEfv/o+ZAbWJ6BB/w5NR/BJdgM72bussCaW5zxaqVkcVuamC9NtubZeCCHVaOXIMj
         HNyP5CpLdV0E26hTKI9UOkIwqjzHSdWzXpxbuefihzi7TS2+1ED21SAv3QdXDpkr8vta
         nxp8lzdHP2R7bcekTYZr/+OYzQhE0a4kGbCN54UW2p0JDPsH8W5+Z+NC8ZvI1yDSEW1T
         FQWyj9mBkk7oc7GsH7zt5qTpjx5Na1WssEhtZlB76oPXdNrsTbw3c23m/aqVudZWJMXT
         akNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/PiMcjQOkt2ak1BLcowjZuDxANqjoy7CFeucPyIKk0k=;
        fh=A4cSVA8Mh00ZMmI+kyRbT/cKdybIctByU19s23KjrBk=;
        b=oIXCam1oMurvQv2iIYw4UXgL2hYX6LtAVNuyhb3/kYTReGk0hgb33jtxzEcXUbgfc6
         0iJJn7CKAhplvlW7U4LtZ2JtpOXq3lezfs6f9TNbaDdfjJysYx0POxYWEm7IzuRVR+W2
         j2HxHYwG7xRb4radB5r0iblkY3q19vUACjaFDzADqX7UbGGHkg6d5wJ47QMTpye5DZS1
         fximxCQyr1aBrM6pM6WxsGK5ZYQ8put+b0MyiHwbaRmX8njf4xFbLjfvI7Y5gJFEqUfX
         r8juNu/lMBA7DsVvy0raLxOIaXD4JFnuazrmDBhkXCfIxVjnNDh8itUnVLC57Czcz0l9
         qwqQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831920; x=1795436720; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PiMcjQOkt2ak1BLcowjZuDxANqjoy7CFeucPyIKk0k=;
        b=pUFKH7HB6itUxj8Y3VSP1kGACwjHZ5fEi1rEwHhM4Rnx9nHoOyRjKs3dx+HP7uxgig
         MUypz7df0xP6p64Vx9EjmkovVq4m6j8IKRjMb11WCH54v6pdi/VM+gMCL239AXxnlbkj
         k/G2hB3I0O9EKGvmv80MYqsG5iM+yuWQs1divCFum959bJ/ypDRFQGUlGuqPJCH4/aP8
         yi1ZNZv2R+ICf2LChsqf2PYACKjne6qBNjo7/dDRsTp9RvxWRXYvYwxnG4qf15ciGQtY
         2q8bCoDn/t7oBtBiLE/8Er4hoAnn3AtwDD4eAdLsLy7iCf2GLmwgAVxYNGqqiR1W4sQY
         v33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831920; x=1795436720;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/PiMcjQOkt2ak1BLcowjZuDxANqjoy7CFeucPyIKk0k=;
        b=ASet6IWyv5bioli4KsZqSxZSVublD2J4n+6pz4vgYlxA2BXx8VkWEB2Pd0hdy91Bo+
         XEnQQfJlIRkae0S0Ca+4j/RfwRUo2d+5eGs55b3UC7b2py6oZRAZiBqLCA3EXDz/8/0u
         iYADm3LfKPNwzgyszAKB2f84xVDyRMVfBcVknvMWmSknrjh/+wG9OOP+tT2yh9RodNyJ
         hRb7sSHQUeAy1nOwiSi2JMWS+gRzRUu1LOlHvL294hwl89wVxnH3QRYtO+TJjGqW6FD+
         rhoul8YunEFt5b683PIxEQDT0oGFvQnA8Eyg0iWNrm686HgVOBOztP95C6ENSgorKlZs
         qpwQ==
X-Forwarded-Encrypted: i=1; AL+hErG4Ml9SfQNjYYFDYCi4UazaW2G3x1mHNNKBDca8aMgk7nzXHi3rAhNWy0dt+iXEtd4YnumBEkSuxdSU@lists.linux.dev
X-Gm-Message-State: APuU4Z9aBGyz+cs5rfmgo10AqDyLbH8uRCMI+GgGu4+bTq9s5Fr/Olu0
	w+RjZs7siGOoZJNa8CVEUr6jZuuY4Yt959zTUb5/Vp3k6jLzHZ2Fd23uK/8KLFeZ8EA+fUEv+wT
	/ll5FEekSo0tCzhT7T0vX85lDFwr8y9g=
X-Gm-Gg: AYBFou0/i0MnoAnUORS/gcSmN+8BtkgAWqamozWsH2x7BkCeV8VXExuHWiXwOV30hoZ
	jIyINinQVbkbYsr7xEb4Zyh2BtjOLaydcaH2V0c51R6GmPQWSlirlnncj232O8ivlbYk8UqP5yq
	oN3HJ6Q/aQBaDq7wdty8IkAwWsH+Vzs8FKu+3HrPBi4z670eTmUvAPfss+SeIgHo9IjbgeWTd5K
	cfMfq41Ylypvr6R7hOvnWKarKVVOpgnJtriOMBarVf/ZBqNOishx2q28gxdaYV+2Es0+7kQhszC
	2r3G/pPa+et4Gc11PdzrzpBDVQWpXatO71sd+sX3z21jn8usop/yA6FF2IpuZYtJNTBIaGYb9wz
	x0XIsuz80Nx8EhikTe+5iwsPFKxXtHlQgkplHHw==
X-Received: by 2002:a05:651c:b2c:b0:3ad:fb2d:a757 with SMTP id
 38308e7fff4ca-3ae2b5302cfmr27450321fa.24.1794831920174; Mon, 16 Nov 2026
 04:25:20 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115210952.2140036-1-graypanda.inzag@gmail.com>
 <20261115210952.2140036-3-graypanda.inzag@gmail.com> <CAOQ4uxhR=ERNBYsxQ06-sKGrTXvePpzv-xi+62oceNff6Mzzbw@mail.gmail.com>
In-Reply-To: <CAOQ4uxhR=ERNBYsxQ06-sKGrTXvePpzv-xi+62oceNff6Mzzbw@mail.gmail.com>
From: Junyoung Jang <graypanda.inzag@gmail.com>
Date: Mon, 16 Nov 2026 21:25:07 +0900
X-Gm-Features: Aa3M54r2Viw7fFeJwPagRzK9IYztsTnUnL-IHLph1k3bGx9UGsJ-OXrvkjOjw2M
Message-ID: <CAO7ntTQvav7mhK6caZ82afGadP8jeOJ_thanAf8DXBMBboN14g@mail.gmail.com>
Subject: Re: [PATCH 2/3] inotify: zero-pad event names after an embedded NUL
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, Matt Bobrowski <matt@bobrowski.net>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 7:32 PM Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Sun, Nov 15, 2026 at 10:10 PM Junyoung Jang
> <graypanda.inzag@gmail.com> wrote:
> >
> > inotify_handle_inode_event() allocates the variable-length event with
> > kmalloc() without zeroing the name buffer, sets event->name_len to
> > name->len, and copies name->name with strscpy().
> >
> > If a dentry qstr contains an embedded NUL byte (for example, via a
> > crafted FUSE READDIRPLUS entry aliasing an open directory), strscpy()
> > stops at the first NUL while event->name_len still covers the trailing
> > bytes. copy_event_to_user() then copies event->name_len bytes to
> > userspace, leaking uninitialized slab memory from the tail of the
> > event allocation.
> >
> > This mismatch dates back to
> > commit ce163918cd33 ("inotify_handle_event(): don't bother with strlen()"),
> > which replaced strlen(file_name->name) with file_name->len, and remained
> > in commit b8f2688258f8 ("inotify: Use strscpy() for event->name copies").
> >
> > Switch to strscpy_pad() so any trailing bytes up to event->name_len + 1
> > are zeroed.
> >
> > Fixes: ce163918cd33 ("inotify_handle_event(): don't bother with strlen()")
> > Cc: stable@vger.kernel.org
> > Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> > Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> > Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
> > ---
> >  fs/notify/inotify/inotify_fsnotify.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/inotify_fsnotify.c
> > index 6e3af6452dcc..78eb1e92a14c 100644
> > --- a/fs/notify/inotify/inotify_fsnotify.c
> > +++ b/fs/notify/inotify/inotify_fsnotify.c
> > @@ -121,7 +121,7 @@ int inotify_handle_inode_event(struct fsnotify_mark *inode_mark, u32 mask,
> >         event->sync_cookie = cookie;
> >         event->name_len = len;
> >         if (len)
> > -               strscpy(event->name, name->name, event->name_len + 1);
> > +               strscpy_pad(event->name, name->name, event->name_len + 1);
> >
>
> I am not sure it is inotify/fanotify responsibility to hide awkward names
> which filesystem emits.
>
> First of all, I think the solution should be consistent with d_path(), so memcpy
> instead of strcpy here may be enough to avoid leaking uninit memory.
>
> If we want to be nicer to userspace, then we could for example pad the
> garbage bytes with "???" for here and for d_path(), but I don't think
> this is worth the effort and also don't think that hiding the fs flaky name
> with strscpy_pad() is the best way to go.
>
> Thanks,
> Amir.

Hi Amir,

Agreed, matching __d_alloc() and d_path() is cleaner than zero-masking
the trailing bytes.

For v2, I will switch both inotify (patch 2) and fanotify (patch 3) to
memcpy(..., len) followed by an explicit '\0' at index len so the full
allocated buffer is initialized. I will give others a bit more time to
comment before sending v2.

Thanks,
Junyoung
