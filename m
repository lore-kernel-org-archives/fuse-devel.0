Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E16447D44D
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 17:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913123; cv=none; b=GjIqxwzcXbbJ/0TtzUDX/9BST4BO1Cuo1QrV6gmGyLHp5geEfheIDOze438X0URGZlk6LSdG6HSBuN/3rKfj70zj8du/F/pmeYS7u6hMycmAobSNeSfJMnoWXxdCITxqhzoIn7QeqL1feinbHgxd+uGA1P1BQa7AomO17dIzoTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913123; c=relaxed/simple;
	bh=FwDdcTmCWF4RbyY2w5PWIh2mtFCVsrTgs1Yny5lo3YI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/fIxLLgka2GXqm3FyMIVXvPtHHhEPNfzB3fDx7d5yFLNoXkYBTXrLIyBknmc59K7llLuOFKC17Xip3I/wC3PDFoq4ZlvC26MYOA72OdKOHE5/qEBxfN/UfNca0EJJNotIzKdn4824bgo9oumU/9Vr5cmqYGjh+eS9BdYFm3+4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=s8KRocTp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gAmR7xuP; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="s8KRocTp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gAmR7xuP"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BA41F7A00A5
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 13:38:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 13 Oct 2026 13:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791913120;
	 x=1791999520; bh=QvvcV+a1/vxktNn7c/X89Zyja/zLkvDZFTDSmDY2H8I=; b=
	s8KRocTp0VD8+TaHAELZq0OXuL91hfwynfXlMrLIhltku1vYTd/M3w5rDyJK7ETO
	OdwjkuBLTMxkkkJ9cvTWoNOor4ocdDmX/UG4cl4pIu/fuOUxSgXQCSLevTQ+9KqU
	ExPSE8LvHZZ1qrGz9zGcv25HBAHa4jXkT4b/0Nxkp0rSgHWgh4r030xIRFUJ20lW
	Lq9s8kxIe83X894TuyA1D6s7bEp/g5gnTG8Ast27wBFgjDUS2GGzc3eXew5zQxwc
	NAO5dzIR1d4KdGZk6acmGI6BRRz2Ic/tTXZfAY8PZPnnq6pyHdDsPbsOIC6vhoTh
	0jzBj4F7mRg1+uoVGM1B8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791913120; x=
	1791999520; bh=QvvcV+a1/vxktNn7c/X89Zyja/zLkvDZFTDSmDY2H8I=; b=g
	AmR7xuPWFupIg4j0nG39qOquW3TBZeeyUnQQcQsTD6QkKYdSmZNBWh/eK3QESXU3
	1V8CV1/bxn+iJmATBMA05aG4++6hBACSQePlQN/m4DM7PeYQLtkc+/0pew2aGN1u
	2wA6rf4RVoRIlmrQRniftWxgAd/cnliFcl4n00+uiMv2Aqa7Jvwfp/qRacZo05sV
	LlToSfU5aCtl3E5scrOBUvMARgb6/C2uBme0YXg74b4dzBAupziSBTv2g26fCmjg
	fnvdXk7mF1q2AgaCA0hpBp/TwYcwdBAEXFyZwkxcQqHhts2pscIiNyE62Cel46Go
	vzNvSpGUEMFLfIg5XiK7Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791913120; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm3:rsa-sha256:lgDvWgA50WlJBPbtLDs5bgLAjugMLJRxHpDX8NNjAz5xLY9
	Ld+UJHzwWK+HKoF6N4xUa1/Jwt36+GoCMpNM74KobDaZHZH3QfUEcIbreAhPi/7O
	ZKUXkfIAgo+NPiilaWzuPX7v07QdAiCjQwmaTRHji0Ew6RTxZzqbDzmSM504S6iX
	gwYQ82wn2+iNxs4dROWCyJ27UQbPUixnSSLT40eSYp4DMFbqZ5bQxu7wKs48r/d9
	oFQOQVoMcIXn3V9+xb+cYnh9egCmsZzHQY4AgtT4FG69HejlKwVF0/JiFE3gNJ9V
	+achHFOJauRWke6R+0pPgcfnKmBQRhIkj5ALb6g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:arbMnul8lg6TqKPn/rN34TkLYZaCsL+W2SJ4Kz7w84U=:FwDdcTmCWF4RbyY2w5PWIh2mtFCVsrTgs1Yny5lo3YI=;
