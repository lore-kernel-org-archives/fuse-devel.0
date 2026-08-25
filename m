Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587EC2E7393
	for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 07:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641708; cv=pass; b=F+GQ/ctAMYyEUE5aNuK2j0U5D4MhhHwI4XRZaRRda/vGXhVbs4PN9xYJtefVeOM4WJYvgh2D3bJC6pxU07g9iHr1wg6vpzLAF3XCLzR3EDVrf/hJAgmxtBnAWk2/FchfF0lNonUvqb5PXn3NutXps2ugVjnx43pcV024BNAsyUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641708; c=relaxed/simple;
	bh=YLC6H3tBQW6nRRMf6LiPtQJuL1Ra+q2lA0+1KSYOB+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tM3/sVhzQcMw5jcM02N6eaggpZfncgxIqQBgmwXTgjpTMIQ0H68StKV4IoulzLH49dxr38SSm1YRVBwXm5nKD8MC8ESaZZFJGc9tnILZdKWBiWCd6IFtRwqj8vgg8GNtDewudjc0E17FmeJlj1Js8LlgLuhpLHdNvLjPZvj1ReI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=pfdOuHuD; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="pfdOuHuD"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c2a449c57so25153251cf.1
        for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 00:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787641705; cv=none;
        d=google.com; s=arc-20260327;
        b=dWlOWC23/Akz9IBtHDq82W0D8HBi7NVO0etwbckw0pQ8s+vP8E5XsmUaztEYA/ChTq
         MNnzKU0bKQj2+TLRiBi4oPWTX9vnbMdmwHBi6f9zpSBqWNGjnzytK28kbjhlSWP8/0Hf
         k411gzrjzHRA9D2y2E6iUNGbOla1+XUfPP/VH53Vfsnaiqlp9Cv+aKuJuAeID0ndrevG
         c3nPGvPj0lsK7advW13WQn/bnZ/tK9rWoU9rUWQfAg3wYfG7q8bdJ9xgeLR0wpKElBsv
         /A9LjUJN4lAeDfmDTOD95s3l7BCofyhNJgDHq1HO9zePUY8NsI6y/sSiGfA29DWiFKE8
         gkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FUPUaRwtppzW7Cz0zNlhCOY1JMoitTGaOwtquxqzhgM=;
        fh=RMaa32ya7R5keqWNS5yuxv72JQ59GTREybtwLF0ErW4=;
        b=iD6HHeSMrkDy8huqoTlBXyFK5Wnu6P+SKjjwaebdQ1W2QavwqBwF+D8WBcxI1DqEWh
         6AskzpeCJ8w1lIEEtD8bgY6zoa2LRrtBs0KSAqp4Yh2H9J3DKRGvQRkxcu2y5tlRmMnv
         m5FJ5bZY4w7pHRm+wYO6uI9pVqzPb6j9cv4VUtx8ru1HwnT5ITozQ37/KOdGI8ayZjhv
         v30glmzPDm8SwJ4UTnosqcfDLr5WHo8ECYhNTeCMzFT3t11HJ/piokuZSK0KeCINMR2R
         6vGo00VuSYwnlboV6WXgdO4oOGgP4ubQkYeU9rEdMZXaAVB2KMKRjGEB7tBLiWaXAm0E
         QgFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787641705; x=1788246505; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUPUaRwtppzW7Cz0zNlhCOY1JMoitTGaOwtquxqzhgM=;
        b=pfdOuHuDUzJo2ABIpQb2KNsGGY2kDgub2TAc0enX8zzameZRVhgv7TrZc9DtP0p+wN
         /xgRpH8WeI1bQgbhLnbKx9yQbzxVvJx27mnMGpFn/qqwG3DvyYRhhAADO9uUdfpKCjEt
         /TDhLagkSjQ8GqGButPqlbrmOMpEUDpNmHKAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787641705; x=1788246505;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FUPUaRwtppzW7Cz0zNlhCOY1JMoitTGaOwtquxqzhgM=;
        b=LtwLtLC9hBrFZeffRP8cc27bUC0ZLRjLKg3BFzVlb4iLg1Dfq1ObuCL00aW5gxRR5P
         fJZk0WEzd0ccfoyRpgCUjLwG/2YeVIk4dM0fd/2PSNdQSfVy/g83zBhYd0O3kWVIgaJH
         9FVuMkErdY4iUqJ2tlcCFf7bHNFVEQ7fwESj/g1jAmrf6bmxt6lwYcjDPrhb7+/xtB1C
         9MmdE6wBEsKLkxa26yWYKcqz8mNtLUDLuKhKaetpCFbTws4U9n6IO4w3KmRAMvHtDkgF
         +FSL8gzn+PyHpw3xFBOXsIRoLHgGwBtkVKSovXUY0q1mV7JhIjssgxN0tkFAm1tzwLRt
         lqFw==
X-Forwarded-Encrypted: i=1; AHgh+RqSq7CnKy1D398Qmns8MS3Gh2WzX+IlQvuDtupe5y8fHqAXhDXKVRkCZYROssum0Za0vWyRrqv3oJwH@lists.linux.dev
X-Gm-Message-State: AFuF++k8+j2bpCB6hWe0wttk5RWPZuewAI8lNJBeoA2N8lu43J8J+yKQ
	3sy3ZXs9vtGg8goIH4LeEA4jVXpe3DOlNlCT8ZlUA4ehQLTgtTAHg/+VTciIutrGQmFhvYu4fgL
	h8aHRKiNoVg9YsKFhiuVDhKH5bYxTsgpmkztdcce5bA==
