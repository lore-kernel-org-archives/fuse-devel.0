Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17C53B0AEF
	for <fuse-devel@lists.linux.dev>; Fri,  9 Oct 2026 08:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533980; cv=none; b=rWshqoTAKPSBfqEA/wC0mMZ8SnCy7ORRkMq0XQYcUdu9+aOsN0YucRE2upy6JlwRTWOwh/mpH8SedWpmeVWkAiBECnDenSzFu1R5/gpYb94W64YEPeLHgrKrDEvlJNG4UsMpvlYhjbd2E9TnuCxFc48XMwAW5bcVz89FZuSwxTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533980; c=relaxed/simple;
	bh=3jQryGkkQH4xpNfXs+/o/RBITDwNn6yJ5HbzEpzYR/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAR1XoSAZQri7hOXjYg8V1rroxvbaYGcmlqUKWIe1W0+2zdk5FuGVCV200bNkBmFX/ClbFM6C7o/nHbsOMa9bsletTVmWoY8L8V8O1kTW3RooHqQiny5E5Z1Za6cio5Zoia4PFLn44+wZSIVz8x0TnTC1FkLGfLC0wyB0WyNasE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=q0J8AiZE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RcGQFlIT; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="q0J8AiZE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RcGQFlIT"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 018E314000A7
	for <fuse-devel@lists.linux.dev>; Fri,  9 Oct 2026 04:19:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 09 Oct 2026 04:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791533976;
	 x=1791620376; bh=IrR+c4q42HTMxpRqOB+Q1c77fNGhnyMGy1PkvPKp3Sc=; b=
	q0J8AiZEkvhiPCtzVkxNgHUhDGpezppAGhNwpz7v5ZmaiaLgb1xMCCuXEBVyS+ac
	L0SXsBlE3AD07kiSJyezYuXTLHzJfTvRYxt8QRaYWAADUjgxyyoobL9CfXTmhheu
	xNiHmB5IaPpP6b2Df/1sLf5pXvNjBytVbq9kLG2W9DloKHQa7hwzAlY1Kt9oqjJo
	AeBHvCFV+0iF6vn6Xwnl/h/MMZVtf+iXCceSiwJUOvWLKw0nm9lpZ59ShpvgBYMB
	TYgkXnJdf8NRH4xZK+PMf5xZDSp7FupAkWpiq8LanK12ThDxMzK+zOpuoYuIBF/0
	rflb0yGI0C5JcggeLFQ5kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791533976; x=
	1791620376; bh=IrR+c4q42HTMxpRqOB+Q1c77fNGhnyMGy1PkvPKp3Sc=; b=R
	cGQFlITKerhchAKJBU3zIYUpGdi2zXIenutvudtouhFFjQsk1nnQuBALrcr/0c+e
	QPgTSKdd3mPB3DhFjz73WNX/O92ZgA3u/3HxJqoCQ6KtSQs8FZfOdJy28MCGmvc7
	a6h4wBrPQmPFfPlvLAFR3hG52nMbo/gm241qDljJf3pIPNpyWAqeaAJPh/W2Rh7G
	REeXvMyod7w0Ki3RYMK0GeyM21tsiR7G7dDChR/KJbCBBLgIG0iI4aWxOuEvhMM1
	tPkw7EMfWM24O2Sm/C4apb992/hRyDt738+BrIfTUXCS1FwhYs/X6GTyUUfc+UY6
	ZGKn7eDAUdjWjreWw9SFg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791533976; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm3:rsa-sha256:L5acr4gv/o+zl9LSF2Vt4DTGTRU/lC70gy2Oz6h8txG+uT3
	mp/1G32zxeHHqELYWz1lNTZXmM9gBEg2pLlvliZpOr2kfOfhA+BcEnlt2isvAP7W
	89djwryxiTRKGOmrnWUsIaRl5YWXugeptZK9ajVmV5nQUXkzCgLmiXo2elKUj6oG
	CPHjcB8D7NjVmU4A2uAGOWXxwRpJjoPpNCMi0mraHFnrzHRd5KMuY3mqn6uKwXbj
	49q8hKoAHRPagoIzlI/mVNZfp5kegPBseF0l350JUe0BS+Q5YK+GNLtUcg/Bxp6k
	tL5p+5kLuxuX4g6UwAz0CgnBnLHQwF+fsE8XP2Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:w5GwMQPya+XgRTTTbuGi9azPPUF73wUjqXsoQ+dSuAw=:3jQryGkkQH4xpNfXs+/o/RBITDwNn6yJ5HbzEpzYR/U=;
