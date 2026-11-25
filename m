Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646097;
	b=nEk3NYkLZGXpYMBlH9Gkjyl2XAF6iFUxfoeOc/dFe6i95D+Z2T3ZP6cYNOnyqokIQmBY
	 FLTDo7HWOzhAoUOMy4JyKt47145mlor/0nORW1CRASksKR50nyM8h6sHLWvVWc4et6nGX
	 FwYsTuXTrRYi53voTYqRMpcalZwJEg/HKR8MXL7xYdmXrVuXBRJ4k7krmdclK50U3sHLe
	 Zgf5ADPV6jorLsZsV/fOalg084OrYuV9mV4Qiz1Sj3gWuXFjnb3Hu75M6mGYbQR8WyGS1
	 HugnYl0TzrIAVM2S3CKX9mY3qJuWXyTsTJ+m+gefnxWIxgTtJCk8T+mDUWYU7AtQnsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OLNYMcQ2Y1oIxnqaAzxlR1bRdVnHH6Z3Siej5MTnqR8=;
	b=L+V3zBU/87Ro4doF6pLRDfWuQDr1XtIbwfeqU77wkHGiHxsjstZ+sCuiPxmj6km4d7Ld
	 MZDiBkC6XtFJp5PzZ4b+y5Doan2/xgdUuC+DvFjYMcrMaCqZeSXEztDzp05GAJlLmmcFN
	 PEknRomha/MV8fbCu8mGglsaWHyvbORRtymAoTe0WNmoYnRfodqDi5xkdOzlpEI4JMUiV
	 MMJJxLY02TdEjFwUcvBa2VbdwGvOg4eMpBs5o7r6b+fqWVr+RUXN3+n3bfZ0cXyFSRx7g
	 B32U29R8nM4OUxLm3CHaT5mHRurbceXbN0PNzJLnr8AhGnvYWCQ56q7lPyCVX1hq3wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VW/N0k6v";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B59606A32E
	for <fuse-devel@lists.linux.dev>; Wed, 25 Nov 2026 22:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B59606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VW/N0k6v
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso4019378a91.2
        for <fuse-devel@lists.linux.dev>; Wed, 25 Nov 2026 14:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795646096; x=1796250896; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLNYMcQ2Y1oIxnqaAzxlR1bRdVnHH6Z3Siej5MTnqR8=;
        b=VW/N0k6vANdMmZVB0xngAKOFk78uQVMAFakkezaWHxITjuYG9d+qx+g206+6M+pjb2
         nyhg0gGce32qa2EIhTpNkQhFHwbaappEG+Gl9XDe6R17O7cyfRyZr9l0veVV7HagN9JI
         F7ym0MunONBR+TKD9VHOMhb9V0vV3L1qu7SWyrp4E8qFVsLHZcylMzsqKuTT1Uds7hBq
         s1Z0o0On+K0IRsui9SnP1xdrBQuubFSFqnXYkJEFhbzDE1TzHRTD9VAfx5WJMQOXerYm
         bc9KGMWU1FuvpJdTeQ7r8CE6/jfdS/mlnjwSzu+Kj9buIMeBpcj5JOcUA2T/+2ioWoVD
         94JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795646096; x=1796250896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLNYMcQ2Y1oIxnqaAzxlR1bRdVnHH6Z3Siej5MTnqR8=;
        b=NSsCCowHxP3xjicB99+tKmXjS5P1cbNAI1cusKcK7ROpYl7gVbpGUU9jctbpxjIzWi
         oNy65lebyLzRkoxkk1HqoL+03DWZ1VcG5mkVHcUPzUVgYfeVI5OPY2J7yi4jlQkWvJJV
         dvrtAbJR+uXts7i/KIIH9epP/8YawzA8q/UnoGYdHbKQwnCvo5fFtB553zDsTE9/sYUY
         cBzmuvvE6A9DNW8W5gqZnpuykQeBeeh5/Dd6N7iT81+BZpvL3rOXe6jFGcxMp41CH1Bv
         GzsSEjaY+kc48Jh31DxvCwJ9xXERBk1GBXwBoAOSJ8zmv8HVFA0peG6lsGEu3MJN/5ZA
         HF0Q==
X-Forwarded-Encrypted: i=1; AL+hErFiXsjoXzHudzHOwrdmMW6geP+6aP7CctZpB2Lpl5p60bvKqQCz3o+zZV8Wut7V7xT/ByCXvJQknZua@lists.linux.dev
X-Gm-Message-State: APuU4Z8ZmXLxyw8Z9aaPv3dx36HinEW/9pLwddkCsp5n4RFPHYpiC8kt
	OYbbIQxc4Al+/nUbCrKxEmkry9ooZcVT1czAT3jlwYbhA/jbGcuYys+p
