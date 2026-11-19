Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089478;
	b=KTMBqZUF1O5aLFxpfZtClyP3Yh2cN/T6LfhPcCuVUnUkYy3ioBv4m5jHGf8gLZbzEJsE
	 wSsVR4IbJJvcz+pbohr2dQbG8kdC/fPBme8yaDJav1PF2QKX96SGe00T20BrOtjl79S+j
	 iqlipm72zfZUmw2iVGJhZp3ArFcrcsSrMpGBLWR9vLB4SybNkfxmjyEK0HNBLnQLzvts2
	 J398RjCYWEVQwZ/HuOU47yVsNFoH2o2mdfNTa9C1DM32eXbBQqPldNJcWEbXVr/EXJhmz
	 eWz4PGvmt/O3V+kqWH7Co1trQ3QZCOHv99W4R0luWV21fYpvydO4Z149L0RhuYVVw4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089478;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uVTx83WpSv0RPdEAEnn32qgRI8JUjLlsOA3vbDXwXS8=;
	b=K8VqTG8i02U96PFUsMLDN0dx47Ujs85lVDqfe0LYt1wikO14rMO7zU4/760vW6oqD1Ih
	 tuUEr57nS1gVCChO0DPsjLxIz8xdw2U3dHj9QHrKLlCZbMdfLOSdVs1hflwH8Va4Hhprr
	 WiWr9GTTezPmQOBHuETazq6E9JnNXhs5TRbCBZ3/kC40opA6P+5QK/u9L6znC71es1pc9
	 Ty44CBeaNf8frbY8bim/xgSsoCTwoKqN4uxVV4VEldMCkXiHEkpYjabazU01jYVsFYOo6
	 7olBD2dZpv7fT1nmvVvwA7Y3pYfyyLJXZkhL0dbKtHdjVXmIwzRaWkijOyfVVsYiwOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=Fd+t82S7;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QM7btqIv;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2381606A325
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 11:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2381606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=Fd+t82S7;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QM7btqIv
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id F008B1D0027C
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 06:57:56 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 19 Nov 2026 06:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795089476;
	 x=1795175876; bh=uVTx83WpSv0RPdEAEnn32qgRI8JUjLlsOA3vbDXwXS8=; b=
	Fd+t82S7Au4wX7Fhh1xjzBJeolNt0Z+6Z+rkaiQn59vBiauOF9a3+IGjwJG5pZsH
	B8GaPffR8sg4YlFaaE5sbyhgkZa4RXAMh1AuAd3XiP1uG3aYvhBNWMDjnchuBh1D
	7cQW86KYghGcmGSMlY7QTsRuVR/xU+2RrG0iaII/V3Rro0MQ8PMJ7bMny07AfQKU
	/ODSXHZ1hke53if/0Y84qfyGEzPANWYUp9CPMl49eKwX+jWT6cIuS+Tg3hGy49if
	iyfRK3MJAtyjIKKs7IR1JoSUUQgWJJH66sOdBAG6ki03WIQ2FIbwQge/sqQqMWmO
	/rZ/QL440mW3iQuda/WUog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795089476; x=
	1795175876; bh=uVTx83WpSv0RPdEAEnn32qgRI8JUjLlsOA3vbDXwXS8=; b=Q
	M7btqIvmWaSiCaJaZZoXxZyOzqrP5IL1vyniY5vcPV6nXFfLgvAdrrFxuMq7L2+/
	HVQ2F9SfDNHYS+p6GCxSi2y+xP/hltGw08VoH08B2LxRdHrz9320FGO/pIA/QdB+
	V8RKXjvoLzMYoy7z/nz1d6eWSXKIiB9ZycUe0XFC+EXvQ7F/Rj3d32ZINk3Ug3hq
	iHdj0cwFZxAFtwEGdKfQqeC34G5ITlMMAAvgfAeZPwBm+tU4OCSmxTXM3KsaCDNV
	Rfb/z8JRWJ30sqHkYg8Fn8z3yphMh9LcL7SL8wgysFJgmejM+uo9sT+qp1tfLqi3
	Un8saRTm89oFK/na4Nb2w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795089476; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:ArXw/u4vnbzNm3t4o5awHaX9NhjQZg7P5M2vo+IoofjNmNS
	O5+9JZPyPe2rzKhlbeCAiq+IZjyvRTJOTWxmAK+Z7INKUgBWD7oInDd/2CwIPZNj
	T85nxfme7ijtOIoskIBO2JLEeWVSsBoxNp8bMU0g/MhcZRE5dCJy4oLIITYuHfJF
	HOkeUU22xOaMQWhyPSFdszyo+2aZLjcnHRN/p9SsnPlMmOaXU+Y0p7aSlazER1S4
	iTRlEFVKxzFJWXsFsucLXbDeO2FMnRFw4Jte0AsIVhg4UWOT/82PAMkd0GHu8q3c
	7pFUrbvUh/nDcfEbd74TQaMBy+i2JsAcjqgVoqg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:KkOq62/YgcnB87MoobOLMeyAixNDpdCoXarR0LMK55Y=:OmWpLLMVjMoH7jXX7lyPXjcxIgjl04BAqkPN7VyxoDw=;