X-Gm-Gg: AR+sD11/fgEJ0705YCgC/9uv3xc2S/LgxX5fvfVoBcVJDRV+ylnbZAOuSHCYREGx4vv
	VnVYLGyKfyP1sY7ftahE+xMh31AdqHAv+DYzg8V34X9cNtBsNjAmInGNPgDqLbFDHffO31VoUs9
	zHuurNVBNfWOuzI7uJfJe57g9EwTB6QKMWIDA/Ln+qCJH4woyNBoGQjROVU6hTvScDounrxqLu4
	bQfz88x0txWec1ADmAxxDoBPD/uEV83ALQjbEOzXB1ACglhvwCnQoBcDs8qC4VAlA2WzWn6AFpb
	X39q/1Oap1t8L/yVC4lMOkG7Jprujl3KaU2n9cDnn0vCfZdpMaV31yAioFNlI6EcyyGt1MI2gMk
	W6Qg=
X-Received: by 2002:ac8:5f53:0:b0:52d:6afd:7db5 with SMTP id
 d75a77b69052e-52df59ec0d3mr342600351cf.25.1787641705339; Tue, 25 Aug 2026
 00:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820193343.3852967-1-willy@infradead.org> <20260820193343.3852967-3-willy@infradead.org>
 <CAJfpegvP3i8ZJc2T=+f4rAhZ4E1QcT5+jC6mQPLxtB-yoK9Brw@mail.gmail.com>
 <aoxHOSC9kTPbKeNq@casper.infradead.org> <CAJfpegv3Ak+qNLb=fTSCSz7-taQ3Ui-Hkmqgn4PaGPe=CR4cbQ@mail.gmail.com>
 <aoyKxvdQdeJQfPHj@casper.infradead.org> <CAJfpegtgenUaudDcvecJuV2_WkkVw=gdcB0Eqg=UFKPMZP1uKQ@mail.gmail.com>
 <aoyt5pL7mXYwSqsG@casper.infradead.org>
In-Reply-To: <aoyt5pL7mXYwSqsG@casper.infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 25 Aug 2026 09:08:13 +0200
X-Gm-Features: AcwNN1VLOxg4TFDsQzXPHVySuwqrEIZSjxOFz1CuAgo80c2cUSWOrt0F79eOWzI
Message-ID: <CAJfpegv_SKhArUNBFUtsmkXSn+JzYgOjhFOqVf-Yd9MnsjBY_w@mail.gmail.com>
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

On Mon, 24 Aug 2026 at 22:47, Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Aug 24, 2026 at 09:33:03PM +0200, Miklos Szeredi wrote:

> > In the second case filemap_write_and_wait_range() won't write protect
> > or unmap the page, so it may become dirty after the writeback.
>
> But that can also happen in the first case.  page_mkwrite() can be called
> immediately after the folio is unlocked, for example.  Or the folio can
> be evicted and replaced with a different folio which is then dirtied.

Let me try to make up a very concrete example.  It's not realistic and
very unlikely to exist, yet something more subtle might be relying on
this behavior.  I don't know.   At this point I'm just trying to show
you that the two are really not equivalent, not that this has any
practical significance.

Let's imagine a distributed filesystem based on fuse.  It wants to
serialize accesses to a file to avoid sub page writes reverting to
stale data on cached writeback.  Cached writeback is unavoidable in
case of writable mmap, so it tries to handle this case correctly by
totally excluding cached aliases existing on different nodes.   If one
node reads a range of pages, that range is invalidated on all other
nodes.

The below example show store to a single page on node A and B with and
without launder_page, starting with both having the page mmapped but
not yet in cache.

1) with launder_page

store on A
  - send READ
  - server checks that no aliases exists
  - returns page
  - page is mapped in address space and dirtied

store on B
  - send READ
  - server sees alias on A, sends INVALIDATE
  - INVALIDATE is processed on A:
     + page is locked,
     + unmapped
     + data written to server via launder_page
     + unlocked
  - returns updated page
  - page is mapped in address space and dirtied

 store on A concurrently with previous store on B
   a) happens before page is unmapped:
      - change is written by launder_page together with previous store
   b) happens after page is unmapped:
      -  page lock waits for writeback to finish
      -  sends READ
      - server sees in progress READ on B
      - wait until READ on B is finished
      - sends INVALIDATE to B
      - ...

2) without launder_page

store on A: same as above

store on B
  - send READ
  - server sees alias on A, sends INVALIDATE
  - INVALIDATE is processed on A:
     + page is written back
     + unmapped
  - returns updated page
  - page is mapped in address space and dirtied

 store on A concurrently with previous store on B
   a) happens before page writeback:
      - change is written together with previous store
   b) happens after page writeback but before unmap:
      - since page is still mapped, store succeeds, page becomes dirty
      - at this point we have differing cache contents on A and B

Thanks,
Miklos
