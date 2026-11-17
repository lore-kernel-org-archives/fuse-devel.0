Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952047;
	b=5mF18IQzGkYHxXJ0WeFSsHl07IcgTddBxxNH+BI3+Kuq5eNBxD1G9nMCExN/qgUhIoqX
	 hzNSo6IJPRzQ2vldnu54QLa6o7vRIL8e1XAzICtDZmLJpak8mJV3q9J31mp6uZWignujz
	 DUAT5uz5Nt8dQ12bQg37vOrOrtHsFJLoMDEGbxhxrysrYUvMp/whC7izVxWfAO3I55d6A
	 M71GoO6sui5+gO5FvRUbb5uK8PTB+2F2Q7Up8hUXZgh/xCets2C3WzK05i0BG1VY0ljLg
	 Jkozeh1aViWxIJrbYwzxkxp3QQWBfEYTjonYOdtO77lA/axDF2VdiyejGFR6TDFOWkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952047;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3yhBkhMN26vnloZoWn5dl5+ivW+PJjpitXBcGq1NB/c=;
	b=D7hPjJ24FtPxyx/uSgdCjdrjJEZSwFIJj9bQluV6gMoYf0u43aS9X37oCbpZgMahVJuY
	 4AdzoOXA1Ju8U7GBzQrljsU9NCN8leIuOpggsqEivC44rv22wtmybRe8j5CqYj4/WjpOJ
	 Wcg9AJWBhhaIMzlEx8GPLvCMJq+qw0UvWxGQ7Hw9uDe1mvGbtpW/kDxzgf7nFB5bVWdMf
	 o7VCvC5nDhwW/SsBRMJPsa9wdoh3GKjX8EDmSpMTxoR1E6aztPIDyWL3NV22gRrDpUB9c
	 ns4RUhGBk4+8W5Bf0M3CaBmaqj8Z+H2KIauLfpfCzhVwrq02HmyGOq+ZAgAD3kBSOWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=B+wgJLpp;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Kb9GNFir;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332B5606A337
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 21:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 332B5606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=B+wgJLpp;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Kb9GNFir
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3CED27A0256
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 16:47:25 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 17 Nov 2026 16:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794952044;
	 x=1795038444; bh=3yhBkhMN26vnloZoWn5dl5+ivW+PJjpitXBcGq1NB/c=; b=
	B+wgJLpph/ZiX12qdjSkFpmEqaTF+ks7B7uuzccHBhWKvsIg4SswA2ah0VZxGtfV
	hUsPIgrUdiIAifX3dqswsNGdo2NMOIS6+Zan8luwkZoZiFGaQJ8aboAMKSdot6fR
	zP8NrX0/IDKQJHzHhDD0PzdKZdF/U7EwRyg5X/BkvrCEnBDsGyEa1ZBWAu7iXxIP
	3oAjNneIqnegEIbmSxqSwW3XILpGvhRoEmM+0+GhDW+cFX9MbRP5kB/Z8CYQ5Ck5
	JX7BfIqEj3RHi1nKOAU8des+PyTxQ09TAde5ooHIQ1M9WUQQTAlBo168VGwepLUl
	W7mNK3eeGx1c/Hm2awv4lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794952044; x=
	1795038444; bh=3yhBkhMN26vnloZoWn5dl5+ivW+PJjpitXBcGq1NB/c=; b=K
	b9GNFir1+Hy9IUKYFpHArVmYZBL1H7M4FJucCwW5JexT7Ou5qWxJTnFpD3Sp1Q9v
	jmhQKUfop97z5wyL+Z+ESDKLKoJNP7VLSQpcPFzzKko9Eanel0swfMuxTaUEtzvb
	eY/7dZh3MmUSVzwA1oF9DBNvIkMzz6waiPionOmsHg/QKaNqA6IYzfAzFgs7gnD/
	3VMrweKvkGFpP24XA5F72dJ5+gMLR0+aXAXyENS83hvHwbNkhZeRta8g/IwyY7vq
	bkoAj1BqG06Knzrl+nvVpQ8Q2W/IczCZSZQ/z9gVEuU7jpriB38PE2Peh5snDHov
	wsZPQt/JlKiwUHsxA+QRQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794952044; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:AGQBn5LOoK7lvRYJGdDIVJvH3ED6SIvNmZwd0C2pZJUNXzs
	yyLds34u955OmYf/Yd5OzN62+0LDqpV99aRIBLMlRnKcEh6PBlvH1QkrKZQ69trg
	lTiaSvwE3SUNY/j6H6gT0SRGEmzlpRG1SazdwhRwcHukaLAPD4U2vKwOVgr4omV/
	opIbWx/QNorAPPJUwNnnhKQeKmW+SdVGUGQ+tVM5VLKUpg2GaGzAg4VCnWtVaeun
	GcgBGUy/x1q1Tm8VsUQ95HU4+LlXEqBEgz0GU3FRQNcBy5G7iA1LqZRfEGZ0uaIR
	/wOlu/6Nk4vjUqT2hK+FZGxwzWKtgnkgqz4EEbg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:l/xewH31JcsHKZ/rtP4n+RLtgwszb6PhEbx7llNpivI=:viLTBmPNSyOHS70EIiWYcahgvhcIMUxFSOZ9D1rELM0=;
X-ME-Sender: <xms:bMv8akz9W8zZZ11yYAUYEuKaufBO5pgjJwvmU5j5DQWJ8FhHakT5_A>
    <xme:bMv8apxLbpifr0nU_ZZwjSK7Gv3I2x2bFu8KR-y24Ix8QpkJYaCJbp8PVzknj0Ls3
    jDIBr8rV6IkZAduK0J-p08WM1JXRMt_bapry8ZtbGpvN7e2p6ua3g>
