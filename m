Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703122;
	b=oc54Am9zkuN/qdmM14DMMo1d0aJlyW+HXjZYzH+PgJ4a7kL8LGbWtH2gYCLD24a/fG3h
	 kAbGnHHkUmV7xG4W5Im07errbxTyPVua24WzmPf6EcxFP7PHajfwITvZQPzRl0IbyA/1K
	 w2x85Ori+ddhEDOJP64ykVkw+WhnYy2KgkOwQjQCVlktz6PoXeRYkNzWRqEqAONC3TGHb
	 FKyyRv6HDdrXZxwsUOsdfhcksWQLsaVYO2R7C8xT2WYMbEH7Fw5I4WOt4d/y7JcTo2KfO
	 2mmk2krNEpw7p3qfMqllv176KZQy2u7WD99f+wlk4tcR8ov7a/IgDoJk/Z/HfyjsITQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703122;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=jncQvmy1VtoY91JtTrkkqlwFNfvavf0ha1ceRtYeR7Y=;
	b=s0KEev4Y0h1q0WNDnjoLphJ21OuOsn5YTm60hPVU9gOt/L4xUJ+r8pTDYtRVB0c8DbD8
	 DmDPhpqqMK6vIsLSu6LMesjUmHXdfOLv4xfl2icM8H2R2rCjDHwVWlQW8LnLcUZKnTwQZ
	 9wYcdGwzhcUW0WN8Nt22rP6KI4rWMx7rBd4H6Pdo7OkNTCmvTaIGwEo/M2JCkd5ifNkzJ
	 mVRJcUFBmzdvoQZGVBLQxo7QSKPDaKPOwZXgIlKfWjJpVs4yoYTzMs4Dk4vl0ruCsTSFo
	 pkzJOkEmpmLT8fXHGhquw9nu1OIo9UG88V2ySeUabJc42ZwoDsYDatRyiYHkGqpWSsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DP3m0M7W;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94173606A31E
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 14:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94173606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DP3m0M7W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795703120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jncQvmy1VtoY91JtTrkkqlwFNfvavf0ha1ceRtYeR7Y=;
	b=DP3m0M7WliuNg5iy7wRlvTWOCK+N52TPzrwdxSfb+4DRGgSjMMt800V0vF4+Xq+FDHEJ8D
	a4oJezobPH8mINBEot06mpQHgdFnwVwzKRHItiRHdYxm2+rpBnmjpJ6FTJ61WPyo/X+8E7
	0qQX69zSYWk8EG3HvG5LstH33zr8LIc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-Zz63fs2bPtOlDyA5w8Fe_w-1; Thu, 26 Nov 2026 14:25:18 +0000
X-MC-Unique: Zz63fs2bPtOlDyA5w8Fe_w-1
X-Mimecast-MFC-AGG-ID: Zz63fs2bPtOlDyA5w8Fe_w_1795703117
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4a82fb7e71eso3998806f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 06:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703117; x=1796307917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jncQvmy1VtoY91JtTrkkqlwFNfvavf0ha1ceRtYeR7Y=;
        b=GMoS3MAsv1XdcFJEvGF/gHUXsMYH2flfMEc1DsTDHVRWh36ZJ+ISopKdZfZKUD8k9f
         TKNDfDEVzOg9PpxAKSwjEkj6Ma3+yTMiiMd1srmvbdIPK56LYF4r/8/fYDBSh1d1KeI0
         opKoS+ETjow8xJXIybYLrjgVZw5SgW0L7pQ0E24LbLVKoPyFS+qDkRiKC2ENjzlgtNuJ
         rDV05FwE0pcp/rBGoxb3bpPtOLliIPzHT4Qx4YTenY98bUM+5Hbnyzp0ku3/Y8KVPMiZ
         qlqpoGoKqQkIAqVA7hRI0ZD6DF+5PAEvZXYu08Zz9mhOCNs5dOqsGNOHLTfbGdUmI9WN
         RsLA==
