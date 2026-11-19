Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099009;
	b=EQEzdeIT1CWljYGzYirDsYa/x1XAojeD3DpaigM8ufBvOOse1E9YrbTZudS+8Zeneq/C
	 YyA6pJAtYEUdVVNihjosUYOyM7i/Gns2B/C8B/eesH7wG8WRJvnsTd6NoBPSB3ZI12Iee
	 kieNzAdTjf1fqs7uF7deS4SdEPg1v/ezPzUvc75rt9C3+8q7bNj18nENrhD7A9a7YCTHY
	 CCkljZsS4uA/OAaORQL7ankGPLGey2s4IxPYrxkWKXTF0qidmLEJyV66i6bjUCmVVJY5F
	 8AypbQ7mknldXU8pyhhel0t6KI1MYmoMDz2qfBmAuP0Er1CtrNbAPt84Upze2qNntGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099009;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WmV/U8LZLPdttcHTW3sLuxyGM8QnROSm2WcI1dzxycs=;
	b=fXgOCWOkKlvCVx0/YkzWAZ6RNcjR6POQZRF5YSHY5ytXKmyT5vtzBR1LDf9cZvdI0Wy0
	 BUU9YigeoLNqIKWUdwmbkamVszGvIgnpotoYSHevBwHkM62+qT6lFRvZvrcsTbJIAOkJz
	 kma2wAl+qkaL3yuKMsM4AcNTz+ergrDQjPbBjrRQc7BINxDxXFGvwhcuQKwxTpfxKcrPk
	 xPq5SHQM2FpJpVIhL5eWnL3eI7G5mcKX16dEEjEGaNB7pSTWwsxRr5+BlTEOYzXcuBcJP
	 3sMm2M+rDDqtrKyVYeWYSwg9Gbwp/2VDPgB3yBPbGbdeg/hMnRHQb1OUCC4+HyKpGAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=T7RMNVCL;
	dkim=temperror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UFqL1oGD;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DC3606A324
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 14:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5DC3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=T7RMNVCL;
	dkim=temperror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UFqL1oGD
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E608D140018A
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 09:36:42 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 19 Nov 2026 09:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795099002;
	 x=1795185402; bh=WmV/U8LZLPdttcHTW3sLuxyGM8QnROSm2WcI1dzxycs=; b=
	T7RMNVCLeCSRVQub0y3GBxMoJPV10WsTd1CFOq72g2KaxYSKivo+yWxd0zLZB1Sn
	w2b5S6WfPszzDUaRskzXYwHO+RcL0smk4uXSZKuuueTNJOwIHmbmynI54hJFjtvT
	JOoPYKZMuuRTvmy78H8vT1/mnjB7SOxpz6BPa62AMn/s3Ii70O6dE/noFDSPrrM7
	C3vQ8Xs1oogy2VYSgWtv9lYKEZLRwqGEnSGsjexDk0MP0cByDs8XpsUCmndQBJbH
	nsTVSR+ZbvrKZVG5+XpNwSnR2wDl5mAXZv5Vfxxag7RcUdt8ASWgH8s+Z6PmJ6GH
	uxWMy9O6MX8DAN9SINYTaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795099002; x=
	1795185402; bh=WmV/U8LZLPdttcHTW3sLuxyGM8QnROSm2WcI1dzxycs=; b=U
	FqL1oGDMOUEUsyb9mmjXrWrADmPFWBwjXrKcO1eF8L+ZEmZkk0Amzxf3h7kB/9IS
	YjZT48BfrFm/+cBO5UWu66Od4y9B92j7Z44q7lY4tKBSxNC8XzaDHMJGYTafpZGD
	PHvjaRA4JBijHaX0HiUwDtavsDB2EZKwQpi02KNAi0wk8RysMZUHPCGTNL2Y0fav
	/EpVTWX/eOIHprtAw0j4nIG647pKT0gcJ0iUsG5MSte+LJkzPsGAYbP9ZFzdyxwc
	NglZawpnsaiJaVLlTDEkTq38Jj4Qfr+/S4F3cnoLw/IPR4zdIYq+pT80DUUv2RNZ
	kJXpiNa2tBu4w4zh4+CDw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795099002; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:aMkvytVe1xA3dGfxaKQHFuicVWTdMnN0kDZGKhCXjItQ/ox
	ugZFRKq4dCz0MDzD4OMXEFEmcnQ6DRLq/srNHgpE41JG/zCI6gvYRb/Vl+0ywyUr
	WsgxnVanlYy7zXAcblzM+HRbiN+/z21BjQEYTOPRM8c7gwnRi00+IhcbMW2UpXqY
	P2d1U8N9TFPu96qPG01TkbRWOiR/3f5AuZyW8/LE3Fw8u3kGlPMqxk8/lTtxgZp5
	AVAlQ4BukheK9sxly9Xj59pX8xMTMIbLiSSPmgHAR6xmP34Q3ZEoJR61t3C8hsZ3
	8XjZWKZoW9ziiybbOjcXLhzJ2/H6C+y4RPmdYxA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:XAMoKmgY/dX1pYa/wH2h0MLS601gtXn6jL6QsJyaK7A=:16VnMiTlCd9f7o/Kal/vuDSnDZkMGZ0IqWqssKBDtfM=;
