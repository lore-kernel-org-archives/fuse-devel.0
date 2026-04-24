Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08E53112D0
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 08:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018691; cv=none; b=f3QdzordJ0Q7LYs3dvxu0R8PfN28TjFmv6c1AtkD7pIq8NcY4YqZxve+kOUHO5cK4aorCAsJtNagxgcZ5h9OvZYFix3NCLdH72xdWweFPvat/N4xHJWmojY3ayy3lJ27mycVJqJl466KxW1guzBaBIXiu8tqucCp6dsY1KqZxlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018691; c=relaxed/simple;
	bh=/SfIacRO4JvFgjCDmvm7X1GvncV3yliOlxxccBeA1Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8w5ZiSWj5jjbXAN1CuAJ/6sbF9IuRDCc/R3wKuan8BQvvl+bDRKkYYKiH/abVhT6n+9mE1o3EzPmLONOdAXBo/iEC4RBX0PVN3icSEQI7FvZjJmo5F98IOcfYvEJmcWdMhoa2oVoraR6JfRFRzmiY/qZqv77Dq4aXFNRnooN8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+7cdPyC; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+7cdPyC"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so12549528a12.1
        for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777018688; x=1777623488; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3mVkRL27DP21d9mBuZDyJuxeE8pzshs09F4FKldQRNA=;
        b=d+7cdPyCYChofxsKEu57RdcrULGaIHUYvSBLaQHtqNCmxRSlcXsmWJmbaGi65PA9RB
         4KrElYma5iXuXuzVHqy1iHQfprLTwdcGUxOosy7BQUcZNYWWOIqvaQuNskSoAYqgKsoA
         DiRE0T/Mb10YzReKHCgFVMkpkcFChtWKm5aTpHN4hIO8nXboGZs+/s4azyLydsstpFR8
         bVPwDxQBdhI7zoRLLVQvtraavZ3zp4HMF9g8eqjWGY3IOTospU2Q8DHM3C/J7udrho83
         ryTQrGmL4Wv30d1FBlkpXisJZGxJTtbqVNxQTRvTJXaZ2fp0f2gb3GLR1+zs08Kdnqni
         7Qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018688; x=1777623488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mVkRL27DP21d9mBuZDyJuxeE8pzshs09F4FKldQRNA=;
        b=J1qOMW5fiZvFit+6C6qKOF4JrUnFT+PQncUw0+3ELo6OtSU2BiYpC/K94wQGaIgYez
         BTAv748JfUEs3vC/hJB84ptccMGS1CPJTqKjrEuMTWulitbjba2RZS0KT4ELzl3pO6T/
         KacFFOpapaKJd7BcuB5/GTRz1avlvq/Z01tcaHJ3q8hAZQ0cwbdR+sW8G4I3hIpovQiJ
         lsdiUJkX7OT6adlKxyRGUd4+Ca3CXkzUimcZSpJVrYuDkKztZjmuILQB3LlEROlbFqmD
         YpGeZYpKW6cs9ELWaMA51NyC/cw9gGF6lL9moLgjRBd0W77nKJEt8Bv31csbjgV+NWyb
         f05Q==
X-Forwarded-Encrypted: i=1; AFNElJ/sCAMFyq6iYw3GUZhoU1x4My/zE1mGde3rG8y0qhy4T0IKTGU8RT6jjCyzB+7OZRtnak0TuxvKYGSI@lists.linux.dev
X-Gm-Message-State: AOJu0YwXFZkF2Cn2YirLhdpwxLxn+picOPMkDrBRWy1dIyQC9wmphfDm
	yzbVBhXVCjvfQFs0fMNr0aFmV6Dtn/+sqiOhYmHn92k54lr0nauUGE0L
X-Gm-Gg: AeBDietAg7ogdAzSEWBDMB6OMsA6djWkQVK8Bgr7qliZs0btFYr5M7JZ2JOAKOKlTZR
	6fWmd7PPsCPFMFoEPiPhDFGO/iIl8Cslw3CGwSGEnFt/gpK5An+bByrHbAG/ELfjeXcTTjMuTKM
	awIuqvqR40duD6/eE4a5NjKpWpkZ7/hTH9K6SYPkPosKRRmPzDZFu32sNSKa+IVOfQGivM/AaCx
	SM1aRRI0Lh2xCym+ewWTGUiQyaI9hC/HI4Sa2sH5KXNlOq+a7PqKR6aWgrbBSZQm1rUHTwm6PL2
	Ei3+XUMzjGQIJtVdD+PxMujSAk2KKTGQ5cvVQpuCDFqtQ0bSuKCCWnF/ceOO8i2rbpRyA+Dvmla
	4lTSK9qSIJnYvhBgNE2H0V7fz4gmA0//ZRBb63+s4S2mYkKkxBG8nhdwRxraJDh0JINBEYcZbl+
	x8qY9rwmlL/Z0yWe96/OG1lNqk/8UhmFMsrdHWQi9MGq0bTDHrTQ83/KvNnY1O2B/LTDdVksmaJ
	GXtHUhWmI78MioNMZjZRmaisyxXFj77Jh9xmKI=
X-Received: by 2002:a05:6402:1cc2:b0:670:13a3:646a with SMTP id 4fb4d7f45d1cf-672bfdd2090mr13872950a12.15.1777018687729;
        Fri, 24 Apr 2026 01:18:07 -0700 (PDT)
