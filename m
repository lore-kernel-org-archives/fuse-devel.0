Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC447378D78
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 12:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776341571; cv=pass; b=WRPisBzkVUGMUgJzFbIB2nDJtLAeQxhrRoZVCILLx2WbR2LAQxh9w3akcPOJgZ+geSuUuq4JN+fBbGce7eWvI2UZ7tJ2i1SAc6dNUainn3176PNYfBBQGfCtEDJctUcpQyTruyRGZqbnyPCsH6a51+hD5tM/yfZTZ7V6sTDT6yY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776341571; c=relaxed/simple;
	bh=xs4hGlZiJqAV9QCGrkSslLomiSfE5gcr4xqzLhglwS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPQKX0fvy3wVoYqzMtXP5STvviC2fqTGziEuabrimoMZ0M4iovD/+AxEP9R7v2jp7fkMHm7Ll36QTw4tC8MHksaZBno1AgBjnZB865xujL/Qd3LNB43SwJ3lQPYsvoS3b8ll5kM3lAoEumUP2fiRopdl2e2AILOYDvpwR9kohhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=RBHYGNBQ; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="RBHYGNBQ"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8a1e1817db6so67900106d6.2
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 05:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776341569; cv=none;
        d=google.com; s=arc-20240605;
        b=fwo2JtPpX3BtLaefdBvv3IQDVlIozjjiEN8jhQvW3CExuo7Tcvc+H+7hoTi0Tk/n6M
         1K4ysAIA6qrHzcCQnBdv2S3fPsvdUnHXXCyp0e9F36H3ijUKPtjE6Gzkh0PAGB3L0WL3
         Em4yOHPPdJbL21TPoyGAGb67SNlxOLkpZ02HQqK6fYxJWQEPsm6WDITgpAeD5pVR1KGe
         oODLdjsWvYs+6pF22K++frzPI9Zksh/Iw6KCs1xoO4QsLVX60ElkEaQQbWVM811PBgy0
         bOsuof1a3/r5+rjj1/HPCeElY3WMaCWmajNn+AauWEpsEIQ0KLn2FauH1t7WPfewdqHs
         8i0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xs4hGlZiJqAV9QCGrkSslLomiSfE5gcr4xqzLhglwS4=;
        fh=K8VSAZnP84uggqcEhJVZejAZlrVFevhE7gB4GfCakUo=;
        b=CpiKvD9kVAhYP+FAK975MY/OYWwCdatjW95dFYtaAxCWg2lgozlRzgWEC4k1bne7Rn
         bVfdLrjvz2Wa+Y1MBCLdI9vDOLQCPONO807k/m0Zn/ViIl+JE7dkLh1b304QNYFgTroj
         Zpmg+Di20H/DxiPNKe7aA48sKrdILAXYonM2NuHUET0DIAwCvsuHltpqo+iYVIoj03XU
         3miR4bdzOcvNrQhcT7rajarVomPQ+sP2mzxojAFf4kvkaPmVT7jw0RVqMtiKGVc4mSTH
         lBZwLMNpq7YDManbiNRoZ645Ue2449R7LQd20a6eDevzmpQEdNl71NlK4dESuC5QlNx/
         Eaiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1776341569; x=1776946369; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xs4hGlZiJqAV9QCGrkSslLomiSfE5gcr4xqzLhglwS4=;
        b=RBHYGNBQ3b8zUUS0kgHrvok9buoJnujqpxapVQjFoEMMXu/NrE1cXl0uSmcEIzc5EE
         Wqb7ZHAwBN1jS4RWlz05yuNX5+EEfAkSr33ujCcDAIDCwE8JmQtcj3xOWQ9JcOj76AbL
         lJui8+jl5KKO6So6a/KY8OTK5BnoO2ZGzb82g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776341569; x=1776946369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xs4hGlZiJqAV9QCGrkSslLomiSfE5gcr4xqzLhglwS4=;
        b=U22eTfCVxSIsqgpv+9CDntO/EsoGUvXN1CzncGIvl8zuvIAeqdWVrcNz1v2IQuOyb7
         3uzvtGJKbsVq0s2VQ7GUSB7AgMDduyKP/ZMMI2yj1En5Hucr9bMc96MtxBD3B04EzLrI
         /t0MiUXLfIxknG0Vziv/RYFKoje42cBCIoZhIG4qxbUH2D4QRcmSpW5xDnP8GBgZJB+o
         jEr8pcKLaS8Pyg7/xfmR3O+dKONVo8gf+cM/Ail9F0QVmJFeH864Jeh3ZnIdGaaoSgMC
         7Z90QqiF52QIUFYX9pdqMmxnD1kX+Ktt1izQbXhIjgHaS/jIoZ+VjOasNG6CUIqAotg1
         Xctg==
