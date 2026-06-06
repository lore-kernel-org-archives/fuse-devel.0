Received: from smtp03-ext2.udag.de (smtp03-ext2.udag.de [62.146.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587F627A462
	for <fuse-devel@lists.linux.dev>; Sat,  6 Jun 2026 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780767067; cv=none; b=Z5R/p2xZpNAqi305x5KrKcXZx1Dg2/Q31pfoqDTI9X1Qp7tcYu70WP9LcPPkSn2SDXNmIWL0DSb1Wu5RX4X0XrYPwjxWB2uYzWd++SM80HUYgb2Nc/xcEqUc/prYyBA/0XCz9zzEE6F1ufI6OBD3KQxUZJREmtbp8aKp2wNtZfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780767067; c=relaxed/simple;
	bh=hzCgKALMgwFlTyD4kxLfOdIfOYdIR49p5aFRQ/jS94A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3jeiXpp7cazKP9kUDpl8Cg6rKLrh5lllGXe5chnyU08OS/egXpwNXutlgv+3fDvi6Og3V7jjiqjR4FuE7MuKY5xl6+MdxxNqesjG1AljeAcBBaRnatMIkxOf5rdwKangqSFhhFLaHKbd2rP2rl57F6b8bAfDV+QXfKOwzqRk2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (065-142-067-156.ip-addr.inexio.net [156.67.142.65])
	by smtp03-ext2.udag.de (Postfix) with ESMTPA id 4D752E00C3;
	Sat,  6 Jun 2026 19:30:56 +0200 (CEST)
Authentication-Results: smtp03-ext2.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Sat, 6 Jun 2026 19:30:55 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Horst Birthelmer <horst@birthelmer.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>, linux-kernel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, Horst Birthelmer <hbirthelmer@ddn.com>
Subject: Re: Re: [PATCH v7 1/4] fuse: add compound command to combine
 multiple requests
Message-ID: <aiRO6mUV7cK4HDNg@fedora.fritz.box>
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
 <20260604-fuse-compounds-upstream-v7-1-27331d085c2a@ddn.com>
 <CAOQ4uxhGGUroMpTdLUEdKZd-=uefVoQW6Fm5_WX2-6S9T1TUmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhGGUroMpTdLUEdKZd-=uefVoQW6Fm5_WX2-6S9T1TUmA@mail.gmail.com>

On Fri, Jun 05, 2026 at 09:41:00AM +0200, Amir Goldstein wrote:
> 
> TBH, I did not look at NFS/SMB compound protocols, not io_uring
> command chains, so I would appreciate it if you include a survey of the
> state of the art in other protocols practices for compound commands.

I think the NFS compounds and FUSE compounds have very little in common.
Except for the the name ;-)

NFS has a tiny stack machine in the compound engine you could write stuff like this:

SEQUENCE(sessionid, slotid, seqid, ...)
PUTFH(parent_fh)        # CFH = parent dir
SAVEFH                  # SFH = parent
OPEN(name, claim, ...)  # CFH = opened file, returns stateid
GETFH                   # return CFH so client learns the fh
GETATTR(bitmap)         # attrs of the opened file
RESTOREFH               # CFH = parent again
GETATTR(bitmap)         # attrs of parent (change attr for cache)

With the latest changes, I had to get a liitle bit in that direction, but I
would hesitate to even compare them. I don't think we need somthing like that
for FUSE, even though it could be useful, since they can be atomic or even
transactional AFAIK.

I don't think there could be conditions, though.

My first approach was to bunch the FUSE requests together and send them together
to userspace via fuse_simple_request(), nothing more. What made this more
complicated was the later requirement, that we have to do call the requests separately
if the fuse server does not support compounds or does not support this particular
compound.

In NFS if you get a minor version mismatch the server will fall back to a smaller
version. This is a little bit like what we do here.

Further, NFS has a map of supported operations. ATM I don't think we need that.
I would rather want to have a map of combinations we support, since my whole
motivation was, to be able to implement optimized combinations in the fuse server.

FUSE IMHO wasn't designed for this. 
It was designed to send the requests to the server and wait for an answer for every 
request, but with io-uring you actually could have a bunch of them in parallel.

---

IO-uring command chains I rejected, because I did not want to tie this to uring.
But with fusex, this is a whole new ball game.

AFAICT, the uring chains (or lately there were groups introduced) are just commands
that are linked together as a sequence. IOSQE_IO_LINK means that the next sqe should 
start after this one finishes successful. Our compounds are probably more related 
to uring groups, but there I don't know enough about, exept that groups can share 
resources, but I have no idea how that works.

My compounds were more of a semantic grouping, where the fuse server could provide
optimized implementation of the whole group request. At least that is how I use them
at the moment.

> 
> Thanks,
> Amir.

Thanks for challenging me to actually compare these. I haven't done this before since
it was something completely different in my mind ... and to some degree it still is.

Thanks,
Horst
