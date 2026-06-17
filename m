Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E717817D6
	for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 11:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696925; cv=pass; b=WB/NXiaiArA0pLHgioDomViIunvD+O99I1amKrOyl3IC97rEFpd7eOcGH8SXL15VcZIWagT9VjDU36F0sEttd+Kk2Z/343aL3mQ+6DQDW5TvMQEN0mcOWBV+0h1QiM5egwDxPfyYTRmgL9n/7CI1yYNHti/vFT8SfZgHcLy/l6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696925; c=relaxed/simple;
	bh=RGEOrwR1nCK+qevv036EQvZXnxSUxjC1hYrH9wKLqzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhEDBFY+n7NtZON/EMtTknV62BHxAaitPDN1pQjCoVlcZyVQPMU4gYzMAtekJuom7RBlLJAC9D0pESu+yOhwMzP23WGIWxb16GCWKjUmobkC/yL9WfZWXkYPS+wuOezGJ3+xgqHCnpqDEIiEP9AaM0BGNiFgR7XL7mwKm74szHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=nFRgcrc9; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="nFRgcrc9"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-517b1f2c668so63398461cf.2
        for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 04:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781696922; cv=none;
        d=google.com; s=arc-20240605;
        b=iC7y1nK1bWyn8dYSj8L0zh79YCuBu5LDrKzCi/bDQcCuYaG+6ZxOydERVOakQ97IXf
         7yhSUGQg7TcVifzPmj4hhu1xGCvO3qeU8UIhw83JmZFPGUGW0FuWHqyiqxmxZX49vb+2
         dLMROjir+R4ffmaoCj/Gce7qfu6/G3mEO8uzqniPypUWW7AbfVx1BvTftATHFNBkHVxM
         iyK0LUgl87ZG+yyGdTYHqJzpNMtpHY8oX7qKTd3WQZVH3WcRg4xj1o7CNcFkNRfnP1Ki
         yIdQGaDkK5M1kBfdVO64xtmKRKMRkEL4tPt9IumL2bI+EEo0Ei+5SlIHFb1fLCb0lDst
         nhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4zbE6JKMiCOO2SsfeL2Mv+TGGCV5/04jIH8Crz9cMmI=;
        fh=w2Dy9MBCymTAHXuuQoFoyTRhGtZ+o5YcX5Bg6rpudfc=;
        b=AOFnRDKpV6AcP4zHi7g8OuRykomo3CEXawlvN+eG210tw1EO/aPbVlqJXDnw5NuhsJ
         Bh96jYkYoocrd0yeR06XADIhNgzeYeGQmay1lnekBANKzWgsJWBpilzb7wMm+uiSYNps
         2y5NAppOY+Njv8vlbI3j8ekvmOC0HV+UdgFCjw+nv5elOOO3C5rySGRzGnn6+Qm85BZa
         RmNooyjs0sduYjJyg3vEj5Ns4a/vv8sh2xMvf9iQALMy8htHNRVz6d+YZoROetPV+DM8
         CazkluSUkoqrUqwc7kw0PUoutgT2hafI/wmEoOiu6fPigEgOlzarJIwBSObrB2dZ3EA7
         sOrg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781696922; x=1782301722; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4zbE6JKMiCOO2SsfeL2Mv+TGGCV5/04jIH8Crz9cMmI=;
        b=nFRgcrc9CKFZ0ziJegc+ChCV+uoDM68mtDI44ZrlQPKO89a09tiPJehKvhFitGJ9GD
         e6NUVoDruXHlj/GaQZeveqDdN7p1b+tEgit2RsGdWAF0e0jj7dR6XZIFsFu+1Yh5hajP
         +EkGZdh4x1gmQ5tGKr2oscs5fHmLi4f1A+iE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696922; x=1782301722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zbE6JKMiCOO2SsfeL2Mv+TGGCV5/04jIH8Crz9cMmI=;
        b=MUsGI7/KPe8iWPELlXpjaAkBSQnVTThNuq07a6rVS5Pz+PGS5ETX5Y39jjroTy1/sM
         2fKBh24j1WpcPvt05vCgRRjv3gE/ryq3E4cWWeG3zQrsMoEo9qxdG0bFHXXHh7n7jbQs
         PhgQ4a/aveZeSnTKT40RaNvcfcZj/HVzLFjq9h/AtIyQd9lInc0J2eByG0SYoWx3lX/i
         /El+OmsDriEgxe4Tu61bKmAl1xX2sGAuRxDCaUa3qp132cNrrhxegwm6/CeAl+WVLUSp
         2zKRi4Bn2Hf0nAv6pYhV6varmHnLr3Je45nR4wJQs/YIeVsnyiIKXI1TpGZfFZSd5MCm
         Lr4Q==
