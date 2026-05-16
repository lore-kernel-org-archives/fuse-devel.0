Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E21A2DECCC
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 21:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778965883; cv=pass; b=XzPOqZ+BxIMNZeQ9TzRUihcZLrqmzVx0wYxL+CoZJR9V00uACtiFLaF/ONZlTi5LVlNGJhQJmbp37j/Yearv7cA9hH9C/iED8jWRqqaGkp46Wd7pkzoEy6exTAZ8Yz9aTfI0mIeoyWbgbyAgtp5MUfsg3EquufAMx8BA/6xyP1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778965883; c=relaxed/simple;
	bh=9T8MAV/Z2BYbzVEpWDGwPL5OUR1k3CrVy9RXTdnURcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWtzbxh2bmhKQR8350Svv4J0qdlDHphzwJzr3w5aLHIkN3SvzVERB9/BQieILUHPW9msB6wnb5fJs4DfhwKKFloZ7mEKLgWOSGmTXv6TECrixPRKACsQzdZKbGq+a4XXeeuUw858dy3+H9j2jSOmIL1zYcllcgVlk91VbvFokwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYKHXZdm; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYKHXZdm"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6804e24803bso2770010a12.1
        for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 14:11:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778965880; cv=none;
        d=google.com; s=arc-20240605;
        b=gscwjFcsuGFjffYaAuTLeSjXAMiIUpEUYPbvcb2ielQ0RH0FPj3ENQ2o+DwpkOycmH
         33j97/rPc6obLozwv6NsDZaqYl2GdAN2HGYoO0d1udRKwbf3k/ZuN9fHt2W7/Gm2BltR
         UxvcQfII1qn91jl7xWxLxSw+vXh2nmUUsnEdXgekTJZR62UwVFLpICr8IuDOYNS9bBuO
         bRcI9Rz+1lhlVxVtBD3ZTqeBVdkX+WMELDOu68smKsLKyy/Te595v3DYp5bk3oKYUwQL
         5+m1SuvJktQzmj4SDvLbBOtJhz6hA5h1wTnA3cvFDvSWwK2Fc1Q43Uezr2Z0bJRFuyIQ
         nzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A67ysE5XxeeBf0jTTxAj4hj+KgoULsWJJUl85Gg0jXc=;
        fh=YTmOHBU2kZUpP0jpS39OhWHpqb9KMJXGb60K+pP1sV0=;
        b=ScemsI8ewdko13Me7b3/VIvBPh0riIFxX8UV4Z/ZerULn7H4Kxsuh5BW1o/hNO7Mxj
         Cz4qC9k1thXs/ENM4A934w5YR5RKtgDaIKlrL6sZRjSiAmaXSRA1CzfoviW7VLxnbvLD
         ULTCb6PlHbpCy/5Psy0IZzoCIRfve6RQ1I8gCp9hW5zDpE1pqaXIyzyd8iyHvc+MbeJ7
         R3+4Ec1FWYl2T2UghpHaeM0Yw71LwMoRhCTtAtsgLHhQwcODKQd8DDoaSiaeGYIduWT4
         OH6FAXaESHEKQ092ZJzOyvABfDJRuSZEYSWixfFJDiXHceMGGLt9AwIf0yhzcjGAV5+O
         omeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778965880; x=1779570680; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A67ysE5XxeeBf0jTTxAj4hj+KgoULsWJJUl85Gg0jXc=;
        b=sYKHXZdm1eLFO3LtRV7laoJoj26oYYAb77V4h1TfOXjFdHggOn+/tqC+q2zyOR4fQ+
         GFH4VVpHA7irwNLPLLdIfWP/32eDHe8tZ2DXmIh4FbDxhKCuMH0hQHf/UD4xUV9aKTVS
         zd9n0oBHy9mqjeYTr5EFngVtBEzZiHC0sNa6D+P5c1ltSF5I1CMQ0WJFIuewKBygMqU4
         J4FFs6tnibN9D43cQX+beFwZnqTp417CUCsKckk1hhNj5/U3cls4jZCMd/MeVAdrrU2K
         Tao9E2tdaJNSEFazQIADNPUUcWWhfuLk13oWg8h6R+VbQbDB4guc4U4qbYIrlZzmI0Fs
         H21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778965880; x=1779570680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A67ysE5XxeeBf0jTTxAj4hj+KgoULsWJJUl85Gg0jXc=;
        b=VaAY2QtzP8KsLVWf3rLfGvXepvQJsFpcW2131FYMkLwRnaCUVWU4+zchn0q4r5a/63
         sxxwtT6DLkTXeD5rP5eVOYrsUCKBtTWPQmkv7P0whoPDLR2Vd+44gOqIaG4Z3bJRtNoU
         tVxvxic2rBAWtdwiU1XAXn7zJETOI9wHI8yjDDuJlxww142DC7FpPGtc7aeTMie8JSWp
         Gwk4bOYKaQDv8W1OTwEF5Ysu9YUA/ZWaRGBikjNPtJ1Zl0t9ZC/saAJwDBgCtcZiXhOG
         TdRNjMThDvKnjDjacMRz3OjlnF687uGHs5tZ1cucEvb8yM5VL7SL+WGvRkr4CXI1tv1L
         vYwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+K7wRxgFs49dM5DWo32pErpvzA5lp0IEGpexNRk4SiqenTsL8E+qPcMTUg0kW2vm6f4uANd8Bc46zJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4D9Rc1/M+gRbEEuqkaK16bM8R4EmmZuovtnbeWRCw1vPfWNqy
	OmSFFIsYkr/xOoI5Veo8lY/KZP0EuKoJXKF+TjRLs1dqqsonIZpUgVTiZOT6TVQuOeBTZ3D5zWw
	rj8ncnMB/OuckmfD0ScTWq05oZD8kR1Dp6sSa
