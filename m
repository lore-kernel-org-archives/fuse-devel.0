Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.13.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792633560;
	b=aUR0feGmi6vwkMbSqAw0qYHfVY58p/8dsT4UMKqa9fbUTUDfJmAxvL/0Z+pAZGB5Tk6Y
	 kgT5kWP8txdYjjQ+f+rsFuiuR0nvAEm3PO7+lnu2OMlaiSHGGwvD3O2CRgPpiEI+JxSBu
	 KrKnDdmHFqrvxjUBt4d+CnRdYMiObvhxNcYRQcBf6pz1/62OTax1GH4YZ6TuswKE7Ptdh
	 lQWvEKfVQNl88LxLWJjugjNcFg9LWladUwOZBVuMznS9N445lnlym3gHeVb+KM6/RSzMp
	 /cdc/y/zs/1ndRGxAWItrHCjUDeOMyqgfK8WLq4JyHPzWJBe5IoyVO9rPEvf++i43tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633560;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=xLMB1ywrrTdxqIzhaTH+VUPMZLazifwWEdIjfFjN15c=;
	b=VsAA3nxQkM5Y3RvazfaoShgpWI12oPTaNDgNt9oq/UXXRHhG2qNEKOhC0IxK7VClxbVX
	 SuqiBBWQTES4bb5jYGIfJZ/5hsaqLjDkz6e7ZDGH0wAOm4oNjG93zYed5I6vS/t4+X/a8
	 nHJ5B/7nIqErw7rP+QKwbwk1o5ervsfy8fXMauZUi1qtNQMLGgD0Ongg9JCAGUh6ldZ++
	 FJvXru33DEOhaN0NxLm4QmXoFrwF2stoMfQqhmM7B09z+BC2IePbDY8eHFXOdeKMBOKsJ
	 C8a/19O13iM8+ZHv5sN1OtloxRXqk0+KknaogJDGQssuftWv9djUzEs1h3VM2HiHGfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=K7fIJAml;
	arc=none smtp.remote-ip=52.13.214.179
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF98606A31A
	for <fuse-devel@lists.linux.dev>; Thu, 22 Oct 2026 01:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF98606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=K7fIJAml
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792633560; x=1824169560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xLMB1ywrrTdxqIzhaTH+VUPMZLazifwWEdIjfFjN15c=;
  b=K7fIJAmlfpTGy8djOCfJv3Tp50OIZLC1TdIdr7lCGZwQleNA/a9c2Bu8
   sG/shg+u4gdE7tlCnUAt8JI57+qQyVsUYwj1lAd9fJhBDO7seFT0Q/il2
   PTf3Fw0SiZ2mCnekpSzs3lAP2C6iH5eJeB0xYYdUiGwknCToohvAyvhpO
   BwQdbOGbqC2H7uDCMlKKsUKVb6/kscRHUJJnp9laUhUvVWbReC/FywseU
   VYOx/Smnb+Pf2HFMb0zKFdIm1Pv7+ai8R7WchkiUSCoMUTpkpO5fcaw8u
   COaUIf1TWmDNqSI+cGYHZLEEsPk9tY/DlujBALl8RegEYFE2IFqY/R90A
   A==;
X-CSE-ConnectionGUID: e+B/0xB6QBiioe/cuu886w==
X-CSE-MsgGUID: 6GDiqCXmSxuSoD7r4fsKuQ==
X-IronPort-AV: E=Sophos;i="6.27,171,1787011200"; 
   d="scan'208";a="31900364"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 01:45:59 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:7746]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.154:2525] with esmtp (Farcaster)
 id 68ea4192-e51f-41f1-aced-bca14cffc124; Thu, 22 Oct 2026 01:45:59 +0000 (UTC)
X-Farcaster-Flow-ID: 68ea4192-e51f-41f1-aced-bca14cffc124
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 22 Oct 2026 01:45:59 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Thu, 22 Oct 2026 01:45:58 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: NeilBrown <neil@brown.name>
CC: Miklos Szeredi <miklos@szeredi.hu>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, "Bernd
 Schubert" <bernd@bsbernd.com>, Jim Harris <jiharris@nvidia.com>, "Horst
 Birthelmer" <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>
Subject: Re: [PATCH 1/3] fuse: add FUSE_OPEN_ATOMIC
Date: Thu, 22 Oct 2026 01:45:45 +0000
Message-ID: <20261022014545.2495106-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179253863737.1724252.12836488084615923712@noble.neil.brown.name>
References: <20261020141647.3271341-1-jamz@amazon.com> <20261020141647.3271341-2-jamz@amazon.com> <179253863737.1724252.12836488084615923712@noble.neil.brown.name>
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
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On Wed, 21 Oct 2026, NeilBrown wrote:
> > +	d_drop(entry);
> > +	res = d_splice_alias(inode, entry);
>
> As of f1ac607f786f d_splice_alias() handles hashed dentries
> and the d_drop() is not needed and not wanted.

Thanks. I'll rebase onto 7.4-rc1 (will make note of the dependency), which
has the commit f1ac607f786f.

> > -	d_instantiate(entry, inode);
> > +	if (d_in_lookup(entry))
> > +		d_splice_alias(inode, entry);
> > +	else
> > +		d_instantiate(entry, inode);
>
> Similar to above, d_splice_alias() is now sufficient for all cases.

Thanks, fuse_create_open() also handles FUSE_TMPFILE, which needs
d_instantiate() for its dentry to stay unhashed. Otherwise I can have it use
d_splice_alias().
