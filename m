Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.155.198.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793034477;
	b=Lmwvnz8P98s5dhx1QBy064HaU9Bid6tehW1gXPo28r3+a1NVR1BWlKtWYlm766gAgtod
	 xLuhuS/utixmKNVkyelScd57WW1/jkzJw9sbNvuBZdLtpfD7uWCnQKmDqzpq6MmxYmn53
	 V4UqGSi/ks++CpJfpxI3G547CZzGoJTO7MQAVCju3iKHbUeDU1D2aI4+gqaru+WcGJ6g/
	 RcWjbOhQ5P6I7vJuPWCeRwc+0lQJw91zyXa2bnNO/rUE0IREJY85O8fjiuNOj4z0+wDLK
	 jcDXSJwnxUTKx+1L4Ny60wnGCgPSAH0hz7Ucka0GulPQjh2XNcATRadMs82n34PuScw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034477;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=lAB2x2oWPGCU3jhrWUcMFJTd1LPDKstZwrkGxOY9+hY=;
	b=TzZF3FQcxdIC2XjftI7FYj3eLxJSVq26F5y4JFbwqystzNOu0HDq2vSiBgjnLAmPYvct
	 2wHWB1nKS9ZdOtReQaIsob9HgqFKAv1qItq3+pAm8gWNl8HISxjGJTreLGtLVOpohhyyn
	 NET9olWUSC2wSikGoFpanvm2RZzTVY/+kHt2G/kVgCkuBvtnH5sEsgzP9I5Cv3MqBZimp
	 pBeT5IO93WM+GsfZRf5NT2muG/JqEXF+h1lrdG1boohCxZi1zNW+l8EX7hJJWAoarAoGT
	 FBswIVsLKnBshkbug8llU17G6ZnQtKUyo5gKiqqV79/pZKKikTrcEzz4qLEOg4+L5xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=S4Riqiyy;
	arc=none smtp.remote-ip=35.155.198.111
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4A7606A31D
	for <fuse-devel@lists.linux.dev>; Mon, 26 Oct 2026 17:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB4A7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=S4Riqiyy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793034476; x=1824570476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lAB2x2oWPGCU3jhrWUcMFJTd1LPDKstZwrkGxOY9+hY=;
  b=S4RiqiyywlDif60S18Zki/3m+xZHZ6ZHHOsnIenbCQtzUyiZmM+Z6ipQ
   9sF655FsIgoEjXIabrM0fXrFz9CuEJNx1ijTJjMduwg4vk1nKWy7YCA+z
   GlZv/0sKy2o411sa+tFeaj1aQ1IUQ7dl3Rtzqouh5+IYVg05RCkKI8DEc
   spzy0wdRDbFUPaRgTMS8LePyxB99aq//p+vfymKvMZRrQkMw6Wb1BiYo7
   VmC/sE4WcmeUNsXTLjQ0+zb0HtINeCYBCe8gYyXUeEqKnVAysrOCSVSpb
   HPIO0Hy1fdQc56RxYRB1Hjf7+tk5HApumovbpxvITBfnwonRjSZ4h4ViN
   w==;
X-CSE-ConnectionGUID: F8VP6CjsSTKoCIZAgM3zcQ==
X-CSE-MsgGUID: vWYU8neXRW6yaO+vAFALAw==
X-IronPort-AV: E=Sophos;i="6.27,179,1787011200"; 
   d="scan'208";a="32176366"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 17:07:56 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:6494]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.188:2525] with esmtp (Farcaster)
 id a60b224f-e921-4505-bfe5-6fd6ab06f82c; Mon, 26 Oct 2026 17:07:56 +0000 (UTC)
X-Farcaster-Flow-ID: a60b224f-e921-4505-bfe5-6fd6ab06f82c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 17:07:55 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 17:07:54 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: NeilBrown <neil@brown.name>
CC: Miklos Szeredi <miklos@szeredi.hu>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, "Bernd
 Schubert" <bernd@bsbernd.com>, Jim Harris <jiharris@nvidia.com>, "Horst
 Birthelmer" <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>
Subject: Re: [PATCH 1/3] fuse: add FUSE_OPEN_ATOMIC
Date: Mon, 26 Oct 2026 17:07:44 +0000
Message-ID: <20261026170744.948701-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179264679002.1724252.4479504779598097455@noble.neil.brown.name>
References: <20261020141647.3271341-1-jamz@amazon.com> <20261020141647.3271341-2-jamz@amazon.com> <179253863737.1724252.12836488084615923712@noble.neil.brown.name> <20261022014545.2495106-1-jamz@amazon.com> <179264679002.1724252.4479504779598097455@noble.neil.brown.name>
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
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On Thu, 22 Oct 2026, NeilBrown wrote:
> Almost all other filesystems use d_tmpfile() for tmp-files (which calls
> d_instantiate). Is there a reason that fuse cannot use d_tmpfile()?

fuse_tmpfile() follows a slightly different pattern than d_tmpfile(). A
fuse tmpfile shows up in /proc as "<dir>// (deleted)", whereas d_tmpfile()
renames the dentry so that it shows up as "<dir>/#<ino> (deleted)". Also,
fuse gets nlink for the tmpfile from the server, while d_tmpfile()
decrements it. Reusing d_tmpfile() seems like it would be a behavior
change, which I'd like to avoid.
