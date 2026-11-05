Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896039;
	b=106RPw/vBfLqrXIyUC0ScP/lTrE0NyaYtZ/5JLsn2fVHJ6Ial7vJz8w2dhUioG++g2mk
	 0181dlkLMSH2ATkquE40xNl5jTQZGNn75gYe+vO0LUR7dbHkq2e+gkzPlGkoZhxm7kf+F
	 ya3dJ7YhXj7YbwR/PLZyQBkpocEydZssJSzhS7YWVxgrH7JFzIkaa3H6QDfrR6bBfn+jU
	 SoPLVktNjRctxUx265bf2TdhMszVUmVYFOv7ZGs9Q9zH8QNEtlRBGwWb4I1CCT5BDMU6/
	 IA8rzwKZ+E9BCjGGdVqja1u3fvKrv+DHELN0O9eKAJZx7r/KfQUzRdJ/k6vJ7jMxmJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896039;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yNEceuVF4+1dEHMso5FiTKoIIlIwJZWRYcUiC/JkgOo=;
	b=cebh/x6nzjVojibMeW3rzGR/lerXj49rdy5v4rEFxBSAZPuM0DE7KXXB4asEhJmJXHKM
	 krowNWQZJqvXSbRoSuu7J+nksSiSIqFvTqSsXtRqIv47uYeUgTRM40ZS7bMQV/6rT9oHA
	 ZtRauPi39eNEGj4ajtPhn/FygCfVKgECK1ywPJKRkS8Rfx3C4/16yho7TjlP40k0fHGtI
	 /xQ0u6YGWgnVuMPyp9z5DCZOuWeJBEh4t8qhCFTzL4JHdoVq9TJ2ZBwTEJhwd2SPq8wfU
	 ykF2aRwLKdnQ1rS79yI/F+41B1X1AC9+RHU0d+MNpQhy31psPLnIwo+ePfeiYipZPUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=bCWtbtkE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929FB606A339;
	Thu,  5 Nov 2026 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=bCWtbtkE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0156D1F000C1;
	Thu,  5 Nov 2026 16:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793896038;
	bh=yNEceuVF4+1dEHMso5FiTKoIIlIwJZWRYcUiC/JkgOo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bCWtbtkEDpyTUbwzvxe6MGZwVSKfAqoj503Jn568t34yc39Fe9sgjWVscGfykg1r0
	 j1PwfEeAdKwqlS5XJPr/3Z8clpnlSYMJz97Zk4kZGpJ2xqQINseX9gnXJTMqQfLg2J
	 MK+hifwQuNYe+Rc/y0DKuB01mvfolNPPjiLxAmr4=
Date: Thu, 5 Nov 2026 08:27:17 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: syzbot <syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com>
Cc: baolin.wang@linux.alibaba.com, fuse-devel@lists.linux.dev,
 hughd@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 syzkaller-bugs@googlegroups.com, syzkaller@googlegroups.com, Miklos Szeredi
 <mszeredi@redhat.com>, Christian Brauner <brauner@kernel.org>
Subject: Re: [syzbot] [mm?] [fuse?] WARNING in shmem_initxattrs
Message-Id: <20261105082717.c459bb33778fcf27e5675082@linux-foundation.org>
In-Reply-To: <6aec6433.0ce67c00.35143.0001.GAE@google.com>
References: <6aec6433.0ce67c00.35143.0001.GAE@google.com>
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

On Thu, 05 Nov 2026 03:10:43 -0800 syzbot <syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com> wrote:

> syzbot found the following issue on:
> 
> HEAD commit:    05441d697f7f Merge tag 'cocci-7.4-rc1' of git://git.kernel..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17bcaca1580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
> dashboard link: https://syzkaller.appspot.com/bug?extid=4324f771847cecb27c54
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14423cbe580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-05441d69.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/0edd3964be19/vmlinux-05441d69.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/84d6d8dd5648/bzImage-05441d69.xz
> 
> AI-generated root cause summary:
> In mm/shmem.c:shmem_initxattrs(), the initial reservation of inode xattr space
> (ispace) from sbinfo->free_ispace is gated by 'if (sbinfo->max_inodes)', and
> subsequent per-xattr subtraction from ispace is also gated by 'if
> (sbinfo->max_inodes)'. Because sbinfo->max_inodes is accessed locklessly and can
> be concurrently modified to 0 during a remount (shmem_reconfigure() with
> nr_inodes=0), ispace can be reserved when max_inodes is non-zero, but fail to be
> decremented when max_inodes becomes 0. Consequently, after all security xattrs
> are successfully allocated and added, ispace remains non-zero, tripping the
> WARN_ON(ispace) assertion.
> 
> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=4324f771847cecb27c54

Well that's convenient, thanks!  Two additional suggestions:


- The Subject "[mm?] [fuse?]" can be tightened.  I told my thing

      figure out a Subject for this bug report - identify
      the kernel subsystem which is primarily affected

  and it responded

      Subject: [BUG] shmem: xattr accounting warning when remount disables inode limits


- Use your LLM to figure out who to cc on the report:

      figure out who should be cc'ed on this.  Use the
      MAINTAINERS entries for the affected files.  Also use git to
      figure out who has recently worked on the affected code.  Prefer
      to choose developers who have recently shown significant
      involvement in kernel work.

   and it replied

      Cc: Hugh Dickins <hughd@google.com>
      Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
      Cc: Miklos Szeredi <mszeredi@redhat.com>
      Cc: Christian Brauner <brauner@kernel.org>
      Cc: linux-mm@kvack.org
      Cc: linux-fsdevel@vger.kernel.org
      Cc: linux-kernel@vger.kernel.org
      Cc: syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com

      Hugh and Baolin: the maintainer and reviewer listed under
      TMPFS (SHMEM FILESYSTEM), which explicitly covers mm/shmem.c. 
      Baolin also has recent shmem fixes and substantial review
      activity.  

      Miklos: the most directly relevant developer.  Git
      identifies him as author of 076e5cef28e27, "simple_xattr: change
      interface to pass struct simple_xattrs", from June 2026.

      Christian: committed that change and authored the preceding
      rhashtable-based shmem xattr conversion.  His involvement is
      directly in this code, rather than merely elsewhere in
      mm/shmem.c.  


and, of course "fix the dang bug",  I'll test this later.


#syz test

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

Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Reported-by: <syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=4324f771847cecb27c54
---
Test candidate against 05441d697f7f9a927264f4058cbbc6a03dfcac9d.
Application checked; no kernel build or runtime reproduction performed.
Fixes attribution and stable-backport scope have not yet been verified.

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

