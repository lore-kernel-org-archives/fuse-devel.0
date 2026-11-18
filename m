Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.12.53.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027270;
	b=nUhv7aoy1oba4a92Aq9j4wXShDyrIxpePt5C3ClQBDvdeetSiakx3VSBQP+LbASkTemf
	 6J25UKpSWX4VAzVK2gIN/yXkRLppB6DyFnz0L5YUxsYO5PcKVeQIwg/7HAz8jpFzSMDDn
	 ZwqcRPuwLDrZZheoYbRSUOZgsA6mG6NRoAZiV8Tl51Mi3I7xdJKTX7MKsCAG2Vo0T9Qlk
	 f1ikJrnvjudUG+ETzeQVD++vbJe+5ie9xZ1+3dWnpScSO2gyCJzhAMu32vP+tHRvZvroa
	 VV8orTRMumTMqN4gXXwVcMSIs+KwRRrorNpyum0SSaYUvId1h788KNnxERLPn+wBEwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027270;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=QeBBXOlfrLNkClrMkLRqTkyWIPY5S5c/FDhckbc/h5k=;
	b=B0uZ88HWYrNsnm1hGYeL92CsrjduwmzA9qkXTsSyFtQxmXN37kKBX+ig7ABkSwspeFOr
	 BT4EpV5cdfZBlj4TlmgGsx+vmkcSV+gWKRbXLJSWDYE/w2n7uL+piE6ZsHxQ/Sdy18Fh+
	 2VhiXFUQGEob0sSrp1MIZ6BddlyrgurxJDdepRoCNZcJ1Be+oM9CzMR8hpw1Z4WCaEv02
	 TdBzriQLegJByyzlnkAzUNYi15Ws6Vw/qdya24RWBGxRcGKJzCS0gT+d4eJERxMA2W4RC
	 334M+ySewxA5KdYYDz3ZaMnAK4h6b1vwrJrORd3TWU+DBXIRF+Zv5IwwxW0FOwyoD4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=q8BXsBcr;
	arc=none smtp.remote-ip=52.12.53.23
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFBC606A332
	for <fuse-devel@lists.linux.dev>; Wed, 18 Nov 2026 18:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCFBC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=q8BXsBcr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795027269; x=1826563269;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QeBBXOlfrLNkClrMkLRqTkyWIPY5S5c/FDhckbc/h5k=;
  b=q8BXsBcrf7VLcl3QSPaIm0+hQEekbal34Yu6yB0JB8Zf+30ePv72vjdC
   glqyS7SFG0scij8m6/z2CQKtDhIK0Zc2Yz0yN0VZ+t0AGGXXka3O91PEh
   OA+Wev9w1N5Q7srCj32vUQlWAYs+qBZzyNxvt6bLpiR0U1vI1dLA+Idke
   XbtPPcCmRtt+HmC0pFWerwcnEUxI1BSG/LJ9CLYOQVEfIHnwJtnYO5axe
   W1O60k0m1lBwi82szKWNPFyOvcaqi4DXzJkUN/Y/mdEsn3OLku+CuZmO6
   eP7S4dIshHgUlLn30JX/2Csk3oc7SRSD+uh+l4/XgcJYECSk5SnqnbtYr
   w==;
X-CSE-ConnectionGUID: ZoBT2TxJSBK8JWyUhHdQ/g==
X-CSE-MsgGUID: gs6TZ0Q0Sxiv9o3wGAaKlg==
X-IronPort-AV: E=Sophos;i="6.27,219,1787011200"; 
   d="scan'208";a="34336987"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 18:41:09 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:24888]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.212:2525] with esmtp (Farcaster)
 id b365bfda-2b16-4889-bdad-109873107649; Wed, 18 Nov 2026 18:41:09 +0000 (UTC)
X-Farcaster-Flow-ID: b365bfda-2b16-4889-bdad-109873107649
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 18 Nov 2026 18:41:08 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 18 Nov 2026 18:41:07 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Bernd Schubert <bernd@bsbernd.com>
CC: Miklos Szeredi <miklos@szeredi.hu>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>, Joanne Koong
	<joannelkoong@gmail.com>
Subject: Re: [PATCH v8 1/2] fuse: add FUSE_OPEN_ATOMIC
Date: Wed, 18 Nov 2026 18:40:57 +0000
Message-ID: <20261118184057.630761-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <fa582b7f-23ba-449d-b311-20f6ac8e867c@bsbernd.com>
References: <fa582b7f-23ba-449d-b311-20f6ac8e867c@bsbernd.com>
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

On Wed, 18 Nov 2026, Bernd Schubert wrote:
> We happen to have an online meeting once per month and the next is tomorrow,
> would you mind to join?

Hi Bernd,

Thanks for the review! Yeah, I would be interested in joining the
meeting. Could you send me the time and link (presumably off this
thread)? I'd love to find a way to improve performance for this routine
pattern in FUSE, but I understand that it is a bit challenging to model.

Thanks,
Jimmy
