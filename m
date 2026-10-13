Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E1252F29B
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 18:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915238; cv=none; b=ghXRuzVgIjUMCOVQL8p3MUa1EhNBgqpiEKez9VYLTxRwrujNUSB+54WGMjl89r7sVDDO2xYFqthWdpouC/7JlDk1B4IKPDnoS1Pv7YvplVRvvJsWd1MMUuEFkOuJC+jL2eGL72aeAxNbgVFGpo7R4usAm2AjcUKpS4Gpe2F4lMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915238; c=relaxed/simple;
	bh=h5FQXIg46/WzdMHnSxLJ9ch75vB+gTmHwyBmjMT1fCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XdYBw2cjMoAh4hvtOPRo7oTKJY10iTbv2Hpc59tXyVVBOSqrAm73z0+XbrPuLxpzewbe78BP83HYwWDMBq7gC4fIqjS4CUFPMLjBcpfLPRhK90eJ2q86GgNUcqVghHi3hxqOOmbdweUwaTi5jTpt2mGMR+q0dVUw1yTnn4KrpEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=ApNfbTbL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RC2XjDKl; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="ApNfbTbL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RC2XjDKl"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 7EF64EC0A64
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 14:13:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 13 Oct 2026 14:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791915236;
	 x=1792001636; bh=qgi1DuaVKGgxY+t78ffi3qjr9jDrmiNgBIKWwcQNfss=; b=
	ApNfbTbL0XG0d2wwPl8PCL9oOW2D9YTrp53gxV9uAZx8tya9/sSpoylx3PkXp228
	H1WKVrxmRliNU0MSLBaWwIWYiP8iJg9UIONa3eQK/73Hve+GTnBbNn5E2ZNPuQyU
	5FXra1MH3PXtVV4YxcK4TopeuIz/fFF1C0kiIxQBlYkl66UVcq1fL3vwRZ9M9aOk
	eih4rtdLSTkFdZ8BJnUv/3/Ln1V7r0IgxhrLVTONvj+kjtk+ksXm2fi2HMA8kOkI
	02LGjkoowoaKC+ctmQ8aTkNqGvkRb0TZCuhOqnKq4ZOLV27w1nClxHYkNr83w6gR
	K+mr4YX3Q1ZG8AsIIAIKxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791915236; x=
	1792001636; bh=qgi1DuaVKGgxY+t78ffi3qjr9jDrmiNgBIKWwcQNfss=; b=R
	C2XjDKlE6oQk0ZqZklXqkzi50yEdz38macacEO6EBBk+m1hePckNk4ffSdUz0R3O
	YiZaz9w0nHa2XJS/bfBwiNIitVuVTweVPnuyBfxK+ZQkNGa6tUUV6vmXsBKuop//
	2ZNweP8WUx2fwH1VkD+s5Qy92Ma9fJdmkwr/zpLI2OnSC/MyNy3sBje7MBEBtOTe
	7UD+8oxXMmMe+eElXpEGKY+dLEmC6qt6gUpExObPr60C/V7G+1MQ8Y5SdixuECGf
	P26eoEtUgYEPO5++wHonxZMUJ/kpkPevQMfdcgev7fvjCGqYgHrexLxeerXD12+z
	xPCh8y5J0wacJcRejR9QQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791915236; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm3:rsa-sha256:XHuUgaXEfqfLT+/7bVMOQKg6/FEjt5fm6WyDPwkNwZE+zXJ
	Tpz1CQUh0Ub5AvDvCj4cY+UTEmIOVNWyF7dPVR6jCg0CMWZ4WOIN5OBH8XV+Nzmv
	lfWFsTdqdjSbqhGEL6y1rPcIkBGBwk7KGcTZkLKV61rfHO6jzXKL7L2M3HPkQNaa
	u2mgVgV7FD54OKjwSUacW1fdiU6ej397WosE1lhI7f+se3iclBuQFaWl+hqkU3td
	mRrqFxyGeoU02elQTB9tm6rMbz1T04fTYfBWbZTUjNASSe1hjw6+HZf1qmUZwmwx
	rAjV3yvimQ3YqMoMysgulrfXQwtExrsPPf6QqbQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:AjC2ag7CJdL9JMyd3fYoToIETKjKSpBCBfaFvvOSZWk=:h5FQXIg46/WzdMHnSxLJ9ch75vB+gTmHwyBmjMT1fCo=;
X-ME-Sender: <xms:43TOagatps4sVpj8U79ptOxRKJfAje-Fsu0W5gsxjuMFEJ_67O1gTQ>
    <xme:43TOasLeaNgKpgBbacADuqIUnxCVQAKxqqybc7joDJrDn_ynFNn3NCUs0NZhGTPra
    HnAP3FNN7AArivXboi5wa39S7nOmZUPrC3EprVue0VHZLzvOYlkMw>
