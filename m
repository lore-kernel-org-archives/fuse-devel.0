Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.155.198.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792633590;
	b=vRn+fOuU/VAHdv/RiH1wCbzbHBBxYueEokUQBBGtFgxbOjpD5W4W0nYjBReMXF/AZj84
	 y/AhjMKfuq05MDjaFVizMGWStJcRAAla+eJjLTcdZtCyxQRNwSqa73Bl5wvfFCU/191Bc
	 MJR4e5ch2cdTdNxIi7AnXh76taPbcKpp/1O/SJAIasx9vJSBGIlSi3o1ujJxZWdq5FVv4
	 MuzOLRUY3bvtYOloOUKJEGfRbVZ8o38x3gOO3dLg6OaB9HfFhUhgLejYXxlQcDQlc8qxg
	 YuDYnK1A2qeDvoyIfufLdKoPiJW/S7qeE0zkhUfMbBA3NAiCnOuOLfqv5y5gzHRf9yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633590;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=WAr0I7YRFOjqJY0tBlhl9CiHBKCgUZmp0eNrbHjruCg=;
	b=gwEBGUtcbsSZ/jRRZHGMzKgqud/gvgFrt6spIXRvR6PxHw14+X5xlpW6xlt8GcyRYZkx
	 zWk+1iqOGotnYLNMwe4nVtYNtigMMdILL58O3c7b3rTppnSbBQj2HS6S6C5RY1BNokHxm
	 sZ45kDsxrrLalzFZDcGJKlPZxPhy+olQQYHa5tHBvXpvoEp5Ki3CZYv5JZtqUH87lqsIV
	 jNBQaCeuWZAdVGvLrWYvcBPojGHV6zWHXCHJ+RCnjpioczMMy5fuWdRDd7UG+OAFmhSHW
	 gaCE+T4Ru0oe/mhSkQheMxcRqE5nICPeWj2ib6NGi9tqTQShSa6z6VqWWMAhqaCw0mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=QglQnnM3;
	arc=none smtp.remote-ip=35.155.198.111
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F950606A334
	for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 01:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F950606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=QglQnnM3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792633590; x=1824169590;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WAr0I7YRFOjqJY0tBlhl9CiHBKCgUZmp0eNrbHjruCg=;
  b=QglQnnM3puktLHnAbMIcplJ73KuJA6DZUFFtwl2lPX8LpWeVOSqWqxCT
   saf9y9oUKkodMMw3Aw+T/WGWKFfkMBJeGgnoML2Ghq9s0ksX0eLgbmMHu
   hpArHS4Zd4vYcq5Q53PCsTLkxS3xT3k+xNpJI4N0UVkK9DhNnA2MFPMZK
   m9v373/tntX0hxS7AnppnZJ1XXkKCUmupj0Z30f5hSdEYcFewghJUWjCU
   yELEF4FgAGuIXCFUafO+aBpILnnL0waJ0LHntDtmx5pgV2sVQvmZDh6JP
   hLC3vr974mQJm+eUq/bP9FDD1JPzxxldxSEAqdvIoXjxRRlOeNMna0Xpn
   w==;
X-CSE-ConnectionGUID: qWJ1OrN5RpO37eBxqGLnig==
X-CSE-MsgGUID: NrGM2B7DRxyQafWW3Nmbsw==
X-IronPort-AV: E=Sophos;i="6.27,171,1787011200"; 
   d="scan'208";a="31822201"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 01:46:29 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:28595]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.22.5:2525] with esmtp (Farcaster)
 id 9d617943-0c35-4a6a-8576-7d5b2483345b; Thu, 22 Oct 2026 01:46:29 +0000 (UTC)
X-Farcaster-Flow-ID: 9d617943-0c35-4a6a-8576-7d5b2483345b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 22 Oct 2026 01:46:29 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Thu, 22 Oct 2026 01:46:28 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: NeilBrown <neil@brown.name>
CC: Miklos Szeredi <miklos@szeredi.hu>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, "Bernd
 Schubert" <bernd@bsbernd.com>, Jim Harris <jiharris@nvidia.com>, "Horst
 Birthelmer" <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>
Subject: Re: [PATCH 0/3] fuse: atomic open
Date: Thu, 22 Oct 2026 01:46:15 +0000
Message-ID: <20261022014616.2503204-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179253922666.1724252.16392934420146585044@noble.neil.brown.name>
References: <20261020141647.3271341-1-jamz@amazon.com> <179253922666.1724252.16392934420146585044@noble.neil.brown.name>
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

On Wed, 21 Oct 2026, NeilBrown wrote:
> This all looks like a reasonably sensible design. As permission checking
> happens in the client, not on the server, it is appropriate that
> FUSE_OPEN_ATOMIC only opens the file if it actually created it.
> So it doesn't make sense to implement O_TRUNC.
>
> However the code seems to suggest that the server might open the file if
> it was found to already exist.  In that case, were does the permission
> check happen...
>
> Maybe I need a more explicit statement of what FUSE_OPEN_ATOMIC is meant
> to do in the various cases.  Or maybe I just don't know enough about
> fuse.

FUSE_OPEN_ATOMIC will open an existing regular file unless O_TRUNC is
specified. If the server opens an existing file, the kernel will perform a
permission check after the reply (do_open() calls may_open()). If that
permission check fails, we will release the file. This matches other file
systems that support atomic_open(), such as ceph, where a file can be opened
before a kernel check is performed. Servers that don't want this should just
return the entry only to have the kernel check permissions and open. I'll try
to make the expected behavior of FUSE_OPEN_ATOMIC implementations more clear
in v2.

> There is work underway to support O_CREAT|O_DIRECTORY so that a
> directory can be created and opened in a single operation.  Would it
> make sense to include this in FUSE_OPEN_ATOMIC ??

Oh thanks for the heads up. This would be a nice fit. If that series is
accepted I can update this one accordingly. That said, even with that series
it might be nice to have an init flag in case implementations want to
selectively support atomic file but not directory open/create (ENOSYS is too
coarse grained).
