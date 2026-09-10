Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ECA560AAC
	for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060961; cv=pass; b=gmYu+8/0Xlnt5DVFtgXd7N724yIfqRECB2w3D+3xrvI+/5Pg/JgLaWcU1jTtpOmh2npZL8yHf+TeiB52t3yVYYIFVXrcYh7dLvHSX15grJPMIeUOKIs7OARpX+ajyiYK/n3np2zG1t3Z3OssavtSMKuzl126uAR+TVzYLASjmug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060961; c=relaxed/simple;
	bh=IFR4nKdEOKKYPNJProJ/LoqY8uLWMn1OZMkBxks7z6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aB/YhO4LpFoLLk7SmUy1SAvGt4O9z3nRK+jB+xCHjbSHFjYM/AzW8OWzryj/ZrrwYz4n8yEv+no38Qy4O3VF+8Ra2XQVA/bzQapM5LLYyZmwvreK1nknlr7U5hI1KRWsAFQYu58/RsTAEzJMsxy32nUywtaG03jaM1tJKDdupUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DznQaNDU; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DznQaNDU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b94fce6e8so707155e9.2
        for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 10:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789060948; cv=none;
        d=google.com; s=arc-20260327;
        b=S3DJ/35sxFmc9Dfizk+sNpnGVZOwfc6LYaPqJ7iaHLrCkorW2PzANlDTsEjKRknUog
         2gR9DXoawAN8sA3DIbmcIIjQtJI1+2I6IzwXHt+a6FVNrVMpILZzmcEBykIqWCkoxuPu
         66VKGOEqbw5K1r9nTO7H2APFA9vt8iaR0g9zQ2uNq9AyzAZMSH0aqajMNKKYxvgD0O5A
         WKGQC8m+5Zqk+9vZp+jjPLJGpqIpI9IoGZUdjaXGYgsFqAUmj3rhODyL3iF7xXq7RjGb
         ab5RrRaQFa5ypBSFrzy/cdvcAd9UbmkRzGsyNGCsBrlQXNtgJmMERKKa0DYI1ZwjX7Xj
         mETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h4I3/z0Z834sx5ZQDBMDFhlcKX3jNWqo3Yat82eHYo8=;
        fh=wy4ILtCDiC2vkvgsxb7gNJF3tRBCKkBlWTII3k4Wt4Y=;
        b=mfj2JZYt9etnf94BP6GdqChNYYlkE4WN38KqnFI6DtUi3zq3jGLd2yA6rw8sH9dIqF
         b1sNyUUr+a6a76YU82hKjh/+87T7D/EQsM4EVQW8/Mxk6OvCZjwbScmwBcSmhjHBO/Kz
         foNArSO903lMs4L+PMcikPkeTkfwap3KXBPLHQJpbhTM9kABp+4tijGILkMyDKFs8VCJ
         d6ahbazlkIuB+p4RXSokXddrlFpQHHwyigykzppYLUlEm/LE/UNGKjqj6mRqhLtB33Tj
         MbrVtMzYNwvqPx4xoFoLJ3zErqOdLhEIn+Al2hgHKFsgzesqLdOzSiLoaADVe4Ycw8tv
         wzVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789060948; x=1789665748; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h4I3/z0Z834sx5ZQDBMDFhlcKX3jNWqo3Yat82eHYo8=;
        b=DznQaNDUyDLeT1mGwk+eXXKZCCC/iEfU9bLVBi41mZ6FMqsDF/XzUb4wuZhgKMWVy4
         9F0PXkNTIXE1hzMzL88eToouxCpBZSoXFlqBf7KAo6EGbwUJ8Qg4QLPMJS1b7PAd/K33
         9Ty//vbk+FyiUYJiZPbtaHOB23iLnq01KQJLjzyWRo2Hp/vsTnVYQhyfHKYF7sVnKQZM
         u7v1slr9ghSvWyszf58ueTfao2Zj5EoK7Z0lBPhmlnqXEDmtWZsvOrA9aZp8HUr9s7CS
         VB7xK6tGAfsXKFwiC1bU7OccMICXGYFTWElL3cOegp52DkmWoqpvPTf7mI1PPiQ7Aqv7
         mWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060948; x=1789665748;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4I3/z0Z834sx5ZQDBMDFhlcKX3jNWqo3Yat82eHYo8=;
        b=ohj9QGhpzBwODSkq7DmWElJfRjd61ytbUPm9LEaJRdGq8tjXgvzGLzxJqVPHBqCWXD
         xKNTxl5gjgiTWU13Rz0LXVt2WKY73bz4K8bnLfk5qJKnG6xR7/AEEH6/tcnVaubBix90
         UFHlk4HWfto/P1Jo7hmoIvUR1WMAVxC0hes8+9JdUQErV97jkQPj/l66K+soyuUtSTEo
         rHR33iRPgGMphlvjrdXXB+dRUyTK8NXn8jtR3IKemIULNlb08fPFlU0b9biOLQHhRkT9
         2cRPc1UB1EfawRNUbWNfWpKBysUwGMxvQT2nZ8OnKeEvElQputqqujJ5vQVR32is5xeJ
         ETkQ==
