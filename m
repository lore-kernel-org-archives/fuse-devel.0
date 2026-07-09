Received: from sender4-of-o52.zoho.com (sender4-of-o52.zoho.com [136.143.188.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4847F3655F1
	for <fuse-devel@lists.linux.dev>; Thu,  9 Jul 2026 16:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616273; cv=pass; b=LdiiybyM5tnGC8c+FM+iVA55nYOS/0/EXCcKghcO41IddSp8LEzHmIvHLbLjIKGjiqMq1hgzNjw6IVl14xmWUVfuP292Q/wMWbfrJTsUqQGDsAkGWuC0HYvQQ5TS8FafFIP0kIHQV4QcrMYqIBblyRv8jnnqRIbkPX+pb6so+FU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616273; c=relaxed/simple;
	bh=aQPjNtfTbM/V+x7nABekVwfPFKEqBH0dYpeOYEWEXWw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ertrwHarnnen0IObKFaDDdrbJkTx0C77A9BrDu8wkFu/1oUkgmrbH5Nz0GVIXnz2J+D5sTScBdeNyowYd2aoVWzSuCvMUbv7nWm5kulvHSH1LU+02zFbvCjdLAMCMbvyatKeEcCnxuQDQHXHH6vQFWyIznCYttX1/85OfhsEVyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soss.website; spf=pass smtp.mailfrom=soss.website; dkim=pass (1024-bit key) header.d=soss.website header.i=skye@soss.website header.b=COsdgt+I; arc=pass smtp.client-ip=136.143.188.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soss.website
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soss.website
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=soss.website header.i=skye@soss.website header.b="COsdgt+I"
ARC-Seal: i=1; a=rsa-sha256; t=1783616270; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=db6JFMhVgkX65ut1Zs1TO2gB+A1H1cYdl0LQT96n9FuBOUx3k5KOQkZbBEqU4/h/Ud6v0oM8lj5jcj/z1+VI9oq7+6dfFaZdDwJvFHlZXg2kvyiSc+nfbmja7yQyf9KvY8UsLCpSs+uT9xbrtKPQocnWvhaFDeKESaINnxa6mmQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783616270; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oU6GkL27y8OCf/tivtZmc9NNealdi11+Dyo5RiEanUQ=; 
	b=kf5Iy4iMqqZXNLgS/veOSgiCDs8PL0TyCYexdSZfapyC84BJQnps3dmpHFOXrrmvxqtkoWcdTe/kZuUh7z8Ndh5h/6YBPPXNVDS+1ZzLG954EQ4Ezq+alnXjvTkzs9hlZOU9PmUaGX6qZQzUjkMblQg4jEZqQ9yja9rbD5Hg7pY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=soss.website;
	spf=pass  smtp.mailfrom=skye@soss.website;
	dmarc=pass header.from=<skye@soss.website>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783616270;
	s=zmail; d=soss.website; i=skye@soss.website;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oU6GkL27y8OCf/tivtZmc9NNealdi11+Dyo5RiEanUQ=;
	b=COsdgt+IpgcuZtg5Lc/d1KLs05IHwMkVavY1LJR2DDqX8JaLxefCBG6kEvb+R3dP
	kSAWqC+poucpYewirChIjaQqdy0SfjviKgErNw6hHFvhzvNzyrm+GVtcxxHZMOsbYFX
	9rdF0eE6m3AWvFaUPGRz56E3pixTaoikOtVCumC0=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1783616270168633.5670345436552; Thu, 9 Jul 2026 09:57:50 -0700 (PDT)
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 178361626858032.745307215741605; Thu, 9 Jul 2026 09:57:48 -0700 (PDT)
Date: Thu, 09 Jul 2026 11:57:48 -0500
From: Skye Soss <skye@soss.website>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: "fuse-devel" <fuse-devel@lists.linux.dev>
Message-ID: <19f47d06911.1ee803102145318.5945925919167031194@soss.website>
In-Reply-To: <20260707055248.GG9381@frogsfrogsfrogs>
References: <19f398a15e3.502695601806579.8550477790560725089@soss.website> <20260707055248.GG9381@frogsfrogsfrogs>
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


 > On Mon, Jul 06, 2026 at 05:26:18PM -0500, Skye Soss wrote: 
 > > ...
 > > Ie. The fuservicemount binary would be a non-setuid binary, and simply 
 > > communicate with a socket in /run that is backed by a privileged 
 > > socket-activated service. Upon activation, the service would use the 
 > > peer credentials to enforce limits such as `mount_max`, and configure 
 > > `/dev/fuse`. Finally, it would spawn the sandboxed systemd unit to run 
 > > the filesystem, using `--scope` to transfer the file descriptors to 
 > > the new process, or using socket activation with a socket file that 
 > > only root can read and write to. 
 >  
 > How do you get the socket-activated part of fuservicemount to call 
 > move_mount() (mounting) and openat() (resource acquisition) in the same 
 > mount namespace as the directly-invoked part of fuservicemount?  A 
 > socket service has no idea what namespace(s) are in use by the client; 
 > its entire relationship with the client is limited to whatever is shared 
 > through the socket.

A privileged service can enter the mount namespace of its peer by obtaining
the pid via SO_PEERPIDFD, and passing /proc/$pid/ns/mnt to setns().

SO_PEERPIDFD is Linux kernel 6.5+, but the commit message alludes to a
portable alternative if we need to support older kernels
(ba47545c756b55f4b114c45fea7d52dd1577e181).

 > > The advantage of this approach over the current design is 
 > > compatibility with containers with the no_new_privileges security 
 > > feature enabled. That disables privilege-elevation through execve (ie. 
 > > setuid and setcaps binaries), but the use of systemd socket activation 
 > > would still work. 
 >  
 > Yes, though this adds more moving parts to the machinery.

I'm not sure it does because the `fuservicemount` binary would no longer be
security-sensitive. Ie. it would remove all of the `drop_privs`/`restore_privs`
calls that litter the mount_service file, as there will now only be one
privilege transfer boundary.

 > I am, of course, curious to read any patches you have implementing this. 

Thanks for the interest! I'll try to write something up next week.


