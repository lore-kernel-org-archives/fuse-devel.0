Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923537;
	b=aLH9HemhWz8u+CX29B8Ep4gPQifrGM+BbHspHrqr3xLKEMXCCUregdWVbGRLqiRfWrWv
	 pJmkjHo2iWXiPt79el4/pBTW0z31sBI7uJy3cfsghpOj03VZ4+wmPeO2QFSST1cI2ViqI
	 0w1Ij0SKfyx4fum/5nv3bd7YLALe1hvIfB4ON+MEttUAeR8hO5cYPcjB8FO0om6hmHKWi
	 OoTF6wJ3y5iSNbo2OCzKDzOgGCsx69u9U/18gE3JdFLyg1/gcaqgtUxNGHT1OVdLr43dz
	 kSbszdshLbPoHlePbBRV8iqInRRy+hYrzm4hHXzt4gfZFwBImbTya2uxIzXJnWZD0HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qEwXXgzCb9umMJN15TTOelMx6FvsKuxkJvNzraJF4vw=;
	b=0MVLMDMGvxcXHUS0WmH6BKGS2snU8x1LQDdloVkrubfUBAfhPezmmHp+UkGCKL8rmnIs
	 9ziFq9IhiqoQRJKHkSmymzq0J1lc11rvhFvtarcnQnVDdy3RV5h5L0UYfTSOAcIzLkoox
	 OQ/cdvfbyW4sbID7YoAMTUQCUNZ6Oa0TCnreIn9x7NVwXqRBrsQtWZsyqcwVSUQt/2rIR
	 oJRwI99u03hwVVNzc+POahfLE95/7zFN0Lo1yJqN4ZsklAh52XQNylEjeSXXCro1QyWDj
	 QPZqtjyR91GATWBj8zkdxilcJNFzj4JACLyzI+aIo/xz0GEvIhFDn20oZ/9C1FqtqEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+ifOsvR;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6F8606A329
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 13:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A6F8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+ifOsvR
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9995ce866so44013165ad.0
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 05:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794923536; x=1795528336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEwXXgzCb9umMJN15TTOelMx6FvsKuxkJvNzraJF4vw=;
        b=W+ifOsvRpzLEr5HtvSxwtZd6Iv28/Wnauhr2AYZT1maJD6XwNtypDiSFN2s6r/ymej
         I44cmmXoSdwSwrjWXDpULxEwIOS3wGMAjNChYYFo93ihQ0jtpFD3wQqiqNebyKJqYY1l
         yo/T9s7AkaNnrzUmqaJiGksuAb+6VCmimZneocdZ/dTW7QJxUvtsUpizFmzP4hK1VrFP
         74NwWUgfSVKGhD1NVfjHfcLj2zlbB8NDT+wuCi+Mmq93FYNBVy5mRO5fY/RXby5/nuDP
         JutacAzo0LpA8VvrLS8asPuKl2Tq0vE6xXlv5Ampl0APie5toB7Dh+n6C/y3FNv8pvhT
         LNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923536; x=1795528336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qEwXXgzCb9umMJN15TTOelMx6FvsKuxkJvNzraJF4vw=;
        b=ud3qRnKc0l5T0876NOTDVozoIz/Rn/jTKG89kKlWLGJ+UKx0mp8ZPWU89aw9WTukh1
         VLiChpzBNdEEL5C1CpkO9uNQGCLu8R0gP4QOoQubmKZabPaoBUZGQKebLjAFPlZcA4HE
         vnVwUkMxBt2VTKhfDMqoNN5fL2hy3yMIuCkALt4RnmqNyLcnIL6z216X25WfsNPrnV7M
         c1v7yVy1qEQI7m0hdTiEqNh5NUBJPD85mHWkJZD71tWt6Ll4LXzHSf8Xbz8/yvr/gsU8
         sjTjPwBr8LS3XGgtNTRQqguXGPuVBvMRX9vzGlyEdTtzbYn8JejC6KxQeKO9Hgr5XhY8
         ELLw==
X-Forwarded-Encrypted: i=1; AL+hErFGhrDPntYNFY95jZzubShi26baBf+OTRTWq8meb+BxLmqy12TRFL4qZmJ9XxKcMKiNeD8cAdP/ZWpE@lists.linux.dev
X-Gm-Message-State: APuU4Z+IvgQib8nuV1Z2Ic6jYAwrq0pVgw5AQxd0RjL9EgHXMazpyAcb
	EPNJcd9NJ3P9iKWgyoIa1l+2t4Ailj7ThWG2RA90ssluHyOljDUtwtUo
