Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7191B87C9
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 05:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778562349; cv=pass; b=kAeETkg53zTx8CHVNiYOdJD1swY6jt2Ub0RRI5fFDrRXewW4pLQbI2fjNmDMcUxUk26diCGxKpEEFNds9R2VNBYXYW1e8XeYsyWqcgM7Al/VTe4udX24tm/46Ux517xYN7mpEYd+K+arRwSmSAjNuIIH7DDSmwnDn1z0HMFjE4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778562349; c=relaxed/simple;
	bh=QDigh/IC+tvvwpywNZ8uKY4YppeM0413gxpNV2iy/0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7E5mQ6wGjU6lZ/plso6EGFC6gwqD3RRDG/GcGgxYq5gWqX9AO8MBSjiRMJ/QKEITFJ4nlnMd62Qx56JitLOGVDre3mCNZjGapnnFD+A3eda2MAG3pHQhrHHZrjXlhxuzo2sudL5zY3q8+xSrgbf5lp+S9J3tQaO1q8otDWNitM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBYxvB+h; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBYxvB+h"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so33595295e9.1
        for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 22:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778562346; cv=none;
        d=google.com; s=arc-20240605;
        b=ZVjy5pzQ0OeNs5wSl6NcTqfSE4Hr+RDf7rA0tYf+KCkO05KpBQmLhw5PHlCo77orfT
         R16dFefHn89QoCUOhyRkjWLl7hhCqK7iOUjiEksvCA4c54BTn5VoNIQme2wBH/Zal1Ei
         DnBFIVaUsIYTz8bzGVh/JnqooyHiRIXxRxYc2o/SuVgLh9LyN9tCp1VjFUYy7ltWbfbf
         +8rQ+8lqwzxXdwn+iSa0jCeU0szPaX6IStY+miBlgDA2PpMu71vB3E8Ch1gdtaQRIsin
         ifqLYQx4iDtSz/+cyRNUUn1++Gjx+lLOMJHTPhypAj2XWpVc5XKQuy9yKPi3wjVjrWPt
         B7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jmieOXb38ndzyje8PODRQfdgkAbT1kd6c7uzPdMO3Wk=;
        fh=oSLQBSy3sy+srs416Fb9Ll8GcR+naHymI7Ry1FvZYFA=;
        b=G1AXFeHiTB2YfauntHauaBeUt0ryFFB8iWYDuQWmuMBOJ/2aX/aXj675oZCTyS3NR9
         t2cZTXcs57KCZM9kTfN6vHXudmfcWR5D0R3ZfvFXV9xtByPVeYKQphcxkGkg1N88FoNR
         f23suowoNMdSp6YcMgFsv3+qNxfZ9pru7mIYbtudN0X4oTF9PNqXKdhzHgi8SspUZII5
         AazXHwLZmkZOKXxvFFOE4yyXtfRA3b2T4VhfYH2/L19RHQB6CDQsZLJ+kR1yqQ/+mAvd
         gwEjMFk05FCDlf/umhxURldYSWXags+NB+1mwYA4kSieaj9EAXkK9lz3zl9/l8nKmSRc
         cn+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778562346; x=1779167146; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmieOXb38ndzyje8PODRQfdgkAbT1kd6c7uzPdMO3Wk=;
        b=VBYxvB+hqooo4miIn8vIZi7IGtN66F/e9VHWivorKnEZNME7YRQLlUZwvIqC2OcrXp
         shxUMW9mmRS2Fw1pUxFsyyeqdNuT6AuJr18arxyV0oHcB5x2Ner2FvxyN6dO3XOuGdyK
         ZfIavWdDfhsOoixHtk1o5DYP0cK5M0Z80vKK4ZeKMUOpOA0RH4tV/TJhpAN6MOMAkSCE
         AqZeecCRofBCltem/otu908z9heJ0PPEFyx/n6G9BUT6mJijXh+TV5+vmeGpMITDm0kV
         cBuTYLI+UVHkxdk7wotWpL6R5xBMB8KyIdpu/bDCSKbS6pqeTEdCf9I+D3F/SOx6uxBQ
         TlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778562346; x=1779167146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jmieOXb38ndzyje8PODRQfdgkAbT1kd6c7uzPdMO3Wk=;
        b=ZeliN83Z7Ps0NOg0n3kck2l2z8MP3S/Z9iUAmKQcAn1CxvIM3BUuEYdnXw7rAIlaeG
         DWrECOe7+44YHMaMCK1saSOk1E23dnMjIFPYrzMq7dMpRVfIYdrK6NaCexSSTrPuSSaD
         tCcZbjxxWsD7CGZu3YkxYOcRoN+gxVp9sKwzyDKSzqMQXJrelqCp6YZU8mySbQ7bCrqU
         e7IG/MgDVJWIVCiOJAO622Vin7Rs/4f2Efx7IjOi7JHWBLhuYIdle9/JttNrCyeCcxhw
         QMCi/ZXV4xZtErcCIRzrDQQBjdRNKhc5xLB/eUsQZmg+YBP3cwaybkTXUFk7jfhPj18i
         7FSQ==
