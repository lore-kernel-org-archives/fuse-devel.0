Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAD93AB47C
	for <fuse-devel@lists.linux.dev>; Thu,  9 Jul 2026 21:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783631500; cv=none; b=kfyxhQpgokhgrugQ/ePRSlKTG3cUZMNGJqEwmMG2oK5GzBezDh3R4P1vgQsRrgfUYOkVwgO7F60tBLLMszXPEeqP/LQxfbsPACAFWblFdq3C0uMhPBS2QxFEwag1/PhfV3TK5iN2hQv3vZprddM1mtap6nh6UKBd/AGkgRrNSds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783631500; c=relaxed/simple;
	bh=7wR85BSlK6g7rPPLZUmhmMR7qWMPn8HJ/Ov54TKx1o4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j90yCm4nHNo75CGQNmj7hbVCwKQhZHuvmUUV4eu+PgNpKZWYIqT9hGqUneUMCbWXEc0cqrldbUtScJ6qaVJ6Nnd3pKDrn2XfMPgP9MW86i14wwOiAlyUcPaHYSPipIElOGI/02i28aPPUwrLT3n+QnzRdnFZ9nDyf8E6y9plo9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=NC5SyeyP; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="NC5SyeyP"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc891373e0so1938925ad.2
        for <fuse-devel@lists.linux.dev>; Thu, 09 Jul 2026 14:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1783631498; x=1784236298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XuEkKfOMhfrm+8X9CsfK3WSrB0bxoAf1wJ4HbTJkHGI=;
        b=NC5SyeyPspb14La3hMZRXWEOpU9yBkfZOV5wIuw3BfnWkxBBEPJHZ0F1i7wYqB9CQf
         8YaXwqBQa7g48NM1yREKEsIJPULY/lExd3LP4MHCq7VbV9GGwuhmrZhuARZuySS25Njl
         uzmFYEKmWW/ios7KrQcw58/C2vMMAP5NOMmU52CyrTJgIuw9hTw3FVltp+C6ZK2YqHHH
         SwYt6x7A69kYKrNf69Bc7gCFx642TrNXQ3mgUY73EeeAqWvzXhy4L+0OnPppBWiozhit
         TLICGBl6smKVatrjmfGeJCIDsU8I3UsG8X3qpsbY1VBb00xr/x4oi/35KfuNLRbcIJ+T
         0nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783631498; x=1784236298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XuEkKfOMhfrm+8X9CsfK3WSrB0bxoAf1wJ4HbTJkHGI=;
        b=MOXwsDUSURhN7IvWUYp0GVyq8r+DAeFNyDdfqkJfBL2XHRWSDXhRUsH6kP1uw8qdDP
         TVOU3IYEfiU9NKjlWB5oF/zW13QecCbc2hjezGNY05AasdPGy127YnCABwxLGOvXxw/U
         V7NF8bUw7/LuJ2HeVkWCmwU+otqJcuIDnbGPHybr+4/GzCLAAqY8QfMrtZVe0fnDZCAv
         ZwUMRun8l/qBBw0ePPkbPcNhi8tmhUCIlC0b98dchSA9Sy9SczWwodnxmxkS2kCMivsK
         +d81Mo9L7rhSF6x98xbQvpbBJa36QdmbwanHbazP4nMc2ow3UatyZNdbkUiZ7h5DCVdU
         NvLQ==
X-Gm-Message-State: AOJu0YxHVJupT3BHVY/MxdjTMMeFpJ2CSXOXPC5TpmC5Mpbw+Jf9gKX9
	3A6eNIT+jCIOOALuSIor/Xqd6/ZlN+hVKoO+/nMAYAvKwKHZj5FuT390lGuGY15OTw==
