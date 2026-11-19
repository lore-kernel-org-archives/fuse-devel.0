Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795129421;
	b=vjvE7mMNbpKPHy2AYYXlFCltYXwPKnRctElGI/F1y711HuP26I1rdXaLxLC2kiEYV7Vd
	 41vRVaEeAzl6JDfvExZvoh7BDfQ4BjGzH/7m9awDI/AxmlHKX8OK1Zr6szuyxzXGMptNQ
	 jqGEtjWMZc44GavkW243WL6ao1c9H0zpMxzvfcB5N59a+nQgSbjKUVFkZRPQCyAwIOAAU
	 Ohy5p5LxlFJr2Es/5grZ3pcWWXRThBxXs7iIboZgbwcHcbl7GKU5DemyMfAsJ4fEUb5sy
	 4j7QToxELGijB0z+do3DT5sb0u8xczHmpG/9/Ff9/rHjk2WE63+JDMaqNnLTgXOGgOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129421;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ldOaBTLY4uCQrQ5Yn8ZzHpIxSvzO3a3EA9r85vz2zgI=;
	b=iPwOCtsjSEDBDIp/eAJvVFboL4ZpHzTwA8LorDXZUNtsjZxH625TEQ/3uwD+KnZZxlLM
	 WLPoRPZTnQ5VYqA1J2hfBE6JkerbEyKC6kdP4Kc8of9pEdvDkJHnCKwvejRhJoX8QGyr8
	 ZhxWZMoqXETMammR3Lwcs7RW7djmmot3GlRe7wqtPxPx6ffhCnGKl26C65B5Hz6PQsxIt
	 SViPMMm6hb9B3ojwYU2F3orppIBciM42//QPMMB0CinBP5qs+AbSBAOoPBP1jYV4cftf3
	 lbRjBudhjnNgW3LTvo2QrykZn6pnO9R5ApB0lYVRkIcdNgfbFnjDHCkOO72n8HNdwYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=a7snv.com;
	spf=pass smtp.mailfrom=a7snv.com;
	dkim=pass header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b=UaiKyIKT;
	arc=none smtp.remote-ip=109.224.244.120
Received: from mail-244120.protonmail.ch (mail-244120.protonmail.ch [109.224.244.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC55606A325
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 23:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC55606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=a7snv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a7snv.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b=UaiKyIKT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a7snv.com;
	s=protonmail; t=1795129411; x=1795388611;
	bh=ldOaBTLY4uCQrQ5Yn8ZzHpIxSvzO3a3EA9r85vz2zgI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UaiKyIKTNndO+ypSJ7++frHDGwXYjQZ+6Kt24eyOQOAkfsY4d0aPYoFppjdDGSd/1
	 TctQ/1g9PdyaFmFPKMYi81nEl5+dDN8hmadaYcyKfEEY4CG3sOSZxBNQehPobIZ2Yb
	 i/DuYkSmZRaddhB9t1f89ypVo6m75fcdNpGcLpwHAIdSQqFiV/8+xnhlybZ+sJLFhj
	 UqDuuH3DjfOh68hPS6NboCdhbiuQYWivBzaQignoHFfUemRaZdSd3HaZGzgEmjnmEg
	 pd7UPBNeHp7eXLhaJBap73hdugWP1itO12urM6+r8QBZPxadzKBw+tJ0ZZPCUnQbOv
	 ebvzt4lgnUkpw==
Date: Thu, 19 Nov 2026 23:03:25 +0000
To: Bernd Schubert <bernd@bsbernd.com>
From: Yun Wang <arsenova@a7snv.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] fuse: don't wait for a sync-init mount in fuse_uring_cmd()
Message-ID: <179512937453.1413003.12323605080434867679@a7snv.com>
In-Reply-To: <7b2d361d-86f1-4064-a905-954a2dfe4ccf@bsbernd.com>
References: <20261117075632.59959.p12-0-arsenova@a7snv.com> <20261116235814.60702-1-arsenova@a7snv.com> <7bb720d9-30ef-4d3f-8ab8-81c5fe2e0fe1@bsbernd.com> <179509410286.1113694.13152766226405003077@a7snv.com> <7b2d361d-86f1-4064-a905-954a2dfe4ccf@bsbernd.com>
Feedback-ID: 235448903:user:proton
X-Pm-Message-ID: 99e23ef6d96195ca25c9535bb02f1885b9b19096
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

On 11/19/26 15:36, Bernd Schubert wrote:
> I think only with an old version of libfuse that was sending REGISTER
> before FUSE_INIT was processed. That was the reason I had added the
> -EAGAIN handler into libfuse.

Thanks, that matches today's code.  Released libfuse (3.18.x) doesn't
use sync init at all, and master sends REGISTER after the mount with
sync init since b584cdfd.  Just before that commit, master with sync
init still got -EAGAIN loops, but from a different window than the one
patch 2 changes: after the FUSE_INIT reply was written and before the
mount thread had set initialized.  I traced that libfuse with bpftrace
on 7.4-rc2 with and without the patches: every -EAGAIN found the device
installed and the connection not yet initialized; none found the device
not installed yet.  That window is the same with or without this
patch.

> Well, if libfuse isn't affect, why is this patch needed? If you have
> another fuse server, fix your fuse server? (And it confirms my personal
> opinion that we should aim for one userspace library.)

Because of what the kernel does while a REGISTER waits for the mount.
io_uring_enter(2) issues the command inline with IO_URING_F_NONBLOCK
while holding ctx->uring_lock, and fuse_uring_cmd() then sleeps in
fuse_get_dev() until the device is installed.  Any other thread that
submits to the same ring blocks on uring_lock in D state meanwhile,
whether or not the fd is O_NONBLOCK.  On 7.4-rc2: thread A sends a
REGISTER before the mount, thread B submits a NOP to the same ring
100 ms later; B stays in D state in io_uring_enter() until the mount
400 ms later, and when there is no mount, until thread A gets a signal.
With patch 2 both return at once.

So a server that sends REGISTER that early is buggy, but I don't think
the kernel should sleep in the non-blocking issue path with uring_lock
held because of it.  For such a server, patch 2 turns that sleep into
the -EAGAIN that fuse_uring_cmd() already returns until FUSE_INIT has
completed.  Would you be fine with keeping patch 2 as it is, with the
changelog fixed as discussed?

Thanks,
Yun

