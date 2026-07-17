Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24ED418A3F
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296700; cv=pass; b=JckBfC6rzEp730wAnSgSaqXxu+A/uS5vMvi/P4V1QcHD2PLHhye8NTkAz3iLFiUrcOBZuH7bSMWbSSazq/6u83hl+7Rqu6/BRi3wG6QGt4M2Sc2pRR/rAQxuWIGE49zH+p24WGMHnSE0ZKHAkg5SmQMeh4mxzCRkDb+XClwlWQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296700; c=relaxed/simple;
	bh=Vetewaw4ZWP6OUjK6Pzy6ekfaTNGiO49HenhGemTi8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iac73UlUoyqueWi2qwjJOwfCTwquuR0c/p3eJnPfWWbIpZVdO8bj5v/BavDIOgDDW1NW1Gag4IiyqRulYNXQVHevN5t278oRXjjK3AlIo1ZHlySovKFVyzrxAnGyap5ZoX9koBSnVvG6TK5tw9qEQTotiFBquI50YTZptBFTkag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=PThNV2+s; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="PThNV2+s"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c2b2c9eccso59168361cf.2
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 06:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784296698; cv=none;
        d=google.com; s=arc-20260327;
        b=pqmdNZauO1OaATOdaS0YTTjZZrPVy5E75uVSu4QnnInGyJDkT0/x9Bsgx2sGbUEz39
         LQ1lfCd3oMYV5+uX9sLIDeNCYd1QuXRur4u7I3BtnEIYwv+0CkAopqbfhZenqIQB1uq+
         ixCUA/LkrSOeh0cIvMypD3o0H2A5Q2mAnoecTrPYezCSotQosIf+SVr49od8tmC7Q3eW
         okDcqKntMi4iHQ65+a0ezBAPqZDH3jyBuF3gQmXZbHAM0+bQz+4ySkEe3T4QU0lR7jwy
         gNpi+RcLcvC8JRketjQmfVP7VGKJNs1NG/vRrvL03M0d5Ia+oCuVkpbTe1U725FqfP+R
         cC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5etTCWmgcSF9TkzltHZJDFVEm66yIWk1FShqyhXR7+4=;
        fh=zcSaEOVo4soKypz0TS+RPFmlK5b/RJDJ45CX77W2DiU=;
        b=EIyn4ICe+fClmoDnOqw0yToymFmKaDkz1jr+UpniumWl075J9ruQs9p0u1bKIwauee
         +9wTsGC8yAU4dfpM6DWCalpb0/G5y/+mSrUaSRZrLgJJJq0g4PtyphFMdKLrd0/Inig5
         A9jwio3fcJuIBUynQPnC5OBh/1K1Ya1syXBU+T65hkCj3uMDqw9R/QxMIrywEDfsNUOR
         Q/5S52ElnUWjsFL7fX7xEM1IQsUuQmgvsbeTPJSEAFccTY6KLQfpCf8QvUhMrKe4MtZV
         k6CH/zdUehqpreDf5lid7Wz2ikVNKaF1RYWNXTnxBVC/LUl8qMox0/qXcUHOqMxSQwt/
         cL4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784296698; x=1784901498; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5etTCWmgcSF9TkzltHZJDFVEm66yIWk1FShqyhXR7+4=;
        b=PThNV2+sIx2/3sX1bBcpPzmH/DEghqc20UVMBroIl48tZ1mO+mozl70g28KOvvQtdS
         Z0k3ryN1yeCK58rXyG1UOUzb77o67eL4JQZlYJyd2ixmgfSwyUhR+LxVG5Xn9GsRUrb3
         CHgANk807+doFaZgbHMmFkeqGplxGsPXEbvNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784296698; x=1784901498;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5etTCWmgcSF9TkzltHZJDFVEm66yIWk1FShqyhXR7+4=;
        b=QW0OpclshTgLLWJXhvL7Q/K6rMqPjq7v8Py2GrBswpnahAUjXkzcomn3hxZ23PABs5
         Zjhy35mOFtJ3CZKf5bLA23TI1wExRWdxkmyBnflt0mub0SzagWMru+i7yml6LwiBDluk
         iNMvqbJpkSGmP+usXhqYVMz+/PJeFD2S24x9l/axkLEsOHp4W480D+d6S+nTITRkOOMe
         x/F//fCleHgH2/r4oQSWhJ5L+4luTi5ESfqb1aqkzIXd0HaLuTeBmw7oQQw1a+gzecMi
         fEw0x7N49OkbgT3ObWf6q89uV2CGDYL/dizQu6c6epr2L8iJh8z4ehko3pZMEXrGS1Zm
         E4HA==
