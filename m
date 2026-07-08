Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254F3409DFB
	for <fuse-devel@lists.linux.dev>; Wed,  8 Jul 2026 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502257; cv=pass; b=OQogNCrIQ0A4VlJwzzkTmKXrhqfg9Q25nQeqEgoVlaX0Ovkapdr44AQBC+LDZdBc9os44xLTdjb4iDuVOc1jvKiohBzo/OqgM+5RX1DQlwgAsl7C7xFjkkq2UwQvwSG1m70Eikfah1Ko+kBjD/uDfWA93+WWX3zM2XTv8/BzJGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502257; c=relaxed/simple;
	bh=FWSqZGg1iw842431MXioEMnmIXSocIbOkpSbhPNXHXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMHMNSEYARmyrGFqko8ppKi3bDWSAF99e5NZk1bmviBACkNAzyvAMmZNwKhfgwo8IldqY4I/xQJZHlPZbJxPF6S8J4KXPNUYoDCAro1aW9qYn3OYp+oWfwo2Gvmxnd7DBOtUpH3h8nmPidRaCQdaD13RtRQj5n/x75o1k/ys2Bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=STMHaX2q; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="STMHaX2q"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c1d487f2cso3503521cf.1
        for <fuse-devel@lists.linux.dev>; Wed, 08 Jul 2026 02:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783502255; cv=none;
        d=google.com; s=arc-20260327;
        b=S5Mkp+Ruz9lRaioNULJvZ9xNPSP86kkM3b/mPAi4YSVImIcl2GvJXqTEafBivYJ9aX
         D+92wmjsJpBqAPc2uCgni1kxa+8ob+DTNI12deeQHQq/64UgxRP2aXWY1cxsphxVc5y4
         Fal4SdxCUslIWp+RB+ZYz/u1h5evtTokSRb9T/js5zkiV1UPdLcShPezIuNXj9/POxms
         R6WG/wNkfv5J3bWiEhL7W61wzz4fwcEdqDqSunjvNMh4mjYe8BoejwBmmGzFJBODKL4X
         44Lul11ErwcmobBsRSusDyndOjil00goOvOf0LDs+bE3cBrlX7LoP3+ckex8yVGF5FvL
         zI0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FWSqZGg1iw842431MXioEMnmIXSocIbOkpSbhPNXHXg=;
        fh=SiDQGn3Sny74/pYg8SKFvZo/fBK7Y1Pe4ypq7FcF8s8=;
        b=Z6Rr3ts71C4Ncw5tHq3E6uVCW5dY0d3C3zZwyIrxMqTdtWd74vpsZPuoZjqzsUjOO6
         0IbPKZTYupQ4JKbgE4n6Y1mo75H7ES49bwbGj5L7WWHNlSnHB2aVLswoYGM/dRfx24IS
         BQG2Yv7Xbt2uauouoZ4ss1MzaLtWEftS7HcxAq9fOI79AIcAYY82G+WQULTpqWjZDgJt
         BHrqTUPmp6nymkE4XAnPH0jYDXZUl1GBZtsaMHu1S65zn5/Ry3ooXO1R//mHzrD1gGri
         UZhsF62zfNfaWz+EaxW9MY3FUuxYBfZpBqDx49q7lly8UMiQetXqOkKiqmRWPFrOMZ9f
         GumA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1783502255; x=1784107055; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWSqZGg1iw842431MXioEMnmIXSocIbOkpSbhPNXHXg=;
        b=STMHaX2qx8GB95fjJgY8J2wcbJlSE3tEOHR/zW4BDi9MuXknpWPfFlKIX+LKS/dDM3
         1/oRonD1PCapZGuq2cqvMmKbEl9Gh9Ubpinrdxo5GZQyWYnm37yOB4GIsMy0pgE0V+F4
         gN7b7KgPbUs65H3XAadwygpjxQJ+WGq5p9RTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502255; x=1784107055;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FWSqZGg1iw842431MXioEMnmIXSocIbOkpSbhPNXHXg=;
        b=CxqjXAhAH7sEzwunWCWGP3AABnvHaM3a3rlp9AY3yFQwrLcyM3RZXHmR/W25KFgK8X
         ZoHltKjMYY8fgdt9hnQok8JAwchO+fuLo8nQCcbZu4SC7cUT1epCbMk6DiCEVJ3TcjFM
         zHYUDX+yB8ulaV6tRD0OXLjw+6alcr0IQ8FyX2xgO4+a/K8VINnFO7gpKYjYQMN2s/Bj
         v90lvOd4V5g00ElEKZrldTpOgqZa/+5+yGigWq+bZHA4T2rh6J3qpeGWbv5CGmidHuGI
         jk2XrZ43TQhlnchC4nMbg2NvJJhlWR0eA5hUjegZim2NCjdyvCYGdNP0J6XHdKsiNPbw
         5pAw==
