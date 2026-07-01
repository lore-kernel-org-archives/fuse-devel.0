Received: from smtp01-ext2.udag.de (smtp01-ext2.udag.de [62.146.106.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE80423168
	for <fuse-devel@lists.linux.dev>; Wed,  1 Jul 2026 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905967; cv=none; b=Th2LUQUB1aKC4VYJUhQc5QxumvZWldPeehaGIwGYeYm51WxvFk61A8YnNCNA16s6zefy5CXe/czlMJKXGejz2YsOqtt/6lRBq9nRDQmqBIJgsWGQSGYDxt+re5ivs9Z8ih7hzjCjaDGJ/Q9U88i1V2mRW01B/K/EG+f7PCjc5XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905967; c=relaxed/simple;
	bh=uCej0eMw8YQZOH+KmOmo0z+iVjeQ/NOKURCGRT+G1Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UveDeQhLh6v2qWqRrwSlZrAmkPJdgYKdosfliPAy2M+/yYeJEfKsA2NP+BorSgEKJAVgH0sVPYVZtEZySqkN+GqTdquhdJKN7598ZBo1ZClD1CmmDMLxoNwsotPZmvr29xKSPuMacHTzt9MjH7R/mRcbs/ML52mdeZ5NVOTBuOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (024-062-210-188.ip-addr.inexio.net [188.210.62.24])
	by smtp01-ext2.udag.de (Postfix) with ESMTPA id 53836E0682;
	Wed,  1 Jul 2026 13:39:17 +0200 (CEST)
Authentication-Results: smtp01-ext2.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Wed, 1 Jul 2026 13:39:16 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Subject: Re: [PATCH] fuse: cache POSIX ACLs when setting them
Message-ID: <akT8DOkWFozLMe-H@fedora.fritz.box>
References: <20260701110052.5309-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701110052.5309-1-luis@igalia.com>

On Wed, Jul 01, 2026 at 12:00:52PM +0100, Luis Henriques wrote:
> When setting an ACL in an inode we can immediately add it to the cache.
> This is a small optimisation, as currently an ACL is only added to the
> cache when reading it again, which involves an extra GETXATTR hop into
> user-space.
> 
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  fs/fuse/acl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/fuse/acl.c b/fs/fuse/acl.c
> index 31fb50e16aed..c2584bb75ec7 100644
> --- a/fs/fuse/acl.c
> +++ b/fs/fuse/acl.c
> @@ -155,6 +155,8 @@ int fuse_set_acl(struct mnt_idmap *idmap, struct dentry *dentry,
>  		 */
>  		forget_all_cached_acls(inode);
>  		fuse_invalidate_attr(inode);
> +		if (!ret)
> +			set_cached_acl(inode, type, acl);
>  	}
>  
>  	return ret;
> 

LGTM

Feel free to add
Reviewed-By: Horst Birthelmer <hbirthelmer@ddn.com>

