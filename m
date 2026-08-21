Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B8D30DEB2
	for <fuse-devel@lists.linux.dev>; Fri, 21 Aug 2026 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317216; cv=none; b=nkOUOXW0u/cSc+5IaLCxNgxYFXjjrW840VtnlTxTXopR2IiBabKV4Ln1dsm+RluNWjNzQg2INGflOYKxJW7YKaDOtqojaLlLdf48sMVDsx8gKjc6Ne0foaLriPYY3GXQKW8f/4h5fKahv9CmifKYTPR8n8AGg6/Soa9hpDb+zXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317216; c=relaxed/simple;
	bh=TQVri1VbG3k26GTVvPhW+rQvpCyLbdhL30xPsXPok1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8nyRkhEbUpOFxbZOgNmh9LJdE5OIAOOcHh7It6hlDgFX/ej08SWoUqc0famzIPb/C1CvI/48fJD+rCAlpmCV9YqCt+PFR9J5NBqnHjrvxHGH2q+Gk/f26DL3AKFo5Ww0g9hZv1MDXUJctnk9YXoPlTT4JOtTb7EvfbogZ6pmy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=rlVeSsGh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=btXEGCMf; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="rlVeSsGh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="btXEGCMf"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 75A1614001F7;
	Fri, 21 Aug 2026 09:00:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 21 Aug 2026 09:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787317213;
	 x=1787403613; bh=jPwAAHStks5puw+Sn0UGu4PzkEYNx3VmfQfonbs5q0E=; b=
	rlVeSsGhqpBg9zjl0jjpNbKy7m2SLAzMKXYIuI49WCnAIu52QVVW3WLRjHqiHsmm
	EElGRxKts/hHPGBeG/eSsKjVPuPxZ0vonptb9edUFvGE8mJzMYR4dwKec7EtzMpm
	Eyx/yn2GSyEcqT+Y9HsCOiwMgSVufIk1c3RhEHRA/64qDp5Gfwx2xwVD+K+JU59c
	UruB06CFtjk0vT5SC7dzE5iRCIXK/ItofbXSbuCyYp2SvjTYzoX/WQbGI16lFqTM
	qKdDQpVtcXdCQ8UkTv8SHEjp9tTEl12tzFW9RmyIqtj/Uhw/fZvoFkh2qpu81MYO
	HVEdyNELSP6FP3CoRzld6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787317213; x=
	1787403613; bh=jPwAAHStks5puw+Sn0UGu4PzkEYNx3VmfQfonbs5q0E=; b=b
	tXEGCMfsw/u2Ak66YZAE2+0rxWG3VQc0nlCXrEs91AtDdxgDPU3ZKjtjv2GN5Kos
	Pfwz579MNLUu8IzRcKsTQ+HaB0L/94ax9GYtKi4q1QhKKnxXulHyfPGjhIYtuhtk
	YY42VBC0xQfOZS1uwcjPmCFJnPO8ilC6CJf4old+kl1n15HNN9oAOGknzMLDcpuW
	ePUA+JbvmGA5nO0us5htwViQ2zqtY31UKdtKqm7dNxStb0bHgIbwuRxlVu9wYdsp
	NZz0zbTdR3NFS0mIJiLE/PqPCgedBCCcG2kO1DQSCw+ZKTJxPrwa7JVL3LxYtk/n
	pOlM6jB3ZlMuZ6XM2ngNg==
X-ME-Sender: <xms:3EuIask_Rghn1c09a4rEyTHTwDmckg3hpeHYTow-_4_t63iaIXMmzA>
    <xme:3EuIasgsM02iYMe9HAtXicS2j6XC8u9UlogEhLaoqAPCTbOg3tHqCQ_dTW1jfW7Mq
    -ulAvPSaFWJfNdLOKUWBMu9ySx50vaVCzuGFmPXS5AWJ603WYW97Q>
