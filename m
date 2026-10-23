Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792795841;
	b=njAHSV04an/xTkDHk/bdRmHEeLx/bMD9iKG/+er8IzBW8EEcpa9fyl95VUpNx1Ggr+s7
	 X3AALUxFJCoXw4HB0nqbYxhJhxROuz3zqPTWD3AeRIK9hvlZz1CUQ9wDNubs32MCvz0EH
	 qEHQacUJlftgsrwh0HmBpt0qjFLgozOqE1hxS2LVPIyQytzty14brF5OZDS/wocqDw3do
	 CivzIvr0ZnfVyCo272EFOsIK5+UE5QuRA+5+9xbdL0phe36C7BuYSkQ7YMQP025RrAsO3
	 qlcp5EjyzgUx/uHCRB5QC4zsgdW3tIops5WLpGJAITocfkSs99HJUrPCQVtJWtSfOuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795841;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XzQzk1iB1+QLYQ1UDvDZ+qrq/5EHkUqaR8ovdpmn0Ek=;
	b=3xirBqC9MPg4QHq0CXTwliwoTQZgpohUyaMZGnQpJUL0IyoCRdsvSCdHoAHXI+ZKYmYC
	 FO7+grcLmczHOA4Fkz/vfiL/fxnsvxDvHbNJJEIWLrlplHURJHL3R7yLtykhR9bOLHGve
	 dg4t6FwntmyAMHNR94k3bCg56GSzmQXvDOhhsLSFb0wsnngF7ux03jG6jNBICvTGG3Kbg
	 D5QfSreSBlmgGD9yBRbuhAGDah8/9AITSXFhoXB6uDnkZHWTVfzoNBsGTUH48rYbkP0HL
	 FRBgaKT0uHUVgC4bMeSaqF/2/rdbsjaFckwCRvxw7cSFAL0G9mXlsihp3uyG5r4criQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I7GVqZq0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F8D606A320
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 22:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I7GVqZq0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792795841;
	b=JzYxaGNXk8ZY7vSRrumgUDQ9c83oAa3QctNAVgI+XCnUjlSH3fquM7tKGQMwmd4tKY3C
	 0HOr8y3le5pofY6lGjRKKb/f31Nq+QxRT0Cl3TiJIwKzWkN0hE6UN6Wj0uStFoM7EpcJe
	 jSvKlZfcMcR1VZTZKH7B1GEGVB2XFdBWOQH+mJ0WsboNwS89b9J2YjYI428b5SdwOAlD+
	 5GpkOLTaaVFJiWgtCANze71YiwGeXhpU0dA0xdLRf56E+bzYuMft5oG4ndbycyMuDB6FP
	 xOADg9VCaMCdeK+K/fFVMW8pO9amTTPZEmpTxqQu0p0Uww8qWiELpRlkV89pg1ZbS3A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792795841;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XzQzk1iB1+QLYQ1UDvDZ+qrq/5EHkUqaR8ovdpmn0Ek=;
	b=oKNrr6jDmtOydBbUXrQz/yc/6+AdzV9a4n+U7GcuhMbnOHBP/OzQELgXev+lv2I/60lS
	 Py/ctnSn/RNTVKjyQrwKrQaVc9pCdTlqe5ukDOO1AK3Pk/OjFefSpU3BASZWTvFDbsOwK
	 GqoEhMYsMfUvQ/AMJo17eky0nI2PWzztQ18SmTRf4mwI9hA7UzRWc7JcyfyOAgmiktY1O
	 r8/p8yYJPZEnOaF6hbaBVNmCr88/qXZbyiusRcXKDGet5I06sXbuRu8p2mttXkWSOyEkE
	 dFaoaToLLMSct3faLjF5olzaRvAwjuz6nzSOeeVNmJiuEHT2QCtbNc5idHsq25WfRZw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7493C1F031E3;
	Fri, 23 Oct 2026 22:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792795841;
	bh=XzQzk1iB1+QLYQ1UDvDZ+qrq/5EHkUqaR8ovdpmn0Ek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=I7GVqZq0QahsOYjdLs7lrbHN+/9g74OWJiPKVKaiveKHuq1kgB0Ulv3Wt8DqLAynU
	 3vGq5e+biEoBwFT+NKtPtY/Kw/KFZBu7rYfFTJJ8hbO1e/7GNAb1VKEx13JFeYqMDu
	 mEoGcvaiypVZwnpeKafgWK1/jVetcgoxHFumNur5ymYx2OVEW+yYZYLiXGj4I7WBdu
	 MmY2mFiqEDXk/zj6C6u1t2JpaF10xdV6gmTl4kHEa2VDmMJ9aIaFvSP2luHuUW8cFi
	 w9myoORyXezZ+NYDimJMy/2H7+q35UY22iFxm6WWYagt9LrYxG4XwPawnuqHKIFKCR
	 Xhcmy7DQ0u7xg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1DD8C44681;
	Fri, 23 Oct 2026 22:50:39 +0000 (UTC)
