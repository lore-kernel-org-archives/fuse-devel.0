Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F8F3B6359
	for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 18:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139206; cv=pass; b=ETEehySo+WhjGibgDCUmy5xjkcjWjwo9vQb37fwPEW8ci0EIe5ymvytpC92G2mw7yTYJ7/f8oZt4gmbsmnAGRUa3HXF0oDd8OW89r6KO8Et0PE9N93GON4USJghf5X8Eo49+ya4a6vwaKF5Hzu1ByZyXGkfwLs5/awavv0GIXfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139206; c=relaxed/simple;
	bh=TlTrHrgV9T9HsF1/ikFD5MM6TsMNEWuH7t9v3bzGGpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TFvIn0BT/k4HHEzBlfLhpoDkSKzYLsAKU/KRwE4jxys1xhfDmv3Aq7eKdNB420ToTgKezqSkCpY8bULay3GN2LZfLKYBWoDpZHlkECtFyRF17u8sA5feCFaj/VyaP3gevq718uHjf4QPUBdjUyah++x2GXYjTMyBHiK50WVUar4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKt08RGI; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKt08RGI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c7902f47so47847985e9.1
        for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 11:13:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784139197; cv=none;
        d=google.com; s=arc-20260327;
        b=AdQddq0aQhIbGdxeR0oYY6hCU52Vn9mG9SIX7ktmamgR1FXVkQa1Req2PjI/fKZESs
         ZNAGV5RJiF0CNx9Cqi+axj23rCadVa/eJulg/lw28Xf4KumUUwbPasV56c9rbXHbuRHj
         tcJAHNO05Q+S4USiCDJwmyuvs4767aoR/yJLwZiUFHVXedDxUkopFzqjmmDP5QR9+ghT
         75ICxRTLWRYcxIFYyE4IbFdH1rk1ivfQVUcMOSILaikU9PZW/7qUtYWl7IrYWBIKAYgR
         LqJLJQyOgnfLEvhhjVGnbHyiCG0p/tEJSUBm2KPt/LFzPQgYdOqMDZofQJLXJIx7d8OM
         ejOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Y5Uh47jmS2lL6sNnuOrdeSccdkAkRk2F1888yDlqwc=;
        fh=jkjxU88K5tf/Q/k4Duz+q4lSYuWYKabAYeb/TrhO150=;
        b=d3Ck51NCK6jwdvYnQbjQAqsdILDxVLZWX6lXoU6A8SnuWtOGeAYvb5J0RJ2RUVukK0
         w0dYK5gkwFpYLA1FjT6Rl2GjbjmfpDjQejZn5jD4aKLX0/BqffdSxTfPKx4G3KzJerEm
         LuxHtlyqXuvzc/zRl8wZnGqrRL8glvkOH9UU42M2dcw8BnobNCxoyqEnlN5nLYT5FeQa
         M9rVNEgfGQhKiiibkmQ3+nrsqg8V9e48S6QM+fjBPV0/+Sy7jTad8wMZ+cUK6zY/oaam
         C1EpQXe0Rs6/skBSUTV10aDW0kEH/jfaJfklMjr6Ke7xT8w15JgyB7H+ovdSd38n6fAA
         oUzQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784139197; x=1784743997; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Y5Uh47jmS2lL6sNnuOrdeSccdkAkRk2F1888yDlqwc=;
        b=NKt08RGIsC98lkPweXk03M3qQwZOp7Jv+ysr8I4kZXHHBcp47U99qSn4KcT0E03N1z
         FfZ5UPTyGuo3rXRNKqlxK1kQOoTITChdTmkpHKrZXx1lpNOzgXaRL8ry7Pp5hgLZQXQ8
         FyLOGJhWW9LBES0Xv7I9jBYuZ/DJrTxkoTvu5Qc5/5YeVtoWddKbRydpDXQOfsxy654x
         eaZ83bA4xsJu5LpH1MyFi9LgvGFbPBuQIS3T2RtmrGG4B9N2PCRDjZm3lftWrcJuQVcl
         IyJNoZ0TuH93zJwkA8Yh6cMycY6iYHQfWfvYNtRCVG3zgu6HhqS2AqpT4b/MTDIz88zR
         vGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139197; x=1784743997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Y5Uh47jmS2lL6sNnuOrdeSccdkAkRk2F1888yDlqwc=;
        b=YOywSH+9s7zKcF/vxIxFCShGtD8AkwFp/8XB7P8v4G+8qXaxt2IfusPJW6WiV3/lf3
         R+W6IArWNU1o7G+zJSjZw7Syp0/8JtpM1jCX04PizCxeL7pQNbB0S+Y/0ki3ddA6FAQv
         mveIVChTjRjFqj7JXqBd/D9I2R23497pHube5pXG1wcs4wI423bgS7zErR7T9Y2pdObH
         iqu243T8FSKxzts0r68YbMOaLbTUeHwQvNQNAHOHDyBgM1Jj8PWy+4onS7WMLrVPUgmy
         PEVFcq2AVRn0HWOlb40tPq1HlH99+8kxEvEOGoUMG/MxXr7wcACVqi3DFYaEskOgJopc
         +5wg==
X-Forwarded-Encrypted: i=1; AHgh+RrjVIDfQY5JRffgIbzHqyEkROfJ0pPb1rh7wPYQhzxCmMtDfP4qpIbwi+w0LaSPQJhsbFwH88ijgN0T@lists.linux.dev
X-Gm-Message-State: AOJu0YzclWXx06MWlz8vV1mTuNGv6itC3vnzSvvR5oIIUJY5n4ofaCvb
	p6MBxBgY/Ujp9prOCXXp6OfUhqwu96rTiJ5J+2Zdk2BMgprWDIfRRtDvPdl1SprASaGn2t4qa5t
	pRBq+6wGS8/BeXHvB5s34Wszlj2OlqJM=
