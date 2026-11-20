Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186816;
	b=PU5c6Y7mF4Px4q8se45A/oEDtAB68WnQVeptdiLOWw1MDxh89QQzcjM5GZsrSFn9ibsN
	 dqtobd89XG6g1KMMeoDQI0wo8iTuJMzBPZZ/7iKSbV2gtRIQxhg1yvEBY/6CZB3R0K/fY
	 1pgE3FxWgUbJ8wnXNoWgA8isJZVRKGAvJFnphjnsQzTr7R7T+l3sDmir4ygAlKVclEnZa
	 qkG7245BfN0z3aJNMecbJX9H/4i6Bc3SPXtivg36MBLcoSpBMxwFDBieU/pvDAlls07HA
	 yBAaCsqluIt+cupLAgQpcEcQoIZFIajsf9yY93m2/+ZqYei12dfZPplAEHx4VDLpeqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NBH8Vk7x49WT+m8mgSOTracB/qDaBoM1+u+x062nujE=;
	b=BxBrVN0Kb+42n/z0XAFXR+uj790F+G8p2js2f5HOGgkBu5fWkwpQ/57h6HmpJ3dZCEAr
	 NM7jrOj0kOgVgRwqANSf/NmmmFQmpQraYT2DftaqIXmpQTL+vxU0MsOlkogisGlsIoBeU
	 C8sknO6wQgWFnCLdpsye3qXq2LBxAkaSR2F+tqmsDfOuULtKl/xmW4gZMWT6Np0ttIMdM
	 dZe8/AUYw4pBFR2Y30s6ZeiOoFOKbw/K8tNlzPWMsFdZRIG3nUir3+qSK3WFM/ic2aJlJ
	 Ixe/k5X+NOw55R1ZfIyTWBlN7V0Ywe4nUbeVsWtlZxrT4WNvSN4nK0PtS4YEO7wB8kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xIHH2uyR;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E601160A6F41
	for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 15:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E601160A6F41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xIHH2uyR
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f0426a65e0so6408065ad.3
        for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 07:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186815; x=1795791615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBH8Vk7x49WT+m8mgSOTracB/qDaBoM1+u+x062nujE=;
        b=xIHH2uyR6IYFykZexkdJKu4P6idbWRhhzUi1HO+NNEZOyYLc6eqqRgIfCIhDc9NR9i
         NT8hx8adoasu3zZ8TEWf6ewaPMqrVdTcN/+0Y1mcJqL8j/uEt2PZmx3S/nBLmTjaRFjz
         /jiiF9x4QuX/y1IOGNOFw4h5YKu2Xm64yVG2JvHrwL19TsWkghmY6g6jd10aS+KZEeiP
         Q+2ByYtRbOB3iff5nZbhzbatCrNqCLnbshRxwhTi7wQdhllaKNmxmMfL/g5SIQx5Tcsn
         aAxXVP1NLfUY5Vaab7QnKoGFEaUmHasunUfC0UDj+hZYIQkLsicpQyWIQK1ZFu2Admcn
         QzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186815; x=1795791615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NBH8Vk7x49WT+m8mgSOTracB/qDaBoM1+u+x062nujE=;
        b=PYJiuPSTctZvIndOaHQ7IHnHbhsAbZjfqWbMV4ZHTpZ5rCClYehXFP78DSFEpCadKM
         I32SlDJP/eSKjz650ps5QNfUwrz1pwV6wKM/iDOzSAJdERdd62A+ALvC1MnKH5Ko1JyP
         ctkFD0xBvmT8Go6DZfaZWbsV+oKXHgCTQuXCNHrdME6g78uGBmHCMMtDhCdJn658qrXL
         epuHo9i6J/hZD/VpagOBKE4ZL4735hCyxD+xKVommQfkW7wHYRYlrPKuRnbLHQXKPz2A
         MHFU/d2G+YAp67kMEHH0PZpIDa+Xfgb99p5bZsWSgxUVMMIf+U8Vmxc5uuUiOwtMMa0X
         D4rQ==
X-Gm-Message-State: APuU4Z83qvFtIVaR8/ynH1OXjYgoFiSiASvQpymlQTqadLGqdPcv9OtU
	T0dKsVihYjN820WSIU3Ve6UtptiR3YK0I63CXlB5jFgExyg9xwo0rK6g
