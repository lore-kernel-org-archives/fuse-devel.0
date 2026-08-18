Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7562F38D3F2
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787038431; cv=pass; b=t+8CGkkVmudRpz9vWohYGOIq1R+bzZsocOssBtFDiKpoXQwmku/PkwZd+hbQcfS5YCIu5u9Zxd4kF8EYXaljeQKFik971mV8EeQNJxX0y0tz9DLVMmXlcdYN34NNOpNSx10cizGvecfFUr1Y3AXM2Z25UWHLziZkUuKV3tYnVf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787038431; c=relaxed/simple;
	bh=mKNO5uns5cr5MbP8cJom1LkhTdyHNmNZ6pPGnq6nH7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXzjWHPbBb4M0ezh2diatLuL9gSlc1aLSKJpJLowZUZQIUcWJh+CNSf/VXkc1B7Jm3DxdDCwrWV9a1+Bmu4uvL5qmiGhzJNm0XBSzPvcK2CGzMkN8s6Ien1C3R6XgIj/9wHZ7/FgOBYxwDADq1Z87TqIisGlklgQfRiUCCAttL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=EVAKmhAa; arc=pass smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="EVAKmhAa"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92f03daaa97so243847685a.2
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 00:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787038427; cv=none;
        d=google.com; s=arc-20260327;
        b=i/YfURKM37yHkFuHx7t28iA4qLi/eHKL+6io32sSs+nHiqdJPTKZ5ebchpyZrm0wXx
         grzzsx2eIr49LKwbZiakUCqTsYtdnhopKgf/ZSqnQuZAL31StWjk0fHlAj3PHNQZfJYI
         00slryl8G06YIpMB6+jTbXHeeuWVZdPXgQC6IvruLtfBDsWEL2uQylw6hPC9zpIX3tPI
         +A9t9McGOcH1Nl/0UdVe98nxhLgkFN1SeuswfaO4Xa8QnIo8CY0t/3/xu/1AgxpEtz5w
         zdWqaIqdhQM4Vz42a/nQwu1O+65fdgRoO2yarKR6Kbtz6TfQYgCnhUce9FPI9GKuuKoy
         o4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=23pp+2untshEdvFcYO1a+Ff6qkMCJDJWfvL37J4f4Gg=;
        fh=o1jogKNzfziq9ahFEttIVBoB766YNFmGqQjy4yYI1Eg=;
        b=Db0b+TI+o/qCgzLeAajB9ej0ArvKnqj11jvkMKjWO9wLTFeGdhRcYjmm7x390VCLlZ
         rVhsp4RIlGVg3ulEHF/l9dvB7UfqP3rQkyuft4ed7lCQp00KkDPiiBPHawGUPst0ENh/
         3kSavwgRTd9L28jvdgW75++4psaHqAmK7Uqxh7jp26vkYaiSZjCfzI+NFqN6SKGjv3PN
         hx424UT6dgDHbcHyWt5/Xk8Y3JuDQoQlp/2IL15kVqIyrB1jSJcLkmNlgOT6uL+XZxlu
         mxeemIhZzz667KytytOgpegPFzwRojj8fWdTStNKqPbNke2vSbzOTPswDNpXzhKqTWsX
         Agrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787038427; x=1787643227; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=23pp+2untshEdvFcYO1a+Ff6qkMCJDJWfvL37J4f4Gg=;
        b=EVAKmhAaqZ3lUKZi27COac/h2SkNNHlHbNsZ7hq4OLywM5hEsbR6Ib8JXf6WtYit3x
         A+ybd/BHqEGPaiz8eBSv95puRBominhZ25fLR9MOFn8jQiuemEBmTcoxsyd1tJ96vZhf
         KYqJrwC+eBzagCeH7VIjoSQASoDSx1IXa6t/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787038427; x=1787643227;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=23pp+2untshEdvFcYO1a+Ff6qkMCJDJWfvL37J4f4Gg=;
        b=oU0WDZ6E7Ck3nlxrO2uGSgdz22sPS2Ji3eLsu7UnWxmH4wYwhs6Dm9uNk9442z2Ohm
         2ajs2m+Tq/4s0vE2xkcubSYZHWbznVJb0fgeW1xzzEU9PNpJjZlEKTAGUnTjqJVIcPx+
         1XPWeuivMbMhWi46bsZlvMkI7SQm8c9fKHEDrwM0EA+kmR361QDHrBE3U+KnSXmdu8wc
         XHkn2hzzPgP1zk1MIiPgeBmOq5lLOcbZSMbBuJV/Mtdf/FKjd6vdD4U58MN4HLKVihmz
         DG4FQgSwbY6JVpPNxdq9/Ba+Dl30ldbkfgk3I2pAioeVoEsTPwh+XqPjm8/hlDW7qMXt
         2Kog==
X-Gm-Message-State: AOJu0YyCsw3758lrY2dyDZNj5bU333vf1abX50ZOTxTG+UgDUM0sA+p/
	6Bx1L9/35KBk+qWVCSoqOwVHUoSogIAPbdxx018UECwwAWyf55821GoxSlCT3yLZ5C/2tN4Ntem
	eAXO5ceF/BkKbFb0dHXs5MctDnQfDrrMZkKAez0347A==
X-Gm-Gg: AR+sD13klfJO18nLVmuWmo8oyjn2C/edMBD4Lx9k/aYvNHHCWNPhe5nKx3UQLt1lTcE
	KMeJN/HCqp++73ZIFmYr5irlMDbd4FcTys0kwePKRA8lGv6Q+76BKOEsCnh2vUPmAze0vpR/WDC
	o5kWFZ6vyJlaQK2rUol7PpJz4GcOkNmeLmbFcx4CUiz151/0tuq+ZmgyhTPyAx+qtsDsf5Rt5Zz
	UewlN3ahhmISPT93NKoKNLzVm5GzvpvDFyj2vs98AYYql2Yt5xPsgZMVJM+gBjUz/LDb1cgpDHO
	w9PuS5OgYewEdFjseO4QFbLHwVcoy65qM6RzBDxj9z+cbh4St3CETy5qJkk+xpbM8dg5CEA+6CP
	n
X-Received: by 2002:a05:620a:271b:b0:936:dc16:206b with SMTP id
 af79cd13be357-936dc1620c8mr2881763985a.26.1787038427231; Tue, 18 Aug 2026
 00:33:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814134015.618488-1-libaokun@linux.alibaba.com>
In-Reply-To: <20260814134015.618488-1-libaokun@linux.alibaba.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Aug 2026 09:33:35 +0200
X-Gm-Features: AcwNN1VmZ7FJUacjPq2eYj75UI5ip2KFg-NgUAA1tOeLQqY9VC0g5LvYqVXKsdQ
Message-ID: <CAJfpegvKQrOGAFCDidFeELrQb08sebJVo=WHXB5SoWAwjodSKA@mail.gmail.com>
Subject: Re: [PATCH] cuse: wait for pending RCU callbacks on module exit
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk, 
	jefflexu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Aug 2026 at 15:40, Baokun Li <libaokun@linux.alibaba.com> wrote:
>
> Since commit 053fc4f755ad ("fuse: fix UAF in rcu pathwalks"),
> fuse_conn_put() frees the fuse_conn through call_rcu() rather than
> synchronously.  For cuse, fc->release is cuse_fc_release(), which
> lives in the cuse module.  If the module is removed before the RCU
> grace period ends, the callback jumps into freed module memory:

free_module() calls synchronize_rcu(), so this should not be an issue.

Thanks,
Miklos
