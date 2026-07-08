Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B785A40B360
	for <fuse-devel@lists.linux.dev>; Wed,  8 Jul 2026 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502297; cv=pass; b=vDO60OZGj3tb8SZOArTMaPOOB7ll6UICaHGH1x7AwbermOD2PR6ZIcYwA29AfzZlBRy7xW5+x26NwAbtPMX1fAHADVAZ+4VrguXSUITJzXsCRi+67zn2wbfH4tkukpRCPnkMNKbG/5erBYgZRMQVLmXLLgQK96dxoCgM7wVWt5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502297; c=relaxed/simple;
	bh=LhkN3iZ8M1OtywKaiY4DSFBrC/VxDrZxiRrnRPrISBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJKyGY59tG2kSnmEDeW/CA/wgOyGmvEzsHmjDkAN2X1Fem9aBHAr+FChnoVDwM2K9Ja8rqBVukEsMobO7yEyXoIK9JJrlQxiNYDWCrEo+3eKEKNx5+BYmAVcnrX7VIfdcEQUNmeUR8r9wJ95WP9kjraEtJOkxBXmpRa/oyqBSLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=gdUKNiza; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="gdUKNiza"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c08df8513so2210391cf.3
        for <fuse-devel@lists.linux.dev>; Wed, 08 Jul 2026 02:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783502295; cv=none;
        d=google.com; s=arc-20260327;
        b=gOjJspR8ikJDdxyN8abq6skaarJpU0PBdoXbKA4CByGtXfX2p1yIft2KWS5un0k2Qz
         7jdRSWrwzQypLIAgBTzn1yhQljxBYgeMhThjrFou6zVeJDdH8+GQNoQ2AS5xgDlhV2C9
         FMKE8p/mztS5hZ0GWf1PyQ0yvkNFbIkJBkC7e2tNeCxh0g31Fn9JwOoCFVnNyyRpys4Z
         otWFvgfVjkvKKiXbajUczuvYKAWTZPmpAssUrZu/VFMLwNc/S42ZRluj+EfMn3FrV7ew
         Ok4mt0vnKJfWK0grtlvv/tugWPxzL+tdyD+zGoWmFXyV7mRbcBjW/yyvLE0V8uGDckHl
         UkAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LhkN3iZ8M1OtywKaiY4DSFBrC/VxDrZxiRrnRPrISBA=;
        fh=RRrGPurv5VUw9ejBReB3bEX0qZaqmR5F9siPnpBMyWE=;
        b=Jl27ZWBZ8TvUTRpLeDfbq+bQ8UTiAy0pnqrt5LPtgTPQUpONaWq/rSIJZEy7sl3+xa
         4e6orS+fuB1gYnBz8wjL4XmsyF8bUuKdEmhDoWiJGsBnJHerRfbzk33pPf9IO6WaVZct
         6P/+Pt9bkib5HtXtUaxHjs5cLiEoWHqvFmMY+yozYiHL5ZyYIS9gRK7R9RqQJX+EMp2z
         t2QB5g+9JJiOpXThqEMfe7DV/mQtfC7SHd16UvEe3jnNm3zGcPuc+wVdXIJC6eR60yOQ
         F5zW89Od2ipD8yuKLLpHIvaaltiRrtPCuHjw46iM2CiCntSlgalYR5eDDQXtNUwr5nc2
         OQ8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1783502295; x=1784107095; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LhkN3iZ8M1OtywKaiY4DSFBrC/VxDrZxiRrnRPrISBA=;
        b=gdUKNizaFUZ1LXoGvIxEZuUzrzJPeh9QHN5QQ2QZ1LN1D74+YS0Wp0QD0BbTe9HUzg
         lxb0ErxRL84DxU3PTvgC2kBmhS6chYNPpXgoguW7vrrT9YKrx7YNltRmClcLG+cyuVRu
         7wBJksIkaIxdLlaTY65XsLtZtXpMMsYyWmgKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502295; x=1784107095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LhkN3iZ8M1OtywKaiY4DSFBrC/VxDrZxiRrnRPrISBA=;
        b=jZUI14JV7p5DCHmBw7icfpT010l20kAPNR+PVdUqMTUu2gLvrnE/Fn9hfRhIzUUTfV
         oWhtH2ruNlyl2mbdSZrfj9qpYq0IQKR7TgcWJ+HAIxwcKVyp+hkBUhuOPSrF60tX7oEi
         gP4EkEEK7LIEl4acAXpodZ8TnoRGdjA4UBsF+vCa6Fy4vArMWuoHpIuBPIL1aag9D3nZ
         TWwK+55JflAdAAxAyQg9gnfk5dFkyYRduAWHnCntS7SDwNR8DOSbQUwD5Niv/LyosUGF
         qw9N6ykLTqEz6iN308/GQWbIGw2ATqo58kNbONZ6JBqWDNDYx7Ol+WHFdSmW7omcFKrS
         Uwaw==
