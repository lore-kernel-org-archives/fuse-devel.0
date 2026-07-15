Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02575443E38
	for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 18:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784140245; cv=pass; b=asmDMnXwEoh0QGCa/e2NvDoyd9TxuthkfTAg7Luht0YEQ2p3JUgg/Fz6FRHlXyfEKKw8xcbNU8F2aaCn9eAEfvOU9tRfMbRBjgRoVgujvkSWXF2Kvvo55uZjkf/Fyfvh2255XHYAcA+W/XEo1TbxOSu++FfLj3qA5KA4U/ZWo0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784140245; c=relaxed/simple;
	bh=LqZQ7GhvjznYU5Bodyh7xffu+f6vi+N9hg5ldo+B/i4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5m1KiQwWN80aAhtEYt0uEgYYMWrFbWtLW5EEM4oY1zzFQVf62T7cNJ8L9ByAVbZtJJuBHCnEin/oU0mW5hVZli2KaxYRsMCpa8zY7I6ZIRMo56/LShPK5TsLd9vSVNjREkJBfPBo/Cr39ao0xxxsNpzvbLBjomFX2dBgd757Iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sg9KEkrC; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sg9KEkrC"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493ec555a26so37578055e9.0
        for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 11:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784140233; cv=none;
        d=google.com; s=arc-20260327;
        b=VGU3ucD9O6xcB1FaS+hKUzpNpU7CZJ0USFbaydfJvezTYCB5mMMjQfeVcxhkpfhD3Q
         8IHEbxyLEfAnD1k5rk6s6FMM6pC3I3425sXb5uhBjyPYo4RBx+52rK3xgChEDXsIyafa
         oBhYEBErcjxlyDDCU5SmVVbNN5KTBxlwv+WfBje7cRyRDkYaz7A2QR9gItU3My01PBMb
         Zf8xzR/trukAldd+fqQNmXjH9a1QCzdItq6for6Kvdwg3wNJSu93PFkzqGUQpO7w1Dic
         IuE8zVe9VY7mrRqdtJtTIvgpyxW5FyBNQ7XVNQQhbBDM2G1qenPazLDXdIzso9VeMXFw
         afdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eflNygwkucfn8rSal3UDLFQ6W9vndZUg982/8SGMCAg=;
        fh=auyZY8evzvkRP7PGhI/4j8iQEVgU4pvaXPtX5vpJ7tc=;
        b=Yiw7Eei+DZpTAZQfhny5G7BJnSYA/+1cYxrteYrWesfIQbxJi6lCa0ndEtufg4kLxQ
         fnY0SwLtxdhpcWCIto8TwWERtXCtIdX2f/cFtmdJ1makRUmJaqz3FwF/G998wkFbDvwE
         KqCdBgOjqlJSVII6DCxIIF7LLbvUjpL8kUasXbcd6i1X6AX+hVKefGM0WQvxphfoWzvX
         e4ztDGOnzlZtN5lSsS3sQYlBmiKc/zMf42SVQpD0pdW8lVfrFsDuIjNOn/zqJQXVQfv6
         /DEv3VPxaE9xdAwoiaAI4UJzou8gGE6rQcmcFnowaOkLVjitKRkyPwbjz2R/Ln949dPT
         u3IA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784140233; x=1784745033; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eflNygwkucfn8rSal3UDLFQ6W9vndZUg982/8SGMCAg=;
        b=sg9KEkrCg84r77Z2pn3kR2rFswnhgDemUPghWOWvp+lKMW71iM2UNh1DvrNeFGEM4X
         /UrwSSqV9gcPScKYoG8bDoFkDRyQagtFSAV1YEk6DXYSaAxxl/qZikNmYL5BICF4QbtD
         +MECSHai9UqqfGn/1vTY1trQzibBgxjhjsCMf2unsl4dKCN7phqOgRMaDTJjLTPhxaUg
         oFly5zi3m8DJSC0SGuQwCdKVoQS6pjc0luYmpHv2ZB7/BZA96XQaAnOPaMjNAQGx9sEl
         mp6H4QKqo6BYBCI+oMxvZMRnFYBt1Xod03bBJr/oO8zrjhYxTSycBBYHZScr8+hwI752
         DSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784140233; x=1784745033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eflNygwkucfn8rSal3UDLFQ6W9vndZUg982/8SGMCAg=;
        b=FZOpYKoV1CDYo1K4NGpDZ29MNV+kBLlQQlYfnqJPDhndEVcX8nBOTna3b1kERDtA/c
         4pMxKAWzoRwLm7ZEWiF7yuFkC8z+Nvbcgvx6SfI8Rn1IpjAlvVCK579j0nDG4TV80V9t
         gBj9TpOiLv4/gTreHku7SRBA4thttDH88PSvLrfH8DI2Qip3gXpNUZplcngLbzwPAQKk
         OWsXxVCZNkjxdVxCLcUM1yUDeyr2LRLWjQ930K7+Q5suc1Z/mYoP1EmBI4ygBKbZARyH
         s0N9JJSXbfI4AolRBuITkIzJBssucZb692D9TEPtFS3I8PKxSUWSdpHyLgJ572EkjFga
         EDsA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3dr+1Q+rioXFev6MqMXbOzyNfxYTnL9NVjsPnPyIvUrb/DGIIXgG6O8iBR916WgS9SLQdW5kPhXd9@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+H3brFVC6Pvd8oV5DMNOCtw8ytSUWlQRRAkeCLS36yXGNsx/y
	9i0fCqhNm4SDR3qoO1RAYsOGdFonM80KD3bd+tWVqrZ1aZiffWjhm3AGXOzGvfpx/gBW9QkfLeu
	WgX14QSTSqExbEwZKCLtgX0EcGRB5GNxjiLFa
