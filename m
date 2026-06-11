Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC063E120E
	for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 20:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209803; cv=pass; b=XlFKCVn2RGoGyjrQu4EAW84yui3t0Glp5bjIxYePQWj4PuELEdGoqvCGqMXAx7epp5bjxrGiqOWKKU5oVZV7VhdRoyMn46dYFhVBxXpssroBlFc8LxgGJ3yFee7yNaUgj0nqeX5sRApEGUSJXsLrqK7r0ill/s/yRX5ZpPgboPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209803; c=relaxed/simple;
	bh=yiVIEjJGJnRNqiyZQ2U/4JN3Lb0oGrEGxZOlG6GvhfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXssPYXmQumilRY93Q1ZP5/cgS56KzfGs0+5YgCMXlAAS74vtGOFzxlRdeszWJXliZfTBZ/wCtPOAWPg0ikWWlTk2kNInvldnvw57vm3+SqM0TzAZnKz/v9VIWk9c4Ukue4Dq31Q/ZIzF0DkzSHb71X9TRUtxM8gOAYZatlO/hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWns3Pu5; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWns3Pu5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so153794f8f.1
        for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 13:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781209800; cv=none;
        d=google.com; s=arc-20240605;
        b=Zv/uIVSjfmUanf9RbNUuG4X25gtYzv6pOXy8H2V+rRQQ6ao7Qns/ZLIvhEaE/bBqVI
         IYPEk2yHHiyr6NIM++LgfWTyYJwX9uCYno9JBC4Lh09IPf8V4c1GyKU1iTtP7i8UcYBK
         UPOFXDDsn0w2yrb0aIBuExWMLBO4xTtTtLleSF4VMGlVMewL2/NTCOgLo0sRc9B9rqjf
         LKb5tdLJQzT9J7aFgzzmczFl9A7xwL/J3adaVV2W/NmBPHOlD/JzuSaf0uAh2ELjnP9G
         GBO/1YeFlH/3wT+53D6PvikMoM1/DLF98leC3KBre/mCEp5SHoaOJD5WDn0ZBJmHi0/9
         /mLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cH+bH34MDhkeua+1hDggeKIKdL2dw6Am2kOVi0EBGIE=;
        fh=vrFbXcmF6Z5edBxiI2X5ARR0E1UEbIoXAZ2pWuqsT4A=;
        b=hqlWpQxMtqHUPVX0Klkkt1WqUN4G8dMu6Gay/e1dMY06c2xfgeKJ7RjPFEDU4+DXgh
         9BSdyWLaQl2g1wyJ2ypAa9TiVOUitZCRdDfkSKL/yCBZZFHJIWmyRwUoT8gYRq+GfhPJ
         5s9rkh5RtBPVJr2xR8g/aoe7Ovj/jinx+AXnftpU6FD3YAfkGNsDoIb5fePswK/mtEC+
         at8X3w2w93U+vG6YaSHGITB4OPePccG3mlzEkIc62lv/SjKibMR9MN8G2A4v2c68Ewuu
         IXhrHMsnOCGa0CJJ0ije8yIF80wQf2RK8McmWEOAbgkWzni6yCOp4iwGe0ksksgpwB4q
         NtpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781209800; x=1781814600; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cH+bH34MDhkeua+1hDggeKIKdL2dw6Am2kOVi0EBGIE=;
        b=hWns3Pu54dLNbuUu9KBi9HJEeLI3vpgtoi1Nzfsdn1j6bDY5Fw4MzJU10ePC962r+4
         W+YMFdCD5YKD6oBZ+fy47pGeKkXDe96x/wxRmgthgR1jNHtTk8MTrojMfiKGxKUmwuNL
         Q9/h+2UseezOcjzFdenV0VUAwqomW6I7wErsMaXNtKvSxAkTFvHNOGUv4kgMU6HQMlo0
         pytJ7fK/XKS0N2I2uPnxFxwQ6hJcg1oeDz2Rv9W7L+QTl7RaD6G2Im/ZeY/8Vi9av95b
         RqBdAjP22Y3DO79IuXCR/xzMBbC7o8oLydEKGCVyR6nzsY5KGpjNPe2WboTzIIyS7ZJb
         TJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209800; x=1781814600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cH+bH34MDhkeua+1hDggeKIKdL2dw6Am2kOVi0EBGIE=;
        b=YFEY013OUhl/kuzk9i/7r4DwV1dED6chCywxDu1mRHTgWLY6ztSW7tQ4bBFwGgrRlr
         uOuLdK9Nlp5ID1rjQkDEo70m1chQ8j2hxhGWqFpGlyH1TjPBe1lmv+X00ACDD97OrrzU
         uIbGc+QXvN7Zc2ta3JYLvaEJBwzY0kHM1BQzd26Y3qG3pn5m0PjspvFgpbeGHrBEU+ll
         Mf/7j2rO23QvhXSE0hq8qFyj5eD5PKBhdEy6U2TQ1nwSE+4P00wRI0nFOtCWULTrgba/
         zOqctAG1xOAIXEncm3iNcNDgtoIAXrEFOSKwJ4WzILCS5BJ07yKPi6sEIGot0kFnH0pM
         33PA==
