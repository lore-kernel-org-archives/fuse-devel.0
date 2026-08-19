Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63959432311
	for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 09:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131809; cv=pass; b=IprVvo3pYgOYs9sndNuC16S0KnSrWP14gc+/K72mJCUjPYxzhmSRpVJqK6zZDWD662aQb44+9xsFuPIeVVC+QFbIBcYx+JkrqO2m55iW/xQWE+HIDfw7X8PNUmSv+lrekqr10ecWT+swe7R9gPDWLQvPZ1v7Jma4uNeSmf4+tnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131809; c=relaxed/simple;
	bh=bcUMXJwuUktcvgwIKXAVppvHnpckok2yRi3o46yECE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVu/16Dn8EG4PPO6EQq2bRnwneXrVO9fLCA2H1xsa1jJtjkuaxU2XaCcVuG+4Ls59F2n2lgLcuueSKr23Epupkgj21se+ZSWJQllSaE/316b6iq1+XOnEMVdLghlTBNizPKD/nqZ7W6bv4f4DzQIHrpcrop915OrljlzpHw/Nb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=ezAg1EGI; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="ezAg1EGI"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e7632b193so55420085a.2
        for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 02:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787131803; cv=none;
        d=google.com; s=arc-20260327;
        b=UrjELEz2fW3DA16+fak6cqAb1LPoCacqzp1+zJpArzlEXntD+EIxGod8xetKxdd5mZ
         N3o3znLaekSuM58kKeQYBOG5vk6Wkj6hKOIPAWFvd7BGG7m8cZvveoTGWqYdSsdo2I8X
         8y4Pd0OuKAoOqPIgWm55G/bSEkLzbJ4ZR/P75ECtbsz4NNILN2QhoKxk8I2Hl4G/XuIL
         NMxvPV7IZZTadrNal6e67Spipt3dGuxH7IA5r22wzT8IC5dVCydThEOUpxkMj8R83PVP
         9P5pB/tNNiwvcXNPI8e7SaH0e5Lf/MsogkrM/kizEMJoI0MH1X0CcH3oYZphYgdOrofz
         7lQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1VHXApI477fbl4kLMpkCKvnquBrNIiEH86cTaeDa/W0=;
        fh=zj/7W2IjKXHv9hPw3lE/cRpfHzP7n9ILurFVJkZaHxI=;
        b=HteMp8xVgNREw5Lns7bbBngjpko0g5nR6e+D8RLO79Hv6vwFCIXRZnHK8rquCJAqTn
         2SX3gUDUriR4wnOhfppouYSvCbou8CWdyAFWc6lxL+wd8097rdpWqIbfpd/O8ljq6OE5
         o/qyvhjs8DLsrDXabCCrqSft4rtq+4ql5MjcRc4CDyy79Obz+RbE2A0uDyglATPgVfQX
         AsCIV/VZtasUU5J1wAV1TCbs8D87FRpOw1Ch40k4SBOS/9/wjVk9cBdRHl0qI1T1FzW3
         rBJiuDOenIgZzyg17705Jgf/1q8fq01f1/ZMlIeIMw4ItWedxSwwcMkYxerRr9yOSKBC
         mbmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787131803; x=1787736603; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1VHXApI477fbl4kLMpkCKvnquBrNIiEH86cTaeDa/W0=;
        b=ezAg1EGI1DtG9EWA35k0c2v6ZDOaliJ4dT6kOEtpKqBDtuSSgdfUoJbK94JM/76xdl
         yR3bfrfDQZoV0X4mHXLFxvimLMGIYFccixdDSG4j8K4Swo+HE2xgZrA+IqOxSMBYgjU7
         fKrkg/tfJ0SLiIDJDrQfU7YFy648bbLAuXe6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787131803; x=1787736603;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1VHXApI477fbl4kLMpkCKvnquBrNIiEH86cTaeDa/W0=;
        b=R8O+ELHp7XH384k9SGCCmvaYBVCrjRQXQLkZjSqVOmGAmVxjpGtyrkrN++Ryq5LgZH
         JUpvLJ6oKTWfUDqcbsiSG9uGtJoQw/0mXl5Dr/aVNvlxiyVGfl6PCmlflU2RoESiGmn8
         QbQdMyt9J7BQScVDaXK1h3Vy688wiqNTkMnPWWlwU1+Q3jni31+8pQzSTfHiLajQgOkX
         TmbEMF7v8GsQHiiTMczIBaYz6B0Y9PXrU+ykJ/QwOPWhDvxezR27XfKGietz8w6/HyMy
         fHhRPlRKskVfJ1NnCux5jAvGX0yOkzUSvWvBzlSefokFBT8nkp4b5MiOKM16oK+SMsDv
         lZpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsjEB7zXFgxjxAnU0LtcXKtuP5cUf37YzS389ZH2SloxJBjV545z9barwqhgQa1MrTQtL23mqoLdD7@lists.linux.dev
