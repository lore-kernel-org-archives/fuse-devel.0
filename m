Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235443AC0E6
	for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 23:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084278; cv=none; b=LD1e6SZmvfQ6UU9zi/Ik9u3k+EoxXfFJVPLAI8DQ3vKQHq6UfdU8Chm2Ip4QEx0vcbykg35SqGZvfAIjaTeWCBNJk4q6NjaSrk4LvAWEEL4xV8vjIaRUmytwlT+q2UQqJLQjjRg0ABQYFsyd9z9rqKf9ZqaEt60TH8Wji/rbZzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084278; c=relaxed/simple;
	bh=OCNiS8J/vtMzaYGJaTFJG+hDAr7/vODQZ8hG3+Sh0ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8j1XyPxo48IMspWaGBHMlXH1DzWDhCUzKN2YwJjtp13cDEhkdGZ0QP7F5QU+nxcq0X42/ITbxDJ1vfZ7pDiu1n/If5ehcgdoqjRLdq78C+sWWxS4DySggiwNQzDO0qz7b1q8RkC2uhj7XdFp7NjWLCNT6tnjQldFa6utCfNltk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=Fg1cKjJ9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="Fg1cKjJ9"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2dcff8f44f2so4137075ad.1
        for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 16:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789084276; x=1789689076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+O46wIvOTz3djUW9pqtLqktDx+oddxG2jyQv83ES8M=;
        b=Fg1cKjJ9/JoRCeLpXXBVi9b+q8+/2eTMJZL6DUOGRZqzZJJ1QMq4Wiw4h68AxhW2xm
         wT3rqkM3I/N1SN2jm1kRKqFaGWZXsS/h7KSLKujwzVtpD513liOpCZbu20uP/5z+/IVF
         RoXSs9mExpTw2vE7zLD97i/L0KUKmU3Q9krD3m3MQy91OSzQYbB88Nl+dSjlRNwmTtUY
         P1XbLzgiklNF7JcrIB6ipG8GmVmOR0zABQJxOz6yFSK1qormdH7bYpzJqzzaVleswx5X
         y6PTMcmq9ADYT8OTccxBsNRMO66Im+4omE5izOODMZqmRHfg0QqSNEm9X02ZHhD9x/qd
         SfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789084276; x=1789689076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+O46wIvOTz3djUW9pqtLqktDx+oddxG2jyQv83ES8M=;
        b=M6LaKjBIJdstMegXv+G8td8O/CE6Dp/hq+nnyPqwy7Q1uQveT/w442vPB4HO8JnJ61
         ++NbeApI7Eox5hxPXNEIdQARd6wHzhnEH8mwy2tVH5mWg1YrKTmoBPs8vRatUTQnDe9E
         EYOo2KPWArmRu8zpef9aYRD2Dxx8FrVCBtwxKOTf7gcS1uVc5MKBPwarhk58lHGy+M85
         Ea9vnEQTuYnHUz1nex6WtWubowErja+5k3FtcaLinUSKkpcvM0jZ2BXCLF7CaaN6FyqC
         caOeZxs86+z8mL7MPHPdOriDZRaoNeSY7nM/HIJiqh0SuWRPd5zk21mR0mIHm03h9aGH
         cbXA==
X-Gm-Message-State: AFuF++lqhRgxhtA2Gse9UJayT6zAda8dKgZkB2+zb7ykdOrhxVlcldRZ
	CErXamteres+aC2bnC5ENsBmF4CeYqWNfM/lBEzQ20E/GRFi6WpHlLtkpiuNXek48Q==
X-Gm-Gg: AYBFou3CxH9FGHz3UGNI+6Svwe9ZeINog+Lbuhob++VwHKYxiXLxGdf5E/NZFyPsw0+
	m/NRkWqd3iVwSU+XKQYoWae6yTKX/guIGy3o3N/O8HViH87XBwVQtfI6j6krDUsFRiWOZ01csZp
	SOOKjLlVvBwqz0uWJ2o5kB3F5ogae4lwqGSjuNLp2SJKQZ2t1ZcYCjow+jVtxIpEuKvEnlanIBN
	rCJKciET9GwrpsmZ0SqgvbQVpeXt7168xSBTHh2iw7QhbzOtJdbmdxtkhsxG83vVbZvB2ZtHMqY
	fV20Ast4/jwa0evs7KfElEbEGwOwoqIAC8hlYuE3xLhiRKREXRXyktpX4E0Iz/23TooR2TE+1tW
	dWWQWdBYQtDMfJIqN/rt7Yc06CrA6XyaqgpItAXwUgp7lIjNbrSov5fX1mNobMUktSS+C1x75NI
	8idccJx4ttV4AL+xnNNTkam51UmA25RgQ/MfIZlQDmc/r2rnwar7xLqzZ4wdYvwrQMb+0pJwGKu
	jFPDuV9BGXG2V2Bo+HrfCkjKJSqHUzFIebYBrgXi2rYY5gi
X-Received: by 2002:a17:90b:5388:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39d9c0ac792mr2047057a91.15.1789084276484;
        Thu, 10 Sep 2026 16:51:16 -0700 (PDT)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm1680718c88.11.2026.09.10.16.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:51:16 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: fuse-devel@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	bestswngs@gmail.com,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH v8 2/2] fuse: return -E2BIG for an oversized SETXATTR over io-uring
Date: Thu, 10 Sep 2026 16:51:10 -0700
Message-ID: <20260910235110.3922068-2-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910235110.3922068-1-xmei5@asu.edu>
References: <20260910235110.3922068-1-xmei5@asu.edu>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fuse_dev_do_read() returns -E2BIG when a SETXATTR does not fit the
server's buffer, since the value may legitimately be that large.  The
io-uring transport fails the copy with -EIO instead.  Map it so both
transports agree.

Assisted-by: Claude:claude-opus-4-8
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
v7: new patch, all that is left of the v6 bounds check
v8: comment on why -EIO is unambiguous here; add Reviewed-by

 fs/fuse/dev_uring.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
index c6dd420c4034..460776cd69cd 100644
--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -893,6 +893,12 @@ static int fuse_uring_args_to_ring(struct fuse_req *req,
 	fuse_copy_finish(&cs);
 	if (err) {
 		pr_info_ratelimited("%s fuse_copy_args failed\n", __func__);
+		/*
+		 * fuse-uring does not use pipe buffers, so -EIO here can only
+		 * mean the in-args did not fit ent->payload
+		 */
+		if (err == -EIO && args->opcode == FUSE_SETXATTR)
+			err = -E2BIG;
 		return err;
 	}
 
-- 
2.43.0

