Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8220438E8DD
	for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787670813; cv=none; b=ChkMG/Ye0nOmWyOqb6mNNOtUPrdoTjmLV3xXnGvmwFNPCREm7pqoVpBmq9zLXlhNqes4qyg1nq69TgFZ+ifn7CExWyRv8OvzuTEmW/6WUdtFYiU5NEnboCTwVZOPoq6PSPyNza5YO4EL9aO6lgCIX6Tcb3p3t3rQxUFLvXAnkuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787670813; c=relaxed/simple;
	bh=NFunFJ7uwJXyeF5vJP1aHO0ncWeGCF24sGk1Iaez/bg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=XNMnA3JnTQIA1XcvikOEyIs1QPoD8aPiLAegKnZEGT2Fwcxyw6ZbFNEGn9En4CcF4qzSFfjP9WVDvHOzek8aznIoh0YOmI3ZC7PHjlB5zIC0vrOLQf6UPSWZysJzIjwEraqT5sARLqIsYBL4iGvYFO2MfEnaDd++rpB8czS1eFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LViG3/5u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LViG3/5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787670810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pb1lrVwC0Q2i3xu4WeaMwgleo+6m2W+6WXTqnGPtgKY=;
	b=LViG3/5uPZYuMMqvf0nEHNaGZfWYuxXSKN0I1zld/hGSckmIh4EglL6ERdWMk+m0HKT/KW
	fUntuf8yCtF0fJTgpvrC8l66AFsZMWipvx/vTG2HJyGP4YigKs+Z2zI5H7Tvmv5mRxE65B
	X1Fkubdq5uv+5WadcJ581EagI3KyERs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-QyJ8tav2PoiKz7echIu3VQ-1; Tue, 25 Aug 2026 11:13:27 -0400
X-MC-Unique: QyJ8tav2PoiKz7echIu3VQ-1
X-Mimecast-MFC-AGG-ID: QyJ8tav2PoiKz7echIu3VQ_1787670806
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c15cec1ccb6so412701766b.1
        for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 08:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787670806; x=1788275606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb1lrVwC0Q2i3xu4WeaMwgleo+6m2W+6WXTqnGPtgKY=;
        b=DzW9Y0+Liyqo1Kr+JJn9nUNWCNB5Eio5IP5i35HTaa/QRW9tcprmdrbdSS1FB1Mh3C
         KvG7AjquFryASzK75A33JeVYxpKfHHQgBmORR4z9B212QVEKfFGUr14jJm/82oPByz3w
         TytSh77euHpWci74YyqOBLJPcdvsoTGdrAlpEay+9C1b2CHUfvFrFrV/c81eYsZFmxxc
         9GQnSJBJVZXgvTDr5bgwK6MUmy4hRD3mCL3kk6qBpkK41AUyVXjA/kP20iVNgpRDv0oV
         VpluozZdvotYM/F5Sz89qz6I3YYzYhjM5IYm2xrib4yD8blxGdDG7sFyU0M6CIAokaxM
         wc6g==
X-Gm-Message-State: AFuF++lW/6ERRhljIxPYyn794CqkTe80YzGkpIUgHifnneBgbOWbqFMF
	i2bjLlw3PnaaH6LMSjkhSFOv9jWGYgGOi+Z6MmF3+0vg9birh+VM46H3pUwgo0Q3Gvf/luxk4Va
	G9O/IBJqD5MmkJWOaz3rN9VfarkUQxfSq7fhTOlcvf4RWaV1egocAfE+/aKZ2up0K24BQyl1wps
	5lQkgOc7TYTYfFPTAaIgjTGWpbAPJW8AZCHTD8WeT4jb0gKfQ=
