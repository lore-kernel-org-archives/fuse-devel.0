Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777014;
	b=ddj41bvlhrjUATSA95HXmN1orbpFZPlrAINvHAeZ5cCSaITc6WqI9KOZohI16NMQUUeB
	 iBRcynOQ2v5LdrA/V5ag5Rm//7WTTgNMYvVLXB+ZrLKEqRCU09mXnErf9srEf77cVVfbI
	 Sqd0soh8143aO04YlGIT8xF1UjOm5jYiSxMwpzbkb4V39JIkJ/UFg1XitH1APHdq/A0MJ
	 Do7HgNkkkNSrDW8ucQXiQC9TJKXCdZNq/ecSP+k5zihAIInonS4WeFRENFyBQi3yj8fyq
	 PEzLgC0HHYSB8O6iKF16WOq3O6Es/zJiEu26x5iVbrMYkLLzkPO16iYV2V3p96PnOlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oQFSDg5cHBfrZhn/Xqr57kPvYhbLjr1otgLb7m0JLjg=;
	b=qUbl39iuhqIl4pJSX5LREsB4ApxnxQmZyshLS04D4+shTj52Bjofy9Q175MrQoJD/y8v
	 CBBkZLAPcqfuRBeAqvpEtHB13buLwqtLqwaFoJaBn9YY8Cl6TOMzpOzqX5LIp0vk5I9lS
	 +0sLZCGmosbgb9IpU2MzgfzAh9JZQiBabfnqKh7T+4cPsRXnAX32Fv+/jJKTmz3ezYoTr
	 YlYnF6CkMFoXPuwnRSqMWzJj8UYp2eMYNAwcdKDiXBQBFgdAZPyuHg3K8cXAjj22/4P7n
	 TisSETgh1k8i5EMMbFoQchbNVFlwFdBXaV5suRbEkKB28PcIM1wQBZPJTrO8Og5fJmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tlyXlgw4;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD90E606A331
	for <fuse-devel@lists.linux.dev>; Sun, 15 Nov 2026 21:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD90E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tlyXlgw4
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b271e573adso1272786b3a.2
        for <fuse-devel@lists.linux.dev>; Sun, 15 Nov 2026 13:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794777013; x=1795381813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQFSDg5cHBfrZhn/Xqr57kPvYhbLjr1otgLb7m0JLjg=;
        b=tlyXlgw4uEa3z3LxHJJ6CwQP6yEvZF0NwH+1JjZRDkiHSpvEPTIw7FiLyNZW5OjdJx
         PN2jClEsFtn+kmLrViijj7MEYwYGNV2rYIHbxnP0rH3sUqMoHOUMMm0gxDkE0BR/GDd6
         T5UEuEtPCqPCdq11vZFL4ukv0iyFzTKJ0x2aoMIHmf5nnzCjPhZoFXtc4Oc5f2Aw07mx
         hr5fgmEirGxfQ/bznEFGbrRfRqdovUBXmDGWuJnxhwIP3xji8wMlX50e43EaPVUhRtRF
         Otat2puDpPKOSqEzw/bmbXovndPYk4YBO1BCM6lDnIzJ0HW9Fj3/3qQLd+IAcSa5GaRf
         ybBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794777013; x=1795381813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQFSDg5cHBfrZhn/Xqr57kPvYhbLjr1otgLb7m0JLjg=;
        b=RI9B8MS2Q1AqvDJ8mfQaspqPZzTsG0EWZFY9DYR5wzpod07itpzcgPbnC4/NZUnWcA
         1R3Tej7MMbk1o9tclAOiWS2bAKFPv+OzJHSxtspSuxdiVngpqjOK/EwgN5yt+J9bFIwc
         xNu0TPEAet6MtwAd9WKCqtqYTgm5gYlvFmAyI9oKqtQuj/7kwrvt2g8LjRv3pPGwZlFS
         3eMaDW+YHDC3R3AAsuJ0m+6XoaxrZfDsXLRk1EwLtOLdkh5zRteZvOoiS8oi/2FdCeGp
         hL+tNR9S7jp5h11A9X/DolceBuLFvKhBxzkSDNHDEd+C15uyrfqXxNOhpC1NreD1RIP5
         C/3A==
