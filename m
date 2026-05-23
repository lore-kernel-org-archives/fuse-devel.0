Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C2F16CD33
	for <fuse-devel@lists.linux.dev>; Sat, 23 May 2026 01:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779498390; cv=pass; b=dPc+LWBdeRrRquZMVpcL3TTSt35kR+h+8GXwr9c1hXXUBqF0YzB6EtEUS7alWVNCtTGAg6ip3q8gOsqsUyn7grukOO5RCruZpergmSulrGmjQIZkpRha65zGgQN7OqujVL9JoT1BsxzoOcNRRIEonxLZbN/q+6KTwMuox4S1X/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779498390; c=relaxed/simple;
	bh=008arDp8vvl2EH8wWoKU9y05SBL71K8zEeua9ZIvMAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbWfrA8iXSJo8qzN4KA2d4bpTofzebV9DySmwHJfcig5Qk+cUC+frVaA31HFnz3tRC7TpDNmITJN6GRuZGlTRdLmwGUMhaTzfxuzdboZzS8jAJrGwd8KzsbSAW8sjtsYc8tB/JjAnaUKRr9ztTArBSoufZB3gTB6e00KWTcShjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNThtH68; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNThtH68"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso91096445e9.0
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 18:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779498388; cv=none;
        d=google.com; s=arc-20240605;
        b=QzxaZFChdy8WIpn+rwsMJJcjbIw5uvU9KZ8JWwYC5457dufF9Mt9xo6xuV/+6Gx+Ue
         D88IDpRfHxzF+5GXrRPvqLlvYQdx1QR4OoZhTupj9q8B7kW0Lq2usEcYgyU5f4fi/OSS
         r65keZlQc7daUsQ89VIk7xDvVUQwSXoZWhynTyZELnRwoMnUJT9+FRh3ls3ibzvVUxCp
         WSkmUsvkJKsDb/WIKVLPNeq6Pw/MnDCkvProHw9hdrtMvKVH56CIGf+FBN4FNgrAEEoI
         /4s/kdUzQYZOYaZfi9MRXv12FR5UXwfjfkBCEdoUTRsfQqI5HlZSo/j4oNWdh66bBfBN
         93/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7G4sWsoHD5+tNB33FsWgjk9NhMBuRi9WIelOtZhiH5U=;
        fh=6n7UiLOo60zunV3xCWWetIAhCm2cO5ErWJOHLNcD3SU=;
        b=B63AtWK0VrIOfkrcufWDwsD57QGAWHxMBxqiBnAAxhdATQ3cbE3ZqWNtbjIDslWNth
         muYy454JGgfVb4v531lE5f4ct2hAmxHBVkT0zuquKTlDuw0oGLqwsqDCaKpDMmKies9b
         sygIVH+DgULOl3t4DJJjGgQFtdfh6myE+n2wCQouswAvr7J/E61prJpnup5PHq1pDGtr
         ZMunL7dnMAvYrCPajhOjbaIqZiDpUtYXfhi73Ngk2btENRRLCaxoCTciwJanaZla8Mnr
         2GSa6tv74Ex3AvcuOo4L37tv+5q/oxMEqhdMyyz7OMc5nDDmBjzqWNgKTV8KEg/7LJS/
         qRrA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779498388; x=1780103188; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G4sWsoHD5+tNB33FsWgjk9NhMBuRi9WIelOtZhiH5U=;
        b=cNThtH68+M5o/yjCLShVNFk1143FSI9jGyZbaHr3eOSnHQ0UxR0UKyh2TZ/mB7Jlhn
         C8Ah6nKzEi2foMvzN74+cbnuWnmNlTmv4XyyDHqaZx9aU4tacrXQTj7YkkOprUTuOpwT
         VcnvZACYxntQIFETFXdNqs3cyl1WSBnP/57xHBSFsiovkw+mJZRE4D52yKKAimwmvY5f
         tIH+2izTeAO0r4Q9/n2+JmWLDDIiowi0Fwm9/8SJXFiLVybKFjnxvFa8HmwW3GZrb2gn
         vYjjJFJiVdljctB6brNuMF8E1zccYNEDIH2RA+vxge6dsTLoACiU0lmb/hkmS91trTXy
         yzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779498388; x=1780103188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7G4sWsoHD5+tNB33FsWgjk9NhMBuRi9WIelOtZhiH5U=;
        b=pAaUBYR3iZsG5J16y8YCv0sqcp3opUe847SghtqJOMZu6rnhRv7/iFtgnz8yfIM2na
         kS0pubRS06dDR5cddoZaBFqsC9GKOipiXeQwhW+kxUkLBsRywkUdZrOTw5WF0jwSmheD
         zTp6pff9wHEOhZnLs3hdB+uk6tqr3f9a+TGI4dRtz+0vZVrebIdVeqrXdvvva+zRGZ1i
         OirUrU4G9o+twJLAiR0fclLH8NxvNFDK7/afGfgktl6pqKrZ6WVuNVOKUTEFHmRm3P4v
         YNCuc/dNOlrR+l7nt8uSSC7M9yoGGtimXyDIjfLPKNCXDHfusjFHaRI6crJ7EUZmlQBo
         FgAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wiCKKQBH/+pbF5YP5fhYHGEhqPuNkBlsnbUGG3uNQkTWNQf+aFaOd055ihHQsnkMx1vLsiGOT8QQq@lists.linux.dev
