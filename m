Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584EB3B14C7
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880270; cv=none; b=M1d5TB0yH5ki/kbVhrhbnZZHGeYlKFlsiq0o+gvr0QTMdHf5SvH2OHiq0Cl+1qFzk25azjqftXkYwAMw8/kOiECW9h0hj3aRVT737gKE6aXvEM6UxLPFJrha7ajK7Y9xfE6aqbtcd7tPa9m2wZIGkC78pl6xzGZETe9cx17GthI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880270; c=relaxed/simple;
	bh=JcZPzrB9Dd9a9OfWi12HzIC3fK4a6Mr3og+EUDlw9eM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iKKSZTUYuUZjFJpMgwh96MaU2fqrTPJhR/MTvGf1K0tcm20eFIt4mOvasAWrAITfRlco4GuRoasgsh/3mZAF4ESL7JIMFeJq5ftJPWvtTM79TIkYJ0qfQ1L6yEUgI3Kv/jCfv0RQzsvWWRteODuoxjmMCzUTHOAK+zZ4bapwVIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=LxdG08FD; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="LxdG08FD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=inlBZjECS9IA+4kifyZk1C6e6UzMNrkwX7p/wPFT3o8=; b=LxdG08FDA7e96rFfCW1xPOky5E
	1KysO+QfrIJCorVE2NwMjv4wmuCx0lRQZH5Paa8ydOXlRxMJY7SmPXy3I6yxroUBKFMIQ399xxAtK
	iY1ShgFW8zOi30BIjvbHDT5Bdal7CUzzwUU52S8c0bmbxKAqPR8TuXWEuRgVERtagbK9G4sHcaGzt
	WdXGYrwq5kVURf9NebmYPvL5L9oVyBVHWeZh9Rmp5wlgnNzKVmF58D8MP+sKKZacVQ0235F4bLO7L
	URsMmslOQ+5WiRYNqBITvDc5ASDOO5+uBDuY/RVkgtKG9j17wnHbLfqT60JiX6ESGwh1Du2G14r5j
	UjPJFr4w==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xGXuP-00GxdY-H1; Tue, 13 Oct 2026 10:30:53 +0200
From: Luis Henriques <luis@igalia.com>
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: Bernd Schubert <bernd@bsbernd.com>,  fuse-devel@lists.linux.dev,
  miklos@szeredi.hu
Subject: Re: [PATCH 2/2] test: exercise FUSE_NOTIFY_RESEND
In-Reply-To: <a36fd07e-3721-4362-9b81-5c8569faeef8@linux.alibaba.com>
References: <20261009075417.2521879-1-libaokun@linux.alibaba.com>
	<20261009075417.2521879-3-libaokun@linux.alibaba.com>
	<d11dc230-0e80-4520-bb25-d25809762726@bsbernd.com>
	<e4922458-9c88-43d5-a521-d96ee7b5d0d1@linux.alibaba.com>
	<87h5ivugln.fsf@igalia.com>
	<a36fd07e-3721-4362-9b81-5c8569faeef8@linux.alibaba.com>
Date: Tue, 13 Oct 2026 09:32:10 +0100
Message-ID: <877bjmngqd.fsf@igalia.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10 2026, Baokun Li wrote:

