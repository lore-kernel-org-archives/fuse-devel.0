Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777009;
	b=ekYdM2zKuBKZu5ar2DBV6n8cZEAcS4DeHi6m+W5PvqqL1TWM64my34hCwjY4hIQQlpZX
	 9C6xHA6OU6HNLlXNC8HZFdEgO6Bvgqnifly+BJUppGo8JpBvMu9wsrgY0bMLEWNvM8puh
	 7L0prN1MDP+zLC/WqZ7U5JtiqinJn35w0yL1GPaIr8vrsfk+3ydacFKV4Q7sDdzMGr6sJ
	 mSQ7TocjwPQOpHPE25WG6ycUI8Pe9bBkNA460L5bgW2Zuxkw897a5oJMrQfp/wLPIPKIk
	 fMMSi9t0hC67I57PCKp+NVUIzLWQQxDz76EgifEdIDNhCzkq+tF07CkDsPc9FcQQADw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vlAOOqvdVdKcDhX1498cVDfr4IVfu30LnqK+9Pi/SVM=;
	b=YB1402a2Zhn9J+Dssh1qF2RymTruI0Yxp0qWaWM+2cxM2ARRYVxg3OgwLnx+FaUkQ0Tb
	 j5YQ7ztaGtvvlHbBJYWOATegcjvR9pO3qw8p+CAiwmpOute7TQA/pxKSOhivPM9PSpIq4
	 2M77Bf3FGs1epm775RtBBTUDKnY5i0iNrvYBJV7j2ZumlueN63kicUuvd0fFhgDh9Ozjh
	 iQpgNOSrjJCfgOQQSfdzAgWaO+KiNj/c737InGdPmj9PMb1hj5Dhed/Tm1HPBscMzx039
	 JNm5gIk0juC3T9ra1axq5LFxSqPLTa10UbOeAIXFB7g6lJBkINDxko/bnPD51ERnS1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b3SK2utf;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DAB606A333
	for <fuse-devel@lists.linux.dev>; Sun, 15 Nov 2026 21:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7DAB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b3SK2utf
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so1022909b3a.1
        for <fuse-devel@lists.linux.dev>; Sun, 15 Nov 2026 13:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794777008; x=1795381808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlAOOqvdVdKcDhX1498cVDfr4IVfu30LnqK+9Pi/SVM=;
        b=b3SK2utf6VKArSOgTPrpx3BoZ159Wv4zKShtOtH43u9AflzgxTHPfowyciFBUppyk1
         G9ZSonJE2T+Ju8DFkli13PedibCM/F9tL7ophDWdLRhiR+DeDBFPL84MlIc/QVg2LCBO
         x4y0zsEKIiEw/KyvbSOmjFDogBaieju9iiQABUnph4/Bfdv9RVbtp2OuHblK+HDJ9VO4
         MGzpLwatFj8dQAjVo09BjuiJIlAlxl3pS/GvYck+Hl+RmemRDnx1zdGek13YXsQKrCZ1
         aNwlffjHGQ0a9fDLm1zGpRREhryR2vio3feJ1/FdVKGQ2KR9AAljqebCx0cNAkluBWdT
         FSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794777008; x=1795381808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlAOOqvdVdKcDhX1498cVDfr4IVfu30LnqK+9Pi/SVM=;
        b=gdD02K8H43C5BuOeTiNiZrxMasVbKhIqJh9XZkM5wtV40v56l02eH39k+4j7/NHbz8
         9KAJky86q18mVodgb1/mKA2YthCXf1Za4MDbyKHvhPcsHDcJU5khLbTld7ge5iRanpSe
         CiVc//dgYcVwQRE115A7mzWWCo2HVWzkSkzumnvBOVR++4cFzKtA8kNtyjhN+1ywXQd0
         hlAZ/syxyON3pqZUielmqxClS+VStzUBDjY1LkYl6o3Uz927LEeaPg3+v22alRnWjqOk
         HzbFm/RDcS0wF/e8UAC2KCgB8opwl54RraTzuNFPauNHfrE6kKjcMv0ZQDXE9Wl/4Gb5
         I9lw==
X-Forwarded-Encrypted: i=1; AL+hErEVNfVPIKK1FDFtuaRtynlTCtwz9cnrqEoCzlHLW0rYvHXVzhyq+Np/ihonhvpOtn6evElcqNYnYtGn@lists.linux.dev
X-Gm-Message-State: APuU4Z++IsyUrunZHv/hvWad6LIt+a/o6ImP+eWlr3H/STyZlxqp5GQx
	ws6qaOu0gHCQeEcb0kgcgAasidL3ZLg81MGdjbcHPuyIj0KNfBmL6Cq7
