Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD4F32B9B5
	for <fuse-devel@lists.linux.dev>; Mon, 24 Aug 2026 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787599998; cv=pass; b=VcpDIvsVoYJ0wAK0sCohMY6tT4nJ+dqQskIH1gU/4EDYe8GIWmmFCRHfYXupdtz8XBdwGj/l658mPJVHxEqD0unBDLzDfGg0f3hsVF1LJgisvdyaAm6BrKsPVCvqBMcDpBrdmO9CzHCqjz3hDZST832x5V9wuz5Z2tVTiPfw+S8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787599998; c=relaxed/simple;
	bh=6nzgFXxKsg+JnpSIQP0/wxVzDkLsa2CzNa+jLf/mGAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EgkWmaYUnLs2EOjdDogpXXgXYXehYBI1w7wX2BOX9J7qe1MmQbawJKb2ZVxusD1O+7oyVC6p4Ls0/pdbLHYzqmfY/WbYQWRJFmFrk3c7+u5TyTl5HvW3P+ScNuTrbwp65Y/NnIjx4s0oMQWI0V60m1ZE0z/YI9LKUq1yC62z+8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=VzdF1CqD; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="VzdF1CqD"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c2a449c57so22430701cf.1
        for <fuse-devel@lists.linux.dev>; Mon, 24 Aug 2026 12:33:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787599996; cv=none;
        d=google.com; s=arc-20260327;
        b=CEySLLQb3P2dbaOYnrvIt7DoMUcz+R7X3NqS6cYRb5K2wIuh02w3oiFhDiZfuuabFF
         5sYdF1zeEPtNXyL7sQ5ozTFenrLsuYlcVJNMqjDTbVPmWEh/qDP169KKq2B08w9q1bTQ
         P5PijNKIQUT6w1VaYdyfftjEQz6ceKpvgvDiuuCqsRt9aqmwKXskGXxfy4nKAFi0ipjf
         rGZNaFY/fN7+YoNwA65bWjJsiE6Ug18nhfYnyO0ifIcw5oB4qFmnB08INRw/i27cliqI
         hEFRPsn63EEpwAz3bVYvZgi/ov+Aml9yIR0JgamFEYwt+/00Unwozjub5OuCgTOterIs
         +giw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DK1kq+UORspwzlcL44O0F5OA7o6ZQNGRnMf+1R0tFOc=;
        fh=pO/b9HzhzkjqVkdFW2Sb2LvnUSgvxazIfdirH4MaSIg=;
        b=QGne7o1T+RC999zd19uH/AApQvDbMgMm183HYAtDYC+cizDNdCJgngeCAsuqCr3Wu9
         L+60Mnleoiv3UJ9MnT7zCMMHm7+GNzGa7md7X/PfepmBGxpRUd6RJDjUi2YvjE/fyZ57
         VXLolzFkWlksooRHH2jTRakrSy3DJt3fA6L4WpRrRs1DvJ6uRXsuhGsIc/OHUFltFafI
         P0kohQohu7XKbZ1xrMBr/LlDjRugPe/7cZAPPkdiYM2OZRmRiS/8mTyYlvyObZ2Yh5w4
         9TY7LtPnl8pSxayAyJCU6CvPOg+Zf0ausCrISJZ4uVJWj29LRvTayHb7d8IfuDrY9kkV
         sxng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787599996; x=1788204796; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DK1kq+UORspwzlcL44O0F5OA7o6ZQNGRnMf+1R0tFOc=;
        b=VzdF1CqDo3GxEUxdbO6HZetkS4OpxiXYJBYET9yCUyq06pHMwM9ZP2l61f/aNOQcsk
         2S8JZWoJ3TfKbuw8E+NF1mMXuRwhVeNrWKygC0pXRPzuKawwrOviVXce2FkegGkLOAKM
         Ow6DQ0ojrKTZ/7P8L7UGgXAJw7nFMP49+bVnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787599996; x=1788204796;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DK1kq+UORspwzlcL44O0F5OA7o6ZQNGRnMf+1R0tFOc=;
        b=leX2L9tY8t8y6BFdZ4ISjXbvQKIInGvbKnd3+I3NWBd1O1s/HZTirL1na+2f2atzM7
         P9QOIkX9/cYwkdbvkAYQS/pkVeUqRstKf5slMtSzzfH3V8s5E/flMwQQBJNaBIDFY6A8
         I+u0+1uMSssiaWZMO41TtO14bQTSWfnVfB7Q/kGVdfsfNhdmV6AxyuAa0ohl28D7ZEGz
         c0KRI4ZVdRajnYUNXRtbzlu/4IoBxjeoSMDOXmzSQ8dJzwP3co1SNq1dURL7mtL33+Nn
         ob8zT17wY2D76INs8x+mL3TKwT9LkHTzH2Az4xcMy38qOrcCBDcblkADz1k4f6wuRrcd
         lQOA==
