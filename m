Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443163;
	b=ffvUoCAtlrJzL5G/4edL78UlOWUuYSj29vEt87tvwXC+NjnxLoAxtjveAjZj09+rlpxY
	 o8qX41wROjKaWsP0tVwksO48JTLisiszU2s7Qpcrfkqbz6+1fZQIsaA7tUPQUS0IkG0Rn
	 wxHiXhzMfJlwP23u6LcV6MjKiKy3Z8em/12BiyoRe70Pr61adS0eZyfxGSly/A01bAAFR
	 mCKp4U81XRZpmfIuxJHLK6Tnh3KLMpU9oJBkfsjJOVhsDDkIL0dcWUtPv4ccXRSIZhjEF
	 SG/+GSjTcOl6jfc62b+9JqZJd8RaaonKTsUZ+j7voT5tZ+z3QYtUelUenOWeKh7gRqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FpQteIPOJ7jso2isVNK/FXoPVqd5TxYTuttF9zGO1yA=;
	b=CnWg4G2mjUc3eZm7liFziw1816jA1bRyTivdzhqYuVEEnmpdmGFvoA5MQh0PE3FqYJhk
	 wesmcXM4VJagjis+H9KnXgSqDr35TgzjUdmgR7XzYE1b9v0HO9zgzvUnoZ0B71aVNdujB
	 BHE5fYTq4EvBf/uNZzzhpd+fgarEg2cxld60Flxq3ArLLO91Dbd/AQvYLxXAwtYhJMr1c
	 VVeVDVysBeslH6OgolRnchEM/gt2TBW7nzHZQvCFVzC/fG0tvNIDgmV7UJq1E/rRYAW0M
	 e8DufT6/UkAtzcLHdOj5VTTn8tgKY5hPepmxLikFD7LkwhIbHXP3BOl0Si9xHxFecww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RheKTSIo;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2A1606A31E
	for <fuse-devel@lists.linux.dev>; Mon, 23 Nov 2026 14:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E2A1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RheKTSIo
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so9993678eec.0
        for <fuse-devel@lists.linux.dev>; Mon, 23 Nov 2026 06:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443161; x=1796047961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpQteIPOJ7jso2isVNK/FXoPVqd5TxYTuttF9zGO1yA=;
        b=RheKTSIoqDPn3zK8/9HQ5ASAiPJjpAZoH13uwH20VsUdGkpNFFB8LD5SBekT/GP1vD
         wV5cmHZe5m6PZSNm9E0m79X8/ircvgvQAySv15PVImZbsBCf/Uvmql30BBKreHuimnsO
         mYjaHo34ggEbHtwG+YiKXTZUKYtCkiY2pWvcQJ9vrFtyMqMve0saju14pKzjFkzy7JYq
         LrMBApWLkywEk6mLBomVDpQFqffpEkRkjJtDPDAoWLXjO9UyT/j2lxhiBTO25sdvxVaV
         oq5+1RZyYImaQ4dWL+mwi7G8AaqJFfGOIbcM2kB+PdqHikchKWP3WjXis8lckodUaf/U
         JeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443161; x=1796047961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpQteIPOJ7jso2isVNK/FXoPVqd5TxYTuttF9zGO1yA=;
        b=GVnHYYQ0fZ2uh8wkikgbMtA2Cef/mLgT6qNcpT/a6+7gJE1fOkx0aFDI0TibLSdrTk
         /dQNIHF4FbgWobWts9vzp23392nxHd8TnQ5o/0RVRmfinxYg04gphuiFd85W9WhZe8bq
         UTTHbL6KbxOXt77cK/vqOWONqykoRcWJWSJ7uTXCm2f6q8UIadGYSnMx8HAHAx4Mz0nY
         1edzM4C3+jMVW0PqVJtoSPfbs7Y0c5qJtGnv84gZz0HVLkixxAQmqFUA2nZgBApOYzQ8
         duQjW+wi7e7J8ySwCXjkNin0KgLCHTsSVAjLePHIV5CS+4AqWy1XPCTxEm0SEz78lkoG
         G1XQ==
X-Forwarded-Encrypted: i=1; AL+hErHqtrFyEwQQN+3rrPXDoIh4ZffoM76HMdv1PIsn8TL4Ag54UgdPZPa8dWDuzjsP5Z4Y3CuWo6jfdH7a@lists.linux.dev
X-Gm-Message-State: APuU4Z8AgA5HSNi57TtA7cTaM7JEQv3qoOAq2/MFaze+yV9uI3KwGjAi
	swKfRYvKfSVp1vOsd7KtmBu/P+pK03vPSBWVpGveyIOhAHPKs/2tGFsg