X-Forwarded-Encrypted: i=1; AHgh+RoJUMiKfzq2pgQBSvToj6uul5iSCACw0ZVTG2Hvr+2xyV3wxcbBreF+lYBbMsp81EfR5WxfzQmC554V@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfspt0RcpFuOVRV9A4VmsL5BJyN+A3XPiqfY93hvT55NkN88Q6
	LqAYuoWYH/TpQuF4D3ZGriAXfpWdWIfgLglSWzNjhmTqvoU/6e8EXCFN5D3RHCzkFVNjY+DHZUl
	4uYtx1eDstuYbLi0qQJ4R8MZEsqCL7493aq+WKFOIeA==
X-Gm-Gg: AfdE7clsF2tK3zStoRwQdCnoNQ8QjNaq/f5PVX9Pyf+kvqYs0JOQTb5XTrf7EHMN0XD
	3t2GFwfq8cNE5EFDNkN1uLPcpft0firQ76fvuwwupFBsh+2x1ZhtT1VoorI26OoKhBd7W/p5ayk
	VfxyBkZXiaiPJGVweugJ/PDieqcKwpcBaHIIIDs73umHOPaeYkzlRk9+91T3IwbURS2NyrvVQHI
	2sjinMLdnazGqgU94GzZUADKwzePYq2OHtJ7bN4X9xUm7bW+wX7iVcSu00QBUo4YZeRgyr3ks4Q
	X7iFZpXb5FlOG+uogBmKptqDJRc=
X-Received: by 2002:a05:622a:1b24:b0:51c:811:b36e with SMTP id
 d75a77b69052e-51c8b420cd6mr15996231cf.72.1783502294657; Wed, 08 Jul 2026
 02:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707220450.1200943-1-joannelkoong@gmail.com> <20260707220450.1200943-4-joannelkoong@gmail.com>
In-Reply-To: <20260707220450.1200943-4-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 8 Jul 2026 11:18:03 +0200
X-Gm-Features: AVVi8CfqJrO4vJXlyAjyK8zVSXlpZpYiFP-m-ylheDpu9UwDsy69JM8rigq8gg8
Message-ID: <CAJfpegvk16zMX3sYgNK4Um18dhd=W7TLoCOnCsEePe2pD06pqw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] fuse: use iomap helper to mark folio uptodate
To: Joanne Koong <joannelkoong@gmail.com>
Cc: brauner@kernel.org, djwong@kernel.org, hch@lst.de, willy@infradead.org, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 00:05, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> When fuse enables large folios, a large folio will be backed by
> iomap_folio_state that keeps track of uptodate and dirty state in an
> internal bitmap.
>
> Fuse writethrough and notify store paths currently set folio uptodate
> state with folio_mark_uptodate(), which touches only the folio-level
> flag, but on an iomap-backed folio, that leaves the uptodate bitmap out
> of sync.
>
> Use the iomap_folio_mark_uptodate() helper to update both the folio
> uptodate state and the iomap uptodate bitmap.
>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Acked-by: Miklos Szeredi <mszeredi@redhat.com>
