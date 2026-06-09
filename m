Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5804C0400
	for <fuse-devel@lists.linux.dev>; Tue,  9 Jun 2026 21:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781041246; cv=pass; b=i9Ay/ZfEtpzUkEx3O+fHYpsz1E+ryYcy+PQOEMwvI6zJsPvX/1SsaYG6YjMxtjS0ee6jNiFLCatXpJc8wNShhTvfUtwKK5yvRkD5WEF1ecI41m79CnIR8uAXiJ2GQh8RSzm1gp3J3fOtWsHMx/IKDsGc5j+eu5QetSPsexHfc+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781041246; c=relaxed/simple;
	bh=LxJbphFnFSLK7hr9bXSOnnqXmI0nFTzhEiHyDOBnbpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWmWpw9FcZMV0MQHu3IeY1LTGt2npMsHx4okgWkF6ZZvlTBVAUKBGcln7Vv46AiOOF9tSzSVZzSl5o9Fq1w6gmuCxMcQ0wIET65Odo5w+l3Xw5hPS2QLncgl083EpEPYS1L0DjW3GbHV+j7/fHzjQqmpF+Ad0YETJRz8qC3sTDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYHZvAAW; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYHZvAAW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b64c8311so67540375e9.3
        for <fuse-devel@lists.linux.dev>; Tue, 09 Jun 2026 14:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781041240; cv=none;
        d=google.com; s=arc-20240605;
        b=c3WY9xutQziQ1iDWyGN3qIXuH+ynFHpJg2dZ3DxINF4ik121SpFQ720ATxWvCEuY0M
         w9Q0r0PqW2vdaL6gfTTt1UZ4LGNrf+EYLvuH3r7vjoXkD9NF8nLVBclptQRzR5ECpxZ6
         PF3VvRfcapCpIXyJnGLgGyk4c4jU7IsjJ3xz0uctrzw9ReOU5dOINEhsB+xOUSALnvaw
         ZKdR4ZaSjv6EfkUx4M9GJQ/qIATk97vqNBKOg2rUGh5WHu60nZ/pdlIQr8ayfY06zOIK
         baz8Kxi5KMlqaI2mIdeOsMgXgh55+1tFfFWlf+zaWIP2eixNx4GcWvi/IT26YZTOwjPn
         Am+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=axEo+SQlIOyn631n7kh9nc9Xdviab4sY310qjizLdPY=;
        fh=VL3xC3SRPQQfbOqr8oVjydleI4cnZw4DA9tcjyGwc60=;
        b=l3EmkWzFWVErxMJ4ZQDhToFdSB4r6IUYUnW/2XmnehjGV/3PDk9mvxApmRsm/EGJT+
         oKCtwRP6fplDyIvvukItcjaxkZMy0wxlZ/eLGqJa75KudjZMxeIEqAh1xI7CmII2Nw9p
         NPW5U25FgIv8hNQMxFRUpMhRgcEyhggzkQxTPHtYwlG0EGrOAUT6pG3KlsPCgqvlB/3j
         /ZHGYHJQqz4FznXPfkm+xbQz8JxHDYrukJH+XX0+mYFC71v0H969ALATqmZi2H1f2iNn
         CPyfob+amChIGDX4gq6/EKCchu3cXEIgLJNQuj7QVx2vBvYiQWa7TktL17NK2L+t4KLg
         UNpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781041240; x=1781646040; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axEo+SQlIOyn631n7kh9nc9Xdviab4sY310qjizLdPY=;
        b=KYHZvAAWPKJsnlnU3hsBJ/b8kPY9Cb9azQbNgSSKbZ8ndxsCx4AGMpkahl7oK3hFkg
         DsTwm4ACeidIljvjr6iSxDARgm48PGXekU7mL6NSEY5LvFhGwrw5WITagzf+VpG0h8rV
         XqxXHSiuaZuT1LGvsVW58vHuDRv7/BC0FjlhwkytwDRyVeq32CN12SMzwQt/Fl4FiCty
         mTanTb0KUUbgvUb6TFsCYuFUmVuouxcdPrq3klN0xs4IaXLLgITwZDaqgVN7vQRaBCm3
         u/O3D+8G6absTLWPQXc3Cd46fjPO8S6bbnwc+7MfAFkijaOmViXXcGXuK6HCRC/vfHh3
         +Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041240; x=1781646040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=axEo+SQlIOyn631n7kh9nc9Xdviab4sY310qjizLdPY=;
        b=jmSGGA46MyE1m61HVFJS1x3o+iQCbYelYOhsJ7XhfewJZ5SQ0ESTtLE14zqkdy0Bep
         C9/mDGmIiV+ShLIexxwdEIwlIEmiEfVyH6ksVpZiFXMaqVMzRL+2f6q8A7rwUpo+/gx9
         oJ2HULcUHte7zjBgdOx6KQZPjMxxPLBEyccS1W+VVluduV6wHOhvk0GfzGywGT+z9I/1
         56jxHSuI7nVECvLfAwVgNIYOwjnAN1p9TiFGOBOjuSnqvF/7qPc1DEsX5bfkk1l/wFuQ
         aKOYs5KbMG26bgqB+G/2wzBbifKTIF+Yq89VrtFn3nOlDpplgd44nMzL2EMZLv2xLS4M
         kRvA==