X-Gm-Message-State: AOJu0Yy2h5bHBlsmxD+K+EdKyn96oEz6qKtXwIwmbgi2npsB2T5G4PPh
	hCk5VtlSzG5Y8RukDKd56/BYmOrunU6WonN+QW9zRmEHGN8jrDcAAIOVUopoHL24UZGMwJ+4Lgh
	y8+og1ql0cYvd5qIlK26+XU4n4SYTsXfYSjkkxjfaoQ==
X-Gm-Gg: AfdE7cnqEaxWLRbM57j/1k+q6FrIiC7VBTa+VxD2b8RnZvpvKuj62mk6RXG3SmKUUsa
	FeWk6PX2DTsoWAd8jv+Rq9yIygxco1tceOS7+e/wfB1FZS+E+IK5tkQBlfbOYsq+e5nLYvINR65
	R00eFmfIVF+zrN7Kwnu8Kgf7YZ0W2NMTGuPG/OBicRLd4o5ZTsbJch/w61qIHSg+r0TacVEu2ye
	+TCGJa1oQc0oKwrOEBv+tl5QFttvqzRYqMzYNeFsfwl7tLFxLHsbqG1evc6LsluBsCw5xTp7WSE
	VDbvSiQIhyVfAik=
X-Received: by 2002:ac8:7e8a:0:b0:51c:1eef:4fb6 with SMTP id
 d75a77b69052e-5213c006a81mr22210001cf.10.1784296697659; Fri, 17 Jul 2026
 06:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706082931.99288-1-jefflexu@linux.alibaba.com>
In-Reply-To: <20260706082931.99288-1-jefflexu@linux.alibaba.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 17 Jul 2026 15:58:06 +0200
X-Gm-Features: AUfX_mxEeGbhsNsVW6ZBak3qLdoiqEKh8Riq8lqgeUBGEo3QhHH0g-yYW4g2_nQ
Message-ID: <CAJfpegvqdRQDDd6io2an5mBU=3Lkp23aHDa-ETN3EWVotu29WQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: don't bump attr_version for async direct read completion
To: Jingbo Xu <jefflexu@linux.alibaba.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Jul 2026 at 10:29, Jingbo Xu <jefflexu@linux.alibaba.com> wrote:
>
> The attr_version counter should only be incremented when cached
> attributes are actually modified (as documented in commit 1fb69e781729
> ("fuse: fix race between getattr and write")).  Async direct reads do not
> modify any cached inode attributes (size, mtime, ctime), so bumping
> attr_version in fuse_aio_complete() for reads is incorrect.
>
> This unconditional bump causes a livelock when auto_inval_data is
> enabled together with writeback_cache: fuse_cache_read_iter() issues a
> FUSE_GETATTR before every read, but by the time the response arrives,
> an async DIO read completion has already incremented fi->attr_version
> past the snapshot taken before the request.  The GETATTR result is then
> discarded (attr_version race), fi->i_time is never refreshed, and every
> subsequent read triggers yet another GETATTR -- creating an infinite
> loop of useless round-trips.
>
> Fix this by only bumping attr_version for write completions, consistent
> with the synchronous DIO write path (fuse_write_update_attr) and the
> cached write path.
>
> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>

Can you please add a Fixes: tag and possibly Cc: stable@... if appropriate?

Thanks,
Miklos
