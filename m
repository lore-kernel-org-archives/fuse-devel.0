Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02454B2CC8
	for <fuse-devel@lists.linux.dev>; Fri, 25 Sep 2026 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348046; cv=pass; b=m0TYK+ZDnxAP8WTxtL5dh7luUGWB7RmVe5upxyGgNFmNXoo+ib6sb1hvQKh6569Zi1AKBdXW9FdF3xqJR9cWKgdiiiQOdJb02NQ8IFvvhsmzKyXIMplQWn6SnvDH2rCmPGWMV6HXzKhFwu7+WDzIBf79ACkOXsSGwLyEtlIPIY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348046; c=relaxed/simple;
	bh=yHL0CAdeerLFe5cy4qGAUOLlVrYC7JfQrJGUa79zxjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adWUHv+Wc+uLb8AzRPTMjC4AjqEsgnp7UqEYp7TZJbEJqTzJsHeEvhT+Y7eRmb9poWa1QBPe/pU79Vp1mpA6VTzAqScG53MobErFoBMCvvslc5aW8ZWSJ2JZxiceO0bAc38KbaF4FVGBseniUyZhv1t2uVxcCBj4uZpFG0fo4nM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=oIKEQwXm; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="oIKEQwXm"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb767cc97so11130661cf.3
        for <fuse-devel@lists.linux.dev>; Fri, 25 Sep 2026 07:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790348030; cv=none;
        d=google.com; s=arc-20260327;
        b=K4Pl62pdo+d11xzMqJ15BdhZKzt8ZWx79id87CaL0nTrgkult4vyq0yxFgCI/5kdL1
         XzpFfQbAkEts5X4QyfKCrSiFBsdc3WJFrQ9bPXsPuvdEPMUV9zsDI1aEK79zIEoXaA09
         t+k+bte7hysm5c4gA5HXwnsGaf/PykIf3rHZ2g9kX8FjRhB1v6qoZGWmv5v7w5ubewmu
         FnixN5w+a2KBnuzrZdY3hQTLF9FXcrkdFOqDWe0Bm4UwivBoY9WPc0XsjndygI2xs17w
         8tAg/qAvyuVRPEUcAvbS2vbLA1SHHbXYhYJor8ZEZ2SoEZ6JsXqWB8PZSt2hQOpExBIX
         PODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yHL0CAdeerLFe5cy4qGAUOLlVrYC7JfQrJGUa79zxjE=;
        fh=J4on75Op76QO48P1568yO5XfmEXPQAxGPUNAZmPn/UQ=;
        b=Rf5G2TVlnIWrkaP+UR0FRdIKGuK3lM107Ta5e+U4+Wy/sCqw7TFMluLwYwtlULsZ2X
         gm3ac9WXRsnfXEJwdV2x9CvY+nb+MM7p0sJGd3LMJrl5q9rpYMdszISpkcN/JkGv8AIO
         pgs+3IrwtQr3WSICkIbUG3rfIpq6NvQAWnxkE34BA8uUjhMGBBagct0wZOlmQPFx8nhJ
         IenEmIGC69QS91ZeZTBSrU8dHkyBqk0GSG6qwuuVG19869m5NFWmURt5rV6NNUjjz4fx
         RZ9wVNwY4oTtC01bkB4AkHjFHTiwzBxwUuLJraVYN4vgSxJ+W77IY2j70M++hBt3GlTt
         DedQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1790348030; x=1790952830; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHL0CAdeerLFe5cy4qGAUOLlVrYC7JfQrJGUa79zxjE=;
        b=oIKEQwXmB0T7ynyF/wT6Yj7NYnex3K268P7cOHGJ6UQiC2n2Y36gWRTrwi2LC+2qme
         q4J9egjKp9xKRQqxFodVfGkGCp3HNHxIF60DSWnxVSHXEZnKPZPdObL5+Wvo3YLCVLgc
         c6g1EfvNDws4hJdlBHrSFKBs9oGoFAsRfG0z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348030; x=1790952830;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yHL0CAdeerLFe5cy4qGAUOLlVrYC7JfQrJGUa79zxjE=;
        b=fQtkly2FpTZDE86i73H/dWgn8EcY0SM6i4QvpXFZSXKm+akE9+t8cpEdmSyfh4oT3L
         5IKb5Vz+Pv/BAyWX20Gb4/e2/qD3tUOj+8mLJ59cCjX+xriOkA822brwBG1neJHHrGlU
         1MOAREf66qQTvfzoaso1w2mh2N8uGIadpKMY5bGRjP6tH4iLZgHFsW9DncMZcEESgJQq
         jGOu/xIhz+hiKi9gsCEwyIJU9tVeCipSKDxsU5DEWH6TlLdLAnS3unS2bNxulrNekk/Q
         8baNK1PSwjVCHWMaJbNpJIZLjFBGfFzAjztlYQtCsYRGHUVYXaDh7gvz+Qo0Jo9/CCWy
         c/Mg==
X-Gm-Message-State: AFuF++ngSapiwXSyBbKBIomKUfg9vpLPOzOa5yaz9ZAKNncthYzCkWmh
	+95B1fzIe9Tm5m/Zi5l8zUZrWwrxOn8HkLIdD24WZbWI5DqfF6egVeOPt8Rk3Qi12+TWjiOX1cV
	Zc9wnYoqayo8xNRknxZXUio+2VtOXnwabRrWxZMLnBg==
X-Gm-Gg: AYBFou32P1rHKTzGZ01U575Zp+nxGjp5y4PDEqgPGsEhGCoJBD47wbM3qVGs34ITJ/b
	3RhsplH/dZ/Zv8BaFaAdrNTK6Q2Xtj55M+ZDfWXIupTuC2fh8e/+RqrQw24/WHCK9vXRNo5HUa0
	w0ZzVhDNd+BmR9MhoKq/hymKlXzWqvbhCFkKdITVY3igmCj5o6fUHtb5zX3Qud/EGW719KUdTkZ
	ksvCKS5zgqI/pYxJ1M6JFFmozCnDf8rlwHjVBNM2KwJOABaumOvF0qT4bAszni/mjcAYVmBmWW+
	yiEWGsbNAEdHZ2Y2O6UJD9lcbjoIWwXrrG0f9cnkm363cj71CrzJUHRpgpA7UEKqDul/itOIMaE
	PVNniGuJkwg==
X-Received: by 2002:ac8:58c6:0:b0:530:db0e:e098 with SMTP id
 d75a77b69052e-5330b5d9c9emr46988551cf.23.1790348030249; Fri, 25 Sep 2026
 07:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916184424.2531648-1-joannelkoong@gmail.com>
In-Reply-To: <20260916184424.2531648-1-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 25 Sep 2026 16:53:38 +0200
X-Gm-Features: AclHuK_C5JWjHh0trNJfDATUnUcWCyazzlPAuW0_HkYHNW4FEVG99fOPS6Ut_xI
Message-ID: <CAJfpegu0SXBg29sKQqz2fYbY77OdTba=S9X2h4U+_aKfPZxMmA@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: enable large folios
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, Horst Birthelmer <hbirthelmer@ddn.com>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 20:44, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> Enable large folios, capping the max order at the largest request fuse
> can issue, so a folio always fits within a single request. The order
> range minimum is 0, so under memory pressure the allocator falls back to
> smaller folios.

Applied with all prep patches.

Thanks,
Miklos