X-Gm-Message-State: AOJu0Yzv+TZfGqFe5qVPDS0jVF0skNf/cXReKA6tR44Xyb1bubj8ELlN
	3mNu4xqskmzpEiCxs1HZCy4P2RTFuelVq2qtP7rI1IjNIYeNjf1Gninn0+0QBQ0HlfdPH7XhlgY
	lhPM5YLfp6t/QlixnMz1oCemePf7q1cqWwwW8MskT5g==
X-Gm-Gg: Acq92OGkIWSr3lPgNIN40FuFibG/cKo4jh+BAX4SUTDY1+hDvyci0ASxq19IuNihv6s
	ikL9qr01fA4MtlgPXSS5Q9KoXpeTs1fypTJJArabvxAykVKTv/t6ghn9nfzUxYxOjALErx3YsCA
	P38r+xn9l7TmbpKBiIUgZAe0TWUnQr0mu/QIJSqdh/G0X1KYyFTUwIHlqkLP3qBNTqocUB6aUQo
	ray6T3G/Y+rSxQrl+WDRS9ZnWCNee3ql2VkW3SV1ev7pJGFdh6VvjykLrHcxofJBsjdM7HjxMCA
	fnwWowW8ZI1uQg2U+of7no9PVzYFIbLphNVf+g==
X-Received: by 2002:a05:622a:a191:b0:517:8da1:4d3 with SMTP id
 d75a77b69052e-519a8cc2a96mr42817961cf.22.1781696921657; Wed, 17 Jun 2026
 04:48:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-10-joannelkoong@gmail.com> <CAJfpegs+EY+eCDOkBgVWhUyd8hBLE3bFY2oaum-k_tS=Cv2SVQ@mail.gmail.com>
 <CAJnrk1YiUn3JFZCEe5oADyK5+zx6Rh_6KTZbCzeHUjAebUVQBw@mail.gmail.com>
 <CAJfpegvokfiN4b1tEd+fAPfO8n9hSQKeXt6-UM1OzxwHYA5-hw@mail.gmail.com> <CAJnrk1ZTOcAP85qYpFz6w2TPBK+WMdT1B01T5O_gL68BYAOvCQ@mail.gmail.com>
In-Reply-To: <CAJnrk1ZTOcAP85qYpFz6w2TPBK+WMdT1B01T5O_gL68BYAOvCQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 17 Jun 2026 13:48:30 +0200
X-Gm-Features: AVVi8Cf35p0EXnD4r9o_x2aC9yYdZwXlN5k92pkkwjtYpLjJwiJisn9LUL4MRP4
Message-ID: <CAJfpegsixwxHLTMhz6uH=ssvETM4zZOS24x5qUM8fvBHTE7Zrg@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] fuse: add zero-copy over io-uring
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jun 2026 at 13:23, Joanne Koong <joannelkoong@gmail.com> wrote:

> For zero-copied registered buffers, the "address" you pass in is the
> raw offset into the buffer (eg if you want to read into the
> zero-copied buffer starting at offset 4k in the buffer, you would call
> io_uring_prep_read_fixed(sqe, fd, (void *)4096, len, file_off,
> buf_index);).

Okay.  Could we have a variant of the _fixed API that takes an offset
instead of an address?

That would work much better for the plain registered buffers too, as
the fuse server wouldn't have to look up the address belonging to a
particular buf_index, just supply the offset that was returned in cqe
(as you suggested) to the _fixed op.

Hmm?

Thanks,
Miklos
