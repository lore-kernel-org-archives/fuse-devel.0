Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4904A360EE1
	for <fuse-devel@lists.linux.dev>; Wed, 12 Aug 2026 19:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786561329; cv=none; b=ekfLSg0Ct4/4KMh8moqVlcEop+f2ux6JX5thEgiTbuETJd9mkKfn1jVdYKo8tC6dGgTHCtpTD66AjkRXj/IfcttN4ksTSUzeH1yGKqQyCHvtgxIV8Zz0CNv0bTqi4ZEZAxpAXjKfz2gqgvkMTqvYOdXFWfikA+v3jd1xxidCYC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786561329; c=relaxed/simple;
	bh=pvCKOT6h0tigWQp9Ves1j66ncyQhpP+9S9CVTwPqXqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVvnBtLtspKyQxddQm87B9o+kyqNJ7l7v5EhN4BbpAaRVKqUpwmNFpmfxn6Pt9pxFZVUfJj4pXLcyNQ8xX1t0updmBxczuJ+RnE0HBT6eHDxd759wdcNPH8Cd3iOynKcLQUVFz+qWbKuuKxkUNbl80Ip7CRE6mYf//L00/nNPkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxVHzzst; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxVHzzst"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C3BFF1F000E9;
	Wed, 12 Aug 2026 19:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786561327;
	bh=u6am164f9nQuWmDE3vpnlUIPp5aPo1cAHhq4jA8Qnwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YxVHzzstyE0KLQgtFM/GsOdAaa80W3g+6kC7ZEFSGIMWQTqtC75b6li4yYTh5GfIb
	 HOk+lZKXBYnX//tqA4VzeVpOJ6glkAN8CpKqpsvpizsZDQt1jBaeW6yGydnHCUMBkb
	 vlmu6VrITQPoYw0oIO3TNrI2MzYuWw/bYvOHdPLj7lh+HICM8/63u1U8j+XcAljukT
	 fnjL3qeLNTFf/G0slRaFdQkUN8v+oDF7trDx7dU+zkuicE0lYjFgS138NzT2oHTcKy
	 rLONhR+g1cmAazw/36kIfb4bRKQn2L+7A/60CO75QzdqRDaY7AmBJPKCva1pVHWA+t
	 6FM+tD9YSJBug==
Date: Wed, 12 Aug 2026 12:02:07 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Skye Soss <skye@soss.website>
Cc: fuse-devel <fuse-devel@lists.linux.dev>
Subject: Re: mount_service: possible implementation changes
Message-ID: <20260812190207.GX7398@frogsfrogsfrogs>
References: <19f398a15e3.502695601806579.8550477790560725089@soss.website>
 <20260707055248.GG9381@frogsfrogsfrogs>
 <19f47d06911.1ee803102145318.5945925919167031194@soss.website>
 <19fe7563e31.3e54918e70503.7575531443351235941@soss.website>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19fe7563e31.3e54918e70503.7575531443351235941@soss.website>

On Sun, Aug 09, 2026 at 11:23:36AM -0500, Skye Soss wrote:
>  > > > Ie. The fuservicemount binary would be a non-setuid binary, and simply
>  > > > communicate with a socket in /run that is backed by a privileged
>  > > > socket-activated service. Upon activation, the service would use the
>  > > > peer credentials to enforce limits such as `mount_max`, and configure
>  > > > `/dev/fuse`. Finally, it would spawn the sandboxed systemd unit to run
>  > > > the filesystem, using `--scope` to transfer the file descriptors to
>  > > > the new process, or using socket activation with a socket file that
>  > > > only root can read and write to. 
> 
>  >  > I am, of course, curious to read any patches you have implementing this. 
>  >  
>  > Thanks for the interest! I'll try to write something up next week. 
> 
> I've been working on a proof-of-concept on-and-off for the past month, which you can
> find at https://github.com/Skyb0rg007/defused.
> I'd recommend just looking at the README and doc/protocol.md for details.
> 
> From my attempt at this redesign, I now think that this "client-server" approach is
> probably *not* a good idea to merge into libfuse, and that its best to keep as a
> separate project.
> This is primarily because there aren't good ways to implement the filesystem access
> check that a setuid program has access to: installing defused allows programs
> to mount over directories that an AppArmor rule would have otherwise disallowed.

Er, why is that?  Does AppArmor not enforce the same rules between an
unprivileged process trying a direct mount() vs. a privileged process
that has entered another process' mount namespace to call mount()?

Can you setns more namespaces (e.g. enter the user namespace as well and
then setuid to the socket client process' credentials?)

> Another is security: the system service calls `setns()` on the client's mount namespace
> with root privileges, which can very easily become a security issue if libc lazily
> loads any shared libraries. I solve this by installing an extremely strict seccomp
> filter, but this is not something libfuse should have to worry about.

Huh.  So the defused daemon forks a child which adds its own seccomp
filter, and only then does it enter the socket client's mount namespace
to attach the mount?

Clever. :)

--D
