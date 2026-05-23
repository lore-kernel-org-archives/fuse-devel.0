Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE50C18BBAE
	for <fuse-devel@lists.linux.dev>; Sat, 23 May 2026 01:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779499771; cv=pass; b=X232XLRYZT8izlven0qXqx61c+i/mOWTsykmoVPYJvDjQVr19ELYZ3lDi1W6tiRNpIteiLS+SEJVZMs4Pq/bqSx3QvQkoesJLTTJdVktEXqUtrXm4xUoHYtq3C9XQ2d65pUFGFDl6bI2TiZE71yTjJNHn+LfssfKQIoKTuMGvgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779499771; c=relaxed/simple;
	bh=8zBbg7dKD2bCJagPoNSxQrY8p5aHiYz6PMx9M+9bufA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SHlbwG4um3qvxsCCre/PzeQqQ3erpcAhglqo74FYE/kzrGbpv3s6PTRmjkbobEGuRAxcXN6+gVDvzCle6COHTMUaZ8P20xKWBFP/Ge64xJ9YSnpYFN1hyOtlhVnl4FXLUl2SZKGCALzyEscE/q8DQeM7jqtMY0koW1FxAlzg2G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gd7nlUqX; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gd7nlUqX"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44a044cb827so5897966f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 18:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779499768; cv=none;
        d=google.com; s=arc-20240605;
        b=jlor961bvw209FOt3qvOKVmkTB3J6kpCZ4FzMU9SwuUACNg94ZBRv12AKBa8KxGli1
         bKqBl+g8RN9kr6o8RqLmvNfuVQklxON6kPKBFMs8NvoOImTnlfh509DmlhWX4Iy69Ehe
         KQt/D58dlSXmwG1VYaTf0OROtpX2+vZAsjo54BxiiF+y58K/ifVbAH5OmUb8G3B6/H7E
         JCof0QCVHRXmUVK4A6ICrmV0QXzrrDisgTp2BzKTPB2fUjWY6eASwIDFWlj/vs35xBx+
         Z9NK7ZoACF6CfKgcvHtc5PJuB0kEPcR/OD4HXVV99Qh8T7JawKS6Y8bR1igzlPQvJjiV
         3K/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9S3dDz6OKUHQX7zCqtzJ06OZJ8Gs+3uEKEFTZcI+LDs=;
        fh=qO8CI3kydG3+WnV4+4VpTPNFCW5/UHBuKn/fTQH6304=;
        b=Jan9xzCljk2NbxzPcdX4UrousDzvGcXn1hi5NDSm7rMQm3UINMcuE4spsV+kY3R9kQ
         xSlJVip5dRqLGgkbRzYch41geD9Bx3B9SHS2+pbUZrSh6MNjvrtD64JBV4G75b3DVvcl
         h1/bXb4nUUUfQTaIVbL2C4ncQzaa+QZ69+OhXccZg/qv7zC8QJm6QJz0K+pziGHUcoex
         TZ83a413NZNHrrFDav1n9rBxatXiN0b6Yy/8epo5h/bMyyKLU2xPe5wbE0EuKvi/JRl5
         E3hEl98JKsErjxGXfOcQ1AMpTVNISbsW57C2QZWFFhktwJkA6AgVxHwP793SP93vcpvZ
         jTqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779499768; x=1780104568; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9S3dDz6OKUHQX7zCqtzJ06OZJ8Gs+3uEKEFTZcI+LDs=;
        b=gd7nlUqXABOuFNFhQdjbSwlbj18pK5+QNScxHffNr8zBBw0vITcZID1jVN4qBpJMNw
         o4Y+qeTZ4MLqwvej4eDMHF4krSqxZHB/IoFRIcv47pmGlTGfINTAvrdBYgmoSLPvUjZ1
         C0JA+V979WDVbWzcbgWVRK5h4APpiMb2JhfLF0ZtLuj90ViCFh4vUtzmw9zQhPNZ9Sy5
         2vN7A3buCoLT96OkLW9qiKjkhUM0B3i1HKfSpOH0S4FiPMXMQr0jHjGEaFXMveMX8Rrs
         pKDEmK02HJgYGZjCB1hLn+0CjfzQXfYm6ovLR/EqTkAitluwQ7vitFC2HLxy4hjXEqmV
         OuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779499768; x=1780104568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9S3dDz6OKUHQX7zCqtzJ06OZJ8Gs+3uEKEFTZcI+LDs=;
        b=Hc7dyBFviuk7N8hZsCqjUQ6CEBiH7gtEcyF3qArJJgYMTRfeIMPHcNHTY5LXY1R83M
         5O8WPfqhKi2XrUOGTsgOsuD6hWHLiLUN4IpAP7w75qt+4cLhuvStkaWEZ77YDwzq8mzZ
         ny/kjVE7BMY/Jy8TRI97Rtb5Dx3Z9rykA1dm7DqBr+VuD+pMR7dul68MQU/w1FsvzUKs
         +zKexTHo+vgQkDaxpYFGOP0hN2UIPjiFFcqH0frJAFAbm2nxZKsLyf8bWqORKslalLBa
         4JulU0R4EzJB5EAvGTJAKpzn6URlAv687kW7Yh2o6BOMt/lqD1thR46wNzdehvaSNEGK
         QvJw==
