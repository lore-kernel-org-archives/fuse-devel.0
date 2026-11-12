Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460934;
	b=a1bZ//unFFoK/YwCHn6ljtSSnd91dvS1sr7SlH9cOjVhMzvGTgD4m+6gwkmVx4FwobhA
	 Fc25VLym8Y2g5AmXic781NhwHr3U8KE/TbEqjFdGq+Xv+iRsb49L8fSrkyFgoi3GwfGWD
	 FaxyAUzHY173on9zZp3tcAF8kADzEmJbbeVa63z8wqkeL4CC9r1TFjj+FF+JJcbsibM/I
	 cf25WNYAb1QlOve10LppIPj0l2iXjNNCK1yJSR5vP8qbOrlKTFktUbF7cBB/fe4SwPzTQ
	 BUdpJ0+IQ0MFwPpzApEcSr3ZrBh2hTlBSnsRqfiyKtYYGoCpETvPwGwx/YKieb2RHYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YIZv27tuCpRFyRmf/qdRg8hV9PDLwYKkb+ennGTxSNE=;
	b=RBoNoqYpSVm9TZDKTQIgz0boI1O7KZO1pyTsqU54uZEjhjDLA1K/Ea0ywVFr0W3GRUlW
	 HFFcIUkjh+bTO8cEuMFhHPw5caq0FXgW+Akcd4RY1LW4a913dBymHRN1mn08NpgyolZOj
	 DPoue+Qglrhku21fgAJa63IDTrST+ZoUHfQBt52olpQVwxuIXid6h8cjQz+nM56fRMlye
	 nxIHkArOoo+jHmFtRk4IW2dx5dTeDLiN8EP8ixpQoWI8kc6NuJM6drrPOU45UuFoHsnQJ
	 VqAax1KhN3NCAwJX2cgED8INwx+IG8Q5ed4cudEfF8s+c9ME3lj8NsoDHFWHb3riZXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgR6gdTy;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E587606A323
	for <fuse-devel@lists.linux.dev>; Thu, 12 Nov 2026 05:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E587606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgR6gdTy
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f079a63b8so388514385a.3
        for <fuse-devel@lists.linux.dev>; Wed, 11 Nov 2026 21:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460933; x=1795065733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YIZv27tuCpRFyRmf/qdRg8hV9PDLwYKkb+ennGTxSNE=;
        b=tgR6gdTyBZrXeIRZV91kL+EqLSFAvNK/cDAjzLAS70cp9nwoeBTKQzesAxHww2snNr
         Qq2t833ZIxcxDTNT7HoDuXHo9epftoiy9m0owsboNPFDhSZaQAYrsx3ISs0MBtOV6fbc
         0X/YQnhhrUOlM5DPzyWYpzumyaUHFw/LW2VsgHUGb8Bd0Q6dIVjjheM4fDNwhaqQ0u4S
         oUKHtGJHhbU9UqpBfQSpIE4ajl0SdrKR+dYZrh1VK/tP+/dBB0Z4Z3a1+Lnm5CqEaIo7
         NvI9QxtWZ3dErOHgCU9Qg9gR65OtGTDJ+dCOwwtso7Wh+5uiunaFHAxhS04ncxthREGw
         X+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460933; x=1795065733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIZv27tuCpRFyRmf/qdRg8hV9PDLwYKkb+ennGTxSNE=;
        b=ojWKcz/OslURUt5196k8FrIz4TfHUbwC81fG86/aCs6zNjpPgPN/xqo5+510YZ2GIF
         ruE0urWOd/MpLoOuBa/JESB/yY/PcSObPlQS8PWYd6bbgvgshkxSZVNUTrBCJmAVHgmt
         AHkzW0vvPGcymQEjUcxWQrFEFNXXbr3KkuFl8QZ3nqdFobt5QulUPqb+mRV6tCThHYAf
         rFOoUMQQC8RfCClJA6CHIi3H834fwwc1hcfbJlK5AOboNR2Rh2XWicz1m8ylT8Z3PzLo
         E05awNkTZ59RZYf85t+KaqfFHJnSyiWvz1uiOQBf7mV9tmPHaecgYZX6PSBxW2N+LDQf
         Ar4Q==
