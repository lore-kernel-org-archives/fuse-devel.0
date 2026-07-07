Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3B39D6F6
	for <fuse-devel@lists.linux.dev>; Tue,  7 Jul 2026 22:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461922; cv=none; b=Rms5/e1unYAOss2uH0GNcWI0aXCakv7wpylXF6ZTWosB7Itil6RomZUwPsn8pEwOiXacPfO5xkv2P4QyuHzFJjm6r5VUuNidV1FmpY+UhsEKpVdR5QI+J7wApq1rV+cP8JTkbbM5fGsJr+x4XI/urJda+pb8BcgN6q54iAmWeM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461922; c=relaxed/simple;
	bh=lLknAOl66vqVMZMX95tlcaRrtzKncokUmfi+7mwz+W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwJmTylYQFWRGXXzvDoyzRq2A1zk/SJ+t2SByj347OI91oSXWAJtZ+Fw1swDeJjhsGkRgM9hT7/GnmlZad39/m5dmGHcxQDuojK8cNOy3R++PtMhXoojQyMDDwhBmXLJtKD2KcIE+Od52ulAm4LtVimyEryfxsSudJpcolIngFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGmxqSwr; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGmxqSwr"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so61199a34.2
        for <fuse-devel@lists.linux.dev>; Tue, 07 Jul 2026 15:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783461920; x=1784066720; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBDzykVI1mMkUWW5G8//ew83MtDDt+WYhhmrBSD4JyA=;
        b=LGmxqSwrx9wsbLXLe7zHgm0LmtH0rjkBTIItCFpoBPKu2ecSmzfwaMsyq55cQjcBIk
         Pyr/qGBbe0/e3gwatuWG1CQPFfgJ8fInV6a9E0hOhLKvjBiyT7oZKXs2J+PcBPzlFLz5
         cn04lTW7LUwES5YmuYuoMpqYGQUk9aReWIfxfCu5EgKjO2qtx1J9usNAYN+hbsbIXcIZ
         w4JHlDXMHQD6jv2is72U8+50QEVM6BQdIpKks3Yl5Llb/vJ99slqrr8aKX2XJ0NvH9LP
         /68QZmKuxqUjz/fWuN88FvXxC22FEU7Y4jDZPRM4v0U/5Tf6aNDGJfPoTaqzEiha9KVa
         V55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783461920; x=1784066720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qBDzykVI1mMkUWW5G8//ew83MtDDt+WYhhmrBSD4JyA=;
        b=H3cVMHCIXv3ntf6JFh1iC/quNQahxmHl9Ukddfdr4gH/53cVuHGjdeJY7rc+85crWH
         yUhHGGIxBEoNSP1Ka1IKGcBXYwxPXomerLGY115ScU4rWpFwL6CYsmldmuGGvBctZdvv
         ejEPji/fyRZHSijBqa3c55r87xGyIajkXHAzBx/xNiywyDrAiQl8SgbYell+N5SUIfoi
         M4Jg1vUlcqj60xBZ0kS61bxDd6Ex2NYdAjHw0sMJo5GJsoyNXT+C52zI/2WlB9g3p5hL
         laqPrC/4/gS2uDaO7qZmtGXcEE64mIyqHW4qMes2hxvf0XjZXuzjLKsrhr4dP1+yhgN6
         nIiw==
X-Forwarded-Encrypted: i=1; AFNElJ8hdauKbhUwjEc98g5ApCBOjT9jWgb+WAjAHAYWHrHFlQSG3HFcUHo3zcifLofyri6EhztJw9hoScvB@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9QjTsYsrgA6MK9CaXyRyuIPhC11YIZm04CkkHcL28hVlnQZTQ
	P+/jC08C8R0SpV8cWAnFab2RqA6BMXa+hDh2ZdU50L8MQfoW7j7ND/yX
X-Gm-Gg: AfdE7cnoXuCZpqE2R/Ig0MxffhRbKjUkYnhFXT58pgsj4ck2dQEQfr2wOwCy6r5rBJI
	5k7RllyBFwX4T/HEs9LpUr/xa0Gog+rseLvAGMxhJnEvAoOURTpDPEhfQ8Up3f93TleQR2GNoRD
	IgWQCZf44ZoRL6TfGuhQZfJhVy3Uau/EaPrC5rFd76XfpFRDmBQv2muozeXQ2CI7n0NIuvaFELI
	nqpmXlQlC9DHPmCydDtZO/7eOOD/7k5I13Mnmwsn9mhV+BGJSlWLTo21r4IFXctd8cngFlh5Ct9
	88IR5+EP/gTaUWb7zbguPfmm/pcv41Thb+CNjsEB/igoJdpMyJ+vIE/JB/ShQ1cGoe6oaeNpUBV
	qzrkQDmMWZsHR5H005O+0F1cp+K0HqsIytYoH/3j+aJ1FjxvrTPu34yEKahbqvgC+kkLL+0cXiu
	bIjMDwTqRd94Rs6g2wqsKMKDDmPFxE5LH9uwx7J3rBNxi/iXh7OjrR2pg7TyWWjf45
X-Received: by 2002:a05:6830:6082:b0:7e3:d199:3164 with SMTP id 46e09a7af769-7ebb22064d0mr5512607a34.11.1783461920239;
        Tue, 07 Jul 2026 15:05:20 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:71::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcae1dce3sm478310a34.3.2026.07.07.15.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:05:19 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org
Cc: djwong@kernel.org,
	hch@lst.de,
	miklos@szeredi.hu,
	willy@infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: [PATCH v3 2/3] iomap: add helper to mark folio uptodate
Date: Tue,  7 Jul 2026 15:04:49 -0700
Message-ID: <20260707220450.1200943-3-joannelkoong@gmail.com>
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

Add an exported helper iomap_folio_mark_uptodate() to mark a folio as
uptodate and update its uptodate bitmap if the folio has iomap state
data attached.

This is needed because there are some filesystems (eg fuse) that have
paths outside of conventional iomap calls that need to mark a folio as
uptodate (eg writing server-pushed data directly into the page cache)
and need the iomap-internal uptodate bitmap to be in sync with the
uptodate state of the folio.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/iomap/buffered-io.c | 6 ++++++
 include/linux/iomap.h  | 1 +
 2 files changed, 7 insertions(+)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 27bc2455a98d..f6040199d114 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -105,6 +105,12 @@ static void iomap_set_range_uptodate(struct folio *folio, size_t off,
 		folio_mark_uptodate(folio);
 }
 
+void iomap_folio_mark_uptodate(struct folio *folio)
+{
+	iomap_set_range_uptodate(folio, 0, folio_size(folio));
+}
+EXPORT_SYMBOL_GPL(iomap_folio_mark_uptodate);
+
 /*
  * Find the next dirty block in the folio. end_blk is inclusive.
  * If no dirty block is found, this will return end_blk + 1.
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 3582ed1fe236..21e73cb9c51e 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -365,6 +365,7 @@ struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos, size_t len);
 bool iomap_release_folio(struct folio *folio, gfp_t gfp_flags);
 void iomap_invalidate_folio(struct folio *folio, size_t offset, size_t len);
 bool iomap_dirty_folio(struct address_space *mapping, struct folio *folio);
+void iomap_folio_mark_uptodate(struct folio *folio);
 int iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
 		const struct iomap_ops *ops,
 		const struct iomap_write_ops *write_ops);
-- 
2.52.0

