Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EB73876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723536; cv=none; b=AiFQZYhzsIWnfivNydJznZ51VH6vmmNQfuiYMQabAxdymDregi3rs6zlcDwOXE743xTUOnV9vhiT2cjMbAECbGkci+BLoq/yoZLHtg7sVYwMO/3XJU4qWkXmrfEdlhbXz2Z6yf5NHXLXIgCLXMyRx1ls6oa/coorl6psZejg1ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723536; c=relaxed/simple;
	bh=LygwaPByjak78MEfN5CVcUyhIo4fYvb7Cns8UmYWS/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gP+ALsHCgIQysgo+p1ERUHITgh+XFNG4sS50BpGnHBn7r9A11oJgWcp0aDHlliEn60SzWmVCuEzoy5WSiTLhNln1Tk9nGRVUMX/cIMP2bVfEwf6n96xEVGHDUpHnGdn65O+zAI9vzIWEWKezMqXziKHDaqp1Al3LMCFHpqCEBFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie534MhW; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie534MhW"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso867304b3a.0
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723535; x=1777328335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKNmSt3BddMJtMpcVnNouNHB93dXJVe9xWFU8U5IDqk=;
        b=Ie534MhWVE9Zx9x4mAQuvZQl7y6zn0AYDCfnMJES2oQY2kej5k6smBspqibLAdwZ+/
         P8h4fKROg+CAuY8p8Jl0xUvPrd+dXBL/khgxXFVLZ693gpDC3QOu+j0UKuEeK4Wxns7A
         H4sYgYx6BkLSCW2XZKQnKx4XNtRNA5hla2di7kStNAvbEjgtIXst2yiT5pg/oJDeAd5Q
         YYvil0zLRF9xxGFEW3MfmN/ZhVqWrmo4Q3Ql1pgTKZe/drc377JTpvf0VqviYPpGQS1U
         xuwr8pBSiVZ6tZBkz2EqpaLPUiqZeSviAVWcMcRIJHZU0hrddkUnFDCSN9bwE5RLO0Jr
         22RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723535; x=1777328335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gKNmSt3BddMJtMpcVnNouNHB93dXJVe9xWFU8U5IDqk=;
        b=sEapm+JwDWeV4JMlyu+PMA0hSTF2s4AmvgLILNciWFHgMp7cRU9AGGstlVj/UDYrnn
         ylt6xocfNrP6bTT76XC6zt5wcxzg0OW94p1+7Qj9HdvVaWE1zKslIvS50KFJ8rxYgAHb
         /DzXWYbU9kkgduKFycnAjfewzHmphV0Oms8T9hE8FH1z/frp9au3I5uFtJXki8mmCWaZ
         EhsIxI+UyfVdI0d6q/wFu9wS0VH9cjJS+iYlxW+dxizFyjdgIEwogHeLFr9y0VZit5Tb
         nxlSdXWI1OzTUFU4Qn7WL1vkD4BiNAGSAKQrlnaSpMPjFwBKu/NJn7xdZglWPM8FajJQ
         kb3g==
X-Forwarded-Encrypted: i=1; AFNElJ/9c2kYK4KMt/5NcnyDuLZHg4mDk35qPu2dDU3BMnWaX+4XhOFIGUXtor69lmeogmIs3kncENf+iyGe@lists.linux.dev
X-Gm-Message-State: AOJu0YwGEXbZ1nykuxfeIyufMM7QFKpag6+aJe49nHtuk3WtESY5WVcd
	Opi7EQBoeW4P1bTy5fbTZiirbfAhVbE0/79tMWY3rpvPLUCpk05UV5JfIGmM6Q==
X-Gm-Gg: AeBDietSMZK1puwiQ9SnIyuk/gufC/WL4tGiDZ0ZSmYKeJYW1c6APxOkbbOEPwmc6e1
	EEbKQx9Oh/JKQu9dcTrUbeFntL3RFK/6SM/4D9h+dRZo+CH44exMubvawWsZAIroHmczU4wWqq+
	+tzViI71Qal204R2HuywgIhHMg07JruZqLiE8WNKAWUlFLnNefYKbr4dFzCZFzP6CqDSaRpicLE
	TEdQ+A3Bnq/+ChuXdPvd2w7MqFyb+r21u4qswXv19SJUNyQbrP0WjSB6MDF035ieqGt09PDmx1S
	XijVWgMOwg4TywhaNmDoLmFoxubLy+Cq4TsAoVsLphUBtUJDrT62thCjqb7V8Sf+/shtuAEmU0Y
	0XLkbN9Rp209uhjYMtHLUGZcew0pAtrmWu/Gvm1K/6kKT1Bb8kY7P78mAUf9bW7dOpmCw/GGAQB
	ipgJla1TkLUf0VhRqP8v1Te035Em1k
