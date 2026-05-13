Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078AC4963AA
	for <fuse-devel@lists.linux.dev>; Wed, 13 May 2026 15:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687170; cv=none; b=dXn/UAUgAo+Y1RO951x3+/CPpTK8g3eHkbxZPMGkE4oH5lv9iTbXM/wM77UIu8p2gDuVfuP2/TftRplWfh+uj0pNvRE0SifmEc7v6tH0vrazvclYeUgi8k9IAej2wIrLQd8sTFmr+agA5tx7Y0+xjlrOX7UbKXMWv4xz4e7U9Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687170; c=relaxed/simple;
	bh=5K0pBXZloxqpAHGAcwAYFGBuMyPkLRtQuQNGc7Q0nyQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Iqdk774pEB/TUrf/iEhljt5bPOPziNfVkbZzHSqli5HWtrfl2b3UyMAeD232TmnY8r5I3v3omsuxpnzCnGArVN24FuALncC2x3+eLGrwHFGDFQcAhGwK2UjtRI1+oNhrDzSDWrev9xAGXFU06pm1804tig8Ig/OSoLGKrRk1gWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rath.org; spf=pass smtp.mailfrom=rath.org; dkim=pass (2048-bit key) header.d=rath.org header.i=@rath.org header.b=csHPZPyU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X2exqUf+; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rath.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rath.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rath.org header.i=@rath.org header.b="csHPZPyU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X2exqUf+"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 21F9F1400168;
	Wed, 13 May 2026 11:46:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 13 May 2026 11:46:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rath.org; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1778687167; x=1778773567; bh=qWDRwk1s2Pd26Ncw5axLaJ3442XNNNIJ
	2He04PcJqGY=; b=csHPZPyUZi7RvbuHiM22aVGlFoZCwB+FH9ZrkDWsg55HVrMY
	XsEzuq/WCCOtxrRq7mZ7ijSVjklnkyqRrmyH792lpMGvLIfUupK9nLEdSILr6RdP
	lLn55qQmvxFJDNKybxVOpgff8QnXa9baLH7AhkR1ovWHcAGpuV7EOkpvPn4Yof68
	qygTHyiYEIs8xk+i2x6XXi2afoxxhviXxt+IQmhUQDP3xKxJ6RAbnSwEbYkyb07w
	2LcEdeF5YrspK4mWBIFV2XPCe93fRcZtX2H29S6HbJujyUWcy0kGkJb92xbt/Ud2
	p8Id3sWUzs9Rd5ahmaFHDSTengnZSvES85MUfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778687167; x=
	1778773567; bh=qWDRwk1s2Pd26Ncw5axLaJ3442XNNNIJ2He04PcJqGY=; b=X
	2exqUf+Wwqoh3T9SPZEAdl0f8AmWlpQvdD8nR4YhZiEMTqXysAbtC/Y38aEM3Sg0
	/h/X+5IoxMIN+vKgofuRKNWUYMRmh1+h6JoAM2yV9Lp8LIouCpKQI05Obl5wUAqx
	wYw7DbqUZroZ/2KMLEDZ283tGk4SD66TVu16JnygDZ2Rdwbv4MgHphTwoXkWshQG
	bkKcY+1xwO/9Ng/3K4Uf28zkbNwn5TDgIUQeDfF05YPW9ZrmzcvDAoS+3/k89nqx
	EZHYzT+tVb9/mgUvR0Bw05SaFWGJKpxTHEQVQCiq6cLpKzFmKSVxBk11ixecWTcG
	EAA6H7vk149g7NvAxgjrQ==
X-ME-Sender: <xms:vpwEaqg1UK1B7MZU3edXQtYHhaOLtootbUiUUhkSpiJwVRtlRf9ekA>
    <xme:vpwEao8RFirSTlcFk_l4Doqmfvq8aaaQgcuez9VuMXRrhQF6S6MYVKz-3qsk77tq_
    dJCiwLfjjeSLiDTrs0BCdVWFLp0qFvcwg-amNbJe9MDhxRXaw3-6A>
X-ME-Received: <xmr:vpwEappxxtqvTSNVdK8MmzdO_NqZyIpgIfM6RDwsuKwD6wRam3a5mX0dvTVDAbiIescf12n9-IRUUu3jh8Pr2tCC3CAfgGm7QAZHxfWDGK48iqpFmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdehtdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkfgggtgesthdtredttdertd
    enucfhrhhomheppfhikhholhgruhhsucftrghthhcuoefpihhkohhlrghushesrhgrthhh
    rdhorhhgqeenucggtffrrghtthgvrhhnpeevuddukedvueevjeetfeevueejkefgffeife
    ekvdejieevffevkeefudfhveegvdenucffohhmrghinhepphihthhhohhnrdhorhhgpdhg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpefpihhkohhlrghushesrhgrthhhrdhorhhgpdhnsggprhgtphhtthhopedv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfuhhsvgdquggvvhgvlheslhhish
    htshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopehfuhhsvgdquggvvhgv
    lheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:vpwEav-lHlRv6Ppb_MrB7LyOj4TI3bciIqXoMNqCGN8BSwFKQ7NJZA>
    <xmx:v5wEalV62F7jIzfcH2RG1kEhpJ-NV8yVv6EqjnKDjXRMgDWNgfbqoQ>
    <xmx:v5wEatBrQg71GS6ZIHGXO5gNv5GRJzpKeTmkGFTENueXfIenkvlQVQ>
    <xmx:v5wEauzPYrcJaY0qjqk7ZOMLNjHy__lVbdrZkOkWciB73dxrohUYwQ>
    <xmx:v5wEasr0fif868GjfMBJrMGPALsEZJb5FYnq1RV_MDL3Ynph2HC836vv>
Feedback-ID: i53a843ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 May 2026 11:46:06 -0400 (EDT)
From: Nikolaus Rath <Nikolaus@rath.org>
To: fuse-devel@lists.linux.dev, fuse-devel@lists.sourceforge.net
Subject: [ANNOUNCE] pyfuse 3.5.0 has been released
Date: Wed, 13 May 2026 16:46:04 +0100
Message-ID: <87bjejtirn.fsf@rath.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Dear all,

I'm happy to announce a new release of pyfuse3, version 3.5.0.

pyfuse3 is a set of Python 3 bindings for libfuse 3. It provides an
asynchronous API compatible with Trio and asyncio, and enables you to easily
write a full-featured Linux filesystem in Python.

From the changelog:

* Filesystems may now define a `~Operations.poll` method to support the ``epoll`` and `select`
  system calls.

* The `FileHandleT` and `InodeT` types are no longer declared as *NewTypes* but are now simply
  aliases for *int*. This should make it easier to write type annotations.

* Future releases of pyfuse will be signed with signify rather than GPG. The public key to verify
  the signature of a the next version will always be included in the previous versions, so this
  version already ships the public key that will be used to sign the next versions,
  `signify/pyfuse-3.5.pub` for any bugfix releases and `signify/pyfuse-next.pub` for the
  next minor (or major) release.

The following people have contributed code to this release:

Christopher Obbard <christopher.obbard@linaro.org>
Nikolaus Rath <Nikolaus@rath.org>
TW <tw@waldmann-edv.de>
Yaroslav Halchenko <debian@onerussian.com>

As usual, the newest release can be downloaded from PyPi at
https://pypi.python.org/pypi/pyfuse3/.

Please report any bugs on the issue tracker at
https://github.com/libfuse/pyfuse3/issues. For discussion and questions, please
use the general FUSE mailing list (i.e., this list) or the GitHub discussion
forum at https://github.com/libfuse/pyfuse3/discussions.

Best,
-Nikolaus