From: Bernd Schubert via B4 Relay <devnull+bernd.bsbernd.com@kernel.org>
Date: Sat, 24 Oct 2026 00:50:35 +0200
Subject: [PATCH v7 6/8] fuse: {io-uring} Queue background requests on a
 different core
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
Message-Id: <20261024-reduced-nr-ring-queues_3-v7-6-4e77e284fd48@bsbernd.com>
References: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
In-Reply-To: <20261024-reduced-nr-ring-queues_3-v7-0-4e77e284fd48@bsbernd.com>
To: Joanne Koong <joannelkoong@gmail.com>, 
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, fuse-devel@lists.linux.dev
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=4021; i=bernd@bsbernd.com;
 h=from:subject:message-id;
 bh=oUbbCnwNP1quWDYI5AMQL4ZSQ9HWTbA55+IRKXYl5V0=;
 b=owGbwMvMwCFm9Dnz3fRepz+Mp9WSGLJuP9nLNbU35ZNbfm9X15bADKGtz74UcP8M2vzPw0dTX
 YOD8dvBjlIWBjEOBlkxRZYuiT22U/7xyap9XX8dZg4rE8gQBi5OAZjI5m6G/5Gvpu1858yeyOIn
 u3pXXWuyyL0bcRGe6dG7jNeqNsdOv8jwTyfnZkjmbbUNbB8vuAX9XDa95ljHwpIfi8NXzGmqsPu
 /jwMA
X-Developer-Key: i=bernd@bsbernd.com; a=openpgp;
 fpr=8A18BC3D94FE0E1D26F5AFD732F369EE978D42FC
X-Endpoint-Received: by B4 Relay for bernd@bsbernd.com/default with
 auth_id=772
X-Original-From: Bernd Schubert <bernd@bsbernd.com>
Reply-To: bernd@bsbernd.com
Content-Transfer-Encoding: 7bit

From: Bernd Schubert <bernd@bsbernd.com>

Running background IO on a different core makes quite a difference.

fio --directory=/tmp/dest --name=iops.\$jobnum --rw=randread \
--bs=4k --size=1G --numjobs=1 --iodepth=4 --time_based\
--runtime=30s --group_reporting --ioengine=io_uring\
 --direct=1

unpatched
   READ: bw=272MiB/s (285MB/s) ...
patched
   READ: bw=650MiB/s (682MB/s)

Reason is easily visible, the fio process is migrating between CPUs
when requests are submitted on the queue for the same core.

With --iodepth=8

unpatched
   READ: bw=466MiB/s (489MB/s)
patched
   READ: bw=641MiB/s (672MB/s)

Without io-uring (--iodepth=8)
   READ: bw=729MiB/s (764MB/s)

Without fuse (--iodepth=8)
   READ: bw=2199MiB/s (2306MB/s)

(Test were done with
<libfuse>/example/passthrough_hp -o allow_other --nopassthrough  \
[-o io_uring] /tmp/source /tmp/dest
)

Additional notes:

With FURING_NEXT_QUEUE_RETRIES=0 (--iodepth=8)
   READ: bw=903MiB/s (946MB/s)

With just a random qid (--iodepth=8)
   READ: bw=429MiB/s (450MB/s)

With --iodepth=1
unpatched
   READ: bw=195MiB/s (204MB/s)
patched
   READ: bw=232MiB/s (243MB/s)

With --iodepth=1 --numjobs=2
unpatched
   READ: bw=366MiB/s (384MB/s)
patched
   READ: bw=472MiB/s (495MB/s)

With --iodepth=1 --numjobs=8
unpatched
   READ: bw=1437MiB/s (1507MB/s)
patched
   READ: bw=1529MiB/s (1603MB/s)
fuse without io-uring
   READ: bw=1314MiB/s (1378MB/s), 1314MiB/s-1314MiB/s ...
no-fuse
   READ: bw=2566MiB/s (2690MB/s), 2566MiB/s-2566MiB/s ...

In summary, for async requests the core doing application IO is busy
sending requests and processing IOs should be done on a different core.
Spreading the load on random cores is also not desirable, as the core
might be frequency scaled down and/or in C1 sleep states. Not shown here,
but differnces are much smaller when the system uses performance govenor
instead of schedutil (ubuntu default). Obviously at the cost of higher
system power consumption for performance govenor - not desirable either.

Results without io-uring (which uses fixed libfuse threads per queue)
heavily depend on the current number of active threads. Libfuse uses
default of max 10 threads, but actual nr max threads is a parameter.
Also, no-fuse-io-uring results heavily depend on, if there was already
running another workload before, as libfuse starts these threads
dynamically - i.e. the more threads are active, the worse the
performance.

Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
---
 fs/fuse/dev_uring.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index cff8a06e6d68..f22a1b5fc7fb 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1959,7 +1959,8 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 	}
 }
 
-static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring)
+static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring,
+						       bool background)
 {
 	struct fuse_queue_maps *maps;
 	struct fuse_queue_map *q_map;
@@ -1977,6 +1978,8 @@ static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring *ring)
 	if (!q_map->nr_queues)
 		q_map = &maps->global;
 	qid = q_map->cpu_to_qid[cpu];
+	if (qid == cpu && background)
+		qid = cpumask_next_wrap(qid, q_map->registered_q_mask);
 	if (WARN_ON_ONCE(qid >= ring->max_nr_queues))
 		goto out;
 
@@ -2004,7 +2007,7 @@ void fuse_uring_queue_fuse_req(struct fuse_iqueue *fiq, struct fuse_req *req)
 	int err;
 
 	err = -EINVAL;
-	queue = fuse_uring_select_queue(ring);
+	queue = fuse_uring_select_queue(ring, false);
 	if (!queue)
 		goto err;
 
@@ -2047,7 +2050,7 @@ bool fuse_uring_queue_bq_req(struct fuse_req *req)
 	struct fuse_ring_queue *queue;
 	struct fuse_ring_ent *ent = NULL;
 
-	queue = fuse_uring_select_queue(ring);
+	queue = fuse_uring_select_queue(ring, true);
 	if (!queue)
 		return false;
 

-- 
2.55.0


