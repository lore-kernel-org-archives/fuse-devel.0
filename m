Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64AB39E9CF
	for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 20:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246594; cv=none; b=nwNJLqlb/PmHlr83uS8zv79BFoO8UlXY5c1OcTn2fPoNE04QQkqNEgAm0b4l5k5PYZn71jYzYFNtWFVbZuzqVgPe6AefS9r/jEdTbBNpdDMyfoRopcdjHKZsx793nltq+qkZ9b0N2pg9XBDyVgmUBpdEAWmUz+vWhmvbCtU6abs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246594; c=relaxed/simple;
	bh=2+8tVOfwDf68vCe+d/s/szzPyeBRmHiP+I1lxly2LGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNUuUngPvaJQNcGk4AA5H66t+aUos7vQAVLMppJnE5d0UtboxImBpnv9cH8T1wHCtXNKFQ5t3OXTlCEdhPTX9yFfLXD5TYEQAHdrETQ9F0iYBeainp6pKpe5WKx5++0sDO/yvGm9xDDtXig9XTdC286zQ2z3w3sTlQ10HMFUNTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaYdK/6d; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaYdK/6d"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-486621f0adbso248225b6e.2
        for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 13:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782246592; x=1782851392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgIgVWeSZgvZlkItF0V2KO2lUaYqyK8pwWNqLatBa8s=;
        b=AaYdK/6dQ0Zpxfwmh/p5t85s8IcLnBlDzQpv7wLLr7HuFDohtz7pMdGyPXlwusi3yR
         J6Fk0nU8HK2assoEJSEhmmOaGZmAWFIVagF0kbv/c/xywxu137b88qXD4RvD8+Q8gqcT
         re5KEGpRzEZ9Oc2uasX4m+kNlCf+mE1hQgSr8MjAPWVIgiECtm5AlrM3+NB+FduCvp3h
         lYA3yjIskvy0N4bc84XasdTT4Ep5FyuGE4fwK5GdjmXQWk59bISp838OqJGswEc5TUOC
         YefZtx7fZqPUIqYyuEPtF1AV18ldQ9FFTFQX+M2trA/Au4AS1K9c5LWCpYepqDvdSd68
         Z4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782246592; x=1782851392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AgIgVWeSZgvZlkItF0V2KO2lUaYqyK8pwWNqLatBa8s=;
        b=GB3m+p3SgZJYLIMZEVr6in1OyvSO6Ku8lcsMauAC31ninilTcpn5x5b5quY8CAUvem
         u2+wbMLAwm6XyYeiH7mpdeRA2ev2izfBF0dNhya7aE8sfIFOwlxSvnxYHiig2iUHzVQt
         7SdAawOwzrkm9h/rVncq4Zbx1PM02jVWXjlWIpLFXt5lWUEWURSlzyeepVAcCQAgMnFl
         hzD8cEcmufD+UXiHDELcjX1O5GIhGEGB9KZv33U5Lfun8MkW3Ki0WW5dNSAoxEioCa2I
         N3shMrwa+8eMZLFceprn5k2pok7o6zqeW5PYt2/LKjrKBTJH94r5deH82mLtjafOrKpq
         6pGw==
X-Forwarded-Encrypted: i=1; AFNElJ9TGUTKHZFhgKz97Z9TSiVC/I7eRR++deJxHa3wlRDfyfebK6icSI+IZmdzmVEvzTgrJAWReg71zb2S@lists.linux.dev
X-Gm-Message-State: AOJu0YydmMK/O9wASHqPyr/gDp3mJsYLMwVyud06OymNpHSrlQPNkh4z
	h9V5mdo3XyHiDzQyxPixCCdGD7BzVGtzRAoyQZWPAo8LdMxNSM1e6ufN
