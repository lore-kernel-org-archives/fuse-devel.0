Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322980;
	b=EvDFCleNRqyuM3OneBOObRYHzI04tJgcBBp3OUcizc6ZKlCTXgXfHmv1hqJBKOH9KWyu
	 p3bNktjFtBrrqQeRhjbh0DyopP3IaFtW+fAIlpWj3UyuRI38Zi2H+GWEe9VBj6tECFeax
	 BjRutaeMb7yQUPKwf2PZJeu6hAkIqUG/vOoWdYnHh0NrLq4xHAvuFJ1oBoGByivNWUBNR
	 VRQd7yjXZrlyCK9NaX/RTCtFl76SXHn0s9QdyXHnjRKw/yumBYKChkmAqooPvvY1jrXP5
	 1CUNlVvS9BE3/A1dby92hKFYA05IQtgzQDtaPbCfnZWyjP0DjlGba10CnWrZJVSZiUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Q67Hxg+0MYife6GtZIdwoZarR9f9DxzBGDp5ujmu0vc=;
	b=VetSEVE6KdEios4NA1abdB6dzQWIAQuWisuhT1WQDjxPBMciMy56YHKRGM71hQ3fxsnu
	 Se2eRl1n1wIoeZiIC9mZLhWjCpen84YxKCzsV08GDaPwYY50cyMuZlT/4zafHBJR8RZ+S
	 JU+LFzGj1H83uJAUNoStTmtLlWj3tJ8b0OsJu1RbRH7zjTv7GTzEnn2JuWmgwbnyVmROw
	 YvFjjJ8CTIF7SRuUnJXDBUov0ZrqjLv3CcPaWkmERFxUfkCM03ovb8lUdQ8BbKZWWO5Ur
	 eR7Wa3/GIl7hhzOmb8Ttoq0UYOc/DQj8Z/ier4mvP3yUuzcd2PRps9+Deaag0VUtfyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EpGOtcdx;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD065606A31C
	for <fuse-devel@lists.linux.dev>; Tue, 10 Nov 2026 15:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD065606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EpGOtcdx
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e985106c0cso16106815ad.2
        for <fuse-devel@lists.linux.dev>; Tue, 10 Nov 2026 07:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794322979; x=1794927779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q67Hxg+0MYife6GtZIdwoZarR9f9DxzBGDp5ujmu0vc=;
        b=EpGOtcdxajmmJh3E/56U9giNqnlNlyxS2sF+tYZLCrPNDfkApFN7m3eCCD8EEZ7+Qj
         u+rImTUIJFNf9+p6HRAKADV6sISyZYAa7JbY+/V0PoI3y+754ypA18qsxfDfwwPQk95q
         NdOp2f/b7R8PprpHa+DkqCQ9a2tG0cNkR2b80wD3CNgQtKAdmhI0hGio0oDhcvxpJru1
         lCraF/yoDY50fltNCnITyw7dg5f18V7kWzWve45h8w25ljUqCNoaPvLyUwanOSz43bDU
         OW7hw0y0QCoTZM5FjoH0rCXkNlziES6GOvQYt9NmN/8ZqNvzUcXtLHUnaxzrdgMfvpS+
         uBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322979; x=1794927779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q67Hxg+0MYife6GtZIdwoZarR9f9DxzBGDp5ujmu0vc=;
        b=l4GGHvYp1XtPtejcn31UVvfrRHLC2XsCEDU4VZtvGywhKpbWtOqlxkbe7/wt378jXI
         qvm8Nm8y4MAtQqistxRXFKF4mdugUWIWBZaH1UA3yXEE9BkTyQi1BXlzwsPmnql5YC36
         AfxqExF67iokGIbvyrUvckPFHJhGTFJY6zlnBEGUR23TGKb31IpGtwMEbyUeYfb1ykYv
         zlFXJ+Ac1stfoUFbjjXXy0OEfN1OuUNXTcly4ByULuHjOug/n00OFo5Tw3QMrJ25JUx+
         ZFkKMfCxMzxvf0KZEJkwk1Ytgjqp17HgPCH1wiHjMq7Gv7pgh0HjatpFeXuq1l4/p5Mx
         etHg==
X-Gm-Message-State: APuU4Z9jP0Jp52vybXGgnEziXJj002Ue5uLWHpR5eDnCoZczVPFYZu0Y
	bm1sWP17BdVGsmyJwiiL2+vW5qTnW82HAPwMfL1EUuZpJlXcTGCcULlA