X-Gm-Message-State: APuU4Z/gpedNmQ/sLj6saEQHOfpfpKpvblhGTSZ4Mj5z6irbmT3lrjED
	4bWhSEq6gY0JNeMhu1y3paBe7VbmDvqNuLksqVCedLtgQR3qoGYStvHJgm0cl2VNyKEGh9c0yZa
	m6Yy9Is0gQgLFMCSlFu1bhTw3IjuPC39TLczY2To+LQxG0k7qqgSGQbvmv8gxSXBPikFJrT6B2S
	weKftVZbMOPolbPdE2yf4mH6T9+DKlstRLxR+n4J/PSKurzyM=
X-Gm-Gg: AZFdTZf2gvFUNctsUBsJvmRZCoTgUn9m/311tgBsE77V57ihJheIgfIMEBskYt0jIrO
	Q2Z/LpvNLyeOhN2DeFHoTPZA6rrlbNYBGJfII0JgzX9Ls5f3JcVRsVheT3q9eKzq7LjJbcUNdZm
	ZVo08J6o74VMRIgMXnsSOKI/hoslwTX4c2zZHWJ0BRFNVnTOpgfHV7L6QEjuTVWXN8YazHGcRCw
	frrvn39XhEUV3hK5lb0qwONg6ctry0rHnK8EeBt1xb5fpr65qlS8JXVti3GDs2oTRcy45UTpLi6
	7KgXKpJYkG4m/yvK2DXOfYyhtyQP5zFpXDc23SEakbeaKxth/SLdYGXIA5z9kZRU2evAtt7uLco
	optqiVopOEGi6LZuxEfoUxHdW5ZmN8dPaP9gGOCJXwMfw5QO4lMTFbhkSO9OYVSBBlfsty2zj5J
	1PrJRrjwPYpgB8RoYGkp1D6+Je9EbOl8zf5YkWFPYP
X-Received: by 2002:a05:6000:2386:b0:4bc:9b4e:62a0 with SMTP id ffacd0b85a97d-4bc9b4e6531mr4276238f8f.32.1795703117351;
        Thu, 26 Nov 2026 06:25:17 -0800 (PST)
