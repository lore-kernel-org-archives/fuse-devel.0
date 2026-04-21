Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175A933F8BC
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776801121; cv=pass; b=fyOe71OkfVBT7nSTsVhQ7Eg/NJQjCzgNYADqvehcAoQTIqNdvAHTpAn9jWmCFnhITPv9YMGNzvoBUULr/9CwIfl1VguzC9HssFoPjDLQ31S1ZA/g4K4WM1ba6DLh3z9Na1LMmxmSpf4grbUDXroTwDLiou4fuPj7bEFRcZgMFa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776801121; c=relaxed/simple;
	bh=oDO4aMeY0QBMkNh+i/5mvfaSSdWr4+hLZg6CUMyRKB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5Qb0lP2XvM9ls+Vyx7hsDYhgiDQdQkGrLa3DB2fs7Hdw+BJkNzvzN7RGrPrJkL7avLzalKgv7NzeZnkBTV2DiRNyz40/KEtgodyT9shCvQz0V5sk3SHklnixBYedQoaynSJiAXhdbqKOxqbyYGUNdolqaXG5GS4ZKLyZpjyWnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhChYMot; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhChYMot"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so814385566b.1
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 12:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776801118; cv=none;
        d=google.com; s=arc-20240605;
        b=FTF2UcJ10exnG4DIn+sr0w0NmSNHtV6fnZxb5Ppgefj7CQroKX2qbB9T3v+e9jWKlh
         mO0Vy2PN2aG4LgNBZa0CMZdGlBfJ77caJgvLQdIxXZgvJ2qWAH2WSMvNAkTWgOpZpOqC
         Mpl5dXTGsP5oTl9XctZ9Z0jkIE42yTPZDunDUhjS4HUpeZ+ka1fR+/xXtHIOK56mXT5q
         9gYFKr/fr3SaRXgLdUBbWqqRKO1WFgGcXc6WaDsrp2H4LHYnFECjfvC+Lwi9HlUJ33tu
         Gz/7f37sxang+FRd1FQQn1vZvmF3qUiLZa9ndS1sCOotPGtccYfsxisJll3F9VdlrHVP
         nw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lWpdsaM8IdfHOKGqLUBPuAWOzy9RBxFmJutJKdw4Rgg=;
        fh=IGxo75YLBh3W6MvPtkl3WKy6Ompaq7A4FuO6i5Wn0CU=;
        b=Rhf0mwPRVRGz1ULEkNaDESCts5/kw4ztZkCZlxevDW7nqch+LCM57L0t/csjcNmUMK
         z4OlVSajVlJeWwyIMNO/l30EBCAdE3vfljcfykfZixl/PLTtYsOvkkHoNixOX6tdBLqs
         tTHyJ0B/pyrfKnToGjfkIHRqNmfpTYA7eD4MBJiRC5+kiDKa297MtC+hVNz+8Ov8yfSa
         5rtv05ckt31OpXUapFaDQUVemCGSTLEMcOHFxtF81EZ7+GUaP4oMcyDtI8myqdRdbaOZ
         nZLtxJyY4be/4H7rofWhfgSQa6x4egk63G4TMveS5MINbQfETLM1rwoAxzRtr6Wq5s4E
         OsWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776801118; x=1777405918; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWpdsaM8IdfHOKGqLUBPuAWOzy9RBxFmJutJKdw4Rgg=;
        b=YhChYMotv2aWeZSG/GuZMZKpZOPGeWKeBJ9gR6I7QmVzbiKEV/4/dVjF8S7H/xubKl
         kheIK6mDko7AfMDiA1wCaTUeKZup+jdC58TWakrqhPcwNTsmuaxqO8iZoFDVBCLTOYlg
         om+XH1QMPQiqMHR+Km+gbP3dsiI5XHwIbHOpagllPmouGyiFiCamWyRm0FGXRQEEmtJK
         UcjnpP8m4S/5vmddCauZmqh6PoYkjbN6pb2JOBKZ6GZhgZwpvsUAO5mecNcG3fdaN8mK
         txkRfUWFlx1f5I6pws/AaQCPSFyxaiIoWiNKARBfs1BIJLDLbOgEnseHViZ1RLy8xR4n
         rb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776801118; x=1777405918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lWpdsaM8IdfHOKGqLUBPuAWOzy9RBxFmJutJKdw4Rgg=;
        b=RBIWCxD3oZFvRoIz5RFgi36iUSm+gRGOxvsV8uP+FVRkeA7C+rLqBiZzy/MrcmeVLX
         lElOevjOLtZyjU8+UIspeeVLabvCd4ic9DDaUm23MMiu/AHe1p9mBy5ea2GcwGRLjC7T
         UrLIMenhhDd4FBQxJVIgl002Z4XP+wEyT1eMe3zkhMoKNY3PRTE/WQl+9VooxqZi36wO
         MxbN5YWoAhFYL+gqwqW5eBfNzCn7bznF9fTNM+9rEs0iK//cfWmh0tBk21wS9eUhNBqz
         0nfel1f6AsjYaXEDzn5GhdAtS/KPa9IwFGa//FFHgl3D0jm4FwDqDzqJlW2kDy8H09Qg
         lD3w==
X-Forwarded-Encrypted: i=1; AFNElJ9wxJ/TDEXdtORcD7yc3jOZr5Bc1sGqDMoJj1e9KVcz4M4jxU/WqSy7GRnB9oI+QMpQv5h/a/D0t9Wj@lists.linux.dev
X-Gm-Message-State: AOJu0YxNWI6kRCDKrqGCoGXxhky4+wELglAL0IyqmTuWSeJTD3BGoU5h
	FcX8TyQmG+TIraH/upzfv/ADND+03AbUgckwPmCYnFpDe7Msd3I1xdkx5YZU9SW8Ibv1FagU0qL
	3INAFJDg/xLLG2Ji2IkdaUQXhZ/sQfWs=