X-ME-Sender: <xms:n2zOamOqB-691sC1FN2uTq4gpuwb0aayGfxbg5pDJf4bU-52rDnYCw>
    <xme:n2zOauTtiQ1ZwXQsErKSWh0_NejbjNFNDi3RjONA_a9kj0B2DazCz4k8eDQd6Zqfo
    xt_puM2GOK-w6LBxhHwF0HFIIB27XsXOIVBocEBw2xVZp41y6s4nQ>
X-ME-Received: <xmr:n2zOakjxGhy7-IfDcr8agqL5xJ1QIh3a54VrKdVGI6UAH4ugIWDVOOXVgazYM9Ga_x0iV59shM242VWnqlEUdY-6K0SyhwRusKxVnqDhU94FGBTIhw>
X-ME-Proxy-Cause: dmFkZTEl1J9Bqdf9JqzIZ4n756suQomhtyOTQhINuClW51YjuH+W6DwoAvAhMu9CX8QQXz
    wXW7P09S45msYx81KLRNDDdDD+hhxiuHDgs1k3gnTConPNyv79uJ2WfxcRzWM3w2Fou9xv
    k/EvVENd8ccyf7KGcjl4lTBH0qSrhpid0+vhT6+6tlr/aMMvXq/F1iRJWM1MaCBl+Xv6ya
    p3N3olTXwDNnVMgO6a5aCci8YQ/0AMB/m+ktwCEooVvL0LEN/TDHsnQqt/S0/qfwVwG/Jr
    hnDiG50elo+hwgY1vdR/34b/FWeCec8rqhQVOPDB4JwV15Mkmqkk7ZnlJrTgSLXYB4EpMf
    GOSIaumAw9wOq9mV+VUU73Gs+8ssUdUTWGmmOAZItP8UkQvWIKLUk3w8snu4JmSnwHQQ3H
    HSB4FTI8m9fIAS8PPC9JM8H6atNn8hw6+kSF41mJn3SzSkSLEyNytbVCuGwIMCSsnm38Zv
    GIUP9meI5QxZDyxXCf9Kca37m8k3s0M+iSqS5V4sf+RtskXxfNqPdiRkyI/pmfMMUljNaA
    3+gWiWuHIY/74LG5tEQI2WKed9nbBF4Z1VJ3mIHENFgOJIzrTcQdX1aTniAGy4dv8hWy4F
    yz3JuK83BK/ZqbGNq75BmJSWKZeieEpLFBkQ7L9i5dQqIiJzuV0HILA/pEYQ
X-ME-Proxy: <xmx:n2zOan-Kz5mFa8sq2jOfKIuREzeHg-z7dJaTwG1bt-xfLdt1Q5sLLA>
    <xmx:n2zOarGI6NBr9fCIYoXIHmPMUjKfdVujCmYjn4kj2BC6dNXogJ9PQA>
    <xmx:n2zOaqk9y12XhytsmHZ4DaA3sc4x6ek1CEVpJJYAxnQE5Ib2G38fCw>
    <xmx:n2zOavby_tmrqQnulUHc0ASYND3L2-FrI03YPiluCzRhfT7OyNS23g>
    <xmx:oGzOahEH8GTq5P79gYXB6EyaYwxh7LMkltDrnpIhW9t-Z1Pazs8Luk3S>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Oct 2026 13:38:38 -0400 (EDT)
Message-ID: <c298c696-d10e-494b-b048-186cdd3f360d@bsbernd.com>
Date: Tue, 13 Oct 2026 19:38:36 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] fuse: convert the readdir cache to use folios
To: Tal Zussman <tz2294@columbia.edu>, Miklos Szeredi <miklos@szeredi.hu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 Joanne Koong <joannelkoong@gmail.com>
References: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
 <3dfb90b9-e1d6-4a0d-899f-5db3160cb31b@columbia.edu>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <3dfb90b9-e1d6-4a0d-899f-5db3160cb31b@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/13/26 18:48, Tal Zussman wrote:
> On 9/24/26 7:42 PM, Tal Zussman wrote:
>> Convert the readdir cache lookups in fs/fuse/readdir.c to folios. This
>> removes the last caller of find_get_page_flags() and one of the last
>> callers of find_lock_page().
>>
>> Based on fuse/for-next.
>>
> 
> Hi,
> 
> Following up on this. It'd be great to get this in as it would allow us
> to remove find_get_page_flags() and find_lock_page() next cycle.


fuse has large folios enabled now - the patches need to handle that.
Even if it would not be enabled yet, Joanne had spend quite some effort
to enable large folios, any change that tried to rely on behavior would
have just increased her burden...


Thanks,
Bernd
