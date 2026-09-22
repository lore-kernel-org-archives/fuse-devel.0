Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE1E5208B2
	for <fuse-devel@lists.linux.dev>; Tue, 22 Sep 2026 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790114173; cv=none; b=TocYdFoBBAEDw9BinbvzYqYcB6Uoj33g3Q8jOi70nEQhaUEl6JI9eVz1A4r8v94Z9WHiw6CxsJzOLnmLZQ2P0GSebUAOcCnXfhbLJGup6RcRNsl/5A34RmrfvD5LOp48X+ewpIAuvDhkI8krpYMYOzqukS0R1U6vaTnjMEed0Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790114173; c=relaxed/simple;
	bh=UZiHrXx3nxquo0/GWE86hplaFa6aT+2cCgi3z6+xU4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6oUmDBJUvwZ7mG9uzkAq3yOqcbXbXFjVe9JiXC8YOaSpRKxmPA9R5EUojVivFCFW0Lmyu6HlKm4s10P2L/uoKYUkOYugw6rzd16d1SRjt/dD6AcIUhUQtkt7NXZ5vkSy4m12UTllNJHGmnMJPyauIP9YXUTpj/O/EA1uDIVLQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3C6gJWV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3C6gJWV"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2D8891F000FF;
	Tue, 22 Sep 2026 21:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790114165;
	bh=z70ug+YNI2xoZTfonqeZ74IMs4zmlXXzOSyoV5LIrVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L3C6gJWVhB8yxQqOTpxl+dWW0A6c1TILO8ARjCLhs82QsZyWw1lQ2fK6gYaOcs7gm
	 ba+8Ml4+k/q+CIY2LDXbDml6IoyA5ge59Swx+yVgRUHVtoqZRTIELSrO2p/RzizXl2
	 XJqS2DF3370Pl8ycKbI3oC7+JBcWNzDTtfCIQNAshuqHkLJS96g+im+aYfq22y0t9p
	 9S+Iz+u4m+xe5AZHOiASWrhqBuTCKKXui4BaNXj4Ol/fU/CnZp9j7iRLQr6xLyntd+
	 TgbZR4+htBDnQ2GxOLIebl1XFLx1IwtrELLoVbzX2O4LMQlFtoCFeD5q8hqccOcTCR
	 SSPdAKytDP5Tg==
Date: Tue, 22 Sep 2026 14:56:04 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Skye Soss <skye@soss.website>
Cc: fuse-devel <fuse-devel@lists.linux.dev>
Subject: Re: fuservicemount as a systemd storage provider
Message-ID: <20260922215604.GX6283@frogsfrogsfrogs>
References: <1a0c03229ed.1b908e3c391748.1531711527420340195@soss.website>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a0c03229ed.1b908e3c391748.1531711527420340195@soss.website>

On Sun, Sep 20, 2026 at 02:01:48PM -0500, Skye Soss wrote:
> The fuservicemount infrastructure that's currently being developed in the libfuse repository allows an administrator to
> setup a service that can create sandboxed filesystem implementations on-demand.
> 
> There is a very similar interface that's being developed in systemd (added in 261) called Storage Providers[1].
> The directory /run/systemd/io.systemd.StorageProvider/ contains Unix domain sockets, each of which is backed by a Varlink
> service. The interface (modulo metadata + options) is essentially:
> 
> Acquire(name: string) -> (fileDescriptor: int)
> 
> systemd also provides a mount helper so that `mount -t storage` can transparently use the storage provider interface.
> 
> This seems like a very similar kind of setup to fuservicemount + mount.fuse, and I'm curious if there's anything missing
> from the systemd interface that would stop fuservicemount from being implement in those terms.

Can't work on any environment that lacks systemd (Devuan, BSDs, etc)

--D

> I believe that systemd-nspawn and systemd-vmspawn are going to be extended to create mounts from these interfaces, so
> compatibility would be useful.
> 
> [1]: https://www.freedesktop.org/software/systemd/man/latest/systemd-storage-fs@.service.html
> 
