Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264C131F995
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 17:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776879735; cv=pass; b=p8I6Fj/+7uEh3BxiXWE4xmdouQwqhgNnrzHc2vxjtbLTAW40UxkwoWkf23s37XJ7OO+ofI5k7sYgrWUWg3qsK1Kw0YFGi5CDRuJjtJdwcPj8junGSqH4rIO79zUYjaHYA82fSdZFs+NEdgvEdtePK21GsfOd41Rtt7icKdOyxRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776879735; c=relaxed/simple;
	bh=E/5OVf6CYd7C0diddK4eaTcPn/2dxJJ8s0tev7xwPN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AvpTz0BQnqp6zz3Vt7f+T4s5U1rKQbUpQAdFOAdmiiYTpRz6IywOeraKYXdKsFczoBuzh1KlYjrDG3M0lXVRlAwEIjoY6THPeNGKzvATpbL+zhgXf13pARyGZwebAaoyzwGgmusI/pFx4B7uz1ZsgWisb1scPdkN9td3ky6Cth4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSLgFcBx; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSLgFcBx"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43fe62837baso3496508f8f.3
        for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 10:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776879731; cv=none;
        d=google.com; s=arc-20240605;
        b=XhZrXD5xzjfa3OemBmtHvloW9ENaY69YEd/OEDbNyJ6MTHdd0mZED89uGRvbzzpP6a
         PrGOYJ4Pc3PKI/yRaiG9RTDnMN4R/oNpcaibQKA+Kg5Y3R6WVVsw/QkChoVgmplmI/ga
         oPPTFlRNY8sb2lMdCME0fzva1e+4wx1nxfQc71eAaVC0/s2NJNf7AUZwd63M4hl933Mv
         qknVA5lzUCi8o3zb0ipqTB0GflvefdMKOaHipoQzc49lZrbnWpwKeb5etxCgsHaaUG36
         WX1kAo8lMUtBXqzrmZILj2T0cxU1vBAe0ZdtOHKi7eR9JUOpAvDf/Oak225P9mzjvJjm
         HMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YnAElFZSvFS0lpWJk+Qp0bYs8sReeczhgp1hEEKcl2A=;
        fh=oSLQBSy3sy+srs416Fb9Ll8GcR+naHymI7Ry1FvZYFA=;
        b=NwxgDLFz2adHBTWeteA0dUwnngIUytJiCr+oFqdzDMHsczpCd9+pxLfeCmK7Z9ePlo
         e8q52H3n5eVlW8mSrFrBySQ3PxGwKxfPAUPdq5yunzWD5tLF18M5oNOXh403peTH6brL
         Iu2EIbgzNiGa5SNiK+O5ghqr5nWVhD/+FYsI5E660BIzQvjfkH8FYPhQLghmIWyhLRdZ
         DW6DmYZMQWUyRz0hv5xWQI8KGSCEiyrV04WE7Q5icPPjfbuyu0TpHavRVAXSo/I/ZHS0
         DssgjIHBzMhU8CdFi5ofb5Pdpo5awm/0AMIPihaPX+KIpV8/yGK+arcc8WRw/Ip+74gm
         vQEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776879731; x=1777484531; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnAElFZSvFS0lpWJk+Qp0bYs8sReeczhgp1hEEKcl2A=;
        b=HSLgFcBxWu+U5mhCphvuzVn+dn+lIw0ZNfFFh9LKqhVkcFtSvMPwS/vkkotH9hsHOo
         zPZuB770Hk8hKQqJ4dNkhVNDgd6VlgPhLdjy4XdrAHGY1zWItlist0s8qPIIAk2qc1aD
         4juPKW8HDBv4186H+XkKuZ0IS//8y2SYEFLIQnXYJ1hSm7nj5PhWY1tRe5THZrxwoeUP
         aMv024o8IisTDutKL6EvyqZ4cWZ+ekm8ZweHMTzUkpap8Emt29r7TbVQtUzzoNwtmA3g
         VpzhL3gG2vwhoOPhwOCmqgbQj0WpQs/Qj6Zvu7LATzaXxUvOVUlzww3hFZsntDyDcWKO
         veAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776879731; x=1777484531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YnAElFZSvFS0lpWJk+Qp0bYs8sReeczhgp1hEEKcl2A=;
        b=RZ5UfxlX74yn20VkqIP0BlVBni3l/5MVM1UT6oYKQLEG3IRBHZHBsFe+rDiJ55kMud
         ti3kaKD4nwrICaIBwoHSVqQ8F7cz98axCkAciH8H6Q5CygX+T8RPJ/rmu3gc/SDTeyqy
         96fRumKisUtZxFF78SGN4a/C54pRfneSyMP/p9bc4h6q+uhYnQiJZkcvY4hQhKqFE/IJ
         BnCSlk2jQTk5GOCZiKmZKjYXw9pEy+m4Tn0ScjDVqAH6+iCE+2GfTQdDJndRN87kkojh
         OZDkwiIzSHhbVLzQs8/fIeHNU3tWGZ1/Bg3eC/9nRsdqzOU9CxxYe+6X4HYRdGxpzpL8
         T3sQ==
