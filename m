Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796F83F485E
	for <fuse-devel@lists.linux.dev>; Wed,  1 Jul 2026 11:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906101; cv=pass; b=a1zehy7nT4+q7LqmQ8ARwtMnsP5MLRB2dZftK3mkTnvxqHaDsy7tLINbA9HY1lUFNXmKAgMxSPhb/lKThvWgdHLF2dsoUyBvQl3dBhf0/TJWDwQc/HikW7xJtwMuBEN5bBJug0g+B+OGJ5ph2167CsnaxV6z/pBse+H+86OA32U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906101; c=relaxed/simple;
	bh=pP/e2RTylRCmsYOsz1rh/nAw67V4c5VP8sRhx+7BZmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+UDBSTlYM+E1mVMRh9ogxkV6a+fsx/54Zl7a3QjL1mAnakpl3B0vzvkEYbShUzzQ2TokhMADd2dw9xhkXtuEmvWjNXL1AF/enGrLB32wtLS93kJ03EtUr+9tXgMhwx8XVC6GJ2p08TNKnwl0jqfushraQgABQi3vVG5ZDUgHRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hna5YTeu; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hna5YTeu"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c12788a75abso112084666b.2
        for <fuse-devel@lists.linux.dev>; Wed, 01 Jul 2026 04:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782906093; cv=none;
        d=google.com; s=arc-20260327;
        b=e85Zke53AmsFzXqz8DTqnErd+tznnNFWE5NtrKOME5ypvkNVlfvFkXsb9T17JaAJ55
         Dt0YyjFZu1xhpbLyPuuLvwiwYOj7afRNC8x2uXUe0M4X8VDnFZf4xqksGForBTmCsJ09
         uaH3u1VzUVeAICiTIVwI2mBS35L6mVD7S+c1LOAPmbdPgcVjXqbfGI3BMUikdt/eF+Dl
         3SQYXIOwp2HiDVWf4KRKKBWJMiN5P/oyjNpnMW4YTdSWeIUoz32f+gozpOavt4JleljV
         mAnyM+Of8vK/xk2aRNrVAwjVrd90Y7+F0C3yF0Ucg/up+gkherQ3oU51I0eubmSLB3SI
         wNSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j4SMUJ2LCNrAexVHw7ARji0H4KHrYS63S20yFRqwGC0=;
        fh=+WZEKLnORF1xrnNSa/21S6EwCy5Sb3SxtJxf1gsLJYg=;
        b=DjJ5pjCnTUvY20GlPD8pvvMlOzfQY4vIdf46zb42yv8XZaBbsKHOpSDBEQoYthzOA7
         RT29BUZL4hO00WZa1DPypcmhs+FlEB/z465WAcGX8UpvclCXsUFTrv9S50TvM5HfCScB
         MyGuG92dlZ7XF3xa7LbukjdMzyuBDH6UMDFPlUBVJGaVt4jEqObWxUILYHwa+LyRIMDv
         UdouV8ioYWCoBI3w/xpKhy8c6YjKvnqlbA1KTd/W/W3F+9Bi3yugfr3x+/eHCzL31Trw
         ZmtbIKxddqZfiwKTOIhWt3kfIHVVQGoVaPByhGbI9T6+So944h/Co0Oo9bPLKcnLzHxZ
         hrnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782906093; x=1783510893; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j4SMUJ2LCNrAexVHw7ARji0H4KHrYS63S20yFRqwGC0=;
        b=hna5YTeuc9u4JUTAcGMY4MgZBvjJJsyJMpzflb5ju6YcEeBFRBNdduawydbQxwSkLA
         eKsBbL7UuysYMDtvUWMiVnaTkfDiW8MuYxp6bkWJd95k51sf+MIWAm3Sh/v92c4nscdI
         hwr70EyWWk6LBpy62kS5Ok/lnx7PrUP3u74jTarjcybDyq+g4rGhJSozkx7ZaVqaeCE+
         w/4NT9Bp3aktSsG4Zh+CHw1+bramjdXsZoG6fSyPWN2FEO3Z0umiIrmurDOv0SIRcpNG
         FQ4yY/zLIbxZyxZsU7vKjMGGPOsBtMPcUg26v3KwKI4Kk8VvvG1dsIHoNCblDYlWhc9R
         bzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782906093; x=1783510893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4SMUJ2LCNrAexVHw7ARji0H4KHrYS63S20yFRqwGC0=;
        b=ruMj+DJrGbP6kGTyrmGb/vtIfY20swKT5pGE5zu3iAC8S6fxGfsv95UBNU9KtBDQ6l
         PV5oJdGCHQG8agM3oquWBipIv6RAwJNsLQWxyQ0K37jOxfRufcMnxLGMHwz93KV9DK+C
         gi0kkz0l38cx736OWzFqkq5v0SgJ0dTo6RixqOlwkLGo5XPp0R+rCY1mwvrFU8It7MRi
         6r4UocYLT5DBpMfNE6AbbYCljCUH3pOf3BMTKFs62STONsYwIeVmeI6YWqb6ptAlEDYa
         A1j5+rkTZvZgt8H+muYNiCedOLyFK7m8r5i6wyJCXCn/Nwb3cC3L50gQMe7+M+7WHwtF
         XTjg==
