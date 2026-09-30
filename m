Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FFB4EC666
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 13:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773301; cv=pass; b=ktI951WACa3NBG4zw8/g2t2XgFfpWEGpAQ1ohF6PWr6lhl9Vc8yKF6IP0PjYeQWTCr54ae054RDQ9/9WMxvtOLmjKMQare1VTajeQ9loXlf3IyKHGDN71PbA9XjjnhZghJKq3THvxmUGc3+1/1TrCoatk6MRy+UWyffHknM4b1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773301; c=relaxed/simple;
	bh=rXhD9d5fVao5sI7KtDb02mbwZKbJQRUDL1y/fHhh3rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/CDGKpXBXhlRg7NUcWgo6Q4l+krY14u97SDuNLa3J8eQ0qb2pXR4m+FUgf+MSgEWQzngb0bbISonUhUiUxZCVX3pp8Wb+afPQ6kgFAFlc8iSwT2zwaUDyj62EjFJ5eDR3Rr+hsRIKpWEJXKtNab7Ar2/UtzaN+wB/PflDI49MA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZZR/xc5; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZZR/xc5"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8a8288165fbso51433137b3.0
        for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 06:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790773292; cv=none;
        d=google.com; s=arc-20260327;
        b=VDpEOG+CGHzvol6YvOxN7DviE6RvaxC/F5I9aSK+MkW0zUlDcVvIjGqjqv26sx9h5c
         bbBXtPJ3HyjpRJNyyPThKtE2h/aNZ2m7Lmvt+M4vgUHH7Mzo/yi3gluTiDNC3L4/6eaC
         tTZi6HQeqIf4IgZXOZHb6UYfM4hDBd/+r2Lxe1PEENob5ZRW0vZy/YWozRVNzBg2U1T9
         OHRXg04By8mgJxyO7vLW5Q3TqTlPfhFyPRhcHwm6iWtG0l6Dhiw4UxYRbH/ai/uV66nr
         w9Zh9tJTenYpS0RTKV6NluQeVA477XKak79z/ck3kf6q0R0ysWPpvWZwKCp0xh2w8szj
         sJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hEs0MrU+9UYEDaK1O0qQqAVkGiu5ndS/FUHo0S0MNoo=;
        fh=+4uZKzps4VG+lxArjeUciaqw8iyw52lH/7he5o8wbhM=;
        b=UTwy7ardJx80gkob9EqYVdvMuy3aOQiAoW7JCto6qsVQ8osfj1kplWwyEfKdlCvAUA
         zLqw8F3q3cQm1Z2Z3n2avNoUNsjCbAcSVuKHLmtOo1wAf/WEVOGsbmlhUMdqciUPembH
         P5a4U7f2fFbctWIaRJF6e+J4pZtVjEZcEblj4Ww5QJSa3Yf4+M32ryBsQDOWG6RNXLwh
         8JGcYBTLnwysSBPEUIa3gcqO9iUVDZT6WZmJb26FRIA9M3ha0+4GmHXy0UW2UcH0dHVK
         mrsdvAEgtmrfS4D0DCA3AImV676UTYgwXt1xSZ5r1CY1WOIAXM98Q8DPI1vt6SSIgBDX
         ODeA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790773292; x=1791378092; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hEs0MrU+9UYEDaK1O0qQqAVkGiu5ndS/FUHo0S0MNoo=;
        b=RZZR/xc5jPubBIsOXPDYmpS3i4iaG22gpe8jU4bXb1al00csX2hZxMXSxKa3ikYFdt
         WwJhB+MLNNWrRTssGpCnL/6pjyFt5d/jAcfAmSRBlciIvIOj9GNO0LANDo6JZ0NbbyTq
         EQ5RgihDw0gWYZ14VGWhMUmHELvZ9PP7eOsLwA4grhcU0HLyEfk+jUMXKsRlf7bEHW94
         3MIQrHO3g3UTlHMLUayyMkXhTHpl5t4Fz2BAuuQIuflb77nYt86edG7fDV9eSe65boAm
         60/Mk3LJjZZGRIWiBHPlhoIacNvUvTBNs20DE7mqJn1TnNGsGVbT1sOGwiqtVLeON/US
         22vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773292; x=1791378092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEs0MrU+9UYEDaK1O0qQqAVkGiu5ndS/FUHo0S0MNoo=;
        b=x5AHbGdMU2t5nHVJ23AqHOlkxUNewJh/yFCKvu2COJSCKx/fTO5Ho5fuJMX4gnC/vS
         IRKPiGBWLHUKA1dcbYrKzTbkMoY4KGX2r34AGVFTD6tEmGFJ5vka5AQ1nrTCSa2SFG3g
         HRoUFANe5W0V1XVtJkMhsaCXhPIrfKRrV5Cr7ZLeWwKOZQM3yPAbwKzSYG1irxc5yqiA
         c0C4gDUXCVTqE8XmoGeHToParGFyQcJJG6tsZzUUVT70VZRklQZ1aqV3rsSVJ4+ErVnD
         a/k+z2y1Jw4A9oSPxRBxpKTozAl+gbLkFxof1NyIuxHAQI3IawLbCMtGS0KpJVSpmVOe
         0knw==
