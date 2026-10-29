Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270358;
	b=e5RfCkF5Qgkb5w7s0jqVtVj/axhE5uhdrpr9bczbpFKG9aWiKqFYVXL7HO+H1FdqviUR
	 PmFpDCba367jJxzCAp8uEyrccQhme/k9DLBwusHFW9fj4qCcckM6+oB2zeW9ljT1gmx9g
	 r2w8cKwN2VE2nWS2wNwpEDnIF8C1al8K5Los6VSn9Cslb871rPoDn/DABGjOmtj4v4CCv
	 KUW1aWyRD/hB2KrTNTLGUobvhlnE74T2K/fYQFUvu8uOlBZJ4AlqLr9fHJpL/3rhkIwsX
	 6xYz/azASHq/RTyaT44AYog8OKFhUYzHdw5Il/CuV0Kmd/KIKF840v2qB1fkyZ2NZeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8eGXEP28tBZsuowcYGbYE9SLL2m94ii1a9Wvq9NDd3I=;
	b=e5DiY+SDcdB4UA3j+6jRYd2EQsdLVIEv0JPGtr63tVb8KWBdhdK+Dro0jd+UL9cQV6HP
	 bg93QiZRpn/Zm1aDlNdnhfUCNZnPKPv5XvGwhGty9aCr6Ej9cUFN6eps2df9Q3eU+wI/4
	 GMeq8pC2uCAlzUgbgYaJGn9W4iHrEzF3HgF9MM+ho70rlQqqWQ8vnZzsiOoFM4Oq3g3LE
	 ptFIE1SmZl12VkHHzpM6ALW9SgVltpGLnP26IUkmEqNvRhG/xqwMvm+uFUG3J11s584yT
	 9Cs1BrrvB1kjg4uoGa2lYWqXd+tnJhxNGNJUcwl9G6ss4TvvLbVkAXGSG+ldr5KPfbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xOH38EMC;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64468606A332
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64468606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xOH38EMC
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so3433354a12.3
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270357; x=1793875157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8eGXEP28tBZsuowcYGbYE9SLL2m94ii1a9Wvq9NDd3I=;
        b=xOH38EMCPBaHtfFulqR12gm21Zf/JlSNC/7CVg4FNlRbC8y8dUNgW8wxJSOyUkg3GS
         9i6gRV7pTzdJzmfCveDLCnr5lIyDCPhmEugRdq6CSVQiZebKNIL+QC5Ao+toCroXzjgs
         o7ZU4BmgKjai8ZKSXezZW9zUxV+R8/JPm5KFxgMYH8nzs/X+Y6NW/PtiPYrIK/C/qyp7
         RpktHPVVQDfUBirTgymf2cobAhCm7m9SfEmf/wdiVkrD+aBo4eGlh/K+TjpBpEWXBwJe
         CRA/ikUIVknQf6Cvv+wyzlz2SCV+CRu1fI42as9ZGqBT5M6MdzSeOOxSz5bwiDsG75gG
         3P+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270357; x=1793875157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8eGXEP28tBZsuowcYGbYE9SLL2m94ii1a9Wvq9NDd3I=;
        b=KI4VqGto0zKOLb9zaQJ+V1/HtPqEFeN80RN+okd5sHniSEVfCOlt1XQ5KBtITvfiha
         oIuN6oHG34ZP0nm1n0kggQGaYMNym6NiHLTNgdLpcOqMgWkBnxtBj7jRurFADvTaK1zV
         X2wyxCTUSXUimljr/Qo4C0ndSPWdqMpTTxUpN59ozoSxCov1x6+anLtDxujuhoPcQ3zQ
         5KHJmGrDQI9AU4Iy2rHBNz2IvbMVynGqO2H46cWLBfoFOjb+m1oSNvuLGZVqIsV7uC5C
         mXUoI+kQmTJvZJyU3zPiPzDbMOTkTi8lnc0C9JX9otwWAAAyU7jEt0Qvtja3nQPeQNdc
         QTrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFb2Egip6Pnn62qf9fRK2HRki4KgmVItJzHcrPjiAnah+JOxMSXTzH6pz9hck+0fIzGdYfXL7OO1Fc@lists.linux.dev
X-Gm-Message-State: AFq9FYLq/njmNsCik8sfKP6QpPh8ViLYtnGdz8W38JQzhj4EfoPRja3I
	ZwOiwLpgdMzbMoRhuWMmIM4PGYozkAxP4Jxp3e/vGjC5q3FiCC63/YrB
