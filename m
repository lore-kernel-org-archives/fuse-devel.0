Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E553876A9
	for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 22:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723538; cv=none; b=VJNAr19BqRLSnPEfyXHz7x8xRWiaBdX2SltzXD1T5V6PIoo9SP0+tYk02+StBbVUbRRzFnRfx+kjQ+F+r5SEWIAvJ1Zob8nAFHbGHDZSBj53izwj15TcWxma8ge5xP7mGT+SbSOthwuS/WS/hD4ebgxsQZqGLacnbqRJmuPIg90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723538; c=relaxed/simple;
	bh=7eGrcHOPRi/epXy3nbb+t9zjwJcojNtN6jqe3MjqKso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGDtM1klXzBkwMOKWtqB5PxerXHwDL/nA8e4KuZ+2Wrg3OGEmreAUF1Wp5CjgKrVRc0/S7pStxJX++SF2F/9hCkVcx+5DvWDbPZgRTrUR5AibpJ+NOLXPvuXclSTFati5n6/eaRExWGflfsEHswJaj3WNN8RHUTumAqQWbRQ8e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaehZSod; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaehZSod"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f0884bcfaso2628849b3a.1
        for <fuse-devel@lists.linux.dev>; Mon, 20 Apr 2026 15:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776723536; x=1777328336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDX6CWs5AwK1/C/5xpf5Y7KkyxYjOx+0U4LOn3B9fvc=;
        b=jaehZSodYTAS/VzLNkNY5seR4SnuB903eVovTa5IhPlLEYpEpxkKCtlnhta68qrjcP
         1xZch+qf2v+Wn+mlOnaFEIvt+qhhlsU9c2xvVEM1bPSH3kEXhNQBcIcSbKHJt9EhMkI6
         qhs5UKe0U01cdugRRd8qG/GrYWg+RIymuOx6RTXRohTLn6qLSIZvDkFK+VVgdqNL875J
         oJsl3XE4feEZLe3xibLLNO1O7mc7mea67zZWNYfzcsVhqFeiVBo3AP2GHktcFMSOMoQY
         2+mfX3raQEboAPNpk9pIN1Kt93rqpQhQx4fKyMkcVgzdxWSDiRifbsEjeVxCaEDXDhcQ
         122Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723536; x=1777328336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VDX6CWs5AwK1/C/5xpf5Y7KkyxYjOx+0U4LOn3B9fvc=;
        b=oMLxtxK7pm6Ug5uZnDLGRj4DRZFL7glj8wDcAROvbgKNzmife6EueD8BgrvOykMPSh
         dpiE3ypzrY1ZVfj+OMqg3hMcf0BSXOrxaPji2Hog4bL14GDABGlY9uzonZ0+9VCLR3kW
         YGlTdVj6tVrRSmBy1UUmGTTU8GL3PxLc7vBbRJlnqAlpszOFObAOhwKEsZ8mhkVbC2Hm
         QEjR4zlgTZkJ1w/790Lmzp4b9zXHKhWxNp6xSjZyfVVpsyOqpuejfsaANRkelBgpF8Hv
         KJ6F60ygr5t2jw74YMJk1AjUwe6YIouRc6spHHct43DA4k6pADGpnLwl3ZCdmte5BuDi
         Njdg==
X-Forwarded-Encrypted: i=1; AFNElJ9LBWfF5y0YlQKAHB7VdKFQVdUPOec//gYL2Vlc50tY2l2sfPlEAj+ffu2l8KDmNv4CV4OzqIdL9ZEl@lists.linux.dev
X-Gm-Message-State: AOJu0YxSSVVr+7GjFIphvySmchT7rvGgPEnQtUZG+fPJKm07KAqwGs9l
	rIcmayTFk7z/2bojyWHl9n13Ub/pAFnhYBpz+Tuf7pvgEpwwIQtmMPLl
X-Gm-Gg: AeBDiesshEsU0BUQIJ1hDDfeTrEjOTHeSHDAKQ2G5qJYCsXvYjvvJfqwZAiYiCqmMBz
	dZ2d7Gwdm1C4R1FEiRESaOGN3Fn0Q10h5pNVKqEu6wgM7VOwcreFzmR/kVVptPbikoluVna2LWZ
	nrD9dWSd7txFyZV+G2E9NMmbVsqPzFWmAihAMKiUTC9fqFOi4OZTRzxv5CCkJKAo1YbrbrTG17g
	1evrRruDPrvnUfHo0igpnwLymZDO82Mghr9cGmn7fQcC6/53Da0T3Ex7rNYJK+FCcc3E+EULpI4
	FH64HzVCMviJCndQyRCHEXGRraUnyk64OfyBFWoVbiN7A4ddy9wPqv2FL5fPbivwRiQX/jdl54k
	JwAnOZkNxc3qy56iooCXXh++49a99mscDzlXpnk4JzUaFXJ7xolXj5PbbvDif0iMPvsY4TPoee5
	mp1IkAUU1nLsdn7l9NXpCZQ+/6/gFs2LB4xf2nhyE=
X-Received: by 2002:a05:6a00:3398:b0:82a:1428:da3c with SMTP id d2e1a72fcca58-82f8c90480emr15198535b3a.35.1776723536581;
        Mon, 20 Apr 2026 15:18:56 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:55::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe74d8sm11638674b3a.46.2026.04.20.15.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:18:56 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	fuse-devel@lists.linux.dev,
	luis@igalia.com
Subject: [PATCH v1 14/17] fuse: use passthrough getattr in setattr suid/sgid handling
Date: Mon, 20 Apr 2026 15:16:34 -0700
Message-ID: <20260420221637.2631478-15-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260420221637.2631478-1-joannelkoong@gmail.com>
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
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
index 637761de2c5b..ff9a92d8a496 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -2524,7 +2524,11 @@ static int fuse_setattr(struct mnt_idmap *idmap, struct dentry *entry,
 			 * ia_mode calculation may have used stale i_mode.
 			 * Refresh and recalculate.
 			 */
-			ret = fuse_do_getattr(idmap, inode, NULL, file);
+			if (fuse_inode_passthrough_op(inode, FUSE_GETATTR))
+				ret = fuse_passthrough_getattr(inode, NULL,
+							       STATX_MODE, 0);
+			else
+				ret = fuse_do_getattr(idmap, inode, NULL, file);
 			if (ret)
 				return ret;
 
-- 
2.52.0

