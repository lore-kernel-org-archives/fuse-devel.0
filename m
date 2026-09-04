Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F223B95FD
	for <fuse-devel@lists.linux.dev>; Fri,  4 Sep 2026 04:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788497843; cv=none; b=hK1LgANMvpLR5b54LW2HwyLz1ktmFMFeZe9K/cdSs9h6N5/CPYtZRJIeplqyNmY4bZ7zP6LEShYfExsBwkpBeZhk9LmFmYTDKcC6yjiX1mqHVg2QhJl+amY1fOJQPNoPmqcYg/J5B9EZTL4HooS2C4CUGDud/KTRHcg3GI4lalU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788497843; c=relaxed/simple;
	bh=iRC9zXNugL2ZiFdh/I2MbxRp12RGmX6Vmvz0HdEjIRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kja+U3Hz36hCE9d8v0HunK/fi5HGxxEMeawdQdi5FJDipO/N7oTdt7sb6deYS55Eerg3Rc5yzkcJIBFNPlfw8sBpAOjTXsxQWcGimZJrqK5jNLTYcjE8uvHloQ+0YzdmphYjU+ppZJ9+BcB7zxO+ykU+g4TP9ozxkJh/HPbuwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Enj7TGNX; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Enj7TGNX"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e9ecd7216cso502679a34.3
        for <fuse-devel@lists.linux.dev>; Thu, 03 Sep 2026 21:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788497841; x=1789102641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xg8R8vva/xI2947xWRMIwERB05lWOxAdj4EDTBIjrRk=;
        b=Enj7TGNXqac7C7aXzUR1GyYPaIxdlHTe69sAv9b1Gcdj44EYKSvNZLgSma6TGhjitN
         L7MfcqnjfNZ+EQgYb/j6cA2TDo5ReuJHgmq/Mjg2J5BeepTfUt9OSTQqfC6qmEh9+Nb5
         9V9xGB7IzCI4QqHp4kA8n11//TXH0J7Vf4pj7b6x+/IeB9tcSSe5vu5cTCIucogCtC+K
         Cl/PRYW3NTicOhrsLACxAopT6j7hPlEf9ja+TVC/Z///UIfznaMOfxUDHfVYt2c8eiZU
         GfS+wkvK8hDpZS4w408Xpol2Ko+hFKwR/7IS0LlDFqclEMkgUJbzgIEzOxYjQxMhqFkm
         b3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788497841; x=1789102641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xg8R8vva/xI2947xWRMIwERB05lWOxAdj4EDTBIjrRk=;
        b=Ly5o+1f7cP9suvig0NhM8Sr+6DY97AlvtHmQeVvYpoliW/YBxWazYZK7lFUIUGR4st
         EROaYDmj7EhIQ6XSK3DpobxHo5DFFSXzDtrlxXG0rqNh64DsViJDKuGqzbRykPjxVY+h
         Nofr4ekDte7DGLk2iBVMAIVPUQthjoQG0iPL6SAklnNRDaxSMYSi6ppWBPXEAP3gj85W
         gVb1u8byHTH2tJqjpGu21J0YeSdFQSs9KKZoVMPN6EBZC+WWd8dbuKramDjhxgJlSTvs
         vZm7Wn5/SriRaz+hhLZp1ueyWos5ux2xP/dgqH+ufvqSQpciG1Kr/Z02rZSrnyF1gxkb
         eAmw==
X-Gm-Message-State: AFuF++mIHGLLkXc9KEFaMHI/uDOkti9QWNyfWz+eCc6pjFsVsVEsrZe7
	wbAPRjoKXfr5+P5v2mn1S5IhdhG/VTxYVQzWsv/nA3tKAFQO905TwF45
X-Gm-Gg: AYBFou06VItFOOvv4w0dMG1PyVdNGYS5qoKsyvzGJC9X/XBHzoRyhRefVVkMf15z7t5
	gV8qPD8SLv8clLpEhNTjWF8OnUmtvlPeoV8gVWxIJEFB4FBUq/oee1zaNu9gAWiFBFMeq/L/B/w
	rmNLYIneNFVf03LRJna9gPEusiKonGXVulao1luHkt7TlXTgeZEVk715rOPpKZB+m457o3Cuxxj
	8ySlBrUCQ722mtoVzUXsF/K72l1StUJz7vBy+Z/0kvxHQ2BuCtKqe8nG1rKG90nnoe0CvUoDiC7
	Z5AnSbfZwp7r45VT+3jz76hgoqWHJD+ExoIgCZ7dk38aGd27V18REFZ+7qWa4lFDD1NmH/iK0id
	hXNqGQEfFaubn8ZLxXKcREr6UGVqMr00+3KO5F2EQ3z55NJu/8jmS/z8YQsatgl6AAVX0X0+3js
	ixI4JhUWMWAx17E3TyoB1ux7GDw9KlrcOMEcJltk0OMDsGKTpOZgsoFZep7zGt1HTBvWFpyMu6j
	kSMCH8KDCEO+doTEdp7hllZzLI/RqT/RcskqaYc
X-Received: by 2002:a05:6830:a194:10b0:7fa:ac4f:780 with SMTP id 46e09a7af769-7faac4f0de9mr206258a34.31.1788497841013;
        Thu, 03 Sep 2026 21:57:21 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:71::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fa02cddc41sm1944579a34.22.2026.09.03.21.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 21:57:19 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Kanishka De Silva <kpskanna1915@gmail.com>
