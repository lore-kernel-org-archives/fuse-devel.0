Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725650;
	b=L26ZBYP557c0u89L7rxFDv7d5V/AUx4GN5nTeMoHPbbUFmEuY1gNwhDO0kBf1lMuTwXw
	 E8+aNpggA01XJqpg8KEb+Ygc3RgL3dUOu99vvaBo7eLbrQ81Lwhl25nCduHOYGkF5iqg7
	 wiioAdQsFA0+Wf9X3RAqCn7WnI22/AGVzK21Kt1Kg/9LXITlCEzuvIBV/Z5zOuc196UGf
	 q/PoetDg2ODDSKA1fj4hLjCKwB6AO2lhGPf1W/ypS7X3BViR3qPj28E++fPiEJh8hRbK4
	 ZH4gM50oUANy/j1c08WGa/Axw3zjDaWxe4hI2Szepezgf0Z46oieBBvpDAKmNfiW02w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725650;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=KLRMVFFyvrLd0GX9ll6qf9ApFCeqabmtblqncpF8arc=;
	b=08FLB8QCo2ik911Ddoo4+GMzcjYGlpqLXLB8tDlIqeioeZcPoWy/WfxGYg/vzqOV8rH3
	 hpQ19uVGqLAkkuGQAkI99N/+LJgjrfKsdj4gqxXtFsFGd36uRbXuTcXX9rWAvImMfSQlR
	 4yjluj2+qelT+0douuiEeFkG6AwFSIKqR7o/KDuIHZBJUNWEjwiGzt85F9pKg8x/soHBk
	 yCnfl6Uozm9+W/qQJaTXfptZBxZhzXxtNojxTgETDljHrF6vX4gYObZzOMcEzkjeTw+4f
	 K9rkDxAUCqrWxJ4q8ilgBfP446x96Ynd8rnmDbOZUlZvwUumbFlDrQTHs1/AKAVQOVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CnTckfzZ;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7AB606A32D;
	Tue,  3 Nov 2026 17:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC7AB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CnTckfzZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=KLRMVFFyvrLd0GX9ll6qf9ApFCeqabmtblqncpF8arc=; b=CnTckfzZiffq8PwgNoxN5RlRgX
	ftARL5taRaNTM/p1tPzrI3mU3xogFiaHlJrsL/CvbbHN7B9UvvxNLy5bsO9WYx7swhTc+L4M7+3Tb
	dcJO5+vHUS1bvy18mjDzhUws1m16j5IG7h97XgqruKDnD1wWoVJbzN0RsQNc+vgMfUmEMOtTR0xp9
	cfvuLGMbA2aHEZLH3s8P+mv9uKy2dDfvuzRbP1yfNnHRsrWFkhaqTpjkX7OgRWN/2aTie9Gl+9C/C
	RsGovsTg72IAyx2T0JyvJa1qdIHemZfgnlI/z6u9HS/ivdUyzGI6zCmvbTUNvLmxjPPDW5lofQ8+n
	irxuq6LQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHyq-00000003Gom-2rTF;
	Tue, 03 Nov 2026 17:07:28 +0000
Message-ID: <cead23d2-30ea-46ae-9a44-036148e943cc@infradead.org>
Date: Tue, 3 Nov 2026 09:07:28 -0800
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
Subject: Re: [PATCH] docs: fuse: fix typos in fuse-caches.rst
To: Viacheslav Shevchuk <slavik.a.shevchuk@gmail.com>, miklos@szeredi.hu
Cc: corbet@lwn.net, skhan@linuxfoundation.org, fuse-devel@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103094407.912-1-slavik.a.shevchuk@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261103094407.912-1-slavik.a.shevchuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/3/26 1:44 AM, Viacheslav Shevchuk wrote:
> Fix two misspellings of "successfully" and change "then next time"
> to "the next time".
> 
> The misspellings were found with the help of an AI coding assistant
> (Claude Opus 5.5) by grepping Documentation/ for the entries in
> scripts/spelling.txt.
> 
> Signed-off-by: Viacheslav Shevchuk <slavik.a.shevchuk@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/filesystems/fuse/fuse-caches.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentation/filesystems/fuse/fuse-caches.rst
> index 0778dd3d..d19592c6 100644
> --- a/Documentation/filesystems/fuse/fuse-caches.rst
> +++ b/Documentation/filesystems/fuse/fuse-caches.rst
> @@ -156,11 +156,11 @@ in several occasions:
>  
>  - When a new file system object is created (e.g. ``FUSE_CREATE``,
>    ``FUSE_MKDIR``, etc).
> -- When a lookup is sucessfully performed.
> -- When a dentry is sucessfully revalidated (``->d_revalidate()``).
> +- When a lookup is successfully performed.
> +- When a dentry is successfully revalidated (``->d_revalidate()``).
>  
>  A dentry expiry time can be set to 0, indicating that it is stale. This means
> -that a ``FUSE_LOOKUP`` will be sent to user-space then next time it needs to be
> +that a ``FUSE_LOOKUP`` will be sent to user-space the next time it needs to be
>  looked up. It can be set to 0 in several occasions:
>  
>  - When the user-space FUSE server explicitly requests a dentry to be invalidated

-- 
~Randy
