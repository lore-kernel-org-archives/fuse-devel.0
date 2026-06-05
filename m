Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548AE47DD7E
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 07:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645349; cv=pass; b=mHELN6JzKuEq0CyelLkDQBRbohF1FTT0GWT7wByFfR5H/wZcZqR40m/e/Vciol/8VJSydOYoT4AXk3IsU13J7PumzsycpFaf44sm3v5EEIfx6lJQklGxL9An3sdwgpDMU46V5IjEqTNW3o4TfI8J1v0l/93YD8OMS5z+eFfq9Gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645349; c=relaxed/simple;
	bh=Hum1PLwfsfL/m4W57uYaREhZzNP04RPOySAwo/yRFZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQu8vmUYuKOPnUbVqvbJswl6uR7M0BVvj4PHTT1qHa5gmoUdlu4EX4cyPsfs62Vz0oOmR0jB6gjhhtF/beMJ/a3stFDJnyBrKiBwFDA6IT850+17pE7g1XhtcRbZ9uQTFU0Cm2xJhfAp/4fot1T+15fd3ZBfuC1Nfhk3A6Kli3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crAzUvaS; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crAzUvaS"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68c08bfe5afso2988552a12.2
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 00:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780645345; cv=none;
        d=google.com; s=arc-20240605;
        b=ITp5WPX+k5WI4jQOmyIAU3ytn4Meas8crifV4pULXNYlksu4sIjGeVfzxf2RMD4+F9
         kg9OsFJYn6Fmq1PqTOPMk/KuU7DUMYHUzxOKxVYgY1iln8NsKaEDh8tkliB5SxAjDpAd
         AgTv1a1rjKjQrwvW7rQXbyyOQNV7juGs9taIafUxeEX3u3P+6k6wB7V+CI0/GGmLn32m
         bQ8ky7MV+dKDk3WPEFhMIXtFEQxyvOezRjiRH7mWPm6hyBJRCHS2HdPqdg4KvJnXn6Uk
         bVxjBoBov3t0UcuT4+cxeUzlOVU4Nl6E5tnZHx3sdmpKM0SV3H04GT30Gtjb/ncfAIsI
         PM9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ybqO7yaMRmktm3USPp7pRyfioFLu3Ymju6bAia56ju8=;
        fh=RE0szTLx4ztmHdAKqB+aeYnHXQtaU8zdpV5mY/n6ULY=;
        b=TC8WwUdG3MZlWS5xbXafeq00N+lMhkJPwUlqfnE3uUeHRaS/r526ePALU4UFfIqjnJ
         QWQph2nkyRBHrvlSNqN9LUpjlyrLkNzAOe5UtNVRRf/47Et78klUBLtWl2fc+hpOMcyN
         xHyhQvr+Gk4pTb8LPsKAZ7erfTxtWFNHWpZeipvNudI1beAOeT0Ik/JUd1S4EPZFRFEW
         wLAfwrWM9zpmXNnw55RT+L4+UyfUGdWQk4RlhUmpwQE1XpDOpMQKcsepKvBfZEemGMLz
         MyGT/scpW43Cq2PDoZ6YSxLHRfXepcHZPgpI4H8iPceWSP4CE0qWupCKpPcC1sS9cBWI
         uhvQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780645345; x=1781250145; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybqO7yaMRmktm3USPp7pRyfioFLu3Ymju6bAia56ju8=;
        b=crAzUvaS7+yQ5SfVz3NN3n4YYruODd5wf3PJ2njf6j9QwymGRcc7/mJWHlQo2L23Fl
         KAN6GGMY0uF2KS+8w4NxBo78vRl76ayUVFohNoHdLTBycvQ6FUYOU8DOuAZzr21ho3wE
         026Cr/S+GBbtoErd6/wuBn3oeChg3m8cDvcpzQvTgL0LnANwAgmA47Mwjd5H6xPLXSrW
         GXjo3sJrpMt8vgD91ie4qYcOkqf/nIi3lwtdXoA+CVxlHQMNscsz/mI2CVLX3V5lB7Fu
         6P05AmX2pdtgVDNie/LT+yBLPFN0pOduzglrWeVVC7ieUHugpHDVUWwwOuXlK+Fg3+WX
         IWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780645345; x=1781250145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ybqO7yaMRmktm3USPp7pRyfioFLu3Ymju6bAia56ju8=;
        b=Lyd6vVnRLKY6miMy/K94+tyxFtD/7GHtCE7QcxPsHYaS0EdJqwIE2Asp7i8zfLOwRA
         xJSUIROnldR82gEdsAvLSO2PI7e6N+LuMlehDzZbBd7e1YKsMVcK2UWayzxA3mwtwb4T
         74ZYfLFEJ6F2BylhyEDKHV+KfqePQTYn3dtCQVusysSa8bxzMtWR5wM1K5SQY1VcJwkb
         mYLLzFxsrZVLL8HwMLmrpR9I4AYPAzctVsAE/ayuKeVixpo3r1935BYq1fudJxj6MkWM
         1/Vehlx5BZEg5GzH5GqCzYuULycUpNA2CMkgKTturq3GQUwbdLcUBqouWRgUPj11alC+
         Wuzw==
