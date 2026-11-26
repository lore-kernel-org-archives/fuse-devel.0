Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795706244;
	b=DC2z5Ijj5MYagDpxj+IvoMK87Q83YU6AMbzcg/t/yw24fbQDa1HsfWANHfolMbK7nT2H
	 7XO1fIRhZfGuVLn7fPl05EMPg/H+ogj8mUpj8+34Txky4uKMuuDRIbeWC8eXju/Tn37wF
	 OPPIvyTl1fqq11MtLORZO5URNPYH34mZ6k8vAXkgtapm1XpmhmM0Db+LAPVgiTIcVqVlJ
	 Glbq9czn/TQkeNMycbvY1zcAQlS90TbDmEA1X1VzZlUzqgrZzESITC2KJMW1uDVuojYQv
	 PCJgUzunW+zKdNoe4uIQyp7cNER0ZlUoBhu4VCq5mgh2u5T7K45IfhVq8wtlQ8bjqHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LRd2ScaOm5uuXBAm7fGNwOu6s86L+5sBL7Fa8S5kLwc=;
	b=JWBhBsgy5nJDKj2XibQC0VcpSQcUS62KJNDe6GVB8Q88mFlCdnofo3QpaSiwC+AbmnlA
	 MR5pXE2e6uMjBD/7Q4SwRffBl21bQJWwQ4fozZhQ1v7NPuGbwhmgJVdF4zxyLkI7quCrF
	 VVkaSir8hVGh7o4Xf06b9VRGwYW9HuhhkpjHcMDtWKyky4bOxC4jqgAvaljxz3MA3WlHY
	 jhSI2NXwaVhK2bL440ccKZDXMMlhHtKX+igJ2W+2IaFMGn03cZKLMjWwF5cgAOm9ftsV/
	 ToYJdAXhLr5thHwBW9wUGrtpfKpONYjJnvzSREuLf4ESier6M2ncR9QCD/R54VHExDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=j+Kkcehc;
	arc=fail smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F07D606A31C
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 15:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F07D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=j+Kkcehc
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53634b8328eso66571631cf.0
        for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 07:17:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795706242; cv=none;
        d=google.com; s=arc-20260327;
        b=QqK7qe0OXMKDlVUh9U5a3YXoIIL678KEaUtn8MnZv8Wb/rOi8rRnctlMB1oL5idGs2
         wac+Y4b9EsbkK5Qqa1XQKDmvWMY2ZcWKsRVg9mILsXdTaJfbJ6XJcH8pF4liBeNsFSFL
         m+JBZrJOQzXOInx6m4sZG3nuiUk+lzwosvXcRdUvYko9ObfL8dRSxDvJcHahSbez1kBB
         +Qtqbjb5qOoVD4h15d7bN7JQ9Gma+K2RAY5aaBnXZ8GKn+6K81AK5CGH9bEoEdXF4HxS
         5bi98/CSqD1jR7ZFIk3k8O7v3FV6essCzi7RESCUSMxA5hj2FKc9wigTEjTyFPCzCIi3
         zW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LRd2ScaOm5uuXBAm7fGNwOu6s86L+5sBL7Fa8S5kLwc=;
        fh=AXGaYrh6V6O0IxIZv7uC6gnuc6Z0qqSrhX7XoHS5IQE=;
        b=VS2NJRkVCCj8qql9NGzzbLQfCRA7wwbjW5XmVQtt3sNK7rr0DRRofMY4sgzGShaogs
         PUvEJ6F5rkCuI6xIPWN8cWld1VgQvj/TCmvctHRsyOwE0opAQIRS7oizcJ+HZeBODUvA
         NI99mUoRVll6Whj4sN9bKDwq9DM4D56O3nRW/KyQlaEcNnu/ToTdOtfBEp/Bjx/yAUhi
         5fzUE+/hji3iYeA07hSx66UGeiTqCrVG/JjCdo1vMevbZtLq1HSJIh3mafQ7aUsbMVZ+
         Qr991FkObOoGSj2hdbItqVtctt8Ae8Wv60r7PSHQaYUPOzQGp65vvljjr+3bDDrfUPhM
         D+YQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1795706242; x=1796311042; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRd2ScaOm5uuXBAm7fGNwOu6s86L+5sBL7Fa8S5kLwc=;
        b=j+KkcehczzbbeOIokpeZAqsygiqpkda9+QnnAQdqU5HkrIWj5Q6r6vgE8FftO8mKpn
         xnd5AEYIygmv2Q4+8lNGloSMmunVjQoDH/96CFpKA0jDL8Dqvw+4qXrzaI+la2T2EFjQ
         FqYN0Zw1DoZ9NWoGxJ6BPPkuMFI/b62xJxPXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706242; x=1796311042;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LRd2ScaOm5uuXBAm7fGNwOu6s86L+5sBL7Fa8S5kLwc=;
        b=aoThPyjKO5xhO2J/Bf2pQwWYY17hqPT2f8Pp21MgGiJaPIXIzRllq6GUtyVBhyRu6z
         Ivup9KuRCuOYGLZt1mmF+mwJnv588gAmcww6xosmJF7KzuVKbsgr6SrXpYAWslJd94JN
         N30hR5QT3E9QQGf6EX+ZjiHBO8iYl/EtjmBl+oSbMCsP2SZVlm4rt5tiu3tL8JrXSNea
         ogrqgkBNrHEpPcTiYJBvkqd8MPG89umoSgKzSW8eRcRoTeAU6wJyEoWO7zZPAytgRcb5
         dAcF6d45qWuTuBFhm3foe3Kfc317jm/8VJGJoc6RWvwv2PAX47K5X/EVywmMRfW/3NjM
         SIuQ==
