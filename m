Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07E54D4868
	for <fuse-devel@lists.linux.dev>; Wed, 14 Oct 2026 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970005; cv=none; b=Hcx76FLh15SUccNFwypMsizk+PHPR1Qj9d4/5XAx4/vbQU1kvDSGc9ddqfjo7hrD1edCzv9bteWbqB8HJl1GZw/C4yoneLOTGfBPQrKulLLmxrkq66DNI77CVrL3Ni7lnXRCv5ZUqQiZo6wevPyYA4DdrOOX4jvwJwS9SCzf8wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970005; c=relaxed/simple;
	bh=42HZk7Eqx7sOIWk8sWRefK14hjH25QPd21VNFE4YkZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPTbOs4UqMHb/J58uhkUIUNc0kGbB+gLCTLIYSnSXVkspd8OUKn5U6z/bXk6RwGnDKW4PGL5jNhVqa0LwIl3qsX+dCMw9yHGD5rgS2Pp+KneKcnXNPvpdtp1K+J1qUMpzklp24Ma+GSFoP+P/4X+MgMBkVVYiFtgUvo60wataW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G1bwBU7k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G1bwBU7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791969999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jRwUw3pnIFIx4Z4YHezup2l4Uf0vq02fpJ9Jm9KmqLw=;
	b=G1bwBU7kBR1icyV6CIZ1ZEycVgAAHQwQv1T2DO8+7gUJgK0UgtqBTgl799qla9gakxFe6x
	15RotWObwDO9VZUhqyjgyaaYfmbQK+VHB/NXxYWTcstGk1oDJmIAIVjZnY+hm2jsGHXe2V
	31Ef868PNr81HJmvzUzpnCrwnbNSNIw=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-alczOnXdN3-krBWhaoJWhA-1; Wed, 14 Oct 2026 09:26:38 +0000
X-MC-Unique: alczOnXdN3-krBWhaoJWhA-1
X-Mimecast-MFC-AGG-ID: alczOnXdN3-krBWhaoJWhA_1791969998
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66cdb701595so5272094d50.1
        for <fuse-devel@lists.linux.dev>; Wed, 14 Oct 2026 02:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969998; x=1792574798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRwUw3pnIFIx4Z4YHezup2l4Uf0vq02fpJ9Jm9KmqLw=;
        b=2q8tthW+ivlai89gq3LRWsRGZO72X8Zw5Q19oU97YwTDtkXo+vrb0eVMf3rYjQzhP6
         Rle+t4BgXNWD9XWDJrYkRWIwCQSYBfyLoGbygYB1WvB8qBYnsJPR1wqxA2X0soLxLvaU
         hdHAEgzbrPwdvSicv/efjIO2wE4aFU3o8mFobPclKYfm7XNpxCjEqPZt1oPt0T05DrKH
         Yqul0trYY852OIYlg+4PQBaf3Rosuh2jmS794NiBxYCcLiPuOo52+32WHo5JKv6Dwzq8
         hzRNBMAwlO+2QYUHoPHUTjuuUgYiR8iatRKJFJcLcVa5X0IGNhOh/YJRz6efhnAqffdu
         R5Mg==
X-Gm-Message-State: AFq9FYJ4gyvqscVqlJhTZLDy4NH07MzWIAld47zEb+MlpG1U5KMcvAhp
	ZOEcNVN/zfQK5ew3mgGkmTKmsIwGOxMJxKUh9JxLWUQoMKw+OJ/RNm/jChFBJSZhwRYY/29fj2K
	71NFxPVsNIPA5DNcZY/exURhIIGDe8Zf7PC0I58yU64yoGgun4385u7bPOWCHDIpV+gWINPgMWX
	klF0gmNhKVLmsI57MZs/f+UBK4IXjcVju+8xNkbA==