X-Gm-Message-State: AOJu0YzL6hW5DFMBAWtPybuctLJydn5ZO+pFAPOgocLEXQaeDu6+Tmx6
	oQ6Aqbmvd+fmdl4P4+ibspwcF6aosglDMNYNL4gMZWevwU1O9TgmKDllZRDYU6eDBUn4EUFtIuB
	9B1NjMQ9IdE9/vE+P3SwlDt46L06ztqfb0L9l/8Q=
X-Gm-Gg: Acq92OE8Q8DDTmL6D97Fyp16ofDNKanRexuhTxU7ru+dkSXFr5MIQhffnaDRPHRTJrl
	9dwff2PPnGqwmscfFTz29iZI5m1ANdJgSapRvlBn7IgOMJuLlB2Z1bEtPWvmEk5mXUSayyAbiLI
	fhD2xzaZ5IIWJFa6dC1WCJS+a3RNQ5qWbXVRAgUuQB7oPoCIbmEdhmIO5I9O9AUsSGx//IxWF1p
	p18687Ik6d2IXiyPdRN8LhslD376Fr4AHKoC2OXCt6ubf6SkN4xoAjrEMdfNOo+G1LkdNLn31JE
	oRMMURew+SpvA55m
X-Received: by 2002:a05:600c:8b12:b0:490:5191:6e1a with SMTP id
 5b1f17b1804b1-490519170d7mr7796475e9.24.1779498387457; Fri, 22 May 2026
 18:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177922946123.2439242.16666495969848656301.stgit@frogsfrogsfrogs> <177922946372.2439242.13829037107289830266.stgit@frogsfrogsfrogs>
In-Reply-To: <177922946372.2439242.13829037107289830266.stgit@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 22 May 2026 18:06:15 -0700
X-Gm-Features: AVHnY4JgP4gSwmN4FgBMIFrOf4UkX3I3qaORsxpu8HZHoxK64s5u0FUTDQvEIVo
Message-ID: <CAJnrk1ZQbvCL=ok4WHBn0gC+=k88Cejts_-_DP3epa51Wz5+5g@mail.gmail.com>
Subject: Re: [PATCH 9/9] fuse: set iomap backing device block size
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, neal@gompa.dev, 
	bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 3:33=E2=80=AFPM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> From: Darrick J. Wong <djwong@kernel.org>
>
> Add a new ioctl so that an unprivileged fuse server can set the block
> size of a bdev that's opened for iomap usage.

If I'm understanding it correctly, doesn't the fs/iomap layer align
all i/o to the fuse file inode->i_blkbits and submits bios to the
underlying iomap->bdev without ever reading the bdev's
inode->i_blkbits? Why do we need this fuse ioctl then for setting the
block size of a bdev?

It seems like this ioctl is re-implementing the BLKBSZSET ioctl but
bypasses the cap sys admin privilege checking that the BLKBSZSET ioctl
requires, which seems like a security violation. Am I understanding
this correctly?

Thanks,
Joanne

