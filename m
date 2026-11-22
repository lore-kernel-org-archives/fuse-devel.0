Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353928;
	b=sYKRn+XW8uk88nE8tVplZAghHISoOXLKXpcmrVDrItqcMo5OeDblgspGHcm+yZOTiO1v
	 6ZKyXfCZUMYKPy2X39W05NbZsxRg+RzDX+UMNfn7+92G56e3+RzaYpbQT/VIxf4WKnhsM
	 lMIt91x1jkcAc73auXm/xJkHaSnsHcpuc9bwPzjnRikzci4VWMiqz/vUei6R+FXUA4J0R
	 xiNcIrmel0rC3MLeBhC7LprDXBNMv88OuIlYC6AoIXZE1CmnOsRhOsXy84mt4qpprk53T
	 ZbWn+vj30kIALIIxtyIIFJeHV7J5DByx15+ghfCG9uTw+gZ1sxat1H6bWvAOnlZq1dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rl3SOaBGx16FRI+oyRqAuGUj5nIKmao6bushjJB5je8=;
	b=qRiqrkHB+e1vYCHOdmGXcd94U7VmqcAB1tpTs0jPkp6KE10x82k2vmPb4Y2nB5EqkkfS
	 72eeBIQ5GFlXmor+B1dpmX5TmI4CKfKNHYxgef1W6k4QGMF7xJlnNPqR8u5JQkcWXh7I7
	 D3S2of8yixxUUXxw2XBh6diu9z23JjcWh/gEwtnGuRDJrdMdE4GJz+zn8VtlnzXebWLIm
	 +oFLAb053PaJQOsBm0eCDYnb/Bz/eBYEGf/NmAVE3bd9k/lW74Q/lyNFFk0+l13NEdsqx
	 xL0kxXt9Ka4IBSZA4swurvlglg6oBBTCRLM9e6zG4xN3IuoW3yHOnwKthFlf1RrzVaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5TdPCXR;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D7D606A32A
	for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 13:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D7D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5TdPCXR
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so17802465e9.3
        for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 05:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353926; x=1795958726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rl3SOaBGx16FRI+oyRqAuGUj5nIKmao6bushjJB5je8=;
        b=D5TdPCXRQsx91kkJ23P+Zqpdj4gkX1spV6GIrpC3Pul7vHbzm+WKpoynzyr8sab1+q
         R83vLSiy/iX7VkxTG1IR99P5Kk0b33tBJk2BlHj/YYqjDNK0r59jyv7Lu5oKnCIzi+ri
         /Ovw2iThMyvZ21um737ovNEXubmecWfhU49UrLMqzM+2AMZvZJ4lGJk8uQQXeY0D25z1
         O1cx//Qe1Fhzy8voUrClpY2/4SvCWZrYfeuTsz7fpc74oIxxcV81NzgIct5l5OafuE6P
         ix0HRP+AaJFBiH1S3TvBSSZcdOfnoeOW0fEBZ108cm8sZZUhKnxdFvpR93fPAyMWeNrb
         qZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353926; x=1795958726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rl3SOaBGx16FRI+oyRqAuGUj5nIKmao6bushjJB5je8=;
        b=fi3XubwlXPxMDT3PLm579cyhfzDlcRGmU6FlNGwDziZGanZcHSzjcB59NbqitOIsq2
         xrWVThDZ5YP4Cbfhpluyx9RxMPmE961EXB3dYQyTN3u6AqeTi1oQUwbkmGpBsN868+d/
         xWRTPCZWsyDPksdh87Xxusw6pgZg1LtCVoYvZePkKTFmF77bC6eawzvb0iY7t4nQ2uGH
         EYGM2V9s1ClRJndAYTgWz3uDJ2UXvzhAMUnqzO2IOf7MIUZkJ7Ax3norEDA4HJT4/Bhx
         t3q2Jaux6mv4x/vwA3om4kvQAHeYVSbUGsEc5Lhd2PsiE1Tq+q5wUvl6Rh4GeDUCjig6
         EMvA==
X-Gm-Message-State: APuU4Z8QGO4OTF1lqIS9wT5YPHMJ4O1o3Igwe23b2mKFxx3mvwZG1EEj
	3N+lobYYOGo7Uv4N1P+UQikh2+80NEuKmeTgju4ffKNSTpSmbxWwUtbt
X-Gm-Gg: AZFdTZd51AhJJzvwLkOZXtgNozNZcVy/7NDqKcZ5TqyCmzzR9NQYZM5RwczY1Hnyisa
	NqZ//zT2qm9j8F3a8Ge4bH82JqBZpXbtOkHZ1Vhs+mKG7EKX4o/62MRAICrT4ZpGuHG+iiAyRJz
	R6YGiLv80qtdZ4nsP/xQ7nnZ22QpZbiNEe75lzHifCQAaZqh1QkIPV5n3gwvQfUE4TKLS6Mbzz2
	R11Ce7y1VVx6KwceDt4wcfTn7p3dMDw0EhQl5cqi1zp15u75fQZmIgehCEGBrsyO7P81qIBOkSp
	DtvecX75kjZ0FHKI4WYpVPrkqbXTHBV5RPqGJVzTL9sO4hlz63Xz9RfFJEow4KVf5B7pfc2Tw26
	ehVG/8R40L+qBK2Bddsechhx18p2ZSebCswbdpJXrTuGtLwbn0oNpvzkwH3E1eZF042DsJgiCWV
	/iYI3q8kQTqF7cGE1yd46MTOJP3Ui8syAfGfVNJg7mLWi4NhU5fReHOkRmlOFvnodOSFRnKBvz7
	xaZfCndUNaU51fLotiyRxuvAe/tCAg39MwdpDxNmw7H+O4UZhysD9GL/s8ORAu/DDHo52SX95Gf
	r34KXKq5NwL0fcaPHJ9x72ghfWIx4wrcV8BoCItlyvR7REUrxzLary/e9uMU4IU=
X-Received: by 2002:a05:600c:4515:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb888267f4mr186945995e9.29.1795353926079;
        Sun, 22 Nov 2026 05:25:26 -0800 (PST)
Received: from t480.fritz.box ([2001:a61:3a4e:c601:fc75:724e:6b78:3649])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b205443sm17174948f8f.39.2026.11.22.05.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:25:25 -0800 (PST)
From: Han-Wen Nienhuys <hanwenn@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-fsdevel@lists.linux.dev,
	mmitar@gmail.com,
	bernd@bsbernd.com,
	Han-Wen Nienhuys <hanwenn@gmail.com>
Subject: [PATCH 2/2] fuse: bump protocol minor version to 48
Date: Sun, 22 Nov 2026 14:24:54 +0100
Message-ID: <20261122132454.18764-3-hanwenn@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122132454.18764-1-hanwenn@gmail.com>
References: <20261122132454.18764-1-hanwenn@gmail.com>
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

