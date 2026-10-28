Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178772;
	b=g1LpLiEI7FICw6jQRWtzoHKY7Y6PzQllVM5suMELMTwiHMDB9bz92dY+7XQmEO1/7a3g
	 bodhm7F7gPJ0rIas+Gv8yV824uzLNSHvgrcF0WZ97y1bFn5DSBcZ388nttrkA2pk0mek1
	 v9ji3f56i56G/tHvxqLfUKkV1jhQE4+whqQI9SMBFpCmWHpcrr5D1rRVAhkVOwN5UOoKT
	 CEkK4S6PVOmN2GP0+M+0O3tmNG3F+lBjVj8+FiYkMiCqdFbwD6ow5fSD4ydj8oenHEua1
	 KQXRrVCW6KB9zVeA+GMZArqYTqZW3AXs3y76Rm8XOzaW4zlEbRalpStu8oW97P6EeXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cze+/njh+6iC6GRz35z+vHh/qHeu41clDeKLEz/2S94=;
	b=ngvK9WRMC0c1YRh5xxHW7uUNXRjYNR/NlmRBbkqAt6D3P8wa3kFfgeCr/LJtoTHIdNK3
	 i/8+cmsRdi3SGqXzee8sxycEt2i9rODhkYg83aRssWbFlz4vkDMSGqiPICfW+EZgZ3rbE
	 SVDIxHHg+gJK1GyHMZF1TeSVGwtdaSFdr8W5JfMbZNlM+AFL5HeDAj5WVxgeFiuZh1evH
	 dm7R44ZBpro9a2vjbSmlnnJighgMaG+2/HZOxr0Gd1IAYdwiFQlF7yUos/h4e0oJjlLeI
	 gxwudxoQy5/bQgAojRNOc7nIwn1GM7Yrh0CnJKQH8KgGNF96ydTS++T4SAPZGCI9icg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3n4nB0s;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473E3606A31A
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 09:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 473E3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3n4nB0s
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so6520125e9.0
        for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178771; x=1793783571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cze+/njh+6iC6GRz35z+vHh/qHeu41clDeKLEz/2S94=;
        b=M3n4nB0sVHiaGt28qdHxcXwD0enPfwR26e+g7XZCKHe2sXwWwvzb40LVXzGuBQh91g
         a+hca+vbMzJsw+1zobP1SY3lDw/wgQBJBbAYhVzsLh8VEceA2QFfleg3PMJvbv1sNU5J
         9RnnKcqGsOTK09pCj+QwKOTsVZ/uo9BXHb/SHsuu+n2tKFhbt6xnIMIutly0J1CTGtix
         waApfuFKb+PGIc6QMtcgzuF3V8VXn9gMnYBqxLPx79v2Ro22aS+hOs9hND62UfLf9tNX
         ilpaczdwD+iVh9hL0dr6lNXY3cmLoQPGvHYnhpuWK05tEcC8V1raMdXPJTBWVWJZZ6LJ
         saWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178771; x=1793783571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cze+/njh+6iC6GRz35z+vHh/qHeu41clDeKLEz/2S94=;
        b=x1gPaUlrJBhJ070nzOywItKiZInYtyuFv+TQ4jdTClfPFgfzeGjITRlnrs57soEsMF
         bNo9GqfbIxexk7Bo6hKd7cOQa7WU/PlNeEIpk8UlJPfqgAj7l4hTNBEcDutE5GzqkoPQ
         +7DTSSQ1qBld6ThfwDRnAn74JJ6M5JCI56GSIadO47UFC2rIrknZQvfDTMzcalZfNAw3
         atUcfGETpegCkCh+oaTiRZ91GgMyo+ECl0UfPdoNenV6fMKY8thhc7+mW6Cev4u5nbuM
         uuHHn/Y//0moMAIVytNpJ5SA8ebmpHnMtkfwNRN2+kvp7Dxv3c9OFud4X8LgdzYUxPJI
         mW4A==
X-Gm-Message-State: AFq9FYICWNu1zA3fMfQysYBA1P/eZYrwwvpLSziDO8hfdLW4SXGOysZ6
	zzAn+30hXbSArnXAz1/ZBHEFI33tWDn1XWiPgAudsv8cT7HC55A4Bgn5OGbeNXAY
