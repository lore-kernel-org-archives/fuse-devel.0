Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12383CF1EE
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 19:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780687682; cv=none; b=MR0e/9fTJRDAHy28FSJTp+YsqrJZup2yDEp2tZejIqtCDqQMHoH9SoCUIbN6UHJuMCBjZ9E627k7s9AmSsCRvKCnf9G43vQ+2b7WjF5618Q5yrYOnWIISTlpnV4W1q+xJMfmx7jV7m16uSP6Six9KEcJy4rk1quxtWqn1aDZs1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780687682; c=relaxed/simple;
	bh=uavlxKpBnu1z2AfWP/ri3sDSw/Jkg4/IqIx1hbaKN8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pK3O0xtmo/IVqaGbL9lAIMCCJST7JT2K8JqJ6qFZ9FLknzoDLfSbh7YFeEANwosA8kBYOsmk2B1RetY0gLJEEm4zxM6Crja7l44Pk6AMSl4ff2xs/6a7XHcMIr8KVlFz8qobWPP6xIiaZV8Ylfy5Kh8dQlUYxg/vTCvGOdH/myA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6VAwVUS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6VAwVUS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c3543590so16437825ad.2
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 12:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780687679; x=1781292479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7EmBr78VIKzfhL2jNZoZNthGw9dJn5fsn71xPmnvio=;
        b=J6VAwVUSDem8y0YCjLpOp6zjGoAAMXmswTEBkTUpizBbFmPHCVpVcIxIG7jOtCvCWD
         +ZPFoUfcRvH/R0LTS7r8jvYxPf6mGxkCTNBJxFvUzYsB5pPDTcwzEjcHAU6ixY+a+Izx
         Cpom6mpHZfOoC9YF/BP9kEwuBB+kk96zCroQavDEh9aaYFrYPLdrUGTmqEibY6DSFZ0y
         ibOj38Yt9P/l35edp5nFOPMQahJfBuuN8tRwfj+h9MRl7gXRQUHGcRiM7EwxKXRBjJ92
         L4pmg97C+btOgTagCmsenBPMGXySx0ajZ6u2oIO6dqbaaBv5x3hrzz3VwBETjR5pKLzI
         SrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780687679; x=1781292479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R7EmBr78VIKzfhL2jNZoZNthGw9dJn5fsn71xPmnvio=;
        b=WCU4wOpDHGTO7TTOjYaS4OoCp8B3tVMdaQE9Q9bp/4nOYWQ9XDIPHL1MQA3J+tmrRH
         t+uqWJhHUNPbRGCE4xmVHpGIORpa10rTRHC4fRyLtsM2gwWjerQCcAsBHIOL1z5VzNtn
         YPV5glEvfZFOx47pdeDi6gQ29jah+Q/twQH/IH2L8yR+nzlFmlqrKSZeVIAM7GGCDKbB
         tSK2kMSlPbn0rXkWSce+xWDZ+6RO1WqGwPSnQMf6AqPF9yFWM8ifdUhDic21StYPi67m
         qB3qhEiDh9jZ9+T63RM2UCe3poEtmRy/2bNlrn4B8Ek9p4IkVlO3mzveuKE73d2TK/03
         nFJg==
X-Forwarded-Encrypted: i=1; AFNElJ9voeAxqyGoeJjdnRiaSMlTv8DfWzIDM1XALtbASSY8VqYXbEkxhKmLgER6y+OLqHIL5cJdwoZJ2w4I@lists.linux.dev
X-Gm-Message-State: AOJu0YxwtL8XG4eVdJCzaItlzZv3B+DqI1GNY+8i+MZ96MwqoyciVoyk
	6T79NVflxLBdQdlmhu5VLQCNmQWCmIp/PQrVmC198KsjDCzS2MmcXBpwYSBgNw==