X-Gm-Gg: AZFdTZfEtYliBVPIalV7fPtizO2heu3A1GPj5NnLZ5J6RMzNQro3u8DVINp99Z2gwdP
	yJeD4u2mCf/655Wd20DAlsZf7l3NOTGDVbTHKXr+aP7g680qZXwxkfGEmnXG6J09YBn1xKhJfGM
	YHJ3RrxWd8MwEelANUVAfY8MQTcmHzvGq9+L/MyVPz8+rhs76A9kEno6Nk+zNWI45R29NTNdMrW
	937vT36LJWZRjzE6bKB69KaCF9WebLwE++7ptyFCV7tpBKHeXZQbjcrneEBQGgiTPfNHarwAi//
	aW2kAehYGWgqsQciDsbEiOeQ5zZ1d/zv0Y4YKikZLl5zwlFO8ySa4BiFTwYGtNjlkYSnwsRUSlo
	dts3GODE0F7hJOP/YsobCGvCZWLNZNmULsUF8JZM0QQXL0eQH9NDNIyySYwHlxKL39Z+Ay1LzYB
	Brkgqq71A4HLYfS+stIQjtIEo1XDmoLrJSFTj0tB20d0DhVp6XYqi6wo2Cyfn6AC3eSwd97nm2/
	rcxdItVU6FH0OAUpn2OzYK5yVwn37CbVfGW6jteTPpwquly949UDvBTEP1a4M/H2lGx9eqr1aD9
	lEDwEgS1RV7t3D1HwbmTt/uP8tkgRn5SS5LidnxSXBWa8/HIZw==
X-Received: by 2002:a05:701b:42d1:20b0:1af:d88f:fc51 with SMTP id a92af1059eb24-1b5568edb1dmr12692628c88.30.1795443161493;
        Mon, 23 Nov 2026 06:12:41 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm35997230eec.15.2026.11.23.06.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:12:40 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Dharmendra Singh <dsingh@ddn.com>,
	Amir Goldstein <amir73il@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 6.12.y] fuse: fix fuse_set_nowrite() race with parallel direct writes
Date: Mon, 23 Nov 2026 23:12:34 +0900
Message-ID: <20261123141235.2477526-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 6.12.y, queuing a FUSE_WRITE_CACHE request clears folio writeback
immediately while keeping the request in fi->writepages until the
daemon replies. Cached writepage requests can outlive the cached file
handle in two ways: if write_inode_now() fails in fuse_flush(), it
returns early before calling fuse_sync_writes(); and if a file is
mapped with mmap() and closed while clean, final unmapping drops the
last file reference via fuse_release() without calling fuse_flush().

Once the cached file is released, FOPEN_PARALLEL_DIRECT_WRITES allows
concurrent direct writes under inode_lock_shared(). If a request is
still pending in fi->writepages, two direct writers can both enter
fuse_set_nowrite(). The first sets FUSE_NOWRITE (making fi->writectr
negative) and waits on fi->page_waitq; the second sees fi->writectr < 0
and hits BUG_ON(fi->writectr < 0).

Fix this by waiting on fi->page_waitq in fuse_set_nowrite() while
fi->writectr < 0 before setting FUSE_NOWRITE, and waking waiters in
fuse_release_nowrite(). Also still run fuse_sync_writes() in
fuse_flush() when write_inode_now() returns an error so close() drains
in-flight writes before returning the error.

Mainline is unaffected since commit 0c58a97f919c ("fuse: remove tmp
folio for writebacks and internal rb tree") removed fi->writepages and
keeps folio writeback active until the daemon replies. Fix the ordering
directly in 6.12.y rather than backporting that larger rework.

This bug was found with an in-house LLM-based tool, and the root cause,
reproducers, and fix were manually verified by the authors.

Fixes: 153524053bbb ("fuse: allow non-extending parallel direct writes on the same file")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Tested on v6.12.116 with KASAN in a 2-vCPU QEMU guest using an
unprivileged FUSE daemon (UID 1000 via fusermount3). Verified against
both C reproducers (FUSE_SETATTR -EIO on close, and dirty mmap
followed by munmap after clean close), which previously triggered
BUG_ON(fi->writectr < 0) and now complete cleanly without BUG or KASAN
reports. Standalone reproducers are available on request.

The patch also applies cleanly to linux-6.6.y (5139929c698c), though
6.6.y was not runtime-tested.

 fs/fuse/dir.c  | 10 ++++++++--
 fs/fuse/file.c |  5 +++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 45cbe0cb2..54b9138fa 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1821,8 +1821,13 @@ void fuse_set_nowrite(struct inode *inode)
 
 	BUG_ON(!inode_is_locked(inode));
 
-	spin_lock(&fi->lock);
-	BUG_ON(fi->writectr < 0);
+	for (;;) {
+		spin_lock(&fi->lock);
+		if (fi->writectr >= 0)
+			break;
+		spin_unlock(&fi->lock);
+		wait_event(fi->page_waitq, READ_ONCE(fi->writectr) >= 0);
+	}
 	fi->writectr += FUSE_NOWRITE;
 	spin_unlock(&fi->lock);
 	wait_event(fi->page_waitq, fi->writectr == FUSE_NOWRITE);
@@ -1850,6 +1855,7 @@ void fuse_release_nowrite(struct inode *inode)
 	spin_lock(&fi->lock);
 	__fuse_release_nowrite(inode);
 	spin_unlock(&fi->lock);
+	wake_up(&fi->page_waitq);
 }
 
 static void fuse_setattr_fill(struct fuse_conn *fc, struct fuse_args *args,
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 33ba8ae3b..5e01dd2b7 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -538,13 +538,14 @@ static int fuse_flush(struct file *file, fl_owner_t id)
 		return 0;
 
 	err = write_inode_now(inode, 1);
-	if (err)
-		return err;
 
 	inode_lock(inode);
 	fuse_sync_writes(inode);
 	inode_unlock(inode);
 
+	if (err)
+		return err;
+
 	err = filemap_check_errors(file->f_mapping);
 	if (err)
 		return err;

base-commit: 5c40a1750f44dd6c7292d8c8d0b4ffff1734576e
-- 
2.43.0

