Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F054A39EF24
	for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 20:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246597; cv=none; b=B5nNVzv/NsjZ+Oqb55fp5EBeHEitbSy98a0OeOsKA81l+59aarukv59MdM8AEFbEib1TQJTmNImDCVBubtMlnssASvR6qL9wfTt9cYcbig52TZ/99IIlbdYi4s92jsI++rMKWSI/1wVVz8PM0NWBUTguulXUI2jTjhBJoyHjoH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246597; c=relaxed/simple;
	bh=hVapvoYjzspplrcSGzdn17KYdrV1wLJkNy6Km1mftHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmuE0jsAL/fGBwwnOkamK0yhpcFeOrYehUNbV/oz8xhwoybb6O/J5LURlfgK6hpVUOHZYrLx6y1ELUgvHHkkJmIBBmfh17GCR3k+oVd00uYrmK2wK3aVbnQLulj9z7ixnorMx3PYOObpTIvkXaBuaUupuwjldl6fRJZ9nN/hiN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcnzwQ4Y; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcnzwQ4Y"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4864a5c83f1so232272b6e.0
        for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 13:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782246595; x=1782851395; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gurz/sSxVuazGvnegvHEJto36HD5VGkEPN8fTt1VmQ0=;
        b=PcnzwQ4YnSuZBufJwlgRdppbbL9pfinUmeRPID4D5Z6001Y+LEzpi5rzGyVrmsScKG
         8aWvJLQrxobbTWjnQyjCf4O49aYCA3YJvTrWEackxRlSPfdpAGHSAPggKpCGfzT4yUrG
         XY60Rf5OVAeSZTLNJ0AwwUMXwi+6O1ONDqXLS4JYlwFgnh23iRWyWnM6rqLv3tt9ZGOO
         G6TyygTkfPPNyILtFkEPErnJy31PPUEyZhsSNhgIy/apvK1Vu35pOcGSPmTZ0ITQ4Y3w
         jXhiZrN7IFTi6bEOsY4VWB54cem9OYcv8zWzR3EdM1tEI7HoowDH6uzyEvKRcvOqzpQf
         3tiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782246595; x=1782851395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gurz/sSxVuazGvnegvHEJto36HD5VGkEPN8fTt1VmQ0=;
        b=hQp8ngIQidk5casyj8/1CF2N3k86fqCYsd3YJtraN4Du2Y8tKqbKKLSJYROHVOryNJ
         haJBdFH7tvQLpz1Cw5hyC0S5YkWoCzGFfizT3hf6FawKnykrZ0MjIpp07aLx06Cx0L/v
         /Kz95rdj94OJ2ijdNJ5BjqxDedP0eTzCPvZc8RjZwDXam3zQTv5rX/kENJZh5qCVLuRz
         oDYhiN0jAeZzRYDWnq7QbEY4xuSiM5ex2VZShBg/OL3GZQnmCvt+pEnsWxH6axnELEIw
         LiWOtjslpdchRxjljhVSdoNiDrCZcIAMZK7bDhnE3Kb6nbNPOiEuagHIDXgxGASoQB7m
         IKeg==
X-Forwarded-Encrypted: i=1; AFNElJ8GGjWB334YkNqVO5OmFcjQDQoRlg8he0c1T2Rm9eRKXIi6LZZTKljf3HESmWnuIpYqXWtw6q5//WgD@lists.linux.dev
X-Gm-Message-State: AOJu0YzvcirVH+TtzVIF8ZYrCiRqptkhmWud96wcQZL3gM/JKc36P9Gp
	8tfmkEEvxPj+woc2a4HJoL8Yzkr4IzhTRkY5/6/lQPxgCR+SFBtljO3Y