X-Forwarded-Encrypted: i=1; AFNElJ9KiCnbt2XssijkX2siWogzRYLz0BANDxt4HOzMJUbeuWl+WdW7wFzvwCrsRnX2i8qQK20YTCHXVP+/@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5fc8/6pipTdhBjy+Zw1LxuMjgJJBSjnCjpQxuUh6wwivtLOc8
	TBw1o39keWqcECA+D0L7px+Ixvzp13yiesz6UzLqnAhuVOnMdBvkx7OdTR9syX+eYVcSr/nJCb8
	xTYuWf4CsePlVCB9F9U+vEKG/Y698ipk=
X-Gm-Gg: Acq92OHIJVoF6mQ6J5s2Qt5GAvR5MNutUwFfd66lEzfZ+kCtVZlm2az6EQ7P61NnvkP
	YZGGyR3X82OyrxiiYuKo9nsL2LSudEu1X5Mo4cbfZG8jmnp9+wGAubxX7KEx91Tup3GVynkCdE2
	K/7BCPYx3bhLpah2yLH0/CR0Ql3WnwG5xsCAgOqtw5z5HSoTr5eiDFNSY0eGmLoezJoXd+318ES
	C+CzfQx9dU80ocSds1A0qUrNmMisEQBNb8jw/WiKCg82kDfkR5xbIKcfHKuWNbPYXlc8TdJ/12+
	XuFcZAqxlZVwL1zznCK8zSOCeeHtUP510BEHIz1ZF8rAorGok9RmwkGhWb0TFeFNFv3NP7zoVQ=
	=
X-Received: by 2002:a05:600c:c493:b0:490:ae52:499c with SMTP id
 5b1f17b1804b1-490c25f1ab6mr380457125e9.21.1781041239953; Tue, 09 Jun 2026
 14:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFmvuTWx0NUnC-q6T=SAWLJTEp-fvueRqgPQCFtULmGngUs+AQ@mail.gmail.com>
In-Reply-To: <CAFmvuTWx0NUnC-q6T=SAWLJTEp-fvueRqgPQCFtULmGngUs+AQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 9 Jun 2026 14:40:27 -0700
X-Gm-Features: AVVi8CeB_SmQM9KraIx1CKihkd6E4Tq2Ga_Y3W0uUXXUkxC5i3wvibEMRiwOkHg
Message-ID: <CAJnrk1YjZZGzzup5biMq+SFuMK0pp8O4ZLTEjji7oJGD6wJNNQ@mail.gmail.com>
Subject: Re: [BUG] fuse: KASAN null-ptr-deref in fuse_readpages_end after
 aborted splice read reply