X-Gm-Gg: AR+sD10PQ1lrEid1PttN9keMVCmrw/vegILFfJl5hdWN+v++I/aYEKpdrOX4KQ369bl
	ZKQGuSFxFayICgtWzoqfyDEMNr/l9a5lT1/urLmtMFcHgCx3oKOXTVahipUZlq/edwCtwEASp13
	cMvjgqRgAjarRy+10wrbGL5uBNZzqLSqBSDoL0wWyBg1HjKrrwQu0My1j8sqVlO6LTFtMXz4zDr
	jEpIwaycb0gup72relKTyxrtO4Hoe3Ufrnb93dgIxfeXrNkNSbh3m9wL8kWXzYXGw3buP4LoixS
	2HKNsdrBUYXoq52a4g1rs4TdMqLJ8ul2NfaGVam8jou3Tc/pXIymJQj9kAtnnEIZlwSsZXE5Zsn
	ioSbuplkvOPXl0fYcF54pDUqnaWNO8Zzk1QAM8Q/QEafJ6nr++MGdhpENA7iK
X-Received: by 2002:a17:907:5c6:b0:c21:96e8:578d with SMTP id a640c23a62f3a-c24e5fd3199mr1006238166b.15.1787670806434;
        Tue, 25 Aug 2026 08:13:26 -0700 (PDT)
X-Received: by 2002:a17:907:5c6:b0:c21:96e8:578d with SMTP id a640c23a62f3a-c24e5fd3199mr1006227866b.15.1787670805912;
        Tue, 25 Aug 2026 08:13:25 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (193-226-213-226.pool.digikabel.hu. [193.226.213.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966fa8aasm1924716166b.34.2026.08.25.08.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:13:25 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: David CARLIER <devnexen@gmail.com>
Subject: [PATCH] fuse: don't fill in.h.pid in case args->nocreds is set
Date: Tue, 25 Aug 2026 17:13:22 +0200
Message-ID: <20260825151323.836634-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cxSiFXC56wBD-bOFb3O57KN-JKea4c3X7OSXpjF9hTA_1787670806
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Commit 794e811d1443 ("fuse: split out filesystem part of request sending")
alters the pid sent on force && nocreds requests.

Previously these allocated a zeroed request and skipped fuse_force_creds(),
so they went out with in.h.pid == 0.

In fuse_fill_creds(), args->pid is now set before the nocreds early return,
and fuse_args_to_req() copies it unconditionally - so writeback, release,
and DESTROY requests now report the triggering (often kernel-worker) pid
instead of 0.

Move the nocreds check above setting args->pid.  Also remove the
WARN_ON(!args->nocreds) from the !args->force branch, since it's obviously
not going to be triggered.

Reported-by: David CARLIER <devnexen@gmail.com>
Closes: https://lore.kernel.org/all/CA+XhMqye_NBihcadRTU=w4xAfrdY9rsMB3oHF5+bwHukkjHMoQ@mail.gmail.com/
Fixes: 794e811d1443 ("fuse: split out filesystem part of request sending")
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/req.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/req.c b/fs/fuse/req.c
index a01ee743d31e..51cfd64ea1ba 100644
--- a/fs/fuse/req.c
+++ b/fs/fuse/req.c
@@ -10,12 +10,12 @@ static int fuse_fill_creds(struct fuse_mount *fm, struct fuse_args *args, struct
 	kuid_t fsuid = mapped_fsuid(idmap, fc->user_ns);
 	kgid_t fsgid = mapped_fsgid(idmap, fc->user_ns);
 
+	if (args->nocreds)
+		return 0;
+
 	args->pid = pid_nr_ns(task_pid(current), fc->pid_ns);
 
 	if (args->force) {
-		if (args->nocreds)
-			return 0;
-
 		if (no_idmap) {
 			args->uid = from_kuid_munged(fc->user_ns, current_fsuid());
 			args->gid = from_kgid_munged(fc->user_ns, current_fsgid());
@@ -26,7 +26,6 @@ static int fuse_fill_creds(struct fuse_mount *fm, struct fuse_args *args, struct
 		return 0;
 	}
 
-	WARN_ON(args->nocreds);
 	/*
 	 * Keep the old behavior when idmappings support was not
 	 * declared by a FUSE server.
-- 
2.54.0