X-Gm-Message-State: AOJu0YxUaW8hityJg/24ZqV0Yxm9PidzXcBmoXP3vqeYkkJCfThL9x1r
	xlBe/nl/BHVCJsAlPX5h6lu+qmojGQ5qqS5cM6P9dZI2kydH+vSEk6rHR1jTQmUVoQRJUIIj9L4
	sT2PfZSFCQyb3NnNchuAUXnf8HUO1cOh3c2veMwhkrA==
X-Gm-Gg: AR+sD12DEllDN1YWzFxwCSB6NeA2nnpzsK/Bip5InKx1bAWekqa7MGxaEajCUYP2fxd
	BXbH+qDhCVHkM1AFbzDru/hKuG9+uMNg19oKabslu2tnm+hXIijjs/2GTHx9piZH2U8cXc2kJZh
	iXoFyHLOQmgM973mcf6JxiBEztEAfzc9vfqYYDMMtjEfKA3kKW49aLKY9mVGwNyEuyof+FcKwlR
	4wmKlzne4wdSgiTgsZ89WbnqfcGcMObsvSkV/uwGNjNslk6RbgXYdBJpterzeXkzSITOJwAQZir
	Q/sXt0hUO6es77RjwlGtHBTBKBljzsf5SLpk51iTZF6lWR4YwdEy7Jn/6OvY8Zy2FfmspRRP4+3
	h
X-Received: by 2002:a05:620a:271b:b0:914:bb06:288 with SMTP id
 af79cd13be357-9371e63648cmr329217985a.22.1787131802541; Wed, 19 Aug 2026
 02:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731203842.540798-1-jamz@amazon.com> <20260731203842.540798-2-jamz@amazon.com>
In-Reply-To: <20260731203842.540798-2-jamz@amazon.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 19 Aug 2026 11:29:50 +0200
X-Gm-Features: AcwNN1VAONJkLQZjWH9ox-1mbX0uX4NtpafQdS87YDhNU3mV00rqBfJE5c5YvNw
Message-ID: <CAJfpegseDzOV1jH5eE2LcbWJAuY2hQmdS1xwBmZCMXk4D3D+=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] fuse: zero the partial EOF page when extending a file
To: Jimmy Zuber <jamz@amazon.com>
Cc: Shuah Khan <shuah@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jan Kara <jack@suse.cz>, Joanne Koong <joannelkoong@gmail.com>
Content-Type: text/plain; charset="UTF-8"

[Cc: Jan + Joanne]

