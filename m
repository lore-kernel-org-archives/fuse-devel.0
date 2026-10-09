Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356992BE7CD
	for <fuse-devel@lists.linux.dev>; Fri,  9 Oct 2026 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556326; cv=none; b=PZnZRc5FjPF8mDEi6PhHHDyLJqPg+KdSWK94M4K5sH8AYFSUY+6xc2Y7yTHjzsRJNEWTlffH5HRNBjipgKCSlbNn6f0BNZeqbG94LA2DYesP64L6Uy41t9adt5PueGglcftFuqDqqkk7/Kjd+AxKEuEZQU7DYPGt9nvCHJudQsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556326; c=relaxed/simple;
	bh=Cqs6/00QiJn/iYDxx3BdR/TYbbCSCwU+OgM7GRWCrSA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K4GQ8JLoVXT6QPjmpacc3nyNsOJZAXXrj5mSl7yc6PmBKBnTOsxS3rNnZw8h3dwPL8m/COi+uvhnxatkaNTl5ZUN/he++UskatCoqa1mJ9rUXgxFzUpkDK7PjXo/8Y3S8ARusaHLy20GIqRUX7QdB4o0PxfUYn2y+9LpqMgkeLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=UbEA4bOu; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="UbEA4bOu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=6yk2sg/bNpOP5KaeEASwE0JjDjP1dKGmNDd0qNhFqrM=; b=UbEA4bOuiddVI+gU78VbFZr/UL
	fbkK4Xlis+Z8BDiLfo8FZZGDlY1e+uOuzwbOqbWi/uU+IxdnQVE9Cu1zJmC+6JVXy9W31S8VjZC2v
	XsiFMsPllceWXN8dB/0uYl5OYnSI2bQaklT2EyZImAExN8sQvQ3qGjVVE+SARokC+oxkXkxa2ooqZ
	UWgt/x7FF11ELBR8r7U/ZhoJBgaJE9tQ/9/uEWZpnTdqsUrzxYJIILoBYnqN+QCtRId/558WTv054
	s8zHImP8xs45sed7T2IN3qZWxzIpbPjzzoMp51FzXtFZj4PeoeMu+yXji+MGxq9AyjcZG5Qaz1MyM
	uuvWNdEA==;
Received: from 138-125.internet-praha-1.cz ([185.176.138.125] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xFAzg-00EyDV-N9; Fri, 09 Oct 2026 15:50:40 +0200
From: Luis Henriques <luis@igalia.com>
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: Bernd Schubert <bernd@bsbernd.com>,  fuse-devel@lists.linux.dev,
  miklos@szeredi.hu
Subject: Re: [PATCH 2/2] test: exercise FUSE_NOTIFY_RESEND
In-Reply-To: <e4922458-9c88-43d5-a521-d96ee7b5d0d1@linux.alibaba.com>
References: <20261009075417.2521879-1-libaokun@linux.alibaba.com>
	<20261009075417.2521879-3-libaokun@linux.alibaba.com>
	<d11dc230-0e80-4520-bb25-d25809762726@bsbernd.com>
	<e4922458-9c88-43d5-a521-d96ee7b5d0d1@linux.alibaba.com>
Date: Fri, 09 Oct 2026 14:51:48 +0100
Message-ID: <87h5ivugln.fsf@igalia.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi!

On Fri, Oct 09 2026, Baokun Li wrote:

> Hi=C2=A0Bernd,
>
> On 2026/10/9 16:19, Bernd Schubert wrote:
>> Hi Baokun,
>>
>> On 10/9/26 09:54, Baokun Li wrote:
>>> test_notify_resend drops the first GETATTR of a file and asks the
>>> kernel to resend pending requests via fuse_lowlevel_notify_resend().
>>> The kernel redelivers the request with the FUSE_UNIQUE_RESEND bit set;
>>> the daemon detects it with fuse_req_is_resend(), answers it, and the
>>> client's stat() completes.
>> to be honest, this is one the features that I have no clue about what it
>> exists for. Why would a daemon drop requests?=20
>
> The daemon does not drop them on purpose - they are lost because it
> dies with the requests in flight.=C2=A0 This is the failover scenario the
> feature was added for: the old daemon has already read a request from
> /dev/fuse, but panics before replying to it.
>
> Meanwhile the file descriptor of the connection is preserved - by
> another daemon, or simply by the service manager: systemd's file
> descriptor store keeps the /dev/fuse fd across a daemon restart
> (FDSTORE=3D1, retrieved again with sd_listen_fds()).
>
> A newly started daemon then takes the fd over and keeps serving
> new requests; the requests the old daemon had already read can be
> recovered with FUSE_NOTIFY_RESEND (760eac73f9f6, "fuse: Introduce a
> new notification type for resend pending requests").
>
>> The use-case I have in my mind is a daemon upgrade,=20
>
> Yes, a daemon upgrade is indeed one of the scenarios.=C2=A0 It is the same
> flow as the failover case above, only planned: the old daemon hands
> the fd over to the new daemon instead of dying with it.
>
>> but that would mean that either kernel needs
>> to send a re-lookup of all inodes or that daemon needs to store lookup
>> objects (I personally see these as counter part of kernel inodes). Now,
>> besides not being implemented at all, kernel will have a hard time to
>> send re-lookup requests, unless fuse-server supports lookup by 64 bit
>> node-id.
>
> You're right that the new daemon can only answer the resent
> requests if it can still map their node IDs (and other state) to
> its own objects - that is the "daemon stores lookup objects" side
> you mention, and it is deliberately left to the daemon.
>
> FUSE_NOTIFY_RESEND does not attempt to solve state preservation -
> it only guarantees delivery of the requests that would otherwise
> be unreachable forever, no matter how much state the daemon kept.
>
>> I.e. in my personal opinion the prerequisite of FUSE_NOTIFY_RESEND is
>> missing (which could be LOOKUP_HANDLE and then using that to re-lookup
>> inodes after a daemon termination).
>
> Something like LOOKUP_HANDLE, where the kernel and the daemon pass
> file handles directly so no node ID mapping is needed, would be
> ideal.=C2=A0 However, I think a persistent node ID mapping on the daemon
> side would also work.
>
>> The example below also just does a simple exercise of
>> FUSE_NOTIFY_RESEND, without revealing what it would be useful for - that
>> is the part I would like to see fulfilled by an example.
>>
>
> Yes, it only checks that the API works.=C2=A0 It has no fd preservation
> mechanism and no persistent node ID mapping either.
>
> A full takeover setup needs the fd and state handover, which is daemon
> specific and not something a libfuse test can realistically contain,
> so I think explaining the model in the test and the commit message is
> the right scope.=C2=A0 Let me know if you would prefer something differen=
t.

Thank you, Baokun, for the above description (and Bernd for explicitly
CC'ing me to a patchset that I could have missed!).

I had a PR [1] created long time ago that included something similar to
your first patch in this set.  The difference was that I also tried to
solve yet another problem: setting the fd back into libfuse-specific data
structures (i.e. re-initialise libfuse itself).

This was an RFC, which later made me start looking into the LOOKUP_HANDLE.
Which is currently stale, but hopefully to resume soon.

[1] https://github.com/libfuse/libfuse/pull/1219

Cheers,
--=20
Lu=C3=ADs