X-Gm-Message-State: AFq9FYL2oCmUV6YZg2f16kTC69yUY3YYwaEYrzsUoDL4ae8sCHWa8nkX
	0OxwB1CAuLpztOZNjCsp4ULPA6KOaQCuIpxsSWiyu0EAiHC15w5z0lXIyNZf6LJAj3L0syPtxgX
	Usx3qX/HBRAKU8WLFffuJALAswSAcsms=
X-Gm-Gg: AYBFou0qJbC7dOYMbMRqDFkdxDjPn7RzyEjkEdmhruUTAuIGJpClqqmPsnXk6XQJ++Y
	dbJDVAXlRPoCEL1vez+QqwWULsk6yBw6Ar7bCyjq4G9o9CJBVnYCJLZIWprkB1D2CWZcLv1EkMF
	cyj+DZ4O/+slE+IhPpy9fmpQml4BkT8N/4DGmbut8Kzw5v35uVHcPELtBXvE7AWHDwzlSODrbZ9
	2mopPrCGWM0R0Sv6dyT3aZx6E1Oj5e5qJEzFyOGBjTKLehnQQ4jTxqq8LpWuzfyt00ojiGZADp4
	t08sP6ckJnL9wq7pWs+01VrmGDVwVbNB8Vs16NIkP4BmRgVypOkTeF3TaJO8mKswWe0zcvaL0is
	dhPym1lTTexhJkfjDEnFvZ/XBKyG3DRLdFChhXxBYxCc/vWpsVe/A
X-Received: by 2002:a05:690c:6610:b0:8a4:b228:26bb with SMTP id
 00721157ae682-8ac906e7b27mr4595127b3.8.1790773291529; Wed, 30 Sep 2026
 06:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6ab7dca9.80e1c6cc.1e8e5f.0046.GAE@google.com> <6ab8cfe8.dc2998a4.2261f5.0062.GAE@google.com>
In-Reply-To: <6ab8cfe8.dc2998a4.2261f5.0062.GAE@google.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 30 Sep 2026 14:01:15 +0100
X-Gm-Features: AclHuK8YO05yVKyNEjULn_BdKlGqv33H53JQVXMS1TyfeE6y-zBSpShkWdCLRKE
Message-ID: <CAJnrk1Y8+P5W-6ETYuVDb2xk=GkP5o0XoDyDtvEPw+sC3GA-fQ@mail.gmail.com>
Subject: Re: [syzbot] [fuse?] WARNING in fuse_iomap_writeback_range
To: syzbot <syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, miklos@szeredi.hu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 9:15=E2=80=AFAM syzbot
<syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com> wrote:
>
> syzbot has found a reproducer for the following issue on:
>
> HEAD commit:    fd179f8a05be Merge tag 'ata-7.3-rc5' of git://git.kernel.=
o..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=3D1349060558000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9d4242cb1c54c=
df7
> dashboard link: https://syzkaller.appspot.com/bug?extid=3De8200299b055697=
6e13c
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e25=
5-1~exp1~20260613092250.77), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1523f2c9580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1438531558000=
0
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/c4cebd01ff3c/dis=
k-fd179f8a.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/9fd8641fa35c/vmlinu=
x-fd179f8a.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/c6e8e6332600/b=
zImage-fd179f8a.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com
>
> ------------[ cut here ]------------
> !ff
> WARNING: fs/fuse/file.c:2043 at fuse_write_file_get fs/fuse/file.c:2043 [=
inline], CPU#0: syz-executor122/5774
> WARNING: fs/fuse/file.c:2043 at fuse_iomap_writeback_range+0x7c8/0x18f0 f=
s/fuse/file.c:2227, CPU#0: syz-executor122/5774
> Modules linked in:
> CPU: 0 UID: 0 PID: 5774 Comm: syz-executor122 Not tainted syzkaller #0 PR=
EEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 07/24/2026
> RIP: 0010:fuse_write_file_get fs/fuse/file.c:2043 [inline]
> RIP: 0010:fuse_iomap_writeback_range+0x7c8/0x18f0 fs/fuse/file.c:2227
> Code: fe 48 83 3b 00 74 5b e8 e6 f0 6c fe 4c 8b 3c 24 e9 08 0b 00 00 e8 d=
8 f0 6c fe eb 5c e8 d1 f0 6c fe 4c 89 f7 e8 39 63 8e 08 90 <0f> 0b 90 48 b8=
 00 00 00 00 00 fc ff df 48 8b 4c 24 58 80 3c 01 00