X-Gm-Gg: AYBFou1q8hiCliatWOJMfR9JnUcpvjqGYcSWABj2rPTBj1CDlHp7p/pDM+iOYmkic1X
	7OvCAd3bwDradQ3migsE15CymGsD1Ys9GrhO6l1lStTtv4uziWV9pjPoaC+Xn326zjzsR/O/6LV
	5wqkusQjwu1h2D0D2tT1e0+pypQV2c00Q2aWKKcBTvtEMP7delZKPg3u7LEEsqCy8maUsdEWbT/
	D8W9MpxuJQIo4lkqZoxTyy3HLhqQXY/MM8A8a0cFVfrtIXWlLruiNwoFGx+QNgzzZUhEVfZLxz4
	UDdlTb2NppGFQjRM/k+Ubq1mJgIDrZDYf4+JCy0e4KM9g4hUng8drykh5rf9yuky3SV211s+mpk
	IF0yPVHPuUz9JojSyitM7743jyBO6Ny4Apra07y09hy/49ITfSmm+ww7rYUtDI9LgtBiMojI0Ky
	CqgmgTidqdt+FVAuqvBWsoZtvbiHm0bwHbBnbjA4S69UCNNTeG835Tz7bVxK48cSgIZM5QWVkTZ
	DVAP3OC2vAO7ZPN4BSG5VDROKLkCSNW2tpQMbA6JhetV0ByVx2/EEaTnPZF1aLYQAyNel67GCrn
	WtiMvBPgecT639R7rxtPGkqrkt3zNsl+uNzuxxjUSPTW1kyn8OKsqLFl3VQRKuQ=
X-Received: by 2002:a05:600c:3111:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4a995c2de0emr26147365e9.1.1793178770594;
        Wed, 28 Oct 2026 02:12:50 -0700 (PDT)
Received: from t480.fritz.box ([2001:a61:3a4e:c601:fc75:724e:6b78:3649])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c42b3c1sm33507215e9.6.2026.10.28.02.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:12:49 -0700 (PDT)
From: Han-Wen Nienhuys <hanwenn@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	Han-Wen Nienhuys <hanwenn@gmail.com>
Subject: [PATCH 5/7] fuse: allow requests on behalf of no process
Date: Wed, 28 Oct 2026 10:12:13 +0100
Message-ID: <20261028091215.914885-6-hanwenn@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028091215.914885-1-hanwenn@gmail.com>
References: <20261028091215.914885-1-hanwenn@gmail.com>
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

Requests made by the kernel on its own account, rather than for a
process, have no meaningful credentials: a kworker would send root, or
fail to map into the server's user namespace, and a process that
triggered the request indirectly may not map either.

Add args->no_caller, with which a request carries FUSE_INVALID_UIDGID
as uid and gid, as on idmapped mounts, and pid 0. Servers already have
to handle these ids for idmapped mounts.

Signed-off-by: Han-Wen Nienhuys <hanwenn@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 fs/fuse/args.h | 2 ++
 fs/fuse/req.c  | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/fs/fuse/args.h b/fs/fuse/args.h
index 5173264a1261..c6e7a55049bd 100644
--- a/fs/fuse/args.h
+++ b/fs/fuse/args.h
@@ -31,6 +31,8 @@ struct fuse_args {
 	bool force:1;
 	bool noreply:1;
 	bool nocreds:1;
+	/* send no pid, uid or gid */
+	bool no_caller:1;
 	bool in_pages:1;
 	bool out_pages:1;
 	bool user_pages:1;
diff --git a/fs/fuse/req.c b/fs/fuse/req.c
index 51cfd64ea1ba..d3b49b25e18f 100644
--- a/fs/fuse/req.c
+++ b/fs/fuse/req.c
@@ -13,6 +13,13 @@ static int fuse_fill_creds(struct fuse_mount *fm, struct fuse_args *args, struct
 	if (args->nocreds)
 		return 0;
 
+	if (args->no_caller) {
+		args->pid = 0;
+		args->uid = FUSE_INVALID_UIDGID;
+		args->gid = FUSE_INVALID_UIDGID;
+		return 0;
+	}
+
 	args->pid = pid_nr_ns(task_pid(current), fc->pid_ns);
 
 	if (args->force) {
-- 
2.56.0