X-Gm-Gg: AZFdTZdIBHGYTK15zBCm2zvL5VVY9vXMOGyczpFiklwWwNLzPJd5kVHQS9z1pwo6lfw
	qNgO5VSnJPA1iNat6xh+ZIXr7PVhc+SgjXpshWiVtTlRPRP80Q/BBrqsmiTfqyQWSdv0TwETqfo
	Tl9AEV0LD/MeEo3F/BJxr0OeTLxLhFD4saOC9WELJWD2iFrtBf6cKbYtAYyx7Yu3ABP9JTHC07Q
	g6w8AOuTPE4m/V4FrQA1V7YGKxvFwC/ESj5Np6f42WyRs9+m6PsdN4+uOo7QmAnMO8via6EE+lu
	2YJqoRLuhiIsoQrFaAawOTb/0plOIaa8ZNteL1FhedzcQx4EUOdi85Sc6Sk9aBQJ+tL2QGqYEOY
	nZoAiLlbznxTzFDQKygTYmqwCBJT7DU1/mXtjyGXEtLC7w8fW0OZNsFd5sq+HP72kfskG81hZU5
	Ww18v8lJ/C91Si4zOv4repgINQHUfJuxAwCaMtne+aPQx6LG1nrn6udBfCh9+BPT4yFnPy4pQDD
	8HKpb/zmTnSQtMUOqyt0hrvE9ENhLMwCLP3ZzEdmRgxr1CH7MQ1TymmMshYDqfA5yx4ODLmV5e9
	S8G7054so4voqUgyZ8wj7k0ijEwO3BYzw/NUFL6fXFFwIZlcWw==
X-Received: by 2002:a17:903:1846:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2ee0d6600acmr138465855ad.3.1794923536549;
        Tue, 17 Nov 2026 05:52:16 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a586c1sm15937035ad.43.2026.11.17.05.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:52:16 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jan Kara <jack@suse.cz>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Matt Bobrowski <matt@bobrowski.net>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 3/3] fanotify: copy full qstr length for copied event names
Date: Tue, 17 Nov 2026 22:51:37 +0900
Message-ID: <20261117135146.3174252-4-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117135146.3174252-1-graypanda.inzag@gmail.com>
References: <20261117135146.3174252-1-graypanda.inzag@gmail.com>
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

fanotify_alloc_name_event() reserves name->len + 1 bytes for each
copied name in a kvmalloc() event.  fanotify_info_copy_name() and
fanotify_info_copy_name2() use strscpy(), which stops at an embedded NUL
and leaves the remaining name bytes uninitialized.  With the original
length stored in info->name_len or info->name2_len,
copy_fid_info_to_user() copies name_len + 1 bytes to userspace, leaking
uninitialized kernel heap memory.

Use memcpy() for the full qstr length and write the terminator
separately, consistent with __d_alloc() and d_path().

Fixes: 929943b38daf ("fanotify: add support for FAN_REPORT_NAME")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Changes in v2:
- Use memcpy() for both copied names, as suggested by Amir Goldstein.
- Write each terminator explicitly without reading past the source qstr.

FUSE fanotify mark setup on a zero-fsid mount returned -ENODEV; the
normal-name FAN_REPORT_DFID_NAME and FAN_RENAME paths were tested on tmpfs.

 fs/notify/fanotify/fanotify.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/notify/fanotify/fanotify.h b/fs/notify/fanotify/fanotify.h
index c25cf5c1fc70..2d6b5c2c6f25 100644
--- a/fs/notify/fanotify/fanotify.h
+++ b/fs/notify/fanotify/fanotify.h
@@ -221,18 +221,26 @@ static inline void fanotify_info_set_file_fh(struct fanotify_info *info,
 static inline void fanotify_info_copy_name(struct fanotify_info *info,
 					   const struct qstr *name)
 {
+	char *dst;
+
 	if (WARN_ON_ONCE(info->name2_len > 0))
 		return;
 
 	info->name_len = name->len;
-	strscpy(fanotify_info_name(info), name->name, name->len + 1);
+	dst = fanotify_info_name(info);
+	memcpy(dst, name->name, name->len);
+	dst[name->len] = '\0';
 }
 
 static inline void fanotify_info_copy_name2(struct fanotify_info *info,
 					    const struct qstr *name)
 {
+	char *dst;
+
 	info->name2_len = name->len;
-	strscpy(fanotify_info_name2(info), name->name, name->len + 1);
+	dst = fanotify_info_name2(info);
+	memcpy(dst, name->name, name->len);
+	dst[name->len] = '\0';
 }
 
 /*