X-ME-Sender: <xms:ROT-asMojmkGO3_BciX-o5USYFQoNlo-CUKALIb66lcr6dngZgJiVw>
    <xme:ROT-agybCjFQnRtc12dnYM2M6BWhRxWLILTj2MNtquNP-uNRvqiSUB7EeJ8lfjJH5
    nAbpg2o2svuGkRy5d3QM54Y8nJBJEilY3Va1YrWgT6ULP3B8PcycA>
X-ME-Received: <xmr:ROT-atsBIm0asKahRToy08PNaZo3AbPZ9YhbRYuFpKjcc_ANpRcyjYbkIyDL8shNUmPjlqj1zGEVNXg148QliZM2ps8mRqqKGVWINzmWZeF0nwh6Eg>
X-ME-Proxy-Cause: dmFkZTEQJYt5lPRvq4JL5uLvq5aPC2/o5w70wIEhSvxhrIltx5Ji6yBpQQTcgVXr7s33w6
    hpzwb95JK6r551s8Dbmm0u1/yBqykkLDC1OWKeFdDsQOiTopwzM08I0ftwgL6vYtUsLJSt
    UhSoVtWft/IB0ZJ8g84z8/2JxWZB6hys6C67G01DFrPZ+F5ud8H1dSypTG9AlJShKWCkkV
    Gm7tCnON4OdOsanBR5uZQD8D/NXuWuEQk6sxEsvBtaDzf5dLBzewXyBn0rky1vAQI7oQ42
    Ykhfd6DxFu1HfMDG3V8Pv1t8sioUEAdgPdlatC8zSTpq/NanHJgSerN7sUbIBUKfbWyPHs
    hloVF/U+xrA0rPkjdSNgXYnkqDS4MLafvs1X62f3i5QBKMVEHm/93b/SD/OtFSyjMJEqU7
    c1amhottGrx+IHPKSzCcR31FgxtnYLctlO9VjAcf52JIMlznCqqX+jps6tcU/Dwopp5EPq
    gsUzOc80cQwlV77vPPn+iW+HOJMxJC1/Z6TwtvuKelconCmTyi7QmnbfjrLnaM0KbkTIo5
    biNKDMUnEU/xyXU+bWCzigi/KjEouxdC6wyErpq933CsSmQh+ZpgbNdM+flGNBQ+CIy138
    oMZMOILqYiQsALBtEcgLfX3PxIxDIVH6RNGDsVQZm97visllIwXJFNd8yFsw
X-ME-Proxy: <xmx:ROT-ah7an_N_Cy2E3jVlODenkqkO4oVQ6lPxfgY12aSEdJrVkZ2cOQ>
    <xmx:ROT-akTmmfiowEDdWsQQvohvjRhiuVS-vgfzTcCL-mYL-POdZiheeg>
    <xmx:ROT-aooJRXhHWEjqssnRDOwXPw8qaHWZPW34cDGhv9vaxmm27KaSPQ>
    <xmx:ROT-aqKeQVaz2lLmWXHdlCfn_yp5QinM2B1tq9rwQqQZeNg1RREp5Q>
    <xmx:ROT-avGHcQ442MOexJOykVOFvMJ86T-7gnnAk1FWwj05B-sP4VSKvESR>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 06:57:55 -0500 (EST)
Message-ID: <5f5d6c24-2bb0-4af9-8ece-d53cc6e612f6@bsbernd.com>
Date: Thu, 19 Nov 2026 12:57:53 +0100
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fuse: don't wait for a sync-init mount in
 non-blocking reads
To: Yun Wang <arsenova@a7snv.com>
Cc: Joanne Koong <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261117075632.59959.p12-0-arsenova@a7snv.com>
 <20261116235747.60403-1-arsenova@a7snv.com>