X-Gm-Gg: Acq92OEzte77oPrMnEbNPZD8ydd4tm/ZYyCGacTgQ7nFXGJyeRbOoAT/KfcEVJZ+laS
	pCgdarZI9UuUvWCPn8zHF7SgIef5yN14R1Hcu/9KiXOXbg8IT6UmLv12tWNXn+74SPcVqc2wN65
	JAjIiArLYvYQZpMetq03fmggJNKYnyk5m+EBHxV7Q3C+c/82UesiaZapJGosnIDuAO1Bi4TMAz2
	JOCdcHc8LX5cdZa0V0UpBHJ62c7w+JJJCVilGVonhajrbcJVYqRjhhpkP2y0gcXQz8fAiRRovMV
	jgZxm8hPvYqT+pI8Ah5OWDEYMSgJhHu7iLacOyQd/g==
X-Received: by 2002:aa7:c4e7:0:b0:670:8b38:5717 with SMTP id
 4fb4d7f45d1cf-683bd581a49mr3172816a12.24.1778965880352; Sat, 16 May 2026
 14:11:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com> <20260516004004.1455526-14-joannelkoong@gmail.com>
In-Reply-To: <20260516004004.1455526-14-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 16 May 2026 23:11:09 +0200
X-Gm-Features: AVHnY4LCjD0_KqRUS8AYSJ6OzCvtLsjxvgjLkCCJMTZAdXldvCwAbtEG5cVDU24
Message-ID: <CAOQ4uxhTzoDwrzf-7Zjg+NMO=m2Zqm4du83endsNzejbt1iHqA@mail.gmail.com>
Subject: Re: [PATCH v2 13/21] fuse: add passthrough lookup
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 2:52=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> Use the new/extended struct fuse_entry2_out for lookups. If a backing id
> is set, associate the fuse inode with the backing inode that should be
> used for passthrough operations.
>
> If no backing id was set, cache the statx attributes from the reply.

The 3 lookup patches look fine in general, but I will review them more
closely after I have a clear understanding on the desired protocol.

Thanks,
Amir.