X-Gm-Message-State: AOJu0Ywq7CT0f5N/Jp7XHV3Qkg7K3x6FDKHBl1LqHvztSG/0LB1LZt86
	E+LRxsq4BI+ey4EH4CCHC8bRFfshcX56znFjgedhTbqHAA74nYunoc1roAx08oZKljXahVsTbEG
	f7xfFsTIaia5ODgtSsAjW2H9D/Mr63jszgxFlOyM=
X-Gm-Gg: Acq92OE57ImCztHWk0MhcuYsIVUnWZ4dtf5v33efSM+JHFvuZ93OZrA2dyV+SgML2Fq
	zmIy3J3o40dP2Wqe/lFswm4nhcSe6TXxYmDAwFE5bsWz9qcyOxfHkXZeOAdapYMD7bzyXLRENzL
	nt4hqjMp8MPw0WoIYOfwJq5QeQJEEnbRN08Ei3HJlHcS2zt2+EW8bwomEV9gnvAl8RGyiffN52B
	yvMCyYRrXaBUNmivnD0dk2ufSVC9thhQ5YwPU9eALWTaUgNcmuCFHDCmsn/cwLCEZQ1P3gK8Etj
	ya1vEA==
X-Received: by 2002:a05:600c:1791:b0:48e:635a:18c3 with SMTP id
 5b1f17b1804b1-48e8e1f014fmr18306935e9.4.1778562345821; Mon, 11 May 2026
 22:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com>
In-Reply-To: <20260429102058.1362965-1-mszeredi@redhat.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 11 May 2026 22:05:33 -0700
X-Gm-Features: AVHnY4Kq57pSzRvHov0wVqjXddRKFwJocV5axrPcF3ro5uRNbecHuRzIiIYEJZE
Message-ID: <CAJnrk1Z_JWtuA3UjucF9=YH63AH_-J_0hzr9jbY99Hx3O8YrAw@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 3:21=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> This stands for "fuse extended/experimental".
>
> The purpose is to provide a clean base for big features like the FUSE_IOM=
AP
> api.
>
> It's also a good way to try new stuff like file handles and compound
> requests without the risk of breaking something in the large and complex
> fuse codebase.
>
> Whether these features will be migrated back into the main fuse codebase,
> or fusex is going to end up as a major version update is still up in the
> air.

Could you explain a bit what the main motivation behind fusex is? Is
it mainly to clean up interfaces that are now clunky/stale? Or is it
more driven by limitations in the current codebase that make newer
features hard to add? From the paragraphs above, it kind of seems like
the latter?

