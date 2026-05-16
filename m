Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC1F386C3B
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 22:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778970564; cv=pass; b=bm4WdIOkAq4zVCLu/I+laf1A4PnCoQmxoRaamgghn6sYtLKlEQOi7Ob5VvtLJPbrnYOYJ/aXsHmqrZJT6r7fLz0sSKnYOREtU72a0qpE4ncCn6A7Dynv72mCbvSZ3q6w1Jb+ABATu1WrubWx1N8Ae5DehtG2PdsVrYv39B15xH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778970564; c=relaxed/simple;
	bh=Y7g/w+9AWXA5kg1j44KDL4S8Jg09RruR841N4UPuBJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPUT+c6e/MGY22BwVLtzf3bODPQODThcaOhbiuiWQk4Cy8/coNDraOe1E9WPf4jEHcN4bbfJAIQgRQu/o9xRM7nibPDsxOU5xAT0Efj9/FLa1b085Tv63SKZrzSae7t2rNReca3LjDxzHA70/OUYT6w4PtgzvtUcDnJqIEirRsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRcT0prU; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRcT0prU"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd2e8931915so282305166b.1
        for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 15:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778970561; cv=none;
        d=google.com; s=arc-20240605;
        b=XXyAKsgx9GgRQ/UaKxUQbkjVcRk9uryo0l40fVLiK3c/nZewHX+tEHO1zv5yyWHoCm
         xHaG8LdfOiestL1BkQP/oV1R0IYGxfiPJWoVoBpczEnYs64wh2/mfr/DiUARJRzz3vgT
         sfZqq7h5wRjb8MPlj7rSzCspIXMYFeo8xGmm5uVwsR8R4NivguyVxlaKB4xVCmpfNiaf
         F/ZEqZIbx8C4fhVe8GJkm154Du2k+IOm78W5StI01GA9qOjNisGZSrEtS6181FTnUmPm
         1rpiVOJ2g6oo9EW3oLjIit1TmKrnYDG0TYpkmUkuU9ZBtAvylwiB2t8gokotVyA2h6vL
         MFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xm9URiwTfwNZYfRIur/Yjy8U1afMXVgJZJv7flVHF+8=;
        fh=jQq707+mp3QfRyiYH2GDmNiyuAgzz1cvrkwdDTQNkm0=;
        b=Jl962hI4r5SC/HVrymLQfQ0n+5/PvlCwrIViYhlCj5EYTmI81qzSkh0N/9b5u7Qrns
         Okdv+BgQSbEAUAquF002QZWbOSAVY8iRL1U+87RHU6Of9J5WOmCeQCorkeppXM2pJGRj
         PHK4fDyzUHU8CTbqV6Was4FQS2GZrAjpvFAhVIbW45OPUWzeVpUc2aWBklCCfa8hhFg1
         ebsccYqJqEONEC5UdTcYycTHVORKtmN4PpIQUrLV7Tcinu/NNRJglLWTbDpj7ZdFU62j
         4LxTSSwNEv0FG9UkUzClF9+r4QP0sbozbdI9KPabTQfdGiN4lAT2kYgIpL5ImMICYDkR
         c9TQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778970561; x=1779575361; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm9URiwTfwNZYfRIur/Yjy8U1afMXVgJZJv7flVHF+8=;
        b=QRcT0prUIXHFtmuK4JBuLma7TpuWSbD8kZSdLZEXA2t/WWrk5qsUGOv2P0juQNY4yj
         +maJtryem7z9HSynbDk47e2DVXo8PKF6wbcwVuaVntuYhrpQmQTreyuj4+m61P7xL8bg
         SNcy8JP6W3SBZTwrdcdtrQAZYX9xJ5xlDfbNhqj8A7+w3+vG8wXYbxqvcKXb7ogzcnh7
         1orPmFgBxtnY3W08Y4uj6SviLu5Gl1jC0yr1ZnLMebzPU4OgDzJc4zqzyovAd+2dchDd
         GPfDsavikoTxoh2nu2XZMxZtnGfb6xhBjhrtYN8qcEjrAet2cYmoXEZTfVMhH66Pac+n
         sLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778970561; x=1779575361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xm9URiwTfwNZYfRIur/Yjy8U1afMXVgJZJv7flVHF+8=;
        b=e9gS8Tv3rOwkdR5QlY51oVMpgY1txtkbtf3+VsXU/af/EDJvtVTKq9iCPdVIvuSjPw
         mowsHPC85uV5RUMFShFlz1NWHNAg3mQ1TJQYfrJnqzlYd+10Ap3n3rl3XFFogx4JKr5z
         rXWwyCoiGOWbC//caIo3l0dRGWT2nD4FQWnse1lihH4nxn3K+jATD80UQ8Xz5/6y0mqG
         3mf5q9oL2MZAN4CNJGq8HwxXMM9EYuWS8AxufjJOsgL/PAvYo9fj0xWN8ZUw+8+mi0jg
         UC2QWWtt6mwy+2SW+rgc7epW9WdDl4fSI9SsmMMRjy53LHMhLRbU5Tccn7eeMA8pSLR5
         hOlg==
