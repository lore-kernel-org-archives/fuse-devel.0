Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0BD2264D6
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 00:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892791; cv=none; b=l4W97Y10Q9IikMMl5ggRWyxXNpSy6JyyHI8e1E1MUsKDKn4yIgCjcAtDgnkV3GqyPynScbhWsUDOzRsIFyp7MVQCeCUwCDilZH+Gi6WN+prRlerW8IJpOtihXPlT41MS570R1UP7/Jd+gqUh3dOziSPtcyJGMIVs4DcasPsEloI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892791; c=relaxed/simple;
	bh=v4kHp46RDds4Pwy08vQ6uAhl3z5BXW9+T3EUqO4LtmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoF2clKJ8Mf3c18DWcjDxvzdeqZMcx6q1+32DNU4SBSX3mtGLiHW6Ycb+q0HsAB+8q4r/ooa26Xq1YS7tD2lO/B9yowe1ZWSIXm4E+r2RcWVZSbYaNF/pfWcamr5r64KhFs9hcDvqDvuCLpf3pg5f3o/th33XKIPdmoIf7aizZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXbVC91M; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXbVC91M"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65c305f381eso976614d50.3
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 17:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778892789; x=1779497589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCYGzb/StXRov6Qro1W4XUDs/B78DGquYl4iezQXXCo=;
        b=KXbVC91MYInKE+QoUBuohkbfYviSS6Ipz4q2xIP3OOUx91WOyThEtbCEBqo5+3ywCN
         xGvlcnOsjUc+3HzNmVluD7e1GwyV2YDpRihCqq498EfUGL0WJxi2Pe/ygE/eWF+p0VyO
         /qSl05FLs5sRLpjPl1pq9Wky1G5Q/ybbqk/UtFQnpQiJUv1ZtnAXV/UxIOVTwnDENnkE
         6l/V61UCyFld7S7zqWzNkuJMiEx7KZUmpIRFjW4XyQjoXnp/KzKikogBjlMHigTtln0h
         yDjby3vSU8YgZl4c/SvugtRvqraym55zdoj03Cjww6zs2ES+6HhDPtUT/tPAWPF/Q+bW
         8sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892789; x=1779497589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kCYGzb/StXRov6Qro1W4XUDs/B78DGquYl4iezQXXCo=;
        b=MSyoX2/c904vKthiorExxjAzjilQezFQTfUW0v4XVcm2usFiGkX0jm/izkWj8pseFD
         jNnwhMABmQhzHjf+pxfWAyxuqpHf1klV8Fi2c3IeWkuAFXit3xdTrCxkIpx4Cev4wV68
         H63lWiW8w4A8814DX5dadtvLAVxwGL/Vt/5czBuDP0aL41tZZgqg1AnjCJTzFkqcsima
         Zc2gEWwogDKzhGAUdur7LmztyzBR1qSIODcfwglREVdmfjsVbC7DmK5yxwwrfJZ0xssl
         X0do0jeRf/xT+5msSGYGXOKawq1CHnO8phLcUaDKs1hCMKoOfFL2Yb+A8XQWYXdiM3PR
         MHkA==
X-Gm-Message-State: AOJu0YzxmLzueYFu/37YdM2u/AbgXsl7NW7MYJjDXHCqyewZbVqAbMNy
	Cfz+8PCtLNPmhZELtttPTqeJ5PjCfSLcJ3ZfezAeQU7Ry++DWh2J/TfQ
X-Gm-Gg: Acq92OFulHxP/vkAABHjgQ6owYr9+g9ExANK156UVdEdnbVn6EM4imXWknea+iqI605
	kgje6YykZ/aZI9Cf4H/FGTUvBigVEFupVDWMVzF6778493vNLHYlM13FxRvN/v1OGruT7rAz9yE
	Dh6BiBytpsWFBiDWncIYUqYGfs31UUJAWBzrBzxU6U73906pQn9+mFNCVed/mvyNcSU8YWow4rE
	evoVQqjvSAGAYCQdKW6CXZEQO4MiEsE9/PHRWFG/3L7Nmv3ELZprtZ1Z4yFmZavkrXcgWkHFl1b
	Z3XPuwbI98ule75c5cEMRzPTDtvyY6ZJcsaoWOTodzpvC5DS5O8mxo65iZdxYa2eqzC/Hod2evZ
	TkbtEvIEKe1JrLTqUCGj/kYXxn8Auurbeep9NQtSrfsPkBgbmI6m/1NGqqwC8SdjuRrXvb2W5qd
	1yJediSowOO3BnFTjBdQ==
X-Received: by 2002:a05:690e:d4c:b0:64e:d622:9d1a with SMTP id 956f58d0204a3-65e22663ef0mr6372004d50.4.1778892789538;
        Fri, 15 May 2026 17:53:09 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:71::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0db0a25esm3255480d50.10.2026.05.15.17.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:53:09 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [PATCH v2 20/21] fuse: use passthrough getattr in setattr suid/sgid handling
Date: Fri, 15 May 2026 17:40:03 -0700
Message-ID: <20260516004004.1455526-21-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260516004004.1455526-1-joannelkoong@gmail.com>
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When refreshing i_mode for suid/sgid kill during setattr, use
passthrough getattr if the inode has that enabled.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index b67b3b334e69..fd1b3fd86968 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -2524,7 +2524,11 @@ static int fuse_setattr(struct mnt_idmap *idmap, struct dentry *entry,
 			 * ia_mode calculation may have used stale i_mode.
 			 * Refresh and recalculate.
 			 */
-			ret = fuse_do_getattr(idmap, inode, NULL, file);
+			if (fuse_passthrough_op(inode, FUSE_GETATTR))
+				ret = fuse_passthrough_getattr(inode, NULL,
+							       STATX_MODE, 0);
+			else
+				ret = fuse_do_getattr(idmap, inode, NULL, file);
 			if (ret)
 				return ret;
 
-- 
2.52.0

