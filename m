Received: from smtp01-ext2.udag.de (smtp01-ext2.udag.de [62.146.106.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8C037EFF9
	for <fuse-devel@lists.linux.dev>; Thu,  7 May 2026 08:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143021; cv=none; b=tOYKbp0kEhE/O9/ONpTJ6E27JwBjKDDKSWi3p9H5+fbBbSF11A3zxi16wM79h93gAooniFiaqhfs35UJlWZSMrfo3fKT6D5X8GUl4c6/zezW3czov3pqspjmmbz12xzFSZDpvGJRx8l6Cm1a0xGxPzP2p8vsxurAsrlW4g0pykI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143021; c=relaxed/simple;
	bh=ZvNaRGxYzM8R4XTfEtjMDhYIB2GeaeNTjG3TbY9DuYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unxx2sg/xiRnjp4p+xfXtD7qNhwtAVAOzLbeL5s2mEgaBDoiagWODHD/QHimnFcWlDuTPLm1TvIGeCVgkrax/Q/Y3m7UbDGXV0/Yo03oHnMM5zityLLzuAhiVmAivjqgc8uOD9hx++8PdYRpCCLSy9pQy/pjr6IcCIMCAy/GdNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (unknown [213.147.98.98])
	by smtp01-ext2.udag.de (Postfix) with ESMTPA id 44C3FE0944;
	Thu,  7 May 2026 10:31:06 +0200 (CEST)
Authentication-Results: smtp01-ext2.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Thu, 7 May 2026 10:31:04 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] fuse: add fusex filesystem
Message-ID: <afxK2HSiwY32KaWw@fedora>
References: <20260429102058.1362965-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429102058.1362965-1-mszeredi@redhat.com>

On Wed, Apr 29, 2026 at 12:20:57PM +0200, Miklos Szeredi wrote:
> This stands for "fuse extended/experimental".
> 
> The purpose is to provide a clean base for big features like the FUSE_IOMAP
> api.
> 
> It's also a good way to try new stuff like file handles and compound
> requests without the risk of breaking something in the large and complex
> fuse codebase.
> 
> Whether these features will be migrated back into the main fuse codebase,
> or fusex is going to end up as a major version update is still up in the
> air.
> 
> Major differences from regular fuse:
> 
>  - local filesystem mode only
>  - only synchronous FUSE_INIT is supported
>  - only no-open mode
>  - new requests:
>    + FUSE_LOOKUP_ROOT - return nodeid of root
>    + FUSE_LOOKUPX - FUSE_LOOKUP without the getattr
>    + FUSE_MKOBJX - merged FUSE_MKNOD, MKDIR, SYMLINK and TMPFILE
>    + FUSE_SETSTATX - extended version of FUSE_SETATTR
> 
> Missing features:
> 
>  - file handles / export ops
>  - compound requests
>  - xattr caching
>  - fileattr
>  - fiemap
>  - ioctl
>  - copy_file_range
>  - lazy dir open
> 
> Test server can be found at:
> 
>   https://github.com/szmi/fuse-utils
> 
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
> 
...

Hi Miklos,

I really like the new shiny fusex. It just has one heavy drawback for me. 
It is not set to support remote file systems.

I have a coupe of questions that I would like to ask here on the list.
What was the reasoning behind this? Complexity, lack of interest from the community/users of fuse?

Where do you see the biggest challenge for this. To me, it doesn't look impossible to add that,
but I'm sure I'm missing a lot in this context.

Thanks,
Horst
