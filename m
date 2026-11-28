Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795854543;
	b=lQUh/VhEhg/9W4sa2eWajph76e9VkpVNG42wPUVvrn0Kb3ftrUOgWn3CQI0tg+unmA6B
	 qJmMpqig9gHNNbGP9Kwd0YzBNLBw6nV6xhI6AKP29+4IMvuFphF8ScINsIuRx8u9C9ziZ
	 ECjVgCDwRAMJ6ISGEr+yebBtZcAg/DSeJQgpW0kiwsjzNaheLtRt7n8/BJLeyyhzyh3hl
	 3Vi5XNiFsv6b2vBwB5SF6Ty6bhsZuMNebmlk8MJHTtBd3OxaKpTyq8cVp8UyYxRRuFhH0
	 lI5rLElgTBzAfRmLXqqIt1wclbUwoz3rQsorMNxaIR8jHXrExHSt7mtj6YvOfVAyQFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795854543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:MIME-Version:
	 X-Received:Received:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=2JoM14t7FH+1NGjrD2mU/HrytF4EJVsMrHx/Wx2shbg=;
	b=f32p9DQuxstugqH9r65/54z4wjIg0+GKJjgeWw0p3lJXhFaNaS5mRkuPD5Bv79+YuQNI
	 9uUCn5I8IS0XkUBN6LNvjKkuydWQ5xLeZOi9odiEChaHXyNFGMfDkpRhPltOd8TYrtHH7
	 yTnCXwIOP1kPpO95d9lt/Vbvck0SBRidjvALrm4VEJGkBWMj0iomao3lNyNzZur0C1YxY
	 ZY42AfcuD4JM0KuH2b1/jEDDoezJU6T9x12gZl6BO42JJplnZFN+APV63nFBeugDK6Mpp
	 2KNZpHfoOnparv7PVUbOVdYhBEZEAnaMWqNxRO7IBssX5s/SKM4huzAd3CaAYF4NhRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RshoYLgt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF63606A330
	for <fuse-devel@lists.linux.dev>; Sat, 28 Nov 2026 08:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EF63606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RshoYLgt
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso7453733e87.3
        for <fuse-devel@lists.linux.dev>; Sat, 28 Nov 2026 00:29:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795854541; cv=none;
        d=google.com; s=arc-20260327;
        b=MC3MouBzXNnJ8Q+Rmz5vlBD4Ipvxt1Ue3w6YlKLJrA/t81vW+lhd2614LoefZwVMLa
         k3Fv9dCpymA8+sBGGnZ627yKvYaxXNUs5YjX0z2sPDA/M5JQRFG7muyZ8IDJNZjsNKin
         HGmTUcqWcu8lGO2LQaS55xfaSQuCYQ4zUJl++I5yIoLSqZW3CsHl8PxsqxiJh1TJw5z+
         1qb6IFyXfc6onKLDn3s3CpcfKeWQvl6hoDOMUw6pOeNyXFML42kiyCzYVoodXradGvUS
         WosPGGaOkkc7AQQwmHrbxZKvXLueKtSxeMyKdL2hWfVcjGBU0y58d1a/5uyIEJ1LINfr
         6CBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2JoM14t7FH+1NGjrD2mU/HrytF4EJVsMrHx/Wx2shbg=;
        fh=B+9C8JbwIMY55iwgrU4OrvqerY1Q32hKJZqBClm+EEU=;
        b=VUcIcpWqjKQiGMBTYjGoRCEtuhoZuv/mo73u+FMfdESXjxzKEqH1YxYtMZ5y0oEAUD
         nPGwfODcLPmhP598xjb9WKUuqEIT0cHP6R2pKvYPFz/gmAQ5L5IoUcHq9hP9ubaxCjpy
         GWO6wujpQRbmMjZiy/aYe2BH8f+1jvoRcgoQGfGXSkp7ee8/XnlQ74gCchM6lGNEhYpu
         MivyMXMusAv/F55rSEpIjc+wnsPfzLZVilTZjKRyt9FB1Wn+2HvwRUrQ3t2zCj4ZHS5v
         JAzHMO/aLgHQZvI/mAXX46Fvo0sMlarhqtoGmjt/x7Ctl/YRkom51OPL4YnsHkvT0nEG
         6mMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795854541; x=1796459341; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2JoM14t7FH+1NGjrD2mU/HrytF4EJVsMrHx/Wx2shbg=;
        b=RshoYLgthq49sNx13ApL3yLUUvhw0d0rA2ByuiAGLdmHq19o2H/Yz8sCy0X2QxnEbO
         cTwYSHHdCPfPzjvSRqkSHdXeyFryy8HXh9xwYeNwWanLB8y7d1vCCKQYh9JgUm6YT3mG
         gMJm8Gh56jVb3D0FT+3XF4lAFTFXUTKfKON6Ztp2XnOp13fO6N8OKLpjbB84Bu1bsxZf
         60XfLMtac4G8pXO6MwU1z0ECo6cdjv9V0BNgxghvBmh/VdN/WQxHASAGfHUBEBybICLn
         0/sz0XwkpegspWFdukHmo9GCnNj1WyXXeLUE08k22Gg5QkbTEhRU38B3/ek5WSYHEUcq
         uDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795854541; x=1796459341;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2JoM14t7FH+1NGjrD2mU/HrytF4EJVsMrHx/Wx2shbg=;
        b=BnB89hxG6NgIgBdKgML940EHWdS5d2+Acjgg2Pabyz7U173C1TgQVDdokzOR3k45cO
         /SCQq2cQFXXlg+/BBC6aEl7T4z9GUBP2nSK1uFPjXvwX1qEzOBOTV0i2b9znpUDWVIms
         kkmHFoL/ugk7NLZOrAu9AhNTSDPvQ8D7tyK7QbKhXuzGz+9euexT49c+gMNGlfD8uDZO
         L8cp2SFCP5XxkiYFLKfToq47vBhqyHvBmcLDQyB4sPUq7ODnxVkThcYZ9yHpi7KEsHpy
         qu5K0+K5iuAcWAzx0UxXmNHxnuspFOaXUX8zIX+uz7VsBm+phwSsxOH9Tl8YD1IfqtBn
         5uMQ==
