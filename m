Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C3B31E842
	for <fuse-devel@lists.linux.dev>; Fri, 19 Jun 2026 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856603; cv=none; b=ZmH0UaIlDhJ8xNdryxzsgs7jEoo8w9x2yDGXrv0So1OCzo60DWjhYoUcs4bcYfcw2NrvPa0KgQsDVpz9IDm9m28C1HHhDn3KgiAh+bUNDFCaUesJg3OX2PDzZDwUtbZdDKS14eqGiIp9XbTLbZi3xqlgvYfERHg4v0CcAcTO6O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856603; c=relaxed/simple;
	bh=mIwOG1sqx6n+QnkTqXSI9z11jSkJkH+xDvmnHdUvix0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gb8Toj8/+mbdO9Gx6gGdUZMs4hzbdn5Amh7pEpItnf08TAzE8zDHeZegoV6XCNDCmBQKks2uLB4+N8hoeBFYpD8KHokSRc9CnjM1CMZaPplIvaHB8RV5++rUPcVbvUE/KniyPnY3yadO9pasHx2aVd5Qmf+99YY3odc3ouDl0oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=v90Cq4io; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AuIwxv+r; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="v90Cq4io";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AuIwxv+r"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 1CD75EC013B;
	Fri, 19 Jun 2026 04:10:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 19 Jun 2026 04:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781856601;
	 x=1781943001; bh=VOm0LnUZxc6zzlyi/bqBFM2WkigVbV6gf6J2XrjdR1o=; b=
	v90Cq4ioi2JHo+WfrrGchcUTaax8plmmSNuatCedeJkwziKPmfb1vfBEqLdp/wWH
	yKlAi9aX3P3hzrBicsZKUnscj/4RC1klP1q5p6zX/cx1C0ntdh/8pCcwr+UacSla
	2SoorP1GQ1QmKwMlOKh5FO4kqyF2MjNQq99Pzdr7N3ROfQsmLh2UmtR1g0YO5jN8
	Xq5b6/w5DmoQICwkaa//SzErui1wopFHO02yao5CGNPwfgpDZ0KiqEVkDiszpn7r
	bs/IbXVTcFulrLLBE5a+jj7cm8gPcOQgMwOEzN8xr1hnDe2y+rJ1wdSLHk0wxifg
	5+Jtv9l3NoTplNIDqHdKkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781856601; x=
	1781943001; bh=VOm0LnUZxc6zzlyi/bqBFM2WkigVbV6gf6J2XrjdR1o=; b=A
	uIwxv+rysgRNNJHB48NP1LhV2J4j+3qvu7qDlhRWXb2CIS/UBiGi0ws13xgnkDZI
	OF4j2CpnjRe2ZdSNJG/vUhYlSEvKvZkCdQO/VlHj7SV+NZ2U4KT8hL43QwHuCxK2
	K2C4yKDfCwlOl1l6k6yRH1L8qzjP2hHIVdyZddKa/DQSr5XGU/s5i3BUKsS+bjX+
	Pze+B1kVMUt4XQYZyXfrRCqvwQC0ktAKRfaUxgB6tbsTZyOK+m0qTSV9i6DucKfT
	rIYNA2lAkbMXWpTrURSy0Sujzker7Yxe9u8Ao9Ax4mpPZDi4IaDzPlnIZme5lSfC
	jgJAMd3AfNaIelWN4kL4g==
X-ME-Sender: <xms:V_k0apr7r6rh0NNcr4R_L-8FsxjDlgpJ0FmA2MtbKqAXuSC78nbA5Q>
    <xme:V_k0ak_s3yowvyBv6KJekOzkboQoMqN1QaRjoxNO_NRZyXIt4Rpb5AIXbT6MNV4zQ
    XPlZmg_STQRyBeAJ_JaVHmYVB-KSWfjS4HnrbwyyjCEKtnjqP2p>
