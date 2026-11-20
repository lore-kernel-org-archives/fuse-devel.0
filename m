Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201524;
	b=u2Mpa3xebCKGpSFWQezrHY5qV3mGZDhjvM3bhJnYSZAoxy4BOpbhFUXbwREF1/gGZWKB
	 ZkreLKBqbKtDOHfoM3h5QrwC7KzXOTg0RNWNf6XOxZ1QbEqndelCrItAQZs7NN53A6zlb
	 RD6+QJS/1pbl9XvfiHogesDkn4qx3xUIacztHh3Y/BC4NrMcUo0p77Sq5oKfl04IZ1BWO
	 h5MoBBbIhf728b7jdfSwA6K5kqZEhF7pg7QBNlQUjh/ViOvfmwW9T+r2QvsxFTdw6FeRg
	 JJPHpW+0StWzmA4qpmHHBXZ+G9MsJnq/fbZeG0/+Qb0yo86bVRL/DTY4h72FYI1Likg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dmRM+ScOoWXbhr1Te5AYJtCIswexzjiYk6BBSvYAv84=;
	b=icAnDC2PVIZXa1fl7jD7CdczVrcVJ3aidJ1mjU5JJAZ7XhXYJV1pH9VZSFUPusEwAww4
	 dD3FxsW6XVPWEIyGLJcQ57/kML+fQqitGMERPbyM1rIUsx2FVA8F6Jjaj/YygrMl2LCFv
	 tij/lvDyz3IZu8IFk3pVVAqgETZ1lDJiN//Zv0ls4ttFpBRE7KYemZI6TJIRlEVvZWYl6
	 bYfAHXrxRZv+sLuBV6QFFBYpl29uQIXZfPA9oTTUbnz6zOhVJhJ2XXwKKodudtPn2cvQb
	 3gmeTW2Ci3Qq3OrYGKE3sP48JbLYkuE0gjHIm7zbPzoMqXtXpAtdexW5TdRke0XKchA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=TFnsPzSa;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=W4EYCvbo;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6695360A2633
	for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 19:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6695360A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=TFnsPzSa;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=W4EYCvbo
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKIunaG2977530
	for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 14:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=dmRM+ScOoWXbhr1Te5AYJtCIsw
	exzjiYk6BBSvYAv84=; b=TFnsPzSaoKNnWyM5dGyuUsE4MhzUWxJ52qlcfJWZGE
	eB3x8vZXTAalWcJo03l2Cw4LBhj4ZWWZow/cIhwbAglrsDb+wQgr5u/Z2OQLidv7
	HAjh60fIxU2/RjMKXPulCR5sLz8kfD84dGpn1ccYjiVamSHxrUEpGvhCFmP4+nrj
	1BxAB3ztQ2mwmLwW9zr5Uz4ozWBugNru+PV1JT/qk7lI1FUOmdc7RwHrTSE7AzkK
	RhDtGciHDHHC6+uZpSa3QrRGgn+GZ92gry7cByD22cj+/21OMSDyTmkwwkmgQzcI
	GfS1LhmKhg5fiNMJkv/BjHFYdotvXGKJlaUfsFURTrfg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j2r0aak8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 14:05:20 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-54af6c38092so17322891cf.0
        for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 11:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795201520; x=1795806320; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dmRM+ScOoWXbhr1Te5AYJtCIswexzjiYk6BBSvYAv84=;
        b=W4EYCvboUKOf1IqhoqrLxIUOncbXkAxERiMYD2HhVfA+KvQk1Jj0v1okuLv1AZvCnN
         GAUymFpCcicQHeWsJlHcR0XNSdFYo6rnBWYDyK2DZKlo//38bDcEubOx7NPChd68nJkA
         QnoFnXnqd4chcJChrxKej0aiGDgwjX143wdECl+nWlU7vQcugeqQg+J4imp95a9iQsCd
         631e1XNMCrD3JUu+XTAfphp///YISDhXdUXxgFCFvkDORXLzRVe8yAXtfP2/ApudPGMt
         GkOlLRHy6uxm6Cu4AzTdmyoXYSLUcQbF+chG8T6f6usrgotdUQBPzkA0irfpAYgL8rVu
         Ya9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201520; x=1795806320;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dmRM+ScOoWXbhr1Te5AYJtCIswexzjiYk6BBSvYAv84=;
        b=A3iGmnPUths2+f1Bv37riYg4dXCAeUwIv20rpxxySS9MN8gqEn2VYWDEUni4kRBSZe
         rv1ibO9NHtFZyo7lEVI4aNgaZ103awz3Ld8+rySg2lpbtHnVrG9+lpEpbWPBBplHyFUW
         +hWbsZx/w1nuMdY1jqZ5lkXiB/p53eUqwDiyzn41WUHi0US3hAQBNl5aQRgSUR4oZkFq
         VMzhgIQVkUcV8TaSjBtsN+DJWH6OV8+0th2LdnmJfnhn04NYHHr4pOv2TesXcZopRv61
         GV7p0xVYEx4HmZ8eX99mUSWarq9oIJPTrsJyLS1V32vtlHqGNW2ynzpOjtSl5ds1Ke/4
         6sqg==