X-ME-Received: <xmr:3EuIao2VGtkrSiryjRDMR3ooGM3qJr6JUj4vvjLpunpRH1nX97HYVWkanQfzwTjxnfktXJ_aZfAhr7NHKvyObV33Uvtt3Kyi3_EciaZsMU5H-s2pAhs_qufD>
X-ME-Proxy-Cause: dmFkZTEn9+iYvMPup1kK07lZl5gJmcQX1An123ru39uwPK9D5oSjcUyDaOzqgYNm74oDxE
    RUsFpQqK1pGgHY079ii8odmt0sXKwmwa9o/Qpc4hLxcgfuUmHzJx5n95wPnjDYo1FC6lMF
    srRQztpa4/TSbcl5dkYYSSMfO0KzCXOK84qMX1cLn6J2FmZ1T0F0/Qz1nhVjf2PYHYdaVI
    erbvFBLMfjlDkGzNtyuG/qqMdEIf/XMO+5DGJpUQ2V6mW7X+cnk28wpaObwLOq9Fmt0ood
    W8+X8hBQnv2q8kpZ0MKdqPjhlA/SBqyPzwDkr+EzAwUVJI2DWYh8pgD2iHEpdFxoZ6AMbk
    vs6xvG5LLbfO6j7byBdcaG3cgFlDYQgOMkKx7aUeOHKvVIsa0p7Q0/eobUCFOYABzZWKL/
    LaAGMqiLdqqbYzbCw58G4mFm/nfCgvEKxrR60rJD4/KvHRskvFR4g0iL2wCMZHRVVuBGLV
    Tqpcz8HQpk+xTKz31CrjsiFCz2AuLfTyVjfDC302I6+bNmqT4qB3He6FnObgYSjB6sr7Fg
    8ANfNKACjNMReAjLEwK4RC1+zsgdkQa4AoJCZkFTB3g9H0/vr3d7/TX567VoXoP3TTZOaL
    wnImJprYbMOj49N0RiIb4cdglpuq4ammnBHTpcAK1hu4I23A/7PvrFg/1kPg
X-ME-Proxy: <xmx:3EuIatK698jA0VD1Lf4S2iXE1F0XLgLgAtgArLIiQh11acamBAityw>
    <xmx:3EuIagyTxexGaXt_nsQcLLMW8dcO1N0GXRRQo4ThO6O6C7vahEDdrg>
    <xmx:3EuIajVftdfTnre8DMMqqotvnPtv4bFXdp--k6j4WYz6uT0qskYsHw>
    <xmx:3EuIaojlKxqO5Qa1SlpkO6KQh46JkhtF6wDi3EmFMxvd8Nlg8blLJg>
    <xmx:3UuIaiVIV5Cfn74R88fD_MM-RN7VpgW-XdC_O1z0wUA-3kPbPzyVy77E>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Aug 2026 09:00:10 -0400 (EDT)
Message-ID: <09fc2e63-a1a1-4c29-95be-cfb5f0db9ea7@bsbernd.com>
Date: Fri, 21 Aug 2026 15:00:08 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fuse: Fix the condition to enable over-io-uring
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev,
 Baokun Li <libaokun@linux.alibaba.com>, Thomas
 <thomas.fractalbits@gmail.com>, zhu <zzsheng@gmail.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
References: <20260821-fuse-fix-enable-condition-v1-1-488f77b27e96@bsbernd.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260821-fuse-fix-enable-condition-v1-1-488f77b27e96@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/21/26 14:28, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> I had accidentally used "&&" instead of "||" and totally broken
> the intention of the condition. This has several implications
> 

[...]

>  	/* Once a connection has io-uring enabled on it, it can't be disabled */
> -	if (!enable_uring && !fch->io_uring) {
> +	if (!enable_uring || !fch->io_uring) {
>  		pr_info_ratelimited("fuse-io-uring is disabled\n");
>  		return -EOPNOTSUPP;
>  	}
> @@ -1248,13 +1255,6 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
>  	if (!fch->connected)
>  		return -ENOTCONN;
>  
> -	/*
> -	 * fuse_uring_register() needs the ring to be initialized,
> -	 * we need to know the max payload size
> -	 */
> -	if (!fch->initialized)
> -		return -EAGAIN;
> -
>  	switch (cmd_op) {
>  	case FUSE_IO_URING_CMD_REGISTER:
>  		err = fuse_uring_register(cmd, issue_flags, fch);
Sorry, actually we need a v2, besides that forgot to add stable@, this
would also allow to disable io-uring for existing connections.