X-Gm-Gg: AYBFou1bv0P+rDBG5Oq0l+iyp/NQ0Zz/v4DZOu5gvpfQcGMPFxOChizHJe4EwfRXANP
	pCm3Dm1Wv6FvHW857vN6QMobca2UoMoqU1jsk25vGn4l5Eut5tgdNF1keQ7tOlOI4HFbvACcjjB
	SVjFANW/migaHFMgk8LHHwhGKO7robstr+FcH8460j9+kJAo/6AqgnSrwxbjczrG65PXdTyNZzr
	hvzjE/EDilWsUhi2FIdCKxCf1G4wvImkFNXSX+jFh9gvWx5pv4TnbQmjaB4uWYsSaHB1UDQl4Q3
	RJviJpQVmWO5SfZMzWkF3X8FklJUJElOcRVlPixyEEw6o2EqVaLVGUA1fkxhU+N6dDYVYfjYjGw
	CKZyZii0B2V9N5kFoP+6ZqGyMGWpiSlqYTVnFHXtNbgXA5C0cn8WtXdZ5vk3ufd6qeAFPl/fKKo
	z75/0QUiTr+bRtOSbUdOsoD6ZJqjJlkWzmQE1wPn6e6qhGenIz+Y1xRtGu0onaHHrgcFfCUzKUx
	/Xmo6eaNkbv3NKWL/Te1XEhbwX4gdnNUysRsnm91hqmpCNGj8epY1yYY/r+D0Y8CAkuHjc60Qf3
	5d9ALmoioVaQod6u6oeqSEg+kOiIu3at8s18w7rnRp9r1oBUA1pe
X-Received: by 2002:a17:903:2a87:b0:2e9:8202:509c with SMTP id d9443c01a7336-2edb8f92d42mr26427195ad.7.1794322979043;
        Tue, 10 Nov 2026 07:02:59 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9ba8esm10233085ad.44.2026.11.10.07.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:02:58 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Miklos Szeredi <mszeredi@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
Date: Wed, 11 Nov 2026 00:02:46 +0900
Message-ID: <20261110150250.71520-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidate expired dentries")
Cc: stable@vger.kernel.org
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
QEMU based test result
- booted with "fuse.inval_wq=5"

1) AS-IS (before fix)
[    0.011073] Kernel command line: rootwait root=/dev/vda console=tty1 console=ttyS0 nokaslr  fuse.inval_wq=5
[    0.011114] ------------[ cut here ]------------
[    0.011115] WARNING: kernel/workqueue.c:2704 at __queue_delayed_work+0x11a/0x140, CPU#0: swapper/0
[    0.011124] Modules linked in:
[    0.011128] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.4.0-rc1-00010-gab9787d7e66a #1 PREEMPT(undef) 
[    0.011130] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[    0.011131] RIP: 0010:__queue_delayed_work+0x11a/0x140
[    0.011133] Code: c4 08 48 89 df 5b e9 85 28 0a 00 90 0f 0b 90 4c 8b 42 08 48 8d 42 08 49 39 c0 0f 84 1c ff ff ff 90 0f 0b 90 e9 13 ff ff ff 90 <0f> 0b 90 e9 ec fe ff ff bff
[    0.011134] RSP: 0000:ffffffff82e03e00 EFLAGS: 00010003 ORIG_RAX: 0000000000000000
[    0.011135] RAX: 0000000000000000 RBX: 0000000000000040 RCX: 0000000000001388
[    0.011136] RDX: ffffffff83a3f320 RSI: 0000000000000000 RDI: 0000000000000040
[    0.011136] RBP: 0000000000000000 R08: 0000000000000082 R09: 0000000000000001
[    0.011136] R10: 000000000000000a R11: 000000000000000a R12: ffffffff82c09fd0
[    0.011137] R13: ffff88807ffcfb89 R14: 0000000000000000 R15: 0000000000001388
[    0.011140] FS:  0000000000000000(0000) GS:ffff8880fa26e000(0000) knlGS:0000000000000000
[    0.011141] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.011141] CR2: ffff888003a67000 CR3: 0000000002e30000 CR4: 00000000000000b0
[    0.011142] Call Trace:
[    0.011143]  <TASK>
[    0.011143]  queue_delayed_work_on+0x6a/0x80
[    0.011145]  inval_wq_set+0xc4/0xe0
[    0.011149]  parse_args+0x299/0x3c0
[    0.011151]  ? __pfx_unknown_bootoption+0x10/0x10
[    0.011154]  start_kernel+0x3b8/0x7c0
[    0.011156]  ? __pfx_unknown_bootoption+0x10/0x10
[    0.011157]  x86_64_start_reservations+0x24/0x30
[    0.011160]  x86_64_start_kernel+0xd1/0xe0
[    0.011162]  common_startup_64+0x13e/0x158
[    0.011165]  </TASK>
[    0.011166] ---[ end trace 0000000000000000 ]---
[    0.011173] ------------[ cut here ]------------

2) TO-BE (after fix)
- no error while booting, and also fuse_dentry_tree_work works well.

---
 fs/fuse/dir.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index da23ccd8685c..6965a77a871f 100644
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
@@ -224,6 +229,11 @@ void fuse_dentry_tree_init(void)
 		dentry_hash[i].tree = RB_ROOT;
 	}
 	INIT_DELAYED_WORK(&dentry_tree_work, fuse_dentry_tree_work);
+	inval_wq_ready = true;
+
+	if (inval_wq)
+		schedule_delayed_work(&dentry_tree_work,
+				      secs_to_jiffies(inval_wq));
 }
 
 void fuse_dentry_tree_cleanup(void)

base-commit: ab9787d7e66ac7e6e94fc975b37c5b56fff98ca9
-- 
2.53.0