X-Gm-Gg: AYBFou0hGfYXY3YYgUxcKcVbNON92glq632yW4rlM7sMzPbT4XQQ4jRSJhP8Ho9nOCp
	fO7fuQdsU5gCP6YYmlMcLuMLPHS1mg2P0Evd1mloliQcvhhnP+ZCIqQb0g8dWMwWrSj1bN8dpTp
	jJNUtNpQhwCekIuRPYc8cmIzsmcUWBdK9X8FA5NcAQYTeJ/uMQ+bNqohZOcm1uOzkpFDGQFxBkt
	NvGlTP8cE5hDAfPH3BtEueka/Bhcp4sGiZgomGkpbiyL87W0WCqDiLtz09oqAp3j6tlparL1DE/
	XGWq5XooNFpM67B+aa+50gcb5CxCbNeoczA9Oz3Yo3+cLDkisplkqQKOd1dBeO+oXTCvQ5R8o1r
	TlyAGc+DL86266MIkvNkhgc6xgzEi2hvtbpO5AqEFVJiJoGzcJMYpsa7+HI5BWLgZNObKWQhGyO
	0x4v9yrD13WqGn+YKElcL+Rrdkt2ebX54vWUW1rEWLO46/hykCQ8kjJGwUaXAE+oXXVPuAeKuxy
	8V89NxCOWaCJgxveR/mHwWKYpza/rloFchkPzocFV99+O320Bh1Mng8pOj7w0QMyxKIolUP1S8b
	RssaEvOpnGHTqwb1PZjcgkluPJWzeR63HnM5+C9GI66wzS8IRVQ+5cVnzVFUOF7EQHR5fR1FY3k
	HZ+z/B+0UniM=
X-Received: by 2002:a17:907:1b1d:b0:c42:a326:78a9 with SMTP id a640c23a62f3a-c49be054ad6mr449212166b.42.1793270356461;
        Thu, 29 Oct 2026 03:39:16 -0700 (PDT)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a4e2401bsm400326566b.84.2026.10.29.03.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:39:15 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	Chris Mason <mason@kernel.org>,
	Fahad Alharbi <fahad@codepure.com>,
	stable@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 01/16] ovl: do not copy up an xattr value that was never read
Date: Thu, 29 Oct 2026 11:39:05 +0100
Message-ID: <20261029103913.2785828-2-amir73il@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029103913.2785828-1-amir73il@gmail.com>
References: <20261029103913.2785828-1-amir73il@gmail.com>
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

From: Chris Mason <mason@kernel.org>

Copy-up stores uninitialized kernel memory in an xattr of the upper
file, where the user can read it.

ovl_copy_xattr() may only pass bytes to ovl_do_setxattr() that
ovl_do_getxattr() has read. When the read fails with -ERANGE the
function asks for the size again, and if the new size fits the buffer
it stores the buffer although nothing was read into it. The buffer
comes from kvmalloc(), or it still holds the value of the previous
xattr.

A FUSE lower layer that answers every sized GETXATTR with -ERANGE made
copy-up store 4096 bytes that the server never sent, with a kernel
pointer in them, as an xattr of the upper file.

Fix this by failing the copy-up with -EIO when the size that follows
-ERANGE fits the buffer.

Reported-by: Fahad Alharbi <fahad@codepure.com>
Closes: https://lore.kernel.org/linux-fsdevel/CAOQ4uxjhfpNVvoVrTayj46H2CViTOc3oxzM6xdb8+E7ikE2CSA@mail.gmail.com/
Fixes: e4ad29fa0d22 ("ovl: use a minimal buffer in ovl_copy_xattr")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/overlayfs/copy_up.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/overlayfs/copy_up.c b/fs/overlayfs/copy_up.c
index e963701b4c877..c220cb5d0b70c 100644
--- a/fs/overlayfs/copy_up.c
+++ b/fs/overlayfs/copy_up.c
@@ -131,8 +131,12 @@ int ovl_copy_xattr(struct super_block *sb, const struct path *oldpath, struct de
 
 retry:
 		size = ovl_do_getxattr(oldpath, name, value, value_size);
-		if (size == -ERANGE)
+		if (size == -ERANGE) {
 			size = ovl_do_getxattr(oldpath, name, NULL, 0);
+			/* Nothing was read into value, so it must not be used */
+			if (size >= 0 && size <= value_size)
+				size = -EIO;
+		}
 
 		if (size < 0) {
 			error = size;
-- 
2.55.0

