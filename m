Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890463;
	b=FPSJW71YrQzVQzM2cLlzbpN2Ao2RNrYBL5bj/UyqyuqjoDmKBjlfgBOG3NrV/HHatkHs
	 pVTt9BcQK/OKUE2q2R2jgOQASsJwFIuIMP+WOw1T3km4qBP+j9aU204JqJ6eVqAAUGp6t
	 IYlfx2c5Wd15OSLlMlW9yW9j/TBtuOHskW3+HBAVQ+ZFvGmvXI9DVR4VZ246qDMcdjB/D
	 DQjOtyOFF2HwjHYUy2qbenp5DqwXVHxRvDXi/EsN2MwHU4o5XAC5+ACFwesXAqsVizL/3
	 976rozHjJab6BvV6e6haM6KGEq5GPBx9rxIKiDmHptn+6f2LNxIHDr7KHryJ3KSdSGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890463;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=LTQ0IkCaPw9/kDb96o3oDtuoLshjQLIoZ/FR6Hq8me0=;
	b=5PZkDAsy3w1MCMJGdq28MwM5ueF5yO8XG77Z72D1srvwprsX9UUuUA6j4wtHszrS2NZs
	 okPFr9lj4eTodBS5NoXhVbueQ+hhKXwOoHn9Aavxyx7Xof7UnUPPMqvzATCnVcxHtkd66
	 Y6CEulfOATjezTKY+/A4zD6cghpbaKvno33oBS8vNyeLwEd096IuEoVMMW2b8pm2dRbHo
	 hV4KOc8tKeSxFcMYNbWmu1ktfqv9wFVARPNN2oRHtD15xdfPod4tVGxSC8cHVlMrDkIaV
	 6C+IlrWd/VlrI9vtxi4Ri8LrZns4UoYSozBcD8X11XJf6Nz2C5UzTEa34Mapi7i9cSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d8rdRrC+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B468A606A32E
	for <fuse-devel@lists.linux.dev>; Thu,  5 Nov 2026 14:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B468A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d8rdRrC+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793890461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LTQ0IkCaPw9/kDb96o3oDtuoLshjQLIoZ/FR6Hq8me0=;
	b=d8rdRrC+BSqE63lziLN2UDrA/jNxIml5d2RYA3KtH/j+6C4lX+g2eSsoKeHayhi9d5HGps
	hK5iAD1v8tX/9S3idezKdN7gDdwcOSXaoGNaatLFxw+zk33p503YhcAWgTWZ9d54Psmoex
	EdcUUTnzGrf6oUcqdmO6RUErBBLQ4tI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-oyCGw5D0PpODDA3WedtIWQ-1; Thu, 05 Nov 2026 09:54:20 -0500
X-MC-Unique: oyCGw5D0PpODDA3WedtIWQ-1
X-Mimecast-MFC-AGG-ID: oyCGw5D0PpODDA3WedtIWQ_1793890459
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-490d2ac331bso1249223f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 05 Nov 2026 06:54:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890459; x=1794495259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LTQ0IkCaPw9/kDb96o3oDtuoLshjQLIoZ/FR6Hq8me0=;
        b=nCJ0TFKlYs4CVTFFIDM0gFPmV8OF/yPCo7oAv75k71GNu1+CSBdsy53ZxhJfWx1iJp
         KaBd64OfH/1SixrMVjNER/tV+THV7fL2YlgvIGr0BCNiiP1j5Sb6rlCS0WEtjmkoffuS
         09nrQ1YMBdvGskRaghiuguBBjPYP0PVHGJVzhIY+d0jk8pIz2Bg4ImcChepSxJsXJKFS
         Lwm01ZXqQ28NCAEyQPM42A1CXmALIU1w7gr9zE6iZuUxhZ6ppx/rLlRqb0TTks3eqR/l
         mO9+GDS20cnNNba+mMK331inUezCvR+50+kssjcbtB6wSZRy5WqluBPJWqNbYyyHjDRK
         eGqw==
