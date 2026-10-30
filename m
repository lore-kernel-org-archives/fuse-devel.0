Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385403;
	b=4la1RP+jPtL4Sz39FGh6u/A5hotwb4W5htLTbXAWri2hllAMXL4KBF7+j+0IRi0/S8Br
	 JrPxiHs77dm7RIcKFJ8Fnjdpjc9SOLHsfJcE6HkQFIR5zpEA0L+2Cbvx36GcnXKUHAeXU
	 k+csj57xhlr4gdbgkeMDjdbIxyKtcZlZBB15EPW/4QwEcJo9JVFsPvLVosV8vvlEmBzhy
	 Rjwh47iIJwBmA7Bv442qD3YwulLVwJNz/zVh7XVCN+hgtkNUWRkAmwWqQU2wlo2XMSOH+
	 ywNGKWwrgEAT0xMoC3qxwnKOAGm/fRxg225f+sY8Q6NppfvB4X9nqr41ekCpVrguxDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385403;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=1t9+4vkPL/biYXGFrfoKrzKJULEQM0zn032UNq7ifM4=;
	b=J64UaHt7K5ch5Mc7gFfuEDPzoEMGs77JTk7IfMoasI3VoysKLtJAvtphK3FmtevQc/9c
	 eB54niXU+ImIJMdc/SBJq5TFfG03PxRMrvfrrsmJWKzCpVR2rjefz69ujgZVHsmIfV+DL
	 a8YK412TEYH/5KGoapCw+fwW/mI6E1wO8o31qYNP6dVYSe9LfHX46Nt1GoUbfmLfkfT6T
	 Rg5bbHtb3ob21x7ptOecfCkVtb1YZ/xrFScxQHoEH1bNsU3sA+MOWUKLL7/jMpzlv4dX0
	 iu9vjL4US4oyLEM/SiMYHA3WQRWLBSIIwEAHUSM7s/1WAYSoXQVrTHHOrQZMjGP60aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Li0DWd72;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A75606A31D
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 18:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58A75606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Li0DWd72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793385403; x=1824921403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1t9+4vkPL/biYXGFrfoKrzKJULEQM0zn032UNq7ifM4=;
  b=Li0DWd72Rbzmy6m4qRsZWOWkFwlHWpcdAOv9NmLovjkCiLbQ9pXlnB8k
   up3Er7irBTtrfHMAXKsrAKiVwGAWdc6O5jEOuRl0H+xAP+fL2EvJbYZeH
   FUuUFk5zr4VMYH984o+y2XiAYxUXz7Oj23nWFzgcqRuyzvsn1Rwqk2IaN
   ZmOM0WRmvvucGl+h4w+kfAdpOFTQ0PQxqGFdL47HtundTVfAlhpHc4em5
   WfT5Xd9zbT/6XXQucMo/+Bn2TQLNcDlS0o4bGyAUPLyk4VO73ppPtnF6D
   W/zN/uWlK+zOsxpBU84yKBmDCcIIiO8bvxwqFuh7ToFRWykL0ohZPs62Q
   Q==;
X-CSE-ConnectionGUID: VQFaTsuISZ+CYRqnY39gfg==
X-CSE-MsgGUID: /FcxKp5jS9+Zy7uHCcSSKQ==
X-IronPort-AV: E=Sophos;i="6.27,186,1787011200"; 
   d="scan'208";a="32463827"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:36:43 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:6113]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.15.208:2525] with esmtp (Farcaster)
 id 8eaf1e5d-ca57-4525-a596-d9afe06312d5; Fri, 30 Oct 2026 18:36:42 +0000 (UTC)
X-Farcaster-Flow-ID: 8eaf1e5d-ca57-4525-a596-d9afe06312d5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 30 Oct 2026 18:36:42 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 30 Oct 2026 18:36:41 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: NeilBrown <neilb@ownmail.net>
CC: Miklos Szeredi <miklos@szeredi.hu>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, "Bernd
 Schubert" <bernd@bsbernd.com>, Jim Harris <jiharris@nvidia.com>, "Horst
 Birthelmer" <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>
Subject: Re: [PATCH 1/3] fuse: add FUSE_OPEN_ATOMIC
Date: Fri, 30 Oct 2026 18:36:31 +0000
Message-ID: <20261030183631.2126171-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179331349568.1157394.13124360154896615084@noble.neil.brown.name>
References: <179331349568.1157394.13124360154896615084@noble.neil.brown.name>
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
X-ClientProxiedBy: EX19D031UWA003.ant.amazon.com (10.13.139.47) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On Fri, 30 Oct 2026, NeilBrown wrote:
> The /proc different seems cosmetic and probably of no consequence.
> The nlink issue might be significant - I cannot say.
> It might be nice to include a comment where d_instantiate() is used,
> explaining why d_tmpfile() was avoided(?).

I dug into this a bit more. I couldn't find a FUSE server that actually
implements FUSE_TMPFILE, besides the example servers in some FUSE
libraries. However, switching to d_tmpfile() is a behavior change that's
unrelated to the core of the atomic open series. I'd be happy to cut a
separate patch series for it if you think it's an important improvement,
but I want to keep things decoupled. In v7 of the atomic open series
I'll make the "why" of d_instantiate() clear, i.e. that it is uniform
with the rest of the fuse kernel module.

Thanks!
Jimmy
