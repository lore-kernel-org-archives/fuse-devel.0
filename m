Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270364;
	b=5W92kFjfhQnLwG4VbZ0vXz2pzPuHEqWQPpqtPy01LpHoVa4siGGt/XqkgWnlGhaGLdrq
	 dMlFL+DoIiwwaNT4Q3zrktUDY4/0Wb3+1E9BKGsnpLBj2O1+WfsJaTGRkmqMpVNRewQcH
	 RYGuMArJBmQflazNa2RQZ4zhuzijpLAKRwWAqi6cTGxs/HCS7VVv9b7CnBg/COl4+2zLz
	 r4XUSwF70gIQjHMFkpSG13+pOeNIfqeuaaVN0mLevY3gMhjsVJ6Gkkexj1Fu8rQ5ndmUI
	 B2aPByPpUmb6yufwSIlEH3BFh9bPsHMwy0IsalYsxT//+lV22FMk5wvk4HEOMSNzDGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qi1ti4izdBvA4FPvYxDV0dCh2GnisjK7L+m92EFw0NM=;
	b=gN8Pf5ejxeuR9LMze7R5QFN+X8zuMbbLXd3J7V8WGdip7qUtMzWIhj77SU75O5+PTdOO
	 hD2A1ZMXsEuCWHSoSZeJ/dURDIqu+zC4DSimCZ7Zst7Ulg0738uMS0wnPIhhHy6HEnYyo
	 +zuY3G6oWgQWdDAcJWUeF/Ri+51VY6zMt8PDywo5kSUXxSeih906niR9k75MS1tXEDx5C
	 wrd3xLIvFQnTE5KVmsEv3kQo8+INFfeYi4q2uDOF4zUvH2K7bMcK5qJTWXGlU+1JeEotv
	 Q2WiB4lgG3KrMjonulu6lNQnMOgxPpSu7y9neeLkZhh1ajgJl77kFBZs++QcOCulUiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=waUgyR7U;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB0606A33A
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EEB0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=waUgyR7U
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso938398a12.0
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270363; x=1793875163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qi1ti4izdBvA4FPvYxDV0dCh2GnisjK7L+m92EFw0NM=;
        b=waUgyR7UFuB0ncWT33BjqnDWRS9yiV2YMoYIZ67Cu1l901ZpP0AZSyPlHtcl8QNsw2
         Kl2wYWTtrGzlRhB2ci8CqqdWopsqMA6PH1scmsbelouVQv+wsk+y0ui+fUWJiaHKv5e/
         PVOPzOPjFte0xFn/9dzB7yc009+Opl19RYYthd0BaoE5+xWJdJwyJ94cXxsDRJKhVYKM
         94tv6WRk9eI62Gq8cClLL1m3LT1/0pcB9+g48CF0lFhQH82ls8qRmIW5hCoCg6kCKfxL
         +4VePUISlBJmBxOO8ZQCpMETJT3Y68PpZD4ll2BWioSLy8CjSfX7vQ8D3j7TyaKVDAnX
         +oGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270363; x=1793875163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qi1ti4izdBvA4FPvYxDV0dCh2GnisjK7L+m92EFw0NM=;
        b=DhHvulyE9A9GUZOU2iGLRwy16KUfA1zmc+P/FENTsSeUYGsFxu1H1Rjxd/fobfd8tb
         Mls9Gq5DJrMkPFfpHlWJoZB5747N47NJoJcbPOAYmd/2xyR25QuK2zT2FhgNF1c5Vh+e
         h4yExXs5gzZFPF13x8chDAHUdxQkjPlr0EfHTNL9ik+lJ7xVv81okWdg3YwMHF6UI31T
         Wlkm9nKnjdgDzHkGrPVH/1bqgqZJ44PM8D+ZDxlOOKO28iVGvhaHRt4A4TuRwNQmnsow
         b/YUH7fkrKzDoAtTO5NEJGrTCGCLRnDqWInuZXfSeoDB1EM7w9RHSA2qDooke+bHFTyp
         rpvA==
X-Forwarded-Encrypted: i=1; AKwUvByVhqwPa2GHWT5T6MpfTwLFg9pyAaLFpbpnyyW5jl2QC1MtBDLkMc9//xLpeXW7h0H/wMfohiXifVTz@lists.linux.dev
X-Gm-Message-State: AFq9FYIUOumcUzaof5iNmvuQUBryrfhlsAlaro/XLMvmJ69E9/9ivzFk
	AQ15Ads6DZ1ADuF1zxJYiG+/rA+B9ipQdvpkod8jjPsUGiz1qL01TWQT
