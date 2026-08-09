Received: from sender4-of-o52.zoho.com (sender4-of-o52.zoho.com [136.143.188.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659302FF66A
	for <fuse-devel@lists.linux.dev>; Sun,  9 Aug 2026 16:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786292623; cv=pass; b=g3Z+TZaq0fD4z0pva5T3iWblRaVAFO1tNGXKJ5uGFTUF1BKI/Px+Bq99HktlbUH0JZDrZp7KUnFORzQLWgZpz7VGVgJMxn4cVPxGNEqvKmK41JBhZIwTlIykX0/McIkJpXzkXWhJdWuQEXR/LEo5UTDgjm0MTRpgePg0PxccrB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786292623; c=relaxed/simple;
	bh=zwSCjyF1QuP6iLoF1L6Sz5cNv4z6RuZFINOWLjEE/jk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=lEiy9nM78KKqQFJYmTaEanpxUwKb+Wll0uz8wTwlmOihbLA9Fc5gmtDGQQuAx2svbG5nfBL6VbbG4YY6UMsR4TTB8K9Adntc5un2mYcTHoXotT++5BMMbomZD5FHdON1ct0waKlE6Q1kYLHervInB93PGfD7OSTXPwqxvxaXAuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soss.website; spf=pass smtp.mailfrom=soss.website; dkim=pass (1024-bit key) header.d=soss.website header.i=skye@soss.website header.b=e023zSWd; arc=pass smtp.client-ip=136.143.188.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soss.website
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soss.website
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=soss.website header.i=skye@soss.website header.b="e023zSWd"
ARC-Seal: i=1; a=rsa-sha256; t=1786292618; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BMH9VSYn6xwtQU2mB/NJXbXNKdyU4AEfXMWPZ7Opih6BiY5arn4iim8qUNFb49Kh850JKlxizaCYK+Lss60Tz15O6Ykd79wNC2I9LXBvWdMY60bkT/Z0Wp2g73bmjtYIj8xlOMirtrchjmFRQkWddLUqHssW6YsB5Div6emrPQ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786292618; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DzGqnIH3ZfxjCmWxDrkbOkjvUAbBQ+Ou+Vhgfa204jk=; 
	b=ca/GxTC+C2JmY4bLw+aoxpZKAbxwaJswyMKAr9q2/cv6PynuJ1PCeeVS4Ycak7GwSdUw6CwAVchdlr6QlvoGTrrsZLXzYo3WvzmugCLxN3WID8MWNDWIlo4IcwPET606sB/M2Ve3tcXwWA9Qj4ws6kK1XDLlSYgAFwwHbWnrI+0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=soss.website;
	spf=pass  smtp.mailfrom=skye@soss.website;
	dmarc=pass header.from=<skye@soss.website>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786292618;
	s=zmail; d=soss.website; i=skye@soss.website;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DzGqnIH3ZfxjCmWxDrkbOkjvUAbBQ+Ou+Vhgfa204jk=;
	b=e023zSWdwQhJR/yEQSbmYCZqsxpr1L079qlPmF4AjvINqDM74/BjDL+2E5idk7x8
	CQ0pWEGBmXJQP//FRO5h+FikDmf4+w0qLCQ9V7XpL38kyvjTg2GpmXUq2svI3T3eoVf
	RT4uc7pix8ZQ8mX+5HRupfde8pv68tyNSwqq+ins=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1786292618086262.7541033088628; Sun, 9 Aug 2026 09:23:38 -0700 (PDT)
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1786292616768890.7547208427494; Sun, 9 Aug 2026 09:23:36 -0700 (PDT)
Date: Sun, 09 Aug 2026 11:23:36 -0500
From: Skye Soss <skye@soss.website>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: "fuse-devel" <fuse-devel@lists.linux.dev>
Message-ID: <19fe7563e31.3e54918e70503.7575531443351235941@soss.website>
In-Reply-To: <19f47d06911.1ee803102145318.5945925919167031194@soss.website>
References: <19f398a15e3.502695601806579.8550477790560725089@soss.website> <20260707055248.GG9381@frogsfrogsfrogs> <19f47d06911.1ee803102145318.5945925919167031194@soss.website>
Subject: Re: mount_service: possible implementation changes
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

 > > > Ie. The fuservicemount binary would be a non-setuid binary, and simply
 > > > communicate with a socket in /run that is backed by a privileged
 > > > socket-activated service. Upon activation, the service would use the
 > > > peer credentials to enforce limits such as `mount_max`, and configure
 > > > `/dev/fuse`. Finally, it would spawn the sandboxed systemd unit to run
 > > > the filesystem, using `--scope` to transfer the file descriptors to
 > > > the new process, or using socket activation with a socket file that
 > > > only root can read and write to. 

 >  > I am, of course, curious to read any patches you have implementing this. 
 >  
 > Thanks for the interest! I'll try to write something up next week. 

I've been working on a proof-of-concept on-and-off for the past month, which you can
find at https://github.com/Skyb0rg007/defused.
I'd recommend just looking at the README and doc/protocol.md for details.

From my attempt at this redesign, I now think that this "client-server" approach is
probably *not* a good idea to merge into libfuse, and that its best to keep as a
separate project.
This is primarily because there aren't good ways to implement the filesystem access
check that a setuid program has access to: installing defused allows programs
to mount over directories that an AppArmor rule would have otherwise disallowed.

Another is security: the system service calls `setns()` on the client's mount namespace
with root privileges, which can very easily become a security issue if libc lazily
loads any shared libraries. I solve this by installing an extremely strict seccomp
filter, but this is not something libfuse should have to worry about.