X-Forwarded-Encrypted: i=1; AL+hErHMMqV7rQcCn/h8MMvxDnaLDoVLN7VK6bKQG8WVcV3W0Aa/odR4luX/NX0sadGQdtoz8wjDOQE5CIq6@lists.linux.dev
X-Gm-Message-State: APuU4Z8HuRHrEfCTU0/NG3fVz0X6h8wQWGBI8ncPGf5An+keNqeIqP3p
	eLz1HW6J+/mVy32rwV/p+AcXsak4U0JkKiygMrVDnnZqd+fXpcIPiAEWb2B34LTILdq5NeLevVN
	WGP/b4hl/DXorSERFWbxoFYRUvLd3pz7jG0ozICawwg==
X-Gm-Gg: AZFdTZe/5kdX996V8F6WprMFLsrMX7BaiK0VYi2zeD0TjKLyvEy+6gs8Kylgm230ouE
	x5y7F8FtTuFgoyRIX8WHEzK5R5ye8RE/AOVd95cNYM6PaSW/vgwyyx2QJ9z5ZXiYw0/U/PELAuT
	+BFsA7dTfrc7SFW7OGJj7oTig9HMkWpCYcsVi/A0KFW8ZRf+mQ0P34BUB+v+/o0pyF8LiZgEy8T
	t0QhBPC42YBTCQmozh3gWHgNYT9La3N8uQ3qYx4KwQB9lrz24r1lQFJpzDc/pv7i08N7K4+YCoW
	McZV5bU56XHXplVH3IUBUB+bGqTxuaWK8An8NEg34BasHmekXwMcWkDTzQIbKYhNuHLxAlDYyzG
	c+op88gQMdTwjGQlaAlhgs2HvulfXzDYvXx5YQUbJwnljWyisW2paDSIKI3wtVkQbkkWFVw==
X-Received: by 2002:a05:622a:1909:b0:55c:840:1307 with SMTP id
 d75a77b69052e-55d76a2609fmr379677031cf.20.1795706241726; Thu, 26 Nov 2026
 07:17:21 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261126142512.219535-1-mszeredi@redhat.com> <eff86b6e-1abe-42dc-bd0c-146dfeed3d50@bsbernd.com>
In-Reply-To: <eff86b6e-1abe-42dc-bd0c-146dfeed3d50@bsbernd.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 26 Nov 2026 16:17:09 +0100
X-Gm-Features: Aa3M54qvZ_U-pw-it5AdElBi3Vqk5wGMex8hgRdwYHun_ehSW1d_PTxxmcU_Xtw
Message-ID: <CAJfpegsJN--yqe+KK=VXxd_x-hkNfnTFRTjVFdtVDOWp2sh5GQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] fuse: fix fuse_create_open() error path
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	Jimmy Zuber <jamz@amazon.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Nov 2026 at 16:11, Bernd Schubert <bernd@bsbernd.com> wrote:
>
>
>
> On 11/26/26 15:25, Miklos Szeredi wrote:
> > Don't release fuse_file twice if finish_open() already set FMODE_OPENED.
> >
> > This is triggered by calling open(..., O_CREAT | O_DIRECT) on a inode
> > created with FUSE_ATTR_DAX.  Since a_ops->direct_IO is unset, this will
> > trip the late O_DIRECT check in do_dentry_open().
> >
> > Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://sashiko.dev/#/bug/linux-29703e58-1f2f-4d70-a476-06c6335ede10
> > Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> > ---
> >  fs/fuse/dir.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index a04d93d5fc44..af1d91c7a181 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -921,8 +921,16 @@ static int fuse_create_open(const struct mnt_idmap *idmap, struct inode *dir,
> >               err = finish_open(file, entry, fuse_finish_open);
> >       }
> >       if (err) {
> > -             fi = get_fuse_inode(inode);
> > -             fuse_sync_release(fi, ff, flags);
> > +             if (!(file->f_mode & FMODE_OPENED)) {
> > +                     /*
> > +                      * Only release ff here if the file was not opened.  If
> > +                      * finish_open() failed after having set FMODE_OPENED, then the
> > +                      * VFS owns the file and will call fuse_release(), which
> > +                      * releases ff.
> > +                      */
> > +                     fi = get_fuse_inode(inode);
> > +                     fuse_sync_release(fi, ff, flags);
> > +             }
> >       } else {
> >               if (fm->fc->atomic_o_trunc && trunc)
> >                       truncate_pagecache(inode, 0);
>
>
> Basically the same fix as submitted by Jimma, just with a more verbose comment
>
> https://lore.kernel.org/r/20261026180649.1265825-1-jamz@amazon.com

Yeah, sorry.  Mailbox crisis still not over...

Thanks for the review.

Miklos
