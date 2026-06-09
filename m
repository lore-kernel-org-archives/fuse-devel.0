Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE662F747A
	for <fuse-devel@lists.linux.dev>; Tue,  9 Jun 2026 22:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781044446; cv=pass; b=pRXr/ajccoXrhmzp0wGwn2gZf9n1otZf4Wl9R5nkOYKeH3p+n1t/tNlnucVVwOtIM/ecU9D6+8jQVT5o048zsGrp6bloxHkgVVrgSJ0UlZaYlXtHYgVF9qNz6M8P+nOa3sIYRkE6ZM18WFQyFzQzl17q+wkoaa3geq5mJwbscys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781044446; c=relaxed/simple;
	bh=COTblkNy6SCSydFwwrMAdTko/6ck6W25SMup1eD2Wbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ty53G0ZMeqYV7x+AUH4E40A3Wu+rVTxHDSTQTMOOzY/kCteFG8OEhFJhRSSrfv3jhmHKuEUdXsc/S5+Kar3DggAFX3QuHW0IshgyrPby7KX13g+HXLnE8Ao46fpIe5SEojmw8k/ECVIhlWhxmxzK9bcL8/fqmykhfjMISa8cFUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOgLZ8vU; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOgLZ8vU"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ccf181a52bso57300736d6.3
        for <fuse-devel@lists.linux.dev>; Tue, 09 Jun 2026 15:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781044444; cv=none;
        d=google.com; s=arc-20240605;
        b=CAG2eOsv997mNW/3YHvXbiiFFcG3zECkFSTxOOs7iT4YAwWJFPVltIbXkeRn5ZmMH3
         z0NHpkJ3mQPXIEakt79lMQH4VIHzHGjBZ6FpQUue1ODbA2+yBm9Q6oL76jSrqd9MqQaH
         RCaUrfhDzrX+lFWgrbLftrNjoZqX+vLAq+vDWbVfMy9VKH3tUJtrhrgAYv1FjTfriYyN
         areEb8wqRNJCfPkp2VkF3olXQuuPC4Dc6IDzI9OyXguGA1ZPUy2cN1o6o5Bm7md3pEpp
         WUcadAm+cNodx7x4Anvg4FMO/JlVKLAxez6kf9DfoLBwJGc5qfs+3/wBPfv2hJ5WFWtG
         I6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=js4tlHBiBMVYgQ7eMyaF9Sfm3F9tYvMqzzGrQuJc52E=;
        fh=a9xF3xW6uoZO6v3beXGZ6HureizoVAlJ55BAjuiwn/o=;
        b=VB75EBWGJuzncDVWRNti9rkOsIr/kGlRpU3bY+6YZhhznKG71k0YW9JSJp/x6jygSg
         5WK2bIQSANYx1iCCkKOBfqWyGLZpDvqPKx+RmfrZtAs1aVp9BkMasRFXj29xCPGDACO6
         zM8fNPYGsTdpiEfXB6jFreYSfhkHQFfrHei9CsZkJu+st+xXQTJCxy4Dxq7kz5zwaRH7
         K432hgMeE9I473gEt6j71a6s5N9xFHfMQJ9dC8JsLc/1BS6SF+cAi5L/I8XXZuGIrOwR
         WXanjni9MpjCX0eb9DfJbrh+tlpgWaueOrUFXkJuYjgToPjaAscvilmOaXcZzKJXugj8
         tIcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781044444; x=1781649244; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js4tlHBiBMVYgQ7eMyaF9Sfm3F9tYvMqzzGrQuJc52E=;
        b=DOgLZ8vU4QHW1XewUT/iFNVFtPRmH58ZU4agLUMuTeZLUS5bS8eQ+4tn9WKZFD+k0U
         BLj3YaPWLQsGvMZWOYNAOhcDo9cN3nGcwpmpY0hU5PO2It4UpbeoYjio/E3i/2x+CfM3
         VDSkc5G1Eyc7IxbnfGXw7M51+jXt8NwUZHtsJu7boQCJNstri3D3Pem57aQw9mTXqyS0
         EeyJawoUlOv3o0XfY3uwOg5qzGCSluxNcy30jbD/oGJbzwXr/Cy8uQ3XUYaS+CC2rdZC
         K7BRI3abPVETfLHB/0/lrzLSFVGwIJommMXjXYVCiYfSyK/GkDLGB3vuKiwArfCzVios
         rbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044444; x=1781649244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=js4tlHBiBMVYgQ7eMyaF9Sfm3F9tYvMqzzGrQuJc52E=;
        b=ipkDtS1qtjAb6JECG9bB6jp07azs97ow4j0ztOF1eyKECfZDRKXMrJjCUR5+QDhMF0
         rpy/5gwsLjbKnyoZ2UqjNfleS4s12KcNWzy0ICTA/NZQjj+CyshiuDkUF4/7au5wn1wW
         KU/oX963NzWAuDWXhZUj69ZZWBofcNDcfM493FbUJ6k6p8L2dZiXie8kmfh9eQ6opCBy
         QD9NtB5TIze2sLL4GIymwr4OlDb/bwXxLvjx+JjN6kpzw9reywKewqRTwQHXh3+qkoYC
         ZV/1nLKez2f/UqtrpeYhpvhioo37vhMJ/QcEIRFcAvjgLE4PJQFU+xA5GiYpk5W4ZOFn
         ONCw==
