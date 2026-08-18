Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE0420496
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 08:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042389; cv=pass; b=LndDeUquz+s3z77Sw00J4ClkLhcZDhikmM/fjPMfgeqxaTfZrh4CsMCClgeHIToQOWZc+nkW/im0Zz5wiW3IhMie408oeX7VLbTbjHXTJvhf/yapHKGaEiUYyseilHEjkRmzxZz40xK22sTAjXQo3kCP/AQyY5ccLKlaYzPzVbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042389; c=relaxed/simple;
	bh=EYugb3gpreWfMmLnuBB5U5l5mSldktBAqiHLwx3j6I4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rFZLw682XH9rKTtOB7jco6AvLB9vqEipEnAm9/fWJ7FSbq31a4689TxMU/vBo1KFAl2k1064URYjo9cPITXvy883otKGcgP8ngDyCnsOaPjc7eY7bIw6+GDdmq4DZ7JSkJzZofEQQbZ0SVdqOA3ZXj7ZsFH+f0A43U4JEQXDedI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=fQbWk3pc; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="fQbWk3pc"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c0cea8883so5416141cf.1
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 01:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787042386; cv=none;
        d=google.com; s=arc-20260327;
        b=QzP0plOLauo1pKs4vbROyDMe5P+ttBt13nJDZWq12MWa1yKE+33TCpRQZeg8Xjjxfg
         cT45oZmSTkJsQM+bbsh+g0zGRRF8sRN/olP/uizZBNR9fzb6TEHTVfAaBwKYH345GIlI
         Et+WCcV2ny7fOQTuqR64yuoKx+samiin3ucuGR/hCs8gU6SL/Cy5O15QBHCRB1WB7tCM
         +NxVPIJEwA+UfrUyW+gjifrChadPEIuu5uy91/RA4qf+4PkAsAA9tLo9ean3RPkzhziy
         nIdDPr1wP/j7gRXVCBS0v2SZmwQVxsLDSdkGu3vrvjQ34sQBF8hE3QHzZVQkJrO2KLEz
         lfjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EYugb3gpreWfMmLnuBB5U5l5mSldktBAqiHLwx3j6I4=;
        fh=VJuZJyldInMXwR1iz5B1fAHk9VT5Pk0Pl8iycE9VpuM=;
        b=CxKr/PD6jN5sALph7PUkAp9m6TbM/USmbV0uYI31vw+6xlHtnTTZ7N/5X+TA4zVTuD
         olAXTSixlNRc3OwmQ/wqhdd8wojKle5LMcevfAR6Q46bhmAsTUCGbzcOwJy76DiC6Ahm
         qxZShMfynA3F7sSYHVfTD2xBe9sKo8wnbwZuS7bHqcnLxD1+YvTcfbW6N18sFsglw2wX
         ba59fmsjh1bjRFs5PU+MFbdVFfp7KcBwjSV0+Wf7SMKRZUajP0oQWEKJ59znUljMQS/z
         DxFksaYVsbkq6HYwj4z1635uKJU/L/WCSoxqhOjQ0jE5nZKJ8bKGFzlJlHiBRJAJj7ev
         px6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787042386; x=1787647186; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYugb3gpreWfMmLnuBB5U5l5mSldktBAqiHLwx3j6I4=;
        b=fQbWk3pc6aS4vLUI0ftctEtF7HEMdKK3gmlna0EnlDuyD/c7blHi9CTEWN1nZxf5oG
         2Iy8JCBlR1btBjyBTDX6Bl7N3uBatjB2YCDbE9b1w4x3OrgsXGms8bCcjlvx6UhDUh/l
         nIkIoJzEZHMMNONT9Z8FQ2ptZ5u+pqpaaO6rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787042386; x=1787647186;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EYugb3gpreWfMmLnuBB5U5l5mSldktBAqiHLwx3j6I4=;
        b=aLQw4aEcWiV3DWIfB7fFKyBY2xfJ8Yf85TWK7v7SiqhVfJEqCWpmWB1sWCH6n+ataF
         pzO+GwrE/hlQpeojhBm3wK7WhDg38CQZWjMyvEkTzfYgVLQCHZS6iqkGiXmMgltHNPYx
         /p7iC073Xe13oxKIDNEqKnsPTgCcSHG1q8sJjd47BuUHKygLAc8CfIuQ+1Cmt/faXasE
         eTzZGnj328KKyHO/Gofaea0myvS+86Zchcoizp7zF/5CWR8xhczyvJKFVB1OWO/huOP3
         pHN4K1cEQQE8qwoRpPyNGgKlsPU2y9Iic7Nf0JTuQt9KPPH/2cm4GaADC9NJAVzvfoq6
         NyAA==
