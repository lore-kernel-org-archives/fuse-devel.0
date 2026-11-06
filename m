Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793964844;
	b=rox/2QOlO0Tz/Fph9XjD/v3Dbum8Asg7+ASgYa7rs7KiDvOdaX+N+qQ3as62ghJGw17Q
	 drbewfOKmJTkW+st+Ol7ROM+Xrtgx9a2JBB4rpepqtJemivaK4d/NraUFEp/jWFb77/mt
	 Vys8DtJk8P8Gg1FhbRh+lXuKJOuvsSC3kzejHL1YUwqbb8GljKdPjL5a9kVHdxCbACniY
	 Hy+Nt/55sMCQsMDG6oPwZcsdgJcFo5XqQbHNPblYeeyEhVvXpiAf0z2cL9A0bzq07iHio
	 +suswrqBxJl80DQb5U6Qj7ImwpCDK6YG3zemCe9MZhMi5De1GeAR3eSKaadLsNC/FkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yEmGMlO442/bmobtd8MSxOkmFHXwe6d62JQ5dsryEAY=;
	b=wZB3z6WQU7nzwiOfVV/vaTYaL5FFNYX3AXC2eEKE+3N4rF27nnzhraDKAGWbVink091G
	 xx1m8/AQ45xtsJ81pGk9L37zX2WUp3u3eSpqFg4k8XTLYmY3cwEd+Qg7eUwXwk0F/FxIV
	 DCDwQUjoyBe9H83Xe+BsN2R81D16+WruIe87jXb2vwLlreSJue96u02FbciIxOeMgRaeJ
	 1iaCH0SMP2IMeInEt6EJF/WJ9ezxrxKrpPyZs2NlneubihyCdzRJZOj3Sbsu6R/8w2w3l
	 ld6MZj67RC5zyKLqmMsbKsYv/UJTAIYq280OG8gyyYIYyRLeOs6uCojJ2hkURDh9zpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=Q7jQhNpg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABFF606D829
	for <fuse-devel@lists.linux.dev>; Fri,  6 Nov 2026 11:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CABFF606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=Q7jQhNpg
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5364648ae07so4466601cf.1
        for <fuse-devel@lists.linux.dev>; Fri, 06 Nov 2026 03:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793964841; cv=none;
        d=google.com; s=arc-20260327;
        b=btuY0Rn79rLPQm1KLUWuD/5PG9TMYPMUYwM9EPHVbiGEDyuKzGtmvkPf5DfijtJlUf
         0Fpp4h7fZd26Y/OlQB+J5HfLWtduxKyKIwd6Yl6hu7GLDsnxceK51nodAyZwEvmIHbyk
         BodWVarZucPqxeEBaJR2UvFz4m1sIx6qVbewYciR1i1FLsdhHg/Nk2X4Epfap9lMpKrV
         pWd6E/+2leQKQbab937qc61hbWECxWoCf7AmiTqHr2CqX8Y3wz3a/saRMWH7sxeb4UUe
         tv+wrcEtOQ8PPT6MqAL1s+hdJRSZOVyteUsv0RIX2ZAdJ94gp/j4NmrjiM4BxXxfWrAJ
         2aEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yEmGMlO442/bmobtd8MSxOkmFHXwe6d62JQ5dsryEAY=;
        fh=nCLsICmQHnD0OvG/Qfbqu7syBihd+v4vbrSrwgfqJLU=;
        b=F5pokUconz19vNBTxZY50LcFd9ceaau8+V9040jE3Qj4a6EJsdfl4pGgXpjQkN0PKJ
         HNayoGShszzqWfU++x6Ei7S4fQUJaMoWjoC689u1HtjQZAm09K+z8eE6ZkyCGnN4uRCd
         BnI26DNo/v53iyKBMnb9jDgFxj7G25DRckkJ9REWNOsBE69kpZKNl0S2j1Lb86hGl+QW
         4kcmEq7Wv8+dstbQpbIKGXMlqmtuWH5/xJ+fjR5lWtGJziC4ZC/pkU/bsbbKiPsvlQ+X
         9Nvr5vtdHKtEc96nTaQd/ItbJfPsOnVPARO2lBtGvF9xjxIeEvqA5qFEQ8u71QkgO37c
         Az+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1793964841; x=1794569641; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yEmGMlO442/bmobtd8MSxOkmFHXwe6d62JQ5dsryEAY=;
        b=Q7jQhNpg5Y6e5XDX+DOtz/9g9p6BqPfcEB1RJzAbEy47ZU8q0aif+/WBpSuQzWOmFm
         Fxble9PgLJ2hKCBeDvwBssOZcxxktWV0qsolCCkdA50TZyBstM0RQtJY795zOW1iXHaX
         2ypNBL1H5+HZy8hy3rJK0uRZI5teNv3lC/n60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964841; x=1794569641;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yEmGMlO442/bmobtd8MSxOkmFHXwe6d62JQ5dsryEAY=;
        b=2kn8IGjCnUlzqm+HYn33gDsoBhmVbZ8lU6rfJBul4bqXNzkPgHbuSmmx6IT4Bd6oHI
         8hpqALMT+KcwQAQtjhcU076qIUorlZRN0pqRv5tojClZkTjpEM1VdMp6EpSIWBxzpAWh
         fzmOh3CYIalZh3Okf4hmcLroezv8UcvBhzU9nia5i+rqJicWdkAZxa/JsiqBc+AQW9Z0
         3Ixni2rirEwW5fEPvjFB83sMBmRQuesxeTyZpN+OjYLhXfCZJJotdDF3k8yJI1D7O7v/
         TwiGfuZGgiCC66Afze17BOnL4moR+iMnZMX0t5q1nGFRJMLu/PDgSo0X0u9tdTiQj1mJ
         klYw==
