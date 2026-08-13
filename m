Received: from sender4-of-o52.zoho.com (sender4-of-o52.zoho.com [136.143.188.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE3E3F076F
	for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 17:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786643820; cv=pass; b=dYm/koYEBn59VOJ4Sq8Ars82uzg6qXMWrnSE5rXDzw+u9QKgtvg86/8XJcKeTBXmB+zR05iS/1YRA67V+ZpnRBx979L+Ud81+l1PSbHTefGa84qj+E+32CXleOqFgozQydx52AmLMUbIMM5EUnQ9sAHGobD1NZMgiW3DLN6nGf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786643820; c=relaxed/simple;
	bh=5mkMcQDzxN4s8iNAs25kJwaxzupK5qGkpdSa4pPuzr0=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=M499KMSQDf3ujLrlg/aHoDv7cY+YHroAk7Vc1JHiJ0O/U0ntu4PqOmJNze2OBrCLmurgnh1RN5AknDvl/Qt/HnUqXvuJ8hSZHflKZ8L5XPDHREdoBqv8e2JtjIvmeyNXYykDbxQ9aH/r3h1Aoo8Eyzy+fJ23wHQiFd3T3bnRCkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soss.website; spf=pass smtp.mailfrom=soss.website; dkim=pass (1024-bit key) header.d=soss.website header.i=skye@soss.website header.b=N2wajWhY; arc=pass smtp.client-ip=136.143.188.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soss.website
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soss.website
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=soss.website header.i=skye@soss.website header.b="N2wajWhY"
ARC-Seal: i=1; a=rsa-sha256; t=1786643812; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QC9pfnl9yUDFVwBMZTYTQb1PHB1ESmNB2hlEa5HJ1vD4AE/U/9DWkkrM9MhCS2MqFDymrMbM2PI7zcB/ez2GhJpu9x0EfFU7nED9mkX6jt6T1yR/Ko1O0hsxIj8rp59xF7eqQnh+9R+QmJFhLnEzVu3alQk5mM/TNy2RY78a3Yo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786643812; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=i9iefnIyS0aK7HFC4NdTsCW0aH7l0hp0xkdvwUoqQ/Q=; 
	b=GBYHUIAkhnWJ/Sp7EXRusQ6TLNwlcaszfxkRbTijcrY8sYuHJWL8kxJflUNXe7o9Z+e6ePXU5uMG1dI502Os6CUJ8DSTdGeC0EPaqfKxvVavsV3WpOQrOBWPQB+BunMMTwjL43vn9Ga4Syt8/1wFgiacJ8ZoKw1FPXovL8rnolI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=soss.website;
	spf=pass  smtp.mailfrom=skye@soss.website;
	dmarc=pass header.from=<skye@soss.website>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786643812;
	s=zmail; d=soss.website; i=skye@soss.website;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=i9iefnIyS0aK7HFC4NdTsCW0aH7l0hp0xkdvwUoqQ/Q=;
	b=N2wajWhYg383kzTqYIbITxYABc3V4KeQehb1A6BNtsuKVBKDmd+8STrVhAXK2AK8
	frFqsuZfDJxppuo37zfUjl68s3iBTTbUyz2KjUHlGLoljT4KtspFaUdcSkd6V0mIbqO
	SM+r2hUQk9PjwF8ENnUbA2Ac8DjlZ2ZPffwIa5zU=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1786643811762576.0616201560603; Thu, 13 Aug 2026 10:56:51 -0700 (PDT)
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1786643810922513.6913559380715; Thu, 13 Aug 2026 10:56:50 -0700 (PDT)
Date: Thu, 13 Aug 2026 12:56:50 -0500
From: Skye Soss <skye@soss.website>
To: "fuse-devel" <fuse-devel@lists.linux.dev>
Message-ID: <19ffc450a5c.73c3e4fe578863.6563820875101447901@soss.website>
In-Reply-To: <20260812190207.GX7398@frogsfrogsfrogs>
References: <19f398a15e3.502695601806579.8550477790560725089@soss.website> <20260707055248.GG9381@frogsfrogsfrogs> <19f47d06911.1ee803102145318.5945925919167031194@soss.website> <19fe7563e31.3e54918e70503.7575531443351235941@soss.website> <20260812190207.GX7398@frogsfrogsfrogs>
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

> > From my attempt at this redesign, I now think that this "client-server" approach is
> > probably *not* a good idea to merge into libfuse, and that its best to keep as a
> > separate project.
> > This is primarily because there aren't good ways to implement the filesystem access
> > check that a setuid program has access to: installing defused allows programs
> > to mount over directories that an AppArmor rule would have otherwise disallowed.
>
> Er, why is that? Does AppArmor not enforce the same rules between an
> unprivileged process trying a direct mount() vs. a privileged process
> that has entered another process' mount namespace to call mount()?
>
> Can you setns more namespaces (e.g. enter the user namespace as well and
> then setuid to the socket client process' credentials?)

LSM security contexts are attached to task credentials, which I don't think you can emulate
(unless you do something insane like attach a debugger to the program).
You would also run into issues where by virtue of entering such a context, you lose
CAP_SYS_ADMIN and thus can't actually perform the move_mount().

Maybe there's a way to check that the file descriptor that was sent was opened O_WRONLY?
Because I control both sides of the protocol this could allow the client to perform the
check and simply pass the proof to the server.

> > Another is security: the system service calls `setns()` on the client's mount namespace
> > with root privileges, which can very easily become a security issue if libc lazily
> > loads any shared libraries. I solve this by installing an extremely strict seccomp
> > filter, but this is not something libfuse should have to worry about.
>
> Huh. So the defused daemon forks a child which adds its own seccomp
> filter, and only then does it enter the socket client's mount namespace
> to attach the mount?
>
> Clever. :)

This is actually something that I've been meaning to improve on, since the umount code
still needs access to openat2 which is a little iffy. I don't know the implications of
lazy unmounting, but if that option was always set then I could just have the client pass
a file descriptor pointing to the mountpoint itself rather than the parent fd + filename.
The fact that there is a race condition (even though I don't think it could ever be
exploited, and libfuse has the same 'issue') bugs me. 