X-Gm-Gg: AeBDieto9jcSh5Kdw11zdR2yMtquAKU5HmMCyYJAPNgIwv06h8yVtozSb4k2OIZSiCw
	VrqoVNTQq0/Rzi87PlOdFV3KtyKhvMq+ypLZLPaBeYveM1Bvr7qxB72oJxGbzbXg1Wa5AclSrHx
	yMb8fZBJJj+TROsNCi042uF04GgJIPD7ZfQYdI8XZ/FkxrwMSzBl6di5XoM7jxENM3oVt46Mjwc
	2Ju7MVCZQ1HR3AiHc0SmZctgvFb5hbvOYN3C9SHQhHThYohzl2WtLwovZ8gL1NagPc9+bZzThbg
	wdmpwIW+ah8KQUr1NLdoF1odDO6TO672MlbgBCEOaEVGnYg1hlUA
X-Received: by 2002:a17:907:a604:b0:b9d:6a05:64ab with SMTP id
 a640c23a62f3a-ba41828cbb9mr943301166b.8.1776801118169; Tue, 21 Apr 2026
 12:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com> <20260420221637.2631478-14-joannelkoong@gmail.com>
In-Reply-To: <20260420221637.2631478-14-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Apr 2026 21:51:47 +0200
X-Gm-Features: AQROBzBrHddXWZneqgxOzOcI2jXIeCqCReGCqVanGzs2UoQT_-XayliViRqy8lQ
Message-ID: <CAOQ4uxi-cRwxjadAcxgs9X3SBRJWyPLik4hqkA6h=YDfSEK7pQ@mail.gmail.com>
Subject: Re: [PATCH v1 13/17] fuse: add passthrough support for atomic file creation
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> Route FUSE_CREATE (atomic create + open) through fuse_entry2_out when
> FUSE_PASSTHROUGH_INO is enabled. If the server returns a backing id,
> the newly created inode will be associated with the backing file for
> passthrough operations before the dentry is instantiated.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dir.c | 44 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index e5a7640fcd30..637761de2c5b 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -929,14 +929,18 @@ static int fuse_create_open(struct mnt_idmap *idmap=
, struct inode *dir,
>  {
>         struct inode *inode;
>         struct fuse_mount *fm =3D get_fuse_mount(dir);
> +       bool use_entry2 =3D fuse_use_entry2(fm->fc);
>         FUSE_ARGS(args);
>         struct fuse_forget_link *forget;
>         struct fuse_create_in inarg;
>         struct fuse_open_out *outopenp;
>         struct fuse_entry_out outentry;
> +       struct fuse_entry2_out outentry2;
> +       struct fuse_statx *sx =3D NULL;
>         struct fuse_inode *fi;
>         struct fuse_file *ff;
>         int epoch, err;
> +       int backing_id;
>         bool trunc =3D flags & O_TRUNC;
>
>         /* Userspace expects S_IFREG in create mode */
> @@ -958,7 +962,6 @@ static int fuse_create_open(struct mnt_idmap *idmap, =
struct inode *dir,
>
>         flags &=3D ~O_NOCTTY;
>         memset(&inarg, 0, sizeof(inarg));
> -       memset(&outentry, 0, sizeof(outentry));
>         inarg.flags =3D flags;
>         inarg.mode =3D mode;
>         inarg.umask =3D current_umask();
> @@ -976,8 +979,15 @@ static int fuse_create_open(struct mnt_idmap *idmap,=
 struct inode *dir,
>         args.in_args[1].size =3D entry->d_name.len + 1;
>         args.in_args[1].value =3D entry->d_name.name;
>         args.out_numargs =3D 2;
> -       args.out_args[0].size =3D sizeof(outentry);
> -       args.out_args[0].value =3D &outentry;
> +       if (use_entry2) {
> +               memset(&outentry2, 0, sizeof(outentry2));
> +               args.out_args[0].size =3D sizeof(outentry2);
> +               args.out_args[0].value =3D &outentry2;
> +       } else {
> +               memset(&outentry, 0, sizeof(outentry));
> +               args.out_args[0].size =3D sizeof(outentry);
> +               args.out_args[0].value =3D &outentry;
> +       }
>         /* Store outarg for fuse_finish_open() */
>         outopenp =3D &ff->args->open_outarg;
>         args.out_args[1].size =3D sizeof(*outopenp);
> @@ -992,6 +1002,8 @@ static int fuse_create_open(struct mnt_idmap *idmap,=
 struct inode *dir,
>         if (err)
>                 goto out_free_ff;
>
> +       backing_id =3D fuse_process_entry2(fm->fc, &outentry2, &outentry,=
 &sx);
> +
>         err =3D -EIO;
>         if (!S_ISREG(outentry.attr.mode) || invalid_nodeid(outentry.nodei=
d) ||
>             fuse_invalid_attr(&outentry.attr))
> @@ -1000,16 +1012,26 @@ static int fuse_create_open(struct mnt_idmap *idm=
ap, struct inode *dir,
>         ff->fh =3D outopenp->fh;
>         ff->nodeid =3D outentry.nodeid;
>         ff->open_flags =3D outopenp->open_flags;

Unless I am missing something, you need to set FOPEN_PASSTHROUGH
in ff->open_flags otherwise finish_open will not open the ff->passthrough
file (with the correct RW mode).

Thanks,
Amir.