X-Gm-Gg: AfdE7ck3LSXfBQ6qPbJ5tdxjQzNeVT62RUUZ6I6DzOsL9PSWP9qSX+bUU34Mjxu7BUh
	vtMYH+gSzNi4t46LuKudXgMDkUYejuoraGwgCi1QXUgjeRsI8Xg/Yt04nQXMiGsgkxnugSx201c
	4XmqR2UnY1PX7q64vUQZHHeDWaxczNeWnZ2VJWN6x3+OMLQdQWzIqdckJimg/+xtLNW81rGVIIc
	D8yto+o318aQ7Rx+LSxCbIPc4CwSrRMDKd7dgnqk/PW7CTlC7AKX60s9P7fAaRnruPnM/2DKYpi
	G8s6v16UXnst3rP3DNzM8mz3DX3GhG8ZUo5MdxIv8uUr+Udi2DXw
X-Received: by 2002:a05:600c:58d6:b0:493:f262:b8 with SMTP id
 5b1f17b1804b1-4953c147474mr38215745e9.1.1784140233078; Wed, 15 Jul 2026
 11:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714235408.1666063-1-xmei5@asu.edu> <20260714235408.1666063-3-xmei5@asu.edu>
In-Reply-To: <20260714235408.1666063-3-xmei5@asu.edu>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 15 Jul 2026 11:30:20 -0700
X-Gm-Features: AUfX_myhxLCfqR4n7aGibfgh8m6ozVVwNoTPdhZMyVsgCsfFwX4PP36R6t_ZV1Q
Message-ID: <CAJnrk1YRmyaPeeBgd2HQSfmwDYm08cev__Y8LgyPyTqaTZE1vw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] fuse: deduplicate the oversized-request error selection
To: Xiang Mei <xmei5@asu.edu>
Cc: Bernd Schubert <bernd@bsbernd.com>, Baokun Li <libaokun@linux.alibaba.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 4:54=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
>
> fuse_dev_do_read() and fuse_uring_args_to_ring() both pick the error for
> a request that does not fit the server's buffer, and both special-case
> FUSE_SETXATTR.  Move that choice into a helper so the two transports
> cannot drift apart.
>
> No functional change.
>
> Signed-off-by: Xiang Mei <xmei5@asu.edu>
> ---
> v4: introduce fuse_req_too_large_error as a helper
>
>  fs/fuse/dev.c        | 5 +----
>  fs/fuse/dev_uring.c  | 2 +-
>  fs/fuse/fuse_dev_i.h | 7 +++++++
>  3 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index b8e43e374b35..56c38aca7389 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1584,10 +1584,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *f=
ud, struct file *file,
>
>         /* If request is too large, reply with an error and restart the r=
ead */
>         if (nbytes < reqsize) {
> -               req->out.h.error =3D -EIO;
> -               /* SETXATTR is special, since it may contain too large da=
ta */
> -               if (args->opcode =3D=3D FUSE_SETXATTR)
> -                       req->out.h.error =3D -E2BIG;
> +               req->out.h.error =3D fuse_req_too_large_error(args);
>                 fuse_request_end(req);
>                 goto restart;
>         }
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index 4529505b2bca..cebd8f871627 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -729,7 +729,7 @@ static int fuse_uring_args_to_ring(struct fuse_ring *=
ring, struct fuse_req *req,
>         }
>
>         if (fuse_len_args(num_args, (struct fuse_arg *)in_args) > ent->pa=
yload_sz)
> -               return args->opcode =3D=3D FUSE_SETXATTR ? -E2BIG : -EIO;
> +               return fuse_req_too_large_error(args);
>
>         /* copy the payload */
>         err =3D fuse_copy_args(&cs, num_args, args->in_pages,
> diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
> index b511aaab6bfc..4958158c0f02 100644
> --- a/fs/fuse/fuse_dev_i.h
> +++ b/fs/fuse/fuse_dev_i.h
> @@ -13,6 +13,8 @@
>  #include <linux/workqueue.h>
>  #include <linux/fs.h>
>
> +#include "args.h"
> +
>  /* Ordinary requests have even IDs, while interrupts IDs are odd */
>  #define FUSE_INT_REQ_BIT (1ULL << 0)
>  #define FUSE_REQ_ID_STEP (1ULL << 1)
> @@ -367,6 +369,11 @@ static inline struct fuse_dev *__fuse_get_dev(struct=
 file *file)
>         return fud;
>  }
>
> +static inline int fuse_req_too_large_error(struct fuse_args *args)
> +{
> +       return args->opcode =3D=3D FUSE_SETXATTR ? -E2BIG : -EIO;
> +}

Could you add a comment to the top of this function? Maybe something
like "A request whose payload size exceeds the transport buffer size
is rejected with -EIO. The exception is FUSE_SETXATTR whose value may
legitimately be oversized and is rejected with -E2BIG, matching the
vfs setxattr path".

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

Thanks,
Joanne
