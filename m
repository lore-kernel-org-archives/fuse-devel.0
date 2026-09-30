Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F604FD7AC
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778595; cv=pass; b=QbfgsVuzdQc7TXKkUMIOg4va+iWZ0/JsQ+6NNo9tiS0MNDQrTRnveGg6osFlLpgMVrmbe8IUwNTco1RuZ53BN57XiNetpzh9A4wxHMEz9lW6S9bYNF6oJONx6Wn9y2lEhGu+57d88PPtBip+95xBOnODP4Z2G50hg6Rp4GlzOH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778595; c=relaxed/simple;
	bh=Jv5f1g0f3qDS45IX1yQFN/XI/1HiyQaIpDbEOG1DCc4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Wr7a20VT0CRqlZnGWVAq3lZR3oJqv0IUbAHdzasVXgFEeEnRQIrRn8eU7lg/BwJwTdJWKq8ZdABeJWbV2x/1TnD6YFOzyokQ5v7+9SeEJHu/7oXw6MUaXSh1TPj7CArcC23jFMihsNOHw7OsFkgDV8vu4fEOtjMtfjSJKUEd34w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=alFWgbX7; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="alFWgbX7"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-532db7db0c6so50023311cf.2
        for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 07:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790778585; cv=none;
        d=google.com; s=arc-20260327;
        b=InEDYhInhBOMTok1bI1XYineYGVOPhMmi6QeQpmlUyvQgyr5T4saYGFo4UG9W5IAoC
         aO08juNE4q/bROkzbDTvjO/+by0yGResET9xlvSkxLX6rxpgTKwyfLUx6XWG2P6lag/4
         eWrLlaTFnvRdJzGeeDCFXSXB4M6myxa+TAISLoRSjqK11X9jmN6Ak50UwbFJbC4Nb6f4
         vNuXteQR+G3pIJVWO9I0VrMjdm+1IGZVa2T1Zc0aQL3P1XAoRw6/bxh7UkR815+0DyVn
         2WB4evX2bpPrSDWptSe/rdVpWti7zyoD4H2F2D7hOeTRzwOv9Q10kI6wblIgWgWsdOel
         nAbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=bFcOr5qvsPCgBjFZ4BWLUmj9QlCgJD693TK70ZfQ/Lc=;
        fh=RdhYxw3WNprI8C7jm6iVbPto+aX5foBn46Nsr1Lhdps=;
        b=POGW7K90ZHCbK2bxDs6Eb6KxdbCxC0WftCr89CKfnGPWEhIkeqtxu9BNryyepOtUIZ
         gHFq+Y/c9HcUHc9IMnL1WI5YYzOFbGhUMHYbmCaaUa67GsQpn+ydoqfCYqZ6YuMuqSSF
         cuLrNudKEeXnbRRYFLEmzyNK/reqZBusI0EbkPMW7WuHTfWm+ZMnFFZe/IpseNYpzU1L
         dpD++SfYA5Xy2q/bA2zvYNShbClqEHw42nGngWKlU2O6iUsZLGaMeaBrnZNFzgr4Ojjs
         xB/q9loSDjsWQXlyjIQDWOj9j8a6eGCKFVRwjV8tgvJwoc8ueAlP9vi8dXaZV380V2fW
         BBrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1790778585; x=1791383385; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFcOr5qvsPCgBjFZ4BWLUmj9QlCgJD693TK70ZfQ/Lc=;
        b=alFWgbX7pccMXsmZjsw5DXuqREEPQaa+uIwTxCwzn8WKIAF8uTm0EMXtYKStmIvMkB
         Y3xexy/O6iks1IMDNwNFx7mJMShEBw1dO+tK2lrUwD8ruGMPF69ruZpmAoxoR/N8IzXi
         eSug9pYhQjWQEeX7H0Nl5m4gQN7XmbtHrooTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778585; x=1791383385;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bFcOr5qvsPCgBjFZ4BWLUmj9QlCgJD693TK70ZfQ/Lc=;
        b=P86EKHZISZbGoiN7gq/sPl3tfBmHKJ2nsN/rz3ZdHVifcmeYbcsmyAh4SggnsmqUMv
         S6L0Rs4pP22t4IjBEP7wqj/ev4+l1DiOTfG1ZhLFG8Izx9hDSLtaULz+bqHYgttJXUuR
         hgRVCl6l1qnQdAq0Yuz1RFbo03m50x95EjFLEVTa/Ev7kkYSFKmBscQOX4OzwRk2mCBd
         QI94PVzhXCLeyZVkVMK1gVy0FECWFes4bY+O4B5XxQHfwH2ET7UIxdrgURb8peiq2Uf+
         3/jl9+gotuQ2ExpZkbgWegqYFcxn9mVmjgNAPXpcgVwSZMJf83VCHiQQyRvPEt5kUdHR
         KuYQ==
X-Gm-Message-State: AFuF++kyz5TsV5wxC/lT2lDffm77/Ffz4ugY+Js4Uhr1aLmyJd97kF+e
	R/9DGb32lQWEw40vXjgVvY47V7+qnRVwd+RVYreR5RB/DZ4dvTGRrW78Y4p38IWKNMYvNo3kdGd
	1e4mrl0gnqmppd0/+e7bzvi2TQ1pJzSK2MjKHSpfisg==