X-Forwarded-Encrypted: i=1; AFNElJ/3YrHEzlgHl7yfm5FcahzolsGVeRaMaZKWR+e4SvNjneQISO/jCGfK/A21HzJShc84hZecOFvsSzs3@lists.linux.dev
X-Gm-Message-State: AOJu0YzIkht9Nk18vh+1qcPxuFKOLPgLzw6P0H3YEVFVKOayQtKopHIQ
	TfxEoboyHwTaJ2la7xjVyQ2YjEdLIdJm6RefL/49H6vQ+OVdcv8i1u4t4zVIUe76RQtJE/xivP3
	W4jOHjCxipd8ycrJz3KGiLj46lUuD0oU=
X-Gm-Gg: Acq92OGnHhRH6DSN2M1tNhhC4o5yn31nHyuI8LtgyjCPWNBlcOTO/3D9JXh7fo0O4wb
	046qcBMygU9dWDUvOMq2fSDs87k6ToSC5DJ5XnSmAYAMk4N7kMoWR0mRXNcoSnTBL7B+XU2p87y
	6k6qwochNrdzjkgtMo8IKGUlkv863tX/7yGjTMQ6SCXV7hGcOgYNfEwIgZtmPkhcdahMmiouOL5
	YCrmjmzkhff5Q+HMtVrd21j6as6wj71e/fA0m13U52gtuyxX8sbJR2V1X/kOvpO6FDYq4gjzdMH
	JpED4LrKDF3XKJ1wO3yfo5aSu4AhrgzIpcp0hIeIEjUjlPZaek2O
X-Received: by 2002:a05:6402:528d:b0:68d:296d:9a34 with SMTP id
 4fb4d7f45d1cf-68fa4f3d27emr1179126a12.18.1780645344383; Fri, 05 Jun 2026
 00:42:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com> <20260604-fuse-compounds-upstream-v7-2-27331d085c2a@ddn.com>
In-Reply-To: <20260604-fuse-compounds-upstream-v7-2-27331d085c2a@ddn.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 5 Jun 2026 09:42:13 +0200
X-Gm-Features: AVVi8CfKQ8OwWMME5ETj0hipbEsid9rHz2BojulbhT2Y49Mtsy6Y5ylu-V3k2Lk
Message-ID: <CAOQ4uxhRdiSnh9XaK6a1-oO1m3Tb257ffKrRiH=G8GSE_CCUvQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] fuse: create helper functions for filling in fuse
 args for open and getattr
