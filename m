Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2971BD9CE
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781529; cv=pass; b=JpFJ0cEgq6SpoQK3ls+/eKZ2Xr4UtQKSmAMD56/CKpcma8LcJM/VXjLaro55Zh1HiFh1Tq/Xv8Nep1ogiGZETBjWUT4JzdJYrSehAu5Dx3YZbcMasEtpik+XoRVbfLP5pfZFd0E+/WgKIg+kMx2+qDaqEaVBaRNsdCLXVIYoiVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781529; c=relaxed/simple;
	bh=p3nJZxhQ5vmc4vkk7gFL89JkNgkg4sTAxsmUppjZ4HI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SD9klyHOkZgtoemIqQZCv4StOpuVxr1PSiYdMMaPdJh8DX12jOqx3mskWWY2BPmCpA13IntUbBlGN1i3O+5Pj2CLLxLvXG5lF3ljk8bcWhqcS/NaFXwKyZgUXZEBAWqNcoNSccbM7hQbk8jaTCFsYaKvuNoKZM2+h19NphSt9sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oaq9+Dyq; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oaq9+Dyq"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ba3b9601b97so617703366b.2
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 07:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776781527; cv=none;
        d=google.com; s=arc-20240605;
        b=aeKZwJq+9SKkpsKfDZvlqmgMSh35OdCfoD/TbpXIAtDTDAk8Ww4GyO50ZIiDa2QE0B
         D1uiGI/ouSLl9j4H6hACrpxxKiv+grjrhBx5oD3PgdPYRdV0KHQ7qK+/7betQQ41kIKa
         xWrf1KeKqjT7EZxI+YQ5YqzYU+ukU5OSmy4ynUPv7UCFAQjQ/iIF24jVY21JJeFNRad4
         6/tTCKghl5fGWseoBHS8oLOd4jQyBfmcKMavSSf8H5xRdzbZstSESaveCXaxvhQs39yB
         TDxhkfSdkrhpHPg1EmeMw8DOwR43/0lKwv3SX86KM3BtE+UJveR5HH8V5p/6A3DbYSfV
         F9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tDeSNap0Z9fDRDoktpHcs4eiBnb396/RhhaweXYL3fg=;
        fh=gJZUoZlenTf2ESynK2zm0AAhpWZ54ccQir8ifWp2u8M=;
        b=gmaJ6e/9j8MSu4kpB4n5mODD2ltWd+t8hiHK5rQI3UFZTW5bP5b6yxfUMQp87gITES
         z+fEIJJuhGOTSVj8gsT64qz0yhzzgbGVRYoYT/kDn5kBbB/9aWFLPmSduKVSBmuZw0Qk
         m4B3AKV1SKAR6yL4QV2Ra15ruyl9/H7LsWk7wOIOOtD6pgvRxPoYaP7iwleI4EcGTOmu
         zxF8HpglTZS62gaViD8gembu3eKFezanBKqBu5FVWzunaalXpEh+rXYRh6+7U2ZSulS+
         o+bidRf+kRzOs5iP0ZzGexvsPcoQ+EfIit3QYvtaxTHmHRUWpU1jXNwguZsTg+i11Zn4
         ivWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776781527; x=1777386327; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDeSNap0Z9fDRDoktpHcs4eiBnb396/RhhaweXYL3fg=;
        b=Oaq9+DyqmO10E6ABm/p+O10F1WTKQtsmK1cjCbeAKNkMzmGSjNZSOPMiHSi+RP5ikI
         VcusdH9YFkwokkPXinhTH8rcFBqEiMxQMHx5I/yWouetZE7QaBFmLjsSirZ67M0s14Hv
         2q3gRKo/PcT5FDHgDqwgjw8hdxQLW0aEPJpAXsvotyItP9WYvhlwU+xb9Xl2VYXvr0XN
         WEUmU7g9rXWB7P2C/TUH1Xw+v0ue4s5d02eZ5/yYKugTXjAJ94u9FTwjuEJKsqZpjqb7
         CLaUs6ivkAZMIzqfhRc35kMF+LW6ZKPdf1o18gNQgtWkuWQJwRT31bTX3Sf+cdXhaSkE
         c+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776781527; x=1777386327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tDeSNap0Z9fDRDoktpHcs4eiBnb396/RhhaweXYL3fg=;
        b=l+82N9VHNZFBuKBlyFkZFmwnZNQXYFQ0ncUUwbeLbfumomORCHFvREmaAt82BXjIzu
         HflWkYcacnQIblWDBk4Cs7m/tFOqIWo3rLSnxysA2LZWwgItJT/BKy3ItXV5SDEz83QV
         7cNhV3g5DJZ3T8Z6iUo1nwpBS4X+GFy83xdJXAa8TRLwPhbgq9MlFOeRarXad2QV8lgM
         UPw4Z5huINHVDd7HbTcfcHsOsA+qka7R9He9LJBb4YxyAxrYHnodgACiiY2ttnb27dda
         XnNlgFQrpULFPn7AI2sb8uvsfTRWa+vEQsZwz8XUXtdprew5kuD757Zr2sc8ZOlZUcS4
         vXoA==
