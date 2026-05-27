Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD4F3EFFCE
	for <fuse-devel@lists.linux.dev>; Wed, 27 May 2026 17:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902293; cv=none; b=nmflZZTX4lD2bjTmeiPA/yqR8/NHhNs/f15DSDPx3evDOqv7IqNdFtMWZfbpflNxSxU25QvzxhciRLr237jo/jmEI1uxybsDytJFJl5KS41ZhfL4MnV1Tjl5MK2dFzaHrvjMS4JtTLk7lBM8DJXLDr7zvJw2DPsiPOxL4QFv95g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902293; c=relaxed/simple;
	bh=qOp65fq3N2X7jRLGjAaYL3032PKZKswgZ/zSZ6If4Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I5RLPZOC/aPqN7psMbGttabKolab3y9PBP0Vw78eviYcIubJxfhX6dPRHqLw9bmFFsUTrkrCKEXXk9snL1KuMQbpaBf+HaZj9wuHzZ00r60yoSl/PWnWVZ2q/MCMB+XjDcCAK5P/lt1ryHBqhtmch38JykafAwtXln6QDlG9+ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rdMTS3D0; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdMTS3D0"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bd2087858c4so2150018766b.0
        for <fuse-devel@lists.linux.dev>; Wed, 27 May 2026 10:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779902290; x=1780507090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DaXUe2oRlTFZsgauDYmOAtm3bxFhmPRX7HfTi9MJO0U=;
        b=rdMTS3D01Tdb0SwkCgHJDe+1/+CoRnPOqKFTKLdLaYye1c1J36iBs1p+YpsC+KnHwZ
         NmqUTotml1c/OhveptWezSiiYSapJOBSa5EIJm7DretWNo8HVOKJQy99YYE3LmYFQh94
         LB/x9K9upfTIzs2nu9HiO3DAK8MTN7sCXsrwlVEJPv+FIASuAFjlqxJXxmk9FSPnuc3u
         REJXgxDJIxJle9gYudzkwRyhmD0wsUZAp4dlxF5+21IqWRl0x7+l+lBmp0WTmwpLkK9R
         yRUyHxi/Jov+ElaC8PifRpNsM+cGBfPag87O9IbROTReFihoSnBcih1IwWexUcc4DCSa
         cCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779902290; x=1780507090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaXUe2oRlTFZsgauDYmOAtm3bxFhmPRX7HfTi9MJO0U=;
        b=hlJH9wbzgfuBBa1BEKxd7928sxHUlD0agRhNECC4i/bCZYF7k5Wu73tamZELL8rj70
         QsYIlS8lqY8vcjv5Y63gl3Npim+1RnraEQ7GQWQ8DC6iCmvMKoG1M9byu2tJ8iKxFWWE
         HdgOvlMRWfd3lfk+RqXAONapgX4Y/E0rXraiflEwBhvrrMCLA2Mfgt+aJ4EmU3IXqFp1
         8dQWSH3zS/H9S+i9/1rN9eGkkjZI/JBtVucHHkU/Ft8hR/lMJckaqX7ZcGlKznzur2v9
         5Xftr75pYjytE3OFPrjX7N/8BopvC+U/0Oqj9u+NE0Q8glBDDoMkmkUpYubgH026WXHQ
         2JyA==
X-Forwarded-Encrypted: i=1; AFNElJ/xxalFuoHLv6UptCPdfimegUxgbXvw0U/lYlzNK6mTb9mEcUSTBcjkNqPB3TikMom9RDpeyhHa3Vd9@lists.linux.dev
X-Gm-Message-State: AOJu0Yx79WwAa+uTpJI02NY8OSfOb5xey1c00oNEnXb61vLzHAid9Jqg
	np+3Ujc4lgR39SEMT95t/jt1jSPv9Ez5juPc23EV9t1AWY6NdqdOZVQ9
