Received: from smtp05-ext.udag.de (smtp05-ext.udag.de [62.146.106.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00B33806D0
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283486; cv=none; b=Gs8Bx7DOQAk1uo6xmJOOi1dcNHzj90IUrFDREqYIzQMVj6UYi08hkIuGV1ubiiO3rVX4bNR+5kMxa0yh4S+of9aSxOcnf7bNj6RTCahLOSzlkifDkaB7kIIX1J+j/zHvKk65KXQFD0HGUVm4pbRnYXfrpmdahmbQGqJWUmQPaA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283486; c=relaxed/simple;
	bh=fdPDgO39oBf4kwIJWrPk50a+l92vbETKojaAu8EGo7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMUinvhIgOyCVYF81TDavbeegtUAqk3o4rbUHbI/NfQnRAAuVu7IUfxiwlfCWUJfYaweRvnAU7frBKCz9YwX/mlOLo6a5VI3KBWu8weZMtPmsSjpiuqyAA/TSzoOPB80b/rPCQFpZbxHL3s+tTH0Kupc31FSsCRduJML5rEH7Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (084-133-067-156.ip-addr.inexio.net [156.67.133.84])
	by smtp05-ext.udag.de (Postfix) with ESMTPA id 14F65E030D;
	Fri, 17 Jul 2026 12:17:55 +0200 (CEST)
Authentication-Results: smtp05-ext.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Fri, 17 Jul 2026 12:17:55 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Haofeng Li <lihaofeng@kylinos.cn>, joannelkoong@gmail.com, 
	fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, djwong@kernel.org, 
	brauner@kernel.org
Subject: Re: Re: [PATCH v2] fuse: honor desc offset in readahead reads
Message-ID: <aln_xvOTDN_xIHFD@fedora.fritz.box>
References: <CAJnrk1ZDc=f1XvRU6j6WsqiSAy75wd1-X2fNRhcK3j-OGDkqcw@mail.gmail.com>
 <20260717032835.922433-1-lihaofeng@kylinos.cn>
 <CAJfpegv=akLW1qzq=B=F11Qfx5Gg8qoRiV4Z-pty-0Og+sU4GQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJfpegv=akLW1qzq=B=F11Qfx5Gg8qoRiV4Z-pty-0Og+sU4GQ@mail.gmail.com>

On Fri, Jul 17, 2026 at 10:56:20AM +0200, Miklos Szeredi wrote:
> On Fri, 17 Jul 2026 at 05:28, Haofeng Li <lihaofeng@kylinos.cn> wrote:
> >
> > fuse_handle_readahead records non-zero descs[].offset when
> > iomap skips leading uptodate blocks in a folio, but
> > fuse_send_readpages built FUSE_READ from folio_pos() alone.
> > The reply was still copied at descs[0].offset, so wrong
> > file data was placed into the page cache.
> >
> > Add descs[0].offset to the request position. Apply the
> > same correction in fuse_short_read for EOF size updates.
> >
> > Fixes: 4ea907108a5c ("fuse: use iomap for readahead")
> > Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> > Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> 
> Sashiko founds some more cases:
> https://sashiko.dev/#/patchset/20260717032835.922433-1-lihaofeng%40kylinos.cn
> 
> This is a large folio issue, right?  I do wonder why fsx-linux missed
> these with the large folios enabled.

I think it probably never occured since fuse_readahead() only fills in folio boundaries?
This could be coincidence or readahead controls 'job'. I'm not that familiar with that code.

I just got suspicious on your question, since I have large folios enabled in testing, too, and
have not seen the case.

> 
> Thanks,
> Miklos
> 

