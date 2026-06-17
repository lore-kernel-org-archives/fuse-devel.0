Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B2A2E7362
	for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781705243; cv=pass; b=pOKs2i5GGYeWtfZ/lf5bqIfKkqDwDaGX7EFb3MxBv/9L7GfyvwEKtT86IuPz8hEDPVyV92HnjcSvZ3sZEfnhh46/+tc1L1gt1X8yFEMT3uJu78BQXtkwmdg4Yw6b7Ko13Ykr1Pu40D1dLPyZ/QZL7LimYAKQXB9YdNZf+G5/mKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781705243; c=relaxed/simple;
	bh=VPCWM17BzQsqJdYXmV3MoUr1JZSJ+q1a9MCu+Hsi26w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTCWs21ICooBsO9rHnsV410hjnaEbNH8cbkGM4xevPIUgbWw4agJYAKX+x1fBVxSLXVySmcQCdK3tzYGjuI4CE0PQS7uoY8m+zAyvU/loHPmnmwrsv/R8V9+XUoEFP32u64qd46zQFbBtkEgVSAO3EKLueJ/YU3P2mMusTH4DlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Mlw9jwS2; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Mlw9jwS2"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-517907feed0so10157011cf.1
        for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 07:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781705241; cv=none;
        d=google.com; s=arc-20240605;
        b=aQSFT6eJDbUwPhrTTPJfxfluUhzWRSPZjyOTmP+IC3Y/CXNRzvG1HxKqjF/MYbxvzg
         OQSqFlZ/3OpzFnmnW9pz9Q58zHMG2nca6zAG015+S94x0C3w+K8kiq2XUIAPqI9iYvNC
         vWb8YOxo8zefyXRO6U7T54JLdVcYT/9CyxPRPj+/kh9y3jO6jO8QPqrFsDCA1fISa0Jw
         kNO4grW/oGYdfZQxP6uo8QjRXmYBw1MCRiEbF1kHs15xXRUOU6mWEet4agFNPdhuqHaL
         pmxthgFaik6T6YoCfWMbsOcamxG+2i27XwQgvCrlTW3+kr4GTF3dQz1jK0CHAYQZ0Rr0
         sQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VMA/OCEQ5sEXffln+iIl4mymLuBDT0EfTXL1eKqc/Zc=;
        fh=w2Dy9MBCymTAHXuuQoFoyTRhGtZ+o5YcX5Bg6rpudfc=;
        b=a0NVGHvT4VSOFaWkEZvGBbGQ8WI2pWsIrFmBNM8Ybnzbmp00NZqgx+2iJbJo7iFZRl
         ZSQfdvESXd7z7NLaZcg3kM03ld6d4d5L4dbP4xgRwgS5fuL7eQizpb7HP2PL7hn7uTNM
         zZlYhkfPAZPTk8OLCQ5ufRho8QX7F1DGY2NcYri5SPjam22oiO9mhBySC7riUKM3KlFc
         HZYfq+ZK5ZKOhRhrfCg28U7nkws0riEZowzscWdikjZRH81YLHj2yJNpMvvECmSkXjmT
         I21SXWGugrj43cIlaYG1DnGzKq96GIM+nyoUb1yTEz9+q5YbVQ7ffW7q1jLnh06RBBfT
         sLJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781705241; x=1782310041; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VMA/OCEQ5sEXffln+iIl4mymLuBDT0EfTXL1eKqc/Zc=;
        b=Mlw9jwS279ngLqFNmZayvjyOo3A3aRGgieqOzALntl6hVaByTgTXlbQ9UgnnlubMm2
         cvJ/OSa5hZCUpWtlbHhL25BQCL9Nxqw6Au0/1CQxBhn/mm8ptcs9bBXupfLrB5XTLiq9
         f/twemRMlFlVz3d/SbI+bTR9vZ24NDn87yz9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781705241; x=1782310041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMA/OCEQ5sEXffln+iIl4mymLuBDT0EfTXL1eKqc/Zc=;
        b=jkycFhTEWEahEqnWTEW2b63q1NDSGSk2mJQKi95dxSSi1VfSEsqdAJHGxgAyz5JECe
         3drOYSpK2wGStEwkM661DpEqFqR19dOl4its7JSIDm46qAwfW9R+WbdZlUcHNX3+kapf
         vM20MJwX88QhKGxZoURfy1LU3pHReZ8a1NACXeKRnBzJnP3v+YbS1W3nd6kftHdY7Zwq
         B/t6ntFLgP53vdfgoeF4oS/gcw/RWKQUIuz51l2wHECeXXO/+piK7ClVQJ2NSDw0S2Df
         lw4nPl+sUK8klQ8bmDNj2yoxg9cudAPPmqQNjInoDoZ66PXx3B7fnXTLfVAi6WGZ+cv8
         87FQ==