X-Received: by 2002:aa7:88ca:0:b0:82c:d9d0:f482 with SMTP id d2e1a72fcca58-82f8c976ff1mr15854988b3a.46.1776723534865;
        Mon, 20 Apr 2026 15:18:54 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:45::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb38ddsm11208173b3a.34.2026.04.20.15.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:54 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 13/17] fuse: add passthrough support for atomic file creation
Date: Mon, 20 Apr 2026 15:16:33 -0700
Message-ID: <20260420221637.2631478-14-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260420221637.2631478-1-joannelkoong@gmail.com>
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Route FUSE_CREATE (atomic create + open) through fuse_entry2_out when
FUSE_PASSTHROUGH_INO is enabled. If the server returns a backing id,
the newly created inode will be associated with the backing file for
passthrough operations before the dentry is instantiated.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 44 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index e5a7640fcd30..637761de2c5b 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -929,14 +929,18 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 {
 	struct inode *inode;
 	struct fuse_mount *fm = get_fuse_mount(dir);
+	bool use_entry2 = fuse_use_entry2(fm->fc);
 	FUSE_ARGS(args);
 	struct fuse_forget_link *forget;
 	struct fuse_create_in inarg;
 	struct fuse_open_out *outopenp;
 	struct fuse_entry_out outentry;
+	struct fuse_entry2_out outentry2;
+	struct fuse_statx *sx = NULL;
 	struct fuse_inode *fi;
 	struct fuse_file *ff;
 	int epoch, err;
+	int backing_id;
 	bool trunc = flags & O_TRUNC;
 
 	/* Userspace expects S_IFREG in create mode */
@@ -958,7 +962,6 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 
 	flags &= ~O_NOCTTY;
 	memset(&inarg, 0, sizeof(inarg));
-	memset(&outentry, 0, sizeof(outentry));
 	inarg.flags = flags;
 	inarg.mode = mode;
 	inarg.umask = current_umask();
@@ -976,8 +979,15 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	args.in_args[1].size = entry->d_name.len + 1;
 	args.in_args[1].value = entry->d_name.name;
 	args.out_numargs = 2;
-	args.out_args[0].size = sizeof(outentry);
-	args.out_args[0].value = &outentry;
+	if (use_entry2) {
+		memset(&outentry2, 0, sizeof(outentry2));
+		args.out_args[0].size = sizeof(outentry2);
+		args.out_args[0].value = &outentry2;
+	} else {
+		memset(&outentry, 0, sizeof(outentry));
+		args.out_args[0].size = sizeof(outentry);
+		args.out_args[0].value = &outentry;
+	}
 	/* Store outarg for fuse_finish_open() */
 	outopenp = &ff->args->open_outarg;
 	args.out_args[1].size = sizeof(*outopenp);
@@ -992,6 +1002,8 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	if (err)
 		goto out_free_ff;
 
+	backing_id = fuse_process_entry2(fm->fc, &outentry2, &outentry, &sx);
+
 	err = -EIO;
 	if (!S_ISREG(outentry.attr.mode) || invalid_nodeid(outentry.nodeid) ||
 	    fuse_invalid_attr(&outentry.attr))
@@ -1000,16 +1012,26 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	ff->fh = outopenp->fh;
 	ff->nodeid = outentry.nodeid;
 	ff->open_flags = outopenp->open_flags;
+
+	if (backing_id < 0) {
+		err = backing_id;
+		goto out_queue_forget;
+	}
+
 	inode = fuse_iget(dir->i_sb, outentry.nodeid, outentry.generation,
-			  &outentry.attr, NULL, ATTR_TIMEOUT(&outentry), 0, 0);
+			  &outentry.attr, sx, ATTR_TIMEOUT(&outentry), 0, 0);
 	if (!inode) {
-		flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
-		fuse_sync_release(NULL, ff, flags, false);
-		fuse_queue_forget(fm->fc, forget, outentry.nodeid, 1);
 		err = -ENOMEM;
-		goto out_err;
+		goto out_queue_forget;
 	}
 	kfree(forget);
+	if (backing_id) {
+		err = fuse_inode_set_passthrough(inode, backing_id);
+		if (err) {
+			iput(inode);
+			goto out_sync_release;
+		}
+	}
 	d_instantiate(entry, inode);
 	entry->d_time = epoch;
 	fuse_change_entry_timeout(entry, &outentry);
@@ -1036,6 +1058,12 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	kfree(forget);
 out_err:
 	return err;
+out_queue_forget:
+	fuse_queue_forget(fm->fc, forget, outentry.nodeid, 1);
+out_sync_release:
+	flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
+	fuse_sync_release(NULL, ff, flags, false);
+	return err;
 }
 
 static int fuse_mknod(struct mnt_idmap *, struct inode *, struct dentry *,
-- 
2.52.0