X-Gm-Gg: AfdE7cmbvsBfHFxVEX8OocFhuaV2um9YLU0ys1sO9N+HqTpn0asJyobcBQV7/FhpcjS
	Lkcrxwb/OuwQumzFzbjgtOMZfKErWJb8fVMPwVk5xLfOdVmrpBhHTpmjtZqpNbsX29vvuuiTXQ4
	hUyPUxWex0Nkbd0ClMIT/if+rgeAkiXJG/ufeKVTFfzD/wGquBZcm9AxeE+w+XQHEJC7qzZi33p
	+IMwHq0LVH0dSj4bfN+aUaqNAZsPBJL4p5NqkbvYty9WcwHshc0l+k01B6y4EaFaENWTSoIfX+O
	UG+MYnLb1cB0sgLBUt+UEkZFKtaGrEIxfBOWv+BMNSy5gO+D6Zf0
X-Received: by 2002:a05:600c:42c8:b0:490:d354:bcf4 with SMTP id
 5b1f17b1804b1-4953c28b5edmr28410535e9.27.1784139197027; Wed, 15 Jul 2026
 11:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714235408.1666063-1-xmei5@asu.edu>
In-Reply-To: <20260714235408.1666063-1-xmei5@asu.edu>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 15 Jul 2026 11:13:03 -0700
X-Gm-Features: AUfX_mw-teJ0Q6ljAmZl4MTwHTDoeMlbTti5lf97n8LexyPhS1kxB0kDNkM69po
Message-ID: <CAJnrk1b4VAsyEMx7obFTBgP8M3dBcD1+QnKVQK-r881MBySDOg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] fuse: whitelist the request headers for usercopy
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
> The fuse-io-uring transport copies req->in.h out to the ring in
> fuse_uring_copy_to_ring() and req->out.h back in fuse_uring_commit().
> Both headers live inside the fuse_request slab object, whose cache
> (fuse_req_cachep) is created without a usercopy whitelist, so copying
> them directly to/from userspace trips CONFIG_HARDENED_USERCOPY and
> panics:
>
>   usercopy: Kernel memory exposure attempt detected from SLUB object
>   'fuse_request' (offset 56, size 40)!
>   kernel BUG at mm/usercopy.c:102!
>   Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
>   RIP: 0010:usercopy_abort (mm/usercopy.c:90)
>   Call Trace:
>    __check_heap_object (mm/slub.c:8268)
>    __check_object_size (mm/usercopy.c:197 mm/usercopy.c:258 mm/usercopy.c=
:223)
>    copy_header_to_ring (fs/fuse/dev_uring.c:618)
>    fuse_uring_prepare_send (fs/fuse/dev_uring.c:776 fs/fuse/dev_uring.c:7=
85)
>    fuse_uring_send_in_task (fs/fuse/dev_uring.c:1306)
>    tctx_task_work_run (io_uring/tw.c:96)
>    task_work_run (kernel/task_work.c:233)
>    io_run_task_work (io_uring/tw.h:84)
>    io_cqring_wait (io_uring/wait.c:278)
>    __do_sys_io_uring_enter (io_uring/io_uring.c:2685)
>    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
>
> in.h and out.h are adjacent in struct fuse_req, so a single usercopy
> region starting at in.h covers both and nothing else.  Create the cache
> with that region whitelisted.
>
> Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> Cc: stable@vger.kernel.org
> Reported-by: Weiming Shi <bestswngs@gmail.com>
> Suggested-by: Baokun Li <libaokun@linux.alibaba.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Xiang Mei <xmei5@asu.edu>
> ---
> v3: no context change; add Bernd's Reviewed-by
> v4: drop previous tags; use kmem_cache_args to reserve usercopy area
>
>  fs/fuse/dev.c        | 9 +++++++--
>  fs/fuse/fuse_dev_i.h | 5 +++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 5763a7cd3b37..b8e43e374b35 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -2404,10 +2404,15 @@ static struct miscdevice fuse_miscdevice =3D {
>
>  int __init fuse_dev_init(void)
>  {
> +       struct kmem_cache_args args =3D {
> +               .useroffset =3D offsetof(struct fuse_req, in.h),
> +               .usersize =3D sizeof_field(struct fuse_req, in.h) +
> +                           sizeof_field(struct fuse_req, out.h),
> +       };
>         int err =3D -ENOMEM;
> +
>         fuse_req_cachep =3D kmem_cache_create("fuse_request",
> -                                           sizeof(struct fuse_req),
> -                                           0, 0, NULL);
> +                                           sizeof(struct fuse_req), &arg=
s, 0);
>         if (!fuse_req_cachep)
>                 goto out;
>
> diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
> index 668c8391d61c..b511aaab6bfc 100644
> --- a/fs/fuse/fuse_dev_i.h
> +++ b/fs/fuse/fuse_dev_i.h
> @@ -81,6 +81,11 @@ struct fuse_req {
>         /** @flags: Request flags, updated with test/set/clear_bit() */
>         unsigned long flags;
>
> +       /*
> +        * @in and @out are the usercopy region of this cache (see
> +        * fuse_dev_init()); keep them adjacent.
> +        */
> +
>         /** @in: The request input header */
>         struct {
>                 /** @in.h: The request input header */
> --
> 2.43.0
>

I think this is more a matter of preference as they're both
functionally correct but imo the previous approach seemed cleaner,
given that only the io-uring path needs this. The extra hop goes
through a tmp stack variable whose memory is already in the L1 cache
and the memcpys are small (~40 bytes), so I think the cost is
essentially negligible. Not sure if Bernd or Miklos or Amir have a
preference here.

Thanks,
Joanne
