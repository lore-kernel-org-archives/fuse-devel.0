Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A84617745
	for <fuse-devel@lists.linux.dev>; Tue,  9 Jun 2026 00:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780963919; cv=none; b=oWXV5ST0Yd2xEvV53G//Wm4u6FGrk9zZrM2Mamxsa0HeICu0XIe2DqwjLof1Wx3aOvb6SYoy19a28bf9qPfMBHjZZBFy+Gfp3ITaa6WiJ46QIwz0H+gu/847SGn/tCYm72+WZB5J47viUTHH1Xz3suXPmMCmJGOfbib7oaulh88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780963919; c=relaxed/simple;
	bh=q6l38RVx68ggy068g38ipDNwtgyiFrHPc8VCL56LDOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9IzQNykno3P3iPwJ05dmaTcVjsu5TLVhEBjQZaZ4sInkQauhTda1Fbc7NbRBZgWOZTc85m2CSbdRlxbvKSyOCFV5ZwgqaKqWahlNseIz4H5dRdKLfxbxktA5wwaDx0fOqZoJP7SwECUbAWgWAOLc6u2ZwmIHGGJmN5O3dz/ITo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8IqAVQ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8IqAVQ+"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 408851F00893;
	Tue,  9 Jun 2026 00:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780963918;
	bh=kkpV8mrUdv7taWdazpiT8vEMFi4pj6DaOgD+VqLK50w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G8IqAVQ+KwKSxLI2j0Th21szO9HuP9bEa3X+sWT53NzhnF4uZcLgBTTO7UXHkiV4a
	 CGeh94utjKFPyhgfD/Bnkp3K2XLQG4FxFh2Q5XZ2OOcTEOTVKcL4p38VVJGulrgD5B
	 93i7Gygwr9z886jmXbmc1ooy7zM6/KZF5dJ92tybTuO4bR+J4/Kblijctd5HQYdljl
	 RXCoJgXsuM2BtBXfLExssHJyK2f1gULKWvW81URBMXU5lgJXjfiEBXrxnj2gPqbZHM
	 32AsKXX/Qqlr3KdE0CbWSpVbzlHXofa0Tm7KbLBt/cSr6koVqMQFs20NP4L+2R+ux9
	 uHtLUtQTkXfmw==
Date: Mon, 8 Jun 2026 17:11:57 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Bernd Schubert <bernd@bsbernd.com>
Cc: fuse-devel <fuse-devel@lists.linux.dev>
Subject: Re: Fwd: [libfuse/libfuse] Improper Link Resolution Before File
 Access ('Link Following') and Time-of-check Time-of-use (TOCTOU) Race
 Condition in libfuse (GHSA-926f-3q38-ff52)
Message-ID: <20260609001157.GM6095@frogsfrogsfrogs>
References: <libfuse/libfuse/repository-advisories/GHSA-926f-3q38-ff52@github.com>
 <9e1b592a-2f33-4a21-b7fd-cb210d43bd12@bsbernd.com>
 <20260608214742.GL6095@frogsfrogsfrogs>
 <ae3d7142-7bfa-4a18-8e75-baf3f0b64c35@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae3d7142-7bfa-4a18-8e75-baf3f0b64c35@bsbernd.com>

[add fuse-devel to cc]

TLDR: Bernd got a complaint through github about how you can trick
fuservicemount into unmounting the wrong path by racing a fuse service
asking for an unmount against someone creating symlinks to critical
mounts.  The reporter suggested using UMOUNT_NOFOLLOW, but...

On Tue, Jun 09, 2026 at 12:58:46AM +0200, Bernd Schubert wrote:
> 
> 
> On 6/8/26 23:47, Darrick J. Wong wrote:
> > On Mon, Jun 08, 2026 at 10:25:26PM +0200, Bernd Schubert wrote:
> >> Hi Darrick,
> >>
> >> could you take care of this?
> > 
> > How do you want to take care of it?  In-kernel filesystems do not
> > unmount themselves, so this particular libfuse feature is novel to me.
> > I don't really get why libfuse has the autounmount feature; if a
> > filesystem fails to mount, surely you'd rather it just stay there so the
> > application errors are obvious.
> > 
> > <shrug>
> 
> That predates me and I was already complaining at LPC 2024 in our fuse
> session.
> 
> Maybe we can disable auto umount for fuse service mount? I didn't have
> time to check at all.

There's no auto unmount.  The fuse service itself has to request the
unmount.  But since that's unreleased code, let's just rip it out.

> On my urgent todo list is to switch auto mount with the new mount api to
> mount fd and maybe disable auto umount without new mount api by default
> (as compile time option)

Yeah, I think we should just kill it because there's (AFAICT) no good
usecase.  If the fuse server fails, we want the dead mount to stick
around so that file IO fails instead of silently(?) going to the parent
filesystem.  I guess the problem is that there's probably some weird old
usecase out there, like auto-unmounting /home/XXX from NFS when you log
out of a server and not having the unmount get stuck due to dead
fusermount mounts.

> > Since the mount service API is new and nobody uses it (not even fuse4fs)
> > we could just remove it.  Assuming you haven't cut a release, we could
> > probably get away with removing the ABI entirely.  If not, we could just
> > make it reply with EINVAL/EOPNOTSUPP unconditionally.
> 
> I'm all for it :)

Removing it? OK. :)

> > That said, why is it the case that most of the other umount2 calls in
> > libfuse *don't* pass UMOUNT_NOFOLLOW?
> 
> No idea, as per above, it predates me ;) I guess we won't need that
> anymore with umount by mount fd?

I don't think the new fsmount APIs actually cover *unmounting*.  Once
the mount is exposed to the directory tree, anyone else can walk in and
start bind mounting it all over the place.

--D

> 
> Thanks for looking at that!
> 
> 
> Bernd