X-Forwarded-Encrypted: i=1; AFNElJ/Zrg+Bip+0tqIpMeIC+fz9t6WoxGDyDrWi38HesYJbD24ks6F/P/WnExH9/eeRK2cTmMq80s0pwAYN@lists.linux.dev
X-Gm-Message-State: AOJu0Yxub8LA8sl5M0U2Dnq6OLfd31VLyP2V3YXWN8aEvwk/58d2xvjo
	ZIH3ig29Aa3YNGYKuqoFiki0uqiE0uGCN4zYFcC19WRztZCK4INm+sF1IP708uJxKUWyuPagDch
	OmXDCB2oZZqcd96UClssD3A3X4h8lMlw=
X-Gm-Gg: Acq92OH7SGkrutssNEboPGVuuMO5oMLrkPjQtdl2AjTQpWZZdftTyiXeJilThgYBwfC
	MfrN9MUAtrzEcNcEuPXQyGJJ6P/OCmOdYBJW3e4eToiMTsqGwJkNjtUb1NrqKgVsBGTa8eP/ypa
	drwo+MbHTAm9haTv0FtO6nMfpzxRaxOzGgM1mNV0tVTKveexXRYGk30+P9PNcY/E33OeepNXVdr
	ohK4Z1AR/IsRHilz1WsUJAOqFjJBNZ7gqtS1E1P3wtNEFJxjxCJ6VlL86rBBG3ExEfp5E/3E0Vj
	SF0NMVgyiigxkLXchuEVkKald9INeXjEZNozxG3Uug==
X-Received: by 2002:a17:906:fe08:b0:bd5:1605:e1c3 with SMTP id
 a640c23a62f3a-bd51605e354mr447801566b.1.1778970560643; Sat, 16 May 2026
 15:29:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com> <20260516004004.1455526-20-joannelkoong@gmail.com>