X-Gm-Message-State: APuU4Z+B/+TdFrrumK2shLSQy8f+4dnnqTTkm6tn6dL4ZMkVdYkiHqdC
	qI06/pQSxbOZMeHMdB6Ig1b8qmqm2jOFj/ij/+WzEFQ08XZLGO2Ktnjrjr1ZbhtOjwALpV9fSTY
	VPMWZN+FOmJtIsV+GbhEW4hjBCFqKrivbA/Y6zbgA+fd9BpZWIoKDHPd9AZDkW6EIib4=
X-Gm-Gg: AYBFou3nyMUM+7TI5wCjo4UYq77/mSneCfWquBzH10TaMfQU2K16Mxbo5WgHjivzF6n
	JynRRgJKcQkJWieLCLgIBLK3rOFxzvJO8e9PPGIqFO2USzzPvGEdHM4gBPJWk8aXTBevUQyJ5S9
	+dkts6vs+LRK83S6uoLjoK0ra48oGdp3zHOOSAWoiOsOxA08T4FwJUgB1n8LA13x0d7ZooOQBC3
	w5AtLJp0CbyTdEA6n+SzSjBpiQvzLOcBTbGI9xQIY3mxP1kL0k96O3+F/FlYuflHQNli418duDG
	yWQa1hfv02McfJ6m+gMGf2PDyFjTOFKyYFGtUljq4RytfxwRWFX87IsPYDRk8kknybZSC26KyUP
	vC4szFy2Mo7w1T0F35njwAnJhj2hI06Ui7nHhajU9I2zM8+qLnRiWa5Hg1AvLOIWIw0FRRm+bXS
	8G6lrxOf9m7DC3d4TPFQSP
X-Received: by 2002:a05:622a:1f10:b0:536:7085:1a7d with SMTP id d75a77b69052e-55d76a26c74mr74907371cf.46.1795201520265;
        Fri, 20 Nov 2026 11:05:20 -0800 (PST)
X-Received: by 2002:a05:622a:1f10:b0:536:7085:1a7d with SMTP id d75a77b69052e-55d76a26c74mr74906671cf.46.1795201519661;
        Fri, 20 Nov 2026 11:05:19 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-178-217.net.columbia.edu. [128.59.178.217])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d784517casm30094221cf.3.2026.11.20.11.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:05:19 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 20 Nov 2026 14:05:12 -0500
Subject: [PATCH] fuse: pin user pages in fuse_copy_fill()
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-fuse-copy-fill-pin-v1-1-72a0d888f140@columbia.edu>
X-B4-Tracking: v=1; b=H4sIAOeZAGsC/yXMQQqDMBBA0avIrDugiaj1KsVFTCc6RWLIaKmId
 zfV5Vv8v4NQZBJosx0ifVl49gnFIwM7Gj8Q8jsZVK6q/Kk0ulUI7Rw2dDxNGNhjbXqjy0rppna
 QwhDJ8e+avrrbsvYfssv/BMdxAnsgr012AAAA
X-Change-ID: 20260923-fuse-copy-fill-pin-7aba3462387f
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795201518; l=3555;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=8MAoP8I3TJ0diiU2Kf38wEwABs1NB1ma2Qc4baL/Cr8=;
 b=VH8iBatJ1OH1FtOXzrl7p1TFOv3zRFjAjFV3+ZDbrjHTaHHADoPdy3a8PDAp8fa9qr+ZHVrZ3
 ncgktSBDn6eAWau1B2xRUmgiy4wuduAGPAKMBynF9bfVaP9yRZux2/9
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: -wDRQMBLB0Zu7QlUp3D1vcCGIrTzhRdh
X-Authority-Analysis: v=2.4 cv=ft9J914f c=1 sm=1 tr=0 ts=6b0099f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=lnglQuR7XRqnmjDHco/WZg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=Qy8Uw3nBPuy8PBFntK4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NiBTYWx0ZWRfX/ixslUqnHq1a
 04N2jO2Qj+piGzx56aniy61xDwA6RWWdMyim07fXYQ9o2iv1Rz/MQGI9I2UHovidYYYBnPuzmJ4
 PHS4XwDB6VHbe0TikLNJhQ6dxjkSUCc7TFoWFNLr5D85M4kQJZYK