>
> Signed-off-by: "Darrick J. Wong" <djwong@kernel.org>
> ---
>  fs/fuse/fuse_iomap.h      |    3 +++
>  include/uapi/linux/fuse.h |    8 ++++++++
>  fs/fuse/dev.c             |    2 ++
>  fs/fuse/fuse_iomap.c      |   27 +++++++++++++++++++++++++++
>  4 files changed, 40 insertions(+)
>
>
> diff --git a/fs/fuse/fuse_iomap.h b/fs/fuse/fuse_iomap.h
> index f40d202c64c822..3cfef073cbe5aa 100644
> --- a/fs/fuse/fuse_iomap.h
> +++ b/fs/fuse/fuse_iomap.h
> @@ -69,6 +69,8 @@ int fuse_dev_ioctl_iomap_support(struct file *file,
>  int fuse_dev_ioctl_iomap_set_nofs(struct file *file, uint32_t __user *ar=
gp);
>  int fuse_iomap_backing_inval(struct fuse_conn *fc,
>                              const struct fuse_iomap_backing_inval_out *a=
rg);
> +int fuse_iomap_backing_set_blocksize(struct file *file,
> +                                    struct fuse_iomap_backing_info __use=
r *argp);
>  #else
>  # define fuse_iomap_enabled(...)               (false)
>  # define fuse_has_iomap(...)                   (false)
> @@ -97,6 +99,7 @@ int fuse_iomap_backing_inval(struct fuse_conn *fc,
>  # define fuse_dev_ioctl_iomap_support(...)     (-EOPNOTSUPP)
>  # define fuse_dev_ioctl_iomap_set_nofs(...)    (-EOPNOTSUPP)
>  # define fuse_iomap_backing_inval(...)         (-ENOSYS)
> +# define fuse_iomap_backing_set_blocksize(...) (-EOPNOTSUPP)
>  #endif /* CONFIG_FUSE_IOMAP */
>
>  #endif /* _FS_FUSE_IOMAP_H */
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 899964f8d6616a..0b67938bb7baf0 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -1173,6 +1173,11 @@ struct fuse_iomap_support {
>         uint64_t        padding;
>  };
>
> +struct fuse_iomap_backing_info {
> +       uint32_t        backing_id;
> +       uint32_t        blocksize;
> +};
> +
>  /* Device ioctls: */
>  #define FUSE_DEV_IOC_MAGIC             229
>  #define FUSE_DEV_IOC_CLONE             _IOR(FUSE_DEV_IOC_MAGIC, 0, uint3=
2_t)
> @@ -1184,6 +1189,9 @@ struct fuse_iomap_support {
>                                              struct fuse_iomap_support)
>  #define FUSE_DEV_IOC_SET_NOFS          _IOW(FUSE_DEV_IOC_MAGIC, 100, uin=
t32_t)
>  #define FUSE_DEV_IOC_ADD_IOMAP         _IO(FUSE_DEV_IOC_MAGIC, 101)
> +#define FUSE_DEV_IOC_IOMAP_BACKING_SET_BLOCKSIZE \
> +                                       _IOW(FUSE_DEV_IOC_MAGIC, 102, \
> +                                            struct fuse_iomap_backing_in=
fo)
>
>  struct fuse_lseek_in {
>         uint64_t        fh;
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 06f52114b9aef2..d6ba8d6b1a8875 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -2746,6 +2746,8 @@ static long fuse_dev_ioctl(struct file *file, unsig=
ned int cmd,
>                 return fuse_dev_ioctl_iomap_set_nofs(file, argp);
>         case FUSE_DEV_IOC_ADD_IOMAP:
>                 return fuse_dev_ioctl_add_iomap(file);
> +       case FUSE_DEV_IOC_IOMAP_BACKING_SET_BLOCKSIZE:
> +               return fuse_iomap_backing_set_blocksize(file, argp);
>
>         default:
>                 return -ENOTTY;
> diff --git a/fs/fuse/fuse_iomap.c b/fs/fuse/fuse_iomap.c
> index ba54eb694dbbac..2deed4749738cb 100644
> --- a/fs/fuse/fuse_iomap.c
> +++ b/fs/fuse/fuse_iomap.c
> @@ -2448,3 +2448,30 @@ int fuse_iomap_backing_inval(struct fuse_conn *fc,
>         up_read(&fc->killsb);
>         return ret;
>  }
> +
> +int fuse_iomap_backing_set_blocksize(struct file *file,
> +                                    struct fuse_iomap_backing_info __use=
r *argp)
> +{
> +       struct fuse_iomap_backing_info fbi;
> +       struct fuse_dev *fud =3D fuse_get_dev(file);
> +       struct fuse_backing *fb;
> +       int ret;
> +
> +       if (IS_ERR(fud))
> +               return PTR_ERR(fud);
> +
> +       if (!fud->fc->iomap)
> +               return -EOPNOTSUPP;
> +
> +       if (copy_from_user(&fbi, argp, sizeof(fbi)))
> +               return -EFAULT;
> +
> +       fb =3D fuse_backing_lookup(fud->fc, &fuse_iomap_backing_ops,
> +                                fbi.backing_id);
> +       if (!fb)
> +               return -ENOENT;
> +
> +       ret =3D set_blocksize(fb->file, fbi.blocksize);
> +       fuse_backing_put(fb);
> +       return ret;
> +}
>
