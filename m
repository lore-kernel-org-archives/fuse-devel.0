Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270363;
	b=Klj2K7hW/+Mema9W7uNTuqVzqs8gDoXWfjYj9PaSx8oyx8FqsdAwFdpoTneFeZ3q4P0I
	 MPF07WCIt0QgkOrhOlf8Aucce7qfbXDUKK2zICmlOuq+vrQDWc71UAzKObRyCZATA0sqa
	 VP3jBci/+eG255khrVSrx+HKNUNERmx56TZADwYhlNtY+g7gA2sS0gajWZTg2jhDBJi54
	 tmnJcD99Gr2GlZZxQo4D2zq3gRq6z9K5FOicGtI3boEQYSiaNR3G24twsNkP1NuD6McRv
	 vzP1js/1F+KsLrPlzxGAY3MzTxrL8pUS5WBcnnWWTAVnl1uiqro3o7Y2I9RgjFHs1Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3MlxG84R00yGGxmXTm5ZKcg9R5+P11QL2D2DJLHVQG0=;
	b=ZHFUbtNDH7RlU2D+f3aHeYKYk2vcqVeiI4DAFPLTnDmCuLFs3n6fWHhNKXj6lAx32tYB
	 fGpSFepmBWrE/K37HFnE7pdwURHePNghDVt9LJw35zxFQWsHs44jRom0aAT9NH5a7yj0t
	 Ox/0QIRgaW6rloXcZrkNR61aRrtGlDbR0V2O0Gsgk3XT8KYnLnB/Dxeg7XE/w8/owFOiQ
	 aPTCFmzBJxcq2urxF0X+8o4RcnmAbYIXVG+qe29qWdsT9Ou6s03Sx6vkzYhXj+JTZznpd
	 RvJybKOaphBBs70J626OHrioH33kCZq/zqGGGrubrzgfwFZMHCq1V8+5u/3uM62S0ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dx1Jhk6U;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEAD606A326
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 10:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AEAD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dx1Jhk6U
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c445c95d553so272069666b.1
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270362; x=1793875162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MlxG84R00yGGxmXTm5ZKcg9R5+P11QL2D2DJLHVQG0=;
        b=dx1Jhk6USGy0V5wajoEAsyCiSIg+OX9bF/IjRBQQNmD0OqKWE8TOVqzrINTKio8XgD
         KgRh47cw9qFG/zXx72QRk9q2V25VJOO8NWHNB8wHemNhEK1N53JHJ2Ssn070tnqxmekY
         p/2Bd1CDT2tLe7I/XEhWSWcci5fTuzwJL4m7jtd6IIMqZvtAGEoJeJgXakYP6QTnD7lt
         p6K3S11ELRpmMs+gIBMPwED9JpUcx5P54gxgHsA0vkjG7NEvTAVSbjVGcxflrNh2fea8
         y//zguST8F5nhvZaEP1tcO5AKs/yIT6NLor8k+MRBEsZB13DErAaMpVuvQPK4DOMS9Jk
         N45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270362; x=1793875162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3MlxG84R00yGGxmXTm5ZKcg9R5+P11QL2D2DJLHVQG0=;
        b=MXQUGCOukLh8e6rt5Tt5rAUWdvRqH2avy/MXbQMKyMX9hKpz5tk1aVDqWSJCDraAKu
         iJO8G/L1NuB0VXdo1vEeIP1s8vUf1bf8pTDUZywtSxA0mBT/tIamR+2qQ9o87E0auE/2
         n36/GesiCjGwCgB6Ilin7mPe+rBw6ZDkDthtqsF+CyL3yRveGSkTKfU8ILclYKRIE54r
         Uq59twcwqS4yReAGoCvXKwoHPrqMMWHhPg5UAg1OLPl/y421W5kz2qsi1ok9T7H8HSHN
         fWWti+ghp0Cze6vscJ0MeGgX9udHtZPsAm/PLYTa69k64hG6mHADuvHH9BchCkxwflrR
         yzcg==
X-Forwarded-Encrypted: i=1; AKwUvBxmGf7XYmsFIt0q0P4TVVFPON/JXhqvs4ceIkRBu7x5OfKtH+sk7acKmQ26OzBg8RvkU67fPmmIMq7q@lists.linux.dev
X-Gm-Message-State: AFq9FYJCh1BK3huX+/lZj/kZohX3Rc8Do/oItlTqnhvOJgOdA6hWx2uq
	f2yWyb/+EEDsvySz7bJk5TvtCaB4JhnbfIJjxXYV3mDzxFfSn6Qleikl
