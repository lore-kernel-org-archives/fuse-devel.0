Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF40B384CDF
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 18:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683693; cv=pass; b=M4Ys+gXQ+B2XVTWPOXk6IC8CCKgXLzmEmgv1Nr9CTBsZauUjjAamPt2/fSAbumzeR1/jyOkt4cwp3m1hoS67okP8YMoVCrRoFnBguYHEtlY2MqPHUZewuaRNOA6CO7pXxrhQ7GfleQC+nNvf7mc7xmZGM+YVy6X2k6DkSPx8ifA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683693; c=relaxed/simple;
	bh=pbjbbbVLp5K/9VlKm7ltVlHFEtpetfQvW99kkt5MiCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5qC45xey2FsQclFHbi/ZPnUuhWmuwYSvV37741VHDCNPo5UrAP42imAPhxKSEkhpoyEj1rblcU99KMAYmhMJlIKzGxyeA/zgrnkkm8quwT/Be/X3+VRscxocVzjedaa3hzRyowK2b8T4/4riotiQ6cFOm9aKeSLxFnzTGa7qXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiZNjB03; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiZNjB03"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef29c5561so1245139f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 11:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780683690; cv=none;
        d=google.com; s=arc-20240605;
        b=hNAhY0nsBX6ZrwN1RruSTWShAiQYrkTfaKQi++5bIxGAeDX2qn7uaE3PBnRT8v/EK+
         p2UI8tDg1LV+gGtzb81PBSqgi2MBvsarB0ZRyI01Z3a0yeV4SCKYDEOoVJfQGUQQyXrx
         u97CiaU4FCOKl6C3+vNjNjFhXKd41gvsI9FLWts/HeowLpUCYPN/zdQMAm5tHQo+pGEA
         pbkvhzQpJCY+EwtckGKdqGj/4GZsyPfKuEGaX146pSqclFKIU2vZPV0l3qCPSTiGgxgl
         ZRk9OxrngVENbk9a+zybUXtWAMb7lIXAzlnlTxqSUqIXbwr2gO7KtrDwQ+KxveZi4tK/
         iksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fL8UjqpME81l3rgq1Kb+5TD+88hOY862wHHXqtquuvM=;
        fh=Bqs9FBGNRH7jbA47qC0pLQyGag0GIpq/Q1zRtuw2tSg=;
        b=dZbE/ye/wEHeu+4zSoYUxYiwVjXqHnxutwl4gJACJDRPccpgfog2V3TbDNaO1Ew7jy
         aCqKUjyS9HcVxwOcXWRWyGERH3qA2aE+MypAf7MBIWKoMITL/xrLQbV+vnYv9+hybycR
         HfqQu7vrUvFdUZZpkQNmIr9qu7KY2XHy7pFlqKFzmUlowR1hXlLHCPPmLEyJSAORyf9F
         zuQr4gG9YOErWdLeTvaHrD6N3eqidjQUl5uuPVK4lpGo29bMFyXOGZ2MRbOsONecsmrf
         RFJjf+fSHfZW1HeRkrARUzZqzJk99ZplsTF0n8fndIZLNxnIxdBqSo655DTDguXbQHaY
         aiJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780683690; x=1781288490; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL8UjqpME81l3rgq1Kb+5TD+88hOY862wHHXqtquuvM=;
        b=BiZNjB03YJmfIm4+p3KbkY7nFwdiNz1yHoOQZXEBS5RMa5k/pNZZb0cHYaqHWa7OBF
         NLeqYVuPyUwqLKYHERzm3WxmFC7JWp/FJYtDTT0Vo6gIeOsU6yEy8zQbt3aKGqYTA84y
         ouWjeSJNhdVHT/aGUuGvnTtda63FKEhIBTLi3YTTh1EAaj86WQKE9kWXd7mJUTFSszO3
         /ApM4TWOzjWlb4N+6Pc9oWm33PxG2nILsi8SOQeSY//4V6t7y8irRS3cjmvs5yxHZzF/
         wCnHmoQpWJnVWBBPveWwOJAg1hGhe/k6h15rSk2ip8pvttNDQRjHGqHvFIXuaTgth/Cw
         x4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780683690; x=1781288490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fL8UjqpME81l3rgq1Kb+5TD+88hOY862wHHXqtquuvM=;
        b=oQTcFfOQG4VmJKUMHCp8iimuYpr0RC1BRw8XZ0DNRz1zXQ2X77mWUvukvtUkv9F5hX
         qb3yrGbKbAxSJqxnqh9ZeugOgFjgV2VOTrRavAyoTk2uGu//qr/LapzqSHRkyQwAYKwG
         gVX5uOwQyFvO7qjqzysb7jsuVkJ1hJ00gJZbK59My+Dkqq3QdsX4pnaNUWiENWUpe86U
         YFiEdL0hL0GR2+t0oQxRuIFt0BrnUIMBa/xkdAlFqyAOPU1p7gcTl704l3i6klK6T8VT
         A9muzlq+9D29Tu4zP4za8oemE9B7lHH5ytw5NeNba2X304rkojC9dfybwQvrn/AIVa03
         bzyw==