Received: from localhost (2001-1c00-570d-ee00-4aab-734a-1928-df3f.cable.dynamic.v6.ziggo.nl. [2001:1c00:570d:ee00:4aab:734a:1928:df3f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d4590asm4630607a12.19.2026.04.24.01.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:18:07 -0700 (PDT)
Date: Fri, 24 Apr 2026 10:18:05 +0200
From: Amir Goldstein <amir73il@gmail.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v1 01/13] fuse: fix missing forget requests in error paths
Message-ID: <aesnPUrYPZD1SrZv@amir-ThinkPad-T480>
References: <20260424011646.457682-1-joannelkoong@gmail.com>
 <20260424011646.457682-2-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424011646.457682-2-joannelkoong@gmail.com>

On Thu, Apr 23, 2026 at 06:16:34PM -0700, Joanne Koong wrote:
> If the server returned a valid nodeid but invalid attributes, the kernel
> needs to send a forget request to tell the server to release its
> reference, else this leads to server-side leaks. These paths only
> trigger with a misbehaving server returning invalid attributes, so the
> real-world impact is minimal, but forgets should be sent.
> 
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dir.c | 52 ++++++++++++++++++++++++++++++---------------------
>  1 file changed, 31 insertions(+), 21 deletions(-)
> 
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index be41c14ef329..6ab05d7d297d 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -583,7 +583,7 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
>  
>  	err = -EIO;
>  	if (fuse_invalid_attr(&outarg->attr))
> -		goto out_put_forget;
> +		goto out_queue_forget;
>  	if (outarg->nodeid == FUSE_ROOT_ID && outarg->generation != 0) {
>  		pr_warn_once("root generation should be zero\n");
>  		outarg->generation = 0;
> @@ -593,16 +593,18 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
>  			   &outarg->attr, ATTR_TIMEOUT(outarg),
>  			   attr_version, evict_ctr);
>  	err = -ENOMEM;
> -	if (!*inode) {
> -		fuse_chan_queue_forget(fm->fc->chan, forget, outarg->nodeid, 1);
> -		goto out;
> -	}
> +	if (!*inode)
> +		goto out_queue_forget;
>  	err = 0;
>  
>   out_put_forget:
>  	kfree(forget);
>   out:
>  	return err;
> +
> +out_queue_forget:
> +	fuse_chan_queue_forget(fm->fc->chan, forget, outarg->nodeid, 1);
> +	return err;
>  }
>  
>  static struct dentry *fuse_lookup(struct inode *dir, struct dentry *entry,
> @@ -882,22 +884,21 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
>  		goto out_free_ff;
>  
>  	err = -EIO;
> -	if (!S_ISREG(outentry.attr.mode) || invalid_nodeid(outentry.nodeid) ||
> -	    fuse_invalid_attr(&outentry.attr))
> +	if (invalid_nodeid(outentry.nodeid))
>  		goto out_free_ff;
>  
>  	ff->fh = outopenp->fh;
>  	ff->nodeid = outentry.nodeid;
>  	ff->open_flags = outopenp->open_flags;
> +
> +	if (!S_ISREG(outentry.attr.mode) || fuse_invalid_attr(&outentry.attr))
> +		goto out_forget;
> +
>  	inode = fuse_iget(dir->i_sb, outentry.nodeid, outentry.generation,
>  			  &outentry.attr, ATTR_TIMEOUT(&outentry), 0, 0);
> -	if (!inode) {
> -		flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
> -		fuse_sync_release(NULL, ff, flags);
> -		fuse_chan_queue_forget(fm->fc->chan, forget, outentry.nodeid, 1);
> -		err = -ENOMEM;
> -		goto out_err;
> -	}
> +	err = -ENOMEM;
> +	if (!inode)
> +		goto out_forget;
>  	kfree(forget);
>  	d_instantiate(entry, inode);
>  	entry->d_time = epoch;
> @@ -925,6 +926,11 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
>  	kfree(forget);
>  out_err:
>  	return err;
> +out_forget:
> +	flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
> +	fuse_sync_release(NULL, ff, flags);
> +	fuse_chan_queue_forget(fm->fc->chan, forget, outentry.nodeid, 1);
> +	return err;
>  }
>  
>  static int fuse_mknod(struct mnt_idmap *, struct inode *, struct dentry *,
> @@ -1010,18 +1016,18 @@ static struct dentry *create_new_entry(struct mnt_idmap *idmap, struct fuse_moun
>  		goto out_put_forget_req;
>  
>  	err = -EIO;
> -	if (invalid_nodeid(outarg.nodeid) || fuse_invalid_attr(&outarg.attr))
> +	if (invalid_nodeid(outarg.nodeid))
>  		goto out_put_forget_req;
>  
> -	if ((outarg.attr.mode ^ mode) & S_IFMT)
> -		goto out_put_forget_req;
> +	if (fuse_invalid_attr(&outarg.attr) || (outarg.attr.mode ^ mode) & S_IFMT)

This seems like a repeating pattern.
Would you consider hiding this behind a helper that validates we got
an expected set of attr:

        if (fuse_invalid_attr_ftype(&outarg.attr, mode & S_IFMT))

Thanks,
Amir.

