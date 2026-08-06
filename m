Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FBB41D4D9
	for <fuse-devel@lists.linux.dev>; Thu,  6 Aug 2026 21:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786050762; cv=pass; b=ugOiESXfXb+Fb1teU5zl3c/qFKuJ0HTJYQV59uABAyLbhBHmHozPXGvSxCIeqG1C4LyhiWTQb8mwf9hFuLsy6jMSLWZrttYvTWpq7msyicDh697TJGkF3UzhkivHY+CDYtsPhYRTfdKGono+ict21w3KaSoP/LwNNcApjm0iqe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786050762; c=relaxed/simple;
	bh=O2nXCqD4o4f5F4Q2WJbaQxzYFvLIe2CbH7K3L5QM6zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YA2nAIX0Rt1FgtfTGD6l+vPV9dxXl8zHP5EJjS7EhfNK/QSDD8Lcib/SiozQoQ8ZrcZ0VEmTcEu2PcljyM6gjSzSskkONEAYmVQhV/fvQylJ4myWj5YWYFUnm2Yrc/tCjP2fMxopqbS7TEDadJDNtNjD+rDYv5zQ4ie1O4OV8Bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXP8B5mY; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXP8B5mY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2448862f8f.1
        for <fuse-devel@lists.linux.dev>; Thu, 06 Aug 2026 14:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786050759; cv=none;
        d=google.com; s=arc-20260327;
        b=bJQBTfgcCq7EYT9uTZ0C+gVYMmGAuI8oOAOBEaA9iR6UYGfXzXAsJt3al0b4XJcf2v
         x+m57ydHz9+LYTat7KAflSrukPwresvDF1xFwupEtJ0gli4smEUPX8wZcleuezNc92L3
         2oViksbCjhRt3wrnEDzYYSCetjpGCboI4PWgkZJEz8FwWxnKK0AJloR5E55pl2ZBxlWx
         K7jdADzd2gXXpWIk6Tai1KaKowqhs698iK3vVq/u/HnsRvp2Z80r1s6KN33U8T9mP7dx
         c3mnFPdwIyNrAml0Jo1NRJvA4t/QN/tyz9T++KvVF8mqjOphiuzvfXJ66/ByESAmvzvI
         BN6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O2nXCqD4o4f5F4Q2WJbaQxzYFvLIe2CbH7K3L5QM6zE=;
        fh=Z8UZ4XCR0wQWJBlZNW8ebx2f0+XgSfoceQNCQSTJETY=;
        b=UDIx3ZQ5EiwAdc/TXKFQMxfpEZqKJA/78IVQ+sTiZAxD+Ele9j2cVtjPAxMe0QFNau
         74+RdKG4sKNLhyVISyFM+guAz2o+XBHROcgTVnbOk6rp8/CNTpq/9wRW2FCQ7hnOfXvk
         Gk9bhuCj8Y4awVUAtLYNf2bq/NK0wGIINJ1IM/DYAYkX4nqStGV4HE/iomehpG4ZLbIo
         wR7FOIdRaigD3ABs4DcI10TjQ+p9C1TrqE5WlLPb5aWOmwaPUD+m47KwN8FN3uQcupwL
         kV0nsqT6LLR6LsflpzSljn7VSYy5b+ntovIkvOhw8WPQizyDOF6TbYVfmmNBN6f3Op4D
         t2fg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786050759; x=1786655559; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O2nXCqD4o4f5F4Q2WJbaQxzYFvLIe2CbH7K3L5QM6zE=;
        b=mXP8B5mYKtgxI+1IJKWBeHDE4bWLfgqMBhTeXy9DSelyyoAhXd5Piz2IIWder12B13
         Po31iJrxOo54u+UKOR1hsyvSDJBq4y3aItt3hiEi+zCwZyaxRQhLjhEmTT9xbmVE9ORv
         P7ZrgD2Pdr10mG8xqBT6MXUrFgNSw8GrPv7T3yaPrvZuEcyNbfd+iUpxLkB4CoFqVtcW
         6gJjt8BJ+P0jvYAq1Ti+whUNApMLKX3p6LXuwoRYzLH0PCmkvHdY4KY1p963vmHPlwQ2
         PshQcndYgQloOG5jI6MOmmyT21E0grsq6mhuRtJJtksaSc5aWswvK0i2/8KI81zhSmJa
         vaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786050759; x=1786655559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2nXCqD4o4f5F4Q2WJbaQxzYFvLIe2CbH7K3L5QM6zE=;
        b=E9OhJaCwZU33JpMTJ9d/vI7Ss0ObNOu6HU40SSy52NAi36Tmx88Q/StH0OeYxwZSXy
         TYocnnvcoTzKVVC6O/oBXWnP4saHUFkNJMjutcRKDssVqsj1ADBOT4/s/P+N4N6HijAp
         BPbZu1kLN0mMDFEoROz8ZUezaldbBWmNEsZ98PQt5ulrNQlJnMf7+6Md8UZroLwmewra
         GyuqX1CkAJ68aY/SEehAz7tFMaCkvWY1TdDa8JrSo7VYrNFPBhKi6Djw6nR8LQc+juqv
         3biBTjYFAigo/CzzwcxaZzpwHTYe1ude1aMNnuNuWmEP/TQMushEPtFIJgeXCG8EL/MN
         DNsw==