>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dir.c | 66 ++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 52 insertions(+), 14 deletions(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index b7a9d2b0476a..3a6adae530da 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -420,10 +420,10 @@ static void fuse_entry2_to_entry(struct fuse_entry2=
_out *outarg2,
>         outarg->attr.flags =3D outarg2->flags;
>  }
>
> -static __maybe_unused int fuse_process_entry2(struct fuse_conn *fc,
> -                                             struct fuse_entry2_out *out=
arg2,
> -                                             struct fuse_entry_out *outa=
rg,
> -                                             struct fuse_statx **sxp)
> +static int fuse_process_entry2(struct fuse_conn *fc,
> +                              struct fuse_entry2_out *outarg2,
> +                              struct fuse_entry_out *outarg,
> +                              struct fuse_statx **sxp)
>  {
>         if (!fuse_use_entry2(fc))
>                 return 0;
> @@ -469,7 +469,9 @@ static int fuse_dentry_revalidate(struct inode *dir, =
const struct qstr *name,
>         struct fuse_entry_out outarg;
>         struct fuse_entry2_out outarg2;
>         struct fuse_forget_link *forget;
> +       struct fuse_statx *sx =3D NULL;
>         FUSE_ARGS(args);
> +       int backing_id =3D 0;
>         u64 attr_version;
>         bool need_reval;
>         int ret;
> @@ -512,15 +514,27 @@ static int fuse_dentry_revalidate(struct inode *dir=
, const struct qstr *name,
>
>         fuse_lookup_init(fc, &args, get_node_id(dir), name, &outarg, &out=
arg2);
>         ret =3D fuse_simple_request(get_fuse_mount(inode), &args);
> +       if (!ret)
> +               backing_id =3D fuse_process_entry2(fc, &outarg2, &outarg,=
 &sx);
>         if (ret || !outarg.nodeid) {
>                 kfree(forget);
>                 return (ret =3D=3D -ENOMEM || ret =3D=3D -EINTR) ? ret : =
0;
>         }
>
> +       if (backing_id < 0) {
> +               ret =3D backing_id;
> +               goto forget;
> +       }
> +
> +       ret =3D 0;
>         if (outarg.nodeid !=3D get_node_id(inode) ||
> -           !!IS_AUTOMOUNT(inode) !=3D !!(outarg.attr.flags & FUSE_ATTR_S=
UBMOUNT)) {
> -               fuse_chan_queue_forget(fc->chan, forget, outarg.nodeid, 1=
);
> -               return 0;
> +           !!IS_AUTOMOUNT(inode) !=3D !!(outarg.attr.flags & FUSE_ATTR_S=
UBMOUNT))
> +               goto forget;
> +
> +       if (backing_id) {
> +               ret =3D fuse_inode_set_passthrough(inode, backing_id);
> +               if (ret)
> +                       goto forget;
>         }
>
>         kfree(forget);
> @@ -534,10 +548,14 @@ static int fuse_dentry_revalidate(struct inode *dir=
, const struct qstr *name,
>                 return 0;
>
>         forget_all_cached_acls(inode);
> -       fuse_change_attributes(inode, &outarg.attr, NULL, ATTR_TIMEOUT(&o=
utarg),
> +       fuse_change_attributes(inode, &outarg.attr, sx, ATTR_TIMEOUT(&out=
arg),
>                                attr_version);
>         fuse_change_entry_timeout(entry, &outarg);
>         return 1;
> +
> +forget:
> +       fuse_chan_queue_forget(fc->chan, forget, outarg.nodeid, 1);
> +       return ret;
>  }
>
>  static int fuse_dentry_init(struct dentry *dentry)
> @@ -631,6 +649,8 @@ int fuse_lookup_name(struct super_block *sb, u64 node=
id, const struct qstr *name
>         struct fuse_forget_link *forget;
>         u64 attr_version, evict_ctr;
>         struct fuse_entry2_out outarg2;
> +       struct fuse_statx *sx =3D NULL;
> +       int backing_id;
>         int err;
>
>         *inode =3D NULL;
> @@ -649,9 +669,18 @@ int fuse_lookup_name(struct super_block *sb, u64 nod=
eid, const struct qstr *name
>
>         fuse_lookup_init(fm->fc, &args, nodeid, name, outarg, &outarg2);
>         err =3D fuse_simple_request(fm, &args);
> +       if (err)
> +               goto out_put_forget;
> +
> +       backing_id =3D fuse_process_entry2(fm->fc, &outarg2, outarg, &sx)=
;
> +
>         /* Zero nodeid is same as -ENOENT, but with valid timeout */
> -       if (err || !outarg->nodeid)
> +       if (!outarg->nodeid)
>                 goto out_put_forget;
> +       if (backing_id < 0) {
> +               err =3D backing_id;
> +               goto out_send_forget;
> +       }
>
>         err =3D -EIO;
>         if (fuse_invalid_attr(&outarg->attr))
> @@ -662,19 +691,28 @@ int fuse_lookup_name(struct super_block *sb, u64 no=
deid, const struct qstr *name
>         }
>
>         *inode =3D fuse_iget(sb, outarg->nodeid, outarg->generation,
> -                          &outarg->attr, NULL, ATTR_TIMEOUT(outarg),
> +                          &outarg->attr, sx, ATTR_TIMEOUT(outarg),
>                            attr_version, evict_ctr);
>         err =3D -ENOMEM;
> -       if (!*inode) {
> -               fuse_chan_queue_forget(fm->fc->chan, forget, outarg->node=
id, 1);
> -               goto out;
> -       }
> +       if (!*inode)
> +               goto out_send_forget;
> +
>         err =3D 0;
> +       if (backing_id) {
> +               err =3D fuse_inode_set_passthrough(*inode, backing_id);
> +               if (err) {
> +                       iput(*inode);
> +                       *inode =3D NULL;
> +               }
> +       }
>
>   out_put_forget:
>         kfree(forget);
>   out:
>         return err;
> + out_send_forget:
> +       fuse_chan_queue_forget(fm->fc->chan, forget, outarg->nodeid, 1);
> +       return err;
>  }
>
>  static struct dentry *fuse_lookup(struct inode *dir, struct dentry *entr=
y,
> --
> 2.52.0
>