X-Gm-Gg: AZFdTZdm61lh4r5THVjwmgbNYzN1UpwpPZQl9BHgDNeO577Rd5SsGwy4zy2uYqe5juX
	kgjcyXRZwf0U1oIhfstjc0GjUmSLTAC89t5waY07567ha1xqArPzhakk0Ay8e6EF759mhf4XNCG
	fXy8OKhjuRa5gq4dmY0I4FD0T8Twa4bGOgY84ohJPyPMyEroQILOQSQhd/DcwOcAg0pvd4W1mBR
	qp96WhFXk82BRqch65QutlR3smFw2winI2SLkaY6koI3IVBqc60Sp6Ahjz0psIAI8/EsqK4UxVZ
	YJDO53ZFr0owrXSCEHTNZoGHU4x71z6tL+VWxDM213TgvhGcWsRIg3E1+bYDyJGAFZ+lm28heex
	9ta8tj+jR741xv1DlzyJ2zT8pHzn5PT2GUSVv7/wTtGA6mrmZ5eZk5LwmzWT3TCMzd0D62LE/hp
	w2J8iMxOqX57TiXq+m+9iIijaBQG8vS4F87kR/6zTO1hTOygr8BAp0l+Qa08LSwKQ1VTwN8QHw8
	U6mKanV1KWsE4qgAfJVy/9iJaOQ/YFxjHoZTS3bXCzd0g9+g72r1UNQeFyNhjwqGFYxofMyskQh
	vogc2tWq1Aeoan7gToQEQrOeG6ssk0HN2eRIqEyED+NOYbFizjOh
X-Received: by 2002:a17:902:ea01:b0:2ed:1b26:2bf5 with SMTP id d9443c01a7336-2f03f21e92cmr31475695ad.44.1795186815085;
        Fri, 20 Nov 2026 07:00:15 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm15213005ad.59.2026.11.20.07.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:14 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Miklos Szeredi <mszeredi@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
Date: Sat, 21 Nov 2026 00:00:05 +0900
Message-ID: <20261120150008.1144420-2-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120150008.1144420-1-ekffu200098@gmail.com>
References: <20261120150008.1144420-1-ekffu200098@gmail.com>
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

inval_wq_set() schedules dentry_tree_work when inval_wq is enabled.

But inval_wq_set() can be called at boot or module load before
fuse_dentry_tree_init() initializes the work, so __queue_delayed_work()
warns and the work never starts.

So defer scheduling the work until fuse_dentry_tree_init() sets it up.
Also hold kernel_param_lock() in fuse_dentry_tree_init(), because a
sysfs write can call inval_wq_set() at the same time.

Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidate expired dentries")
Cc: stable@vger.kernel.org
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 fs/fuse/dir.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index da23ccd8685c..0d5d04df477b 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -39,6 +39,7 @@ static struct delayed_work dentry_tree_work;
 /* Minimum invalidation work queue frequency */
 #define FUSE_DENTRY_INVAL_FREQ_MIN 5
 
+static bool inval_wq_ready;
 unsigned __read_mostly inval_wq;
 static int inval_wq_set(const char *val, const struct kernel_param *kp)
 {
@@ -62,6 +63,10 @@ static int inval_wq_set(const char *val, const struct kernel_param *kp)
 
 	*((unsigned int *)kp->arg) = num;
 
+	/* Defer the work until fuse_dentry_tree_init() sets it up. */
+	if (!inval_wq_ready)
+		return 0;
+
 	if (num && !old)
 		schedule_delayed_work(&dentry_tree_work,
 				      secs_to_jiffies(num));
@@ -224,6 +229,14 @@ void fuse_dentry_tree_init(void)
 		dentry_hash[i].tree = RB_ROOT;
 	}
 	INIT_DELAYED_WORK(&dentry_tree_work, fuse_dentry_tree_work);
+
+	kernel_param_lock(THIS_MODULE);
+	inval_wq_ready = true;
+
+	if (inval_wq)
+		schedule_delayed_work(&dentry_tree_work,
+				      secs_to_jiffies(inval_wq));
+	kernel_param_unlock(THIS_MODULE);
 }
 
 void fuse_dentry_tree_cleanup(void)
-- 
2.53.0

