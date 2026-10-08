Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74733C3F70
	for <fuse-devel@lists.linux.dev>; Thu,  8 Oct 2026 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440954; cv=none; b=OoPcUsljKHlV/jGekcVNjep5zTenXvxfBXrs2BhCYTvQrKPjGrMSgQwJpaJlV12e9RySoia7VtE1LGE/1gVmDe/1NAHsvrxuwZF0cDNx9LzI/J3gaa6+EaKGTDYEmER3222eCNbN7qt/218Ywi9Kd6vlwM/0uiSExPJ/f/ehE6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440954; c=relaxed/simple;
	bh=Jvpan4dWi71lxbGY7TiGmaQM4y+M5f9WlxOyl/ZFFzo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=YwAJE+kQ2Tk5ryU/31P8fIi96pL7MhaPoRZ7Dqzmsw79SyQXjcV6utT08BMfnZ7aLvK43Ce1DcFehV0Z7X7bDM6hIxoWsB9DBhNgr3DzyEbd6OlUkkDUBnA3wm5mq+pDLpxletYZ12kPnX70zz1SXbPR9aQAzEIHcbw2tcLM0JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qRLvjvZy; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qRLvjvZy"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso2687513a91.1
        for <fuse-devel@lists.linux.dev>; Wed, 07 Oct 2026 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791440951; x=1792045751; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ErIg12kw9nT+LPeqjyXQhVml7IYT+IyJFoWMvc7q7ZQ=;
        b=qRLvjvZyvoC/AGa/7eeYzPNqRe79FcvGEaZKcqCXUYc0lZs1CWTeTNA2r0T6AEk5rU
         BdSg0HvvtuByGr35YxktvRehO/8KasBG9u8INb8QvBT/otaYW9azaZjvgA0xCEGlx+5x
         lexVxBOdOY7hiw4Hv3myqukC/NAn91x/sl39bN4VA0Sn/T8bOsdmSL+XFNTayjpI6aV3
         mKFt6aciXVejdWo8km+QPfhhuwskzj/iOgOfgBaTTnCpHAxb/Qwh9nfZzdo2dRR6kYKl
         L1tfCPGATA3ntz56qHF4sNKxJynpnF0pKIt3VT9qPaZFTxWAi4N2Ah5z3K/ahHnPR4Tt
         akjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440951; x=1792045751;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ErIg12kw9nT+LPeqjyXQhVml7IYT+IyJFoWMvc7q7ZQ=;
        b=RIU/KzqDZ8BO1FtIMsnZ16Gx3sGUdWwDVTXV+WgbWBJnv58KiHhGVrTFd9MK6cgkRb
         KYeXQm/weVnUYfeComSnT9R6/ds7C1I95fApKoby8MHLHsQ+nb4es8zfiAIKVGMJyL7j
         mUL7xCq0bV8P/T5BAZQXC2G1fZbso6JSfpZggA+4u1QptTTRqADyMJ5/FWUQCLDTcbaM
         3O8uA12uqJliovbKp9QDMVzRr3IDkpJQwuSSpQBY6Rf05XCQVFiNl0MJiOUfCMxprOOi
         cAoXPl/kZFnxVh9wDTxE/Bb2fPNGAaFMmpxKov93G1qBRLcaG36+sJg16Q/k9RUP3JAa
         hx9Q==
X-Gm-Message-State: AFq9FYKGOYH6xp8sII3HIwkdQkaHrU2+IosNWT5Pi5JyI1OpNl/rFPzS
	k1GiRxxlpbSTJHNwN1DVwe+NkkWyiyAhfXyz6opIrlXQ8GpMGwQD0mUY
X-Gm-Gg: AYBFou1+mOnRcQC/FW6X2bp0Nf4QDbnMEWSP5gsYIyntbxDyqdhQK23wfGIMFma4crm
	LmlsqESFcul+T4E3jbBd+cvngpxXzdR7iahDOh4KNDUxW1YfZBdPRvAy4pAYxU99JjNkmaItGxi
	+ppsZ1qwQDPaE6wa44ajc+Iv0jOf7z2MiQduEJRHZrslCIYCBb3oDS6deRJJ76BooFYpmoSx0i5
	LQjAbHw+vMNyykBMwMBEeWui73y1QkxU0dcJBNY5z52xnbP59iftYBAKy3EQ6sGXWsyv75pKPDP
	vvGmu2+w6f6+SspYTu0lNjJ3or7KA6d3FuE5ly/6LY3/VoJKiCtMz3SLlnaKSG/PMdbCCewT10/
	eoJGaNhpfCVZ6toN2NPANz95iZUU40oYYf+EztuePLoZFVZje+HH/6BpEoXoCT/3Iia6BQIhsiM
	npahP860LJOMD0fc+vAaOoTWgteiIBxP9JqOa94D5OgJiNShKR31EXZ/soraQ9jBNCDA==
X-Received: by 2002:a17:90b:3b48:b0:3a4:97ea:f0d8 with SMTP id 98e67ed59e1d1-3a8a1187f01mr4513444a91.51.1791440950814;
        Wed, 07 Oct 2026 23:29:10 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5f778fasm3546331a91.3.2026.10.07.23.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:29:10 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] fuse: serialize processing table installation with I/O
Date: Thu,  8 Oct 2026 14:29:05 +0800
Message-Id: <pm-fuse-full-objects-candidate-0002-v2-17d6013e5066de33396c@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The processing table of a /dev/fuse endpoint must be initialized before
I/O can use it. fuse_dev_open() leaves pq.processing NULL, and
fuse_dev_install_with_pq() publishes fud->chan before assigning the
table. fuse_get_dev() accepts the published channel without taking
fch->lock, so the installer's channel lock does not protect the reader.

