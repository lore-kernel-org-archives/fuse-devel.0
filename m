Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217384;
	b=Eu1qirJF9z+IuWmLVNoX+2tDXnttlHVHh7KoOQkaaR8NugYw1kKWO40HH9l6XiAxqv4a
	 ntmMv0XEfBHoA9bKcIMRTM3MsfS1kCB5w9PA5VzfNbIWqtZOpiguPRSi6ot8sdJoR0Fbc
	 Zxbptw+GmMtmxlOsoP6L6Idq2ipyj3Dr2UANcJRP20qdYA2mn1CCTP1DNsVjEhcfAIbTz
	 wOABHUD6nu4qb6KsXrR8NvABEps60whGKxWMAIFs7LOalh26gaLs9tFpZN/XaI7UqRUPQ
	 2H//NK26++q18jWhYdvjoW0jY6SRlnn56+Q7vKUXzmHnRF0Gxuk08K5Qq8TbkncB4Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gqkduDJsU90RYsspBtEDgzAr8laZJiGJQKiyzYsJO0s=;
	b=SoCZuYWlX82GbZqa7wc8ZrKjc71kLF4hTWx/XZntHvjEECdcBFMUsuZyRbSJV2AUA2gC
	 ksbR3dvtdW5OZ4UaM2o8zdTAA0gXIcDbjSKLfO9XRMnAYffSqzxHaUKnR8tP66usmE506
	 FGdXhpGCNQ/4TnvKaihkiqN81bsZ4kndGPM4Ler2VO6UytzsuY85bVXyt0883H5E+g+Mr
	 HboH/XXa4G4JklpdMG0n3SxsctI+oyNALwcUhhUgP7+qdEGiL4iSLqIfEO6nrhr471Q4k
	 GWJzp8Iv3gFc4MvHYofaxjLqbB3idiPb9/lZi/R2+YGqBh+0wvTSRqcHCumQG3Gr3mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q48u98yX;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531FA606A322
	for <fuse-devel@lists.linux.dev>; Mon,  9 Nov 2026 09:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 531FA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q48u98yX
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37000e7234bso216408eec.1
        for <fuse-devel@lists.linux.dev>; Mon, 09 Nov 2026 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794217383; x=1794822183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gqkduDJsU90RYsspBtEDgzAr8laZJiGJQKiyzYsJO0s=;
        b=q48u98yXrUw4vfqRhyNMQ2A1M1GpwK9ObC7gi9gaR1WYDzh9VGMAGYVNMlhUbIi2Xw
         iNUvOusefs0Ld1RwYfrVOCiKNc452g1EY2eUs6wG8nuRcqjFJpAuoAKUfIxlWydxH8/l
         g4KbBi6mFglarhkH7M4PMVJk+8UEO/nyxhcoKbsX/zgSUnTcWhFJw9HoaJ3/hXqzGV/g
         7F7m/D1MnZ39uQe9gaA6qcIUdPXhiCa3xZnF+HeV0BivvO/N2sNcC1yhmKyk/ZsnKQHU
         hFiGJRas6E0xgI9FoRuyGszqI5vltd59a/89koWN5UpdJ7nThQA6I92zeNsnhcoMGoBT
         /uaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217383; x=1794822183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqkduDJsU90RYsspBtEDgzAr8laZJiGJQKiyzYsJO0s=;
        b=SCLDhGSFIO3MMCQCpjlFj5JD8rfsJXgc/rFTJg8vlmvp02ulDqr57d0Jj59eaxhIgD
         Pu8/d7t6UilKVAedTaKMzLSlMZxChaN/+vWBI30kTel1lJtQ4BAE6KG40+9XO+aoK/+J
         YIz4PDcJoBwMpkPh1ggWUMS8KEgJhspoqKKDIkiKllajz+hgYdLGZrpkQ+p2lyRvzMkX
         Cu79Z8ZDnv9Je2F3hLX/UJU9xReS0TCbW+6VXNtmH9jgISl9Him/++kQizl9076COOa9
         U/NLR40DoQUra/3/HiE68zB2HOAG0a6X/5yhJZgNQZGnMQLS2cP63tALJLedFiVckdFZ
         fRAw==
