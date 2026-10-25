Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792967364;
	b=UlJiGyuHbK5aDUPftvEeiLHhDAV4dzJF3KIIny7SRNpaS67ht3vSQQKR8nHqd6gMh5Vg
	 BqAebZhFT1TI0ooKb+a/7O2Yqc2QAIGtAKHlSYPVrkpAYVLdq8fS9+ierS4VsUBLL9VVL
	 U9n3yz2TvoFz9mc03oDGh8LLQgHoX0Xu25NcuQ2VlJUmhr3P0g8phNr+cDshuFeuttTpo
	 MJMz/9OWd3nZ/I2ucSgu1hw+NzCNoXjp70a8nbmuCy6rBnJybSHSR7Oa47GcPut1+zph5
	 rWWnD0VdYQChDELfRZaix5nTQeV5dVCbcmgy2YtoxSAd+JArZ4XGK9Ud8q0LmFUwB1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792967364;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=XyT9+R2kW4JUilfjfav3CR39Z/nRNxplPytBdG6V4tU=;
	b=2292qpPUXjkgPqJlc4EWPks9IerF0gMkQIoYvWlyZxc0wsiYOyluMEpiF1ogKgcoPOWa
	 LrW5d8v24HFbc1hkK1kMYgUzV83DBqwXhIrPPzZ0ijK84G6/vWe7KPMxoGXRWVj+vLIQf
	 qg/nhEpdyq+Ynt00HiiuH9cHCFtZzSppC1ncby4U7yiQdc5qOvl0Rvpxlo6R6z+CPH+Ne
	 qyRQLoo2gjr9FrAFkJL6LUuGKLuB9a0A1HyzpPgqGHDLyaYZrbwz52I59SDWMtm4sL3Je
	 kaTpDdQD/0P3JuWg2tYTloD/ymVBGmy2qjwml+jDaTkh1La9vNryKajm/+GEnutbYLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N3CojSg7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26E7606A31A
	for <fuse-devel@lists.linux.dev>; Sun, 25 Oct 2026 22:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N3CojSg7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792967363;
	b=iXeDQoBcVNEoGViWVH6GcJPq01VIlS4koxQc723rGN53aBrdkculvdt8PFpR1bKdAhMI
	 /xznu+f/5mE6e6JCq5cUk4xkUEtzkJbMWr1WFBNk8eWxLLm5l0Foq1Zr3HxNpzOSrqYsj
	 ZNE2RCu2WpxGhvRo+uCZhtnR49l44btETs/9PmaEbQ6DtF6ayOcy8vpSA0rgADET5to2C
	 QUmZvF3At6Dt3BTAwDRDGYvfS0zvY1R7maXAmfhlig/8Lce3BR9X2/ZwBNDs/CmBpHQcg
	 rVgUIwnT3vXGMUX1zz+cfUt26A9eCdqwmPOGaGP+kAFGxyN0eawWlVlmopPQmNWyROw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792967363;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=XyT9+R2kW4JUilfjfav3CR39Z/nRNxplPytBdG6V4tU=;
	b=xpLPfAGEPlqzkOUnfzolCvzKWzhQDVuUNx693svwm6nrQhOfcapN4E9xDlaTHi59faps
	 lU9stV7JjYmQCQ1H8P4dvRmkfdjeFIRuwG2kE8UbxbtDc7tW1RnEJ4zHS4fas9z4ewWVv
	 +ax1ffL5mHlDtk2mrqtQuLzVAypMOK+MLCk7/XwOc0fEdeO2Q6mHRNvqD7Kq6kSdWqbvG
	 jyWnmRv/Lu+Cu47YmCkjC4Yk+ZTmjNZntqnemT70Q+sMH2uwGjZ4oCpwB0HtWRm18N0ub
	 rzFUGgBuEVSlpUehudGOIhxD+1/QoOm7M07XC+K3GSC3g35iTlPcdfsNHPifH8QFm9g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D11CA1F01825;
	Sun, 25 Oct 2026 22:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792967363;
	bh=XyT9+R2kW4JUilfjfav3CR39Z/nRNxplPytBdG6V4tU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=N3CojSg7CXA3WxFFoxmFUY5Df/3ZcyoHHI98YYV90JQ6lTwLAkNYS97J3FO6bRL/Q
	 kfBXysP6UbYvsspGlM5On9mMivjHJgP5WAXgMcu4oQVYifPki4Ffn4L975u1+LGwtU
	 AJj4GwkS/g1GiAxHCuEPK0Ec/HLUWQ4gFChqnGuRHwffive5ig3NMvbrtD9Em9Oc2T
	 D3tSX0rqP52RfuMTSl+QlJucgutcijS3qCulepzlUQPBlBAcKEuu+bJh6fOfl1l3I3
	 sEgH1cb5fSty3LlGzffoBZAEY0/3QwU7S5o0c+tEZL8NROjOSUA+7Vs2uH+jnvun9a
	 mQjCt8tyfFB8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5F2A444AE0;
	Sun, 25 Oct 2026 22:29:22 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Subject: [PATCH v8 0/8] fuse: {io-uring} Allow to reduce the number of
 queues and request distribution