X-Forwarded-Encrypted: i=1; AFNElJ/iLAtQ07vbHjNbs6UI7O4VPNRTSJbN5NikIYd5WY6u5m35tLEUYR8DSUr7WKXM1TSavOrpy38SrjFB@lists.linux.dev
X-Gm-Message-State: AOJu0YzFCvNe5IKs48Iy2VmcGIbeim2xSXkorkTQCzZPr6fhYREVQ27n
	S56VgY3B/khuwXTTcCbnr4fz15HavnvKG4JyksbPGr8DMqXnQNWJtC9/LQaaCNNEarTB/gld2gq
	/V5yezdR8lyccVRRZw+UO/1eESUViospcQnKSIvc=
X-Gm-Gg: Acq92OGuxZ0DQwKTCiFxQvm+IMrFR0bV3805O2eBV9b3AklNKOJO2AtCv2lMseIi9Yd
	xhLINsAJsfArcYOkpjYBpKuNisX/i2bv8G7tHRQbHGnAZ3/PRAlFq3LgP08cTFnHrNobciahqb7
	hHHeokT0dFwGPJQ+NZ57OycVDR0b2Alo+EQ/XUfAduIMSuFNrtVzQuNCLQ6/VeA37sauOot2V2k
	phWFCgzwc3UvsjmycKq6SuqRGcL89QcYfGj3Y/XUNpQ7bFdrhakO8Qv0qUeDBkt+YlYCh54tZnA
	yaEtSI3RJB+Zrq17OfcVALOmkTC6k7zQ1lQMNdh4t+LjFNs3wv2TSXr0FfW7Kkg=
X-Received: by 2002:a05:6000:4281:b0:460:138d:c9b3 with SMTP id
 ffacd0b85a97d-4606da5a709mr7749f8f.2.1781209800106; Thu, 11 Jun 2026 13:30:00
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com>
 <aeb9c03a-0330-4e41-ad33-b884f00691a0@bsbernd.com> <CAJnrk1YPeeCSsQFjaFNROYcOdBO-kTovOTDkCigNKRt57JREJQ@mail.gmail.com>
 <6ecc45f5-4bce-4af2-bfe4-36c69e624b01@bsbernd.com> <CAJnrk1aS=3KwZ3LpiqcK=gKsj7oru-k-1Xpe2j5puDdmn+hjUA@mail.gmail.com>
 <CAJnrk1aacCbOWWWvW2xnQZ0a954-4shXdyO9LBn_Fv_dyUAWnw@mail.gmail.com>
 <CAJfpegtorFv9u2NCPA8v5OHiBUNT-XzUiw_y=7c3U3WEaXRUZA@mail.gmail.com>
 <CAJnrk1arYPY1u8_aiMfYUbmb9Oy4epRWJp_W7-hjAxQ_ggJn9w@mail.gmail.com>
 <CAJfpegs7ttuzD14cnEeRBeDnw2E-5Dz=+xCEWVDRCKqMhDZ62A@mail.gmail.com>
 <CAJnrk1ZbThfvHBfVq_SntuRLFsvHC=DMBQnNcS7Zu4MV9YXTgQ@mail.gmail.com> <796c1e91-41aa-4c1e-8013-db0dc7d55da7@bsbernd.com>