X-Gm-Message-State: AOJu0YzRuUS7aK0i1jWncUkW0aYbURwjXbZ60ymHGsOFkqJInIjSaDXJ
	W/jNu7ryA2DeUK/jH+sEjOCJVkfG8b11yQjHvRWRSMmiBFTx/iBjS65iSNjGKdOb7o67GYVWObT
	qWLi3cr5mzXVvOYwluTTAs+RWptJywKec2ulUQLNcsqhQhaWyfvJ8
X-Gm-Gg: Acq92OGgv9thORkR5Dsv+ZUwnqmkY72/1wHsrK4JJGcaL6G32IZ8YrR4EO546lsaNWn
	H9JXaB5asa+rm4GeJ+s7Iw7MPV4IPg8IzkeG7W4FCvSCijb5tb+InaowWFu1aje4f7XxyhMs9RA
	uTgFR1Tz3pdxaQsXl8MUeRz4HIlNERX0Jn9GH/6GoxOAh/2fOhEyB7b86FmWeq0J8sb+8v53CWm
	WWgahp27a7Fi4u2chc1SS/pXMMVLzDMjyaX634kPzqBvgPZO2A+GlUsIywvfcl3W2RMWNzlmuig
	a36Kr8v6Q3Css3ToLu+n9WB7GgQ=
X-Received: by 2002:ac8:5f96:0:b0:517:5bc6:b575 with SMTP id
 d75a77b69052e-519ace9df10mr37017161cf.4.1781705240827; Wed, 17 Jun 2026
 07:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com> <CAJfpegsWpKE4kUUQo+NK_cu6oy6h6+A1M=xokvSQbFtZzu9UKQ@mail.gmail.com>
 <CAJnrk1b1nVFZ8dQYA=iGn-p182HNhhRfZEVe-e_ks_daZAU3Rw@mail.gmail.com>
 <CAJfpegvNyqSS2h28-0sB2j2HUoMnKd7StMsPbvNPz67PiS9w9A@mail.gmail.com> <CAJnrk1bK-3tpZoeJQKPLjgpQW2F0YQKVhLeGwkN_5tpBVpZ-VQ@mail.gmail.com>
In-Reply-To: <CAJnrk1bK-3tpZoeJQKPLjgpQW2F0YQKVhLeGwkN_5tpBVpZ-VQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 17 Jun 2026 16:07:07 +0200
X-Gm-Features: AVVi8Cco6ezNzD0FoN_-HczZJ1Q8Lo1vwqIv7m_SqXQU5MB70prwfk61KsymVUU
Message-ID: <CAJfpeguq+LVHoyC7ZzkF_VSAQdqmQFw4DBztiQA1Jfy=U+D9wA@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jun 2026 at 14:50, Joanne Koong <joannelkoong@gmail.com> wrote:

> I'm not really convinced there's a compelling use case for needing
> multiple bufpools in one queue. This was the discussion with Bernd in
> [1] about this. In my opinion, incremental buffer consumption and
> allowing different queues to support different payload sizes would
> address the use cases of multiple bufpools within one queue, but would
> be simpler.

Confused.  I thought this was exactly about multiple bufpools
(containing different size bufs) per ring.

If not, then what's the point of dynamically assigning bufs to sqe's?

Thanks,
Miklos
