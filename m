Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808AE3806C4
	for <fuse-devel@lists.linux.dev>; Thu,  8 Oct 2026 04:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791432880; cv=pass; b=ZLOtYCyppmqR201HyFQQrBqPRjnr7u9qR4wkTzSteLNVuLVNXUPZBmVq1xWQXd9vjn65WiaJMCMROJl06eqAVjYLaxgeZtzDiygh0AarWRN3ki1sOmjZrCizlk7PqCMIn+3/ii15pt2fVk8bCGHiOfxnVr4byzLgRkF8u5Ekyds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791432880; c=relaxed/simple;
	bh=D/PG0O7im4ffUb/epjeq+lDDmxyUxbAM6aLOuJ0HsLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuMN9Sg1dybEzhbxwLIPp4EYJ1FK/e1+hdn7Pi92GH9dwVY+Wh21U30Pka9vwK0Elz6QQmH3ms3VE/zTWeHMGwacuJyf250Uv8r6egygZP0TuB+zAvAukg8pRQeaMEPQDj8IDcbOC4Gvv2zAFAdcA/UuKkaKGxDGyhCKXILVvBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IEiKrJro; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IEiKrJro"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e36c3478aso708472766b.0
        for <fuse-devel@lists.linux.dev>; Wed, 07 Oct 2026 21:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791432878; cv=none;
        d=google.com; s=arc-20260327;
        b=eEePzeNKs6s5e9Eopwo+DHKtG+kji94Ik1m5mWkQmlTc7pzrCfq2OyEJnlW7LVGbwW
         9V6KRzbe8HP5b6JbTz+cIN+nYNgGAmPwMXqUu7A5Qu0U7Uq6jlO9ABZhTrE7zUAArm8X
         vP7WxAbElvMbBlK7bpUPNEOdTNCxtOw5f0mNI3IjLFJVgLbz314PpBGwMdiaSGS38Eaw
         NiWoiWPJCk2bTUUBrPISPShfDHXqJBQfqj7KORP0s8Ag7jJK0JEcvwiCiT7qdIbGQBSR
         jhp6zLnhE3m0t1Tgzuh89fWggHT6p2agWzPAbeWLmTJGCDUIo+BPkZAGMmBj0siq8iqC
         T3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D/PG0O7im4ffUb/epjeq+lDDmxyUxbAM6aLOuJ0HsLE=;
        fh=HNFz9MtAvubqxxu/iZFdHnGiFQ3WddbcWDmcFA8aRcM=;
        b=X8I8Xt/n+Iz9Itsb85o+J0bv321UmBZ51cyna1xuRwv+t+a3DF2XozkI8KMyAvxIRX
         OsZMt1fAfyBfECXmpMeInyz+munFF5d7CvhI5VX4jsMFEsOZCEFnNg3U+ZBIhc2thS3h
         85/5ymHZZ7f+aQtlxk3DhmPN4YL1i6+VqMwWH2BYjHSBJCVFU2vcPHzDgu3+mJZLsjA+
         VfNw9Fyo3YaivzMWzv9qii5/gagGsrlBkeTY3MiV7oUPxrxsywFPSJ/+uTJMQYmjHFiX
         +j5JaLlwTLCjvRMl/SBAf5UdL3H5Zz09Ij8IVmzFw/9TuZlxw0NVPW4A2v0zK/+i5xVi
         BKjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791432878; x=1792037678; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/PG0O7im4ffUb/epjeq+lDDmxyUxbAM6aLOuJ0HsLE=;
        b=IEiKrJroTEJcsihX9pIckgxyRHl3JX2vh5mB8Cbx1WoK7uFKd7jIgVHGUomaJEicN/
         58uqRnCl68IxVHAqe1C4faYsB1jCbYze9iht0x17vUcN7r2zlJpm0NIyNC1yku3hbD4U
         jC2sRaWkw0AV4fkArdF0UlEF9vaj2daJzX8hdX0+ml/sqMzfMU0H1uRl4xL7Q64JMQnG
         T23Clcb0OW6bMqSbfFyZeqM00+3V0gjsLGlYeYG8WAZsMi3pyln82Pbg+HaYgfTdDaRJ
         6XweMzKO6x4TqiwxBArhDObWNLomJvLJLU+aRnyXqjRtIUrm5Hra1/XMs4sQugwATHa0
         52dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791432878; x=1792037678;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D/PG0O7im4ffUb/epjeq+lDDmxyUxbAM6aLOuJ0HsLE=;
        b=ybEm6IoV1n6Ed0u895a/Mw+RuVHqRbNrbPmYyMFufTmBWBhFjiqWgl7CFskpwKsjww
         D+HlvWQls050fJXHvSim8Qz+C5cIwM2mURer+TVhDO+pi+VlX5j3bu6VzFbpjnlNo5k4
         i477un4GEuoDWjF4eKyBQKeyH9Re4njoc+Ruh7AqOFjkuQf8vqxgw3bMivHcWs7WJLqw
         yB5lezgQvp2MW1xhf7CVfUwxs6hIca5faFb4QCEhnuDcg0+KKRXJDRfiPdfp2oLRDlgd
         OAs8+lFlf+Dffbx/lW2aiNvC+SUUNqTPmytGbYDhDvRumdqcnvn3LRPv0mfYzOTRmkv7
         t/Sg==