X-Gm-Gg: AYBFou3DDvq1jj3bkVGIrF7HCSzD1YoQigu/4aqsyKyjx9R8ARzqckDKWGFs6m6wxjy
	wLmS1Q2HP725XUjWHRzmvlGxv4g7csVvYMPSJKdWnEOkNMK6nO4SpiFn9GFZnhax7f12w/1QiPQ
	UDI8ccMelenZTEE7cwU+NWSlMZVx7P/EJo9J8bxDpCwCsu2yTGSdJYkMAlDuBSAJGhlXpq1D3Y9
	cW+U2llFoZQ7OsPPwvU4SiP3DMioqO/SruQIQbxNnpBfpwpWm1NgOn8JHLuYAFaf6jUVkK/8f5Q
	tLrEh3xInM9pw7bXaRG8LUnrXZiSNBUZe5SToHFW+BIK3cyBAkOwTUwWxxwrl9HpE0WP+XZycOQ
	yt0Ny8pRxJwbUhbC9Od2DAbvw9Kj7jfqyGVKgA8ajrLWTPfG08YsrlVPeDGoexX+DphLpDdqXyZ
	c3eemNDQDY0XK81cqyS9BnERNv1CHoWv6whsZwreTllBjbG+2LriksITC6BL0D48Wk7OFPEgBIj
	fAPE557LXaD3z0YuCk8S+83pE4I3WXKOPcWFey0C4aiSSp8JTJyCArz+CenJ1MGypIAFnkJiD/8
	jSRMt0x3zrrgGtoWIXHNS1rpGxFyu29+eQepnLyawYEXae5+1tSun1snPRYFlpb8I8UUNVgQp+8
	g+ANcpPJ8uD4=
X-Received: by 2002:a17:907:d15:b0:c2e:317e:d711 with SMTP id a640c23a62f3a-c49bdf0b1a9mr401098866b.27.1793270361414;
        Thu, 29 Oct 2026 03:39:21 -0700 (PDT)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4992141068sm496431666b.60.2026.10.29.03.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:39:20 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	Chris Mason <mason@kernel.org>,
	stable@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 05/16] ovl: check that the parents of volatile/dirty are dirs
Date: Thu, 29 Oct 2026 11:39:09 +0100
Message-ID: <20261029103913.2785828-6-amir73il@gmail.com>
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

An unprivileged user crashes the kernel by mounting overlayfs with the
volatile option.

A dentry that serves as the parent of a lookup must be a directory.
ovl_create_volatile_dirty() walks work/incompat/volatile/dirty by name,
and ovl_lookup_or_create() returns an existing entry whatever its type.
A file or a symlink that another task creates during the mount becomes
the parent of the next lookup, which calls a NULL ->lookup.

An unprivileged user mounted overlayfs with "volatile" in a user
namespace while a second process created a symlink named work/incompat,
and the mount task oopsed on a NULL ->lookup call.

Fix this by returning -ENOTDIR from ovl_lookup_or_create() when the
caller asked for a directory and the existing entry is a non-dir.

Fixes: c86243b090bc ("ovl: provide a mount option "volatile"")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/overlayfs/super.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index bd0a3f9039d25..18f56d463572a 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -621,16 +621,21 @@ static int ovl_check_rename_whiteout(struct ovl_fs *ofs)
 
 static struct dentry *ovl_lookup_or_create(struct ovl_fs *ofs,
 					   struct dentry *parent,
-					   const char *name, umode_t mode)
+					   const char *name, bool is_dir)
 {
 	struct dentry *child;
 
 	child = ovl_start_creating_upper(ofs, parent, &QSTR(name));
 	if (!IS_ERR(child)) {
-		if (!child->d_inode)
+		if (!child->d_inode) {
 			child = ovl_create_real(ofs, parent, child,
 						&QSTR(name),
-						OVL_CATTR(mode));
+						OVL_CATTR(is_dir ? S_IFDIR :
+								   S_IFREG));
+		} else if (is_dir && !d_can_lookup(child)) {
+			end_creating(child);
+			child = ERR_PTR(-ENOTDIR);
+		}
 		end_creating_keep(child);
 	}
 	dput(parent);
@@ -652,7 +657,7 @@ static int ovl_create_volatile_dirty(struct ovl_fs *ofs)
 	const char *const *name = volatile_path;
 
 	for (ctr = ARRAY_SIZE(volatile_path); ctr; ctr--, name++) {
-		d = ovl_lookup_or_create(ofs, d, *name, ctr > 1 ? S_IFDIR : S_IFREG);
+		d = ovl_lookup_or_create(ofs, d, *name, ctr > 1);
 		if (IS_ERR(d))
 			return PTR_ERR(d);
 	}
-- 
2.55.0