X-Forwarded-Encrypted: i=1; AL+hErHlwbLMWPxyLtANftO3btiYQIW2OI7SD1iWbi1E+0qOsVdEEF/rS5dydF01YMEiKMTGPQm3jG6jj5EA@lists.linux.dev
X-Gm-Message-State: APuU4Z/XkRlHC/LeBA6hZw4DkHlslUIHBeW5C1aMVzllHzUQbZiWhl0s
	75IzG+3Iq21DZ6wvpdAjGYECB8amlEpTy2B1EApXnOmXtdMw3rcKOZJK
X-Gm-Gg: AYBFou1+kwdoq4KO2gAvCJ6hOwqRo3j1zW3E1jKYJNKT9QEw8dHsAAUFJJmapDTUyvH
	E+mMS5klD5eapv1jFdQ200VYms9IE4lFwjyP02gzUcZltBmWSsuzvCCjmIauMVVKI4rrccCYHPl
	G1q4G70wA1lsMglo8ey91F9csUYLeKQ+F5Ro0jj0f0SQCmSrKkJEt+jM66pLc6yNuHP8OtwIDTQ
	E4dgG1PMJv6/dXT3pxM2XyCW0aEU+1ZPY6sSGIx9HDWgUe7Kk8j+FES2I0+c80pxBhyp44kjeQs
	7tlYjIlWNVq86tXzSkUQYrpnCF3PUdnhsc1LlJU8QTGN3SJ3NQNEG6c1DqRcoMo0lgOwvuMn7A3
	HDmMN4blu0Hc3Ys9XC3xh0FTaEXqK0Fn6WHOx1xuYieMETJb9dh5/LgdOL4GFPh4Qvbc0TkLR3i
	NZn5SDdxKtllZwnvyGYCZZD6ng/OxUzcPB7m3xg/o9PRs5tn38dwteuibAF/gd1VWCdVu2RMUe8
	cEp1WhOQVzQZd5kaRVf53H/RxD2tbpEoTrbh3nxRyyHGCcdK1AKv0Yf5JIehPpHT/NoGbDznI1M
	KoHUgXObDsmHm/kq0ud1uazaZr0CJM1rtxfrkrA1GqqoDKfHFeeN
X-Received: by 2002:a05:620a:4693:b0:93b:d7a3:45cf with SMTP id af79cd13be357-947affc2972mr765476985a.56.1794460932899;
        Wed, 11 Nov 2026 21:22:12 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f03ca6548sm37340956d6.9.2026.11.11.21.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:22:12 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Vivek Goyal <vgoyal@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	German Maglione <gmaglione@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	fuse-devel@lists.linux.dev,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] fuse: Don't use request timeouts on virtiofs
Date: Thu, 12 Nov 2026 00:21:50 -0500
Message-ID: <20261112052208.1248312-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
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

