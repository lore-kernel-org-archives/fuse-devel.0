Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12FA305695
	for <fuse-devel@lists.linux.dev>; Sat,  6 Jun 2026 06:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780726383; cv=none; b=GrCsKb6NCLYn8+iH1nmHm0bZxXc1/4EYAzStU4MsKxgVtRUL/44zDv8RAqe9C7+LGvyvLbOdlatXJmDKWRBbqc/Jv9pzlO5S/eTJKCWU1biYtb2OtxHuG13xlkgYpQo4wODW3MmPTX8riffer7dn73mAbiGOzW+lUvne6QFV/o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780726383; c=relaxed/simple;
	bh=YVkMCLt5FJ+bDbSrJETzwIU6LK60EPUbwXQNXghAHuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JrdxfFWfoXwbOQ7UotFmmkPGclxQqqH0OLt+EZslPD4M50ekj/rAnHvjS2RKip0YJ5/cYqeYwITh/KqKIugcEdFeaWsVjhrgUGiOfuIOAyEBbiy3UvmPRJPHbKoY4aIUIYl/EoGmiyvW5QMlIKJ5PqLO2wWAQ8GcfVAS6XTcQCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnl+EcXI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnl+EcXI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so1713653f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 23:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780726380; x=1781331180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y22J8nzR3UW0cMYCUVJWDcFSFo/6kHGVqnn/SzRaSz8=;
        b=dnl+EcXIzSy4EtPF71WNcyUsDMqVa9q6+43pLi+M7D37/oF9r4AoUCLRGo3YcqHvYr
         7VcCzIFKB2C230+KYX6rUAxGlaYanqkLn9iUqsO8wFwznyyEOoWkI0Wbbx8L4QLm74gr
         15XK0ua1uk8Ob8TklgZUvDBCWQ6v0CnNGXp07Mro8DmQFZ3MEroziM1fmD453tS9cqHo
         b3/gYRbaMALHswuIW3KCXZzOyR/Vn1Wn3ht0j8DFWEj5ITMqlJY40OLtDCAjvyqScrV8
         IkaG5eESmvuCKjia352k91MQ73uRQHAhPtSXLa9GSILjFw7PVEkpQF0AokRbAEntGv5A
         n5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780726380; x=1781331180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y22J8nzR3UW0cMYCUVJWDcFSFo/6kHGVqnn/SzRaSz8=;
        b=qCpbZYgYS2kFH7GsJjjLESMZP3RFoVGnuWyppEQqx+gANfw36rXsLw6KpvpBMQnjFN
         m8zD8v79HNuptZiYZMyP7SWZtYpAYp9GsK91dqmoM9ErEs9zMQxh2DXbfynC3IWLpSfD
         ePlGWfrUSdII3c+/9xkMZSEAm/WrEj4FNrkekMc/aI8CcaVYOnL5aTotshRWI1gz+8vI
         guvtUAgBJ5o+TNVJpTpTl59J+oBPupaddJQPkV5T7y1+cmhAf8Ge+HhppEb7WwV2qdXA
         vjIj3LPwEfPB//bGia81voFCeiaXcIuJD+OmDQDhLP+DfLjpOGRiyiEXD2eCu4cGVK5d
         0AAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KyKDKed+1M9887qfyAGsdBPDJdI54gOrStzq5Plp+NHutsVva1rLBo4d5vsvMOeTqY+w6u3aLYo19@lists.linux.dev
X-Gm-Message-State: AOJu0YwkIaqJLunoQOIZlvlRCA9us05Euxvr6q8x5kRlwnoiLmL7ZSCt
	5L3U9vwHK1jvbaugM05e4c7HWV5Z2T+IQwojbDS4QNVcbFQG+TkmutnB
X-Gm-Gg: Acq92OFaosoBtH1b37BidZ3vOCyXah5pAf/B2IrdjhoRvouVV4Yg+SQEzSr8Cjrn/BP
	0FWwHvb7KOzY1hfyH/IsT4qiqhAF36KXmM9+1TR6RuVehSHseYLy9roRGhBVuXSTDFeyeBHO/a9
	JJEB0azTat77+bmFL1n2v1Spbv4WCXkPTisVBE+LPtdBRIyeEsjTwSWoJ+rey1MesNNp66VFLju
	9dm+8QfUtu5VaW16BSJcx4hv2Cbg4TpvukfgrsVaKUw5ZAJIMgKBboc4I2YbQcwBSBVtABSAQKt
	8b4B1U4Q95S9deVOirdtJWtBwOrOtne/q0Lv1GJP8RRFsg8/++4QxwNRhEJQWbtuGrr0EJsm9k+
	7nQI4wZAZyexNCVjXwGOI5n2Jo7/IPGlL/wLagi3TDKY8/IaCsNSAviyr9MNt3ut3rpfcs762dB
	xukcg9+lj3d13nDO/kHEdOswq53WmqFg==
