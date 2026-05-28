Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2AA3F7A99
	for <fuse-devel@lists.linux.dev>; Thu, 28 May 2026 15:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983015; cv=none; b=XQvVxXWQOObMF1Amj8LOOpKb41CVdzhKfau6S/NwDc8aG0pe7EgWT37dYKUDb3Yd7+YX3YvyunmEVe/GFnqWoWh0ZByzpCyJKcLYqm65/hTvfyywf1E8UCtQ3yQWPHbHBCtlRihwRDadydfqX96mdgefdFpdTsGhawS75OnDJc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983015; c=relaxed/simple;
	bh=Ak78aaaCY7+G8k0bnBUW8is3X+wL5iVQMmFwUhKO4ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=odCNwHI+WlbzUgKDNtyeod+ET1iNfCzgR5TaFsIiMho7huuACu62nJWptiHMA1nbVGs3SfEsqZE8dI05Uwpv40ixFVdrUEShDoMw8ESdhCXsch5Bk1l1GEax4/6XqdzMjGalWhtH3jBl1Nb/4DjSecrEaDB+7GqVrM/THaEzorU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QT6l6Ovs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QT6l6Ovs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779983006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e5OE5ghFZ32u1yHaZxjEepDyHaLV2v0fSQflW+oRpe4=;
	b=QT6l6Ovsi0hnyaodqEMrg8sSQKSoK3Mczr73WP2r7zjHULNERB2rny9m3Ynb5H+nMvYlKW
	SnWwp+jY0Kp51wP0FAgOC2/S+BbUQHeoFGeJk0IxMkv7DUpo4uL1ypciqgHFxd7EECxeQ4
	XuOwlwmkhbpf++eMDZedAh0wUzSrJjk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-mvcA3TsEOW--xh7kQVbNdA-1; Thu, 28 May 2026 11:43:24 -0400
X-MC-Unique: mvcA3TsEOW--xh7kQVbNdA-1
X-Mimecast-MFC-AGG-ID: mvcA3TsEOW--xh7kQVbNdA_1779983004
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-45eec2ba533so460756f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 28 May 2026 08:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779983004; x=1780587804;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oo6OTSed6Z//i2IY96CVe2S4QINrbKUBBFYr5Tsi8EY=;
        b=NPqXVApHbSgXNcp0w5x0Q2ka2wP3UxqwloQp0CTUj+wmlj3bRaODIPnmx9nR0AQ8KX
         kGA2YEyb2VC97XIHJNly5kL1bq9XAvwDqgxghjMbppvM5AIlzU0e0sGig2SiOPGc4fPM
         1Y5CEBjzmyul6mncAxXZPJYAJqQvYE1W9PkBqaTPzzsN1d2AJQgn6IByBnnf22IhanVW
         3ATvHVcvBidkwo5uKzoOB5xKgbzk8sW25dY3PJzQW7cpBGPD/RgEiw0T4yY3nUFLH7ii
         sPSRTTx2JZdgfPUN+Nai06ycTsTA+XTKwA3GOEM1C86rcTKbVwpuTYLZvviI4w/fEEAq
         Yi2w==
X-Gm-Message-State: AOJu0YwLl/eKeM21VH40sLWyQBI/4xKdtc0Q7vazQ2Aq27sv8zpK0QjB
	vL+W03gDIYgdgnsl7Ublr5IL2kszz7DQ5Ru+D4s+o/DYFnJ+XYq3l2I/beXawQEKIIIn4et/Ey7
	bjRKv/Q/gTy6lEzSXmpNp6brHDSOfvOX8ofXPEJKJR9Lz+Md7/KksgFhvP2Bqm0M=
