Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC7019D89E
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 01:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993503; cv=none; b=SClbsdr+qe2aooiDm8fLU6jk5r5rZx06Y4U1uROg9XgTAgtMTkx50WcfIX1fh0oJad6Ukyf4lYM9zIjuwjGc/5qIqE1mDi4GhAztkh0ij7hHmeB6kN33VaQ5ozY+LnUUoH/4EYeAxs7raobEzc9kqq3ukA3tvH4IztcZfzUDbK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993503; c=relaxed/simple;
	bh=wsYMaxsq6/7GQqjFiIOjruT5YK4ojw1LkeoIErzFA4Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EeTwd9hRphcD65QFiDq3cFLFeWyJIZduXrIBxQQDWB3yuji8HBXi8DQjulzqpR1TRLIlNribhgz7nBInPA3HaFwQd8407yLkLiOj7W3+pUvtCKfCSim374lnUbOn6eQ9epiP50H6xYQl44ROsy1FQZXHkqyF7XaiA/+aj/Ouwz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWWW72zX; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWWW72zX"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82fb2d0c5d1so3172541b3a.0
        for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 18:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776993501; x=1777598301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dobBwOMCwui9jbeJImKsDOhw9t/X141OQSOGOtfpk6k=;
        b=YWWW72zX7i5Dq5ZdApkRsKPtcwg0hJTo3IfIZSjTlZ0X1zcVjno4VNfbWRPxAgpM5Y
         9dgCtgZuSHez3MD3JT97orWZZPQY637sXx9dqvQhYKl/OLzF+Vef5nm8eIFTH9Ow1PwQ
         cbyhw8Ior6j3efVPZlDX7Nm1ILhwnZIpCSu73uFfm4k69oMbL0sE4TfsZAqXXNGlfDzp
         e3E+Z4E2+nCR/DCnGoRkMOR8D8QKjmWVRBTdAfZ5YO/anFCSaZXoSzz2wIOM0mdDl25+
         rSWvBRyYJ2r0vV47xU5LeZrqt+NO5ZkRvTJVXpDN6qU+fnzWXbJHNVvGrgng+mZ4i3fS
         zpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776993501; x=1777598301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dobBwOMCwui9jbeJImKsDOhw9t/X141OQSOGOtfpk6k=;
        b=MJiQ/RUK+W0XlE5JcxWS6QcxCgGFeRWPc5+BQ+F1OSNXFCZMsTAmxctVHiYPS18+/t
         mk2x3wpTiq3zW/qbgUcC0sI60FvP/0ipuYbUmHINoubzqOcSzZEqjFpfVEzrcoqN6VLP
         YeDGwaJ3HwaYBGzrGw+9N8riPgCBKvKjbqzOfSFZeMqo+1l1/+mpx28LhB190lO2eQBA
         SZzBT84lNHiE0GGxn4M9Kq0RkD2uWuOKnswbPy3HKA0J/whrf9HbmmI7kdg/ZWdFAjzg
         QXy+ppL9Hdvv1bo3HnxCW4zpBF0Vp02Yx5ltuiqHpA9JgkyFRc51x40Bg5I919bhS8Vc
         NC+A==
X-Forwarded-Encrypted: i=1; AFNElJ++0CC1NC7R5Yy3ZJObW3/gF989+EYVJUHTzKYJRNeM3TbeFj9qSlI3floOIvDc39F8ae/QVlZBivNm@lists.linux.dev
X-Gm-Message-State: AOJu0YxYP02PC/oMVw45DcfD7fFkTlJu8sC0CYYm50SqHDG9QllxFTpz
	FVi/iSe/DXDBHhI5CCs125s1r3DxMRPf4WPGsa0vYqScjRE6sD4rEuvpO30fQA==
X-Gm-Gg: AeBDievveYF6FmNRjvpEebduzIFFhiW/HwmDw+N3RYj922Dzy7RuWF6As7hO2bUspLS
	n2gmL8Gbo5xhDeIkuv3rL656LRnqXJHZa5ugV2sBj4kW837mLatkStyludq+tke1svwv/mJeYbk
	23/PrA2TdAkcxahZbi14fxLjYlDtHwPiwkWJaHjOqWO+A9ez+OJdNJWc0Kqod7guNq+JOgtI5gm
	DicC8K3tUo0QO/RzVqge3EW0JtrLaVZwGZ1FhSPRSIvtK7Y2AclBhMKfTn1IvI3kd5tsU58WHII
	eyeJVa0FemBsukWzdGurotBebOU3u6ESEw7O20XaBkeSDHOOh8OygRTOyyvdIogrdBjdvi05yxG
	MHvIeV7F5LZX3Edewme4FcxnARbss2B1LsZiPc0O3mtKX3ZTIdcYdPDL6g7d130Xc8HrCr3+utR
	9sIkXodUjGSPLXI/J9jryG7Wp6ri5O
X-Received: by 2002:a05:6a00:4b56:b0:82f:47ec:944f with SMTP id d2e1a72fcca58-82f8b50fceamr24034749b3a.16.1776993501162;
        Thu, 23 Apr 2026 18:18:21 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:47::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe74d8sm22045972b3a.46.2026.04.23.18.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:18:20 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev
Subject: [PATCH v1 13/13] fuse: clean up setattr()
Date: Thu, 23 Apr 2026 18:16:46 -0700
Message-ID: <20260424011646.457682-14-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260424011646.457682-1-joannelkoong@gmail.com>
References: <20260424011646.457682-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use cached fc in fuse_do_setattr() and fuse_setattr(). No functional
changes.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/dir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index bdeea7065c5c..e97b216f685c 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -2220,7 +2220,7 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			inarg.valid |= FATTR_KILL_SUIDGID;
 	}
 
-	attr_version = fuse_get_attr_version(fm->fc);
+	attr_version = fuse_get_attr_version(fc);
 	fuse_setattr_fill(fc, &args, inode, &inarg, &outarg);
 	err = fuse_simple_request(fm, &args);
 	if (err) {
@@ -2307,7 +2307,7 @@ static int fuse_setattr(struct mnt_idmap *idmap, struct dentry *entry,
 	if (fuse_is_bad(inode))
 		return -EIO;
 
-	if (!fuse_allow_current_process(get_fuse_conn(inode)))
+	if (!fuse_allow_current_process(fc))
 		return -EACCES;
 
 	if (attr->ia_valid & (ATTR_KILL_SUID | ATTR_KILL_SGID)) {
-- 
2.52.0