X-Forwarded-Encrypted: i=1; AKwUvBxuR3ndHL9OGn1B2uN7+eMn4U5wypmyON7rJRp3eTTbBlaAM9uGmtYej/3Wtvz4G5KAA6Fge2C27016@lists.linux.dev
X-Gm-Message-State: APuU4Z/Lh97B3My6nnDhIuCN5qs2RrxPcyzvbrfWZnsoi3DnU+p6ywOi
	63O/ZDK2Yq9bUWEmIgDfsPU8XHzpZukqk6SIS4II40omQfPOUB7k1Xsvm3UL2zJB66u1ONbkQwv
	WUFxz7P6nDB5bF0MDhIJ6iFsZKQhUByrDWA4sqN5Naw==
X-Gm-Gg: AYBFou18Mk4ottjmPpHORJoRb/Ta1OqI4yfXKPTEAc81KsHrlInR3JtfOoo0Up3Aj0E
	RYAihkz0B0BtU2bhupIICI7TVFhdLsI/k0Fc0m+uoGPs9surivS72I+TaNjhftlNd3m67VBTkTE
	G/gi8hzunkrRVQ9cVx/crzS3g/5oDtVCspIZTlnTHEq7K9PlIxfZ4hAoKKLo7nwpWV2R97zbZK5
	mkYVaaO/UilRdfGEJePb/7cg6xnnyqqZbXgw1Gdpx3BKFDE3mi/libkTUR4Kg79IErOVSFZv1km
	jOZbP/4psG1IF8hIzpSwq9mXisahSR8CVm6uVD4VOo7lakoYTXEb5fCM424a7twEmxibDx2l4D9
	mCN72Pnz6QWWnXOOuv33hEfoRCddPUMIvx5y3YF8Y6bGawz+ZsBkBIIcoaobhDFCJBb7oFvk=
X-Received: by 2002:ac8:5dcc:0:b0:536:71f5:5361 with SMTP id
 d75a77b69052e-54e0feea19amr34246971cf.11.1793964841597; Fri, 06 Nov 2026
 03:34:01 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019125329.17932-1-luis@igalia.com>
In-Reply-To: <20261019125329.17932-1-luis@igalia.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 6 Nov 2026 12:33:50 +0100
X-Gm-Features: AclHuK-A7gQ6M-Qg-M-xE8M7BDOMgO2XZ1t3Ke_Qh_brPD2YLJrfyo7d4Y5WNzw
Message-ID: <CAJfpegsXsZS7CaA-=kAB4_oiyPWeZ8ULpG+kxBNHczM-XHbqng@mail.gmail.com>
Subject: Re: [PATCH] fuse: fix 'inval_wq' parameter setting during module initialisation
To: Luis Henriques <luis@igalia.com>
Cc: mszeredi@redhat.com, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Matt Harvey <mharvey@jumptrading.com>, 
	kernel-dev@igalia.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 14:52, Luis Henriques <luis@igalia.com> wrote:

> @@ -62,11 +61,14 @@ static int inval_wq_set(const char *val, const struct kernel_param *kp)
>
>         *((unsigned int *)kp->arg) = num;
>
> -       if (num && !old)
> -               schedule_delayed_work(&dentry_tree_work,
> -                                     secs_to_jiffies(num));
> -       else if (!num && old)
> -               cancel_delayed_work_sync(&dentry_tree_work);
> +       /* Only start/stop workqueue if we're past module initialisation */
> +       if (!module_is_coming(kp->mod)) {

See sashiko review:

- kp->mod might be NULL which will Oops module_is_coming()

- it's still racy against fuse_dentry_tree_init

My question is: does the inval_wq_set() even need to work before the
module is initialized?  Can't it just return an error and it wouldn't
need to deal with the race.

Thanks,
Miklos
