Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDCD498912
	for <fuse-devel@lists.linux.dev>; Fri,  9 Oct 2026 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538273; cv=none; b=qS+cJ2TV0cGrtS5GQjwOmG6IplwcE+vJbfJyBcbtTxNMUoF0eelrrJe/434VQlEC27sdidbwviHztdGI3Ub3J0bnZYOUbKTAkJyPjPYRPzqMxyPvC/bcDM4m5cK824HHKdGhy1f4Cf/F6AY+/pUjLWrPfvfLdczb5TE9GukI5LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538273; c=relaxed/simple;
	bh=89BAXVNQF0A/AzKzesUFqgrSSWUm+8bkvaeS70yMo/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4/CCotfLBViqVp/Aa6lUi3btunqemkUpBeCoGRyo3N7IjJLLHrWCsVRaeHMe1UMWIGKR8cFG2VUKfgG3430l+zTZoLeF4hTCJ9Y1LCps/heXdFyUOjn3P105ugbt41Nm1vNj959ifkYBaVmfwWEXaUa5d1l1M+j4Db4+wMeu8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ij7gXQi6; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ij7gXQi6"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791538266; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=YqxcDo6m/WNZJ3jpgr8Nt/al3OYR/iHxLaLIqE45gOA=;
	b=ij7gXQi60fXYkzAhKLwvEjcGqvBUsmjwrijiPWNVrRKV3NaQe3IftcP/Bmxh8lwKy47zG+tur6n8KMqoZ9DhaA+/XFXHiE+HPHSO8EK/6RLYnnXNww/zLcm9lNNsEFBhk+eLN0eU4/fwjSKH0ucD2VKw19GCRXsjSt1cukV2+RY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R221e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0XCT.GBP_1791538265;
Received: from 30.221.129.234(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0XCT.GBP_1791538265 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 17:31:06 +0800
Message-ID: <e4922458-9c88-43d5-a521-d96ee7b5d0d1@linux.alibaba.com>
Date: Fri, 9 Oct 2026 17:31:05 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] test: exercise FUSE_NOTIFY_RESEND
To: Bernd Schubert <bernd@bsbernd.com>
Cc: fuse-devel@lists.linux.dev, miklos@szeredi.hu,
 Luis Henriques <luis@igalia.com>
References: <20261009075417.2521879-1-libaokun@linux.alibaba.com>
 <20261009075417.2521879-3-libaokun@linux.alibaba.com>
 <d11dc230-0e80-4520-bb25-d25809762726@bsbernd.com>
Content-Language: en-US
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <d11dc230-0e80-4520-bb25-d25809762726@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bernd,

On 2026/10/9 16:19, Bernd Schubert wrote:
> Hi Baokun,
>
> On 10/9/26 09:54, Baokun Li wrote:
>> test_notify_resend drops the first GETATTR of a file and asks the
>> kernel to resend pending requests via fuse_lowlevel_notify_resend().
>> The kernel redelivers the request with the FUSE_UNIQUE_RESEND bit set;
>> the daemon detects it with fuse_req_is_resend(), answers it, and the
>> client's stat() completes.
> to be honest, this is one the features that I have no clue about what it
> exists for. Why would a daemon drop requests? 

The daemon does not drop them on purpose - they are lost because it
dies with the requests in flight.  This is the failover scenario the
feature was added for: the old daemon has already read a request from
/dev/fuse, but panics before replying to it.

Meanwhile the file descriptor of the connection is preserved - by
another daemon, or simply by the service manager: systemd's file
descriptor store keeps the /dev/fuse fd across a daemon restart
(FDSTORE=1, retrieved again with sd_listen_fds()).

A newly started daemon then takes the fd over and keeps serving
new requests; the requests the old daemon had already read can be
recovered with FUSE_NOTIFY_RESEND (760eac73f9f6, "fuse: Introduce a
new notification type for resend pending requests").

> The use-case I have in my mind is a daemon upgrade, 

Yes, a daemon upgrade is indeed one of the scenarios.  It is the same
flow as the failover case above, only planned: the old daemon hands
the fd over to the new daemon instead of dying with it.

> but that would mean that either kernel needs
> to send a re-lookup of all inodes or that daemon needs to store lookup
> objects (I personally see these as counter part of kernel inodes). Now,
> besides not being implemented at all, kernel will have a hard time to
> send re-lookup requests, unless fuse-server supports lookup by 64 bit
> node-id.

You're right that the new daemon can only answer the resent
requests if it can still map their node IDs (and other state) to
its own objects - that is the "daemon stores lookup objects" side
you mention, and it is deliberately left to the daemon.

FUSE_NOTIFY_RESEND does not attempt to solve state preservation -
it only guarantees delivery of the requests that would otherwise
be unreachable forever, no matter how much state the daemon kept.

> I.e. in my personal opinion the prerequisite of FUSE_NOTIFY_RESEND is
> missing (which could be LOOKUP_HANDLE and then using that to re-lookup
> inodes after a daemon termination).

Something like LOOKUP_HANDLE, where the kernel and the daemon pass
file handles directly so no node ID mapping is needed, would be
ideal.  However, I think a persistent node ID mapping on the daemon
side would also work.

> The example below also just does a simple exercise of
> FUSE_NOTIFY_RESEND, without revealing what it would be useful for - that
> is the part I would like to see fulfilled by an example.
>

Yes, it only checks that the API works.  It has no fd preservation
mechanism and no persistent node ID mapping either.

A full takeover setup needs the fd and state handover, which is daemon
specific and not something a libfuse test can realistically contain,
so I think explaining the model in the test and the commit message is
the right scope.  Let me know if you would prefer something different.


Thanks,
Baokun