X-Gm-Gg: Acq92OE8R63ZNoqKaH2vuEK/r6nb2py/rUpCX4JHSK41UsWCo//iUsz0BjaxS1ul1Tx
	8YhtRrXaDFpfYyjKoQcsy7I9ZABPKpfTfD5+bq9OI7QTRdekkqjfF7SK1+8GDqiorSW6ySx7hpK
	uo+8frBTU/0Iq59ujWZ2i2wpnoyODNAj3fCOCfQa3rOjLuienyUHkCQ7LAdyPaLTqLTK9SEGhlp
	UFUQ8zBf6iuLZzU3/uXFEkZt8b9C8ITWD7X8cJjWXOvYDf1ldNLNyYQBW+brh6Yu924yOO1R/fy
	2reWX6B0GBzB32Fhpm1Jm+d+uxHQDw4n9Nal2pPxWvBKspKZy3Hnt4sFd5wjLlDnnvo9HqS06OG
	y3+jC1oFw7OFeQmEiJu5AQ57xqIFT8mEGaUd3znVatCdTPZdUzSQySJ5cq9Cwb6Tb5J6VARTqci
	Aqg1Vr7W/fg/aAX2agxolAYEH1whkyDM5RJTXHWSOUK3OkSMhgo9p4xBff8pE1yxeHhA+Ck3Ib/
	l6it/5+k8r6PxE5AGRVzj922dzw1BSbfSy/wb1qykpv8rGMwQ==
X-Received: by 2002:a17:907:c081:b0:bd9:60d8:6609 with SMTP id a640c23a62f3a-bdd25aeec87mr1635063866b.13.1779902289646;
        Wed, 27 May 2026 10:18:09 -0700 (PDT)
Received: from localhost (2001-1c00-570d-ee00-cd3a-6e6e-6aae-81a1.cable.dynamic.v6.ziggo.nl. [2001:1c00:570d:ee00:cd3a:6e6e:6aae:81a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc61de4c4sm635620566b.42.2026.05.27.10.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 10:18:09 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd.schubert@fastmail.fm>,
	Joanne Koong <joannelkoong@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	fuse-devel@lists.linux.dev
Subject: [PATCH] fuse: add fuse_request_recv tracepoint
Date: Wed, 27 May 2026 19:18:08 +0200
Message-ID: <20260527171808.828637-1-amir73il@gmail.com>
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
from "pending" to "in-progress" at the moment a daemon thread dequeues
a request from fiq->pending.

This is needed for tools tracking the in-flight state of fuse requests.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---

Miklos,

This patch is not technically a fix patch, but it complements the
tracepoints that were added in 6.12 by commit 396b209e405a5 ("fuse: add
simple request tracepoints"), so it is my intention to backport it up to
6.12.y for use on production kernels.

I came across the need for this tracepoint when working on fuse queue
monitoring tools [1] for our production env.

The fuse_request_send tracepoint is broken on 6.12.y, so I also plan to
post a backport patch for 0d375a1385ed8 ("fuse: capture the unique id of
fuse commands being sent").  Not sure why it was not tagged as Fixes.
The existence of fuse_request_recv

This patch is intentionally based on upstream fuse (v7.1-rc2) and not
on for-next branch, with ease of backport in mind.

Specifically, commit 80cea98b648ba ("fuse: change req->fm to req->chan")
on for-next needs to apply the same change to the new tracepoint as well.

Would you consider applying this patch at the bottom of for-next and
make this adjustment to your refactoring commit?

Thanks,
Amir.

[1] https://github.com/amir73il/bcc/commits/fuseq/

 fs/fuse/dev.c        |  1 +
 fs/fuse/fuse_trace.h | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5dda7080f4a90..583155157d117 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1475,6 +1475,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fud, struct file *file,
 	req = list_entry(fiq->pending.next, struct fuse_req, list);
 	clear_bit(FR_PENDING, &req->flags);
 	list_del_init(&req->list);
+	trace_fuse_request_recv(req);
 	spin_unlock(&fiq->lock);
 
 	args = req->args;
diff --git a/fs/fuse/fuse_trace.h b/fs/fuse/fuse_trace.h
index bbe9ddd8c7169..289a279b3c312 100644
--- a/fs/fuse/fuse_trace.h
+++ b/fs/fuse/fuse_trace.h
@@ -101,6 +101,28 @@ TRACE_EVENT(fuse_request_send,
 		  __print_symbolic(__entry->opcode, OPCODES), __entry->len)
 );
 
+TRACE_EVENT(fuse_request_recv,
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