X-Gm-Message-State: APuU4Z/sXO0kh27p/z5xCbqD4bKIv5x9FQldaKWOeQlbJpSL9Y3OTk1r
	Ha3sOAzNMoEv9uDf+j2s/tIC//xUhCimwHQplJRagX9r0ZPmUxXTkI4P
X-Gm-Gg: AYBFou2i4HIHai+gOzWCE74fRGdmfD8AD6F0mfTffoE2PnSIAFEVItPH/ezi4C7HgFz
	KsgNiLbGxquWt8MjDeRyQbTtxd/zv0pRF0qd9W3SW7g2uvRgVy0r7UM3Xc02bFKLIjf31sDsDNn
	TwLzAeNESEcmS9KHE0C61WWnV+9wzJ5hH+mn4BfuX1un60oytf9/QGuwr906Mn/MvHd0iZELcge
	sZJdlbmxU87/wSMPknIxzSewDzgfEpTohDmdOMLy+7MsZTIA4Bm3AZZmc0j5nZnzfduVMivBxde
	MD71HZQ7mRxk0tOF6sukaMpbzYf3Belf9iZqpJsODonS8+AXFYMAmRxhuo40Rpj0kKAJ5Xw6WwX
	yxajtF6nD3qnxzrscx+jGBk90yYQpQV1fz+rpDXmvLmT6pYCNjuMSd0Q5Yn6CGIui89tg8b90xr
	6Eoz4XWMLRlYlQ7KS8fp+bEuyOMNyg38CrxPZsjwjTuFBktxrWyqZJ1kuSrU55JeDkCuWeB8wiW
	20QyjI8Q1eTU3LSYuzIZNeKbgc6Jx681RNoWgCRneT8jZVmzs/AdJYCpeI0oNgMZdzSuCmLTgW2
	RNhjGkUSsMiVNO/W2DbFrRabYtgFl1DPhAHdYBZQ
X-Received: by 2002:a05:693c:8801:10b0:351:207d:bff4 with SMTP id 5a478bee46e88-3725302c1fdmr7378443eec.4.1794217383012;
        Mon, 09 Nov 2026 01:43:03 -0800 (PST)
Received: from buddy.mshome.net ([104.192.108.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a179c1sm11189758eec.11.2026.11.09.01.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:43:02 -0800 (PST)
From: Jun Yao <yaojun8558363@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	Jun Yao <yaojun8558363@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fuse: hold inode reference across d_splice_alias()
Date: Mon,  9 Nov 2026 17:40:06 +0800
Message-ID: <20261109094006.205170-1-yaojun8558363@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When fuse_direntplus_link() calls d_splice_alias() with an inode
returned by fuse_iget(), d_splice_alias() can drop that reference
before returning an error. In particular, __d_unalias() can return
-ESTALE when it cannot move the old directory alias. The caller then
decrements nlookup through the inode pointer. A concurrent
FUSE_NOTIFY_INVAL_ENTRY can drop the last alias and let RCU free the
fuse_inode before that access.

Take an extra inode reference before d_splice_alias() and release it after
the nlookup rollback or after a successful splice.

Fixes: b8bd342d50cb ("fuse: nlookup missing decrement in fuse_direntplus_link")
Cc: stable@vger.kernel.org
Signed-off-by: Jun Yao <yaojun8558363@gmail.com>

---
 fs/fuse/readdir.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 1f6cf5654..aca25e5db 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -238,8 +238,11 @@ static int fuse_direntplus_link(struct file *file,
 		inode = fuse_iget(dir->i_sb, o->nodeid, o->generation,
 				  &o->attr, ATTR_TIMEOUT(o),
 				  attr_version, evict_ctr);
+		/* Keep inode alive if d_splice_alias() drops its reference. */
 		if (!inode)
 			inode = ERR_PTR(-ENOMEM);
+		else
+			ihold(inode);
 
 		alias = d_splice_alias(inode, dentry);
 		d_lookup_done(dentry);
@@ -254,9 +257,12 @@ static int fuse_direntplus_link(struct file *file,
 				spin_lock(&fi->lock);
 				fi->nlookup--;
 				spin_unlock(&fi->lock);
+				iput(inode);
 			}
 			return PTR_ERR(dentry);
 		}
+		if (!IS_ERR(inode))
+			iput(inode);
 	}
 	if (fc->readdirplus_auto)
 		set_bit(FUSE_I_INIT_RDPLUS, &get_fuse_inode(inode)->state);