Subject: [PATCH v1 2/2] fuse: zero the correct range on a short read reply
Date: Thu,  3 Sep 2026 21:56:51 -0700
Message-ID: <20260904045651.1442505-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260904045651.1442505-1-joannelkoong@gmail.com>
References: <20260904045651.1442505-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a read reply is shorter than the requested range, fuse_copy_folio()
zeroes everything in the folio outside the copied bytes. However, for
folios with block sizes smaller than the folio size, this can clear
blocks outside the requested range which are uptodate, or dirty and have
not yet been written back.

Move the zeroing logic into fuse_copy_folios(), since descs[i].length
needs to be used, and clear only the tail of the requested range that
the server did not send.

The range is also no longer cleared upfront in the non
cs->skip_folio_copy case. This is fine since a failed copy leaves those
blocks non-uptodate, so the uncopied bytes are never visible. This also
matches the pre-existing behavior in the non-short-read case (a failed
copy doesn't zero out the range in the folio). This lets the zeroing
logic stay the same regardless of whether the folio copy is skipped or
not.

Fixes: a4c9ab1d4975 ("fuse: use iomap for buffered writes")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Reported-by: Kanishka De Silva <kpskanna1915@gmail.com>
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dev.c    | 44 +++++++++++++++++++-------------------------
 fs/fuse/dev.h    |  2 +-
 fs/fuse/notify.c |  2 +-
 3 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 4fec31fc0b84..293b8a936e1e 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1252,31 +1252,10 @@ static int fuse_ref_folio(struct fuse_copy_state *cs, struct folio *folio,
  * done atomically
  */
 int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
-		    unsigned offset, unsigned count, int zeroing)
+		    unsigned offset, unsigned count)
 {
 	int err;
 	struct folio *folio = *foliop;
-	size_t size;
-
-	if (folio) {
-		size = folio_size(folio);
-		if (zeroing && count < size) {
-			/*
-			 * When the copy is skipped the folio already holds the
-			 * payload, so only the bytes outside [offset, offset +
-			 * count) may be zeroed.
-			 *
-			 * Otherwise, the whole folio is cleared first so that a
-			 * failed copy leaves zeros rather than stale folio
-			 * contents.
-			 */
-			if (cs->skip_folio_copy)
-				folio_zero_segments(folio, 0, offset,
-						    offset + count, size);
-			else
-				folio_zero_range(folio, 0, size);
-		}
-	}
 
 	while (!cs->skip_folio_copy && count) {
 		if (cs->write && cs->pipebufs && folio) {
@@ -1293,7 +1272,7 @@ int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
 			}
 		} else if (!cs->len) {
 			if (cs->move_folios && folio &&
-			    offset == 0 && count == size) {
+			    offset == 0 && count == folio_size(folio)) {
 				err = fuse_try_move_folio(cs, foliop);
 				if (err <= 0)
 					return err;
@@ -1334,10 +1313,25 @@ static int fuse_copy_folios(struct fuse_copy_state *cs, unsigned nbytes,
 
 	for (i = 0; i < ap->num_folios && (nbytes || zeroing); i++) {
 		int err;
+		struct folio *folio = ap->folios[i];
 		unsigned int offset = ap->descs[i].offset;
-		unsigned int count = min(nbytes, ap->descs[i].length);
+		unsigned int length = ap->descs[i].length;
+		unsigned int count = min(nbytes, length);
+
+		/*
+		 * The reply may be shorter than what was asked for. The full
+		 * descs[i].length is reported as read, so the tail bytes the
+		 * server did not send are about to be marked uptodate and need
+		 * to be zeroed.
+		 *
+		 * Only [offset, offset + length) can be touched since the
+		 * rest of the folio can hold blocks that are already uptodate
+		 * or dirty, and clearing those would lose data.
+		 */
+		if (folio && zeroing && count < length)
+			folio_zero_range(folio, offset + count, length - count);
 
-		err = fuse_copy_folio(cs, &ap->folios[i], offset, count, zeroing);
+		err = fuse_copy_folio(cs, &ap->folios[i], offset, count);
 		if (err)
 			return err;
 
diff --git a/fs/fuse/dev.h b/fs/fuse/dev.h
index 8d25378c0918..f6c47ae0395b 100644
--- a/fs/fuse/dev.h
+++ b/fs/fuse/dev.h
@@ -90,7 +90,7 @@ int fuse_backing_close(struct fuse_conn *fc, int backing_id);
 
 int fuse_copy_one(struct fuse_copy_state *cs, void *val, unsigned size);
 int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
-		    unsigned offset, unsigned count, int zeroing);
+		    unsigned offset, unsigned count);
 void fuse_copy_finish(struct fuse_copy_state *cs);
 
 #ifdef CONFIG_FUSE_IO_URING
diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
index 1ba763705d91..4b262928e8af 100644
--- a/fs/fuse/notify.c
+++ b/fs/fuse/notify.c
@@ -190,7 +190,7 @@ static int fuse_notify_store(struct fuse_conn *fc, unsigned int size,
 		folio_offset = offset_in_folio(folio, pos);
 		nr_bytes = min(num, folio_size(folio) - folio_offset);
 
-		err = fuse_copy_folio(cs, &folio, folio_offset, nr_bytes, 0);
+		err = fuse_copy_folio(cs, &folio, folio_offset, nr_bytes);
 		if (!folio_test_uptodate(folio) && !err && folio_offset == 0 &&
 		    (nr_bytes == folio_size(folio) || file_size == end)) {
 			folio_zero_segment(folio, nr_bytes, folio_size(folio));
-- 
2.52.0