X-Forwarded-Encrypted: i=1; AFNElJ/sZvFRtb0p4hq74/qMkHV7XR8uZ1LtxWu6U+jcpZqlRPBfo+qmLH8wd5oHYHoB/8R6uZ2MIr6baJn4@lists.linux.dev
X-Gm-Message-State: AOJu0YxA0jPLpa2rDrBjSR3TVJj3KFOzcOZut60sZCqlzKTBX1ueGh70
	khOGnqSD49FVSbaDNzqmLxIKLvMklJI/rVxN14bhp70D+AegMbeXleXLvsOalz6XX3eOLRi/XJA
	7z32mUjRys1A9Z2u2SC7mbrApNi1cYeQ=
X-Gm-Gg: Acq92OGs/RuP7jbgL17dJIylU9JECzsKQPZjAKP9oNomHL6KBzgLoFoE7NmpA1464rG
	sq8bEbziy1Agw14Tmycv+G8flNuprx8yvJg4CBsY980j1jpKuQkk/iSFgihChIYP5xFOKuAaj3v
	kN+Kp4+j6oqfHNKqP3S++T8yU8hanQESNkYN/eKpxe0C6Yq1huMkEBNRVRiRu+lRsx7oiF42XcG
	+UsoY1onTViEJPWOF8EBVSS3ITghozpMOkOA16W2latabHiDVIDMrTqfitoqzROOGQigjqhvq+V
	rqnvQA==
X-Received: by 2002:a5d:5d85:0:b0:43f:e272:edff with SMTP id
 ffacd0b85a97d-45eb367034emr8829004f8f.4.1779499768323; Fri, 22 May 2026
 18:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177922946123.2439242.16666495969848656301.stgit@frogsfrogsfrogs> <177922946329.2439242.17189876954349215664.stgit@frogsfrogsfrogs>
In-Reply-To: <177922946329.2439242.17189876954349215664.stgit@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 22 May 2026 18:29:16 -0700
X-Gm-Features: AVHnY4Lep95ZJ6v19KUpg1LJlQIFxjGaUjTORgCARtry_EUicyIkhEs3Kr6SwAI
Message-ID: <CAJnrk1bvmZ0htacx8sqZ+aBVVS_x+7kap77SEctwwB_F6ttsSw@mail.gmail.com>
Subject: Re: [PATCH 7/9] fuse: invalidate ranges of backing devices being used
 for iomap
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, neal@gompa.dev, 
	bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 3:32=E2=80=AFPM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> From: Darrick J. Wong <djwong@kernel.org>
