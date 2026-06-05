Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A174192F2
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780651612; cv=none; b=nc+r1hGJwhrAXYAGA8Zy5jhoQYBVFuGGcWikEfEPMLYxQHzulckN0yb+wmxFdL5A1TGdLEwDEH6VKagHBSV1owp8pyQAvtZnb7VH18VzWR4JUmD+BQ80yhJBBP/5doGcnsTVvZ0GzBaiIb+tzQ8hdjCmtAhDHqmhwbXru7fRzaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780651612; c=relaxed/simple;
	bh=D5neziiU4m6iYvj2/ApXEBdd4JjFj4vM1GzbLSpJkAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gnDLpmuWaWltot2fu4ItqxJSNjR+xaxiagvbKkmEoQtAqziogbrHwSJjgVN1WXuS6aA5i+QwdS5QzqhINFcolkPtPJhALJQr+zjeImdIBFaRyKkknZDptdxiaDVYmicVT22q9ohfMgwWB/IxJ3kyOKVs24v8cZ7v5IyRYAOCbKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnHRPrbU; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnHRPrbU"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68c1630159bso1904522a12.2
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 02:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780651609; x=1781256409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hk6dqEzXaUYXStqZwWYUcnHHCz/kZzFI+Vack4JBAGw=;
        b=RnHRPrbUTAseVuy23h00YtYSLg1UQJjZelskSnicwP0+zsQDRYSY11TLeoAG1Pt24b
         fepNchP3iLLqJfGayHAregFFwTiv4kR5w5AaOYQn6WfSPcB4+jAdgEdQfq0UBILcjr2Q
         0l/0Fdzm+Qd9hvbPEvDbLhda6UEkVO1VMmLAXcjm089jtRLpOyVveWmUITDNyXsbylut
         tTFS9+EH8b6LvzmL5K3UL7egiM3gDHZRvwpccFC+VapzCpaMJZst0AEYjFRe9hn3X65Y
         vYUWDu89A2tzRdPes6Ve3jYgPAx6JE79MUBJJBa2WJYxxgpIpgbytFmQsc/hDtEW57aN
         6ojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780651609; x=1781256409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hk6dqEzXaUYXStqZwWYUcnHHCz/kZzFI+Vack4JBAGw=;
        b=sL00GlNwCqVd4TlpQLDejK1e5bNt8Htaji+IjNIKZuPf7W8gVMvH+yMDoeXfM8nAVR
         pAtrn1tviMOGy5o5r0nm/oHDd5Q45U0wxyi5OrRmh52yM2mld/6LjsBUA5H93KuutVua
         ezgqo9OEj25fSNIGm5hI1YSa5HL/6exNgM7aZec7u2lMKCoOd2pTBmAZaIEzNyEN9lA0
         Jn+O8mCsmJMdPYMBQEq+YjtdiF30u0G16EVY5DNmKyACLg2uIu1bUvsNEvvW8L24dMkA
         rZURf/uVAMoP+FVE4WI7MpyCVo5eNN+jiQF9ZN31Zp7M/1FihGbNKxE8sAk+OmLi7Bvi
         e0ig==
X-Forwarded-Encrypted: i=1; AFNElJ/hjJtm/Gj4c4Pur0QSXMCEzZE0dLtpj28qkBIWc7+kOZFrHRL5g4TNE2D0Ewk/4ATB9CHRpM6leBN8@lists.linux.dev
X-Gm-Message-State: AOJu0YydONn8kzVpTB5QFkp8qOq1QZZj3or2/aKA2V3omNhykXIdG7B3
	OMVJxpSXVdiy6Ml/OAxI/YKUPMBuAe6VlrZ7eF3vXb2bZe7tqYEea990qySX3tLM
X-Gm-Gg: Acq92OEDV4uweCy0FdVNx23PUR9CaXFST0vZaup0wZ8VMvTRgd6TcUBMY9iX+I72P4P
	46uFtCtKON4FCIZ5bd05j5xRDIfTnBsve2xxKjP/0A0k0dYPpRRO5QZAy8w7HFrf1wBlnaR/2mz
	VEW9o2TJz6IvrQY8WihuXYhVW5RyiMwQGxkJG9qdcdQo1a2XC1fvfN+HEW7NSyFcWkkSJycr+pA
	XToZUCiBiAVMqU2IozIActG0rNPg99kMhPkv1x9VoP6MiBrjMYpyzDozjXDg0c/Sv1JkBhnzaKq
	u6kOoEwgN2R79T4ES+JVD9KBEaRVqTg6jEcOFvJlyLc3dqaOBYQkyhwk1tmoEKVyB0e7qjyc5ug
	TICcoAQ/piYavcREJK/LN/QDegynb3c/zFsiYgUGK4Ww4maiG7n/LLSPzZTcPVzhv3EO/MiJL/1
	+xKZb7h+WpJ0rnpvSDCjT56Jgerl6LpgBzBMET0xlLRDm/mskYv9dcEBHqCquzoKwwP9pUS+8En
	dl430uxRxD32/zofx0oqT+VabH6tN/qNCrynI8=
