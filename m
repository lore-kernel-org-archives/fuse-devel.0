Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988263D9DBC
	for <fuse-devel@lists.linux.dev>; Wed, 26 Aug 2026 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750935; cv=pass; b=dIHN+VeVsSOziV5pwfpZv4Z2wN2iqHFwcX1xu82oAkYR+lcTT8+knT3CBAxKxRdna2mYaB9qvb60QiHkg3/EMcrTMxkDvXLDPe64KuczsqWydC+TqtBNxL+7P31I3R4PuSOuUlbUs2/mHAD1R4gww2yxZrNnaRldtQ4sosIUU/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750935; c=relaxed/simple;
	bh=+VLTGuxNrZSVqZv6ytH0WhOOdBFfC+XvJLF1f1/v9Rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTnlJr0iO6xjAweJlF/7XLURKpnRqIYC3U7KVslmioIqybyNrZ2mSuyQCy89NQs2ZSQuzK56rvP38YrKnImYBO8K8rR6SwN+nphyiusbZJIZEyXz/xvZPBTTl/F1iyxSgDyxphcEnnXsBs3UlIqlAIXcmgJiHOS1QyNLx/g8GYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=fAaIczbt; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="fAaIczbt"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52d8679c149so8269801cf.2
        for <fuse-devel@lists.linux.dev>; Wed, 26 Aug 2026 06:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787750932; cv=none;
        d=google.com; s=arc-20260327;
        b=pOD5Rh6nMGpXBnIt1Q7JMlnvr7lIJ9blYetkkyi6PWX5Nl96VAY/uDz92H7aNJvBuE
         xeqbwQ4ZAsfbADsMbKPeUaJQ4sXfJg4+5AO3bFECSnCSrQgf4LXlgebm0b0D9zxCrkCj
         5ZMC+PtTPzq9Q7tsN+Fm7kf46J8sO1/3+SSdTs/ptgTyEwxNBGsVOam5UXTHTke3W9Td
         DtRjPsl+f2uKUsQOejZrUrBqZ8QyK8UtLSQMW+zHLmLCuUBLJWg0w5hyum+/RGfq++zZ
         ta9HNko3+yCnz4awpgoTm8Hf8aAR8KAyPa8RzDRlqz+9fRxPI0HWc+ajEHGp+mK92dyC
         0nLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g4RMaWFMxncWKjk5/j6ryLpkwNl+5YtCqnC/Ijuyn+A=;
        fh=KJ1rnAvG5goI6kyigMPvvWrBkUoVd0DAFH2vRED5GVw=;
        b=FHbFqyAD4nosLtiJZK9BOtJrt32dDaunBfyTEfBD6gC28OsD6B10kxxYaxC6OsAVlB
         2WHyocvjT0BMY5vfJ1HRIosidHot1vhuZZL2FphiOFccko+myTYwdcUd0x+3P8/jCUPu
         jV/WZtVGmuCjme2c6qHPXb+ynB7eUrDQmBjWqm6W4eFItY6xgxB+CsDNII3qs3pgXL70
         TIzksCUCjNHPqVBWV74z27AIiXUq7X2nnVahdIKGuB+evzz+uFhTojiRDIx6FXvGCKlj
         a5/XuVBpqTnekl4vGVUNwVhFlArOGbzif68sScyHso2AomSa9rlAm8QPnL4zubb0VsAe
         XATA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787750932; x=1788355732; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4RMaWFMxncWKjk5/j6ryLpkwNl+5YtCqnC/Ijuyn+A=;
        b=fAaIczbtUWwvWiQoMNrVzXFBerbRpXI12FYzTSUFvbVh6JB7ZNkrjVpwSpF3Nw0G80
         zY67FkvNUKMdNb+jpgh1e3f6a0d8TH5li6Pt3CHz4FEft2gvQbQczBekeyOsbu3bWZch
         m8EPLdnzRVMfpyf89Jiz6R881L9rjKYZPoaQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750932; x=1788355732;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g4RMaWFMxncWKjk5/j6ryLpkwNl+5YtCqnC/Ijuyn+A=;
        b=NyCTIu1Onpv3aixMJe2vqPyVg/sLxmZUQjPjiq4UsZdJBqbPUvCNAfkPhrjc0XLIk7
         JUqPbvIrcuycqfTSdpNO5Q/I6VmpgQTR0huVNGPrnyTRbxNrzD5j41X64yXmTP9AJSaN
         r0SedmD0YZe4P1w1rS/YDDewgHfqquu6/3LRWfSXg+1dvmyy3gkJNDGpTe7jrueT/+gA
         RTBkH4XBcCrkMVgqab8rvXdIuGVQqjtw/2h2QBFV2c1TpVmsNq1zD58m/TlRDHvnx/GE
         AQI0UGh2FF2X0gagDRlSRVedIqb+V7eRnddnygbmVnkOrQ7/TETDbXniBhYteCcHRze6
         oLcg==