>
> Make it easier to invalidate the page cache for a block device that is
> being used in conjunction with iomap.  This allows a fuse server to kill
> all cached data for a block that is being freed, so that block reuse
> doesn't result in file corruption.  Right now, the only way to do this
> is with fadvise, which ignores and doesn't wait for pages undergoing
> writeback.

imo this would be cleaner going through the ioctl backing interface
instead of through notifications.

I was thinking of something similar in idea for this for passthrough
where you're able to dynamically update or invalidate a mapping
corresponding to a backing id. It'd be great if we could both use the
same uapi.

>
> Signed-off-by: "Darrick J. Wong" <djwong@kernel.org>
> ---
>  fs/fuse/fuse_iomap.h      |    3 ++
>  include/uapi/linux/fuse.h |   20 ++++++++++++++++
>  fs/fuse/dev.c             |   28 +++++++++++++++++++++++
>  fs/fuse/fuse_iomap.c      |   56 +++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 107 insertions(+)
>
>
> diff --git a/fs/fuse/fuse_iomap.h b/fs/fuse/fuse_iomap.h
> index c4b98123072a37..f40d202c64c822 100644
> --- a/fs/fuse/fuse_iomap.h
> +++ b/fs/fuse/fuse_iomap.h
> @@ -67,6 +67,8 @@ int fuse_dev_ioctl_add_iomap(struct file *file);
>  int fuse_dev_ioctl_iomap_support(struct file *file,
>                                  struct fuse_iomap_support __user *argp);
>  int fuse_dev_ioctl_iomap_set_nofs(struct file *file, uint32_t __user *ar=
gp);
> +int fuse_iomap_backing_inval(struct fuse_conn *fc,
> +                            const struct fuse_iomap_backing_inval_out *a=
rg);
>  #else
>  # define fuse_iomap_enabled(...)               (false)
>  # define fuse_has_iomap(...)                   (false)
> @@ -94,6 +96,7 @@ int fuse_dev_ioctl_iomap_set_nofs(struct file *file, ui=
nt32_t __user *argp);
>  # define fuse_dev_ioctl_add_iomap(...)         (-EOPNOTSUPP)
>  # define fuse_dev_ioctl_iomap_support(...)     (-EOPNOTSUPP)
>  # define fuse_dev_ioctl_iomap_set_nofs(...)    (-EOPNOTSUPP)
> +# define fuse_iomap_backing_inval(...)         (-ENOSYS)
>  #endif /* CONFIG_FUSE_IOMAP */
>
>  #endif /* _FS_FUSE_IOMAP_H */
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 0366101be3a321..899964f8d6616a 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -247,6 +247,7 @@
>   *  - add FUSE_ATTR_EXCLUSIVE to enable exclusive mode for specific inod=
es
>   *  - add FUSE_ATTR_IOMAP to enable iomap for specific inodes
>   *  - add FUSE_IOMAP_CONFIG so the fuse server can configure more fs geo=
metry
> + *  - add FUSE_NOTIFY_IOMAP_BACKING_INVAL to invalidate iomap bdev range=
s
>   */
>
>  #ifndef _LINUX_FUSE_H
> @@ -706,6 +707,8 @@ enum fuse_notify_code {
>         FUSE_NOTIFY_RESEND =3D 7,
>         FUSE_NOTIFY_INC_EPOCH =3D 8,
>         FUSE_NOTIFY_PRUNE =3D 9,
> +       FUSE_NOTIFY_IOMAP_BACKING_INVAL =3D 99,
> +       FUSE_NOTIFY_CODE_MAX,

Could you explain why this is 99 and not just 10? Btw, I don't think
we can define the max enum code like this in uapi, as I think that
will break backwards compatibilty when upgrading to a new kernel if
new opcodes get added in the future. I don't see this getting used
anywhere in the series anyways though so maybe best to just delete it?

Thanks,
Joanne