X-Gm-Gg: AfdE7cms7rcmuGYooIdsycHiL0PvlhQ0W7KMrO+UXIWkhZ+H0PMRqbzPe0GVjq/2NhG
	CITsDfkO+8yn7NA/a1fZR4c2IK8TGyEAVCdTY/6ym3CeVwBEiLK4c9EMXorTjgrWgIla0BX+Msf
	3M7cLlXV7ie8obNSu9b6pCv0bhKGuUrsSGwyjudUrHv5HauJkAbk+dE6grg9WiPNPfzAWGZ6OWp
	OI7W4c1lVxaKDG3y3XweASnJn4Box1uNHXhbCavDLGqNuOx2/1vgfpISYTzjrrYFJQZ8W3tyPZG
	ByaUUt69NkVbWuJYLIsTXIPqDT4FQh0LQ/HEIZFlxko+lwv7anvtSdZYYz4q6fdLiiu293h8/OR
	4sZKD68Xh2R6iTcu92KwKK3vUB46qt2cbvy/yYJljo44nVFzkQhX9BJYMtQ4L73EgBUBOcx/LaG
	wfBMgwWHJXV/P5RE/8rOdvPHP92dHBtMsFSETh4dcVuYa9TusEukt0e8WYxDfCMr3M
X-Received: by 2002:a05:6808:2294:b0:489:6b0a:f712 with SMTP id 5614622812f47-49079b97d56mr270454b6e.35.1782246594998;
        Tue, 23 Jun 2026 13:29:54 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4d::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48aeea473f4sm7235837b6e.18.2026.06.23.13.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:29:54 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org,
	hch@lst.de,
	djwong@kernel.org,
	miklos@szeredi.hu
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 2/2] fuse: use iomap helpers to update folio uptodate state
Date: Tue, 23 Jun 2026 13:28:42 -0700
Message-ID: <20260623202843.2064992-3-joannelkoong@gmail.com>
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

When fuse enables large folios, a large folio will be backed by
iomap_folio_state that keeps track of uptodate and dirty state in an
internal bitmap.

Fuse writethrough and notify store paths currently set or clear uptodate
state with folio_mark_uptodate() / folio_clear_uptodate(), which touch
only the folio-level flag, but on an iomap-backed folio, that leaves the
uptodate bitmap out of sync.

Use iomap helpers to update folio uptodate state, which will make the
corresponding updates to the iomap bitmap as well.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/file.c   | 6 +++---
 fs/fuse/notify.c | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index e052a0d44dee..12a2aa605f6b 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1250,13 +1250,13 @@ static ssize_t fuse_send_write_pages(struct fuse_io_args *ia,
 		struct folio *folio = ap->folios[i];
 
 		if (err) {
-			folio_clear_uptodate(folio);
+			iomap_folio_clear_uptodate(folio);
 		} else {
 			if (count >= folio_size(folio) - offset)
 				count -= folio_size(folio) - offset;
 			else {
 				if (short_write)
-					folio_clear_uptodate(folio);
+					iomap_folio_clear_uptodate(folio);
 				count = 0;
 			}
 			offset = 0;
@@ -1335,7 +1335,7 @@ static ssize_t fuse_fill_write_pages(struct fuse_io_args *ia,
 
 		/* If we copied full folio, mark it uptodate */
 		if (tmp == folio_size(folio))
-			folio_mark_uptodate(folio);
+			iomap_folio_mark_uptodate(folio);
 
 		if (folio_test_uptodate(folio)) {
 			folio_unlock(folio);
diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
index 29578104ae6c..1ba763705d91 100644
--- a/fs/fuse/notify.c
+++ b/fs/fuse/notify.c
@@ -2,6 +2,8 @@
 
 #include "dev.h"
 #include "fuse_i.h"
+
+#include <linux/iomap.h>
 #include <linux/pagemap.h>
 
 static int fuse_notify_poll(struct fuse_conn *fc, unsigned int size,
@@ -192,7 +194,7 @@ static int fuse_notify_store(struct fuse_conn *fc, unsigned int size,
 		if (!folio_test_uptodate(folio) && !err && folio_offset == 0 &&
 		    (nr_bytes == folio_size(folio) || file_size == end)) {
 			folio_zero_segment(folio, nr_bytes, folio_size(folio));
-			folio_mark_uptodate(folio);
+			iomap_folio_mark_uptodate(folio);
 		}
 		folio_unlock(folio);
 		folio_put(folio);
-- 
2.52.0

