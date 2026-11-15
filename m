Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777020;
	b=MaG+cq3WeEJs77V/2wdeZfD56mW4C9lG1Dt5YhADIstfg5F7eUwDESXSz52KBATTdYsp
	 BgAye6AjcJJC8WeH37pXKWIJLeaIaZwV4ELbo2rJhr24K7dX2Vm+4fb00v19Q0a91fP1R
	 9+CTKrzT5ENJWClAcJ7iehhiiLYJFIT+h76dDtShtYbRFhJpfBERzqkcgndF3bP7ibxgb
	 0GfD6lIPOt307Ll6dqZF8Xc0XFrqqMv3CgOamX+LwGf5RVTioDp7JsCl0ndPQPAi0TFCa
	 RljcIa3TvdLBweKbszI+fzY1u8IO8Wb9fmzrBn7VtP+X70WEf2yGBp97vJREOm9/PBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/ARd3XR21b98dC+E0q+y0HBDJ/Q/aPk0xOOUSlTPKys=;
	b=laCHDuwWGgVXTRoQnRUe5XPkHoK6pstz9wx5zmMRQ9QvpCGnUu6+7UXhkBnCP37gTiLS
	 kJg5pVTwKkG05CueB4EeDNdVUohtXxieLyIYcTS1QY20qfuLZbVRKHx1B5SauENHOQo5u
	 X3I3Q0TH/mxgpWPE/HWrOElxwtEY/1GwZqiDJJKMARAkgzoQFK6RFDUW0yOOzje1C0DQN
	 8G4dkhFptW2FRhR3O9VuTYSUYH0TzqfudCgsz0QIn15/aTNsba/XFgnZLW7MoIY796G3+
	 /zKC82Syxw/rmviltK04IvGwo4K6M7SPQxyAgLh4ER4q7jCJN5bbAQdV6CSB0QN81aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XV/iJxnN";
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AC0606A329
	for <fuse-devel@lists.linux.dev>; Sun, 15 Nov 2026 21:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9AC0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XV/iJxnN
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so1374038b3a.2
        for <fuse-devel@lists.linux.dev>; Sun, 15 Nov 2026 13:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794777019; x=1795381819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ARd3XR21b98dC+E0q+y0HBDJ/Q/aPk0xOOUSlTPKys=;
        b=XV/iJxnN4jsymN/gQpd7e+Mo8vS9vBITA6wgQJlbKjPl56/MLL0mb3Lx3fA2kmAHlK
         UjYomW/4n4l7Y2Ptsq3AhhFNpCOQ2baCkALHO0I6gHEekEmQY51Nr0xET53a0vqFdVSF
         3EvxCC+Lz6gmE3aO3lfGrPhaNpMr8Lk2kQWJMNpRl1C4+/zzWe5PI46GiQFA9sDcUDmD
         pMguq+aaOktvJy5Y+NdSdyfWp31E0l/eaYkJahYPfEf96+tMhtiQD2040Kw5w8x5gh/3
         ibCWs0aJ95KbVYSQxlDYBfIl6G6PRlHc1eyRnEqzBwABBqhRgZnY5R95vSYmHMdEReD4
         dFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794777019; x=1795381819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ARd3XR21b98dC+E0q+y0HBDJ/Q/aPk0xOOUSlTPKys=;
        b=Z5VbeDE1L5rFNVyQFvjeQDo4YDCnbs/s4sVI9fCKdk+B8ZvBl9Peh2RLNMhGDzy4sC
         l1S0JdaHHucD/UdZBRh5Mp7oWo4aW3S/9EfL3OOH30l/nXUtE90cJJo9x1GvAuMOVbPD
         nUcSwDt9rGQBNWsCBpGeczUts1AmNPvLaTXo2nI87AA7z7AImufWIqk9aimGCWOzwCGn
         FdrzSI5tz8Q27D1VmmrBWG+ZKpHY6tOiC6SoUg+9+3IQvM7LJfaQnZqJcaHkz2RZl+DH
         IId1iZhsB+VX3w26JwfxwrimzFMo6Xt/VrqG5iH+W2aPVa/CzT9m+av23rN4rpjIh9MD
         5EqA==
X-Forwarded-Encrypted: i=1; AL+hErE3hx1LxdKKZ+lITorPb87AlVoKnHbPV+9bSXPq1ma/1eVBmuHpOc3/0HodVp8EcJgO+cbN2XEdZSrl@lists.linux.dev
X-Gm-Message-State: APuU4Z9FpBFRh57S/hJ8+2Iw6V4d5n8XHAj5Uxg3VaNXCmDbuXe1pc7H
	HD5mH16qme/oN75oXKpG39i4YqZvPfxbYvgbnp7VcOZN4gvxNX12bTX8
