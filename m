Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8BD39D6EE
	for <fuse-devel@lists.linux.dev>; Tue,  7 Jul 2026 22:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461920; cv=none; b=K7/e/44Tuueun4yiN+gbM+ci2gCpGNB1bTh0J7y2YVd1VNYoYpEQmyapbvNTT2Pjrg24M4NrLhGqQLVvSqnQpZVO4C7wdxOEQGvX2FSnMZwZvbAQa/butecqzpIx/B6Gi05Vn9W+9xN/jj7ub+Y/FcaTmlg7XhWBOt/oikqTE2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461920; c=relaxed/simple;
	bh=YF7F0DA9Y1p34/BtJACfmzlKoYIyBIWxfKh/ILxph7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/3liP+ObbaLMtIdZe1ZngBvJnlbMQKNWE2PnUtOYdQNolvlZOHie/ohO3Uf3nPi9AwPj9n1qtkg8TaZgQNA68VMjZhNz49N+bVXRJIOLIxNWV7em+gOowWR4Ys+vhoZT/LSJHysVY3Wv2fJbsMkVDDcyUBL7bSS4ovk4LxxaME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqkpty21; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqkpty21"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7eb787dec99so49054a34.0
        for <fuse-devel@lists.linux.dev>; Tue, 07 Jul 2026 15:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783461917; x=1784066717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lVFpGTRo01EWWKtVyIoMJ2C0z3kl8sKCJEHJVlYCz4=;
        b=jqkpty21gTTY+DJOjyWXbJklSYw2uIJMze3Zxr45zVPTxw6248uaJqknGolHd0K6Zr
         pjFCxHT+0tv5laOvNCXY5g+HYqA2btskeuXO8s2lR6NhpqlYujdYng+xya+SpMgCTE7C
         gMPh8xbBixHQbKnvY0GhHf6s1T8A4OeLPYdSXH+v22C+rshWMOgKAwfG2iHrJgdoaG82
         6lEqGCB7PWFpS+QeggaNYIixpdo5X2j0wFdb8hv1AChqfZTn7Zjf5UAOaGIV+go44GTE
         R4hQ7DwnDMmonwLCaHmYkEa+jAC0ILv+G8X2r1Jy+g3j+GCrk9904dkKYNg0A3IMq1v5
         Sybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783461917; x=1784066717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1lVFpGTRo01EWWKtVyIoMJ2C0z3kl8sKCJEHJVlYCz4=;
        b=jthH2pO6ifIM+dg0AAjGjfPK+YQBh9Q1bila45Oo2hUvlouedLkdKgUSFsPzTzpTed
         N8ewadbG/T9xP+9AKaU46M1iI+udbNrmEENTa80j7hgOPu/s/hYEUWeKc6Zq3OjmOx3W
         LMFhyaeCjgQicWV72RMTTVcD4hYFw/0JwAsr+GX+HJIvZ2kOC5y3fs8VGPGS6sAbkXgt
         FmsjI09iFq/zRhrJgLXXVT36cW7HjD4s0dpTAsWA8vIunf3UUaZ4ijUO793wOjaeB8Ya
         oe4l4jNc3vMd+ZQ8ewaS3RjcuUuvnZO36eCAccUvjRebue1B/+YrnTbKjU/vdzBcHiSK
         Z+Sg==
X-Forwarded-Encrypted: i=1; AFNElJ+XmHvXDpdrQNxc++OC9VEod1h++dyecHdgkPqEfdcFruOfL5Ex3HoEgENu4OYG1U4KFA3DGav1RcS0@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4H1yEAo5lQ8JRVFNHACpePbn/wYXqxsUU8DIyP7TejfM8VLnO
	ivvm7gbheVsWCVG+u9i7swNHRUHw6jZ9RSVK0rHH9oF9y9tRAOgkRmD6
