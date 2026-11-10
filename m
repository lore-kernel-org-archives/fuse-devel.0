Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=50.112.246.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325193;
	b=sO9QXQOQtA81VSa4j0CXG55HfEkEq4zrtXe2l474WkHQOkt8FSaScTiDmJn7MIzW121/
	 ltSADLfd82B6UMv1ndKThp24cxRB4KOcaPHZkt7+ZSjJpIZIiCCbm7Kjirns7V4UjfOkP
	 k+TiNkXy6d99dp0APNzndq0Sm0A7hOuXf407VghlQgABHK5guN/SzLG63tMJ8/HTTmhr8
	 OwnU6920n49l6MSts0FIUubZKcR7lvpH88vqZGOu5QAohJatKWSv5EW55Vge5LOTymfog
	 vSVWgihoTFG8402CmAy+nF95LPxIGBLMYBYz2n1z/MYW7LO0afRox1rdfQ1YaD/xDDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325193;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=PfgtpIZoIdAlp1HLQI/NSBmN1PwrPzNDFQFGGwCxfNo=;
	b=0rnHTiP8FkcyY77wyKT6bwMbTSBQEgF43njhLZk51S/iG0PdrRNdKl4nOeKnTwNePika
	 OATt7O8q8pvNt4LGuUwYDMiILrMN9PS82Wf/TtoVGX257zOrUweQw7ZT9wSAluGMd+zCt
	 bqtKYiwqqXxYDQ6K6rIIVXTfEkZMc7qJJ8uUDbxyKxXZkp8iWYuzIeFeihesxe2wGfH9K
	 FjUN56NPHZbqNDoNYxhx2Atam7DVTFyIUAwHmU5gCQljI92sfz7kWCk7aNyePJ4rlyz3s
	 AEDSYIKBJ6Zc7oxZYL1ko7l0GkcLapD7UG/NHIPhNn1G1VmKavYItGgk7rI6Y27rDZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=WGLQmesH;
	arc=none smtp.remote-ip=50.112.246.219
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1493606A31C
	for <fuse-devel@lists.linux.dev>; Tue, 10 Nov 2026 15:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1493606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=WGLQmesH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794325192; x=1825861192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PfgtpIZoIdAlp1HLQI/NSBmN1PwrPzNDFQFGGwCxfNo=;
  b=WGLQmesH7hWvEO36aj62AB5FnFK/GzlqmQx4YTJhVTmPMOWWuA5PKc5o
   kuTZoJ7+oKC0tGijYsffsbpBgONTbUZkOo+C+btbBiun8y8BKtiiWPn7W
   1ohZuVp+nFcSxYDjo4Zg04N0/sL/0k1YKeaylrp7jnUKf6OhHY/9gAWtc
   SHy/O8AO+rocfZeZ3On4cyHRawRaKYWPCD69zl32WwB756jYFzpzmoth3
   FmxdVl9NNrhVwOYEvmJlO0qRNviG2RIcBeOaHpmpvOVzCowWbFfbQBNdq
   pduYyU5VFypuBEQppoi16rLFS2Az34ny5zHnNVd9sCubmRWCm5YnpYQdt
   w==;
X-CSE-ConnectionGUID: QQ7t0v39Q/+hxBL9/9+tVg==
X-CSE-MsgGUID: ZcQ1j5oXSaKpM3AnqL1Lzg==
X-IronPort-AV: E=Sophos;i="6.27,206,1787011200"; 
   d="scan'208";a="33401723"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 15:39:52 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:27676]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.255:2525] with esmtp (Farcaster)
 id b4ba0eff-45fb-458a-a6b0-dec04aa55a2b; Tue, 10 Nov 2026 15:39:52 +0000 (UTC)
X-Farcaster-Flow-ID: b4ba0eff-45fb-458a-a6b0-dec04aa55a2b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 10 Nov 2026 15:39:51 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 10 Nov 2026 15:39:51 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>
Subject: Re: [PATCH] fuse: fix use-after-free in fuse_create_open() error path
Date: Tue, 10 Nov 2026 15:39:38 +0000
Message-ID: <20261110153938.3666368-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261026180649.1265825-1-jamz@amazon.com>
References: <20261026180649.1265825-1-jamz@amazon.com>
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

Hi Miklos,

Gentle ping on this fix. The bug comes from commit 2fbe4586cff3 ("fuse:
add support for opening dax device as backing"), which is in 7.4-rc1.
The patch applies to fuse for-next at 7.4-rc1.

The FUSE_OPEN_ATOMIC series depends on this patch.

Thanks,
Jimmy
