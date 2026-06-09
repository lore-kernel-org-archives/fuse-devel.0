Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C9241362A
	for <fuse-devel@lists.linux.dev>; Tue,  9 Jun 2026 12:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007325; cv=none; b=qnVDLgYL4HlideHro5jtYhViWuMNBosWiVRXDQRSthit3eS0y0OzBWq81HY/M+2mJ74XMA3qeLWnoEBZoMsy5nPtBLCOAhCKQ/SilVswdS5SyIf02CAaRLUwoWGirlB+loo8eFxtEa9Kw3eoPMCMS+zVQIRI5kWs/gFLpBt2ku4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007325; c=relaxed/simple;
	bh=lGPfxJ4Wlhb4eHWkzczabXUnDUxiZiWYtrLoDhE0Kfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZqdYDOUJXNKBrkcmesyyH5AzNNkPPwCIFxaGJ1az3jzIVKmQ7vVP54sipM8qhDahQsByz62MfM1kZUuhDcc/9t3CWlHB27xxD9uXJ8IanMSanjmfMhNYPoOpdwPfDxPssv6acc+4ww1Wv0yFMQsblAkXopUDGe3FRMUiDrIzFl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=SU5z6KBv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Sd93sR42; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="SU5z6KBv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Sd93sR42"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id E5179EC01F1;
	Tue,  9 Jun 2026 08:15:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 09 Jun 2026 08:15:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1781007321;
	 x=1781093721; bh=Y3Ic+Ym1DTwP1RwYgl3gqHhEjb9no/U++tksRm/pSoQ=; b=
	SU5z6KBvsMoGuehCkEeuELr1ic8bL3OT6gN+G1wjsTYBo+OoBD4udlCFiwXxex0P
	RMmNRc0Ba/p/iK5g5LtZXsEI93Ly8Mb/DNikWYir8wcbBrujPBzPd5j4gXFo29p+
	NZ0gmJA9uhT+qOxUfk7H9f3dVjmQEd8PhqJphDCFRKRxGdL3O3kdQP3zubnJvCdL
	kVsyZmx7sflHL6vEVMKbqWQ+PP2mHi5kit0gyKYxCK37ATriKetitPtPMaiwtVxj
	SN4XWfLrE51Ys0Nye+AOVeR9uD/2oLUdyFey0YUy0BSXjyt8uEATpis0F+rDMgbM
	mTu+/DFVhOCpNg345Zp0rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781007321; x=
	1781093721; bh=Y3Ic+Ym1DTwP1RwYgl3gqHhEjb9no/U++tksRm/pSoQ=; b=S
	d93sR42wQ1NkHeSYAO8Xtd/aFQT3P3xi3DVxJ8EUkzDgBx8khUZyjv94OGjYO22Y
	IJ+tEEpwzSCfW2QMURmZugRfNddKHSiXkqmWqAnsRutW9ZB77r/BI2I5ayL10T8K
	7pPq0d1x3eBnjyg++dH/8luHFTpU4BbK2RZphDni38FAVgIs5k7VJy1+dBqf/t4P
	VNGIfa8MZ2BAfZNg9Np4FXQuq+NPUu/JlGxcxak68xkzk3Rp5W6pD8KJNFIOb6CY
	u1Z32uFZWprNSVuZ9IOSRMA4JssS4ZHTZYmc/t/W4s7e/V9lUBmz1g1Iaq/2R6iB
	VjYPeUI2k7FLoMc4IaWbQ==
X-ME-Sender: <xms:2QMoajr-IsxoJYS24qRH4nWdf_Vg5K1WAfuH__g0E5qDpmTf6GZyEA>
    <xme:2QMoaqNBknx9qY4B5Q-RZ_MLRyZOQqeSHK2Nnm6GHpGG1e09VlsSOJY2Vmq8n5NUF
    xN2671swAtpphoC3R3ww8qypejD5M2SHPb3CqrIEQSmE3HnQFSd>
X-ME-Received: <xmr:2QMoakqdKMEdciU4ITeWEr722EWgShfJIvXnl5uyAzmdS-zIA0lTP8oQtPBWHi2coT9WInvuYy6JnjM-TDIM_1lfy6z_lTzd2VCdtqw_5x7zzEnSHQ>
X-ME-Proxy-Cause: dmFkZTFi3RWtsjJ6tzsl1YJhPnlHSgIv7/6/ibLNPH3ax/n54zVuW0lhWLrgfgAASqEH3y
    xN2apWaKDHAhsHNyeK+/mA0oFPWhPNBrSIU3uKnrf7W6NI46VNVs62YQOHnOgnldx9Xk5w
    +1grt/jx83M1TIyiofkl6AzZ8aUksvHbvTtP5l4onygYuP96WLQ55G5lfGn4E3OyzY72Zl
    Wel8SleVPkiJBiPy0bYZNiuDgdDcRln8CwwWtdxQU+68SG26vok5kDiecNOKK3hoXVEswf
    4LZrXDLMjTGMbJ9pvdMbk3J5VAE9/4o7blHC36Uj3Cuo/BoYMbZeGLsRvyBiDWROONmqY2
    No5lpoYM6pJh546V9snWcpDv/CEGjHzyV+n5SUerYumYNn74gvRQ4gVNgUhiO8V9L05xmh
    kB7VzH6H54vS24G0g8A04nCL2nYIMnNIzsac6vYhTalB394QXGaLkbEFHl5fvOL7h0/4nj
    snWWMvpIeRkml9jKU52MymUrhCf+QMYFg/bRvB1lZ69cVYx2uKGLrDDdzAAfpLkjD8FDKD
    CvLEV/+yN2yn6VpvIbqUCLQnSQ+H5JLzaJlLgOOjYCEwPEt+DlGTRetKmyN7t6JHdGMie0
    F4JfhPvBZFkQ91+52aetjfMEaao0usiWxFJsRWAZwMwIAUX4GX/Tu7slPo9A
