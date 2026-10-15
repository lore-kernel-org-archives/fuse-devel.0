Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D0B516152
	for <fuse-devel@lists.linux.dev>; Thu, 15 Oct 2026 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065285; cv=pass; b=dkBm7tReMpAqCqaCc5OfH0TKTJb5tGD+gSAkR9h2juGnukUs/YYXrIonGxP9O75ezZ9E5a4B6xNDVvcITwtWDM7ElmAv2Y7/ho8S3F62iuaXX9IAiReYVA31Gx17bbHka0mbPWZu2UCOD6evO/SEzq+mYdHzcFrL17g7QH/IbFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065285; c=relaxed/simple;
	bh=ttWWCBe5s6LvEvuhu7UMsF9414H3CKAKMZfdr0bsCwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USDjsR1gAnjtBxrFZUQT8lAtVffhigDpaaN5XT7XslqCAnl5aKDVu/DgyMY7PgMOsiXikJApXQe9C8e3P3+KBNmhZV3RipAN5Udk53UZmA4KgWN+DSK6NpJevnMpILy7xCxYMfKnPEBa74I1H5OOQRLN/t5FZJvCHkexhaH6ygQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=T67Cui0a; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="T67Cui0a"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-535f9de49fcso8596501cf.0
        for <fuse-devel@lists.linux.dev>; Thu, 15 Oct 2026 04:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792065281; cv=none;
        d=google.com; s=arc-20260327;
        b=cXKaEipqy14ApsRCuvvRmE1peuCDIRpa8qQeYkjGcSHD8sh7C8LIT7J40mszPSuvxy
         tUL9Xaxe1IFHtlIO4u1rKVpctWyqQ8NIwXbphUOYOSYtzU8pHAnIQkocYWF7xKiho+6/
         aYjg2uAIDXZLHLhjyvTdViSrErtCLwWMN7XYgIpiswPN1OW3pSgfbqoWtZQPqLsV7Wn5
         FYUNmA+Uqgb4L+/0dNgpXaYyV/iXB24MI8nvzZ/bdaWI3ecBujGftcuMUVsVbf7AJRxP
         t1CDdElSGi1QM4/jBbLQMzIed0d1DX0VDfUIl0Y3PVZBNXXhmbpwpxdzGshlRNTzwSvO
         1MIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ttWWCBe5s6LvEvuhu7UMsF9414H3CKAKMZfdr0bsCwA=;
        fh=gbiIlCSRO4WwKzlXc+FP8/c84/YbX2aAOqBmjnE095A=;
        b=mWCPTln+A7WWU9LhW7LU+phi0H++yf7Hd7G0h1Lfboj6gvGq2bULJsy3VhzqFEqVmA
         90Q3L4BokYSoJpsQNB8DKZ2I7zeUULKb8BrbEXLmc9uL+riyUNegTGIZKdXb+Wzyb1JR
         d8nEqqDdns82LzekhVxiZwEyLZJohrHo/m+ZT3FzCnqWdxzRfDdXGPjzPzGjtMLu19Tx
         ZJbfDLHiCcUKX8HqZtqTgMvY36UwSdLH0RLt8dvqKRXgnxPmKd+ISCS+xd6f0ogL2ABV
         972eQftrbj8WJEJ1jm22ewDOBsFQrtRcYTE/BHyKjNFxSJfIkvWu858mykGEgzF10EPE
         xVdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792065281; x=1792670081; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ttWWCBe5s6LvEvuhu7UMsF9414H3CKAKMZfdr0bsCwA=;
        b=T67Cui0aTt5MXQ7pmaxG7jj2z2NmM8jCAZgWwa3SJZSTQcBsWOA86i6VGqGjALt9Ne
         cuduEc9JxVr/vM1MWm40LlvkdnWZ8kIqQTgDwmxoH+zvh6Sy3lJVWVZL5rWNVqiW8vUs
         I/lkZyYpzRCi2ktW4V7ABaMMh+LbXm4NlDZXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065281; x=1792670081;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ttWWCBe5s6LvEvuhu7UMsF9414H3CKAKMZfdr0bsCwA=;
        b=dQ8oDktA1I0LW0YgaSiddtDalUqpWvX0MFhvtwwcAcJ6uG7tecIWmVvQ72A+HdAScw
         mviAIboSFuEu7ATWGJgNCKYipSlp7KgJNhb4Uvf1SMeqtAyqJ7Yqwb0vUZQlStt5crpn
         K0JTfrN5SKzdFlsj796EWF4v6e16b0m0S1XY/mNXq619lFr4ICpm525wiO1STUVdOnE9
         0XftyQ7eMSAKnTyNa9T1rfU1/y3n0w9ut4Ksc4Jy6+ErtHUiJqOARo/8N5iGWYEeHUjR
         7HYdZBtFOR0FSzyrqIdFmzFSFARID+YSPkzhgeGqGvHNrFftBDOe+cI/x5ZtOEQqsMaC
         tM8w==