X-Gm-Message-State: AOJu0Yzec3gJB7uYdQmaCrbbxwYODAY0MYeW4giDd8DPvDibseMgDzs4
	1yKQfnkpACjFJO9LiQuEetNOo7gzXaQR8QOq5QmZ5KWnIz2Hoxlz9gVxfnveXENiccDVD2o9k2r
	EsIcw9RcFhHB33YS0+4h6EX4NLKbzACsB8vUClZDopg==
X-Gm-Gg: AR+sD13DOY4x2NR2Gt5WR84jJe7q2/NzrbbrdLiUK678EJTpMHjF62br6d4odQbIPrb
	d3QVB7z6qVrxa/xmSIhQRIDtjW5iJPVPZGC4ii8kX2gOTS2Tb8IVH8G7NQECNKmRBb/trUJSUyx
	I3gBYc8etVM70jL/vB20Ud5Iw32S29nHxz+iHI/m++i4M6p/qCSTEpXiuC7qWcNLgIxD5Odutqg
	fC6rOMWKJZUVpsW7sjttRpcmpnD6NAP57G6mUclb/mCsp/dEMmmGigWlIqryVf6kHKG0AlfJh/3
	7X61mvOAi6wDv7d3kkSH7p3yO7nPGZJjjeQsLK7Stjf9ir7w79GjVMgETBujF7gPcJYAQJGQY0q
	B
X-Received: by 2002:a05:622a:4c0e:b0:52d:9ab4:7775 with SMTP id
 d75a77b69052e-52dbee79643mr52019081cf.21.1787042386352; Tue, 18 Aug 2026
 01:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804091757.503476-1-junvyyang@tencent.com> <20260804091757.503476-2-junvyyang@tencent.com>
In-Reply-To: <20260804091757.503476-2-junvyyang@tencent.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Aug 2026 10:39:33 +0200
X-Gm-Features: AcwNN1WbrR_RPpivO3q_D1COqtt0-D1Z_CAbp3XStGpwR2DWfJFOj4sQkOq_hF0
Message-ID: <CAJfpegt=OFdZ6mhesKOhpf_AHNM0f=rATsMsvmqTzuovAvGJDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] fuse: set FR_PENDING under fiq->lock in fuse_chan_resend()
To: Jun Yang <littleddfu@gmail.com>
Cc: fuse-devel@lists.linux.dev, Zhao Chen <winters.zc@antgroup.com>, 
	linux-kernel@vger.kernel.org, Jun Yang <junvyyang@tencent.com>, stable@kernel.org, 
	TencentOS Corvus AI <corvus@tencent.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Aug 2026 at 11:18, Jun Yang <littleddfu@gmail.com> wrote:

> Publish FR_PENDING under fiq->lock, immediately before the splice that
> actually puts the requests on fiq->pending, and fold the intr_entry cleanup
> into the same locked walk. A waiter that arrives while the requests are
> still on the stack now sees FR_PENDING clear, so fuse_remove_pending_req()
> returns false and it falls through to wait_event(FR_FINISHED) -- the same
> handling a request already handed to userspace gets. The !fiq->connected
> path no longer needs to clear the bit, because it was never set.

Thanks for the report and patch.

Commit ed9c881f3b49 ("fuse: fix race between interrupt and resend")
found in git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
#for-next contains a very similar fix.

Thanks,
Miklos
