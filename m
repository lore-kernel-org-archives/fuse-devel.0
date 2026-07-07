Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C2B27B32C
	for <fuse-devel@lists.linux.dev>; Tue,  7 Jul 2026 05:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783403571; cv=none; b=aqvbTGNIPy4J4M/n2POzjIfTlVklqZi4751L3Cv3kxxr3elAkSO2q41/YmMsShUy2wxraAQFWFCXKvxqUZIYfhqTF93uNeu6snJ6Je8eBCFWte1jqoRVo2tkHZPdc1vaiEK7vDRMN3qZ4fEzJUF6zEoJZJgvl2Z8J0ZUWhKS9AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783403571; c=relaxed/simple;
	bh=1FnXGJ5mEKALd0ANp0Qo0LkJtu9vnHrZTMO0ex7urvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlq8Gtp78toiqc7hxcjjyZxrXsVh4VQzcVwkFbRW50NaCh1TJ1bg9QgFl1z2+T+0K83g9pZUxbarqmHwlL1BjE8vllEK/orptqbHB4YWFn88K9EGVV9JvvMTk9wK9U0rXJOru+a/g6x36RWC4vgn3c5DHWBcpkChD+BUZf59IsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmAZ0uFX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmAZ0uFX"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 862121F000E9;
	Tue,  7 Jul 2026 05:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783403569;
	bh=PGNHV6kMzYQ5j7F0mbXnFblPTxVJPFItemYnkYSQmnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JmAZ0uFXUmBu7mHcR4NqhCGC0QmUIEciM1fnWeYgZGI23wqgqkvMrAM2MhC1pXowy
	 hU7lf6AjO1KMmgY/G2oKSe8TryCLSVsTU7JXuxFEzHiqZfNcLBbVe3Ra5+/DIm/54F
	 NUQYhxHfGd4+ZCcOS5qBHzKuuf/R1XL+UwJ7mTt2kCh4U93s6oUT1mywEDe32vxQkk
	 MXTRwT2Aw3H3TDXnCCX9H0sui6CPMclGHRJrtYmhp3oSuvUONCsRUgBd4+bK5zR3yt
	 DMebWd8WxDHI1GyBssBOx/nc17XUwFQ8lAv3RvoVZG7EmneL8unIKFUn+0motdzD58
	 Q2lGeeVmVLB5g==
Date: Mon, 6 Jul 2026 22:52:48 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Skye Soss <skye@soss.website>
Cc: fuse-devel <fuse-devel@lists.linux.dev>
Subject: Re: mount_service: possible implementation changes
Message-ID: <20260707055248.GG9381@frogsfrogsfrogs>
References: <19f398a15e3.502695601806579.8550477790560725089@soss.website>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19f398a15e3.502695601806579.8550477790560725089@soss.website>

On Mon, Jul 06, 2026 at 05:26:18PM -0500, Skye Soss wrote:
> Right now the new mount_service protocol works by first gaining root
> capabilities via fuservicemount being setuid, then communicating with
> a socket-activated systemd service to run the actual filesystem
> implementation in a sandboxed systemd unit.
> 
> I think there could be an improvement to the design by instead moving
> the privileged parts into a systemd socket activation unit, and having
> that privileged service spawn the containerized systemd unit as a
> child transient unit, or via socket activation with a root-only socket
> file.
> 
> Ie. The fuservicemount binary would be a non-setuid binary, and simply
> communicate with a socket in /run that is backed by a privileged
> socket-activated service. Upon activation, the service would use the
> peer credentials to enforce limits such as `mount_max`, and configure
> `/dev/fuse`. Finally, it would spawn the sandboxed systemd unit to run
> the filesystem, using `--scope` to transfer the file descriptors to
> the new process, or using socket activation with a socket file that
> only root can read and write to.

How do you get the socket-activated part of fuservicemount to call
move_mount() (mounting) and openat() (resource acquisition) in the same
mount namespace as the directly-invoked part of fuservicemount?  A
socket service has no idea what namespace(s) are in use by the client;
its entire relationship with the client is limited to whatever is shared
through the socket.

> The advantage of this approach over the current design is
> compatibility with containers with the no_new_privileges security
> feature enabled. That disables privilege-elevation through execve (ie.
> setuid and setcaps binaries), but the use of systemd socket activation
> would still work.

Yes, though this adds more moving parts to the machinery.

> The other advantage is limiting the access of the filesystem sandbox
> startup to the privileged service, which can prevent issues arising
> from parsing bugs (not privilege escalation, but potentially DOS
> issues by escaping the systemd resource-control group).

I am, of course, curious to read any patches you have implementing this.

--D
