Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013479;
	b=JBeOoGLMWSojBrFqlA1NrfbP1Lh92a60OxeTiHW7x3OnyCVVMnxgEA5+XueFDMsE1fex
	 JxTPdc+3rJCbxe0OeZ2dlKh8urBhz8mC4SgFUTqNu40PSobBaNZTdq85EcprNQX8RNkW4
	 U+P5dOd9271f5NK0ouSjmW+zQQ1k5l9U6L+gsKGtng28U5ioy9sfXXv4Y2HYAHfxaMjm6
	 aCoKtXxRh2h7DTrcAc/+7BZJZeJ4K8TTiqbyPTRCUzKKTiivvUiWsgKFNKOqvwEV/wPQI
	 kAA/kgQYDvXtBNRd83WKFYN9jhbSoGBEH7TMsrKi8KMyLO6T+x7KF2pRwCTINnT/9ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013479;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=aQAkv1Ch1hBWt9F5oKlCKZa1WGD0uucsNqTVeJRSM+g=;
	b=AdDXqIZj8A+n7O1DdrXmEsohl9NqXW8d5k5tBicQob4c9G3L3EA6xCqUG8pJu8TT+tu+
	 Tcjn/rNCJLjm+7+RwCRVtfXFAJ/G9me0DX8n8Jx7YkfIJPHdwlLY0kyablAW/rJRiHSAT
	 tbxibajuaxrm/scZUMUuBcfw9pMPoit/2eJ4DMYdpd0ogfXTvRT8lgb1BhqCNRFUUpyQT
	 /3HyRczDHIqhD15umtGrIHTJQ+88vLlub3mY08Gjkg45s8LxacRTfRt4ijzL7n6VIW6BB
	 6zK1xU3/Ctl0n1NqD8dYAk9k8Xj/+OakKqIOtPZ/wWxLSMQgGmQtPwPxW3BG1P+sNmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B11606A326
	for <fuse-devel@lists.linux.dev>; Sat,  7 Nov 2026 01:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B11606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c734afb8deso1489268b6e.1
        for <fuse-devel@lists.linux.dev>; Fri, 06 Nov 2026 17:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013478; x=1794618278;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aQAkv1Ch1hBWt9F5oKlCKZa1WGD0uucsNqTVeJRSM+g=;
        b=VXY9Gma021jvNR17n35GCL6Up0fgIDhFPBFzAuMN7CKM8t+qxADYaQrWWfl/cQRRiX
         G/AFGBc9t67sZbDpETqKBGInzHSoHCM9MRyuxETkermW3ptQrd4QjjeBP2QiBRoOAMEJ
         ibhCks/kq6V51hvad3+ECYLmwhx0PtvxCZD5n0vSxXezovDdtAsx2Qr22U/SKYW1zKIa
         CzE9DqpC5ZEGrVJRfQ/t+VNqiKjv59Ix4szppnjDaxoDlFFvVlgJaC+BlznWfC/hgG71
         VUigsq5baAPt+N5NEYpWGMsUNFdWR1iyCVGpbLw2p7+nrJKFyjTH0J8hkb055Sr6Grwp
         9wxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMhWgbDxnWF7pmr5czeeZNZCd0sd9N6+PK7ol2F18BiMO7USGCjRUGB7z7w3M5lwj8ZhQCrsa1JW9w@lists.linux.dev
X-Gm-Message-State: APuU4Z8oVzzPPEAeC0VCRCJePS6Dm4yuJeE/5NX6u1TeT92GCb7iMxTh
	5bTkgygUf+Ntgmo7mv4XE9E9HuLxVSEOzMMLd3ZNv7PTusvAjJP1yQOErNp/vVKYklsS6sMWhl5
	x1Nq+1HN8b3IKaUbuAXmK4Q54zVNEPckCyd4EmAgLp3nHSfFdOy9Cakwwyhw=
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1987:b0:4f4:d7:b15b with SMTP id
 5614622812f47-567e0997171mr3468472b6e.4.1794013478283; Fri, 06 Nov 2026
 17:04:38 -0800 (PST)