> RSP: 0018:ffffc90003e172b8 EFLAGS: 00010286
> RAX: 8000000000000000 RBX: ffff88806e4ea880 RCX: ffffffff9a9ec501
> RDX: 0000000000000001 RSI: 0000000000000004 RDI: 00000000ffffffff
> RBP: 0000000000001000 R08: ffff88806e4eae63 R09: 1ffff1100dc9d5cc
> R10: dffffc0000000000 R11: ffffed100dc9d5cd R12: ffff88806e4ead08
> R13: 0000000000001000 R14: ffff88806e4eae60 R15: ffff88806e4ead08
> FS:  00007f6a3f53e6c0(0000) GS:ffff888124cc8000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000020000000b000 CR3: 0000000078090000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  iomap_writeback_range fs/iomap/buffered-io.c:1896 [inline]
>  iomap_writeback_folio+0x1526/0x2490 fs/iomap/buffered-io.c:2022
>  fuse_launder_folio+0x17b/0x240 fs/fuse/file.c:2331
>  folio_launder mm/truncate.c:612 [inline]
>  folio_unmap_invalidate+0x4cd/0x830 mm/truncate.c:634
>  invalidate_inode_pages2_range+0x629/0xb30 mm/truncate.c:726
>  fuse_open+0x5a6/0x770 fs/fuse/file.c:297
>  do_dentry_open+0x816/0x1380 fs/open.c:996
>  vfs_open+0x3b/0x340 fs/open.c:1101
>  do_open fs/namei.c:4837 [inline]
>  path_openat+0x1443/0x1d60 fs/namei.c:5000
>  do_file_open+0x23e/0x4a0 fs/namei.c:5029
>  do_sys_openat2+0x115/0x200 fs/open.c:1417
>  do_sys_open fs/open.c:1423 [inline]
>  __do_sys_openat fs/open.c:1439 [inline]
>  __se_sys_openat fs/open.c:1434 [inline]
>  __x64_sys_openat+0x138/0x170 fs/open.c:1434
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f6a3f58fae9
> Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 d0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f6a3f53e1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
> RAX: ffffffffffffffda RBX: 00007f6a3f644b98 RCX: 00007f6a3f58fae9
> RDX: 0000000000000040 RSI: 000020000000c380 RDI: 00000000ffffff9c
> RBP: 00007f6a3f644b90 R08: 31203a6b63617473 R09: 31203a6b63617473
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f6a3f6117f4
> R13: 000020000000e3c0 R14: 00002000000062c0 R15: 00007ffe0b2d2af8
>  </TASK>
>
>
> ---
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 6d707f2b3bff..0ef46f6e0267 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -2351,6 +2351,9 @@ static int fuse_launder_folio(struct folio *folio)
                .wb_ctx =3D &data,
        };

+       if (fuse_is_bad(wpc.inode))
+               return -EIO;
+
        if (folio_clear_dirty_for_io(folio)) {
                err =3D iomap_writeback_folio(&wpc, folio);
                err =3D fuse_iomap_writeback_submit(&wpc, err);