X-Gm-Gg: AYBFou0lkZ+mDk0nE4IOcXl+h3ztYgzXnlS717WdFZrdv82aJW5RfNCvWlLqHMJ/ZJU
	I6Tk0mMhscfL6EEKI6mgShUtKyP0J60OrAR8F4QcgWgwFUyKloWCn1/CY5ijdFATVdbeKzqNI6O
	2dlP5HHu/FWz1iLhRiK1fSbSH4dJowx7HhnS9O7FIAnJc9LL24bjrAtJdCyuPzFcTd2WLZbh2/v
	b9a2mxtGH8jK/qr7FqdWPFiUA/HG5ysT/9knR2vBsXgWnuj1FG7BiMFGsjAQsbqZQbaVacdFWrg
	4T3PAkGvhSt2MYvlWQFuCr9f8ug48Clb3IEwN0MwfKIh44BCzrzCogxY6xIKgHYzSvI1PhiK31Y
	pqUKk9ailpItlFA==
X-Received: by 2002:a05:622a:258f:b0:533:32f3:1db0 with SMTP id
 d75a77b69052e-533742bb8cbmr29673951cf.6.1790778584578; Wed, 30 Sep 2026
 07:29:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 30 Sep 2026 16:29:33 +0200
X-Gm-Features: AclHuK8GeOe_W3mvOTyMrVDZeZ25RiRcVppHiB0syijS4_yNrxLEymVmpXQKS-M
Message-ID: <CAJfpeguyOXGQO4Q8rSAc8GxExTJU0G2o19fxRnh_93GvAoNcRg@mail.gmail.com>
Subject: fs_put_dax() vs. dax_holder_notify_failure() race
To: Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org
Cc: fuse-devel <fuse-devel@lists.linux.dev>, Carlos Maiolino <cem@kernel.org>, 
	linux-xfs <linux-xfs@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	John Groves <John@groves.net>
Content-Type: text/plain; charset="UTF-8"

During ->notify_failure() callback will dereference holder.  It may be
NULL at this point, resulting in an Oops, or it may be non-NULL but be
freed during that call, resulting in UAF.

This affects xfs at this point, but the fuse extent map patchset[1]
also adds dax failure handling and is affected by this issue.

I think this should be fixed in drivers/dax/super.c, since this will
be a problem in each user.

Thanks,
Miklos

[1] Report from sashiko (select Patch 8):

https://sashiko.dev/#/patchset/20260922061019.3320196-1-mszeredi%40redhat.com

Or here it is inline:

commit 1580a2f8ad3f103a20b6280aa39a01f8b0be2d3f
Author: Miklos Szeredi <mszeredi@redhat.com>

fuse: add support for opening dax device as backing

Add FUSE_BACKING_IS_DEV flag that allows opening a character device
(dax device) as a backing, in addition to regular files. Mark the
inode with S_DAX if FUSE_LOOKUP returns with FUSE_ATTR_DAX set.

> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index 58dbdd17c1ef4..aa558a0c2e647 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
[ ... ]
> @@ -22,9 +23,16 @@ static void fuse_backing_free(struct fuse_backing *fb)
>  {
>   pr_debug("%s: fb=0x%p\n", __func__, fb);
>
> - if (fb->file)
> - fput(fb->file);
> - put_cred(fb->cred);
> + switch (fb->type) {
> + case FUSE_BACKING_PATH:
> + path_put(&fb->path);
> + put_cred(fb->cred);
> + break;
> +
> + case FUSE_BACKING_DAXDEV:
> + fs_put_dax(fb->dax_dev, fb);
> + break;
> + }
>   kfree_rcu(fb, rcu);

Does this code introduce a use-after-free race with a concurrent hardware
memory failure?

When a DAX-backed FUSE backing file is closed, fuse_backing_free() drops the
DAX device holder by calling fs_put_dax() and frees the backing object using
normal RCU via kfree_rcu().

Concurrently, a hardware memory failure can trigger dax_holder_notify_failure(),
which protects its read-side critical section with SRCU using dax_read_lock().

If dax_holder_notify_failure() reads dax_dev->holder_ops and checks for NULL,
and is preempted here, fs_put_dax() can run to completion. This would set
dax_dev->holder_ops and dax_dev->holder_data to NULL, and eventually free fb
after a normal RCU grace period.

Because kfree_rcu() does not wait for SRCU readers, the memory could be freed
while dax_holder_notify_failure() is still running.

[ ... ]
> @@ -79,23 +87,88 @@ static struct fuse_backing *fuse_backing_id_remove(struct fuse_conn *fc, u64 id,
>   return fb;
>  }
>
> +static int fuse_dax_notify_failure(struct dax_device *daxdev, u64 offset, u64 len, int mf_flags)
> +{
> + struct fuse_backing *fb = dax_holder(daxdev);
> +
> + fb->dax_error = true;

Can this code cause a NULL pointer dereference or use-after-free when racing
with fuse_backing_free()?

When dax_holder_notify_failure() resumes after the race described in
fuse_backing_free(), it blindly calls ops->notify_failure() which is this
function.

Because fs_put_dax() may have already cleared dax_dev->holder_data,
dax_holder() might return NULL causing a NULL pointer dereference here.
Depending on the timing, it could also return a stale pointer to the freed
fb object, resulting in a use-after-free.

> +
> + return 0;
> +}
