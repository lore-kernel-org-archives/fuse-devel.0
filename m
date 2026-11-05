Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907165;
	b=KRgUSm6Iy625ZLpMqkXzSJ4apI48Tk7VVwm+vpZ3o6WyMDkkbfsnfPh6RyxLopnnjlUr
	 BQNDXnfUON5rHS81TIdEL8LSaCYilzyEEKdGBB28EjbxIJmtu82LyiBx/nW8No7nsOVbC
	 mtQhzW/v7Cln8vM6hRioalecDVT87M0OxtsSoQ3qyRzxokR6YVVFg+WfrYD9UPg6HPjgd
	 XLi6hB7+H90/hh8HFv9IpRvxWJZL2PqAscP5uZCr4OT1ZN4JeQDjSK4hKPRxGDKi+iqNS
	 LqemHIs4fF/RxfMFIZnApSr5DzgnCAEaaHSP3L27zZ7jeHSArh07IwZXZNTnoBIyTSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907165;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9JYvchWNYP7Qhse19z85hXzOJjhHmC8E+HAVLm+92M0=;
	b=bF1PjpyCDiPkItSKpcTv4Dc2XP1rX6DcaDCkMqXSD4og+CFEXd0K+XACyVWz4Pvsn24G
	 ozIa3KIyaSnlmWLU3tB9CkyackzFmzz62q3U3+6iEFMA6Iw4FIWIWHeZnxK3/Pxr2YiX5
	 zhacQZ43n9zJep0cBqmEBF8x+cl6kwFxJ0ZS4vucerpLfsIQ0IncdOZxALhiIejwwZFWO
	 xIalniH9S/0Jh9ldUZ9iAK+aEXipEQBVfWhn4IvMW3HGGWKRfcUg5jFjItSThpOC7ULit
	 9Dn2/S/1acA1NS1n4iZnA+5nt4fXIP8qdnS2cfd5L+9GKysHKzDYxpkUKcly/+PHzaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Fsh4bQYq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C47606A6C4;
	Thu,  5 Nov 2026 19:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Fsh4bQYq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47911F00895;
	Thu,  5 Nov 2026 19:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793907165;
	bh=9JYvchWNYP7Qhse19z85hXzOJjhHmC8E+HAVLm+92M0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Fsh4bQYqMWs7carasWGDuHRy4Vk/lJrPAI34OneO9HrTG2V1O8i5xUeFVX1yYbl+I
	 ZNyZyt/Ts+sjd3gO77ODfqyUhpNY6s+mf9lDYESl+MvTxE5P8sWgQuglBvGHq1fwHT
	 FLTCbyVVxaegRwIhVxhoszJ+XaI3i/Y2wOLcYpy0=
Date: Thu, 5 Nov 2026 11:32:44 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: syzbot <syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com>
Cc: baolin.wang@linux.alibaba.com, brauner@kernel.org,
 fuse-devel@lists.linux.dev, hughd@google.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, mszeredi@redhat.com, syzkaller-bugs@googlegroups.com,
 syzkaller@googlegroups.com
Subject: Re: [syzbot] [mm?] [fuse?] WARNING in shmem_initxattrs
Message-Id: <20261105113244.274cfd420b666687f37643ec@linux-foundation.org>
In-Reply-To: <6aecb307.a24d9935.80af2.0019.GAE@google.com>
References: <20261105082717.c459bb33778fcf27e5675082@linux-foundation.org>
	<6aecb307.a24d9935.80af2.0019.GAE@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 05 Nov 2026 08:47:03 -0800 syzbot <syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com> wrote:

> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> 
> Reported-by: syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com
> Tested-by: syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com
> 

Great, thanks.  My LLM-controlled live-kernel testing setup liked it
too.

Christian, I'll send this over soon:


From: Andrew Morton <akpm@linux-foundation.org>
Subject: shmem: consume the reserved xattr space despite remount
Date: Thu, 05 Nov 2026 08:08:06 -0800

Creating a tmpfs inode can trigger WARN_ON(ispace) in shmem_initxattrs()
when a concurrent remount sets nr_inodes=0.  With panic_on_warn enabled,
this warning can panic the machine.

shmem_initxattrs() reserves space for the security xattrs while inode
limits are enabled.  It later tests max_inodes again before consuming that
reservation for each installed xattr.  If remount disables the limit
between those steps, successfully installed xattrs leave a nonzero
reservation behind.

Use the remaining reservation, rather than the current mount policy, to
decide whether to subtract the installed xattr's space.  This also leaves
the failure path with only the unconsumed reservation to refund.

An initially unlimited filesystem cannot acquire an inode limit through
remount: shmem_reconfigure() rejects that transition.

Link: https://lore.kernel.org/20261105082717.c459bb33778fcf27e5675082@linux-foundation.org
Fixes: 076e5cef28e27 ("simple_xattr: change interface to pass struct simple_xattrs")
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Reported-by: <syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=4324f771847cecb27c54
Tested-by: syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com
Cc: Hugh Dickins <hughd@google.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>
---
Reproduced the warning before the fix and verified its absence
afterward in a Debian 13 guest with SELinux enabled (permissive).

A temporary hook paused file creation after reserving security-xattr
space. Another process completed a real nr_inodes=0 remount before
creation resumed. The unpatched kernel left 94 bytes unconsumed and
triggered WARN_ON(ispace); the patched kernel consumed the reservation
completely. File contents and the security xattr were verified.

Ordinary creation on limited and unlimited tmpfs mounts also passed
on both kernels. No additional KASAN or lockdep reports occurred.

Tested Linux 7.4.0-rc1 with GCC 13.3, KASAN and lockdep, using KVM:
8 GiB RAM, four vCPUs and one virtual NUMA node, backed by a
Threadripper PRO 3995WX. Both kernels had the same diagnostic hook;
the ordering was forced rather than left to random stress.

 mm/shmem.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/mm/shmem.c~shmem-consume-the-reserved-xattr-space-despite-remount
+++ a/mm/shmem.c
@@ -4451,7 +4451,7 @@ static int shmem_initxattrs(struct inode
 		if (simple_xattr_add(&sbinfo->xa_cache, &info->xattrs, new_xattr))
 			break;
 
-		if (sbinfo->max_inodes)
+		if (ispace)
 			ispace -= simple_xattr_space(new_xattr->name, new_xattr->size);
 		retain_and_null_ptr(new_xattr);
 	}
_