X-Forwarded-Encrypted: i=1; AHgh+Ro3Wd4WOCIMIYQAAwnspI9EecJJVm25ybWjHeZmW+Cn1pIol3nKhuGCuuFO1ODUjmUUyBRF5t/wDZbb@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo/4Ry2noBCJJrIlGjbG6Ob3nqb/c3HHc2+5EB6e9DXXZGyh3f
	Y2FRhXx+bofjrA4SCkXtiFUEkYBUkZbNrIKpYfVGRUGiwAndEC21mqnOg9aH/xLKBxzrD0GqDuB
	0VuHmnH8C2/eWvLc1mp/jOLg4BAne5+c=
X-Gm-Gg: AfdE7cmnTBL4AFwoqufNN8n9cZIvvnSEw9IGm7qTunnkRxw5GWlj7R/+OOLOuWmYS0i
	GgScJ2u2F486+4B4rHVkmbmT02IYAKoOVmnWjtZP5ZbbF/t94prYduXfTRM0C7W4mjvz2e8ljWQ
	51GuucgqeuW14Xr7d55cyOvG0++U33ma2sRN63Gc7PkYfgx9SpP9kDLfsEZanUggWfCJARkia0Y
	ukxzzV6RlA7Y1jNCl7gFS3++qaufErwzPkjcrXVjbjDq9YMJnasvIDAE9wGCmuicnKGWuiw5nnz
	YZbPZNc9kfL9fIexWbQcZ3YyKMBNSsQ=
X-Received: by 2002:a17:906:e299:b0:c12:9e8a:6b15 with SMTP id
 a640c23a62f3a-c12ae4f6514mr14535666b.35.1782906093308; Wed, 01 Jul 2026
 04:41:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701110052.5309-1-luis@igalia.com>
In-Reply-To: <20260701110052.5309-1-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 1 Jul 2026 13:41:22 +0200
X-Gm-Features: AVVi8Cc8f-j3pilZQUX_GIiyXGQmzm-yMXrUIiqTfVD6LwpoQTbwLjOQRjfSmt0
Message-ID: <CAOQ4uxh0Jsa-wqXsTnroJ7W+8hspHEn8ZUrpaxi5YEOZXhCXZQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: cache POSIX ACLs when setting them
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Matt Harvey <mharvey@jumptrading.com>, 
	kernel-dev@igalia.com, Seth Forshee <sforshee@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 1:05=E2=80=AFPM Luis Henriques <luis@igalia.com> wro=
te:
>
> When setting an ACL in an inode we can immediately add it to the cache.
> This is a small optimisation, as currently an ACL is only added to the
> cache when reading it again, which involves an extra GETXATTR hop into
> user-space.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  fs/fuse/acl.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/fuse/acl.c b/fs/fuse/acl.c
> index 31fb50e16aed..c2584bb75ec7 100644
> --- a/fs/fuse/acl.c
> +++ b/fs/fuse/acl.c
> @@ -155,6 +155,8 @@ int fuse_set_acl(struct mnt_idmap *idmap, struct dent=
ry *dentry,
>                  */
>                 forget_all_cached_acls(inode);
>                 fuse_invalidate_attr(inode);
> +               if (!ret)
> +                       set_cached_acl(inode, type, acl);

This is undoing what forget_all_cached_acls() explicitly tries to do.
I think the reason is that kernel code cannot assume the server did
not modify ACL before storing them, not sure, but NFS does the same thing
with nfs_zap_acl_cache().

Thanks,
Amir.
