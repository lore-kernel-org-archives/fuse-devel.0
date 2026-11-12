Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495707;
	b=NbZZ6OqZt/aZTFbdQrR0F5SmtlGAxh+ZEhCRuwuuMgObiegkLGfNe+NigHlyVkkccj3R
	 QBwhZowtbv0mxc2JHLs3uT1NCmQ69U2NKXbtd97kH8db7woQORX5QlnzmgdBd6aNpuP5W
	 XvsYsnKRuZ5I5GEt78dr7kmGy6UMqs4Bxg5/dThHB5gzy7pHK6lWur/h7aekpSDzjnuQ0
	 FadlqnIvSE9gaUz2rK8Edvs/zAVIDx/A8bVYS39VpN6a0GpAzbkf++uteaSpcnTghSP0r
	 p14xpoo1fHrdrsBI09bFIOSFxtu3V2IOphv7HoIq8tgN4se5rkkij8BPSL2vix8J2zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495707;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=mpXlpjdkWY46x6nl2lgddCsBWNhG/QtyR/nSFtAJaS8=;
	b=rDd6dpTNlgb9SYU9kJHBeitF9Kp6xcVPSG6Ta2sAS/WJpEH5J67a8pqWvq8mhEFqlBGD
	 HafKxygqmpMMuK6XehbrO+GftK2qKbsUENgnVNAlN+wsbNBIztDrLNcM7zKd9taC0Of4Z
	 pbbg4FyJOehycRlgWQpS9YvFM5hZ4qdoyh9kp9A2/iGPMNCDJM7Aye/LwuaMFyr64UDaK
	 sK1GvNHerBV3bgjwwHok3CQMLsjDTphhqCgasDv+DDw3hMM2mzffcUC9rsjYuaOuCSIhh
	 7/bJh778LhpioK9/LnyVTbChcKVpQsx05wcU7b0I/BEiQnW6pQZDN3g0XR7JmL4paZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=DJbmiuP+;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A5F606A327
	for <fuse-devel@lists.linux.dev>; Thu, 12 Nov 2026 15:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88A5F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=DJbmiuP+
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 40B5A40904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1794495707; bh=mpXlpjdkWY46x6nl2lgddCsBWNhG/QtyR/nSFtAJaS8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DJbmiuP+vyLzDQqWzlybH0zs83ocLR2kXe9XKBAZgnhm+CKOba/3u0e3mHeD+KibI
	 2bqFHDRNU/FO5P3FrJb8yOMTAEe0dR8BMFYcBeXsBCF/oyvUJiQ5kIskw+RnGSvLhL
	 cxOIyawAYLy+kFZ6nMfhit0nrmuPEpcMuQiUtKqqddCPXK+t3+itMUJAGFic2NTKZf
	 gJ86wEreaox2E2iYxp33ngbRYA3wKgeMj8wIibK8BRk3crzfDWg9wDrSyXQtnXjFRF
	 WVSkDSWs8uLuP+qFFmaF1gwYGyuw8H3fxUvHAq+M4zBvK4TJ24jjgZRjTSpeW8/uo7
	 wwoclZbsl784g==
Received: from localhost (unknown [151.38.237.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 40B5A40904;
	Thu, 12 Nov 2026 15:01:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Wei Lixiang <weilixiang@kylinos.cn>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, fuse-devel@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: fuse: fix spelling of 'successfully'
In-Reply-To: <20261102093827.6-1-weilixiang@kylinos.cn>
References: <20261102093827.6-1-weilixiang@kylinos.cn>
Date: Thu, 12 Nov 2026 08:01:43 -0700
Message-ID: <87v7625c14.fsf@trenco.lwn.net>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Wei Lixiang <weilixiang@kylinos.cn> writes:

> Fix two misspellings of 'successfully' in the FUSE dentry cache
> documentation. No functional change.
>
> Signed-off-by: Wei Lixiang <weilixiang@kylinos.cn>
> ---
>  Documentation/filesystems/fuse/fuse-caches.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentation/filesystems/fuse/fuse-caches.rst
> index 0778dd3d357f..de1a452fdd31 100644
> --- a/Documentation/filesystems/fuse/fuse-caches.rst
> +++ b/Documentation/filesystems/fuse/fuse-caches.rst
> @@ -156,8 +156,8 @@ in several occasions:
>  
>  - When a new file system object is created (e.g. ``FUSE_CREATE``,
>    ``FUSE_MKDIR``, etc).
> -- When a lookup is sucessfully performed.
> -- When a dentry is sucessfully revalidated (``->d_revalidate()``).
> +- When a lookup is successfully performed.
> +- When a dentry is successfully revalidated (``->d_revalidate()``).
>  

Applied, thanks.

jon