X-Gm-Gg: AYBFou0hWirjP3mq5zDuG+kbpca3TkPYph9ZpA9lJYcNAD1j/uKNRV0mewE4lcBYcwh
	6HbP+LCYrqsrSKovQqTwYn2h2O16t5rXu9/GIyfu5zaZpJUSyXDDPdMH0UgyziC6kXGVBP93m/S
	jnwPZ1FgsosIUy4rL2AVqz548QwpzB6H7i2db0Mk1jJiKfsFbNEqRap8YvWvPVKS/2sAOJ7fNBi
	hBQZGcYkYrCgqTo6Oc16nrkr1RwdhzIUO2KqnqCaAvWRJ8q6TBQm8CIUtgwBefAspZwMOQWJYsw
	i66w4GOZrSWwqxcqZJcW9ZwYuLbIFdV02mx4Tf0W+HUBWHH0yqXHnlbd6bXPY5R9d6Djyn2a3BJ
	EVZkUJHxn1/NC79JU2nFJPhMVH/mGCTjgCRcp9TDhDJy1Yyt+y8JD72SA+WEr2lBK2j40WMYDXf
	9tAnHE2EboXu0wLf0YBKD3pWBwCSB7XY0mTbkm7dXGsrI/Rj6IK1TpDdMN6MX1mjW8afpFczmJk
	OT3vTaZz0LLfBZUIQHl94sAB1BgaBmANlAW7AbMVD2PWCcffm7IjSJ2DcF1MPjYTAScLB5tjZeu
	XFKGipVeSS1/5HNxqrU01LLH/hLofyKYoY8iv3r3mtER+tdwkQ==
X-Received: by 2002:a05:6a00:1a89:b0:8b1:e8cd:49cf with SMTP id d2e1a72fcca58-8beb619b3f3mr7131715b3a.22.1794777019150;
        Sun, 15 Nov 2026 13:10:19 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6e7f5sm2892615b3a.25.2026.11.15.13.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:10:17 -0800 (PST)
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
Subject: [PATCH 3/3] fanotify: zero-pad copied event names after an embedded NUL
Date: Mon, 16 Nov 2026 06:09:50 +0900
Message-ID: <20261115210952.2140036-4-graypanda.inzag@gmail.com>
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

fanotify_alloc_name_event() sizes the variable-length event buffer from
the qstr lengths and allocates it via kvmalloc() without zeroing.
fanotify_info_copy_name() and fanotify_info_copy_name2() record
name->len in info->name_len and info->name2_len, but copy the strings
with strscpy().

If a qstr contains an embedded NUL byte, strscpy() stops at the first
NUL and leaves the trailing bytes of the allocated name buffer
uninitialized. copy_fid_info_to_user() then copies name_len + 1 bytes
to userspace, leaking uninitialized kernel heap memory.

This mismatch dates back to
commit 929943b38daf ("fanotify: add support for FAN_REPORT_NAME") and
remained after commit 0fdbe845534f
("fanotify: replace deprecated strcpy in fanotify_info_copy_{name,name2}").

Switch both helpers to strscpy_pad() so any trailing bytes up to the
recorded length are zeroed.

Fixes: 929943b38daf ("fanotify: add support for FAN_REPORT_NAME")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Note: default FUSE mounts report a zero fsid (-ENODEV on fanotify_mark()
with FAN_REPORT_DFID_NAME), so this patch was runtime-tested on tmpfs
with FAN_REPORT_DFID_NAME create and FAN_RENAME events.

 fs/notify/fanotify/fanotify.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/notify/fanotify/fanotify.h b/fs/notify/fanotify/fanotify.h
index c25cf5c1fc70..4a1f14aa4974 100644
--- a/fs/notify/fanotify/fanotify.h
+++ b/fs/notify/fanotify/fanotify.h
@@ -225,14 +225,14 @@ static inline void fanotify_info_copy_name(struct fanotify_info *info,
 		return;
 
 	info->name_len = name->len;
-	strscpy(fanotify_info_name(info), name->name, name->len + 1);
+	strscpy_pad(fanotify_info_name(info), name->name, name->len + 1);
 }
 
 static inline void fanotify_info_copy_name2(struct fanotify_info *info,
 					    const struct qstr *name)
 {
 	info->name2_len = name->len;
-	strscpy(fanotify_info_name2(info), name->name, name->len + 1);
+	strscpy_pad(fanotify_info_name2(info), name->name, name->len + 1);
 }
 
 /*
-- 
2.43.0
