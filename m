Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.162.73.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013407;
	b=WtB+MoFoiH5Ry43uaem8/P/KxXRAmH4KyKHIW9A5V3nA6wzJGs+gQ0onEqKEv/g09Fgm
	 RSBaA9U5I8y5L6JlwroKAO5LeL3b5i9ZChItgO7Dm8gtVhfQM3xR4Z3O+tiKoRShstqJl
	 YVhj2jzGeKOXZGu4UHBLtPUl4ftscw7fbsJhTzd19+0yBxx4FgrW4/gUiUIHgY1Y2npI+
	 +OKZ7tRIL54Y/GRK9iHrsNlHxaBLvKTonYUCBUF5iP5wba9XufSmfd6q5M8CKQ5hVL3D0
	 qR4Fs7RLix0i7MIW9beOYMUdtAFvGXYGTI7Iju439669+Wquc1RFSxMSdAB+RcYFXYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013407;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=qDi7KRQkSZtAkihLPLaxANWYKfYSqrPaCZ521iA/J8A=;
	b=oCM0sXb+ZsAh9pveRnsllo5TkLXbwaFUC40Iq4gUEs0ps6jSLw58N9Q76jOUxbw3s5t6
	 hgw8qNVw8a8ArZjiWxI0VUceLh8tVIjmziowbSkix3e/21Fk6e1/Z8FDlGNa8pO8y1Y3d
	 /YxmnXvnocQxd5QJGcySluxXiGhu70u2q7scssPamKtGuNqEqO5EpjU6dJ6tyWeGSKgjZ
	 Rs/hlcri9KqiQYA/S30IcGwAYGYBvnUPbLBINyhCTIXfsHt+IxeroFMCTSp7GINy9lzi3
	 J1/QMb2yAn6e9WaMKEfo9YYI/bvB97MGTTmoWp6ZKkJzMsEbYoIZg4EXATrYWpWL+bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=mIXnTkhC;
	arc=none smtp.remote-ip=35.162.73.231
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC38F606A320
	for <fuse-devel@lists.linux.dev>; Wed, 18 Nov 2026 14:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC38F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=mIXnTkhC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795013406; x=1826549406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qDi7KRQkSZtAkihLPLaxANWYKfYSqrPaCZ521iA/J8A=;
  b=mIXnTkhCQKCZZO4+b/mtNuyw+E3XRMvPSUkK+rxcHeBQqSu0krDDD53e
   8vd/f53DDrvfu1lisvSlzcYF87gCbqwprvx6gwO0Dg+mRCWAqWbHxFqn0
   u7PrAJ+jYSk1ma9bxLRmuBJLP59c/H6r4baUb3nJ/uUpbhIwAjx5NcN6r
   MTUMjq4Kb578l7fjkiytIOwpqh0ohDsXwY95SRQQYUVmXP9KDRPjEgMzE
   1yA3VtmrqOe+rCETDxrFVwttybv1z3A0CPJTDpoYYXcbDuC4iiOzbvC44
   bRFzuvkvhb0RegR3XCS52gXpvE76aPOxo1BEY1XHjEVishNvNYxRwG93K
   g==;
X-CSE-ConnectionGUID: +RakD71mR7aDnjQ/cpsizQ==
X-CSE-MsgGUID: Fb+jquAZRx2EVvjydVpPSA==
X-IronPort-AV: E=Sophos;i="6.27,219,1787011200"; 
   d="scan'208";a="34309647"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 14:50:05 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:23475]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.127:2525] with esmtp (Farcaster)
 id 723a6435-7c92-43d2-82c6-22273cc46a39; Wed, 18 Nov 2026 14:50:05 +0000 (UTC)
X-Farcaster-Flow-ID: 723a6435-7c92-43d2-82c6-22273cc46a39
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 18 Nov 2026 14:50:04 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 18 Nov 2026 14:50:03 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Bernd Schubert <bernd@bsbernd.com>
CC: Miklos Szeredi <miklos@szeredi.hu>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: Re: [PATCH v8 0/2] fuse: atomic open
Date: Wed, 18 Nov 2026 14:49:57 +0000
Message-ID: <20261118144957.3344610-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261110204421.1251726-1-jamz@amazon.com>
References: <20261110204421.1251726-1-jamz@amazon.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Hi Bernd,

I thought you might be interested in this series, since it attempts
something similar to your 2023 series:
https://lore.kernel.org/all/20231023183035.11035-1-bschubert@ddn.com/

It gives a meaningful performance improvement by cutting down on FUSE
requests for routine file opens and creates.

Let me know what you think!

Thanks,
Jimmy