> Hi Lu=C3=ADs,
>
> On 2026/10/9 21:51, Luis Henriques wrote:
>> Hi!
>>
>> On Fri, Oct 09 2026, Baokun Li wrote:
>>
>>> Hi=C2=A0Bernd,
>>>
>>> On 2026/10/9 16:19, Bernd Schubert wrote:
>>>> Hi Baokun,
>>>>
>>>> On 10/9/26 09:54, Baokun Li wrote:
>>>>> test_notify_resend drops the first GETATTR of a file and asks the
>>>>> kernel to resend pending requests via fuse_lowlevel_notify_resend().
>>>>> The kernel redelivers the request with the FUSE_UNIQUE_RESEND bit set;
>>>>> the daemon detects it with fuse_req_is_resend(), answers it, and the
>>>>> client's stat() completes.
>>>> to be honest, this is one the features that I have no clue about what =
it
>>>> exists for. Why would a daemon drop requests?=20
>>> The daemon does not drop them on purpose - they are lost because it
>>> dies with the requests in flight.=C2=A0 This is the failover scenario t=
he
>>> feature was added for: the old daemon has already read a request from
>>> /dev/fuse, but panics before replying to it.
>>>
>>> Meanwhile the file descriptor of the connection is preserved - by
>>> another daemon, or simply by the service manager: systemd's file
>>> descriptor store keeps the /dev/fuse fd across a daemon restart
>>> (FDSTORE=3D1, retrieved again with sd_listen_fds()).
>>>
>>> A newly started daemon then takes the fd over and keeps serving
>>> new requests; the requests the old daemon had already read can be
>>> recovered with FUSE_NOTIFY_RESEND (760eac73f9f6, "fuse: Introduce a
>>> new notification type for resend pending requests").
>>>
>>>> The use-case I have in my mind is a daemon upgrade,=20
>>> Yes, a daemon upgrade is indeed one of the scenarios.=C2=A0 It is the s=
ame
>>> flow as the failover case above, only planned: the old daemon hands
>>> the fd over to the new daemon instead of dying with it.
>>>
>>>> but that would mean that either kernel needs
>>>> to send a re-lookup of all inodes or that daemon needs to store lookup
>>>> objects (I personally see these as counter part of kernel inodes). Now,
>>>> besides not being implemented at all, kernel will have a hard time to
>>>> send re-lookup requests, unless fuse-server supports lookup by 64 bit
>>>> node-id.
>>> You're right that the new daemon can only answer the resent
>>> requests if it can still map their node IDs (and other state) to
>>> its own objects - that is the "daemon stores lookup objects" side
>>> you mention, and it is deliberately left to the daemon.
>>>
>>> FUSE_NOTIFY_RESEND does not attempt to solve state preservation -
>>> it only guarantees delivery of the requests that would otherwise
>>> be unreachable forever, no matter how much state the daemon kept.
>>>
>>>> I.e. in my personal opinion the prerequisite of FUSE_NOTIFY_RESEND is
>>>> missing (which could be LOOKUP_HANDLE and then using that to re-lookup
>>>> inodes after a daemon termination).
>>> Something like LOOKUP_HANDLE, where the kernel and the daemon pass
>>> file handles directly so no node ID mapping is needed, would be
>>> ideal.=C2=A0 However, I think a persistent node ID mapping on the daemon
>>> side would also work.
>>>
>>>> The example below also just does a simple exercise of
>>>> FUSE_NOTIFY_RESEND, without revealing what it would be useful for - th=
at
>>>> is the part I would like to see fulfilled by an example.
>>>>
>>> Yes, it only checks that the API works.=C2=A0 It has no fd preservation
>>> mechanism and no persistent node ID mapping either.
>>>
>>> A full takeover setup needs the fd and state handover, which is daemon
>>> specific and not something a libfuse test can realistically contain,
>>> so I think explaining the model in the test and the commit message is
>>> the right scope.=C2=A0 Let me know if you would prefer something differ=
ent.
>> Thank you, Baokun, for the above description (and Bernd for explicitly
>> CC'ing me to a patchset that I could have missed!).
>>
>> I had a PR [1] created long time ago that included something similar to
>> your first patch in this set.=20=20
>
> Sorry for missing your PR #1219.=C2=A0 We had been using resend through
> the early sysfs based scheme all along; only recently, when moving
> to a newer kernel and preparing the switch to the notify based one,
> did we find that libfuse had no API for it - hence this patch.

Sure, no problem.  That PR has been stale, and I'm fine with your patch.
Feel free to add my 'Acked-by:'.

>> The difference was that I also tried to
>> solve yet another problem: setting the fd back into libfuse-specific data
>> structures (i.e. re-initialise libfuse itself).
>
> The RFC looks good to me.=C2=A0 I did not implement
> fuse_session_reinitialize, because our daemon restores the session in
> a hacky way, so we had no need for the interface - but adding it would
> clearly be better.
>
>> This was an RFC, which later made me start looking into the LOOKUP_HANDL=
E.
>> Which is currently stale, but hopefully to resume soon.
>>
>> [1] https://github.com/libfuse/libfuse/pull/1219
>>
>> Cheers,
>
> Note that resend is not strongly tied to LOOKUP_HANDLE: we have been
> using it without LOOKUP_HANDLE for several years, with the daemon
> keeping its own state across restarts.

Yes, absolutely.  If you keep the state on user-space and if nodeids are
always unique and not reused, then LOOKUP_HANDLE is not really required.

> That said, LOOKUP_HANDLE is indeed valuable - we have a similar
> mechanism on our side as well.

Yeah, this will make it easier for new servers to support a restart
without extra complexities.

Cheers,
--=20
Lu=C3=ADs
