Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3B434E764
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 01:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781572527; cv=none; b=XyoSuOTn2lnWOm3KN4THPFHmpTDDZw9q3mkP/omYO+ipAH8HwoxhXhd87aG8OHv3tL7vJpYFOsZSkmaIKOP9r1SJx+kKLdqx7Lrr6VtkyJ4g0mYOQfqw0lB34Du1hdy1JADUGJNjsgszHz3a4/3LMbCcc85r4k27ROSeOCRvWSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781572527; c=relaxed/simple;
	bh=qSWoZgNw3PpVwHOk9/H/f2RnG3uRakwqaf1M/1PGtU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G75odQ7rRWpw3CyKpgJKo0X8rqrI8oQnS3Mo6RvqSW+5WrJgn3rwC7Bu2LA2Iv/aURa4cwbm0FS1edjHV6Xaeha9VDgJDyhuicAauM6zvH2lRl7mPkg0QeDxviY/eUU9/D4MgckUXCREtlE3CogWApdnmw106bKVKuoUpM4h1P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bljNPmjL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bljNPmjL"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b3637b90so30177115e9.3
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 18:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781572524; x=1782177324; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53973eSawR2ZjjRuPt5kDFsVlZ1YHqdNePsF+6+pfeM=;
        b=bljNPmjLs1lGBwjb3GD3PjkBsFiktN/LU741oyYo2k0jo31hktcnv2UhjWFBtHupwd
         Rf4ofmQk7paZ7oiyhlrl2kepldm7c3O4B5D1+bsZRJg8vQ1i7ujUtmqHELf7kLKXZhyT
         TNff8JE31GfMjCA1asvB0rpWb2WgwngX54bOKd8BwYl7zzOwINAUEJcHFmBEIm/RlYeU
         mSen/dFh4coOoTsIahggC/GXAleUBIRTRnkOzFZkEFqq/gP9navWlEautzKWxKaOgThm
         PaC9pJt24w7v3IZX7InB6KVEqa0ZPeY/EGitl2NLwQ0oVvD+Ok85OFJ+ux+Fr4J9Yp9s
         YWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781572524; x=1782177324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=53973eSawR2ZjjRuPt5kDFsVlZ1YHqdNePsF+6+pfeM=;
        b=kS2/kyg83UEZuTxEwJqfGOzOBxTFs6ZYlwv3nb0RkNMYdjQ/+COT6xy7FczzNaVLdV
         CV9JwTJVl01++NOvyDDsk1eecXZ0bOn1lXlEr+nIEG595eKn/RJsweg9QxhvWxfqCkp/
         DR2FF5h0SjF79bEpGe+n4AWo6+sVylKjY6km08ZiOfeu58OM7CMSZe9okuWHKNj8s6ZI
         rvhx9hTXRV4bZuRvefc79c8QZOLKCen+5zIpt6oOC5c/XXhjVM1e5emwOwowQvmRxdBl
         Oqs3a0LQILvoV9DzV9ZqNz4Q1YsmcKT1p5Ou7USOq3IczxnGfU+KX2fqVFBVtIdzaSjn
         g/aQ==
X-Forwarded-Encrypted: i=1; AFNElJ9j89VZ52U0iYXvVAvfZZw3teYeewoM9Oat+M2LfUZ5jS71oJLsG+IWMv7dmokURxcv6gROP7eK/go2@lists.linux.dev
X-Gm-Message-State: AOJu0Ywse4NvmOBfbzfh5IYSOL6nKoVF3OXfYkmsuQFd0dZ9LI7Sr60f
	sAboep/cDLacJE4dAx2cfxWnuwJeZQa/36+5oswgKs2g5kz+zCaRoiUS
X-Gm-Gg: Acq92OGFGp1eoK22UBC+J4XQdm2sHqWlFphfBG/V0BlFHCvd883V+W3twAIX7TulyB9
	nuWaUQkAWqz+aFj3HCSx9hX8k6EdCZLJQ/Lzba5slOZCZiLd2rSGJcUiUT5HQ9eb7zfz+szFEZb
	+RxW5RLAx+SNfoxNc1nKuzUnGe0L32RO80Bo9m/ldXR0/IYStAoOSpKRyDbyCh3Zr6hOMJbfih4
	sXDxcX7zYHPZF9fJrkSdGnX38RnlPaG8917t7XAUvCmDYnUUbzeztmMf8EaBLH4hUjHlZAog6fj
	IAm0jn68UnY7d9Mwub6eddgrwubF0xtMYE/qwu+wwDvV+58QUAwIARWEQ8ClImSPRLi6FNhQaW3
	BIl+GxNHNabo1KAaduFPE8nZbx74jYs/TGcqKw8lGTNP+yxZjRCrGeqmYkLj4lKWLqwWenit803
	B9WTdvRzhSAOLl/z4L/bA=
