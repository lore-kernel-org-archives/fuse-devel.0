Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354167;
	b=eUem9/LyKZo99a5Rp8FbKzuxe7FevOCoiv1X604fimXb5+JEX/qk6rDd4yb5EMX0o/DB
	 igoLddUrbuHP8HCMMMHI6jddbCzwlTW0OLFte3iV0OqMeJ027PPPi+u5Tl91SHnFLpjdN
	 36LiNdLKJK+tbhgwva5FI1AdPQtUocXxmw7ErIHwkDHKnilJEYDzufBfKAnsOcjhE93il
	 jbTuYHCr1XFJgWbtrnIBlQ7GCr8vRPhi3vaTnmih/MKsYl5YdTUaxqD2u/szzC+UdWG+d
	 itEEEj0m/9zqjVVwxhkuQNm4TCPcEIpLLAgECuBCueNLOgDWwfRU9GDZhg38hq2GGkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rl3SOaBGx16FRI+oyRqAuGUj5nIKmao6bushjJB5je8=;
	b=5lf8PJSWqkxgovtPuA/VdyiPZkaP8u73rY/CbTSnWVDFUHp5MvKpc9T9TQXIA922niGd
	 jb9+pILKnNjcQNyJE4hkPtqyF854sRJdil78dJ4vJiwsbCK5OW6Ay91rxhX5scqd6vc+5
	 sL1688Agp39sfJ2h7rMsFHS5a2t9j8DbEB/g/KNbQoWycQGNgBzTi5/0cJGpujIptzueU
	 FL29JaEAGQAxBV7qmcISuXJhZhu7/JtA9RZtprAfUyAN348cUSkczJleTf+al7eYLcoSE
	 WcDtjky/CnLcDeKJU/UkosYIjRvfaqQcrugThJBsjnzy1R+W3qUrAmcOgDwnMrN2ePQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3Fo01i5;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39366606A320
	for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 13:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39366606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3Fo01i5
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49412eb1474so1456703f8f.3
        for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 05:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795354165; x=1795958965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rl3SOaBGx16FRI+oyRqAuGUj5nIKmao6bushjJB5je8=;
        b=l3Fo01i5/VcTDVYbb44wp+zAvjO+FkBShh6XeJW60jEmIQVfdKRSWKwFB4XNzKpXpF
         0kOMQQc40dJOMlCz1k/y1jZPS8ZgRca+pXhEyZgMpsd6nYglXGltoV2DZ2YYRu5VNZmF
         ZXN7io5n+/+NYCclggjZySE9KfcAoP5svwXNa14m+eIkdUsZIi/MBebnNzc1VM28Di2B
         eKZE7ehXztSgtd5abxaCd8D1o1y5dNDeI4XW9yJ5I7s8w8ijrLEo14IcjsgiITRyL3c/
         KtO4lcQ+B8YXkErtYucu7pmtgfTQgF1ez0nQ1F6wyZgBe+Q9eOdAIlrHkRIEK+1IQr/a
         mgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354165; x=1795958965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rl3SOaBGx16FRI+oyRqAuGUj5nIKmao6bushjJB5je8=;
        b=wx6ZmLylDbH1AUR5z29aCCfYAIVd9Ge6UKDH0bDG9HZjb56KfodVSVT0AktHAJK/Xq
         5hm36T/Lj5/PNYkfrIJuVX+lMouXHW2DHR1n0Gfk52e12GD8cU+xuhcMIwgNGcy//XtO
         KyDrm6fxcuNRgc8yYjiZqPWUYo6y/x866S65GaCsl1wH7Ck0DR60IBhjEBfmshBdT7T2
         Zm88Q3Yjzb8io47IkC/sk6eB+CjWmuNhekQh+L3plSSvEIxk/vX43YzxmHDU8CwvGqLq
         xUU0CbIlHkH2MeeRmM331GuxnIfF3Fd4oZwMKeUT7VY3XhkZOAngZ4/hulDJF2frdnE4
         RPfg==
X-Gm-Message-State: APuU4Z/JpXij7yP5wVvQf4sgguTbYdtAovyb9k8tT8ojWEH9/LVYSYkQ
	/0uHRgHXKJZSSndauVU+L6hqRztBVEOnDc/41zmnjOOUupEdnKDH5wwEPCDN/8XMDiU=