Date: Sun, 25 Oct 2026 23:29:08 +0100
Message-Id: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NTU7DMBCG4atUXmPkn8Rjs+o9EEKOZ9x6gVNsE
 oGq3B2nEtBsIpbvJ80zV1apJKrs6XBlheZU05hb2IcDC2efT8QTtmZKqF6AUrwQToGQ58JLyif
 +PtFE9VVz48MADj06sKydXwrF9Hmjn19an1P9GMvX7dMs1/Uf6Cy54N5b0uDJAZkjYn4M4xtby
 Vn9MlIIvcOoxkCnYpTextDbLaPvGLnH6MYYtBCs91p62jLmhzFSqD3GrExvle6DG9yAx6EOVDL
 +UXBPdTsUNKojAFK2i9jZLbUsyzdPHkrZ4gEAAA==
X-Change-ID: 20250722-reduced-nr-ring-queues_3-6acb79dad978
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=3122; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=CYo6sDs3WQXmK8jeohKh+18IGAcALzYcj0hLeTiLakI=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLLuNe2bdP+Q1JZ+GbHtR5nrLbbsqlzoco/xW3c61w+d0
 Dl1LvvlOkpZGMQ4GGTFFFm6JPbYTvnHJ6v2df11mDmsTCBDGLg4BWAil18yMvy/eTx+6a9QF8en
 /3/EFZ2QrE4zbzPtV7oTNlHAJFZexIThn/3ud59cluwq3ezL7Xn61Yy7TlPfSQTMaVljETfV7Em
 DIhMA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com

Allow a server to negotiate fewer io-uring queues than CPUs through
FUSE_URING_REDUCED_Q in its INIT reply. Reduced mode requires ADD_QUEUE
and starts serving at the first entry. Legacy mode waits for every queue.
RCU-published CPU maps retain NUMA affinity, background queue selection
and limited retries of busy queues.

Libfuse PR: https://github.com/libfuse/libfuse/pull/1659

Assisted-by: <various-ai-models>
Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
Changes in v8:
- Address another Sashiko review, FUSE_URING_REDUCED_Q should be
  in the fuse_uring_enabled() group
- Link to v7: https://patch.msgid.link/20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com

Changes in v7:
- Address a Sashiko review about possible holes in the system cpu map,
  iterating about all CPUs might have caused issues. 
  We use for_each_possible_cpu() as iterate now and also check 
  with cpu_possible() .
- Link to v6: https://patch.msgid.link/20261023-reduced-nr-ring-queues_3-v6-0-658235c9b9bd@bsbernd.com

Changes in v6:
- Rebase onto ADD_QUEUE and bufpool support.
- Require FUSE_URING_REDUCED_Q in the INIT reply for reduced mode (Joanne).
- Publish CPU-to-queue maps through RCU (Joanne).

Changes in v5
- Rebased to miklos-for-next (Linux 7.2 base).
- Folded "Fetch a queued fuse request on command registration" into
  "Allow reduced number of ring queues", inlining fuse_uring_do_register()
  into fuse_uring_register().
  - Fixed retry logic in "Add retry attempts for numa local queues":
    replaced cpu++ with cpumask_next_wrap(qid, mask) so each retry
    advances to a genuinely different registered queue (Joanne)-
  - Simplified "Prefer the current core over mapping" (Joanne).
  - Folded READ_ONCE() annotation for ring->ready into "Allow reduced
    number of ring queues" to match WRITE_ONCE() on the writer side and
    suppress a KCSAN data-race warning.

To: Bernd Schubert <bernd@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev

---
Bernd Schubert (8):
      fuse: {io-uring} Add queue length counters
      fuse: {io-uring} Rename ring->nr_queues to max_nr_queues
      fuse: {io-uring} Add CPU to queue maps
      fuse: {io-uring} Select the queue through the CPU to queue maps
      fuse: {io-uring} Allow reduced queues through INIT negotiation
      fuse: {io-uring} Queue background requests on a different core
      fuse: Add retry attempts for numa local queues for load distribution
      fuse: {io-uring} Prefer the current core over mapping

 fs/fuse/dev.c             |   2 +-
 fs/fuse/dev.h             |   1 +
 fs/fuse/dev_uring.c       | 324 ++++++++++++++++++++++++++++++++++++++++------
 fs/fuse/dev_uring_i.h     |  31 ++++-
 fs/fuse/inode.c           |   9 +-
 include/uapi/linux/fuse.h |   4 +
 6 files changed, 325 insertions(+), 46 deletions(-)
---
base-commit: 1d8630946017ead740c4126395d4763371f0107c
change-id: 20250722-reduced-nr-ring-queues_3-6acb79dad978

Best regards,
--  
Bernd Schubert <bernd@bsbernd.com>