X-Received: by 2002:a05:600c:c0d3:b0:490:b0e0:3de2 with SMTP id 5b1f17b1804b1-490c265c148mr78044605e9.33.1780726380490;
        Fri, 05 Jun 2026 23:13:00 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f2eadefsm32281391f8f.11.2026.06.05.23.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 23:13:00 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-api@vger.kernel.org,
	netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	ltp@lists.linux.it,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@infradead.org>,
	David Howells <dhowells@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Andy Lutomirski <luto@amacapital.net>,
	Collin Funk <collin.funk1@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	Stefan Metzmacher <metze@samba.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	The 8472 <kernel@infinite-source.de>,
	Willy Tarreau <w@1wt.eu>,
	Joanne Koong <joannelkoong@gmail.com>,
	patches@lists.linux.dev
Subject: [PATCH 5/5] vmsplice: make sure we don't wait after writing some data
Date: Sat,  6 Jun 2026 06:10:31 +0000
Message-ID: <20260606061031.3744880-6-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260606061031.3744880-1-safinaskar@gmail.com>
References: <20260606061031.3744880-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure we don't wait for space in pipe after writing some data.
This is needed for compatibility with previous version of vmsplice.
Found by LTP vmsplice01.
See comments in the code and links below for details.

Link: https://lore.kernel.org/all/20260603-raumfahrt-unmerklich-ertrugen-c4ecae70d5f9@brauner/
Link: https://lore.kernel.org/all/CAHk-=wgV-j-G3d+899Zm1pQ=NaJrddPz=GKcL5Yw5DTUM=GaUw@mail.gmail.com/
Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 fs/read_write.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index 77487b307..dbd0debc2 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -1221,6 +1221,8 @@ SYSCALL_DEFINE6(pwritev2, unsigned long, fd, const struct iovec __user *, vec,
 SYSCALL_DEFINE4(vmsplice, int, fd, const struct iovec __user *, vec,
 		unsigned long, vlen, unsigned int, flags)
 {
+	struct pipe_inode_info *pipe;
+
 	if (unlikely(flags & ~SPLICE_F_ALL))
 		return -EINVAL;
 
@@ -1229,11 +1231,44 @@ SYSCALL_DEFINE4(vmsplice, int, fd, const struct iovec __user *, vec,
 		return -EBADF;
 
 	/* We do vfs_writev/vfs_readv, so it is okay to pass "false" here */
-	if (!get_pipe_info(fd_file(f), /* for_splice = */ false))
+	pipe = get_pipe_info(fd_file(f), /* for_splice = */ false);
+
+	if (!pipe)
 		return -EBADF;
 
 	if (fd_file(f)->f_mode & FMODE_WRITE) {
-		ssize_t ret = vfs_writev(fd_file(f), vec, vlen, NULL, (flags & SPLICE_F_NONBLOCK) ? RWF_NOWAIT : 0);
+		/*
+		 * When writing to the pipe, previous implementation of vmsplice
+		 * first waited for space in the pipe to appear
+		 * (depending on whether SPLICE_F_NONBLOCK was passed),
+		 * then did unconditional non-blocking write to the pipe.
+		 *
+		 * This differs from what pwritev2 does.
+		 *
+		 * For compatibility we do the same thing previous
+		 * implementation did.
+		 *
+		 * We lock the pipe, do pipe_wait_for_space, then unlock
+		 * the pipe, and then do vfs_writev. vfs_writev internally
+		 * locks the pipe again. This may cause TOCTOU: when we
+		 * do vfs_writev, the pipe may become full again. So we
+		 * do a loop.
+		 */
+
+		bool non_block = (flags & SPLICE_F_NONBLOCK) || (fd_file(f)->f_flags & O_NONBLOCK);
+		ssize_t ret;
+
+		do {
+			pipe_lock(pipe);
+			ret = pipe_wait_for_space(pipe, non_block);
+			pipe_unlock(pipe);
+
+			if (ret < 0)
+				break;
+
+			ret = vfs_writev(fd_file(f), vec, vlen, NULL, RWF_NOWAIT);
+		} while (!non_block && ret == -EAGAIN);
+
 		if (ret > 0)
 			add_wchar(current, ret);
 		inc_syscw(current);
-- 
2.47.3