X-Gm-Gg: AYBFou3wlbpaOuN6MRf2bY2FKn1ixmYt84YHBnaeut6r3eMYjlK8uQjRmbkxJXs1fS0
	KdtIegz/OSo55UGxAshFo5lv6H69MuJXUs0JQYl0PTXt/3nGnIbzOJ8OZU9MaJ8ly/qXmXJEMCQ
	tsnFPZMaq1c9LqUGWJ5APbq3MU4bFnbTuFs1onzs8/OKSCyx+lpI/bFx14t94q3KperC93Gfllx
	WTB+SPqLQCd/FRqea9HjZKnfOZvtA2+pgP3kjLDAYG9pr4Viil4ZzC1mLdEV+1tizkQQn2shwXb
	Cjf/MhF32k9G9wvF4owC0CyeH3amR3xKZWea4FTAxppYOWaF37u52hz4DVSuhVNEGfkq/gHRt96
	kksLQWpFPNtJbYgG51vORavwjmLQyYTOmf89fb7SiPS89KwV9rV2YzeTrf2QgLu23eoeYwki7IC
	Ila5kBsrxKsXagvLnEvEtseaRRgWafekhEHbfqXvMT/f+XnmRPhQnNPgoTTt8YXmFHYnwErbMjQ
	IhUCvunCFSvLP+GoL/QdsMl0hUYMxpuho6qktEojk+NuGrQYGnaA9sJjtNOV4q4tv+Kozy+0lDJ
	xsPj8wfvEOS2Z+WciH4rb8lZmgcx4um0qoG6WHNsWhZEOFCNCbyZNB6VsksuxtahKMLeqiJ+3El
	pWhdmO/KdKZfZ
X-Received: by 2002:a17:907:7294:b0:c42:4557:4532 with SMTP id a640c23a62f3a-c49d128171emr173949666b.5.1793270362388;
        Thu, 29 Oct 2026 03:39:22 -0700 (PDT)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm708508566b.81.2026.10.29.03.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:39:21 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	Chris Mason <mason@kernel.org>,
	stable@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 06/16] ovl: take a snapshot of the name for copy up
Date: Thu, 29 Oct 2026 11:39:10 +0100
Message-ID: <20261029103913.2785828-7-amir73il@gmail.com>
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

The copy up of a directory reads a freed dentry name when a lookup
moves the directory at the same time.

A pointer to the name of a dentry is only valid while something stops
a move of the dentry. ovl_do_copy_up() keeps a plain copy of
c->dentry->d_name in c->destname, and ovl_copy_up_start() only keeps
ovl_rename() away. When a lookup finds the same directory under another
name after a change to the lower layer, d_splice_alias() moves the
dentry and frees its external name.

With a delay in ovl_do_copy_up(), a chmod of a lower-only directory with
a 60 byte name raced with a rename of that directory in the lower layer
and a stat of the new name, and KASAN reported a use-after-free in
lookup_noperm_common().

Fix this by using take_dentry_name_snapshot() for c->destname.

Fixes: 829c28be9bb9 ("ovl: use d_splice_alias() in place of d_add() in lookup")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/overlayfs/copy_up.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/overlayfs/copy_up.c b/fs/overlayfs/copy_up.c
index 92b3d08a02349..12000e45fefc4 100644
--- a/fs/overlayfs/copy_up.c
+++ b/fs/overlayfs/copy_up.c
@@ -920,6 +920,7 @@ static int ovl_do_copy_up(struct ovl_copy_up_ctx *c)
 	struct ovl_fs *ofs = OVL_FS(c->dentry->d_sb);
 	struct dentry *origin = c->lowerpath.dentry;
 	struct ovl_fh *fh = NULL;
+	struct name_snapshot name;
 	bool to_index = false;
 
 	/*
@@ -957,12 +958,15 @@ static int ovl_do_copy_up(struct ovl_copy_up_ctx *c)
 		goto out_free_fh;
 	} else {
 		/*
-		 * c->dentry->d_name is stabilzed by ovl_copy_up_start(),
-		 * because if we got here, it means that c->dentry has no upper
-		 * alias and changing ->d_name means going through ovl_rename()
-		 * that will call ovl_copy_up() on source and target dentry.
+		 * ovl_copy_up_start() keeps ovl_rename() away from c->dentry,
+		 * because ovl_rename() calls ovl_copy_up() on source and target
+		 * dentry.  It does not stop d_splice_alias() from moving a
+		 * directory that a lookup found under another name after a
+		 * change to the lower layer.  That move frees an external name,
+		 * so take a snapshot.
 		 */
-		c->destname = c->dentry->d_name;
+		take_dentry_name_snapshot(&name, c->dentry);
+		c->destname = name.name;
 		/*
 		 * Mark parent "impure" because it may now contain non-pure
 		 * upper
@@ -971,7 +975,7 @@ static int ovl_do_copy_up(struct ovl_copy_up_ctx *c)
 		err = ovl_set_impure(c->parent, c->destdir);
 		ovl_end_write(c->dentry);
 		if (err)
-			goto out_free_fh;
+			goto out;
 	}
 
 	/* Should we copyup with O_TMPFILE or with workdir? */
@@ -1005,6 +1009,8 @@ static int ovl_do_copy_up(struct ovl_copy_up_ctx *c)
 out:
 	if (to_index)
 		kfree(c->destname.name);
+	else
+		release_dentry_name_snapshot(&name);
 out_free_fh:
 	kfree(fh);
 	return err;
-- 
2.55.0

