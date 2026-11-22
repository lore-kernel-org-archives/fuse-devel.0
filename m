Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361213;
	b=hGFacn/mVsozSktxK400w4ifYk8WiFN6Lq5PHzkj7JbjPa3wjNArVDnFZdkLLrDv/lG8
	 +DTntj0tg4eI1TaFx3orJgl8vHg/tlCDmV9Z5E4sZ44HkahQ3m1sxvZAKJ/3Jx7AdJCzu
	 uGGorzcJnXUFsPGi2JjYMcUoJAixg/4ekY+ndR0kjvZAReRjtbgXM5cn93z9sxEWEDjWH
	 IocLSlVhg1IO6eIxon5Uomr7P08ARqB1++jqwLlZhgeT6ojtLCla97Bi04KxzYVdRdxyg
	 3W/kPZPyVUrseFg3w8zn2D2UyIeBuN28lmhpBFBB3o1X6R2FFx1yLSWNruDXXaYBgEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361213;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=wy6XS5seyhU6K2UszLq+oDiIaG1TExlMlf05DK9sBJ4=;
	b=BtGRAcsBFi6SNDfBPik6asjEgTvMiMp+JNjFcahdhPEBNAYLoLeb/sxndcwn++obGMgt
	 gR9WtSHDXEAGXn74gcc2wKruuwqxGwML9GupGo3cs+Z3iEsE2fWJsZije1OyWG0j5nH+7
	 VyYVSRJXlGyv59pg0khoekNuZ5c9mUrVTugtifby2seR1bW627BFpXRGEas2P+/K2mAP7
	 NzjadkAVf9F5FM7mOQ0HvdgWhvLE37Ty+KyMsA1tbmE1TfBzEkjiPuqL//cWNkY6jxQ7n
	 2Ivu3SNc7hTakiW4tU8xq1knc1Wwxn0GisLRHx88DnqrFjymLVLKN8E77ddtCKX2Zug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=wid8b3OF;
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9909606A32A
	for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 15:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9909606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=wid8b3OF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795361210; x=1795620410;
	bh=wy6XS5seyhU6K2UszLq+oDiIaG1TExlMlf05DK9sBJ4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=wid8b3OFQ5jb1m7UQzO6w0UiqY8Mr/tj0TrVujKq06SWLPJeD1KRZC6tawFE7q5UB
	 LRIUw0snQ297eW3Ys8QiFEJMZq4qXfrTi6EdV8GzoLbSL2YpUz8qOo1mlvA8276qvu
	 CbnyXTwPpuA+JjuaNDtff/IbAwgCp3/e1Fg5jS8NvxxOQhTTPNoNrs/hA4xq9W3Jdi
	 STRQkwQOmmhq4Ts1jQ26Z8GuFnvzAKBCt+4zMLeD+vt8lr3xghme1F5PD7UTCQK6XK
	 2Gx6MxjMi0E844IpebPiIbYsIih3Yw7lJRVGMQaQbHXDsZ6GuWOogpQhRs5opEkViE
	 GQUCybGgrWDUg==
Date: Sun, 22 Nov 2026 15:26:45 +0000
To: Miklos Szeredi <miklos@szeredi.hu>
From: Yun Wang <7z0423arsenova@proton.me>
Cc: Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>, Shuah Khan <shuah@kernel.org>, fuse-devel@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] fuse: don't wait for a sync-init mount in fuse_uring_cmd()
Message-ID: <20261122152514.467423-4-7z0423arsenova@proton.me>
In-Reply-To: <20261122152514.467423-1-7z0423arsenova@proton.me>
References: <20261122152514.467423-1-7z0423arsenova@proton.me>
Feedback-ID: 227066774:user:proton
X-Pm-Message-ID: 2ec993559162f69e6c53bdd792e08644d489bf26
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

From: Yun Wang <arsenova@a7snv.com>

fuse_uring_cmd() gets the device with _fuse_get_dev(), which waits for
the mount of a device in sync-init mode.  io_uring normally issues the
command from the task that called io_uring_enter(2), so an
IORING_OP_URING_CMD on such a device before the mount puts that task
to sleep until the mount or a signal, with the ring's uring_lock held:
any other thread that submits to the same ring waits for it in D state
meanwhile.  This happens before the enable_uring check, so also when
fuse-over-io-uring is disabled.

Once the mount has woken it up, the command can still get past the
initialized check: FUSE_INIT may have been answered by then, or else
io_uring retries it from io-wq after the -EAGAIN, which may be late
enough.  So a REGISTER sent before the mount sometimes went through,
but only by timing.  A server has to handle -EAGAIN here anyway, as it
does for a REGISTER sent before FUSE_INIT has been answered on an
async-init connection, and libfuse only sends REGISTER once the
connection is initialized.

Return -EAGAIN at once when the device is not mounted yet either, using
fuse_get_dev_nowait() from the previous patch, as fuse_uring_cmd()
already does until FUSE_INIT has completed, and don't log "No fuse
device found" for it.

Fixes: dfb84c330794 ("fuse: allow synchronous FUSE_INIT")
Signed-off-by: Yun Wang <arsenova@a7snv.com>
---
 fs/fuse/dev_uring.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 92240ab76e45..0f725172ae6e 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1664,9 +1664,15 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigne=
d int issue_flags)
 =09if (!(issue_flags & IO_URING_F_SQE128))
 =09=09return -EINVAL;
=20
-=09fud =3D _fuse_get_dev(cmd->file);
+=09/*
+=09 * Don't wait for the mount of a sync-init device: this may run in
+=09 * the task that called io_uring_enter(), and the ring can't be
+=09 * registered before FUSE_INIT anyway, see the -EAGAIN below.
+=09 */
+=09fud =3D fuse_get_dev_nowait(cmd->file);
 =09if (IS_ERR(fud)) {
-=09=09pr_info_ratelimited("No fuse device found\n");
+=09=09if (PTR_ERR(fud) !=3D -EAGAIN)
+=09=09=09pr_info_ratelimited("No fuse device found\n");
 =09=09return PTR_ERR(fud);
 =09}
 =09fch =3D fud->chan;
--=20
2.56.1


