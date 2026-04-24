Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8AC17A586
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993480; cv=none; b=FUcfzsUja5urwC4XzoKryRkt+sx1jPxGfsvZpkKyM8mIAFbbBvZVTL+qnqyQYs6xB5edyT35azhuFiY6Mzr8scn5bbWGszLfGV9Wb/g5iQhCxxd+pcmHRN5t3Rz+3HVfjl4PbBU0vl5o5uvyouLYtttV6Bo4vHK/RodbAkzW4AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993480; c=relaxed/simple;
	bh=+BMY1iVJX7YIxklo+5LomJjF8uD4irke5igeLTp0uDA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UaenjDDmWpNFAvoK2kJRJStqCUOLKQdRGJ7CdTc5bB8lpQmMO/8wGRj0bS+Juck0sNia2986LAoJB5MKFgZRWk+hQRn9JHYVXmwz8sHc3xbq0bpp7e2VWO0gfzoLZ+f5MuNvhupmct/aA0TLFXrTvstPFDnR9tZCamNIadI7GPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgjA7mn3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgjA7mn3"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b4650d5f5cso27515375ad.0
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 18:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776993479; x=1777598279; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuiBCMG3MdeOSA1FUAU6SOjwklveJ4ng55B0z43TvXk=;
        b=mgjA7mn3oVtNVHHOBF6X//uAR8WOpcRI6VoTilTjJ6/01LazNVO8W3NGjrrcutwMkN
         li2yG05WON9QGyHSJ+uToe1htd/Mqhds0UEJquh9un1NWxU66jgAdzCQgtFyx8rYetUU
         jYmH9pYR+E8JfHCexva9PC1rXA/TMM0DLUE6LeBTzOvqjCQ9xcEps8t30ddYSYKAIrzj
         WQorbPhk4wxDkDB/of/XXL0s3Dg18mVNrOaa3dHeBymFvgRF33ignF069e6PfYz9K/e+
         Dnt3i7NiuBhnP7Bz5/YS7e53fkAMA1kysCplbDNFdclBzfZWg/C4/u0fk/dCkYyhjihS
         wtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776993479; x=1777598279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vuiBCMG3MdeOSA1FUAU6SOjwklveJ4ng55B0z43TvXk=;
        b=p9T5//4bN2ADhLSGt9DAhEfcmQbffdLfFRo64yhB/6bDJZ7AtoQG4OfCFaRiuMAZIl
         mUz6wq+AG9fwTVHiz7LKAQSFI35hv7yX8fNSbOLUDDU4bP7NWwDNs5OjkQ50XNL7rknk
         IsSDrSzVS8Z/eKBwTfv45zFuOIoMpC6FFmyzglVx+f99MmmVk9kO92yZ+cozujmHRD17
         SsqHllImh8dnUSHwYnC1Zfbv9qGRdU47AVVb5l3YYHk2oI4wXboo2kvrVreBIuAwbXIF
         erdz9wV4CAeT6nCBen3NDUToN0a47rNFtJD4ll2vfT4GaRXhY6PKzfZNdrAod5PRcMJI
         cGPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bZ3ARuPSRu9URd2P+BAhlWE5wWlmJX+nXHNkayIKw00pJNtWRxt6WcITWSMJjkhAI3HbMXU9EO8WA@lists.linux.dev
X-Gm-Message-State: AOJu0YymEp3QAMIDSsdmiP07pptN8cbbOF6Xl3J6nW6fmefKEo/atMOb
	grN22QB2fYUYM8ul8gdgxxYG1Mq0veh4vQS8MzN582Ft9ShzDxZk0a9y
X-Gm-Gg: AeBDietsWwtqMW7lJkJh3HZvNrNEhPCPs5qtLToLvVzHpxWrKNKr0iQTQo9lrmgHuJu
	z77nEkdamxL69mNmxv1749sjLbK9ytxeGWwoNwwa8W3e4koIbao81qYoRqmB3qY3IsiizrFN1PE
	zKiu1IrxHfVbBNjPENvMrTCtq2FJKdNe9+Id0sRqJvIqakF5QAno3qxGdIx3cIZnbzFpfYKsizI
	yTVnqvxC3bXzAElhsOd5V+oKTRbUesSAkxGXu69kknZfARbt1t7cx0CPX3j0WASq2z/QdxvNxNK
	pgy3o7woAPULNasjEaNwLw7nKKJj6B3ttpMS6lqdhnbvhgbu6Qpg0BeLxCdFjHUNlQbvHirVaT3
	u4LOSKiuqLKFvTQw0XePsv9pG+aackGjpRZXnYzhxRHYF0ZoG52bGam0XZoZS5XB4JosLOa4uqc
	xJd49bkJvyTY+mMRhpoYakOHKhHPyNA8mM6scjbSI=
X-Received: by 2002:a17:902:ef11:b0:2b0:67cc:adc3 with SMTP id d9443c01a7336-2b5f9ec6e37mr285095815ad.14.1776993479234;
        Thu, 23 Apr 2026 18:17:59 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:45::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa16e72sm206314175ad.19.2026.04.23.18.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:17:58 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 03/13] fuse: clean up fuse_lookup()
Date: Thu, 23 Apr 2026 18:16:36 -0700
Message-ID: <20260424011646.457682-4-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260424011646.457682-1-joannelkoong@gmail.com>
References: <20260424011646.457682-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove gotos with direct returns and simplify the d_splice_alias error
path. No functional changes.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 31dc87cfa1af..112d979c49c5 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -625,21 +625,19 @@ static struct dentry *fuse_lookup(struct inode *dir, struct dentry *entry,
 	err = fuse_lookup_name(dir->i_sb, get_node_id(dir), &entry->d_name,
 			       &outarg, &inode);
 	fuse_unlock_inode(dir, locked);
-	if (err == -ENOENT) {
+	if (err == -ENOENT)
 		outarg_valid = false;
-		err = 0;
-	}
-	if (err)
-		goto out_err;
+	else if (err)
+		return ERR_PTR(err);
 
-	err = -EIO;
-	if (inode && get_node_id(inode) == FUSE_ROOT_ID)
-		goto out_iput;
+	if (inode && get_node_id(inode) == FUSE_ROOT_ID) {
+		iput(inode);
+		return ERR_PTR(-EIO);
+	}
 
 	newent = d_splice_alias(inode, entry);
-	err = PTR_ERR(newent);
 	if (IS_ERR(newent))
-		goto out_err;
+		return newent;
 
 	entry = newent ? newent : entry;
 	entry->d_time = epoch;
@@ -651,11 +649,6 @@ static struct dentry *fuse_lookup(struct inode *dir, struct dentry *entry,
 	if (inode)
 		fuse_advise_use_readdirplus(dir);
 	return newent;
-
- out_iput:
-	iput(inode);
- out_err:
-	return ERR_PTR(err);
 }
 
 static int get_security_context(struct dentry *entry, umode_t mode,
-- 
2.52.0

