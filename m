Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8488744BCA5
	for <fuse-devel@lists.linux.dev>; Wed,  3 Jun 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780480646; cv=pass; b=UEQ7Y83GqljkP18K8DJHeU0TohV4hWb3vc5OBrSWeJjnKfRvJYX6Td2xqzXEiHeSGUPkKStP6T2rUoVnWPuD/3gw92NWBL/LamymbVCDe24kPoPsfpa+GCNxwuIKOA8J39lTslr/H81mD8TGul9r9ugyqLK9D8wNyDRp/P6BV1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780480646; c=relaxed/simple;
	bh=ZCqrAxzAA1VkvSHMPbJW9yIvYLlRWu40qg6zjxtnKxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2aoGHBYX+ZT3U+MNA+y9fgXCQEPYB+OZLUpHwlFynueRRJPfEeVLLsRAtZXBExmrCnell9F1RDLm2yvycmzkWqhhCaeWUlC241EqBr/sYFtwjaXy7VqVJz5qDP5jooG3dZ7qr0ehrxXNYHhSZXy0UGYV1gkt+hp92H8qxSmc68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=dMRCX6MA; arc=pass smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="dMRCX6MA"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9155183b42cso64734685a.0
        for <fuse-devel@lists.linux.dev>; Wed, 03 Jun 2026 02:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780480643; cv=none;
        d=google.com; s=arc-20240605;
        b=JlbBmaY3tlFd0yc6LEBt5KvlSrWW9Xb77uu4D+ZzKK6dvxHpt5guYhS2W3O8Z3adeb
         evLBH15KLz74Cl57NjEzso/qHyIxAmYn040RzyYZ6tcLpdLJQLHFVypCqza1Cl5qzuI3
         2Ji0hLtEB3YUSPgoOloOi235nTKePqL4YvHzVplDx1UZuE5YpRFWfVjkzNy720OXpX6Y
         RovTnJvpbff5rM54mwH+KypMDm7njZDv3AjYmRJmCNlfmvwlitKFcvi9hehLvd8fRiXX
         kMVlYxINpcYg+f45YJ7vg29Le/GluId3MwNe9ufWEUjf9A3i1nLsFV9aGPG574PejHTM
         VbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZCqrAxzAA1VkvSHMPbJW9yIvYLlRWu40qg6zjxtnKxA=;
        fh=vSYmGaV50BxLTaKdmocP9mYfKJ0sCd8lcPBmWWvoDc0=;
        b=EUIaPWWwZngfuaMFzxsR8bdXjl9hMUE3gusVqJskB/pbwBWKgH3BIMJ3pad6HHghaW
         +xg9uKh3wQBhvgc9fwGRsaRhUXZEJbRVBqbUPJMTVUsry9OIaxU4KgbOTH+vZkVSvtBH
         vo0SJb3Lqe3xAvMWscIn7NhU2QauoZwremLN1x3HsYrNRRzxAQ+U2q8KKE+LR0Dku3jB
         SydrouQF3gQWDgZhIh3NI/PvJJhUiZOfe0wzhGyZEIaePAoXiW8rPtjjDgwVw7orjx6g
         GwxobunLwh59CUX+48dqGaU+TVSom8LBrh66zT/LYHjQcdFj00stFiM9EPaMPT+bNENy
         67Mw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780480643; x=1781085443; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCqrAxzAA1VkvSHMPbJW9yIvYLlRWu40qg6zjxtnKxA=;
        b=dMRCX6MA2ZKnAYmNmqbTbcyWyN6L8zwp6HSIalR9n/7XIHgRHhMe0G0pP8Wo7oGyid
         n2yXRdpeD+oynFzEVvHZekvSoF0HEi3Ey7tv1KgggpCr/eBJzZLtcR0F9EEr7nn+Iq0l
         g7XyDi6/w1MhcnEG182Juuyn9Lmbtl4XrskK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780480643; x=1781085443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCqrAxzAA1VkvSHMPbJW9yIvYLlRWu40qg6zjxtnKxA=;
        b=Y7qfWBt/ADwyxx35MCJqIbkRzdcGtNGqNvPuU8SOyoSKc6oSBQDqIWUvhV+vkGBJop
         chMUyr5vaVka5as7Sf8wYV3ieck7NFmNlGdfJxO7nm6op69km+RSuU2qOq0cFczyh9U5
         HWFdzy0gIXouFW0ervucpAkZ8lH/m2Xrffv3aTXC9TgIAuJRmKfipWDuHex8sdZYo4Vk
         wax1so9Mw9We+AdilbNIPUTkm5pQLeznxE9ZFCAJlXJ20nyTDbDTwtHhdGerMeBLqoVi
         5QLiy1lmh9F6Ck/mQ4A10zsi89MD0UIs9l4oVeUmitOrX9vPBu5+t13r6NccDnKwTRJt
         j0Lg==