virtiofs cannot abort a request once it has been added to a virtqueue,
because the device owns its buffers until it returns them on the used
ring. This is why virtiofs sets no_control and no_force_umount; see
commit 15c8e72e88e0 ("fuse: allow skipping control interface and
forced unmount"), which says that "virtio-fs does not support aborting
requests which are being processed".

The request timeout added by commit 0f6439f61a6e ("fuse: add
kernel-enforced timeout option for requests") aborts them anyway. When
a request takes longer than the timeout, fuse_check_timeout() calls
fuse_chan_abort(), which moves the requests on each virtqueue's
fpq->processing list to its end list and ends them, so they are freed.
The device can then still write the reply into the freed request and
its pages, and virtio_fs_requests_done_work() later gets the freed
request back from virtqueue_get_buf().

The timeout is armed when the server sets FUSE_REQUEST_TIMEOUT in its
INIT reply, or when the fs.fuse.default_request_timeout or
fs.fuse.max_request_timeout sysctl is set, for example for other FUSE
mounts on the same system. A slow host is then enough to hit it.

Don't arm the request timeout, and don't offer FUSE_REQUEST_TIMEOUT, on
connections that set no_force_umount.

Fixes: 0f6439f61a6e ("fuse: add kernel-enforced timeout option for requests")
Cc: stable@vger.kernel.org
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
I used no_force_umount to tell these connections apart, since virtiofs
sets it for the same reason. A separate flag would work as well if you
prefer that.

Tested on x86_64 under KVM, on top of v7.4-rc1 (6628e7d4c6b2) with KASAN
enabled, using QEMU's vhost-user-fs-pci and the C virtiofsd from QEMU 6.2:

  1. In the guest, set fs.fuse.default_request_timeout=15 and mount
     virtiofs.
  2. On the host, stop virtiofsd with SIGSTOP.
  3. In the guest, cat a file on the mount.
  4. After 50 seconds, resume virtiofsd with SIGCONT.

Without this patch, the cat fails with ECONNABORTED after about 26
seconds. Once virtiofsd resumes, the guest reports:

  BUG: KASAN: slab-use-after-free in virtio_fs_requests_done_work+0x7be/0xbc0
  Read of size 8 at addr ffff888005176020 by task kworker/1:1/29
  Workqueue: events virtio_fs_requests_done_work
  ...
  Allocated by task 81:
   fuse_request_alloc+0x19/0x200
   fuse_get_req+0x153/0x2d0
   fuse_chan_send+0x4cf/0x840
   fuse_do_getattr+0x23a/0x4b0
  ...
  Freed by task 81:
   kmem_cache_free+0xbc/0x3e0
   fuse_chan_send+0x4af/0x840
   fuse_do_getattr+0x23a/0x4b0
  ...
  Oops: general protection fault, probably for non-canonical address 0xe012fc11a000000a
  RIP: 0010:virtio_fs_requests_done_work+0x25a/0xbc0

Setting fs.fuse.max_request_timeout=15 instead gives the same result.
With this patch, under either sysctl, the cat waits until virtiofsd
resumes and then returns the file contents, and the mount keeps working.

I could not test the FUSE_REQUEST_TIMEOUT part, because this virtiofsd
does not know about flags2.

The tests above were run with help from an AI agent.

 fs/fuse/inode.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 1341b681d0ed..f1aae9b5475c 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1451,7 +1451,14 @@ static void process_init_reply(struct fuse_args *args, int error)
 			fc->no_flock = 1;
 		}
 
-		fuse_init_server_timeout(fc->chan, timeout);
+		/*
+		 * A request timeout aborts the connection, which ends the
+		 * requests that are still in flight. A transport that cannot
+		 * take back requests it has handed to the device, such as
+		 * virtiofs, sets no_force_umount for the same reason.
+		 */
+		if (!fc->no_force_umount)
+			fuse_init_server_timeout(fc->chan, timeout);
 
 		fm->sb->s_bdi->ra_pages =
 				min(fm->sb->s_bdi->ra_pages, ra_pages);
@@ -1502,8 +1509,10 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 		FUSE_HANDLE_KILLPRIV_V2 | FUSE_SETXATTR_EXT | FUSE_INIT_EXT |
 		FUSE_SECURITY_CTX | FUSE_CREATE_SUPP_GROUP |
 		FUSE_HAS_EXPIRE_ONLY | FUSE_DIRECT_IO_ALLOW_MMAP |
-		FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_ALLOW_IDMAP |
-		FUSE_REQUEST_TIMEOUT;
+		FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_ALLOW_IDMAP;
+	/* See process_init_reply() */
+	if (!fm->fc->no_force_umount)
+		flags |= FUSE_REQUEST_TIMEOUT;
 #ifdef CONFIG_FUSE_VDAX
 	if (fm->fc->vdax)
 		flags |= FUSE_MAP_ALIGNMENT;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

