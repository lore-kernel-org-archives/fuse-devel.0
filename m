Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D7F35202B
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939875; cv=pass; b=X02ZWvRKsLYaEEhJg2ncVmdfvI4yaA8JdlV1GS1zRqY9IOcu6G8efyVNx5unPcfzyVKm15cBolRbc6QfWj4BxkGNagf4qSQUuWk84nWOToNKWJWqVO52rMeDcW6qZDZ4gvqDwJE0Wn8d0RHdJXAjSUmFbyAECpbEQbi/aG9qUTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939875; c=relaxed/simple;
	bh=ZtkTXeVSoIzUreQA69OuszszpzFQa2oNPn6cPDzvSqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KU1VgmSdVdr+9eBp4H7eONEgP93/tCNuZOX+Tdj4RYMl8zhbnUyBN71LAUUBpUNBodggsxVbz5Zsi79dSVVju4vL+DcKgbyGTvCLbE+IsGS4x/NIZREh9NchoSZgKyoC/i/UmLQb7ugq8QE4mwGswIEQr7pWXCbwj0/CcCQXJj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=LVjibTeh; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="LVjibTeh"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ce9df49c5fso67046386d6.1
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 10:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780939873; cv=none;
        d=google.com; s=arc-20240605;
        b=Uk2ZhedIKsMwhlGL4APVehtDVsmwrXQXNJTwhYrTrPWdWgHzBBv5v5V2RfCH+buABL
         DlSDnGdKe5tcWKlTAZ11ZinG4lyXULi53tU//GzjofpSh41jLzuJEdcLC+5qqwzGYiS+
         mZsSf0hFyCyHw+/sUt0iY/EkK3EzgUSeunSgJSpKvoPQRqUjjK9L6z4Rin6imbyeorul
         tMoLZjRKmA1UeRU95fncVOXfcXQDB59YLzGqpzKGtNWwG4UeCbT4X2VbVdeGmnaC/zYm
         rDND5hCkRAd7ZD8uX2EjwYvvrqxjjOSBPH5huSR2JUgTJSpCQIn4WwTks0iiBcBS60EF
         T2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZtkTXeVSoIzUreQA69OuszszpzFQa2oNPn6cPDzvSqQ=;
        fh=PWBJ9ZmJ0gTNT11PnW4vHyg2fjrcw5zITDqIxctgvos=;
        b=V64e+DGocs+kYZxkQQfTWcyPb+JGoi6z7vIXPq0uwLguunilGUFxntfrJqUZJSKlNO
         scGbPXXEM7S7T52vYUm2cXhiExXEuI2qc+uSvC6LYzJdsRZQTT675iWkxtsYbRpkTGuw
         SiLZ/A25ONwTcZHNFD27noK1AboKoeCMHPMxxzBL8XZt/RTx3X1tM3oVbr+ej88+1cs9
         2Es8Ecw42fodqM9GEqUKQDtnCvCEU4SsdMu89+tJyF5QjlC1mArkKsrzzvoiEQGbz4E8
         4hyfmK0AsR0aczR5FSoef0eowz60xfJcOMQGxIz68mZak3c5ESwxYxf3I0s8hHcspwLQ
         i2/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780939873; x=1781544673; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtkTXeVSoIzUreQA69OuszszpzFQa2oNPn6cPDzvSqQ=;
        b=LVjibTehBDuYZY6lJp0pqAWmKXxCeaIIqZsDCELTD7Ig+WObnSzyQ13RRxvVYm7Ui8
         1SIzyOiUInL1iA8LgasbF9C8rCIhhPWxDBAxAESqVWVKbLBx+k9RE0SU+cvbPKfLqGo6
         sdtWamZpPkHCGKVyuqRo0Z8VUCCc61LIghpOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939873; x=1781544673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtkTXeVSoIzUreQA69OuszszpzFQa2oNPn6cPDzvSqQ=;
        b=SfjLTkCYXnhKroO/U3RpgMSVdo3vmiT2CaIhAEFeMW4gWpJfqQqglgLIH1wH022D4Q
         shtWX1/JZktVUMnGwcI5OohdzQgii6j1FewaUcW3ywqs9Pq8FmIBqCtJdxGTHQmkmYvM
         vHy84VM8janiA2/jv6TsSnU6Jf4agAAQU0o5QenxY8u1YKXIn7/ziL4PqLjSU6rq2iNd
         4tEGl2ykFnAEvNI2xn2b7TH+TEynWT9vqrToemNWeq7XpT9pRmn3h0M2WiURyFm3jcJ9
         IgX4mHx7tfOOcyt99WU5TTAGjK1D7U405zQmUv087zgaVU9pQqRXvRCitpxFC357mhrQ
         RMxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8s6K6D798El9/cfqILkAgMd51gGqSZ/O1nW0cyMdtr6Oi+dcu4LfP9vIMqIH1sJ1sTVtE53uhyq4+J@lists.linux.dev
