Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F7C3B6352
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 20:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617192; cv=pass; b=YP7XzMSaUp9a3yB1jsb+TWkXt/c06MESs9jXFcE2ChHPvcWeiVEjnuYbpxqaO8gzD4usUAkjDXYG38VI4fr3DwxLpheZwIJhtLfMd5CXFNP2AMYAVorGqkD7dCCE+qWgldtfJdIncF8F/z2Yb2149Nhy/6fXYUlXlza8cPx0pUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617192; c=relaxed/simple;
	bh=1ZYm13QgUoFPUQXQ4kS2+jYygS3x3D5t4qOkUCv7AKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XjseqbMkQsfmtZSISAME2uTBkNBpey77XNMn2a46QARyCkYI+eO+HXY8se7Ir2na8TD0cBE5METr9Y9raB2cY7GLNza45sJ1oEUa4NXPQxCOL3ICL7q7Tajce4CccbJKuzI4lC9y4qjOkT4aH50tFswbTDFEZ5F1Y2c/kcRSt3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwXz2MPn; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwXz2MPn"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43fe62837baso3100591f8f.3
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 13:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778617189; cv=none;
        d=google.com; s=arc-20240605;
        b=YvlngCtQMN/mNkGowJy/B+SfcgDls2F7mngLVJ/qWwcV7ZpVYm0En/CtK3cTa/RZZU
         pJJ5eRIDGKDNtPze28UObP2mfSYv8l/YwIsLS+nBIgKREWZsBRKYMDkORFqX0c1dWu7t
         tXgizkeVo/Af6AXizrdhz2LXamKsECXHHPjYULrY47/Tulu4RfuZKRg+ZqZO5jPhxtQR
         BfAez/ayxoUGMfWkFo7hnaAThTbR7nADlr6WNjhlx3YFQAhSVayLrv2Vb8lLTvFKbVW1
         G6jr9la//8dpJJb7iGqHWdkYIBKz6wldXdntXrTK5joSHm6La5fO6q8gLWSqKUnE5kIY
         pPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Da8Mvrwof7iCCmp8lbUMxECOvSGSCwZitv6kUIUXo9g=;
        fh=ih4Ndps4KlztHnrAwQ0zU6IF3b3Arha3dNnPEfx9enc=;
        b=dLxw88i8zXH6fRs17FdvYCzvkHbSru2hoYeTWwAZfljGUTc3L+R9Lx/7yIbF0qevlF
         znbwHKdA5Ho2XBmKUwy7N6kJ8luLQm2D3/8O6tf9Kt8W7PKz7G7f+cvtQXC50EQ+yL/3
         9T4JK3FxhWbC5LD+IXO/0ObmL+5vxennynnh9HTeETV/54EZrLbiZojP+y0qJCr34yyp
         k70AJGJuwmZ/oAvc/zsr/Wj4FjHg3cWdE7LjQRPSaxfpgYYnYSUMmJm8/tR4FPfp87HJ
         DQdceZx49IVAE8e7+eygHU5hjWoaneeR6HuW7g3gMQoNvkL33RsGMRVb47NIoj+ERb48
         Ml2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778617189; x=1779221989; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Da8Mvrwof7iCCmp8lbUMxECOvSGSCwZitv6kUIUXo9g=;
        b=mwXz2MPnbs7IocY6W9OTHN3hhaO8fQhkrIoMi2d4RlL2qyirgpo8piZBq6v5x/EJsE
         29ONYE+X5EKntzCck1kyUDcBQLTfgljacXNBEOSJy0sLq4clQGZg/dvn++HfxCTu4ewl
         uWo9j5tJW74PR5GiDqtBYspytrcLMpIQEDhhrsCyqEB/oRTbs8dyUvSQt/ErBAVfVL4W
         F4pWFrrCg0X+JdfzKaahPqfQRYLK0qRaE7fw43N4byVcx620pEJ/XgnvTI+WsqzfS7a+
         9Ur+Ph7qbHO2Zly67xM2NDa756jSjjKr9PQ+4SqqRjZDNAGQ3rcbLShm7lAGiVLia+DO
         sFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778617189; x=1779221989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Da8Mvrwof7iCCmp8lbUMxECOvSGSCwZitv6kUIUXo9g=;
        b=ltwle11L1yCRXcgkYvL3qDg7v+SE+s123Z6tyFv2bOLhbFZv1lbPcSy4HUOMwnb8v3
         mL/l8Pngzgn6ZsHh1GJzwQbOnHpYx7P6uHk33R9g+JO4fJbA6a11jYRkUDVvHHHCcaZY
         Zop355pG0wxZwZgugdGLTAU0A7IfJS97LMPz1e/1BH/r+mamI8HZwravj45LLT9XiZ72
         ONCLRLlS70uCfJ7ZLqj1J/iOxRF14IuRAblO7hLxrYk6lDFUAxYkHYrKADaqeFVdVk3X
         z1eG1G0wdFCxkoizCHn/lusHNiDAA3oHJXcc3qDLVFQrOiQGhB2bnecAEoDIZvLsz/2v
         7nag==
X-Forwarded-Encrypted: i=1; AFNElJ/oLC96C1ZhbweZSVc12POqUUDh8C0BGVGHU5hv9DKJQazgvVL4XvAtRduyeoCCQ0T+PCZ3/BXDv3wv@lists.linux.dev
X-Gm-Message-State: AOJu0YxBOHB5wU193i/YyJBtZHvXecsIqh9HbKMl5DHiSzsg07ea+6ew
	RaVUEYvuXZBmzzIyF5mHxXO1dzII4e1lNeXnjPQyLyBGclE2hyR9M6hcaI9UzFBHV5ZFZ7Wfv02
	hn2Aay6x+AWb/h3IxbNHYW/6dnJo6quE=