X-Forwarded-Encrypted: i=1; AFNElJ/D/tUzNpBD9qfhvOqC7+lU5zIo5embVZOAHaCCPenVyApWl1GsM9tJcRHm56Zq0LQPkLn9six+Pxld@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7xeBQopVA/MnYiWGjsFGT+o0zSExlbmiMTv0MxAmkO9ho58uB
	QtLEzctuLEXoszkssG/Li8iZ0yS8NiP/nIVfY9Nk7at/jlgK+hl9x3wmoVx1ZcVdC/kulsMOgHd
	E79LhaJJjRgvo52ilZjRd+soZbKm1mnQ=
X-Gm-Gg: Acq92OGLdiGGG1Oo6dz/TEVbCUA/yicPyrh6AfvtFqFb2PGfcIiuuMrZdr0ntqlp1d1
	YwSDfcJsUUDzZHht880twD8BSjUe4VYXRgO6yS5An/MVmHxxe7W5Zhjnw1KIpWxHxiw9HTLIJvQ
	sBFk4nVUAuNEywC4ZFGZJBsACFEoDngXuuKFTTBQsvH31LT0Si2WnGaam0lzHBqeD/eETcmkBe7
	S1lhhInqqZ8/+xzfZz3u4FbTxzDt6aGqx4swCMf1hiamh7ZjZazys0INE5Y598VEuCOX+LmjPQc
	C+NXZ2wNrY/LLITf
X-Received: by 2002:a05:6000:46d4:b0:441:1e1e:a050 with SMTP id
 ffacd0b85a97d-460302eb18dmr5275229f8f.16.1780683689871; Fri, 05 Jun 2026
 11:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602204430.18427-1-jim.harris@nvidia.com>
In-Reply-To: <20260602204430.18427-1-jim.harris@nvidia.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 5 Jun 2026 11:21:18 -0700
X-Gm-Features: AVVi8CetW31iZskHFTAEzcAQ8ombqSfZV3tgNUrIHZqkn-LqfeuAUSypjbyWrCE
Message-ID: <CAJnrk1aYKZnN3N+-y2kLtPksfRZngfRKLNVzqyo_c5Ysdm5cNw@mail.gmail.com>
Subject: Re: [PATCH] fuse: allow server to increase max_readahead via
 FUSE_INIT reply
To: Jim Harris <jim.harris@nvidia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Sztyber <ksztyber@nvidia.com>, 
	Max Gurtovoy <mgurtovoy@nvidia.com>, Idan Zach <izach@nvidia.com>, 
	fuse-devel <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 2:14=E2=80=AFPM Jim Harris <jim.harris@nvidia.com> w=