X-Gm-Gg: AYBFou3Kxt278UNMbADrZQesugC3vv5WogO+8roUAqTECl2yB0GRIjZx+hLWjYQWarc
	zl9CnpegmnfGT3Ei0nu+SzZQJF1cWcIqCP0whMfSO4CkTdLCL9x2AzK9D76V0Gmti53CzNb3bMA
	tDVDGWR+eO8TySFkRklY9tbRrUrtbD6KLmKQWNi7apVTn8yFKneYXcKH95WzdGK50bFnNPCrvk4
	7KOdK0XcAe8iwSesdHWeC0mvAci2p2XzZLqQXiEx1u2AbVrgGOsCu2U8HR9OAd+DHj+MHNUIiox
	XWSbDD77Lb+To/YY0Ek3L11JnBc8L9x8GJsPIB1UGSzAsJTSjxZB+MOqpeQZsYF71IgtJFSP4Jf
	OZxDWlyW69YgT08gqtWCvi07fh0RK3VMQPd7MJTVuoycV1He2CQblzUWbJns41BkDOrm8izHOY3
	GQ//HZzi9nfCB4PyqT9D0XzzfikAGPL/nTKcuq9FgYdApZSYeQj+Wb+GWJqnCOUg3vYUAMkGZ3H
	ZB5iBiawHVixUM0AyfxKt9ft9qEDdz+dOANgxrJfZQkNzQ5ImQoNetpL/DWxGp9mdwKO9bmAOMC
	DvXv6LD/W7N9Iw4+aDZe/bsqICqIQZYllJ38sfFxTGcz+rXBpQ==
X-Received: by 2002:a05:6a00:369a:b0:882:2b16:c314 with SMTP id d2e1a72fcca58-8beb7d18ac8mr8266410b3a.52.1794777008100;
        Sun, 15 Nov 2026 13:10:08 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6e7f5sm2892615b3a.25.2026.11.15.13.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:10:07 -0800 (PST)
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
Subject: [PATCH 1/3] fuse: reject embedded NULs in readdir entry names
Date: Mon, 16 Nov 2026 06:09:48 +0900
Message-ID: <20261115210952.2140036-2-graypanda.inzag@gmail.com>
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

parse_dirfile() and parse_dirplusfile() reject '/' in dirent->name, but
do not check for embedded NUL bytes.

Unlike plain getdents() buffers covered by verify_dirent_name() in
fs/readdir.c, FUSE READDIRPLUS passes dirent->namelen directly to
QSTR_INIT() in fuse_direntplus_link() and instantiates or aliases live
dentries via d_splice_alias(). A dirent name containing an embedded NUL
produces a dentry whose d_name.len extends past the NUL terminator,
which allows callers such as inotify to copy uninitialized kernel slab
memory past the NUL byte to userspace.

Reject dirent names containing NUL alongside '/' in the FUSE readdir
parsers.

Fixes: 0b05b18381ee ("fuse: implement NFS-like readdirplus support")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 fs/fuse/readdir.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 1f6cf565477f..e8b47c2a9103 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -126,6 +126,12 @@ static bool fuse_emit(struct file *file, struct dir_context *ctx,
 			dirent->type | FILLDIR_FLAG_NOINTR);
 }
 
+static bool fuse_invalid_dirent_name(const struct fuse_dirent *dirent)
+{
+	return memchr(dirent->name, '/', dirent->namelen) ||
+	       memchr(dirent->name, '\0', dirent->namelen);
+}
+
 static int parse_dirfile(char *buf, size_t nbytes, struct file *file,
 			 struct dir_context *ctx)
 {
@@ -136,7 +142,7 @@ static int parse_dirfile(char *buf, size_t nbytes, struct file *file,
 			return -EIO;
 		if (reclen > nbytes)
 			break;
-		if (memchr(dirent->name, '/', dirent->namelen) != NULL)
+		if (fuse_invalid_dirent_name(dirent))
 			return -EIO;
 
 		if (!fuse_emit(file, ctx, dirent))
@@ -307,7 +313,7 @@ static int parse_dirplusfile(char *buf, size_t nbytes, struct file *file,
 			return -EIO;
 		if (reclen > nbytes)
 			break;
-		if (memchr(dirent->name, '/', dirent->namelen) != NULL)
+		if (fuse_invalid_dirent_name(dirent))
 			return -EIO;
 
 		if (!over) {
@@ -461,7 +467,7 @@ static enum fuse_parse_result fuse_parse_cache(struct fuse_file *ff,
 			return FOUND_ERR;
 		if (WARN_ON(reclen > nbytes))
 			return FOUND_ERR;
-		if (WARN_ON(memchr(dirent->name, '/', dirent->namelen) != NULL))
+		if (WARN_ON(fuse_invalid_dirent_name(dirent)))
 			return FOUND_ERR;
 
 		if (ff->readdir.pos == ctx->pos) {
-- 
2.43.0