X-ME-Received: <xmr:bMv8amYWyi-zWxDPmsT24wzD2j5bstxQ_RrxmZt2d1wScV0WlwJSRZr9ywowk7m-ty4wPM_wg2nkpjvzyphrOQJB72HtzLyIUvte_0lkgrcFyvkCkw>
X-ME-Proxy-Cause: dmFkZTE9Z/V8qt9NuPrQY/pJHtbJkEFd7tmFyocFF9Jep6ai76hrzxx4iG3kg7wGmLLv34
    zpuDSYSTPCafu9x1cVknf3C6Awr/VRkqfueR3ixaY8/EUfNsm9QYjfHCpsKsxpamLCgZ5H
    EpT/EeO0wTbjH6NQiNv+dN7mn7h2OteUlX1mVikmh4/x2KXtoi4q8haIxUFgsg85nQUrxr
    fO9Ru57tqPNMdj4VswJUc7HjN9ujkRGUho2hoaYb81A6yMyxqOJSizBAkU7u6Em1nb/hnc
    /cfyg4IZ5NbUuiwvbP55rpm0egxJNsIRfeLNmPngkY+IdyEDfGKDLSHwgVWf5wYSkZDWE5
    x26clLvCKcsXzrWoD74O0G8ErZz7YX5mwCl0kCGcDU44v89avDHhHWjt9Iz/geGpivbx0Y
    VjEpgMV4Pr0kQFg+bxbDzu/D7tO5URWQSzG+ZgvDOEoSsQbp32dyKiJ9p3xhV0zO6wl/G/
    kYf4Hw/mlee8rCIAMSPEHs9ctfnIHfUcF7NehXB+L7+NgJ/H9wBGt5J4vuLUdj8TeQMoWW
    u76hVlgUYmvx+IuVzOFtnBDnZOqEW5wxbx5VgYK8GaxfNGXy/bVsQn9bEoPG30cph7QLCy
    Eoa7UDJs7pnX1gj7Pkz+v+E8waCHL52L3pcAZmoH2TYwgqedT0YVahRHKRTg
X-ME-Proxy: <xmx:bMv8aiWHLwfN97E0VDEcoxKlTOrtd6uHRIuND3xZgmWclgambRPyow>
    <xmx:bMv8asgQ_cStPlx3iM0LPHhYxx1AHTqIGV94RrMat49ymWT5moZ28A>
    <xmx:bMv8aosWpRwddrZjIcj3koGT-0kX6e0ewWbGKqYrr9l3OrZF6XC6Og>
    <xmx:bMv8at7Vch_uho0KxbNy_VN0QgZzY4rVDFg2U2dU4VLpO3CJnZFfuA>
    <xmx:bMv8ap_Ew6ptVfLdUEI08DPnUyBzRook4F-qQvgNTzhM8PSLS4MS9ASl>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 16:47:23 -0500 (EST)
Message-ID: <7bb720d9-30ef-4d3f-8ab8-81c5fe2e0fe1@bsbernd.com>
Date: Tue, 17 Nov 2026 22:47:21 +0100
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
Subject: Re: [PATCH 2/2] fuse: don't wait for a sync-init mount in
 fuse_uring_cmd()
To: Yun Wang <arsenova@a7snv.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261117075632.59959.p12-0-arsenova@a7snv.com>
 <20261116235814.60702-1-arsenova@a7snv.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20261116235814.60702-1-arsenova@a7snv.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/17/26 00:58, Yun Wang wrote:
> fuse_uring_cmd() gets the device with fuse_get_dev(), which waits for
> the mount of a device in sync-init mode.  io_uring normally issues the
> command from the task that called io_uring_enter(2), so an
> IORING_OP_URING_CMD on such a device before the mount puts that task
> to sleep until the mount or a signal.  This happens before the
> enable_uring check, so also when fuse-over-io-uring is disabled.
> 
> Until FUSE_INIT has completed, fuse_uring_cmd() returns -EAGAIN anyway
> and the server has to send the command again later.  Return -EAGAIN
> at once when the device is not mounted yet either, using
> fuse_get_dev_nowait() from the previous patch, and don't log "No fuse
> device found" for it.

And what is if io-uring is enabled? Userspace busy loop until the device
is available? I don't think that is nice.


Thanks,
Bernd

> 
> Fixes: dfb84c330794 ("fuse: allow synchronous FUSE_INIT")
> Signed-off-by: Yun Wang <arsenova@a7snv.com>
> ---
>  fs/fuse/dev_uring.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index 460776cd69..0f725172ae 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -1664,9 +1664,15 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
>  	if (!(issue_flags & IO_URING_F_SQE128))
>  		return -EINVAL;
>  
> -	fud = fuse_get_dev(cmd->file);
> +	/*
> +	 * Don't wait for the mount of a sync-init device: this may run in
> +	 * the task that called io_uring_enter(), and the ring can't be
> +	 * registered before FUSE_INIT anyway, see the -EAGAIN below.
> +	 */
> +	fud = fuse_get_dev_nowait(cmd->file);
>  	if (IS_ERR(fud)) {
> -		pr_info_ratelimited("No fuse device found\n");
> +		if (PTR_ERR(fud) != -EAGAIN)
> +			pr_info_ratelimited("No fuse device found\n");
>  		return PTR_ERR(fud);
>  	}
>  	fch = fud->chan;