X-Forwarded-Encrypted: i=1; AHgh+RorlfEc1gR9KRnKzYOSRRzYsczb+4CdECoT6bfjEsgDbyR6nf0sgNPw0TI7+UlLxLkyHm5uDlJqPusK@lists.linux.dev
X-Gm-Message-State: AOJu0YztsQVNzP0zaCAdGGBJhLEIwcBgiTvyaanlflLGB6USIPKUi63x
	tbcW3XOYw+VLFVm6Nd7mQH3fsh+48SgI07/2lcz69fue1/rotzjejHPGCMe+nhsUG71N5u2zj+s
	Um5s64Yac7UO5hs4zLvxX3lLDVqZS1t8=
X-Gm-Gg: AR+sD13riNTlKi1dE/DEydqKXygKwp9LZ+RTOLoiPWEck161YiAZaDXJ2Yi8x6P2AOa
	kAElur+wzEjgImbHYkg+MJNnHMbXB/eoL3WRRTl3aY0Y6zP2byUkxSGNCPyQFGi2Ra4pdvII6M1
	mIOMJztFn7svQM8BoTgAG6SJk2+ufPxApIiswXFFEl2TkMHD9/kAWFTAKZ6gy3mBLTwThjSLdD2
	/b4CoqXG4DPk7QrLIRdJd0/6SJtS/y9dt9WffB6JF5yxw+vsfhcZBFJWRBLuYgBqGCvatDAfRDB
	6xnN7BLruXwZpd9qpeWY92OhVvWxHQ9tqYZqFaEyd/4KJD3BtE+VtCO+mGoWdKtfci15GKDkuma
	TvBgtBzekVyb3fhNKPE2u74g5
X-Received: by 2002:adf:e012:0:10b0:47f:762f:32a9 with SMTP id
 ffacd0b85a97d-47ffd2322d0mr5562298f8f.12.1786050759421; Thu, 06 Aug 2026
 14:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJnrk1bk66ZhRAS7mojSnD5RBfFS+0ChAPymE3ObRWr0C_udWg@mail.gmail.com>
In-Reply-To: <CAJnrk1bk66ZhRAS7mojSnD5RBfFS+0ChAPymE3ObRWr0C_udWg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 6 Aug 2026 14:12:26 -0700
X-Gm-Features: AUfX_myi8qSsw8YaJ3oXvGriDbREJKOHPf6InLwZIwXLf_s2phZcmAT4WgkHKVs
Message-ID: <CAJnrk1YNZ-mW7VDXtbNYDUbim7g20gSsec1Gxpy8kWKrDEN5_Q@mail.gmail.com>
Subject: Re: memcg stats flushing (WAS "Re: [PATCH] fuse: disable default bdi strictlimiting")
To: Yosry Ahmed <yosry@kernel.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>, Jan Kara <jack@suse.cz>, 
	Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, kernel-team@meta.com, 
	fuse-devel <fuse-devel@lists.linux.dev>, Jingbo Xu <jefflexu@linux.alibaba.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	linux-mm <linux-mm@kvack.org>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Yunzhao Li <yunzhao@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 2:04=E2=80=AFPM Joanne Koong <joannelkoong@gmail.com=
> wrote:
>
>

Sorry, I think I messed up how things got linked when trying to update
the thread title in gmail. This is a continuation of the previous
discussion thread ("PATCH] fuse: disable default bdi strictlimiting")
which is at https://lore.kernel.org/linux-fsdevel/s4kv7qep3jlncs67q72xfhser=
pd66hpbwzkoppiddc5raufyjd@ksuvlfqcrbk2/T/#t.

Thanks,
Joanne
