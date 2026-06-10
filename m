Received: from smtp01-ext2.udag.de (smtp01-ext2.udag.de [62.146.106.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF60401496
	for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 11:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092325; cv=none; b=OwHc5WK6el/MvUAzB3pKtCQD6WXZZV2W5xIFN8OT65opmKpriTWmur0B8q9Cx72Zb6QomaYBN1p0nNzIK8BXz2sTgwdAs8ML7yqwCaLubjUuRH4ew7CBkklSxMNRw6/5I89inmQAi4jphw2OccHldMFdWSnylL8PsExdAA/lIv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092325; c=relaxed/simple;
	bh=ez0gppOgPi+BGh0sYC58ZEHVG/yaIRu3HQRAP9JDhrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4XF4Wy8CKq4oU5GycWspkRarAahIioo1TjhfEQ10rFyAQGn9DfikNlENK6X9ySfB/9uMpw5eH4EO0z0bF5a8WiPDyEcDXOTbKDWW6C4Ji17wS9qf3IpgbvsPV6GYrtnx5ScWYBGKHCYJ77n9Dm04BfBtWncPTG1ewVZzuhRrM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (024-062-210-188.ip-addr.inexio.net [188.210.62.24])
	by smtp01-ext2.udag.de (Postfix) with ESMTPA id A52D8E018C;
	Wed, 10 Jun 2026 13:51:53 +0200 (CEST)
Authentication-Results: smtp01-ext2.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Wed, 10 Jun 2026 13:51:52 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: bernd@bsbernd.com, Joanne Koong <joannelkoong@gmail.com>, 
	Luis Henriques <luis@igalia.com>, Gang He <dchg2000@gmail.com>, fuse-devel@lists.linux.dev, 
	Bernd Schubert <bschubert@ddn.com>
Subject: Re: Re: [PATCH v5 0/7] fuse: {io-uring} Allow to reduce the number
 of queues and request distribution
Message-ID: <ailOn2SPjhUVV3e5@fedora>
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
 <CAJfpegty63HGGNR7Vm0mpfs+PW0-r-hJDSASsRMk3JwsHTyrvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJfpegty63HGGNR7Vm0mpfs+PW0-r-hJDSASsRMk3JwsHTyrvw@mail.gmail.com>


On Wed, Jun 10, 2026 at 12:51:13PM +0200, Miklos Szeredi wrote:
> On Fri, 29 May 2026 at 00:55, Bernd Schubert via B4 Relay
> <devnull+bernd.bsbernd.com@kernel.org> wrote:
> >
> > This adds bitmaps that track which queues are registered and which queues
> > do not have queued requests.
> > These bitmaps are then used to map from request core to queue
> > and also allow load distribution. NUMA affinity is handled and
> > fuse client/server protocol does not need changes, all is handled
> > in fuse client internally.
> >
> > Signed-off-by: Bernd Schubert <bschubert@ddn.com>
> 
> Joanne, your RvB is on the first few patches but not the rest.
> 
> I'd be more happy with a fully reviewed patchset, since this falls
> outside my current expertise.
> 
> Related question: do we want to request automatic reviews by sashiko
> on fuse-devel?  I do see dangers in relying too much on AI reviews
> since it makes us lazy and complacent, otoh sashiko does seem to
> provide useful feedback.
> 
> What do you all think?

Hi Miklos,

regarding the automatic reviews, I would like those, even though AI
most of the time cannot really grasp 'the idea' and tell us if the 
intention of the approach is wrong in the first place (think of
my intention to limit dentry cache a couple of weeks ago)
but it would find obvious or overtly visible mistakes.
It only makes us complacent if we let it.

> 
> Thanks,
> Miklos
> 

Thanks,
Horst
