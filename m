Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111DF3822A1
	for <fuse-devel@lists.linux.dev>; Sun, 10 May 2026 17:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778432519; cv=none; b=hTIsoXUQ9ngRLOp1Zs7MbEwe13AeJ24oe2E6S//YlmGAHsXZjoyr4VMwqqgnNOt6hE8xkmJYPkJENRrl2Ql2Rq0RLeFoM3R9yuSZLl+xqP+zztqyAsKxokfOAQ6iGP7vmjcDKdO7aPPG55eVQZNgoU2JpHHsv3a/SKx7VaMrwuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778432519; c=relaxed/simple;
	bh=n182561GtceTVfj2QjozQ15C1AqBotxI117McFGJCJ0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=P41i9b0Sz2uJVwsZEFGGDSPLR0F9/KiA+KRIrZwkppHxStTD5ilsisdBbxcRcyLkgRV5zxJ6sa5Socdo7+CoNwDac8DkDF7Jy/cxPlnwBwoBQ9Fuo/dXmsDAyiVQvD/4+7oCdMIx6R+5yH4EybvlEYQnSsRuBWui7HC02mx6AQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=V5XBbC7g; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gQmKxfzm; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="V5XBbC7g";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gQmKxfzm"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 46032EC0317;
	Sun, 10 May 2026 13:01:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 10 May 2026 13:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778432517;
	 x=1778518917; bh=n182561GtceTVfj2QjozQ15C1AqBotxI117McFGJCJ0=; b=
	V5XBbC7gsc26BA/LZ+z7/CB2A4o7QQLtNDGLN8LvA2zwmBZROTvKTQ8L4PdrExRR
	0rC1Lq0ErNO5i+sbl9wHr1ppNFlvha+tetS65cHEDcq00t2e60ExCUrl0uzmh2ep
	8271hlng9884CvAsZjU9Uhl3JI2ptYe4pMENikMBNivB5CifAFgmEVGoUyGKN+GB
	d3lgvzEXC5PWUkQaAdVsmZRkTK5S3vHl/DTe831MAC3cBf88wMQ+OuWloE6H5VC2
	eG6rp0holhFMXkd95+mlsUn9GQKu3wqlCtk0m3vUB2QgklvZYUHQRtRW7yWJXlpk
	drek3BjYuCnzSMVs3eMLeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778432517; x=
	1778518917; bh=n182561GtceTVfj2QjozQ15C1AqBotxI117McFGJCJ0=; b=g
	QmKxfzmOBRyVabnchE2OTmSdNHN8wu813j+LnZPcrS2mnbeHEOjOi0QV1cSzig02
	PVGsULKV23zC1YLfXHwhGe36v9BvcmyVnnhdUKrC0p2nrz/dn+3wxybdB6n/5Xts
	SjDaQMtJ1gB2lrVnvIb0W6BtIrIZJO/xj6yFqVRYUxOJYzZv8ugHlm0DPjWtJ4Bw
	G4CitsSc0UpF6yPG7RD72/vX69FI+tdAwT8PDkOXAZBs9nT7AcxcC+/rfgjlM2tS
	WsYMP3u09xwglRUMYuHNwt2Kzgc55HJ9TijQWIf0zCVMRRnw6e6o0UFYIIzDoFD1
	cL+HFvFJi4wbt5ihsx9ug==
X-ME-Sender: <xms:BboAahYZ5jTIGKx993aw-MKA_5Zeq2cnsDO-rRuaBKhm1gd9VccNNA>
    <xme:BboAauYRXk3YR12qPGiPoswmUFj02fBBiH-zqWg_vyz00nmwx4mfItXopLL-lm5EM
    XOE7DEHrx5Wq-8nZqI5RI0jmWPZq1JS0ZhD7yLKXb4Ou9vi10Sx>
X-ME-Received: <xmr:BboAahk5c53yFSwniDxIAEe3tjcAKM3D7wGF3hRTaTGkFDS1AElnxI22quVpbPunj_JS2VVcBDftGlAympzM8nQnmSKiEDD7_1toRLiwyVeDmaY4AA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudeiieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffhvfevfhgjtgfgsehtjeertddtvdejnecuhfhrohhmpeeuvghrnhgu
    ucfutghhuhgsvghrthcuoegsvghrnhgusegsshgsvghrnhgurdgtohhmqeenucggtffrrg
    htthgvrhhnpeelleegudduueffuddvteegffehudeuieffledtudehkeehffegteegfeeh
    vedtteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsvghrnhgusegsshgsvghrnhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopegujhifohhngheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepfhhushgvqdguvghvvghlsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:BboAaqwOQgiywgbzBPKtlFonMTxrkb4hM28FfnizkvLU53btcru-fQ>
    <xmx:BboAavNEpXWD0qw3jOLKGNoZTB7Tli22oJn62vj-wjRUxO_kgUyczQ>
    <xmx:BboAauSY7HqjlhDrgyaReGvYuLAi6KrgfxL1Z3adB61Mra5ztxpjxw>
    <xmx:BboAataj3m01zN8t8xDoJ7O2RNmwVaEck9DZA9etdhMv7E4WvY18Bw>
    <xmx:BboAavOzGG2FfZov48gHWZnrgifQMOHeE7b8KlBxHB_QZja1EOPGczl4>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 May 2026 13:01:56 -0400 (EDT)
Message-ID: <efea76c4-face-4aee-abd2-860c4daab11e@bsbernd.com>
Date: Sun, 10 May 2026 19:01:55 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] fuse_daemonize_early_start: Disallow daemonization
 when already active.
From: Bernd Schubert <bernd@bsbernd.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fuse-devel@lists.linux.dev
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
 <20260508-new-mount-fixes-and-tests-v1-8-c67a0893ddbc@bsbernd.com>
 <20260509003008.GM2241589@frogsfrogsfrogs>
 <72662f25-3691-4c9c-b817-0d4049202055@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <72662f25-3691-4c9c-b817-0d4049202055@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/10/26 18:53, Bernd Schubert wrote:
>> vs. having a weird library call where with *some* parameters you can
>> call it more than once.

Regarding calling fuse_daemonize_early_start() multiple times, how is
fuse_daemonize_early_start() supposed to behave then? Second time is a
no-op or a nested daemonization? The latter would even work after this
-EALREADY change, but only after void _early_success or _early_fail()
was called.
Well, let me change the 2nd nested call to return of 0 / no-op.


Thanks,
Bernd