X-Forwarded-Encrypted: i=1; AFNElJ8zC4SfG0qB6+6Usrthr10eFadlYU5WIHVb84im4eArOqd0baTs/R7ibaN+MMnCNUOVMlWyp2onc8qN@lists.linux.dev
X-Gm-Message-State: AOJu0YwW6PclD9ugxwPuGoSJafNIF+i/M0Gk43Hs+PXRtMV92k+OWKyk
	JfjWFA+3nZW7qiULuLSdFoOqoISVNaWzomwwMrmJ/IcwiMrnO1ASnDzqkBr0RS3DXf1VcQp6lwk
	YnW8Vall/d9NnISppy1pmhjPOh+DFkCQ8OgoQo62Saw==
X-Gm-Gg: AeBDiet531hR4AHc612QLvOAPCJYYNKNZJruFRzEx7oxms0HQt6RcwRPgrwZbSfB33x
	0GGUkO7xc2koQ2S91tv9Ie/lWMphNjc8y6dDK/PfKfqp9epAvtftwEJOeaZeHSyAeUMNCwmvQJ9
	bMno3gDxSXxfSyBKW5Ra97YZApwxz7e9mTqHvJ3Mism39gHzONLa4JrZaIrKRGAjecHhJt+k+sH
	cvEm4/IkLloYTwDJPkMOqjkGK/NTKpGzrcv1sBoh8rJtrjBqQxXUbmqAt9PvGPCpdqhTAtU0jNh
	1N+tF5KVVX5H5j/zGSBnImnIY+LQMl7hVxB1
X-Received: by 2002:ad4:5e85:0:b0:8ac:bb62:fe5b with SMTP id
 6a1803df08f44-8acbb630feemr194285446d6.12.1776341569011; Thu, 16 Apr 2026
 05:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <898a4e10-6193-4671-b3b1-7c7bc562a671@fmap.me> <CAOQ4uxjoS-PvnZ2poh0bx0C6ocTYwuEpfV0q5md15SjS620OMg@mail.gmail.com>
In-Reply-To: <CAOQ4uxjoS-PvnZ2poh0bx0C6ocTYwuEpfV0q5md15SjS620OMg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 16 Apr 2026 14:12:37 +0200
X-Gm-Features: AQROBzBX4a19crGk_XkETxKLhmewGXqK0FtKuy_vUEQL4x7MLk1p9L_bODNm4ek
Message-ID: <CAJfpegvxF7F+XKFKokSH4eOgCA0V2RNm6B54MS9nr9wG=U66OA@mail.gmail.com>
Subject: Re: [fuse-devel] Debugging a stale kernel cache during file growth
To: Matthew Wilcox <willy@infradead.org>
Cc: Nikolay Amiantov <ab@fmap.me>, fuse-devel@lists.sourceforge.net, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	fuse-devel@lists.linux.dev, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Apr 2026 at 09:24, Amir Goldstein <amir73il@gmail.com> wrote:

> > I've recently encountered a weird issue with JuiceFS [1], a network FS
> > which uses FUSE. tl;dr: when a file was being slowly appended, a reader
> > of the same file on another host would periodically read a block of zero
> > bytes instead of the actual data.

Thanks for the report.

I wonder if we could clear PG_uptodate on the page which had its zero
bytes exposed by the i_size increase?

Willy?

Thanks,
Miklos
