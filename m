Received: from smtp02-ext3.udag.de (smtp02-ext3.udag.de [62.146.106.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FF53F210C
	for <fuse-devel@lists.linux.dev>; Wed,  1 Jul 2026 11:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906467; cv=none; b=FRVsYd5HTowkwviSTx1n+PpguXeTp5ZLcVa4H0hqpjPnIrcYlEqdJCk8q04tEKi9zV9mJv1UGrYe+4KXCaCUi5TIlwUO3tSYQSmhK3VXUq1PsZNHZzTodJGojlto14BzOI/v5aKUn829LN+1XXpcHbbCVptQTbbmczaDQAjTZyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906467; c=relaxed/simple;
	bh=S7uN9xJTcESf9/6InTvX36UtBgMpN5QuVfN5A8cglj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ki4M77WenrCQ0NC2mC5rSDUuV0ygWiPE+4k4paOP7mUUnzgN0nGDwU65kjKeAy/cguU0h3MiMZhHGlqkTVfGl+iWG4tC59GAb/o72zHKmikKVJyLpoInXD64rS83ntcKblwc4lk5GwVmonlmw8iKpIwFvWv3I6wMcJ3DpyK3ZKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (024-062-210-188.ip-addr.inexio.net [188.210.62.24])
	by smtp02-ext3.udag.de (Postfix) with ESMTPA id E1E4BE021F;
	Wed,  1 Jul 2026 13:47:37 +0200 (CEST)
Authentication-Results: smtp02-ext3.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Wed, 1 Jul 2026 13:47:37 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Luis Henriques <luis@igalia.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com, Seth Forshee <sforshee@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>
Subject: Re: Re: [PATCH] fuse: cache POSIX ACLs when setting them
Message-ID: <akT-LxdGyZ5u1P7F@fedora.fritz.box>
References: <20260701110052.5309-1-luis@igalia.com>
 <CAOQ4uxh0Jsa-wqXsTnroJ7W+8hspHEn8ZUrpaxi5YEOZXhCXZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxh0Jsa-wqXsTnroJ7W+8hspHEn8ZUrpaxi5YEOZXhCXZQ@mail.gmail.com>

On Wed, Jul 01, 2026 at 01:41:22PM +0200, Amir Goldstein wrote:
> On Wed, Jul 1, 2026 at 1:05 PM Luis Henriques <luis@igalia.com> wrote:
> >
> > When setting an ACL in an inode we can immediately add it to the cache.
> > This is a small optimisation, as currently an ACL is only added to the
> > cache when reading it again, which involves an extra GETXATTR hop into
> > user-space.
> >
> > Signed-off-by: Luis Henriques <luis@igalia.com>
> > ---
> >  fs/fuse/acl.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/fs/fuse/acl.c b/fs/fuse/acl.c
> > index 31fb50e16aed..c2584bb75ec7 100644
> > --- a/fs/fuse/acl.c
> > +++ b/fs/fuse/acl.c
> > @@ -155,6 +155,8 @@ int fuse_set_acl(struct mnt_idmap *idmap, struct dentry *dentry,
> >                  */
> >                 forget_all_cached_acls(inode);
> >                 fuse_invalidate_attr(inode);
> > +               if (!ret)
> > +                       set_cached_acl(inode, type, acl);
> 
> This is undoing what forget_all_cached_acls() explicitly tries to do.
> I think the reason is that kernel code cannot assume the server did
> not modify ACL before storing them, not sure, but NFS does the same thing
> with nfs_zap_acl_cache().
> 
> Thanks,
> Amir.
> 

I just thought it would be a good idea to save us a trip to user space.

Horst