X-ME-Sender: <xms:mKPIaoECs6aHYaPE82mNdpg2xCx_rHcf-QZ5N-u3rfP49et3KbsShg>
    <xme:mKPIavIEhNQH_CQP1NNG8Zg0LywNaRwpOjVODtI88JCbAy4MdVy4azyq2MSPcKWzK
    YQUBxsPTGpXKOA91-61hFES7JQgJ9Ye-cPwM6GdbuKxdFo-duZGeQ>
X-ME-Received: <xmr:mKPIasm8ADFax_J5u-7OO1KDUgyBvrxXiM6wsdncx7iRE1VVoat7_WYy7TcAgL8iHyiFcl3My57fMgtrQLwNrHhw6y3UMfviPZqzHpAYxVkgGjpL0w>
X-ME-Proxy-Cause: dmFkZTE19zXEcFqQdrxi/qdh6XwsWGoxBE3LDKNmS29d2D4uFPzfsU6CFXbLfcNr+51+23
    EzRZaq6oSHtE5sv9MBASkhYn95rxBeGdtzFGebl7OZAaYBd3NWILXElRRnHjzgNYuH0xp3
    9Uor4eyDL2rdVJMCGxaSxg2+qCTnqFbmsjRp9wJyPCa6omzVNIpYTGUbL+0whvKYGIbwXf
    4GS6ADB3tFb6/ttnF4UnmLUelQmNWNZ1B8KT7VGQGYTs2dD04Bp3nWzRTUeSsnCM9E1kbE
    EoqLyW0EsZ4hDC82eiVrPq/vgCizLYyDMoAmhTd6GnQ7yMGZMak1TIorO4ZigXXFbKcsdo
    Uves4TzFYsBRjKQIyrWOfBE67aoWlQu5BXOOqGEQql4rGBB8UdrdCaIeJemkhGKqm3T8nH
    f/eGvQykCEk7+YGikWWIJeqnGOn0F9fDVu4aR1TQk9n9w9PYSTPu2cJKsDUDNQZrc73Dsl
    XKzBD37r0trBjGupBfbrxTFq6b57cZvRCrH+7JYu8txZXL96w1vz7JvfAB8Bfv0OhPe94j
    m0aQiddbFhL0Z1vLONkHUss/NiejiOcjjRdU/Xg6Xhr6Cxi/KWtALK4iTaZg22ugGCSJ51
    uVQ47HXNNrk4SW2O/2cuRyUWGJBGj7/LY2uwr2SznM1e/GErkiwdjVcU+KpQ
X-ME-Proxy: <xmx:mKPIanRFzyx5JpazuLRU_7F2UOBFZ3-oVjyvqFmWCTfOC2tDnlwouA>
    <xmx:mKPIauLdgXMKqUOjmXAdz2yCRAcPC--9a3R1xfcIWXN6H-Tqm67QGA>
    <xmx:mKPIatBrKX8zrJ0cnaW-2gi_FZcY5Vh0zLdnp6AbVWjKlOMB6meYUg>
    <xmx:mKPIanBaUsJSGxG5UkvsWRJNaJEG6RShYhv6tK4qtwYXOnhdpKr4Gw>
    <xmx:mKPIakWjvyUcuAcrDsd_b4j2nAGTX1NGBYg205eOwvAY4rY78xMlqIT7>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 04:19:35 -0400 (EDT)
Message-ID: <d11dc230-0e80-4520-bb25-d25809762726@bsbernd.com>
Date: Fri, 9 Oct 2026 10:19:33 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] test: exercise FUSE_NOTIFY_RESEND
To: Baokun Li <libaokun@linux.alibaba.com>, fuse-devel@lists.linux.dev
Cc: miklos@szeredi.hu, Luis Henriques <luis@igalia.com>
References: <20261009075417.2521879-1-libaokun@linux.alibaba.com>
 <20261009075417.2521879-3-libaokun@linux.alibaba.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20261009075417.2521879-3-libaokun@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Baokun,