X-Forwarded-Encrypted: i=1; AFNElJ8ogSru+50pbSgq97yHRFhTx1nsUIs+H2JHAWpxJQjQmyQ2kGKYSMvNGixSbW/yAhBbGNK9K5OsC7yB@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0yxdxH2HhfnYD6yUxWI0ZMTUwbbaIEemW4CwadjtwK5d/WtqL
	jMi8ZQr8HW47zkZKnx0+7cbYfx9vptt9BojmESOW1mv9oiYpUjWc2ubc9QC+U+ln4HpCJapgz2D
	7V1nQtMv1hNm2XAfjicRjJ89U+i6ZpnA9U23L03MRJQ==
X-Gm-Gg: Acq92OE/GYxnr0bPESNevG8PVL4VobDPvSK85iLMDKU+s6tTam3cqn0JXx7SIhNl+n0
	GEFc79/vrBQndr7L9QaeXakdXwLxtKWcst1FSKhivSubTxqfOLbIdp/ZExf9cbffVIxTG9iiGmw
	m/bfc9asUmjfXQErM0zfCRAq7Z+YN2QFqQ6FzbjXZhdGMagpor2sWzcgLTeuMNkIiYi2hEhRLwf
	ayF2vyZ2czP8DtAKzay2T7Bul7SCITc4hn6ypITF+C+qPCIryJuHxc+jxXISOCDyIs7dYkXf6a0
	q9PVOMtjNeQ3RyDScu3E9/7HjS038z2k+2umbFGKz0YpNwd29eRIxsliDw==
X-Received: by 2002:a05:620a:31a8:b0:915:422c:a0 with SMTP id
 af79cd13be357-9158b6e2074mr292177985a.22.1780480643420; Wed, 03 Jun 2026
 02:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260531010107.1953702-1-safinaskar@gmail.com>
 <20260601-enthusiasmus-canceln-anlehnen-0e62317a9784@brauner>
 <CAHk-=wifX_rrDjRGnDnOqE-usptAukuXKrmuPuVDP5bOCBWzGQ@mail.gmail.com> <20260601173325.GH2636677@ZenIV>
In-Reply-To: <20260601173325.GH2636677@ZenIV>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 3 Jun 2026 11:57:11 +0200
X-Gm-Features: AVHnY4IqQCqMS4qklUMIqRUT1Fpv-SuCQDkhxYBkM9m1uTwHwBhUln17rZFWNU4
Message-ID: <CAJfpegtH-E79D-3UL=pPv-QqJk6C4ODXLLZSAjzQJwSSeqqS-A@mail.gmail.com>
Subject: Re: [PATCH 0/3] vmsplice: make vmsplice a trivial wrapper for preadv2/pwritev2
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, 
	Askar Safin <safinaskar@gmail.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-api@vger.kernel.org, netdev@vger.kernel.org, 
	Matthew Wilcox <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@infradead.org>, David Howells <dhowells@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, patches@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, 
	Joanne Koong <joannelkoong@gmail.com>, fuse-devel <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jun 2026 at 19:33, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Jun 01, 2026 at 10:17:23AM -0700, Linus Torvalds wrote:
>
> > TLDR: maybe we could ghet rid of "f_op->splice_read". *That* would be
> > a big simplification.
>
> FUSE might be interesting - fuse_dev_splice_read() and its ilk.
> Communications between the kernel and fuse server at least used to
> seriously want that, so that would be one place to look for unhappy
> userland...
>
> splice-related logics in fs/fuse/dev.c is interesting; another place
> like this is kernel/trace/, but I'm less familiar with that one.

[Cc: Joanne, fuse-devel]

I'd favor simplification, but care is needed to not regress performance.

Joanne might be in a better position to say something about relative
performance of various transport modes in fuse.

Thanks,
Miklos
