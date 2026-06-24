Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2F63E5A1E
	for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 21:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782336603; cv=none; b=PJukhRmNGlw+mVdLMSwaGwovmZQ2iFezbppxsP5WL/3Ohm1cJBCe+U66JyCArxj4t3Nlmsdl15W9cbYs0V6Tq1T523ZNvm2HYsfgXUCF1yrj0vvgyA8i4ccom8gsT9t0hWlZ9OQMUcBlZb69M3nfaEYCX/EGjwv6BTzn4cxu5gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782336603; c=relaxed/simple;
	bh=+M3qnWWmidwsXgVgDN29tUkdj+H4zV8z61JIEEtw6vE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V1WiY59/lzrkGh5UHDlZ0dPYlHinxOQQdWXRYwr7ChW/YlMmQS1vMYN4jcFsc3ZDGVBMi4cpxHAD3+JIIsb5UQfElkaAm92VB0rjc2zF0xuvqMCuvNYnGaCDz/Hhs4ObBcwnM/6iwvpK8CppW6D1LrOdnLdpJLFwU6aTVJM0Er8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gj79WKth; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gj79WKth"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-69e1f777bcaso240384eaf.1
        for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 14:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782336601; x=1782941401; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUcXjO78YurIO5Ne7YTcUW1ZByWEpGaEG2epb8Eo1js=;
        b=Gj79WKthN/bhdKMUuNmpQN/H1/sp3f7gfSrqKZn1hi5aOde3MswvxuNamGsMkRC/KO
         PdFRrFSCOVx06Oa0cFOOHQSFRvT3sHTGeqPzB0qb28/s20LkqyRQKlcbg195RV4XW8js
         UiIzrRth0ICwVEf726n1OC6cx25P6Xx8TDI65F9qR3DV/l5rm1OEd3IFKCsVK/tUroRV
         iJPYLaNTroZtbq25QoA7pMMkkKdRRcs4cjzZUHk83dgSRQD3DrdPmcUXV5pptpoMSLoi
         aUgAusx3PzCJUX1ewhbEfL1QUjo2nqaFJuSoxDwApwFYT+azczJzNZNoPr1FV3V+g3Yf
         elFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782336601; x=1782941401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QUcXjO78YurIO5Ne7YTcUW1ZByWEpGaEG2epb8Eo1js=;
        b=CLChNUnkvdU8PUUftDKVsukhjGEgaGlrkJuFv5B2MRR4NoiJ2AT+n9xuc6rClbnU/N
         iwV11BKIv/7Vs3g0TmQeUiwirrGA4hZ9NbUQNkjEeAktNM8iRHba3vEVj8OWE0/WEviH
         dRrt0aStGM/0/vvwD9iT/k3ONc1ZMpq1cPhty+o7kHSDWSLFsJUI23Cp2BslfgTtNSGp
         feLtwh1tV1idw3VadZZK+kMC19R3SpSt8CaNm3qRABVka+7V/VmLO3b9epyB66zpJv6H
         OP6cWjmpkhGq+NHDIDrQ8GdXOUTNFM0lXf7r87TmEsO+TQ8eOAXldiue74TkDvylGT3J
         Om6Q==
X-Forwarded-Encrypted: i=1; AFNElJ88BqNfcCQYXCULVr2H7d9fd0bBdACyQQd0U6QWg0vl2oXO1qMXMlXz0AqwZGw0FmYRcsyl7w0DiDLT@lists.linux.dev
X-Gm-Message-State: AOJu0YxFC3FsiY7iOkOTvZAl9En7ZNKO5nGqSl7c6dBZaOre6JYoD+I+
	8ABO58VPz+xXvOqL61YRBancyCAnadyIXATK1FUI425FQEKedxtr6LEb
X-Gm-Gg: AfdE7cmU0+7G8EBeRhvfFXT5UyQ7O4aSzB55lw9jSV401QGV6h5FQUmIlr61UFwp5uc
	+Ig8OZL1XkbDp02xw8I9qcUdSQb8Spaujz0ngJNW77NVCQ3eB+hbVFsNfEFlkIzw0q1bxxFCSW8
	5G5GGCtjfCytHSR4U9TqMklpU6oXFkOFOnVVSeB/mgi3Qu/91kZVNuIjEUFluxX3XhJf/tg6NI9
	3uaWOwXSb8DodQO120bJ4vIkLL3FSXsQfL41LAqXyVFNYHf0GZJGXUOxC0lCH+51oUouY867Se8
	4h4+Ujf8A8IYO7FCzzmc3jsbbqqe9HbuUdekpkFJnVHmAhLBK4bu4T/OZxg59Xb7NSIQPcxc1H6
	/VC/O3ezdAuCkJ5GBSJ5pM5aAXzpiWHI9p5wgemupegiM6s5S0nOKr8MDSSQfp5uvOs4gpxVXR1
	3JJOXOFfNY50SZkHtFOllgNfa57fWvzOPrlfNRJn1LwI0R6U+JlkwEgr4Qj6WDRdk=
X-Received: by 2002:a05:6820:6ac5:b0:696:711a:c1b8 with SMTP id 006d021491bc7-6a12d8245admr1242893eaf.15.1782336600506;
        Wed, 24 Jun 2026 14:30:00 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:3::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0ea1520e4sm9667061eaf.15.2026.06.24.14.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:30:00 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org
Cc: willy@infradead.org,
	hch@lst.de,
	djwong@kernel.org,
	miklos@szeredi.hu,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: [PATCH v2 1/2] iomap: add helper to mark folio uptodate
Date: Wed, 24 Jun 2026 14:29:24 -0700
Message-ID: <20260624212925.1668662-2-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260624212925.1668662-1-joannelkoong@gmail.com>
References: <20260624212925.1668662-1-joannelkoong@gmail.com>
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

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/iomap/buffered-io.c | 6 ++++++
 include/linux/iomap.h  | 1 +
 2 files changed, 7 insertions(+)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 8d4806dc46d4..bc33c34800e8 100644
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