In-Reply-To: <796c1e91-41aa-4c1e-8013-db0dc7d55da7@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 11 Jun 2026 13:29:47 -0700
X-Gm-Features: AVVi8CcoU4NwuatRlSf0wf327U-3_InkSCr1BgXgFrxaIKjZ7Gkrly-yvvserN4
Message-ID: <CAJnrk1YNh0KFxcGVO5VbkM=5WTBsxEOSKWwfcyBxrP=fiU4atg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 11:47=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com>=
 wrote:
>
>
> On 6/11/26 17:24, Joanne Koong wrote:
> > On Thu, Jun 11, 2026 at 6:29=E2=80=AFAM Miklos Szeredi <miklos@szeredi.=
hu> wrote:
> >>
> >> On Thu, 11 Jun 2026 at 03:51, Joanne Koong <joannelkoong@gmail.com> wr=
ote:
> >>
> >>> a) I don't see a compelling use case for needing to dynamically
> >>> add/remove individual buffers from an existing pool. If the server
> >>> needs more or less capacity, adding/removing a whole pool or queue
> >>> seems more practical. If we do eventually need single-buffer addition=
s
> >>> to an existing pool, that can still be layered on to contiguous pools
> >>> (but removing buffers can't).
> >>
> >> If server knows that it will want to remove individual buffers, it
> >> will just have to register them as separate pools (containing a single
> >> buffer), right?
> >>
> >> Buffer pools are a more generic concept, hence they come with some
> >> extra complexity and overhead.   But the interface should be a
> >> superset of what individual buffers provide.
> >>
> >> Am I missing something?
> >
> > The interface is a superset. Internally the difference would be X
> > bufpools with a single buffer vs 1 bufpool with X single buffers.
> > There would be more overhead for X bufpools (eg allocating X
> > fuse_bufpools structs, looking across more bufpools to find a free
> > buffer). I don't think it would add much additional complexity, given
> > that multi-bufpool support would also be needed if we wanted to
> > accommodate different buffer sizes in the same ring.
>
> Really sorry for late replies.
>
> Couldn't we make a config SQE define a max array size and then every
> array entry would be something like

I think the max-size array works but if it's backed by a linked list
instead of a fixed array, bufpool add/remove can be more dynamic (eg
no fixed ceiling). I think this is the freelist concept Miklos was
talking about. I don't think the implementation details really matter
right now though - all the kernel-internal stuff could be changed and
figured out after this series.

The uapi changes this series adds are forward-compatible with
multi-bufpools. It adds a uint16_t buf_id to fuse_uring_ent_in_out,
and there's already a uint16_t padding field right after it that a
pool_id can occupy later.

Thanks,
Joanne

>
> struct buf_entry {
>         char *payload;
>         int buf_pool_idx; /* which buf pool */
>         int idx; /* index within the buf pool */
> }
>
>
> And then in fuse_uring_ent_in_out you would need to set buf_pool_idx and
> buf_idx
>
>
> Avoids which buf pool still has free entries, but buf pools get added to
> that array, which then would have its own head and tail. Obviously you
> would need to do another pointer lookup to get the actual payload.
>
> Obviously has one more pointer than just a single buf ring.
>
>
> Thanks,
> Bernd
