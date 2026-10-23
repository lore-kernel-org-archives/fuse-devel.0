Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792787336;
	b=UEH/a5985TroHQWgI80QrDp09iDuskP+SOWAMe1QXhEYxvnRs7Xd+zTtsd1pyzJwkUd8
	 4a2P5MTZfWTWn00TDlaixfKsJCZcLIx5aeBZcp5LuBQfRxgpnjO0v4NiRee5QvhCIbBzu
	 lzegWx+80VlJ/nGCIsIFvaGq8C+y4WhRRMCpbYOyFuK+LqBXyR8WdLPPyXTXsV4Zhi8m6
	 9ngcmfvF7EUV0Pm/t1DamvVPLG92pruDvsYZfM73abyEBiM8F8KTxgsMmM5S1+5wAwUd7
	 PlAhjIMBYqPcO5T4ay3u44CqMQW5wc74HjfZ0C/XFfwoPlN3JC/FZAxAZtAQRZcbQzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787336;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bTfWGJZuzfksDNUkTxdrTjBg+vJNgP7ZmOsx+b+A8c4=;
	b=GgPY1l7mAM26q2jThw2vSgsrRlnB94jBGfzZSm9GQA1b6kwHIw5hqu7bS9z11i09QDuo
	 IhH22AMyYrI4ii1lLfeHCVQ1OJAPHZs1dFYgb4BBVpzlk9QSi5PDqpec5fk1cFK1V7uEz
	 eMmbgPCpnuoUShRs3DO5c2jbYWvbz5mFiDRDfiDEcddwNDEWa2i99ui0TtZe3HgVF7oyM
	 gCYnRbDPPZzLUq6z2BSiO9obtCgD6wc+lmZVDmuLkJchbEDXiaFeGZ/YSYYhKjE7Iiclg
	 GljXI27vSggIKkMXKsVlUB9ucZ9lPFInma39ZuAYAAkiHM2X3B8KdD3NUIjP/797O4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N+gwQ97F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C579606A320
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 20:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N+gwQ97F
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792787335;
	b=lMd5rPe51GAwpak0o840pBy1cM5OYgfAtDcXhY591aiBHKxnbdlYLrMSouHzp86bcuKo
	 tbeBlMYasdy1iB+M0QdEEjPwkycHxwgee7v/4RvLyWW7RQhVLClnsI7Ii5STbuN95JP25
	 nZtCQuw+t7B2xZIjjGQNF/Y2NU71lGNXx8f1AVKbcHEj7AGcCpugqqeXA3w7cY3m2DKKH
	 5UVTjJwQQ9ITtH9ie3YfjltHmZ+0dujuLStZ5YDR8hoJcrPKhYs4aZcvimFlAHqYztJv/
	 il2Y859M/89O+QjGhCvNKV2Tqa4khdvYjAcwv64/2jYIFOvRdh66oC0P2mt7xaPVoOg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787335;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bTfWGJZuzfksDNUkTxdrTjBg+vJNgP7ZmOsx+b+A8c4=;
	b=rNaibisURNXOgPoMfdbab00GMoeL2GJoJNgEP8QaB2jvLz2e3tCjLYlg5/mkH2smIDIr
	 h4QnNhBb4zYFFeEuVpPDaBCvSwlr6ZDOHfEwZptv7V0AYv/J0ETAK9EcGt0ILd2pNvMsp
	 GPTY8C9OLjF2P3oGG3XpKuD/qbFPMGwUIuMM5bsgLxaqKcSIZND3zKON7zeER/12kf4o0
	 qkfQ93isj2BttscAyqgsX2Uf0a1UOUKx4jL1gCtxXiTQ+XBC8hJT4kRMfEtgYXKW38k1A
	 BtTFGd19a6mHObOq4gA0I31WInmf9YWlTTWyGky/a9CwEs4xGjT3miki2O7vha8Gs5w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55C431F031E5;
	Fri, 23 Oct 2026 20:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792787335;
	bh=bTfWGJZuzfksDNUkTxdrTjBg+vJNgP7ZmOsx+b+A8c4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=N+gwQ97FTZss+b+1rA9XMrTUzExeuPr064oS6+HnYgOqgm8PPIwgyMZQmxyZ4z1gr
	 oxFuSyuTUfhdKQN1leXDwecNUevvo8cFXb4ivyQEywlGY+2vdxJemSdlWsEXwGzoND
	 Wa/ZgoAQ8I7EW1gU4B5BplIAaQ85Ex8cVuDMtI4Eb0ZhE3//gKjhMDxCx4m3VZ/pJe
	 dQTyKZEqc3qgK/PweNvgeY74XVpJzGmWWciAwbKvEsqvE/ilrIQm+vF/uCAgSvlL99
	 MzR/QCOYJcXrM1nNH0Bw3tCsJtcFPHYZ6ubZlkmLZ+VGMqNOa11A63aXCbGLYFduT3
	 81QJnWS16jC5w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D14C44461E;
	Fri, 23 Oct 2026 20:28:52 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Fri, 23 Oct 2026 22:28:50 +0200
Subject: [PATCH v6 8/8] fuse: {io-uring} Prefer the current core over
 mapping
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
Message-Id: <20261023-reduced-nr-ring-queues_3-v6-8-658235c9b9bd@bsbernd.com>
References: <20261023-reduced-nr-ring-queues_3-v6-0-658235c9b9bd@bsbernd.com>
In-Reply-To: <20261023-reduced-nr-ring-queues_3-v6-0-658235c9b9bd@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=TYayZW4DyqkyyR4xW/jHVS1Rx9iUTnXzfoY92cYi9tg=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJuH25eyyM085ni2Y9lk28nKUrO3MAi0cRyJ6H/fOMWZ
 /72tTvcOkpZGMQ4GGTFFFm6JPbYTvnHJ6v2df11mDmsTCBDGLg4BWAiVXMYGdZueysk1bg+sOfS
 uXTt4Jn7fiyMLF4342VLgP22E7/f6H9n+F/DtPGuX/fk65ypezRKK2YnJm+JrbDUfxWavmJeJdf
 neSwA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com
Content-Transfer-Encoding: 7bit

From: Bernd Schubert <bernd@bsbernd.com>

Update the mapping to prefer queues that belong to the
current cpu. If no queue is registered for the current cpu,
fall back is to the existing round robin logic.

Example (with core binding)

unpatched WRITE: bw=841MiB/s
patched   WRITE: bw=1363MiB/s

With
fio --name=test --ioengine=psync --direct=1 \
    --rw=write --bs=1M --iodepth=1 --numjobs=1 \
    --filename_format=/redfs/testfile.\$jobnum --size=100G \
    --thread --create_on_open=1 --runtime=30s --cpus_allowed=1

In order to get the good number `--cpus_allowed=1` is needed.
This could be improved by a future change that avoids
cpu migration in fuse_request_end() on wake_up() call.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 fs/fuse/dev_uring.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index c4c0230d02fc..cd2ba52d106f 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -391,6 +391,12 @@ static void fuse_uring_cpu_qid_mapping(struct fuse_ring *ring,
 		if (node != -1 && fuse_uring_cpu_to_node(cpu) != node)
 			continue;
 
+		/* Prefer the queue belonging to the current cpu */
+		if (cpumask_test_cpu(cpu, q_map->registered_q_mask)) {
+			q_map->cpu_to_qid[cpu] = cpu;
+			continue;
+		}
+
 		qid_idx = mapping_count % q_map->nr_queues;
 		q_map->cpu_to_qid[cpu] = cpumask_nth(qid_idx,
 						     q_map->registered_q_mask);

-- 
2.55.0