X-Gm-Message-State: AFq9FYIwKEqQToztyZhlPG0sCTf2OX06iup/Fo8gL7MLkIswp2m+gRyp
	ggmk9Kkv8hONRY2bf1sgRPoKn+fAMzvQXekV9ZUhYwoWpwrlTOOCuCPyGmDwt3YMyBtE3YAxiJS
	mcwPCW4a2RsL3ccL1q+PvNgfLAR2BUI+UQvz7cR3jlw==
X-Gm-Gg: AYBFou33oEEIws7RybZUgO7i09IUDlnkzZpUbfOrDggX6SZAdOtoO68JlIhe+Oon4ZW
	XPnCQaENyd7hH0qE+eDq4i+1anjqUz3hqUch4zaH9w5B1AJROdYql0rIF1g890tWdMQJITy6wQ5
	yacEXXyUyWyBUC4ktow/Qgzo10BE85Q6s9GFMobmY25/QUC6Sxs2zO77PhGM4KsqTvWBbw8JeSt
	n/rErJdHh/9xaeKCeD2feKuNRiUkHEFEUCM0I9aFCPxCYo9z+kVAg4xa8HFkkvZ0t1FqiUXZ1ga
	DwzRgCXBUGlDkgmTazWyWeRV2cEHPOc3PhnzSTXdEINhemEz21y50x8PppK3AWQ20zdEA/8cvma
	WEkSM9NgyfCBVVBwqeA==
X-Received: by 2002:ac8:5705:0:b0:532:f0a2:ef4 with SMTP id
 d75a77b69052e-5359fa9f9abmr292049781cf.26.1792065280681; Thu, 15 Oct 2026
 04:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929094812.93374-1-tkhandelwal32@gmail.com>
In-Reply-To: <20260929094812.93374-1-tkhandelwal32@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 15 Oct 2026 13:54:29 +0200
X-Gm-Features: AclHuK-b14bcg6mR4vOtm8iYsjO-WDFkkV-OiklyH6IKsJTNTAuDKd92iU3RYd8
Message-ID: <CAJfpegs1Zq1zKfGDOucL_PZMUwVuHjandRn-rrNrBPnKex8hcA@mail.gmail.com>
Subject: Re: [PATCH] fuse: propagate SB_POSIXACL to submounts
To: Tarun Khandelwal <tkhandelwal32@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	virtualization@lists.linux.dev, German Maglione <gmaglione@redhat.com>, 
	Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	linux-kernel@vger.kernel.org, Tarun Khandelwal <tarun@supabase.io>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 11:48, Tarun Khandelwal <tkhandelwal32@gmail.com> wrote:

> Copy SB_POSIXACL from the parent superblock, as is already done for the
> other superblock fields inherited from it. It cannot be set in
> fuse_sb_defaults(), because fuse_fill_super_common() checks whether the
> flag was passed at mount time to decide fc->dont_mask before setting it.

Applied, thanks.

Miklos
