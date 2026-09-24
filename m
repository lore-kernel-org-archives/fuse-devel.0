Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683224CDA3B
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 23:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293358; cv=none; b=BzUXn3W1ElTEGk3Y4HzOdrWk02wJ2CUUX7HK3JhbIwriR6N22kxMPLiWL4WRHu1kRCW3Oy65jUKUc/DGvHK2SEjOKfiNgLr8HBtdtAxOIC0TUXPYc6R/BBsNcSJ0M9dnpqhW3Vi2kxUs8mFPfW9CsJljk0fIQHiJawwymkn+QkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293358; c=relaxed/simple;
	bh=DIJDE30a8cvtr07gDXvMJB9bUPKp79v/NuH7d9A/dis=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MvBjS5wjEGie85WfL+0pWOH8mCjYKpsOgWcmoUH/Hc8Ypqw+WwTfGNlMkO4p3lTt6SYLc9UCQ0jUj3KOqIIRHG3buoxQYt1m0jdqdQWp14SXaHW/tVW7pHD1WWCWa4NI4hIcqYysAhVowIR0kCOgX+12+id85ouvJ/TFnktZqFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Z+CPS9DJ; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=IU6T30/n; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Z+CPS9DJ";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="IU6T30/n"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMYABZ2471233
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 19:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=S2aMP6JXuEYmwKBs6aotCGlCcE
	1R79aNZlWiI1iQooY=; b=Z+CPS9DJ6t4XqcMWXQavFMdXAq00ptPym5mBotzFr5
	ClWtt9pDJ6ZqoKJNoneEbu6d4A0VR7wwERwuRDhX2Jul59+aEoB3DvGSD6THkDg3
	uOSzJBv4FyxCMVfqKAr6ne7/saqMpj45gOTkEhU/cXt7hR0rErSI+cyT4JH6ojod
	hyfoRSQoI0RMOclflwmYpCGflu7MDdYRcAIIBOopaPL8hqp2uKJm/MDlqt2KcYfD
	L9ZJcmuPLMDllJ0YYAClMkv0Vf0V5mtzgJPLRoZ+B0Mc0cGdmTMl8qdBbdNxkkCI
	P26j5IpKnzxe87o5V8d/Fd4xM0o+bR6eQ2TsYSCrT1Ww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gwb86191g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 19:42:30 -0400 (EDT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dc7337e2a7so2415125ad.0
        for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 16:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790293350; x=1790898150; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S2aMP6JXuEYmwKBs6aotCGlCcE1R79aNZlWiI1iQooY=;
        b=IU6T30/n04iyfWXSWRb2Buw3pA7dGT0JjrizBwn2226D7/YnVgTMFPjJc7TPL8hPry
         u0i+1VX3skpSLB6gCwPNmY6wR8zySUhyC9RtrynwXMECpgukcEag47oQOpn9Vx6pAH7a
         MPiNyfsIPNpq79DtZjrvE0hEZUIpD9GzxBJw8ZY9QqC00VgyFrsEmskdYL26PtJKPSr4
         21D37owrkCdiWTDCCoKq3i8BOY/SsKOQMX92x0jcA0OIeiwFSUEr+YagCwmt/oLHhpDM
         cbZGrOdkECzmVCKU95Uyyd7PAnhnmmzyg+nZwlYGOKFPhoLzxrVZgjNiskO3qpSxBHVx
         4BIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293350; x=1790898150;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S2aMP6JXuEYmwKBs6aotCGlCcE1R79aNZlWiI1iQooY=;
        b=hwe8ewuYn+BAMvanOzNY9fN0n97cGU4MCQqOYi+8yBXQPEfdMNG7KCO6LRb/8RU16P
         7D3EsuGQOp2gjBdyd0XYPE4p0rDoWJTTmzkZDFRGnFHBjdnDcM+GvvVKNq79A5oWPJSp
         GyI0ZmdqJvw+edigBhSHIl1m95WqKbV1d98tomdh4ScOlpALqMTP+V2b86j2ZPvG6bPw
         cx/c8yfIy0td6aksi+dB7PG6NnCxJJdsqiqG/5hODNcvF+ZmSCBIKjA/lwlxgyqlcBEg
         p9WspytF6MrFxGOjd46djUxOwDzLvFeURyV/TfRxdzRuddO1oKgAhEEcWjCYkeb5ZR94
         NjBw==
X-Forwarded-Encrypted: i=1; AKwUvBzfbyLEUpVDA/6K/L+Xn2mFvL5ZT2I1w3qsvG1GHS0TOWy8IuWSWpYGCg5gPHRRW3lYUNX1tQv65aZF@lists.linux.dev
X-Gm-Message-State: AFuF++k1hrry+TA3x2Sfja+9MW0YdQbHA7Q5U7P7MBjL6FmCv7EMeHhb
	d0w2QjuQ/UzPUNEUiOCCRQmAwENeaWgLrtslH8ocl0L3H6JcFJW+XZrTzcWMLlHTAsZkPrbj49A
	R4KBL6XMzbq5vOka+gd4zisnNwq9W0wCr4KOFIZ2B2uzWpaXTpLzmhqWL9Y8=
X-Gm-Gg: AYBFou3kVlvxFc/BGvq6CkeQU8F36D+/jY+4+28c/ab9l/+lkF5cOWSaUmOXoWKSFRA
	VcrTt21bsSBnrCUvunEJnWXhaSwXyuwncX8lbkrE2k8yH50nlkSlW5F1jFcXRBzu4ywaC221Oj9
	2DSfZBRTqfdlasrSWap/LECYQN3Vh1a6Fbf+TctKp/Rvfwqc6oSC+ozSUkfCS/TWcQb6+uhYnI8
	0MNpwP6ZcW8hViFA0mLB7yqVNThZyXLvK1gBFLKnyj7pSICL8SWwloEZ4WiI8uujR23cXl8RY2m
	yIq89GMe6GehOcBKvVT1glz93CNxKHZOKIj3YrUS8vlfgvpOK4PanShwwwXmhR+iWGRAyHCJEQI
	xYr4GEaa9LR6e8oxd7xM=
X-Received: by 2002:a17:902:c40c:b0:2dd:ad74:ac2a with SMTP id d9443c01a7336-2df7e43d08bmr34857285ad.28.1790293349951;
        Thu, 24 Sep 2026 16:42:29 -0700 (PDT)
X-Received: by 2002:a17:902:c40c:b0:2dd:ad74:ac2a with SMTP id d9443c01a7336-2df7e43d08bmr34857105ad.28.1790293349221;
        Thu, 24 Sep 2026 16:42:29 -0700 (PDT)
Received: from [127.0.1.1] ([208.115.110.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fc2e5fsm2239605ad.5.2026.09.24.16.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:42:28 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] fuse: convert the readdir cache to use folios
Date: Thu, 24 Sep 2026 19:42:15 -0400
Message-Id: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFe1tWoC/yXMQQ6CQAxG4auQrm1SQVG8inExMP9ojWFMK4aEc
 HdHXX6L9xZymMLpVC1keKtrHgu2m4qGWxivYI3FVEvdSictp8nBhhCjGqf80MwiXUDThMNxv6M
 SPg1J59/0fPnbp/6O4fU90bp+ABjOt4Z2AAAA
X-Change-ID: 20260906-fuse-readdir-folio-009ae33a7854
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790293339; l=649;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=DIJDE30a8cvtr07gDXvMJB9bUPKp79v/NuH7d9A/dis=;
 b=oenOQPanKL+RULof0OkLFyq7KYQ0MOS/NyPcktGNUwnKYadAxyzi1KhtN6SiuSLZfVYIlMPy8
 zEVuM50L7udBTImD8QwxMkoGJC+FKGMx1tCSV/ZNqYdoAi2CLXpc7cH
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5NiBTYWx0ZWRfX5rVRNatURjsg
 De9xLdvPizZsgSazCnIxT7xJG0BzEzK3NEcyz8q1MJ2IaODXdLvtuF3MmFpOkfVs4WViqqwXVOz
 bUTJwt1HlWM4tB8d2eq/cRNp1r+FGs7pfVs8sAF1rBGGUeOgQOEV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5NiBTYWx0ZWRfX6Q32ucjcheHS
 Lm2tSwq/mgJs+E/5SWRgWiMeb7gbAOh1cuplUkNlNYYTIW/+KvySVS9DWsYg11vdVjIyahUCAxn
 OvkAECvdt+CvwmKYVudVEJl/ZeQDxGHgwv/OBZXEFjWu5Fp7MdhfUzJ+FYuUuK+5eQbKowlsAW6
 2C6VrumSafpGh/OJkIrd5Y90syzkztl3TcAk7OW1VAbO3iMzlQG1a2vxAUEU8+wbRPJd277/rCN
 D8Kmzi6Yg/3HzJJXxn/QQUXzfHW/r9h+zHlwLWT111PxO7Yc1RQjDKa+rG8MAY7Wus5U1r6Ep48
 2s+DvKitPkYcUGVvqBaEGFbadHC7derKWU09TVc895oR7TxRkh51OKUd5emnKganXuNjJajkwQJ
 f3xVAYfhIbV7wEAaG1LIY5jm1rOadFQ9GibMYl6Eeu+TMebqvYM4yA2VT+a7VEigSr0ZAlsiqBW
 4dX7KOBjmD6I2cXiJOg==
X-Authority-Analysis: v=2.4 cv=F6rC5ahN c=1 sm=1 tr=0 ts=6ab5b566 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=AP5Yue2pfywxtTblp62eJQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=R27Tia9Tc3MXFFTUv6cA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Tvuh4vPG31qOPh2MLDjFENiUHOl9Moh4
X-Proofpoint-GUID: Tvuh4vPG31qOPh2MLDjFENiUHOl9Moh4
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11915
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=10 adultscore=0
 priorityscore=1501 impostorscore=10 clxscore=1011 suspectscore=0 bulkscore=10
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240096

Convert the readdir cache lookups in fs/fuse/readdir.c to folios. This
removes the last caller of find_get_page_flags() and one of the last
callers of find_lock_page().

Based on fuse/for-next.

---
Tal Zussman (2):
      fuse: convert fuse_add_dirent_to_cache() to use folios
      fuse: convert fuse_readdir_cached() to use folios

 fs/fuse/readdir.c | 70 ++++++++++++++++++++++++++++---------------------------
 1 file changed, 36 insertions(+), 34 deletions(-)
---
base-commit: 10bd6b32965265688fa277d166ab224de8e86eb2
change-id: 20260906-fuse-readdir-folio-009ae33a7854

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