X-Forwarded-Encrypted: i=1; AL+hErHUcnTGHE2BYuuH8QovHPSbMVPyFJugBcvefWrwicYPWqPQyoY0eALVojBBRhMTzMF2Em9cHnr+lexD@lists.linux.dev
X-Gm-Message-State: APuU4Z9IwJvtKaSWmBCyYzCX43yk775/Yl5nCbYo1bcjCVqy3k1Ul4i7
	kS58GD3h+ZpLSQQt9KvmvsrY/joSYoDREsTHJE/cy9aliyvMD6RNzctC
X-Gm-Gg: AYBFou2wWd2d4XzF8CJqvt6Hy7Me/kWEbDnXBVx/P3BIv9yoSNHa08WDKi7XZ7jy0WP
	z1A+vPKFcGeLUU+nal+XtOmjfvI5JB+4pSROuYO3xNyMCFRsjGkGI1czCLRYKyUX+K2YtLOvNWd
	p7W+L7ZtOA7JB+2n+MzuBIle9vpU0pIFGvTZBOZYbywzX/fwiivNz4zyLNIvhffISXw4nzWdk8T
	3VA7wXSyZ1Alvk1hVKwT6afTmTgqaGLylUR36db4v/zssLMZj5X0g6TCXyg8MtoH8HNZBai88bT
	EgTsGgl8sl5xI6lFjYM2aObEeRZptcgC9KeModo/bvNE+WviWNs53DBYZ+QKATq11uxIlLPumRv
	wiQQFcC9s7zOOaku4iE90F/CD/89phaLyuxsgaTwu8FzEESYG6+BysvP5Gg3cbJidjmkx25AD7b
	DNqGi4AXN1ofhypo3n86oN1nqRIe5g67L0ZbJnrX5GvgMqJLCi4x/WSWakPArpcQmusBP9Ww+xI
	JCSGWe67G6weZp9pnblS1+thVveKqP3ZYIHw0sZ78fB4lCkxfpnj7PvI7LbgdGZxB84cBJA6MPm
	xF5jLELE+VRNLHZq4ZO3MKoniz7RDnv7OpWfpajRnolo1O2SaQ==
X-Received: by 2002:a05:6a00:1990:b0:8b5:b3c9:ff71 with SMTP id d2e1a72fcca58-8beb374decemr7993433b3a.7.1794777013037;
        Sun, 15 Nov 2026 13:10:13 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6e7f5sm2892615b3a.25.2026.11.15.13.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:10:11 -0800 (PST)
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
Subject: [PATCH 2/3] inotify: zero-pad event names after an embedded NUL
Date: Mon, 16 Nov 2026 06:09:49 +0900
Message-ID: <20261115210952.2140036-3-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115210952.2140036-1-graypanda.inzag@gmail.com>
References: <20261115210952.2140036-1-graypanda.inzag@gmail.com>
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

inotify_handle_inode_event() allocates the variable-length event with
kmalloc() without zeroing the name buffer, sets event->name_len to
name->len, and copies name->name with strscpy().

If a dentry qstr contains an embedded NUL byte (for example, via a
crafted FUSE READDIRPLUS entry aliasing an open directory), strscpy()
stops at the first NUL while event->name_len still covers the trailing
bytes. copy_event_to_user() then copies event->name_len bytes to
userspace, leaking uninitialized slab memory from the tail of the
event allocation.

This mismatch dates back to
commit ce163918cd33 ("inotify_handle_event(): don't bother with strlen()"),
which replaced strlen(file_name->name) with file_name->len, and remained
in commit b8f2688258f8 ("inotify: Use strscpy() for event->name copies").

Switch to strscpy_pad() so any trailing bytes up to event->name_len + 1
are zeroed.

Fixes: ce163918cd33 ("inotify_handle_event(): don't bother with strlen()")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 fs/notify/inotify/inotify_fsnotify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/inotify_fsnotify.c
index 6e3af6452dcc..78eb1e92a14c 100644
--- a/fs/notify/inotify/inotify_fsnotify.c
+++ b/fs/notify/inotify/inotify_fsnotify.c
@@ -121,7 +121,7 @@ int inotify_handle_inode_event(struct fsnotify_mark *inode_mark, u32 mask,
 	event->sync_cookie = cookie;
 	event->name_len = len;
 	if (len)
-		strscpy(event->name, name->name, event->name_len + 1);
+		strscpy_pad(event->name, name->name, event->name_len + 1);
 
 	ret = fsnotify_add_event(group, fsn_event, inotify_merge);
 	if (ret) {
-- 
2.43.0