X-Forwarded-Encrypted: i=1; AFNElJ80/VUyl6a20rFLqeSf+DbIO/Y5djw67Y/w8uhe/s/9VVgXYTR2fcASjE0tT/UCdBTgMLxfrI7AxRFM@lists.linux.dev
X-Gm-Message-State: AOJu0YyX/yYsCZ9sNV+pb9carbk5fy9o5NLfp1+s74KnU2xZl49Cn4Xi
	JD+jQ584DO8/wmOriYWocpJzp+Ngy6cLkGFYmfu+gi2IcpZYVNm2hbgTFv/+sLbhGTMJvDFU2ML
	c9Lv1JBILazv7ZdbWwdAYQI9GQ9DSC8c=
X-Gm-Gg: Acq92OHgf+iMo3ylwOUD4GcJ0RwmM3KD28hVoZ7MkRlqFnJAAvVIEAr/wEHFNtSJ0K7
	zJpIDqyoD9UQlztqLemc2+mwoHOSOgNaNlsHvwYWqe675dc+Oj8M0Sh9ctp8LxO/VZuLH+sQpSi
	J4nmWzjDHYhPMfa0pgIV2NawQ0od+tRC2A1z+CLXKDlYrFrzyo5ArtMxqtsG2TXveqGdntVqQ0r
	Yca43+e/RY6Z8t0fZFQbPAES4lft1gQZjXrRNuWJA60/UeCC3iG9FqptkgzGT9JngO7szfVTjUE
	uhVKXAAMJVCMqPmr
X-Received: by 2002:a05:6214:212a:b0:8cc:3546:261d with SMTP id
 6a1803df08f44-8cf1ddfbb1emr72611696d6.40.1781044444260; Tue, 09 Jun 2026
 15:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFmvuTWx0NUnC-q6T=SAWLJTEp-fvueRqgPQCFtULmGngUs+AQ@mail.gmail.com>
 <CAJnrk1YjZZGzzup5biMq+SFuMK0pp8O4ZLTEjji7oJGD6wJNNQ@mail.gmail.com>
In-Reply-To: <CAJnrk1YjZZGzzup5biMq+SFuMK0pp8O4ZLTEjji7oJGD6wJNNQ@mail.gmail.com>
From: =?UTF-8?B?6rmA66+87ISc?= <neck3922@gmail.com>
Date: Wed, 10 Jun 2026 07:33:51 +0900
X-Gm-Features: AVVi8Cdp2js1ij8t4qL98AIHRLWri1v0UdX9_6anIu5LvEfWfIGYIuxhVqdq9Nc
Message-ID: <CAFmvuTU4vn82Rr0XDO+ypzEBH-h_GZ76ccsuFnTJJM1s=3izvg@mail.gmail.com>
Subject: Re: [BUG] fuse: KASAN null-ptr-deref in fuse_readpages_end after
 aborted splice read reply
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com, 
	fuse-devel <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joanne,

Thank you for the pointer, and sorry for the duplicate report.

I applied the two-patch series starting at [1] on top of my v7.1-rc7 tree
and rebuilt the kernel with the same KASAN config.

Before applying the patches, the C reproducer triggered:

  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: fuse_readpages_end+0xe5/0x650

With the patched kernel, I reran the same C reproducer as uid 1000 with a
user namespace. I did not observe KASAN/Oops/panic in the recorded runs.

Based on my testing, the patch series appears to fix my reproducer.

Thank you for taking the time to check this.

Best regards,
Minseo Kim