X-Gm-Gg: AfdE7clmy1I0PHqKQZfjJYc5jVWF3tJuShuQq+9w4T42oVjIpp/XUGr7NLafYhKzPnY
	hAN6C0KRiEroHwDmaCttIU36cbuIRhxvbNOGUlTQh4SKdcbj7kpgTa69x/myZhXjMaosDvjwSvR
	nX331o+LO6reUL9ZrlWgyPpqh6ZpX6q3yw4z3AF9+8FwFmmo20scvuaFZQCIpDzXfT5rwwOTRYX
	ilfxqq2Igdx/nEWYWvpC+1sRHOK28rs+3JQTXuJ+Hjus6SwaUuxHYLXA4xmaZbA+WOxtfRSrryv
	xvr0wUQjrUY2AcrsWil/lv7ulsXS3HN/TPdu+l12UIHNIucK6hZwm1N8MzZz5Lf7xwyxDdmQzHF
	fue3jlMAv8iG3KFlRov8U44JRYjR+jIolGIjW4JphbvCEBpj0tiwBcmFMg1bZiJVrsVcLBtPcRP
	WA/13dSCh7tWu4Qqjfk8LxY8C9hp/uMArGdAkJMssz2uEUzkxCwWkNhTbGfA42TDHz
X-Received: by 2002:a05:6820:1886:b0:6a0:e329:5a4a with SMTP id 006d021491bc7-6a35552f160mr4517123eaf.44.1783461917592;
        Tue, 07 Jul 2026 15:05:17 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4e::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a632ff6sm508077eaf.7.2026.07.07.15.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:05:16 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org
Cc: djwong@kernel.org,
	hch@lst.de,
	miklos@szeredi.hu,
	willy@infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: [PATCH v3 1/3] fuse: don't clear folio uptodate on writethrough errors
Date: Tue,  7 Jul 2026 15:04:48 -0700
Message-ID: <20260707220450.1200943-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260707220450.1200943-1-joannelkoong@gmail.com>
References: <20260707220450.1200943-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the writethrough path (fuse_send_write_pages()), if the write to the
server failed or was a short write, the uptodate flag on the folios are
cleared.

As explained by Matthew in [1], this is dangerous because the folio may
be mapped into userspace. The mm code has the invariant that a
non-uptodate folio must never be visible to userspace (to avoid
potentially leaking confidental information to userspace) and has checks
in place for this that if violated can bring down the whole machine.

Practically speaking, the effect of this change for the fuse
writethrough error path is that if an application does a write and then
the server fails to persist the data or only services a short write, the
page cache folio keeps the data the application wrote instead of being
reverted to the server's contents on the next read. The failure is still
reported to the application synchronously through the short count /
error return of the write() syscall. Folios that were only partially
written are unaffected since they were never marked uptodate in the
first place (fuse_fill_write_page() only marks a folio as uptodate if
the whole folio was written to).

[1] https://lore.kernel.org/linux-fsdevel/ajtPMgO65FA1TXhi@casper.infradead.org/

Suggested-by: Matthew Wilcox <willy@infradead.org>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/file.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index e052a0d44dee..a72959dbcf12 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1227,8 +1227,7 @@ static ssize_t fuse_send_write_pages(struct fuse_io_args *ia,
 	struct file *file = iocb->ki_filp;
 	struct fuse_file *ff = file->private_data;
 	struct fuse_mount *fm = ff->fm;
-	unsigned int offset, i;
-	bool short_write;
+	unsigned int i;
 	int err;
 
 	for (i = 0; i < ap->num_folios; i++)
@@ -1243,24 +1242,9 @@ static ssize_t fuse_send_write_pages(struct fuse_io_args *ia,
 	if (!err && ia->write.out.size > count)
 		err = -EIO;
 
-	short_write = ia->write.out.size < count;
-	offset = ap->descs[0].offset;
-	count = ia->write.out.size;
 	for (i = 0; i < ap->num_folios; i++) {
 		struct folio *folio = ap->folios[i];
 
-		if (err) {
-			folio_clear_uptodate(folio);
-		} else {
-			if (count >= folio_size(folio) - offset)
-				count -= folio_size(folio) - offset;
-			else {
-				if (short_write)
-					folio_clear_uptodate(folio);
-				count = 0;
-			}
-			offset = 0;
-		}
 		if (ia->write.folio_locked && (i == ap->num_folios - 1))
 			folio_unlock(folio);
 		folio_put(folio);
-- 
2.52.0