X-ME-Received: <xmr:V_k0atdm8DA7dub4wlSHj5Zy2lscltOYKWzjjhQ2pyxPvZfosNRY0jX3wVl4ZS0_DDPpIWR0Wcv_qNk_sfHhcaXEhJemGLsr1JVn8DeNLDDY5XRXTg>
X-ME-Proxy-Cause: dmFkZTFUTrHu2zkOiFBff+dRuPEf+uLsePlQtF9iiIIeRyAyuqSD9cFLdMHBN9IBDwfZMT
    YPtVuvDJS3HOgkXP2itnIRggGFxXRFVK3BBwdRudlDVLxdkakl/lfbBLmrItmHGPLDu8YD
    /dbHjPO5uMuRtRfFUArNcsfPZMl4rKUcD08u3nhJYg8VAFb6kolI3SvXYaxc0egYGt6C9r
    1aMpYsexcm3HZVlg9Ft+0vUhMiVc+tfmVptSPgTxapupIpvCVHgrd2gLIAZEDJPcHBmgPd
    xowpeYTyyAES1BJQ7rcRMHoFaIUXvPGWXF12sSxs3ip4MY/Mq8K2XcEdZY12nkLJ/kYzNA
    4Ip7VuoyFT8u9tyROUFGyoHHuvo0vuMzndj4lbFzjxrQaVGNtVuxZbv6RokhwxObvC117s
    lXB5zfzztAlOGEYbIPCuTF1IpOrkHDRbV7XdqV2VIGyWvzLmayNzUerzdqpVzZ7O6K0jpN
    djoO7jfVGRYzFpi38bVQ6go4dEIoZ+yjkpaJt8RcBVXpAvtv8eDo0kyjV0tpVlnSKDk9Q3
    Wulei7qZz/Uphv+n7NSumo49wxklOS7Uhs859aqM1Wy/I0wCqpKVj3z8ZqujBh0zQd3aHf
    Hgfsk3uL2kamy8FxehzNyfweZc6SvvxYyqccbyKUtjLKIeZt5JmGsf+h8UZQ
X-ME-Proxy: <xmx:V_k0amISJaLY8mjJKlepXMQAP7_L2dRDWfFbiP15s6cHlJKPj7ub8w>
    <xmx:WPk0alhWrVQp_dKfzVWdnx0ieYYtJhkuD_aTX07WsH0IsXs9yU-VXA>
    <xmx:WPk0asTXTrGD1vk0XGnuLjiUrcBJNWxMU7x6U98SgNaZ96ncW0_SWQ>
    <xmx:WPk0anXSXyDhWn_rJ5ZEPFIsC1YStnbxMaNd35JEw80jIBiGqMLHCw>
    <xmx:Wfk0avIXHnjYmbt1S1xr5S3to1h7NAz-gIAdZLzCwaatMpJ5b0oigc51>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Jun 2026 04:09:59 -0400 (EDT)
Message-ID: <7a107de6-1cd1-4086-997d-258deb3429ae@bsbernd.com>
Date: Fri, 19 Jun 2026 10:09:57 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org,
 libaokun@linux.alibaba.com
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com>
 <CAJfpegsWpKE4kUUQo+NK_cu6oy6h6+A1M=xokvSQbFtZzu9UKQ@mail.gmail.com>
 <CAJnrk1b1nVFZ8dQYA=iGn-p182HNhhRfZEVe-e_ks_daZAU3Rw@mail.gmail.com>
 <CAJfpegvNyqSS2h28-0sB2j2HUoMnKd7StMsPbvNPz67PiS9w9A@mail.gmail.com>
 <CAJnrk1bK-3tpZoeJQKPLjgpQW2F0YQKVhLeGwkN_5tpBVpZ-VQ@mail.gmail.com>
 <CAJfpeguq+LVHoyC7ZzkF_VSAQdqmQFw4DBztiQA1Jfy=U+D9wA@mail.gmail.com>
 <CAJnrk1Yqa0nvXCBo6GzHc2bP_V5+2dHaJn+2pWkumV0QLr0nSw@mail.gmail.com>
 <CAJfpegv=u=jfOqtHXpEC60unrzO7XFeP9o9HM18AVqWfN=O0Ww@mail.gmail.com>
 <CAJnrk1b4r0vbrm_HNe5bV11FVmdKDNAcZzkoLtoW_hEmmBjpdg@mail.gmail.com>
 <CAJnrk1ZVs2hOc7CRAVb_fQPJiUvqK837MzOWQqv4VB9YU8q6mQ@mail.gmail.com>
 <CAJfpegsKX6g5v8jaT0iHhSXJV7SzQs1kKBW=ftnRKU27_oPZ8w@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJfpegsKX6g5v8jaT0iHhSXJV7SzQs1kKBW=ftnRKU27_oPZ8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/19/26 09:57, Miklos Szeredi wrote:
> On Fri, 19 Jun 2026 at 00:23, Joanne Koong <joannelkoong@gmail.com> wrote:
> 
>> I like your idea a lot about just passing a chunk of memory to the
>> kernel and offloading the management logic entirely to the kernel.
>> Maybe I'm missing something obvious, but why would multiple pools per
>> queue still be needed?
> 
> Maybe you are right that it won't be needed.

If queues are treated 1D (per cpu) we end up with limited buf additions
and possibly queues of different buf sizes.
If we decide to do queues per CPU and buf, we end up 2D (buf x cpu) and
search which queue to use gets complex. Maybe I miss something, but it
sounds weird.


Thanks,
Bernd