X-Gm-Gg: AZFdTZfTKUKeej5aRvhFSQJJD/VFoi52JmwUCg8VHSvsIGZKXE72JunlboGFbSyW683
	yS8NFQb/dA2FkuxyV7jNGn/IGN21ddOzf2Mc78pqufgXkQCK/M4nzRqrrsp+1HcvlY83nKXQ3+g
	DWV+Oc1sfVJvE/ViiWldhl2YVLdoQxp2a8dc6gbl4iJ1U5fipL9ixLYCVBvtuWkn8mTavsDXVGI
	3srZv94ViNb0S00LVCYkdvgu2Bpclp9QvXkMMjR8V9yjXuu4dgi4IhihabzFGK9ioGAqNN+JucF
	74mpYoUwmqE4LSy6k2cYovUIyilEn/xha4FvO9RoVh5G63ab/qH76RQrYZa2+bS0JjwxcEA5bWC
	hdUgH1YEtGaDRoTIHuWd/GVd/OpRLZhSR+KMOlclPih71kmnt4VmyQaT2G3JMoh3E1HMgYaTRXK
	28ReXd7MbzDMT08YLQRLrD4R78DqgJ8iHT1+eeyM7NKuM17AfHfwj87fK8LSE9RaW6VsCDgeHaH
	KKs3Y3qwD8OcZDrR1Nq9JFkfqVfIguTmwGBYeAwZnN17JduB5nvnwFFOCxkP4c3kEgTUuHSCUx0
	Sm1tm7C+tm+TpE+TbrikYohdzVTm3EyW5FZZBWoQspaSsA5ruw==
X-Received: by 2002:a17:90b:2e49:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3b41c58ae4dmr17896124a91.0.1795646096100;
        Wed, 25 Nov 2026 14:34:56 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdebb45c972sm907029a12.20.2026.11.25.14.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:34:55 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Amir Goldstein <amir73il@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 6.12.y 6.6.y 6.1.y v2] fuse: fix fuse_set_nowrite() race with parallel direct writes
Date: Thu, 26 Nov 2026 07:34:46 +0900
Message-ID: <20261125223447.651208-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026-11-23-1-daily-reply-0006@kernel.org>
References: <20261123141024.2476753-1-graypanda.inzag@gmail.com> <2026-11-23-1-daily-reply-0006@kernel.org>
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

In 6.12.y, 6.6.y, and 6.1.y, queuing a FUSE_WRITE_CACHE request clears
folio writeback immediately while keeping the request in fi->writepages
until the daemon replies. Pending requests can outlive a cached file
handle if write_inode_now() fails in fuse_flush() and returns before
fuse_sync_writes(), or if a cached mmap drops its last file reference
via munmap() without calling fuse_flush().

Once the cached file is released, FOPEN_PARALLEL_DIRECT_WRITES allows
concurrent direct writes under inode_lock_shared(). While one writer
holds FUSE_NOWRITE and waits for the pending request, another can enter
fuse_set_nowrite() and hit BUG_ON(fi->writectr < 0).

Fix this by waiting on fi->page_waitq in fuse_set_nowrite() while
fi->writectr < 0 before setting FUSE_NOWRITE, and still running
fuse_sync_writes() in fuse_flush() when write_inode_now() fails. Wake
waiters in __fuse_release_nowrite() rather than fuse_release_nowrite()
because fuse_do_setattr() calls __fuse_release_nowrite() directly on
success, including under a shared inode lock via fuse_direct_IO() ->
fuse_do_truncate().

Mainline is unaffected since commit 0c58a97f919c ("fuse: remove tmp
folio for writebacks and internal rb tree") removed fi->writepages and
keeps folio writeback active until the daemon replies. Fix the ordering
directly in the stable trees rather than backporting that larger rework.

This bug was found with an in-house LLM-based tool, and the root cause,
reproducers, and fix were manually verified by the authors.

Fixes: 153524053bbb ("fuse: allow non-extending parallel direct writes on the same file")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Changes in v2:
- Move wake_up(&fi->page_waitq) into __fuse_release_nowrite() to cover
  the shared-lock fuse_do_setattr() path pointed out by Sasha Levin.
- Verify and target 6.12.y, 6.6.y, and 6.1.y together.
- v1: https://lore.kernel.org/r/20261123141024.2476753-1-graypanda.inzag@gmail.com

This single patch applies cleanly to linux-6.12.y, linux-6.6.y, and
linux-6.1.y. Tested with KASAN and lockdep in QEMU on 6.12.119,
6.6.163, and 6.1.193 using unprivileged FUSE daemons (UID 1000 via
fusermount3) against the close -EIO and dirty mmap/munmap reproducers.
Also reproduced the v1 missed-wakeup hang on the shared-lock
fuse_do_truncate() -> fuse_do_setattr() path using an artificial delay
and confirmed v2 completes cleanly across 6.12.y, 6.6.y, and 6.1.y.
Standalone C reproducers are available on request.

FUSE maintainers: could you please consider an Acked-by for this
stable-only fix?

 fs/fuse/dir.c  | 10 ++++++++--
 fs/fuse/file.c |  5 +++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 54fcf91272a0..aaf364fe0e7b 100644
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
@@ -1841,6 +1846,7 @@ static void __fuse_release_nowrite(struct inode *inode)
 	BUG_ON(fi->writectr != FUSE_NOWRITE);
 	fi->writectr = 0;
 	fuse_flush_writepages(inode);
+	wake_up(&fi->page_waitq);
 }
 
 void fuse_release_nowrite(struct inode *inode)
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index f733a0f78114..b1646a452cc4 100644
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

base-commit: e2e4b92c2b2a3ae78423cb343951cb5d2241b405
-- 
2.43.0

