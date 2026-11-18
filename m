Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013091;
	b=o0yB1YF3DCEyfVIeCnxwcJGLjRZz2kjnIx9cLRLudrQEcEIpGp1BxuzY/+hDE1UhPr5Z
	 UiV2cdkOicMV+zobCn1L+39Qc4aYHHxNYp3QfzbfXhNIDUZTL+jqK7jUJmXZrREMO8BQO
	 DvA5pIM6hLxMLZV6TDUTgVHPYGB902cxYN70pWLqsT36bQzdIIem/2dgLj2SUWSVxUjPm
	 DhEuDGac7m1DS8+dLuxlZKEcr4Ltn1MsHJ9SiB/3WHP2prZIUk0abAG3oLE1wNY5LSvhm
	 WRPy6w72b8fHECt6qj3Uq1H+Ml9G4k+egkVTlnIkrcwyF9b3Ksk+n3p6lBvVpfskzWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013091;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=FYdFDt3RQcZLgWMSe+61R6Sn4+qOe7+WPCHCjIeH/40=;
	b=puSsgHforCHZCPCAgMGkEdTCBIqE9AlhzvxE/CH4hv5iwdy6nOOiFsVTgQqgk1cSZyK/
	 KP+oKc1cvHBHGOZCcdiUrCCyHfSGLwnKvEVHLVeARN95xivmRO9j4eymYPjadBjlpoRLw
	 DByKcNF3BNjwEVLcOnZOLCBHHq4ZFidqIkVjhGjhZrXKgrtYXIW2hctvoH57iBlLdAX+C
	 xlgHiFVw/uZ42hwkFhch3oGXOcAhSRz4B3SxtzEp1NRfimRHFNXVsVKcGm4ScHwCitdhD
	 uGxgoHFLsf5EJoqfD/FfJ6ghJy2i4gcWQ/qk1LS86+LgohKGhWdcYYOf7uDK6T+b/dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=GehFDff7;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE615606A31C
	for <fuse-devel@lists.linux.dev>; Wed, 18 Nov 2026 14:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE615606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=GehFDff7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795013090; x=1826549090;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FYdFDt3RQcZLgWMSe+61R6Sn4+qOe7+WPCHCjIeH/40=;
  b=GehFDff7vxTJ6w99MTgGhcANgmdCF9R5FYyGZjNuHFXBmooPeiyxgx1s
   uLQ1+j7m8+Teg1jKvg8bvi7yds3I30TjDKTDmyJO2sV8JViivE67K+WWr
   IV4OStVIW8z+a4YJpl0G+Fk5ksdRptEwcT0is29vHPFix4MsWzcLQB74K
   2lc7wrV5XuR/oyR/8mnNWH9OjYEG6zvI/lpWTNHS4qvqDGAwXxJ2eZxmI
   F7i7ydeQUDRORh3fORjqKNKYU1T6dOXOC2psPLQE0MuZ3lTQgOZLAyRPo
   KL3UR5KV0g2Kqjv87UzpC3oq1MSftgnGJiQG41v0Npo1OehWeH4/WJWNy
   A==;
X-CSE-ConnectionGUID: YV+djZ4HQpOJ//ModV9smA==
X-CSE-MsgGUID: qgS2HDyeQ8GBOGDBhasHKA==
X-IronPort-AV: E=Sophos;i="6.27,219,1787011200"; 
   d="scan'208";a="34194039"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 14:44:50 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:25942]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.227:2525] with esmtp (Farcaster)
 id bbd993d7-ec4f-43cf-bd8f-d5b693ffc5aa; Wed, 18 Nov 2026 14:44:50 +0000 (UTC)
X-Farcaster-Flow-ID: bbd993d7-ec4f-43cf-bd8f-d5b693ffc5aa
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 18 Nov 2026 14:44:50 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 18 Nov 2026 14:44:49 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: NeilBrown <neil@brown.name>
CC: Miklos Szeredi <miklos@szeredi.hu>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, "Bernd
 Schubert" <bernd@bsbernd.com>, Jim Harris <jiharris@nvidia.com>, "Horst
 Birthelmer" <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>
Subject: Re: [PATCH v6 1/2] fuse: add FUSE_OPEN_ATOMIC
Date: Wed, 18 Nov 2026 14:44:37 +0000
Message-ID: <20261118144437.2485284-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179340054030.269288.17605002354655480101@noble.neil.brown.name>
References: <179340054030.269288.17605002354655480101@noble.neil.brown.name>
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

On Sat, 31 Oct 2026, NeilBrown wrote:
> Thanks for clarifying.  My only problem with the patch was that I found
> the description confusing - everything looks OK from a VFS perspective.

Thanks Neil. I reworded the description in v8 based on your feedback:
https://lore.kernel.org/fuse-devel/20261110204421.1251726-1-jamz@amazon.com/

If you have time, I'd appreciate another look.

Thanks,
Jimmy