On 10/9/26 09:54, Baokun Li wrote:
> test_notify_resend drops the first GETATTR of a file and asks the
> kernel to resend pending requests via fuse_lowlevel_notify_resend().
> The kernel redelivers the request with the FUSE_UNIQUE_RESEND bit set;
> the daemon detects it with fuse_req_is_resend(), answers it, and the
> client's stat() completes.

to be honest, this is one the features that I have no clue about what it
exists for. Why would a daemon drop requests? The use-case I have in my
mind is a daemon upgrade, but that would mean that either kernel needs
to send a re-lookup of all inodes or that daemon needs to store lookup
objects (I personally see these as counter part of kernel inodes). Now,
besides not being implemented at all, kernel will have a hard time to
send re-lookup requests, unless fuse-server supports lookup by 64 bit
node-id.
I.e. in my personal opinion the prerequisite of FUSE_NOTIFY_RESEND is
missing (which could be LOOKUP_HANDLE and then using that to re-lookup
inodes after a daemon termination).

The example below also just does a simple exercise of
FUSE_NOTIFY_RESEND, without revealing what it would be useful for - that
is the part I would like to see fulfilled by an example.


Thanks,
Bernd

> 
> The case skips on kernels without FUSE_HAS_RESEND support and over the
> io-uring transport, which recovers requests on its own.
> 
> Signed-off-by: Baokun Li <libaokun@linux.alibaba.com>
> ---
>  test/cases/ctests/notify-resend.sh |  18 +++
>  test/meson.build                   |   3 +
>  test/test_notify_resend.c          | 216 +++++++++++++++++++++++++++++
>  3 files changed, 237 insertions(+)
>  create mode 100755 test/cases/ctests/notify-resend.sh
>  create mode 100644 test/test_notify_resend.c
> 
> diff --git a/test/cases/ctests/notify-resend.sh b/test/cases/ctests/notify-resend.sh
> new file mode 100755
> index 000000000000..c64d930dadb5
> --- /dev/null
> +++ b/test/cases/ctests/notify-resend.sh
> @@ -0,0 +1,18 @@
> +#!/usr/bin/env bash
> +# GROUP: ctests
> +# A request the daemon never answers comes back with the resend bit set in
> +# the request ID after FUSE_NOTIFY_RESEND.
> +
> +. "$TEST_LIB/common.sh"
> +
> +# FUSE_NOTIFY_RESEND requeues the pending requests of the char-device
> +# channel; the io-uring transport has its own recovery path.
> +[ "${FUSE_URING_ENABLE:-0}" = 0 ] || _notrun "needs the standard transport"
> +
> +_require_cap FUSE_CAP_HAS_RESEND
> +
> +status=0
> +"$FUSE_TEST_BIN_DIR/test_notify_resend" "$TEST_MNT" || status=$?
> +
> +[ "$status" -ne 77 ] || _notrun "the kernel did not report FUSE_HAS_RESEND"
> +[ "$status" -eq 0 ] || _fail "test_notify_resend exited $status"
> diff --git a/test/meson.build b/test/meson.build
> index a8518c314804..022a3aea93f0 100644
> --- a/test/meson.build
> +++ b/test/meson.build
> @@ -35,6 +35,9 @@ td += executable('test_abi', 'test_abi.c',
>  td += executable('test_secctx_splice', 'test_secctx_splice.c',
>                   dependencies: [ libfuse_dep, thread_dep ],
>                   install: false)
> +td += executable('test_notify_resend', 'test_notify_resend.c',
> +                 dependencies: [ libfuse_dep ],
> +                 install: false)
>  td += executable('test_loop_config', 'test_loop_config.c',
>                   include_directories: include_dirs,
>                   link_with: [ libfuse ],
> diff --git a/test/test_notify_resend.c b/test/test_notify_resend.c
> new file mode 100644
> index 000000000000..a1671514bcb9
> --- /dev/null
> +++ b/test/test_notify_resend.c
> @@ -0,0 +1,216 @@
> +/*
> + * FUSE: Filesystem in Userspace
> + * Copyright (C) 2026  Baokun Li <libaokun@linux.alibaba.com>
> + *
> + * Test FUSE_NOTIFY_RESEND: recovery of an in-flight request that the
> + * daemon received but never answered.
> + *
> + * The daemon (parent process) drops the first FUSE_GETATTR of the test
> + * file and immediately asks the kernel to resend pending requests via
> + * fuse_lowlevel_notify_resend(). The kernel re-queues the dropped
> + * request with the FUSE_UNIQUE_RESEND bit set in the request ID; the
> + * daemon detects it with fuse_req_is_resend(), answers it and exits the
> + * session loop. The client (child process) issues the stat() that
> + * drives the whole sequence and must see it complete successfully.
> + *
> + * Kernels without FUSE_HAS_RESEND support and the io-uring transport
> + * (whose pending requests are recovered by its own path, not by
> + * FUSE_NOTIFY_RESEND) are reported as a skip.
> + *
> + * This program can be distributed under the terms of the GNU LGPLv2.
> + * See the file GPL2.txt
> + */
> +#define FUSE_USE_VERSION FUSE_MAKE_VERSION(3, 19)
> +
> +#include "fuse_config.h"
> +#include "fuse_lowlevel.h"
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include <limits.h>
> +#include <signal.h>
> +#include <sys/stat.h>
> +#include <sys/wait.h>
> +
> +/* automake convention: the runner reports this as SKIP. */
> +#define TEST_SKIP_EXIT 77
> +#define TEST_INO 2
> +#define TEST_NAME "testfile"
> +
> +static struct fuse_session *g_se;
> +static int g_cap_has_resend;
> +static int g_dropped;		/* first GETATTR was left unanswered */
> +static int g_notify_rc = -1;	/* fuse_lowlevel_notify_resend() result */
> +static int g_resend_seen;	/* second delivery carried the resend bit */
> +static int g_uring;		/* requests reached the daemon over io-uring */
> +
> +/*
> + * The loop may be waiting for a request that never comes (the resend was
> + * never queued). Exit it on the alarm so the cause gets reported instead
> + * of the default disposition ending the process.
> + */
> +static void t_alarm(int signo)
> +{
> +	(void)signo;
> +	fuse_session_exit(g_se);
> +}
> +
> +static void t_init(void *userdata, struct fuse_conn_info *conn)
> +{
> +	(void)userdata;
> +	g_cap_has_resend = fuse_get_feature_flag(conn, FUSE_CAP_HAS_RESEND);
> +	if (!g_cap_has_resend) {
> +		fprintf(stderr, "test_notify_resend: kernel lacks "
> +			"FUSE_HAS_RESEND, skipping\n");
> +		fuse_session_exit(g_se);
> +	}
> +}
> +
> +static void t_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
> +{
> +	struct fuse_entry_param e;
> +
> +	if (parent != FUSE_ROOT_ID || strcmp(name, TEST_NAME) != 0) {
> +		fuse_reply_err(req, ENOENT);
> +		return;
> +	}
> +
> +	memset(&e, 0, sizeof(e));
> +	e.ino = TEST_INO;
> +	/* Force the kernel to issue a separate GETATTR */
> +	e.attr_timeout = 0;
> +	e.entry_timeout = 3600;
> +	e.attr.st_ino = TEST_INO;
> +	e.attr.st_mode = S_IFREG | 0644;
> +	e.attr.st_nlink = 1;
> +	fuse_reply_entry(req, &e);
> +}
> +
> +static void t_getattr(fuse_req_t req, fuse_ino_t ino,
> +		      struct fuse_file_info *fi)
> +{
> +	struct stat stbuf;
> +	int is_resend = fuse_req_is_resend(req);
> +
> +	(void)fi;
> +
> +	/* FUSE_NOTIFY_RESEND only requeues the requests of the /dev/fuse
> +	 * channel; over io-uring there is nothing to resend. Serve the
> +	 * request and let the caller report the skip. */
> +	if (fuse_req_is_uring(req))
> +		g_uring = 1;
> +
> +	if (ino == TEST_INO && !is_resend && !g_dropped && !g_uring) {
> +		g_dropped = 1;
> +		/* Simulate a lost request: answer never, ask for resend */
> +		g_notify_rc = fuse_lowlevel_notify_resend(g_se);
> +		return;
> +	}
> +
> +	if (ino == TEST_INO && is_resend)
> +		g_resend_seen = 1;
> +
> +	memset(&stbuf, 0, sizeof(stbuf));
> +	stbuf.st_ino = ino;
> +	stbuf.st_mode = (ino == FUSE_ROOT_ID) ?
> +		(S_IFDIR | 0755) : (S_IFREG | 0644);
> +	stbuf.st_nlink = 1;
> +	fuse_reply_attr(req, &stbuf, 3600);
> +
> +	if (ino == TEST_INO)
> +		fuse_session_exit(g_se);
> +}
> +
> +static const struct fuse_lowlevel_ops t_ops = {
> +	.init	 = t_init,
> +	.lookup	 = t_lookup,
> +	.getattr = t_getattr,
> +};
> +
> +int main(int argc, char *argv[])
> +{
> +	struct fuse_args args = FUSE_ARGS_INIT(1, argv);
> +	struct fuse_session *se;
> +	pid_t pid;
> +	int status = 0, ret = EXIT_FAILURE;
> +
> +	if (argc != 2) {
> +		fprintf(stderr, "usage: %s <mountpoint>\n", argv[0]);
> +		return 1;
> +	}
> +
> +	printf("Testing FUSE_NOTIFY_RESEND\n");
> +	fflush(stdout); /* avoid the child inheriting an unflushed buffer */
> +
> +	se = fuse_session_new(&args, &t_ops, sizeof(t_ops), NULL);
> +	if (!se)
> +		return EXIT_FAILURE;
> +	g_se = se;
> +
> +	if (fuse_session_mount(se, argv[1]) != 0)
> +		return EXIT_FAILURE;
> +
> +	pid = fork();
> +	if (pid == -1)
> +		goto out_unmount;
> +
> +	if (pid == 0) {
> +		struct stat st;
> +		char path[PATH_MAX];
> +
> +		/* Child: the client driving the test */
> +		alarm(20);
> +		snprintf(path, sizeof(path), "%s/" TEST_NAME, argv[1]);
> +		_exit(stat(path, &st) == 0 ? 0 : 4);
> +	}
> +
> +	/* Parent: the daemon; guard against unexpected hangs */
> +	signal(SIGALRM, t_alarm);
> +	alarm(30);
> +	fuse_session_loop(se);
> +
> +	if (g_cap_has_resend && !g_uring && g_dropped &&
> +	    g_notify_rc == 0 && g_resend_seen) {
> +		/* The resend was answered; the client must complete now */
> +		if (waitpid(pid, &status, 0) != -1 && WIFEXITED(status) &&
> +		    WEXITSTATUS(status) == 0) {
> +			printf("test_notify_resend: PASS\n");
> +			ret = EXIT_SUCCESS;
> +		} else {
> +			fprintf(stderr, "test_notify_resend: client stat "
> +				"failed (status=%d)\n", status);
> +		}
> +		goto out_unmount;
> +	}
> +
> +	/*
> +	 * Skip or failure: the client is blocked in the kernel on a request
> +	 * nobody will answer, and a signal that is not fatal does not wake
> +	 * it (the kernel waits for the daemon to abort the request), so
> +	 * reap it with SIGKILL instead of waiting it out.
> +	 */
> +	kill(pid, SIGKILL);
> +	waitpid(pid, &status, 0);
> +
> +	if (!g_cap_has_resend) {
> +		/* Kernel without support: report skip (the runner gates on it) */
> +		ret = TEST_SKIP_EXIT;
> +	} else if (g_uring) {
> +		fprintf(stderr, "test_notify_resend: requests came in over "
> +			"io-uring, which has its own recovery path; skipping\n");
> +		ret = TEST_SKIP_EXIT;
> +	} else if (!g_dropped || g_notify_rc != 0) {
> +		fprintf(stderr, "test_notify_resend: notify failed "
> +			"(dropped=%d rc=%d)\n", g_dropped, g_notify_rc);
> +	} else {
> +		fprintf(stderr, "test_notify_resend: request was not "
> +			"redelivered with the resend bit\n");
> +	}
> +
> +out_unmount:
> +	fuse_session_unmount(se);
> +	fuse_session_destroy(se);
> +	return ret;
> +}

