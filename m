Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094139;
	b=4yvXruzVxbPIc2xmGmigZeBhQqxTWB8RQKZyNx0cJJtqs+qfGhEPOY8O/4YJgOMEOO2N
	 pD+BzKvwzvvHSbVfKHGFAJVfil9v1NRtZN2If8+1GVTQHSeBkVR4IHZrSOtTklw/DSRiQ
	 gkuoWGBoSGL+vmMdkPdcbQkQVdUH+fcTSYv5deyGghjEaai/1m7qwwmlZXo0mbuK1tTy3
	 +qGyJEEs9x141RbSyUHwK8LZtjOZsvx1gaSuSW0wJBjLnqCSZ49JqoIM6PWHXGs9pofFm
	 o/C67lvioL8HJpY6G8lK8jGaTh4JVTurFo14guWuel/0LnHAXa3GXkcn2UXm9sMSpnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094139;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=EI408fifvnEJ/B166JwKm9Y6OhlxedP5QuLCOP0Vpj4=;
	b=U1vQ+jSyQVDY/nbXaiTjPkvz8Vxvt4YZ360b0N+ABeCg46LS5oKxw9IF/mPPRZfEahwU
	 LW0hZ7Jc0gr89MGLt7PwhP5BLo28l3LHWpfKAahE5D61BhjmXiC/5v0oW5tXJ83w20R4u
	 Z+d8UwqtLLkplEmLZl2j4/nNXE48Q/yM4aXuixksD0Q8FDvFy897ioLUGeg+mC0zSRTOb
	 yjJ3Gz3zrvuj6+PGOHW9Wk2KJTTBr++2Dw9/gI0uLCNx7H6K7TyQWvEXOL3ddGZ56DKbt
	 4YfE+5BXERoH4xLEsFu1EHo2TfOe8ZtUVzxZsoG8Lw7R3EBJ8J325/SvVXVw3IpKh9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=a7snv.com;
	spf=pass smtp.mailfrom=a7snv.com;
	dkim=pass header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b="s/Dtm5Q0";
	arc=none smtp.remote-ip=185.70.43.17
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEF4606A320
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 13:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FEF4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=a7snv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a7snv.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b=s/Dtm5Q0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a7snv.com;
	s=protonmail; t=1795094135; x=1795353335;
	bh=EI408fifvnEJ/B166JwKm9Y6OhlxedP5QuLCOP0Vpj4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=s/Dtm5Q0x5+wk/qASksO+l1Q1BoWzJn8JQmdGvJ0tH9zbP6YkPLUpCOsxWX1xe9nY
	 HXHTXNTa8CIfiiLWtH3IrzNjh79M5sIgKc42SvtWJGMEdU1KFg1jQWWrnnfWtr0cmL
	 FvWQssclzvmhHVKi/lqdVlmqrWXswIvumBRC1hBd+VGxS/MSBQDXfmE6bvboCSelZt
	 jn2RXUYRbjRoG3wBD/WwhJzOdPpkG0COoJ0xm557bgvEXvuzfTnP9CsXpH88BfxuAF
	 R3oy3d1Y9zE/UuU8pORVeZxBvqTex/3oKNu59XJIFxLyu8JtktlMqGtGoCoK5d1hln
	 lEigdWvhRckXw==
Date: Thu, 19 Nov 2026 13:15:27 +0000
To: Bernd Schubert <bernd@bsbernd.com>
From: Yun Wang <arsenova@a7snv.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] fuse: don't wait for a sync-init mount in fuse_uring_cmd()
Message-ID: <179509410286.1113694.13152766226405003077@a7snv.com>
In-Reply-To: <7bb720d9-30ef-4d3f-8ab8-81c5fe2e0fe1@bsbernd.com>
References: <20261117075632.59959.p12-0-arsenova@a7snv.com> <20261116235814.60702-1-arsenova@a7snv.com> <7bb720d9-30ef-4d3f-8ab8-81c5fe2e0fe1@bsbernd.com>
Feedback-ID: 235448903:user:proton
X-Pm-Message-ID: 9db23fb9944db016d5a4d39f25daf6ec60d3eba5
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/17/26 22:47, Bernd Schubert wrote:
> On 11/17/26 00:58, Yun Wang wrote:
>> Until FUSE_INIT has completed, fuse_uring_cmd() returns -EAGAIN anyway
>> and the server has to send the command again later.  Return -EAGAIN
>> at once when the device is not mounted yet either, using
>> fuse_get_dev_nowait() from the previous patch, and don't log "No fuse
>> device found" for it.
>
> And what is if io-uring is enabled? Userspace busy loop until the device
> is available? I don't think that is nice.

I understand the concern: -EAGAIN doesn't tell userspace when to try
again, so a server can only retry blindly.

But that isn't new with this patch.  On an async-init connection,
mainline already returns -EAGAIN for a REGISTER sent after mount(2)
has returned but before FUSE_INIT has been answered.  On 7.4-rc2, with
a test server that answers FUSE_INIT 300 ms late and resubmits on every
-EAGAIN right away, as libfuse's fuse_uring_resubmit() does, the
REGISTER was resubmitted about 50000 times in those 300 ms.  The patch
applies the same rule to a sync-init device before the mount.

It does change one thing that the changelog leaves out.  It says the
command gets -EAGAIN anyway until FUSE_INIT has completed, which
suggests the wait gained nothing.  But after the mount wakes it up, it
can still get past the initialized check: FUSE_INIT may have been
answered by the time the woken task gets there, and if not, io_uring
retries the command from io-wq after the -EAGAIN, which may be late
enough.  On a sync-init device without the patch, 12 of 20 REGISTERs
sent before the mount got past the check (6 in the woken task, 6 in
the io-wq retry).  With the patch it is -EAGAIN every time and nothing
sleeps, so the old behavior was timing-dependent rather than a
reliable wait.  I'll fix the changelog in v2.

libfuse isn't affected either way: it sends REGISTER only after the
connection is initialized, with both sync and async init.  I ran
passthrough_ll -o io_uring on 7.4-rc2 with and without the patches and
counted what fuse_uring_cmd() returned: never -EAGAIN.  What the patch
fixes is the submitting task sleeping in io_uring_enter(2) until the
mount or a signal, which also holds up everything else that task
submits in the meantime.

The retry could wait in io-wq instead (I have that working), but
uring_cmd work runs on bounded io-wq workers, and each early REGISTER
would hold one until FUSE_INIT.  A server registers a whole queue's
entries at once, so that can use up the submitting task's bounded
workers and hold up its other punted work.  With 4 CPUs (a default
limit of 16), 16 early REGISTERs were enough to hold a NOP sent with
IOSQE_ASYNC by the same task until the mount; with 15 it completed at
once.  I don't think that is a good design.  Queueing early REGISTERs
and handling them once the connection is initialized might avoid this,
but that is only an idea, I haven't tried it, and it would be a bigger
change.

Would you prefer to keep -EAGAIN as in this patch, or should we look
for a different approach that covers both the sync and the async init
case?

Thanks,
Yun