X-Gm-Gg: AYBFou15t6JR5JSSfW6/g+FtZ7l6Ar5GebEPNs+SR30PlYMrqOWNQDB/9rP8Nut7c3O
	qDfEecc2eA92XtsnkZ/GZ/fvLYlyLTvLQFHG6pW1RMyoelio1SBwoj4mOkVuZLVn24m1ZwnV+t/
	EUr01IBCmg4ojC6ejtzU81v1bwpbPFPJFeLBR4yfAhNMlbXkb2WT66
X-Received: by 2002:a05:690e:bc5:b0:679:8da6:28cf with SMTP id 956f58d0204a3-6798da62973mr409269d50.98.1791969997673;
        Wed, 14 Oct 2026 02:26:37 -0700 (PDT)
X-Received: by 2002:a05:690e:bc5:b0:679:8da6:28cf with SMTP id
 956f58d0204a3-6798da62973mr409254d50.98.1791969997182; Wed, 14 Oct 2026
 02:26:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008112004.1899560-1-mszeredi@redhat.com> <20261008112004.1899560-9-mszeredi@redhat.com>
 <sashiko-outbox-164097@kernel.org>
In-Reply-To: <sashiko-outbox-164097@kernel.org>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Wed, 14 Oct 2026 11:26:23 +0200
X-Gm-Features: AclHuK9abSLUZzeKyaaWw37ep03femUMbxNrvpPPWXy4b5nrfVP7AH_KbA-fZNQ
Message-ID: <CAOssrKeEOMUHz_Esfi6L0tu0rbd+aMbb9+fi9fzFYu5NWczOZA@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] fuse: add extent map I/O support
To: Amir Goldstein <amir73il@gmail.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	sashiko-reviews@lists.linux.dev, "Darrick J . Wong" <djwong@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, linux-cxl@vger.kernel.org, 
	nvdimm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -6VidDq2ArtdTfp8An60yNyA_0TQy7IU40icelo7790_1791969998
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Restored Cc list]

On Thu, Oct 8, 2026 at 1:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> > diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> > index e9ab1aea34e27..040817ad76e94 100644
> > --- a/fs/fuse/passthrough.c
> > +++ b/fs/fuse/passthrough.c
> [ ... ]
> > @@ -74,10 +73,13 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *i=
ocb,
> >       if (!count)
> >               return 0;
> >
> > -     inode_lock(inode);
> > +     guard(rwsem_write)(&inode->i_rwsem);
> > +
> > +     if (!backing_file)
> > +             return fuse_ext_map_write_iter(iocb, iter);
>
> [Severity: High]
> Does this introduce an ABBA deadlock between pipe_lock and the inode lock=
?
>
> For normal passthrough, fuse_passthrough_splice_write() acquires the inod=
e
> lock first, and then calls backing_file_splice_write(), which ultimately
> acquires pipe_lock() via the backing file's splice_write callback.
>
> However, the EXTMAP DAX path added below for splice_write() directly call=
s
> iter_file_splice_write(), which acquires pipe_lock() first. That function=
 then
> invokes fuse_passthrough_write_iter() where the inode lock is acquired he=
re
> via guard(rwsem_write).

Brute force fix would be to prevent mixing plain and ext-map
passthrough.   Might be a good idea anyway.

However I'm thinking about why fuse_passthrough_splice_write() needs
to lock the fuse inode.

Tracing back through git history that inode lock really originates
from commit 2a92e07edc5e ("ovl: add ovl_write_iter()"), which added
stacked writes.  That was copied into ovl_splice_write() by commit
9b91b6b019fd ("ovl: fix deadlock in splice write").   Which was then
added to fuse_passthrough_splice_write() by commit 5ca73468612d
("fuse: implement splice read/write passthrough").

Even for the original ovl code, I don't see an explanation for the
inode lock, but I'm probably missing something.

Amir, any thoughts about why that inode_lock() could be necessary?

Getting rid of it would restore the pipe lock/inode lock order to
what's normal (pipe lock being the outer one) in fuse and overlayfs.

Thanks,
Miklos

Thanks,
Miklos