X-Forwarded-Encrypted: i=1; AHgh+RpTFCUVfeChiX/tYZy2okO3yWj8SBMLwf+RyA4D96v9JXrC7EJdrgcP19HNaqfM88YtQfA5wtWDLUBp@lists.linux.dev
X-Gm-Message-State: AOJu0YyJeVIuAXQlIC7w06uA/XmqSU+OaQsWWNL6ZPF3+WT3EoovsarV
	kPhRBDvYfmCDC9zNrBtoBG07e2uPtQ315ezFasEZOnJa9Knup2b1TC4eocT3NAuDK1zKUfFZtvJ
	w9hG4QsXVWOpvSX8m1fjIJ5dB3yLjK0AfchZT07FwLg==
X-Gm-Gg: AfdE7clh+bXpKon4svgM4n62C6TpEhztr/b43yKI6bNkO6yPZhL9GEqXSIJQJvIGDq7
	1R1rsfchHOCeUDLQXVvb480ZnvLY1/q1TjwNQd9ny6NI8NzYO5/PWJhFsYj6IH/LCe3qBDtM+ql
	b57tmWyh0T/cImrOwSzyres0SlscR2LIOOC+piWnsZbfpTXaBoK6TNnYcbjn16BkGgTxT96fVRY
	Y52R9T5iBbuR7qOm4dVjTJjNEqdO3hT4mVzp6GWGGmwC+pVYh3yg0C5kxV5UbhzD87bSRuO9OQx
	Y7XhS8AcRsaas05iU55RpFfo+Zs=
X-Received: by 2002:ac8:5fcc:0:b0:517:98e3:d939 with SMTP id
 d75a77b69052e-51c8b48ec53mr18403861cf.49.1783502255124; Wed, 08 Jul 2026
 02:17:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707220450.1200943-1-joannelkoong@gmail.com> <20260707220450.1200943-3-joannelkoong@gmail.com>
In-Reply-To: <20260707220450.1200943-3-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 8 Jul 2026 11:17:23 +0200
X-Gm-Features: AVVi8CeYTH3ACY_6YwdTFHUZ5cWS3-FV4ZZe4B14RS5HKokm3x_yXmm3PXUXZro
Message-ID: <CAJfpegv4t3GBU9efQXTWgPSEsGRRaL0OAeZeph5-84eoyRyFqA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] iomap: add helper to mark folio uptodate
To: Joanne Koong <joannelkoong@gmail.com>
Cc: brauner@kernel.org, djwong@kernel.org, hch@lst.de, willy@infradead.org, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 00:05, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> Add an exported helper iomap_folio_mark_uptodate() to mark a folio as
> uptodate and update its uptodate bitmap if the folio has iomap state
> data attached.

Sashiko has a non-regression comment about this:

https://sashiko.dev/#/patchset/20260707220450.1200943-1-joannelkoong%40gmail.com

Can you have a look, please?

Thanks,
Miklos
