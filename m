Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEDE521228
	for <fuse-devel@lists.linux.dev>; Thu, 15 Oct 2026 13:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071977; cv=pass; b=Rd7cgMH77WzYTjoGULGjvAI9f40b5N2ZVA7Vsw776hnUzWVXmyHxRFJfnJddQSjVUw3ZSJh0kqZjc7gbwGlvI4UoxizUWNejUOwMtWlLR8ey190lm+vNrhkBqG56W8v70eCY1fzzk9n5d8c31k9I/oggc/ULcDfwLL0xLtEKXGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071977; c=relaxed/simple;
	bh=7+NpiJdMwvIGDZde8K+YQfxuPLMgAy7KNWXIiEPPOOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLGvEwEPXxJAVQzCnSkVJtgsm3xHKAoEucYGKePQcA+QUClGuQChGwzTooltpINOKVPZCIwjArx5bLOFSjKy/VCrPtre5afSb+MxQ5YpexKEy7e758XL0iXKY0YvLGEwk5rUU2oZy88FYwdpPD1JzzZzJnHW4EKGhluXElEQxoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=WdeZzi7P; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="WdeZzi7P"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533972e0cccso59994671cf.0
        for <fuse-devel@lists.linux.dev>; Thu, 15 Oct 2026 06:46:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792071975; cv=none;
        d=google.com; s=arc-20260327;
        b=JWDJ9EYpgwi7NOlrBYsXbcdmU+rwxwNQ+UkY5Q/M63VeDHO6I+OGaMzOYT7ei7sJtt
         f7b/SlFVZch3g1+xhdXeqrAHgVkSqHMAtOZKlfc8tt7HEZ98mF1t5BNKZwZ5jg7aPNMH
         qUTZwaHiGkqqtqipHNaHko9+R4HnLCTE3RRoeSxSlW0V/J8CqjrkpImIC8guBaPp6Ts1
         dfUni3qcg9n1VRXDNkzNPQQuxk8v+z8R6CRjXHxW3h4lwaa6UX7wLe+Bb3r1rONMbfBL
         u5WY9yyqWWtotZMLpRTEEPsKCIA0qtcGzlwPOGnkum33dLReTinpz5TTz0wUQassJzWk
         AyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7+NpiJdMwvIGDZde8K+YQfxuPLMgAy7KNWXIiEPPOOk=;
        fh=A9WmpwciepBvucd62V62w5d1o5uSOfIwkEXBDZrDL68=;
        b=kahgjHyW7wwa6NxV4o3tKGc6MPx09h2J9da7XjwrTjOEFjuprJTXa7J2g6y2k5uKR7
         7WY1boP/gu8q+mLFaBjNPdr88OH6WO1p1KCYZnHS/VLyR+pcfDf1Uy8voUIUWD3/X7EW
         pNoEF3Dq1URBqjNTPyP5gxx79ubjIxa6v2XwXF0YGFgHmY6V89A3f7sMIyfLtEEfM2Iu
         Zk32I/Adc6Uypgyn6IQ8uzoymbqPx9syouR4xKaESwzgmMLpgCJ1raU8jy/OVjwrPXK7
         D+/55My26Ln7udYdd2Pr9eXWqsPvE80HmXzY/R0CAhLiEhU34Afq77VyrK1Ah5BzU9Kj
         fb5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792071975; x=1792676775; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+NpiJdMwvIGDZde8K+YQfxuPLMgAy7KNWXIiEPPOOk=;
        b=WdeZzi7PfEr3ZCr5VTe8R1p3KMwoWadAemEMA87NUgyVbvBL5MLYT2F14DUMjYL8WL
         6aYXaPSJwjqAGRERQHj5XNVudFwBsg+cZfxqJEX/YBd7jNFdpctJPpZeA8ZnHFLMSE3m
         m6aDavrZX31j8zI75wjrTKQx9JpKnGJqQ6NjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071975; x=1792676775;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7+NpiJdMwvIGDZde8K+YQfxuPLMgAy7KNWXIiEPPOOk=;
        b=M98Oqtb1PfTtLeEzByGwg0WqU0711xtwetEFt7gv6+aQjffQpCTY7XEE1ccG3Z9Dls
         TYhus75LCg6F55cdvIwOOI2ULehzqXfo6RrNi3JwjtbEYHSbdKHXhWmYL5IajShUsvmF
         3DZBWcYACVi2qR4Z/gpApIwvWrPE7qhySDQ+hgUUcM2v2iYLn/ZGmJXowiaK3ycZ/ha5
         1Nr9mMrhnU0W+NHcxWMys0hI8AbIEtPGAGx52/0O8LsgYs29voYVt/2hgqcM6z8KhTS+
         0ipWmJ7HF8dIBZXecmeqEqf4FIWv4JwBf3TSBbDSh2LSMojkUgu3rP1bYS/DAdpv1dEK
         Hwkg==
X-Forwarded-Encrypted: i=1; AKwUvBynFTx2BLd+RAhG5WwWVOoUzlBE0OdcdV7CfsG+8fYfkE2LVNWs178iwZQx6PnutmHU+VAf+fjXQ+EQ@lists.linux.dev
X-Gm-Message-State: AFq9FYKeq7Je/VrgyU7hDr6B48k2rmnDmRnnQ8CoLCVAIp3CCU2OwUN3
	HMNqXai+7qxVfBB1g9KQkx5iWEdUEbicLAeUGF1GeIVAuiKhReor6a7evjQicfBqsE6qPZN+kTx
	MEuJDOH27lIrWjgk2a9mYobAavN6oWo6dVh7IGqDrBw==
X-Gm-Gg: AYBFou2GVUGFdJM7Q2XH81tsuCK/JKMDOOHpA2sfY9ncU66uvMbChRiEiASAK99hQiw
	0mhCdyxrXfqg3IBr16q0krsBnhFkkaK0SY38KZDhWpX4EwAuputaAVz8sDfVlTSbM5wB7zIh3RM
	fQP2pe1UoSEE0H35k6vtt4whyz13fA8unOKx6AB68O+jwDq/MvHTiBIODdMIvKqgU8BQgrqZHxO
	W8RhLqOvNZZuyZ/M55fEjGuO+xEhoTNJ1jS0o2ROwXxsb06ub2K/0yEoa/01EZ3vT+kQjqqI6Zq
	3FzQnouNeQAHNIMith3TZrlpMu1iqJbtbug05la/dq6uP0eWjEIesC+lo1RaNWlwR0XWj+0Es+D
	Z2iFVwr0=
X-Received: by 2002:a05:622a:98c:b0:533:9a5c:ca0f with SMTP id
 d75a77b69052e-5359f49969bmr307051941cf.7.1792071974646; Thu, 15 Oct 2026
 06:46:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
In-Reply-To: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 15 Oct 2026 15:46:03 +0200
X-Gm-Features: AclHuK99YqmEhkTyFYYadsda_EyTtGyDCSTbIpPdLvNyxG-_V0VYO6gSpi7DIyY
Message-ID: <CAJfpegu_dyO4Xczb4F6d1uMT+r3R+j6UVnYfV4tTaJ8a6DYrrA@mail.gmail.com>
Subject: Re: [PATCH 0/2] fuse: convert the readdir cache to use folios
To: Tal Zussman <tz2294@columbia.edu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Sept 2026 at 01:42, Tal Zussman <tz2294@columbia.edu> wrote:
>
> Convert the readdir cache lookups in fs/fuse/readdir.c to folios. This
> removes the last caller of find_get_page_flags() and one of the last
> callers of find_lock_page().

Applied, thanks.

Miklos
