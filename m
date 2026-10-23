Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792795840;
	b=MQDj9JbcgUplP0dHTDOjT43zsiTHMOB4vFEgEfYC7rn5PyMY4ThypTwXot3WgwaJUzKB
	 B+Anxmob2NgNcYYXJIeumvy4SDQCDH4b1a7UdHIXKa9UL4pPWKTeU/Vhe7iWTX326N+G9
	 AEkM0gsI9UyAg4zYMnE1jdpi7Ww9tRpaHFQMg9+uUt030NwBIwm+doSz+UPq1W6zUHMwI
	 3obQusVoArnx3n1asfFinjZgNDWKM35YopBoG63KoiyW2sxVgbVfeHjFVOiJRNBQGAatg
	 X96brnDjyU3S0mrijInQysQJc6siD5Ffu9Ctufxw3u5iwrNVrhfPIqeUmRaKxLsRYqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795840;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=8NH056vNFU9CRX9Y/yMizEUsBIG3cwLPGuxRMd+3Axs=;
	b=x70qfx+/cPdbhv28p0Hk6uuZxsu1L8A2c3zmpmDQ4xaWEVsmdVv1ChtBWfdhygmjh5Gi
	 NDjiqX1AyRfPyWVmu/2xBwcV57IToZ5WZPSSyqOsuPDjQ8k5kFy4Tze3cQF07Yp/G/6um
	 rfdtgYsZhBrhf96rCZxhtlRHcvBpqZ6qE4JwVGQD/+purmuE7pbzYZi1mOrjBkFToJEH2
	 30XFmTrOkavkszdze6rKY/jknd4t0Tm2zgF/Vfpv4C/rEUZGPv0GJtrANJg/48IF7EKdo
	 t/62TOhmfHkixNJVTipBjioRK8TSKe0ocKrbIFKakq1elmO5EkbA03YOT/imTojb6Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N3ZvXWi3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AD2606A31A
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 22:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N3ZvXWi3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792795839;
	b=pIpDFnJ2cKa2sxE7V5+VqRwhP9eSMxBVb47Zo0O4wnALsAGtLcI3A/pqyayy91iV9gph
	 SXfO4y6YaFzUjvGqPgIvc35WasAUGmXpw/Lumk0A6cSt5CnVypXEJc2DOoCLNRMrP8ULS
	 k0lPiicAami/MfUWmad0mpNYHAlwEntHYBjpm0CMTjHDB/MVkTWAKycpYE1HVfPm3maJd
	 3XXce0TdSvdKRbDsRWaUmgx3SM35SapA5PkG2/fmSRBMeC9yHqzbQdc7jX5rd0eZl3Zwi
	 Su2TUhRXbDf1hEADza/Y0erflIpvTWOgSGcrqPMP1UjwvJZyiNbzRVyi8xBh0D+QLUA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792795839;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=8NH056vNFU9CRX9Y/yMizEUsBIG3cwLPGuxRMd+3Axs=;
	b=oJl27VlR8E1UQCQUzfQdMWV5ZcBWL8AS/32dUbFsiYb9G0tmQ4C1LQ/vA16b25DVjhxj
	 OayvG4JXW61lZqRA2nbBJzNji1jOd+I8yBRfIp5PirfRFvvQWC9yROQVJ6p6qZy5ZyP+F
	 WYo3kq5wxqq2KmS5qo9CLu56kBnYExw/NQgX9g2AV7MDV0ZEjKXYiamrWB47UD03tnYp3
	 4UQWpbBgviva9YZ4KGZGuD84V7mtqQn6gJWLSqShMSfaaY+H6H2drDxjLxs47sK0XQNU/
	 /W+H1zx6ac1sg118O8VyBQCeeb84ZoYofI9mVeT8DY6jDijxJj+GvLA2+b0xjWGme1Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59A741F01825;
	Fri, 23 Oct 2026 22:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792795839;
	bh=8NH056vNFU9CRX9Y/yMizEUsBIG3cwLPGuxRMd+3Axs=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=N3ZvXWi3K5VZbUbvYbXs19ywHJEBWBSrvTazEq4umpVqpWtO2fMq+KDZLtEAM1bnK
	 01GIkz8ZAmM3zD4uqvNIaPaW3HBBacywgbnBGk4o+2rKNwvLX+cCMlasLwouRjhGh3
	 KjXhKxBbIYBG8uUu1YPbAIYioV4n1vkJ5Uwb/O9HzzAdhEpKZ7clgmM1kmASpJvNbx
	 75iQS0YLmcXl9a/A8R2QJlZSnwuMCWAZJ3gi/j3hicdz7KlPLGaSih7BAmeRD4y9ME
	 FWkqmOkbmn4uoX6gsLd0Sbo93Ai1Hn+VjeoyLFcS6fuGY+PkPnVAhq8iXsfZhJdNGM
	 I60Y5lBwit2xg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DC1C44466D;
	Fri, 23 Oct 2026 22:50:38 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Subject: [PATCH v7 0/8] fuse: {io-uring} Allow to reduce the number of
 queues and request distribution
Date: Sat, 24 Oct 2026 00:50:29 +0200
Message-Id: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Ny27CMBCF4VdBXtfIF+JLV7xHhaqxZwJe1KF2E
 1GhvDsOqFXZRF3+R5pvrqxSSVTZ6+bKCk2ppiG3sC8bFk+Qj8QTtmZKqE5YpXghHCMhz4WXlI/
 8c6SR6rvmBmKwHgG9daydnwv16XKn3w6tT6l+DeX7/mmSy/oPdJJccABH2gJ5S2aPmLdx+GALO
 alfRgqhVxjVGLtTfS/B9bFzz4z+w8g1RjfGoLPRAWgJ9MyYH8ZIodYYszCdU7qLPviA+1ADlYw
 Pap7nGyUqXIWXAQAA
X-Change-ID: 20250722-reduced-nr-ring-queues_3-6acb79dad978
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2897; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=439drljPCtun3e95Ug86Q73VP6NEzeD2ZKEwJOGShkM=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJuP9nltXxJ2YtfQZWlcpNcOk/du3Mm9M3N6E1pk6+Kc
 WeJG83Z11HKwiDGwSArpsjSJbHHdso/Plm1r+uvw8xhZQIZwsDFKQATmXyMkeFUdWae1+Vrex0a
 TRtW5S1sePP3t/qeBTv3a97cL5/PE/yJ4Q/3N6aVrUKTHwjEfJm0bmrY/1f+WVvCz3RGdEXtrnT
 M7+QHAA==
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
 fs/fuse/inode.c           |   8 +-
 include/uapi/linux/fuse.h |   4 +
 6 files changed, 324 insertions(+), 46 deletions(-)
---
base-commit: 1d8630946017ead740c4126395d4763371f0107c
change-id: 20250722-reduced-nr-ring-queues_3-6acb79dad978

Best regards,
--  
Bernd Schubert <bernd@bsbernd.com>


