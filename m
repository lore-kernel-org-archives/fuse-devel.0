Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.155.198.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388254;
	b=MPGSWd6QhLAqHBeBw3q5h9iYvMHIUh67qwrrZvJS4a4tpMiw5hxd0Q94uxUzJp1LlxAb
	 oB3km6S9WNAq63QU2YK0uKA9oOgmGwi1xbB1oLRh6si5YCbfz0Fs20rFr+21Zf4ApUVPd
	 F7nkg+2RTiOG+Qz8QbN+AC0BOhN3ngBSDUN3vbFXlzvgP7eRfXbANwc+oYVP+uu3iBGK0
	 U17mVe9bHroae/pd41lRPgjWNU6J/XPaRuczSmvPAH7S8qwvQeHf7zBxopv5FWlRFP0Ee
	 0kDn81+M/ES+Npy+oubMy8McgQipdGHssMLMG5G0zIV4ae0IsllhGfKDDHPXPxC+SbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388254;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=pkezIO5EgOZugo4H5IpRr29h/eZHVxjAk1pOcW+pZUg=;
	b=h3xoMjV97/Kzf88jByq8bFJqZ+HsILn1hwRDKc87dyL7ru0PNSqpbrrWCD5TXkFO2Sbm
	 4oS8Xoq2BBz9j4ZtdcoYUHmSO3ZPGAOqnsg/47mhse7bYgJmGqcAcmT845jbXTxp+Q0r2
	 rLVw9NjE26jSHe6nyAQFImglXFlQ12S0xJSp7HImB0ZmYIKxfvwuTxCaI9f9xfiFQYkK7
	 /fntebztrSVYayVfnuz2KKPlLabTjiBcYhM0bBs0xw2QFWtnTsxy+PH6+7okDrIgxXHz9
	 lmEWOQkDldPw5bnwTSwbHYNivCmV7M+O8wpbWDFYd4U6CoJdOYyabdNDTVAXn7f8sdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=O8VaaUTb;
	arc=none smtp.remote-ip=35.155.198.111
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B910606A321
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 19:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B910606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=O8VaaUTb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793388249; x=1824924249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pkezIO5EgOZugo4H5IpRr29h/eZHVxjAk1pOcW+pZUg=;
  b=O8VaaUTb2Y1VstjwYeiKAddvhIeQQLA+yprdVdPkNLhYMS2wO0X5V5nI
   Rn+eNxuqvJzIq005F4aE2O1v5TLsK4MvyDr2VQOTTsk4+5e+36BeF2i/K
   nN9dUG2xNFauylwajJ2sPrFuX2kgLVC9YVAPT52FkExUoCaR800WxjGaI
   thIP2F+/G7LsNVgkyPrQno0pjGTcULPCB4K0Dm15MtMNWJShV57Nzankj
   0W2TfxVyL9vXMeIsMkM3bsw3j2i2BfLv9uO6Yg4lbh6BGucLDJ5A5zObZ
   JFUzaavnywY2wSQm0nZmPJXn58MKmOpUalflN/e4VMBS/KVlI+q02Tsns
   Q==;
X-CSE-ConnectionGUID: XW7VraI7QoerkK5AUENd8A==
X-CSE-MsgGUID: ER1+0G/GSyOnJbhMTZgHJQ==
X-IronPort-AV: E=Sophos;i="6.27,186,1787011200"; 
   d="scan'208";a="32602116"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 19:24:08 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:24377]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.63.21:2525] with esmtp (Farcaster)
 id 7f75e6f1-28f2-4c6d-bf2e-bec889c1f73e; Fri, 30 Oct 2026 19:24:08 +0000 (UTC)
X-Farcaster-Flow-ID: 7f75e6f1-28f2-4c6d-bf2e-bec889c1f73e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 30 Oct 2026 19:24:08 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 30 Oct 2026 19:24:07 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: NeilBrown <neilb@ownmail.net>
CC: Miklos Szeredi <miklos@szeredi.hu>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, "Bernd
 Schubert" <bernd@bsbernd.com>, Jim Harris <jiharris@nvidia.com>, "Horst
 Birthelmer" <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>
Subject: Re: [PATCH v6 1/2] fuse: add FUSE_OPEN_ATOMIC
Date: Fri, 30 Oct 2026 19:24:01 +0000
Message-ID: <20261030192401.2543699-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179332437497.269288.7305999595462479305@noble.neil.brown.name>
References: <179332437497.269288.7305999595462479305@noble.neil.brown.name>
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
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On Fri, 30 Oct 2026, NeilBrown wrote:
> > - any other file: the server returns the entry only, and the VFS opens
> >   it;
>
> Why is this a requirement?  I understand that the server *may* choose to
> not open the file, so that the open doesn't happen until after the
> permission check.  But shouldn't be up to the server to decide.

This doesn't have to be a requirement, for regular files the server can
open if it chooses to. I'll reword. Are you also asking why this is just
regular files and not directories too? I could look into that if you'd
like? For what it's worth, special files should never get opened by the
server on this path, the kernel opens them itself.

> > The VFS checks the open after the reply, as for other ->atomic_open()
> > filesystems, and the kernel releases the file if the check fails.
> > FMODE_CREATED is set only when the server reports FOPEN_CREATED.
>
> The above para seems to suggest that the server might open a file that
> wasn't created.

Yeah, atomic_open is a lookup+open on the FUSE server, and that open
might be an open-create or just an open. Either way, the server might
open a preexisting file. I'll try to make all of this clearer in the
next rev, once I've gotten any feedback on directional changes here.

Thanks,
Jimmy
