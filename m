Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A116E3876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723534; cv=none; b=dmb+keQBEkb+MBHcY9A6TL7V+zQCG6JSRlO2VGaR5nKPll/kY82+1k5TiLHv+kIfu6ofGUx/VhLe01KhmXMAhaKl1KJsJXT0NtEfVGpCpx467Vw8NoYTPxY6Ck7DfSMlsmpe5sEnxtrMj9NB3DN6jm0FXk6N/Dj1deeyBcz+s2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723534; c=relaxed/simple;
	bh=B+7I1MtOHlYRCQYn1HyzxkUfPNBj7rb0kvwpVpp5eYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KTVevMudKccRrANfvtQpmdCl9NsXzyKBOWezxUOTAu3jh5OqM68DUZp1t6+etn7F0q7NKq/AaLWyfhbsjY9po+w//gPsrd3GVmU6lyEMTedXmQX25ngE31XJTC5HTtVnK0UtTsJ9zbiT3XA5U9hTb3PU9o+imsVhQqFfbMt8Wd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rqq1jl3J; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rqq1jl3J"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-358ed696623so1598919a91.0
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723533; x=1777328333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh524YrZ8ZGElMNUrHqyoHtQs1I43L9/xkMSHnzUnUo=;
        b=rqq1jl3JRP2urgf3DegRS3d8TVrfL/e/gtuFbEOHKxlsXAvEErT1KLDuUhANcCyasb
         KJ3KywP+1Iy5dkNh6sFCFGKc1+GschNn3P/w2aC1i/6FG0WJGlrOpTeERdUlxEw9Ezn5
         M3m7xYIGZc/ojdN0wKL5WWKcmvdiq9IRTwh0aJozHUTwgYF6zUEcImGqeNsBgwV5Z+Tj
         BIw95jvyplN8hJBS85DQVUfXXW2aWPT3JrpS5bAJnd7ifmnD2GZqtMnYSyByG71QsOkV
         nxlN2bMG5c1iAt29X/Zhbg6bn3H4NcX/QvMomODB0CcLVuTT3dONvZIQebHhALOl2pbP
         GrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723533; x=1777328333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vh524YrZ8ZGElMNUrHqyoHtQs1I43L9/xkMSHnzUnUo=;
        b=ltVnqvAneHgPssjjEPjJmQGHnzQSEF1SevVnVLN8vu9jY2bG2GKEo9EF9TMxYIqbn+
         zvve47qXbqf3K6KwS13VsjO7gdhp91ooo/vcUriUtjE6ZxiB/rITTlGkv6/biVEk3jQS
         lbdlypo1SZfaIai3P86I7vjCi9ZIuo460FlqhcIyImz5e3lkWZlMDvjazTVn5vAI3Ykv
         PrazJ8jSaYeAGje5SvRMt7f0e425WLe95ryqO3pXhNssKlPBuuv8m5bqOEkfKquJRtm0
         HOLiNkYpZnfMatKEv7YG1D1yOHhsfUiO1GPecJDkKmm5NyRQxqwhjqGb7wwXonwYY1VZ
         8MnA==
X-Forwarded-Encrypted: i=1; AFNElJ+aM1W5IMh1nwJIxTmb/I8mEfUtvZp+SnBXcO4zKATmh0jLe8WWugnD/4zvPjxWXKrIZg9SKpaX1wWY@lists.linux.dev
X-Gm-Message-State: AOJu0YwuKoAxmDwE/4Iyqccey7XxwjI4/0CXDMUaLUcuG+f7IoSTSZ13
	9DWILXqaJRAqzLnmwBL8urCxoMNHfmYUFcphk2XlAoSgJNzhAGzaTO44
X-Gm-Gg: AeBDietWs+B5S1nxTYlgpFJ95tEyqD2tXICnz4IZA3afaio98aFC0w/Cp7UwnZ/9+Ql
	4ykOI9ywk+YRT7MWAROUMQhTmA7Zjni2IHPgH5/3Y5L9KXqA97bQ0VNUeTe4OOaChV2V4t/XQ/J
	M8wF6NmRnkIu1mdpO7jObyJOIYsvhbwYNxDuv8FT6xBFvW8q2zWoBCUWdHIzUu2KLoaARCVhUjR
	lh0r2uI3TYcw+3tHVB1KWFfUXCLrsMbjAnB9/gm/Mciu889F45DKeOzuFDs+avzKlnIOC56KQT/
	oA4mhMceQ8LGoArMPW1blEQaxn5MuOzVp0s7rbCQjDL9v0MJKGQNlo4rbGqwfV0iSG1MC30yFsp
	zTs0GuixIXEMdZDA0mUHIdhvOpdWr+3p+W68/X2wf+fg/qGHj0HVtD/lxwmJL7h8AUsctNAbPGb
	iLHHJBh3Epu6YAar5dnSMdNqaGErhe
