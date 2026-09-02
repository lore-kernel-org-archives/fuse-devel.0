Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1634B1272;
	Wed,  2 Sep 2026 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368452; cv=none; b=nGs/I953iN6bdCqzu27u+oWb7xKFkXSvhZvsDQFGs+V+YwKlKRNJWqLM9Y2dnF/7qAIRhg55VnikJHSxLmuUYHajaHogbMWv1SdT4bwMHqydR41esjsekMCe3ZToh8c3Slqb/nH1M6WOlkRoPEpYqQ8nHqkQfa6Vqukmbv5IjR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368452; c=relaxed/simple;
	bh=D3lJpq+jx9Xd0lCiMWIDke55AqPQ53y7tXdw894mwtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ea9pL2Et4YpyPZN6HogZsgGRqspuec4QzjyqnSfdiYohMzuoEHIKSJGMK9bOTBie4gig3eFVWlUvB1P/a6LBy8TbtuuraTb6d3Uc2oc//PrAOmNoXRNRv4fTLtwYZEOliDBkAZHgvRfoEU6yBwpTu+stWcDahR1aiysS9XVvR9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RBMFhir6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RBMFhir6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=E2vaO3YjVSSC5+Npa0rciElxgRGVqK95oNyRn4MLJyw=; b=RBMFhir6pzq7zqy3vPrPZT+i8w
	NV1a/NiRjTMMVLrgRD2OppXpH1bmLoXmiAqiOmtduPXZeJLvtuaMUw/+CC8nCC7hu8SJCprNE2WQ9
	JgS2wW6EsYxnH4roPPGrzT4XUWVSmvZy2eYh1uW04fULxXKOQedLVf7PQzwlIR17IuOj/zQb50maX
	pL8OmAXgrGeoJID/ds80xXMctazwkfCtOi55rt6hIrnBl9c1OHhBjUiJM9iW+2TDJ4XsP3yL0z1px
	nCGX70OxxzstQdn4mTFuyMSnTLl7uNRVUZ+qGwEswH3Li4BFd4q4pIGc7TZ7xDWbYtMHG1kET7pmD
	GvPSRPyQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oKN-0000000FLU4-25hr;
	Wed, 02 Sep 2026 17:00:47 +0000
Message-ID: <6530afe2-f4be-490b-86a0-f09ac106d0d8@infradead.org>
Date: Wed, 2 Sep 2026 10:00:46 -0700
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: fuse: harmonize numeration
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: fuse-devel@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260902143541.703277-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260902143541.703277-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/2/26 7:35 AM, Manuel Ebner wrote:
> Replace with '1.', '2.' with '1)', '2)' to harmonize file.
> 

Yes, that does make the .rst file be internally consistent, so
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

It's interesting that the generated html always uses periods
(at least in my testing), regardless of what is used in the input
file. E.g., "A)" becomes "A." in the generated html.


> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  Documentation/filesystems/fuse/fuse.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/filesystems/fuse/fuse.rst b/Documentation/filesystems/fuse/fuse.rst
> index 0fbd5a03f..063d99959 100644
> --- a/Documentation/filesystems/fuse/fuse.rst
> +++ b/Documentation/filesystems/fuse/fuse.rst
> @@ -173,10 +173,10 @@ the error set to EINTR.
>  It is also possible that there's a race between processing the
>  original request and its INTERRUPT request.  There are two possibilities:
>  
> -  1. The INTERRUPT request is processed before the original request is
> +  1) The INTERRUPT request is processed before the original request is
>       processed
>  
> -  2. The INTERRUPT request is processed after the original request has
> +  2) The INTERRUPT request is processed after the original request has
>       been answered
>  
>  If the filesystem cannot find the original request, it should wait for
> @@ -239,9 +239,9 @@ How are requirements fulfilled?
>  
>   A) The mount owner could gain elevated privileges by either:
>  
> -    1. creating a filesystem containing a device file, then opening this device
> +    1) creating a filesystem containing a device file, then opening this device
>  
> -    2. creating a filesystem containing a suid or sgid application, then executing this application
> +    2) creating a filesystem containing a suid or sgid application, then executing this application
>  
>      The solution is not to allow opening device files and ignore
>      setuid and setgid bits when executing programs.  To ensure this

-- 
~Randy