X-Gm-Gg: AfdE7clmxD/j42qieozsYMnKw5W2CaYYVBXrL3pJ1LDttSRmEtA9A3978aZXvo8/TXX
	++MWplZpqzaI+IWmWjMCpqLzN4dvCNmmJQIU9pX+Ar1gZUikxrMokSKHJTmdWdk77xZOjnjU0vy
	slzhV3Sv95jLax1HoS+IScZIYDAl2VuKNuKtgwhdy3GBi25tzQDopjjLwXOa66l8zC4w93Bd5IW
	NcwjktaDAFMHXfdTQ/8fqukwEMQHavu6pivw64AOO6JrM7wCOBTOKiruRACEFX/YCbODGdoHp9l
	zMlUjVXZw++8uYQB1dAGuQd/kdFcJhQUckxQPsmle3n5gCeDmoCgsOyF/xyg5fwxqJSCVBsJiMe
	rx3PqB3y0TAUphN2S1IpvN1ELv2A+xzTpFgzKt6+l6UarKhitsXxjWvyd/regEBvgPZ8Ep1arBd
	tVa3Tnz5M0H5TbaAN0182i6A2Nn7RasmYsM8N5AroriG1brxs9gkhExfcFApNohIx5
X-Received: by 2002:a05:6808:221a:b0:48c:9bf:de7c with SMTP id 5614622812f47-4907a0836f2mr261171b6e.43.1782246591845;
        Tue, 23 Jun 2026 13:29:51 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:51::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48aec0dd2bbsm7197107b6e.6.2026.06.23.13.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:29:50 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org,
	hch@lst.de,
	djwong@kernel.org,
	miklos@szeredi.hu
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 1/2] iomap: add helpers to mark and clear folio uptodate state
Date: Tue, 23 Jun 2026 13:28:41 -0700
Message-ID: <20260623202843.2064992-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260623202843.2064992-1-joannelkoong@gmail.com>
References: <20260623202843.2064992-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two exported helpers, iomap_folio_mark_uptodate() and
iomap_folio_clear_uptodate(). These set or clear the uptodate state of a
folio and adjust the uptodate bitmap if there is iomap state attached to
the folio.

This is needed because there are some filesystems (eg fuse) that have
paths outside of conventional iomap calls that need to mark or clear a
folio as uptodate (eg writing server-pushed data directly into the page
cache) and need the iomap-internal uptodate bitmap to be in sync with
the uptodate state of the folio.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/iomap/buffered-io.c | 27 +++++++++++++++++++++++++++
 include/linux/iomap.h  |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 8d4806dc46d4..317fa7af98bd 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -105,6 +105,33 @@ static void iomap_set_range_uptodate(struct folio *folio, size_t off,
 		folio_mark_uptodate(folio);
 }
 
+void iomap_folio_mark_uptodate(struct folio *folio)
+{
+	iomap_set_range_uptodate(folio, 0, folio_size(folio));
+}
+EXPORT_SYMBOL_GPL(iomap_folio_mark_uptodate);
+
+void iomap_folio_clear_uptodate(struct folio *folio)
+{
+	struct iomap_folio_state *ifs = folio->private;
+	unsigned long flags;
+
+	if (!folio_test_uptodate(folio))
+		return;
+
+	if (ifs) {
+		struct inode *inode = folio->mapping->host;
+		unsigned int nr_blks = i_blocks_per_folio(inode, folio);
+
+		spin_lock_irqsave(&ifs->state_lock, flags);
+		bitmap_clear(ifs->state, 0, nr_blks);
+		spin_unlock_irqrestore(&ifs->state_lock, flags);
+	}
+
+	folio_clear_uptodate(folio);
+}
+EXPORT_SYMBOL_GPL(iomap_folio_clear_uptodate);
+
 /*
  * Find the next dirty block in the folio. end_blk is inclusive.
  * If no dirty block is found, this will return end_blk + 1.
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 3582ed1fe236..f13ae425f552 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -365,6 +365,8 @@ struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos, size_t len);
 bool iomap_release_folio(struct folio *folio, gfp_t gfp_flags);
 void iomap_invalidate_folio(struct folio *folio, size_t offset, size_t len);
 bool iomap_dirty_folio(struct address_space *mapping, struct folio *folio);
+void iomap_folio_mark_uptodate(struct folio *folio);
+void iomap_folio_clear_uptodate(struct folio *folio);
 int iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
 		const struct iomap_ops *ops,
 		const struct iomap_write_ops *write_ops);
-- 
2.52.0