In-Reply-To: <20260516004004.1455526-20-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 17 May 2026 00:29:09 +0200
X-Gm-Features: AVHnY4IJtDRqENxZ5yafH4xjuZwDeWgfB_Pc82vXmpsqRKVfkfdyTsCH9GbbJxs
Message-ID: <CAOQ4uxgxXMYjptBMggikrEfnhKmdGKxEauD4waT8JotKtgYs-A@mail.gmail.com>
Subject: Re: [PATCH v2 19/21] fuse: add passthrough setattr
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 2:53=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> Add passthrough setattr which sets attributes directly on the backing
> inode through backing_inode_setattr() instead of sending FUSE_SETATTR to
> the server.
>
> Passthrough setattr is checked before the
> handle_killpriv/handle_killpriv_v2 suid/sgid stripping because the
> stripping is handled natively by notify_change() on the backing inode.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/fuse/dir.c             |  3 +++
>  fs/fuse/fuse_i.h          |  3 ++-
>  fs/fuse/passthrough.c     | 28 ++++++++++++++++++++++++++++
>  include/uapi/linux/fuse.h |  1 +
>  4 files changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 4c7e3e1604af..b67b3b334e69 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -2506,6 +2506,9 @@ static int fuse_setattr(struct mnt_idmap *idmap, st=
ruct dentry *entry,
>         if (!fuse_allow_current_process(get_fuse_conn(inode)))
>                 return -EACCES;
>
> +       if (fuse_passthrough_op(inode, FUSE_SETATTR))
> +               return fuse_passthrough_setattr(entry, attr);
> +
>         if (attr->ia_valid & (ATTR_KILL_SUID | ATTR_KILL_SGID)) {
>                 attr->ia_valid &=3D ~(ATTR_KILL_SUID | ATTR_KILL_SGID |
>                                     ATTR_MODE);
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 89c9333e9702..0d978a9837a0 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1279,7 +1279,7 @@ ssize_t fuse_direct_write_iter(struct kiocb *iocb, =
struct iov_iter *from);
>
>  /* Inode passthrough operations for backing file attached to inode */
>  #define FUSE_PASSTHROUGH_INODE_OPS \
> -       (FUSE_PASSTHROUGH_OP_GETATTR)
> +       (FUSE_PASSTHROUGH_OP_GETATTR | FUSE_PASSTHROUGH_OP_SETATTR)
>
>  #define FUSE_BACKING_MAP_OP(map, op) \
>         ((map)->ops_mask & FUSE_PASSTHROUGH_OP(op))
> @@ -1367,6 +1367,7 @@ static inline bool fuse_passthrough_op(struct inode=
 *inode, enum fuse_opcode op)
>
>  int fuse_passthrough_getattr(struct inode *inode, struct kstat *stat,
>                              u32 request_mask, unsigned int flags);
> +int fuse_passthrough_setattr(struct dentry *entry, struct iattr *attr);
>
>  static inline bool fuse_use_entry2(struct fuse_conn *fc)
>  {
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index ae0137caa06d..c083ab68537e 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -9,6 +9,8 @@
>
>  #include <linux/file.h>
>  #include <linux/backing-file.h>
> +#include <linux/backing-inode.h>
> +#include <linux/posix_acl.h>
>  #include <linux/splice.h>
>
>  static void fuse_file_accessed(struct file *file)
> @@ -275,3 +277,29 @@ int fuse_passthrough_getattr(struct inode *inode, st=
ruct kstat *stat,
>
>         return 0;
>  }
> +
> +int fuse_passthrough_setattr(struct dentry *entry, struct iattr *attr)
> +{
> +       struct inode *inode =3D d_inode(entry);
> +       struct fuse_conn *fc =3D get_fuse_conn(inode);
> +       struct fuse_inode *fi =3D get_fuse_inode(inode);
> +       struct fuse_backing *fb =3D fuse_inode_backing(fi);
> +       struct path path;
> +       int err;
> +
> +       err =3D setattr_prepare(&nop_mnt_idmap, entry, attr);
> +       if (err)
> +               return err;
> +
> +       path.mnt =3D fb->file->f_path.mnt;
> +       path.dentry =3D fb->file->f_path.dentry;
> +
> +       err =3D backing_inode_setattr(entry, &path, attr, fb->cred);
> +       if (err)
> +               return err;
> +
> +       if (fc->posix_acl)
> +               forget_all_cached_acls(inode);
> +
> +       return 0;
> +}
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 3963631558f9..040fee549bb9 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -1158,6 +1158,7 @@ struct fuse_backing_map {
>  #define FUSE_PASSTHROUGH_OP_WRITE      FUSE_PASSTHROUGH_OP(FUSE_WRITE)
>  #define FUSE_PASSTHROUGH_OP_READDIR    FUSE_PASSTHROUGH_OP(FUSE_READDIR)
>  #define FUSE_PASSTHROUGH_OP_GETATTR    FUSE_PASSTHROUGH_OP(FUSE_GETATTR)
> +#define FUSE_PASSTHROUGH_OP_SETATTR    FUSE_PASSTHROUGH_OP(FUSE_SETATTR)
>
>  /* Device ioctls: */
>  #define FUSE_DEV_IOC_MAGIC             229
> --
> 2.52.0
>
