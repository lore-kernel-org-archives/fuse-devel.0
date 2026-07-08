Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994CB40A927
	for <fuse-devel@lists.linux.dev>; Wed,  8 Jul 2026 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502152; cv=pass; b=cRTPH4ULfnyVBi7GgwzLCuPJ65/XJpUFbJvibbjkaneVragMXirzWwS1Sr5pAZ3mDjqV6VB4gJTlf93J0GejYQZdoA2NAX0lGQm8A0McOdilt2IU5ZJooMtUnN2peOtCN2HpDXSJRh2RPP+SnrbxRHCDECcXwGENUoB8kMu9KZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502152; c=relaxed/simple;
	bh=IwpWTUyl/wKVtXYyUbdgDiW9bK6re2kyezxjswM8xj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Df+0sJrTrC0If16KCyZ4NCBzh3XyL0BU8+bLtsNx7KdjTPqpiHrbnhqVMz83mDLivXdOmOSEAF8W5a0tQlWkLsqYYxmSo2nGgsm4NPrfyaxdOibnSWzwgdgg+ymRE8IzCBUGegbY9ug8ITXZ1iw9gk6j0Rw0O7WY8TauGl2bU9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=j7eYJ65k; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="j7eYJ65k"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92b21f65b60so99883885a.1
        for <fuse-devel@lists.linux.dev>; Wed, 08 Jul 2026 02:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783502149; cv=none;
        d=google.com; s=arc-20260327;
        b=H2GeAd8JM0tDEooA63beCvshw1AhyFz2q8IeLvvvNklNUkT0pn3dgxjOAZmH2XPRaI
         vHeSMXktFgAT4mg+bVcHnKu9Vxm0a9/JHNR8qynDaF8BCu54N5DVEME/wHXtfLKL37Qd
         gZg5DChCvoweQunTQzCYZpoN3RvCMJl659yltkscYKoac48j74U/qsTt9ej5xszl6e56
         IUIEXRw6x6+fpWfXPll6aKKBxRylzQNAdNrkZVBUS491NDn5s0VYsqS10gtz8nzPAFWA
         bt00fyoSXDvGuuvMlUjI39cEkohgG4Rg2WlRLgg4KgTzae25O6h86wqE0tHaMu3zZFye
         vDYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IwpWTUyl/wKVtXYyUbdgDiW9bK6re2kyezxjswM8xj0=;
        fh=Gbt/IyMjQaGpJkqa9gk6/eztw3H6ycp6xbrEZHkp3EQ=;
        b=eCNgBuONcsff5xXa7M/ma2a3dIFHxpjE3gws/0+1wiaQNkyEANARP4NASYFsSC60XN
         g+6o+Dz/kPNfIXZbCeUMWb7J6q8B+uNDE+1f8PP4CHv8Oq0eUYEOEVoRZlO5PljG/gyD
         qMuUrcZjmThtr27KcAz060hN3b+IMB5fE8/xg4ua2hYwakpk7xSANaiimjTPfRcx9GX+
         6h6VnQEX4r9qgFoHneBEx/tPZsxkaV8UZCfH7JKLR55iBfoU9CUyTH3WmmRGDZTN7TcW
         y4TGuTUW04Za1vLQbRyVlX2xbyqeHAs0qn5X7xtqLJ8fXMXBH8h5NCHM8rQ6sdVS3+nL
         8SZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1783502149; x=1784106949; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IwpWTUyl/wKVtXYyUbdgDiW9bK6re2kyezxjswM8xj0=;
        b=j7eYJ65kPFKYaPuo6GqvXwF4drCA+0mvT/X9wkE/piacvp3nPkn/6oUKgZdwlody1X
         TX4LLnTJuuflObTS+DGwZcjPNhz/kNnMTNPzfISBAEszDkfgfJEzCn1ZkFxJKXmbvkCT
         ZJ2edcSHbj+Ry9uBa24fEAqrAXRMExMO6pJsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502149; x=1784106949;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IwpWTUyl/wKVtXYyUbdgDiW9bK6re2kyezxjswM8xj0=;
        b=QeNaOeD1bPuikst4Fvahib//haMK9s4NLmb+U8XAl9I8ky9t/T+iXBOCoUaz6J31sO
         l9FeaKAsQUnypumUp0HjAOsLQNui5/nieUmQSgUw9L1MT5kU118wh4TUaZLm6eyTKqN4
         nXzGn9Ls7Ml7dBhgU8fwe7uyACeaCJIwZksf2zij6KEejRlsW3R7qwJfhQ83EMmLJTGf
         v4sOlpkP1oK+ojCdhZdHo9D+PZwbuOQXITSjb6xUnbIV618cHkdsDjd4ZdTSHl8zRkMW
         QRezJDI62vpGBBSI6GI+m9lNlO9mFD+s21gnMkU/dT+KxLXyS26MECo/PScXgDOy95VD
         ckLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJ8pa+FpG6HiKNcnMV6os7tgdvz6CuA4J5zOcRrQyj+3dr98qnZfiB32QlVJJh6Su02H2O0hIwNLu4@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/gj2AfjpQhNu3s75fikNW9Jjah+rHCGmzwqE4epUKpbWj5PcT
	uObYrHnWsqYpmFA38EQvYaCgDStrnZElSF4XBfXhiiXhjlQ20M4OiAk3Gb4qjreJTWGVnUa3101
	X6O9J2qZbIX5WD95fQpT6/7woj4VsKHVXBcO7GPe0Xg==