To: =?UTF-8?B?6rmA66+87ISc?= <neck3922@gmail.com>
Cc: miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com, 
	fuse-devel <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 2:36=E2=80=AFPM =EA=B9=80=EB=AF=BC=EC=84=9C <neck392=
2@gmail.com> wrote:
>
> Hello,
>
> I am reporting a FUSE read-reply bug reproduced on upstream v7.1-rc7
> with KASAN enabled. The bug was found with a local syzkaller setup and
> was also reproduced with a standalone C reproducer.
>
> Target files:
>   fs/fuse/file.c
>   fs/fuse/dev.c
> Subsystem: FUSE
> Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git
> Git head: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> Kernel release: v7.1-rc7
>
> Observed crash:
>
>   KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
>   RIP: fuse_readpages_end+0xe5/0x650
>
> The same reproducer may also sometimes surface later as:
>
>   RIP: iomap_finish_folio_read+0x163/0x230
>
>   Call Trace:
>     fuse_readpages_end
>     fuse_request_end
>     fuse_dev_do_write
>     fuse_dev_splice_write
>     do_splice
>     __do_splice
>     __x64_sys_splice
>     do_syscall_64
>
> Root cause analysis:
>
> The crash appears to involve the FUSE splice read reply path replacing a
> page cache folio while or shortly after the corresponding FUSE request is
> aborted.
>
> In fs/fuse/dev.c, fuse_try_move_folio() does:
>
>   replace_page_cache_folio(oldfolio, newfolio);
>   ...
>   if (test_bit(FR_ABORTED, &cs->req->flags))
>       err =3D -ENOENT;
>   else
>       *foliop =3D newfolio;
>
> My current understanding is that replace_page_cache_folio() can detach
> the old folio from its mapping. If FR_ABORTED is observed after that
> replacement but before *foliop is updated, the completion path can still
> keep the old folio in ap->folios[]. Then fs/fuse/file.c later does:
>
>   mapping =3D ap->folios[0]->mapping;
>   inode =3D mapping->host;
>
> and faults because mapping is NULL.
>
> Reproducer:
>
> C reproducer:
>   https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/fuse-readpages-end-v7.1-rc7/repro_fuse_readpages_end_rc7_userns.c
>
> Symbolized KASAN report:
>   https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/fuse-readpages-end-v7.1-rc7/clean_c_userns_report_rc7_fuse_readpages_end.t=
xt
>
> Kernel config:
>   https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/fuse-readpages-end-v7.1-rc7/kernel-config-v7.1-rc7.config
>
> Key config options:
>
>   CONFIG_FUSE_FS=3Dy
>   CONFIG_KASAN=3Dy
>   CONFIG_KASAN_GENERIC=3Dy
>   CONFIG_KASAN_VMALLOC=3Dy
>   CONFIG_KASAN_EXTRA_INFO=3Dy
>   CONFIG_USER_NS=3Dy
>
> Runtime conditions:
>
>   fuse.enable_uring=3D0
>   unprivileged user namespaces enabled
>   /dev/fuse accessible to the reproducer
>
> I verified the C reproducer by starting it from uid 1000; it then creates=
 a
> user namespace before mounting FUSE.
>
> Brief KASAN excerpt:
>
>   Oops: general protection fault, probably for non-canonical address
>   0xdffffc0000000000
>   KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
>   CPU: 1 UID: 1000 PID: 399 Comm: repro_fuse_read Not tainted 7.1.0-rc7
>   RIP: 0010:fuse_readpages_end+0xe5/0x650
>
>   Call Trace:
>     fuse_request_end
>     fuse_dev_do_write
>     fuse_dev_splice_write
>     do_splice
>     __do_splice
>     __x64_sys_splice
>     do_syscall_64
>
> If you fix this issue, please add the following tag to the commit:
>
>   Reported-by: Minseo Kim <neck3922@gmail.com>
>
> If you need anything else, please let me know.
>
> Best regards,
> Minseo Kim
>

Hi Minseo,

I believe this has already been fixed by [1]. Could you verify that
that patch fixes your issue?


Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/20260519052807.1924269-1-joannelkoon=
g@gmail.com/
