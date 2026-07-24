Received: from smtp03-ext2.udag.de (smtp03-ext2.udag.de [62.146.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6535A3126C0
	for <fuse-devel@lists.linux.dev>; Fri, 24 Jul 2026 11:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784892262; cv=none; b=eh28JaQT7Avzp591tprK6Cd41LIcnujLxM1iRQOsdTCOUsh+C7E2yAZY1Za3hvZbI5SOLV/o+FsdmFIzv52FpfdwlQSJuH3SjEG/lLwhHIFk7VjtjLO7/jwlWg3Pe/tr2Gugy5brm3KY8SGJ2st0uKnjxMV2YRzF6dh3xhhXNmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784892262; c=relaxed/simple;
	bh=CkGRBCKXu4fB5rrNnXLorD+oyEEHEWOQleo3VYdlXWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qn9c5XCyfrsihoKGK+a1VUwcZpM6crLTPXIueHTG/pYuhvHYAIYQsh0e/x5VZ1Fc8r3JbrF9tPlZ+eAky+NFtjiGUupmLV1tODKzx+wHhXVXYvf/jMQ4eEQW3Z7/MY/zz0p7aJV9RO4sn2G7jB0T1a6Pa9GMzKleAvHt7LdMrYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (084-133-067-156.ip-addr.inexio.net [156.67.133.84])
	by smtp03-ext2.udag.de (Postfix) with ESMTPA id 0DECDE0262;
	Fri, 24 Jul 2026 13:24:06 +0200 (CEST)
Authentication-Results: smtp03-ext2.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Fri, 24 Jul 2026 13:24:05 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Yichong Chen <chenyichong@uniontech.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Niels de Vos <ndevos@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] fuse: skip destination updates for zero-byte copy
Message-ID: <amNJuklWlOcoshrq@fedora.fritz.box>
References: <20260723100743.93881-1-chenyichong@uniontech.com>
 <CAOQ4uxjys+yENYgjROu3Ui-athFjdY0E4fGhR4qsb2ed04wqkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxjys+yENYgjROu3Ui-athFjdY0E4fGhR4qsb2ed04wqkw@mail.gmail.com>

On Thu, Jul 23, 2026 at 12:43:29PM +0200, Amir Goldstein wrote:
> On Thu, Jul 23, 2026 at 12:15 PM Yichong Chen <chenyichong@uniontech.com> wrote:
> >
> > __fuse_copy_file_range() may receive a successful copy reply with zero
> > bytes copied.  This can happen even though the VFS only calls the file
> > operation with a non-zero length, for example if the FUSE daemon reaches
> > EOF while the kernel has stale source size information.
> >
> > In that case no data was written to the destination.  Do not invalidate
> > the destination page cache or update the destination timestamps and cached
> > size state for a zero-byte copy result.
> 
> Why not?
> If the FUSE daemon reaches EOF and VFS thinks that there is still something
> to read then obviously the cached size is incorrect.
> Also invalidating the last page cache in this case does not seem like a terrible
> idea in any case.
> 
> Are you proposing this "fix" because an application encountered a problem
> or unexpected behavior or why?

I agree with Amir, but I think it is worse.
There is no check in that function for len not to be zero.
So if something calls this with len set to zero, we expect it to either do it 
and call all the updates.
Calling the write and react on the result without knowing if this was intended doesn't
look right to me.

Someone might actually call this with len zero.

> 
> Thanks,
> Amir.
> 

Thanks,
Horst
