Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676138;
	b=Lx2fkeR7GM8FVoCB7RgWHt/3KddozsFbUdHK2A5QRy6RrHCQ1vsKXIRaDuOaNRFd6Q6E
	 hNIOrSilCRiQ5usqRxzFEw3A+dZe6Pcgi5xDKxbeoDjANiw3PagJP8+MGWZoTSv8LXgaJ
	 WRIwJaqKeEqff2jGvH4+PbGzbsp5/HlTXNJriptt4Clr5NLdqXI3habuDRFqrCdgumnV6
	 PKR0944ii97zy6VEznMWNb/7cm9vZA+kAbVHAjTsofmmfmzLz+nq6zaRHO6fNHEZGQjjE
	 oZXocN1iCoz4bYOyX4mOs27Cj85QCj1Qd7RUE0ANGkeyDCTzfd4jBiY0n67hsSR06Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676138;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qI8KevZPcnIlFiEyCqJcYk1hrns8QEKivtpmoOiwksc=;
	b=1uALRrhfLl7hO6tXOg465MgW1Yam60e2VNU2ffMsF01FfBRNFpaEEHAPSc9OvLOA8ebD
	 JzjcH2P9nJxbUszfLtxjHksX1I2b6Yl8pSwBp85ScSfFrZecTasE9C6vh/59mOQoMb758
	 Rk/Eggwe3NPRVDxrHpaK8Jqek0NlCEPeIPVP/AJCsi9eIPix2nLtMGsJSvuIVvwUSmXve
	 Z3tOe5nlj6I4825RvJY0DavFGTGHecS5CXrRMnH2gYf8kq821G3ABm4VHWyhxv3JBekby
	 q1VEm5fRp8L3f2ZQ+ChLk+DmCluQi1l2yYluTHCHrdDNejpqt52mbAWWS6BCSaoWOPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=NL025zz1;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A99606A326
	for <fuse-devel@lists.linux.dev>; Tue,  3 Nov 2026 03:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A99606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=NL025zz1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=NL025zz1tgxOI7XFBgJa0YgH8FyCyzk8tPfLl8PpVFyLu6GlWnkaw0CpUyuAdkdxBw5YhABQ0OJ3V
	 0pfERg728xDAJOSOF4dMOh9OYUs30SmoS+TnzdaUrhHN4JzRTkL9VPl7YYwhDuKOY8iDfSO9iBabm8
	 hybahq5JolOuxdLY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16ae95362b3a-6ab2b;
	Tue, 03 Nov 2026 11:22:14 +0800 (CST)
X-RM-TRANSID:2ee16ae95362b3a-6ab2b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from utest (unknown[223.108.79.103])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6ae95363ba6-946f7;
	Tue, 03 Nov 2026 11:22:14 +0800 (CST)
X-RM-TRANSID:2eea6ae95363ba6-946f7
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fuse: avoid null pointer member access in fuse_iomap_writeback_range()
Date: Tue,  3 Nov 2026 03:22:10 +0000
Message-ID: <20261103032210.5533-1-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
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

In fuse_iomap_writeback_range() 'ap' is initialized to '&wpa->ia.ap'
unconditionally, but 'wpa' (== data->wpa) is NULL when the writeback
of the first folio of a batch starts: 'data' is zero-initialized in
fuse_writepages() and fuse_launder_folio(), and fuse_writepages_send()
resets data->wpa to NULL after every batch.

Taking the address of a member of a NULL pointer is undefined
behavior.  The bogus initial value of 'ap' is never actually
dereferenced: all uses are either guarded by 'if (wpa)' or run after
'ap' has been reassigned in the 'data->wpa == NULL' branch, where a
new 'wpa' is allocated first.  Still, the expression lets the
compiler assume that 'wpa' is non-NULL for the whole function, which
could break the 'if (wpa)' check below and turn the latent UB into a
real NULL pointer dereference.

This can be observed with a kernel built with -fsanitize=null (not
part of the default CONFIG_UBSAN flag set) when writeback of an mmap
dirty region is triggered, e.g. via msync()/fsync():

  UBSAN: member access within null pointer of type
  'struct fuse_writepage_args'
  Call Trace:
   __ubsan_handle_type_mismatch_v1+0x3f/0x50
   fuse_iomap_writeback_range+0x79c/0xbd0
   iomap_writepages+0x64/0x140
   fuse_writepages+0xe0/0x260
   do_writepages+0xaa/0x360

Initialize 'ap' to NULL when 'wpa' is NULL.  With this change the
warning above is gone while the writeback path is exercised
identically.

Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 fs/fuse/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index d5e1cb53d86a..e89fdbeb7d04 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -2257,7 +2257,7 @@ static ssize_t fuse_iomap_writeback_range(struct iomap_writepage_ctx *wpc,
 {
 	struct fuse_fill_wb_data *data = wpc->wb_ctx;
 	struct fuse_writepage_args *wpa = data->wpa;
-	struct fuse_args_pages *ap = &wpa->ia.ap;
+	struct fuse_args_pages *ap = wpa ? &wpa->ia.ap : NULL;
 	struct inode *inode = wpc->inode;
 	struct fuse_inode *fi = get_fuse_inode(inode);
 	struct fuse_conn *fc = get_fuse_conn(inode);
-- 
2.53.0



