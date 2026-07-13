Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778F93630AC
	for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 22:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783980577; cv=none; b=F3hEYFsBV+k1DHybGQAooIYprDdNbsYNag7TBfuz1GcYP1Ul8S7A10uPGOG4WWqXpMwhGNRpBmLkP5ahskQizy4LCaAcqERYQJh+DhaHgNCg3FFRGLhQvRb55W8tpXpO2kq+mD/1MiS0pDXXxu5IYWvBHbfIsnEeMiBtiJKNNH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783980577; c=relaxed/simple;
	bh=C8NuRA1bK+uMRc7JGADbgB4/9ze8opAmyCE9C/B16oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4Ow9SCXLEcIi83mpCyCrwCP6UI70LPgJSkajjXCx2gGu8lvYOKD734fZMXAGElI0T+Xomx6IoUvxFdDdwOWqIkqnlNlQ+4aZ3RhpnyeahX1/bBFjdNTuHTthe3WQvQDQaZUQjOgbgpEQHnf7n8ZTJIRZMt7d9w5ot06483z9xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOL+cklJ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOL+cklJ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15f360851aso64587366b.2
        for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 15:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783980575; x=1784585375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SLPOn2YuKONJXi+Hnfw4ZUtdFaaFI6SU0Sk3qo96J30=;
        b=MOL+cklJVOVz146uYtqcRK/uHPIhUXqoM973mOC9bdtZ5v4OmWGFIZyGhJFhQa4kKa
         mxNF7k2wzFc8HCLyNp+1AN3/qxnAwjm3tZkKZNSeFLVCyqakRVGom4wbRWQmqs2wCxL7
         9bbAOC8DVRISH+zY6KyqN+anS/WH9PAHdZG5qYEYMDVAHRW3JthYKqvrN2V0Y36deBxv
         pcXOtXTuB8MZKze5h8rBPo/YW8qLnZcQziTm304dmtQQvgI4W7OpnC2tdiuO22EgDHS7
         gFVQhm3AGk+cX9Ca6CBCIGAdPHnPRolmjNLVefSsRbF3bwkjwQCWrKrsspzWduYAF7gu
         ZmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783980575; x=1784585375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SLPOn2YuKONJXi+Hnfw4ZUtdFaaFI6SU0Sk3qo96J30=;
        b=T0mTNumvsifFCpAkFYn35sUheULPE/G5GX5uGgPVlk5DEEuaq7APlCCr6fPJ30/h16
         s5aWESbmEfiza71Jd0YGX2IMR4hcK8r9gAt/Im2OMofBwmVi8LB++WhAXkz9NZijOr+J
         oFB/RqBuq8c2Ypd4IoPFZTzz2RXmeIJxQ8shWBpKLaw0u0WuAPTpiGmO4gHGEiDVyd+q
         5CYnre9iOgOjuFLdBTkhXHE+lT75N6eIJBUTvWGbQdBvXiZ0bZmAKcwBjBvVAvLMz+qg
         v/ZAIoekVB0aat9cw88XzbwuAgGUueHTJ3q+QcsDbjoLUhNDYjC8kCZ6WXrJZxnvBMu3
         CgJg==
X-Forwarded-Encrypted: i=1; AHgh+RrrVZu+2O+x9+5F9CZIcp380TiOBqzQ8wCOKIH3eSU9KIo9CMS6Dfs0XxEWFQsoXynYamNcGsN4TyTO@lists.linux.dev
X-Gm-Message-State: AOJu0YzOxBJlvnmlBnBv9CKZtZC/YI5hb6Pl3iKcwXEtAl7qQ2kE8rqX
	kBUWepg9RZoLB+GqeKJrbGibp8EXGRsZJibRGHDinYpiSDInxt6iwjHw
X-Gm-Gg: AfdE7cn6xFEalxhi7apHAxnX9PIg0btG7snuT8d5wU5Ky6AxuZ1CqmPdGklu9cETHJj
	vHR0IPyQjJLvpOZ9JjUUgANDKLVV5tp0GkSEhqAf8z4c5EcopMtFoVKKVJ8GRsTvO7c8pxFqT+s
	ulkjSIcBWeLWXcJUAlbe99x4HPQi6Dk5/DLkHF9K1duH8bxHDEE7X7hOm3v8g2TTATpbj5jUSQ+
	P9aiRbFGEvbjfNy+lW1a/atVpOBlM62+ktIWWhMCRAXIM9r5Vi72ZyOmQ81Ye+guo9P1UP8/4YE
	QlVqLnnZZ0fFPOmK/lVpn+64PlYUhYczxnTkMZdsPHaFswFoYDiRvLMsHI9DjoYE2KvwtLgam0o
	ITiTKyl3lLRm7cGPxNm0V2qo41oC+WkmG2nGraPTj1S5ooJEcCh5MX2kfKrqXa+u0a6pNOWc5v4
	NS7Vqe39h4M4T5a6zqgRPeM+qGHq7E6Bn2GAylAA==
X-Received: by 2002:a17:907:2687:b0:c12:7e9f:5ae3 with SMTP id a640c23a62f3a-c161e98b466mr509056566b.15.1783980574648;
        Mon, 13 Jul 2026 15:09:34 -0700 (PDT)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15b1a1011fsm1046734166b.58.2026.07.13.15.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 15:09:34 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH 1/2] fs: preserve ACL_DONT_CACHE state in forget_cached_acl()
Date: Tue, 14 Jul 2026 00:09:31 +0200
Message-ID: <20260713220932.413004-2-amir73il@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713220932.413004-1-amir73il@gmail.com>
References: <20260713220932.413004-1-amir73il@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ACL_DONT_CACHE state is meant to be a constant state for the inode
for filesystems that want to opt out of posix acl caching.

Commit facd61053cff1 ("fuse: fixes after adapting to new posix acl api")
used this facility to opt out of posix acl caching for fuse inodes with
fuse server that does not negotiate FUSE_POSIX_ACL (fc->posix_acl).

The commit also takes care to gate the forget_all_cached_acls() call in
fuse_set_acl() on fc->posix_acl because there is no need for it, but
there are other placed in fuse code which call forget_all_cached_acls()
unconditional to fc->posix_acl and those cause the loss of the
ACL_DONT_CACHE state.

This is not only a functional bug. Properly timed, a get_acl() from this
fuse filesystem can return a stale cached value, as was observed in tests,
because set_acl() does not invalidate the unintentional acl cache.

We could fix this in fuse, but it actually makes no sense for the vfs
helper forget_cached_acl() to invalidate the ACL_DONT_CACHE state, so
let it not do that to fix fuse and future users of ACL_DONT_CACHE.

Fixes: facd61053cff1 ("fuse: fixes after adapting to new posix acl api")
Cc: stable@vger.kernel.org
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/posix_acl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/posix_acl.c b/fs/posix_acl.c
index b4bfe4ddf64ea..3dc62c1c27087 100644
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -93,6 +93,13 @@ static void __forget_cached_acl(struct posix_acl **p)
 {
 	struct posix_acl *old;
 
+	/*
+	 * ACL_DONT_CACHE is expected to be a "const" value and xchg it with
+	 * ACL_NOT_CACHED would enable acl caching for the inode -
+	 * clearly not what the caller has intended.
+	 */
+	if (READ_ONCE(*p) == ACL_DONT_CACHE)
+		return;
 	old = xchg(p, ACL_NOT_CACHED);
 	if (!is_uncached_acl(old))
 		posix_acl_release(old);
-- 
2.54.0

