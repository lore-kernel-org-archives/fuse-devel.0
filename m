Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638947;
	b=CBeUs/46uXJ2fTtYTk2kOAucr6KL+ZrKped4MXbxxnglBqKZsUVrK7kgUH6eHx50SKq4
	 yGAIWcSLuaU3XSWPtp7RzDetjvu6NOyK5C/2kRUuwKlVk3n9SwThDxJp0uKVljlGhtUiQ
	 0wGkXqGmW5OVMYZ3kdpqB0fKOEeqTYsmjb6Z5lAPXqOVh6QZy4dlGrc7Aj13Q+QVWv2Ub
	 EJ6NETSyXcnhxIDP/TxgSsut3z/GGOPwhZxsgfMTyra70pnznpUdpqOfHdDyuJOsIg2Yf
	 Vma0NsFxtf2U53I9KJhx0waSQxw6n5JLIpz2N4BPPmAYTGL6pxjJsQn7uNAoMuAqxiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638947;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/Xhd5QQQPN+fr/m/CfoFRmyvKrObNyomsD9xFWfUEbI=;
	b=3LTKD12P+P4lwrh1A2pwMaFZarve60HDrBzCBGzadydAfsFr4noq26fYsatA4X3v6up5
	 0SDude+FlYxVAWw5pfw7zWsXnxUGAD+ONwQoreLCxT+YcVPWNQVYYT4PSx1+LhBf6y+IV
	 hNwksibKkW9QL07M2Ekv6JoyXj3Qx/sIpcaX9xFKuZOYH9xkOaKHbt0cGPBpKR8GyKntY
	 iUeBZKt/EreiC6a5keemZI0bxsrMwLxQXlPLxSJxOGPUf0UAZp1ALr0oH1FOob9gr8RR/
	 Ghr0NT1tbdlqdXzMAnDCbPv4mQu8aiuupgUhicImjYe3BJpIMbXrNUhSf2UcgsYvKYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CVY9ESBT;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB4C606A327;
	Mon,  2 Nov 2026 17:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB4C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CVY9ESBT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/Xhd5QQQPN+fr/m/CfoFRmyvKrObNyomsD9xFWfUEbI=; b=CVY9ESBTvcWlGwUV39+S2A8lSC
	xMUPyNqiqf5Eti6nA+eO0FuPNNfkkMSs7UNCp91yOl90wvzh//fzWAi5cUt8AVpIQX3iBPADS4Z8S
	e4l+v+bbcEIlqxbKsSK/rxXOv1FWkD5AnKCCiIWqamc4Ofe3J7lGEe82MOTGMJ3/+n1pKuL4hNfnV
	Q8v+ZhgGk9R1DHv6PhUqNC1YrDbsIkU0jwIUpTf5bYqOogtIEU1hoskuNveVsU3swK7Zp+QMuPux4
	qZgv+ZM1y0jLi3HSt4xzXWcWQzXZzFUWoprSIs520FS22QtGm1cdV7a1Mi9J9Jzx7S5gyXBcsuwMK
	8ss3sn6g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvQN-0000000HNzf-005O;
	Mon, 02 Nov 2026 17:02:23 +0000
Message-ID: <41ffaec3-aa57-48e3-9d1c-1ae41ee60349@infradead.org>
Date: Mon, 2 Nov 2026 09:02:21 -0800
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
Subject: Re: [PATCH] Documentation: fuse: fix spelling of 'successfully'
To: Wei Lixiang <weilixiang@kylinos.cn>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 fuse-devel@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261102093827.6-1-weilixiang@kylinos.cn>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261102093827.6-1-weilixiang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/2/26 1:38 AM, Wei Lixiang wrote:
> Fix two misspellings of 'successfully' in the FUSE dentry cache
> documentation. No functional change.
> 
> Signed-off-by: Wei Lixiang <weilixiang@kylinos.cn>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

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
>  A dentry expiry time can be set to 0, indicating that it is stale. This means
>  that a ``FUSE_LOOKUP`` will be sent to user-space then next time it needs to be

-- 
~Randy