Date: Fri, 06 Nov 2026 17:04:38 -0800
In-Reply-To: <6aec6433.0ce67c00.35143.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aee7926.45cab1c5.12a849.0002.GAE@google.com>
Subject: Re: [syzbot] [mm?] [fuse?] WARNING in shmem_initxattrs
From: syzbot <syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, 
	brauner@kernel.org, fuse-devel@lists.linux.dev, hughd@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mszeredi@redhat.com, 
	syzkaller-bugs@googlegroups.com, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    f66469d9905b Merge tag 'net-7.4-rc2' of git://git.kernel.o..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=110ad735580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=4324f771847cecb27c54
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13bb58d9580000

AI-generated root cause summary:
In mm/shmem.c:shmem_initxattrs(), the initial reservation of inode xattr space
(ispace) from sbinfo->free_ispace is gated by 'if (sbinfo->max_inodes)', and
subsequent per-xattr subtraction from ispace is also gated by 'if
(sbinfo->max_inodes)'. Because sbinfo->max_inodes is accessed locklessly and can
be concurrently modified to 0 during a remount (shmem_reconfigure() with
nr_inodes=0), ispace can be reserved when max_inodes is non-zero, but fail to be
decremented when max_inodes becomes 0. Consequently, after all security xattrs
are successfully allocated and added, ispace remains non-zero, tripping the
WARN_ON(ispace) assertion.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=4324f771847cecb27c54

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com

------------[ cut here ]------------
ispace
WARNING: mm/shmem.c:4499 at shmem_initxattrs+0x3f5/0x650 mm/shmem.c:4499, CPU#3: syz.3.20/6999
Modules linked in:
CPU: 3 UID: 0 PID: 6999 Comm: syz.3.20 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:shmem_initxattrs+0x3f5/0x650 mm/shmem.c:4499
Code: 03 80 3c 02 00 0f 85 5d 02 00 00 48 83 3b 00 0f 85 fd fc ff ff e8 eb 3b ae ff 4c 89 ee 31 ff e8 81 36 ae ff e8 dc 3b ae ff 90 <0f> 0b 90 e9 dd fe ff ff e8 ce 3b ae ff 4d 8d 7e 78 4c 89 ff e8 12
RSP: 0018:ffffc90004fa7bb0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888031a28818 RCX: 0000000000000000
RDX: ffff88803397a580 RSI: ffffffff82603cc4 RDI: 0000000000000007
RBP: ffff888037912b00 R08: 0000000000000000 R09: 0000000000000053
R10: ffff88805aa5a973 R11: 0000000000000000 R12: dffffc0000000000
R13: 0000000000000053 R14: ffff88805aa58000 R15: ffff888037912b30
FS:  00007fd3ae9026c0(0000) GS:ffff8880d4775000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcb0d7556c8 CR3: 000000001d7a3000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 security_inode_init_security+0x242/0x370 security/security.c:1384
 shmem_mknod+0x2ce/0x480 mm/shmem.c:4087
 shmem_mkdir+0x31/0x80 mm/shmem.c:4142
 vfs_mkdir+0x36d/0x8a0 fs/namei.c:5428
 filename_mkdirat+0x4c4/0x630 fs/namei.c:5461
 __do_sys_mkdirat fs/namei.c:5482 [inline]
 __se_sys_mkdirat fs/namei.c:5479 [inline]
 __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5479
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd3ad99fb19
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd3ae902028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007fd3adc26090 RCX: 00007fd3ad99fb19
RDX: 00000000000001ff RSI: 0000200000000800 RDI: ffffffffffffff9c
RBP: 00007fd3ada37b70 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fd3adc26128 R14: 00007fd3adc26090 R15: 00007ffcae78f808
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
