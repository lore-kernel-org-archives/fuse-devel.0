Received: from smtp04-ext3.udag.de (smtp04-ext3.udag.de [62.146.106.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD25F3C457D
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 08:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780647419; cv=none; b=gPl8fElw0t2aS0eBnQ57PwegDWGNPEnwuxe9tiR3Jr+sJFEyXzoMlm9PTDgokCDKcFH2H/KOhCrLoK/8zVyLMbH/yBlyECsS+mKoRz6CeR6i2XqtXCxlZN3s+jk8+672rnSD5RT1PTACf8h5c/AY+1voRpkMbgz6xgIgcQzCQFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780647419; c=relaxed/simple;
	bh=nJ/nHlAPVbl/fUdRTOUQIRhtvigvUcgExngBvM0A96k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQhHH8zTJ8x4anw/dk2nGAyg5WbUcWui0tfnHwRcrwyRS4oRQnIudT/xuVv1fF/T7uZwaTeyHgdFNjOU5DOMgiBhnty4fUpNez7832mQp53bPX92lk/yZFf/CwHI4/P/lMPj6T8Za4CPO4xoCC+tgXJSWa6jYtRi021AWk9F/6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (065-142-067-156.ip-addr.inexio.net [156.67.142.65])
	by smtp04-ext3.udag.de (Postfix) with ESMTPA id D95F5E045E;
	Fri,  5 Jun 2026 10:09:58 +0200 (CEST)
Authentication-Results: smtp04-ext3.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Fri, 5 Jun 2026 10:09:58 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Horst Birthelmer <horst@birthelmer.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>, linux-kernel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, Horst Birthelmer <hbirthelmer@ddn.com>
Subject: Re: Re: [PATCH v7 4/4] fuse: add compound command for dentry
 revalidation
Message-ID: <aiKD5muCy6iLLnK3@fedora.fritz.box>
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
 <20260604-fuse-compounds-upstream-v7-4-27331d085c2a@ddn.com>
 <CAOQ4uxh5OzWVVPqJMe2g_jGhXBKLGUgKcEXW-_ShKtfXuTt7bQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxh5OzWVVPqJMe2g_jGhXBKLGUgKcEXW-_ShKtfXuTt7bQ@mail.gmail.com>

On Fri, Jun 05, 2026 at 10:06:55AM +0200, Amir Goldstein wrote:
> On Thu, Jun 4, 2026 at 11:51 AM Horst Birthelmer <horst@birthelmer.com> wrote:
> >
> > From: Horst Birthelmer <hbirthelmer@ddn.com>
> >
> > During dentry revalidation the compound LOOKUP+GETATTR
> > will save a round trip to user space.
> >
> > Signed-off-by: Horst Birthelmer <hbirthelmer@ddn.com>
> > ---
> >  fs/fuse/dir.c | 113 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 111 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index b3406c33abd2..99800e8ca895 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -372,6 +372,101 @@ static void fuse_lookup_init(struct fuse_args *args, u64 nodeid,
> >         args->out_args[0].value = outarg;
> >  }
> >
> > +/*
> > + * Revalidate a dentry using a compound LOOKUP+GETATTR.  Saves a round
> > + * trip when both the entry and the attributes need refreshing.
> > + *
> > + * Returns 1 if valid, 0 if the dentry should be invalidated, or a
> > + * negative errno that the caller should propagate (only -ENOMEM /
> > + * -EINTR; other errors are mapped to invalidate).
> > + */
> > +static int fuse_dentry_revalidate_compound(struct inode *dir,
> > +                                          const struct qstr *name,
> > +                                          struct dentry *entry,
> > +                                          struct inode *inode,
> > +                                          struct fuse_mount *fm,
> > +                                          u64 attr_version)
> > +{
> > +       struct fuse_entry_out lookup_out = {};
> > +       struct fuse_attr_out getattr_out = {};
> > +       struct fuse_getattr_in getattr_in = {};
> > +       struct fuse_args lookup_args = {};
> > +       struct fuse_args getattr_args = {};
> > +       struct fuse_forget_link *forget;
> > +       int lookup_err = 0, getattr_err = 0;
> > +       struct fuse_compound_op ops[2] = {
> > +               { .arg = &lookup_args,  .error = &lookup_err,
> > +                 .dep_index = FUSE_COMPOUND_NO_DEP },
> > +               { .arg = &getattr_args, .error = &getattr_err,
> > +                 .dep_index = 0 /* nodeid comes from lookup */ },
> > +       };
> > +       struct fuse_inode *fi;
> > +       int ret;
> > +
> > +       forget = fuse_alloc_forget();
> > +       if (!forget)
> > +               return -ENOMEM;
> > +
> > +       fuse_lookup_init(&lookup_args, get_node_id(dir), name, &lookup_out);
> > +       /* nodeid is filled from the lookup result before getattr is sent */
> > +       fuse_getattr_args_fill(&getattr_args, 0, &getattr_in, &getattr_out);
> > +
> > +       ret = fuse_compound_send(fm, ops, 2);
> > +       if (ret == -ENOMEM || ret == -EINTR)
> > +               goto out;
> > +       /*
> > +        * The non-compound revalidate path propagates -ENOMEM / -EINTR
> > +        * from the lookup to VFS instead of treating them as "invalidate
> > +        * this dentry".  Keep that behaviour when the lookup ran inside
> > +        * a compound: surface the per-subop error to the caller.
> > +        */
> > +       if (lookup_err == -ENOMEM || lookup_err == -EINTR) {
> > +               ret = lookup_err;
> > +               goto out;
> > +       }
> > +       if (ret < 0 || lookup_err || !lookup_out.nodeid) {
> > +               ret = 0;
> > +               goto out;
> > +       }
> > +
> > +       fi = get_fuse_inode(inode);
> > +       if (lookup_out.nodeid != get_node_id(inode) ||
> > +           (bool)IS_AUTOMOUNT(inode) != (bool)(lookup_out.attr.flags & FUSE_ATTR_SUBMOUNT)) {
> > +               fuse_queue_forget(fm->fc, forget, lookup_out.nodeid, 1);
> > +               forget = NULL;
> > +               ret = 0;
> > +               goto out;
> > +       }
> > +
> > +       spin_lock(&fi->lock);
> > +       fi->nlookup++;
> > +       spin_unlock(&fi->lock);
> > +
> > +       if (fuse_invalid_attr(&lookup_out.attr) ||
> > +           fuse_stale_inode(inode, lookup_out.generation, &lookup_out.attr)) {
> > +               ret = 0;
> > +               goto out;
> > +       }
> > +
> > +       forget_all_cached_acls(inode);
> > +
> > +       if (!getattr_err && !fuse_invalid_attr(&getattr_out.attr))
> > +               fuse_change_attributes(inode, &getattr_out.attr, NULL,
> > +                                      ATTR_TIMEOUT(&getattr_out),
> > +                                      attr_version);
> > +       else
> > +               fuse_change_attributes(inode, &lookup_out.attr, NULL,
> > +                                      ATTR_TIMEOUT(&lookup_out),
> > +                                      attr_version);
> > +
> > +       fuse_change_entry_timeout(entry, &lookup_out);
> > +       ret = 1;
> > +
> > +out:
> > +       kfree(forget);
> > +       return ret;
> > +}
> > +
> 
> That's duplicating a lot of subtle code.
> I think this calls for some helpers.

OK ... this was a new one (compound I mean), and I valued the compactness of the patch more
than the possible code duplication. You're probably right ...

> 
> Thanks,
> Amir.