X-ME-Received: <xmr:43TOanFD0YIVut9GH78Z_XX6pky3keSf0c2YxJMkQ4z4PEsQbKzTfLa_Pc41hPhJ_vubVw9Tx2mursN5xZr8P07UDEV6fdOuM-ytDdX4EFt1aMiKJg>
X-ME-Proxy-Cause: dmFkZTG02tikcgp4UjlgO13AEnt1QpG1KGh71qhDoGqnxkXfDaHXAEIbZ1OYpXjO+ZjK3L
    wj+GCwoI3DZGWy46me0tschGqmzHLz5vt8r6hOBmtr1wu/Otk5XIOId25yS+6e0OSwX6h8
    gRu9k783Cr2ve7EBA9NCgEGBlGF7ty0eigtQicANGXGPdwSZN9qqRKQ0ENhD3tWFSCtzwk
    PJ3FdD5KMfSUnJppJd1qT/FckUmZBNO+JqTEhKAFWuAcdT03TdKxKPR7FFAt4q0zfqwcIb
    efHq93owMfQLSpcEDe4rpp/TjWWyFAE2yGx8PeOeKpasuLkvY1TavliPQDSU6F/dW/PQnc
    LMlFIpt5ncbJdAW5pl08m5BKgt7AEoUGHnedLOyBXFbwDn5YvvNymyKD2PWllbKZRZe5Td
    DdNm2ujbggD+Hd+pxqlYGVfdPDZOyWDVGa7mtoFyDb68lAsrW0nnYVtPFb7dqrjqWI4w0w
    jrNl7xc/zJm1hvkc1zbzj+S0fY8hpsMlT9JNnV0S5oz55waQZTvFukXxZkr1iQAI4g4xvw
    QiKThkg9OYT48M/+hO6E4P/6krqqxe/SbgKWgujzRjX5gg6CcOtaG4aGYOU5IHmJAAT9Lx
    fg4NEVbh3uoZO4cTufnINOeKNDbUTH/lILxj7hyNrCjjq/5SgecQN0adXstA
X-ME-Proxy: <xmx:43TOaruz5e3538rqoGNHn1jAoT5_c8ENloSEjNI5AJFgm4Hk_Tk6nA>
    <xmx:43TOauuMeYMk33uwHRjQkO7NWUV9oChJMM9QB-21-8ew2RTxdH2cjw>
    <xmx:43TOahD-Q83Wp2-1EBW_nrPHqaHQ3gRSXcT8b4f3Wxdnc_jI99r5RQ>
    <xmx:43TOagP7pCE-9lYYqgpaAy8ME5O60mWBofBV207gy_J56nIyDV3l1w>
    <xmx:5HTOaowA3bSXRJHcRcpL48v9IetMywcRPiqB7B57bsReAzxHCKDh_7aK>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Oct 2026 14:13:54 -0400 (EDT)
Message-ID: <3b7a2fea-3fb9-42b6-aef2-d9770e3562d9@bsbernd.com>
Date: Tue, 13 Oct 2026 20:13:53 +0200
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
 <c298c696-d10e-494b-b048-186cdd3f360d@bsbernd.com>
 <5ff63ccc-3aba-4c4a-a289-48620f1ceffa@columbia.edu>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <5ff63ccc-3aba-4c4a-a289-48620f1ceffa@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/13/26 19:49, Tal Zussman wrote:
> On 10/13/26 1:38 PM, Bernd Schubert wrote:
>> On 10/13/26 18:48, Tal Zussman wrote:
>>> On 9/24/26 7:42 PM, Tal Zussman wrote:
>>>> Convert the readdir cache lookups in fs/fuse/readdir.c to folios. This
>>>> removes the last caller of find_get_page_flags() and one of the last
>>>> callers of find_lock_page().
>>>>
>>>> Based on fuse/for-next.
>>>>
>>>
>>> Hi,
>>>
>>> Following up on this. It'd be great to get this in as it would allow us
>>> to remove find_get_page_flags() and find_lock_page() next cycle.
>>
>>
>> fuse has large folios enabled now - the patches need to handle that.
>> Even if it would not be enabled yet, Joanne had spend quite some effort
>> to enable large folios, any change that tried to rely on behavior would
>> have just increased her burden...
>>
> Hi Bernd,
> 
> As far as I can see, Joanne's patches enable large folios for regular files.
> Here we operate on directories, which are initialized through fuse_init_dir()
> and so do not use large folios. In any case, these patches switch to using
> the relevant folio helpers, which would get us closer to using large folios
> in the readdir cache if that's eventually desired.

Hi Tal,

oops, sorry, I was bailing out when I read it as "this introduces
another stop gap for large folios". I quickly scanned over it, but don't
have much time right now - will review tomorrow morning.


Sorry again,
Bernd