X-Gm-Gg: Acq92OHZ5WPVO0814tk+unZrAB6VTQqUZSoEhpZEVenh6Ppgs8NpVqssvY6Ck3I3S60
	b5UZhXewGgjiX8xatJmhRiwskt8nkSquYlhPWecVjfOcAnfySEthZMtgZxQ0t7jmTfnRRDS2vql
	rekMNxHIA/Rf1kzj9+pWkAVkRb8dWYlwWFQnS4BLgFQf6zZOAKbLw/YmyiAU70LjavcmALzN6rM
	5cccLE9Hi3aQqCY2T/6GG+3haoCnXihIVtsX/ebbFoRQBXNP8eSKWRA3UQ+cOMKyc0T0GXqggMe
	fF/QBw==
X-Received: by 2002:a05:6000:1845:b0:452:d03a:7abe with SMTP id
 ffacd0b85a97d-45c58a71008mr414085f8f.17.1778617189446; Tue, 12 May 2026
 13:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509102337.272593-1-liwang@kylinos.cn> <20260511101337.746510-1-liwang@kylinos.cn>
In-Reply-To: <20260511101337.746510-1-liwang@kylinos.cn>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 12 May 2026 13:19:37 -0700
X-Gm-Features: AVHnY4KTYlhO38g2ohBnPgIyYLi_mlUcjvNYEJ7VKclIdoTNKsd2T79sjkoKxU8
Message-ID: <CAJnrk1ZvPgibucnGx6CXnVgA6sWR=RcvFeX=mUqZpdvUkNyLgw@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: propagate async RELEASE queue errno in fuse_file_put()
To: Li Wang <liwang@kylinos.cn>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
	Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 3:14=E2=80=AFAM Li Wang <liwang@kylinos.cn> wrote:
>
> fuse_file_put() queues asynchronous FUSE_RELEASE via fuse_simple_backgrou=
nd().
> When queueing fails, the failure branch always passed -ENOTCONN into
> fuse_release_end(). fuse_simple_background() can however fail for multipl=
e
> reasons with different return values, such as -ENOMEM or -EINTR. Pass the
> actual negative errno into fuse_release_end(). A similar pattern occurs
> when fuse_send_readpages() calls fuse_readpages_end(). In that case,
> if sending the request fails, fuse_readpages_end() is invoked
> directly using the error value returned by the sending function as an arg=
ument.
> Furthermore, the same applies to fuse_async_req_send() calling
> fuse_aio_complete_req(). This patch aligns with those cases.
>
> The parameter "error" is currently unused in fuse_release_end().
> While removing it seems like the better choice, however, while fuse_file_=
put()
> calls fuse_release_end() directly if sending the async request fails, it =
also
> registers fuse_release_end() as the success callback. Consequently,
> fuse_release_end() must strictly adhere to the callback signature; removi=
ng
> any parameter would trigger a compilation error. Add an explicit
> (void)error in fuse_release_end() so builds that enable
> -Wunused-parameter (for example make W=3D3) stay clean.
>
> Signed-off-by: Li Wang <liwang@kylinos.cn>
> ---
> Changes since v1:
> - Amend commit message to clarify the reasoning behind the code changes.
>
>  fs/fuse/file.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 3bdab8d03373..8b7badb7721a 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -96,6 +96,8 @@ static void fuse_release_end(struct fuse_args *args, in=
t error)
>  {
>         struct fuse_release_args *ra =3D container_of(args, typeof(*ra), =
args);
>
> +       (void)error;
> +
>         iput(ra->inode);
>         kfree(ra);
>  }
> @@ -117,6 +119,8 @@ static void fuse_file_put(struct fuse_file *ff, bool =
sync)
>                         fuse_simple_request(ff->fm, args);
>                         fuse_release_end(args, 0);
>                 } else {
> +                       int err;
> +
>                         /*
>                          * DAX inodes may need to issue a number of synch=
ronous
>                          * request for clearing the mappings.
> @@ -124,9 +128,10 @@ static void fuse_file_put(struct fuse_file *ff, bool=
 sync)
>                         if (ra && ra->inode && FUSE_IS_DAX(ra->inode))
>                                 args->may_block =3D true;
>                         args->end =3D fuse_release_end;
> -                       if (fuse_simple_background(ff->fm, args,
> -                                                  GFP_KERNEL | __GFP_NOF=
AIL))
> -                               fuse_release_end(args, -ENOTCONN);
> +                       err =3D fuse_simple_background(ff->fm, args,
> +                                                    GFP_KERNEL | __GFP_N=
OFAIL);
> +                       if (err)
> +                               fuse_release_end(args, err);
>                 }

Hi Li,

I'm not sure I see how this change is needed since fuse_release_end()
does nothing with the error arg today. afaict the (void)error pattern
isn't typical in-kernel since W=3D3 isn't a standard build target. I
think it might be best to just keep the existing code as is to reduce
churn, and then if fuse_release_end() later in the future gets updated
to use the error arg, this would make more sense as part of that
change.

Thanks,
Joanne

>                 kfree(ff);
>         }
> --
> 2.34.1
>
