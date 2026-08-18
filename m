Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC69047CA83
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 16:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787069725; cv=none; b=gq7SeEJZn9TRygZCVdvlPFReZffBPjW01Dkq92wF5IDGAyZaXd8eEXUP9Gw1j6NLZHz58hDLIIZs8mu8x87uSvnCpiOQ59GUXCXULT1pLUV3WeEplzWxelSWp3Ck39p5NB7MnQAYAS//znaDJnhauO1WPlDGBJ/NLHtzWbFrrVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787069725; c=relaxed/simple;
	bh=lqkjQx0GBNMG/dbeORl0o1WejkKeSDQDF8BXi5ToavI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YzrvJM26e9jJ1SPj7CbggWnTqeqVbGzJYmkBacvpsv9fuwTWLucuNN7FqAtG/Z15e9ZWQkXF8gINJF0RLxjp59ZUs/3Gqrqxeci0RMI0jY0Mkq+9IeDWo9xwp0RJEXEEctWLNIU9/syG7/WG2vmDPxhCxhzjPI8DF1X/Xz7rE6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xx5g2HEX; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xx5g2HEX"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f84023916so4575577f8f.3
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 09:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787069722; x=1787674522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=734qIppHPdtYriCq/CbaL7dXPKVISQF4t6KKfHcwQ+I=;
        b=Xx5g2HEX8ilVVgtpQAoSmu4zkH66l5s9h0lbgINfUnDIxY9orQbifM6q7lLrdcQ4DM
         QW7nZCs2WvD0apNWFIQnChWembhRRtuIwCxdn80tLeE3W2NnJNesK0d6GNNXA6y/et63
         cwocM2Yoz/5I70q0p1CqGbYrwPKfItTKKbIyDiQK78xi3Vuu1Rszk68gxJd2+6h4iVgP
         UuoZoMQUo8rvy+wxSI5zuDuLOwNUN4CDxdXmkepGmxqweAQO7MwVKyewL3VvJ2rdNoGb
         zpE2MhVMb+TIqo3PJ+QpkEivvvLKuOq0NGHltTYPPmJZsvvDYAQvOURH6CXvIl74inAC
         3xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787069722; x=1787674522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=734qIppHPdtYriCq/CbaL7dXPKVISQF4t6KKfHcwQ+I=;
        b=KfP5j0oNTeFx9HUhUStNh0H2oA+H0nVoC+wHnVukKANbTmOxPn/8Q8hyvDvzG2Upej
         Sm5xTaPEGu8LDC7fchSKWP96fhS6va3Ft6sDMdzC4hOOv+EjEd+KqofLI9geVYB0y0K5
         X5UwK7hqPEeaND3zCC1gEqnC8CHe5iYrHj7hE1THubu4dU1HZjTanV9hcLPNuOK4L9Qv
         iwRTACRvQLJiMow+L4OnvtZQQGiQEGwwVYZPbtwB1ZGmnYXTvHqZTDMtCflNb0Udvvo8
         B1qXCZQCbvj/R7DdFEkLvVaTozYOzuwlq404QSXjlo90L/kh1YA+yov2Rg+R4hmPUjYB
         KTcw==
X-Gm-Message-State: AOJu0YzynDFGaF/krUB6MZbKig4XB1V+El+rfzVS4bGuJHal/81n5Uwp
	GMEOCNQ04P57Jdu8GSYl7QJVjUL9zhUkKAoi9h+Y3KnCzdn1NVYJuYDQEuHepvxi
X-Gm-Gg: AR+sD11QmjT20OR1N4rglRJuJ3C3RoNB0lY+Uxy0nRxibOrqUwO/64fW+qNSBVNoJMp
	OOObr9DGdE+4HR1H4G33kjt8en3Z6vfvNBx3rH/Y1ZRXUBRcynol6N+ZDeY1faUqca5NxHz5rPH
	uWXFvwWJmnRxHQRVBIN8SEZulaQSWogFGNp7zpP8giL1J5SPHSefvj5/3E6jxOOI7/REumDFNOn
	mTQF36OOtf4gLs70XuTf9nYVjXqsbAssaSjhYXZuN1cDEYtSai0zXmeqlIrHu6jFELo6b/n9mp6
	H8kC98KHFTDrgw+RLMe/4bBC2laGL5Swqd2SO+gUKPkDW+GWYYtYAl7tYe93ECSkIAd4hFFHHLs
	Hhb+zmmEzE4Obp7BFxFLeiIcuF9lZAYwNFc2YhhFIesuSRwL3YXAYTwANHvql33SKdtPzjNCNuK
	hPQUrkmSJCNccrxebIgGBkKCHGVs7ngUP0X8rGllRTcasfWXhG9za+wIMnljp/MQl6QggcTgSWi
	7AicWlTJ4OLO2z2N7E=
X-Received: by 2002:a05:6000:29cf:b0:482:9a18:d753 with SMTP id ffacd0b85a97d-482a905a817mr12231980f8f.5.1787069721877;
        Tue, 18 Aug 2026 09:15:21 -0700 (PDT)
Received: from zephyr ([77.237.184.107])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482a5b7cd38sm14060378f8f.32.2026.08.18.09.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 09:15:20 -0700 (PDT)
From: Ali Nasrollahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
To: fuse-devel@lists.linux.dev
Cc: miklos@szeredi.hu,
	linux-kernel@vger.kernel.org,
	Ali Nasrollahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH v2] fuse: ioctl: remove unnecessary comparison in fuse_setup_measure_verity()
Date: Tue, 18 Aug 2026 19:44:48 +0330
Message-ID: <20260818161448.51495-1-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang reports a warning in fuse_setup_measure_verity() when comparing
the __u16 digest_size with SIZE_MAX minus the size of struct
fsverity_digest:

	warning: result of comparison of constant 18446744073709551611 with
	expression of type '__u16' (aka 'unsigned short') is always false
	[-Wtautological-constant-out-of-range-compare]

This was first observed while building an x86_64 kernel with Clang and
W=1. Since -Werror was enabled in my build, the warning caused the build
to fail.

The same warning can also be reproduced with the same build options
using tinyconfig with FUSE enabled, so this is not specific to the
kernel configuration used in the original build.

The comparison is between the 16-bit digest_size and a size_t-sized
constant. Since this comparison cannot be true, remove it.

Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>

---
Changes in v2:
- Remove the comparison instead of casting digest_size.
---
 fs/fuse/ioctl.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/fuse/ioctl.c b/fs/fuse/ioctl.c
index 3614ea603913..dc3a188f5d72 100644
--- a/fs/fuse/ioctl.c
+++ b/fs/fuse/ioctl.c
@@ -130,9 +130,6 @@ static int fuse_setup_measure_verity(unsigned long arg, struct iovec *iov)
 	if (copy_from_user(&digest_size, &uarg->digest_size, sizeof(digest_size)))
 		return -EFAULT;
 
-	if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
-		return -EINVAL;
-
 	iov->iov_len = sizeof(struct fsverity_digest) + digest_size;
 
 	return 0;
-- 
2.55.0