X-Gm-Gg: AZFdTZf/uTvaW74RLnt2llh1GbtimW7z9ObLjG4SpY6a7yTyrkVjNtkK0HiMekmGl1/
	75ueIJJVBvEE7B4p3KRcgheC7w2st09ZLqJM7+nxax6a2tD5fjt8o7VM/4WKLPmsPVrQRnUAqLE
	S7Cn+HdcuOC+wug5/LlyEbGYFWnPZ5bbWJpqfarYBfuQsD1O/AZo1wg7mLacPmOG6Kka9YPvMdW
	u3ZK0ZM8D9uTT8Yn2e07WPfyE62kpmnhQqd1RZepoTk8ZK3/JL4ECE9blOAJOukekaeDDcgvW/s
	V4sLsO2bWma8Q/XOKJAOld+7e0F4oy6hIATN+LM+f8y6r40qQenr09ObKKC3GoiTsi4KfHm4i+y
	zSCTgbig98ExI3i3cFPtZpNzyuYCu2dAX3dU0BghgctsHNGjRe1fJTJsZFt9E+NJTyEENuw83XU
	0m6/w37HY/dBW6yPCVHntjHFlXVMkTW7gYmia8OjnMB4kSMwpRMDvrtH/E1Mwm/1fuEWbvue/zz
	guTFAhbchkhHEVzfMGoQBNgYly3dq3PKLJ3CPm/Z9U/mLl6qgqOoXbMZQZA5GY3PFAo5bbg0d74
	OuPiOxsAYdalMtp1BlQJrsq2AJcQcAv5NeMSNkaYMyodjQCsI/W7Syn+9up0//v8IghN2I6LLoO
	SHLOa73Qi
X-Received: by 2002:a05:6000:188b:b0:4af:e519:ccd7 with SMTP id ffacd0b85a97d-4afe519cf33mr5878532f8f.3.1795354165553;
        Sun, 22 Nov 2026 05:29:25 -0800 (PST)
Received: from t480.fritz.box ([2001:a61:3a4e:c601:fc75:724e:6b78:3649])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm17286017f8f.16.2026.11.22.05.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:29:24 -0800 (PST)
From: Han-Wen Nienhuys <hanwenn@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-fsdevel@lists.linux.dev,
	mmitar@gmail.com,
	bernd@bsbernd.com,
	Han-Wen Nienhuys <hanwenn@gmail.com>
Subject: [PATCH 2/3] fuse: bump protocol minor version to 48
Date: Sun, 22 Nov 2026 14:29:15 +0100
Message-ID: <20261122132916.19066-3-hanwenn@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122132916.19066-1-hanwenn@gmail.com>
References: <20261122132916.19066-1-hanwenn@gmail.com>
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

The commit "fuse: kill suid/sgid on fallocate and copy_file_range with
KILLPRIV_V2" fixes a bug with FUSE_HANDLE_KILLPRIV_V2: the kernel did
not tell the server to clear suid/sgid after fallocate,
copy_file_range and passthrough writes.

A server cannot detect this bug by itself. All it sees is an empty
FUSE_SETATTR, and the kernel also sends one when only
security.capability must be removed.

Bump the minor version, so a server can check whether the kernel has
the fix before it asks for FUSE_HANDLE_KILLPRIV_V2, for example when
it also uses passthrough.

This is not meant for stable. On older kernels, a FUSE server should
use a workaround instead.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Han-Wen Nienhuys <hanwenn@gmail.com>
---
 include/uapi/linux/fuse.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index cb9e9554f0ef..6f6baded766b 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -258,6 +258,10 @@
  *  - add FUSE_NOTIFY_BACKING_MAP, fuse_notify_backing_map_out, fuse_extent
  *  - add FUSE_BACKING_MAP_CREATE, FUSE_BACKING_MAP_CYCLIC
  *  - extend the meaning of FUSE_HAS_INODE_DAX and FUSE_ATTR_DAX
+ *
+ *  7.48
+ *  - with FUSE_HANDLE_KILLPRIV_V2, send FATTR_KILL_SUIDGID in the SETATTR
+ *    that precedes fallocate, copy_file_range and passthrough writes
  */
 
 #ifndef _LINUX_FUSE_H
@@ -293,7 +297,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 47
+#define FUSE_KERNEL_MINOR_VERSION 48
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
-- 
2.56.1