X-Forwarded-Encrypted: i=1; AKwUvBykreIWPiYQWn/Kn3c4Zuj5jMk0sWT5C/EvIrFx4z0FwmbgjhvphQ0PlXL+ub7ppA+HT6hIZsEuM+Ze@lists.linux.dev
X-Gm-Message-State: AFuF++kD4Kmav20UErDvFGXqlmRf6meS9iY6ciq6SFaLQ1OprxUoT90B
	PgrquqmvyLdhUAVBVIYQ8EiBR82/opwLSoRAFfme+ZCIq4EFNbZ4WwvrQUoAgBe3r6EiBnib4oZ
	TUE3PpkrFapzaahysCPn/TFQ5w62BL4c=
X-Gm-Gg: AYBFou3IF1N9hiz/QdyPx1V3Tj3GUxeb3KvsyB424WduRkA07x5cZ7oLN9WrPzKuMPi
	yh8o9OTqYMFXPYcHJtCyyvHVPjplNs03WU2ZCavLhv9ME7Yk6xzkAyFp8B4kVFyqCccUifCeEPX
	0as1mNLGHze4xa4St8KnybXGE4bqeC/Me/Dfi6P/7ifT8CdWA5oXJL3ZTQe9X48liiuDb/MLni6
	HDbqLmreyK9nOsoIuE5n0PjVV9uEcSy4DtHenjbpfHuFCp23RMBr61h7q94+1y0bFkY1Ybnqrhe
	FC60sPBDL99HmC9KWZTKAC0QWOMJaBRYLfEVAZyryeqrDDoPKZTbybJPyInFWtBWu/tXNhDVB08
	vFLt/97FP+5yRJelhfX3LjFLNXe/axiwNNTNbMg==
X-Received: by 2002:a05:600d:8646:20b0:49d:1fd8:b874 with SMTP id
 5b1f17b1804b1-49e619c079cmr485295e9.19.1789060947517; Thu, 10 Sep 2026
 10:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910022442.3594649-1-xmei5@asu.edu>
In-Reply-To: <20260910022442.3594649-1-xmei5@asu.edu>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 10 Sep 2026 10:22:14 -0700
X-Gm-Features: AcwNN1ViYMaLgvTSlyD77nmlLTiqiJ9NADONiy9rDk9d6ocZ1sATbKbnTXWESp0
Message-ID: <CAJnrk1bVwezZwMFmOE-4T6KTa5SzQFapkATS2LVeo7+bMcjdbg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] fuse: don't BUG when the copy buffer is exhausted
To: Xiang Mei <xmei5@asu.edu>
Cc: Bernd Schubert <bernd@bsbernd.com>, Baokun Li <libaokun@linux.alibaba.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 7:25=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
>
> fuse_copy_fill() hits BUG_ON(!err) once the iterator backing the copy
> runs out of pages.  Over io-uring the amount copied is not bounded by the
> payload buffer the server registered, so an unprivileged user can drain
> the iterator and panic the host - mount a FUSE filesystem with small
> payload buffers, then setxattr() a larger value:
>
>   kernel BUG at fs/fuse/dev.c:1064!
>   Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
>   CPU: 1 UID: 0 PID: 148 Comm: exploit Not tainted 7.3.0-rc1 #2
>   RIP: 0010:fuse_copy_fill (fs/fuse/dev.c:1033)
>   Call Trace:
>    <TASK>
>    fuse_copy_args (fs/fuse/dev.c:1354 fs/fuse/dev.c:1380)
>    fuse_uring_args_to_ring (fs/fuse/dev_uring.c:891)
>    fuse_uring_prepare_send (fs/fuse/dev_uring.c:940 fs/fuse/dev_uring.c:1=
057)
>    fuse_uring_send_in_task (fs/fuse/dev_uring.c:1745)
>    tctx_task_work_run (io_uring/tw.c:96)
>    tctx_task_work (io_uring/tw.c:133)
>    task_work_run (kernel/task_work.c:233)
>    io_run_task_work (io_uring/tw.h:84)
>    io_cqring_wait (io_uring/wait.c:278)
>    __do_sys_io_uring_enter (io_uring/io_uring.c:2676)
>    do_syscall_64 (arch/x86/entry/syscall_64.c:61)
>    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
>    </TASK>
>
> The reply path can drain it the same way, via the server-supplied
> payload_sz in fuse_uring_copy_from_ring().
>
> An exhausted iterator is recoverable, so return -EIO.  All three

super nit: imo, the reason for returning -EIO is unrelated to an
iterator being recoverable.

> fuse_copy_fill() callers already propagate the error.
>
> Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> Cc: stable@vger.kernel.org
> Reported-by: Weiming Shi <bestswngs@gmail.com>
> Suggested-by: Joanne Koong <joannelkoong@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Xiang Mei <xmei5@asu.edu>

Thanks for your patience with iterating on this fix!

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

Thanks,
Joanne

> ---
>  fs/fuse/dev.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 4fec31fc0b84..4148e4488d77 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1061,7 +1061,8 @@ static int fuse_copy_fill(struct fuse_copy_state *c=
s)
>                 err =3D iov_iter_get_pages2(cs->iter, &page, PAGE_SIZE, 1=
, &off);
>                 if (err < 0)
>                         return err;
> -               BUG_ON(!err);
> +               if (!err)
> +                       return -EIO;
>                 cs->len =3D err;
>                 cs->offset =3D off;
>                 cs->pg =3D page;
> --
> 2.43.0
>