On SMP, a daemon can issue FUSE_DEV_IOC_CLONE and read concurrently on
the same fresh endpoint. If the source channel has a reply-requiring
request pending and the read copies it successfully, the following
order is possible:

  Clone ioctl                         Daemon read
  -----------                         -----------
  fuse_dev_install_with_pq()
    lock fch->lock
    publish fud->chan
                                      fuse_get_dev() sees fud->chan
                                      fuse_dev_do_read()
                                        dequeue request under fiq->lock
                                        lock fpq->lock
                                        add request to fpq->io
                                        unlock fpq->lock
                                        copy request to userspace
                                        lock fpq->lock
                                        list_move_tail() to
                                          fpq->processing[hash]
    set fud->pq.processing

The list operation accesses a NULL-derived list head and can fault
before the installer stores the table.

Take fud->pq.lock before publishing the channel and hold it until
installation finishes. The reader then waits at its existing queue
lock until the table is initialized. This follows the fch->lock then
fpq->lock order already used by abort, resend and device release, and
preserves the handling of unsuccessful installation.

KASAN report as below:

    Oops: general protection fault, probably for non-canonical address 0xdffffc0000000039: 0000 [#1] SMP KASAN NOPTI
    KASAN: null-ptr-deref in range [0x00000000000001c8-0x00000000000001cf]
    CPU: 1 UID: 0 PID: 500 Comm: fuse-clone-race Not tainted 7.2.0-rc5-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    RIP: 0010:fuse_dev_do_read+0x1693/0x2480
    Code: c1 ea 03 80 3c 02 00 0f 85 b9 0b 00 00 4d 89 27 e8 42 07 2c ff 4c 8d 7b 08 48 b8 00 00 00 00 00 fc ff df 4c 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 7f 0a 00 00 4c 8b 63 08 48 89 da 4c 89 ef 4c 89
    RSP: 0018:ffff888118ecfab0 EFLAGS: 00010216
    RAX: dffffc0000000000 RBX: 00000000000001c0 RCX: ffffffff8258e60e
    RDX: 0000000000000039 RSI: 0000000000000000 RDI: ffff8881066f9768
    RBP: ffff888112b6d7a8 R08: 0000000000000001 R09: 0000000000000001
    R10: ffffffff893dbc57 R11: ffff888108fbd700 R12: ffff8881066f9760
    R13: ffff888112b6d7a0 R14: 0000000000000050 R15: 00000000000001c8
    FS:  00007feb22c636c0(0000) GS:ffff8881fd82c000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 00007feb22c62f38 CR3: 0000000107252004 CR4: 0000000000770ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_fuse_dev_do_read+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? pmbd_probe_hit_cookie+0xee/0x1c0
     ? __pfx_pmbd_probe_hit_cookie+0x10/0x10
     fuse_dev_read+0x19d/0x250
     ? __pfx_fuse_dev_read+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? security_file_permission+0x26/0x80
     vfs_read+0x7d2/0xc20
     ? __pfx_vfs_read+0x10/0x10
     ksys_read+0x111/0x200
     ? __pfx_ksys_read+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? restore_fpregs_from_fpstate+0x55/0x100
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7feb23d039ee
    Code: 08 0f 85 f5 4b ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00 00 00 48 83 ec 08
    RSP: 002b:00007feb22c62df8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
    RAX: ffffffffffffffda RBX: 00007feb22c636c0 RCX: 00007feb23d039ee
    RDX: 0000000000010000 RSI: 000055615dac9114 RDI: 0000000000000005
    RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000246 R12: 000055615dac9114
    R13: 000055615dac9070 R14: ffffffff00000000 R15: 0000000000000001
     </TASK>
    Modules linked in:
    ---[ end trace 0000000000000000 ]---
    RIP: 0010:fuse_dev_do_read+0x1693/0x2480
    Code: c1 ea 03 80 3c 02 00 0f 85 b9 0b 00 00 4d 89 27 e8 42 07 2c ff 4c 8d 7b 08 48 b8 00 00 00 00 00 fc ff df 4c 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 7f 0a 00 00 4c 8b 63 08 48 89 da 4c 89 ef 4c 89
    RSP: 0018:ffff888118ecfab0 EFLAGS: 00010216
    RAX: dffffc0000000000 RBX: 00000000000001c0 RCX: ffffffff8258e60e
    RDX: 0000000000000039 RSI: 0000000000000000 RDI: ffff8881066f9768
    RBP: ffff888112b6d7a8 R08: 0000000000000001 R09: 0000000000000001
    R10: ffffffff893dbc57 R11: ffff888108fbd700 R12: ffff8881066f9760
    R13: ffff888112b6d7a0 R14: 0000000000000050 R15: 00000000000001c8
    FS:  00007feb22c636c0(0000) GS:ffff8881fd82c000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 00007feb22c62f38 CR3: 0000000107252004 CR4: 0000000000770ef0
    PKRU: 55555554
    Kernel panic - not syncing: Fatal exception
    Kernel Offset: disabled
    Rebooting in 1 seconds..

Fixes: 48649c0603bd ("fuse: alloc pqueue before installing fch in fuse_dev")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 4fec31fc0b845008ae037472065284e8f8dea87e..106daf2d10b34886fa5cda3c641121a08181adb4 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -466,6 +466,8 @@ static bool fuse_dev_install_with_pq(struct fuse_dev *fud, struct fuse_chan *fch
 	struct fuse_chan *old_fch;
 
 	guard(spinlock)(&fch->lock);
+	/* Serialize processing table setup with I/O. */
+	guard(spinlock)(&fud->pq.lock);
 	/*
 	 * Pairs with:
 	 *  - xchg() in fuse_dev_release()