X-Forwarded-Encrypted: i=1; AL+hErEiwDtOhDFtJb7qPwrUO31DXbL2xuqtVhMNKXWLo0kPo0/2W2eYXGI2O9dPhqanTFJSHyG0RWVqc0NC@lists.linux.dev
X-Gm-Message-State: APuU4Z9vy6BgpkQ9LNkRcFGG+wvVW2PZ2tfVMOyNx2NbIrL/qf9+uNBA
	V6tgo7EeDkOsT1qlWBZCu0yhegXFjXFANoSA/DKjU6/JXCXIISdFPK/Wknjb+yBUpFSFbsw2wdx
	Oi07UG30nBpCTo3I75WzM5NqtJZ8RPbg=
X-Gm-Gg: AZFdTZdblzYNXreHsMh4JZLj9vc6WchTxbUZRgxt5mIbl9TqCkj1gMh4GTem5QqBFA9
	gzR9xiLf0PnPoTmovgxB8eD+hVqpJRyecQWYKeq6P86boz5D0DfvhMx0RFGAt48br7iTrttH+uJ
	iP2/JsMd/rXliEBIZpPt4E91jxn2geZ3N0BtZC/ePsblro5Imwlql7UWAMeBhBkdSVgnIffeJDX
	2kSLGFGpfD5bZYMATXJIqs1GKBwaPiFsh82xHEocXoG5aHJOpeDTD38aiXXEUoyY1wohijeVsKe
	7o5cJUOBvdufrmI9tIBxBuPzVxRwAtE5QivLBSd7BGCO09AWreaJ0QXmLMQu6WMsHShTpO2t7x8
	g8PLVYvKi+94xY0NerrvwcIm5w5OQIfToIlIstWKbHgAF8X9TcrJmpq/mthIr7FCxfrBgtzlHkn
	4pNSCkT2dw8OKVIfDSE+XfH483SA8=
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6512:132a:b0:5c1:acf1:337c with SMTP id
 2adb3069b0e04-5c1bc884041mr6979553e87.36.1795854540957; Sat, 28 Nov 2026
 00:29:00 -0800 (PST)
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 28 Nov 2026 02:29:00 -0600
From: Prashant Aithal <prashant.aithal@gmail.com>
Date: Sat, 28 Nov 2026 02:29:00 -0600
X-Gm-Features: Aa3M54ok9czH8y5GsoBTJU4U42v9AvP_hVfQAAYhuojDMMlAZ3fmmSw24ij6Opc
Message-ID: <CA+tAuhOC7ifPWgWJDTPF03nzF82VdaFSi+RSxEeNMNbS1-9F2Q@mail.gmail.com>
Subject: [PATCH] Documentation: fuse: fix typos in fuse-caches.rst
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Jonathan Corbet <corbet@lwn.net>, fuse-devel@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Fix a misspelling of "successfully" in the cache descriptions
for lookups and dentry revalidation, in two places.

Signed-off-by: Prashant Aithal <prashant.aithal@gmail.com>
---
 Documentation/filesystems/fuse/fuse-caches.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/fuse/fuse-caches.rst
b/Documentation/filesystems/fuse/fuse-caches.rst
index 0778dd3d3..de1a452fd 100644
--- a/Documentation/filesystems/fuse/fuse-caches.rst
+++ b/Documentation/filesystems/fuse/fuse-caches.rst
@@ -156,8 +156,8 @@ in several occasions:

 - When a new file system object is created (e.g. ``FUSE_CREATE``,
   ``FUSE_MKDIR``, etc).
-- When a lookup is sucessfully performed.
-- When a dentry is sucessfully revalidated (``->d_revalidate()``).
+- When a lookup is successfully performed.
+- When a dentry is successfully revalidated (``->d_revalidate()``).

 A dentry expiry time can be set to 0, indicating that it is stale. This means
 that a ``FUSE_LOOKUP`` will be sent to user-space then next time it needs to be
-- 
2.43.0
