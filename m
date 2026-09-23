Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA7F4137BF
	for <fuse-devel@lists.linux.dev>; Wed, 23 Sep 2026 07:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147321; cv=pass; b=n5CmT2hs0A1gUI4N/ROL8AsBK65l87mNU0MbxDU9ahYzuiNhDNujPYb4btwI0OuDil3FQJVaWFmUCuS+dvvCrcAOE+keR4AETSejSsKCc+jjS4P+ZXGLGcdJrl0B26QVo5yHzSTJiO5I6Sd656bYPMWrcETpPhN8iiNo+rM62GM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147321; c=relaxed/simple;
	bh=44SnmvbWdneUeO++9D5+pWsDCjiK1AEGhUtPLshqW1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qiPTlx9qrRMJ4Dca9+JKPfYy8Ffcse6v1EJq3sPqH95DjCKG6Bh0D/wpNO29cqIDUftRDqPqUo/jbfgBZtJZ94ov4EsQcJt6ypydKpidUvPZOd5Q5D8M77DMjz7S5B4T3GjTT0r6rOa6j6tWAFgW0AoebwLBrT6YK57dtEyiZ5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTVMkoff; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTVMkoff"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa4c24cso82233366b.2
        for <fuse-devel@lists.linux.dev>; Wed, 23 Sep 2026 00:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790147318; cv=none;
        d=google.com; s=arc-20260327;
        b=kCEbRcpHxeVr8qV+MNqIKY/fu1/xaFYgVzRCR20YZpvAzbKz9GAldYNbydai6VdFEp
         F5DH7x4jfllOCagkjIhmKz3zVfFYOfQtdzcBXkYZjaSguPN3TjOR8adTwlKYz4pJgD8G
         mNRUjRUSyCzoaJHuUxNffeX3Xjq2VwIYsszYCRZXOiloxtcnijqPlYjhNnr90AHmzmli
         IcOcH6XjAuVQaTt/IbkpxHo3i7mwqk6PYXqrHVovg6wHEwDleURoQl2lKUB4SqxQCLN1
         lWhUBKJBE9NtDjPFBveINuNJjgGmweB0uHXThE6kPXw+9GHRg+vspI/Y7MX12oJQZgWn
         WqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yINQveyc6NUU9iJf7U4XoMbvxiWrtauc2EsgJCKe3+4=;
        fh=/TSH+giuxvuaKz1YyT9tpaUYB8P7iFbOQGE+bj1mcSs=;
        b=p6jmLyNSTwcBeNoJ2xxnlynWGmMVhOGzelggniIf8K8Qw2rv1Fu5IzWOASQEVAOofr
         WZpd0MqjKzwHbGLaG81iO4Tiw26HdZaKVNqoIKoF22sQVcptI3XyL6+/6lEhLnM02UH2
         KbItA7s2P41hhtgIib0T3aBD2OMMnZhHEqe9iW1PqijBWTOrClgNxLddV5d3SmLhrjeE
         c4JzKnHNEPjWZzEhwFtPhWDYOZ+iE97MP+8SY+f4p7vDx06Yw8Jr1aOm+meM0rOtXqij
         Pz2lUUfpFKaeH6oJemcmNNVoeDpLR0YeqB5hq5ww2sJwBEi7p2aVw3fp4gZVCVm/38bO
         +A1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790147318; x=1790752118; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yINQveyc6NUU9iJf7U4XoMbvxiWrtauc2EsgJCKe3+4=;
        b=WTVMkoffhEqd60LUNjWukZJGZe6hPEwtXkbbrZ6jJQj79AhLdiG1PfQ+uTOLIEcRae
         K8wK2q2aArbQN0bb9m3Qzh5UXHvgnsZZDCsjuyNqEgBOfQORQjogzfdD+x0NDYBEFx9C
         w3IC+5yaKRksjWXKhivamXtZ8HQht4tW8zVZs1dBjufpg5kf+eRu3c9B/yM9rzSKG6Cj
         LQOY//SCobk3635WIEiJx31T7WKa+QWjgZaNCeVCUp+fYIDzLW8VJ2+UMX6JAQx+rVgU
         2pwlKtDbYFUYvXZDROtCRAIYAWNV/gEcRsf3DraXZt/CQdghETmfFi/LG0+wMsXbDG7/
         301g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790147318; x=1790752118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yINQveyc6NUU9iJf7U4XoMbvxiWrtauc2EsgJCKe3+4=;
        b=ioez7nUP17usC0qtzPPbIo134dmsmAp6qWufhEP1OoSMqWEDDXWeZpkdJMp5jc8ifb
         520KEiBVYSNabCdb6hD3tKgpPMUQv27DdVsphGGVJ6TjBCedTQZqaRe5D1OPeJsA11a7
         k06fkDPnleHIoaAcLa0i+0SNWHMyIUMxdk0qxm4ym5usNZbtwKJ+rdeCdsvs7ZY3tzqj
         pW7vWZ/cWT2dZcXRMY+AP2Ud+QRZEO/EgQ6n2gPqeiDQDwE2yuOxmok4voKWQg0V6tHq
         QMlHIq/nZJEpyr2BLyhTnP5iooR5JecWV/wnnkRAGr0T0/GlPnii9u94OevmOJiS85sI
         j6oA==
