Received: from smtp03-ext2.udag.de (smtp03-ext2.udag.de [62.146.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8108B4D8D87
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659112; cv=none; b=PVTzxIT4B6oixcTqCqX2I3+gh9ZfRjsIrSm5Zw3OuOIzVd0Dk/OqpNM6BYpPZHkgBQaT9rwLRDoqOZ5RFSw0NSymi3h+zBL5EdKXJ1Mcih83qOz9B0LIOPyrhCeznPp/OpTaMJH39jfsULdqjSZLdqwLo3zpgzN3e0SZHDxURhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659112; c=relaxed/simple;
	bh=52cOt3lCMLPqkOKr0GVwpxlBpKZ0bwzcf7TIJR6ud2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJZz11NJ5f7qfMP7PQ50FQcjwlfVl+JnNco5tg7WLQPfjFBJe56AkNkM6SK6nxjqEzZnGhN1vZWzW5a5iK6IVI3txgupI4VpJTTNvD9lthHffS4Pd3TPQkJdAqFrAC/l8giCDqjeSUZO1TIV80zFyW48EK0YOZkfY5tk8AQryH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (065-142-067-156.ip-addr.inexio.net [156.67.142.65])
	by smtp03-ext2.udag.de (Postfix) with ESMTPA id E836DE042E;
	Fri,  5 Jun 2026 13:26:13 +0200 (CEST)
Authentication-Results: smtp03-ext2.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Fri, 5 Jun 2026 13:26:12 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Amir Goldstein <amir73il@gmail.com>, 
	Horst Birthelmer <horst@birthelmer.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Bernd Schubert <bschubert@ddn.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Luis Henriques <luis@igalia.com>, linux-kernel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	Horst Birthelmer <hbirthelmer@ddn.com>
Subject: Re: Re: [PATCH v7 0/4] fuse: compound commands
Message-ID: <aiKyBRwlJyW2jq4e@fedora.fritz.box>
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
 <CAOQ4uxjCKFdxryKeLQw3M4C7Jn8tOQzUELqBSu8s5nOU37m4_A@mail.gmail.com>
 <aiKGgCRxCPOavEnu@fedora.fritz.box>
 <a02168ea-549d-4683-8565-08a39b64eb7f@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a02168ea-549d-4683-8565-08a39b64eb7f@bsbernd.com>

On Fri, Jun 05, 2026 at 12:49:55PM +0200, Bernd Schubert wrote:
> On 6/5/26 10:49, Horst Birthelmer wrote:
> > On Fri, Jun 05, 2026 at 10:12:59AM +0200, Amir Goldstein wrote:
> >> On Thu, Jun 4, 2026 at 11:51 AM Horst Birthelmer <horst@birthelmer.com> wrote:
> >>>
> >>> This series adds a single new opcode, FUSE_COMPOUND, that bundles a
> >>> sequence of subrequests into one round trip.  The wire format is
> >>>
> >>>     fuse_in_header (opcode FUSE_COMPOUND)
> >>>     fuse_compound_in
> >>>       fuse_compound_req_in
> >>>       fuse_in_header
> >>>       payload
> >>>       ... (repeated per subop)
> >>>
> >>> Compound is opt-in per connection and discovered by trial: the kernel
> >>> assumes support and clears its flag on the first -ENOSYS reply.
> >>> -EOPNOTSUPP declines a specific combination without disabling the
> >>> feature.  In both cases the kernel replays the subops individually
> >>> via fuse_simple_request(), so callers never need a separate
> >>> non-compound code path.
> >>>
> >>> The series ships two consumers:
> >>>
> >>>   - open + getattr, used when fuse_file_open() needs both ff->fh and
> >>>     fresh attrs (O_APPEND, or cached attrs already stale).  This
> >>>     closes the open-then-stat race described in [1].
> >>>   - dentry revalidate, fusing LOOKUP + GETATTR when both the entry
> >>>     and the attribute caches are stale.
> >>
> >> I am not sure if the intention for fusex is to carry over or phase out GETATTR
> >> in favor of STATX, but apart of the strategic question whether FUSE_COMPOUND
> >> should or should not be added to current FUSE protocol, we need to answer the
> >> more concrete question:
> >>
> >> Is FUSE_COMPOUND intended to improve existing unmodified servers
> >> which link with newer libfuse and run on a newer kernel?
> >>
> >> If not, then maybe we should start with OPEN/LOOKUP + STATX
> >> from the start.
> > 
> > To your first question about phase out of GETATTR, I don't think so,
> > since fusex will use the same opcodes, so it will be there and we will
> > have to fall back IMHO.
> 
> I agree with Amir and also with recent DDN requirements for DLM - there
> is no good reason to keep getattr. Basically for open we need to know
> the updated file size. Depending on the backend implementation, getting
> additionally the time stamps and other attributes _might_ be expensive.
> And that exactly there the statx mask helps.
> 
> And I don't think it is related to fusex vs fuse. If libfuse or fuse
> server do not support statx with the mask, well, then open+getattr will
> just not supported for open+getattr - existing behavior?
> 
> > 
> > I have told this to a couple of people I have talked to about fusex
> > I would actually favor to negotiate supported opcodes and features in fusex
> > and adjust and overwrite the write operations accordingly. This of course is
> > miles away from the current state.
> > 
> > I don't think compounds will do anything for fuse servers that do not support it
> > and that don't have special cases that could be made faster when basically knowing
> > on a semantical level what the kernel actually wants (this is like some sort of
> > lookahead in fuse requests. If you are in fuse_atomic_open() the LOOKUP you are
> > sending is most likely followed by the CREATE right down below ... but the fuse
> > server cannot know that unless the kernel tells it)
> > 
> > It could have been when the compound handling of not supported operations would
> > have been in libfuse (which theoretically it still is), then you will save
> > user/kernel space switches, but when the kernel has to step in to do the 'legacy'
> > calls you actually will lose that intial try, where the fuse server tells you
> > ENOSYS or EOPNOTSUP.
> > 
> > So when linked with a not yet existing new libfuse, we could get faster due to the
> > lesser switches to user space. Do you think that answers your initial question?
> > 
> > I actually have an implementation of the atomic open (this is counter productive
> > for upstream, but I'm using it here as a concrete example to calrify the more general
> > point) and since our fuse server can do the atomic open  way more efficiently 
> > (everybody knows by now that distributed locks cost you performance) 
> > I get 15%-20% more performance on metadataa tests.
> > 
> > The definitve answer here is probably somewhere around 'your milage may vary'.
> > I'm really interested in further discussion about this ... and your opinion here.
> > Would you want to use compounds for some case?
> > 
> > BTW, OPEN+GETATTR is a special case of OPEN+STATX, isn't it?
> 
> Exactly, except that statx has a mask built in of what it needs.

In this regard. I think we can probably make it OPEN+STATX and set the appropriate mask.

> Thanks,
> Bernd