X-Received: by 2002:a7b:cd0b:0:b0:490:b2c9:e284 with SMTP id 5b1f17b1804b1-49220143bc6mr120782165e9.30.1781572523711;
        Mon, 15 Jun 2026 18:15:23 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4922fa47da9sm43123095e9.5.2026.06.15.18.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 18:15:21 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: joannelkoong@gmail.com
Cc: akpm@linux-foundation.org,
	axboe@kernel.dk,
	bernd@bsbernd.com,
	brauner@kernel.org,
	david@kernel.org,
	dhowells@redhat.com,
	fuse-devel@lists.linux.dev,
	hch@infradead.org,
	jack@suse.cz,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	miklos@szeredi.hu,
	netdev@vger.kernel.org,
	patches@lists.linux.dev,
	pfalcato@suse.de,
	rostedt@goodmis.org,
	safinaskar@gmail.com,
	torvalds@linux-foundation.org,
	val@packett.cool,
	viro@zeniv.linux.org.uk,
	willy@infradead.org
Subject: Re: [PATCH 0/3] vmsplice: make vmsplice a trivial wrapper for preadv2/pwritev2
Date: Tue, 16 Jun 2026 04:15:09 +0300
Message-ID: <20260616011516.4039110-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAJnrk1Y9egYizkx1H9K0cqxSYuB+7vLvQbV7Tf4C5eHFqnnC-A@mail.gmail.com>
References: <CAJnrk1Y9egYizkx1H9K0cqxSYuB+7vLvQbV7Tf4C5eHFqnnC-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Joanne Koong <joannelkoong@gmail.com>:
> > speaking of fuse_dev_splice……_write actually, this series has broken
> > xdg-document-portal!
> >
> > https://github.com/flatpak/xdg-desktop-portal/issues/2026
> >
> > Specifically what happens is that the EINVAL is returned due to oh.len
> > != nbytes:
> >
> > fuse_dev_do_write: oh.len 16400 != nbytes 15526
> >
> > (where 16400 == 16384 (read len) + 16, 15526 == 15510 (file len) + 16)
> >
> > After reverting the series, there is no error because oh.len
> > becomes 15526 too.
> 
> I think this is because of how libfuse handles eof / short reads. When
> it detects a short read, it fixes up the header length after the
> header was already vmspliced to the pipe because it assumes vmsplice
> mapped the header's page into the pipe by reference. It assumes that
> modifying the header length in place gets then reflected in what the
> pipe later splices out.
> 
> The logic for this happens in fuse_send_data_iov() [1]:
> a) sets out->len = headerlen (16) + len (16384) = 16400 in the
> stack-allocated fuse_out_header
> b) vmsplices the header to the pipe
> c) splices the backing file to the pipe. if this hits EOF, it'll get
> back 15510 instead of 16384
> d) detects the short read [2], fixes up the stack out->len = 16 + 15510 = 15526
> e) splices the pipe to /dev/fuse
> 
> After this patch, step b) is a straight copy which means step d)'s
> fixup doesn't modify what's in the pipe. This could be fixed up in
> libfuse to not depend on modify-after-vmsplice, but I don't think this
> helps for applications using already-released libfuse versions. I
> think this patch needs to be reverted.
> 
> Thanks,
> Joanne
> 
> [1] https://github.com/libfuse/libfuse/blob/master/lib/fuse_lowlevel.c#L846
> [2] https://github.com/libfuse/libfuse/blob/master/lib/fuse_lowlevel.c#L956

Uh, this is very unfortunate. But I still want to remove vmsplice.
Maybe we can somehow save my patchsets? For example, let's return EINVAL
for this particular combination (writable pipe + SPLICE_F_NONBLOCK).

-- 
Askar Safin