X-Gm-Gg: Acq92OFaaQqPk5o0TTF0uDMgWRWoVXIWY7i9fPWtyPJ+5R37DuJAn2NupeckUDJnx7+
	QbgrrV8Gnf7c9xebncSBLPNUdXq6VZdsz3RgfPI7YwwxUo3nw0RiPSZ2kkYO5M9lGfoqWbSGy8k
	JbK99s+DFmqt5G0in0psCyXbVoX5SU6lSmfj1EGE45TcsdG2cPmPxkCJkgbLORTMAc8BdLCt3eF
	WEFvr1UgSjNYP6OnRfwlRW0CCXOGYLAT5XUfKAPDTT1jtpjl0lAD9MGA2Il2vuTf93ZwWzoMsJP
	a3No96AIvApW6oLnH0KkNHan8q6McwBoAos+WmaE1AUjUuz2TEh1NRce63imoAM6/4T7Y5mMW2N
	xsC8JJukv1w==
X-Received: by 2002:a05:6000:4917:b0:43d:dd:8ca4 with SMTP id ffacd0b85a97d-45eb36ab5c9mr47695415f8f.14.1779983003712;
        Thu, 28 May 2026 08:43:23 -0700 (PDT)
X-Received: by 2002:a05:6000:4917:b0:43d:dd:8ca4 with SMTP id ffacd0b85a97d-45eb36ab5c9mr47695366f8f.14.1779983003210;
        Thu, 28 May 2026 08:43:23 -0700 (PDT)
Received: from bahia ([2a01:e0a:cc2:66b0::60c0:1640])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb557679sm25169342f8f.10.2026.05.28.08.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:43:22 -0700 (PDT)
Date: Thu, 28 May 2026 17:43:18 +0200
From: Greg Kurz <gkurz@redhat.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, =?UTF-8?B?QXVyw6lsaWVu?= Bombo
 <abombo@microsoft.com>, stable@vger.kernel.org
Subject: Re: [PATCH] virtiofs: fix UAF on submount umount
Message-ID: <20260528174318.2d97e373@bahia>
In-Reply-To: <20260528142306.1792392-1-mszeredi@redhat.com>
References: <20260528142306.1792392-1-mszeredi@redhat.com>
Organization: Red Hat
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0HIi5F_KNX46ilEtDcLlT-PY8LIHf1BWegdYnXOoEGo_1779983004
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 28 May 2026 16:23:05 +0200
Miklos Szeredi <mszeredi@redhat.com> wrote:

> iput() called from fuse_release_end() can Oops if the super block has
> already been destroyed.  Normally this is prevented by waiting for
> num_waiting to go down to zero before commencing with super block shutdow=
n.
>=20
> This only works, however, for the last submount instance, as the wait
> counter is per connection, not per superblock.
>=20
> Revert to using synchronous release requests for the auto_submounts case,
> which is virtiofs only at this time.
>=20
> Reported-by: Aur=C3=A9lien Bombo <abombo@microsoft.com>
> Cc: Greg Kurz <gkurz@redhat.com>
> Closes: https://github.com/kata-containers/kata-containers/issues/12589
> Fixes: 26e5c67deb2e ("fuse: fix livelock in synchronous file put from fus=
eblk workers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---

Great thanks for the quick fix Miklos !

FWIW

Reviewed-by: Greg Kurz <gkurz@redhat.com>

>  fs/fuse/file.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 3bdab8d03373..e8833e2a6610 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -380,8 +380,14 @@ void fuse_file_release(struct inode *inode, struct f=
use_file *ff,
>  =09 * aio and closes the fd before the aio completes.  Since aio takes i=
ts
>  =09 * own ref to the file, the IO completion has to drop the ref, which =
is
>  =09 * how the fuse server can end up closing its clients' files.
> +=09 *
> +=09 * Exception is virtio-fs, which is not affected by the above (server=
 is
> +=09 * on host, cannot close open files in guest).  Virtio-fs needs sync
> +=09 * release, because the num_waiting mechanism to wait for all request=
s
> +=09 * before commencing with fs shutdown doesn't work if submounts are
> +=09 * used.
>  =09 */
> -=09fuse_file_put(ff, false);
> +=09fuse_file_put(ff, ff->fm->fc->auto_submounts);
>  }
> =20
>  void fuse_release_common(struct file *file, bool isdir)