X-Gm-Message-State: AOJu0YzFn9qidD/xYQIAQVR9jwGvWSQkAUk/U/6avdk/wOkhzp+sOGXo
	RwV5ryNHmjP/6m6LXU5zEQU0PTSOb2Reu/5kbhZNbgz6/ts2NZUxWz0p+IJiRF9OlEOIKqPrg+r
	eLmQIhC0od8r4rDXj0J2BjIQbG7uIMxcqKLjXMkUBKw==
X-Gm-Gg: Acq92OHmTXV6SV9Gy4DV96seWGWRF6tP973mocNWTh6ZkP7MN75Y5Gezf80NDqM3B2H
	ugsPg21ZzlGOt5G8O80iswXglOiseTmj/cPan571yL4Gd9YR5QKh2Ijkt8SBE/nPq7tvw1bm0VQ
	4WLsVUmd0WxoxjEblVnghQorRKcWW6HOBEmVjWYjaVbGwpe1koimaZOZVkzzt/rcGknNzad748z
	RZs/CBpmDct1gkxMaO/mJD/fhHjiIvgtue93BFwbwJVED1Js9bQYE3vefnp8iOhQTTD7gkoBaGq
	Kbb7ABP/sHUdCPmVF5VvZkA65gtxBoXMEccHHHVuF3ff9VY=
X-Received: by 2002:a05:622a:181e:b0:50f:b904:454 with SMTP id
 d75a77b69052e-51795b4ebbbmr226596791cf.11.1780939854813; Mon, 08 Jun 2026
 10:30:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260605192708.141921-1-joannelkoong@gmail.com> <20260605192708.141921-3-joannelkoong@gmail.com>
In-Reply-To: <20260605192708.141921-3-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 8 Jun 2026 19:30:43 +0200
X-Gm-Features: AVVi8CebtW4VFoRjyS1pkJGcPl0oTu63GC91v_deluCzoHFQI9GHchAVugbxlQU
Message-ID: <CAJfpegvGqm=F8yw6NJTFCrNnx7_jSP9=uFX_SfWXi2C_iU6xBA@mail.gmail.com>
Subject: Re: [PATCH 2/3] fuse: fix data races on ring->ready
To: Joanne Koong <joannelkoong@gmail.com>
Cc: bernd@bsbernd.com, fuse-devel@lists.linux.dev, Chris Mason <clm@meta.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jun 2026 at 21:27, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> From: Chris Mason <clm@meta.com>
>
> On weakly-ordered architectures, the store to fiq->ops can be
> reordered past the store to ring->ready, allowing a CPU that sees
> ring->ready == true via fuse_uring_ready() to dispatch requests
> through a stale fiq->ops pointer. Upgrade the store to
> smp_store_release() and the load in fuse_uring_ready() to
> smp_load_acquire() so that the preceding WRITE_ONCE(fiq->ops, ...)
> is visible to any CPU that observes ring->ready == true.
>
> Additionally, fuse_uring_do_register() publishes ring->ready with
> WRITE_ONCE() but the fast-path check reads it with a plain load.
> This is a marked-vs-unmarked access that KCSAN will flag. Wrap it in
> READ_ONCE() to mark it without adding unnecessary ordering.
>
> Also wrap the fc->ring load in fuse_uring_ready() in READ_ONCE() to
> prevent the compiler from reloading it between the NULL check and the
> dereference.
>
> Fixes: c2c9af9a0b13 ("fuse: Allow to queue fg requests through io-uring")
> Cc: stable@vger.kernel.org
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> Assisted-by: kres (claude-opus-4-7)
> Signed-off-by: Chris Mason <clm@meta.com>

Applied, thanks.

Miklos
