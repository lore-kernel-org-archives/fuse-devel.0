Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA36370AEB
	for <fuse-devel@lists.linux.dev>; Mon, 31 Aug 2026 19:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788203953; cv=none; b=sHTyybgoYKK7Ro2quxh8yP4Hbmah8z6YaiTwXPHmVAxj96SZ3n54KdzSzDrugC44OqKNppD7cT7aoPQcQuzMcV6eL9dYsRS18TWWvJKOfcd0s5emY1k4pbkwbWHG9e6Us+IUP0D3GXJZAiEm5C0q4o6r/M3aw6r19eX9wO2PX7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788203953; c=relaxed/simple;
	bh=iHt4F7gKW4GZhNyrbNFaioJ/Hgf1oUU9Tj4uky70FvI=;
	h=Message-ID:Date:MIME-Version:From:Cc:To:Subject:Content-Type; b=FgZet98p0QBkwC/3FCv3yTAzbwL0uvkoo5FWnxqhRzUPAw9M0AbeES2m5cTQfPdZZkhASqEZRR8YkDFWrDeMd/NLIydccZZSxvnewAlMjPywQzRHeW4eYkQMhZk/2RzVqBnd9JnQg5+zDooL+LUJ1O2ZtVqovoVzXDDC01S2LEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=RXrrDzi+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dRdEiT0M; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="RXrrDzi+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dRdEiT0M"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 1E83E1D001A6;
	Mon, 31 Aug 2026 15:19:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 31 Aug 2026 15:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1788203950; x=1788290350; bh=iH
	t4F7gKW4GZhNyrbNFaioJ/Hgf1oUU9Tj4uky70FvI=; b=RXrrDzi+YANL4YhJmb
	smONGgfdXPqLAGHtkbFks75Ho4iQ5COVu8717uN4BnMwIiyZjArKmi/u32IMMh3G
	Xg1IhgvIDeNV+dKGUQXUWfx2wKDbyNai0o5RuFAm/ZFIYI/FOlkbvwrtRfQDHpRx
	dout82fsKR6gx6xsR19HEOclY1dlIcrsHazRV2FD0X4fVXbrurvwHMzT841FxH4O
	5IJef+Juek+C6iS+L/zdJyy3TB/uJamuFLUiDox6HxHL6HrvLTmZmZg43NYCYRvM
	yw7O9E+AOwqC7O36kVTHsUPRGPvbQvTNAGvZBPvZ5zkjqiguudSo3xVP9PW5VplA
	z+pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1788203950; x=1788290350; bh=iHt4F7gKW4GZhNyrbNFaioJ/Hgf1
	oUU9Tj4uky70FvI=; b=dRdEiT0MuTyqyrY0BtkNRFgxL1F7DNovmOnDJXNOP65o
	ARP0L1osnsv8lhimT76ufDWMJrE6n3DNJlnjKUnnZqlhGHqm7ckHx2gDL6ZuodPj
	GYusRpqg2NsFRSoxahWtfM62oYkb9VnqYtvpC6lBfJpvO4JzoayZa3bR52V3e2x8
	yLPFUbYbvCyK5Er6kbOSi02WUhGtmFpLd2j3hGNTIdfu3EqE1omrAsu4xav3VMmI
	L54L+7a9p1wbBLVpqxEkoEm6MSwqMWV4RB/ozvXtdTMXXeYu+ivyV70R7YYdyQSS
	CdL3w2ue/zje88pYCuyBea7IDspFos+HeuvYV1ZJvg==
X-ME-Sender: <xms:rtOVaqt6t8A7ceZSZhY5pI7dTK32825jRN37y6RA_D0HU5mu8DdNJw>
    <xme:rtOVam7Uyvc96fSAiV_41ejbof2YbrGYLwJku7wRfIlOEFLmpWsg_bGh815iVb2hS
    Kv_3ep8QAve4J-3ckZe8tVcMtXrbbrBW1R8dgY6hJOsLXIX9xku>
X-ME-Received: <xmr:rtOVajJPHSqFLyWkm0bv3lWwHu63gH0XNwauoOS2t4GBQSXn6iadjJUPaJheQb7037D-Py5xzUgtw4KjKm8wP5FMDYKE4xbEovCruKqtL2mk7Ktu6A>
X-ME-Proxy-Cause: dmFkZTEH91IYc5H5XDTT2fZW0oIe7OzDRJbxe5bH5r2AZG8Q2Hv43K8Xrj49NOFLdq9bOZ
    BPQXcYvYJ8FPCeJHx7F5y/kI0hqfOoIeOupzTJSs2ONqh9LyDolhF7QHxcAyG5Ayofksre
    P7iOWg0EsUWzVoAJLgAK6DnD+EiyN3lr2KZoSy9VGTmpw33dA2p1LqwtQeeU4iB2YykIAj
    zA6nCW/QtF4nfbrILs1kFBS7b72olHGA3mPQ410+oV5n8wd8hGuaigp3ZeXDMiMAvjzeIl
    FxSsLYoo9I1myFEmhK5XXrzMKOpXUTMrO3mvUJc0QnpErWq0+RT561z3jIt6LhQLV8yIDf
    rbgLNKTphkYGvWC0Pkvywuu4zaGfB+DYgKgq26boGaMpc6/Ti14W3Y1li2YfhEMZ9GJGXU
    lSiVOknet3V4ruZ+eF0+/q0SkxaECdDOkmDxH0l0NA7rejaSmzP73D26BAZ6y7rei1JfAi
    fxllYUgTMu2dQKl12QCyZp+7fXK2rYhPaY6O6stMfkpszYc5k8sg/D6VXfTyOznDOx7VUh
    OBHpznik7C+xHWu0AoW868CsamRl21NaywDH2EcsmbVCTDzDX2aIBjzOZpPAxGHHReEc6C
    +gQ+nUvLy82PPYXH0pwN9IZNYWuFIRANHftIf18MaoMvR0eyQ9vh5QsoxZvQ
X-ME-Proxy: <xmx:rtOVau4nhIpSQ7q2X1cgiHOFbGzoDWrDBqxNz4ttRayZYv_upKLZlw>
    <xmx:rtOVauxP7lN98-jv8TYua0-mKhgScT1pfye9v_TDZ1NTrnjONL3QBw>
    <xmx:rtOVaqaQZzgLvyvV-40WqUv8r8gr_1VNcnVwtme8u3Fae3H21jg1-Q>
    <xmx:rtOVaoTE6Mpx2zbsysONV4ZuGtVnXRcLqisog_ExNY3EDN6tLY4sHQ>
    <xmx:rtOVarkH2e1muQaQSTQSD-0CJVQVl-S4otUwb_3nZNOY6xk3WPpo6pos>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 15:19:10 -0400 (EDT)
Message-ID: <7592d7af-ba3f-4506-a69c-ae9efa542566@bsbernd.com>
Date: Mon, 31 Aug 2026 21:19:08 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US, de-DE, ru-RU
From: Bernd Schubert <bernd@bsbernd.com>
Cc: david@adalogics.com, fuse-devel <fuse-devel@lists.linux.dev>
To: tofik.sonono@intel.com
Subject: disabling uds interface by default in libfuse builds
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tofik,

there is a report from David about UDS and while checking, there are
actually more issues. Reason is that libfuse does not verify requests,
but trusts the kernel. With UDS that is not guaranteed and reads beyond
buffer size is easily possible.

Any objections to https://github.com/libfuse/libfuse/pull/1602?


Thanks,
Bernd
