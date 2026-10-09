Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205AD4A8A1B
	for <fuse-devel@lists.linux.dev>; Fri,  9 Oct 2026 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542415; cv=pass; b=T9eDoxDzeg4aQ480eIoQd9ldeclM190644M/ssQ3mn/LbPm1ffF0jAWA4XnqRq/WVMJY2BBi+v8KRKEhIsHm34DGO/0ZX63zbjjzF4MnL9bApuz4YKxYkcKmWUYCKt38XPJvDCujnX8iWE90+3ZubjlLMoCYtKiYtUlLibXmdK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542415; c=relaxed/simple;
	bh=TdmxEYfYtkSXgsQopCBGSZ8pT5p6msP1oRfZOE4Yi+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHV7CxLzqdLnpO4MyCLSwUuM5xCIKdhXnYQK5xm3z67zJ7RYHCgw2wQJwD3mAx1+P6GM1wpQWiMBVHOXKzOQy/NIePfm4586Q3OzB3lnu4/c/0BDGZOdDiBpcIGeov2MouI9S8wQ/IBNvc2Ug82Pr6+AjbQYy66xGh3Py49oD34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=RCUR+Mc0; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="RCUR+Mc0"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533797e72e8so37064691cf.2
        for <fuse-devel@lists.linux.dev>; Fri, 09 Oct 2026 03:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791542412; cv=none;
        d=google.com; s=arc-20260327;
        b=anDXzc6IIBnsgEFSHvvE5jacJNyTIYMVha6RwLT1uAolbEeCzgp3rAjEbhxbOqCMR2
         y8IbmweeQcgJr2tFSS8+BQHvV/Q2SLPbpv6lWGGXFDf0P/didjX93x2jWW4M0r1eIlm/
         D4pNfOyygwnXoQpwpe0HmJwqVVapsovjNREO62JonfeH+8VaEYkVMkmdqPooardLB93U
         xbcX9uHXTExW8vMTdxmQtHr98NkxGnQOqdLD+7Ne4B+g7tA9C85xfRyk4sZlCQuiTkX0
         8IlNs40+c6em53S8DbsJg/WHcVrdih+8qkxnQNnZzWZdISVT2ExxUMpR3qfTnHv6BiBM
         Ip0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Dj6hvZEw0Eh9ZS8EwZEyRVpYOqz/OSg7EGiwmx0le9o=;
        fh=WIu+dDTQKh8qNIHWhGISAsnLjxdMAfJ0T9Ez7lKSqJo=;
        b=V4tcZFvWIkoPyPKzu42QNUyTQAUPwbIuSEOqMyP875TNTDnOGc5K9dJZ/xg1gpkfM7
         CMlGPOY+EG+m9UYHOYEIGOQuJU1DTT/SydVda+8szE7orgZeswWI9CTGFBVw/YlJRInL
         547fE92JJ4ThcrMXPMIuUPL1rdjqJnV08enluaGRh1R6Ti9WLoag4+IJIF4fYtR/seX9
         QLkjR1ANSBT7rQZeN/EWZBYrnDKVxbsQe/Uuqcoybn/Jz/WlvprIa8VpZYf10jr9qDS+
         1C/gq5V6SjvS86eM6gm9QCM6ZsJjeiIZdn8BrulDwqiSTsnvUCHZ7IpFHZLG5RYvYqHn
         2/yg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1791542412; x=1792147212; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dj6hvZEw0Eh9ZS8EwZEyRVpYOqz/OSg7EGiwmx0le9o=;
        b=RCUR+Mc06oiX9lCu1sHvZ2vZftCHr7fw60m2uDmzLYEe95/EY3lJW0LC6a/+yY7upb
         2zo/UkA1muXGRXJenVZ/Ha5FBcD9migzSzFgTJXrKR/q2asuACr1ULUYa3cKKyDtBpR2
         hfGNmQ4rgRDmwFSL2RbpOb5cNRmx3UrPyckxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791542412; x=1792147212;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dj6hvZEw0Eh9ZS8EwZEyRVpYOqz/OSg7EGiwmx0le9o=;
        b=Ilu5QVNUea5OOofbtHutYZwG4lW/0rghhLrzPgoo6LA9UKhvgYTpl2L/XO77FYPwt8
         z6a3NUEnFwFn1qp7FPaR+XkuwHKsLBTv1IqRQbUYP9SdPQnbfF1YoILhFMhPDOxXez2I
         y2WAAtPW0BRgFPGdRV0zmAYBN2m1kvOfprVCIjScnSEv82i5sNePRiu/W+wWnL7BkqI0
         d8kEOA+eyVFfBctqai1NonXPWxNxARnXQ4ip6mTxDJScGWU5oqPsryxe0IjuxGHoH1HG
         Qv0wkYVDc6qHNVmzkVKam6jdwLed43OthvnUbexU1BspEFiCbJ0b6eAp0a45U6DhNgV0
         xZ4g==