X-Gm-Gg: Acq92OFZVCgfL3TmMm8nKkG1rRkaYezVUBbzTrEwCw3to1B2hJaEX3KmNbqcO1+O2vg
	ae7NsmbR6eopr1hx3o8TZzUcrO1EkpI6KghwTfHpt/xN2+LoSgH0xfOQNkNP71O9blLKBKZJBLJ
	H5soFFWH6s7fx21fz+Br41RrUky6a3ISCkRN95075qJSVLTuu7Cju6sVdA0GnAUEQ/SlN1fNPr7
	3w44OM+5rZpWV9Cp/CcDHgNfblyIByD2E52OdJ4C1Bu+xr/i5D807ldDBblpXNqhF4ne+/BFAka
	xjZO9/TmQOIIqg7s7w0RTvLiIFk4c+VsFYvqSFYiX9jv1kb9/2cYxpTFggnoWrcQIT74nRuq1YQ
	/5YRqA/LXMmOykNrqyULrn6GvG8nky54U5zvflpz+0mIprXRIG9PV/mIY+zmI7aH7ZMeBBUzVzI
	8v1Ka/Aaly7AABylVdN8Vdnzh9QJvk
X-Received: by 2002:a17:902:fe0c:b0:2be:22cc:e227 with SMTP id d9443c01a7336-2c1e78e0291mr38710525ad.4.1780687679040;
        Fri, 05 Jun 2026 12:27:59 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:72::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e61csm102663425ad.43.2026.06.05.12.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 12:27:58 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com,
	fuse-devel@lists.linux.dev,
	Chris Mason <clm@meta.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] fuse: end fuse_req on io-uring cancel task work
Date: Fri,  5 Jun 2026 12:27:08 -0700
Message-ID: <20260605192708.141921-4-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260605192708.141921-1-joannelkoong@gmail.com>
References: <20260605192708.141921-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Mason <clm@meta.com>

When io_uring delivers task work with tw.cancel set (PF_EXITING,
PF_KTHREAD fallback, or percpu_ref_is_dying on the ring context),
fuse_uring_send_in_task() takes the cancel branch, assigns
-ECANCELED, and falls through to fuse_uring_send(). That path only
flips the entry to FRRS_USERSPACE and completes the io_uring cmd;
it never discharges the ring entry's owning reference to the
fuse_req that fuse_uring_add_req_to_ring_ent() handed it at
dispatch time.

    fuse_uring_send_in_task()
      tw.cancel == true
        err = -ECANCELED
      fuse_uring_send(ent, cmd, err, issue_flags)
        ent->state = FRRS_USERSPACE
        list_move(&ent->list, &queue->ent_in_userspace)
        ent->cmd = NULL
        io_uring_cmd_done(-ECANCELED)
        /* ent->fuse_req still set, req still hashed */

The fuse_req stays linked on fpq->processing[hash] and
fuse_request_end() is never invoked. The originating syscall
thread blocks in D-state in request_wait_answer() until
fuse_abort_conn() runs, which can be the entire connection
lifetime. For FR_BACKGROUND requests fc->num_background is never
decremented either, so repeated cancels inflate the counter until
max_background is hit and all later background ops stall.

The non-cancel error branch already handles this correctly: when
fuse_uring_prepare_send() fails it calls fuse_uring_req_end()
before fuse_uring_send(). The cancel branch must do the same.

Fix by calling fuse_uring_req_end(ent, req, err) in the cancel
branch before falling through to fuse_uring_send().

Fixes: c2c9af9a0b13 ("fuse: Allow to queue fg requests through io-uring")
Cc: stable@vger.kernel.org
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Assisted-by: kres:claude-opus-4-7
Signed-off-by: Chris Mason <clm@meta.com>
---
 fs/fuse/dev_uring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 7cd50990b097..b5cc700575ca 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -1222,6 +1222,7 @@ static void fuse_uring_send_in_task(struct io_tw_req tw_req, io_tw_token_t tw)
 		}
 	} else {
 		err = -ECANCELED;
+		fuse_uring_req_end(ent, ent->fuse_req, err);
 	}
 
 	fuse_uring_send(ent, cmd, err, issue_flags);
-- 
2.52.0