X-Gm-Message-State: APuU4Z9c98M9JWwvbLy2lor50SrankP+GD5ow61+76EuVt5IdptF5Lt3
	UysCsGRFgMur63hhljAiJ2M3udoqJlxvPAyiK2grfM6jqOPWJxMYzjgOaQKahA5xmTChnFxGJP+
	W+dfTfQD3w3eDD2Sr0vPJBYaT7Vgy2sWRKulcJAqkqktttGImj0WPHb8955s7U82xohJ2xCcyWE
	CSDbr5+N9gYPayeOMIu8St39grH6RP83fijuy/geT5wYSrhEE=
X-Gm-Gg: AYBFou2uSf9+Hx60oCtjxEjeLmt8QCXjqwFU7PgIJOaMnBEf5FsxAEj2yB0NMXc3z+P
	CUmO6H8fEstnoj4EL90vzv2ltY/etbrsEAWo8aqhxCgRU8O83HmgKZvAIlQs3BWMxUYdek1mZNM
	YVXO67Wu2ceWBmxFZKQgxlSmxq6+37TW2EKNZnZqI2Vjif1SGOM0V7ck1W0ipYMI6f4+j3X3swv
	KjS09m1rNDOUg+yYgsPRxrXEi8cZBtL57Z12Kv4im2ZwRsfwBj443YSjTJBGuAXf780p/Q3sn/n
	YyDF7re5Y7B9rguruw7NjYurJ76uV1bpStYTaiM/opdIficwssyl4IRnn+crKhI1pIU7pHJ4CxP
	hCogicTNxOfc3sE6Xh+W0tTVJWGyDD75BX1PlOOK1OVHL9z4pEle7oEEBKfebGFrEN4PzP44b5n
	pwlQwvmZomtF3Ci/jgKWiXkNzNWSuq6XwvGrqW8BFHx0M=
X-Received: by 2002:a5d:588a:0:b0:48e:932:af0b with SMTP id ffacd0b85a97d-48e6e4f6a88mr40840242f8f.32.1793890459262;
        Thu, 05 Nov 2026 06:54:19 -0800 (PST)
X-Received: by 2002:a5d:588a:0:b0:48e:932:af0b with SMTP id ffacd0b85a97d-48e6e4f6a88mr40840192f8f.32.1793890458687;
        Thu, 05 Nov 2026 06:54:18 -0800 (PST)