X-ME-Sender: <xms:egn_atoMdZzsS1lKtZQnnLH-MVdRuB8oxgzSWiT_OyJUP7F9-ZITrg>
    <xme:egn_aswRcOEtyFmW86kxG29aiHOu3-nvQ0DZOPECxjJ2_gPOLQ3Um3ukoRwpWxC62
    bdNvuHlWdWojzh_DYrEQLaI7arI_gwD1UGGhMtT9pwpRn9BMIF0mQ>
X-ME-Received: <xmr:egn_apM1wQBTSNHzebwFsys4RchPF3Ec_vswQR5chu0pqwWpGBB5aZVxXU0LAVmAP66Wz6yHax-ktCzG0AH0yLYpzFwAI0_1jmix87TGVcsJIAO7TQ>
X-ME-Proxy-Cause: dmFkZTFYpJ1P/aF1dYDeptsjX6qG3ZuNcTPW1AXKsNy6a4gLe5zLWKV61VCzgK26/YyKtH
    wOOUcKNQpXNsjLhe8IP+/02L7JFaP7ZCcvdEn4cAEZYC0BYUR7d04+a7AgXbkyr1olfwJL
    DTnIwMXWG+YScGy6ddzS2B1MhHeFk9OC+tZs41zm0M/eZ8QFUPsy2qSCyj+HBmrLZpILd3
    yegOSaPg1h3BmK99NM7k2l8n9P+cJq8Zzct+qpxcOYTW1gU+UaG6WlJ/JyY0vvazfwpMLc
    DKqnWeyjx1PR7joxizHpHlwWqIOQyD8YVnnDguOn6i853pvIJ5uekKKN1ArxSD2ot4fCCv
    aUdmL+iTO2C1/g+jaMnuGi+HjaQp35wdJFHWWpVRdql85HLgckMwGDmdGVE+ZfRsh4GUzj
    PwXwfL3PAdC+PshlrZZVDKYv893V8z64Lukt6KVbkIl6KpyBPYWImvzTuojmoPy5No/XiK
    Xn+zFasmRopz6VqTXrCxuNPk6zdz6+QNTUGtCmmjCfpB1sDU5XTJ1uqu04w81xpplaBY2P
    2bI5w6TBOQicM1RLqUpepwDF/8u9mt48UuPC6D1prcsPFTI1ZR42EeoP920prh2eftIdL3
    5rFIvH5oZFfSFKCVPdE5EDPciHa2qNvR1nJSFco7o7R9OONcPvA9Da/D/Bzw
X-ME-Proxy: <xmx:egn_ap4pIxw4rqKm2ay4bLKTQQkbXYqbkOwEAIXYUzwsyPpZL7A1mw>
    <xmx:egn_aqntdeu-uuJo9jMZpGURtzR_sNCgniLH9BfSP2UBAQxWNr5hKA>
    <xmx:egn_aqRhSyPna1Ti-xYMsyPrYrmAIRWbisGoMN2dhYCy0oF_u7SiyA>
    <xmx:egn_apFa799W6IQciGRbaeJtqe7l-1LT8V96xznkEyOiOtPwG6ryqA>
    <xmx:egn_al_xXqg_4MiI33QnjNdUcmGsC4KzkOA3UsYtmabqRE2d2KaXxBCM>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 09:36:41 -0500 (EST)
Message-ID: <7b2d361d-86f1-4064-a905-954a2dfe4ccf@bsbernd.com>
Date: Thu, 19 Nov 2026 15:36:39 +0100
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fuse: don't wait for a sync-init mount in
 fuse_uring_cmd()
To: Yun Wang <arsenova@a7snv.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong
 <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261117075632.59959.p12-0-arsenova@a7snv.com>
 <20261116235814.60702-1-arsenova@a7snv.com>
 <7bb720d9-30ef-4d3f-8ab8-81c5fe2e0fe1@bsbernd.com>
 <179509410286.1113694.13152766226405003077@a7snv.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <179509410286.1113694.13152766226405003077@a7snv.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/19/26 14:15, Yun Wang wrote:
> On 11/17/26 22:47, Bernd Schubert wrote:
>> On 11/17/26 00:58, Yun Wang wrote:
>>> Until FUSE_INIT has completed, fuse_uring_cmd() returns -EAGAIN anyway
>>> and the server has to send the command again later.  Return -EAGAIN
>>> at once when the device is not mounted yet either, using
>>> fuse_get_dev_nowait() from the previous patch, and don't log "No fuse
>>> device found" for it.
>>
>> And what is if io-uring is enabled? Userspace busy loop until the device
>> is available? I don't think that is nice.
> 
> I understand the concern: -EAGAIN doesn't tell userspace when to try
> again, so a server can only retry blindly.
> 
> But that isn't new with this patch.  On an async-init connection,
> mainline already returns -EAGAIN for a REGISTER sent after mount(2)
> has returned but before FUSE_INIT has been answered.  On 7.4-rc2, with
> a test server that answers FUSE_INIT 300 ms late and resubmits on every
> -EAGAIN right away, as libfuse's fuse_uring_resubmit() does, the
> REGISTER was resubmitted about 50000 times in those 300 ms.  The patch
> applies the same rule to a sync-init device before the mount.

I think only with an old version of libfuse that was sending REGISTER 
before FUSE_INIT was processed. That was the reason I had added the
-EAGAIN handler into libfuse.
At about the same time I had also ensured that REGISTER is only send 
after FUSE_INIT reply. FUSE_INIT reply is submitted via write() to 
/dev/fuse, i.e. it is a blocking process.


In _do_init() in libfuse

```
	/* XXX: Add an option to make non-available io-uring fatal */
	if (enable_io_uring) {
		ring_rc = fuse_uring_start(se);
...
	/*
	 * Has to be set before replying, as new kernel requests might
	 * immediately arrive and got_init is used for op-code sanity.
	 * Especially with external handlers, where we have no control
	 * over the thread scheduling.
	 */
	WRITE_ONCE(se->got_init, 1);
	fuse_daemonize_set_got_init();
	send_reply_ok(req, &outarg, outargsize);
	/*
	 * With async init, send_reply_ok() has already marked the connection
	 * initialized (that happens in the reply write()), so the ring threads
	 * can send REGISTER now. With sync init, _do_init() runs on the
	 * sync-init worker thread while the mount is still in progress. The
	 * connection is not initialized until the mount completes, which is
	 * after _do_init() returns. Waking the ring threads here would let
	 * REGISTER race ahead of initialization and get -EAGAIN, so defer the
	 * wake to fuse_session_mount_new_api() after the mount returns.
	 */
	if (enable_io_uring && !se->is_sync_init)
		fuse_uring_wake_ring_threads(se);
```

I.e. it does fuse_uring_start() before FUSE_INIT reply, but that just
creates the ring threads and let's them sleep in a semaphone. 
FUSE_IO_URING_CMD_REGISTER is send after fuse_init(), once 
fuse_uring_wake_ring_threads() let's the ring thread move forward.

> > It does change one thing that the changelog leaves out.  It says the
> command gets -EAGAIN anyway until FUSE_INIT has completed, which
> suggests the wait gained nothing.  But after the mount wakes it up, it
> can still get past the initialized check: FUSE_INIT may have been
> answered by the time the woken task gets there, and if not, io_uring
> retries the command from io-wq after the -EAGAIN, which may be late
> enough.  On a sync-init device without the patch, 12 of 20 REGISTERs
> sent before the mount got past the check (6 in the woken task, 6 in
> the io-wq retry).  With the patch it is -EAGAIN every time and nothing
> sleeps, so the old behavior was timing-dependent rather than a
> reliable wait.  I'll fix the changelog in v2.
> 
> libfuse isn't affected either way: it sends REGISTER only after the
> connection is initialized, with both sync and async init.  I ran
> passthrough_ll -o io_uring on 7.4-rc2 with and without the patches and
> counted what fuse_uring_cmd() returned: never -EAGAIN.  What the patch
> fixes is the submitting task sleeping in io_uring_enter(2) until the
> mount or a signal, which also holds up everything else that task
> submits in the meantime.

Well, if libfuse isn't affect, why is this patch needed? If you have
another fuse server, fix your fuse server? (And it confirms my personal
opinion that we should aim for one userspace library.)

> 
> The retry could wait in io-wq instead (I have that working), but
> uring_cmd work runs on bounded io-wq workers, and each early REGISTER
> would hold one until FUSE_INIT.  A server registers a whole queue's
> entries at once, so that can use up the submitting task's bounded
> workers and hold up its other punted work.  With 4 CPUs (a default
> limit of 16), 16 early REGISTERs were enough to hold a NOP sent with
> IOSQE_ASYNC by the same task until the mount; with 15 it completed at
> once.  I don't think that is a good design.  Queueing early REGISTERs
> and handling them once the connection is initialized might avoid this,
> but that is only an idea, I haven't tried it, and it would be a bigger
> change.
> 
> Would you prefer to keep -EAGAIN as in this patch, or should we look
> for a different approach that covers both the sync and the async init
> case?

See above about my question about libfuse not being affected.

Thanks,
Bernd