X-Received: by 2002:a05:6000:2386:b0:4bc:9b4e:62a0 with SMTP id ffacd0b85a97d-4bc9b4e6531mr4276181f8f.32.1795703116844;
        Thu, 26 Nov 2026 06:25:16 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (193-226-214-34.pool.digikabel.hu. [193.226.214.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm40768370f8f.42.2026.11.26.06.25.15
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:25:16 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Subject: [PATCH 4/6] fuse: don't truncate under a shared inode lock in fuse_direct_IO()
Date: Thu, 26 Nov 2026 15:25:04 +0100
Message-ID: <20261126142512.219535-4-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126142512.219535-1-mszeredi@redhat.com>
References: <20261126142512.219535-1-mszeredi@redhat.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2uaYIA-hj4I3k8mvEMbzqM9gKEg3ZuIb_x6U4m5YrLU_1795703117
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

On a failed write fuse_direct_IO() rolls back the i_size extension done
by a partially completed extending write.

	/* For extending writes we already hold exclusive lock */
	if (ret < 0 && offset + count > i_size)
		fuse_do_truncate(file);

The comment states the safety argument: if the write extends past EOF,
then fuse_dio_lock() must have taken the inode lock exclusively, so
fuse_do_truncate() -> fuse_do_setattr() -> fuse_set_nowrite() is
serialized against other truncates.

That argument does not hold, because the two sides test different
snapshots of i_size.  fuse_dio_wr_exclusive_lock() decides on the lock
mode using fuse_io_past_eof(), and fuse_direct_IO() re-reads
i_size_read() afterwards.  i_size is not protected by the inode lock in
fuse, only by fi->lock, so it can shrink in between.

Fix this by only rolling back when the inode lock is held exclusively,
which is what fuse_do_truncate() requires.  Pass that down from
fuse_direct_write_iter(), which already knows; the ->direct_IO instance
is only reached for writes through generic_file_direct_write() from
fuse_cache_write_iter(), which always holds the lock exclusively.  It is
also reached for reads from generic_file_read_iter() with no inode lock
held at all, but the rollback is write-only, so the flag is ignored
there.

Skipping the rollback in the shared case is correct: the write was
non-extending when the lock mode was decided, so there is nothing to roll
back.  Should a concurrent shrink have left i_size larger than the
server's size, fuse_invalidate_attr_mask(FUSE_STATX_MODSIZE) has already
been called and the next getattr resyncs it.

Fixes: 153524053bbb ("fuse: allow non-extending parallel direct writes on the same file")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-dd214614-11a0-4836-a4f8-d013da3d86b7
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/file.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 993a1d2b3151..545d29dedcd7 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1825,14 +1825,15 @@ static ssize_t __fuse_direct_read(struct fuse_io_priv *io,
 	return res;
 }
 
-static ssize_t fuse_direct_IO(struct kiocb *iocb, struct iov_iter *iter);
+static ssize_t __fuse_direct_IO(struct kiocb *iocb, struct iov_iter *iter,
+				bool exclusive);
 
 static ssize_t fuse_direct_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
 	ssize_t res;
 
 	if (!is_sync_kiocb(iocb)) {
-		res = fuse_direct_IO(iocb, to);
+		res = __fuse_direct_IO(iocb, to, true);
 	} else {
 		struct fuse_io_priv io = FUSE_IO_PRIV_SYNC(iocb);
 
@@ -1856,7 +1857,7 @@ static ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *from)
 
 		task_io_account_write(res);
 		if (!is_sync_kiocb(iocb)) {
-			res = fuse_direct_IO(iocb, from);
+			res = __fuse_direct_IO(iocb, from, exclusive);
 		} else {
 			struct fuse_io_priv io = FUSE_IO_PRIV_SYNC(iocb);
 
@@ -2774,8 +2775,13 @@ static inline loff_t fuse_round_up(struct fuse_conn *fc, loff_t off)
 	return round_up(off, fc->max_pages << PAGE_SHIFT);
 }
 
+/*
+ * @exclusive tells whether the inode lock is held exclusively.  Only then is
+ * it allowed to truncate the file in the error path below.  It is only looked
+ * at for writes, so read callers may pass anything.
+ */
 static ssize_t
-fuse_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
+__fuse_direct_IO(struct kiocb *iocb, struct iov_iter *iter, bool exclusive)
 {
 	DECLARE_COMPLETION_ONSTACK(wait);
 	ssize_t ret = 0;
@@ -2869,14 +2875,31 @@ fuse_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 
 	if (iov_iter_rw(iter) == WRITE) {
 		fuse_write_update_attr(inode, pos, ret);
-		/* For extending writes we already hold exclusive lock */
-		if (ret < 0 && offset + count > i_size)
+		/*
+		 * Rolling back a failed extending write needs the exclusive
+		 * inode lock.  The i_size read above may have raced with a
+		 * concurrent shrink by the server, in which case this is not
+		 * an extending write after all and there's nothing to roll
+		 * back; the attributes were invalidated above anyway.
+		 */
+		if (exclusive && ret < 0 && offset + count > i_size)
 			fuse_do_truncate(file);
 	}
 
 	return ret;
 }
 
+/*
+ * Writes only get here through generic_file_direct_write(), which is always
+ * invoked with the inode lock held exclusively.  Reads also get here from
+ * generic_file_read_iter() without any inode lock, but @exclusive is not
+ * looked at in that case.
+ */
+static ssize_t fuse_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
+{
+	return __fuse_direct_IO(iocb, iter, true);
+}
+
 static int fuse_writeback_range(struct inode *inode, loff_t start, loff_t end)
 {
 	int err = filemap_write_and_wait_range(inode->i_mapping, start, LLONG_MAX);
-- 
2.56.1