X-Forwarded-Encrypted: i=1; AHgh+RoZpFyRYt6+WpYrolETirXEZHbIYhaKdv2R9zt4FxjW/nWtPX33RpWXDcMs3FIEJgDORtLIZ/DnZEsi@lists.linux.dev
X-Gm-Message-State: AFuF++lwNsTg7jRUm4oLe4grfxbdUvjmwMG6hOopJZ6TV8AShz3w8cOt
	rZXRYR1pxyAnVSmvm7TsAw1RaueT/kwz7WuX5VoPkZPYzCZn4I/5PQqoXsBsQCL8LrId3Wv2ASE
	3zVmTTqTEEHWWQGynLt4FzU921pNlYpBFyvPECZ9+2A==
X-Gm-Gg: AR+sD11/XLbZ4RqgLAN+R0r3wWOM6Wk/8WIrMX9DL0YYTgh7Gwbvd8HethdPiobbO4o
	ghVl1/76I6ZPQGo5szgku8Cyb3XX0iXwCh2YcdVq0O9BpkQitG4pD5cm48yVzdtF+9xyK9OPYKf
	F7zywAmgOVh4fN+bJukyPr4BuvwuNvZdBk9NPgnQdYWroLNH6t8Jc2Q3h6/Zw0ujnhRCQxRi62P
	welydYhVFl5c0oqpzMFTFXCVZxAu/zJrFUqqG6dztaOJd4trog0/oyw47moPsAE/jXOsHuYJ/Gv
	8ZKlEK5bki7sr62m3d2PqVazyg7C2vJjSJzBGSCmLpgYhjMwFEL6dHmgmn/xfac1LeyOAxIOXAD
	zVjoP9dtBWNca1Q==
X-Received: by 2002:ac8:5e4c:0:b0:51b:ef2c:7bf0 with SMTP id
 d75a77b69052e-52e423dda91mr62183301cf.35.1787750932189; Wed, 26 Aug 2026
 06:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9650a974-ec3b-49d6-b6f8-89159d399239@mail.kernel.org>
In-Reply-To: <9650a974-ec3b-49d6-b6f8-89159d399239@mail.kernel.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 26 Aug 2026 15:28:40 +0200
X-Gm-Features: AcwNN1W34QF2PZAcvy3R9PLtw4HgRT6ulwuI-xiElq-21GqRFQaQZlS-b0FIZNg
Message-ID: <CAJfpegvhRK8QqRM_dsdNAxyEAGBNR2iFh1mOtH50QC0gMKyiag@mail.gmail.com>
Subject: Re: [PATCH] fuse: abort connection on /dev/fuse flush to prevent deadlock
To: syzbot <syzbot@kernel.org>
Cc: syzkaller-bugs@googlegroups.com, Kusaram Devineni <kusaram@devineni.in>, 
	fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jul 2026 at 19:30, syzbot <syzbot@kernel.org> wrote:
>
> From: Kusaram Devineni <kusaram@devineni.in>
>
> A single-threaded FUSE daemon can deadlock if it mounts a filesystem and
> opens a file on it. When the process exits or calls close_range(), the
> kernel closes file descriptors in ascending numerical order.
>
> If the /dev/fuse file descriptor (e.g., fd 5) is closed first, filp_close()
> decrements the file reference count but defers the actual release (fput) to
> task work. As a result, the FUSE connection remains active.
>
> Next, when the FUSE file descriptor (e.g., fd 6) is closed, filp_close()
> calls fuse_flush(), which sends a synchronous FUSE_FLUSH request to the
> daemon. Since the daemon is the same thread that is currently blocked in
> the close() syscall, it cannot process the request. The FUSE_FLUSH request
> uses args.force = true, making the wait uninterruptible. The thread hangs
> forever, eventually triggering a hung task panic:

If the server doesn't reply to a FUSE_FLUSH request, the calling
process with be hung.   It could be due to a hung network connection
or whatever.

Is this special because sysbot was able to trigger this?   Why isn't
the fuse abort code taking care of this?

Thanks,
Miklos
