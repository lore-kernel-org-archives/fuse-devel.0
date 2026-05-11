Received: from smtp06-ext.udag.de (smtp06-ext.udag.de [62.146.106.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9D83BED42
	for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489819; cv=none; b=WrSbjpmqg0xQQ3ndjQ6Dk4QymnZhvb591fzHNFzba1XTKpfpaz8/HlQR4wKe+085fKEn7SS+Kq9qxIYDd+jy5wSk43mOmWfMSedYCwV22QUx4X/uWPjNQrfQxv1qJtDh9i11tbS7rT6jTTnwtKy6KVAyMkJtqKVq2vUlTO/Rsyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489819; c=relaxed/simple;
	bh=Xqf4fF6Xe5HJlStlBl8gEahfN5zn6RFHxF3MwT+DuVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+q75VSFaFWlT14jEUqHENP4zaL8y4i4yCCSAIgTGqtxPG6puaTW+/FrV3Mf05OTwnLy9si1WlFmMly+BJ2r+HS9SjPao84wca0N1ex5V1w2NRzt31QCHuguS/0B5mzWA+d6ARx0wIZoymzFZc+XPbUdnzvZA7IxSSrdKPZjtlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (139-140-067-156.ip-addr.inexio.net [156.67.140.139])
	by smtp06-ext.udag.de (Postfix) with ESMTPA id 3F3F7E01C9;
	Mon, 11 May 2026 10:50:02 +0200 (CEST)
Authentication-Results: smtp06-ext.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Mon, 11 May 2026 10:50:00 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] fuse: add fusex filesystem
Message-ID: <agGW6FCbnIyy_OuE@fedora.fritz.box>
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

Hi Miklos,

I have patched passthrough_hp to use fusex and have noticed, that I had to do
the following to make it work:

diff --git a/fs/fuse/fusex.c b/fs/fuse/fusex.c
index 98e239e7e00e..87fcfc16645a 100644
--- a/fs/fuse/fusex.c
+++ b/fs/fuse/fusex.c
@@ -14,6 +14,7 @@
 #include <linux/statfs.h>
 #include <linux/falloc.h>
 #include <linux/fs_parser.h>
+#include <uapi/linux/magic.h>
 
 static void fusex_init_inode(struct inode *inode);
 
@@ -1337,6 +1338,7 @@ static int fusex_send_opendir(struct fuse_file *ff, struct inode *inode)
        if (!err) {
                ff->fh = outarg.fh;
                ff->open_flags = FOPEN_CACHE_DIR;
+               ff->nodeid = get_node_id(inode);
        }
        return err;
 }

---


After that I could actually mount and do simple meta operations.
The nodeid is used for listing.

Thanks,
Horst