X-Received: by 2002:a17:90a:d40d:b0:35e:27ec:de0 with SMTP id 98e67ed59e1d1-36140462a99mr15680365a91.13.1776723533054;
        Mon, 20 Apr 2026 15:18:53 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5a::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141869e88sm11270243a91.1.2026.04.20.15.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:52 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 12/17] fuse: add passthrough support for entry creation
Date: Mon, 20 Apr 2026 15:16:32 -0700
Message-ID: <20260420221637.2631478-13-joannelkoong@gmail.com>
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

Use the new extended fuse_entry2_out reply for entry creation operations
(mknod, mkdir, symlink, link) when FUSE_PASSTHROUGH_INO is enabled.

If the server returns a backing id, the newly created inode will be
automatically associated with the backing file for passthrough
operations. If no backing id is returned (no passthrough), the statx
attributes are cached.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 9e9b77942dcd..e5a7640fcd30 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1088,10 +1088,14 @@ static struct dentry *create_new_entry(struct mnt_idmap *idmap, struct fuse_moun
 				       struct fuse_args *args, struct inode *dir,
 				       struct dentry *entry, umode_t mode)
 {
+	bool use_entry2 = fuse_use_entry2(fm->fc);
 	struct fuse_entry_out outarg;
+	struct fuse_entry2_out outarg2;
 	struct inode *inode;
 	struct dentry *d;
 	struct fuse_forget_link *forget;
+	struct fuse_statx *sx = NULL;
+	int backing_id;
 	int epoch, err;
 
 	if (fuse_is_bad(dir))
@@ -1103,11 +1107,18 @@ static struct dentry *create_new_entry(struct mnt_idmap *idmap, struct fuse_moun
 	if (!forget)
 		return ERR_PTR(-ENOMEM);
 
-	memset(&outarg, 0, sizeof(outarg));
 	args->nodeid = get_node_id(dir);
 	args->out_numargs = 1;
-	args->out_args[0].size = sizeof(outarg);
-	args->out_args[0].value = &outarg;
+
+	if (use_entry2) {
+		memset(&outarg2, 0, sizeof(outarg2));
+		args->out_args[0].size = sizeof(outarg2);
+		args->out_args[0].value = &outarg2;
+	} else {
+		memset(&outarg, 0, sizeof(outarg));
+		args->out_args[0].size = sizeof(outarg);
+		args->out_args[0].value = &outarg;
+	}
 
 	if (args->opcode != FUSE_LINK) {
 		err = get_create_ext(idmap, args, dir, entry, mode);
@@ -1120,21 +1131,35 @@ static struct dentry *create_new_entry(struct mnt_idmap *idmap, struct fuse_moun
 	if (err)
 		goto out_put_forget_req;
 
+	backing_id = fuse_process_entry2(fm->fc, &outarg2, &outarg, &sx);
+
 	err = -EIO;
 	if (invalid_nodeid(outarg.nodeid) || fuse_invalid_attr(&outarg.attr))
 		goto out_put_forget_req;
+	if (backing_id < 0) {
+		fuse_queue_forget(fm->fc, forget, outarg.nodeid, 1);
+		return ERR_PTR(backing_id);
+	}
 
 	if ((outarg.attr.mode ^ mode) & S_IFMT)
 		goto out_put_forget_req;
 
 	inode = fuse_iget(dir->i_sb, outarg.nodeid, outarg.generation,
-			  &outarg.attr, NULL, ATTR_TIMEOUT(&outarg), 0, 0);
+			  &outarg.attr, sx, ATTR_TIMEOUT(&outarg), 0, 0);
 	if (!inode) {
 		fuse_queue_forget(fm->fc, forget, outarg.nodeid, 1);
 		return ERR_PTR(-ENOMEM);
 	}
 	kfree(forget);
 
+	if (backing_id) {
+		err = fuse_inode_set_passthrough(inode, backing_id);
+		if (err) {
+			iput(inode);
+			return ERR_PTR(err);
+		}
+	}
+
 	d_drop(entry);
 	d = d_splice_alias(inode, entry);
 	if (IS_ERR(d))
-- 
2.52.0