X-Gm-Message-State: AOJu0YxkwWKDzfE1yNfpTs9Ro3/H0dECMiqgyuk1BkyFdqMpg7Lr7CgD
	KVmMeTlmlxvKRZQO1AkmSq+JV73W9ASJXz5PaI1AEYfZJTjTQBi0VjfnR5kw+bwrIftxU6dloFd
	d5T5pXvJt9bX99s1kGdwzLUOL/hHW8ic=
X-Gm-Gg: AeBDievkE+1kJFS3R2b6kkl3vkuiZ4lTVMk5qSKQGN3xNpTibqRn1xS3RxQ9Y05X+mX
	/aJcdqrwl7dWC4j2St/BNdfJFX1XGuV+42bJHCzh8YA6Axflha4riHwHDuFZtpXeo3tOsZjpIr8
	BLiLbcsqvKi2U6LWK/FiZqrEICgp+g4vgUeHEHgea5qNfagzsQX/E++f80siJeMJwUNGX0nAEsp
	izlPbNpqoGKKXGv7DD2Ga1hnpGwYjCe2sPMDNeb5htGDSWbtJXdzw8rAo3tNLKtELyPLyaY1FY9
	TpcUGjpGtTJn/YOC
X-Received: by 2002:a05:6000:1788:b0:43d:75ec:26e7 with SMTP id
 ffacd0b85a97d-43fe3dfd2dcmr35633344f8f.33.1776879731456; Wed, 22 Apr 2026
 10:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416091658.462783-1-mszeredi@redhat.com> <20260416091658.462783-28-mszeredi@redhat.com>
In-Reply-To: <20260416091658.462783-28-mszeredi@redhat.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 22 Apr 2026 10:41:59 -0700
X-Gm-Features: AQROBzCmfe7FnTa_i3v-12VkmGupx1sZeI43tD3bTH5E5hGElw0S9Q0-Gm7fOe4
Message-ID: <CAJnrk1YGJY3EwQi3DoRwYxpGA3y7EUh8KczV0XsDA8KcU7S4tg@mail.gmail.com>
Subject: Re: [PATCH 27/32] fuse: set params in fuse_chan_set_initialized()
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 2:20=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> Set minor, max_write and max_pages in the fuse_chan.  These match the sam=
e
> fields in fuse_conn but are needed in both layers.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/dev.c        | 30 ++++++++++++++++++------------
>  fs/fuse/dev.h        |  8 +++++++-
>  fs/fuse/dev_uring.c  |  4 ++--
>  fs/fuse/fuse_dev_i.h |  9 +++++++++
>  fs/fuse/inode.c      | 10 ++++++++--
>  5 files changed, 44 insertions(+), 17 deletions(-)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index fe415454de0f..c59cbfd3ffee 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -71,11 +71,17 @@ static void __fuse_put_request(struct fuse_req *req)
>         refcount_dec(&req->count);
>  }
>
> -void fuse_chan_set_initialized(struct fuse_chan *fch)
> +void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_p=
aram *param)
>  {
>         /* Make sure stores before this are seen on another CPU */
>         smp_wmb();
>         fch->initialized =3D 1;
> +       if (param) {
> +               fch->minor =3D param->minor;
> +               fch->max_write =3D param->max_write;
> +               fch->max_pages =3D param->max_pages;
> +       }

I don't think this actually matters in practice, but should this be
moved to before the fch->initialized =3D 1, ideally before the smp_wmb()
write barrier?

Thanks,
Joanne

> +
>         wake_up_all(&fch->blocked_waitq);
>  }
>