X-Received: by 2002:a05:6402:528c:b0:683:5589:4317 with SMTP id 4fb4d7f45d1cf-68fa4f2647bmr1360705a12.11.1780651609285;
        Fri, 05 Jun 2026 02:26:49 -0700 (PDT)
Received: from localhost (2001-1c00-570d-ee00-b91c-c1fa-ec67-8786.cable.dynamic.v6.ziggo.nl. [2001:1c00:570d:ee00:b91c:c1fa:ec67:8786])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6595c722sm3457524a12.22.2026.06.05.02.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 02:26:48 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd.schubert@fastmail.fm>,
	Joanne Koong <joannelkoong@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	fuse-devel@lists.linux.dev
Subject: [PATCH v3] fuse: add fuse_request_sent tracepoint
Date: Fri,  5 Jun 2026 11:26:47 +0200
Message-ID: <20260605092648.1506243-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new tracepoint complements fuse_request_send (enqueue) and
fuse_request_end (completion).  It fires after the request has been
successfully copied to the daemon's buffer, just before the daemon
can start to process it.

fuse_request_sent does not fire if the copy of the request fails.
It also does not fire for NOTIFY_REPLY, which fires the _end tracepoint
at the end of copy.

This is needed for tools tracking the in-flight state of user initiated
fuse requests.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---

Miklos,

Reminder, this is base on Linus master, not on fuse for-next,
because it is a candidate for backport to 6.18 and if you apply it at
base of for-next, then the new tracepoint needs to be adjusted in commit
"fuse: change req->fm to req->chan".

Thanks,
Amir.

Changes from v2 [2]:
- Reword commit message (Joanne)

Changes from v1 [1]:
- Rename tracepoint s/_recv/_sent
- Fire in ioruing
- Fire consistently along with setting FR_SENT, which...
- Avoids firing when request is not sent sue to failure

[1] https://lore.kernel.org/fuse-devel/20260527171808.828637-1-amir73il@gmail.com/
[2] https://lore.kernel.org/fuse-devel/20260601212414.1154139-1-amir73il@gmail.com/

 fs/fuse/dev.c        |  1 +
 fs/fuse/dev_uring.c  |  6 ++++--
 fs/fuse/fuse_trace.h | 22 ++++++++++++++++++++++
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5dda7080f4a90..2ad9aedc6237b 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1525,6 +1525,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
 	list_move_tail(&req->list, &fpq->processing[hash]);
 	__fuse_get_request(req);
 	set_bit(FR_SENT, &req->flags);
+	trace_fuse_request_sent(req);
 	spin_unlock(&fpq->lock);
 	/* matches barrier in request_wait_answer() */
 	smp_mb__after_atomic();
diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index 7b9822e8837bc..50f98e9a23a10 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -702,10 +702,12 @@ static int fuse_uring_prepare_send(struct fuse_ring_ent *ent,
 	int err;
 
 	err = fuse_uring_copy_to_ring(ent, req);
-	if (!err)
+	if (!err) {
 		set_bit(FR_SENT, &req->flags);
-	else
+		trace_fuse_request_sent(req);
+	} else {
 		fuse_uring_req_end(ent, req, err);
+	}
 
 	return err;
 }
diff --git a/fs/fuse/fuse_trace.h b/fs/fuse/fuse_trace.h
index bbe9ddd8c7169..c912253996b71 100644
--- a/fs/fuse/fuse_trace.h
+++ b/fs/fuse/fuse_trace.h
@@ -101,6 +101,28 @@ TRACE_EVENT(fuse_request_send,
 		  __print_symbolic(__entry->opcode, OPCODES), __entry->len)
 );
 
+TRACE_EVENT(fuse_request_sent,
+	TP_PROTO(const struct fuse_req *req),
+
+	TP_ARGS(req),
+
+	TP_STRUCT__entry(
+		__field(dev_t,			connection)
+		__field(uint64_t,		unique)
+		__field(enum fuse_opcode,	opcode)
+	),
+
+	TP_fast_assign(
+		__entry->connection	=	req->fm->fc->dev;
+		__entry->unique		=	req->in.h.unique;
+		__entry->opcode		=	req->in.h.opcode;
+	),
+
+	TP_printk("connection %u req %llu opcode %u (%s)",
+		  __entry->connection, __entry->unique, __entry->opcode,
+		  __print_symbolic(__entry->opcode, OPCODES))
+);
+
 TRACE_EVENT(fuse_request_end,
 	TP_PROTO(const struct fuse_req *req),
 
-- 
2.54.0