X-Forwarded-Encrypted: i=1; AFNElJ+nJGQoaDga7VzsnuYS68Lc5U8MdWjj7E4xtAfoSPRkhfCCvZ4/rbKh6iQX3SceAtKyr43lgZFWV2ds@lists.linux.dev
X-Gm-Message-State: AOJu0YwR5VxwbckOcekdU4ptWNOSArlaI0j48IGzKATIwP149cpsYHQ7
	QvKlZZ/pFFjnl1VdV6N06K+AcYDqw9q9s00JOgQktYV0WlVa/MvOBhFnC2Q4OO1+gUdh5xQxvVk
	xbeVy/KgUYf8e4vpMxF7rJNJaUgzn0W4=
X-Gm-Gg: AeBDievKkwBDEG8M5AnlZ3hfGQSHdREsqZfAM7MlPMyLY5WomlD62rfOkUdDa/M8Ybl
	BFBPYI9jgdMdJ09TPkk/oOWYSSQwRxeRZO8x5WtV0J2ESe0dFoikMwjDJ4c5OrxTAtNBAJcIMdn
	LpbGiwPxJYqmDRQJbu2gAFcP2/kLgmHl6uUvztdLKQn2EPS0b7SK9FMVdoyetTFKuevrqPQ1x2J
	TQNXoNKCgl6Vmff0zr0mMGwYF0VKgbfeFbtrPdZ0iQgKT785XY/N3pEvtl4/Ljv+ItBhZWm9fJc
	e/e7O/wZ1r9TxZrdYHa+Xtap8O+en+FCzT4XeFTpzl3BY1FpgCy4qfsoFH2O8xw=
X-Received: by 2002:a17:906:6a19:b0:ba7:7f6d:be4a with SMTP id
 a640c23a62f3a-ba77f6dcc54mr534009566b.26.1776781526212; Tue, 21 Apr 2026
 07:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com> <20260420221637.2631478-15-joannelkoong@gmail.com>
In-Reply-To: <20260420221637.2631478-15-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Apr 2026 16:25:14 +0200
X-Gm-Features: AQROBzBqV75tVPzeboI_qt4HTF2DD0zDbIqQ0hP-HXCjLzy-Hgg_d3ZuRgrxrgc
Message-ID: <CAOQ4uxg7jaA0FdLW6uzZBRX=m1Xw4v-k7zeQx7kYcpFwFDpf7A@mail.gmail.com>
Subject: Re: [PATCH v1 14/17] fuse: use passthrough getattr in setattr
 suid/sgid handling
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> When refreshing i_mode for suid/sgid kill during setattr, use
> passthrough getattr if the inode has that enabled.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dir.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 637761de2c5b..ff9a92d8a496 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c

                /*
                 * The only sane way to reliably kill suid/sgid is to do it=
 in
                 * the userspace filesystem
                 *
                 * This should be done on write(), truncate() and chown().
                 */
                if (!fc->handle_killpriv && !fc->handle_killpriv_v2) {

We should probably enforce a dependency between those two and
passthrough of SETATTR and maybe GETATTR - not sure what
the rules should be though.


> @@ -2524,7 +2524,11 @@ static int fuse_setattr(struct mnt_idmap *idmap, s=
truct dentry *entry,
>                          * ia_mode calculation may have used stale i_mode=
.
>                          * Refresh and recalculate.
>                          */
> -                       ret =3D fuse_do_getattr(idmap, inode, NULL, file)=
;
> +                       if (fuse_inode_passthrough_op(inode, FUSE_GETATTR=
))
> +                               ret =3D fuse_passthrough_getattr(inode, N=
ULL,
> +                                                              STATX_MODE=
, 0);
> +                       else
> +                               ret =3D fuse_do_getattr(idmap, inode, NUL=
L, file);

It does not feel right to passthrough GETATTR if not passthrough SETATTR
in this case - I could be wrong.

Thanks,
Amir.