rote:
>
> A FUSE server that advertises a large max_pages and max_write (e.g.
> max_pages=3D256, max_write=3D1MB) cannot currently obtain matching
> FUSE_READ request sizes from the kernel.  Buffered sequential writes
> arrive at the server at the negotiated max_write size, but buffered
> sequential reads remain capped at the kernel's default readahead
> window (VM_READAHEAD_PAGES, 128KB; doubled to 256KB for files marked
> POSIX_FADV_SEQUENTIAL).  A 1MB application read() therefore turns
> into four sequential 256KB FUSE_READ round-trips instead of one.
>
> This is because process_init_reply() processes the server's
> max_readahead response as:
>
>         ra_pages =3D arg->max_readahead / PAGE_SIZE;
>         fm->sb->s_bdi->ra_pages =3D min(fm->sb->s_bdi->ra_pages, ra_pages=
);
>
> Since the kernel sends its current bdi->ra_pages as
> init_in->max_readahead, and bdi->ra_pages is the default
> VM_READAHEAD_PAGES at this point, the server can only ever decrease
> the readahead window -- never increase it.  Even if the server
> replies with max_readahead=3D1MB, the min() clamps it back to 128KB.
>
> This clamp dates to commit 9cd684551124 ("[PATCH] fuse: fix async
> read for legacy filesystems"), which introduced max_readahead at FUSE
> protocol 7.6 and used min() to preserve legacy (<7.6) filesystem
> behaviour.  Modern filesystems that explicitly advertise a larger
> max_readahead are silently overridden.
>
> Other filesystems set ra_pages or io_pages directly from negotiated
> server/device capabilities: cifs sets ra_pages from rsize/rasize,
> ceph from rasize/rsize mount options, 9p from maxdata, and nfs sets
> io_pages from rpages.
>
> Use the server's max_readahead response directly, bounded by
> fc->max_pages (which is itself bounded by fc->max_pages_limit and,
> for virtio-fs, by the virtqueue descriptor count):
>
>         fm->sb->s_bdi->ra_pages =3D min_t(unsigned int, ra_pages,
>                                         fc->max_pages);
>
> This is backward compatible:
>
>  - Servers that echo init_in->max_readahead back unchanged see the
>    same effective readahead as today.
>  - Servers that reply with a smaller value still reduce ra_pages.
>  - Servers that do not negotiate FUSE_MAX_PAGES see no change, since
>    fc->max_pages defaults to FUSE_DEFAULT_MAX_PAGES_PER_REQ (32),
>    matching VM_READAHEAD_PAGES.
>  - Only servers that both negotiate FUSE_MAX_PAGES and advertise a
>    larger max_readahead see the new behaviour, and in that case
>    fc->max_pages already gates per-request data size.
>
> Signed-off-by: Jim Harris <jim.harris@nvidia.com>
> Assisted-by: Cursor:claude-opus-4.7
> ---
> Notes on AI assistance:
>
>   The code analysis (tracing the readahead negotiation in
>   process_init_reply(), confirming the behaviour of ractl_max_pages()
>   in mm/readahead.c, and surveying how other filesystems set
>   ra_pages/io_pages) and the bulk of this changelog were drafted with
>   an AI coding assistant (see Assisted-by trailer).  The one-line code
>   change was reviewed by me.  The motivating performance observation
>   (a 1MB application read producing four 256KB FUSE_READ requests
>   against a server advertising max_pages=3D256 and max_write=3D1MB) was
>   observed by me on a real virtio-fs workload prior to any AI
>   involvement, and verification of patched and unpatched behaviour
>   was performed by me.
>
>  fs/fuse/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index deddfffb037f..272026f11a34 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1494,7 +1494,7 @@ static void process_init_reply(struct fuse_mount *f=
m, struct fuse_args *args,
>                 init_server_timeout(fc, timeout);
>
>                 fm->sb->s_bdi->ra_pages =3D
> -                               min(fm->sb->s_bdi->ra_pages, ra_pages);
> +                               min_t(unsigned int, ra_pages, fc->max_pag=
es);


Looking at how the mm code uses ra_pages, I think this will also have
the side effect of upping the number of pages read into the page cache
for speculative readahead. I don't think this is safe, at least not
for unprivileged servers.

I think setting s_bdi->io_pages would be a better fit here. fromthe
logic in page_cache_sync_ra() -> ractl_max_pages(),  this would only
exceed the readahead window size limit for non-speculative readahead.

Thanks,
Joanne

>                 fc->minor =3D arg->minor;
>                 fc->max_write =3D arg->minor < 5 ? 4096 : arg->max_write;
>                 fc->max_write =3D max_t(unsigned, 4096, fc->max_write);
> --
> 2.43.0
>
>
