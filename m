Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088158;
	b=cFb+oZ2Jpxf82DxpHbpW278lblgdWQZummGD/D7UmEUtIVRTe4quJJFS6oHFKPBBSVec
	 6+7j5LmuC03gtARbuv8U5IIi+znV6H2YaezZOhkGzWmqhQ8Z+U2yMbgx2rW4STbXY5/nY
	 1Wq7TgSTij7Qcryw33xytiXmH9pVe802Bh28oYVvbq/8dagfZP4unvbPQBXZPpzcu2UFB
	 v90ExhEQMNlOmktxyQHaFuHskN8J68C45yBBMHtw8zl6/qa7TIujVxt+PI017dxTBb6WU
	 Mugt5ShjBKToPYY/Sx+bx6/vpYdZ1/RNyN5we0JiQiCku4+Xzddt+MPYFfCZBpyf9sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088158;
	h=DMARC-Filter:DKIM-Signature:Date:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MvxY/Y9Zvo6fORE1fBiO1lDxDydacUgKXmHewgYKNac=;
	b=n7VBm/wjjXixPRmZ7twPUTaTBPQAZmZtx6vmqycvxjHV9iHKiUGqI5pqMnnAII4CQ1Pb
	 LuzZDSP9JaTdcxiZO0e9JwyrLIVKysRzXRP1XGa1ptLinKqAA6vV/1eEuUGAOwLX+Gl/1
	 MDUbpbNM/4LavydxjjF9vtcazLKGKVqm1YZn6iNLzneWf0tSsqJGs7CMYrT88mr//djfm
	 L0IHh+NkymJ9XQldvCp9GQjOmciWkV8FC5Ycp2+hBlwr21G3NL2tKFBzsuAfjvm6R748d
	 n5xl1lQBBN4v/9D8Es7upsw7U+g7Ws1Q+vd83Wc5sat218PccGmztmU2yaLCRcsmIWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=a7snv.com;
	spf=pass smtp.mailfrom=a7snv.com;
	dkim=pass header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b=Zjr1zLzZ;
	arc=none smtp.remote-ip=185.70.43.20
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6B960A2603
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 11:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD6B960A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=a7snv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a7snv.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b=Zjr1zLzZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a7snv.com;
	s=protonmail; t=1795088153; x=1795347353;
	bh=MvxY/Y9Zvo6fORE1fBiO1lDxDydacUgKXmHewgYKNac=;
	h=Date:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Zjr1zLzZrcajPiYOXjyQtihS2aFpYjeMFDNh3dqDbGHx7Da1+HgcouQqkiBha7fhI
	 JbkPJcy6R1mGmwtdj1h6C3CAs7Vh3zsfHtfoV9LFD9HJI9yCPNhwu8SAIhrwcd8/Z+
	 uuE732bUw26xhVSfKgeihhCzZ8G9bNtlESVdGlk91m/qR/SEmhaZ+wntPUqgSjvVjM
	 GPyzcOWP+cBvR8IctkcG8XAFrjXRZ1y9PP5ax3lZveJ1MxToB7TPwbS/e+wUYU1qtA
	 xmyOAsYccb+njbY1DG5r0RWwGb1rxpW/ALscKDKyb2YdNQKGPFcK6kgy1TRVX3+Mn2
	 L99L1/EFFxD6A==
Date: Thu, 19 Nov 2026 11:35:50 +0000
From: Yun Wang <arsenova@a7snv.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] fuse: don't wait for a sync-init mount in non-blocking reads and uring_cmd
Message-ID: <20261117075632.59959.p12-0-arsenova@a7snv.com>
Feedback-ID: 235448903:user:proton
X-Pm-Message-ID: 7ca99a876ca8338cbb4a5bc2b1437c54610f9a79
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

Since commit dfb84c330794 ("fuse: allow synchronous FUSE_INIT"), a
/dev/fuse fd with FUSE_DEV_IOC_SYNC_INIT waits in fuse_get_dev() until
the mount installs the channel.  That suits a blocking read, but
fuse_get_dev() is also called from O_NONBLOCK reads and from
fuse_uring_cmd(), so these sleep before the mount as well, until the
mount or a signal:

 - read(2) and splice(2) with O_NONBLOCK.
 - IORING_OP_URING_CMD, from the task that called io_uring_enter(2),
   also with fuse-over-io-uring disabled.  Other submissions on the
   same ring wait as well.

It happens on every kernel I tried since v6.18: v6.18 to v7.3 in QEMU,
7.2 and 7.4-rc2 on bare metal.  v6.17 has no FUSE_DEV_IOC_SYNC_INIT.

The same wait has caused trouble before.  a8dd5f1b73bc ("fuse: create
fuse_dev on /dev/fuse open instead of mount") made fds without sync
init wait there as well, and LTP's read_all, which reads every file
under /dev with O_NONBLOCK, then hung on /dev/fuse [1].  9f6f44aa5a58
("fuse: don't block in fuse_get_dev() for non-sync_init case") fixed
that by returning -EPERM again for those fds.  A sync-init fd still
waits, as dfb84c330794 intends for a blocking read; these two patches
take the wait out of the non-blocking read paths and fuse_uring_cmd()
and keep it for the others.

Patch 1 makes O_NONBLOCK reads before the mount return -EAGAIN, the
same as after the mount while no request is queued.  Patch 2 makes
fuse_uring_cmd() return at once the -EAGAIN it returns before FUSE_INIT
anyway.  fuse_get_dev() itself is unchanged.

->poll has the same problem: poll(2), epoll_ctl(2) and io_uring reads
of a sync-init fd sleep before the mount too, which is what libfuse's
sync-init worker ran into [2].  That fix is bigger, since a poller that
registers before the mount has no fiq->waitq to wait on, so I will
send it separately, together with a selftest for all of these paths.

Tested in QEMU (virtme-ng) on 7.4-rc2 (067c5c24cef2): with both patches,
O_NONBLOCK read(2) and splice(2) and IORING_OP_URING_CMD on a sync-init
fd that is never mounted return -EAGAIN at once, a blocking read still
waits until a signal, and an fd without sync init still gets -EPERM.
The poll, epoll and mount tests still wait, as expected without the
->poll fix.

The patches are against 7.4-rc2 (067c5c24cef2) and also apply to
fuse.git for-next (ab9787d7e66a).  The Fixes tags point at
dfb84c330794 because the wait goes back to v6.18, but the patches only
apply from v7.2 on; older trees would need their own version.

[1] https://lore.kernel.org/all/3c9f8396-41f4-4c88-b883-34bede72b427@sirena=
.org.uk/
[2] https://github.com/libfuse/libfuse/pull/1633

Yun Wang (2):
  fuse: don't wait for a sync-init mount in non-blocking reads
  fuse: don't wait for a sync-init mount in fuse_uring_cmd()

 fs/fuse/dev.c        | 12 ++++++++++--
 fs/fuse/dev_uring.c  | 10 ++++++++--
 fs/fuse/fuse_dev_i.h | 14 ++++++++++++++
 3 files changed, 32 insertions(+), 4 deletions(-)


base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
--=20
2.56.1