2026=EB=85=84 6=EC=9B=94 10=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 6:40, J=
oanne Koong <joannelkoong@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Tue, Jun 9, 2026 at 2:36=E2=80=AFPM =EA=B9=80=EB=AF=BC=EC=84=9C <neck3=
922@gmail.com> wrote:
> >
> > Hello,
> >
> > I am reporting a FUSE read-reply bug reproduced on upstream v7.1-rc7
> > with KASAN enabled. The bug was found with a local syzkaller setup and
> > was also reproduced with a standalone C reproducer.
> >
> > Target files:
> >   fs/fuse/file.c
> >   fs/fuse/dev.c
> > Subsystem: FUSE
> > Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
> > Git head: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> > Kernel release: v7.1-rc7
> >
> > Observed crash:
> >
> >   KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007=
]
> >   RIP: fuse_readpages_end+0xe5/0x650
> >
> > The same reproducer may also sometimes surface later as:
> >
> >   RIP: iomap_finish_folio_read+0x163/0x230
> >
> >   Call Trace:
> >     fuse_readpages_end
> >     fuse_request_end
> >     fuse_dev_do_write
> >     fuse_dev_splice_write
> >     do_splice
> >     __do_splice
> >     __x64_sys_splice
> >     do_syscall_64
> >
> > Root cause analysis:
> >
> > The crash appears to involve the FUSE splice read reply path replacing =
a
> > page cache folio while or shortly after the corresponding FUSE request =
is
> > aborted.
> >
> > In fs/fuse/dev.c, fuse_try_move_folio() does:
> >
> >   replace_page_cache_folio(oldfolio, newfolio);
> >   ...
> >   if (test_bit(FR_ABORTED, &cs->req->flags))
> >       err =3D -ENOENT;
> >   else
> >       *foliop =3D newfolio;
> >
> > My current understanding is that replace_page_cache_folio() can detach
> > the old folio from its mapping. If FR_ABORTED is observed after that
> > replacement but before *foliop is updated, the completion path can stil=
l
> > keep the old folio in ap->folios[]. Then fs/fuse/file.c later does:
> >
> >   mapping =3D ap->folios[0]->mapping;
> >   inode =3D mapping->host;
> >
> > and faults because mapping is NULL.
> >
> > Reproducer:
> >
> > C reproducer:
> >   https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/ma=
in/fuse-readpages-end-v7.1-rc7/repro_fuse_readpages_end_rc7_userns.c
> >
> > Symbolized KASAN report:
> >   https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/ma=
in/fuse-readpages-end-v7.1-rc7/clean_c_userns_report_rc7_fuse_readpages_end=
.txt
> >
> > Kernel config:
> >   https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/ma=
in/fuse-readpages-end-v7.1-rc7/kernel-config-v7.1-rc7.config
> >
> > Key config options:
> >
> >   CONFIG_FUSE_FS=3Dy
> >   CONFIG_KASAN=3Dy
> >   CONFIG_KASAN_GENERIC=3Dy
> >   CONFIG_KASAN_VMALLOC=3Dy
> >   CONFIG_KASAN_EXTRA_INFO=3Dy
> >   CONFIG_USER_NS=3Dy
> >
> > Runtime conditions:
> >
> >   fuse.enable_uring=3D0
> >   unprivileged user namespaces enabled
> >   /dev/fuse accessible to the reproducer
> >
> > I verified the C reproducer by starting it from uid 1000; it then creat=
es a
> > user namespace before mounting FUSE.
> >
> > Brief KASAN excerpt:
> >
> >   Oops: general protection fault, probably for non-canonical address
> >   0xdffffc0000000000
> >   KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007=
]
> >   CPU: 1 UID: 1000 PID: 399 Comm: repro_fuse_read Not tainted 7.1.0-rc7
> >   RIP: 0010:fuse_readpages_end+0xe5/0x650
> >
> >   Call Trace:
> >     fuse_request_end
> >     fuse_dev_do_write
> >     fuse_dev_splice_write
> >     do_splice
> >     __do_splice
> >     __x64_sys_splice
> >     do_syscall_64
> >
> > If you fix this issue, please add the following tag to the commit:
> >
> >   Reported-by: Minseo Kim <neck3922@gmail.com>
> >
> > If you need anything else, please let me know.
> >
> > Best regards,
> > Minseo Kim
> >
>
> Hi Minseo,
>
> I believe this has already been fixed by [1]. Could you verify that
> that patch fixes your issue?
>
>
> Thanks,
> Joanne
>
> [1] https://lore.kernel.org/fuse-devel/20260519052807.1924269-1-joannelko=
ong@gmail.com/