If it's mostly to clean up interfaces that are now clunky/stale, I
wonder if now is the best time given that, as Amir phrased it in [1],
"FUSE is experiencing a renaissance of new features and protocol
enhancements", and I'm not sure if we know yet if these new interfaces
will also have some things we'll have wished in hindsight we had done
differently, especially since some of these new features are still
actively evolving and gaining new capabilities (including io-uring and
passthrough). Would it make sense to let these new features and
protocol enhancements evolve and stabilize first before baking them
into fusex?

There's a good chance I'm missing something here, but if fusex is
mostly to make new features easier to add, I'm not sure I see a lot of
difference between doing it in fuse vs fusex when fusex is expanded to
have feature-parity with legacy fuse. Is there something in particular
that fusex makes easier?

I wonder if libfuse could serve as a bridge for the gap between legacy
fuse and fusex, eg libfuse filling any missing gaps / translating
between legacy fuse protocols and fusex protocols such that any fuse
server written for legacy fuse could run using fusex, which would
remove the need to have to do any "backporting" to legacy fuse for new
features that are added to fusex and could accelerate the deprecation
timeline of legacy fuse.

>
> Major differences from regular fuse:
>
>  - local filesystem mode only
>  - only synchronous FUSE_INIT is supported

Some other things that might be nice:
* handle_killpriv / handle_killpriv2 - sgid/suid + file capabilities
clearing will always be handled by the server (default implementation
in libfuse)
* in fuse io-uring: headers and payload passed together as one
contiguous buffer during registration for pinning, deprecate passing
separate buffers per SQE
* in passthrough: backing_fd passed at lookup/creation time only (not
at open time), expanded struct fuse_backing_map

>  - only no-open mode
>  - new requests:
>    + FUSE_LOOKUP_ROOT - return nodeid of root
>    + FUSE_LOOKUPX - FUSE_LOOKUP without the getattr

Could you explain why it's preferred to have lookup disentangled from
attributes, eg why compounding lookup + attribute fetching is
preferred over embedding the statx directly inside the lookup request
without compounding? it was brought up in Luis's lookup handles
patchset [2] but it's still a bit unclear to me why compounding the
two is better. I think every operation/request that returns a struct
fuse_entry_out uses the attributes immediately after through
fuse_iget(..., &outarg->attr, ...) or fuse_change_attributes(...,
&outarg.attr, ...), so the attributes seemed pretty tightly
intercoupled with lookup from what I could see.

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/CAOQ4uxjRgQGxWYWbRbjVZy19oA5qKZSd=
9eANKyD8yCoBNGPNNw@mail.gmail.com/
[2] https://lore.kernel.org/linux-fsdevel/20260225112439.27276-1-luis@igali=
a.com/T/#t

>    + FUSE_MKOBJX - merged FUSE_MKNOD, MKDIR, SYMLINK and TMPFILE
>    + FUSE_SETSTATX - extended version of FUSE_SETATTR
>
> Missing features:
>
>  - file handles / export ops
>  - compound requests
>  - xattr caching
>  - fileattr
>  - fiemap
>  - ioctl
>  - copy_file_range
>  - lazy dir open
>
> Test server can be found at:
>
>   https://github.com/szmi/fuse-utils
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>
> Patch is against
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#for-nex=
t
>
>  fs/fuse/Makefile          |    2 +-
>  fs/fuse/args.h            |    1 +
>  fs/fuse/dev.c             |   13 +-
>  fs/fuse/dir.c             |    4 +-
>  fs/fuse/fuse_i.h          |    8 +
>  fs/fuse/fusex.c           | 1751 +++++++++++++++++++++++++++++++++++++
>  fs/fuse/fusex.h           |    4 +
>  fs/fuse/inode.c           |   16 +-
>  include/uapi/linux/fuse.h |   36 +
>  9 files changed, 1826 insertions(+), 9 deletions(-)
>  create mode 100644 fs/fuse/fusex.c
>  create mode 100644 fs/fuse/fusex.h
>