X-Gm-Gg: AfdE7cm6Li99sUUVRW5Qzt4IBYQZLyNx7d/apNZgO8Mk7+zasE98xnrcGmfSe7vAvSK
	Lmd/SS2rKzLcFSUcPRjkLjcQkX4HPR9mTF2w/c7sd5p+FCsxwfAcvwoEOYhC/9VeuzB6kjNU4y7
	xEq35stzyAWifSaW1S4drCsqCLUYMVtR1ryElmD+riYHf9HN7nZyWLr16tNLdKLIybDgxvydcGa
	ue/8op41RXZS1pDniNsflHfmE72iz0CZYeOUN5WP+1V5H30eWJKI6JOYkavb7VLj9QQtQ5//pz6
	GXjO9thckTIABM5MLEPzov6pIBw=
X-Received: by 2002:a05:622a:942:20b0:51c:7aa7:e0f0 with SMTP id
 d75a77b69052e-51c7aa7e5fcmr41689831cf.43.1783502149300; Wed, 08 Jul 2026
 02:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707220450.1200943-1-joannelkoong@gmail.com> <20260707220450.1200943-2-joannelkoong@gmail.com>
In-Reply-To: <20260707220450.1200943-2-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 8 Jul 2026 11:15:38 +0200
X-Gm-Features: AVVi8Cdp1-AfPxeHhgZc9FUYYy-gsHRYFV4a2GSWjiwCq8piIMWPikl7ZjEBuYg
Message-ID: <CAJfpegvoUdYToRnKQEkdrSGshwpOFt2Aw30QjoY3zuR-0kLJ4g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] fuse: don't clear folio uptodate on writethrough errors
To: Joanne Koong <joannelkoong@gmail.com>
Cc: brauner@kernel.org, djwong@kernel.org, hch@lst.de, willy@infradead.org, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 00:05, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> In the writethrough path (fuse_send_write_pages()), if the write to the
> server failed or was a short write, the uptodate flag on the folios are
> cleared.
>
> As explained by Matthew in [1], this is dangerous because the folio may
> be mapped into userspace. The mm code has the invariant that a
> non-uptodate folio must never be visible to userspace (to avoid
> potentially leaking confidental information to userspace) and has checks
> in place for this that if violated can bring down the whole machine.
>
> Practically speaking, the effect of this change for the fuse
> writethrough error path is that if an application does a write and then
> the server fails to persist the data or only services a short write, the
> page cache folio keeps the data the application wrote instead of being
> reverted to the server's contents on the next read. The failure is still
> reported to the application synchronously through the short count /
> error return of the write() syscall. Folios that were only partially
> written are unaffected since they were never marked uptodate in the
> first place (fuse_fill_write_page() only marks a folio as uptodate if
> the whole folio was written to).
>
> [1] https://lore.kernel.org/linux-fsdevel/ajtPMgO65FA1TXhi@casper.infradead.org/
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Acked-by: Miklos Szeredi <mszeredi@redhat.com>