To: Horst Birthelmer <horst@birthelmer.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>, linux-kernel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, Horst Birthelmer <hbirthelmer@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 11:57=E2=80=AFAM Horst Birthelmer <horst@birthelmer.=
com> wrote:
>
> From: Horst Birthelmer <hbirthelmer@ddn.com>
>
> create fuse_getattr_args_fill() and fuse_open_args_fill() to fill in
> the parameters for the open and getattr calls.
>
> This is in preparation for implementing open+getattr and does not
> represent any functional change.
>
> Suggested-by: Joanne Koong <joannelkoong@gmail.com>
> Signed-off-by: Horst Birthelmer <hbirthelmer@ddn.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/fuse/dir.c    | 26 ++++++++++++++++++--------
>  fs/fuse/file.c   | 44 ++++++++++++++++++++++++++++----------------
>  fs/fuse/fuse_i.h |  6 ++++++
>  3 files changed, 52 insertions(+), 24 deletions(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index b658b6baf72f..b3406c33abd2 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -1475,6 +1475,23 @@ static int fuse_do_statx(struct mnt_idmap *idmap, =
struct inode *inode,
>         return 0;
>  }
>
> +/*
> + * Helper function to initialize fuse_args for GETATTR operations
> + */
> +void fuse_getattr_args_fill(struct fuse_args *args, u64 nodeid,
> +                           struct fuse_getattr_in *inarg,
> +                           struct fuse_attr_out *outarg)
> +{
> +       args->opcode =3D FUSE_GETATTR;
> +       args->nodeid =3D nodeid;
> +       args->in_numargs =3D 1;
> +       args->in_args[0].size =3D sizeof(*inarg);
> +       args->in_args[0].value =3D inarg;
> +       args->out_numargs =3D 1;
> +       args->out_args[0].size =3D sizeof(*outarg);
> +       args->out_args[0].value =3D outarg;
> +}
> +
>  static int fuse_do_getattr(struct mnt_idmap *idmap, struct inode *inode,
>                            struct kstat *stat, struct file *file)
>  {
> @@ -1496,14 +1513,7 @@ static int fuse_do_getattr(struct mnt_idmap *idmap=
, struct inode *inode,
>                 inarg.getattr_flags |=3D FUSE_GETATTR_FH;
>                 inarg.fh =3D ff->fh;
>         }
> -       args.opcode =3D FUSE_GETATTR;
> -       args.nodeid =3D get_node_id(inode);
> -       args.in_numargs =3D 1;
> -       args.in_args[0].size =3D sizeof(inarg);
> -       args.in_args[0].value =3D &inarg;
> -       args.out_numargs =3D 1;
> -       args.out_args[0].size =3D sizeof(outarg);
> -       args.out_args[0].value =3D &outarg;
> +       fuse_getattr_args_fill(&args, get_node_id(inode), &inarg, &outarg=
);
>         err =3D fuse_simple_request(fm, &args);
>         if (!err) {
>                 if (fuse_invalid_attr(&outarg.attr) ||
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index f94f3dc082c6..a7d602225f45 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -23,6 +23,33 @@
>  #include <linux/task_io_accounting_ops.h>
>  #include <linux/iomap.h>
>
> +/*
> + * Helper function to initialize fuse_args for OPEN/OPENDIR operations
> + */
> +static void fuse_open_args_fill(struct fuse_mount *fm, struct fuse_args =
*args,
> +                               u64 nodeid, int opcode, unsigned int open=
_flags,
> +                               struct fuse_open_in *inarg,
> +                               struct fuse_open_out *outarg)
> +{
> +       inarg->flags =3D open_flags & ~(O_CREAT | O_EXCL | O_NOCTTY);
> +
> +       if (!fm->fc->atomic_o_trunc)
> +               inarg->flags &=3D ~O_TRUNC;
> +
> +       if (fm->fc->handle_killpriv_v2 &&
> +           (inarg->flags & O_TRUNC) && !capable(CAP_FSETID))
> +               inarg->open_flags |=3D FUSE_OPEN_KILL_SUIDGID;
> +
> +       args->opcode =3D opcode;
> +       args->nodeid =3D nodeid;
> +       args->in_numargs =3D 1;
> +       args->in_args[0].size =3D sizeof(*inarg);
> +       args->in_args[0].value =3D inarg;
> +       args->out_numargs =3D 1;
> +       args->out_args[0].size =3D sizeof(*outarg);
> +       args->out_args[0].value =3D outarg;
> +}
> +
>  static int fuse_send_open(struct fuse_mount *fm, u64 nodeid,
>                           unsigned int open_flags, int opcode,
>                           struct fuse_open_out *outargp)
> @@ -31,23 +58,8 @@ static int fuse_send_open(struct fuse_mount *fm, u64 n=
odeid,
>         FUSE_ARGS(args);
>
>         memset(&inarg, 0, sizeof(inarg));
> -       inarg.flags =3D open_flags & ~(O_CREAT | O_EXCL | O_NOCTTY);
> -       if (!fm->fc->atomic_o_trunc)
> -               inarg.flags &=3D ~O_TRUNC;
> -
> -       if (fm->fc->handle_killpriv_v2 &&
> -           (inarg.flags & O_TRUNC) && !capable(CAP_FSETID)) {
> -               inarg.open_flags |=3D FUSE_OPEN_KILL_SUIDGID;
> -       }
>
> -       args.opcode =3D opcode;
> -       args.nodeid =3D nodeid;
> -       args.in_numargs =3D 1;
> -       args.in_args[0].size =3D sizeof(inarg);
> -       args.in_args[0].value =3D &inarg;
> -       args.out_numargs =3D 1;
> -       args.out_args[0].size =3D sizeof(*outargp);
> -       args.out_args[0].value =3D outargp;
> +       fuse_open_args_fill(fm, &args, nodeid, opcode, open_flags, &inarg=
, outargp);
>
>         return fuse_simple_request(fm, &args);
>  }
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index af4ea2af19d1..219312d5f21e 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1181,6 +1181,12 @@ struct fuse_io_args {
>  void fuse_read_args_fill(struct fuse_io_args *ia, struct file *file, lof=
f_t pos,
>                          size_t count, int opcode);
>
> +/*
> + * Helper functions to initialize fuse_args for common operations
> + */
> +void fuse_getattr_args_fill(struct fuse_args *args, u64 nodeid,
> +                           struct fuse_getattr_in *inarg,
> +                           struct fuse_attr_out *outarg);
>
>  struct fuse_file *fuse_file_alloc(struct fuse_mount *fm, bool release);
>  void fuse_file_free(struct fuse_file *ff);
>
> --
> 2.54.0
>
>
