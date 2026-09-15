Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A9C3E3163
	for <fuse-devel@lists.linux.dev>; Tue, 15 Sep 2026 23:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789516436; cv=none; b=ckO4lGXwX4wimhbfHGtdY6vFuBQNj/Un1Yue+rdyHepJA9NoXXkBTZVju2p4B8r8ZLXVrs2TB5w9PCZ0Dj1NSayLmPGsyaqhLmZRga/Oa7ocOAuJ1QRtkXg4pEclBPcJMLFT2NOlKkKHdi/ETegMFkLgYfEm+COSbTQTxVBCB58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789516436; c=relaxed/simple;
	bh=9YCR2jAyq8jwYN4sL1CNBLWNLklyjMJf+GSPFtbaEnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cA5ezLH/OQTkYqZl/NlO5ySvHipVfGliCV/SpdCUxi2H1d5uDfcBhD0F4lhGFtALLvhpc3yeUNgnO89N5DUpd8yYs2OZAqI6Ktl3Cb9sKwYhq9ubVBHkZ9NuCrMg8kd/IDu9MXGh5ZhQL5WKGpWlf43lU9FAbgrCFGjdp/Nd47I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsbY+sIc; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsbY+sIc"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7fcb425fb68so190244a34.0
        for <fuse-devel@lists.linux.dev>; Tue, 15 Sep 2026 16:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789516431; x=1790121231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDEJrVWlib24T1D7GSE0HjYSZrsnYM8lK5GMEYYnFBc=;
        b=SsbY+sIcxd+YHTcBg9ZnFwQPf/FUWHU5ykBrbz3fXS3nU+cf5QfsCYY+exihQNfHG5
         FtHOBUl/pJOSn61mvLM3Z3UJ6ZlCex1/dBlZzeAHoV4g3OlIc7cMuXp5U3auXqaVKsBk
         +4Txq4tqkvxqlyFwTrl783Vvr320kqvfJ/V25IzlNPpzripjuPyaqO7qdbnhFiJciFdF
         S51I7OjDOzW9vZJF0O+t+y0SJj6/4qvFDstKV0jDaTaT/fOj3IEKemLbPM2McIW5d//7
         9ntLNt6yHY+rl1ktvvxqbFdZiGCsYIm0OIalYMCVGGTamICQjX7tyYRNPwMIJBx6ewIS
         Hj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789516431; x=1790121231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDEJrVWlib24T1D7GSE0HjYSZrsnYM8lK5GMEYYnFBc=;
        b=1dMwPQKB1SCDzPU49MPz+13KANkUGY5KTSUSF/pdU0FaAX47gkQ2g7meyTP9H5+ebe
         IvYBKoxZq78Z2/VpZX63dI3PZjEejDF5MtEOCnDVwHtxFzZh4SXAe7TDVqPyOI5ZLa3k
         AH4JncsI+nndqeuDwDHe5mpwocDWKMs1I1zS3nrIfl0EUI6TBN20rGJTxOFzfnGWd1Yj
         PqlWaSX/NAcoN9ggEaYdj2xWk+rkfXRJWDL/jTbU3j9D1clzyzHbFdlsVoV9aPiLtG5f
         iMsJrs2u7KbsukqfuXpsJO9F5tb06r8qADqQsyf5S3LNt2pW45VXYcCeyEklSP1dYICO
         FZxg==
X-Gm-Message-State: AFuF++mrp4o6VGGdhfnppnH64WSUesznl+J/a0GWYsdF9eAmphesK4bs
	DARTo4UUqKKh1/NJantcU648xe21QTs6DQY1uNNFUfC2xTVvSgWinDRp
X-Gm-Gg: AYBFou2M2OtypV94oh9QE4bbFc0CP1L/iqnDZr0mvmBzmobJsmwJugf3//21CfGmZ3W
	KkQ5oKWn1s5nTi5NYZQD37yBy14bWe3/AoHeb6DTDdMepuQDkc0cEAz0fqhDtMo6UU/ZdMFtLm2
	IVgqLMSuT+P2YClbiMlxprn518uZcGCGvaPxIeSJOzVNEN4GEiBfgA96+Inl5bYeAe+3pOemI4u
	tRNk5+RHkqtCmS4pa11S/b0sOR6/PDqE+fSHpInL/vrzX/WTMS7BU7MmSlmlWMVWWiP4glDKaY7
	JiY/8/44vd9oe+w5/c8U4wsjYJhdi7RF93nvytym9RDVOVxcA5+ZnSVTXPq8eLerndl399seV2S
	3XXt345qIejtWu2UL9LPjcvCaj3Ru2IWzmb2lXgTLwMtbhBNwOhs8IciT1mHZO6LPS5hIB6BNxk
	RF83ED3QxE7SW8PgAohTFe9oQjLffNaQlji73r1BJPpfmKQkOSZOPnM95ubYd7I0DayOlITnF+3
	MN1I4sSXJjhEfjAtrhfikMR1Tzs+hHRZo8THV1dnij20OdiWFA=
X-Received: by 2002:a05:6820:290a:b0:6b7:8415:d78c with SMTP id 006d021491bc7-6c7d32fdf98mr609849eaf.55.1789516431352;
        Tue, 15 Sep 2026 16:53:51 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:73::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c7a061a054sm1420639eaf.0.2026.09.15.16.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:53:50 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] fuse: don't drop destination page cache on a zero byte copy reply
Date: Tue, 15 Sep 2026 16:53:41 -0700
Message-ID: <20260915235341.523416-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__fuse_copy_file_range() clears the destination page cache after the
server replies:

	truncate_inode_pages_range(inode_out->i_mapping,
				   ALIGN_DOWN(pos_out, PAGE_SIZE),
				   ALIGN(pos_out + bytes_copied, PAGE_SIZE) - 1);

A server may legitimately reply that it copied nothing, eg if the source
file turns out to be shorter than the size the kernel has cached for it.

If pos_out is 0 as well, the end of the range is ALIGN(0, PAGE_SIZE) - 1,
which is -1. lend is a uoff_t and truncate_inode_pages_range() takes -1
as its end of file sentinel, so rather than clearing nothing it drops
every folio in the destination mapping.

That is not only a cache drop. truncate_cleanup_folio() calls
folio_cancel_dirty(), and fuse_writeback_range() only wrote back
[pos_out, pos_out + len - 1], so dirty data elsewhere in the destination
file is discarded without ever reaching the server.

Skip the call when the server copied nothing, since there is nothing
stale to clear in that case.

Fixes: 9b46418c40fe ("fuse: copy_file_range should truncate cache")
Cc: stable@vger.kernel.org
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/file.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 3bf7cb590538..2aa575a02e05 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -3062,9 +3062,11 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 		goto out;
 	}
 
-	truncate_inode_pages_range(inode_out->i_mapping,
-				   ALIGN_DOWN(pos_out, PAGE_SIZE),
-				   ALIGN(pos_out + bytes_copied, PAGE_SIZE) - 1);
+	if (bytes_copied)
+		truncate_inode_pages_range(inode_out->i_mapping,
+					   ALIGN_DOWN(pos_out, PAGE_SIZE),
+					   ALIGN(pos_out + bytes_copied,
+						 PAGE_SIZE) - 1);
 
 	file_update_time(file_out);
 	fuse_write_update_attr(inode_out, pos_out + bytes_copied, bytes_copied);
-- 
2.52.0

