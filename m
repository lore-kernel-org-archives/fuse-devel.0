Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088194;
	b=iGLLm0qEra6rZXPONPdA9Zvf3GOc1+bXdBuXnWQf0y9Dg2WLalRffqVdh0OubNEfMwOD
	 HUnyZAjwWZx3B78aeLxAbZhzNgCpUanWHZFQJhStLxP24jHzBQ332fDxwJroXP+G0kApg
	 ws7cScJCJ5QTVbAOdxRmzOPKa+andn51Df5qwLw+1H/Q/hS4RVhZsafUbaGcGj7vwz6B4
	 Crk/fnX9b3BqYF1VOuHuY95I/k8aVUvSm9sBPUf/va1Qyu8lo4X8EO8UN2qvTxApBGq7T
	 IbcLApkmNlx+YRmpDZHQgSwKu5OlQ9LMrCvg6FRLckHAmHTHL3pn46X0lE/SpT0DM4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088194;
	h=DMARC-Filter:DKIM-Signature:Date:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=0Dq005FRjKellwrLJHz+bfrVdX7+K5seqG3njdrVBIQ=;
	b=crhlmc/YTosLY6NjMazqSH1UPoEqHIAiyfI1CfLDSQRuBwVbeA2iWOG6Eer5jvMZ7UuR
	 hiF1UXsbLs/iVfb2h0QnE+UauE+oyoxXW0yz3dqQpjs8ZsvlfezpnI+r40IqB+cIaTdSy
	 vlexHF2YtHP4UAcT04JFePk/g3JQMzelcIvCCA2wsDpS2TDhaR6cLrH+MeStBrKAFXDm3
	 Vp2HO38f7FBAPunJpePe7KMUQa8mUtHrp3TB4/5w7ke48KO8XfnSlpnBiXkoDRQohO5AE
	 2WGSSv6IhFt+sqDtmwWGVqiWO/ePNg5l+oxofTELeo+3YM3qKxk5sJWU2O1a8Sk43JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=a7snv.com;
	spf=pass smtp.mailfrom=a7snv.com;
	dkim=pass header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b=aoR+TOsu;
	arc=none smtp.remote-ip=185.70.43.23
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A37606A32C
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 11:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79A37606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=a7snv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a7snv.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b=aoR+TOsu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a7snv.com;
	s=protonmail; t=1795088191; x=1795347391;
	bh=0Dq005FRjKellwrLJHz+bfrVdX7+K5seqG3njdrVBIQ=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aoR+TOsuWJecKLIJF114x1iJjQ5AMXOH4+NdSzgdhBbbV/wCXAz59/Cmz/odD2MlQ
	 urXaXn5sU3oCvi3HlngZMsq/EwbHzdzv1UuPhs0Wo/lpxzaPbwB4/9Qp7RVzuKDK+Q
	 QKDPMfbBEm0bXIxqDnO4RsqQT2C4NsCoYSrRfk+wxcjOGpt/lERErLes55+MuKivIS
	 Vgaf6vmH67llkrAOhsGd6YLmMxReno722SQx+T0MFMPJRLb5RQBn5aXYqucLO6Q4XN
	 X61NC3Zb+T6r7uK1imK/lMNh4iekMynLVmYh+QfxLV/o0a4J0BQ4fc/Ora4R8iL7+C
	 QJo0IZVMbjm0A==
Date: Thu, 19 Nov 2026 11:36:23 +0000
From: Yun Wang <arsenova@a7snv.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] fuse: don't wait for a sync-init mount in fuse_uring_cmd()
Message-ID: <20261116235814.60702-1-arsenova@a7snv.com>
In-Reply-To: <20261117075632.59959.p12-0-arsenova@a7snv.com>
References: <20261117075632.59959.p12-0-arsenova@a7snv.com>
Feedback-ID: 235448903:user:proton
X-Pm-Message-ID: d5f16ebed2f812a134f79ad35ab358f0632a56e0
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

fuse_uring_cmd() gets the device with fuse_get_dev(), which waits for
the mount of a device in sync-init mode.  io_uring normally issues the
command from the task that called io_uring_enter(2), so an
IORING_OP_URING_CMD on such a device before the mount puts that task
to sleep until the mount or a signal.  This happens before the
enable_uring check, so also when fuse-over-io-uring is disabled.

Until FUSE_INIT has completed, fuse_uring_cmd() returns -EAGAIN anyway
and the server has to send the command again later.  Return -EAGAIN
at once when the device is not mounted yet either, using
fuse_get_dev_nowait() from the previous patch, and don't log "No fuse
device found" for it.

Fixes: dfb84c330794 ("fuse: allow synchronous FUSE_INIT")
Signed-off-by: Yun Wang <arsenova@a7snv.com>
---
 fs/fuse/dev_uring.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 460776cd69..0f725172ae 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1664,9 +1664,15 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigne=
d int issue_flags)
 =09if (!(issue_flags & IO_URING_F_SQE128))
 =09=09return -EINVAL;
=20
-=09fud =3D fuse_get_dev(cmd->file);
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