X-Proofpoint-ORIG-GUID: -wDRQMBLB0Zu7QlUp3D1vcCGIrTzhRdh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NiBTYWx0ZWRfXyeZ9oeK8AwzY
 /MpW3AUKICSWPbHCc/DK2k6XbOChBx8kY5NMw5V9a5ODzYjxDbppIF1hVll1r4xpicq7Ax33U9c
 XqOt9pbcoGQGYMVCFxkBKwpwftJVDDmhn/mjwFr1WjMAAzSYo26bj0lyGkQbF0ScYHMIB1NDeGP
 grMQtuITwbrRSRg3kTayJLkwa3sl5BlbqVIkBIQeTpNChM3wWXeP90JRXO3dIfyHQbZvEMzP15T
 GJV6K13y0ag4lu975wsVDpuhgaLyfJLguKDTMqYrpPYsH3fCx1wORIIRvc0XmRvAcb3lGmMe3CW
 /rqSpd4JakuoKlcCyk3q5lGr2tBDYu8oEyDpS68yCJYqvbefHBH+u8U6LBhkVlS5HiQ/sFo9vdD
 6lIPPfwQhkRs1GaIAvDi1ay4dx6rWZbjJjCsY+V8e7LJieHfJin4Q9AkIh3Lj/M7T7CzlmA7427
 YXpDjFN6ejv1GteRy6Q==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11972
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=10 impostorscore=10 bulkscore=10
 clxscore=1015 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200076

fuse_copy_fill() gets the userspace buffer with iov_iter_get_pages2(),
which takes a reference on the page rather than pinning it. When the
server reads a request, fuse then writes into that page through a kernel
mapping and marks it dirty, which is what FOLL_PIN is for.

As the page is not pinned, fork() does not copy it early for the child.
If one thread of the server forks while another is reading a request,
and the parent then writes to that page, the parent gets a fresh copy
while fuse writes the request into the original, which now belongs to
the child. The read succeeds, but the server does not see that part of
the request.

Use iov_iter_extract_pages() instead, which pins the pages of
user-backed iterators and takes no reference on the pages of other
iterators. Release a pinned page with unpin_user_pages_dirty_lock().

This also removes a user of iov_iter_get_pages2() and a use of the
deprecated set_page_dirty_lock().

Using an under-development deterministic VMM, a reproducer stages the
fork race by preempting the thread that reads the request between
iov_iter_get_pages2() and the copy, a window only a few instructions
wide, while another thread forks. Without this change the server sees
stale data in the request every time, and with it the request is intact.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/fuse/dev.c        | 15 +++++++++------
 fs/fuse/fuse_dev_i.h |  2 ++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index ec2306c63d0d..5800f9290320 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1000,7 +1000,7 @@ void fuse_copy_init(struct fuse_copy_state *cs, bool write,
 	cs->iter = iter;
 }
 
-/* Unmap and put previous page of userspace buffer */
+/* Unmap and release previous page of userspace buffer */
 void fuse_copy_finish(struct fuse_copy_state *cs)
 {
 	if (cs->currbuf) {
@@ -1010,11 +1010,10 @@ void fuse_copy_finish(struct fuse_copy_state *cs)
 			buf->len = PAGE_SIZE - cs->len;
 		cs->currbuf = NULL;
 	} else if (cs->pg) {
-		if (cs->write) {
+		if (cs->write)
 			flush_dcache_page(cs->pg);
-			set_page_dirty_lock(cs->pg);
-		}
-		put_page(cs->pg);
+		if (cs->pinned)
+			unpin_user_pages_dirty_lock(&cs->pg, 1, cs->write);
 	}
 	cs->pg = NULL;
 }
@@ -1068,8 +1067,11 @@ static int fuse_copy_fill(struct fuse_copy_state *cs)
 			cs->nr_segs++;
 		}
 	} else {
+		struct page **pages = &page;
 		size_t off;
-		err = iov_iter_get_pages2(cs->iter, &page, PAGE_SIZE, 1, &off);
+
+		err = iov_iter_extract_pages(cs->iter, &pages, PAGE_SIZE, 1, 0,
+					     &off);
 		if (err < 0)
 			return err;
 		if (!err)
@@ -1077,6 +1079,7 @@ static int fuse_copy_fill(struct fuse_copy_state *cs)
 		cs->len = err;
 		cs->offset = off;
 		cs->pg = page;
+		cs->pinned = iov_iter_extract_will_pin(cs->iter);
 	}
 
 	return lock_request(cs->req);
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 0c078bdc270c..20304a92d391 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -331,6 +331,8 @@ struct fuse_copy_state {
 	bool write:1;
 	bool move_folios:1;
 	bool is_uring:1;
+	/* set when pg was pinned by iov_iter_extract_pages() */
+	bool pinned:1;
 	/* set when the payload is zero-copied. folios are filled in place */
 	bool skip_folio_copy:1;
 	struct {

---
base-commit: 7f7b822d09c5590defcc61a37ffbd5a3533ed518
change-id: 20260923-fuse-copy-fill-pin-7aba3462387f

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

