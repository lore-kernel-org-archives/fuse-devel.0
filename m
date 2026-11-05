Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877044;
	b=pEZIPYjwrmrFTOvj7OGTHx3sQD+YG3gRqYWKZQJ5Ux8loCWZ3BhGpTt9xwmLeskKU6Dk
	 bg9gxfdioaFjKvrhRVW8YjOsZnoypRT+QNL72KL0reLh/7Ej6v3M1vCtT2fhBzsnzZHek
	 KMdnxDZrBPkwB2YL5lBLfIKIUxdg/cxXih2sGhHWCVzCnsglLFUsDI0jqTWogcFSV2ydy
	 XG7/MSCTW+aF9Sc8zw94KT77iBxPMXabmV7pyvtURQJtNKoAT6Aorh23rO6290vH1+oSS
	 mRztmT/mOsG+3BG15HWgBkTcju9ilhhuDDO5WbqT2KKTpxGk1R9IZUfUz4kTLqDh+2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877044;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=+L1oAYLc4izPsxQ3ZlEqD/dH2fKKby+GXjbBwuzoShs=;
	b=kvnkefvJkiBLQQ57afIjvnFSK103IR5TvVpVTuBpCVYbiwPKsGqhl4L8VpO4QuBY3dUr
	 1KgI8koF/D8HNj1k4iQdEZ7sVQvTA8fejFw4KFL4Nm7XFiTT94k3hjDmO9qc2ULNlgJ0f
	 f8JzuYH2vcWiwqJNn0d6RAv9ZC+7BRwHUslcJvZT2jThy1QcTbJcNeGVrJGnqx631JVKM
	 dh/eIgrXGhyZRXzCyYGxYP2d7YZspwsK/38ZVkDy3I6kd1S+VfouVRkrcIswTvy6oweTl
	 zL9wS1ezsKqlr22kwaeCGEJnCQWoW7oqSBjQup9R0MnvGx7dJSlj8VAXvMQbjnBGJGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF1B606A328
	for <fuse-devel@lists.linux.dev>; Thu,  5 Nov 2026 11:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF1B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a45b3f0bdfso2684971b6e.1
        for <fuse-devel@lists.linux.dev>; Thu, 05 Nov 2026 03:10:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877043; x=1794481843;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+L1oAYLc4izPsxQ3ZlEqD/dH2fKKby+GXjbBwuzoShs=;
        b=pLnl9DWATnrA4NlLuFdRMp63lEhRHEUUV7DpOTuGP4Ms9ghbm4jdbFQKu7lp24lLQJ
         6WxZQtzld6W8PPk9aIBQPwKcANVmD3gdxUmd2huuzEvqp4IZibWdrHGoWmsOFUlnyqhL
         blUVZkpAxHS5aKNRBDc6GMIAp52TcGCap1+XZGVuwZli0GrN5m31z8DXLEekWaOwRwI+
         CUXtkWf365enZrNldeHHBjuD9sE7W1cwNGPquqqikNP/gF3G+cKMUjtk4C8N7mK1RMRC
         qXye2MZ+ekTh8kX88LUG2hF8IgDjkMQBHUG49QB/GzMDtYASeBIElhPciggtUl6ALR+4
         F7iA==
X-Forwarded-Encrypted: i=1; AKwUvBzwi06yh35mLxZTK4M4a+GZB8Gwnsnf8Wbm6AJ/dIzsLs9iku9KpwlO7ZcWlsD3GM+NbRvpPX46A84o@lists.linux.dev
X-Gm-Message-State: APuU4Z+IVdwRbmEv+Jn5weGPZW5oCl16Obmh7yGBaL8j3v6YoNHHZbGy
	VqWaNA+3iiZZpFJgGKdTh8KjP3Kf1Jwc5xTUzK0/IpwoXRvpBKODF4FHbAKpO471jv2+pBINL3n
	VV89EhvhqX6Xs5ZgHMRygw4ehXwd/CxBYzss0abG01Zb4hHmrwjZOSTcqQB8=
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:148c:b0:4b9:e65b:8c36 with SMTP id
 5614622812f47-5640dddd764mr13267830b6e.36.1793877043177; Thu, 05 Nov 2026
 03:10:43 -0800 (PST)
Date: Thu, 05 Nov 2026 03:10:43 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aec6433.0ce67c00.35143.0001.GAE@google.com>
Subject: [syzbot] [mm?] [fuse?] WARNING in shmem_initxattrs
From: syzbot <syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, 
	fuse-devel@lists.linux.dev, hughd@google.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    05441d697f7f Merge tag 'cocci-7.4-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17bcaca1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=4324f771847cecb27c54
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14423cbe580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-05441d69.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0edd3964be19/vmlinux-05441d69.xz
kernel image: https://storage.googleapis.com/syzbot-assets/84d6d8dd5648/bzImage-05441d69.xz

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
WARNING: mm/shmem.c:4451 at shmem_initxattrs+0x3f5/0x650 mm/shmem.c:4451, CPU#3: syz.1.18954/2882
Modules linked in:
CPU: 3 UID: 0 PID: 2882 Comm: syz.1.18954 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:shmem_initxattrs+0x3f5/0x650 mm/shmem.c:4451
Code: 03 80 3c 02 00 0f 85 5d 02 00 00 48 83 3b 00 0f 85 fd fc ff ff e8 6b 3b ae ff 4c 89 ee 31 ff e8 01 36 ae ff e8 5c 3b ae ff 90 <0f> 0b 90 e9 dd fe ff ff e8 4e 3b ae ff 4d 8d 7e 78 4c 89 ff e8 52
RSP: 0018:ffffc90007eefbb0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888032b8d818 RCX: 0000000000000000
RDX: ffff888030c3cb00 RSI: ffffffff82602984 RDI: 0000000000000007
RBP: ffff888023be9000 R08: 0000000000000000 R09: 0000000000000053
R10: ffff888037378973 R11: 0000000000000000 R12: dffffc0000000000
R13: 0000000000000053 R14: ffff888054123400 R15: ffff888023be9030
FS:  00007f7a3de3d6c0(0000) GS:ffff8880d477c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7a3ddfaff8 CR3: 000000004e80f000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 security_inode_init_security+0x242/0x370 security/security.c:1384
 shmem_mknod+0x2ce/0x480 mm/shmem.c:4039
 shmem_mkdir+0x31/0x80 mm/shmem.c:4094
 vfs_mkdir+0x36d/0x8a0 fs/namei.c:5428
 filename_mkdirat+0x4c4/0x630 fs/namei.c:5461
 __do_sys_mkdirat fs/namei.c:5482 [inline]
 __se_sys_mkdirat fs/namei.c:5479 [inline]
 __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5479
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7a3cf9fb19
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7a3de3d028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f7a3d226270 RCX: 00007f7a3cf9fb19
RDX: 00000000000001ff RSI: 0000200000000800 RDI: ffffffffffffff9c
RBP: 00007f7a3d037b70 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7a3d226308 R14: 00007f7a3d226270 R15: 00007ffe3809a618
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