X-Gm-Gg: AfdE7cl1rc66sXyczLLMKVBPuepJOdCcxVikjC0AA/ozBrj9F5rTIhSxItnnGpEn76p
	IAMOCFDNS2/9WndAoPJESmxL+ni3qvKgiRzjBf9qMQmmJ/jowUI7aZqrCoSPTTjvxoQieAAvsU6
	0eZb7wbhgEFVB25V5/vCHycXNv8na9/0LeVBFYKc/cxdl/SbjRwlpWH5deCsGb9zAlyg6t8u8Zo
	d616ssAI0m7tC2VtDiZO9dxE5ZJDwqnsaNrLZ10x15N9ea7vVtangxRbyMQQy7Ro4VWRQboLrlr
	Oxu25YU5x9dyhD8ldN6s5w4Z4aXi4WAlgQqSPNjfwEQjeWtuK2K668E0O/qk2HbWR4Ln6H7063f
	7hdjHcztwjmG9Hg+k6iiEbSdxSS4/ayaJPhDHix+t4KUDNs2wZtbeSMCihZU0dbfb3sC5Cq7C
X-Received: by 2002:a17:903:4b0d:b0:2cc:ffa6:462a with SMTP id d9443c01a7336-2ccffa65d47mr55654255ad.10.1783631497770;
        Thu, 09 Jul 2026 14:11:37 -0700 (PDT)
Received: from p1.. ([2607:fb91:150f:dd4:6d78:821f:ff11:b509])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm49742475ad.78.2026.07.09.14.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 14:11:36 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: fuse-devel@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	bestswngs@gmail.com,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH v3 1/2] fuse: copy request headers via a stack buffer for io-uring
Date: Thu,  9 Jul 2026 14:11:29 -0700
Message-ID: <20260709211130.543773-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fuse-io-uring transport copies req->in.h out to the ring in
fuse_uring_copy_to_ring() and req->out.h back in fuse_uring_commit().
Both headers live inside the fuse_request slab object, whose cache
(fuse_req_cachep) is created without a usercopy whitelist, so copying
them directly to/from userspace trips CONFIG_HARDENED_USERCOPY and
panics:

  usercopy: Kernel memory exposure attempt detected from SLUB object
  'fuse_request' (offset 56, size 40)!
  kernel BUG at mm/usercopy.c:102!
  RIP: 0010:usercopy_abort+0x6c/0x80
  Call Trace:
   __check_heap_object
   __check_object_size
   copy_header_to_ring          fs/fuse/dev_uring.c:618
   fuse_uring_prepare_send
   fuse_uring_send_in_task
   ...
   __do_sys_io_uring_enter
   entry_SYSCALL_64_after_hwframe

Bounce both headers through an on-stack copy so the usercopy touches
stack memory, not the slab object.

Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
Cc: stable@vger.kernel.org
Reported-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
---
v3: no context change; add Bernd's Reviewed-by

 fs/fuse/dev_uring.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 77c8cec43d9c..0814681eb04b 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -744,6 +744,7 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 {
 	struct fuse_ring_queue *queue = ent->queue;
 	struct fuse_ring *ring = queue->ring;
+	struct fuse_in_header in_header;
 	int err;
 
 	err = -EIO;
@@ -765,8 +766,9 @@ static int fuse_uring_copy_to_ring(struct fuse_ring_ent *ent,
 	}
 
 	/* copy fuse_in_header */
-	return copy_header_to_ring(ent, FUSE_URING_HEADER_IN_OUT, &req->in.h,
-				   sizeof(req->in.h));
+	in_header = req->in.h;
+	return copy_header_to_ring(ent, FUSE_URING_HEADER_IN_OUT, &in_header,
+				   sizeof(in_header));
 }
 
 static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
@@ -871,11 +873,13 @@ static void fuse_uring_commit(struct fuse_ring_ent *ent, struct fuse_req *req,
 			      unsigned int issue_flags)
 {
 	struct fuse_ring *ring = ent->queue->ring;
+	struct fuse_out_header out_header;
 	ssize_t err = -EFAULT;
 
-	if (copy_header_from_ring(ent, FUSE_URING_HEADER_IN_OUT, &req->out.h,
-				  sizeof(req->out.h)))
+	if (copy_header_from_ring(ent, FUSE_URING_HEADER_IN_OUT, &out_header,
+				  sizeof(out_header)))
 		goto out;
+	req->out.h = out_header;
 
 	err = fuse_uring_out_header_has_err(&req->out.h, req);
 	if (err) {
-- 
2.43.0