Received: from mszeredi-thinkpadt14gen6.redhat.corp (188-142-154-142.pool.digikabel.hu. [188.142.154.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed08536dsm9296429f8f.32.2026.11.05.06.54.17
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:54:17 -0800 (PST)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Subject: [PATCH 6/6] fuse: derive short read EOF from the request offset
Date: Thu,  5 Nov 2026 15:54:10 +0100
Message-ID: <20261105145412.83058-6-mszeredi@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105145412.83058-1-mszeredi@redhat.com>
References: <20261105145412.83058-1-mszeredi@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 866EACFX_rVqocmRgVsBXkqfwAjV5aLs-2NqbeV78e4_1793890459
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

fuse_short_read() computed the new file size as

	folio_pos(ap->folios[0]) + num_read

which assumes that the read started at the beginning of the first folio.
That is not true in general: fuse_do_readfolio() may be asked to read part
of a folio only, in which case it passes the offset within the folio in
descs[0].offset and correctly adds it to the position of the request.  If
such a read came back short, the EOF derived from it would be
descs[0].offset bytes too low and i_size would be truncated accordingly.

fuse_send_readpages() made the same assumption for the position of the
read request itself, even though fuse_copy_folios() fills the first folio
starting at descs[0].offset.

Neither is reachable today: sub-folio reads only originate from the iomap
buffered write path, which requires fc->writeback_cache, and in that case
fuse_short_read() does not update the size at all; readahead always starts
on a folio boundary.  Don't rely on that, though.

Add fuse_folios_pos() to compute the position of the first byte covered by
a folio array and use it for both read requests.  Make fuse_short_read()
take the fuse_io_args and derive EOF from ia->read.in.offset, i.e. the
offset the request was actually sent with, so that the two can no longer
disagree.  fuse_do_readfolio() now keeps the attribute version in
ia.read.attr_ver, as the readahead path already did.

No functional change intended.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/file.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index f09a0a348a1f..2242df3654bf 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -845,8 +845,19 @@ static void fuse_read_update_size(struct inode *inode, loff_t size,
 	spin_unlock(&fi->lock);
 }
 
-static void fuse_short_read(struct inode *inode, u64 attr_ver, size_t num_read,
-			    struct fuse_args_pages *ap)
+/*
+ * Position of the first byte covered by the folios in @ap.
+ *
+ * The first folio may be read partially, so the descriptor offset is part of
+ * the position.
+ */
+static loff_t fuse_folios_pos(struct fuse_args_pages *ap)
+{
+	return folio_pos(ap->folios[0]) + ap->descs[0].offset;
+}
+
+static void fuse_short_read(struct inode *inode, struct fuse_io_args *ia,
+			    size_t num_read)
 {
 	struct fuse_conn *fc = get_fuse_conn(inode);
 
@@ -856,8 +867,13 @@ static void fuse_short_read(struct inode *inode, u64 attr_ver, size_t num_read,
 	 * reached the client fs yet.  So the hole is not present there.
 	 */
 	if (!fc->writeback_cache) {
-		loff_t pos = folio_pos(ap->folios[0]) + num_read;
-		fuse_read_update_size(inode, pos, attr_ver);
+		/*
+		 * Derive EOF from the offset the request was sent with, which
+		 * is not necessarily the start of the first folio.
+		 */
+		loff_t pos = ia->read.in.offset + num_read;
+
+		fuse_read_update_size(inode, pos, ia->read.attr_ver);
 	}
 }
 
@@ -866,7 +882,6 @@ static int fuse_do_readfolio(struct file *file, struct folio *folio,
 {
 	struct inode *inode = folio->mapping->host;
 	struct fuse_mount *fm = get_fuse_mount(inode);
-	loff_t pos = folio_pos(folio) + off;
 	struct fuse_folio_desc desc = {
 		.offset = off,
 		.length = len,
@@ -878,10 +893,10 @@ static int fuse_do_readfolio(struct file *file, struct folio *folio,
 		.ap.folios = &folio,
 		.ap.descs = &desc,
 	};
+	loff_t pos = fuse_folios_pos(&ia.ap);
 	ssize_t res;
-	u64 attr_ver;
 
-	attr_ver = fuse_get_attr_version(fm->fc);
+	ia.read.attr_ver = fuse_get_attr_version(fm->fc);
 
 	/*
 	 * Don't overflow end offset.
@@ -906,7 +921,7 @@ static int fuse_do_readfolio(struct file *file, struct folio *folio,
 	 * Short read means EOF.  If file size is larger, truncate it
 	 */
 	if (res < len)
-		fuse_short_read(inode, attr_ver, res, &ia.ap);
+		fuse_short_read(inode, &ia, res);
 
 	return 0;
 }
@@ -1069,7 +1084,7 @@ static void fuse_readpages_end(struct fuse_args *args, int err)
 	 * Short read means EOF. If file size is larger, truncate it
 	 */
 	if (!err && num_read < count)
-		fuse_short_read(inode, ia->read.attr_ver, num_read, ap);
+		fuse_short_read(inode, ia, num_read);
 
 	fuse_invalidate_atime(inode);
 
@@ -1090,7 +1105,7 @@ static void fuse_send_readpages(struct fuse_io_args *ia, struct file *file,
 	struct fuse_file *ff = file->private_data;
 	struct fuse_mount *fm = ff->fm;
 	struct fuse_args_pages *ap = &ia->ap;
-	loff_t pos = folio_pos(ap->folios[0]);
+	loff_t pos = fuse_folios_pos(ap);
 	ssize_t res;
 	int err;
 
-- 
2.56.0