X-Forwarded-Encrypted: i=1; AKwUvBy0ydWe4JCzmBPTMFVNskQJXMf2PObTUbFBYv83NQxyhD07LSwHcbbz/nRsI0lRgfXitISzoEVcUJKZ@lists.linux.dev
X-Gm-Message-State: AFq9FYK57tzyCZXGvHsINULrX8Eg4B4a11PgPtBCvGjn7s+B0N0uBAZM
	2BmYt8xqjHHVchcQZFwaRIPlyvPLbLA/leR2n4siP2N9ZfUskzTXJ7+4SJKVbGZsCbbGdcDDY1I
	hF8r2GbrAKWgbpm9QB/qQx0DBKe60bSUvAlkw/GyE
X-Gm-Gg: AYBFou3HV0rEkAOLUqPTjC/Bv5HucuTKxzIJKlr9brBnK2xXYVJB1+rDwXxzUNGJ6ho
	cpRTZzX7da7xiWCYq+xLAr+JjR+WaW8YDi5kfaIvY36cNr2d8krje5LxcbPA6KGiPau4T01PlUo
	rpDEze1vJXohROVD9n0o2WiD++hcAnPcBV/LqQjKXTBX7t4BL8pkWgvu79Vhb7ejyC0MvMYi/oR
	4Oj5j3nLmbv5N+Vv04jL/rMdrt+ovbwVtgMBZZI7cD3a6jVRf8aDus8XHHZ05XTMc2s85sbAyRy
	jdZHe0C9UX9vVnv0hc7QWdD+EIjLHZhqhDTvI4seCwvv5i/wLYTucia+P9Tv1cEQkM2WO+Kg2D5
	VaGbGZ0Pzguwj07wGVtefHLwnncr4RIbNkY1a
X-Received: by 2002:a17:907:2da9:b0:c2d:c8be:4e71 with SMTP id
 a640c23a62f3a-c317bdbd04dmr375584066b.19.1791432877158; Wed, 07 Oct 2026
 21:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909232351.1533034-1-shayba@google.com> <20260910184424.156341-1-shayba@google.com>
 <CABdmKX0B7zVfLY9Rov37U+gOTEXYSCMUe6=xFddOrKDVneiBGA@mail.gmail.com>
In-Reply-To: <CABdmKX0B7zVfLY9Rov37U+gOTEXYSCMUe6=xFddOrKDVneiBGA@mail.gmail.com>
From: Shai Barack <shayba@google.com>
Date: Wed, 7 Oct 2026 21:14:23 -0700
X-Gm-Features: AclHuK-Lj8Qjx6iM6hIILhXX7x1mxm-dHonA0g9RenLn6IaehjKV4XivMAFo11E
Message-ID: <CAK0PkCGgq=jP5h3uOGRaoKzwkXewbq5Lzmj=vTk58CeqM0h35g@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: Forward vfs_fadvise to backing_file in
 passthrough mode
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Amir Goldstein <amir73il@gmail.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Bernd Schubert <bschubert@ddn.com>, Sandeep Dhavale <dhavale@google.com>, 
	Akilesh Kailash <akailash@google.com>, Suren Baghdasaryan <surenb@google.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Miklos,

Gentle ping on this v2 patch when you have a chance. It has
Reviewed-by tags from Amir and T.J.

Cheers!


On Thu, Sep 24, 2026 at 5:01 AM T.J. Mercier <tjmercier@google.com> wrote:
>
> On Thu, Sep 10, 2026 at 11:45 AM Shai Barack <shayba@google.com> wrote:
> >
> > When an application invokes posix_fadvise(..., POSIX_FADV_DONTNEED) or
> > other fadvise advice on a FUSE passthrough file descriptor, the VFS
> > currently only executes generic_fadvise() on the upper FUSE inode
> > mapping.
> >
> > Because FUSE passthrough does not forward fadvise operations to the
> > underlying backing file, pages residing in the lower filesystem's
> > pagecache remain resident in memory.
> >
> > During media-heavy workloads (such as image thumbnail generation or
> > streaming), single-access file data accumulates in the inactive pagecache
> > of the lower filesystem. Under memory pressure, the kernel retains these
> > stale media pages and instead evicts active executable pages from
> > running processes, leading to severe direct reclaim latency spikes.
> >
> > Architecturally, Linux VFS supports filesystem-specific fadvise
> > delegation via the .fadvise hook in struct file_operations. Implement
> > fuse_file_fadvise() in fs/fuse/file.c and register it in
> > fuse_file_operations. When passthrough is active on a fuse_file,
> > fuse_file_fadvise() forwards the vfs_fadvise() call to the lower
> > backing_file under the opened credentials, allowing POSIX_FADV_DONTNEED
> > to cleanly invalidate the physical backing filesystem pagecache.
> >
> > Signed-off-by: Shai Barack <shayba@google.com>
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