X-Forwarded-Encrypted: i=1; AKwUvBwGSobaclhhbs16Il8AduCoiczPAO7rwT+A/AFjVzqa09IsEhnIByprPkylRZHhg5JUlyk6AuFmn8DJ@lists.linux.dev
X-Gm-Message-State: AFuF++m8QJSA8N4Bb+c4/0AdZTrkV2mJpYI4pyu5mfNzYhsmcryVjj1r
	eyQhbOUxOG6NnVHmxRz8KboJugXn3a54Ur/4Hy44Aex090TIzy8hEjV0ee0IvZRNlI/aupYilW+
	B2XLe/Qwmd4Pa065qgaAaPKz9lZJqV4piSg3n7KOIUw==
X-Gm-Gg: AYBFou04QXiCfHJFSQk7fI5MELwdNxWLMkJ0LG0C/kOVzWpu28KdtwTt1iTjYhSNx9P
	aSt5FiRo/G5hwM6OIwf9Yjwrjwp8MXDB3un4dkY4seZOXyt4/56eA+bWBsdQXbWBefIkgBJbcM9
	rAr3olyowDspM4DUN7npVHFNeZoRiq48+KkCrRBw8RjNBa4SnSOBMWMx5utmuzBD53fIEvxfJP9
	K+a8dDZqlr1uxaXWfcpop488gZPjET9zJrdhj4nMTDSNDFWe9uJdqV9FXVSvA6cHfahtOEtdR8+
	VUnEmLzkyNQyKRgPbBz8K5q/m7E2Q55cpc6N2tvRLW78vi2m4aEBKxuboBn0NPNrw++FJ2ikpjH
	YuLf5e/bj+Ilv
X-Received: by 2002:a05:622a:54b:b0:533:6f90:9e7e with SMTP id
 d75a77b69052e-5359fa918b1mr20240541cf.27.1791542411710; Fri, 09 Oct 2026
 03:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001150935.655979-1-mszeredi@redhat.com> <asQcBebepPb9CXzS@groves.net>
 <CAJfpeguEUTYk9m7g2gZTMui0yFDYWSGL1SZ9PvoYiCqjDmHp9A@mail.gmail.com> <asZcsPT-Q8qga0SU@groves.net>
In-Reply-To: <asZcsPT-Q8qga0SU@groves.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 9 Oct 2026 12:39:58 +0200
X-Gm-Features: AclHuK9bZ1vBizXVx85EODvHCHAG09uRctj1VxFiQmSS5BJHJIYfB0DeoAwYH60
Message-ID: <CAJfpegtZvQsu6gD1-zXvmELcu1-93ZKKEdKHMXqHzChgd_TXKg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] fuse: DAX device based extent maps (famfs)
To: John Groves <john@groves.net>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	Amir Goldstein <amir73il@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, david@kernel.org, 
	willy@infradead.org, brauner@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Oct 2026 at 01:00, John Groves <john@groves.net> wrote:

> Fewer fields is nice, but it's on the honor system that the server allocated
> large enough strips - since strips carry the chunk_size rather than their
> actual size when CYCLIC is set. IMO it would be an improvement to add the
> chunk_size to the header; then the strip sizes could be validated.

Cyclic maps could easily be generalized to not require a fixed chunk
size.  Giving a different meaning to extent length (strip length)
would break that, it would no longer be a CYCLIC map.  It's an
un-generalization that has dubious value, since the strip length is
implicit in either the file size or the parent extent length.

In other words: make the server validate the strip size, and all will
be good.  The kernel really doesn't need this information.

> So that's a bug. I've fixed it locally and will share that in the next day
> or two. I also needed to refactor your patch the famfs user space because
> it disabled ABI compatibility with some older versions of the famfs kernel
> that I'm still supporting users with. If you can wait to patch that further
> until I share an update, it will be cleaner on my end.

Yeah, thanks.

> Having said all that, this topic seems to recur and be contentious - we are
> working on tests that can demonstrate bottlenecks - but my current ask is
> that if I can offer an alternative approach to rbtree that is better on
> paper, can we please use it?

If it's not adding complexity, then sure.

Thanks,
Miklos