Content-Language: fr, en-US, de-DE, ru-RU
From: Bernd Schubert <bernd@bsbernd.com>
In-Reply-To: <20261116235747.60403-1-arsenova@a7snv.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/19/26 12:36, Yun Wang wrote:
> Since commit dfb84c330794 ("fuse: allow synchronous FUSE_INIT"),
> fuse_get_dev() waits until the mount has installed the channel when
> FUSE_DEV_IOC_SYNC_INIT was used on the device.  fuse_dev_read() and
> fuse_dev_splice_read() call it before fuse_dev_do_read() looks at
> O_NONBLOCK, so read(2) or splice(2) on an O_NONBLOCK sync-init device
> that is not mounted yet sleeps until the mount or a signal, instead of
> returning -EAGAIN.  Commit 9f6f44aa5a58 ("fuse: don't block in
> fuse_get_dev() for non-sync_init case") fixed the same hang for
> devices without sync init, which LTP's read_all hit with O_NONBLOCK
> reads of /dev/fuse.
> 
> Add fuse_get_dev_nowait(), which returns -EAGAIN instead of waiting for
> the mount, and fuse_get_dev_read(), which uses it for O_NONBLOCK files,
> and call the latter from fuse_dev_read() and fuse_dev_splice_read().
> fuse_get_dev() is unchanged and keeps waiting for its other callers.
> 
> A non-blocking read before the mount now gets -EAGAIN, the same as
> after the mount while no request is queued.  Blocking reads still wait
> for the mount.
> 
> Fixes: dfb84c330794 ("fuse: allow synchronous FUSE_INIT")
> Signed-off-by: Yun Wang <arsenova@a7snv.com>
> ---
>  fs/fuse/dev.c        | 12 ++++++++++--
>  fs/fuse/fuse_dev_i.h | 14 ++++++++++++++
>  2 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 3641abb90d..23ba4f432d 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1705,11 +1705,19 @@ struct fuse_dev *fuse_get_dev(struct file *file)
>  	return fud;
>  }
>  
> +/* read(2) and splice(2) of an O_NONBLOCK device don't wait for the mount */
> +static struct fuse_dev *fuse_get_dev_read(struct file *file)
> +{
> +	if (file->f_flags & O_NONBLOCK)
> +		return fuse_get_dev_nowait(file);
> +	return fuse_get_dev(file);
> +}
> +

This is just a style comment, for me "fuse_get_dev_read" sounds weird.
Maybe call this fuse_get_dev() and rename the other to _fuse_get_dev()?
And both could be in the header file?

>  static ssize_t fuse_dev_read(struct kiocb *iocb, struct iov_iter *to)
>  {
>  	struct fuse_copy_state cs;
>  	struct file *file = iocb->ki_filp;
> -	struct fuse_dev *fud = fuse_get_dev(file);
> +	struct fuse_dev *fud = fuse_get_dev_read(file);
>  
>  	if (IS_ERR(fud))
>  		return PTR_ERR(fud);
> @@ -1730,7 +1738,7 @@ static ssize_t fuse_dev_splice_read(struct file *in, loff_t *ppos,
>  	int page_nr = 0;
>  	struct pipe_buffer *bufs;
>  	struct fuse_copy_state cs;
> -	struct fuse_dev *fud = fuse_get_dev(in);
> +	struct fuse_dev *fud = fuse_get_dev_read(in);
>  
>  	if (IS_ERR(fud))
>  		return PTR_ERR(fud);
> diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
> index 4b412a7622..bb7e10656a 100644
> --- a/fs/fuse/fuse_dev_i.h
> +++ b/fs/fuse/fuse_dev_i.h
> @@ -367,6 +367,20 @@ static inline struct fuse_dev *__fuse_get_dev(struct file *file)
>  	return fud;
>  }
>  
> +/*
> + * Like fuse_get_dev(), but don't wait for the mount of a sync-init device:
> + * return -EAGAIN instead.
> + */
> +static inline struct fuse_dev *fuse_get_dev_nowait(struct file *file)
> +{
> +	struct fuse_dev *fud = fuse_file_to_fud(file);
> +
> +	if (unlikely(!fuse_dev_chan_get(fud)))
> +		return ERR_PTR(fud->sync_init ? -EAGAIN : -EPERM);
> +
> +	return fud;
> +}
> +
>  void fuse_iqueue_init(struct fuse_iqueue *fiq, const struct fuse_iqueue_ops *ops, void *priv);
>  
>  struct fuse_dev *fuse_get_dev(struct file *file);


Besides of pure style comment (and Miklos might have a different
preference), looks good to me.


Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