X-Forwarded-Encrypted: i=1; AHgh+RrV3nlkDCM15i3D5DVZGYfYkfJra5ffBrMe8AV7hBWI7Tt+VrJ7EdxBhK9FixD/3xIDp5hHzutN53ky@lists.linux.dev
X-Gm-Message-State: AFuF++k4ekASNUhhhzVGQwItWag5SHFBHlGsP9//QaszBuBbTiwkrxXu
	pa1cqIc2yI7DvL/ID5ne4gTciZVjSZmVKdJtivrsGyRtzco1K5mVAunQ2UeVitfi+HUS2MU4D/6
	xOivS63Hvk4rSavg1g238orgAGxX6n2Q68iMSNQJdlg==
X-Gm-Gg: AR+sD11dnvElLHsyYTMy1nj9waEsf7xBTzabDlAuMK0pc00Mr+55clrxQQSeR1T7iXO
	rNOKgOS8bpCQ2AQyNzZy5+fNTkqTgQNmfgu5MWpx2yvMd/SMhbLRPJ5mighZZ/mxZGWiE5nBkLv
	hvMQgJZUbRZrVOsfUIp98ORo/ecJ98sxE2dMj11UCV5Ic47v3LdN0us3OfZZHwI0hCioTDmEqwO
	puEuJAa0NwKXBf9psQdPnYo+XPx4horw13PlqaUlnfqPFYwxuzmlRjOiyjWgQ+uEWOfrS+TUWKg
	CtAXmkJKXmGiuF2GmVFuRDlXYclLlbg3FAIwcjACnaEB4BaKpmDa764vZmbxB4I8djrZilO1HCG
	zGdE=
X-Received: by 2002:a05:622a:411b:b0:517:78c7:d93a with SMTP id
 d75a77b69052e-52df57324bamr286714031cf.16.1787599995881; Mon, 24 Aug 2026
 12:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820193343.3852967-1-willy@infradead.org> <20260820193343.3852967-3-willy@infradead.org>
 <CAJfpegvP3i8ZJc2T=+f4rAhZ4E1QcT5+jC6mQPLxtB-yoK9Brw@mail.gmail.com>
 <aoxHOSC9kTPbKeNq@casper.infradead.org> <CAJfpegv3Ak+qNLb=fTSCSz7-taQ3Ui-Hkmqgn4PaGPe=CR4cbQ@mail.gmail.com>
 <aoyKxvdQdeJQfPHj@casper.infradead.org>
In-Reply-To: <aoyKxvdQdeJQfPHj@casper.infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 24 Aug 2026 21:33:03 +0200
X-Gm-Features: AcwNN1WHKWPg-gulrL_ybc1YuKIIGquGv3tDzpc2zs94XwMFk4U-dS3q1iLbtfs
Message-ID: <CAJfpegtgenUaudDcvecJuV2_WkkVw=gdcB0Eqg=UFKPMZP1uKQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] fuse: Use filemap_invalidate_pages()
To: Matthew Wilcox <willy@infradead.org>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Chris Mason <clm@fb.com>, 
	David Sterba <dsterba@suse.com>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-nfs@vger.kernel.org, 
	devel@lists.orangefs.org, Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026 at 20:17, Matthew Wilcox <willy@infradead.org> wrote:

> Before:
>
> fuse_open()
>         invalidate_inode_pages2()
>                 folio_lock()
>                 folio_unmap_invalidate()
>                         folio_launder()
>                 folio_unlock()
>
> After:
>
> fuse_open()
>         filemap_invalidate_pages()
>                 filemap_write_and_wait_range()
>                 invalidate_inode_pages2_range()
>                         folio_lock()
>                         folio_unmap_invalidate()
>                                 folio_test_dirty()
>                         folio_unlock()
>
> so what's the serialisation that the filesystem can perform in the first
> case that it can't perform in the second case?

In the second case filemap_write_and_wait_range() won't write protect
or unmap the page, so it may become dirty after the writeback.

That can't happen in the first case, since the page is written and
unmapped while under page lock.

> or alternatively, what's the serialisation that would be useful by
> adding a lock/unlock of the invalidate_lock inside
> filemap_invalidate_pages()?

Nothing.

What would prevent this if we'd have writeback + unmap + writeback.

Thanks,
Miklos