X-ME-Proxy: <xmx:2QMoatt1SBgiRBmoYuyJpTmVRbDSjmOCixtR4xV6Bgx3gJjyUO3BzQ>
    <xmx:2QMoaj3IvlzhemUS4d5TcoBe5vjVclGvUr399uXvI_wZgrrwta-h9w>
    <xmx:2QMoaoGHYDwzLBEM88pLWs7pijIfyYFvyGshvCGmx4pCwAZs9PV3eA>
    <xmx:2QMoausAhMsGEcQMcHN-EXKvWK4Emg5yYNyE54TmHeoNDd1BCWpY0g>
    <xmx:2QMoaoBbGpu9T-XIU2AFqLwMxIZ6llHl-P5RbmQoLROiT58vVZvZCdIe>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Jun 2026 08:15:19 -0400 (EDT)
Message-ID: <0f25cc07-5848-4493-8356-6f2ef28505f7@bsbernd.com>
Date: Tue, 9 Jun 2026 14:15:18 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 3/4] fuse: {io-uring} Make a fuse_req on SQE
 commit only findable after memcpy
To: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Luis Henriques
 <luis@igalia.com>, fuse-devel@lists.linux.dev,
 Miklos Szeredi <mszeredi@redhat.com>, Berkant Koc <me@berkoc.com>,
 Zhenghang Xiao <kipreyyy@gmail.com>, xlabai <xlabai@tencent.com>,
 stable@kernel.org
References: <20260606-fuse-io-uring-race-fixes-v3-0-6fdf5e5b3437@bsbernd.com>
 <20260606-fuse-io-uring-race-fixes-v3-3-6fdf5e5b3437@bsbernd.com>
 <CAJnrk1Zjn5FK8gj=a5gxJbYzQMC0rQ-FPcy1Nj-r9N7ho=PnhA@mail.gmail.com>
 <CAJfpeguBGfUBBWrBUVgjUtA=6U4pAHaMfAOmmLNwYVF0=yotRQ@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJfpeguBGfUBBWrBUVgjUtA=6U4pAHaMfAOmmLNwYVF0=yotRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/9/26 14:03, Miklos Szeredi wrote:
> On Tue, 9 Jun 2026 at 04:08, Joanne Koong <joannelkoong@gmail.com> wrote:
>>
>> On Fri, Jun 5, 2026 at 3:13 PM Bernd Schubert via B4 Relay
>> <devnull+bernd.bsbernd.com@kernel.org> wrote:
>>>
>>> From: Bernd Schubert <bernd@bsbernd.com>
>>>
>>> Bad userspace might try to trick us and send commit SQEs request
>>> unique / commit-id of requests that are not even send to
>>> fuse-server (io_uring_cmd_done() not called) yet.
>>>
>>> fuse_uring_commit_fetch() ends the fuse request when the ring entry
>>> has a wrong state, but that could have caused a use-after-free
>>> with the memcpy operations in fuse_uring_send_in_task().
>>> In order to avoid such races the call of fuse_uring_add_to_pq()
>>> is moved after the copy operations and just before completing
>>> the io-uring request - malicious userspace cannot find the request
>>> anymore until all prepration work in fuse-client/kernel is completed.
>>>
>>> This also moves fuse_uring_add_to_pq() a bit up in the code to
>>> avoid a forward declaration. Also not with a preparation commit,
>>> to make it easier to back port to older kernels.
>>>
>>> Reported-by: xlabai <xlabai@tencent.com>
>>> Reported-by: Berkant Koc <me@berkoc.com>
>>> Fixes: c090c8abae4b6b ("fuse: Add io-uring sqe commit and fetch support")
>>> Cc: stable@kernel.org # 6.14
>>> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
>>> ---
>>>  fs/fuse/dev_uring.c | 33 +++++++++++++++++++--------------
>>>  1 file changed, 19 insertions(+), 14 deletions(-)
>>
>> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> 
> Is this the same as v4?

v4 only changed the minor nit Joanne reported for 1/4.


Thanks,
Bernd