On Fri, 31 Jul 2026 at 22:39, Jimmy Zuber <jamz@amazon.com> wrote:
>
> Extending a fuse file past a non-page-aligned EOF does not zero the tail of
> the old last page.  If that page is cached and was dirtied beyond the old
> EOF -- e.g. an application mmap()ed the EOF page and stored into the region
> past EOF, which is undefined until the file grows -- the now in-bounds tail
> is exposed to subsequent reads as stale data instead of zeros, in violation
> of POSIX file-extension semantics.
>
> Other filesystems zero this via pagecache_isize_extended(), but that helper
> is a no-op for fuse: it returns early when i_blocksize() >= PAGE_SIZE, and
> a non-fuseblk fuse mount has s_blocksize == PAGE_SIZE (the server-supplied
> st_blksize only sets fi->cached_i_blkbits, not i_blkbits).  The NFS client
> hit the same problem and open-codes the zeroing in
> nfs_truncate_last_folio(); add the equivalent fuse_zero_partial_eof_folio()
> and call it from the three paths that extend a file: a buffered write, a
> size-extending setattr/truncate, and a size-extending fallocate
> (fuse_write_update_attr(), fuse_do_setattr() and fuse_file_fallocate()).
>
> writeback_cache connections are unaffected, as their writes go through
> iomap_file_buffered_write(), which zeroes post-EOF folios.  The bug is
> observable on a non-writeback_cache server that returns FOPEN_KEEP_CACHE on
> writable files (without FOPEN_DIRECT_IO), and is caught by the new
> write_extend_eof fuse selftest.
>
> Signed-off-by: Jimmy Zuber <jamz@amazon.com>
> ---
>  fs/fuse/dir.c    |  3 +++
>  fs/fuse/file.c   | 56 ++++++++++++++++++++++++++++++++++++++++++++++++
>  fs/fuse/fuse_i.h |  1 +
>  3 files changed, 60 insertions(+)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 795e92037ce7..f6614ccef186 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -2282,6 +2282,9 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>          */
>         if ((is_truncate || !is_wb) &&
>             S_ISREG(inode->i_mode) && oldsize != outarg.attr.size) {
> +               if (outarg.attr.size > oldsize)
> +                       fuse_zero_partial_eof_folio(inode, oldsize,
> +                                                   outarg.attr.size);
>                 truncate_pagecache(inode, outarg.attr.size);
>                 invalidate_inode_pages2(mapping);
>         }
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index cb8da4c06d17..a9063b4e9217 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -21,6 +21,8 @@
>  #include <linux/splice.h>
>  #include <linux/task_io_accounting_ops.h>
>  #include <linux/iomap.h>
> +#include <linux/highmem.h>
> +#include <linux/rmap.h>
>
>  static int fuse_send_open(struct fuse_mount *fm, u64 nodeid,
>                           unsigned int open_flags, int opcode,
> @@ -1200,20 +1202,64 @@ static ssize_t fuse_send_write(struct fuse_io_args *ia, loff_t pos,
>         return err ?: ia->write.out.size;
>  }
>
> +/*
> + * An operation extended i_size past a non-folio-aligned old EOF at @from,
> + * turning [@from, @to) into a hole that must read back as zero.  If the old
> + * last folio is cached and was dirtied beyond the old EOF (e.g. mmap stores
> + * into the post-EOF region, which are undefined until the file grows), zero
> + * that tail so it is not exposed as stale data (xfstests generic/363).
> + *
> + * pagecache_isize_extended() cannot be used: it bails out for
> + * i_blocksize() >= PAGE_SIZE, and a non-fuseblk mount has
> + * s_blocksize == PAGE_SIZE, so the zeroing has to be done here.
> + * Callers hold i_rwsem, serialising this against concurrent writes and
> + * truncates; it must not run under fi->lock, as it locks the folio.
> + */
> +void fuse_zero_partial_eof_folio(struct inode *inode, loff_t from, loff_t to)
> +{
> +       struct folio *folio;
> +       size_t offset, end;
> +
> +       if (from >= to)
> +               return;
> +
> +       folio = filemap_lock_folio(inode->i_mapping, from >> PAGE_SHIFT);
> +       if (IS_ERR(folio))
> +               return;
> +
> +       if (folio_mkclean(folio))
> +               folio_mark_dirty(folio);
> +
> +       if (folio_test_dirty(folio)) {
> +               offset = offset_in_folio(folio, from);
> +               end = min_t(loff_t, to - folio_pos(folio), folio_size(folio));
> +               folio_zero_segment(folio, offset, end);
> +       }
> +
> +       folio_unlock(folio);
> +       folio_put(folio);
> +}
> +

While the fix is probably correct, I'm not happy with it.

Why does pagecache_isize_extended() not handle blocksize >= PAGE_SIZE?

Where does straddling folio zeroing happen for other filesystems?

Is it done by the buffer head code?   Is it done by iomap?   What
about cases that use neither?

Thanks,
Miklos
