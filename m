Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E0335E955
	for <fuse-devel@lists.linux.dev>; Mon,  1 Jun 2026 21:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780349059; cv=none; b=ijGpDVU6XqfnI3UUIb2SVqX+iJ66kZg4HB1XX/WaH5jg8XfbH32KZKyLxm7i890i2j4p8VWYL03UFKePL1JT2il9hvpqFYlr0LEypgsSjALRgSqP1I1ASUBmocE6t5W0MTAKTt8o/WdqMIpqcqtq16+XvAnME1r6ZNG8gpcQtd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780349059; c=relaxed/simple;
	bh=M/AQSfpLYbUkfWvA8LVuE3DHA8ZzyGRgVlJUmoPbuJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ISWBZcrHrzTIq7FgVa6Zz1rQdy9rE/dixV90j8ORwGyNjKIGB9lH1mvzt1l7HiDV1FFDTk/w3VS2TXMzmwrhKLoLAsdBS4WpS1WMItp0JBkeEZa31C1tjozEcY28HNQ66jpzycWTSMjw6cy0LqIW+D02AhNUe8tj807E1XQGY6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlVpJVZj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlVpJVZj"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bec449d0af2so217283466b.2
        for <fuse-devel@lists.linux.dev>; Mon, 01 Jun 2026 14:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780349056; x=1780953856; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EZ6WdYWl7nIhTsbxd0+n9XCSw0Bp5weFTpIC8P63STQ=;
        b=DlVpJVZjnDS5i+bjKcxfCfNpzmubaxYMBCqCJOC/tJorMNuFXaKjsfcpHbbQWxRyCd
         U7Mk+TUHJTMbqnhJIqp0JNN9F6Kr0/cj3v1e2QWrAdhmVElmGFZdZKEJsGXAL77pgHti
         iA24xVnwK7ngWJEOA2y7secBRPagF1379uTfbGSgYrFQDzv+nQDWtiS/8/jYmYmzjhFB
         x+X29Ed6wHOYLZIQhV6S9MKDv55kBUNt1JAisXJGRu2Vv6AxVt4JNz8iqF/E4PWm4ufk
         NhXOZCKwqq2N0CSulPTDkdhFlis/hnb/NCh1T88rnYizn+SDnLlEdsOfKzNSMWKTEf9b
         tnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780349056; x=1780953856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZ6WdYWl7nIhTsbxd0+n9XCSw0Bp5weFTpIC8P63STQ=;
        b=NSbdAGoasFAo/aGZBQqWPsBd/jonjxKxagaemOT6A2tfC3ewG0VwGLhfxIgvtZMk3J
         roX9OG86d558BzILANxHjA9lC0uvzUlHDNZE8GGIUyFKwrwRo9XWm/Pb0/1AlUf+awAD
         ej69S6bcHtR9Xm38TaJh+Fj+0X8br6dEOfm0DgZyBCydH95Z869JC7ELA/toQ3R8CMLg
         mU0mQcVkvP4RvT49Z1RzbNlVaoO61+RCDeYso9EFC7v81+Rffgt4MgHg9K5+hnFGgf6w
         Hz78Jg2bBnaI3WVTnE7bcELfrxNCUCs+j/YUB76iLVr8uNS1JXzvssYMqxYRyfhbczEZ
         r0tw==
X-Forwarded-Encrypted: i=1; AFNElJ+BU+K1BLrjGMEeShhfHc3jSpJBXnXlJShfnA9ISFF6/bM+MG8dGFFL6Txj5F7i9v/fvtJuHg2OaPt7@lists.linux.dev
X-Gm-Message-State: AOJu0YxeZLM37NH3gIMo1uAHVHDzCyoGujAFIjiv7M+c/+HNyn14xWLf
	SOWgNiwj50CGQq2+pSogLUvXTG6vK/Wj1NJFWJ6t/xViCsVsf4H45RSl
X-Gm-Gg: Acq92OFpTfUvF4rWAcp7GEB+79g/vfSj51cJShHZZBniW2lIoeWb5PcuwCQou7Chz3B
	NjyjHXzfoWZktGQGSxm+50XTMS6szal7PgFVqwTx56nzhfuEiVj/qiiCUG00q0Li6z/v8vE+ssc
	pwljB5uBK8jpInv+BmLeSfwVw6Ql+WscNJOA3zSk2eKQaBQsg+jv01FonH4qNbzb2Ulll+pwttn
	Z0dq+TazCoBKPMaSkUfmf+fKcE+WzyiKS9XqP3GlGfB4p+nFfp8/3YM9+c8BdgaZ47xKP/E+cW8
	mdXZ6L4EDVuJouQdhA7KiLVfcQNxMzTN3r71OlpnhD4bXcEWA/vaWOSGHBExmB8CYj/O+UvBmVU
	HAvODJJBUut5ma45FoU6MA4hAz5e1pSFWIrdcqFIM0PMTY5CJOkAbFOdbMx8LB3rdwjEytwBgps
	Eg5Gbc+UhGUqHWShAhjKOhgu1AZBzIxAPXUHSjxvPdQrAClc5AztqLAZYsfy2QvGER1pdL0J6nC
	HQpsRBdDzITWWbyY4DZPgv76YQjC6dV7ZwUMCo=
X-Received: by 2002:a17:907:d02:b0:be2:dd37:facd with SMTP id a640c23a62f3a-beab4339068mr738059666b.20.1780349055756;
        Mon, 01 Jun 2026 14:24:15 -0700 (PDT)
Received: from localhost (2001-1c00-570d-ee00-fb4a-4b87-a6e0-eb91.cable.dynamic.v6.ziggo.nl. [2001:1c00:570d:ee00:fb4a:4b87:a6e0:eb91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-beee6b6d623sm39927166b.36.2026.06.01.14.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 14:24:15 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd.schubert@fastmail.fm>,
	Joanne Koong <joannelkoong@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	fuse-devel@lists.linux.dev
Subject: [PATCH v2] fuse: add fuse_request_sent tracepoint
Date: Mon,  1 Jun 2026 23:24:14 +0200
Message-ID: <20260601212414.1154139-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new tracepoint complements the existing fuse_request_send (enqueue)
and fuse_request_end (completion) with a tracepoint at the transition
of the request from the fiq->pending queue to the FR_SENT state.

The fuse_request_sent fires when a daemon thread reads the request.
The fuse_request_sent does not fire if daemon fails to read the request.
It also does not fire for forgets and NOTIFY_REPLY, which also do not
trigger the _send and _end tracepoints.

This is needed for tools tracking the in-flight state of user initiated
fuse requests.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---

Miklos,

On v1 patch review Bernd did not like the name _recv [1]
and I did not like his _enqueue/_dequeue suggestion,
so I picked a new name (_sent) which nicely aligns with the
request state flag.

It also made me realize that the tracepoint in do_read was
premature in some error conditions.

Thanks,
Amir.

Changes from v1:
- Rename tracepoint s/_recv/_sent
- Fire in ioruing
- Fire consistently along with setting FR_SENT, which...
- Avoids firing when request is not sent sue to failure

[1] https://lore.kernel.org/fuse-devel/cc8d9d33-444d-4c5e-9def-428794d87f3d@fastmail.fm/

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