X-Gm-Message-State: AFuF++nuhDDCS6asfz3S9YdAAFXdCM3fsB2YO81RHoHU1eK7QW8vAni+
	0847V1l051ChdV92fBZpfgbllFlZRG1tVUaD0L/A5+n+Rpo7eaUGLfR41tXWp+uDq8lkHPMJVqV
	DdlXaWbdWhL5xymNhZ69I64GXRv4LB88=
X-Gm-Gg: AYBFou1enHBSWYsk+lBzV4Lrqqw1J/SHrXra9HFyXEr0/8jiicMO9DEBQYoAhbR5SEC
	9ImdJzB0ztqF0wChr9/j0zfor/JKoD8D0kRF71qbygiiHu96yjz2rbF0zZRJAR/RE3J8B/rz+Cf
	i8nX74MQYjwBu33gfJjJ64TLpEf5c8W/Gwm2mQWMUGS2t3NvaLohMVqPVK9CgSV2xhHPn72rSHa
	BBaeL4of4zg8ZcXN0q4iiyVMtDCjtbnR8JNoUL1wUHkSf1luXQLmGxVU7paU5u7cZXfrB5ir1c0
	lSy7aozp4NNGhxX3GvTmtVxUfNFVnEdHjXZbmsEuOvlu2VpOaCFzWVXaa9BkU5kZokrodVUxvpU
	fmw==
X-Received: by 2002:a17:907:720f:b0:c29:386c:58f2 with SMTP id
 a640c23a62f3a-c2aae0e4644mr121282566b.38.1790147317726; Wed, 23 Sep 2026
 00:08:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-7-mszeredi@redhat.com>
In-Reply-To: <20260922061019.3320196-7-mszeredi@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 23 Sep 2026 09:08:26 +0200
X-Gm-Features: AclHuK-zjNqCDDgIjFI3VvqMYBNrF0XupUAAWqCLukL2L8hrJp-tjAxSZ42Cfjs
Message-ID: <CAOQ4uxgfEM3CiBCCu53MDJnHDiYOmmMB5zZ1pqABUPiFag67-g@mail.gmail.com>
Subject: Re: [PATCH 06/11] fuse: support 64 bit, server allocated backing ID
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	"Darrick J . Wong" <djwong@kernel.org>, Joanne Koong <joannelkoong@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> Add support for server allocated 64-bit backing IDs alongside the
> existing kernel allocated 32-bit IDs.
>
> Opened with FUSE_DEV_IOC_BACKING_OPEN, but the backing ID is sent via
> fuse_backing_map.backing_id, with FUSE_BACKING_ID_64 being set in .flags.
>
> Closed with FUSE_NOTIFY_BACKING_CLOSE.  Since close only provides the
> backing ID, not the file descriptor, it doesn't have to be done with an
> ioctl.
>
> All 64 bit values are valid.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
[...]

> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 10a7f31c4bdf..f271faa60424 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -251,6 +251,10 @@
>   *
>   *  7.47
>   *  - add FUSE_HAS_SYNCFS opt-in flag for privileged userspace servers
> + *  - add FUSE_NOTIFY_BACKING_CLOSE
> + *  - add struct fuse_notify_backing_close_out
> + *  - add backing_id to fuse_backing_map
> + *  - add FUSE_BACKING_ID_64 (multiple structs)
>   */
>
>  #ifndef _LINUX_FUSE_H
> @@ -709,6 +713,7 @@ enum fuse_notify_code {
>         FUSE_NOTIFY_RESEND =3D 7,
>         FUSE_NOTIFY_INC_EPOCH =3D 8,
>         FUSE_NOTIFY_PRUNE =3D 9,
> +       FUSE_NOTIFY_BACKING_CLOSE =3D 10,
>  };
>
>  /* The read buffer is required to be at least 8k, but may be much larger=
 */
> @@ -1153,10 +1158,17 @@ struct fuse_notify_prune_out {
>         uint64_t        spare;
>  };
>
> +/**
> + * flags for fuse_backing_map
> + *
> + * FUSE_BACKING_ID_64: backing ID is server allocated, stored in @backin=
g_id
> + */
> +#define FUSE_BACKING_ID_64     (1 << 30) /* used in multiple structs */
> +
>  struct fuse_backing_map {
>         int32_t         fd;
>         uint32_t        flags;
> -       uint64_t        padding;
> +       uint64_t        backing_id;
>  };
>
>  /* Device ioctls: */
> @@ -1193,6 +1205,11 @@ struct fuse_copy_file_range_out {
>         uint64_t        bytes_copied;
>  };
>
> +struct fuse_notify_backing_close_out {
> +       uint64_t        backing_id;
> +       uint64_t        reserved;
> +};
> +

On second look at this uAPI and after failing to retrofit ops_mask into
fuse_backing_map, I think it would be better, along with init flag
FUSE_PASSTHROUGH_V2, to decommission both old ioctls
and use new ioctl with consistent verbs for the new notify's:

/**
 * flags for fuse_backing_map
 *
 * FUSE_BACKING_IS_DEV: @fd refers to a device file
 */
#define FUSE_BACKING_IS_DEV     (1 << 0)

struct fuse_backing_map_v1 {
        int32_t         fd;
        uint32_t        flags;
        uint64_t        padding;
};

struct fuse_backing_map {
        int32_t         fd;
        uint32_t        flags;
        uint64_t        backing_id;
        uint64_t        reserved[2]; // for ops_mask etc
};

...

#define FUSE_DEV_IOC_BACKING_OPEN       _IOW(FUSE_DEV_IOC_MAGIC, 1, \
                                             struct fuse_backing_map_v1)
#define FUSE_DEV_IOC_BACKING_CLOSE      _IOW(FUSE_DEV_IOC_MAGIC, 2, uint32_=
t)
...

#define FUSE_DEV_IOC_BACKING_MAP        _IOW(FUSE_DEV_IOC_MAGIC, 4, \
                                             struct fuse_backing_map)
...
        FUSE_NOTIFY_BACKING_MAP =3D 10,
        FUSE_NOTIFY_BACKING_UNMAP =3D 11,

This way the backing unmap notify verb matches the ioctl and notify
backing map verbs and FUSE_NOTIFY_MAP is disambiguated from
the non-backing FUSE_SETUPMAPPING.

And we don't really need FUSE_BACKING_ID_64 flag in this API,
whose meaning is not very descriptive of its API overloading nature.

Thanks,
Amir.
